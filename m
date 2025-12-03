Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D6BDC9D9AB
	for <lists+dri-devel@lfdr.de>; Wed, 03 Dec 2025 04:00:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5585110E701;
	Wed,  3 Dec 2025 03:00:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iDkcNi7J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A27A910E035;
 Wed,  3 Dec 2025 03:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764730821; x=1796266821;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ed5EGQjq0fJtyjYV+seWRA7s4M3g4AxtYo/M0hygbj4=;
 b=iDkcNi7JAE7kxmcsKBSCtlN3X2eYqcQ0mJKZFVBTNh3q3fkv5FXJ62Ro
 VvezoHU9o80PtnwyvT7iWVL5xbb5hzW2Pc7qJfQcmgwEIpQVSl48asjj3
 6rq/af8cVGPJatoxoCA+6eHNxmAGKS2tMqs2N/F+QChbRHQy27/H4kHfr
 S8bysSob+FRjNrCxuTDWCPD+Fr++0Z/u3EM+sfhUxjIka4KErdKd2VUrZ
 EseLphBC174FW/tPDdTZEFDiTGnHoImYLaQrKmklbOyKzrql4Tiv3bWPk
 IP/ZfKBM216OX84ewXeR4hwvoC6M3FMHMoPePrEzzGg/VlHIJwASyjEwZ A==;
X-CSE-ConnectionGUID: +gPtrSgoRYqY77rHWOhiCQ==
X-CSE-MsgGUID: TpqRjblnSxuTiQm7BnRsCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="78060645"
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; d="scan'208";a="78060645"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 19:00:20 -0800
X-CSE-ConnectionGUID: T0C3nhZkQyq/nZR+8LaU7w==
X-CSE-MsgGUID: j966O5TvQXKY9NmxysQiTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; d="scan'208";a="199676631"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 19:00:20 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 19:00:19 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 2 Dec 2025 19:00:19 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.6) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 19:00:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nNKqLYXAmB9H2SYHvZaNsK7KBIwvZ/m8xMgpT/s4dPEuW46xJQLwGnYS/Q4JD9HeT8hoSYySKsS1/A3dDxZvHXIb+5jGdQgdjG9W9DEkTkqAOJx55cCk67vaOVVQ36TaHuJUMlMKm4vKjf1uggGj9Oc8P9m3sYnJwKiCj+4JNzZPl2Jv7UtwHr2CuO+FWeSUpegUiQMZUoyGTZrsLssgGl442uGQJzfxqaijfva7k42lV3sdJO3hqGsTAGJI7pNSnoyQ7xxWsKINkfa10Aj3ORLwFFxguLrj0Y+s8OoLB4nccxRdmtTig5Ey1Vywj9hAn2+d8fpVii2PH0yGgOsfvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E747Kl1XrElSNU9IPmTZfT0BRt3b1b5ujyVS/RSY6n4=;
 b=XbykV2G7avxNcl6dEm6Uy12BgvJ1Q5AiuLyZAydmEZSJpZR3pB1iwcS/H6XohG2niVQ6f8PKZMEtocD13N5Qh+SKZ7tBik5qzeSw04Bjiukqyfd6+IAnmT1GUBQ6oYUGcQLcHWv/RZamqXL3JCnY+i4LBae1ZG3gBWp5mWtzgxzj0yASL5JsSgZvXskU0550L7eVsURww8JPRrSZBW1id8P78Wx6usukjiu4SdzT87dsZD/WRlQwcva57e/qdjdp4CLWUdBCHwQ3fxEwrP6eVOxskcQYz+yj3DXujVHT35xedimX0y1kZRESTAaKKxYpw0HR7fnbpNLAhnF3DeiCSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH2PR11MB8835.namprd11.prod.outlook.com (2603:10b6:610:285::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Wed, 3 Dec
 2025 03:00:13 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9388.003; Wed, 3 Dec 2025
 03:00:13 +0000
Date: Tue, 2 Dec 2025 19:00:10 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <saurabhg.gupta@intel.com>,
 <alex.zuo@intel.com>, <joonas.lahtinen@linux.intel.com>,
 <jianxun.zhang@intel.com>, <shuicheng.lin@intel.com>,
 <dri-devel@lists.freedesktop.org>, <Michal.Wajdeczko@intel.com>,
 <michal.mrozek@intel.com>, <raag.jadav@intel.com>, <ivan.briano@intel.com>,
 <matthew.auld@intel.com>, <dafna.hirschfeld@intel.com>
Subject: Re: [PATCH v29 2/5] drm/xe/xe_pagefault: Track address precision per
 pagefault
Message-ID: <aS+nuvf6HkDKZ6Xv@lstrano-desk.jf.intel.com>
References: <20251202184636.96142-7-jonathan.cavitt@intel.com>
 <20251202184636.96142-9-jonathan.cavitt@intel.com>
 <aS9d5mOtJCEOC/SU@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aS9d5mOtJCEOC/SU@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: SJ0PR13CA0011.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::16) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH2PR11MB8835:EE_
