Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44678A46691
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 17:29:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B24910E955;
	Wed, 26 Feb 2025 16:29:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R0DNQhdr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A531510E955;
 Wed, 26 Feb 2025 16:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740587345; x=1772123345;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=b0X8lNeUuOk5lk+mYaSdYoNojAoNbX0Ocp7PtLRLrAE=;
 b=R0DNQhdrX8sCoR/iqjNXJBjEhB5TOFQE4iO5lZ6mcJ/qd8/LDUDFfjRo
 sqVLzptETdVpu3cJr+q6dbxK3fBKpo9p7E8PziQlMQbL4pzNP+IcR/t84
 oo3WTVbP2WBqB6MumNTkHCRvtwBvhIVJo9Ienuj0k3FMtGyy/7xusMF8N
 jmiqc9SjFuhrAkwdWAbpJ38fprRL1fv24SDDcdZj5equbd66HMzGvLWRr
 LSkrykiA7jsNUaCUyVXFJf/0Cc6doa0fwUWaHRw7JkqOPsqV8QmbSq6HB
 7nV3vu7iQnbw0SUEcDjy71zdN05MXOUs8nLwJAbX9aD2bu+z4DDfGgPPT Q==;
X-CSE-ConnectionGUID: nMzti4jPQyOgKDGuKMUpmg==
X-CSE-MsgGUID: rRQxS8HnS2W7eBs3wmlZdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="41641336"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="41641336"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 08:29:05 -0800
X-CSE-ConnectionGUID: Vzgv0ZMzSk6LYMk66qi/XA==
X-CSE-MsgGUID: RDQChd/9Rei7x1WihKXveQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="116604551"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Feb 2025 08:29:05 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 26 Feb 2025 08:29:04 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 26 Feb 2025 08:29:04 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 26 Feb 2025 08:29:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vf7Fit8+U3Nr7Wbazcmd4IzW0pzYFtmIYwKE3RAmDUdZRIWmE/S0zmpl59/0l/kg8Bjq6elqMhVF1GTjm5PxLwTIguBjLMfSU6CuUE6ZnsOaocwsZZREpyPuD+kJ8oT7D18YgOk+zF7+T+VFExHNUaFD5zejASlGvdaqXOg201t5PbcM49TBrzeVdkB3SbFOsWT69g2WLYjHqFdwh5G5xPchafFhxRaCCkof+DfWr6yEgLvTIochnQgh2vCGyA0Inf4OclXyA0sm3W/Sl9+ADkdig6Ih2DERBgFoJ2hhW95VhlQSg5t6hbk6Azqx8St5bphGdUSGAkAD7icbduveVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LZKFRufpSEAljNaz/NFvquY9YGwk38NUfccxpaTieyg=;
 b=qRgOR+FlBLzdHGNbGuyvIw1kpAN0rbhNt1JGSSZENMMNa3/St1L8aGEb/fIdLuHeXcJMkNSf9bQcGVSL7dNaZWVkkFZUffJmOV7dVs+vPl5QZxuQipCUazM+eCzg+vlpJrgy9P55SUg9zaJg9sK72k+UmcwU/LnJSIzYgvFgkqJPGyARht/GFIBrlqLD1alDAaXpe3VAMv0NZTaI0Un9UU6USCL2m9Qj+N4uL9IW5eAaTM0I5jFGp6kcI2rNGWsuOsdZUThthI/PfobdGSIBTMg9Avle+fqPpZ6oifGT1DdYnO+2EV3mRVa2mn7PAxvi6ncEQ4mxYpjR3nBD2s1WiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CH3PR11MB8517.namprd11.prod.outlook.com (2603:10b6:610:1ad::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Wed, 26 Feb
 2025 16:29:00 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 16:29:00 +0000
Date: Wed, 26 Feb 2025 10:28:56 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Colin Ian King <colin.i.king@gmail.com>
CC: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jonathan Cavitt <jonathan.cavitt@intel.com>, 
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <kernel-janitors@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH][next] drm/xe: Fix uninitialized pointer def
Message-ID: <6hrfddlbvpk2nxhwcx73nm6cmet272fhxulvmfeiqfiansq6tf@rdgyjn5fofov>
References: <20250226160524.566074-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250226160524.566074-1-colin.i.king@gmail.com>
X-ClientProxiedBy: MW4PR04CA0305.namprd04.prod.outlook.com
 (2603:10b6:303:82::10) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CH3PR11MB8517:EE_
