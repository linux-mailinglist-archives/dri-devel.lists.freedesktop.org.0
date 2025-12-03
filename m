Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2CEDCA1A52
	for <lists+dri-devel@lfdr.de>; Wed, 03 Dec 2025 22:13:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 677B410E827;
	Wed,  3 Dec 2025 21:13:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RBkmIRaM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C196410E820;
 Wed,  3 Dec 2025 21:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764796426; x=1796332426;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=8ChyjmL7mW9AVC4zBeCg2xdrY0960XIx28vlHnY2TeQ=;
 b=RBkmIRaMMZo3+54mfec+KlujLuEvoAYPtutcH0DcL+JtW412KE3nZOMN
 roSasc3hbdCO1FpG8mvjDqCG7iwwBsSiRn6TJOK4GRBfC9pQPszTLUB2k
 xE1C3n2p1CsNAAQzGi9MImla7uOVR5kjpHCNx4hQR14B0mrjCZvGSzcGI
 XpotFPLa2TiOw9EMZGm+r6WTgkmmNxzOAV3O/BQmKdE+C0QzZyufIcB1V
 3UHe5WF/52s//822tXfLCAPwMLfqz5n1w/mryUszAqK6ttzPypkikcbGw
 I8P/FmQiR1eaIXIccB+HW9fIS266cIsBFsg5F58njYVQ+YKVfvfm2fPSP Q==;
X-CSE-ConnectionGUID: nLDz6BDKQSSdhP/vFDMt9A==
X-CSE-MsgGUID: N6fsTGRyTqySpOUqeRsMbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="78273681"
X-IronPort-AV: E=Sophos;i="6.20,247,1758610800"; d="scan'208";a="78273681"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 13:13:46 -0800
X-CSE-ConnectionGUID: yH97SYFARjOeVOwi3l82dA==
X-CSE-MsgGUID: rGCYHRzRQWahnO0oTN02Lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,247,1758610800"; d="scan'208";a="193871958"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 13:13:45 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 3 Dec 2025 13:13:44 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 3 Dec 2025 13:13:44 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.71) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 3 Dec 2025 13:13:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yfMZEYJtH5NMCa/MIFwuU2I8aeaOxp8Gr9LYCYNNpzGyERHWdX7dOhBGc9Tt3Z+6i/pBh/tZK74FBXKt/CROxLRgpbGmiMQkYkgf+HvP0QtkQwhf0EvzmOJIZ/vGqJrkr75OEVPEjmzfjryiA9dWEkM9LcL8725knM+ImkZZ+NhbASm/LZHW+OuKmRPmJPl4KujGBB8BWvOI1hCpbICzYjKYh1BNPp7GpvijmJE2mkyIJROjAcMlbV8yx4XYQoW4NMYZ9+kH8k+tosxB5ZFC+1IlU+5txwAwg3PIbXGwOJhAi4Wd9LttZR5xOMaZnjEW2+cdbDsaDv/XnpQepL7rUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dByNS3fkjDeDSjWCpsFuJ0aT2ZfiKPIS0W0jtDTpDV0=;
 b=M/q99Hr4bhnMJLV8mgp7OhS6V7c9ZijuMB5BF11N13wMFgkrITIMbj/sX55Fx5x8IhYGIJ7YT3hfEnte23LQj5yjNl2gTbolTHoKmAhoK8MLuZSCo7JmAkJICRxJMJDwBmpgIW/VfSuXjg5c7gFN5E3xAGZwmD9jdbsjdltc+nZ/yqyx6WH+Bst1XD+WEX0sLY86a/KegktW2bSJWX7VJ3kY9bx6HMRcPEOQsSjn1rb/d9J/zgCj3ZY07cEyDLx9IwY5hdntGRHf0hysWsWXijnaGpkZZMDVTJFpRKydTMpDOg3kJ2lbTH7VIC/bkdenmm7naqXtWF3Wa2NN4hfJqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by IA4PR11MB9323.namprd11.prod.outlook.com (2603:10b6:208:565::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.10; Wed, 3 Dec
 2025 21:13:42 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9388.003; Wed, 3 Dec 2025
 21:13:42 +0000
Date: Wed, 3 Dec 2025 16:13:35 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: Andi Shyti <andi.shyti@kernel.org>, Philipp Stanner <phasta@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Gustavo Padovan
 <gustavo@padovan.org>, Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Felix Kuehling <Felix.Kuehling@amd.com>, "Alex
 Deucher" <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>, 
 "Joonas Lahtinen" <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Huang Rui <ray.huang@amd.com>, Matthew Auld
 <matthew.auld@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, <linux-media@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <amd-gfx@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 4/8] drm/xe: Use dma_fence_check_and_signal_locked()
