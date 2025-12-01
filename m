Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3CF0C98E16
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 20:39:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97B6910E47B;
	Mon,  1 Dec 2025 19:38:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AWHs3ZWD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAF1810E475;
 Mon,  1 Dec 2025 19:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764617937; x=1796153937;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=os6mC3PR3L+Npi6p6u29VMcME686/keZN91iQjPht3E=;
 b=AWHs3ZWD8rjtkQtDGoYQ4Dp3O0VNVxzJAPT5Sx2Od8O6kEG+Zgx9j4cW
 7HPpafLZdCBcNwWci95ZY5FWgr3kGeqGF5DN8vBhazKOlXlJ7KARgWyto
 B2k+iDvJRJlGWeH8yUPxSKdGh3HenFnc3hEzmCXiwJXLYLPtVk3ZfNgp9
 R6cPHDHFY8k422qg5DvlYmzX640ZeYhGHoXALiNROoPF+ZN4zjBC25lUw
 XIv+ieuzJVzR9ENraHn2YRbwvkJtIACTAkR40bTuIdulIrN8xaSqsBdK4
 5bT399EeJvS8SR3BVMcVpahtdnitvqRUgwEGrknB9/hP3Wgm/xHRYOlxP w==;
X-CSE-ConnectionGUID: fNjrCBR+RfG7W6qsPiqXkw==
X-CSE-MsgGUID: lwCKnU3BQ8yRA6AIDc+8xg==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66457123"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="66457123"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 11:38:57 -0800
X-CSE-ConnectionGUID: 30Cv2UHjR7SROo87c4RxkA==
X-CSE-MsgGUID: fHr2L5uqTmy54aqlCE104w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="194157889"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 11:38:57 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 11:38:56 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 1 Dec 2025 11:38:56 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.28) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 11:38:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RVN05pJkuBTo/hn0uUhAvSIuEvXRXgRkoe918+fCFvsFu+3qHMsrIaMDSQ5UIcChJvKUU7ygu7O/l6bCkS/XnKg7038qHzWxbPzfWskV5ZJSP8B/IBYaUxUjcMAlmZcUAcjDg1JSSDvWnpjFAl0W7s++4j4pomtjuUV7j/DZpDKsQ7QSkHCFK7pkymVTo+YaoERobYLzBJOAuzOGYR4xdDAJ0csVR4PlUNxrzbxZRdYlWt1c3hkCxF9zVTRPDkWM2MKl3hZWJqV9YmVXbmpPgM3+oIScbIQb3WIhvFrR4wSnDW6ePibNhp5VtXVlVeivZ+XHQQ/ZqFdjQGiU+C2fRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y7OCk+PwphsNbgNxj2yluGhYM+wNqnXyai7kt2YZSKA=;
 b=R3Om+wFuu4SatC5C8LSxaGHVnR+j+oLZfCTwQy9XgyaLTNDC8uzn0/ubz+Xq0aEz5bFgXHMXavFcfztO5Skw2TVLTqOphB0KgMht8t0fhjFFYWEjqXXNz5trB71VbvRvf8T9ROpd5x9LjWQF3087hsSqsyeLb/0ObD+FEliMi0hLeVI9g4ShSBVg4r6Ol9YTJ1abF9h7MGog7YZaS3PDNQF4oMXPT1x1gBxb98iKLFJiV+o2Oy4grm+wmnEQXM4VjILgW4Zirqi13vhxLaDK5z4Dh/W0Bc/aW3Ibf5KA+cehchVT518aH3/04khjkC5m4j0ZZ9Bktf5V4VKo44AYPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB7580.namprd11.prod.outlook.com (2603:10b6:8:148::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 19:38:53 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 19:38:53 +0000
Date: Mon, 1 Dec 2025 11:38:49 -0800
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
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <amd-gfx@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 4/8] drm/xe: Use dma_fence_check_and_signal_locked()
Message-ID: <aS3uycB40j2CptOf@lstrano-desk.jf.intel.com>
References: <20251201105011.19386-2-phasta@kernel.org>
 <20251201105011.19386-6-phasta@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251201105011.19386-6-phasta@kernel.org>