X-MS-Office365-Filtering-Correlation-Id: 8dc0023f-ad57-41b9-5bc8-08de32181463
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JG6aMQLAcZRZ0vnbKcVqofpWIY4bz1K1Up7rgMn4/mIikqkrLzCXA5AzLvUF?=
 =?us-ascii?Q?CjR0rCWE4W3L9ix8J4sYmEk6C4W1ZNkkmRvv6b7DaqHQD//Pj14GOFsARN37?=
 =?us-ascii?Q?E0HYhoNxlacT32N4Y/2TOcffr8Urkc0aez5X4wXWJGuqCj3kiC6wh1UJFLvf?=
 =?us-ascii?Q?b1fOMQYuGS/dw7rYQGUT81xYc9r8tP0MPGwrKIgife4GOhjfeqM61EJIyZ7J?=
 =?us-ascii?Q?eSViXcayA7x9xnyI7ROG4kN8Rtp7FveIHFTNR7lj+/3Z4C5Qhh3j5bNKfDoO?=
 =?us-ascii?Q?eApqQC9/JY+FtoMMuUgfXTgH0COwszASevfBnKiTe+uaXJXmO9+GxAd4+51k?=
 =?us-ascii?Q?TGrotI2L8keTKRdeovDMOQOkweWhFEMkFv51fROqXEgzbG0e0rYnweuXTvWi?=
 =?us-ascii?Q?jd0pOwpSBO3iz2GAaPpUaBJIwFDrSrg8IQrnUi8/kDWvLMPvd4mHuqLe3poA?=
 =?us-ascii?Q?HfZk1F+ehkVZ61RmuRb2ymZ5s2vMJs+11jE22q0LPPfRgAo7pSVuQE+TxUSC?=
 =?us-ascii?Q?mXguvxfo6BLECKBXPlH36ebZetugrJZYs5c7L5qIUMwDPY7UecVy/2PicNtY?=
 =?us-ascii?Q?k8E5Im76LXA2mFwdyd/MmI8wE9jPjdU3Qz8BsUiv1sEGPPGMAmqHgJoPYUKi?=
 =?us-ascii?Q?CyLjluvPAeWdZ5N2kBsX/JgxvPwjyGWOTJzu0dWH/L/lv/cpzseSWE/iPEWp?=
 =?us-ascii?Q?JOFWotor3Bbm0BquqWi1jGJsr8YqLYFBbbz9a3ENnxB37ClYtIC16oxF5Pbp?=
 =?us-ascii?Q?oIPwapQvdu87VXp0PAKLk93Q1mKU85O+yXSQT4xq0eDZdC1GTTnBvwxuvSIh?=
 =?us-ascii?Q?m3QaP5+WyFJn+zPgB2waa9200ap6JZ9zAZeELJ4W6fDfLM/tW8ewXL45VYOv?=
 =?us-ascii?Q?hyBIjK65EzSAUfASy8b5a+ScZ5CwjE7R1J0CHBBJnbf1QGHgUSbp4h8UeGYO?=
 =?us-ascii?Q?skurdZ5qNrCjWKVdF8XLrElvUsP5PkftnGJ94cglbY6v1dzsk0IrnlEZJ7UP?=
 =?us-ascii?Q?V9IUAQJEsHN/k0IEg03hRKrG2WAMhHLx4HmW70WjIeRlZOXapvS9SP//15c5?=
 =?us-ascii?Q?n+klT1FEhDCLxxdYP9LfmLeMim5HeJK6O2L5uxyU8BPYjH1sNSgz6yWLbLEr?=
 =?us-ascii?Q?R3l+3sae978RcD2Wef4ktYIhBk+8uYWpHbiXBoGRe9qS4x0didnCJSwfOBRr?=
 =?us-ascii?Q?5WcDInYrVcPjj3EJJZWOH1Jnt8j5TywdS9gVcyYRfqrva9y6UhVjsQ6Aj7NI?=
 =?us-ascii?Q?oKUxcbvCyTBOh/MtN+BijTXTjThRdPTL5g/pbCJZNt7vNTUzniMGXkPQ2V/r?=
 =?us-ascii?Q?R9/yOn54GyeSLMy9CkvnzX9usHJmt6oPd/ogb4CUIrty+A4c2IN6ZhF2473B?=
 =?us-ascii?Q?Vl0pUqrlpbAazBFGbY4FJBiJa/hIz5lFiAOGcYVd5RJCZ+bi3L5EHXZiS3CS?=
 =?us-ascii?Q?Cr8eMmv7DwtS5ozEUexTDzy39wSWa309?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6E5gfH1cTRZ9lTjnYoUw3RBO4HYNZT/MhgpZFZepdDSSApeoILcQ2I6k3RbC?=
 =?us-ascii?Q?QAA6UHUthAFCmFlsuChd6SL/5TrAa8SLAArSMjJCcCiJMmbxi7eaKlIYwlLd?=
 =?us-ascii?Q?AkS/GEGqkWaV8/yt9PI0qQJBDTfWwneyxYmXPtcP+mAklyMSKxVam5M+Mwvn?=
 =?us-ascii?Q?QKTUYFw5D69CEQKJXA9FEkuyU/PFvsMWtotvOVpoE0Fpj2S3iNqrVFWW3RDt?=
 =?us-ascii?Q?Wb7ZYQxZ2i0lTj571IXxoAlRTeYNzQ9xsNEdK1ff2Hqe6fFDD5f/lkSQcctF?=
 =?us-ascii?Q?Ny8Jwhs9IMaUWNRBom3dQdc7zOf5FI3IAPGXsRln3GWs51lBismefnChiZFr?=
 =?us-ascii?Q?KndVQz8XmEzfPT69sjisrzpGP3EUL5oCIvN2jiMk1zSZCqGNn3eTSb8dUPFS?=
 =?us-ascii?Q?CGBxRgxT9IhFAmn+t22MOf2D2TZVe69lKtl0aK/tU9RXyWyN2Fmc9KBoQ0v7?=
 =?us-ascii?Q?YvMY6DOdsY6Xz18rxVS79x/zgxIqvSrxsWMYcy2vrDzBEMFe4BnkQpY06yLW?=
 =?us-ascii?Q?h1KCAqKgiLK4SETZX6GCfzEMr3hHUcwxyYMvHCUCr20fA5EuTNdvTSpySbEB?=
 =?us-ascii?Q?MhVSz/n3uLkhA7cgZAhUpCqunFWKVBN3o/frR3uilWcoxGyaONYkDc+gwMkG?=
 =?us-ascii?Q?dzYZ3qYPZeAW0/5zOOgXpCfq3G7azZiO8w/hIPVE+GjNTHQPMwOV94mQLjE5?=
 =?us-ascii?Q?qIkRtMk/vehlHrBAG8BIBLxN4f6Gl18VfMltEVbpyvibI/YGVnEe0M9WU/w1?=
 =?us-ascii?Q?Jq0IxibPBgqc9/C6/olBIjqM/+sQl+VCy017LRkh2edefnaNDYIyO8UPTdSy?=
 =?us-ascii?Q?zFBuD5VjrdH+v6bVgRFZZPVeINweUiz/H2SRgd64lTR3DCbJu/mUXlgcMkTD?=
 =?us-ascii?Q?qBGoWdMdK16vGz7hXbRKetx6VnWBI/cwwSTywJ6w2plteAG3sws+RcZYZYK9?=
 =?us-ascii?Q?LSnGVR8ui4TOodmsaHE9058y5clSn6VcEKmsMQ0ytk3yovOyYCR/mlNd5g77?=
 =?us-ascii?Q?bMJdbZw3j5L0oF7pjJXB9u3Sm124XQBaCQtSy68nexVcVEPeNT/Dc7Qp7mCY?=
 =?us-ascii?Q?ypDnMXBboqr8B286GQJbc+zVIXewZwX/1FPllDXRiIvbJ3xF3pM35SjO2nm6?=
 =?us-ascii?Q?Xyh10dTQCX6QRkw8EOXBh7akoKJAZmcyChO8I+OC0+JPBCRQVly+a4lWJvEd?=
 =?us-ascii?Q?kaGWLwYKRXFtdDPUQ4rmqYo633UT7d1thxi1Fnk69GnEggee6qCiMp/Hfril?=
 =?us-ascii?Q?8rTDLGkfg1jrOM82PApRNnmkd/uL/r8s6mYS54HvE1mqnBgaXx8o1dP7h1UL?=
 =?us-ascii?Q?V5Tv3ORqK2tH8ZkoaaAixBNpjG04Q71s5MXw9XrKiWC0wyzIkKP66a1N+w6c?=
 =?us-ascii?Q?17mLXA79qZ72RxgPBtfsftV1GNMOoq5XVuZtbDebkMAYzU2aN++38Tou/N4u?=
 =?us-ascii?Q?MwiI9l3xQkaj2vtz7LPaQNN+/BqxXs6RspQubjmWFSqPL6U7xr2L96zaM+m2?=
 =?us-ascii?Q?YzaVX0RCWh5+K+C0J7tP45goftdbM9sSn+uoVnVcUuIF7BIzaePHw56oDgkf?=
 =?us-ascii?Q?ksINsxUlNfZ5uuw2wa4ycVzpO7n8AZSCl3gRvH0Embz2D5+Po66R254jB9+C?=
 =?us-ascii?Q?aA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8dc0023f-ad57-41b9-5bc8-08de32181463
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 03:00:13.7803 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ebZAbawfO59xZ47ZrDbhB/ezPcvWHmETCYWR5GVKcIggOeF8AljdIzisW2seQahFpKMc1d+KCIxVCGud6+DOGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB8835
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

