Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4152E23C53B
	for <lists+dri-devel@lfdr.de>; Wed,  5 Aug 2020 07:48:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71E886E4D0;
	Wed,  5 Aug 2020 05:48:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb42.google.com (mail-yb1-xb42.google.com
 [IPv6:2607:f8b0:4864:20::b42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6715D6E4D0
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Aug 2020 05:48:23 +0000 (UTC)
Received: by mail-yb1-xb42.google.com with SMTP id a34so18167435ybj.9
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Aug 2020 22:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0zXJ8tO9mUoOFX9UvHCTc1MLukc3CLce9kC3oGXvDas=;
 b=S5dqCzo89f/ORacuNLxNz8+t+Txyus5dzMnOS38RWWO/Q9tOvOhxsMwSsgdQ7eZtql
 XjHAF+lo/FqnHoHj36FLbAYpqi6zbFEpT/Aq91c9HEq50lz9kz4JNM8ASuY96wBqhfm7
 kSz9AnEeuTN195BDoB8N8u1+cbUqulht2/8WCR61kjv7b1cvWsnCG+M2xRM73KTYfQP/
 6r3Zma+UpL/8kEH2LbvD6MqXGUaCuEDEkWEY7t5FvaTrvEjlsbV2K7C9p/fMX4QLwxPA
 qMLXAuDKTdTUXvKOis30PexxDPqX0xB9568kZvpri/32KxS1ZlVv1hI0TI0dhNV6N/sA
 rceA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0zXJ8tO9mUoOFX9UvHCTc1MLukc3CLce9kC3oGXvDas=;
 b=k3YPh1Jd/9EUwUfV1/hwfJRr/f3IXPuQw1upW4nQVfSHujdtBhKDn+hYwQnEx6mgxz
 mNIwi21SrZM5fQ6q6apbHM8FB6Hj/D4YAgatlmBJZ3uu3uNIxl4K59Se4OzWFWZjwQ5b
 MHiHOZ6JqfpyJkG+KDB6vjROrbcA/N1BYpMiqt03acc9HLPUWZ+Hn1b8hYEXZ7KWePVY
 EwHJvX5KAEHqEeeIV0TFY2dhgIkk3Il5Jk4wq98P+5FVefPk46Y1Ubx9elHIIxMx6I7O
 qZLifWDph7oZ7Qac7Lh2B/P8dCKV3iVirEeGcpKtVxfXLLeClsQOJMx3R1yfrD/QuKCI
 Mxgg==
X-Gm-Message-State: AOAM533fjj3zn4pdq/qK+P6xSWwe7EOFjV1AHe0NzOfFCIMSL9xmyX4l
 Eef3CTMoiLa1F9MzM8/JbV6oos0OQH4PPT00m/A=
X-Google-Smtp-Source: ABdhPJxTTsYWGJkyPcJ8KgxTPQpuga8ETSW03bLl6Sd1g4R1zev7IX8MGVK2FXYWB4R7+9+Cthqe9RxuApK3k0Ev8KU=
X-Received: by 2002:a25:cf08:: with SMTP id f8mr2214989ybg.435.1596606502694; 
 Tue, 04 Aug 2020 22:48:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200804025632.3868079-1-airlied@gmail.com>
 <20200804025632.3868079-40-airlied@gmail.com>
In-Reply-To: <20200804025632.3868079-40-airlied@gmail.com>
From: Ben Skeggs <skeggsb@gmail.com>
Date: Wed, 5 Aug 2020 15:48:11 +1000
Message-ID: <CACAvsv6DySD9_UhqREbHUAG7OwDFSg-a=82T1kQNEidmT9brag@mail.gmail.com>
Subject: Re: [PATCH 39/59] drm/nouveau/ttm: use wrapper to access memory
 managers
To: Dave Airlie <airlied@gmail.com>
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
Cc: sroland@vmware.com, ML dri-devel <dri-devel@lists.freedesktop.org>,
 linux-graphics-maintainer@vmware.com, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 4 Aug 2020 at 12:58, Dave Airlie <airlied@gmail.com> wrote:
>
> From: Dave Airlie <airlied@redhat.com>
>
> Signed-off-by: Dave Airlie <airlied@redhat.com>
Reviewed-by: Ben Skeggs <bskeggs@redhat.com>

> ---
>  drivers/gpu/drm/nouveau/nouveau_ttm.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_ttm.c b/drivers/gpu/drm/nouveau/nouveau_ttm.c
> index bb310719e3f5..cc6cf04553dd 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_ttm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_ttm.c
> @@ -156,7 +156,7 @@ nouveau_ttm_init_host(struct nouveau_drm *drm, u8 kind)
>  static int
>  nouveau_ttm_init_vram(struct nouveau_drm *drm)
>  {
> -       struct ttm_mem_type_manager *man = &drm->ttm.bdev.man[TTM_PL_VRAM];
> +       struct ttm_mem_type_manager *man = ttm_manager_type(&drm->ttm.bdev, TTM_PL_VRAM);
>         struct nvif_mmu *mmu = &drm->client.mmu;
>
>         man->available_caching = TTM_PL_FLAG_UNCACHED | TTM_PL_FLAG_WC;
> @@ -186,7 +186,7 @@ nouveau_ttm_init_vram(struct nouveau_drm *drm)
>  static void
>  nouveau_ttm_fini_vram(struct nouveau_drm *drm)
>  {
> -       struct ttm_mem_type_manager *man = &drm->ttm.bdev.man[TTM_PL_VRAM];
> +       struct ttm_mem_type_manager *man = ttm_manager_type(&drm->ttm.bdev, TTM_PL_VRAM);
>
>         if (drm->client.device.info.family >= NV_DEVICE_INFO_V0_TESLA) {
>                 ttm_mem_type_manager_disable(man);
> @@ -199,7 +199,7 @@ nouveau_ttm_fini_vram(struct nouveau_drm *drm)
>  static int
>  nouveau_ttm_init_gtt(struct nouveau_drm *drm)
>  {
> -       struct ttm_mem_type_manager *man = &drm->ttm.bdev.man[TTM_PL_TT];
> +       struct ttm_mem_type_manager *man = ttm_manager_type(&drm->ttm.bdev, TTM_PL_TT);
>         unsigned long size_pages = drm->gem.gart_available >> PAGE_SHIFT;
>         man->use_tt = true;
>         if (drm->agp.bridge) {
> @@ -228,7 +228,7 @@ nouveau_ttm_init_gtt(struct nouveau_drm *drm)
>  static void
>  nouveau_ttm_fini_gtt(struct nouveau_drm *drm)
>  {
> -       struct ttm_mem_type_manager *man = &drm->ttm.bdev.man[TTM_PL_TT];
> +       struct ttm_mem_type_manager *man = ttm_manager_type(&drm->ttm.bdev, TTM_PL_TT);
>
>         if (drm->client.device.info.family < NV_DEVICE_INFO_V0_TESLA &&
>             drm->agp.bridge)
> --
> 2.26.2
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
