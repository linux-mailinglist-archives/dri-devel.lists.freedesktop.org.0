Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A196F3CE6
	for <lists+dri-devel@lfdr.de>; Tue,  2 May 2023 07:13:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63F0610E0B9;
	Tue,  2 May 2023 05:13:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E2FE10E0B9;
 Tue,  2 May 2023 05:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683004385; x=1714540385;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Vfl1sH/YM9qP+JsigCeWrDp4+erYq/rvK6oweWP0nf8=;
 b=ABI//iZOgYRMr0sQLzTZkbrnWjBhsu7XzS4hMM1kfT2YmYI3zRW2obxi
 B9ReL/CDPOG8yRD5lyynW4EeSeY8pW3nhJVhlKOfJuqQ8gfbEctqF1bRz
 wkda3lZ5uO0IFnhVD/4mytOEJzsEkE+WfiHygrMftbsQm7CtIeEu440jk
 zX3Fn2uNUIscZT+biYWk2u7AYWMPxlZlMBv0T7qic8uH8xNvzvb+Jw9Z+
 HPG+pUKIIEE1DUbqnPuXvLL4UCTLqEYU4ukqSlyk6VqRJk45AIeurVY0C
 MkPxGthYUchGiFwAwNYYU5CvJePPj/XGGgcbn/eejuj8EBKsrmmGby0l4 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="413747699"
X-IronPort-AV: E=Sophos;i="5.99,243,1677571200"; d="scan'208";a="413747699"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2023 22:13:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="646391882"
X-IronPort-AV: E=Sophos;i="5.99,243,1677571200"; d="scan'208";a="646391882"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga003.jf.intel.com with ESMTP; 01 May 2023 22:13:04 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 1 May 2023 22:13:03 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 1 May 2023 22:13:03 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 1 May 2023 22:13:03 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.47) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 1 May 2023 22:13:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PNwtWoUIwVfgYqAuGLHiUhrlRCm5/kWHdFsZvlc4PPfAfY9ZMA7+ZkbFM20zxFkLo7dw/2/jKqiDwJwWsa4JIcD5qr5RhqdObv9hFe+d9B2REsuY1xsZxU+3X2I1n2OlwYZgqWzGq+VNS5CxOPzFKGNwylgZtAzfVQX9KuelFMqEdc8+9Gl3F+o5Qk1bDDzr5XqeQKcS7aD5pVaZZbp3Dvg/QegTz7M3MC4+8qckqt+h4L7cyGSRTRX+zF2ZmGfvQ6UP5T6WMfcBiwrKH80rZcoRpqu9TyaLPJd3lNABZT2Qgh/95q8CqKKE+MW6CvFwwNc6xSwFJfhPWQsqWfFtEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=li+vDqLzkYc5WGuS+WR4doCD8th1Xfx/1SlT0S9uTAg=;
 b=bvSoO5fElC/NukBfUGTdu6mPe1D9CKhQLP0teEG2esQjPHYqnXSCvh10Gsh3T/QSacpHgSFocyK/O7Nb7znv2UyW4vnRR2HF7062Sn+9Qtuv01FN45HWI9R6udpLAF636pZWqbPDmVsNpJIzh0x873uF3Hg5GC9ME+tEYCjoQ07UCIlsNeJ89KFoE0s4rXB3uCParUobmS6iPi4RgsjFq3HqcMlASQxNhvumM3hWMYDo3MEKXoknNrwZ4StvupeC5uTGgR4i55cf+cDnhMMYBaoQynzyFmmCbeKpHG8/Yh6rhA9VCyA5trCbg0BdPDOmvOnF+9SPPGWf1G2Ur5wGgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by BL1PR11MB5366.namprd11.prod.outlook.com (2603:10b6:208:31c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31; Tue, 2 May
 2023 05:13:00 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%4]) with mapi id 15.20.6340.030; Tue, 2 May 2023
 05:13:00 +0000
Date: Tue, 2 May 2023 05:12:43 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [Intel-xe] [PATCH 04/14] drm/xe: Extract non mapped regions out
 of GuC CTB into its own struct.
