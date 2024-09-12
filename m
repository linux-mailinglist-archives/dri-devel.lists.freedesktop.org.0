Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA75977175
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2024 21:31:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A4AB10E804;
	Thu, 12 Sep 2024 19:31:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YsQbYOhN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49EF010E1A6;
 Thu, 12 Sep 2024 19:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726169484; x=1757705484;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=0cqbUQQD11HsTucsFMdAgcjOaAUDLVWGTk01FJUOxbA=;
 b=YsQbYOhN/UtJu1vfbj5pwT9OezB/+xXQ5yKCFThwlbpOhrzLtZwViBUc
 Ty1RjLE1d/5QSh+Lr5nLZw+/qwoVeePkaOo3gzY9vZ45wGnAMaNgiJ0G4
 XtoLPJZKo13hUbj9JudKADfCzvkcYpKIDmy8aIK+eALm0Bu/Wo1zA/jIA
 zDDBOB34RAnQVnNvQ3x47OJU/AvwD7NSx9I0Dx6+pEM3i6pEJ34P38Xoc
 tmqujxCLsFVn/74l0Phi+ipELYQ+d58r6X41BdGyLU2+4CPe4CP1B1Hwz
 +NuJ7Qwj/uE3SQJtCB9rRKiE01M3/mu3hlkAmWxKwX28p4Fc898L0MtJW g==;
X-CSE-ConnectionGUID: hFo4kf+QTsSSEgdp52cLng==
X-CSE-MsgGUID: bv34elP+QSyPQq0TI35i3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="42527938"
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; d="scan'208";a="42527938"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 12:31:23 -0700
X-CSE-ConnectionGUID: fGYxEs9dQzCrPcfumyQk3w==
X-CSE-MsgGUID: WjfMx0SASOWd2p1ijNymDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; d="scan'208";a="98624417"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Sep 2024 12:31:22 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 12 Sep 2024 12:31:22 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 12 Sep 2024 12:31:22 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 12 Sep 2024 12:31:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YxPAn6frgy2sPp7qmgMa/zNZsOZTGVkhfYzT8z+MKn2+I2Si/wHS0svm0FQsj3S+gc7roAFqhyyJ9SNT0wtEkme1R0NF0qO53mpKcRAToZzl591D56UEH7gzHqUXFQNrv+TPMAmMk9vRaXh5rphbh0gi6cIi5twM6cnp8SOrgpjeA65DWSTjlgZj0+G0XiT4p0f7VDbxLOavsP2DNmtXBb61W+jBh9ISIqo1uIlvoNrNNADVBI9St2hqkkVpwYawMFXt8CjULjcmYqMj3BDN44H3PR8nQ0TKS7g0pg9co8t1KpeF7XM9GykF0CNO01H8SzQVqTnHJkt3BFHO7hdpAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lZ7Ln8zyTogqd2e+e0HE9XZNEtGGsDf13IT6w4iUrHY=;
 b=NeP6r7me9k/IIKHxT+XqCiWlWu9VaOwVGzhNKMhYEln6RdqpBYiKdFXhOBRs9Z6Euil9+0pdWUie6R4MwDigCCea4RTW7HWmpy0LmpQQGiRYUTplYAOQjEikjZE/gBhulBxxVrOqPw+EooLD2XV/2nwW0mv6xd+F9jy9JZ/3G+iUQDajchdPr9F56VG1htlk0wtHtZiREz9Ubdz+yQoekJhpdr5Fnn5UqYsh1oUCOwlde97bbHxt5rMwe9XHtExyJdDD5bkk3+Ur8lpVxApds9K+XGaQt/OFKNpGcovBw/IOU28dEWIAEXgVKw8tEwzQI7v+/ZRMGNkksMSg09qgdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB4974.namprd11.prod.outlook.com (2603:10b6:a03:2d6::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.18; Thu, 12 Sep
 2024 19:31:18 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7939.022; Thu, 12 Sep 2024
 19:31:18 +0000
Date: Thu, 12 Sep 2024 19:30:01 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Yu Jiaoliang <yujiaoliang@vivo.com>
CC: Lucas De Marchi <lucas.demarchi@intel.com>, Thomas
 =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <opensource.kernel@vivo.com>
Subject: Re: [PATCH v1] drm/xe: Use ERR_CAST to return an error-valued pointer
Message-ID: <ZuNBOYn/U+At5Vog@DUT025-TGLU.fm.intel.com>
References: <20240906070109.1852860-1-yujiaoliang@vivo.com>
 <Zt8exTWvVGz7CuDf@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Zt8exTWvVGz7CuDf@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: SJ0PR13CA0087.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::32) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB4974:EE_
