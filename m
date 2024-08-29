Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA629647C9
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 16:17:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2579810E1A5;
	Thu, 29 Aug 2024 14:17:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J7RdZiAV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1E2210E03F;
 Thu, 29 Aug 2024 14:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724941029; x=1756477029;
 h=date:from:to:cc:subject:message-id:
 content-transfer-encoding:mime-version;
 bh=Z7kd1w+GkITtiBDTuq5GZXCAVaG1/EwXtDhgDZ5CVvU=;
 b=J7RdZiAVYj6OtwC6Vu3p4dWsH8fEkXYEJg2ouP90i2t+MHIjElZR+3dk
 enMPo0PFqkGJeo+sRdWQwBLNkzxXhF2r6BJ1dpPiymWIdLFElc4kHEmWa
 auz38cDpFHUkSC1l2ZOO79i5R1hxvBl9NOfol/Ntx7zJS5HkkLQlsk7Jy
 a3mw8L6dP8WcC2vU4P7MbypN2nA4hEAVwV+xJDZhtXPMGslKtxNLvcrYA
 H1do1M3Bv6EvGlnc0V4jDFTTUTJAGei1//5/SXjInYMd9bx5yS5YAcfOZ
 Z3S/UxZitQUEPf1eYVEAX03fdFx5gPpbzx6egvUccJlFegIcacY7Urien A==;
