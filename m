Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 60C8B719469
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jun 2023 09:37:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40C4C10E520;
	Thu,  1 Jun 2023 07:37:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D83B810E1C7
 for <dri-devel@lists.freedesktop.org>; Wed, 31 May 2023 09:19:44 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-1b0201d9a9eso5689305ad.0
 for <dri-devel@lists.freedesktop.org>; Wed, 31 May 2023 02:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1685524783; x=1688116783; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e/F8jIF8NqATxdAvMuHV954nGjADHoS+vIBQmhEkWOs=;
 b=g2QKglMZH/mJ1PlHw0xaAb1Atu0wvBgVAqYnuu8mReQEONCqAC+kuvmXr1GOl2K8hi
 PELXRr9/ZHFzDZ1y3TGPnhTkxyRxzi2WWpiULuLFvRre0MOUR2wmfXd4PYcyHYisgga9
 vIxf3UCExwjWT2hL5wZhyPw1/THRLmg9F35utlvE2h3bHMSJOdGF1FVhqXM8zvkuKeiA
 QDOmg7HzxXmpRYriQ+VggWvGgLlVCw55VPwJnR21xsMdQuKGIVaBL+9JKvxwHIb3unI0
 dNbqyoJWOojJolHETOZRlnmey1S+0lkpPlrlK4bJKbtj2DG0b51oWPxTwnJeIwJ9apJ4
 TZiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685524783; x=1688116783;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e/F8jIF8NqATxdAvMuHV954nGjADHoS+vIBQmhEkWOs=;
 b=GIPXRSeijhqUj8nKsQ/VREqCEKSEDP00PUHgNFO9xLhMwfFwMNSHQnhZiQMvUwjaF0
 BXvr2ja55f/h6a+wOHvJu4aiCf+XH2WG/Td9fBM3DQyWMv2NXVLSLeVvLj4z4xR+HVrd
 OOdPIWo1nShSXsy3R9TwL46UHSVUVWzLEPXY5jTCDiY8E2kdDGA3BPSeB7jhp/Jn5Yw7
 bVSz9K3V12vIL4d1iTzumBxPqmgq/2tfR5QIPoiiXmsrJKN/x0rhwED9+mgoM+Tkatfh
 gRxT7V6SWxEPdyKPxd1wW+VAwmLV4GxjKhFSlZOKkDgwXI3XNryIU4Z/NltGoFF6i5LV
 gTNg==
X-Gm-Message-State: AC+VfDx9pLWwNRo5/zQMRSWQ5RTHDNQ9zJLQzv3A4s3szvgwr3fYPUrq
 PaRVMp2OlQw+BWtK2745dTGWp+/+7WZ0TBMww5aU8w==
X-Google-Smtp-Source: ACHHUZ6Ofzg7tjk5fXnBtT7CKLOKxvtwCuBdh95OKJ7ZvI9XlppTjSg852EOtBKSeeNZAfFL9zCpUaqHc9KwNzmaA5U=
X-Received: by 2002:a17:902:e744:b0:1ac:86b5:70d9 with SMTP id
 p4-20020a170902e74400b001ac86b570d9mr14542055plf.32.1685524783362; Wed, 31
 May 2023 02:19:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v5-0-56eb7a4d5b8e@linaro.org>
 <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v5-8-56eb7a4d5b8e@linaro.org>
In-Reply-To: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v5-8-56eb7a4d5b8e@linaro.org>
From: Nicolas Belin <nbelin@baylibre.com>
Date: Wed, 31 May 2023 11:19:32 +0200
Message-ID: <CAJZgTGEQ3B5M9BtDfUdyMiH+VQkWcFHU2fOJgE_1=a4E1bxMTA@mail.gmail.com>
Subject: Re: [PATCH v5 08/17] drm/meson: fix unbind path if HDMI fails to bind
To: Neil Armstrong <neil.armstrong@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 01 Jun 2023 07:37:12 +0000
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
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-amlogic@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-clk@vger.kernel.org, "Lukas F. Hartmann" <lukas@mntre.com>,
 Jerome Brunet <jbrunet@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Le mar. 30 mai 2023 =C3=A0 09:38, Neil Armstrong
<neil.armstrong@linaro.org> a =C3=A9crit :
>
> If the case the HDMI controller fails to bind, we try to unbind
> all components before calling drm_dev_put() which makes drm_bridge_detach=
()
> crash because unbinding the HDMI controller frees the bridge memory.
>
> The solution is the unbind all components at the end like in the remove
> path.
>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/gpu/drm/meson/meson_drv.c | 23 ++++++++++++++---------
>  1 file changed, 14 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/me=
son_drv.c
> index ca6d1e59e5d9..e060279dc80a 100644
> --- a/drivers/gpu/drm/meson/meson_drv.c
> +++ b/drivers/gpu/drm/meson/meson_drv.c
> @@ -316,32 +316,34 @@ static int meson_drv_bind_master(struct device *dev=
, bool has_components)
>                 goto exit_afbcd;
>
>         if (has_components) {
> -               ret =3D component_bind_all(drm->dev, drm);
> +               ret =3D component_bind_all(dev, drm);
>                 if (ret) {
>                         dev_err(drm->dev, "Couldn't bind all components\n=
");
> +                       /* Do not try to unbind */
> +                       has_components =3D false;
>                         goto exit_afbcd;
>                 }
>         }
>
>         ret =3D meson_encoder_hdmi_init(priv);
>         if (ret)
> -               goto unbind_all;
> +               goto exit_afbcd;
>
>         ret =3D meson_plane_create(priv);
>         if (ret)
> -               goto unbind_all;
> +               goto exit_afbcd;
>
>         ret =3D meson_overlay_create(priv);
>         if (ret)
> -               goto unbind_all;
> +               goto exit_afbcd;
>
>         ret =3D meson_crtc_create(priv);
>         if (ret)
> -               goto unbind_all;
> +               goto exit_afbcd;
>
>         ret =3D request_irq(priv->vsync_irq, meson_irq, 0, drm->driver->n=
ame, drm);
>         if (ret)
> -               goto unbind_all;
> +               goto exit_afbcd;
>
>         drm_mode_config_reset(drm);
>
> @@ -359,15 +361,18 @@ static int meson_drv_bind_master(struct device *dev=
, bool has_components)
>
>  uninstall_irq:
>         free_irq(priv->vsync_irq, drm);
> -unbind_all:
> -       if (has_components)
> -               component_unbind_all(drm->dev, drm);
>  exit_afbcd:
>         if (priv->afbcd.ops)
>                 priv->afbcd.ops->exit(priv);
>  free_drm:
>         drm_dev_put(drm);
>
> +       meson_encoder_hdmi_remove(priv);
> +       meson_encoder_cvbs_remove(priv);
> +
> +       if (has_components)
> +               component_unbind_all(dev, drm);
> +
>         return ret;
>  }
>
>
> --
> 2.34.1
>

Works fine on a Khadas VIM3 using a TS050 panel,
Thanks

Reviewed-by: Nicolas Belin <nbelin@baylibre.com>
Tested-by: Nicolas Belin <nbelin@baylibre.com>
