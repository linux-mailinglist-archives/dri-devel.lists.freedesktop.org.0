Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F44AEA908
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jun 2025 23:49:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB5EB10E917;
	Thu, 26 Jun 2025 21:49:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LLXKBodl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E64810E913;
 Thu, 26 Jun 2025 21:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750974588; x=1782510588;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=teo0N8CJa0eHC8TlBeAsUotiq3V0yvfLqN+M6eowsXE=;
 b=LLXKBodleHGOhxUzzQvagZFegjvN+HunonYzydRbdlE4D2GOeYkxps2y
 hyM6mw0aNTBILN6Yy8vDC9Nrbkg3SZa22LELpW0+1VPWOVmqym5cNY6jI
 GvjU6j5a5dCBtRLJ7t571xaH63pu2DNLqlWujkIfTFgbznEFuY38PrVtz
 HOGaYuC7e9qU2NLJhbOk51P/meu0t8I2kutt436uJ3KiVDnuZK8CADNdj
 XxMNisymw5aI84HgbJBQkuN7OEHedtcFgzhoU6sNI4XquPY5NFdGUtg7n
 LCxB29xu23t71UYuMBg6yWPhINvYhkzop4DSIlILKVDKd/zFQt89ltLr3 g==;
X-CSE-ConnectionGUID: QiaWZkUMSXeqGv+EinEmfg==
X-CSE-MsgGUID: OILPDyiSSeu4nBk1Had7Ow==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="70856362"
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; d="scan'208";a="70856362"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 14:49:47 -0700
X-CSE-ConnectionGUID: dm/BXvTjSLCJL9i292FvzQ==
X-CSE-MsgGUID: GxEyhfLbT6Ku4Tn9M0DH4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; d="scan'208";a="153151972"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 14:49:47 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 26 Jun 2025 14:49:46 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 26 Jun 2025 14:49:46 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (40.107.95.73) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 26 Jun 2025 14:49:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XJlW0YbA6tdDVoUpiPzkeNmOKGn2PjQ0FyCwY53it2l4taHWVBFJBNlop/8njCvA+UEW7sSVbXZtpDZsWHDZvrH1ugnSArmBCnX6IocxUNhafvlPrFMG3b8r2bDc1//uEVfCxKNaQj0twLtBlKkTpiIYWtix6YyxVq3uraZ/KWGA2NPl8gUCtdp6RHrEwhpRDz7a5pnsA1pTns3a7dKbwD4N4+wi4Fireldz9zxclJ+fuAa6rp/oFK39IjPsVSD6UdvzJuiBfwRmrh328j6/34cfPuPK7E6XN84StevDGWBDnDVJMR2HnAANdMnWJRHdX75Df05Vr0At4ZUBWJJx6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G90UZZ46J200bElCmfixkcjNBCaQVw1U12U/SEii5PY=;
 b=QpHpOAAjSbof0EhdzNRc0SrctftbbPaF0M9TKgf9BjuH2TOPTuyfFhluz3mHVrw4DABH5t4TXojKOCPOILxbHhnOhGHXA3MV67Kr1d/c1rmdpizEn488bgoNdN/uzLOgfBcjKqmz/DmzW9Hw/07UzoeHudNk1K2puCTthCVxU3eaVzsTHftMWi7EABHkjk+bQyZmzlO3fjJdUeNnoUbnkWr5Ucp+p7KVHOc7BZbp067RhnKcr4wuCIowD99Rh0RtHmm6NatzgM8GuXYXnyjnj7vcA2JeTk2sA1cqAKBNn/vtsp2ciC9aozkC3Su8AhK/LVn6NDyzqftogA24jRVxRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by DS7PR11MB6079.namprd11.prod.outlook.com (2603:10b6:8:85::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.23; Thu, 26 Jun
 2025 21:49:42 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.8880.015; Thu, 26 Jun 2025
 21:49:42 +0000
Date: Thu, 26 Jun 2025 17:49:37 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
CC: Badal Nilawar <badal.nilawar@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <anshuman.gupta@intel.com>, <alexander.usyskin@intel.com>,
 <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v4 05/10] drm/xe/xe_late_bind_fw: Load late binding
 firmware
