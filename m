Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E764F4B4910
	for <lists+dri-devel@lfdr.de>; Mon, 14 Feb 2022 11:28:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DC0F10E50F;
	Mon, 14 Feb 2022 10:28:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com
 [IPv6:2607:f8b0:4864:20::831])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE60A10E50F
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 10:28:01 +0000 (UTC)
Received: by mail-qt1-x831.google.com with SMTP id e16so15005090qtq.6
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 02:28:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=oz4FCmPKp6KeM2rwWp5PHCF3ZKJv081cMneheIE5ajA=;
 b=X2P6FYZxlLTDIuCeRKnmG+yCTNZ/GfYUiLMzFtK3jl1HJYLnZMFWQTxmKzzRbl6FEt
 eQ0Ta5wsIb+XYU6SscC8+sl/a+vluCvsyB3CGxecRXmd554H3HdWOaSpDTXBnF1yjIxj
 jUNSg3UpiATwasHHnOOV0fkFsgjMK0adWOYo4oBUn66TZuVnC3XC+eCNWwFCiGRDBrGg
 HqNVH93Kqa9UIYycRGhgbe0rBlAhFmPikXtZOMaRzxRZGhctbHTE3j0PWF833T7yhMjY
 c8QJs1mlerDZ20pAn8pgGx0deP0S6lPG2/KKs0GRIO4O2JYbpg9dpDVPPuGu5EJ4XOXu
 sHEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=oz4FCmPKp6KeM2rwWp5PHCF3ZKJv081cMneheIE5ajA=;
 b=E81QUK9TiM5uobDwOZFgoU2ZC1MVbG0qWF1tP1JANq8RHAoTEB0DGF3LQluF9awpXH
 DW3co184G3hRFdqYJtDMqJvga9lqQOFeOwiGh6nWHvePF70BPR3kghxkR7ynbzsXrBem
 gUfYER9HQu7oYrtD8fRFCwyQ5DBKirxbjTZ6a2PM1VYwNmf1hTVZUSJSManXkUP5zYBb
 R+PgVEofIh4xdi5Zmjwsv9HIK35JJxiZzFYdoeeSAbe+cLJfO3K8fs4DR/813Jek1ufU
 b2Tcog1ME963CkflrCUWZHN6AqjW8GGB6p4J+Qe/PsgjNmEqRPYdehmKHGQz7s7Sk1z5
 sxww==
X-Gm-Message-State: AOAM532FUGeErlGtAL9T0rFA0vloT6FynnhCvwLQkvjxtzfpbvz3cxjF
 eTyUNuGuzuNVSzBK8kP/coP9kveQny3VFn2yulQ=
X-Google-Smtp-Source: ABdhPJx3iwETcQIEBND/SGXRCqEQrmufupPybEqBrh6jkQHxLU76VadleHxIuOeoTue0Yb3E3BKAUcZCTtZRVAaQPpA=
X-Received: by 2002:ac8:5fce:: with SMTP id k14mr8975371qta.645.1644834480687; 
 Mon, 14 Feb 2022 02:28:00 -0800 (PST)
MIME-Version: 1.0
References: <20220214093439.2989-1-christian.koenig@amd.com>
In-Reply-To: <20220214093439.2989-1-christian.koenig@amd.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Mon, 14 Feb 2022 10:27:34 +0000
Message-ID: <CAM0jSHNBT3_m6i+oHHBSMmVMkjfxNmPrZW2TVM-g2eMSmBQ3ZA@mail.gmail.com>
Subject: Re: [PATCH 01/11] drm/ttm: fix resource manager size type and
 description
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 felix.kuehling@amd.com, ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 14 Feb 2022 at 09:34, Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> That are not pages any more.

"Leave the man->size units as driver defined."

>
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/ttm/ttm_resource.c | 6 +++---
>  include/drm/ttm/ttm_resource.h     | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm=
_resource.c
> index 68344c90549b..ae40e144e728 100644
> --- a/drivers/gpu/drm/ttm/ttm_resource.c
> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
> @@ -153,19 +153,19 @@ void ttm_resource_set_bo(struct ttm_resource *res,
>   *
>   * @man: memory manager object to init
>   * @bdev: ttm device this manager belongs to
> - * @p_size: size managed area in pages.
> + * @size: size of managed resources in arbitary units

s/arbitary/arbitrary/

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

>   *
>   * Initialise core parts of a manager object.
>   */
>  void ttm_resource_manager_init(struct ttm_resource_manager *man,
>                                struct ttm_device *bdev,
> -                              unsigned long p_size)
> +                              uint64_t size)
>  {
>         unsigned i;
>
>         spin_lock_init(&man->move_lock);
>         man->bdev =3D bdev;
> -       man->size =3D p_size;
> +       man->size =3D size;
>
>         for (i =3D 0; i < TTM_MAX_BO_PRIORITY; ++i)
>                 INIT_LIST_HEAD(&man->lru[i]);
> diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resourc=
e.h
> index 69eea9d6399b..555a11fb8a7f 100644
> --- a/include/drm/ttm/ttm_resource.h
> +++ b/include/drm/ttm/ttm_resource.h
> @@ -278,7 +278,7 @@ void ttm_resource_set_bo(struct ttm_resource *res,
>
>  void ttm_resource_manager_init(struct ttm_resource_manager *man,
>                                struct ttm_device *bdev,
> -                              unsigned long p_size);
> +                              uint64_t size);
>
>  int ttm_resource_manager_evict_all(struct ttm_device *bdev,
>                                    struct ttm_resource_manager *man);
> --
> 2.25.1
>