X-MS-Office365-Filtering-Correlation-Id: a6181f00-4051-468a-4739-08dd5682acb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?FdZq8njnZ9SjM0lbwEtM0keqWL0GgdV3bKE7SSSmm61y3qCjD/qIcDll5/tR?=
 =?us-ascii?Q?8KZ1qe7u5yRaWXyYZkW4+yW7Hb+I3WpDZCmtkLQcjuRce9zkxc5R49oRb8MC?=
 =?us-ascii?Q?tdrEqTyOUriHYQBF0ikiHqoqRidMIewnZSO+L9k13Xv3xdUt44Fn3/dxG1k/?=
 =?us-ascii?Q?wPiIIYF4aDySyMClgEklw4nlLrPLzfWWOWSqGOntrrcc+6NvAMBt/RntobZ6?=
 =?us-ascii?Q?kPwAB/50eLqdxI9SvFYABfLw9J3wa1BqzQpCHfjxC7o7QzDWRg35zVVWwXHo?=
 =?us-ascii?Q?9RnsU80ZoJps6hyUMyNrjbau4DCokEm3OmG1rcA7/1bQ9ZZE6YJO46A0xIZI?=
 =?us-ascii?Q?XfVRhfetGu/LXeXhu6ANVRXyeiKEr2qhAq47+Bmxn/1tgprhwc7mnuy1G2V3?=
 =?us-ascii?Q?EXm5gUmCOX/0Su92NAVTpMvalfH0gDv3nppNl6wkqDxqK/Bd4t0sR/lBJE5f?=
 =?us-ascii?Q?wwJmrven68n3hhnMS1aWIJXcEc9Urqkaaye8WIHbxCNpiUJJI3P/zY3wfQgZ?=
 =?us-ascii?Q?Iijq6JGKBLG3X8K1XHXH2Cesy5CEuJf86HsMMlwaFQlhlmnDfFKdq+xyViUx?=
 =?us-ascii?Q?J7t6m479FDKucYLxbe8qnU/SSKzIErNRLa5Gm7JpAp7QoUTzOiKRBGE3drUs?=
 =?us-ascii?Q?HlnEhzhCvA0O4GBYg03Q0mankvAS6lToD9emiaD7cQsrGWK89U5yW5LCWKeI?=
 =?us-ascii?Q?OJx9SNnomYeuHeisWDLp+T7ymET0DMbcAR6m2bG7yX76bxN2gi7JxeERaFYV?=
 =?us-ascii?Q?mLXJMHu9YAHQZymA2Co26VR2C558H9V2573M6pDyvWopb9BO7AXqvSBLVtZf?=
 =?us-ascii?Q?GdGOJy6+G3j6MBOtJkrkQVM6b5IjQzeCcOXN9r6qv6F81Urr/ppTQXuYWGwb?=
 =?us-ascii?Q?9KeX74fTsxeDjXoRv1IJltMONZLo6LR20ipn6zrJ2igxt2u54PBCE8jNWKnM?=
 =?us-ascii?Q?vf3EDFIM4geLiiLJDiG4Y5eFifI8Sleh4Kvya4OY3WHSoloSs+qW4rSI4eC4?=
 =?us-ascii?Q?QKaAOCKrJ6kHZcAX3jOVVQ3Hg9fx8fuUSaYCL3PIEolx/I2oEtNsQaJ7cuE+?=
 =?us-ascii?Q?Le6HieNQdZ9cerTWvaUWeBUdpzc/aecX7loUuvkGlYrXV7DH3kfgU8ZP/gI9?=
 =?us-ascii?Q?M6acsEV75orLxtRiNzZmvcZdWoGGFdXAlTMBgZHTytXvmBEYZ5Mwl1BPoYVZ?=
 =?us-ascii?Q?Urq3jRKPVtFVLx08yE3XLAoHHqociMAwNq3Cbm9c4qLfEBcVMZKS5tzQ4LjU?=
 =?us-ascii?Q?y0OXWe3Kt5GTZLO/CmAf2JbFxKgX3CieVz2JJnenwz/vJBFBcs/grApU7Zq4?=
 =?us-ascii?Q?EK0R9Lq5SwwaAeOm6tE18TCBOwym5bznVOvUIVNSBNtF9Y+b5Xe7RyzrFh5m?=
 =?us-ascii?Q?LK7LrYcRKxdVgV/TiVPZfgBD6bwr?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Tz0Roujjd4eE9LDi22uUHaUcSaudOHc2k4rbsO5Ifu+N164P6CAbDh9/iWen?=
 =?us-ascii?Q?xwWaURI48y5rSWoaJ/v4ILHq1eu3eExVn8xWcZUMwBAGk23ayMprEAfkvImi?=
 =?us-ascii?Q?mglL/H2QwCbUs8BSbiwwzN2BazqWaMshkkzwdSmznf36p1IUhoquiTPrXw5s?=
 =?us-ascii?Q?1Y9u6q8RpgoNUjCa0kNHH5+KOUV0iunL13SbhlKSD7WFd9s1hjJ173eBYOV9?=
 =?us-ascii?Q?Z0dV0XfYVT4ncrfsJNeM+hRLqVlrtE3SKDgYNAZGNNFh2ME7nVwKbHEBMs2r?=
 =?us-ascii?Q?BsVquh0eCSp4pgEkqqYnwWgocl49A5fxpRYOiHMnPssKX4YUSrFCXkmVLvN8?=
 =?us-ascii?Q?CcUNhwRLpiAkvTOUUNnCH1PVssoW5077/YIaNrbugyyMIKNmBSa00N2skRh2?=
 =?us-ascii?Q?h+dg1/KYXQhYz/vFhh2C5FmSQV879KrXtRHvvGcCxB1hy2PU3jQO6nCLNVQa?=
 =?us-ascii?Q?vA2Fr+sR3NolEaNisOnohtJhdksCn6ZPMdN4386PNTXd/Xjew4M1GnMeu1rq?=
 =?us-ascii?Q?xV/0dmu6NDaNcpdWfeZUuHX6i7J3iXyongchetxMTz0QFBS/qS5VcwGF6wJF?=
 =?us-ascii?Q?zcV8nz5eXVeGMD8GJaIHAgfS64N63tR3ak2aq0mMmykBCnKevitnswEy2ei9?=
 =?us-ascii?Q?dRsZrJ67SEnmkHGAeq7kMu9VgvefFkLePY9SZntcrTMmPoV98hLqnCM1/lqC?=
 =?us-ascii?Q?bm1mtrNH5h4sxkuBOs/GHG6o+aSO7KBj84uWbyyc/+7/ZbocCyMe2SOSV5F4?=
 =?us-ascii?Q?/Sl1imnoC/s+1ccI4VVHP9KSIlww/lveMovMbeRLK+cBGBMM5dqHixNxFeHr?=
 =?us-ascii?Q?v7DRogz7ho4PIyfzcQH+Vy9ild/8XioRRnA2/cnJ4iJEmVPFfH4xgS+ofaxn?=
 =?us-ascii?Q?D3XAzB7f+UiEIol+SH8weSCifoa5OUAwht87Rd11VCYeD2TrhrHjL9P5Gj49?=
 =?us-ascii?Q?Y7lob1fGDkFKOF3OefMvnyZN/UtsJUjdpZYzJaqyVGDygfNiayEiIIFQCRpb?=
 =?us-ascii?Q?rZ6vMoyLiFRzv2xiALqgjwtMM6U2c1E9yXj7n7qIeFq9scrGLE/S6YPbOxmh?=
 =?us-ascii?Q?IJ8RwOvdxoQcNK4bEXE7hZPnd+NGmKAL0J7gog8N8d1/MU3QwfbtBFzpfQ+A?=
 =?us-ascii?Q?ZOGJMEBwtvRdS5cJLIuOq3HstKcSQ0RB7hwxdhyzq9/kpFWc0yLhXW+wndVF?=
 =?us-ascii?Q?/MSa8cBUfnIzYDAsd5fnNcfygHOD7qZCag38J+OqmidaDo5wR+/h28l1aB9M?=
 =?us-ascii?Q?T2C2sF0fDw0Jc/pwfTgWaqMbawTQskfXFzMwin7cv4+YQnX+caqI60IARd+M?=
 =?us-ascii?Q?97gANK2LI0Kf5wfCTpMbwA0/0ghOvsLiBbXy42D58Mn2Vnd3wm54uKXaEucP?=
 =?us-ascii?Q?14pj2OWsQuWrnnuMBFjU/G7DFrNRAgkWk+nzj3Ad7JMMgAQa+uBOFzFayrSy?=
 =?us-ascii?Q?+HN0bg2zaSDi13SOqRO3MH8Yflai5nN9wvp8Pc9WqCT+DMyeHQCSgLBMS+HL?=
 =?us-ascii?Q?YEm07DuZJXdTugM4X1gPJfmsq1dlAtzHEdDXDo84TRdxeZ6TNjdRfSfA9l42?=
 =?us-ascii?Q?dnrz6YTHf4t0XNeFS+mftXM0r9XQKiIvNKyWRSJ1trcY04j/30ZY+uiSpevR?=
 =?us-ascii?Q?aA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a6181f00-4051-468a-4739-08dd5682acb2
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 16:29:00.1381 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VHmzmVqPZHN0Ohi9o+OoA99bLJ1A4MwXWufsRCP4cgYjKt8uuS56Ybckn1VBpHH9Nr3YKQX0UaKhJnP2mAT7Sr+6ho2rYpbENU/iGWStBqY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8517
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