X-ClientProxiedBy: MW4PR03CA0311.namprd03.prod.outlook.com
 (2603:10b6:303:dd::16) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB7580:EE_
X-MS-Office365-Filtering-Correlation-Id: a806dd72-6f5b-4fab-f5ba-08de31114247
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?v4LJr3RexJ3unsfxXKJCRIwwJhrAJHHfy7N0pSO7e8odG37iiN71g0YH/exf?=
 =?us-ascii?Q?sFdbHMuNkddQ2wvsaEQcb//2O3skOX5cEizvVfn3DNtQlTAj55EWNYcOOymh?=
 =?us-ascii?Q?7E6FyzOU714QLiNfXz/7LJDBaB0LfGgpvMUpnwyRvKjmPMybAmY9COMIyS1t?=
 =?us-ascii?Q?9bqbKVncPLm2eKR4xQrHKtXaHvP2sTnVljVvWANGXTkUg+2bGIVChQu9C/zj?=
 =?us-ascii?Q?XriVsaw03KSyyqrvJFMi8iIInjZ+Ced9Rqy7k2Xt4JxVFKEScUZ9vpoNRvab?=
 =?us-ascii?Q?/j/WG+iGjA2KxKXNwgXtBrd2of2CzKt4hLdKTXqO/+IEHesWCZTFYnBGQD5S?=
 =?us-ascii?Q?/XWiLVmg2+WFVBs0PV7qMIexPPPnqoY4eF78hfSSTB31LAMYo+pv5wCrubkv?=
 =?us-ascii?Q?84Xrj9nliSo/hoeqzNvX0LTa8KCIxL5MrccnTxhKemEgqgDS0Fu/kmUx0wLV?=
 =?us-ascii?Q?tmlMt+R+KUanV5BX3rg0DYjcdrZ7e5RIUEGyoTX52EiRs3gw1AwAPTcoYzp+?=
 =?us-ascii?Q?vnA/uoVYRnD6dhnF8TPxQrzOpQAZJ5lj3Dc1mqSzFvpfRB+VZGFDhpUfGWaD?=
 =?us-ascii?Q?I93unh1S/En+RBgU7CPDJw+/PCG+G4YzMbTV6H0nEm7r1UuIgO1a7lz7T6m3?=
 =?us-ascii?Q?BhbwOi61OGyA1N6gR+Aj4XLmdEhzy+7zIvItWci739ILBJXOa5ESEqD3Y/zW?=
 =?us-ascii?Q?XpzHBsPkwwFuf9yOsXYzNxfO2MzSezx+qXUVVQeX1RJFJaL6EE/SBHiCnzyC?=
 =?us-ascii?Q?WHgwxE8yv/1uV7u5K+o/xv3TTAhoHCse5t7/gyLHdVQc9Ox+YMtvU84KeEr8?=
 =?us-ascii?Q?4yNU5G7p2VPeKnKXYnZ22B/KnRycpbnLVK3AD/nALD+YL6gyXrs7LH7JANQn?=
 =?us-ascii?Q?5DmrC9vKj0BNO9hQwbSzR6FqFyjUEqkscDV2PxqHguXZ/GhzQ4h2R3mEHPnY?=
 =?us-ascii?Q?jK+2NhzDzjLpiy47EDVjVtoUTcp4/3Gq2XgRZq8eSUq2yN/dyz0HJY8ZQVL0?=
 =?us-ascii?Q?ZU5Bm2kbub2zxeb5SvLQPc/Nwb7e/6CikZt4BKaUsaZ/u5CmkeRHsWdxCOoO?=
 =?us-ascii?Q?dxgsAQOo7JSv2DQSJgfHiNtnQBGgOmpNiaTERNuQuXC4D+7H4Ij881QsyA2L?=
 =?us-ascii?Q?Q4JaqrJ1YGsHMJZzXtEnSpVUJ0qt5uQ7t0A78rcksgy4Egyrq5SZylsR7qTv?=
 =?us-ascii?Q?XU6JlM1Zyo8Qng78NUbpFUM1pJTIjtQ6ijzwvT+vTwQ6RxBReCQqKqFwgaXI?=
 =?us-ascii?Q?fzjwDX7JtY7L/89926NXL3A866Wbzd/PpwvO++eUtYUrqj4jpTSrAY0MFawW?=
 =?us-ascii?Q?n+t2EU+bNTaEF/OzLKNe9hnHYwdMka7I6rijmsq4nTDtm91W1FShPM+YYO5M?=
 =?us-ascii?Q?3j8BfLppBUeUqnckkMUpNpIKPJ2Q5Or23DuGG/kl+f/IGPesd+nXzAv6Zl3w?=
 =?us-ascii?Q?P5DjwnkknC+QmHoLdFOO+STCCxQ2fwbp?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YuNR4Qp87Qbz3BQftYfcsgs85i94gPF1gvVOMsD3NzWgna30oeLuO2gKUln5?=
 =?us-ascii?Q?CHckv6MtaXgdLzfHdhRuUNUrlVzzD9MJjB7cWJ/4hd+vM5OTWoaVnlOnp92w?=
 =?us-ascii?Q?0ZW935v7rHQgQGYr7Mu8QbTe/zXF+rPbPRtzhF/8OvrkyjYNHWzT2LYoAEAh?=
 =?us-ascii?Q?mxZ8Tx8k7/7WPseucNlJmEL1rgjesutRrfGaGPt7vX3/w9eJBZFha53SbYeC?=
 =?us-ascii?Q?FJkgHLbtLWJD87vYnu/P/f+dl+9SAg3Nuu9WJgwVqNxhnyjyX+dRZjO9ZXQD?=
 =?us-ascii?Q?7w8Wj9QOa8vCV0fmfpUzPzQyddVBlrpnuz9uSLRmcGmuECPJ6js/9aDsvlhA?=
 =?us-ascii?Q?dHIB2jsRAWfJUgFkQqu5OPX3TwTMc/kyB6t/YuTPlbu3UALjhN77W7anRGgK?=
 =?us-ascii?Q?1bksxajlvHsWxUzhvAF7b5rZihAbXCWpC9EhpyRO5EanFXcrbsgcFQBNod4t?=
 =?us-ascii?Q?dTOuvNsPIoM+Cm94GnSvuW8SxlDo0xK60S8N2DV8WY2kZlec1Ts5l/V5wX6g?=
 =?us-ascii?Q?47b8c6VWfTa5p51qlQRTBtVi2BIxS6ANQ32VCEN9RFG10uC08JxCJAIEM0yB?=
 =?us-ascii?Q?u1AIrzkCdS/Rksj1voGYLimMrXr9qPi0M49bacM0ShHaPyVb7W08+weyXbBM?=
 =?us-ascii?Q?QkfNLh3DYq+wLVCdRR2AXnUX/e1FlIL/75GjuXTQ08CnIbR6TexrU5wC/XDz?=
 =?us-ascii?Q?L0HbQTf/brPtjGqQCQmScmbWvwpAjuEviWSqZ3317RSXKctyA1ulBJK5OBdq?=
 =?us-ascii?Q?xUVP6eOBtjCsqGQ/MUAost3+qbslBEyz+9VFsH+sGVlU2zzjEHDhIwaRGhlQ?=
 =?us-ascii?Q?/k09qGJwBiBKzo9YO+QsR4EJ7658STAjdi+rpV/IeZhX/lMxjIkNGr7HfYdg?=
 =?us-ascii?Q?Tz3G4xm5A7i8i62OSkjUCLUpnBHSvomNhk7HkT6Um5ybpvjrG6wakowU/Hjf?=
 =?us-ascii?Q?aott0Iq6quIImV0v1vW/grTo1LZtrqoxJpNpFG09xmNhcLyuhBvcIA+XVpZD?=
 =?us-ascii?Q?11n0NgSfHIYM4UuKB8Sx3qdyG286L8I49NP3s1dbFsJ9wt09+eaSqNlbOyLa?=
 =?us-ascii?Q?5NTJtA0oALSHbuoUP0P6N6/GU7KVUCCGR2GRx9XvvaUslBe8eKGGf0J8iOcJ?=
 =?us-ascii?Q?N2743kCOfIyvK93cBJDcHYEr3MmED7NV381QURO7jPyhHWhpaTAQT20Dj9BG?=
 =?us-ascii?Q?b8IgGJs1aHNOIwyvuyPGzWVn7HeHoFdZ008P47vsaIJbd6Zg9B0yq324Tz+E?=
 =?us-ascii?Q?2/IyhHIT8l9Bv4fqHU/slhI5F+OYD39lV2r6K5wK7kV3trvmSMIyIggIJOef?=
 =?us-ascii?Q?1Yp6HAisCRjA12K3SR5Lk8K/oZ0i9mZi1DGnwUd44FHoa/6Ul1myzj+82N5l?=
 =?us-ascii?Q?/7NXCX9gf3bXWJlvG+YSbmZ8XBmzIO4rtgNpdBeC548FFtyAuh2LvmaQzvGE?=
 =?us-ascii?Q?1acsQPt+o1V8zsnASPHEsAnPDPUo07BKt4NkGxRzKx3TA/ouWgIrZ/OYGuqk?=
 =?us-ascii?Q?pzwJ2ORL1yZ9qU+XxtL7bKE80pfn1HE38X3ewlpR0mEjaHoRHoK6U4i3mJ3L?=
 =?us-ascii?Q?TOO7DiWpgzaqqlGi6FJt1I0lZ2zE+tM8UH/shYkcaq9NOT7tIH2lXP/oGIso?=
 =?us-ascii?Q?eA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a806dd72-6f5b-4fab-f5ba-08de31114247
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 19:38:53.3361 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XYv+V4/CEsdJKTebdK25v+j+24i8377sEGQlKTnTmzRuAQhpdtBAukgMGeLgr8bH4z2jZGTA9+m4NqAlpG9RiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7580
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

