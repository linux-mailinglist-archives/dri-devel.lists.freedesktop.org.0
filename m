Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C25B85AD29
	for <lists+dri-devel@lfdr.de>; Mon, 19 Feb 2024 21:28:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFB5410E28F;
	Mon, 19 Feb 2024 20:28:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="APZJP+Xw";
	dkim-atps=neutral
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AE6510E255;
 Mon, 19 Feb 2024 20:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708374499; x=1739910499;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=JxR9kXfMGgK6Gvq4jiEc+fGwlTN2zkRXdSMVT82khdo=;
 b=APZJP+XwtXLWb6wvHWFO+xb8Rl1CBVs2PPmqNYjFZNpn+JoCG9basHnk
 ES9dlZLvMwBZBrHn/OLs8MQxrnTutF88lQCeYdg9/QpLXIWLTp0jucZXB
 jlZyG9AiepQ6lybNh8ch5y/TXFtlGCOyhpfOllp7zyFRFXI7FOIUVeKGl
 peikJVvVa4FlCMe+Ii6cGSfO/FLj1qnACLgRXeaxtCH3sa7A0iyXTKDIk
 xGmJ3WaEnWjqVZFfkoMm7mbQ7251P+8bYPnVqAdLQ7CcV5GcixNVJPKrQ
 WUQLIBlv8Ftqv09OJygobcrpGL/gR/1T8msphhFwWqqoUtFiEaGjX6J0s w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="27910198"