X-MS-Office365-Filtering-Correlation-Id: 93f64cd4-ba5e-4357-ee80-08dcd361798e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KiQC4pS2yt1r5rnoYOXi9zib0vi5YwslBwKOglL6woZ3R9w1EyhktaaNPgA/?=
 =?us-ascii?Q?celi7mDrCHxNQy1rl00tE3Ja9ad/4C0gyawAm26R/lFPniofBbM1hWcaCxfQ?=
 =?us-ascii?Q?IixtqqtqzN08T5cFEMPNhu2bVwvY8F+DF77LTjlx6Kdtap4EXno4R5RSgYR+?=
 =?us-ascii?Q?vvEwL5TUX08MUrK7pLPeFL+xWzY4h1TZ6wPpVDN1Mz6AmABTtTlgLp+l+E9a?=
 =?us-ascii?Q?UXicIzrhIx5WKB2KQNc21Lr+I09XFEEB1XpgH6Fj7CUjPHmKObncykRcy/oz?=
 =?us-ascii?Q?Uk6pbw+Lu0pCRK/A1EIHxs5f/tFz81W1Z1v39Ibfai0+1xUSK7iEwOZdu/VU?=
 =?us-ascii?Q?x79z15mMgjOxTF16vN6OqxucgJzkCBOreTUasD4hJ52epRP+eWmDbMnUlq9K?=
 =?us-ascii?Q?TTdScsBWLDvy0SksSonkBjReZn2aqj/jmrCrlP7+colhAVYWemeGmWmO5HFL?=
 =?us-ascii?Q?3doLH2GW/Tu0qYhKHkW7Di/8yv5FoiU5+UjOE+gTalYJ0xszk0dchtDDqRXs?=
 =?us-ascii?Q?3qyRfi1f7/06P0r7O3gMhHPAJETKo5PRKGjFG5tB12BiEdAZRbcktI6KqNEY?=
 =?us-ascii?Q?W7RplYtAr1c3Sak3IecSty3RWRrvoLTVb+tTVz3R/u9++KKIhvkDlL3RM0rX?=
 =?us-ascii?Q?Ic5tDYM6Kh8KeG5d8SezAe4E0nyUkb+RDSq3+pX70YMx6v4AHfFhKqGCkpgI?=
 =?us-ascii?Q?0Vnkx+lkm8C4YWMq1xQG4HWrcVhnzmJEeRi7lv/88mj1G9EF7gSgjyHJrhk1?=
 =?us-ascii?Q?lJW4Hf3Bm1FuGrvXZs9mFz4HEx5EbbeLuJw9RhZv6wCkCtF3eIGV8DSCVgeb?=
 =?us-ascii?Q?5w5TtGdNRb9KaHCKLT2NbX3SgzTUdcdWQTngZOqn97AShhA4xfUpI4HFFJRS?=
 =?us-ascii?Q?St69bddUe1DkpE30tsRiEVeCNFwETxS/aX24qH7DChyYkb1OZdCOS0+9uC7m?=
 =?us-ascii?Q?Xd6ZkQHvsX0S4spxVYTDTj5RcCYqfPqmfeb9m0vVY0BcsZAXwxGpCr4SGI7r?=
 =?us-ascii?Q?hBsLusMsLzswvBY0bJvireYwRLQzbNdHWDFC+9pf0cXpcCuG6tbvqaoeS/ak?=
 =?us-ascii?Q?RDAR6ZI5tk1Pbb0OGznMeJyYiAG91awgIfH8JbDGXxi0CFiab0xFc04dDkvy?=
 =?us-ascii?Q?wAGXAAXtjzFxqByPFv4M+8ADXVlaovuRU/Nji189gbxtHhxGRM/fsUdTrkxL?=
 =?us-ascii?Q?ttjeFoz4/wK5QDKNfh6sNmSc3BoEsc6NoenLezghVj6qwVBsgi8nMil9wtP1?=
 =?us-ascii?Q?A/exKA975D5acKLX2a/dxD4C06FcHm01Cg+xf61aTDfSrONuJPzxo4c+JzoC?=
 =?us-ascii?Q?vSfYH76yCwMMVCVdHD1+WZm9fwrhnFaZ/ghV+/uP3ZAvHQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rfKCUaTrEsMps4AeYwmFY6XWeR0VuELxSz2G/R/RH7gyr8i/l/PEzcVJzSGA?=
 =?us-ascii?Q?+lO0lbwj3rTjN8v2mXnNpmV2O6O93yEp6AA5VpDEJrwG90m+LuxgyiY4TpWc?=
 =?us-ascii?Q?hquuqZ0vg7HFQE61iQiooaMPjctURLPo2G0rhKFDv4T3K2Y09a3df/c2VrQJ?=
 =?us-ascii?Q?aS3K2/P1fHYSBdwJNwfbeRbl5uc2d+mzsTsNbZn6xrCAAuorVqNlCrCx5m+I?=
 =?us-ascii?Q?/D57ZG6DBRhp2s3/hWwZtJTVAvWZXrxjCjQlTKY4l+V+WvqbdxPkzvp5Mw5I?=
 =?us-ascii?Q?PLp/GezggjjT/ZmKOjQJyupIK+rBJeQdf1m72FG7h/dJR4acwtTSgeMvS1M3?=
 =?us-ascii?Q?AQUxnRJBVM+xu33lc/RC1IlX35EsR5R5vLIGrOvWq/9pf2DjjJZ5FtKE0RSG?=
 =?us-ascii?Q?dSXBnp5i87F/b0v+q6aEAfV71bg8wxp0h97r4X/q6KHfGAqsYvC3OMJ3H3jX?=
 =?us-ascii?Q?WxuTpYz4aq26NBVdq3QHmBhjhnyJTEkfx8vNymE+WRmbfTslej0n+UOBmBuT?=
 =?us-ascii?Q?FxVZPUzQP1TLL1SA+AjsMImYmfY91bjVZ8zllXzfHrkyspofwUhCFRHpUd5b?=
 =?us-ascii?Q?CcjXDkOp05K8+TJSPs1eSVFVKhokZUJWXHIeaqsBjZl269RRcLq6OlZHjX1D?=
 =?us-ascii?Q?UvSNY6ntVHkWO7tzGNojL3gFB6Kw/djHzkyVbWboRs7yC8HTdpoACp+/XC2q?=
 =?us-ascii?Q?nazDf5mHaZTqJRdwlZgEd2XppyXXxYBC6YZMeFGNM+Irjk+8wPxp3BRwJjKy?=
 =?us-ascii?Q?DW2QnmVsSimystFq34R1AVku/4HlYnNPJXkMFiEemNshUmsXapSYYVA7slxP?=
 =?us-ascii?Q?swZ9CdmhyfJFHP2kLsB0WqCKwHn6R6gN07AEJw/fZcREGInqOJTvI+dK9Tgp?=
 =?us-ascii?Q?fNeBVM0p2lprcK2MqhNWmLXNbANWeOP3V1OIMqlWojx6TYxAgAhWrOrLLspn?=
 =?us-ascii?Q?3s5f2BdMcWFm40njWzaIvyF2oJRX/o1IZtj+WbSl+xdB4haGfPgAlUI427Io?=
 =?us-ascii?Q?vYx1Llmz2kNHf7jvUuBe4qwm4ui48r59gYCZoU8aJ+Q5V6vwSQGw8oN05Max?=
 =?us-ascii?Q?COREdGrzU0XIBikxC4E+Qp36awAt2mwhG1H67UoN48ZJmIEFUW4/CBloFbSr?=
 =?us-ascii?Q?X0qmBNTRCFADhEb/nS8B4ONP5ISR6Wk1bIfgKyPIJjYl3ZfJ41lcQKrY+Xvr?=
 =?us-ascii?Q?Wa7FLY+CLRgN3Z7xJDyR+s1DNMoA5bkr9pQQ0QLXTMK7ueG4Ms1+LYnFKZN1?=
 =?us-ascii?Q?tdkI2A9POtifFgIsjafjF3TkGX8Ala9xGJR64RNFJeLICJXpTCcfRdN9XR2H?=
 =?us-ascii?Q?gAW+JeZ6Qs9eXb6n3nbYMBmp74yccdSNste6+PYg6uDtEU8S6W2ikrGchXHS?=
 =?us-ascii?Q?4NNDQ7hVIAA7ws6t3r4JxCWW7O7SI69Er5bjIjroXhpFZzaDAh21EqrP0M63?=
 =?us-ascii?Q?BVwU0KnOIymVHAGbVLO9Lw9lq5pqTQEtvaUXZLK3UmtCIYJmcxe/wpmB3Q8r?=
 =?us-ascii?Q?93HM0nojS8zLJQL9tavYgW8z/ajCqR+FkV8eOrioNuwVGA+qFfuGJBl7EMrP?=
 =?us-ascii?Q?Msu8Qp2yaS7fQOuXqOenzM3PQlQnTuAh0U/FxX6ls1stBaCn1GydiV1imt5G?=
 =?us-ascii?Q?nA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 93f64cd4-ba5e-4357-ee80-08dcd361798e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2024 19:31:18.5578 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RlvQYOflT4TaHgOqbZFc40CAnajm1TdW/oxqqW0gg+zK1pJxAUGun5nftvNnK49mCRPd/GaG6fq+DripMez3qQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4974
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

