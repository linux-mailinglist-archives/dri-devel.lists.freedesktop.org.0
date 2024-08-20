Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ABA095884A
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2024 15:52:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99FEE10E7E2;
	Tue, 20 Aug 2024 13:52:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED36D10E7E2
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2024 13:52:15 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-2f3ce5bc6adso32707161fa.1
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2024 06:52:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724161932; x=1724766732;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wkbHStRdvzSNzDsZ0E26ASF0D3xldI1pUu7ZQSeV75Y=;
 b=BslDoDt19dNtVEC1t2U+0HNYcIJJ/t02Ve3SS+p6D0NCQ2Oe+Qabl4bhfnGUUqyxfd
 +EGyWSWcfZtwmM+/9fsSHWT368HLVtNsX/qZIQlnBj7MFiV0bMWb200e/bsqcOTp1xdG
 E97Jgx6CzF0wwbJjmExSZFoKhyFpzVT3eSgpmeV/Y/DnFjsn5T95eUrBiTKu68WBJChL
 NbxM1aA8LndORVni//mgaEPb4YHtOu1BHp41+a2B8hIztbtdiybYKiwIRgqhmnQJ9e7v
 23Rkh22v5b85cWFoS8nXX/3noke7zdSKWXJ4eYSk8pxX5GVLqp+cCdsmloabeCnsyEbj
 DdMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMvVZym/aPACUGBBoULG9Ygk2PLqLYgw3Uc7F2tH9DHUpThUTUsjQgEDFVoEwpIt27HW8eZ2YEo04=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxljW5NHg7oPJzDLMsQbKyBJQIms/Y7wfKwzJY/SfcBQv1Q3TJ3
 Eofpq3c2wG0UjwY28oq+y7d7vykIIum+9GjHA2tazNdBULDLWcoc2RJ6kcrR
X-Google-Smtp-Source: AGHT+IFPTXe7jC2XYGhyykOXOXVrnNswBpqid+1Xzazj4ZAKJ9DOK+XnWxyXb4jyLwPjFtsXLA+Agw==
X-Received: by 2002:a2e:2c1a:0:b0:2f1:5d60:8758 with SMTP id
 38308e7fff4ca-2f3be617de0mr87965191fa.49.1724161931461; 
 Tue, 20 Aug 2024 06:52:11 -0700 (PDT)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com.
 [209.85.208.174]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f3b771ebacsm17187151fa.105.2024.08.20.06.52.11
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Aug 2024 06:52:11 -0700 (PDT)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-2f3e2f07f41so18884551fa.3
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2024 06:52:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVLz+xZqOhwRjeJjGUdtbe5HpM26y8ZtIYJQCTgkAkOvewzVfiJhvxFVkUtuBrafzZMos8thQKj1AA=@lists.freedesktop.org
X-Received: by 2002:a2e:4c1a:0:b0:2f3:d82b:1959 with SMTP id
 38308e7fff4ca-2f3d82b19f8mr50948401fa.23.1724161930944; Tue, 20 Aug 2024
 06:52:10 -0700 (PDT)
