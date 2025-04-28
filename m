Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 616FCA9E708
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 06:25:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A254110E376;
	Mon, 28 Apr 2025 04:25:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dK7hLJwx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6521710E375;
 Mon, 28 Apr 2025 04:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745814336; x=1777350336;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=5MHm68bBI/UeBvmS27rKaHImFDXfa6Kvv7/OiB2FwSI=;
 b=dK7hLJwxG5ngSEqVc8txf5wi5Jk5mOq7j0IlziHbRdSwCExLGiLAV36N
 QAlVENRIZMLnZIcInF5exUd35aTRCjwJtDXB0OERwL7vyJ2JvZQyGT6bR
 24DowCM4aUr58ibwSsOO2XGxx9zsOJqAbmOofigF2I+KNVmSizzI44/6w
 IF1wCJgRrmkTaefp3nj3r1hszec/lfNr5eJFtoKUxUm3kGwKJvfCQpWg2
 JGrpV2cjR8Sy/qz8JQM+yL6oYYEI5KoiQb39iGDbtVZIbiYloF6qftNtb
 +e6EQJhOy19rx19rtRE/ibIPBF4vY0Ku9Y/zLzlXuWwZGVBsbrBPL16T7 w==;
X-CSE-ConnectionGUID: fxHGLksvQyWy9buTFRQNBA==
X-CSE-MsgGUID: PJhhDRX6Tu6+bN+aAaTixg==
X-IronPort-AV: E=McAfee;i="6700,10204,11416"; a="47519554"
X-IronPort-AV: E=Sophos;i="6.15,245,1739865600"; d="scan'208";a="47519554"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2025 21:25:36 -0700
X-CSE-ConnectionGUID: +6js7weMRwKiss4oFUvbwg==
X-CSE-MsgGUID: 5PcLA1mSS3Sg9giK3t8bsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,245,1739865600"; d="scan'208";a="134349894"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2025 21:25:36 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 27 Apr 2025 21:25:35 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Sun, 27 Apr 2025 21:25:35 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 27 Apr 2025 21:25:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zAkiTRxagNom6ShOI23rOn23dj5kERA9raFKOhlDwQu9NYyRfW32AcVtUiXbAq1H7obYdgjDKiyWQE6Wc1gk/3uqDHwbE9iUeralVurPdkSB285bXxSuZe1LspmQPIOkorLMEVVZzlmTy1x6ckPEb88aJLI/8wVyrqEvw9tDhN7tjA/g34KG2vPckEMaAAa2CSsnhNRB0P+6vpxl+wGMIARbJuChUDNax6Ol2Q0e8SRb6jHcp9Y03Xx4VqGlQ7CAvyCQbktoaIWX2NZaiCprbvGxbZHXxyf+m+aQWwhEMZo5XkKawu6tLRuJ5zNXMbC2isovq6nAwDiUSE40XxhI6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=186ut+zS0OMKSFxJgKX55Q8FvWUHMC4uP69+leRS/X0=;
 b=pX38+as7RcPSIeNzxLlBr9bERBqshDM+H2MuYC1ynXOvByZ7xNe7whnoo9jhlTB6rADT/sTQW97Xv82e/Af7Hqu1VZ3StLA7aDt8ACFsWNR6ezFhidBqQSD6eY2y/p8XFdn+YxShoXdY+m7sWuDo3BGpQrhHWWXdTmQsI7lcirkxE/ci0xfq/UIyS9kebE1bqJ+6KcOJudTVTWFWF9fhoA8P9+o5ehuxW1qARZ/B0ky7fvFp8zS9tXu59qO28YiYXuLtcODFy2b+Z4a9J+f8xNzq6KmqbHoWcZbooXFLqGibDt2sVD56V7Tn88TOkkP1IJsm6pYk1yqwiV+brIWiXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY8PR11MB6892.namprd11.prod.outlook.com (2603:10b6:930:5b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.29; Mon, 28 Apr
 2025 04:25:05 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8678.028; Mon, 28 Apr 2025
 04:25:05 +0000
Date: Sun, 27 Apr 2025 21:26:27 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Dave Airlie <airlied@gmail.com>
CC: <dri-devel@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/tests: fix the bo evict build break
Message-ID: <aA8DcwcBaL7Nl9s5@lstrano-desk.jf.intel.com>
References: <20250428034043.407486-1-airlied@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250428034043.407486-1-airlied@gmail.com>
X-ClientProxiedBy: MW4PR04CA0264.namprd04.prod.outlook.com
 (2603:10b6:303:88::29) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY8PR11MB6892:EE_
X-MS-Office365-Filtering-Correlation-Id: c6fd4ff8-88fe-4516-f05a-08dd860ca6ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Vj0MUfpsdnwFiZ1LsUt3/NG9yNX23C1ijszUCvyXItzlS5zpPGhVrmztqvRm?=
 =?us-ascii?Q?I1tUX/letvgGoM2Kyvs16+6Wf8Avr3zF8M1oPILqL1QsPkDDT4hwGewPMH/d?=
 =?us-ascii?Q?oWmo6Xvab29XDfLZnyrULf5TNfGXZiHzSUCpW+o+5WbFxlhpUWisoDIN6G4m?=
 =?us-ascii?Q?AkaqoH2ym9L5j/YMhv5tlvwUSMG496o33brcZDY8W11VPUTBpXxPfMXdwVbU?=
 =?us-ascii?Q?ZD/6UrthkbMyNCiR5LqiU82n+3i3fiTtJCVQY3Nzf00uSyiTwnLWt1knLVZ9?=
 =?us-ascii?Q?WNRUGCqls+KAD8MANW9pxBbRYU4FiMkSPJseropxjNtv3dbr01EaPoPtSEcn?=
 =?us-ascii?Q?LMO9biPdVFfQLtOE87xdjPqYuYLOy8ow0OzZhfpbV9IyuPQ8KBGlHsh7Gcp9?=
 =?us-ascii?Q?sE+jdyKm2UqAMGGQTBqC9+SPAFCVEPqCqybub2WOUzbMe+BYkBQUPg4IfuxZ?=
 =?us-ascii?Q?IDo3vXaVtKR00rg855iZIAV71wXYqsIy52PM5amCJOrxaOD7R57GCUUUTCYN?=
 =?us-ascii?Q?6JFx5yUKBST2mloe31v2Tcqx8KDOEh0pKyYG6C6F+hC2vmjgNlbfpRMxQ4sD?=
 =?us-ascii?Q?9K5Xi6+EZ4GJxRW6okM0dOQ1w+Ke2pmhr4unz7lk/xIKi2MjsaFGOQxAi7yg?=
 =?us-ascii?Q?8H/ML44gqZMzrIn3z9dBRcxD4omO3dEg8BSab/0HVzNLDLM4eNe9I9KLx3Xw?=
 =?us-ascii?Q?YI6VHnMKT9gzpcHpZWgfER5O58gjC+MTGyMbeXjnIRndgdVb5qDMJBUZUjOy?=
 =?us-ascii?Q?S9bJZvpvtLD5ymGDZM/37ngWPiZm/N0PgA9lKumAj5ejCNq+9gd8UWi2F+eo?=
 =?us-ascii?Q?8F88z3eIpMBqLM7HMwuWB/31m5ZNrgSp7c19UShuFOsTJ6rg1tG0I3HS2GU8?=
 =?us-ascii?Q?IVqjftWG3ThS2PqL+Gf164ulpQn+Vq7S+dFUncxa4Tt+XvFgRlqscPNfg0Bd?=
 =?us-ascii?Q?GHo9z+8lTOhKVXFIVeWL+W4Au881V6yL8yjIS2PVSUbPvrfQ+ipwBmEAONwu?=
 =?us-ascii?Q?+7GX6gWGHHDtIIxXQ99qaIv+9k0yQhXX3YD5P+HHDUw8mkYzRtrNMQnVqCcN?=
 =?us-ascii?Q?4UHSKpskYJy2ZxjYzGPB8Av0GBJ8lCwPwArpx2/MyCzXtl9xm0ObYZh/IIsU?=
 =?us-ascii?Q?Slp8jC4BpWidmFQsPHRnH9QLOszu9a1ld6DEzJ2ns9ZGUV04h0YBfx54vpei?=
 =?us-ascii?Q?LP7Vw1llykEXT1XZ1739LeWrxZtveDPNVPawKzSlTnT32Gm9M6/35GKlu1st?=
 =?us-ascii?Q?w1bfdPM3QTs7RiERfRYrNDPhAZxbRv4gmqUeIoyLjdG/3xPBk8IZyhSTJZMM?=
 =?us-ascii?Q?E+zY1+pipU5GEYADzWHXh4KiCOIROWy6cX9vRCHAs2n0Hy/TmkwLZSLSDD33?=
 =?us-ascii?Q?0tM2y2ZyZwrK2FOPj4kdBz/yJ+gQIqM7zHII8tTgVntBc9xLMRDD7iL6U33o?=
 =?us-ascii?Q?2u3c2+qfvTI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JMLS06kru0arec6IxMkhzE/7ugM8nwNFfzmbgtrC7CWS8+ycTBGT2KqUPr5E?=
 =?us-ascii?Q?pf/L+iRYj+hTB8xAHhM85EDpM7xwfCSHEp7Cs49kVZF+kJnV70AxIahPnT9s?=
 =?us-ascii?Q?ex39qbdmv7deoS+8nvcpjSX1kxbdOf+dlddcYSkpD6T/iatCFfOaMwGTYeAm?=
 =?us-ascii?Q?uwSOjC0FHkt6xX8VwYaRy7ZkuvYm9dgDtDieoCDmxgLNkK0Yd/c7Vgk6Dd22?=
 =?us-ascii?Q?7EzumrK52MIE1HLgcTgY0F5/62q9ppe95kI07lZ4zsJB/Is+8KMyJ5sNobs7?=
 =?us-ascii?Q?GGcPqGPDjWXS32G7oyUQs8NSEprHt3xcGQ9/OEHB7IrJc4HjYErsOsGEJWLL?=
 =?us-ascii?Q?iGXSA/X6XCHgvg+8KSYBXSW4Pl4g708pbBk0XmIj/126sGhCBZaMQ9KpdTEx?=
 =?us-ascii?Q?b5Asn8gE5xUz8/JB6YeR5a2nlcU3ON4KKev3643b37cMnrCl7pVc5/NQZ4YI?=
 =?us-ascii?Q?ENM4KwxGeJHMp+5V+a9NsT2M6ghdI4rfrudDHBzdn6sOee47u/5PgCWcXTl6?=
 =?us-ascii?Q?YpBN/SmSIoJs/dO5z2DatuLbmRkXrqjq/zU5NdF1wWuA8JTu9EU6gXrepxQv?=
 =?us-ascii?Q?4aRQOB/NVe5qelW/u7v+gexNkADppydzkhlqIePFcDN+yGAgreZqIrU27Shh?=
 =?us-ascii?Q?/KEi21tmFyJyBu7xFdUP5KUu9LTt3EXdCwvc/kLvSBRGue2MMO5F1oEPoVu4?=
 =?us-ascii?Q?ZAYZ6g3fSiTUEZQteab0icO+/5LhDEzrB8I4s7WV7Bu8hT9Nb4YC25pUe0kg?=
 =?us-ascii?Q?PwMhqr2PUFPOGXtbavVjAXFQFzHtKcjGcPnMGABFdyimf6HlMDQk3+3PciVZ?=
 =?us-ascii?Q?Cf7D9+faDUaNhxGlY0q/n6xbfD0dA7KembNtg/PedSGlsrRYbqggrA2UeUcD?=
 =?us-ascii?Q?y0l3SIDXrf3aIFPokxW2ch/AOEW0hx1/jA6iLqV9rKS7kJqgndySN9CAmBa/?=
 =?us-ascii?Q?RKziPCprsTrjeDmd5AN1GjfraBGCwkcR43a3v3gZX0zAQNg15wxNDGE4l5VT?=
 =?us-ascii?Q?qhKr+pSLfIKMK9RUjZHXSo91EawaJxXQW/x8JS6DMSt1M4jm8PVJadbf1ui9?=
 =?us-ascii?Q?cSouXX5SPxoDyEV0pVg4J0IfV+llV0pKwrOGbIGCWKbyDDsAvL300w0Sq1tb?=
 =?us-ascii?Q?NNKsB5Fe7V0Os2iUnhaPd2W3Qiq+jcUwhp84p/UP8Ec4+ZsFAFHlIQ2urwRh?=
 =?us-ascii?Q?Oqsr3kyuNQMAloZ5H9ErtkXGTptN1nIppQzpxWYy8iAfbjGJaXxcsSL9OfaM?=
 =?us-ascii?Q?50G+APLeALUB5T0GEI9jSSht7c1ADGfADtOeEcYZyR6GA+3WOA6m3XI3gbP4?=
 =?us-ascii?Q?eK9CxdAmL5mEQmgDCc7b+jxIHwQHXpk588oSgf01KJcDpDU3QbBfCNRi3iRT?=
 =?us-ascii?Q?K24dFlhH79adIcY5A/K+uTmH7BAY+hqllQFzxV0GrbDrvhWNGJhWjqX/xIff?=
 =?us-ascii?Q?zH9LzJJnQSxrEmbiISNiuUvpohtvJlX7vJ4IiRHWCFxqnsu2IBpbpld5eBoM?=
 =?us-ascii?Q?21UIBoT0x/oDGVQU4g8bIgQCUzOR/Fo58Fcz4aYmooAiIqRITmqaAJBI/ZEx?=
 =?us-ascii?Q?SioTEPe8ch78EXRz38h1TCvoSKDnZgZe4OuxiIXHe8EJyRDQ0BRZK2QTGNvV?=
 =?us-ascii?Q?bw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c6fd4ff8-88fe-4516-f05a-08dd860ca6ef
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 04:25:05.6535 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vbX8OMJXuvaqHp/QcpZClEzayL4ScNdwEJ7EeikXNgJ8MqBIJyyVUDYfNDzN9t0p+RR1e/iqox+7YBgGL+D1KQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6892
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

On Mon, Apr 28, 2025 at 01:40:42PM +1000, Dave Airlie wrote:
> From: Dave Airlie <airlied@redhat.com>
> 

Thanks Dave, I already merge this fix. I guess our new CI policy
rejected this though - I'll follow up on allowing you trigger our CI for
anything going forward.

Matt

> Fixes: 55df7c0c62c1 ("drm/ttm/xe: drop unused force_alloc flag")
> Signed-off-by: Dave Airlie <airlied@redhat.com>
> ---
>  drivers/gpu/drm/xe/tests/xe_bo.c      | 2 +-
>  drivers/gpu/drm/xe/tests/xe_dma_buf.c | 2 +-
>  drivers/gpu/drm/xe/tests/xe_migrate.c | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
> index 230eb824550f..378dcd0fb414 100644
> --- a/drivers/gpu/drm/xe/tests/xe_bo.c
> +++ b/drivers/gpu/drm/xe/tests/xe_bo.c
> @@ -60,7 +60,7 @@ static int ccs_test_migrate(struct xe_tile *tile, struct xe_bo *bo,
>  	}
>  
>  	/* Evict to system. CCS data should be copied. */
> -	ret = xe_bo_evict(bo, true);
> +	ret = xe_bo_evict(bo);
>  	if (ret) {
>  		KUNIT_FAIL(test, "Failed to evict bo.\n");
>  		return ret;
> diff --git a/drivers/gpu/drm/xe/tests/xe_dma_buf.c b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
> index cedd3e88a6fb..c53f67ce4b0a 100644
> --- a/drivers/gpu/drm/xe/tests/xe_dma_buf.c
> +++ b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
> @@ -65,7 +65,7 @@ static void check_residency(struct kunit *test, struct xe_bo *exported,
>  	 * the exporter and the importer should be the same bo.
>  	 */
>  	swap(exported->ttm.base.dma_buf, dmabuf);
> -	ret = xe_bo_evict(exported, true);
> +	ret = xe_bo_evict(exported);
>  	swap(exported->ttm.base.dma_buf, dmabuf);
>  	if (ret) {
>  		if (ret != -EINTR && ret != -ERESTARTSYS)
> diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
> index 52f89476bf62..4a65e3103f77 100644
> --- a/drivers/gpu/drm/xe/tests/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
> @@ -509,7 +509,7 @@ static void test_migrate(struct xe_device *xe, struct xe_tile *tile,
>  	dma_fence_put(fence);
>  
>  	kunit_info(test, "Evict vram buffer object\n");
> -	ret = xe_bo_evict(vram_bo, true);
> +	ret = xe_bo_evict(vram_bo);
>  	if (ret) {
>  		KUNIT_FAIL(test, "Failed to evict bo.\n");
>  		return;
> -- 
> 2.49.0
> 
