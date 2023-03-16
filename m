Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 028336BC9AB
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 09:46:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3CE310E0DE;
	Thu, 16 Mar 2023 08:46:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9592610E0DE
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Mar 2023 08:46:31 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id bc12so351533plb.0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Mar 2023 01:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678956391;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AOdBHBS9znATVtxTwtQ/W3C/7bZhtodaNAC+NJOLels=;
 b=XAsJRL/oCozA4xS60ezBXwWV1MPkS9yQ4w8jFM1BEUMYLtbrnF5P0pRcRYgYQ3MQJK
 BD+9PoIlwhn86J1bPgWzEMRD3Snm30QE94wWSh2YI8LloETNNs8RD+t08BoA3I2efB5l
 t3GtvqCijQ4rpDwLCw5sZZJ3dxIZjmIZiD50dHUKYwR6rat5alAM3Qohdd4S6Fh+7mqO
 fXP+keevQ8h19j06UeheXwogg7Al6aON9hMfRnOuc3c6yf1dSOmZ/qdZLIrBy/HLe2fd
 D5TsgY3wBnNinVuZvEhcoUfHK/c4qaEUrwZ6LuhB+oMrF6ecv5JHyzgrkHMPVYm1GeWR
 mfZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678956391;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AOdBHBS9znATVtxTwtQ/W3C/7bZhtodaNAC+NJOLels=;
 b=6b36CHbTeYzHjVTVlr3LdgdjaeLDKCtBHXgWJy7K+U/8xKfJPv9c75J798vF6Db+9c
 AhRpo5QjCfkBjfglpttUl/Ymj0pKPfp+xV2Cakf2EpbSt82qimhgeVvT8psNUfD0OmJO
 7cdgdx6DdMf7chs6RGLlAX7mVcWDqC/9MoU7nnYIDes5tW3CpIW4PyU1Usw+cY+W1aFa
 5BJKuGaFMj/lMWur9znvuPY2l6ZeyYmnsGl4CLYaZNidTvr5p7qzoF1nW+zKiLmzD0lj
 JA1MVbJsYLed0X7c/6EmU+6GSzVhpbtQrtpCt/OPb3ApSt3m2N5E4WkrAYggsxM9H/qW
 gOQQ==
X-Gm-Message-State: AO0yUKWvv2iSBzZFWoEb8o4mWyviAh3ynoDsz4Oiq72BKkG7xjuXMQjP
 8Z54qH59XDTmOI74kCxKOs6rpi0Zav6Z4SY+VJ8=
X-Google-Smtp-Source: AK7set/UrLh7lG6hRstedY7Gpt4OnHohK/MLsNtNP+Idae3uiDiCcB8gxfOzWb17fiQ7wgWCfv1JmVE/Bk9nlSpvl98=
X-Received: by 2002:a17:902:f681:b0:19f:3cc1:e3bd with SMTP id
 l1-20020a170902f68100b0019f3cc1e3bdmr1100939plg.4.1678956391026; Thu, 16 Mar
 2023 01:46:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230313151610.14367-1-tzimmermann@suse.de>
In-Reply-To: <20230313151610.14367-1-tzimmermann@suse.de>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Thu, 16 Mar 2023 09:46:19 +0100
Message-ID: <CAMeQTsYiX0OcKv+Fciz7oxbWbDfd-P=+ME0pPLWh9yDa5G0Z0w@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] drm/gma500: Convert fbdev to DRM client
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 13, 2023 at 4:16=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
> Convert gma500's fbdev code to drm_client. Replace to the current
> ad-hoc integration. The conversion includes a number of cleanups.
> Only build fbdev support if the config option has been set.
>
> Tested on Cedarview HW.
>
> v2:
>         * remove fb_base (Patrik)
>         * use 'static inline' in header files (kernel test robot)
>         * fix many minor issues and typos
>
Thanks Thomas! For the entire series:
Acked-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>

> Thomas Zimmermann (7):
>   drm/gma500: Remove unnecessary include statements
>   drm/gma500: Move fbdev code into separate source file
>   drm/gma500: Remove fbdev vma open and close callbacks
>   drm/gma500: Fix naming in fb_ops
>   drm/gma500: Inline psbfb_create() into psbfb_probe()
>   drm/gma500: Implement client-based fbdev emulation
>   drm/gma500: Pass fb_info to psb_fbdev_vm_fault()
>
>  drivers/gpu/drm/gma500/Makefile      |   1 +
>  drivers/gpu/drm/gma500/fbdev.c       | 344 +++++++++++++++++++++++++++
>  drivers/gpu/drm/gma500/framebuffer.c | 341 +-------------------------
>  drivers/gpu/drm/gma500/psb_drv.c     |   5 +-
>  drivers/gpu/drm/gma500/psb_drv.h     |  19 +-
>  5 files changed, 363 insertions(+), 347 deletions(-)
>  create mode 100644 drivers/gpu/drm/gma500/fbdev.c
>
>
> base-commit: b21ced77ae1dbc3d8b01d3aef3c99bba7377a69b
> --
> 2.39.2
>
