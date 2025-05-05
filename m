Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBFCDAA923A
	for <lists+dri-devel@lfdr.de>; Mon,  5 May 2025 13:42:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFAAF10E0C1;
	Mon,  5 May 2025 11:42:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nCIbIMwy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AC8610E0C1
 for <dri-devel@lists.freedesktop.org>; Mon,  5 May 2025 11:42:10 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-39c13fa05ebso2539345f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 05 May 2025 04:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746445329; x=1747050129; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KruIqdPdauGVWjRYCa4lawsGc3EYFEr3EbHiC3ED+fE=;
 b=nCIbIMwys/3+67nzlAIZ+0ivGDGKFkUO+EcwNOX+W35ii8EcpaP5hq9gmrmzuZg+Qz
 sBKTB1u1sNrjdcN68DuqBNmkkErgLnNsXRr/9LRGk3YWeW5LkxpVqS4s8/p0LzPcEFcc
 q9TekFTzDnZ3c4idNLhadPNFyFRWns0rv66lCf7lTdXgjEIDjhs7TEW6UVFevqYfawGb
 n4Z2TCZqGpHZlduXoYBZ4tdxa49Fy6I2R3N3ThAOUcmG53kcyaErsg1tIZuniHB7tqGJ
 k0hYzGPSHTFWonWXAbkWagrgJesL9Oz724VyP30Se3ds8gYiCX46FBgG1rwrBKTQ4QrV
 Y33g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746445329; x=1747050129;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KruIqdPdauGVWjRYCa4lawsGc3EYFEr3EbHiC3ED+fE=;
 b=PkbbMJs4nT6JyosRx4I8U2Gjv/tF692KwK+7GI1EBdSidQUxXPR86/tyYcOF2qeddt
 ujvmvssuOLvtwZOVK2tCIxB/wBK8cUpOCK0O/wt8X40G4I/6KM8zjKA453EGdnrb+oxa
 xqte94QCHW/tiLXROGAb7hRLl/RyOsM9OpsPCBJ0vVVGecQgZ3h52N+O50aOdUbwhmOV
 JHN8p7IgkMrGVZeCmyf4Q3xXH9EOYf3cniQBD266YXxPY0wIeFzHr8vwsYdtpMms0Qf9
 9BcoShjrQix1GkRAKdWDr0DKwAlAX2aDSiLj2iAQiZ1g1Mn5YRpv1qgWS2vJAQhx9VUT
 sDIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUot2yUvEKJc4n8OAtLGdeuW6md/x3t0w2k4mk4hdR9e6tyW8yMX35anm2RENGCbBtf/8p8/nWj5Ug=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywz6Ke/FQERhINF9EfLphZ4WS0wplW8UYyGTUqnW93+GxQ+tleh
 aKAt+tWb8iyXBQMPzD3ac9xmp2Z8G6CEkh5mihhyNTyJl/fjKPA81TGyWOQZy+gzx2tAQTofgkh
 gVvOv3rs0C+JNRhlYTEWXa5VwuJw=
X-Gm-Gg: ASbGncuFKLLC846Ocve7apRaYDbtcEKywISki2r3Su9ZTL3axoxyCB+yXhkvP34ds8i
 3Bz1S+6OV+y9Yzi1sjvdaT6/zu2Sp/scTKcdGcPEuFhR8DPJMbF1Jg2g00Kd62HvDTFvXSfKGA2
 TGNVCWNsoja9ujP8gTH1YxeY0FnSXpxKu2vQ==
X-Google-Smtp-Source: AGHT+IF0b08rVUeiB6pMpxCseBfmukd/TOtG6DGSWcy45xXCpz3/srzTxmFTfkMiKUYFe9RprpS0sbmx07u7TavER8A=
X-Received: by 2002:a05:6000:1ac9:b0:39c:1f04:a646 with SMTP id
 ffacd0b85a97d-3a09fd726camr4763586f8f.13.1746445328440; Mon, 05 May 2025
 04:42:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250503094149.29201-1-clamor95@gmail.com>
 <20250503094149.29201-3-clamor95@gmail.com>
 <ffac4a1b-5dfa-48e9-8ac4-37939b6a9347@linaro.org>
