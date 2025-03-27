Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 792F4A73570
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 16:15:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD00710E083;
	Thu, 27 Mar 2025 15:15:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BuJhAugv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D992810E083;
 Thu, 27 Mar 2025 15:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743088552; x=1774624552;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=93qqnH4LbfaxwcVdG/gtzpdmHIAVvoA446hqNI/ayyI=;
 b=BuJhAugvYL3ZEbvoxigX+RzmMRYwUDLVFkQYtqMkqVVgUSzc/JG/DI/y
 wKOUGEUMxm9bs1acuZFIAXqjR/m6IJO2Pm6/DDgdLgQ4xA7/cRkElVDup
 7T8KkAzB+/R/99B/Gq5CtwHWaB4Q5YP2TJdXZH3ptsTvTurOwfGr60sU+
 cDvvQNav0xFJFFC+4s/QZUc3Sjb9s7fdESj9pu1sXT8IcNOf07i7LA0BJ
 GqrXBLRCj1X2MRNnFKWai0tDyHuU0yw7P6m9gUYc0DRVOK+J3pXW+fImq
 8elUe0PUeRgN9br8gjosXn4skzIIT4R6jVEyeNU0x4YwNxxmqnf4MsPMl w==;
X-CSE-ConnectionGUID: 8fXf9qOoScGddgGnR2/R8Q==
X-CSE-MsgGUID: I86b+kSSQQKS+ZuTyyEPGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="55799467"
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; d="scan'208";a="55799467"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 08:15:51 -0700
X-CSE-ConnectionGUID: pqK7thhaTwy0S5jP4Y8Q8Q==
X-CSE-MsgGUID: keUp4ip+RfiWbHhricM38A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; d="scan'208";a="125080190"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 08:15:51 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Thu, 27 Mar 2025 08:15:50 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 27 Mar 2025 08:15:50 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 27 Mar 2025 08:15:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vG4Qf4mSvsmGI25LjGnediQrTJ1/UO9hvrvVi8lc3S7IHJytxKqbuXkmerDs43Kb494ZKIJioACFa8a+cp04jzoOd3WowG7XaSWtL5KwyC6doGrBT3JxOcukD46GOyv/JQWRFc8oT5uFdsn2mSFzbmtMhjfbXDNhM29JaK11IxwkOkUeqSZNcjyzq7nZntLuH6BWY6J4WHbEI7rP0tqXIdzzqPndmvjQ5P1lUgqvPEcqUps2CyoTK0/We+Kt+xIYf2YwyQX0aM3xEmS276FsGSFwVfjWuWdB6OWKDiI54GwfmF08IJi4MAuo/fRkYagI10tVoiwrnK2MA6buMnUvtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eu6AUS6CcaizMtwBRPgSmO+QdNXa1yLpKirfemYksqM=;
 b=DsWEVvsERDbiTnOmfnPbLeN8UhLNmTcsE6iqberCwrSMWb6I484IultXVRYZYLK6w4B7j0zL5xUnK433jPPhQKlRSJamTLzlcgvOPJg/6eaQv9geIhKGeoNAQ/9yYmqDrrsfwFR7TRiaaYnp2mOzFgrXYFaDZ1m1Qud0IR+44pvNtn1VsBJIh0J9lYaD4SY5i4xhSRIK5DhaIaxuLia/8ryHGd1/Kn6VjAuhm99sq2YQhTAm15SD260kORR1IASwW8QLezqzqpOhMiVoO9C1Ecuu7Uj/20hFDq+xW1TEnlmdN8xO+GaSMbGxk8oWhie5s1iCoG5xMB2/YwtAlpYo4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB6402.namprd11.prod.outlook.com (2603:10b6:510:1fa::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 15:15:06 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8534.043; Thu, 27 Mar 2025
 15:15:06 +0000
Date: Thu, 27 Mar 2025 10:14:59 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Oded Gabbay <ogabbay@kernel.org>, "Lucas
 De Marchi" <lucas.demarchi@intel.com>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dim-tools@lists.freedesktop.org>
Subject: [PULL] drm-xe-next-fixes
Message-ID: <vxy5kwdkzgp2u2umnyxv4ygslmdlvzjl22xotzxaw55dv7plpz@34miqxkbvggu>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
X-ClientProxiedBy: MW4PR03CA0200.namprd03.prod.outlook.com
 (2603:10b6:303:b8::25) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB6402:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a1130c1-bf4d-4038-b5f4-08dd6d4227e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?i0dy03GceO8n1h+fL9qLkmHoSlTacf9tRTb2PIaLJ2dDrskH9tdqQknQb0q9?=
 =?us-ascii?Q?o6GNwlu22Tpxv6Fzij9NqArKz7rE5ZfbXjSB8yYPZcGlvsFY3P5EyiV6/HSr?=
 =?us-ascii?Q?DRQTJdWUaYRjmIC2KF4z7lTcmlNEcnIY7bJGzw9BVbthwXewdJ9oPllM9NVZ?=
 =?us-ascii?Q?F0XVjWCeucN5V6zoU5GS/t18ZP6UpO5HqsPzPtnHTf83mnJityYY17xZRYUR?=
 =?us-ascii?Q?sLlpd5wlXYdsCd1y7kvI0JdsCYLVrar9o8TbK5pVcKfzYq9wLGJ/8G3kAWJq?=
 =?us-ascii?Q?zHW/j0jwHxUf3k1vR9cOaN2amTFVOe43uKmXowREozCQaMYuh1mkZK2iWQg+?=
 =?us-ascii?Q?+m55zgsxbpCMTAV+EQirLPqzdLWU27oteh4YRk36IFMGXnCErNa/JPDWC5gI?=
 =?us-ascii?Q?lVSl1dVuvDmJzdRg6jIjVM3B1Zy8FmCBW3IY39KQEfjH4nSirPMs5COrvo1R?=
 =?us-ascii?Q?vJcwRFbHoyLkkDCp2+gQA+8hX8Oe8/WMRNqIl0ZUMDO1Rwrsed9Ox6SCDrkH?=
 =?us-ascii?Q?nnkZ/KRoV4hlZW2w9MqtkMxioI3u2McNt4dhyw7I9eTVap+Qlv+Rkdg8ExEh?=
 =?us-ascii?Q?bO2F3S67TgC0zSDo36Hoqd48ZKYIlbAnjBIT+4XGKIHIkXF7yz8wkwvmzNiT?=
 =?us-ascii?Q?da0Q10tfvNUMazSSm1KoDgnSW9FoQFvEZbng8fz40v1OU5H7cI3wC5AuzxEs?=
 =?us-ascii?Q?IMlTTxAy+WvZtFZKoPIVbqYnVEYc0Fyc3D+1cifZyQ+kJlRZI2C+bydC83h2?=
 =?us-ascii?Q?2cmSQY0WAk6vjNwUQjrAr2qv+Wq46BtV5A7FqaFXw+NbdWAsgfe7hlhl3zEq?=
 =?us-ascii?Q?o65AM+JqDLBe3vxSbtK4617qHtuNgy+QGL/36IyL9y5d+9woWtp8e4xheZBc?=
 =?us-ascii?Q?cZARsSpeAOGruI14TA+FKt8lNEycsWHbRPNuolS7304JwSV04HsHSjHU7Vj1?=
 =?us-ascii?Q?Dxfe6s4F7WlWtSZF+o7rpJFjABCDr4Azq7bzLCgNtekp2U6NTuH7ZFqrTT1D?=
 =?us-ascii?Q?dLYhEj92JTfexqUFiHAhcZP5vrKkNgSzx8DE8USvggk/4gwKGPtIy67NQ9Ee?=
 =?us-ascii?Q?JC9SAVeAWNbid2qLt55RiB0KWvfsl0gq+8gR405Jh/cpXzj29Bk7LTlKfiHr?=
 =?us-ascii?Q?78d0FFsMR34bSWO5830jc44DOaCks75ewKNapQHVSrYMJsWwDr0wASCGhaGK?=
 =?us-ascii?Q?ysOQvpPBQRd17U4exarrAKrJabLEOScvoqy/tkrvNWJbGE/BnnTUGuEeq0UI?=
 =?us-ascii?Q?VLcdSgpysfLggaGSTNg7Y6syoo/7bBY4pYy/lkbWkj6kZfkNj81g8vT4ZPdY?=
 =?us-ascii?Q?0kU62uz/GKUCk7hf3JxZZdiBXpD/RR72YZ+o4IBXp7BtGiuiRZoXrt+d4T3D?=
 =?us-ascii?Q?WOpQNAU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WY/RpRRCaD0ooHJZEeCRRbCILnTfCMwx+Rn2Mn/Cxbt0uzonUVtrFZagpi7O?=
 =?us-ascii?Q?YuzBmZJn0BjNDvGZN7q9O6JXVjJAwbBYh9Grz3nRbJisJ4ZiyZDqlgsjqk0z?=
 =?us-ascii?Q?Df591RqnVpt43ZWt3s1AYi19aK6i4hJiv5vo8S6C31S68/wII6zQoVC5Dg9O?=
 =?us-ascii?Q?IQk7hyVRJQ905hwBqSuDxrHAXkKyM/DTx1fRZiYxk2Yik+JiZKPRHEElxb82?=
 =?us-ascii?Q?siW/7lxmW9g5R/6nDKuDApjUMTgkc5ko1lT7TqQnnOd1URyCRrP8ynEn81FO?=
 =?us-ascii?Q?f6ZFJ4NMQMWq3nfAmtJchGSxQcXO49DntO4S4C5uO2nvscM6i9ON+xuZCEi9?=
 =?us-ascii?Q?EDvZMGQl5v51h9GcNncJlPocbq6luTvaarjlkG9WRh26CbgAj4DaSnxs2CpY?=
 =?us-ascii?Q?kHWRMaUTU2wQlRkWcAUNwxHZfnajIB9/W0/GZpzZs/l/5hotRbz2XY7FB8f+?=
 =?us-ascii?Q?qIwykGl/lqAnKuT+qE5wzxN0zSTGeq0Mg1iMfYEOpvuZLc6UFjH3idqrBzpL?=
 =?us-ascii?Q?OPJYXxhpo2yMB5R+4GhuiQIeXzGsGClnfUfHTYl8NI5KLmvCyS4UF6xe1+T4?=
 =?us-ascii?Q?ipVdPfpUWac0fCtEM6sBO6HvI1oubQ5TvNiLNYec7h8rDvVMx8GUEH077Wns?=
 =?us-ascii?Q?Dy9iXVdlUEz4p440A5SIK6tdso3RiFzEm/atpwmleRqE3y1jC6m0LwZ/JlTD?=
 =?us-ascii?Q?WTuJ9tP4yIWg7IOiF5RE1Gw31NuIcAbO4pA+ejW37jxBlzm4w2hCdx3W8nmp?=
 =?us-ascii?Q?uyH88ji/T0oZ1OwZZ7leDivTPeQajAWXTm6uD264TMLdg8EhQBVZRPU9qi/A?=
 =?us-ascii?Q?EdGCnT/NFzjpN5ASIOFjGeOewcKMlWTUvIeKxRg7AGh3k5LcL7AzNwQaydN/?=
 =?us-ascii?Q?HzN56q6vAkic3OauCMzWXLZEB1IeD0XnGxv5XaVEtikotFp35HRejb2q2lo9?=
 =?us-ascii?Q?YcRVsq6CGMbNz+hUTET+BxrtgV45rE+PfmasjvQYA158eUYjXr0ToqJGyH8T?=
 =?us-ascii?Q?Cb0drlSM4cxYkmQoBzzqDBCm/ALp5kJdmSevpCOrCEqZ//1qtJH9Z269cL+t?=
 =?us-ascii?Q?gx6YiCihoPas+5Teg1WAG/0G4vPfz4Cd+QxojfGHPzGSRG2wv8BuZ62F0fCT?=
 =?us-ascii?Q?P9/twENzE1K+hoYc1g8RQlocI1OAi1osVTunjGUYW+JA2J26mQps1WSicRu6?=
 =?us-ascii?Q?pDLrSC2jYJIXJgPy7pMam6H7rS1rp2riW6PdSPkQ00Z22tdtyKCW3MYg+h5C?=
 =?us-ascii?Q?HcBCxprC/1yXhfVJIRgl0OzGPTdhJg3a9j0PciGsTPXixLpPyNEO7etadsuz?=
 =?us-ascii?Q?/eiRXgv+pKJqnN6ivwSNj/5tOaNFllOn8yQBMC64gfiOt91hvo3dyjbwoqrv?=
 =?us-ascii?Q?C9XjBagT2sifPUhRPFGCpHFjBBjuDZor9zaeBW2hubJRUiVQfZReysqc4D4O?=
 =?us-ascii?Q?ibPmbII+fpbfM9yH81SPDKNdZx6L18UFcQ4BD8Fqt0dPYaJJawwLD1AEfPYM?=
 =?us-ascii?Q?+OB5gDJ3XANuPraXofoAqVG9Jm92AoQIehS7AHfZtmbnBtdCwdyAVsOCxRco?=
 =?us-ascii?Q?lD8zFwm6tc5e1G//PXSwKiInDReDwCB9lZSh1q/LR4pMMlWu5sEuvjfSXnKa?=
 =?us-ascii?Q?ZQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a1130c1-bf4d-4038-b5f4-08dd6d4227e8
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 15:15:06.3273 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yKGL0gfYxDWuFCPv9sTosFkeFGihqz29r3H4zcCLwUZoHEurJOokLtFnw0LF5o/XcmPrqDcNDzRTytMFlO4HQ7GWpTQpxoH6FhVToOWpytw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6402
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

Hi Dave and Sima,

A few fixes for the 6.15 merge window:

drm-xe-next-fixes-2025-03-27:
Driver Changes:
- Fix NULL pointer dereference on error path
- Add missing HW workaround for BMG
- Fix survivability mode not triggering
- Fix build warning when DRM_FBDEV_EMULATION is not set

thanks,
Lucas De Marchi

The following changes since commit 5da39dce1fa3c81dc6552a16a9f748ba2980d630:

   Merge tag 'drm-xe-next-fixes-2025-03-12' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-next (2025-03-14 17:02:11 +1000)

are available in the Git repository at:

   https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-next-fixes-2025-03-27

for you to fetch changes up to 5e66cf6edddb5f6237e3afb07475ace57ecb56bc:

   drm/xe: Fix unmet direct dependencies warning (2025-03-25 20:54:59 -0700)

----------------------------------------------------------------
Driver Changes:
- Fix NULL pointer dereference on error path
- Add missing HW workaround for BMG
- Fix survivability mode not triggering
- Fix build warning when DRM_FBDEV_EMULATION is not set

----------------------------------------------------------------
Harish Chegondi (1):
       drm/xe/eustall: Fix a possible pointer dereference after free

Lucas De Marchi (2):
       drm/xe: Move survivability back to xe
       drm/xe: Set survivability mode before heci init

Michal Wajdeczko (1):
       drm/xe/vf: Don't check CTC_MODE[0] if VF

Vinay Belgaumkar (1):
       drm/xe: Apply Wa_16023105232

Yue Haibing (1):
       drm/xe: Fix unmet direct dependencies warning

  drivers/gpu/drm/xe/Kconfig                 |  2 +-
  drivers/gpu/drm/xe/regs/xe_engine_regs.h   |  4 +++
  drivers/gpu/drm/xe/xe_device.c             | 17 ++++++++--
  drivers/gpu/drm/xe/xe_eu_stall.c           |  8 +----
  drivers/gpu/drm/xe/xe_gt_clock.c           | 54 +++++++++++++++++++++---------
  drivers/gpu/drm/xe/xe_gt_types.h           |  2 ++
  drivers/gpu/drm/xe/xe_hw_engine.c          | 33 ++++++++++++++++++
  drivers/gpu/drm/xe/xe_pci.c                | 16 ++++-----
  drivers/gpu/drm/xe/xe_survivability_mode.c | 31 ++++++++++++-----
  drivers/gpu/drm/xe/xe_survivability_mode.h |  1 -
  drivers/gpu/drm/xe/xe_wa.c                 |  6 ++++
  drivers/gpu/drm/xe/xe_wa_oob.rules         |  2 ++
  12 files changed, 131 insertions(+), 45 deletions(-)
