Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D71DFA55382
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 18:52:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1156610EA46;
	Thu,  6 Mar 2025 17:52:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y8jY0yT7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74EF310E83E;
 Thu,  6 Mar 2025 17:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741283576; x=1772819576;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=XZx4QjOgAzIw5Ew5y0beyGvkdgX1Px5Po0VYkjRl0P8=;
 b=Y8jY0yT7gC3BC/fyriQGlIcbo2/31YRoMnq1PabDqY/V8cqgG3lDHVAT
 hdKbLEGl7aOyfIq2upGJ9vaezgtCdzHXPYamV4z/xRoIidhQ2T0vpMUbU
 yeMyaa+gtFuSZ8PYix4UtnM4rnPsXEnrIz/TT8JneJmPtdgwI02d+WACZ
 GJjkBlxvKlfVzDk5NtdnJH6cipOhetGiB3bSd1InSxcVBW41t2frfR8ye
 Xu6HsA9yoIhRWRIJgXaZjkfCJX8RHD5MxNmoOo4Cxmy/sXwMRVPtnmKWV
 mnQ0AFv+O8pBQ/xMqVxUVwHuZS/nmtkDPtq7fOaDLj5o+4uMLdw4raxc9 w==;
X-CSE-ConnectionGUID: 3SFogG7jQhquWDPqGi/thw==
X-CSE-MsgGUID: YoqZZT0DTgGHCg5PkB2BAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="52518705"
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; d="scan'208";a="52518705"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 09:52:56 -0800
X-CSE-ConnectionGUID: 9kDKyPiJQtWyANV2fNHVVg==
X-CSE-MsgGUID: u3s4QvyjRZWeHNkWMCG6bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; d="scan'208";a="119102567"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 09:52:56 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 6 Mar 2025 09:52:55 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 6 Mar 2025 09:52:55 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 6 Mar 2025 09:52:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JQOM+f3Ex4E0lDGtd94enh3NHNZFoqXLy3OzB/o2ohU19Czd9H/oi/xoeYmEgnqDcuZC6Dj+nlq63fAOsLXpwLzZARJn68B7BZIz59lvH0U+4kAhigxM/q7Re/yYvLYcfukgvfblrNZrgcWj+7P2yZFvNq/AGsMOKehZPsmP7/Y5fAUnABsbmJw9JEXV9Xai63i3XoaJEcsmFjEg/WmYFoHJJNi6x6x85YUT1IXkXM+nt25tgK1aCzGSBzFPGjJSbRhvp+YgKnIAK20lx+xQ+iEIUtGg9imRYEsWAEowC6YiPhuPMZFWvs/1nsmZbTiBLCYJwg1wjfkrsLL8PPukOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=owCxBAXefVVtO5rAItcImq/HmOUShAmm6oeSBI01o8Y=;
 b=VudU4JV6F3OcQsQ0GaV8UOlfYhrbhbAI+Tfkhji0AQDjAzByrRMClJMdcpmFtp7Tr4pF5HYh1DVXRMn/lTFr4e7HkqgEPOwhKgDLMX51BQowhI4gSIaywBZTS8/fE5fSAr5Cs1Gl1Y80+XRDAJtp7F/oZpR92Qxc+irLQLiYliNddyzDPu7kl3i8Zj06+ZAGEF0B4aC+PHps+lvf0s7UCzTV36knRunWOT+6jDXuKRlBnBPxZBzO1zsptMMlJOXMXvbjsl7ZIJum5QEJvNVsQZAI2LubCV6OsVqYnmn17C0cj4bfzjJkDnHhBVe+SObCHDQZOnAhbyS3y8BI0w0/GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SN7PR11MB7020.namprd11.prod.outlook.com (2603:10b6:806:2af::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.28; Thu, 6 Mar
 2025 17:52:53 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%4]) with mapi id 15.20.8511.017; Thu, 6 Mar 2025
 17:52:53 +0000
Date: Thu, 6 Mar 2025 12:52:48 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Oded Gabbay <ogabbay@kernel.org>, "Lucas
 De Marchi" <lucas.demarchi@intel.com>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dim-tools@lists.freedesktop.org>
Subject: [PULL] drm-intel-fixes
Message-ID: <Z8ng8NjmRGiVcb5t@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: MW4PR03CA0340.namprd03.prod.outlook.com
 (2603:10b6:303:dc::15) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SN7PR11MB7020:EE_
