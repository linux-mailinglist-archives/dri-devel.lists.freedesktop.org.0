Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB3A9A70EB
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 19:20:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F178B10E56E;
	Mon, 21 Oct 2024 17:20:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hs+lM2uQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 010ED10E56C;
 Mon, 21 Oct 2024 17:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729531211; x=1761067211;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=8k57ha4RV4T1MQ3+BzmzaSVIb6lk3GlYwodfS8kb1iM=;
 b=hs+lM2uQDs/pn3dbXaJk4utvwP4HRk2UlPugNAPJG4mDl7sofCQ3m9tw
 HejnRUH3tzpgnAQ25ecloxvJ8o9QUcdSZh01vo7Q6biY7Ilr3NuIi61Tl
 YXCAyMxzqjmXeUVp5+wmmRHbpTy38RMhgDrywmw5I+rkkl7CSs3/vDq44
 VnLuk+rR/YiDlZWLpjiLFPDP6w9pKUJiJMOTPAbtPNED5pfaF+hSgcrNx
 hHH9u8Whi38FX1mbXbFgVxwTeYQjlLpA+DbpsKhKMci1s3mwQX837Eltn
 RPTLNKg3r7VOZIJwj6EaCW8OT/wLDhdDE6PWh66ZMUnbnPGOQeV4LGtl1 w==;
X-CSE-ConnectionGUID: SioQACBXQxWR6wXSLguhpg==
X-CSE-MsgGUID: KATCuqeoTImIFOokzkp55A==
X-IronPort-AV: E=McAfee;i="6700,10204,11232"; a="39615584"
X-IronPort-AV: E=Sophos;i="6.11,221,1725346800"; d="scan'208";a="39615584"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 10:20:10 -0700
X-CSE-ConnectionGUID: ojeJ2wSYTtSB7GGRLJqx3A==
X-CSE-MsgGUID: 053NTpJ2QWio+3UdsSmh6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,221,1725346800"; d="scan'208";a="79534260"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Oct 2024 10:20:10 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 21 Oct 2024 10:20:09 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 21 Oct 2024 10:20:09 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 21 Oct 2024 10:20:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MIr2atSNPpmJ2+zJX0oDtVnPQ8/Ebf/O6W79Hk82HVW6ZTMiftCIAL0UHDNef4NX8iRmwZUIbCBIysDlMiChi1yqY8G/xAbSMPWcyz+L5pAK/BgWy4Fp3ANMWokju990yKg8+qHHGyBlzWdtZqEJ/WCyO4HHKVdEC1ZmganysquVlzadnU1mp1AdV3LWjhgbtTT7tS6f1k4AIIeXGua5Vzw9QLsnVTpjUtZqbzyK1fZuoh3s16JwWLfpULcInBqGREitAg7JabEtcMuIhZx6xxwGjyAjAXgW+/j+2PNybKtUFP4kfQDYr5ZmV80NqDik2gH5xvSR/1X2Gfd/dUrVBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rgb0g1GRi65+UDUYSaxZbM0nXiTTDFLexR8cx8Hipf0=;
 b=GLkydiFEtHyV+LWCZ7OnWYg3dWVQHp7oDbzCmGZ4OBO8LEZinr3mN8RZ3bPqxNMvQ0ouuLL1iOCWGjpSP/6z9NqFMsqKEakldvfsolctSXg1xaVW5hxgY7cRmANqhXAbks/TipILuOQtUvit10Q/W0OW2wjE3j34wEk9+6D9PvNI1eeM/Qg/cCF/tfhQO3BVVrkG/PWppN6MRtNJwmt1WueawkT2KnLH4Pq/J1azea2YTVBsOx87RtwMIvZfKAgdSpsZc2TZLYUhvBBhIyPeJlLYuP0J5NaEliof/RqL2JTyOuu8evEM4ugY3oGYOnS3C7FHOK4gwgk03sIT03/liQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB5942.namprd11.prod.outlook.com (2603:10b6:510:13e::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.20; Mon, 21 Oct
 2024 17:20:01 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8069.027; Mon, 21 Oct 2024
 17:20:01 +0000
Date: Mon, 21 Oct 2024 17:18:58 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: Matthew Auld <matthew.auld@intel.com>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v3 3/6] drm/xe: Update xe_ttm_access_memory to use GPU
 for non-visible access