Message-ID: <ZFCby07CA3DDHUrU@DUT025-TGLU.fm.intel.com>
References: <20230426205713.512695-1-rodrigo.vivi@intel.com>
 <20230426205713.512695-5-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230426205713.512695-5-rodrigo.vivi@intel.com>
X-ClientProxiedBy: SJ0PR05CA0208.namprd05.prod.outlook.com
 (2603:10b6:a03:330::33) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|BL1PR11MB5366:EE_
X-MS-Office365-Filtering-Correlation-Id: bc40a3fe-4c2c-40f3-60d2-08db4acbe5e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N3bMKxEnONiwBJ+y1712S6ROUyXOT7fbsJdHX7hvxUHb+UY8eqRwpxI/jMPyEz2ibG9sNbvXI81AebdyP/VHRPm56JaZcgw20vJ2iVn7poOueuLWNJJnCW6PD+xE86DtDCkikegqrxuWkaBI+3O1qzeLsWo+zuckhNohQJ+O1dnocvtx+GyzAw9ojrTOvkYmXj2WHkSojvpFoWQk8aNOUQdHRmyndGQWCKBnf9rh+pPxjdO8+/SzlkAQnqncmp5NppXVM+J9KBGN6UV1ohRdDfN3sjW7p3yJCrgwhkmgPBo2olPk2EdC4qv4NjyVjWdWqP6jKARf4AgcHO5daZxnBptLSjSkdJ84y34NP3bOIsgLH+/5RANqaMD5T5ukY3B3YJGLBwwOXlgdC/dVNXEi0qCZUitApCTge7tLAjEezlJrdFcVb2OrZJl33eLM9dX552JSaYB3+8EBPWJSMpd3YC59Jz/aGPoym11NHo7W89iZqww3xbHvhGcWTbWgxpgmzgxerev1wQFphhVS4uCPWCLTBa921ZEDCUgys12UVTjoELL05QGC5a4cKzacHSjc
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(39860400002)(136003)(396003)(376002)(366004)(451199021)(2906002)(30864003)(38100700002)(41300700001)(44832011)(8676002)(6862004)(8936002)(5660300002)(86362001)(6486002)(6666004)(6506007)(6512007)(26005)(478600001)(83380400001)(186003)(66946007)(66476007)(66556008)(6636002)(82960400001)(316002)(4326008)(450100002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ck2M7gDFgUYi+0yYDpB/bFqDViTDK0wSiyrzChc2UcNo1axBU+1/sL1G3b82?=
 =?us-ascii?Q?LOJzupxdWV6p7/6NCVDVvdwtYxjv34oQ5R/h+uSTYsD8SahTYgw5PHthuGDI?=
 =?us-ascii?Q?fuv/pdBRwasuzvxH7o1AtAcPF3/O3fdS3/5bQOF0yclGbA4arxvrsC7l/hKZ?=
 =?us-ascii?Q?jfCaCSQNDYaiNHmiIMjpAzchDBdz4UvJkwMaGJyD6ShqYf90YvZcIxvtuux6?=
 =?us-ascii?Q?Z/vqZhpwEwXthzSP2N2Zp+rNjHoZV2WW/swLYAdWl/PPK9yEaNJxm8AtgWBB?=
 =?us-ascii?Q?0Yo95DQZfNsa/UCxSbhrKKy/GolcjYw91Lh4soIxXmZs9fyK15MZlPmxHEsL?=
 =?us-ascii?Q?ODXeZp4lnaDUMuPmzSKeabXublynS3QEFlOSkIQchuF2nW3Zy6HmZ8oE2Z+a?=
 =?us-ascii?Q?p2l0iNR9ujv1LegH3udjEJHABelZsk/TH24r/F8jacDFiu7z7LRMhIBHX/4w?=
 =?us-ascii?Q?4Ivcgokmb3BF6KhJhKrZUJvm7cq/tbpgIWgyo9xvAhJzs/vRjDwVIYVP4XTW?=
 =?us-ascii?Q?AhitirXCki04jLFH8CVlZURHv4FQZ0hnyW2n/E8hLIhED0B900XQcSszJVHS?=
 =?us-ascii?Q?LL1yCnluwMZePltbrF/vuYIHkoIhhO8+Ar8i9SQR0Z0vWi6Xscj2XAs5Ebmw?=
 =?us-ascii?Q?4yM5o2bBWHpKAyWWQaph8oJmJ45nzGnl90xcFiwPjCNYgKcY37J3oOuuLVge?=
 =?us-ascii?Q?cybkJvoU9Xqnk6Mp/tctmBKWy+fz2jPBi/awtuFZ8FpIk3X7ZI0pw0S8MKUD?=
 =?us-ascii?Q?aQ/zV6yVh0jJnbPtWTF/cX9HNykGitaLlPqhhFC6QocZN4/gACwONnAJGf/b?=
 =?us-ascii?Q?3TfOM5tIGF/KQ0JN5UiQ0ROY5hl89NxfC4bIuRQ7BxfcZCtIsgB5SILHLo7F?=
 =?us-ascii?Q?ryFkAd54Qrp+nAynsBhry0DxqfwojHS3BvzNCChUxcxVGUmPyKZSrmCBPv3x?=
 =?us-ascii?Q?n8kOpbDFPypfuRVgAKPbR92Ef/MxOB7hrQ/96kQU2/0uWTcvddQ/8SEk/FZ8?=
 =?us-ascii?Q?kyh5JR8PHc09ppoUlEH+UnJLvCQ5pFrvmlMr7qvz38v9e36qconbDEXHOwAY?=
 =?us-ascii?Q?ZcHlwcSQ2g5AYxOT9j13S8CwkV9EFnaHbd2gXJKWNDD3zE8AO5XhDOp1HIdi?=
 =?us-ascii?Q?lFmb00weZhT2GPXASfigxOjS1TjakWD/OOQERk0JpMEgi0o97+CxBDHTxRqi?=
 =?us-ascii?Q?YoPBB+xb5LSg6+PuWKz7y1AcdkLzhFlL/iXaa5w+/dKzKbeMTpeMx8U/25gy?=
 =?us-ascii?Q?xn9zFLnkGM909ihzFlPTEEQd8FdmEE3vCKTnpsv1mHd+14wVfICgtxn820hf?=
 =?us-ascii?Q?+sSDsEfQtmZ3kLxikG4XnqJ8Irzjo+6xBja+JTyVx2+HGgo1AGShcnJAmuLi?=
 =?us-ascii?Q?COU66TgA2g17NFYVfx4CiR2OaM/Z6tsCB0UQikzKRUP0CCzKDt1nS8D+0Bx9?=
 =?us-ascii?Q?XmLeJxn8QSKED3fF6fSy6i2XCcHN22n14k2Mppsymbz/QVlEUXCXLjuwaG81?=
 =?us-ascii?Q?xwtnIJxjfU0fNryAchiBDVISaAWEXwmyzV81GSR5BnLyMxsU50yrcWJGPtMv?=
 =?us-ascii?Q?iHK1FlRcUfMDmNEl27rXE9NFiKJlHSj96Vo4B63D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bc40a3fe-4c2c-40f3-60d2-08db4acbe5e0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2023 05:13:00.1574 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aEzWTyWJpNkDPfiPVBuqeiJPk8WiViIc7iApazNF9TYzmnPIDx0/YHwjX+8rLWRx5nRP0b1SGQl+vrpGLRPWfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5366
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
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 26, 2023 at 04:57:03PM -0400, Rodrigo Vivi wrote:
> No functional change here. The goal is to have a clear split between
> the mapped portions of the CTB and the static information, so we can
> easily capture snapshots that will be used for later read out with
> the devcoredump infrastructure.
> 
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Good clean up. Let's adopt this style everywhere in Xe going forward.

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc_ct.c       | 155 ++++++++++++++-------------
>  drivers/gpu/drm/xe/xe_guc_ct_types.h |  20 ++--
>  2 files changed, 95 insertions(+), 80 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 9055ff133a7c..e16e5fe37ed4 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -172,13 +172,14 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
>  static void guc_ct_ctb_h2g_init(struct xe_device *xe, struct guc_ctb *h2g,
>  				struct iosys_map *map)
>  {
> -	h2g->size = CTB_H2G_BUFFER_SIZE / sizeof(u32);
> -	h2g->resv_space = 0;
> -	h2g->tail = 0;
> -	h2g->head = 0;
> -	h2g->space = CIRC_SPACE(h2g->tail, h2g->head, h2g->size) -
> -		h2g->resv_space;
> -	h2g->broken = false;
> +	h2g->info.size = CTB_H2G_BUFFER_SIZE / sizeof(u32);
> +	h2g->info.resv_space = 0;
> +	h2g->info.tail = 0;
> +	h2g->info.head = 0;
> +	h2g->info.space = CIRC_SPACE(h2g->info.tail, h2g->info.head,
> +				     h2g->info.size) -
> +			  h2g->info.resv_space;
> +	h2g->info.broken = false;
>  
>  	h2g->desc = *map;
>  	xe_map_memset(xe, &h2g->desc, 0, 0, sizeof(struct guc_ct_buffer_desc));
> @@ -189,13 +190,14 @@ static void guc_ct_ctb_h2g_init(struct xe_device *xe, struct guc_ctb *h2g,
>  static void guc_ct_ctb_g2h_init(struct xe_device *xe, struct guc_ctb *g2h,
>  				struct iosys_map *map)
>  {
> -	g2h->size = CTB_G2H_BUFFER_SIZE / sizeof(u32);
> -	g2h->resv_space = G2H_ROOM_BUFFER_SIZE / sizeof(u32);
> -	g2h->head = 0;
> -	g2h->tail = 0;
> -	g2h->space = CIRC_SPACE(g2h->tail, g2h->head, g2h->size) -
> -		g2h->resv_space;
> -	g2h->broken = false;
> +	g2h->info.size = CTB_G2H_BUFFER_SIZE / sizeof(u32);
> +	g2h->info.resv_space = G2H_ROOM_BUFFER_SIZE / sizeof(u32);
> +	g2h->info.head = 0;
> +	g2h->info.tail = 0;
> +	g2h->info.space = CIRC_SPACE(g2h->info.tail, g2h->info.head,
> +				     g2h->info.size) -
> +			  g2h->info.resv_space;
> +	g2h->info.broken = false;
>  
>  	g2h->desc = IOSYS_MAP_INIT_OFFSET(map, CTB_DESC_SIZE);
>  	xe_map_memset(xe, &g2h->desc, 0, 0, sizeof(struct guc_ct_buffer_desc));
> @@ -212,7 +214,7 @@ static int guc_ct_ctb_h2g_register(struct xe_guc_ct *ct)
>  
>  	desc_addr = xe_bo_ggtt_addr(ct->bo);
>  	ctb_addr = xe_bo_ggtt_addr(ct->bo) + CTB_DESC_SIZE * 2;
> -	size = ct->ctbs.h2g.size * sizeof(u32);
> +	size = ct->ctbs.h2g.info.size * sizeof(u32);
>  
>  	err = xe_guc_self_cfg64(guc,
>  				GUC_KLV_SELF_CFG_H2G_CTB_DESCRIPTOR_ADDR_KEY,
> @@ -240,7 +242,7 @@ static int guc_ct_ctb_g2h_register(struct xe_guc_ct *ct)
>  	desc_addr = xe_bo_ggtt_addr(ct->bo) + CTB_DESC_SIZE;
>  	ctb_addr = xe_bo_ggtt_addr(ct->bo) + CTB_DESC_SIZE * 2 +
>  		CTB_H2G_BUFFER_SIZE;
> -	size = ct->ctbs.g2h.size * sizeof(u32);
> +	size = ct->ctbs.g2h.info.size * sizeof(u32);
>  
>  	err = xe_guc_self_cfg64(guc,
>  				GUC_KLV_SELF_CFG_G2H_CTB_DESCRIPTOR_ADDR_KEY,
> @@ -329,11 +331,12 @@ static bool h2g_has_room(struct xe_guc_ct *ct, u32 cmd_len)
>  
>  	lockdep_assert_held(&ct->lock);
>  
> -	if (cmd_len > h2g->space) {
> -		h2g->head = desc_read(ct_to_xe(ct), h2g, head);
> -		h2g->space = CIRC_SPACE(h2g->tail, h2g->head, h2g->size) -
> -			h2g->resv_space;
> -		if (cmd_len > h2g->space)
> +	if (cmd_len > h2g->info.space) {
> +		h2g->info.head = desc_read(ct_to_xe(ct), h2g, head);
> +		h2g->info.space = CIRC_SPACE(h2g->info.tail, h2g->info.head,
> +					     h2g->info.size) -
> +				  h2g->info.resv_space;
> +		if (cmd_len > h2g->info.space)
>  			return false;
>  	}
>  
> @@ -344,7 +347,7 @@ static bool g2h_has_room(struct xe_guc_ct *ct, u32 g2h_len)
>  {
>  	lockdep_assert_held(&ct->lock);
>  
> -	return ct->ctbs.g2h.space > g2h_len;
> +	return ct->ctbs.g2h.info.space > g2h_len;
>  }
>  
>  static int has_room(struct xe_guc_ct *ct, u32 cmd_len, u32 g2h_len)
> @@ -360,16 +363,16 @@ static int has_room(struct xe_guc_ct *ct, u32 cmd_len, u32 g2h_len)
>  static void h2g_reserve_space(struct xe_guc_ct *ct, u32 cmd_len)
>  {
>  	lockdep_assert_held(&ct->lock);
> -	ct->ctbs.h2g.space -= cmd_len;
> +	ct->ctbs.h2g.info.space -= cmd_len;
>  }
>  
>  static void g2h_reserve_space(struct xe_guc_ct *ct, u32 g2h_len, u32 num_g2h)
>  {
> -	XE_BUG_ON(g2h_len > ct->ctbs.g2h.space);
> +	XE_BUG_ON(g2h_len > ct->ctbs.g2h.info.space);
>  
>  	if (g2h_len) {
>  		spin_lock_irq(&ct->fast_lock);
> -		ct->ctbs.g2h.space -= g2h_len;
> +		ct->ctbs.g2h.info.space -= g2h_len;
>  		ct->g2h_outstanding += num_g2h;
>  		spin_unlock_irq(&ct->fast_lock);
>  	}
> @@ -378,10 +381,10 @@ static void g2h_reserve_space(struct xe_guc_ct *ct, u32 g2h_len, u32 num_g2h)
>  static void __g2h_release_space(struct xe_guc_ct *ct, u32 g2h_len)
>  {
>  	lockdep_assert_held(&ct->fast_lock);
> -	XE_WARN_ON(ct->ctbs.g2h.space + g2h_len >
> -		   ct->ctbs.g2h.size - ct->ctbs.g2h.resv_space);
> +	XE_WARN_ON(ct->ctbs.g2h.info.space + g2h_len >
> +		   ct->ctbs.g2h.info.size - ct->ctbs.g2h.info.resv_space);
>  
> -	ct->ctbs.g2h.space += g2h_len;
> +	ct->ctbs.g2h.info.space += g2h_len;
>  	--ct->g2h_outstanding;
>  }
>  
> @@ -400,20 +403,21 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  	u32 cmd[GUC_CTB_MSG_MAX_LEN / sizeof(u32)];
>  	u32 cmd_len = len + GUC_CTB_HDR_LEN;
>  	u32 cmd_idx = 0, i;
> -	u32 tail = h2g->tail;
> +	u32 tail = h2g->info.tail;
>  	struct iosys_map map = IOSYS_MAP_INIT_OFFSET(&h2g->cmds,
>  							 tail * sizeof(u32));
>  
>  	lockdep_assert_held(&ct->lock);
>  	XE_BUG_ON(len * sizeof(u32) > GUC_CTB_MSG_MAX_LEN);
> -	XE_BUG_ON(tail > h2g->size);
> +	XE_BUG_ON(tail > h2g->info.size);
>  
>  	/* Command will wrap, zero fill (NOPs), return and check credits again */
> -	if (tail + cmd_len > h2g->size) {
> -		xe_map_memset(xe, &map, 0, 0, (h2g->size - tail) * sizeof(u32));
> -		h2g_reserve_space(ct, (h2g->size - tail));
> -		h2g->tail = 0;
> -		desc_write(xe, h2g, tail, h2g->tail);
> +	if (tail + cmd_len > h2g->info.size) {
> +		xe_map_memset(xe, &map, 0, 0,
> +			      (h2g->info.size - tail) * sizeof(u32));
> +		h2g_reserve_space(ct, (h2g->info.size - tail));
> +		h2g->info.tail = 0;
> +		desc_write(xe, h2g, tail, h2g->info.tail);
>  
>  		return -EAGAIN;
>  	}
> @@ -445,11 +449,11 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  	xe_device_wmb(ct_to_xe(ct));
>  
>  	/* Update local copies */
> -	h2g->tail = (tail + cmd_len) % h2g->size;
> +	h2g->info.tail = (tail + cmd_len) % h2g->info.size;
>  	h2g_reserve_space(ct, cmd_len);
>  
>  	/* Update descriptor */
> -	desc_write(xe, h2g, tail, h2g->tail);
> +	desc_write(xe, h2g, tail, h2g->info.tail);
>  
>  	return 0;
>  }
> @@ -466,7 +470,7 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
>  	XE_BUG_ON(!g2h_len && num_g2h);
>  	lockdep_assert_held(&ct->lock);
>  
> -	if (unlikely(ct->ctbs.h2g.broken)) {
> +	if (unlikely(ct->ctbs.h2g.info.broken)) {
>  		ret = -EPIPE;
>  		goto out;
>  	}
> @@ -554,8 +558,9 @@ static int guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  		if (sleep_period_ms == 1024)
>  			goto broken;
>  
> -		trace_xe_guc_ct_h2g_flow_control(h2g->head, h2g->tail,
> -						 h2g->size, h2g->space,
> +		trace_xe_guc_ct_h2g_flow_control(h2g->info.head, h2g->info.tail,
> +						 h2g->info.size,
> +						 h2g->info.space,
>  						 len + GUC_CTB_HDR_LEN);
>  		msleep(sleep_period_ms);
>  		sleep_period_ms <<= 1;
> @@ -565,15 +570,16 @@ static int guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  		struct xe_device *xe = ct_to_xe(ct);
>  		struct guc_ctb *g2h = &ct->ctbs.g2h;
>  
> -		trace_xe_guc_ct_g2h_flow_control(g2h->head,
> +		trace_xe_guc_ct_g2h_flow_control(g2h->info.head,
>  						 desc_read(xe, g2h, tail),
> -						 g2h->size, g2h->space,
> +						 g2h->info.size,
> +						 g2h->info.space,
>  						 g2h_fence ?
>  						 GUC_CTB_HXG_MSG_MAX_LEN :
>  						 g2h_len);
>  
>  #define g2h_avail(ct)	\
> -	(desc_read(ct_to_xe(ct), (&ct->ctbs.g2h), tail) != ct->ctbs.g2h.head)
> +	(desc_read(ct_to_xe(ct), (&ct->ctbs.g2h), tail) != ct->ctbs.g2h.info.head)
>  		if (!wait_event_timeout(ct->wq, !ct->g2h_outstanding ||
>  					g2h_avail(ct), HZ))
>  			goto broken;
> @@ -590,7 +596,7 @@ static int guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  broken:
>  	drm_err(drm, "No forward process on H2G, reset required");
>  	xe_guc_ct_print(ct, &p);
> -	ct->ctbs.h2g.broken = true;
> +	ct->ctbs.h2g.info.broken = true;
>  
>  	return -EDEADLK;
>  }
> @@ -656,7 +662,7 @@ static bool retry_failure(struct xe_guc_ct *ct, int ret)
>  		return false;
>  
>  #define ct_alive(ct)	\
> -	(ct->enabled && !ct->ctbs.h2g.broken && !ct->ctbs.g2h.broken)
> +	(ct->enabled && !ct->ctbs.h2g.info.broken && !ct->ctbs.g2h.info.broken)
>  	if (!wait_event_interruptible_timeout(ct->wq, ct_alive(ct),  HZ * 5))
>  		return false;
>  #undef ct_alive
> @@ -821,7 +827,7 @@ static int parse_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
>  		drm_err(&xe->drm,
>  			"G2H channel broken on read, origin=%d, reset required\n",
>  			origin);
> -		ct->ctbs.g2h.broken = true;
> +		ct->ctbs.g2h.info.broken = true;
>  
>  		return -EPROTO;
>  	}
> @@ -840,7 +846,7 @@ static int parse_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
>  		drm_err(&xe->drm,
>  			"G2H channel broken on read, type=%d, reset required\n",
>  			type);
> -		ct->ctbs.g2h.broken = true;
> +		ct->ctbs.g2h.info.broken = true;
>  
>  		ret = -EOPNOTSUPP;
>  	}
> @@ -919,36 +925,37 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>  	if (!ct->enabled)
>  		return -ENODEV;
>  
> -	if (g2h->broken)
> +	if (g2h->info.broken)
>  		return -EPIPE;
>  
>  	/* Calculate DW available to read */
>  	tail = desc_read(xe, g2h, tail);
> -	avail = tail - g2h->head;
> +	avail = tail - g2h->info.head;
>  	if (unlikely(avail == 0))
>  		return 0;
>  
>  	if (avail < 0)
> -		avail += g2h->size;
> +		avail += g2h->info.size;
>  
>  	/* Read header */
> -	xe_map_memcpy_from(xe, msg, &g2h->cmds, sizeof(u32) * g2h->head, sizeof(u32));
> +	xe_map_memcpy_from(xe, msg, &g2h->cmds, sizeof(u32) * g2h->info.head,
> +			   sizeof(u32));
>  	len = FIELD_GET(GUC_CTB_MSG_0_NUM_DWORDS, msg[0]) + GUC_CTB_MSG_MIN_LEN;
>  	if (len > avail) {
>  		drm_err(&xe->drm,
>  			"G2H channel broken on read, avail=%d, len=%d, reset required\n",
>  			avail, len);
> -		g2h->broken = true;
> +		g2h->info.broken = true;
>  
>  		return -EPROTO;
>  	}
>  
> -	head = (g2h->head + 1) % g2h->size;
> +	head = (g2h->info.head + 1) % g2h->info.size;
>  	avail = len - 1;
>  
>  	/* Read G2H message */
> -	if (avail + head > g2h->size) {
> -		u32 avail_til_wrap = g2h->size - head;
> +	if (avail + head > g2h->info.size) {
> +		u32 avail_til_wrap = g2h->info.size - head;
>  
>  		xe_map_memcpy_from(xe, msg + 1,
>  				   &g2h->cmds, sizeof(u32) * head,
> @@ -983,8 +990,8 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>  	}
>  
>  	/* Update local / descriptor header */
> -	g2h->head = (head + avail) % g2h->size;
> -	desc_write(xe, g2h, head, g2h->head);
> +	g2h->info.head = (head + avail) % g2h->info.size;
> +	desc_write(xe, g2h, head, g2h->info.head);
>  
>  	return len;
>  }
> @@ -1093,12 +1100,12 @@ static void guc_ct_ctb_print(struct xe_device *xe, struct guc_ctb *ctb,
>  {
>  	u32 head, tail;
>  
> -	drm_printf(p, "\tsize: %d\n", ctb->size);
> -	drm_printf(p, "\tresv_space: %d\n", ctb->resv_space);
> -	drm_printf(p, "\thead: %d\n", ctb->head);
> -	drm_printf(p, "\ttail: %d\n", ctb->tail);
> -	drm_printf(p, "\tspace: %d\n", ctb->space);
> -	drm_printf(p, "\tbroken: %d\n", ctb->broken);
> +	drm_printf(p, "\tsize: %d\n", ctb->info.size);
> +	drm_printf(p, "\tresv_space: %d\n", ctb->info.resv_space);
> +	drm_printf(p, "\thead: %d\n", ctb->info.head);
> +	drm_printf(p, "\ttail: %d\n", ctb->info.tail);
> +	drm_printf(p, "\tspace: %d\n", ctb->info.space);
> +	drm_printf(p, "\tbroken: %d\n", ctb->info.broken);
>  
>  	head = desc_read(xe, ctb, head);
>  	tail = desc_read(xe, ctb, tail);
> @@ -1114,7 +1121,7 @@ static void guc_ct_ctb_print(struct xe_device *xe, struct guc_ctb *ctb,
>  			drm_printf(p, "\tcmd[%d]: 0x%08x\n", head,
>  				   xe_map_rd(xe, &map, 0, u32));
>  			++head;
> -			if (head == ctb->size) {
> +			if (head == ctb->info.size) {
>  				head = 0;
>  				map = ctb->cmds;
>  			} else {
> @@ -1168,12 +1175,12 @@ void xe_guc_ct_selftest(struct xe_guc_ct *ct, struct drm_printer *p)
>  	if (!ret) {
>  		xe_guc_ct_irq_handler(ct);
>  		msleep(200);
> -		if (g2h->space !=
> -		    CIRC_SPACE(0, 0, g2h->size) - g2h->resv_space) {
> +		if (g2h->info.space !=
> +		    CIRC_SPACE(0, 0, g2h->info.size) - g2h->info.resv_space) {
>  			drm_printf(p, "Mismatch on space %d, %d\n",
> -				   g2h->space,
> -				   CIRC_SPACE(0, 0, g2h->size) -
> -				   g2h->resv_space);
> +				   g2h->info.space,
> +				   CIRC_SPACE(0, 0, g2h->info.size) -
> +				   g2h->info.resv_space);
>  			ret = -EIO;
>  		}
>  		if (ct->g2h_outstanding) {
> @@ -1185,12 +1192,12 @@ void xe_guc_ct_selftest(struct xe_guc_ct *ct, struct drm_printer *p)
>  
>  	/* Check failure path for blocking CTs too */
>  	xe_guc_ct_send_block(ct, bad_action, ARRAY_SIZE(bad_action));
> -	if (g2h->space !=
> -	    CIRC_SPACE(0, 0, g2h->size) - g2h->resv_space) {
> +	if (g2h->info.space !=
> +	    CIRC_SPACE(0, 0, g2h->info.size) - g2h->info.resv_space) {
>  		drm_printf(p, "Mismatch on space %d, %d\n",
> -			   g2h->space,
> -			   CIRC_SPACE(0, 0, g2h->size) -
> -			   g2h->resv_space);
> +			   g2h->info.space,
> +			   CIRC_SPACE(0, 0, g2h->info.size) -
> +			   g2h->info.resv_space);
>  		ret = -EIO;
>  	}
>  	if (ct->g2h_outstanding) {
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct_types.h b/drivers/gpu/drm/xe/xe_guc_ct_types.h
> index fd27dacf00c5..64e3dd14d4b2 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_ct_types.h
> @@ -19,13 +19,9 @@
>  struct xe_bo;
>  
>  /**
> - * struct guc_ctb - GuC command transport buffer (CTB)
> + * struct guc_ctb_info - GuC command transport buffer (CTB) info
>   */
> -struct guc_ctb {
> -	/** @desc: dma buffer map for CTB descriptor */
> -	struct iosys_map desc;
> -	/** @cmds: dma buffer map for CTB commands */
> -	struct iosys_map cmds;
> +struct guc_ctb_info {
>  	/** @size: size of CTB commands (DW) */
>  	u32 size;
>  	/** @resv_space: reserved space of CTB commands (DW) */
> @@ -40,6 +36,18 @@ struct guc_ctb {
>  	bool broken;
>  };
>  
> +/**
> + * struct guc_ctb - GuC command transport buffer (CTB)
> + */
> +struct guc_ctb {
> +	/** @desc: dma buffer map for CTB descriptor */
> +	struct iosys_map desc;
> +	/** @cmds: dma buffer map for CTB commands */
> +	struct iosys_map cmds;
> +	/** @info: CTB info */
> +	struct guc_ctb_info info;
> +};
> +
>  /**
>   * struct xe_guc_ct - GuC command transport (CT) layer
>   *
> -- 
> 2.39.2
> 