X-IronPort-AV: E=Sophos;i="6.06,171,1705392000"; d="scan'208";a="27910198"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2024 12:28:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="936336814"
X-IronPort-AV: E=Sophos;i="6.06,171,1705392000"; d="scan'208";a="936336814"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Feb 2024 12:28:18 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 19 Feb 2024 12:28:17 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 19 Feb 2024 12:28:17 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 19 Feb 2024 12:28:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VAYZ7cZZNIYXeKcANLBS1RIlJkeFwAAC8gietVOjNRIxlb48mOjc49FxVXR5NyxOE6yk+LKWWLi2n6patu+P8Kjr3dLOtF+JWchtjO2FEDoL/9P7pbCcyvjgnIHBbBNjc6uIVQF98m/uCVpf3XI88W9K4Soj9wYMJfQ5Uh2sgPB9lBPlylScZJFewiiNsqoPzuUKqevSLX8VfVJpUeDLCmU3AzA8Gik+XmtGrO/QanlCur6mIE2Wlni4IdMD9WHN3MyjXwr1noJWIeyYvHybVVeO8qJqOki3OEIXkt6zIqXf1mlWVDgrohM5wxpbuYuiDSisGr4kX7V8+yF3eloD5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qOYfEaortPSgF2zdW4/N15lV0qNBQWN2YdBYWxVZdwY=;
 b=HzLWfii2eyaIAZ2ZY047iwP1tjtbscUGyI7aMEcedO5DaTklBhcIPfsab6RxhsQYYJF8LarUEoGwZp4nxWvozIpZK5+PYvgY/yS5jTw4TXKaldeBSRoChWRhVNirLKWYybObL0Fg3ZGv1g2C+oHb6b7NPrF7OL12TOWXvhtKfOkqG3/Zn73CrkZN2UsyIFsxUuJ2Ik6GowvhzSu7wPbNKyZFB2D5lY+PgYcf8mSX3RjIv513eawdqx5g2tdPwDvSI/miV8JhxFkvmEDomrnRUGn6EnvY+PQk0uH9Th0L2J7iDMYLSvDYsTzocls3LHgHFFh4LoEK1+oS9HUHrxRmrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ2PR11MB8371.namprd11.prod.outlook.com (2603:10b6:a03:543::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.38; Mon, 19 Feb
 2024 20:28:15 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7292.036; Mon, 19 Feb 2024
 20:28:14 +0000
Date: Mon, 19 Feb 2024 15:28:11 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <John.C.Harrison@intel.com>
CC: <Intel-GFX@lists.freedesktop.org>, <DRI-Devel@lists.freedesktop.org>
Subject: Re: [PATCH v3] drm/i915/guc: Simplify/extend platform check for
 Wa_14018913170
Message-ID: <ZdO52xFiDGrfJ_cd@intel.com>
References: <20240216183841.497768-1-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240216183841.497768-1-John.C.Harrison@Intel.com>
X-ClientProxiedBy: SJ0PR13CA0125.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::10) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ2PR11MB8371:EE_
X-MS-Office365-Filtering-Correlation-Id: 8909959b-6021-43d6-fb66-08dc31894caf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: krbLq2OabuinCRA6KquNBdyE3nuVhOViiJXFyXhFbuIG4pB6L0CWVlDIH/tVeOupSa1L34cfTqV7GgMwsEBQDWwBI0sKpFKlwhdaA9QjPrh1gdc6EGnlUq9bkPODkjUbP03fNIlHLgN41jPFxPJT9nmuPj/AObKCTeepppnfZNV02u81GkkKj6GJvIG3xlHWdxQJL5BQWfypOG8WTf1GmFVKn7x3i60C5ZS6pz+4FL0ebQqoc6aU+zrSTr7dnDXtsaCPsOiSG0hWeChCOdTNaSmYDuL0HKZQcNJOgy9CnSzGx2PJ8upMjHde3k1eMYaIBzBU39uHlXvj7S2umuX039SXDuD17PXhh2StFqNtVkH4X6ENJ1X2h4i7VBdrdHzy95StTdwcx8KQ8xVjYO3jTTyNXr7HLWh3HNDfJXp6werfB9Nzl5zt5I0NoEUDdUkJriSJ1sAh6lieh0fWnz1LzBgPvJkFIhrxAERlwDoYmm5FWSQbptzggUwvDeAg/5wCxIBPdQzjVNUKm5tBdOyb+7iO9v3/woJ4MzmquS3/P+E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?McZonMGTNiQp2VZNfSwff9YAAFiyY75v5+a55EFCy1cluJ3dwcOUlZEU9uLn?=
 =?us-ascii?Q?d/iiylWD0YYUGbJlI7+gWZHB2XvLz099U/Uv1YcWAK+A+eqNMMIUOiyDl7eA?=
 =?us-ascii?Q?5eHXU74G8ofzbPVaaxMD2o2nxqRXGs5uH6pO2Yor9TkQ43VRCbsncpELm6Mm?=
 =?us-ascii?Q?9QUWaIU471zEL7dG8w99FsuWnD2SZiw+BEnyPEVJ9x+f5CM17mbnpNIgFroJ?=
 =?us-ascii?Q?pIpkUjp4Mkbb3W8JhCHQHcmR+uAXlFnvz+mgOIuJD/vwfktjuZYuushpaORu?=
 =?us-ascii?Q?w9ppwyJJCpLo/p1l3nfkwlL8wLeE36KBGqWD4ycVGkLFv3+TiyOF6RIttrbg?=
 =?us-ascii?Q?1y5OVLkOA0G0siV++3f3oMgF2a9trXSw3Por2IITZ3pe9bLZy0ZBz7fefMD/?=
 =?us-ascii?Q?8dRbJoDOj3HA8OBCXGdw6NINpOMMs8qKF2gbveyQk2Mh0IT2qQhOH6XmfsGU?=
 =?us-ascii?Q?WppfLYdoS+aDr7cC+cMXqFpD/07zMUHRrqsGYYDRWqosl/p0O/yribHMAvXM?=
 =?us-ascii?Q?H5kAG/tSyNA+SwqhpXmpWas8YRA6ilD1aYd+18huqxr3CcKhEjNTAkvc8Y+j?=
 =?us-ascii?Q?pNZWD6ak3URwtNugtuPA5wBsfv2p4GejN5k3HJ7pRY151yWX0fYwmtBalK0g?=
 =?us-ascii?Q?odis32bRjvU0rHNSmbCaFWA+Txulke1+iM2U0aW0KDZr/MFEDuG6ANmdqCyO?=
 =?us-ascii?Q?MTvX6mKelgIrUzZqzn5iExMVFcizaBdlB9BkMabSPysHe0FGT0wHCmaMO6ih?=
 =?us-ascii?Q?nyXjgwo3oJnMdyat4vHcf6mzrTwQxyuoYeRPinFXv/4AqIfNqEymOcf8NpU4?=
 =?us-ascii?Q?O07JcOLAgOCr8ac4sL+meniKXxn89ogA7TBAlmMwdKXbKV1IcMpxjW3tc+vx?=
 =?us-ascii?Q?q48EbXTlFjNAt99FC2AhB/vfh7pzncWvZfp2qP45Irxm+KWJqZoCV0UI7crE?=
 =?us-ascii?Q?lQuO7uZ5NtYrL7CtJ0vh7KSaqcArhSnfoVBb/89Y/0Iw9zApk9RXGt6Rjcr5?=
 =?us-ascii?Q?yOV7u0yJ6rr8HjIxC2kHl/Dq3VmReF1GnMCDPqwIzCtBRd1hoRcB6XQDZgPr?=
 =?us-ascii?Q?aGVUukrBbYgZPSVS0Sf0TQy2F0D4/2bmLUe+bfegwINkOEaLGcjagIQVjBAm?=
 =?us-ascii?Q?BBRw1jxypUhPK+udYtamfHcG+0nzgJXpBwnElukbn4ibKSEzlfRPXY6mAKJv?=
 =?us-ascii?Q?mkx7VSpvK+zXNAIU0/NuEbKlkZIi/HPP7pFuJ9AbNttNMCfXFci451OUud8/?=
 =?us-ascii?Q?Rb+XfKOlOfrPSbJmSAXmjlLyyPgB27Ml0zyTVz4PcAAAsRE1DUBk6dU5cmfj?=
 =?us-ascii?Q?eSSLnE80yxqnJfsz9iSYtyfRyvMSlfk7ktl7AL2nKczPtUqnpEhTSPydjHhf?=
 =?us-ascii?Q?RsA4eJmUcVwrYZzFZiLYgmo/vl2OrO9tckK9X+SmIp1ZoLVZ5S4B0tKqix1a?=
 =?us-ascii?Q?qCoabn/N6+nu7WrY5j3B+eO+ie0xnkwnDPGLHLJ0HWDI1nqOfCwrSi4p0GnA?=
 =?us-ascii?Q?SJk1DDVuA/X/xRkL5xaPaO7zVmY22arrQ9zpQDo57VbIUikmVh6/B0eF64IP?=
 =?us-ascii?Q?8yvtlKRKE5tAS+IuZ+1QIVWsZx2bvptNAsvXeDJf?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8909959b-6021-43d6-fb66-08dc31894caf
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2024 20:28:14.8781 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RWoPxAMU6/xwwTJ7mVGYV+r4DHJTKaJQDjWMs6TNLzTAsB1nuDbXDZuwNILuaNq8NcevpkxBrZ4g2Fmw09dFUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8371
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