MIME-Version: 1.0
References: <20240820125840.9032-1-rongqianfeng@vivo.com>
In-Reply-To: <20240820125840.9032-1-rongqianfeng@vivo.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 20 Aug 2024 21:51:57 +0800
X-Gmail-Original-Message-ID: <CAGb2v67-qfTb3ZaUZh2mF-utTgDhiPzCaERc9b8x6nxaHp8-cg@mail.gmail.com>
Message-ID: <CAGb2v67-qfTb3ZaUZh2mF-utTgDhiPzCaERc9b8x6nxaHp8-cg@mail.gmail.com>
Subject: Re: [PATCH] gpu: drm: Use devm_clk_get_enabled() helpers
To: Rong Qianfeng <rongqianfeng@vivo.com>
Cc: Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 opensource.kernel@vivo.com
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
Reply-To: wens@csie.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 20, 2024 at 8:59=E2=80=AFPM Rong Qianfeng <rongqianfeng@vivo.co=
m> wrote:
>
> Replace devm_clk_get() and clk_prepare_enable() with
> devm_clk_get_enabled() that also disables and unprepares it on
> driver detach.
>
> Signed-off-by: Rong Qianfeng <rongqianfeng@vivo.com>
> ---
>  drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c | 13 +++----------
>  drivers/gpu/drm/sun4i/sun6i_drc.c         | 15 ++++-----------
>  drivers/gpu/drm/sun4i/sun8i_mixer.c       | 13 +++----------
>  3 files changed, 10 insertions(+), 31 deletions(-)
>
> diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c b/drivers/gpu/drm/=
fsl-dcu/fsl_dcu_drm_drv.c
> index ab6c0c6cd0e2..057dceaf079e 100644
> --- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
> +++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
> @@ -284,16 +284,11 @@ static int fsl_dcu_drm_probe(struct platform_device=
 *pdev)
>                 return PTR_ERR(fsl_dev->regmap);
>         }
>
> -       fsl_dev->clk =3D devm_clk_get(dev, "dcu");
> +       fsl_dev->clk =3D devm_clk_get_enabled(dev, "dcu");
>         if (IS_ERR(fsl_dev->clk)) {
>                 dev_err(dev, "failed to get dcu clock\n");
>                 return PTR_ERR(fsl_dev->clk);
>         }
> -       ret =3D clk_prepare_enable(fsl_dev->clk);
> -       if (ret < 0) {
> -               dev_err(dev, "failed to enable dcu clk\n");
> -               return ret;
> -       }
>
>         pix_clk_in =3D devm_clk_get(dev, "pix");
>         if (IS_ERR(pix_clk_in)) {
> @@ -311,8 +306,7 @@ static int fsl_dcu_drm_probe(struct platform_device *=
pdev)
>                         div_ratio_shift, 8, CLK_DIVIDER_ROUND_CLOSEST, NU=
LL);
>         if (IS_ERR(fsl_dev->pix_clk)) {
>                 dev_err(dev, "failed to register pix clk\n");
> -               ret =3D PTR_ERR(fsl_dev->pix_clk);
> -               goto disable_clk;
> +               return PTR_ERR(fsl_dev->pix_clk);
>         }
>
>         fsl_dev->tcon =3D fsl_tcon_init(dev);
> @@ -341,8 +335,7 @@ static int fsl_dcu_drm_probe(struct platform_device *=
pdev)
>         drm_dev_put(drm);
>  unregister_pix_clk:
>         clk_unregister(fsl_dev->pix_clk);
> -disable_clk:
> -       clk_disable_unprepare(fsl_dev->clk);
> +
>         return ret;
>  }
>
> diff --git a/drivers/gpu/drm/sun4i/sun6i_drc.c b/drivers/gpu/drm/sun4i/su=
n6i_drc.c
> index 0d342f43fa93..f263ad282828 100644
> --- a/drivers/gpu/drm/sun4i/sun6i_drc.c
> +++ b/drivers/gpu/drm/sun4i/sun6i_drc.c
> @@ -42,33 +42,28 @@ static int sun6i_drc_bind(struct device *dev, struct =
device *master,
>                 return ret;
>         }
>
> -       drc->bus_clk =3D devm_clk_get(dev, "ahb");
> +       drc->bus_clk =3D devm_clk_get_enabled(dev, "ahb");

devm_* is actually not the correct thing to use in this case, as this
is the component bind function, not the probe function. The lifetimes
are not the same.

We get away with devm_*_get because it's just a reference count,
but devm_*_get_enabled is going to be worse, because the clock
or whatever will not get disabled upon unbind. Same for sun8i_mixer.

I just got bitten by this in an ASoC component driver, but the
problem is similar.


ChenYu

