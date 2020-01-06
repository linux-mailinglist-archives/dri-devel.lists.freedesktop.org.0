Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB768130B41
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2020 02:07:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CE806E1F5;
	Mon,  6 Jan 2020 01:07:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa43.google.com (mail-vk1-xa43.google.com
 [IPv6:2607:f8b0:4864:20::a43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E60156E1F4;
 Mon,  6 Jan 2020 01:07:19 +0000 (UTC)
Received: by mail-vk1-xa43.google.com with SMTP id d17so12101349vke.5;
 Sun, 05 Jan 2020 17:07:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ElS7ZOmpSKrdCm7uJX1DyA5ncafvJhJQJML81jsQF4I=;
 b=gnYEUaKDiD6DbHGdxozEh1WbM42Q/i8ybniobCIAaAZO1tg7F4lUXw15SJZChajuVB
 D9nNP7kgngPKbIRDckphmMhjZIMvhNvfMVJd4lMiKBmRwU76qFC3f42JcsmeJlr0IYPx
 uMcxaHcUMGLX+E3WrUdHiks2E0L4LJ2noStfBljNT4CfmSP/QsDDEZbIQsdjfnnkaPIv
 O29z3edRLj9E/tcCz89R79LUgHkILfQ7TD15vF41J8PgocyIMpalxoZ60sLeQWb18zd6
 M7zT327VmpQZoEhsWi3lo5Ny5+7kTkgj55zzMFvowUAd9i6WrjkniAY5bSP9PQhnpBYw
 MVZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ElS7ZOmpSKrdCm7uJX1DyA5ncafvJhJQJML81jsQF4I=;
 b=skyQMD2k5ZW9wr2gd/RTsXmxm3aLFQP4DBuv2NKeDW5el9WtDEnw/iBtKMq/GP5Hk0
 6KYkFimFoNaCRhJOvbcR6xANg5ZS6Xd0c7rCnEudfbC8cQpDoXrY7c2ROpkcrFDZm2o3
 hde6qYQ/SRop8XzWEyZPBSvgspQdS0mBMIVAtNd30saslKK0bKVwq3SNutctNJ+EvzS6
 +iaCtwaMVq5kwnBHpQGwN7yvMce9P8/92tr3xlrKGxnYoR/Ya6W0x2KxiKRvPIK5+/XH
 RmwjRtRzeljvfWhK+Meugzp3QPEWhYALXHg4i2WCUgOkIPpBiKyqurIoreD1Kq684pKS
 jJgA==
X-Gm-Message-State: APjAAAWe5mh911YmWCl2/5qDgs9bpNgmTTOZLe8VGxnLd72VUsmySQOa
 bW4zxJHUG3ISpHiv3ILrgJzbfN+jfakUtnNg9Ok=
X-Google-Smtp-Source: APXvYqxTXcWZAGbkeeZaAlQ005iYKR5vsbpEC8+a2LikQL1PAXrbSaBiiuhVHhen9BeqNUj8eZP5xyqf/iX47zu9L/U=
X-Received: by 2002:a1f:2910:: with SMTP id p16mr57213135vkp.71.1578272839058; 
 Sun, 05 Jan 2020 17:07:19 -0800 (PST)
MIME-Version: 1.0
References: <20200102122548.25696-1-wambui.karugax@gmail.com>
In-Reply-To: <20200102122548.25696-1-wambui.karugax@gmail.com>
From: Ben Skeggs <skeggsb@gmail.com>
Date: Mon, 6 Jan 2020 11:07:08 +1000
Message-ID: <CACAvsv7ESe6r-qK2s7o=fRygumo986J0vySnYFVJYZDkuraGaQ@mail.gmail.com>
Subject: Re: [Nouveau] [PATCH v2] drm/nouveau: declare constants as unsigned
 long long.
To: Wambui Karuga <wambui.karugax@gmail.com>
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
Cc: Dave Airlie <airlied@linux.ie>, ML nouveau <nouveau@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 3 Jan 2020 at 05:29, Wambui Karuga <wambui.karugax@gmail.com> wrote:
>
> Explicitly declare constants as unsigned long long to address the
> following sparse warnings:
> warning: constant is so big it is long
>
> v2: convert to unsigned long long for compatibility with 32-bit
> architectures.
>
> Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
> Suggested by: lia Mirkin <imirkin@alum.mit.edu>
Thanks!

> ---
>  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgf100.c | 2 +-
>  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgf108.c | 2 +-
>  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgk104.c | 2 +-
>  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgm107.c | 2 +-
>  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgm200.c | 2 +-
>  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgp100.c | 2 +-
>  6 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgf100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgf100.c
> index ac87a3b6b7c9..ba43fe158b22 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgf100.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgf100.c
> @@ -655,7 +655,7 @@ gf100_ram_new_(const struct nvkm_ram_func *func,
>
>  static const struct nvkm_ram_func
>  gf100_ram = {
> -       .upper = 0x0200000000,
> +       .upper = 0x0200000000ULL,
>         .probe_fbp = gf100_ram_probe_fbp,
>         .probe_fbp_amount = gf100_ram_probe_fbp_amount,
>         .probe_fbpa_amount = gf100_ram_probe_fbpa_amount,
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgf108.c b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgf108.c
> index 70a06e3cd55a..d97fa43efb91 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgf108.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgf108.c
> @@ -43,7 +43,7 @@ gf108_ram_probe_fbp_amount(const struct nvkm_ram_func *func, u32 fbpao,
>
>  static const struct nvkm_ram_func
>  gf108_ram = {
> -       .upper = 0x0200000000,
> +       .upper = 0x0200000000ULL,
>         .probe_fbp = gf100_ram_probe_fbp,
>         .probe_fbp_amount = gf108_ram_probe_fbp_amount,
>         .probe_fbpa_amount = gf100_ram_probe_fbpa_amount,
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgk104.c b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgk104.c
> index 456aed1f2a02..d350d92852d2 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgk104.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgk104.c
> @@ -1698,7 +1698,7 @@ gk104_ram_new_(const struct nvkm_ram_func *func, struct nvkm_fb *fb,
>
>  static const struct nvkm_ram_func
>  gk104_ram = {
> -       .upper = 0x0200000000,
> +       .upper = 0x0200000000ULL,
>         .probe_fbp = gf100_ram_probe_fbp,
>         .probe_fbp_amount = gf108_ram_probe_fbp_amount,
>         .probe_fbpa_amount = gf100_ram_probe_fbpa_amount,
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgm107.c b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgm107.c
> index 27c68e3f9772..be91da854dca 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgm107.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgm107.c
> @@ -33,7 +33,7 @@ gm107_ram_probe_fbp(const struct nvkm_ram_func *func,
>
>  static const struct nvkm_ram_func
>  gm107_ram = {
> -       .upper = 0x1000000000,
> +       .upper = 0x1000000000ULL,
>         .probe_fbp = gm107_ram_probe_fbp,
>         .probe_fbp_amount = gf108_ram_probe_fbp_amount,
>         .probe_fbpa_amount = gf100_ram_probe_fbpa_amount,
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgm200.c b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgm200.c
> index 6b0cac1fe7b4..8f91ea91ee25 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgm200.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgm200.c
> @@ -48,7 +48,7 @@ gm200_ram_probe_fbp_amount(const struct nvkm_ram_func *func, u32 fbpao,
>
>  static const struct nvkm_ram_func
>  gm200_ram = {
> -       .upper = 0x1000000000,
> +       .upper = 0x1000000000ULL,
>         .probe_fbp = gm107_ram_probe_fbp,
>         .probe_fbp_amount = gm200_ram_probe_fbp_amount,
>         .probe_fbpa_amount = gf100_ram_probe_fbpa_amount,
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgp100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgp100.c
> index adb62a6beb63..378f6fb70990 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgp100.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgp100.c
> @@ -79,7 +79,7 @@ gp100_ram_probe_fbpa(struct nvkm_device *device, int fbpa)
>
>  static const struct nvkm_ram_func
>  gp100_ram = {
> -       .upper = 0x1000000000,
> +       .upper = 0x1000000000ULL,
>         .probe_fbp = gm107_ram_probe_fbp,
>         .probe_fbp_amount = gm200_ram_probe_fbp_amount,
>         .probe_fbpa_amount = gp100_ram_probe_fbpa,
> --
> 2.17.1
>
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
