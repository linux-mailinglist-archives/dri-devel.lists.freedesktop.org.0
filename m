Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CAA3A56223
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 09:02:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A830610E0C4;
	Fri,  7 Mar 2025 08:02:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BnYkLJ4+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 515B210E0C4;
 Fri,  7 Mar 2025 08:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741334546; x=1772870546;
 h=date:from:to:cc:subject:message-id:
 content-transfer-encoding:mime-version;
 bh=pIA9IZhPyRkB5NvPNuq451uEgURg8e4yWas3Ie9gz/s=;
 b=BnYkLJ4+V0DOVHkJ5uN2RclGNQR04x5Bxc2EcHNgIjKuGov0g3UDBdnH
 Nju1kDKYiLGjTsy64BHHsgWxaOaOBvEMEeiDoCoBQQT3JJlZP8ClNjquP
 s7MmpFrmLIPw+9MbwvgOJnpHf18ErPvaj/RPYf9xpRotNwgWm3gXktRvn
 F2lokLIQbgyOo5Rcyu6g4sypVA6U1/fGybgh6OF8XrTU8HePYIsuNWA+b
 LIs32jH3XoU5OtPWla37I5yN67TAyTnbYFwdoPN7OiOK5U+LsvVbiEb43
 217Ghhhs2SrkQptI5FE9K+YTMCbFx1fkecSti3+bNZABkTpxwRA5VL0Dw w==;