>         if (IS_ERR(drc->bus_clk)) {
>                 dev_err(dev, "Couldn't get our bus clock\n");
>                 ret =3D PTR_ERR(drc->bus_clk);
>                 goto err_assert_reset;
>         }
> -       clk_prepare_enable(drc->bus_clk);
>
> -       drc->mod_clk =3D devm_clk_get(dev, "mod");
> +       drc->mod_clk =3D devm_clk_get_enabled(dev, "mod");
>         if (IS_ERR(drc->mod_clk)) {
>                 dev_err(dev, "Couldn't get our mod clock\n");
>                 ret =3D PTR_ERR(drc->mod_clk);
> -               goto err_disable_bus_clk;
> +               goto err_assert_reset;
>         }
>
>         ret =3D clk_set_rate_exclusive(drc->mod_clk, 300000000);
>         if (ret) {
>                 dev_err(dev, "Couldn't set the module clock frequency\n")=
;
> -               goto err_disable_bus_clk;
> +               goto err_assert_reset;
>         }
>
> -       clk_prepare_enable(drc->mod_clk);
> -
>         return 0;
>
> -err_disable_bus_clk:
> -       clk_disable_unprepare(drc->bus_clk);
>  err_assert_reset:
>         reset_control_assert(drc->reset);
>         return ret;
> @@ -80,8 +75,6 @@ static void sun6i_drc_unbind(struct device *dev, struct=
 device *master,
>         struct sun6i_drc *drc =3D dev_get_drvdata(dev);
>
>         clk_rate_exclusive_put(drc->mod_clk);
> -       clk_disable_unprepare(drc->mod_clk);
> -       clk_disable_unprepare(drc->bus_clk);
>         reset_control_assert(drc->reset);
>  }
>
> diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/=
sun8i_mixer.c
> index bd0fe2c6624e..ebf00676a76d 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
> @@ -507,19 +507,18 @@ static int sun8i_mixer_bind(struct device *dev, str=
uct device *master,
>                 return ret;
>         }
>
> -       mixer->bus_clk =3D devm_clk_get(dev, "bus");
> +       mixer->bus_clk =3D devm_clk_get_enabled(dev, "bus");
>         if (IS_ERR(mixer->bus_clk)) {
>                 dev_err(dev, "Couldn't get the mixer bus clock\n");
>                 ret =3D PTR_ERR(mixer->bus_clk);
>                 goto err_assert_reset;
>         }
> -       clk_prepare_enable(mixer->bus_clk);
>
> -       mixer->mod_clk =3D devm_clk_get(dev, "mod");
> +       mixer->mod_clk =3D devm_clk_get_enabled(dev, "mod");
>         if (IS_ERR(mixer->mod_clk)) {
>                 dev_err(dev, "Couldn't get the mixer module clock\n");
>                 ret =3D PTR_ERR(mixer->mod_clk);
> -               goto err_disable_bus_clk;
> +               goto err_assert_reset;
>         }
>
>         /*
> @@ -530,8 +529,6 @@ static int sun8i_mixer_bind(struct device *dev, struc=
t device *master,
>         if (mixer->cfg->mod_rate)
>                 clk_set_rate(mixer->mod_clk, mixer->cfg->mod_rate);
>
> -       clk_prepare_enable(mixer->mod_clk);
> -
>         list_add_tail(&mixer->engine.list, &drv->engine_list);
>
>         base =3D sun8i_blender_base(mixer);
> @@ -592,8 +589,6 @@ static int sun8i_mixer_bind(struct device *dev, struc=
t device *master,
>
>         return 0;
>
> -err_disable_bus_clk:
> -       clk_disable_unprepare(mixer->bus_clk);
>  err_assert_reset:
>         reset_control_assert(mixer->reset);
>         return ret;
> @@ -606,8 +601,6 @@ static void sun8i_mixer_unbind(struct device *dev, st=
ruct device *master,
>
>         list_del(&mixer->engine.list);
>
> -       clk_disable_unprepare(mixer->mod_clk);
> -       clk_disable_unprepare(mixer->bus_clk);
>         reset_control_assert(mixer->reset);
>  }
>
> --
> 2.39.0
>