X-CSE-ConnectionGUID: gkIEIAzuQduhW4SFAnTb2A==
X-CSE-MsgGUID: cFREmVQYSDGN0FrtVurSyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="34940430"
X-IronPort-AV: E=Sophos;i="6.10,185,1719903600"; d="scan'208";a="34940430"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2024 07:17:08 -0700
X-CSE-ConnectionGUID: DPSPKQu9TCGrWYwkWMGlGQ==
X-CSE-MsgGUID: mVAGZyVtSequApW2NdRYdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,185,1719903600"; d="scan'208";a="68370134"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Aug 2024 07:17:08 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 29 Aug 2024 07:17:07 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 29 Aug 2024 07:17:06 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.177)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 29 Aug 2024 07:17:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g6lDeqcTHhwYD4A/84MtZ/EVxT1yDDmtw+tFuZftH7Rt7WjzUm+75+PBmHAqvVbYNOCZCTil5+X4ZIsszrH0gxahETq4g1126aUvrKR+JyDC0rAEYGjr6KQ/dMIBUHqNbacMPP/jWh8tLQiCZnlt4zr60OsjJM6SWhQP09AKZOEzQjMr1iNqYg0euaGUwjBcKro42xWGohCu99SLEjlnhEt5GwKMWZEukSHDsthi14TeaMiMxqcKYfFmphU47Df/SU7wwiS9sMhgbPByI4dpKGJ3pZ9bhdGvmdcCQFySOrZhy1XrTFwwLMpSQia10C+xAO15cmgcdbux9pLka8vBOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wOrHG2YZ/zCifizbcwa0GIapDbSAx9m5J09dfdQ0sc8=;
 b=OWPObAQ5ud6bSFEohBjVhy/0j1oIM+nS2IHtpDCOfzMLtrPoP3oeBTCAtW6DWeoac8jamf+BV/Kwi+iPfHWnR2ln3a8TvzuTcvMZ2B79IYE9dtt158nEUfB8xcKFFnDe5rcZZQspP0u8GWljedXhYfLjQrZSF3o6c83zbzQpYcYNZZCYhuoHUNFne0ueYvotIPLMoCUXIJZgyFP9bIhHFlUBISgkTZdmsqHt8/FVJGOg51Xym38/wxoxYM3qaKrtvjn7yr6+Nyyd2lhCYAlJUyOWEkm3IUxi4wE12Fdd1EM1lI5z3mOkigDizLhzk6eROH8T2suCG+X7LZJsQEvIEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by MW3PR11MB4553.namprd11.prod.outlook.com (2603:10b6:303:2c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.28; Thu, 29 Aug
 2024 14:16:59 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7897.014; Thu, 29 Aug 2024
 14:16:56 +0000
Date: Thu, 29 Aug 2024 10:16:50 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Oded Gabbay <ogabbay@kernel.org>, "Lucas
 De Marchi" <lucas.demarchi@intel.com>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dim-tools@lists.freedesktop.org>
Subject: [PULL] drm-intel-next
Message-ID: <ZtCC0lJ0Zf3MoSdW@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0387.namprd04.prod.outlook.com
 (2603:10b6:303:81::32) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|MW3PR11MB4553:EE_
X-MS-Office365-Filtering-Correlation-Id: a3acab90-b061-4f09-8586-08dcc8353cc4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?lkBB/9P1FClPah2swHfyiIwCIXUaud4iqFY5Fhi9hZZL8uXvqPlqfkQ6CV?=
 =?iso-8859-1?Q?q56J0Wq6md9gxiTyf5PCZqhFYNuQhYbsCRiot1JjawDeh2MCESDUr0/qoB?=
 =?iso-8859-1?Q?jOamC+2nmPAlK2OTnlnaDRCUtPzMGOM4Kthgo7Nbr3SdrAXGmvraAMd9Q5?=
 =?iso-8859-1?Q?eNZBk+2C6sUY7i2/MY2m0YpD4qMVAuMELP8DA7dY+NPMCy5C6euxqFKS9x?=
 =?iso-8859-1?Q?/xvmX4t1TlO3Kfz5nzppvVP5706PmKkx7Nu851hpiO/YQTUOiwRTfE13ZR?=
 =?iso-8859-1?Q?ilLAsJW/1G9AvAyEhslqjKf29eh+YqS7bY+wcv4PYNFvjYVscyt/83x70D?=
 =?iso-8859-1?Q?IV39/ybaKCExGyF01GObf7U3ZJ5g5YceIiulFGkKELHvgNi2L5pazgUVuo?=
 =?iso-8859-1?Q?X48e3cPZwMa/XIAhskyICbVF5i8sGkbtYN/WYgk3wmpzftZo57RB7Tetz8?=
 =?iso-8859-1?Q?gN/AeDY11vgbqS3I/CNjc+aYIR8eJY7qRMT5q3iXLv9QKSSXvdINp9ctKE?=
 =?iso-8859-1?Q?BpYaiqfqk0Lzk7gxbyWIc+VnSaa/aaKYgcYgor8M4b6XXrgIQAnRyNyG4i?=
 =?iso-8859-1?Q?rcponr7mMsNtTcNvFoywLR7JxTm6NNjsvkv/MflaDyhpfUUd0e8Ksh3iqP?=
 =?iso-8859-1?Q?HuwbUzS3WI4uqNoKfb9gJHtFmEwQn8Jq4l48b+Sr3aJamvbVaJUj4bFkor?=
 =?iso-8859-1?Q?Xe6xTB4AXhGECz2BgChUhgf/fcG8WgyZy8AngDbFl/HY2nphm4tsd8HW+H?=
 =?iso-8859-1?Q?DqH6zs7sPlWIB/oOJ2I9GHJvf8h/E19VHgfNsfl94EoE9bDDUeHF9tgC2K?=
 =?iso-8859-1?Q?R0JaQRnoPBDZjtW+FHaEEuFmHejOMFLr/UUbSL5GJi2r4AVwWAjOVEmxJG?=
 =?iso-8859-1?Q?4a36zZ2Oo2ytJwotfuTF7akwg8nEVuB2nEBiMWcWRpJRUaldBMSVfsJM/e?=
 =?iso-8859-1?Q?2h0/oT56S2OdndNF5QRth90M4HlHzEgCLkeAQZz+8YxDXQSvBuVaR024ZX?=
 =?iso-8859-1?Q?xk4YX+xOL2pJA1fjO8qnN2Q+HYZbEqf/8gM2GASaATqejd8r2lEbNw2/X9?=
 =?iso-8859-1?Q?016EBr7HkmsDeABSm/XFQubYp6nm7R8DrVNxUvsrBPbyYAGOUMsB3NVH++?=
 =?iso-8859-1?Q?yHFeSVMFZ6mJO+tH/vLlh5SiTVVicQoA+autKThrFMkxkocb0C8nIR4/aA?=
 =?iso-8859-1?Q?Mvc70/p2VfULfBCY8ZhruKd9XC2XAYVx0vO7+qhw9RBl4vMkejoiQESRaa?=
 =?iso-8859-1?Q?pSNuisfPY2xbofsqHlOBRcv8U5wMNEoUc0011+7YG3Q6NntknpdFH7AK/1?=
 =?iso-8859-1?Q?STC/o5d2TLaAY/vV484W0ABGodTxP8qGbGo64h/F/1LNV5o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?wDi9G7nNuje3Lhnu07VPw4ZUyaK1vWPTgoHkEkhRR6Q/Cs1Q9lNIco5xj7?=
 =?iso-8859-1?Q?zKZkGTgwDwTbZPUq8IsR6aCKNn037LIxH5XN2+m7cCYCnWwu1PGbLMUmR+?=
 =?iso-8859-1?Q?1xGZgdwVps2tIIDGCwOgtzdG9UfBfvXwdPHKITD57KZLU3DLUdItywvmhO?=
 =?iso-8859-1?Q?ncUnEJIGxGNFJQizA1VKFhfYCwbYGzbF6N9mrKZKUbLrc1stjX2TcUgm2s?=
 =?iso-8859-1?Q?NINmpnoPp/xVmiXsVDARuiMo0/PI2geI7V3/Fa4myGdrAEyNuKgo/xEJx2?=
 =?iso-8859-1?Q?FMTYg8/jZhjF6X+zumwuEMz+DHI4vni1zr3PEHv7MEtzqTpd6d0aIO4BOB?=
 =?iso-8859-1?Q?BF6+UvpBJnNNIB5zQeAGHIK6XC2uxMggYFjyFpQ4Iem80LQ7n/9MfiWj00?=
 =?iso-8859-1?Q?xCjTP4qewYtNjssZwD17oQj9mCQq3yLJcJyAhQa5IGE8bPwfvTFPFjRgxG?=
 =?iso-8859-1?Q?Ub8NUloR1mqPFWWmoXxRR2QwfoWDkSNS5oGCR8vyfk/8cQvAt/7mkbqfO7?=
 =?iso-8859-1?Q?zTczJgrEwQajN/cCDfjMhudXkFunA0fH0EwBW/GTJnoHsWYeZBvnLZb2yQ?=
 =?iso-8859-1?Q?tRfeSrsvFyvX6fR/XMp08ndsaphz0MUzRYU3vlPpbGs/FLN1Ga0locnLYx?=
 =?iso-8859-1?Q?BfzY2X2WrPH2y4Wyt8/LFh2OboikDpHIj+CupwfxiQZ87klO6ZVePFg0ip?=
 =?iso-8859-1?Q?azNrkicJMN1sHnFDxx7ErhE+CgannKe/nNFLEHZ67YeHK8ExHTzIOwCNal?=
 =?iso-8859-1?Q?EhIg5QiwR084T5K8nu6hHTC4PrbKMMHETiaxFem9PuXTY3nl4h1RD3sb7y?=
 =?iso-8859-1?Q?TTYcfc5esNiarR1VhoGN8t6UPU5dvlUrE1rbLt+mKDS0uscXkWSn3CXQvw?=
 =?iso-8859-1?Q?Yd8zcoS1kKRQTNgx3WnLrscIbtUj4N5TGD22Duy6lhFzggLlTUgi78N+e0?=
 =?iso-8859-1?Q?41UpZL5i4lfd7LNE1Lpx/pMhGbF4Oal93dFfEk7m05JUF6D/PZ/q9btZQP?=
 =?iso-8859-1?Q?pFcYsiJeP4+cm2yosvaRziDTrYxsmg90DGMdlHkRgQUeiGv11JXZydPOJG?=
 =?iso-8859-1?Q?641ygjxs4cXAj4CmgVxA8ZMCGtYrVJU89h3d92XsCwELr2d5b+L716/YO0?=
 =?iso-8859-1?Q?TGz65ANrAdGu9mwiTo4TzTI+Bko52XWBJMT/tiJwuZm2WYQIFvl2O5ceGu?=
 =?iso-8859-1?Q?qI3SVJgASdGlEr1tn/wggmxhnwN2Az53EoQ0ymKH+xLN/F5pGi42abZkZG?=
 =?iso-8859-1?Q?VAfW/+nXxi23Ndve72lOlnHkHI0Y9X9XMUXtSj6Ex1eocQMuggfJWdvuSg?=
 =?iso-8859-1?Q?AZFDLLP2mFQ0HZRdO94bp9oZu9TrmEppKTHEVguXRBgVFPwhbbftFWIlcr?=
 =?iso-8859-1?Q?VwdF2vuiO4EAnrYsAmBvudhyA4shJ8KBvJh1faJAcwctqPWa2itNIzfJDY?=
 =?iso-8859-1?Q?c+ng27sW8idS9Y7KvT0Obg5i8aC0PG57l2bhnG805fPB8UleidYOgBaoYc?=
 =?iso-8859-1?Q?31HYi/24A9rs3VrDSThZHDWROnxwaT0GXgxR2LFRTNXvrZT5CrKjY5Aq3n?=
 =?iso-8859-1?Q?aApsH+PaEDw5q9UofJEUgaLqS47ekllD10DVFIm1ujRvhpoGsh2YL8Wkql?=
 =?iso-8859-1?Q?yXNb+xinniEpnLSD7e7EEHXenFZ/LJuolgeFy1htRwLJjvg3QYYQ4Oww?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a3acab90-b061-4f09-8586-08dcc8353cc4
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 14:16:56.1791 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uDKszWIemlUkIPv3f9i1qb13t9tpt53wAm6Q477aZpX0AtGDatXZ0EJmBH4RzGm6Z9leVi4DjD8tSfe/qV2qgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4553
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

Hi Sima and Dave,

Here goes our last PR of drm-intel-next towards 6.12.
Most of it is display related clean-up towards intel_display isolation.

But there are 2 cases that worth mention.

1. Xe core changes for BMG. BMG requires, by design, 64k memory size
alignment for scanout buffers using compression and 4-tile. So, we are
adding a protection here to block framebuffers that are not aligned
with that and that requires patches in both i915-display and xe core.
Without this protection, we get some screen corruptions. So we need
to propagate this along with the force_probe removal that Lucas sent
yesterday with drm-xe-next pull request.

2. Although Arrow Lake has pretty much same GT as Meteor Lake, it
requires a new GSC firmware or HuC authentication and buffer
protection might not work. So, we had to spin out ARL ids from MTL
and introduce this new firmware requirement. At this moment no
one should have HW with these IDs yet and we will propagate this
to stable as soon as it hits Linus tree.

Thanks,
Rodrigo.

drm-intel-next-2024-08-29:
Cross-driver (xe-core) Changes:
- Require BMG scanout buffers to be 64k physically aligned (Maarten)

Core (drm) Changes:
- Introducing Xe2 ccs modifiers for integrated and discrete graphics (Juha-Pekka)

Driver Changes:
- General cleanup and more work moving towards intel_display isolation (Jani)
- New display workaround (Suraj)
- Use correct cp_irq_count on HDCP (Suraj)
- eDP PSR fix when CRC is enabled (Jouni)
- Fix DP MST state after a sink reset (Imre)
- Fix Arrow Lake GSC firmware version (John)
- Use chained DSBs for LUT programming (Ville)
The following changes since commit e55ef65510a401862b902dc979441ea10ae25c61:

  Merge tag 'amd-drm-next-6.12-2024-08-26' of https://gitlab.freedesktop.org/agd5f/linux into drm-next (2024-08-27 14:33:12 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-next-2024-08-29

for you to fetch changes up to b5d4657e192ba7a3f21fc397cf5d169982b4ec0c:

  drm/i915/dsb: Use chained DSBs for LUT programming (2024-08-29 14:54:03 +0300)

----------------------------------------------------------------
Cross-driver (xe-core) Changes:
- Require BMG scanout buffers to be 64k physically aligned (Maarten)

Core (drm) Changes:
- Introducing Xe2 ccs modifiers for integrated and discrete graphics (Juha-Pekka)

Driver Changes:
- General cleanup and more work moving towards intel_display isolation (Jani)
- New display workaround (Suraj)
- Use correct cp_irq_count on HDCP (Suraj)
- eDP PSR fix when CRC is enabled (Jouni)
- Fix DP MST state after a sink reset (Imre)
- Fix Arrow Lake GSC firmware version (John)
- Use chained DSBs for LUT programming (Ville)

----------------------------------------------------------------
Hans de Goede (1):
      drm/i915/dsi: Make Lenovo Yoga Tab 3 X90F DMI match less strict

Imre Deak (1):
      drm/i915/dp_mst: Fix MST state after a sink reset

Jani Nikula (30):
      drm/i915: make __intel_display_power_is_enabled() static
      drm/i915/display: support struct intel_atomic_state in to_intel_display()
      drm/i915/display: convert intel_link_bw.c to struct intel_display
      drm/i915/display: convert intel_load_detect.c to struct intel_display
      drm/i915/alpm: convert to struct intel_display
      drm/i915/lspcon: convert to struct intel_display
      drm/i915/display: convert dp aux backlight to struct intel_display
      drm/i915/hti: convert to struct intel_display
      drm/i915: make intel_display_power_domain_str() static
      drm/i915: move rawclk from runtime to display runtime info
      drm/xe/display: drop unused rawclk_freq and RUNTIME_INFO()
      drm/xe/display: fix compat IS_DISPLAY_STEP() range end
      drm/xe/display: remove intel_display_step_name() to simplify
      drm/xe/display: remove the unused compat HAS_GMD_ID()
      drm/xe/step: define more steppings E-J
      drm/i915/display: rename IS_DISPLAY_IP_RANGE() to IS_DISPLAY_VER_FULL()
      drm/i915/display: rename IS_DISPLAY_IP_STEP() to IS_DISPLAY_VER_STEP()
      drm/i915/display: identify display steppings in display probe
      drm/i915/display: switch to display detected steppings
      drm/i915: remove display stepping handling
      drm/xe: remove display stepping handling
      drm/i915/vblank: use drm_crtc_vblank_crtc() instead of open-coding
      drm/i915/vblank: fix context imbalance warnings
      drm/i915/vblank: convert to struct intel_display
      drm/i915/vrr: convert to struct intel_display
      drm/i915/tv: convert to struct intel_display
      drm/i915/sprite: convert to struct intel_display
      drm/i915/display: convert params to struct intel_display
      drm/i915: remove unnecessary display includes
      drm/i915: remove unused leftover basedie step code

John Harrison (1):
      drm/i915: ARL requires a newer GSC firmware

Jouni Högander (1):
      drm/i915/psr: Prevent Panel Replay if CRC calculation is enabled

Juha-Pekka Heikkila (3):
      drm/i915/display: Don't enable decompression on Xe2 with Tile4
      drm/fourcc: define Intel Xe2 related tile4 ccs modifiers
      drm/i915/display: allow creation of Xe2 ccs framebuffers

Maarten Lankhorst (2):
      drm/i915/display: Plane capability for 64k phys alignment
      drm/xe: Align all VRAM scanout buffers to 64k physical pages when needed.

Rodrigo Vivi (1):
      Merge drm/drm-next into drm-intel-next

Suraj Kandpal (2):
      drm/i915/hdcp: Use correct cp_irq_count
      drm/i915/pps: Disable DPLS_GATING around pps sequence

Ville Syrjälä (13):
      drm/i915: Fix readout degamma_lut mismatch on ilk/snb
      drm/i915/dsb: Hook up DSB error interrupts
      drm/i915/dsb: Convert dewake_scanline to a hw scanline number earlier
      drm/i915/dsb: Shuffle code around
      drm/i915/dsb: Fix dewake scanline
      drm/i915/dsb: Account for VRR properly in DSB scanline stuff
      drm/i915/dsb: Precompute DSB_CHICKEN
      drm/i915/dsb: Introduce intel_dsb_wait_scanline_{in,out}()
      drm/i915/dsb: Introduce intel_dsb_chain()
      drm/i915/dsb: Allow intel_dsb_chain() to use DSB_WAIT_FOR_VBLANK
      drm/i915/dsb: Clear DSB_ENABLE_DEWAKE once the DSB is done
      drm/i915/dsb: s/dsb/dsb_color_vblank/
      drm/i915/dsb: Use chained DSBs for LUT programming

 drivers/gpu/drm/i915/display/intel_alpm.c          |  54 ++--
 drivers/gpu/drm/i915/display/intel_atomic.c        |   6 +-
 drivers/gpu/drm/i915/display/intel_backlight.c     |  10 +-
 drivers/gpu/drm/i915/display/intel_color.c         |  56 ++--
 drivers/gpu/drm/i915/display/intel_ddi.c           |   2 +-
 drivers/gpu/drm/i915/display/intel_display.c       |  11 +-
 drivers/gpu/drm/i915/display/intel_display.h       |   3 +
 .../gpu/drm/i915/display/intel_display_debugfs.c   |   2 +-
 .../i915/display/intel_display_debugfs_params.c    |   8 +-
 .../i915/display/intel_display_debugfs_params.h    |   4 +-
 .../gpu/drm/i915/display/intel_display_device.c    | 232 ++++++++++++++-
 .../gpu/drm/i915/display/intel_display_device.h    |  21 +-
 .../gpu/drm/i915/display/intel_display_driver.c    |   2 +-
 drivers/gpu/drm/i915/display/intel_display_irq.c   |  17 ++
 .../gpu/drm/i915/display/intel_display_params.c    |   6 +-
 .../gpu/drm/i915/display/intel_display_params.h    |   4 +-
 drivers/gpu/drm/i915/display/intel_display_power.c |  20 +-
 drivers/gpu/drm/i915/display/intel_display_power.h |   5 -
 .../drm/i915/display/intel_display_power_well.c    |   4 +-
 drivers/gpu/drm/i915/display/intel_display_types.h |   7 +-
 drivers/gpu/drm/i915/display/intel_dmc.c           |   2 +-
 drivers/gpu/drm/i915/display/intel_dp.c            |  12 +
 drivers/gpu/drm/i915/display/intel_dp_aux.c        |   4 +-
 .../gpu/drm/i915/display/intel_dp_aux_backlight.c  |  70 +++--
 drivers/gpu/drm/i915/display/intel_dp_mst.c        |  40 +++
 drivers/gpu/drm/i915/display/intel_dp_mst.h        |   1 +
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c      |   3 +-
 drivers/gpu/drm/i915/display/intel_dsb.c           | 325 +++++++++++++++++++--
 drivers/gpu/drm/i915/display/intel_dsb.h           |  16 +
 drivers/gpu/drm/i915/display/intel_fb.c            |  36 +++
 drivers/gpu/drm/i915/display/intel_fb.h            |   2 +
 drivers/gpu/drm/i915/display/intel_fbc.c           |   2 +-
 drivers/gpu/drm/i915/display/intel_hdcp.c          |   6 +-
 drivers/gpu/drm/i915/display/intel_hti.c           |  20 +-
 drivers/gpu/drm/i915/display/intel_hti.h           |   8 +-
 drivers/gpu/drm/i915/display/intel_link_bw.c       |  25 +-
 drivers/gpu/drm/i915/display/intel_link_bw.h       |   2 -
 drivers/gpu/drm/i915/display/intel_load_detect.c   |  27 +-
 drivers/gpu/drm/i915/display/intel_lspcon.c        | 115 ++++----
 drivers/gpu/drm/i915/display/intel_modeset_setup.c |  31 +-
 drivers/gpu/drm/i915/display/intel_pmdemand.c      |   2 +-
 drivers/gpu/drm/i915/display/intel_pps.c           |  14 +-
 drivers/gpu/drm/i915/display/intel_psr.c           |  14 +-
 drivers/gpu/drm/i915/display/intel_sprite.c        | 209 +++++++------
 drivers/gpu/drm/i915/display/intel_tv.c            | 203 ++++++-------
 drivers/gpu/drm/i915/display/intel_tv.h            |   6 +-
 drivers/gpu/drm/i915/display/intel_vblank.c        | 122 ++++----
 drivers/gpu/drm/i915/display/intel_vblank.h        |   2 +-
 drivers/gpu/drm/i915/display/intel_vrr.c           | 127 ++++----
 drivers/gpu/drm/i915/display/skl_universal_plane.c |  10 +-
 drivers/gpu/drm/i915/display/vlv_dsi.c             |   1 -
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c     |   2 -
 drivers/gpu/drm/i915/gt/intel_ggtt.c               |   1 -
 drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c          |  31 ++
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c           |  10 +-
 drivers/gpu/drm/i915/i915_debugfs.c                |   3 +-
 drivers/gpu/drm/i915/i915_driver.c                 |   4 +-
 drivers/gpu/drm/i915/i915_drv.h                    |  12 +-
 drivers/gpu/drm/i915/i915_gem.c                    |   2 -
 drivers/gpu/drm/i915/i915_gem_gtt.c                |   1 -
 drivers/gpu/drm/i915/i915_gpu_error.c              |   3 +-
 drivers/gpu/drm/i915/i915_irq.c                    |   1 -
 drivers/gpu/drm/i915/i915_pci.c                    |   1 -
 drivers/gpu/drm/i915/i915_reg.h                    |   4 +
 drivers/gpu/drm/i915/intel_device_info.c           |  14 +-
 drivers/gpu/drm/i915/intel_device_info.h           |   5 +-
 drivers/gpu/drm/i915/intel_step.c                  |  84 +++---
 drivers/gpu/drm/i915/intel_step.h                  |   3 -
 drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h  |   6 -
 .../gpu/drm/xe/compat-i915-headers/intel_step.h    |  10 +-
 drivers/gpu/drm/xe/display/intel_fb_bo.c           |   9 +
 drivers/gpu/drm/xe/xe_bo.c                         |   7 +
 drivers/gpu/drm/xe/xe_debugfs.c                    |   3 +-
 drivers/gpu/drm/xe/xe_device_types.h               |   6 -
 drivers/gpu/drm/xe/xe_pci.c                        |   3 +-
 drivers/gpu/drm/xe/xe_step.c                       |  57 ++--
 drivers/gpu/drm/xe/xe_step_types.h                 |  30 +-
 drivers/gpu/drm/xe/xe_vm.c                         |  11 +-
 include/drm/intel/i915_pciids.h                    |  11 +-
 include/uapi/drm/drm_fourcc.h                      |  25 ++
 80 files changed, 1515 insertions(+), 775 deletions(-)