In-Reply-To: <ffac4a1b-5dfa-48e9-8ac4-37939b6a9347@linaro.org>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 5 May 2025 14:41:57 +0300
X-Gm-Features: ATxdqUG83kxEDJWXfjf1kMB8KKjw9VeaTfQqOHpfaGzkV6Mu-zq0PSNbH5qNHFs
Message-ID: <CAPVz0n3i7=jM9GB-CggFOJEN7B+oBWvyqsSn8UXav3MH0BQJ5g@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] drm: panel: Add support for Renesas R61307 based
 MIPI DSI panel
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
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

=D0=BF=D0=BD, 5 =D1=82=D1=80=D0=B0=D0=B2. 2025=E2=80=AF=D1=80. =D0=BE 10:50=
 Neil Armstrong <neil.armstrong@linaro.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On 03/05/2025 11:41, Svyatoslav Ryhel wrote:
> > R61307 is liquid crystal driver for high-definition amorphous silicon
> > (a-Si) panels and is ideal for tablets and smartphones.
> >
> > Supported compatibles are:
> > - hit,tx13d100vm0eaa
> > - koe,tx13d100vm0eaa
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >   drivers/gpu/drm/panel/Kconfig                |  13 +
> >   drivers/gpu/drm/panel/Makefile               |   1 +
> >   drivers/gpu/drm/panel/panel-renesas-r61307.c | 327 ++++++++++++++++++=
+
> >   3 files changed, 341 insertions(+)
> >   create mode 100644 drivers/gpu/drm/panel/panel-renesas-r61307.c
> >
>
> <snip>
>
> > +static int renesas_r61307_probe(struct mipi_dsi_device *dsi)
> > +{
> > +     struct device *dev =3D &dsi->dev;
> > +     struct renesas_r61307 *priv;
> > +     int ret;
> > +
> > +     priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> > +     if (!priv)
> > +             return -ENOMEM;
> > +
> > +     priv->vcc_supply =3D devm_regulator_get(dev, "vcc");
> > +     if (IS_ERR(priv->vcc_supply))
> > +             return dev_err_probe(dev, PTR_ERR(priv->vcc_supply),
> > +                                  "Failed to get vcc-supply\n");
> > +
> > +     priv->iovcc_supply =3D devm_regulator_get(dev, "iovcc");
> > +     if (IS_ERR(priv->iovcc_supply))
> > +             return dev_err_probe(dev, PTR_ERR(priv->iovcc_supply),
> > +                                  "Failed to get iovcc-supply\n");
> > +
> > +     priv->reset_gpio =3D devm_gpiod_get_optional(dev, "reset",
> > +                                                GPIOD_OUT_HIGH);
> > +     if (IS_ERR(priv->reset_gpio))
> > +             return dev_err_probe(dev, PTR_ERR(priv->reset_gpio),
> > +                                  "Failed to get reset gpios\n");
> > +
> > +     if (device_property_read_bool(dev, "renesas,inversion"))
> > +             priv->inversion =3D true;
> > +
> > +     if (device_property_read_bool(dev, "renesas,contrast"))
> > +             priv->dig_cont_adj =3D true;
> > +
> > +     priv->gamma =3D 0;
> > +     device_property_read_u32(dev, "renesas,gamma", &priv->gamma);
> > +
> > +     priv->dsi =3D dsi;
> > +     mipi_dsi_set_drvdata(dsi, priv);
> > +
> > +     dsi->lanes =3D 4;
> > +     dsi->format =3D MIPI_DSI_FMT_RGB888;
> > +     dsi->mode_flags =3D MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYN=
C_PULSE |
> > +                       MIPI_DSI_CLOCK_NON_CONTINUOUS | MIPI_DSI_MODE_L=
PM;
> > +
> > +     drm_panel_init(&priv->panel, dev, &renesas_r61307_panel_funcs,
> > +                    DRM_MODE_CONNECTOR_DSI);
>
> Please switch to devm_drm_panel_alloc()
>

This helper is not available as for 6.15-rc5

> > +
> > +     ret =3D drm_panel_of_backlight(&priv->panel);
> > +     if (ret)
> > +             return dev_err_probe(dev, ret, "Failed to get backlight\n=
");
> > +
> > +     drm_panel_add(&priv->panel);
> > +
> <snip>
>
> With that:
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