On Tue, Dec 02, 2025 at 01:45:10PM -0800, Matthew Brost wrote:
> On Tue, Dec 02, 2025 at 06:46:39PM +0000, Jonathan Cavitt wrote:
> > Add an address precision field to the pagefault consumer.  This captures
> > the fact that pagefaults are reported on a SZ_4K granularity by GuC,
> > meaning the reported pagefault address is only the address of the page
> > where the faulting access occurred rather than the exact address of the
> > fault.  This field is necessary in case more reporters are added where
> > the granularity can be different.
> > 
> > Suggested-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> > Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_guc_pagefault.c   | 1 +
> >  drivers/gpu/drm/xe/xe_pagefault.c       | 2 ++
> >  drivers/gpu/drm/xe/xe_pagefault_types.h | 8 +++++++-
> >  3 files changed, 10 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc_pagefault.c b/drivers/gpu/drm/xe/xe_guc_pagefault.c
> > index 719a18187a31..79b790fedda8 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_pagefault.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_pagefault.c
> > @@ -74,6 +74,7 @@ int xe_guc_pagefault_handler(struct xe_guc *guc, u32 *msg, u32 len)
> >  				      << PFD_VIRTUAL_ADDR_HI_SHIFT) |
> >  		(FIELD_GET(PFD_VIRTUAL_ADDR_LO, msg[2]) <<
> >  		 PFD_VIRTUAL_ADDR_LO_SHIFT);
> > +	pf.consumer.addr_precision = 12;
> >  	pf.consumer.asid = FIELD_GET(PFD_ASID, msg[1]);
> >  	pf.consumer.access_type = FIELD_GET(PFD_ACCESS_TYPE, msg[2]);
> >  	pf.consumer.fault_type = FIELD_GET(PFD_FAULT_TYPE, msg[2]);
> > diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
> > index 0b625a52a598..47dec46515b5 100644
> > --- a/drivers/gpu/drm/xe/xe_pagefault.c
> > +++ b/drivers/gpu/drm/xe/xe_pagefault.c
> > @@ -231,6 +231,7 @@ static void xe_pagefault_print(struct xe_pagefault *pf)
> >  {
> >  	xe_gt_dbg(pf->gt, "\n\tASID: %d\n"
> >  		  "\tFaulted Address: 0x%08x%08x\n"
> > +		  "\tAddress Precision: %lu\n"
> >  		  "\tFaultType: %d\n"
> >  		  "\tAccessType: %d\n"
> >  		  "\tFaultLevel: %d\n"
> > @@ -239,6 +240,7 @@ static void xe_pagefault_print(struct xe_pagefault *pf)
> >  		  pf->consumer.asid,
> >  		  upper_32_bits(pf->consumer.page_addr),
> >  		  lower_32_bits(pf->consumer.page_addr),
> > +		  BIT(pf->consumer.addr_precision),
> >  		  pf->consumer.fault_type,
> >  		  pf->consumer.access_type,
> >  		  pf->consumer.fault_level,
> > diff --git a/drivers/gpu/drm/xe/xe_pagefault_types.h b/drivers/gpu/drm/xe/xe_pagefault_types.h
> > index d3b516407d60..2cf439658466 100644
> > --- a/drivers/gpu/drm/xe/xe_pagefault_types.h
> > +++ b/drivers/gpu/drm/xe/xe_pagefault_types.h
> > @@ -65,6 +65,12 @@ struct xe_pagefault {
> >  	struct {
> >  		/** @consumer.page_addr: address of page fault */
> >  		u64 page_addr;
> > +		/**
> > +		 * @consumer.addr_precision: precision of the page fault address.
> > +		 * u8 rather than u32 to keep compact - actual precision is
> > +		 * BIT(consumer.addr_precision).  Currently only 12
> > +		 */
> > +		u8 addr_precision;
> 
> This is going to make this structure bigger, notice this carefully
> packed to to be 64 bytes. I believe the structure will be larger than
> that after this change cause the PF queue to view this as 128 bytes (it
> aligns size to a pow2). This should be placed by the other u8 in this
> structure.
> 
> Matt
> 
> >  		/** @consumer.asid: address space ID */
> >  		u32 asid;
> >  		/**
> > @@ -85,7 +91,7 @@ struct xe_pagefault {
> >  		/** @consumer.engine_instance: engine instance */
> >  		u8 engine_instance;
> >  		/** consumer.reserved: reserved bits for future expansion */
> > -		u8 reserved[7];
> > +		u8 reserved[6];
> >  	} consumer;
> >  	/**
> >  	 * @producer: State for the producer (i.e., HW/FW interface). Populated
> > -- 
> > 2.43.0
> > 
