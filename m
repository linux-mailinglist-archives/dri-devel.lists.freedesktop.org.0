Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0678B12DC5A
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jan 2020 00:54:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0759F6E29E;
	Tue, 31 Dec 2019 23:54:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f66.google.com (mail-vs1-f66.google.com
 [209.85.217.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 262AF6E29A;
 Tue, 31 Dec 2019 23:54:08 +0000 (UTC)
Received: by mail-vs1-f66.google.com with SMTP id g15so23419551vsf.1;
 Tue, 31 Dec 2019 15:54:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LsL27s0tuCQlfnDvJy5Zm7PNE+go0EEE73GIc5LtbDE=;
 b=CBXWSIKEv8fELsKYB3rfcq2bTylxDjFwgxZB5n6ZZ0swW/Ifm2Y+6DGjDesy9VGtgy
 TDHjcPfDiibCMMEm+RVIT0UWAy2ONmEH27xybUyDo6oldw+bMWJDGV7XFT8ssvMwKxYH
 AIqcfkNeMEH0Q9oof47R9wwN43yWyFpYMfSbOfG5FTmKhFWcEbvaipG0lDb5X2TgwpIP
 xAN5C9cyxD+GzwrFsMuTcNIb3/bgVlzEghYk9zbE7vL1igTsEeAGt9Pcdi0gfQqm4xHW
 vJ59IHT9Uc7wOxFpLu0HDmDl8CWVzxEJhNCG0IF4O+YXEs0uyjxH/5VrFyAyKnrTxcwr
 e4pA==
X-Gm-Message-State: APjAAAXCxL99TzpIp5wbpjE+Fb5C2h6GefKgS2ZY532Ij+d2sRWM1r2O
 hLB60B0y+vxMCP/JIIUaSliqWkyFxV3Q9yCCGXc=
X-Google-Smtp-Source: APXvYqy3mFag1TKJo/+FCgerjICIBt+Gtgt+GMd7ViyzFwgjUJsWeCUhjLoECgV06pMe0LyU2L1lLHIJ7EKaTmflqWA=
X-Received: by 2002:a05:6102:3024:: with SMTP id
 v4mr39682304vsa.220.1577836447055; 
 Tue, 31 Dec 2019 15:54:07 -0800 (PST)
MIME-Version: 1.0
References: <20191231205345.32615-1-wambui.karugax@gmail.com>
In-Reply-To: <20191231205345.32615-1-wambui.karugax@gmail.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Tue, 31 Dec 2019 18:53:55 -0500
Message-ID: <CAKb7Uvii6RTp3FsX6z+4VuX6xcS9_SQ+CMC-UBOHVJY5BeWgew@mail.gmail.com>
Subject: Re: [PATCH] drm/nouveau: declare constants as unsigned long.
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
Cc: David Airlie <airlied@linux.ie>, nouveau <nouveau@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Probably want ULL for 32-bit arches to be correct here too.

On Tue, Dec 31, 2019 at 3:53 PM Wambui Karuga <wambui.karugax@gmail.com> wrote:
>
> Explicitly declare constants are unsigned long to address the following
> sparse warnings:
> warning: constant is so big it is long
>
> Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
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
> index ac87a3b6b7c9..506b358fcdb6 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgf100.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgf100.c
> @@ -655,7 +655,7 @@ gf100_ram_new_(const struct nvkm_ram_func *func,
>
>  static const struct nvkm_ram_func
>  gf100_ram = {
> -       .upper = 0x0200000000,
> +       .upper = 0x0200000000UL,
>         .probe_fbp = gf100_ram_probe_fbp,
>         .probe_fbp_amount = gf100_ram_probe_fbp_amount,
>         .probe_fbpa_amount = gf100_ram_probe_fbpa_amount,
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgf108.c b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgf108.c
> index 70a06e3cd55a..3bc39895bbce 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgf108.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgf108.c
> @@ -43,7 +43,7 @@ gf108_ram_probe_fbp_amount(const struct nvkm_ram_func *func, u32 fbpao,
>
>  static const struct nvkm_ram_func
>  gf108_ram = {
> -       .upper = 0x0200000000,
> +       .upper = 0x0200000000UL,
>         .probe_fbp = gf100_ram_probe_fbp,
>         .probe_fbp_amount = gf108_ram_probe_fbp_amount,
>         .probe_fbpa_amount = gf100_ram_probe_fbpa_amount,
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgk104.c b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgk104.c
> index 456aed1f2a02..d01f32c0956a 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgk104.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgk104.c
> @@ -1698,7 +1698,7 @@ gk104_ram_new_(const struct nvkm_ram_func *func, struct nvkm_fb *fb,
>
>  static const struct nvkm_ram_func
>  gk104_ram = {
> -       .upper = 0x0200000000,
> +       .upper = 0x0200000000UL,
>         .probe_fbp = gf100_ram_probe_fbp,
>         .probe_fbp_amount = gf108_ram_probe_fbp_amount,
>         .probe_fbpa_amount = gf100_ram_probe_fbpa_amount,
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgm107.c b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgm107.c
> index 27c68e3f9772..e24ac664eb15 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgm107.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgm107.c
> @@ -33,7 +33,7 @@ gm107_ram_probe_fbp(const struct nvkm_ram_func *func,
>
>  static const struct nvkm_ram_func
>  gm107_ram = {
> -       .upper = 0x1000000000,
> +       .upper = 0x1000000000UL,
>         .probe_fbp = gm107_ram_probe_fbp,
>         .probe_fbp_amount = gf108_ram_probe_fbp_amount,
>         .probe_fbpa_amount = gf100_ram_probe_fbpa_amount,
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgm200.c b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgm200.c
> index 6b0cac1fe7b4..17994cbda54b 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgm200.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgm200.c
> @@ -48,7 +48,7 @@ gm200_ram_probe_fbp_amount(const struct nvkm_ram_func *func, u32 fbpao,
>
>  static const struct nvkm_ram_func
>  gm200_ram = {
> -       .upper = 0x1000000000,
> +       .upper = 0x1000000000UL,
>         .probe_fbp = gm107_ram_probe_fbp,
>         .probe_fbp_amount = gm200_ram_probe_fbp_amount,
>         .probe_fbpa_amount = gf100_ram_probe_fbpa_amount,
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgp100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgp100.c
> index adb62a6beb63..7a07a6ed4578 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgp100.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgp100.c
> @@ -79,7 +79,7 @@ gp100_ram_probe_fbpa(struct nvkm_device *device, int fbpa)
>
>  static const struct nvkm_ram_func
>  gp100_ram = {
> -       .upper = 0x1000000000,
> +       .upper = 0x1000000000UL,
>         .probe_fbp = gm107_ram_probe_fbp,
>         .probe_fbp_amount = gm200_ram_probe_fbp_amount,
>         .probe_fbpa_amount = gp100_ram_probe_fbpa,
> --
> 2.17.1
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