Message-ID: <aTCn_1VHOOkvhxpS@intel.com>
References: <20251201105011.19386-2-phasta@kernel.org>
 <20251201105011.19386-6-phasta@kernel.org>
 <aS3uycB40j2CptOf@lstrano-desk.jf.intel.com>
 <fdb7dhdrquapw4cb7oa23rpzl6dkzbnotc3otxntruf3a5hvca@szamkxwcjvfc>
 <aS9UWDA4jABUWB+W@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aS9UWDA4jABUWB+W@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: SJ0PR13CA0150.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::35) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|IA4PR11MB9323:EE_
X-MS-Office365-Filtering-Correlation-Id: fe724440-c03e-462f-d2b9-08de32b0d66f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?M6LlnGoUgdDkGNngR6R3lUCBprN2+eU3S5DEGT+hvOgk1FDEjE4RwuvS3tJp?=
 =?us-ascii?Q?NYyS78A0sICPWRAUNw71AzN66nR7iI0IH4JsBm2MG64vMwmaER7ZGQjYSoWF?=
 =?us-ascii?Q?VEEWyX2ibm2NAo4oUYIyb41Zvj8jMAA6ajk004OLuX0/lsHuTWCI8pZfr7v6?=
 =?us-ascii?Q?jZcUkivwCEtZ+Tn+oTxs5sgVsy5zDqji5XSFf8SoTkt+JOIhTivHweZMaYi9?=
 =?us-ascii?Q?17MepSWheIPR97qm4ekXdkrrFGAHeLJR3MkibplyzLY0PIqTeIBkwJQ8h1I1?=
 =?us-ascii?Q?jzgBDDEdMGSFaXIHt4aLLE1jJY6brjeo5IhP2kLhrMpKm4vzfVLxndYCrYC8?=
 =?us-ascii?Q?bJFVwGy9OroIhTR6l4viuceknXKZ9BSkUDgY/G+i5j5HcxhSl7MiNTvxfp46?=
 =?us-ascii?Q?aKEtJ90M/uQpcX97PWx1/jz7jonbHymQIj7Bi8MkGTg1TYnmNyAtd8oe6jSO?=
 =?us-ascii?Q?Med6ggSDgh63hRnoE/2QZxk+7LE75IHm8EICjgXksXZFTrdcY9ScKB+u4XwE?=
 =?us-ascii?Q?CL8aYtcWf8/IxYbPvF8UtbHu3rwK5mke6JIYZh0PdhJ/Arvr3MwfGAlK82js?=
 =?us-ascii?Q?VX73vzFlXZ/nZpmIK5WVarhYew7VuDcKwpfwHsrTKZ7+l+jKJcZu8KfoUMlu?=
 =?us-ascii?Q?7OIeqslljJ0zqo0YVvfyAUdCnwIywAV5gd5zBLXeERj3UmaICE0VKHOJSo41?=
 =?us-ascii?Q?0htDM/ENVEnDoUwHbLKi9meNVZcre9C+2EOlZ0stbS+4G2ZzDaGyEcYPg783?=
 =?us-ascii?Q?nKW6UCJDfEik8GP8vYt0PTyjTaalzdlWQ8YaPMeGQam6IbpQsEyon1mljNn7?=
 =?us-ascii?Q?52a6OMO+2gREtkYj3Nc8BqwxTxeaeF60GamSk9glu2JxJ6oN8LmlGBwNjHPZ?=
 =?us-ascii?Q?DKmj/NSbvFFsepBQxpxL/JmWxJNYnuvwEX1i346KJUqizSXCrej+k2gpjkn2?=
 =?us-ascii?Q?59ztzh4zTJusG2UHk6fDruAgEmV0RGeiNSy/e22VP/CXmgtEXnWLaK73i2fP?=
 =?us-ascii?Q?IaJYrRB1y5AiYkTf9D2WaQ2se9+RXXV6DoqoiUbj3AonuWyPYmhMylg043Qe?=
 =?us-ascii?Q?RRut9vKMAUid9DfGUGmqqE3mDxrTI/ut5nk84781s0/qsWqIOaIhsF81j87r?=
 =?us-ascii?Q?CQBHFm7Lqcr1+u/LBTzBKyG5Y9KWQDEU5NvPleOsaPpGgaAsRZ6haWKnxwqh?=
 =?us-ascii?Q?68HRSPOtjz+RKr9LWzPaXJsayMP7cMYRshvXj9L6lRb21l2l8ZPhkUxEjPOR?=
 =?us-ascii?Q?ZjFBRT5qBjiIJ3IUDzckfdFLYUCsFF35r2mdu1qL/YHKEvn/yfMA7Z9WjUO5?=
 =?us-ascii?Q?zMuAGDqQqf0r8VwEX3MGjOlvXlg42Dm8QIESwCP70P89t4kS2Q2RIWt5AnnH?=
 =?us-ascii?Q?8APMRvJ3GZ589P1MsqOcTLoWDBhuY/6fxKvYEnILT1s7WFz+hcwa074WdIyo?=
 =?us-ascii?Q?JSswSpkLXKsTF5BxdMocLRFkJJbhcLIr?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lof/zh4MBYPKgbwBhTbkABrZ02kQCzQzsEjwohHBrTD0k0EYMhMBuR90Gdbx?=
 =?us-ascii?Q?8+v9OgTw6MjcF/ud7fQf7aSIMf78JU2shIjPXVAYxJR+SApBZGbSnHnSL5eJ?=
 =?us-ascii?Q?b5UsxJ3F1ag6ip4Vf3dMSjvyxSNUmuMaQUeRhQT0Q6TMvFU7HcXFUYAO+xfT?=
 =?us-ascii?Q?HDdZy3fQxTj+u0/PR2zyVUCNsygxRgflfNP3HAmqHAqM0bP+0GHaRTXwZE2P?=
 =?us-ascii?Q?WyBka5g5Fv7SKcRT0VLHDSxtK08a12ZMyPLlPRaXFUWC7cnRnHOh2RzkaZRX?=
 =?us-ascii?Q?gtZ73XgcNUsA3xJ/7ACETaz+hIAJvQmsjsQbUdWpJQxUjzHsGlLt/+PGaSAj?=
 =?us-ascii?Q?h2tGVfsmiChE6wnV79ZPWSR7DN7HjBlltkx9WbaWHv2RslqVZOj8wVsdM3yl?=
 =?us-ascii?Q?8AU0GuOMMWFBaeD/UAV0IjSpkRSQ9bpb0onpoRpi9w92EmFitvfRW71oPpuK?=
 =?us-ascii?Q?KkneTRIMmnNxhfBdCAOPjUfTy9HFVziaqvuzxlQNvTbze47PtXrHIziQfRNs?=
 =?us-ascii?Q?FTQ2D7oCf0i7kyHRHDwOYabrLwsIDesET8GTrq/Rlbb3bXmhSsVcbDYlCmB4?=
 =?us-ascii?Q?NtPV0JMyqRf25M0L0k6E5mKzRp0xPtC7Ft7TD7tyghNtia+9xMuYGgHgJPlD?=
 =?us-ascii?Q?ZetElNITa5Zlra0ElNcu+dM3wEp1A9k66+5oJ4+diN7B9K62gtlHOtOwxqV1?=
 =?us-ascii?Q?gNE2b9dF0VEVapf4FmjXdct9NCDIWmzYZOdrXua3JJMGqUiSKDCuhfR4R4bC?=
 =?us-ascii?Q?ejNVThV7PEqmxPa8U9OTiK6FIUr3Ojp5qKYB/sQd0j1hF6THA7ICXJX6/g0h?=
 =?us-ascii?Q?AC/OUY8FoKhW5bROX8+Dea5SMwUXAIzcWrWobVdLEyZlLyo5UhFTBltoqYf4?=
 =?us-ascii?Q?K2vuS8jkU905kKQ4iVWl18j3XhzVBS6sFMUMEzQAU7dUshh801EGAvlhbpiA?=
 =?us-ascii?Q?1tV2avzzPRVlFWj/1DGB89jI0kSjaok6Gp2gjkX/SCEdPHD5VqWBCPCZrhrS?=
 =?us-ascii?Q?VoJZFYdbUiIZpw4sslIjc4qFYeQIKBl9yKxFTF53LYAhWGrsEKM/IZlTto09?=
 =?us-ascii?Q?Z/lRHIvLiS3xXF4dRO0qJwyOYXy5P3J8/+yzPNCY56M0omvkNxuDQqL82VQO?=
 =?us-ascii?Q?ZuHxL26fIXPgCmliCxSZ9cR0/GdysuCW+i8lXZxWH/iT5nBTKg75LgpUk5G6?=
 =?us-ascii?Q?bbs0UwRsycNUivSywMM/5DuoMhmOBKoI+LimwU7/3ooTjctLEFoqaGdrRXQB?=
 =?us-ascii?Q?xD15IW91QkeQGF2wdXOpuBg1rWc7rCeVDMA40OoDwFmboZ+sohR06eZ6m/nJ?=
 =?us-ascii?Q?GiXTn4X4R7oj4nKitj4ZtBMiCAEqIxJjof0/MegQXjyQK00QDEH5EoHsQwvF?=
 =?us-ascii?Q?IoofDMEqNoSeLRIuyzjKyTnuJBpeKRpEP/k/r/90zEM5iTLJe4VrdFnNPiZn?=
 =?us-ascii?Q?XitsS5SSyoTlSIb7kjvGkLH8/NW2R7JaaPJtfSRxUlSdTGCBJkqAtgthVO7I?=
 =?us-ascii?Q?inp6qssMAtMmDFFIa2hPTn8UVc4RM8CMVMQ+gK5DeFUNse8CuiV2VLztvV/j?=
 =?us-ascii?Q?8cQHNuYbuvBGdd8nM1FfTPopw73PrM30gXtIPGx0ZSw3FyODiHw7Fh74te1e?=
 =?us-ascii?Q?bw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fe724440-c03e-462f-d2b9-08de32b0d66f
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 21:13:42.8311 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dk9xBBBRljgI5PYuHG/qBKBq5GkYHunm/PDyFxjlPeP+4iZdns61288zrykIZKZW9Vz7gI0Q19yXgLjT0IZJSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9323
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