X-CSE-ConnectionGUID: 11Os2V/ITiqc2iM71/O6QA==
X-CSE-MsgGUID: QpZlF7dfRKeasGugVKYVlg==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="42517248"
X-IronPort-AV: E=Sophos;i="6.14,228,1736841600"; d="scan'208";a="42517248"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 00:02:26 -0800
X-CSE-ConnectionGUID: o4cTi1H0QNume6kriUr4Rg==
X-CSE-MsgGUID: KOM+axoiRsa0wPLOFPTjuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="156474059"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 00:02:26 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 7 Mar 2025 00:02:24 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 7 Mar 2025 00:02:24 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.172)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 7 Mar 2025 00:02:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VMlrPjHryYXCDBuL/B13DPHHJvtj6aCEqYuTqDbxwOB/KhNoN/9gxM3tn3j1Tv6Sb128gL/wdt7r2BhxT0IsY0lkdX6YdiRDIhcEmTAjn66fiJTIKCKezKl+SGEfXGLD+Gcf2QQc3Hq1LWm8U6WN7QwEC4Yez1CV38zw3Ikaw29snDPlHFaz8qHbjGFsD1zs+zBL1gawqCuC3avM/s8Liz8YtZ/3+REfJBALp6HX+Yew0AaijE76595+jwzf31/laWlDparJo+AmnosyNKED9Jk3MAszapmp9cyh9YuNTzms7wU936SyYK1ObaO65ZFB1C/jjuPcCiIjta17aNL9oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jBAb8hViE82PYRz6y9y+LrP5PqYgQ98nunTlr/xfxkA=;
 b=JsLG+dkQYM85sAeeGzY5SGRQF0z7HaTk9RNDJ94X4L/jKe2Y7cJ6V4G+pKyAIQHOZX87+CZWxjK2PPFszua98BRqmb/jG7x0b0mTSac9bMsptnhyTeyOTl6zix0IqPq42KUPI7PkCup8DBA4rNJWZ9RyZwGzWRKbiQ/pppta2j1P6/PTijM0hgzSaoOdH2/pkyBpMiNFlZ+QbYqZl9c3v9NeiezMQaR68v2YZcP9Zr83M57sb/oafTv8UsLYnwJuuuvHCqUkclG7/bgjG+zxaybuUgBnHdj6OhHUHKj+sz171RyoZXU6gUKfxtVhiTWCYuRq3G5TA0AFTgFq0BflOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SN7PR11MB6972.namprd11.prod.outlook.com (2603:10b6:806:2ac::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.20; Fri, 7 Mar
 2025 08:02:21 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8511.017; Fri, 7 Mar 2025
 08:02:21 +0000
Date: Fri, 7 Mar 2025 02:02:15 -0600
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
Subject: [PULL] drm-xe-next
Message-ID: <ilc5jvtyaoyi6woyhght5a6sw5jcluiojjueorcyxbynrcpcjp@mw2mi6rd6a7l>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4P222CA0025.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::30) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SN7PR11MB6972:EE_
X-MS-Office365-Filtering-Correlation-Id: d376c0f4-8c09-4def-1b5c-08dd5d4e6387
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?6dcyxXbduL3qKRGPYJjixTgCLKJM/qVeNqfUKyu+yN9PzENK5LkZTIp1vf?=
 =?iso-8859-1?Q?zkvHrBdFy1QWKiIcsdX45cDpTXtO1zP+yTXph3UuQU40ld3SeByE1rf2b0?=
 =?iso-8859-1?Q?pxwkFN4FLLTERMrBrHnyfR943m68kZwV/fVdrtSub5QjpnXIszPc7qV/zC?=
 =?iso-8859-1?Q?eF182VOPw0TVSfn4/E+xuppcGfQI39YTxMV6c5NGaXRD37SUig+D+11jj/?=
 =?iso-8859-1?Q?5TRkMdfcgl2mhnSMGycQneT6FZa4ljwkz5MP2HTvRpAkAhgqZEJHeOZKpj?=
 =?iso-8859-1?Q?DRCjGPkqTEq/SgAWTh07PtpyFL1Y6eeNAl/ZGcd6rm8vUf6a/SaGxdN3Gs?=
 =?iso-8859-1?Q?OkozXQyMjVHpNEMkxHcT0Lz3jBdBlNdCYFqaDftYqSFHPPKlIyU1x50pWW?=
 =?iso-8859-1?Q?pZL4sw3kdT7E7iHLyx595W8moLsk5nJmOJdghRUZ5EIy08JrGtdyLzwofX?=
 =?iso-8859-1?Q?drCA98V/clhDBxhZZFBYATAxyqhyoWug4c9Rb720gllqZUzaREZ/W/OqXI?=
 =?iso-8859-1?Q?0r7rNBAohDWVNJCxYyzwcxKC52klCu3UDbxq8IjWaTCFH8UiuOeUn6WDCa?=
 =?iso-8859-1?Q?Uu35pPiqGXrdPznppjPuqAE/A8nGnGNhb56l01+8Wi7wEPOSaLAAJ3TEeC?=
 =?iso-8859-1?Q?NYQqMtguNnpI6sDOEWZ/k4riPDi6STi8HvyWk4eexti7JA3lcKdmQ+V6B/?=
 =?iso-8859-1?Q?RZFssHgIeb7B4rhY1u6EFeh8bIuEIpO82G+xnlDZYdPAaB1ajW1Yend3Hc?=
 =?iso-8859-1?Q?s3gdHvx50h4v8SWTpSSkDhhk5rlGDMcoU86W9MFBvvzdqV5KKlXSkx5kku?=
 =?iso-8859-1?Q?XyZSPWkiZQnGTMPlRRlSoWxGZjuU4CN5bfDoNeZAX7VIrDR8b0Hm4fDUro?=
 =?iso-8859-1?Q?GuHJ/AfAyTwVVC1r6NMadRMVyTAVbQ+tpjqGbwm3lUzZAXx355qk4YsSYj?=
 =?iso-8859-1?Q?cC0lmnQ4Bb5CGo7gDL8cHY+kX6AmPUQAirzZxHQ2erpB49zTXzwMHs9LnA?=
 =?iso-8859-1?Q?0inQWZk7ZNsP2S6MZZ3GOQmDCciBYSGgaZNub5hXYuuhaYYplPadHQNQZp?=
 =?iso-8859-1?Q?idQx/Jfc5MyYDTU/fm/dLkv64PquO+W6Ptr6Vd2/f4h9TBP83cWoqHhihP?=
 =?iso-8859-1?Q?9LiqEDiVJps+gUeauKiCW8NLYNM7s4/i5l0BkUobOATd+TU3Ifi1PW6z9T?=
 =?iso-8859-1?Q?ua6X8ulzaRe+ac0aM9Zcdwhr4Hhw3rKSNMlKfwppDAeZMr2ocUO1tmj+Y3?=
 =?iso-8859-1?Q?Njj+j1DXtatITeC3ayDBJL/bo0DfcxCpaZMnWLz2aeOev5lZxbYdHva/ei?=
 =?iso-8859-1?Q?b37MnSNnmieHGxgOHQVcJEOrxWgtHaOeckPbgug5xExbDzp2dB8rLOJP4m?=
 =?iso-8859-1?Q?z97CXIEtK8XcTdnYgrMPXkooco0DzupA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?acC16rYrQAgvC6i3LExu9SlqCkYWMJusrkzF6NUqP6sSI2/DO/hDAaeMyn?=
 =?iso-8859-1?Q?QsocxWeKn5Wxgxf/wUZuDdJaTMyg+9oWn001udCVSONIcvQZEGxZI4ZdOc?=
 =?iso-8859-1?Q?jmvbR6YP6HAcsnCKT9ywIH6SFKV5E5gpZgoP/qNRvBNJAr7buM8brZPOyM?=
 =?iso-8859-1?Q?v5HPVSQ1TNRf+RK3prufB5sKsaAZG8mOJXfbsZSWnH2DEoe+XWbr8xc9ZN?=
 =?iso-8859-1?Q?bdP87bLN+YCaLZHxAf+m1rfkViDWeR12iTCsq9lRIV5BHedHA5yX5lpS7R?=
 =?iso-8859-1?Q?P9u/ZR7Pskl1r8Pk2pWGA6UtFlp1y593wcAQkjzSFpGJOytqEBikXY9e7M?=
 =?iso-8859-1?Q?6pnBMT6AP73kWcv+IqcmesHvpL3oHLlH8l+S/cOKOytOeGxwA9rkd/olMO?=
 =?iso-8859-1?Q?AYOtajX5GSvPE4eHD6cbFmfLmIHm2aunslmp9mS6fzmUPpb5XzAG6wrKlg?=
 =?iso-8859-1?Q?f7SUDuisZPalclRmOwDXFtENGXoCAGZZsvcdXFxRghecyZr7Pxi1DbUWfG?=
 =?iso-8859-1?Q?lSv3dveMVPCxhFFqRIcfyR2XngjQFhUalVdQWw/0KLdBK1zhaKXhYNS9cE?=
 =?iso-8859-1?Q?xR6ee1UhoPcBicS7TLNzYFT/0PiODPx3EuHpZeH+YK6234uBI4b/IguaAK?=
 =?iso-8859-1?Q?yQXjFxfdLiQDu2haK+WvL8ftQimlaZXV5UQQYF9ZxW+kYcXhkHqTDoO4Qk?=
 =?iso-8859-1?Q?56gM+z5+dDF+JrlQ/P2uw84zch3DBZLWirUz5VzDso9Ojb8hknLN/kuCcx?=
 =?iso-8859-1?Q?/ecIiYOx+pSfXWb8ACsMdk+wQlNJtFxH/Kg0dGSTHi2oFCvz12DhZJofrA?=
 =?iso-8859-1?Q?tY3sTS5mPrkxYKiHOYXk/3M32jWBv27XbkCFiMDzJsa1u35Ycj8cssjRwF?=
 =?iso-8859-1?Q?7QylL3QRN9rswGvsKNIv9advHNaheyl2YxUyx1Tg6VEobrXHLxGUzqvT5N?=
 =?iso-8859-1?Q?lKZd+cGmD1C82R8U0NTokbrcVHAFsnkK4UMVbsR4ZHibqMuiZ/x9lXPl60?=
 =?iso-8859-1?Q?HbgDa7MAgveVY4qPGz5LXCHj4rbpbaC3f+4su5rAS3PZCEKwq6FU+aE2p7?=
 =?iso-8859-1?Q?vctLC2OJu+CUnutEwTtpixVaPCoKFuPZcNHzK6CTr/V9l0qVZ8DtlUJRGg?=
 =?iso-8859-1?Q?Z1bNdN4JpfVhzA7qIEfmTXDbMTn2Fw2fW0b+P6S8oK2gac0EERkrl+ztUT?=
 =?iso-8859-1?Q?/xkk42SuXq8nma00T+Nv8C30xugPGKRPebl0K3ERmOcIDzsZXkkSakqHCj?=
 =?iso-8859-1?Q?/UPdU48njsen2j1l9/ezlQPsGmlX2WRK8WAhAFlr6pxgZbLiAtR3Mlrsrv?=
 =?iso-8859-1?Q?KoBASiRJv+vLc9O2tUbs9trSlyD3VBdoVslSAp6/o5P6uDnHlVjXJSc3rs?=
 =?iso-8859-1?Q?qPSBW6tMvTvdaQOhXMLkuvnMOmXMjs/W4sd3WDToyHSzDXaSWgzWNfrGXC?=
 =?iso-8859-1?Q?Mzvsdk123KmkO5Tb6H0DK2dY82VWendzhE8MvxL39d2lDtn83/ckl+Ivrn?=
 =?iso-8859-1?Q?5wSvmoBwX5L/SO/zshjleninn1xzV4bOG+oL7sT7PsRmrQM+WUYvYQ27BK?=
 =?iso-8859-1?Q?UmmZNsiUnil2YeGk5KaeY6xcafouTBYZyWQ7Mwk046LKGJgMXtLaKb820b?=
 =?iso-8859-1?Q?GSsGVImlyX8V2mG0RJSntQ0N4gauEfc/lq5XdMzDqYO5Vi6FalnA4csQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d376c0f4-8c09-4def-1b5c-08dd5d4e6387
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2025 08:02:21.6852 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LJN7rTedbTFWS7oY7ODgtKywEgYrV7vdnyIpS3f6nnmWRHAFhStIJVJYw5A3/DUdpgAwyxjllk16lIhCBNkWkiRAssD08S7Oxki5oGdVpPs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6972
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

