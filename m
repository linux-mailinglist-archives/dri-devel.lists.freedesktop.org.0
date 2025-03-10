Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CBC7A58F4B
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 10:20:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE7EB10E1BF;
	Mon, 10 Mar 2025 09:20:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZaLUK3QQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com
 [209.85.160.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 747C110E1BF
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 09:20:05 +0000 (UTC)
Received: by mail-oa1-f45.google.com with SMTP id
 586e51a60fabf-2c186270230so997861fac.0
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 02:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741598404; x=1742203204; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Mx58Q4P7N7gbyHphpDmZNJaiTyIEMGGfUPF1jF1bXfg=;
 b=ZaLUK3QQmyb7jD2mo9NgQm3+h8oywKuDBN9x1rGRBoA4xKkZCvqSSNfjqGed9+Ic4r
 0eIjCr1krCSiA6s+Dz4Ag3pYc6nRGtM8Iywki7lW+prnnJC1raJxz8VF2yLdDhbV2AT9
 5t1JOnNSMUILXSlPXk6+LadCMigy1vZ9N1ZGeQy4mdk0wwCobi0P0sSiGRWPD3F3ZaX8
 S/HjUP31290iEt8JwiztfzwbHlQtPea/uFhrrRgqDRIxAxzk8gyZIqmWoyx6cEHQt7FU
 7g0FEh7yPjUWGtcwEshVH3yfETgDrgWXduTNFNj7JB/N1Au6YZ2cd0iE0vn/bqtdYDUk
 t/qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741598404; x=1742203204;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Mx58Q4P7N7gbyHphpDmZNJaiTyIEMGGfUPF1jF1bXfg=;
 b=DZj6vdxvd7K9E2OQYC1YaQm1xZ0l25xqxBaXa48oqFy67kvrLYaMAWSO9kFJpxKNJ1
 2mDPOe5RYBjtOIcMLP0Utq5fw9u3C8nWBGZ76VEWNTHGMNGv28M+zvoiO/LzGRCrb5+z
 e5SThOOiJ0r0ekQA+cWvhAyTPrkiU6WAkRgdUj2yFqXX5hGmVJ7wUEtOUq+pfuwPT0Tp
 bBIh1lFeRJP8QGd1fHLmrICZi8GYb2NVf6Di/l3T0y/yAK784YlR501rXfyE9MjH7jbr
 0fRT4zhmimx8FHqDGehdDmGoX31VwgIHZpWmV8y8OA3900gHc/veeGX7H8zVQf4+00az
 FS9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXIk5UFs4M/umNurNwGJg1eyMVXeUfSs+ebgmZEzto8s21JYtxQ861w/xHDEyhN07Qwdm+bWWz88G8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxS/0APajB3e1x7kngiH8P6r6RWD6Xpw6NLMDvuZWTXmrbnFnWJ
 G07VxQN7ZxU4xQi7xJyhIEEI/LuGtbCiEexmiSFyzqwMff9dH6g6UUKW/wSHR/CWU2UYbHPIYd+
 LHVWGUjcmC5xgYYqgmX6pr22eE4w=
X-Gm-Gg: ASbGncuDMtpuqGs63KDKljxAkiu1wf4YylziC5t3yalc3bL+PbzhOhAvYzbX43IR/fr
 dRGXdYVFAX16ceEvhkU07Ck8L8IX2ZkNySMZqMlASqbYo32ciBsPIRPRUrP3mB7N8zZoM7gYArl
 63AcoOTfc5o9gfrOSP6TtbA7fA
X-Google-Smtp-Source: AGHT+IFHmB/cu7w8l+SlHdsxgg/iICDetyzer8cW/fdk/a10EwAdxJNsooT7jc7tZ/VrIsnPoRFxTlKB2Y5Rk0lHJpY=
X-Received: by 2002:a05:6808:1315:b0:3f6:a9ea:eab3 with SMTP id
 5614622812f47-3f6a9eaecc2mr3340392b6e.5.1741598404388; Mon, 10 Mar 2025
 02:20:04 -0700 (PDT)
MIME-Version: 1.0
References: <20250308234356.255114-1-linux@treblig.org>
In-Reply-To: <20250308234356.255114-1-linux@treblig.org>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Mon, 10 Mar 2025 10:19:53 +0100
X-Gm-Features: AQ5f1JqKcgKl52x22Rs8Hce1oSaBk2HDLSNfOMs5GSxFr_gJm67cqX5SgZwvVao
Message-ID: <CAMeQTsbq7Gz=fqnAGPcLobt3P+vFKTYWfY8+gUcPKYqDKx_R=w@mail.gmail.com>
Subject: Re: [PATCH] drm/gma500/psb_intel_modes: Remove unused
 psb_intel_ddc_probe
To: linux@treblig.org
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Mar 9, 2025 at 12:44=E2=80=AFAM <linux@treblig.org> wrote:
>
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
>
> psb_intel_ddc_probe() was added in 2011 by
> commit 89c78134cc54 ("gma500: Add Poulsbo support")
> but has remained unused (probably because drm_get_edid is used
> instead).
>
> Remove it.
>
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>

Applied to drm-misc-next
Thanks

> ---
>  drivers/gpu/drm/gma500/psb_intel_drv.h   |  1 -
>  drivers/gpu/drm/gma500/psb_intel_modes.c | 31 ------------------------
>  2 files changed, 32 deletions(-)
>
> diff --git a/drivers/gpu/drm/gma500/psb_intel_drv.h b/drivers/gpu/drm/gma=
500/psb_intel_drv.h
> index 2499fd6a80c9..d80f2d0b712e 100644
> --- a/drivers/gpu/drm/gma500/psb_intel_drv.h
> +++ b/drivers/gpu/drm/gma500/psb_intel_drv.h
> @@ -182,7 +182,6 @@ struct gma_i2c_chan *gma_i2c_create(struct drm_device=
 *dev, const u32 reg,
>  void gma_i2c_destroy(struct gma_i2c_chan *chan);
>  int psb_intel_ddc_get_modes(struct drm_connector *connector,
>                             struct i2c_adapter *adapter);
> -extern bool psb_intel_ddc_probe(struct i2c_adapter *adapter);
>
>  extern void psb_intel_crtc_init(struct drm_device *dev, int pipe,
>                             struct psb_intel_mode_device *mode_dev);
> diff --git a/drivers/gpu/drm/gma500/psb_intel_modes.c b/drivers/gpu/drm/g=
ma500/psb_intel_modes.c
> index 8be0ec340de5..45b10f30a2a9 100644
> --- a/drivers/gpu/drm/gma500/psb_intel_modes.c
> +++ b/drivers/gpu/drm/gma500/psb_intel_modes.c
> @@ -11,37 +11,6 @@
>
>  #include "psb_intel_drv.h"
>
> -/**
> - * psb_intel_ddc_probe
> - * @adapter:   Associated I2C adaptor
> - */
> -bool psb_intel_ddc_probe(struct i2c_adapter *adapter)
> -{
> -       u8 out_buf[] =3D { 0x0, 0x0 };
> -       u8 buf[2];
> -       int ret;
> -       struct i2c_msg msgs[] =3D {
> -               {
> -                .addr =3D 0x50,
> -                .flags =3D 0,
> -                .len =3D 1,
> -                .buf =3D out_buf,
> -                },
> -               {
> -                .addr =3D 0x50,
> -                .flags =3D I2C_M_RD,
> -                .len =3D 1,
> -                .buf =3D buf,
> -                }
> -       };
> -
> -       ret =3D i2c_transfer(adapter, msgs, 2);
> -       if (ret =3D=3D 2)
> -               return true;
> -
> -       return false;
> -}
> -
>  /**
>   * psb_intel_ddc_get_modes - get modelist from monitor
>   * @connector: DRM connector device to use
> --
> 2.48.1
>
