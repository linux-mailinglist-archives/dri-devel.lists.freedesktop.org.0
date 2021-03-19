Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE8834143C
	for <lists+dri-devel@lfdr.de>; Fri, 19 Mar 2021 05:31:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43ACE6E97F;
	Fri, 19 Mar 2021 04:31:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2058.outbound.protection.outlook.com [40.107.244.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F81E6E97F
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Mar 2021 04:31:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jB+zOtbxIi3LTDje9Cbmjt6yEvpSGfdp7NIRufxgJngIStkpg6QdjI9AwlO0qbZw/Zzf/gW6XrtJN+i1N/+pmAJwMgmI3nSveY0tCr3LqlByvCui3A/ePRhdTEloZsWejhtER3nA8+BMcRk8WgCS7V/UjWhpji9FfzmNY4fPjjJ6Fb4MpOsx1dvGiQEfNuxzRTZhl3m8EsaOt3NjV7iAGAzu/1xoNrwtZUfrnAakech3UPpSwTL4dMxpZtAWB2zpaKQ6K4GFGtcv9ypWUP563dtjq3QgeennXOsE2kd23cHT6oEKoolNwlaA0jBcr3HIflx2zPtBLEWtL0vdG2NR+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N8NTB4VyL2f7TP8SMgPUBwTYP7FC9rlYacYHrLmS4co=;
 b=lu/J3TdcOTDpe50Vvt0fsP3J00SwKs8T2TrH0lXZHIfwgWeejGaAnJEOtxwkZWMufeurxNYzAvyknZoPap1qaV86bZbIdDi/EqK4MA4UmPY+NcrfPanIPuPIWZGgzK10tOfYcOeeGw2cQ4FIcsBM9jnSaINc5Y8EBk+OUNiKh37Zc94HglZvldjYExs9EOKONvVF13Ldxtp0zJbixwsChE+/LFb1YVcBVXzMwEwWmE5eu0JUwWyZBlR2LJTd5JK9vfLp1qG0eKl+zgayFdIRrsU/ubetTOi1af/tyCOh3A0J0hwfYe3qLX/XY3WrJBTM8BFGyJvMO+UW+IxDv5xV8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N8NTB4VyL2f7TP8SMgPUBwTYP7FC9rlYacYHrLmS4co=;
 b=zhZE1PcQKdz9c7zHN4rqebka428T5Xkj2oe1gX3oqlvUHurUG1keUekmlqFmUqy0tVGp05tUeJ/gzjf5Qj6mDK3D7oHztwjjyyo6NpDz766wZmcjwxnmv0hdPQkhpz0E/aTQGfDfHSm3aLvOfzQx6KCKKM0XX5cipg8iF4hHHHE=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
Received: from MWHPR12MB1248.namprd12.prod.outlook.com (2603:10b6:300:12::21)
 by MW2PR12MB2521.namprd12.prod.outlook.com (2603:10b6:907:8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Fri, 19 Mar
 2021 04:31:35 +0000
Received: from MWHPR12MB1248.namprd12.prod.outlook.com
 ([fe80::5094:3a69:806f:8a28]) by MWHPR12MB1248.namprd12.prod.outlook.com
 ([fe80::5094:3a69:806f:8a28%5]) with mapi id 15.20.3955.018; Fri, 19 Mar 2021
 04:31:35 +0000
Date: Fri, 19 Mar 2021 12:30:32 +0800
From: Huang Rui <ray.huang@amd.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 2/3] drm/ttm: remove swap LRU v3
Message-ID: <20210319043032.GB3262181@hr-amd>
References: <20210318124719.13656-1-christian.koenig@amd.com>
 <20210318124719.13656-2-christian.koenig@amd.com>
Content-Disposition: inline
In-Reply-To: <20210318124719.13656-2-christian.koenig@amd.com>
X-Originating-IP: [58.247.170.245]
X-ClientProxiedBy: HK2PR02CA0209.apcprd02.prod.outlook.com
 (2603:1096:201:20::21) To MWHPR12MB1248.namprd12.prod.outlook.com
 (2603:10b6:300:12::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from hr-amd (58.247.170.245) by
 HK2PR02CA0209.apcprd02.prod.outlook.com (2603:1096:201:20::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18 via Frontend Transport; Fri, 19 Mar 2021 04:31:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 631a9873-33a0-46a5-09ca-08d8ea8fe0ed
X-MS-TrafficTypeDiagnostic: MW2PR12MB2521:
X-Microsoft-Antispam-PRVS: <MW2PR12MB2521E3BE8FCB2EA9CB0DF3D9EC689@MW2PR12MB2521.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lK75ESiCwfR1OuAXNgBD7MQ2P57fQqhyoUWRS5EcbhHaC53mh8yC/Fa7enQwE3kymOmc021NLl9efuyuL3IWuKvwaz18g/W8VaVEVCDDzosa+8KP8gscH5KOTb1iVT3D7KMzYFaFQsEI55jHXT7evpvwndx0JF+8YAo446fpjby3VCaBXJQwOTpK0VfBFb+pVludSjYLS8YiayqPnEnUNES8jzHuSjsWLeooKTMetsmERdySNBlz3Ci2Bj+IIlbxT+Z7pCT1YSHsCSMoNIqFCSL1BFLcSielpUYLfgf8LUWNfFdk9q4Y4aYk4tpLxOh5OBMIRUHH7JBQ9vAmQhY94EtFNLo89Bp3RjIc6g2ju5qjCZDKFccgtEpQXGjBTwVqr6ywv74dURgxcT1KJyV3PJwIPxja1uLUhUOeKAVck/67jLfESSUqsEqXJq+er8zfxst9NttoyHQSx0XRbCbb2Hvp7eytme4zo3k/4RSvA89fQF1fLknXnQczI7fkfmeAx04sYlHDjXv4ywkJFAK+/8Zwk10aZ5/DOKmeStvyNlwfuosN30DPn+n/8e6pURboldHa2ZgL7nP5AHJ0xck7YRfpBzTwkwztdN0BfdVFGOrLbZ3dPQouELGLfDYmjeB7RkbukQEuna/d/8csDmH8gknrwjluF3wnnW1mTZvAr/Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR12MB1248.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(136003)(39860400002)(396003)(366004)(5660300002)(8936002)(66574015)(86362001)(52116002)(26005)(186003)(6916009)(956004)(8676002)(66476007)(38100700001)(2906002)(55016002)(33716001)(478600001)(66556008)(54906003)(66946007)(1076003)(83380400001)(9686003)(16526019)(6496006)(33656002)(4326008)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?iso-8859-1?Q?WN7vpYf4xbTwrHa1knDTjAUViJT9BUgd4UPUgd3wHIa06GCG0nrpnLK2hl?=
 =?iso-8859-1?Q?7O/gq4nQnZ/kwlGdWMilcIuurbdU6TvL7Er2Jeeb3yb3FlRIx/PWHAmSO6?=
 =?iso-8859-1?Q?EAUcFBc0+JrO4p8tnL0nXshQoECALHZqrrvVwFep51A5BSR8n62u51fkpv?=
 =?iso-8859-1?Q?JqINDTZoO28Cc88k0ZTTlBKJ4TJSBjEZ7BGJV9pPOxySpYpykWDgEYHnEg?=
 =?iso-8859-1?Q?+gZvjm3BJcxwLWkUX3P6u3IGnTTUvsamprJu3kK9emJqpHjje+7w4C72+P?=
 =?iso-8859-1?Q?mY8aF6OoT6hjByapii1BokHRWrTo+8sMUdCwEpZrLocUJ5LZG0E143LG22?=
 =?iso-8859-1?Q?f6bGAVP7Hfz/sPyEoRn5zfrvj0UOHoMRuSWsbDXdSvuDSoN5Q8sglBa5N/?=
 =?iso-8859-1?Q?6zzbUbeXGKGjFebYMxiol/6zMoKTAgdjDF5w+s1P4pvyq+M0XP5W/q2gFo?=
 =?iso-8859-1?Q?Whmn1nhlZ/YeO4+XDlGwD9SAOwJ3eJ1UkKyqsgyJ/aHju4bN8f7x8sV3qD?=
 =?iso-8859-1?Q?4O+zlccV7JD4Z4dU8Djw28z0aC1l7BuMckLNSpLTNHSc57Cuf+Wdyfgzqp?=
 =?iso-8859-1?Q?usT2POpkAv3VbZZovmsVsNeJceUxvkA8hyX4jhWo3rAako5yYSGytR46EV?=
 =?iso-8859-1?Q?Iokz7/2nL14Tgs4OuVv2a9Jsps0wWihKpN/FEYieHx2cIX09VhU/UpEzhR?=
 =?iso-8859-1?Q?1Qorg7WwUk5LtFaIgTkJnPWBo8v+bMOIetmjb0y+lRZBrJqTfu7btPuAVH?=
 =?iso-8859-1?Q?N5Tmmqr58RKyEcjQyotiygpvJl6uVrkCOZR+n6iqSTg2m9Nv+7d3gUSJbD?=
 =?iso-8859-1?Q?1yfY44EGIpt5B9b6oWqQPeYSwCnruPt6ba4J6DCL2jqCyyAXBEo2spFQTg?=
 =?iso-8859-1?Q?ABlfkmHZKXfaeDWYx5mS/Dky95g6owsqXD/B0ctis7LQWyVfsolBOtKGmD?=
 =?iso-8859-1?Q?v+dOMoaKt+RgeMTtFAfPoeBblhDIB977TF+HlFLCg6c787QEX3l9vs4+eL?=
 =?iso-8859-1?Q?Myo49B7MZUlbqAe5kRUMGuXWsNT5Qj4EzYh89Z9deCMzd4blxG9ALxA1m+?=
 =?iso-8859-1?Q?0TwZOvznj3F9R4vMX/5zpNroHSE1Zl/tzTfcqhfLmHK2Ap8TPTmhW1RJza?=
 =?iso-8859-1?Q?Iw5l1s/NCSamx+Bv7JpWbjZ5a+uqG5nNGkK276HAAifxou7xNCkkWUF7ke?=
 =?iso-8859-1?Q?eEZU2HNtonEKaauHNfSLyffs8c/RkALaydVdxlLPnPR/NVvVx6bikj/LxA?=
 =?iso-8859-1?Q?jss+9cT9X3cQe8WkvEpMWjPdFhrMq5nwf0Ugp23q5VPHYHhHi+iwiPFzy3?=
 =?iso-8859-1?Q?2SlQLA4ybLcJOM8rqCmAB+s3Ad2qNrigge9LJxZ2wdQ6yBOJU7EswxOrhF?=
 =?iso-8859-1?Q?WjAO7Bm2fF?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 631a9873-33a0-46a5-09ca-08d8ea8fe0ed
X-MS-Exchange-CrossTenant-AuthSource: MWHPR12MB1248.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2021 04:31:35.2307 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mY77NEfYawNyutd6RV+RKsU+wUjQL08K3NWmu0HHcj9WLTL5+fyxFFy+6vylt4PrIRRi53FKMUIk9Y7qqUi8hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2521
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
Cc: "matthew.william.auld@gmail.com" <matthew.william.auld@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 18, 2021 at 08:47:18PM +0800, Christian K=F6nig wrote:
> Instead evict round robin from each devices SYSTEM and TT domain.
> =

> v2: reorder num_pages access reported by Dan's script
> v3: fix rebase fallout, num_pages should be 32bit
> =

> Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>

Reviewed-by: Huang Rui <ray.huang@amd.com>

> ---
>  drivers/gpu/drm/ttm/ttm_bo.c        | 29 --------------
>  drivers/gpu/drm/ttm/ttm_bo_util.c   |  1 -
>  drivers/gpu/drm/ttm/ttm_device.c    | 60 +++++++++++++++++++++--------
>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.c |  2 +-
>  include/drm/ttm/ttm_bo_api.h        |  1 -
>  include/drm/ttm/ttm_bo_driver.h     |  1 -
>  include/drm/ttm/ttm_device.h        |  7 +---
>  7 files changed, 48 insertions(+), 53 deletions(-)
> =

> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index 66e00b404ec3..3673157527ff 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -73,7 +73,6 @@ static void ttm_bo_del_from_lru(struct ttm_buffer_objec=
t *bo)
>  {
>  	struct ttm_device *bdev =3D bo->bdev;
>  =

> -	list_del_init(&bo->swap);
>  	list_del_init(&bo->lru);
>  =

>  	if (bdev->funcs->del_from_lru_notify)
> @@ -105,16 +104,6 @@ void ttm_bo_move_to_lru_tail(struct ttm_buffer_objec=
t *bo,
>  =

>  	man =3D ttm_manager_type(bdev, mem->mem_type);
>  	list_move_tail(&bo->lru, &man->lru[bo->priority]);
> -	if (man->use_tt && bo->ttm &&
> -	    !(bo->ttm->page_flags & (TTM_PAGE_FLAG_SG |
> -				     TTM_PAGE_FLAG_SWAPPED))) {
> -		struct list_head *swap;
> -
> -		swap =3D &ttm_glob.swap_lru[bo->priority];
> -		list_move_tail(&bo->swap, swap);
> -	} else {
> -		list_del_init(&bo->swap);
> -	}
>  =

>  	if (bdev->funcs->del_from_lru_notify)
>  		bdev->funcs->del_from_lru_notify(bo);
> @@ -129,9 +118,6 @@ void ttm_bo_move_to_lru_tail(struct ttm_buffer_object=
 *bo,
>  			ttm_bo_bulk_move_set_pos(&bulk->vram[bo->priority], bo);
>  			break;
>  		}
> -		if (bo->ttm && !(bo->ttm->page_flags &
> -				 (TTM_PAGE_FLAG_SG | TTM_PAGE_FLAG_SWAPPED)))
> -			ttm_bo_bulk_move_set_pos(&bulk->swap[bo->priority], bo);
>  	}
>  }
>  EXPORT_SYMBOL(ttm_bo_move_to_lru_tail);
> @@ -169,20 +155,6 @@ void ttm_bo_bulk_move_lru_tail(struct ttm_lru_bulk_m=
ove *bulk)
>  		list_bulk_move_tail(&man->lru[i], &pos->first->lru,
>  				    &pos->last->lru);
>  	}
> -
> -	for (i =3D 0; i < TTM_MAX_BO_PRIORITY; ++i) {
> -		struct ttm_lru_bulk_move_pos *pos =3D &bulk->swap[i];
> -		struct list_head *lru;
> -
> -		if (!pos->first)
> -			continue;
> -
> -		dma_resv_assert_held(pos->first->base.resv);
> -		dma_resv_assert_held(pos->last->base.resv);
> -
> -		lru =3D &ttm_glob.swap_lru[i];
> -		list_bulk_move_tail(lru, &pos->first->swap, &pos->last->swap);
> -	}
>  }
>  EXPORT_SYMBOL(ttm_bo_bulk_move_lru_tail);
>  =

> @@ -1065,7 +1037,6 @@ int ttm_bo_init_reserved(struct ttm_device *bdev,
>  	kref_init(&bo->kref);
>  	INIT_LIST_HEAD(&bo->lru);
>  	INIT_LIST_HEAD(&bo->ddestroy);
> -	INIT_LIST_HEAD(&bo->swap);
>  	bo->bdev =3D bdev;
>  	bo->type =3D type;
>  	bo->mem.mem_type =3D TTM_PL_SYSTEM;
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_=
bo_util.c
> index 031e5819fec4..a2a17c84ceb3 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> @@ -303,7 +303,6 @@ static int ttm_buffer_object_transfer(struct ttm_buff=
er_object *bo,
>  	atomic_inc(&ttm_glob.bo_count);
>  	INIT_LIST_HEAD(&fbo->base.ddestroy);
>  	INIT_LIST_HEAD(&fbo->base.lru);
> -	INIT_LIST_HEAD(&fbo->base.swap);
>  	fbo->base.moving =3D NULL;
>  	drm_vma_node_reset(&fbo->base.base.vma_node);
>  =

> diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_d=
evice.c
> index b1424189fdfb..2096a0fd9c35 100644
> --- a/drivers/gpu/drm/ttm/ttm_device.c
> +++ b/drivers/gpu/drm/ttm/ttm_device.c
> @@ -67,7 +67,6 @@ static int ttm_global_init(void)
>  	unsigned long num_pages;
>  	struct sysinfo si;
>  	int ret =3D 0;
> -	unsigned i;
>  =

>  	mutex_lock(&ttm_global_mutex);
>  	if (++ttm_glob_use_count > 1)
> @@ -90,8 +89,6 @@ static int ttm_global_init(void)
>  		goto out;
>  	}
>  =

> -	for (i =3D 0; i < TTM_MAX_BO_PRIORITY; ++i)
> -		INIT_LIST_HEAD(&glob->swap_lru[i]);
>  	INIT_LIST_HEAD(&glob->device_list);
>  	atomic_set(&glob->bo_count, 0);
>  =

> @@ -109,27 +106,60 @@ static int ttm_global_init(void)
>  int ttm_global_swapout(struct ttm_operation_ctx *ctx, gfp_t gfp_flags)
>  {
>  	struct ttm_global *glob =3D &ttm_glob;
> +	struct ttm_device *bdev;
> +	int ret =3D -EBUSY;
> +
> +	mutex_lock(&ttm_global_mutex);
> +	list_for_each_entry(bdev, &glob->device_list, device_list) {
> +		ret =3D ttm_device_swapout(bdev, ctx, gfp_flags);
> +		if (ret > 0) {
> +			list_move_tail(&bdev->device_list, &glob->device_list);
> +			break;
> +		}
> +	}
> +	mutex_unlock(&ttm_global_mutex);
> +	return ret;
> +}
> +EXPORT_SYMBOL(ttm_global_swapout);
> +
> +long ttm_device_swapout(struct ttm_device *bdev, struct ttm_operation_ct=
x *ctx,
> +			gfp_t gfp_flags)
> +{
> +	struct ttm_global *glob =3D &ttm_glob;
> +	struct ttm_resource_manager *man;
>  	struct ttm_buffer_object *bo;
> -	unsigned i;
> +	unsigned i, j;
>  	int ret;
>  =

>  	spin_lock(&glob->lru_lock);
> -	for (i =3D 0; i < TTM_MAX_BO_PRIORITY; ++i) {
> -		list_for_each_entry(bo, &glob->swap_lru[i], swap) {
> -			uint32_t num_pages =3D bo->ttm->num_pages;
> -
> -			ret =3D ttm_bo_swapout(bo, ctx, gfp_flags);
> -			/* ttm_bo_swapout has dropped the lru_lock */
> -			if (!ret)
> -				return num_pages;
> -			if (ret !=3D -EBUSY)
> -				return ret;
> +	for (i =3D TTM_PL_SYSTEM; i < TTM_NUM_MEM_TYPES; ++i) {
> +		man =3D ttm_manager_type(bdev, i);
> +		if (!man || !man->use_tt)
> +			continue;
> +
> +		for (j =3D 0; j < TTM_MAX_BO_PRIORITY; ++j) {
> +			list_for_each_entry(bo, &man->lru[j], lru) {
> +				uint32_t num_pages;
> +
> +				if (!bo->ttm ||
> +				    bo->ttm->page_flags & TTM_PAGE_FLAG_SG ||
> +				    bo->ttm->page_flags & TTM_PAGE_FLAG_SWAPPED)
> +					continue;
> +
> +				num_pages =3D bo->ttm->num_pages;
> +				ret =3D ttm_bo_swapout(bo, ctx, gfp_flags);
> +				/* ttm_bo_swapout has dropped the lru_lock */
> +				if (!ret)
> +					return num_pages;
> +				if (ret !=3D -EBUSY)
> +					return ret;
> +			}
>  		}
>  	}
>  	spin_unlock(&glob->lru_lock);
>  	return 0;
>  }
> -EXPORT_SYMBOL(ttm_global_swapout);
> +EXPORT_SYMBOL(ttm_device_swapout);
>  =

>  static void ttm_init_sysman(struct ttm_device *bdev)
>  {
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx=
/vmwgfx_drv.c
> index b991422e156c..4e41d8221f06 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> @@ -1371,7 +1371,7 @@ static int vmw_pm_freeze(struct device *kdev)
>  	vmw_execbuf_release_pinned_bo(dev_priv);
>  	vmw_resource_evict_all(dev_priv);
>  	vmw_release_device_early(dev_priv);
> -	while (ttm_global_swapout(&ctx, GFP_KERNEL) > 0);
> +	while (ttm_device_swapout(&dev_priv->bdev, &ctx, GFP_KERNEL) > 0);
>  	if (dev_priv->enable_fb)
>  		vmw_fifo_resource_dec(dev_priv);
>  	if (atomic_read(&dev_priv->num_fifo_resources) !=3D 0) {
> diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
> index 5044ac330858..3587f660e8f4 100644
> --- a/include/drm/ttm/ttm_bo_api.h
> +++ b/include/drm/ttm/ttm_bo_api.h
> @@ -144,7 +144,6 @@ struct ttm_buffer_object {
>  =

>  	struct list_head lru;
>  	struct list_head ddestroy;
> -	struct list_head swap;
>  =

>  	/**
>  	 * Members protected by a bo reservation.
> diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_dri=
ver.h
> index 8959c0075cfd..d007feef7676 100644
> --- a/include/drm/ttm/ttm_bo_driver.h
> +++ b/include/drm/ttm/ttm_bo_driver.h
> @@ -69,7 +69,6 @@ struct ttm_lru_bulk_move_pos {
>  struct ttm_lru_bulk_move {
>  	struct ttm_lru_bulk_move_pos tt[TTM_MAX_BO_PRIORITY];
>  	struct ttm_lru_bulk_move_pos vram[TTM_MAX_BO_PRIORITY];
> -	struct ttm_lru_bulk_move_pos swap[TTM_MAX_BO_PRIORITY];
>  };
>  =

>  /*
> diff --git a/include/drm/ttm/ttm_device.h b/include/drm/ttm/ttm_device.h
> index 6a0b267d4fe6..cda6efb4c34b 100644
> --- a/include/drm/ttm/ttm_device.h
> +++ b/include/drm/ttm/ttm_device.h
> @@ -63,11 +63,6 @@ extern struct ttm_global {
>  	 */
>  	struct list_head device_list;
>  =

> -	/**
> -	 * Protected by the lru_lock.
> -	 */
> -	struct list_head swap_lru[TTM_MAX_BO_PRIORITY];
> -
>  	/**
>  	 * Internal protection.
>  	 */
> @@ -298,6 +293,8 @@ struct ttm_device {
>  };
>  =

>  long ttm_global_swapout(struct ttm_operation_ctx *ctx, gfp_t gfp_flags);
> +long ttm_device_swapout(struct ttm_device *bdev, struct ttm_operation_ct=
x *ctx,
> +		       gfp_t gfp_flags);
>  =

>  static inline struct ttm_resource_manager *
>  ttm_manager_type(struct ttm_device *bdev, int mem_type)
> -- =

> 2.25.1
> =

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
