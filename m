Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A6B4D9A59
	for <lists+dri-devel@lfdr.de>; Tue, 15 Mar 2022 12:26:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E80710E3AE;
	Tue, 15 Mar 2022 11:26:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com
 [IPv6:2607:f8b0:4864:20::82e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D99D710E2BE;
 Tue, 15 Mar 2022 11:26:37 +0000 (UTC)
Received: by mail-qt1-x82e.google.com with SMTP id g7so8857422qtg.7;
 Tue, 15 Mar 2022 04:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1M0GcUGPS3BH99mWqswo4l2D80eS6n61yfC5Zanq+VA=;
 b=M6o6LI6N6RxGnIWdlxrCsf/LnQR5e0txgSMCU1nOU+Sh7zGeNGV7SuTbGHqJWkyCsN
 A21AsRK9Tp4KF9vdoWWgoZZT18mv2FLseKYamDrB16iHnd4HydnmFbuev4Wgo8M/1G8l
 dInUklRIdhWWj/c4/qngU+D0tbHw8aUqobgrWMZZWnNQXaI97AOwwEZqcPE7fgxZEtMM
 pP1OSYTwqunOUhsDFLKKZ01ciKXD4WWrfS7socrJlZziZDj/DMHbNnCM73PrL1t6Jtri
 fr3d58qTJ5bFvFdzzBTxieOGSMgmGFcNa/UTyxW7bR9Jstwu4IYDejyxnhfkkh2AZRAI
 9vgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1M0GcUGPS3BH99mWqswo4l2D80eS6n61yfC5Zanq+VA=;
 b=Ruy1jcoBbWwAsnbW9nILa9CfXmglZU1PL5dm8pN6tSGCAPnhwafIft292sBJyxDNiZ
 P691WTV7JQSc4BHOubvhPz9Vj6x55A5bQLYqY3H3kGMoGy7iOTILfnUtm1hnjSd+Gt/y
 9owxmu41yOjf2+KkdaSH3a++hq1zU2/Zzty1A1Td6oIMXyF08ks3zZ/wuks8D4iCXY6p
 RXzWF0HIjNKiBobbQZE5iFItBtH8yGp727wQd1g7gZmX7DkuvT/RG6fzB76eB91vi/Ac
 uGo5Cpk5Js5Bt0x4IdKDcVhmltsHMHmvnJubVwzvE8wLUOvCUIOZuPs6+wOvySDZnRXa
 FyBA==
X-Gm-Message-State: AOAM5302rF44D7b96c11ZrUIaDDc1zZER5aAzelLrmuAOwoJK3VN35/f
 jLNu1Kqo+f5sUGuIvlOujsqRBHrbUXZ96pSBRAlArcJ47P4=
X-Google-Smtp-Source: ABdhPJxzhIP8zGisqKviqE2uFuCI3jWlvMqEIFHQKlhs2fDERl2qxN0mF++hJS6Sh4iUtu5k5oO18z3eccICZcfDvxo=
X-Received: by 2002:a05:622a:1312:b0:2e1:aab3:4644 with SMTP id
 v18-20020a05622a131200b002e1aab34644mr20492943qtk.455.1647343596874; Tue, 15
 Mar 2022 04:26:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220314193206.534257-1-Arunpravin.PaneerSelvam@amd.com>
In-Reply-To: <20220314193206.534257-1-Arunpravin.PaneerSelvam@amd.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Tue, 15 Mar 2022 11:26:10 +0000
Message-ID: <CAM0jSHPeRaykGwF-V+--cXE9wgoDbttbTH=EkP+=xHu7rkB4Qg@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915: round_up the size to the alignment
 value
To: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>, alexander.deucher@amd.com,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 14 Mar 2022 at 19:32, Arunpravin
<Arunpravin.PaneerSelvam@amd.com> wrote:
>
> handle instances when size is not aligned with the min_page_size.
> Unigine Heaven has allocation requests for example required pages
> are 161 and alignment request is 128. To allocate the left over
> 33 pages, continues the iteration to find the order value which
> is 5 and 0 and when it compares with min_order = 7, triggers the
> BUG_ON((order < min_order). To avoid this problem, round_up the
> size to the alignment and enable the is_contiguous variable and
> the block trimmed to the original size.
>
> Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
> ---
>  drivers/gpu/drm/i915/i915_ttm_buddy_manager.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
> index 129f668f21ff..318aa731de5b 100644
> --- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
> +++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
> @@ -40,6 +40,7 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
>         struct i915_ttm_buddy_resource *bman_res;
>         struct drm_buddy *mm = &bman->mm;
>         unsigned long n_pages, lpfn;
> +       bool is_contiguous = 0;
>         u64 min_page_size;
>         u64 size;
>         int err;
> @@ -48,6 +49,9 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
>         if (!lpfn)
>                 lpfn = man->size;
>
> +       if (place->flags & TTM_PL_FLAG_CONTIGUOUS)
> +               is_contiguous = 1;
> +
>         bman_res = kzalloc(sizeof(*bman_res), GFP_KERNEL);
>         if (!bman_res)
>                 return -ENOMEM;
> @@ -71,7 +75,12 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
>
>         GEM_BUG_ON(min_page_size < mm->chunk_size);
>
> -       if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
> +       if (!is_contiguous && !IS_ALIGNED(size, min_page_size)) {
> +               size = round_up(size, min_page_size);
> +               is_contiguous = 1;
> +       }
> +
> +       if (is_contiguous) {

This looks like it will also do roundup_power_of_two()? I assume we
instead just want to feed the list_last_entry() block for trimming?

Anway, we should be able to just make this:

if (WARN_ON(!IS_ALIGNED(size, min_page_size))
    return -EINVAL;

That's at least the currently expected behaviour in i915, just that we
were previously not verifying it here.

>                 unsigned long pages;
>
>                 size = roundup_pow_of_two(size);
> @@ -106,7 +115,7 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
>         if (unlikely(err))
>                 goto err_free_blocks;
>
> -       if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
> +       if (is_contiguous) {
>                 u64 original_size = (u64)bman_res->base.num_pages << PAGE_SHIFT;
>
>                 mutex_lock(&bman->lock);
>
> base-commit: b37605de46fef48555bf0cf463cccf355c51fac0
> --
> 2.25.1
>
