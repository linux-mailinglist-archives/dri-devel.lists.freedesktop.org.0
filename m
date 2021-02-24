Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7CAA323610
	for <lists+dri-devel@lfdr.de>; Wed, 24 Feb 2021 04:34:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EC416E1B3;
	Wed, 24 Feb 2021 03:34:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75ED56E1B3;
 Wed, 24 Feb 2021 03:34:52 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id q186so988655oig.12;
 Tue, 23 Feb 2021 19:34:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xFoR+1So4xNhVQtRBlvRYXzZ/BjGkdNa/RVCyND5tfo=;
 b=QUqnq7wWgX5PARl1agRlecBPhP8ciu4OA0B78j6t0BkYe2QftLwlMsqw/PGDzZejcn
 oX8z/Jx8wCgsi4pCdwRoMkrBmNBOEstft1HuJSS3YSwgNbqQ8ncDidXM+u3iyNw0cOdi
 B7ynIGvFxZ+LrN2JhpJ/2TKjQop6BOsJwuVuVLxxk5b3tVGcqVSgBLW/3u5ASq4bGabO
 usFzQdMJImwLDm3msJ4LWa1Uf1WLv0P6HVvSP23CHGyqTbKmkTgYrjgUe1FvvXu2TYRq
 1M/mYGZDPU4YEN/NbB7utKdnzimhMXXplwfaMrq+az7kkZ3ZkEKgGm6gv24yR8IXaPXI
 MR5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xFoR+1So4xNhVQtRBlvRYXzZ/BjGkdNa/RVCyND5tfo=;
 b=b9Vo/EeXn7g8U5REr0Nd1waHpqT0mV1TtKir9AdWIw/nhhAhta5Safw+ro45i1Tw7M
 7QlJMr0HM2AoW+qLlqfPV0BaBhubh79u9EFMIUu9S+kO5xT9qiV9DqkEfia/gL+liuTR
 XM4N7zocyiZLhUdCJ5Gkiht5fJ+yBDs5hpWv4dh1Fn0yR7RE+E2I5lzFHRG+Mp/Q4dgj
 x82GiZhxTTbMhfprRPXaboIm8qyvjjpwX3mCY8KrQaKyNFmK1jJVuBEzJZdlubLHNHp1
 X+V6hdDx8tQWcWoZxNhIgPexn3XvSQNvSlFZTZpg3ftIr/8lIsPa84zLr5oSTTYtIu2O
 eOQg==
X-Gm-Message-State: AOAM530YSkmz6FvejMrR4aXHDsnK8d3ls4BnNqVAby2UkU2C2Eeo6jC+
 GWuVtTj5SzguDYbjBThH8FJSsd7uYkuMmiJez6Y=
X-Google-Smtp-Source: ABdhPJx8iAK2h4XofXbRO1SM1ka2+8KZ6sLhUOHGIW3v/5LX0ghiREmqS0MCpQSpTu+dOir3ul9MXmMevmR8skNrUQQ=
X-Received: by 2002:aca:fccb:: with SMTP id a194mr1321523oii.5.1614137691742; 
 Tue, 23 Feb 2021 19:34:51 -0800 (PST)
MIME-Version: 1.0
References: <20210224032808.150465-1-xinhui.pan@amd.com>
In-Reply-To: <20210224032808.150465-1-xinhui.pan@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 23 Feb 2021 22:34:40 -0500
Message-ID: <CADnq5_NhUK+VHVDNCYsV_k77DAONd+ML0fZo+tJBAiMGQKuWcw@mail.gmail.com>
Subject: Re: [PATCH] drm/ttm: Do not add non-system domain BO into swap list
To: xinhui pan <xinhui.pan@amd.com>
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
Cc: "Deucher, Alexander" <alexander.deucher@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Christian Koenig <christian.koenig@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 23, 2021 at 10:28 PM xinhui pan <xinhui.pan@amd.com> wrote:
>
> BO would be added into swap list if it is validated into system domain.
> If BO is validated again into non-system domain, say, VRAM domain. It
> actually should not be in the swap list.
>
> Signed-off-by: xinhui pan <xinhui.pan@amd.com>

Acked-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/ttm/ttm_bo.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index a97d41f4ce3c..3a10bebb75d6 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -111,6 +111,8 @@ void ttm_bo_move_to_lru_tail(struct ttm_buffer_object *bo,
>
>                 swap = &ttm_glob.swap_lru[bo->priority];
>                 list_move_tail(&bo->swap, swap);
> +       } else {
> +               list_del_init(&bo->swap);
>         }
>
>         if (bdev->funcs->del_from_lru_notify)
> --
> 2.25.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