On Tue, Dec 02, 2025 at 01:04:24PM -0800, Matthew Brost wrote:
> On Tue, Dec 02, 2025 at 09:47:39PM +0100, Andi Shyti wrote:
> > Hi Matt,
> > 
> > > > @@ -93,9 +92,8 @@ void xe_hw_fence_irq_finish(struct xe_hw_fence_irq *irq)
> > > >  		spin_lock_irqsave(&irq->lock, flags);
> > > >  		list_for_each_entry_safe(fence, next, &irq->pending, irq_link) {
> > > >  			list_del_init(&fence->irq_link);
> > > > -			err = dma_fence_signal_locked(&fence->dma);
> > > > +			XE_WARN_ON(dma_fence_check_and_signal_locked(&fence->dma));
> > > 
> > > I think XE_WARN_ON can compile out in certain builds. Best to leave warn on logic as is.
> > 
> > I don't think XE_WARN_ON compiles out. It should always evaluate
> > the content, then, depending on the build, it prints debug logs.
> 
> Ah, ok. I thought XE_WARN_ON was tied to a Kconfig to compile out or
> WARN_ON (this is what XE_WARN_ON resolves) compiled out in some kernel
> builds. Upon more looking, I guess neither of these is the case.
> 
> So I guess this patch is actually:
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>

and

Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

if needed to merge through any other tree...

> 
> Sorry for the noise. Side note, we should probably just XE_WARN_ON too
> since this is just WARN_ON.
> 
> Matt
> 
> > 
> > Andi
