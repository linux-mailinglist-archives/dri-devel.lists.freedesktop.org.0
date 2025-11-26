Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F063C8B03A
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 17:41:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE64410E155;
	Wed, 26 Nov 2025 16:41:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oFqswimg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D9C310E07F;
 Wed, 26 Nov 2025 16:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764175300; x=1795711300;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=orqe2sp4iQPy4M23WABRyyxiHF5pTbW3b8/aNuvFUys=;
 b=oFqswimgveNakGQBWzMOjCRa4Hu4WgFNRB2esshCWnztfKOfiDhTUa/V
 fQuVex4B0Yth1z/QCNihc7hGkZagkBuc2tha418yOKga7HJct4PpcxeDP
 wZH2UWG62wVDOIxmiidTk1BantoXl1Fv6ukINcYdjQMo+lm1bk8LDkmsK
 7g+lT+RBYGk/iXAx/+mM8Dlg18ICFsWYvGFQ5By7V6CF+9oFdj0iesERl
 Z0myPkzT5/lQ1Dp52pesZF9LHpLvZTiN5QVG9oEFM1iof3q0lBUFiG+5U
 UebG8kzcx4Tu2f0nEs4FxRrSLglRsRuK3hSI/Dv+wCjnPtGU81xnVJ15F g==;
X-CSE-ConnectionGUID: m6MrrtsaQe25S0Q4B0SShg==
X-CSE-MsgGUID: zNI0E6rJTHak27k4dS9EXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="77324636"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; d="scan'208";a="77324636"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 08:41:35 -0800
X-CSE-ConnectionGUID: DoWbkrObTqGO6A+4rLlRIQ==
X-CSE-MsgGUID: 0GuCCYUISe6GKtB3l4HULw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; d="scan'208";a="197316861"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 08:41:33 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 26 Nov 2025 08:41:33 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 26 Nov 2025 08:41:33 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.11) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 26 Nov 2025 08:41:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WzYIk7SScCiMoNI77qnzlwfDgG46CNcklUxZ/Y/p5colTjGTr8fxGVuYKMsoS8algZfZdovy1YTKF8kXE8ajYADuyV+CmEU+cu/54rckJfxappKFwjb2kki8TUXffNW8q7wPtkmhsTNWa8eRMPUy3/uO3uqgvwFfx1ol0DkzvcxDh8GWyNBo75X9m7ljyoym6SEDJJkVbtN2HEruVefDuyonjlk44o52KrdRNCyxr9D8V5lrt2OYdSSFkEH8fdo5XbH/WA913fBD2G9AGz7vzOE3Vxsqd7v5xaWDtUPgFzhO8rbAUmurmUIgoboYZoo6QLAWj45u+0Xa+AfBmUoLRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jNh6WCg1RIaTYX3WkDuCvoOYMQT2EIHDn621j8JbA28=;
 b=XBAfNn86sGIyk5IntNzcjGiK4WPuDIANt2yk9pzmpjUqc8l16w+2mhegkH/OIjdLJ+uLUygHTcGDrKSGGKRGd59nRAU1O9iZ2QBwgylr+F61F80mJm9vZYIT8cCJe5qg+WvTjSBoM73jBiYqBadVC3ZsjO2+sqXNTBlanyEReVYuiQZ1V4SpA4y9Z9rXh6YnXgqeBwBqzbCG8jzStEWentCFmLroi1vmj02pz/Ma0CYWIbrfsHWWv75rmW0CFK/b75ui05jIo/F9Lb/c2K2BojcEHuXP0YcSITY69gTi5zAh6IPIkIpD/RN611xQTa/W53bo2mqSccfo3MsrOmG2JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA0PR11MB4751.namprd11.prod.outlook.com (2603:10b6:806:73::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.13; Wed, 26 Nov
 2025 16:41:31 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9366.009; Wed, 26 Nov 2025
 16:41:31 +0000
Date: Wed, 26 Nov 2025 08:41:27 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Philipp Stanner <phasta@kernel.org>
CC: Sumit Semwal <sumit.semwal@linaro.org>, Gustavo Padovan
 <gustavo@padovan.org>, Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Felix Kuehling <Felix.Kuehling@amd.com>, "Alex
 Deucher" <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>, 
 "Joonas Lahtinen" <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, Huang Rui
 <ray.huang@amd.com>, Matthew Auld <matthew.auld@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, <linux-media@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>,
 <linux-kernel@vger.kernel.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: Re: [PATCH 1/6] dma-buf/dma-fence: Add dma_fence_test_signaled_flag()
Message-ID: <aSctt3QFiEIB61Gr@lstrano-desk.jf.intel.com>
References: <20251126131914.149445-2-phasta@kernel.org>
 <20251126131914.149445-3-phasta@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251126131914.149445-3-phasta@kernel.org>
X-ClientProxiedBy: MW4PR03CA0280.namprd03.prod.outlook.com
 (2603:10b6:303:b5::15) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA0PR11MB4751:EE_
X-MS-Office365-Filtering-Correlation-Id: ab06ac71-5c85-43a2-7a6d-08de2d0aa736
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?aGaOjakNJ2G3Vw//ZfanV6Wco6oTZH0XemA2WxWkACuFfEp4fwj/wuvssNwx?=
 =?us-ascii?Q?++BR8iezoLweXtmKewOyHeT3QNdtayNbw/VcMmYOQR1S1ewLT6cSmG5ZMOeA?=
 =?us-ascii?Q?hQBkuOZmKzi0/p79uKeukWO0BFv/tE6lEN5MRPkzI/IFdyDzqfdgdSU5f7Vn?=
 =?us-ascii?Q?3jLNOpimcApKF9NJh4b+EAVt/sofmgXS6XV2m6I9fL9LdkfmH/nLRcZLaSpw?=
 =?us-ascii?Q?I+FFlyQwVVuiTpTlwdjBk0+InTPKu+ij8J/MLqf8uIbLivFQO5hwjdDAPdjw?=
 =?us-ascii?Q?F9xlcGGCF41jmkcCp+mHKh6kXy8SN/BGXA+pM/JXE2iAqonDa0spdgRtmXOZ?=
 =?us-ascii?Q?4spQ/8ZT7fa4htksChu1UCWgqu/bcITpZLD4fNAVq1Ouc8EfpdLLThf6OUm5?=
 =?us-ascii?Q?LzGGpzIWEKXJ11IIFc9L6DK0XHp2R0SDJmbFxx6uacW0H9dtcrR7UJjj7y+M?=
 =?us-ascii?Q?t39PaqHX9/rHv5ivWWHGuIX5WB5AFQM6KdIAXruFPAYftNXkxzsKhsy1GVj0?=
 =?us-ascii?Q?KlbLoUZq8sn1tKNR9lqfVCJG8EphI6+kmgYP8D6Oq28a8SGFVPepnqo9WdW6?=
 =?us-ascii?Q?EctXiLmQgagdcd7cMTGTeQijeYKiYVgoUtDugoAvneSnb+c5tgv5GzY9PZpP?=
 =?us-ascii?Q?EzlKCC0Vb3sIOX1/jrGrTr5WOdUGptPI1VT7DmdKzkCKMyu5H8wMCPiV8M9J?=
 =?us-ascii?Q?N64og63tqDJuQuxK4Fj8esZqnGfZZsdJ9vRiUroqPSQmb1i2qwYZH+a5Vmt4?=
 =?us-ascii?Q?WAwZlpwIngfqf8zUE1SOXPQQf3JXgGXX1CEdlFhQ6fYEanq8k1tPNzvhgPDI?=
 =?us-ascii?Q?fwUU9JunryTvZriJuSDkJtUmMDX76LB47vn7CTwPyXDTpaoHE1LLcCVvJtoK?=
 =?us-ascii?Q?pTIN1yPKImaqdfveBU3eEG+v4yk/uGIbYWo6JT1lO5hQBfCPzcX7ySRtOt0E?=
 =?us-ascii?Q?KfDHSlgwyfdPnwgAAhKxl41fZqCtvw6e2f6UbwbFz+9u6Shc39TaJ5tbhlE9?=
 =?us-ascii?Q?veZvW3nJ+X7ItQ0enWLONZNpfcSv6Clh09RE6WzasZqLTihid2EDtnW/ilXn?=
 =?us-ascii?Q?nadQ+edzJj6fE/DDi5M6rChwARJHMLmtmlLpL1NT57QWa6SPzQHr91YhOZ2y?=
 =?us-ascii?Q?CodvqBz41zWf0REoaAgA/iRq0rvGUxbV6v7mdWMNNBoPcwe51etX0yCg6wEg?=
 =?us-ascii?Q?bil/NSVO3xiyxTPXc8YKdRQjRluy+k755RhaNS1goeudDgYvo6vwJxzfChE8?=
 =?us-ascii?Q?SLVm5PCgw+Yvg96QQ9BT9klL2in6t+oD2pySBoGxpOQW2c3RSdCkIzIwWeMp?=
 =?us-ascii?Q?/S1BiYTY/fOYo5RCcF5GZu8CH2yd5PTzefUL9wwkji+uVnLWuOnoeXa9fPeS?=
 =?us-ascii?Q?Swj/7cjsP3qwfiOE4VH3gfZZAjtsMIV3EoZbiWjoU+qwI7kCDjx4hXLJzSsi?=
 =?us-ascii?Q?eSeM2plmoFthCSLEt9z+XlJ4DvZoVeva?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?g4H2UJa6IT9WZdl9b4hEHUQbzIpDch1G2O7lRpFJJvV9oFUIlmTCfuIzaIJr?=
 =?us-ascii?Q?t0je1IawAmG9Di8X68yv9nZ1/Mo4CiP5W+uxGEVtwFHj7yowgZpXcl25HFbB?=
 =?us-ascii?Q?zLopHp8UnIMOSPEahMO5IEzWw9FqA8ZrlVpPEqCjWGzUO7hzVq1ByO+CWdyq?=
 =?us-ascii?Q?VhZ6eV1rqtdMVJJVzHv8X1VgEHPYLHsPDZpLX0cT7JAQNKAjOMiM4aU7SAdX?=
 =?us-ascii?Q?VQTSPoLE74aIdGAwaXUdre/wDfdzNjq53Noqkw64YPVFgNp5fBrZu4sc54wY?=
 =?us-ascii?Q?3b0nmIe2T7AJBYCvVrHYt+PnyucrDeAYVVjNJ6cJ90LzIhYkaJBvH1/ncTUI?=
 =?us-ascii?Q?4mF0M/GCCqWf1+QNxC+777nO9zE6lD1M+aA/qUs0yEmIo65/KUSDzvmbVjP5?=
 =?us-ascii?Q?2dsGrmxp32A1v4jRwjv0JFXjZRtWHQZl2l0lrzDDMYBvSI3N783JuHJ5Ljbg?=
 =?us-ascii?Q?paD0UnJO2KUWkhg2PitRi7j6/nGduQSN8sqXqxYcPyiJZugP8TTw/52ZWA9k?=
 =?us-ascii?Q?ClzRX1rInB7xGYMKIzvCy3HUztLPNOn9FFEhUSY3j7YqGCA3V1qAGfdrobhu?=
 =?us-ascii?Q?Zv0uZPNaCYxnCglhArCoMTNKn88l71g0YQvrZcZiCtyqV6ENRcCetkRUZBd3?=
 =?us-ascii?Q?7YE5dXfpAqQkfq+ztI4VPKM1asO5fFbdkOoYV2Kxy2fTzTBY+fRxh8XOjyFc?=
 =?us-ascii?Q?JMFUnQDs3QpyxO8eVwBR/H74dmFmjXsq/2XKbJ0yuRydM86NyhuDZfRtAp1k?=
 =?us-ascii?Q?TImRZFim2OSpFZNYJXfcqWRqigjZdvr7vRyIPg5nXPs0ESWjkyOdQymTcnYV?=
 =?us-ascii?Q?pUPcf4SF0TkfrSkkSM80660W3lZpiUTnStNNj6Z9UPDzzaw2qqnsehF1JPyS?=
 =?us-ascii?Q?SFCmmrOx/4tF488dBs+id0GBjOXc9IdJ0h34d/RECucONOcZzKwtFQT3ntwQ?=
 =?us-ascii?Q?ruks7SQ5IXw5ElFgcahz2hv5KoRLXj5fc2mn8ocHNVhyZVfsBTQTNOgdXY5e?=
 =?us-ascii?Q?iZ9rQyWJ3KrrtO7xQz4lyRZX33Uz+9cVbXF6O6GaN5OVpfyeCr4/eHKg7gfg?=
 =?us-ascii?Q?S9K9qRBySXU5p43yGwo0Ge9PBhmpguZg6Q+if9b7LSxaCcXLNe+6P3jRL34b?=
 =?us-ascii?Q?z6QfkgSKr/ZPlFyRWZhB7LHowbL1hdePhRZXIwHKggILR/7PQt5E4gAHZtPY?=
 =?us-ascii?Q?T7l9m+qWgjH8NhYiIGjwTsmLuJ/ttMBAjhJHLsNqUiPj9IDpFPYEDn27rpSA?=
 =?us-ascii?Q?tcua0mpA/BYSI6mGSon9BFwS31U7OmEE/cyV2VOq1LllbFx+6HL0Qs01g/WD?=
 =?us-ascii?Q?B2LiS+KJ9PQ3gOlCjhp+q52mFoQkxqS218biNvSU9N0MmfEmfkzE/awCBH3G?=
 =?us-ascii?Q?B7+bWGLdwXOGOme4b8bkf/hCQXJnsNMNjxWkn7KBNK3ZDsy6wd1+3GHObi+i?=
 =?us-ascii?Q?Bqj8bHpn5I/6/yKeqsXMzCzwf4vTGbfBmyBdVoYsjbPpaW1FbChfrDwqh+Kr?=
 =?us-ascii?Q?0tWqUCZRHH0w0AE6U4xV9aATTSBMtY5mROKZQIUWWn2ryPhULsLXQvXFpWXc?=
 =?us-ascii?Q?cvrvGJb2E3LGXwlEu1XboktOTwqjrA34WKXL6Ri/kxTHRohsf8gx3av8b+DV?=
 =?us-ascii?Q?Rw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ab06ac71-5c85-43a2-7a6d-08de2d0aa736
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 16:41:31.2889 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2SGLmH/rmkAi46cWJPzwb7igugjQjxmiI2nTLboW27coqBFKsXm578gBksBIWMXfYd5U0Pk4YWfH+ABFmf10Rg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4751
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

On Wed, Nov 26, 2025 at 02:19:10PM +0100, Philipp Stanner wrote:
> The dma_fence framework checks at many places whether the signaled flag
> of a fence is already set. The code can be simplified and made more
> readable by providing a helper function for that.
> 
> Add dma_fence_test_signaled_flag(), which only checks whether a fence is
> signaled. Use it internally.
> 
> Suggested-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Signed-off-by: Philipp Stanner <phasta@kernel.org>

This is a nice cleanp:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/dma-buf/dma-fence.c | 19 +++++++++----------
>  include/linux/dma-fence.h   | 24 ++++++++++++++++++++++--
>  2 files changed, 31 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> index 39e6f93dc310..25117a906846 100644
> --- a/drivers/dma-buf/dma-fence.c
> +++ b/drivers/dma-buf/dma-fence.c
> @@ -372,8 +372,7 @@ int dma_fence_signal_timestamp_locked(struct dma_fence *fence,
>  
>  	lockdep_assert_held(fence->lock);
>  
> -	if (unlikely(test_and_set_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
> -				      &fence->flags)))
> +	if (unlikely(dma_fence_test_signaled_flag(fence)))
>  		return -EINVAL;
>  
>  	/* Stash the cb_list before replacing it with the timestamp */
> @@ -545,7 +544,7 @@ void dma_fence_release(struct kref *kref)
>  	trace_dma_fence_destroy(fence);
>  
>  	if (!list_empty(&fence->cb_list) &&
> -	    !test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags)) {
> +	    !dma_fence_test_signaled_flag(fence)) {
>  		const char __rcu *timeline;
>  		const char __rcu *driver;
>  		unsigned long flags;
> @@ -602,7 +601,7 @@ static bool __dma_fence_enable_signaling(struct dma_fence *fence)
>  	was_set = test_and_set_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
>  				   &fence->flags);
>  
> -	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
> +	if (dma_fence_test_signaled_flag(fence))
>  		return false;
>  
>  	if (!was_set && fence->ops->enable_signaling) {
> @@ -666,7 +665,7 @@ int dma_fence_add_callback(struct dma_fence *fence, struct dma_fence_cb *cb,
>  	if (WARN_ON(!fence || !func))
>  		return -EINVAL;
>  
> -	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags)) {
> +	if (dma_fence_test_signaled_flag(fence)) {
>  		INIT_LIST_HEAD(&cb->node);
>  		return -ENOENT;
>  	}
> @@ -783,7 +782,7 @@ dma_fence_default_wait(struct dma_fence *fence, bool intr, signed long timeout)
>  
>  	spin_lock_irqsave(fence->lock, flags);
>  
> -	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
> +	if (dma_fence_test_signaled_flag(fence))
>  		goto out;
>  
>  	if (intr && signal_pending(current)) {
> @@ -800,7 +799,7 @@ dma_fence_default_wait(struct dma_fence *fence, bool intr, signed long timeout)
>  	cb.task = current;
>  	list_add(&cb.base.node, &fence->cb_list);
>  
> -	while (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags) && ret > 0) {
> +	while (!dma_fence_test_signaled_flag(fence) && ret > 0) {
>  		if (intr)
>  			__set_current_state(TASK_INTERRUPTIBLE);
>  		else
> @@ -832,7 +831,7 @@ dma_fence_test_signaled_any(struct dma_fence **fences, uint32_t count,
>  
>  	for (i = 0; i < count; ++i) {
>  		struct dma_fence *fence = fences[i];
> -		if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags)) {
> +		if (dma_fence_test_signaled_flag(fence)) {
>  			if (idx)
>  				*idx = i;
>  			return true;
> @@ -1108,7 +1107,7 @@ const char __rcu *dma_fence_driver_name(struct dma_fence *fence)
>  	RCU_LOCKDEP_WARN(!rcu_read_lock_held(),
>  			 "RCU protection is required for safe access to returned string");
>  
> -	if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
> +	if (!dma_fence_test_signaled_flag(fence))
>  		return fence->ops->get_driver_name(fence);
>  	else
>  		return "detached-driver";
> @@ -1140,7 +1139,7 @@ const char __rcu *dma_fence_timeline_name(struct dma_fence *fence)
>  	RCU_LOCKDEP_WARN(!rcu_read_lock_held(),
>  			 "RCU protection is required for safe access to returned string");
>  
> -	if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
> +	if (!dma_fence_test_signaled_flag(fence))
>  		return fence->ops->get_timeline_name(fence);
>  	else
>  		return "signaled-timeline";
> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
> index 64639e104110..19972f5d176f 100644
> --- a/include/linux/dma-fence.h
> +++ b/include/linux/dma-fence.h
> @@ -401,6 +401,26 @@ void dma_fence_enable_sw_signaling(struct dma_fence *fence);
>  const char __rcu *dma_fence_driver_name(struct dma_fence *fence);
>  const char __rcu *dma_fence_timeline_name(struct dma_fence *fence);
>  
> +/*
> + * dma_fence_test_signaled_flag - Only check whether a fence is signaled yet.
> + * @fence: the fence to check
> + *
> + * This function just checks whether @fence is signaled, without interacting
> + * with the fence in any way. The user must, therefore, ensure through other
> + * means that fences get signaled eventually.
> + *
> + * This function uses test_bit(), which is thread-safe. Naturally, this function
> + * should be used opportunistically; a fence could get signaled at any moment
> + * after the check is done.
> + *
> + * Return: true if signaled, false otherwise.
> + */
> +static inline bool
> +dma_fence_test_signaled_flag(struct dma_fence *fence)
> +{
> +	return test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags);
> +}
> +
>  /**
>   * dma_fence_is_signaled_locked - Return an indication if the fence
>   *                                is signaled yet.
> @@ -418,7 +438,7 @@ const char __rcu *dma_fence_timeline_name(struct dma_fence *fence);
>  static inline bool
>  dma_fence_is_signaled_locked(struct dma_fence *fence)
>  {
> -	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
> +	if (dma_fence_test_signaled_flag(fence))
>  		return true;
>  
>  	if (fence->ops->signaled && fence->ops->signaled(fence)) {
> @@ -448,7 +468,7 @@ dma_fence_is_signaled_locked(struct dma_fence *fence)
>  static inline bool
>  dma_fence_is_signaled(struct dma_fence *fence)
>  {
> -	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
> +	if (dma_fence_test_signaled_flag(fence))
>  		return true;
>  
>  	if (fence->ops->signaled && fence->ops->signaled(fence)) {
> -- 
> 2.49.0
> 