On Mon, Dec 01, 2025 at 11:50:08AM +0100, Philipp Stanner wrote:
> Xe is one of the few users utilizing the return code of
> dma_fence_signal() to check whether a fence had already been signaled by
> someone else.
> 
> To clean up and simplify the dma_fence API, the few kernel users relying
> on that behavior shall be ported to an alternative function.
> 
> Replace dma_fence_signal_locked() with
> dma_fence_check_and_signal_locked().
> 
> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> ---
>  drivers/gpu/drm/xe/xe_hw_fence.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hw_fence.c b/drivers/gpu/drm/xe/xe_hw_fence.c
> index b2a0c46dfcd4..f6057456e460 100644
> --- a/drivers/gpu/drm/xe/xe_hw_fence.c
> +++ b/drivers/gpu/drm/xe/xe_hw_fence.c
> @@ -85,7 +85,6 @@ void xe_hw_fence_irq_finish(struct xe_hw_fence_irq *irq)
>  {
>  	struct xe_hw_fence *fence, *next;
>  	unsigned long flags;
> -	int err;
>  	bool tmp;
>  
>  	if (XE_WARN_ON(!list_empty(&irq->pending))) {
> @@ -93,9 +92,8 @@ void xe_hw_fence_irq_finish(struct xe_hw_fence_irq *irq)
>  		spin_lock_irqsave(&irq->lock, flags);
>  		list_for_each_entry_safe(fence, next, &irq->pending, irq_link) {
>  			list_del_init(&fence->irq_link);
> -			err = dma_fence_signal_locked(&fence->dma);
> +			XE_WARN_ON(dma_fence_check_and_signal_locked(&fence->dma));

I think XE_WARN_ON can compile out in certain builds. Best to leave warn on logic as is.

Also a little confused by this new helper... Doesn't
dma_fence_signal_locked already check if a fence is already signaled and
bail? Running out the door so I don't have time dig in here, but can you
explain?

Matt

>  			dma_fence_put(&fence->dma);
> -			XE_WARN_ON(err);
>  		}
>  		spin_unlock_irqrestore(&irq->lock, flags);
>  		dma_fence_end_signalling(tmp);
> -- 
> 2.49.0
> 