Message-ID: <ZxaNAhbL9E8H6GPQ@DUT025-TGLU.fm.intel.com>
References: <20241019192030.1505020-1-matthew.brost@intel.com>
 <20241019192030.1505020-4-matthew.brost@intel.com>
 <4fc5fd25-dc7a-4e13-a6c1-adec1f20e5fc@intel.com>
 <0e75325ea53f1bfe8a22af662c31c3620ddea58b.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0e75325ea53f1bfe8a22af662c31c3620ddea58b.camel@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0291.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::26) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB5942:EE_
X-MS-Office365-Filtering-Correlation-Id: 97bdaa51-3af0-4a6f-7b22-08dcf1f4984d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?prbDS5qOBmygDRSnIyeqHyyD6erYljyU80sX/LU1smbjiMHxcmxpROUnuk?=
 =?iso-8859-1?Q?uFVFSStDiDmMU9AsAaeu+MvE5y9HBxa7+jVy25YSmXgSE95250neN7/xjR?=
 =?iso-8859-1?Q?BrJQjg0DXPQPGLxTd57fsw3KsbArTGnuymekA17aw53wkeGaRA8F44/89i?=
 =?iso-8859-1?Q?7C10/1FZJp4cEbRApxEmKFMlUkL2R6ZnTAcU33Wi/ldi9pJsCGQ6+yv5de?=
 =?iso-8859-1?Q?BXPe3ohK70chYPbZ174hBICCduivmgPsEPp/02R4DTe5mX6Mn5vo1hL9Jo?=
 =?iso-8859-1?Q?Z2Uo2BDr5Dw7CeDDd8ZLq9nA+gi+FnvI8MDnonGr8mGtfeYFylZU0X+bWb?=
 =?iso-8859-1?Q?VUyil2UczXrDPog4D7w15k457w7dtZVEhZSwinkhGOzDRg0bm4/rzHOJvr?=
 =?iso-8859-1?Q?iBTi4+xA1NfYlZ53LRIZpJbRJL4CXmE5480CEAYhz2N/QoqUog06RZChHJ?=
 =?iso-8859-1?Q?2jfzNcZ6NnTHmIx60/WJnGDjNwwCZGMLetzgthppmfuq88k+kTWU30X9cB?=
 =?iso-8859-1?Q?CxW4FYMsjOSY0WLPCbfC4QHjA9uEfVJX0VS1F5hPv4WXUPtiXDu7qEAnVX?=
 =?iso-8859-1?Q?91HEKlozCaVH5u1FE7S7XkWChrre4Hi24hHmBmEowycxV78zVID+Efy/Bv?=
 =?iso-8859-1?Q?A56oR13Ti6k5NikRvGBjpl981AQGnFAaY/0gGDl0FF/0jAXJfaVvLMCuuv?=
 =?iso-8859-1?Q?04ptjYks64glE+X479QvkXm/59qY4pK/6R173MptRUJxqC2GNsxEjjAQld?=
 =?iso-8859-1?Q?h5kEEbAbFpi4eqVQRZmjZMIndFut/M7vUHETEJmD852RXJkDMl+4K4WbbK?=
 =?iso-8859-1?Q?HeMSpi+/QuiW7XU4U+vPPsSrNuV9FhfIai/XMInsD3J1mukrAkaPqvSpRK?=
 =?iso-8859-1?Q?cjcsZ0azB9HyMFgMiDw1OpMDkfzhWjwO0WjHV/pvSl9jiyXZpYD77OaSOR?=
 =?iso-8859-1?Q?bbk3Sm5vrvjDNH0E2i0HhC7Jc48vfW8GGXwcuA7+35oK9YlHpiO5makYho?=
 =?iso-8859-1?Q?B6pW3D2jg4pXK3JHvmFsB/oXdJTu1JonkJDw39IbbPzGsHv1ZCEnW1q9uc?=
 =?iso-8859-1?Q?eZiXHdrsA9uhdU7ufJVzPtwHLJ9vf8AS2kXbN0zqwk6uyigzuX5WhtkH1K?=
 =?iso-8859-1?Q?Wx51mMkjGo8dItYkCVIMnYUN7dRcmDJurzjxonKmyS9G0ZCXg7dfOG4EQE?=
 =?iso-8859-1?Q?PyAEuO2r28tD2Hf4hTwtkhz6AxbszNml+UoB9F0AKfmRnn1jsPbU7KBKKG?=
 =?iso-8859-1?Q?rTg+Ra8hptWgClyVTgsoeDznmBGiyPaO90aE942hnTX3LPgBfa+d0uA5RH?=
 =?iso-8859-1?Q?7FO7Gr9DO5+4CxnRQogvUaJZPANj37xPy3rArk9a0iGtFfI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?HfDOGX0u0470h6PIqLZRyjqacqVezHHo3OzXimthWRjYlWlH6v0l/9tShF?=
 =?iso-8859-1?Q?HkddmVGdfSFOgb6YF7LeadcrNILhx0lyX8PXZ2/JaDrrpQl1Guf6sDXCAj?=
 =?iso-8859-1?Q?WdSufmypn5372o9tyhsDUSa+XG1CirbTWsZKQCv5p4OiRtnC9JMz1UBytT?=
 =?iso-8859-1?Q?bW5MXYFFG6iGqYg/QGtv+06YW8Be9jlFYi4UYrOchBEWVplKCinzPHXiXc?=
 =?iso-8859-1?Q?G/fQIQM4ND+onFnuDH9vQ/CTe3FaVIAMWImH5bo6R0VMFomk1QbeN0wDhG?=
 =?iso-8859-1?Q?ceV55S2LbIkjeH7glvO516xvVzz54ku8qLm3zZjj1cQDl8sVAB32Awt0BQ?=
 =?iso-8859-1?Q?/WYt1ml+yAnvMUIXaVdJ5XHlv82cw53gQdFrv6fmLE2Df8YlPNmrom+6/+?=
 =?iso-8859-1?Q?WnWWodDw+WqX5wWR7ZL8dGqQcFhaXtQIuWoPKSZKekQ6sO8dDvjrJZMuI+?=
 =?iso-8859-1?Q?1LZp1jlhWimkBNA7LLsENqykBQPxwoocTs9ibv2ii3NdNcZ985q80KPTb3?=
 =?iso-8859-1?Q?fWGtKKXnTN5Zx10OI1rBNsjRuo7+fV1UgtnNEJFxd5DQkODwGzcgnO6ku0?=
 =?iso-8859-1?Q?xNelSa6PNhakuSsimHkeFjvFG9wjnZ+5CIyWNZGTVTHf0we3QcVSePnM3T?=
 =?iso-8859-1?Q?bW5yM0a67jTdOA15IsGj//1+VK7OELdcRz4z1/u0AGd1ubIKV6xzEfDMvy?=
 =?iso-8859-1?Q?bSXoHmYjDbdLaHmiVxBSlEoYZp64rLhFD1mpD4B7PRHTAi/GcnFZBfO5t+?=
 =?iso-8859-1?Q?CYvpaZYNjjIQdnVQaOUx/c2HlUGwTITM+MPLXm6+3mnEtfx6oGC4ZbcnKc?=
 =?iso-8859-1?Q?mq3fnvxlCR6fjENAaeDyU5OusBG9dRgKsTkJLeuAw504IRfyb0UHbRVA+c?=
 =?iso-8859-1?Q?AQqIuYPYVVufSznBWL/lXbx2FHRkbojicq7BMA0NcC+66ATfnHI+FVm04m?=
 =?iso-8859-1?Q?HR446vift4r7m3qhPW+DiOtaCM6B7/aU2aeSDanUgTNnjZNHeHjR27hZM6?=
 =?iso-8859-1?Q?mpDZVD+885SRtFcBBJn4K/uwgSrUsBu0+R84xK49O9mwPLCtbewC1ApVoC?=
 =?iso-8859-1?Q?X0F4pxFTL8o3rBw5ERKkOGtByyhwzExRNTT0NJNGvXLg9kaCK77g68kxId?=
 =?iso-8859-1?Q?+xN3FdqPEfCdt0CFr3I+fW4p7spgyvT7jm87re5mjCY/40nJ5RysvnXbz3?=
 =?iso-8859-1?Q?AVg9OjG1VoXeT6jbYUm8QAkayAz7gWa+2/XUo1B19jGTe+tYCLBSV1R30H?=
 =?iso-8859-1?Q?xGlkGVft1KGLw1E5xdKWy+gQwrvawItBnwmLJKDvmIqQBGzN2uXkgwDgtq?=
 =?iso-8859-1?Q?6yJUw8hayEoRp+CXsjiosfdZe6yCqkk4Vmpew9J1LdwkEC7A/axPrdp94J?=
 =?iso-8859-1?Q?WjXzyIhG+NkJAh+qcI9poJT78MPmQmhuBX/UXC8GldLUOddle3CxzkUm5V?=
 =?iso-8859-1?Q?65ZV02paKnnIletJsJ4u+dTrRO2FxVYxRKCZfc6kR/vFfZbTvG6JWxDjij?=
 =?iso-8859-1?Q?YyhWSci7oLzFlLbOsCCQyIAT8NcRu1oaKZ13ab1zTgkH8pRuOKLX9KzU5O?=
 =?iso-8859-1?Q?ftuoV/4Lek8x4LNm1IA+/c0yfODqMkD46BkquQ+mL4bsMuQXupeFbOpgUu?=
 =?iso-8859-1?Q?spXZaCAFx6ahVhIiH0nx7L4QfGVkjIjWIuoFyoS24O2/PsS2OWvX+C8A?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 97bdaa51-3af0-4a6f-7b22-08dcf1f4984d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2024 17:20:01.0785 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vRSOTvw2ieLuyvC3NOt30uxLQy4cY1IJnyBu5+IA2hWpHggYvYXFuh/2sWyuRs3YIOJiPAhFXYkPazEhUTXX2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5942
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