On Fri, Feb 16, 2024 at 10:38:41AM -0800, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> The above w/a is required for every platform that the i915 driver
> supports. It is fixed on the latest platforms but they are only
> supported by Xe instead of i915. So just remove the platform check
> completely and keep the code simple.

Well, I was going to say that I would prefer a GMD version greater-than
check to be future proof. However if this code gets used in some other
new platform a new specific guc support would likely need to be added
as well right?

Perhaps at least adding a comment in the code?

with that
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>


> 
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>  drivers/gpu/drm/i915/gt/uc/intel_guc.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> index 2b450c43bbd7f..a3662edb42032 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> @@ -321,8 +321,7 @@ static u32 guc_ctl_wa_flags(struct intel_guc *guc)
>  
>  	/* Wa_14018913170 */
>  	if (GUC_FIRMWARE_VER(guc) >= MAKE_GUC_VER(70, 7, 0)) {
> -		if (IS_DG2(gt->i915) || IS_METEORLAKE(gt->i915) || IS_PONTEVECCHIO(gt->i915))
> -			flags |= GUC_WA_ENABLE_TSC_CHECK_ON_RC6;
> +		flags |= GUC_WA_ENABLE_TSC_CHECK_ON_RC6;
>  	}
>  
>  	return flags;
> -- 
> 2.43.0
> 