Last drm-xe-next pull request for 6.15. It comes with some big features
that we have been working on for some time: EU stall sampling and SVM.
The latter also touches other subsystems and provides the common parts
in the drm layer. Low latency hints from userspace to improve some
workloads and more events exposed via perf complete the UAPI changes
for this cycle.

Another cross-subsystem change is to drivers/base to improve devres
handling. Fixes, workarounds and refactors also made their appearance as
usual.

Worth noting 2 conflicts reported by Stephen on linux-next. One is a git
conflict and the other is on build:
https://lore.kernel.org/intel-xe/20250307122954.1ab65809@canb.auug.org.au/
and https://lore.kernel.org/intel-xe/20250307132112.18b6ce90@canb.auug.org.au/

These will probably show up when Linus merges drm. I checked the fixes
on linux-next by Stephen and they look good to me.

thanks
Lucas De Marchi


drm-xe-next-2025-03-07:
UAPI Changes:
  - Expose per-engine activity via perf pmu (Riana, Lucas, Umesh)
  - Add support for EU stall sampling (Harish, Ashutosh)
  - Allow userspace to provide low latency hint for submission (Tejas)
  - GPU SVM and Xe SVM implementation (Matthew Brost)

Cross-subsystem Changes:
  - devres handling for component drivers (Lucas)
  - Backmege drm-next to allow cross dependent change with i915
  - GPU SVM and Xe SVM implementation (Matthew Brost)