X-MS-Office365-Filtering-Correlation-Id: 4aab47fc-7ce9-469a-e71c-08dd5cd7b80f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jLr5vyfZuVcaTB/maQxmqLX+7HE7AtE0nNYcjT8N4A2nEi92xp5qKQu8+JsP?=
 =?us-ascii?Q?6k5DusDOwn/XiRc7qx08wznIm1cGANhvdOvAz6osYYX8anMpyCkECXvsZj3k?=
 =?us-ascii?Q?+xnvGvAKdODEc1UTizjuFneF8mkZ2tp1OxqpyxjyDPDEqDa0eDKeDG7oZdro?=
 =?us-ascii?Q?Pb5iol2g4Jd7J/Ju4+Wt9p+tG/I+js0K3UJ1Gnp1fSiKc9YX8NSsgqoHalRk?=
 =?us-ascii?Q?/qHUclZHh875dhswi3utgcLSCbrmXHZbtLIykj2CBXrWUSqG+Df19hESOh4T?=
 =?us-ascii?Q?dkqMG45i7CHlfuW5RAamqd9p5jA2ROdaQ1Qwhl88/kNQOYoQ6m3SmjnFAIBW?=
 =?us-ascii?Q?tv7PGrpifKPYd7Fi4WRqVYlMWHWGkkvBadvdcjW2MKztK1GQsofIQnth5Fyi?=
 =?us-ascii?Q?bvY5NC1WrOOwXsS2tKg8USghJyO1a3IiiurYPnG42YOPKXVuzQuDej7DzffL?=
 =?us-ascii?Q?x9ddVxD/V6SqgWdqi6YweVoii7m32uUFAKDgSxAF6r0Q/TB4Rs/bJ4dT9XoT?=
 =?us-ascii?Q?OQKri0y3wv9C0kB6i0/3Oobv8t7WrHOCyGaUm3K08/WfkjzyBZSRW1qSSKZ1?=
 =?us-ascii?Q?YjYBuWu82ibVDzRJ+V0nYbPrK5RCPeNvKcy8yF73PSdlA+HY51BEMeam+TIb?=
 =?us-ascii?Q?XC/xXOiJUbhfIv8UtzDYyE+7CL12b7hGgU9BJoMKGS68/1WiS38AC9o1SvnB?=
 =?us-ascii?Q?zo4r0KdPmYj4XWeGVIjFAKpWGfM28vPG/vHknFnw51xRNTFDQow+gBvGN25x?=
 =?us-ascii?Q?bH60bQNZoh8C7u3u+YOWQtouaP5rAOhR08BLokkN8/XZa/UtcB7x6+MGwXWA?=
 =?us-ascii?Q?Kf9LHwVt4piyMzbZnK+spDyTt+Pxc3sag/hvebRugbJ0pqyQtVmhHsqYE7ED?=
 =?us-ascii?Q?OrcBf6L5/pkMhfmp95EQ7nP/N1hFh2VcYn+DSEWcqjhQLLOZjyICiExRghdX?=
 =?us-ascii?Q?39nvCEztInTzVoSTWgJ8NBoLeqaK2yx+EJZrC3wDfEjvA5yusIfnouQmfSZQ?=
 =?us-ascii?Q?ZRA70NO1E/qB5OCWDP6R8edEXwk9OK5l5LB7LaonVfvjjcyzaa/LpPlQlC+y?=
 =?us-ascii?Q?iOyQqlB/AB9mXWbvuxm90xooSG2WfZlO6Uos162u7AYUXdGM3jAX/fZjc7IY?=
 =?us-ascii?Q?e2060RFm1hqtAr21bdhyNijxtaXg6q2+FFthyH4fYCQ83Sg39c2VljRntrv4?=
 =?us-ascii?Q?2w2qunGm8rue/iSx9wZlHBBpTG/MAd0JlZaH/RS9wqdLETyS/g4/KpSSFZ96?=
 =?us-ascii?Q?R7tE0GwUQhkZqT3XK7f8jX+/t+x8cC0FhgxO7PJAXlgeLPdKar44DcFVaarj?=
 =?us-ascii?Q?8IXJqXauorh+zHxr6l5tInBCT8DLqVPLApJYaVT+wHCEBg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?i9CMxPB90O0dF8+UHRaAV8y/HbCbjymDyOyQ/uZHie8HL5vStl6CuXVbSfRd?=
 =?us-ascii?Q?NNguH2rZSoRkVeeNRSY/lLtEbTyE6NhYRhP6W19hbDfe0EnD3RHwUtXmqexy?=
 =?us-ascii?Q?fSHLJa0ZtqsTWwoiBsBYHJjKQGb/eeGkJn12T8UUUKK6sM2yHE3Xa/haYzjo?=
 =?us-ascii?Q?C+qWo4UtGgbORKxnBMJCvNdZw2z9xiuiX0iTk+CXCW+LOcxyJOwxBWDEYgo7?=
 =?us-ascii?Q?uwXBhcjo/av1ExSQDzSux9ooyGd5HH9Jrfmf+xqrJauBcwfi/miK5Ir9E+3q?=
 =?us-ascii?Q?mOqSwGp07mzC4HXxBkWK2VKE443sAeuu93K0IaXlIqMjAVTDLIZSsKwdOsFr?=
 =?us-ascii?Q?3hvY+eCujZmN2JLSXWEArwVkjOeTobtDeewu+5idlm1IbLrt2tu80C2QP1ME?=
 =?us-ascii?Q?m3/AchYISbqyWKdgOK7aLwauFVTiCwmDRWm/Du+xDxssWSk1UCJL8ARvKRdC?=
 =?us-ascii?Q?aDTbED+K45Ex1k4KpmswLs+zLFUI9QqjqBrdcEZiokakqV7xAFYGjMJ9PZhk?=
 =?us-ascii?Q?mof/5ms4vtXB4cpD+xyxO1oYjjHAfaoZlgFyatu5LFOkhATKbFriQ/KIZ8sl?=
 =?us-ascii?Q?7aUhCaUmZa77n3dqDouVif3TBvJtLYypL6YLn7zIXqc8krqqn+djPATrZWxg?=
 =?us-ascii?Q?RINhWvGGIK7mzGXhNAypyszLW4tAztPu8U7q3QLhPeKS+YizAVhvO1BzoOom?=
 =?us-ascii?Q?8hATiNatyz4fDgxkcjdhTn2Y1oi+x8ixVprfTgI7agahL8rAbzf/E3ArP+nI?=
 =?us-ascii?Q?K0nG0WXSXWJaWtInjXi4REGp9OZg+hom4b5rRDo4PMxs/RjWsCAitlRYi8Y9?=
 =?us-ascii?Q?5mT0Stw9JmOG0F5LginQjpiegUqVzSKW0mB2zQqEIvltGYA4/W2P3GbmaSqj?=
 =?us-ascii?Q?9ARnxtwAjzclR7rG3hWY+wu1ghzWMHoQyWl6LGf4iUQ0jF+RE56jQXlLCqA5?=
 =?us-ascii?Q?6darN/SNMtPj+numna8YzqCTIl0zHyxtjIu+zCg8MOTFsp648Nz/QSxcVuF7?=
 =?us-ascii?Q?Q8betj5qm+ZyWU6+ZGnakewiJby2Qp8KnWXbNAyvObKGAds6pmhN1hABbQPM?=
 =?us-ascii?Q?MIbUWGtZTnBR7bmK+AGr+IA2IkmUNRh3aIVGZCHvpfEple6p6wKubWxQAafw?=
 =?us-ascii?Q?25sDByaB1Io1x8vcunRLXai9Lu4uuzN2VK1m/wicdO0cHhVveLqq+HoxsazL?=
 =?us-ascii?Q?V6oqlVxDMnAQlMp9ghHmlOQM+/TQTwz6sj4xR1s6i5Jza33VHEURQtloNlcH?=
 =?us-ascii?Q?bOF1fQCXKn6aqsHSIpfB7leBWPxg1QbH/6jbco9+qSVyOpXdiqmdUshE/rGA?=
 =?us-ascii?Q?yle1JGaZQA3Oc8KF7OTUXCjXot2OmGyVnyhmP0+FUNUxIntWXlExRYPJ+Yud?=
 =?us-ascii?Q?bBHuzi9+/pWih0yAZ/IAlq6hKunIOFtFzZI2g+CQJe0KKVsYsOKE4Dz8qrlf?=
 =?us-ascii?Q?td+6hLxA9LeUgCDXXZezhy/vFplMZ0cdAGtw2Zx56Rlf3CzUAxsloKx+ZPZP?=
 =?us-ascii?Q?ZRZPgUrk8Dr2s60abXuH1Nr9uXJh6L8LSKKFoaG06eWiv0sfGCMeE+txvAHJ?=
 =?us-ascii?Q?xBvnm4vmPE7HT4NuoeTlXJWIegP3Q3hr0uZyv/uEUM6/AUhpCZCu71yAkUS/?=
 =?us-ascii?Q?SA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4aab47fc-7ce9-469a-e71c-08dd5cd7b80f
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 17:52:53.4673 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qlKQGyCsGug16NfjAg7uBwLH9vNX0jg+ZFy9qHyOap1bwLbfYvc+d6ox09T80b5xRORq/n7dQeA2CfPCNeRPRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7020
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

Here goes the only i915 fix for this round.

Thanks,
Rodrigo.

drm-intel-fixes-2025-03-06:
- DP MST fix (Jani)
The following changes since commit 7eb172143d5508b4da468ed59ee857c6e5e01da6:

  Linux 6.14-rc5 (2025-03-02 11:48:20 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-fixes-2025-03-06

for you to fetch changes up to d1039a3c12fffe501c5379c7eb1372eaab318e0a:

  drm/i915/mst: update max stream count to match number of pipes (2025-03-04 14:45:04 -0500)

----------------------------------------------------------------
- DP MST fix (Jani)

----------------------------------------------------------------
Jani Nikula (1):
      drm/i915/mst: update max stream count to match number of pipes

 drivers/gpu/drm/i915/display/intel_dp_mst.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