On Mon, Sep 09, 2024 at 04:13:57PM +0000, Matthew Brost wrote:
> On Fri, Sep 06, 2024 at 03:01:09PM +0800, Yu Jiaoliang wrote:
> > Instead of directly casting and returning an error-valued pointer,
> > use ERR_CAST to make the error handling more explicit and improve
> > code clarity.
> > 
> > Signed-off-by: Yu Jiaoliang <yujiaoliang@vivo.com>
> 
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> 

Merged to drm-xe-next.

Thanks for the patch.

Matt

> > ---
> >  drivers/gpu/drm/xe/xe_sa.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_sa.c b/drivers/gpu/drm/xe/xe_sa.c
> > index fe2cb2a96f78..e055bed7ae55 100644
> > --- a/drivers/gpu/drm/xe/xe_sa.c
> > +++ b/drivers/gpu/drm/xe/xe_sa.c
> > @@ -53,7 +53,7 @@ struct xe_sa_manager *xe_sa_bo_manager_init(struct xe_tile *tile, u32 size, u32
> >  	if (IS_ERR(bo)) {
> >  		drm_err(&xe->drm, "failed to allocate bo for sa manager: %ld\n",
> >  			PTR_ERR(bo));
> > -		return (struct xe_sa_manager *)bo;
> > +		return ERR_CAST(bo);
> >  	}
> >  	sa_manager->bo = bo;
> >  	sa_manager->is_iomem = bo->vmap.is_iomem;
> > -- 
> > 2.34.1
> > 