Core Changes:

Driver Changes:
  - Fixes to userptr and missing validations (Matthew Auld, Thomas
    Hellström, Matthew Brost)
  - devcoredump typos and error handling improvement (Shuicheng)
  - Allow oa_exponent value of 0 (Umesh)
  - Finish moving device probe to devm (Lucas)
  - Fix race between submission restart and scheduled being freed (Tejas)
  - Fix counter overflows in gt_stats (Francois)
  - Refactor and add missing workarounds and tunings for pre-Xe2 platforms
    (Aradhya, Tvrtko)
  - Fix PXP locks interaction with exec queues being killed (Daniele)
  - Eliminate TIMESTAMP_OVERRIDE from xe (Matt Roper)
  - Change xe_gen_wa_oob to allow building on MacOS (Daniel Gomez)
  - New workarounds for Panther Lake (Tejas)
  - Fix VF resume errors (Satyanarayana)
  - Fix workaround infra skipping some workarounds dependent on engine
    initialization (Tvrtko)
  - Improve per-IP descriptors (Gustavo)
  - Add more error injections to probe sequence (Francois)
The following changes since commit 33e26f3544a558e7476eb221ff33173759b3a116:

   Merge tag 'drm-xe-next-2025-02-24' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-next (2025-02-27 10:08:29 +1000)

are available in the Git repository at:

   https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-next-2025-03-07

