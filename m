Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C1096DCD41
	for <lists+dri-devel@lfdr.de>; Tue, 11 Apr 2023 00:06:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A35510E29A;
	Mon, 10 Apr 2023 22:06:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com
 [IPv6:2607:f8b0:4864:20::f34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35ACE10E1E3;
 Mon, 10 Apr 2023 22:06:09 +0000 (UTC)
Received: by mail-qv1-xf34.google.com with SMTP id kj14so4254804qvb.12;
 Mon, 10 Apr 2023 15:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1681164368;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=pjZar/MQ6b8qhGH+7PNrFyUqecvUssrkJbOR7pgMRKc=;
 b=AKjhpvE8a0FvmQzxH1oSCFwMlFKaSCrVrgg0QM/2yl87UEhKP7TdhrsHaOiQqAglRR
 tJQKz35Vz27LR72Y8GaYQ8hDq++AkfUTdJdNStkY3CkPdkWoKR2HAtMcUz3DFpRUI5dw
 lZ+nY+lm3TuDg9cX7+rBZa2823hR2Tc7BVvmiIAyLtCXkWiikUlV/hr3HbJTelbjfb5T
 3GfG5rhUCDByztzWW2+UUT7XZSqfje8/JQpcD8U2tbbrJMSut2QFtnCrPZXUFqVLTncR
 h9q8h4cSKGKp1+4s6yQG9eS7k2Z2yyk2GOmIdFr1q4bdqNjFy/gl8P6l8OnGI+P4Z1OT
 sB/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681164368;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pjZar/MQ6b8qhGH+7PNrFyUqecvUssrkJbOR7pgMRKc=;
 b=wdZ1tgrn8TP2DXlfU5G0TuphQ1MTbFa5khTb7w5uwFM4Umv1xUU+U0VJ+nonyxVa84
 KmGnje7MB+585a/z1CaEFrqNlEd6i24lgh7MxBJrL+5vSGXYCrLhk6nAIFg++9N9IKDC
 lUk3s2v83L1av7wmJRoEMuySLvKDZbFS9KJnCH7pggZ7wFGmvxSfWNIUYv6CX06sUcKx
 ENT5zCuz3GOOa2ON4IakuCWiChELLoepTu61o98CflGuWFwRJoQ7DIgSUK9s049apA23
 EOLBGaQZDlJpc/rRgRmeHQ/oQ3WBpgKK0qGK8HPL1xt0OISsdA6F76utj7RDuFrv50eD
 UCXw==
X-Gm-Message-State: AAQBX9d7veNpH1/XakT2+fMj6yeVXGKioo18FPY/XuwBtyKjQB7/mpSv
 Qgg4D9HYXThjU/zuZS/8ejYtHPceO4Q0LbY0gug=
X-Google-Smtp-Source: AKy350ZCO2ODxbxkhuEt1R/ncctGRfvUhnl8jBM9I1A4QEn77gjZc7dDt155ded3USH7Jve042Cl5hhNInj2Nt4O8CU=
X-Received: by 2002:a05:6214:560b:b0:56f:80e:701b with SMTP id
 mg11-20020a056214560b00b0056f080e701bmr2493952qvb.2.1681164367933; Mon, 10
 Apr 2023 15:06:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230405110455.1368428-1-kherbst@redhat.com>
In-Reply-To: <20230405110455.1368428-1-kherbst@redhat.com>
From: Ben Skeggs <skeggsb@gmail.com>
Date: Tue, 11 Apr 2023 08:05:56 +1000
Message-ID: <CACAvsv6ODb++b3nZMJcv2__rUC7M0K1BDiZqoh9tLhNqtSxKzQ@mail.gmail.com>
Subject: Re: [PATCH] drm/nouveau/fb: add missing sysmen flush callbacks
To: Karol Herbst <kherbst@redhat.com>
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 5 Apr 2023 at 21:05, Karol Herbst <kherbst@redhat.com> wrote:
>
> Closes: https://gitlab.freedesktop.org/drm/nouveau/-/issues/203
> Fixes: 5728d064190e1 ("drm/nouveau/fb: handle sysmem flush page from common code")
> Signed-off-by: Karol Herbst <kherbst@redhat.com>
Oops, that must've gotten lost in a rebase somehow.

Reviewed-by: Ben Skeggs <bskeggs@redhat.com>

> ---
>  drivers/gpu/drm/nouveau/nvkm/subdev/fb/gf108.c | 1 +
>  drivers/gpu/drm/nouveau/nvkm/subdev/fb/gk104.c | 1 +
>  drivers/gpu/drm/nouveau/nvkm/subdev/fb/gk110.c | 1 +
>  drivers/gpu/drm/nouveau/nvkm/subdev/fb/gm107.c | 1 +
>  4 files changed, 4 insertions(+)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/gf108.c b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/gf108.c
> index 76678dd60f93f..c4c6f67af7ccc 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/gf108.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/gf108.c
> @@ -31,6 +31,7 @@ gf108_fb = {
>         .init = gf100_fb_init,
>         .init_page = gf100_fb_init_page,
>         .intr = gf100_fb_intr,
> +       .sysmem.flush_page_init = gf100_fb_sysmem_flush_page_init,
>         .ram_new = gf108_ram_new,
>         .default_bigpage = 17,
>  };
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/gk104.c b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/gk104.c
> index f73442ccb424b..433fa966ba231 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/gk104.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/gk104.c
> @@ -77,6 +77,7 @@ gk104_fb = {
>         .init = gf100_fb_init,
>         .init_page = gf100_fb_init_page,
>         .intr = gf100_fb_intr,
> +       .sysmem.flush_page_init = gf100_fb_sysmem_flush_page_init,
>         .ram_new = gk104_ram_new,
>         .default_bigpage = 17,
>         .clkgate_pack = gk104_fb_clkgate_pack,
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/gk110.c b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/gk110.c
> index 45d6cdffafeed..4dc283dedf8b5 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/gk110.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/gk110.c
> @@ -59,6 +59,7 @@ gk110_fb = {
>         .init = gf100_fb_init,
>         .init_page = gf100_fb_init_page,
>         .intr = gf100_fb_intr,
> +       .sysmem.flush_page_init = gf100_fb_sysmem_flush_page_init,
>         .ram_new = gk104_ram_new,
>         .default_bigpage = 17,
>         .clkgate_pack = gk110_fb_clkgate_pack,
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/gm107.c b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/gm107.c
> index de52462a92bf0..90bfff616d35b 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/gm107.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/gm107.c
> @@ -31,6 +31,7 @@ gm107_fb = {
>         .init = gf100_fb_init,
>         .init_page = gf100_fb_init_page,
>         .intr = gf100_fb_intr,
> +       .sysmem.flush_page_init = gf100_fb_sysmem_flush_page_init,
>         .ram_new = gm107_ram_new,
>         .default_bigpage = 17,
>  };
> --
> 2.39.2
>