Message-ID: <aF3Accq8A4zm9Dii@intel.com>
References: <20250625170015.33912-1-badal.nilawar@intel.com>
 <20250625170015.33912-6-badal.nilawar@intel.com>
 <aF2CQ_VAT6PSh9Lk@intel.com>
 <e392779f-a205-4085-8663-4cfbbab4bd82@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <e392779f-a205-4085-8663-4cfbbab4bd82@intel.com>
X-ClientProxiedBy: BY3PR04CA0020.namprd04.prod.outlook.com
 (2603:10b6:a03:217::25) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|DS7PR11MB6079:EE_
X-MS-Office365-Filtering-Correlation-Id: 37861bac-9d1e-4200-eba3-08ddb4fb5b6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0R+JyfbdhowCQjB1PYYtGQLCcFGDtuYhOdFfujHEo6ib+GF3oTn1vlI6w/BX?=
 =?us-ascii?Q?PtgZG95n0SYErNg2bnijhwgMb8nGtMmAqHT7kjFuP7pm405JwrgY7X2kOgVq?=
 =?us-ascii?Q?37a/zjcRykJF0k1et0lRvHx9pXf+A2KVO9Ff2KXht9OEzwvCEwo6Lx9E3cgK?=
 =?us-ascii?Q?tA0fb3rL5EyOUQB05p6SdAQAu9DCVIjJZeJoD+OOF/faFQ6bJcLJ4sFsjUQj?=
 =?us-ascii?Q?Ya0oLF6c9IEB0X6ylkiiaJVswNDoGuNk58kWBFbH9UqaMT5cfKrJA03acR1V?=
 =?us-ascii?Q?JbHbpTLf2cFWxrapyfdHhyVr7h4bl1nxLBcpy7k6QRaVPA0VcRsW7uYirR/w?=
 =?us-ascii?Q?HLF9ZjSydT4hqcMc/eSpu+5HnigQSbpUe8CKFIqHcXACM3B7Q2dGuog4Hui4?=
 =?us-ascii?Q?94IQfmScbre0WO1adP9GsF/VXE9CnetXtlB8tBoMKphPm5j19k4n7Uls+IKz?=
 =?us-ascii?Q?poppYD8m2yYGzDmSwpXAqn8eXN/wzYCK8TMoxghVSNAzZJI8hZdl/OS8bIiL?=
 =?us-ascii?Q?7srpQdQMu36qMo6MW89bgAZxmk+lecWB7nX5jIcpdN84Jr1vkRWazJ5tjfL3?=
 =?us-ascii?Q?xTn/E5xC2yWXf6Pa37NT3QHP2WIQxgOCRiTqHdZgK9pplNg3HnJNjrftP5Bs?=
 =?us-ascii?Q?3vxEU0YqRwz70E/0FQlnhuaHW0hRqOWlN4iovwIXtsaKJDJsJ1qV7O4tXeO7?=
 =?us-ascii?Q?R1hH/GOnCA1cVeG6WVSK+q8Pnhyb/rd4irWX02FoxSWtfc3HN2P/IpdxvTel?=
 =?us-ascii?Q?MFcDQcZfnqletXK+Fk8EFoVnD/T1kaiiirwl4cY1kklq23vqHLhlWDN644EK?=
 =?us-ascii?Q?CkNPKg0PCxp8CA42nBJ5iX5C4XsHT0dcqgtXYMRktWr1IQhWUcuGKvqP1sqi?=
 =?us-ascii?Q?7OLaLIMhRyJO66lZq7+MIrDRdEEePzA4In27zcnwFocVfL/jMSXXEvfY+YEw?=
 =?us-ascii?Q?/NX87d6dzAI+1xCcrHsouPCN0j4A4gFNfV3NrTEuKPWUee6DDD2F2FSWc2Fc?=
 =?us-ascii?Q?lk4Ur4NH0EAw/2IskYqr1H9yPgN+z4QuRrJpHLwCprddvGtDga1zImV4GWQ3?=
 =?us-ascii?Q?gIBq1XSiwqF+/lbganV/HM5j/9Z4HQXQNBO2A+EYga3ieONYhmNGZw4xUk7Y?=
 =?us-ascii?Q?FUTVNpXB2MoGIgXvk0ZNxrtpll3wOF4elVU+5n3HUaJw3VDi7g+p7mkFr7gt?=
 =?us-ascii?Q?pLGDug5CZI0Z5TzNoCAgrqkSMfGOnJx0tdctzHgj3SOcmxuSeEGk8AZyTj1O?=
 =?us-ascii?Q?d65EiYhuH0HXF98fJ9RUfeiYBFEo/PgI2bEMqdu0m8dtYhcKejtzRnkW47e5?=
 =?us-ascii?Q?uDYHH2dejrZP+KBTku39/P7D4rUfQ9hqso8U36f3yWbhmt22ZG1DirC9FyE5?=
 =?us-ascii?Q?stKI4aU79ez2MOeaeWd+AUbVAv6MdA6daUhszIFPjPlwnbu2oBxsGobnHGtm?=
 =?us-ascii?Q?v4EISZCZbtw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lO/LcpQzOYtI0VDGTJFjJDVsXYPfQ6N0Zkk0FMH3IgTMisUJQMRpSczeqz9F?=
 =?us-ascii?Q?hmXoK9jHkad2UrTm1s6QNgqSDanqtj9/p+JYxJ3hLsETMOTgd6DJBkymlP1v?=
 =?us-ascii?Q?3xk4kCGIEjQqihI5jKXEaPdc7bagMzRnWFxIxelsz9HjUP3fSmz2g+V5t+zD?=
 =?us-ascii?Q?I/ahQQSbTkhjZpjom1M5Kzf2/hHW8nYX+Ih38uXh7PwscT0WejkcS81FlxQG?=
 =?us-ascii?Q?1nPC1RMxAPPwHy4mar0iBITe786mldBpn/U03QpHMCWwzXPLBEV0y1Gciyrh?=
 =?us-ascii?Q?8xaOX4JmX799AU5S84gWA9BdLBpzmmYWHmmSrpq4WG71QgJ3v7w9s525Cr8D?=
 =?us-ascii?Q?iNyCs6TVSx7OPJ5e/8mNZywqpYi5rgSIeM1EXQz321OURgi1so5/ADAUcbc4?=
 =?us-ascii?Q?zKaFqO49OiHYat4ZpNTvXBJsqVdF6X1t12SlERUJmvV79UTQOyherKUfjBgE?=
 =?us-ascii?Q?C11L2D+/l+JsbAnQ/1uW4jq2/aGV1iBdr+fKh6B62vxsbt7i8ywD1YQGnnQR?=
 =?us-ascii?Q?YYlwfWRFg4kBpBWUvc7seNlPVS9Hxrpi+HsYXIsgMc7eP9PJkTq8OYo8VIMz?=
 =?us-ascii?Q?K1hw5nbzs2IS3QYU5z2LW67na63GZPKFE3RLWMZ+Z9xkEZGH+I3iJWDKuv1z?=
 =?us-ascii?Q?2YKrOQ9U+LVGksI4DcMjxTDOih4Nab067LkK7RjDcYV3H35Qij4MZPjyc1vD?=
 =?us-ascii?Q?H60eKiq8PW9yl+j00bflRvjLwVqvg0PR3d2btRnvlYavYN01N6xgQ/3bBVaZ?=
 =?us-ascii?Q?PPfiAM9y3sUmhkU+J7UzovIVcJl9VKPQtHZWHNbA3ulq18ezUtMpbj0SkVF9?=
 =?us-ascii?Q?mPn3FL9n+EY8d6ZgXICaTXnMSfaMHmQlx9qWiOUJR6jU3QUjrPKuK5pARWvo?=
 =?us-ascii?Q?tiM6spoHTsRCOV9KeC4lra3jNN5ZW2TXYRK6mHeLw2fN82dVJmV8pgTci+7m?=
 =?us-ascii?Q?9X9My/ffXife38NO6WpsTHtOQlZY5pmpp3Fh/rrMutp4mq1/4yYWN8rFJALT?=
 =?us-ascii?Q?z1j47wJQFM9VRYsrmpxOSBOvlvxImSXS9+dlQ0yteNlO3H1+g0Vicstnlx/c?=
 =?us-ascii?Q?e2U8BVLmzf/nybPxkeJz8cxWcGbEcx9PIEzTtJuYfVRqnf9ZoTxIalSCpRXa?=
 =?us-ascii?Q?aoCD97mR03/hmOiaKrIsW77xuQSuL+c38PlnEpRAjXmam9NSCpHFzGg0wBCE?=
 =?us-ascii?Q?/ZueJvdOxGKVhdd+qAcm9KoWRCu18nH3wYUJ6g6AnmdWI3W7RttrKXBRmzR7?=
 =?us-ascii?Q?mubvjumsuPrrVGDd8Bqp9JoxUxL3LyKAQGrIdom3PyiK0Pz498ts2lAGnlGc?=
 =?us-ascii?Q?48uWXk2U8dx1SqOVjgfWQK6GnL52m44WztA142DgbuBMdj3UV1EkwqkrnLsM?=
 =?us-ascii?Q?+Gu97y4tqLwR9fV225FB2HOVr0weSW8/8XYbwoY0eY5rlCv53O61G6Zorle0?=
 =?us-ascii?Q?sVOhj5IH30J+ZAOZ0ZrqWst7mqi1frHtfBkaKQrD4z83Hm2S2unEiyPJX0Ts?=
 =?us-ascii?Q?LAFosE560ZHQOHbhpotPyFIAytZro1+tKd/w1ZTKa3AbhEO6RlusJo1gZ2qb?=
 =?us-ascii?Q?pEnLb0AWPEkSaS+l3lPvmSzKTKLEnFDJsS2t2Wnc?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 37861bac-9d1e-4200-eba3-08ddb4fb5b6b
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 21:49:42.2560 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U1hM8mDY+sfldRShMxK+rMc4TiJrwpG6U2rkVO62sXuaWynyaexACWYX+wisobbmYimszNxpde8/SlK8dTl8zw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6079
X-OriginatorOrg: intel.com
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 26, 2025 at 02:27:50PM -0700, Daniele Ceraolo Spurio wrote:
> 
> 
> On 6/26/2025 10:24 AM, Rodrigo Vivi wrote:
> > On Wed, Jun 25, 2025 at 10:30:10PM +0530, Badal Nilawar wrote:
> > > Load late binding firmware
> > > 
> > > v2:
> > >   - s/EAGAIN/EBUSY/
> > >   - Flush worker in suspend and driver unload (Daniele)
> > > v3:
> > >   - Use retry interval of 6s, in steps of 200ms, to allow
> > >     other OS components release MEI CL handle (Sasha)
> > > v4:
> > >   - return -ENODEV if component not added (Daniele)
> > >   - parse and print status returned by csc
> > >   - Use xe_pm_get_if_in_active (Daniele)
> > The worker is considered outer bound and it is safe
> > to use xe_pm_runtime_get which takes the reference
> > and resume synchronously.
> > 
> > Otherwise, if using get_if_active you need to reschedule
> > the work or you lose your job.
> 
> The issue is that the next patch adds code to re-queue the work from the rpm
> resume path, so if we do a sync resume here the worker will re-queue itself
> immediately when not needed.

