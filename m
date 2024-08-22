Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E811895AEA0
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 09:15:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E761F10E796;
	Thu, 22 Aug 2024 07:15:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TF9ZU8Gu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
 [209.85.222.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED1D310E57C
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2024 00:35:57 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id
 af79cd13be357-7a1da7cafccso16784585a.3
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2024 17:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724286956; x=1724891756; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=22zWPOj1TpYR/jHva6dX8P4bxYu0jWvouDXLuCxJapI=;
 b=TF9ZU8GuTHzvCEyQXvBofd13rjHRVOZFZpD9gBKQxvdYDF4HY0r2CDjlUhc/4xMtrV
 T2x9AsUmQ6P8R1+t2ZP2LkHDBB3G7eubjr00jBkyozHwVzg9sz3CYkwAcEBl6NctT3/o
 oncs3WxGVs5gn2bqBXiL5tz7z8dGTpjSNg6ymYLVa4rJgbxQQhq8SGInYuTE2wYi3Z7q
 BdvGUz2o2fVUbVn5l/n/beg/No4IuZLSoCcz2ifNsNb/5q6xuMhy2TISD2VA4+czOx6w
 ku56Xli4BjND/g9Hx/zk+2qtBfUtFFMhdqpAgBRH5T2mmf7dWjagq7kgVSZXCUL70xwZ
 QFjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724286956; x=1724891756;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=22zWPOj1TpYR/jHva6dX8P4bxYu0jWvouDXLuCxJapI=;
 b=YYRcDNGb5JXDi6B8fSOh99c3JTyAKAdrfrrJ9sgSpODc97RRbNE+1hggzGjzqJdD1Q
 YVoS49JfqAnWmsIVNESEcrs55VYJ02pONIneLwtdesyfJby/jtnnP2zNVMzXUL2/S2r8
 Ms1laixHKP11kYvdjUNpfNt371wD08Qez9phPmwye4glrkFkGBbqPQWKTfM+9jpl19mf
 H48RUHXdVm0V2bDzDmbSqbHQE5GjRBOBECS9N3SihbKn6Rhn9DJiADXZhEyg9Xn0bPzV
 3O3wmygztzXDtr/VICeo5KNhREreUde4YW3JGF62BhfVkGDduvFYuZicqedjKnylaPAF
 aqhw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUipCiyN1vnvgex/qg2ryB6tbiXtOmMi1ohOIZgyXNPhbs4lAmbSG2TGmeSIO9EfzL9F4kq70e9Tt0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx8ogzW8ApONXUoj+/xeqz/KYVtvWkKH77OgcQPTDGQ513299+s
 cE3tWF8zSWfoc7NinjCsACjTlWFrY9gcH52IU2vQVqp5qTU9Q1thYoG0XJhwZBNdE3ef/fI2snK
 KvxdD+1Qr8wmhdehfSQ4rLxJ/QNE=
X-Google-Smtp-Source: AGHT+IFA7v3PE7COTekEBnadVG/BYIOlP9BEhcpwuRDzMHbYs2DiX9GTE7X59ozXJ7MpVRg4cwF21rX4O6OpKBulwMg=
X-Received: by 2002:a05:6214:4520:b0:6b7:ae86:e33e with SMTP id
 6a1803df08f44-6c155e09dfdmr34354096d6.37.1724286956259; Wed, 21 Aug 2024
 17:35:56 -0700 (PDT)
MIME-Version: 1.0
References: <20240820125840.9032-1-rongqianfeng@vivo.com>
In-Reply-To: <20240820125840.9032-1-rongqianfeng@vivo.com>
From: Julian Calaby <julian.calaby@gmail.com>
Date: Thu, 22 Aug 2024 10:35:45 +1000
Message-ID: <CAGRGNgXn94ZPROLN4JButpnc+ffFFr1SwtTFM=bvcPH95DFQgQ@mail.gmail.com>
Subject: Re: [PATCH] gpu: drm: Use devm_clk_get_enabled() helpers
To: Rong Qianfeng <rongqianfeng@vivo.com>
Cc: Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, opensource.kernel@vivo.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 22 Aug 2024 07:15:39 +0000
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

Hi Rong,

On Tue, Aug 20, 2024 at 10:59=E2=80=AFPM Rong Qianfeng <rongqianfeng@vivo.c=
om> wrote:
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

Am I reading this right: is this changing the init sequence so that
the clock is enabled before setting a rate?

This is the sort of thing that might cause glitches and issues in some
hardware, so it'd be polite to test such a change on the actual
hardware before posting it.

Thanks,

--=20
Julian Calaby

Email: julian.calaby@gmail.com
Profile: http://www.google.com/profiles/julian.calaby/