for you to fetch changes up to 45f5a1efac90214d9593afb0a900a2c73e1fc95b:

   drm/doc: gpusvm: Add GPU SVM documentation (2025-03-06 11:38:21 -0800)

----------------------------------------------------------------
UAPI Changes:
  - Expose per-engine activity via perf pmu (Riana, Lucas, Umesh)
  - Add support for EU stall sampling (Harish, Ashutosh)
  - Allow userspace to provide low latency hint for submission (Tejas)
  - GPU SVM and Xe SVM implementation (Matthew Brost)

Cross-subsystem Changes:
  - devres handling for component drivers (Lucas)
  - Backmege drm-next to allow cross dependent change with i915
  - GPU SVM and Xe SVM implementation (Matthew Brost)

Core Changes:

Driver Changes:
  - Fixes to userptr and missing validations (Matthew Auld, Thomas
    Hellström, Matthew Brost)
  - devcoredump typos and error handling improvement (Shuicheng)
  - Allow oa_exponent value of 0 (Umesh)
  - Finish moving device probe to devm (Lucas)
  - Fix race between submission restart and scheduled being freed (Tejas)
  - Fix counter overflows in gt_stats (Francois)
  - Refactor and add missing workarounds and tunings for pre-Xe2 platforms
    (Aradhya, Tvrtko)
  - Fix PXP locks interaction with exec queues being killed (Daniele)
  - Eliminate TIMESTAMP_OVERRIDE from xe (Matt Roper)
  - Change xe_gen_wa_oob to allow building on MacOS (Daniel Gomez)
  - New workarounds for Panther Lake (Tejas)
  - Fix VF resume errors (Satyanarayana)
  - Fix workaround infra skipping some workarounds dependent on engine
    initialization (Tvrtko)
  - Improve per-IP descriptors (Gustavo)
  - Add more error injections to probe sequence (Francois)

----------------------------------------------------------------
Aradhya Bhatia (2):
       drm/xe: Add Wa_16021333562 and Wa_14016712196
       drm/xe/oa: Refactor WAs to use XE_WA() macro

Colin Ian King (1):
       drm/xe: Fix uninitialized pointer def

Daniel Gomez (1):
       drm/xe: xe_gen_wa_oob: replace program_invocation_short_name

Daniele Ceraolo Spurio (1):
       drm/xe/pxp: Don't kill queues while holding PXP locks

Francois Dugast (3):
       drm/xe/gt_stats: Use atomic64_t for counters
       drm/xe/gt_pagefault: Change vma_pagefault unit to kilobyte
       drm/xe: Allow fault injection in exec queue IOCTLs

Gustavo Sousa (7):
       drm/xe: Set IP names in functions handling IP version
       drm/xe: Disambiguate GMDID-based IP names
       drm/xe: Rename gmdid_map to xe_ip
       drm/xe: Define xe_ip instances before xe_device_desc
       drm/xe: Convert pre-GMDID IPs to struct xe_ip
       drm/xe: Re-use feature descriptors for pre-GMDID IPs
       drm/xe: Simplify setting release info in xe->info

Harish Chegondi (8):
       drm/xe/topology: Add a function to find the index of the last enabled DSS in a mask
       drm/xe/uapi: Introduce API for EU stall sampling
       drm/xe/eustall: Add support to init, enable and disable EU stall sampling
       drm/xe/eustall: Add support to read() and poll() EU stall data
       drm/xe/eustall: Add support to handle dropped EU stall data
       drm/xe/eustall: Add EU stall sampling support for Xe2
       drm/xe/uapi: Add a device query to get EU stall sampling information
       drm/xe/eustall: Add workaround 22016596838 which applies to PVC.

Lucas De Marchi (12):
       drivers: base: devres: Allow to release group on device release
       drivers: base: devres: Fix find_group() documentation
       drivers: base: component: Add debug message for unbind
       drm/xe: Stop setting drvdata to NULL
       drm/xe: Switch from xe to devm actions
       drm/xe: Drop remove callback support
       drm/xe/display: Drop xe_display_driver_remove()
       drm/xe: Move survivability entirely to xe_pci
       drm/xe: Stop ignoring errors from xe_heci_gsc_init()
       drm/xe: Rename update_device_info() after sriov
       drm/xe: Stop ignoring errors from xe_ttm_sys_mgr_init()
       Merge drm/drm-next into drm-xe-next