ops, I had forgotten about that case, I'm sorry.

> Also, when the re-queued work runs it might end
> up doing another sync resume and re-queuing itself once more. 

I believe it might be worse than that and even hang. This is the right
case for the if_active indeed. But we need to ensure that we will
always have an outer bound for that.

> However, in
> the next patch we do also have a flush of the work in the rpm_suspend path,
> so maybe the worker running when we are rpm suspended is not actually a
> possible case?

that's the kaboom case!

> Also, thinking about this more, that re-queuing on rpm resume only happens
> if d3cold is allowed, so when d3cold is not allowed we do want to proceed
> here we can actually reach here when rpm suspended.

no, when d3cold is not allowed we don't want to re-flash the fw.
We just skip and move forward.

My bad, sorry for the noise and please keep the if_active variant in here.

> 
> > 
> > > Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/xe_late_bind_fw.c       | 149 ++++++++++++++++++++-
> > >   drivers/gpu/drm/xe/xe_late_bind_fw.h       |   1 +
> > >   drivers/gpu/drm/xe/xe_late_bind_fw_types.h |   7 +
> > >   3 files changed, 156 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c b/drivers/gpu/drm/xe/xe_late_bind_fw.c
> > > index 32d1436e7191..52243063d98a 100644
> > > --- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
> > > +++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
> > > @@ -16,6 +16,20 @@
> > >   #include "xe_late_bind_fw.h"
> > >   #include "xe_pcode.h"
> > >   #include "xe_pcode_api.h"
> > > +#include "xe_pm.h"
> > > +
> > > +/*
> > > + * The component should load quite quickly in most cases, but it could take
> > > + * a bit. Using a very big timeout just to cover the worst case scenario
> > > + */
> > > +#define LB_INIT_TIMEOUT_MS 20000
> > > +
> > > +/*
> > > + * Retry interval set to 6 seconds, in steps of 200 ms, to allow time for
> > > + * other OS components to release the MEI CL handle
> > > + */
> > > +#define LB_FW_LOAD_RETRY_MAXCOUNT 30
> > > +#define LB_FW_LOAD_RETRY_PAUSE_MS 200
> > >   static const u32 fw_id_to_type[] = {
> > >   		[XE_LB_FW_FAN_CONTROL] = CSC_LATE_BINDING_TYPE_FAN_CONTROL,
> > > @@ -31,6 +45,30 @@ late_bind_to_xe(struct xe_late_bind *late_bind)
> > >   	return container_of(late_bind, struct xe_device, late_bind);
> > >   }
> > > +static const char *xe_late_bind_parse_status(uint32_t status)
> > > +{
> > > +	switch (status) {
> > > +	case CSC_LATE_BINDING_STATUS_SUCCESS:
> > > +		return "success";
> > > +	case CSC_LATE_BINDING_STATUS_4ID_MISMATCH:
> > > +		return "4Id Mismatch";
> > > +	case CSC_LATE_BINDING_STATUS_ARB_FAILURE:
> > > +		return "ARB Failure";
> > > +	case CSC_LATE_BINDING_STATUS_GENERAL_ERROR:
> > > +		return "General Error";
> > > +	case CSC_LATE_BINDING_STATUS_INVALID_PARAMS:
> > > +		return "Invalid Params";
> > > +	case CSC_LATE_BINDING_STATUS_INVALID_SIGNATURE:
> > > +		return "Invalid Signature";
> > > +	case CSC_LATE_BINDING_STATUS_INVALID_PAYLOAD:
> > > +		return "Invalid Payload";
> > > +	case CSC_LATE_BINDING_STATUS_TIMEOUT:
> > > +		return "Timeout";
> > > +	default:
> > > +		return "Unknown error";
> > > +	}
> > > +}
> > > +
> > >   static int xe_late_bind_fw_num_fans(struct xe_late_bind *late_bind)
> > >   {
> > >   	struct xe_device *xe = late_bind_to_xe(late_bind);
> > > @@ -44,6 +82,93 @@ static int xe_late_bind_fw_num_fans(struct xe_late_bind *late_bind)
> > >   		return 0;
> > >   }
> > > +static void xe_late_bind_wait_for_worker_completion(struct xe_late_bind *late_bind)
> > > +{
> > > +	struct xe_device *xe = late_bind_to_xe(late_bind);
> > > +	struct xe_late_bind_fw *lbfw;
> > > +	int fw_id;
> > > +
> > > +	for (fw_id = 0; fw_id < XE_LB_FW_MAX_ID; fw_id++) {
> > > +		lbfw = &late_bind->late_bind_fw[fw_id];
> > > +		if (lbfw->valid && late_bind->wq) {
> > > +			drm_dbg(&xe->drm, "Flush work: load %s firmware\n",
> > > +				fw_id_to_name[lbfw->id]);
> > > +			flush_work(&lbfw->work);
> > > +		}
> > > +	}
> > > +}
> > > +
> > > +static void xe_late_bind_work(struct work_struct *work)
> > > +{
> > > +	struct xe_late_bind_fw *lbfw = container_of(work, struct xe_late_bind_fw, work);
> > > +	struct xe_late_bind *late_bind = container_of(lbfw, struct xe_late_bind,
> > > +						      late_bind_fw[lbfw->id]);
> > > +	struct xe_device *xe = late_bind_to_xe(late_bind);
> > > +	int retry = LB_FW_LOAD_RETRY_MAXCOUNT;
> > > +	int ret;
> > > +	int slept;
> > > +
> > > +	/* we can queue this before the component is bound */
> > > +	for (slept = 0; slept < LB_INIT_TIMEOUT_MS; slept += 100) {
> > > +		if (late_bind->component.ops)
> > > +			break;
> > > +		msleep(100);
> > > +	}
> > > +
> > > +	if (!xe_pm_runtime_get_if_active(xe))
> > > +		return;
> > > +
> > > +	mutex_lock(&late_bind->mutex);
> > > +
> > > +	if (!late_bind->component.ops) {
> > > +		drm_err(&xe->drm, "Late bind component not bound\n");
> > > +		goto out;
> > > +	}
> > > +
> > > +	drm_dbg(&xe->drm, "Load %s firmware\n", fw_id_to_name[lbfw->id]);
> > > +
> > > +	do {
> > > +		ret = late_bind->component.ops->push_config(late_bind->component.mei_dev,
> > > +							    lbfw->type, lbfw->flags,
> > > +							    lbfw->payload, lbfw->payload_size);
> > > +		if (!ret)
> > > +			break;
> > > +		msleep(LB_FW_LOAD_RETRY_PAUSE_MS);
> > > +	} while (--retry && ret == -EBUSY);
> > > +
> > > +	if (!ret) {
> > > +		drm_dbg(&xe->drm, "Load %s firmware successful\n",
> > > +			fw_id_to_name[lbfw->id]);
> > > +		goto out;
> > > +	}
> > > +
> > > +	if (ret > 0)
> 
> nit: here you can just do "else if" and drop the goto.
> 
> Daniele
> 
> > > +		drm_err(&xe->drm, "Load %s firmware failed with err %d, %s\n",
> > > +			fw_id_to_name[lbfw->id], ret, xe_late_bind_parse_status(ret));
> > > +	else
> > > +		drm_err(&xe->drm, "Load %s firmware failed with err %d",
> > > +			fw_id_to_name[lbfw->id], ret);
> > > +out:
> > > +	mutex_unlock(&late_bind->mutex);
> > > +	xe_pm_runtime_put(xe);
> > > +}
> > > +
> > > +int xe_late_bind_fw_load(struct xe_late_bind *late_bind)
> > > +{
> > > +	struct xe_late_bind_fw *lbfw;
> > > +	int fw_id;
> > > +
> > > +	if (!late_bind->component_added)
> > > +		return -ENODEV;
> > > +
> > > +	for (fw_id = 0; fw_id < XE_LB_FW_MAX_ID; fw_id++) {
> > > +		lbfw = &late_bind->late_bind_fw[fw_id];
> > > +		if (lbfw->valid)
> > > +			queue_work(late_bind->wq, &lbfw->work);
> > > +	}
> > > +	return 0;
> > > +}
> > > +
> > >   static int __xe_late_bind_fw_init(struct xe_late_bind *late_bind, u32 fw_id)
> > >   {
> > >   	struct xe_device *xe = late_bind_to_xe(late_bind);
> > > @@ -99,6 +224,7 @@ static int __xe_late_bind_fw_init(struct xe_late_bind *late_bind, u32 fw_id)
> > >   	memcpy(lb_fw->payload, fw->data, lb_fw->payload_size);
> > >   	release_firmware(fw);
> > > +	INIT_WORK(&lb_fw->work, xe_late_bind_work);
> > >   	lb_fw->valid = true;
> > >   	return 0;
> > > @@ -109,11 +235,16 @@ static int xe_late_bind_fw_init(struct xe_late_bind *late_bind)
> > >   	int ret;
> > >   	int fw_id;
> > > +	late_bind->wq = alloc_ordered_workqueue("late-bind-ordered-wq", 0);
> > > +	if (!late_bind->wq)
> > > +		return -ENOMEM;
> > > +
> > >   	for (fw_id = 0; fw_id < XE_LB_FW_MAX_ID; fw_id++) {
> > >   		ret = __xe_late_bind_fw_init(late_bind, fw_id);
> > >   		if (ret)
> > >   			return ret;
> > >   	}
> > > +
> > >   	return 0;
> > >   }
> > > @@ -137,6 +268,8 @@ static void xe_late_bind_component_unbind(struct device *xe_kdev,
> > >   	struct xe_device *xe = kdev_to_xe_device(xe_kdev);
> > >   	struct xe_late_bind *late_bind = &xe->late_bind;
> > > +	xe_late_bind_wait_for_worker_completion(late_bind);
> > > +
> > >   	mutex_lock(&late_bind->mutex);
> > >   	late_bind->component.ops = NULL;
> > >   	mutex_unlock(&late_bind->mutex);
> > > @@ -152,7 +285,15 @@ static void xe_late_bind_remove(void *arg)
> > >   	struct xe_late_bind *late_bind = arg;
> > >   	struct xe_device *xe = late_bind_to_xe(late_bind);
> > > +	xe_late_bind_wait_for_worker_completion(late_bind);
> > > +
> > > +	late_bind->component_added = false;
> > > +
> > >   	component_del(xe->drm.dev, &xe_late_bind_component_ops);
> > > +	if (late_bind->wq) {
> > > +		destroy_workqueue(late_bind->wq);
> > > +		late_bind->wq = NULL;
> > > +	}
> > >   	mutex_destroy(&late_bind->mutex);
> > >   }
> > > @@ -183,9 +324,15 @@ int xe_late_bind_init(struct xe_late_bind *late_bind)
> > >   		return err;
> > >   	}
> > > +	late_bind->component_added = true;
> > > +
> > >   	err = devm_add_action_or_reset(xe->drm.dev, xe_late_bind_remove, late_bind);
> > >   	if (err)
> > >   		return err;
> > > -	return xe_late_bind_fw_init(late_bind);
> > > +	err = xe_late_bind_fw_init(late_bind);
> > > +	if (err)
> > > +		return err;
> > > +
> > > +	return xe_late_bind_fw_load(late_bind);
> > >   }
> > > diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.h b/drivers/gpu/drm/xe/xe_late_bind_fw.h
> > > index 4c73571c3e62..28d56ed2bfdc 100644
> > > --- a/drivers/gpu/drm/xe/xe_late_bind_fw.h
> > > +++ b/drivers/gpu/drm/xe/xe_late_bind_fw.h
> > > @@ -11,5 +11,6 @@
> > >   struct xe_late_bind;
> > >   int xe_late_bind_init(struct xe_late_bind *late_bind);
> > > +int xe_late_bind_fw_load(struct xe_late_bind *late_bind);
> > >   #endif
> > > diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
> > > index 93abf4c51789..f119a75f4c9c 100644
> > > --- a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
> > > @@ -9,6 +9,7 @@
> > >   #include <linux/iosys-map.h>
> > >   #include <linux/mutex.h>
> > >   #include <linux/types.h>
> > > +#include <linux/workqueue.h>
> > >   #define MAX_PAYLOAD_SIZE SZ_4K
> > > @@ -38,6 +39,8 @@ struct xe_late_bind_fw {
> > >   	u8  *payload;
> > >   	/** @late_bind_fw.payload_size: late binding blob payload_size */
> > >   	size_t payload_size;
> > > +	/** @late_bind_fw.work: worker to upload latebind blob */
> > > +	struct work_struct work;
> > >   };
> > >   /**
> > > @@ -64,6 +67,10 @@ struct xe_late_bind {
> > >   	struct mutex mutex;
> > >   	/** @late_bind.late_bind_fw: late binding firmware array */
> > >   	struct xe_late_bind_fw late_bind_fw[XE_LB_FW_MAX_ID];
> > > +	/** @late_bind.wq: workqueue to submit request to download late bind blob */
> > > +	struct workqueue_struct *wq;
> > > +	/** @late_bind.component_added: whether the component has been added */
> > > +	bool component_added;
> > >   };
> > >   #endif
> > > -- 
> > > 2.34.1
> > > 
> 