On Mon, Oct 21, 2024 at 01:01:06PM +0200, Thomas Hellström wrote:
> On Mon, 2024-10-21 at 11:15 +0100, Matthew Auld wrote:
> > On 19/10/2024 20:20, Matthew Brost wrote:
> > > Add migrate layer functions to access VRAM and update
> > > xe_ttm_access_memory to use for non-visible access.
> > > 
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > 
> > I guess this needs some IGTs? In i915 I think we have test_ptrace()
> > in 
> > gem_mmap_offset.c, which could maybe be ported or something similar?
> > 
> > > ---
> > >   drivers/gpu/drm/xe/xe_bo.c      |  18 ++-
> > >   drivers/gpu/drm/xe/xe_migrate.c | 267
> > > ++++++++++++++++++++++++++++++++
> > >   drivers/gpu/drm/xe/xe_migrate.h |   4 +
> > >   3 files changed, 285 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_bo.c
> > > b/drivers/gpu/drm/xe/xe_bo.c
> > > index 99557af16120..0a7b91df69c2 100644
> > > --- a/drivers/gpu/drm/xe/xe_bo.c
> > > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > > @@ -1133,13 +1133,22 @@ static int xe_ttm_access_memory(struct
> > > ttm_buffer_object *ttm_bo,
> > >   	if (!mem_type_is_vram(ttm_bo->resource->mem_type))
> > >   		return -EIO;
> > >   
> > > -	/* FIXME: Use GPU for non-visible VRAM */
> > > -	if (!xe_ttm_resource_visible(ttm_bo->resource))
> > > -		return -EIO;
> > > -
> > >   	if (!xe_pm_runtime_get_if_in_use(xe))
> > >   		return -EIO;
> 
> I think we should be able to use a xe_pm_runtime_get() outside the bo
> lock to avoid failing, right? That would require ttm_bo_vm_access() to
> be used as a helper from within a xe_bo_vm_access(), though and the
> above called replaced by xe_pm_runtime_get_noresume().
> 
> Is this called ever called from reclaim or dma-fence signalling?
> 
> /Thomas

I didn't consider the vm_operations_struct.access case - just IOCTL
cases or error capture where an outer layer should have a ref.

I think this function is fine as it will bail if an outer layer doesn't
have a ref or I could just remove xe_pm_runtime_get_if_in_use and let
rpm asserts pop in xe_map.h if you prefer.

But also agree I think we need xe_bo_vm_access with rpm functions to
wake the device and then call ttm_bo_vm_access.

Matt

> 
> > >   
> > > +	if (!xe_ttm_resource_visible(ttm_bo->resource) || len >=
> > > SZ_16K) {
> > 
> > I guess commit message/title should be updated to mention that this
> > also 
> > used for large accesses?
> > 
> > > +		struct xe_migrate *migrate =
> > > +			mem_type_to_migrate(xe, ttm_bo->resource-
> > > >mem_type);
> > > +		int err;
> > > +
> > > +		err = xe_migrate_access_memory(migrate, bo,
> > > offset, buf, len,
> > > +					       write);
> > > +		if (err)
> > > +			return err;
> > 
> > Looks to be leaking the rpm ref here?
> > 
> > > +
> > > +		goto out;
> > > +	}
> > > +
> > >   	vram = res_to_mem_region(ttm_bo->resource);
> > >   	xe_res_first(ttm_bo->resource, offset & PAGE_MASK, bo-
> > > >size, &cursor);
> > >   
> > > @@ -1161,6 +1170,7 @@ static int xe_ttm_access_memory(struct
> > > ttm_buffer_object *ttm_bo,
> > >   			xe_res_next(&cursor, PAGE_SIZE);
> > >   	} while (bytes_left);
> > >   
> > > +out:
> > >   	xe_pm_runtime_put(xe);
> > >   
> > >   	return len;
> > > diff --git a/drivers/gpu/drm/xe/xe_migrate.c
> > > b/drivers/gpu/drm/xe/xe_migrate.c
> > > index cfd31ae49cc1..ccdca1f79bb2 100644
> > > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > > @@ -1542,6 +1542,273 @@ void xe_migrate_wait(struct xe_migrate *m)
> > >   		dma_fence_wait(m->fence, false);
> > >   }
> > >   
> > > +static u32 pte_update_cmd_size(u64 size)
> > > +{
> > > +	u32 dword;
> > > +	u64 entries = DIV_ROUND_UP(size, XE_PAGE_SIZE);
> > > +
> > > +	XE_WARN_ON(size > MAX_PREEMPTDISABLE_TRANSFER);
> > > +	/*
> > > +	 * MI_STORE_DATA_IMM command is used to update page table.
> > > Each
> > > +	 * instruction can update maximumly 0x1ff pte entries. To
> > > update
> > > +	 * n (n <= 0x1ff) pte entries, we need:
> > > +	 * 1 dword for the MI_STORE_DATA_IMM command header
> > > (opcode etc)
> > > +	 * 2 dword for the page table's physical location
> > > +	 * 2*n dword for value of pte to fill (each pte entry is 2
> > > dwords)
> > > +	 */
> > > +	dword = (1 + 2) * DIV_ROUND_UP(entries, 0x1ff);
> > > +	dword += entries * 2;
> > > +
> > > +	return dword;
> > > +}
> > > +
> > > +static void build_pt_update_batch_sram(struct xe_migrate *m,
> > > +				       struct xe_bb *bb, u32
> > > pt_offset,
> > > +				       dma_addr_t *sram_addr, u32
> > > size)
> > > +{
> > > +	u16 pat_index = tile_to_xe(m->tile)->pat.idx[XE_CACHE_WB];
> > > +	u32 ptes;
> > > +	int i = 0;
> > > +
> > > +	ptes = DIV_ROUND_UP(size, XE_PAGE_SIZE);
> > > +	while (ptes) {
> > > +		u32 chunk = min(0x1ffU, ptes);
> > > +
> > > +		bb->cs[bb->len++] = MI_STORE_DATA_IMM |
> > > MI_SDI_NUM_QW(chunk);
> > > +		bb->cs[bb->len++] = pt_offset;
> > > +		bb->cs[bb->len++] = 0;
> > > +
> > > +		pt_offset += chunk * 8;
> > > +		ptes -= chunk;
> > > +
> > > +		while (chunk--) {
> > > +			u64 addr = sram_addr[i++] & PAGE_MASK;
> > > +
> > > +			xe_tile_assert(m->tile, addr);
> > > +			addr = m->q->vm->pt_ops-
> > > >pte_encode_addr(m->tile->xe,
> > > +								
> > > addr, pat_index,
> > > +								
> > > 0, false, 0);
> > > +			bb->cs[bb->len++] = lower_32_bits(addr);
> > > +			bb->cs[bb->len++] = upper_32_bits(addr);
> > > +		}
> > > +	}
> > > +}
> > > +
> > > +enum xe_migrate_copy_dir {
> > > +	XE_MIGRATE_COPY_TO_VRAM,
> > > +	XE_MIGRATE_COPY_TO_SRAM,
> > > +};
> > > +
> > > +static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
> > > +					 unsigned long len,
> > > +					 unsigned long
> > > sram_offset,
> > > +					 dma_addr_t *sram_addr,
> > > u64 vram_addr,
> > > +					 const enum
> > > xe_migrate_copy_dir dir)
> > > +{
> > > +	struct xe_gt *gt = m->tile->primary_gt;
> > > +	struct xe_device *xe = gt_to_xe(gt);
> > > +	struct dma_fence *fence = NULL;
> > > +	u32 batch_size = 2;
> > > +	u64 src_L0_ofs, dst_L0_ofs;
> > > +	struct xe_sched_job *job;
> > > +	struct xe_bb *bb;
> > > +	u32 update_idx, pt_slot = 0;
> > > +	unsigned long npages = DIV_ROUND_UP(len + sram_offset,
> > > PAGE_SIZE);
> > > +	int err;
> > > +
> > > +	xe_assert(xe, npages * PAGE_SIZE <=
> > > MAX_PREEMPTDISABLE_TRANSFER);
> > > +
> > > +	batch_size += pte_update_cmd_size(len);
> > > +	batch_size += EMIT_COPY_DW;
> > > +
> > > +	bb = xe_bb_new(gt, batch_size, true);
> > > +	if (IS_ERR(bb)) {
> > > +		err = PTR_ERR(bb);
> > > +		return ERR_PTR(err);
> > > +	}
> > > +
> > > +	build_pt_update_batch_sram(m, bb, pt_slot * XE_PAGE_SIZE,
> > > +				   sram_addr, len + sram_offset);
> > > +
> > > +	if (dir == XE_MIGRATE_COPY_TO_VRAM) {
> > > +		src_L0_ofs = xe_migrate_vm_addr(pt_slot, 0) +
> > > sram_offset;
> > > +		dst_L0_ofs = xe_migrate_vram_ofs(xe, vram_addr,
> > > false);
> > > +
> > > +	} else {
> > > +		src_L0_ofs = xe_migrate_vram_ofs(xe, vram_addr,
> > > false);
> > > +		dst_L0_ofs = xe_migrate_vm_addr(pt_slot, 0) +
> > > sram_offset;
> > > +	}
> > > +
> > > +	bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
> > > +	update_idx = bb->len;
> > > +
> > > +	emit_copy(gt, bb, src_L0_ofs, dst_L0_ofs, len,
> > > XE_PAGE_SIZE);
> > > +
> > > +	job = xe_bb_create_migration_job(m->q, bb,
> > > +					 xe_migrate_batch_base(m,
> > > true),
> > > +					 update_idx);
> > > +	if (IS_ERR(job)) {
> > > +		err = PTR_ERR(job);
> > > +		goto err;
> > > +	}
> > > +
> > > +	xe_sched_job_add_migrate_flush(job, 0);
> > > +
> > > +	mutex_lock(&m->job_mutex);
> > > +	xe_sched_job_arm(job);
> > > +	fence = dma_fence_get(&job->drm.s_fence->finished);
> > > +	xe_sched_job_push(job);
> > > +
> > > +	dma_fence_put(m->fence);
> > > +	m->fence = dma_fence_get(fence);
> > > +	mutex_unlock(&m->job_mutex);
> > > +
> > > +	xe_bb_free(bb, fence);
> > > +
> > > +	return fence;
> > > +
> > > +err:
> > > +	xe_bb_free(bb, NULL);
> > > +
> > > +	return ERR_PTR(err);
> > > +}
> > > +
> > > +static void xe_migrate_dma_unmap(struct xe_device *xe, dma_addr_t
> > > *dma_addr,
> > > +				 int len, int write)
> > > +{
> > > +	unsigned long i, npages = DIV_ROUND_UP(len, PAGE_SIZE);
> > > +
> > > +	for (i = 0; i < npages; ++i) {
> > > +		if (!dma_addr[i])
> > > +			continue;
> > > +
> > > +		dma_unmap_page(xe->drm.dev, dma_addr[i],
> > > PAGE_SIZE,
> > > +			       write ? DMA_TO_DEVICE :
> > > DMA_FROM_DEVICE);
> > > +	}
> > > +	kfree(dma_addr);
> > > +}
> > > +
> > > +static dma_addr_t *xe_migrate_dma_map(struct xe_device *xe,
> > > +				      void *buf, int len, int
> > > write)
> > > +{
> > > +	dma_addr_t *dma_addr;
> > > +	unsigned long i, npages = DIV_ROUND_UP(len, PAGE_SIZE);
> > > +
> > > +	dma_addr = kcalloc(npages, sizeof(*dma_addr), GFP_KERNEL);
> > > +	if (!dma_addr)
> > > +		return ERR_PTR(-ENOMEM);
> > > +
> > > +	for (i = 0; i < npages; ++i) {
> > > +		dma_addr_t addr;
> > > +		struct page *page;
> > > +
> > > +		if (is_vmalloc_addr(buf))
> > > +			page = vmalloc_to_page(buf);
> > > +		else
> > > +			page = virt_to_page(buf);
> > > +
> > > +		addr = dma_map_page(xe->drm.dev,
> > > +				    page, 0, PAGE_SIZE,
> > > +				    write ? DMA_TO_DEVICE :
> > > +				    DMA_FROM_DEVICE);
> > > +		if (dma_mapping_error(xe->drm.dev, addr))
> > > +			goto err_fault;
> > > +
> > > +		dma_addr[i] = addr;
> > > +		buf += PAGE_SIZE;
> > > +	}
> > > +
> > > +	return dma_addr;
> > > +
> > > +err_fault:
> > > +	xe_migrate_dma_unmap(xe, dma_addr, len, write);
> > > +	return ERR_PTR(-EFAULT);
> > > +}
> > > +
> > > +/**
> > > + * xe_migrate_access_memory - Access memory of a BO via GPU
> > > + *
> > > + * @m: The migration context.
> > > + * @bo: buffer object
> > > + * @offset: access offset into buffer object
> > > + * @buf: pointer to caller memory to read into or write from
> > > + * @len: length of access
> > > + * @write: write access
> > > + *
> > > + * Access memory of a BO via GPU either reading in or writing from
> > > a passed in
> > > + * pointer. Pointer is dma mapped for GPU access and GPU commands
> > > are issued to
> > > + * read to or write from pointer.
> > > + *
> > > + * Returns:
> > > + * 0 if successful, negative error code on failure.
> > > + */
> > > +int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo
> > > *bo,
> > > +			     unsigned long offset, void *buf, int
> > > len,
> > > +			     int write)
> > > +{
> > > +	struct xe_tile *tile = m->tile;
> > > +	struct xe_device *xe = tile_to_xe(tile);
> > > +	struct xe_res_cursor cursor;
> > > +	struct dma_fence *fence = NULL;
> > > +	dma_addr_t *dma_addr;
> > > +	unsigned long page_offset = (unsigned long)buf &
> > > ~PAGE_MASK;
> > > +	int bytes_left = len, current_page = 0;
> > > +
> > > +	xe_bo_assert_held(bo);
> > > +
> > > +	dma_addr = xe_migrate_dma_map(xe, buf, len + page_offset,
> > > write);
> > > +	if (IS_ERR(dma_addr))
> > > +		return PTR_ERR(dma_addr);
> > > +
> > > +	xe_res_first(bo->ttm.resource, offset, bo->size, &cursor);
> > > +
> > > +	do {
> > > +		struct dma_fence *__fence;
> > > +		u64 vram_addr = vram_region_gpu_offset(bo-
> > > >ttm.resource) +
> > > +			cursor.start;
> > > +		int current_bytes;
> > > +
> > > +		if (cursor.size > MAX_PREEMPTDISABLE_TRANSFER)
> > > +			current_bytes = min_t(int, bytes_left,
> > > +					     
> > > MAX_PREEMPTDISABLE_TRANSFER);
> > > +		else
> > > +			current_bytes = min_t(int, bytes_left,
> > > cursor.size);
> > > +
> > > +		if (fence)
> > > +			dma_fence_put(fence);
> > > +
> > > +		__fence = xe_migrate_vram(m, current_bytes,
> > > +					  (unsigned long)buf &
> > > ~PAGE_MASK,
> > > +					  dma_addr + current_page,
> > > +					  vram_addr, write ?
> > > +					  XE_MIGRATE_COPY_TO_VRAM
> > > :
> > > +					 
> > > XE_MIGRATE_COPY_TO_SRAM);
> > > +		if (IS_ERR(__fence)) {
> > > +			if (fence)
> > > +				dma_fence_wait(fence, false);
> > > +			fence = __fence;
> > > +			goto out_err;
> > > +		}
> > > +		fence = __fence;
> > > +
> > > +		buf += current_bytes;
> > > +		offset += current_bytes;
> > > +		current_page += DIV_ROUND_UP(current_bytes,
> > > PAGE_SIZE);
> > > +		bytes_left -= current_bytes;
> > > +		if (bytes_left)
> > > +			xe_res_next(&cursor, current_bytes);
> > > +	} while (bytes_left);
> > > +
> > > +	dma_fence_wait(fence, false);
> > > +	xe_migrate_dma_unmap(xe, dma_addr, len + page_offset,
> > > write);
> > > +
> > > +	return 0;
> > > +
> > > +out_err:
> > > +	xe_migrate_dma_unmap(xe, dma_addr, len + page_offset,
> > > write);
> > > +	return PTR_ERR(fence);
> > > +}
> > > +
> > >   #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
> > >   #include "tests/xe_migrate.c"
> > >   #endif
> > > diff --git a/drivers/gpu/drm/xe/xe_migrate.h
> > > b/drivers/gpu/drm/xe/xe_migrate.h
> > > index 0109866e398a..94197d262178 100644
> > > --- a/drivers/gpu/drm/xe/xe_migrate.h
> > > +++ b/drivers/gpu/drm/xe/xe_migrate.h
> > > @@ -102,6 +102,10 @@ struct dma_fence *xe_migrate_copy(struct
> > > xe_migrate *m,
> > >   				  struct ttm_resource *dst,
> > >   				  bool copy_only_ccs);
> > >   
> > > +int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo
> > > *bo,
> > > +			     unsigned long offset, void *buf, int
> > > len,
> > > +			     int write);
> > > +
> > >   #define XE_MIGRATE_CLEAR_FLAG_BO_DATA		BIT(0)
> > >   #define XE_MIGRATE_CLEAR_FLAG_CCS_DATA		BIT(1)
> > >   #define
> > > XE_MIGRATE_CLEAR_FLAG_FULL	(XE_MIGRATE_CLEAR_FLAG_BO_DATA | \
> 