Matt Roper (1):
       drm/xe: Eliminate usage of TIMESTAMP_OVERRIDE

Matthew Auld (4):
       drm/xe/userptr: restore invalidation list on error
       drm/xe/userptr: fix EFAULT handling
       drm/xe/userptr: remove tmp_evict list
       drm/xe/userptr: properly setup pfn_flags_mask

Matthew Brost (29):
       drm/xe: Add staging tree for VM binds
       drm/xe: Retry BO allocation
       mm/migrate: Add migrate_device_pfns
       mm/migrate: Trylock device page in do_swap_page
       drm/gpusvm: Add support for GPU Shared Virtual Memory
       drm/xe: Select DRM_GPUSVM Kconfig
       drm/xe/uapi: Add DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR
       drm/xe: Add SVM init / close / fini to faulting VMs
       drm/xe: Nuke VM's mapping upon close
       drm/xe: Add SVM range invalidation and page fault
       drm/gpuvm: Add DRM_GPUVA_OP_DRIVER
       drm/xe: Add (re)bind to SVM page fault handler
       drm/xe: Add SVM garbage collector
       drm/xe: Add unbind to SVM garbage collector
       drm/xe: Do not allow CPU address mirror VMA unbind if
       drm/xe: Enable CPU address mirror uAPI
       drm/xe/uapi: Add DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR
       drm/xe: Add migrate layer functions for SVM support
       drm/xe: Add SVM device memory mirroring
       drm/xe: Add drm_gpusvm_devmem to xe_bo
       drm/xe: Add GPUSVM device memory copy vfunc functions
       drm/xe: Add Xe SVM populate_devmem_pfn GPU SVM vfunc
       drm/xe: Add Xe SVM devmem_release GPU SVM vfunc
       drm/xe: Add SVM VRAM migration
       drm/xe: Basic SVM BO eviction
       drm/xe: Add SVM debug
       drm/xe: Add modparam for SVM notifier size
       drm/xe: Add always_migrate_to_vram modparam
       drm/doc: gpusvm: Add GPU SVM documentation

Mingcong Bai (1):
       drm/xe/regs: remove a duplicate definition for RING_CTL_SIZE(size)

Riana Tauro (5):
       drm/xe: Add engine activity support
       drm/xe/trace: Add trace for engine activity
       drm/xe/guc: Expose engine activity only for supported GuC version
       drm/xe/xe_pmu: Add PMU support for engine activity
       drm/xe/xe_pmu: Acquire forcewake on event init for engine events

Satyanarayana K V P (2):
       drm/xe/pf: Create a link between PF and VF devices
       drm/xe/vf: Retry sending MMIO request to GUC on timeout error

Shuicheng Lin (2):
       drm/xe/devcoredump: Fix print typo of offset
       drm/xe/devcoredump: Remove IS_ERR_OR_NULL check for kzalloc

Tejas Upadhyay (3):
       drm/xe: cancel pending job timer before freeing scheduler
       drm/xe/xe3lpg: Add Wa_13012615864
       drm/xe/uapi: Use hint for guc to set GT frequency

Thomas Hellström (10):
       drm/xe/vm: Validate userptr during gpu vma prefetching
       drm/xe/vm: Fix a misplaced #endif
       drm/xe: Fix fault mode invalidation with unbind
       drm/xe/hmm: Style- and include fixes
       drm/xe/hmm: Don't dereference struct page pointers without notifier lock
       drm/xe/userptr: Unmap userptrs in the mmu notifier
       drm/pagemap: Add DRM pagemap
       drm/xe/bo: Introduce xe_bo_put_async
       drm/xe: Add dma_addr res cursor
       drm/xe: Add drm_pagemap ops to SVM

Tvrtko Ursulin (5):
       drm/xe: Fix GT "for each engine" workarounds
       drm/xe/xelp: Move Wa_16011163337 from tunings to workarounds
       drm/xe/xelp: Add Wa_1604555607
       drm/xe/xelp: L3 recommended hashing mask
       drm/xe: Add performance tunings to debugfs