On Wed, Feb 26, 2025 at 04:05:24PM +0000, Colin Ian King wrote:
>In the case where a set of checks on xe->info.platform don't assign
>a value to pointer def the pointer remains uninitialized and hence
>can fail the following !def check. Fix this be ensuring pointer
>def is initialized to NULL.
>
>Fixes: 292b1a8a5054 ("drm/xe: Stop ignoring errors from xe_heci_gsc_init()")
>Signed-off-by: Colin Ian King <colin.i.king@gmail.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_heci_gsc.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_heci_gsc.c b/drivers/gpu/drm/xe/xe_heci_gsc.c
>index 3ea325d3db99..27d11e06a82b 100644
>--- a/drivers/gpu/drm/xe/xe_heci_gsc.c
>+++ b/drivers/gpu/drm/xe/xe_heci_gsc.c
>@@ -173,7 +173,7 @@ static int heci_gsc_add_device(struct xe_device *xe, const struct heci_gsc_def *
> int xe_heci_gsc_init(struct xe_device *xe)
> {
> 	struct xe_heci_gsc *heci_gsc = &xe->heci_gsc;
>-	const struct heci_gsc_def *def;
>+	const struct heci_gsc_def *def = NULL;
> 	int ret;
>
> 	if (!xe->info.has_heci_gscfi && !xe->info.has_heci_cscfi)
>-- 
>2.47.2
>