Umesh Nerlige Ramappa (1):
       drm/xe/oa: Allow oa_exponent value of 0

  Documentation/gpu/rfc/gpusvm.rst                  |  107 +
  Documentation/gpu/rfc/index.rst                   |    4 +
  drivers/base/component.c                          |    3 +
  drivers/base/devres.c                             |   12 +-
  drivers/gpu/drm/Kconfig                           |    9 +
  drivers/gpu/drm/Makefile                          |    1 +
  drivers/gpu/drm/drm_gpusvm.c                      | 2236 +++++++++++++++++++++
  drivers/gpu/drm/xe/Kconfig                        |   10 +
  drivers/gpu/drm/xe/Makefile                       |    3 +
  drivers/gpu/drm/xe/abi/guc_actions_abi.h          |    1 +
  drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h     |    3 +
  drivers/gpu/drm/xe/display/xe_display.c           |   13 +-
  drivers/gpu/drm/xe/display/xe_display.h           |    1 -
  drivers/gpu/drm/xe/regs/xe_engine_regs.h          |    1 -
  drivers/gpu/drm/xe/regs/xe_eu_stall_regs.h        |   29 +
  drivers/gpu/drm/xe/regs/xe_gt_regs.h              |    7 +-
  drivers/gpu/drm/xe/regs/xe_regs.h                 |    4 -
  drivers/gpu/drm/xe/tests/xe_pci.c                 |   26 +-
  drivers/gpu/drm/xe/xe_bo.c                        |   54 +
  drivers/gpu/drm/xe/xe_bo.h                        |   20 +
  drivers/gpu/drm/xe/xe_bo_types.h                  |    4 +
  drivers/gpu/drm/xe/xe_devcoredump.c               |    8 +-
  drivers/gpu/drm/xe/xe_device.c                    |  101 +-
  drivers/gpu/drm/xe/xe_device.h                    |    3 -
  drivers/gpu/drm/xe/xe_device_sysfs.c              |    6 -
  drivers/gpu/drm/xe/xe_device_types.h              |   36 +-
  drivers/gpu/drm/xe/xe_eu_stall.c                  |  960 +++++++++
  drivers/gpu/drm/xe/xe_eu_stall.h                  |   24 +
  drivers/gpu/drm/xe/xe_exec_queue.c                |   11 +-
  drivers/gpu/drm/xe/xe_exec_queue_types.h          |    2 +
  drivers/gpu/drm/xe/xe_gen_wa_oob.c                |    6 +-
  drivers/gpu/drm/xe/xe_gsc_proxy.c                 |    2 +-
  drivers/gpu/drm/xe/xe_gt.c                        |   13 +-
  drivers/gpu/drm/xe/xe_gt_clock.c                  |   53 +-
  drivers/gpu/drm/xe/xe_gt_debugfs.c                |   11 +
  drivers/gpu/drm/xe/xe_gt_pagefault.c              |   20 +-
  drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c       |    5 -
  drivers/gpu/drm/xe/xe_gt_sriov_vf.c               |    9 +-
  drivers/gpu/drm/xe/xe_gt_stats.c                  |    8 +-
  drivers/gpu/drm/xe/xe_gt_stats_types.h            |    2 +-
  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c       |   22 +
  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h       |    2 +
  drivers/gpu/drm/xe/xe_gt_topology.h               |   13 +
  drivers/gpu/drm/xe/xe_gt_types.h                  |   15 +-
  drivers/gpu/drm/xe/xe_guc.c                       |    5 +
  drivers/gpu/drm/xe/xe_guc_ads.c                   |    2 +-
  drivers/gpu/drm/xe/xe_guc_engine_activity.c       |  373 ++++
  drivers/gpu/drm/xe/xe_guc_engine_activity.h       |   19 +
  drivers/gpu/drm/xe/xe_guc_engine_activity_types.h |   92 +
  drivers/gpu/drm/xe/xe_guc_fwif.h                  |   19 +
  drivers/gpu/drm/xe/xe_guc_pc.c                    |   16 +
  drivers/gpu/drm/xe/xe_guc_submit.c                |   10 +
  drivers/gpu/drm/xe/xe_guc_types.h                 |    4 +
  drivers/gpu/drm/xe/xe_heci_gsc.c                  |   39 +-
  drivers/gpu/drm/xe/xe_heci_gsc.h                  |    3 +-
  drivers/gpu/drm/xe/xe_hmm.c                       |  194 +-
  drivers/gpu/drm/xe/xe_hmm.h                       |    7 +
  drivers/gpu/drm/xe/xe_hw_engine_group.c           |    1 +
  drivers/gpu/drm/xe/xe_migrate.c                   |  175 ++
  drivers/gpu/drm/xe/xe_migrate.h                   |   10 +
  drivers/gpu/drm/xe/xe_module.c                    |    7 +
  drivers/gpu/drm/xe/xe_module.h                    |    2 +
  drivers/gpu/drm/xe/xe_oa.c                        |   35 +-
  drivers/gpu/drm/xe/xe_observation.c               |   14 +
  drivers/gpu/drm/xe/xe_pci.c                       |  245 +--
  drivers/gpu/drm/xe/xe_pci_sriov.c                 |   51 +
  drivers/gpu/drm/xe/xe_pci_types.h                 |   15 +-
  drivers/gpu/drm/xe/xe_pmu.c                       |  175 +-
  drivers/gpu/drm/xe/xe_pt.c                        |  495 ++++-
  drivers/gpu/drm/xe/xe_pt.h                        |    5 +
  drivers/gpu/drm/xe/xe_pt_types.h                  |    2 +
  drivers/gpu/drm/xe/xe_pt_walk.c                   |    3 +-
  drivers/gpu/drm/xe/xe_pt_walk.h                   |    4 +
  drivers/gpu/drm/xe/xe_pxp.c                       |   90 +-
  drivers/gpu/drm/xe/xe_query.c                     |   50 +-
  drivers/gpu/drm/xe/xe_res_cursor.h                |  123 +-
  drivers/gpu/drm/xe/xe_ring_ops.c                  |    4 +
  drivers/gpu/drm/xe/xe_survivability_mode.c        |   77 +-
  drivers/gpu/drm/xe/xe_survivability_mode.h        |    5 +-
  drivers/gpu/drm/xe/xe_svm.c                       |  946 +++++++++
  drivers/gpu/drm/xe/xe_svm.h                       |  150 ++
  drivers/gpu/drm/xe/xe_tile.c                      |    5 +
  drivers/gpu/drm/xe/xe_trace.h                     |   30 +
  drivers/gpu/drm/xe/xe_trace_guc.h                 |   49 +
  drivers/gpu/drm/xe/xe_tuning.c                    |   72 +-
  drivers/gpu/drm/xe/xe_tuning.h                    |    3 +
  drivers/gpu/drm/xe/xe_uc.c                        |    3 +
  drivers/gpu/drm/xe/xe_vm.c                        |  521 ++++-
  drivers/gpu/drm/xe/xe_vm.h                        |   25 +-
  drivers/gpu/drm/xe/xe_vm_types.h                  |   65 +-
  drivers/gpu/drm/xe/xe_wa.c                        |   19 +
  drivers/gpu/drm/xe/xe_wa_oob.rules                |   10 +
  include/drm/drm_gpusvm.h                          |  509 +++++
  include/drm/drm_gpuvm.h                           |    5 +
  include/drm/drm_pagemap.h                         |  107 +
  include/linux/migrate.h                           |    1 +
  include/uapi/drm/xe_drm.h                         |  117 +-
  mm/memory.c                                       |   13 +-
  mm/migrate_device.c                               |  120 +-
  99 files changed, 8220 insertions(+), 801 deletions(-)
  create mode 100644 Documentation/gpu/rfc/gpusvm.rst
  create mode 100644 drivers/gpu/drm/drm_gpusvm.c
  create mode 100644 drivers/gpu/drm/xe/regs/xe_eu_stall_regs.h
  create mode 100644 drivers/gpu/drm/xe/xe_eu_stall.c
  create mode 100644 drivers/gpu/drm/xe/xe_eu_stall.h
  create mode 100644 drivers/gpu/drm/xe/xe_guc_engine_activity.c
  create mode 100644 drivers/gpu/drm/xe/xe_guc_engine_activity.h
  create mode 100644 drivers/gpu/drm/xe/xe_guc_engine_activity_types.h
  create mode 100644 drivers/gpu/drm/xe/xe_svm.c
  create mode 100644 drivers/gpu/drm/xe/xe_svm.h
  create mode 100644 include/drm/drm_gpusvm.h
  create mode 100644 include/drm/drm_pagemap.h
