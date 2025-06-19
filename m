Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB85AE027E
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jun 2025 12:17:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81F3610E9EE;
	Thu, 19 Jun 2025 10:17:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Htz+POkE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A0DB10E081
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jun 2025 10:17:26 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-450ccda1a6eso5413885e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jun 2025 03:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750328244; x=1750933044; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ao7gCqbk2nwxvTf9N0zcHGoO6CYaEdqlxe/q9BiVKGQ=;
 b=Htz+POkEI6L0UcLOk+Vw5fa5+ZMCvuutQYVVuwpj7d/c2AlX8Tr4xe0Ti0nyOB1DvK
 l5jPSl9fn/vZclh13lTwaytrCu/o457zSN2Jmt5TuzMYeY5vpe9EJvcM7OzqTZicpi5Q
 KOjs6bWmfsqPIveVuP/rneWF8FOHR8XdZK6rGUMScPpAIprZ8KcQ2dsctP0Z7l01sqRo
 jOU6o6akjVaIjBOvJk+7BnZsJpAzAQxFlpHQmGVc2/5r/rOrkMayIyRlYSgZskMqsSHl
 YFpuO6CPV8H9wpEgAaoTqD8UnFFJU/xAwYtNNrsoTo9mcKM8rMYWf+8gw9hcmYr+Onig
 CF8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750328245; x=1750933045;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ao7gCqbk2nwxvTf9N0zcHGoO6CYaEdqlxe/q9BiVKGQ=;
 b=tmXZAO+eg2hoNO2ngSbPusJzJq/ZLoaMxNZwUSVpUyzt55tBfwYI8ckGL/Rdy8zL5o
 JEJuA7MX/wdh0JGifcXfIZLb2ndPYni3R0g3YgMOC2qTrkv7WlP1ksiE6uZXUdMMLOzz
 2ouT9gsJUboM7TVtIHF9yzisCrVStaqlyzgquFWfaLja3O44yKm9jD9UWxYISHlVq/v2
 nL6xiXoaYwOCesNqjA37qAoh9ZLaIJAc2eRq7uw/A8IdbElgOiKZhl9cLEsc2uIvO5zH
 96jEF9C8jvmSw0USDvfcJq5xpgs7EHJwfRMnBRmNUnica0aDJ3Jyq1qia7Cv8ZmMBf6f
 4/mw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXAbDpj2RPKdQpEEEdfooRP7nwsJs59PKPtZGoOXi/t4kBCC/98PrDlkfjAQZJC8X9OadbPkCFJyFY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywc1NUpEGEJAuXL/AZ9sa0YO96pu4Z+d9NZwet70fFvOiXoWUHK
 QUhdYeswNWSOvQGHRdzk/bWsQsHbnrYCYAkNuz0ATwH5cvNCJy2rQYyHC8bAFaQVuJLGmGvwM/d
 zRDYzUiQhJ92Z0M+YB8McLz3HEt+dELk=
X-Gm-Gg: ASbGncsneCioLEUQuSq5Kbqv9AqBYX8KjeG9mujfMJTzWzAwKgkQDyHJWdCyp8M7ufo
 VSd4oapUK140CiO6K/m1HAU3eD5ARUBJKztO5nXc4pmh2UIhR8BnKVRVcWUjWPHxIhvMOSQZr6c
 o4SRyWvMltdjbNtf+HReKz8qxZQT3VD/9+DgmjocECghB5
X-Google-Smtp-Source: AGHT+IHwtk3I9wsayzQv0EzwP+ieJxggcDc9+OSYuqMeYAfVbKcvpm4rj/VK4C8kR6QjwmimsWaej+5Gqn88b0H8qP4=
X-Received: by 2002:a05:6000:430e:b0:3a5:1c3c:8d8d with SMTP id
 ffacd0b85a97d-3a572e56dc1mr17286269f8f.55.1750328244310; Thu, 19 Jun 2025
 03:17:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250526114353.12081-1-clamor95@gmail.com>
 <20250526114353.12081-3-clamor95@gmail.com>
 <20250619-nondescript-holistic-ostrich-6d1efc@houat>
In-Reply-To: <20250619-nondescript-holistic-ostrich-6d1efc@houat>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 19 Jun 2025 13:17:12 +0300
X-Gm-Features: Ac12FXwt7ii5S_NZ_PqQMyLvlMeVkxBJDTQVellqtZCJ-I81n9o_WJs1aPyancw
Message-ID: <CAPVz0n2rG+VJ5dwHmSxtzD5JtRy7p=g-gygKGUoSaECQCEkFfQ@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] drm: bridge: Add support for Solomon SSD2825
 RGB/DSI bridge
To: Maxime Ripard <mripard@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
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

=D1=87=D1=82, 19 =D1=87=D0=B5=D1=80=D0=B2. 2025=E2=80=AF=D1=80. =D0=BE 12:4=
1 Maxime Ripard <mripard@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Mon, May 26, 2025 at 02:43:53PM +0300, Svyatoslav Ryhel wrote:
> > +static ssize_t ssd2825_dsi_host_transfer(struct mipi_dsi_host *host,
> > +                                      const struct mipi_dsi_msg *msg)
> > +{
> > +     struct ssd2825_priv *priv =3D dsi_host_to_ssd2825(host);
> > +     struct mipi_dsi_device *dsi_dev =3D priv->output.dev;
> > +     u8 buf =3D *(u8 *)msg->tx_buf;
> > +     u16 config;
> > +     int ret;
> > +
> > +     if (!priv->enabled) {
> > +             dev_err(priv->dev, "Bridge is not enabled\n");
> > +             return -ENODEV;
> > +     }
>
> Transfers can and should happen even when the bridge is disabled. The
> hardware might not permit that, but you'll need to elaborate in the
> comment about why.
>

This ensures that hw was configured properly in pre_enable and since
pre_enable is void it will not return any errors if it fails.

> > +     if (msg->rx_len) {
> > +             dev_warn(priv->dev, "MIPI rx is not supported\n");
> > +             return -EOPNOTSUPP;
> > +     }
> > +
> > +     guard(mutex)(&priv->mlock);
> > +
> > +     ret =3D ssd2825_read_reg(priv, SSD2825_CONFIGURATION_REG, &config=
);
> > +     if (ret)
> > +             return ret;
> > +
> > +     switch (msg->type) {
> > +     case MIPI_DSI_DCS_SHORT_WRITE:
> > +     case MIPI_DSI_DCS_SHORT_WRITE_PARAM:
> > +     case MIPI_DSI_DCS_LONG_WRITE:
> > +             config |=3D SSD2825_CONF_REG_DCS;
> > +             break;
> > +     case MIPI_DSI_GENERIC_SHORT_WRITE_0_PARAM:
> > +     case MIPI_DSI_GENERIC_SHORT_WRITE_1_PARAM:
> > +     case MIPI_DSI_GENERIC_SHORT_WRITE_2_PARAM:
> > +     case MIPI_DSI_GENERIC_LONG_WRITE:
> > +             config &=3D ~SSD2825_CONF_REG_DCS;
> > +             break;
> > +     case MIPI_DSI_DCS_READ:
> > +     case MIPI_DSI_GENERIC_READ_REQUEST_0_PARAM:
> > +     case MIPI_DSI_GENERIC_READ_REQUEST_1_PARAM:
> > +     case MIPI_DSI_GENERIC_READ_REQUEST_2_PARAM:
> > +     default:
> > +             return 0;
> > +     }
> > +
> > +     ret =3D ssd2825_write_reg(priv, SSD2825_CONFIGURATION_REG, config=
);
> > +     if (ret)
> > +             return ret;
> > +
> > +     ret =3D ssd2825_write_reg(priv, SSD2825_VC_CTRL_REG, 0x0000);
> > +     if (ret)
> > +             return ret;
> > +
> > +     ret =3D ssd2825_write_dsi(priv, msg->tx_buf, msg->tx_len);
> > +     if (ret)
> > +             return ret;
> > +
> > +     if (buf =3D=3D MIPI_DCS_SET_DISPLAY_ON) {
> > +             /*
> > +              * NOTE! This is here since it cannot be called in bridge=
 enable because
> > +              * bridge pre enable and bridge enable have no gap in bet=
ween.
> > +              *
> > +              * Existing framework bridge-panel seq is:
> > +              *      panel_prepare > bridge_pre_enable > bridge_enable=
 > panel_enable
> > +              *
> > +              * Using prepare_prev_first was tested, but it switches s=
eq like this:
> > +              *      bridge_pre_enable > panel_prepare > bridge_enable=
 > panel_enable
> > +              *
> > +              * This will not work since panel hw MUST be prepared bef=
ore bridge is
> > +              * configured. Correct seq should be:
> > +              *      panel_prepare > bridge_pre_enable > panel_enable =
> bridge_enable
>
> Where is that requirement coming from?
>

This is how my device's (LG P895) bridge-panel combo works. Panel hw
must be enabled before bridge, then bridge hw, then panel can send
init sequence and then bridge must complete configuration.

> panel prepare is documented as:
>
>   The .prepare() function is typically called before the display controll=
er
>   starts to transmit video data.
>
>
> And video data transmission for bridges only happen at bridge_enable
> time.
>
> So, from an API PoV, all the sequences above are correct.
>

There is no way ATM for this bridge to complete configuration, there
either should be a way to swap panel_enable and bridge_enable or there
should be added an additional operation like bridge_post_enable or
smth like that for cases like here when bridge has to complete
configuration after panel init seq is sent.

> > +              * Last two functions should be swapped related to existi=
ng framework.
> > +              * I am not aware about method which allows that.
> > +              *
> > +              * Once there will be such method/flag, code below should=
 be moved into
> > +              * bridge_enable since it is basically a bridge configura=
tion completing
> > +              * after initial panel DSI sequence is completed.
> > +              */
>
> If there's anything to fix, we should do it before introducing that
> driver.
>

I just want to have a bridge my device uses to be supported by
mainline linux. I have no intention to touch any part of DRM framework
and cause instabilities, maintainers rage and hate.

> > +static void ssd2825_bridge_atomic_pre_enable(struct drm_bridge *bridge=
,
> > +                                          struct drm_atomic_state *sta=
te)
> > +{
> > +     struct ssd2825_priv *priv =3D bridge_to_ssd2825(bridge);
> > +     struct mipi_dsi_device *dsi_dev =3D priv->output.dev;
> > +     const struct drm_crtc_state *crtc_state;
> > +     const struct drm_display_mode *mode;
> > +     struct drm_connector *connector;
> > +     struct drm_crtc *crtc;
> > +     u32 input_bus_flags =3D bridge->timings->input_bus_flags;
> > +     u16 flags =3D 0, config;
> > +     u8 pixel_format;
> > +     int ret;
> > +
> > +     if (priv->enabled)
> > +             return;
>
> What is this guarding against?
>

blocks repeating ssd2825_bridge_atomic_pre_enable calls

> > +     /* Power Sequence */
> > +     ret =3D clk_prepare_enable(priv->tx_clk);
> > +     if (ret)
> > +             dev_err(priv->dev, "error enabling tx_clk (%d)\n", ret);
> > +
> > +     ret =3D regulator_bulk_enable(ARRAY_SIZE(ssd2825_supplies), priv-=
>supplies);
> > +     if (ret)
> > +             dev_err(priv->dev, "error enabling regulators (%d)\n", re=
t);
> > +
> > +     usleep_range(1000, 2000);
> > +
> > +     ssd2825_hw_reset(priv);
> > +
> > +     /* Perform SW reset */
> > +     ssd2825_write_reg(priv, SSD2825_OPERATION_CTRL_REG, 0x0100);
> > +
> > +     /* Set pixel format */
> > +     switch (dsi_dev->format) {
> > +     case MIPI_DSI_FMT_RGB565:
> > +             pixel_format =3D 0x00;
> > +             break;
> > +     case MIPI_DSI_FMT_RGB666_PACKED:
> > +             pixel_format =3D 0x01;
> > +             break;
> > +     case MIPI_DSI_FMT_RGB666:
> > +             pixel_format =3D 0x02;
> > +             break;
> > +     case MIPI_DSI_FMT_RGB888:
> > +     default:
> > +             pixel_format =3D 0x03;
> > +             break;
> > +     }
> > +
> > +     connector =3D drm_atomic_get_new_connector_for_encoder(state, bri=
dge->encoder);
> > +     crtc =3D drm_atomic_get_new_connector_state(state, connector)->cr=
tc;
> > +     crtc_state =3D drm_atomic_get_new_crtc_state(state, crtc);
> > +     mode =3D &crtc_state->adjusted_mode;
> > +
> > +     /* Set panel timings */
> > +     ssd2825_write_reg(priv, SSD2825_RGB_INTERFACE_CTRL_REG_1,
> > +                       ((mode->vtotal - mode->vsync_end) << 8) |
> > +                       (mode->htotal - mode->hsync_end));
> > +     ssd2825_write_reg(priv, SSD2825_RGB_INTERFACE_CTRL_REG_2,
> > +                       ((mode->vtotal - mode->vsync_start) << 8) |
> > +                       (mode->htotal - mode->hsync_start));
> > +     ssd2825_write_reg(priv, SSD2825_RGB_INTERFACE_CTRL_REG_3,
> > +                       ((mode->vsync_start - mode->vdisplay) << 8) |
> > +                       (mode->hsync_start - mode->hdisplay));
> > +     ssd2825_write_reg(priv, SSD2825_RGB_INTERFACE_CTRL_REG_4, mode->h=
display);
> > +     ssd2825_write_reg(priv, SSD2825_RGB_INTERFACE_CTRL_REG_5, mode->v=
display);
> > +
> > +     if (mode->flags & DRM_MODE_FLAG_PHSYNC)
> > +             flags |=3D SSD2825_HSYNC_HIGH;
> > +
> > +     if (mode->flags & DRM_MODE_FLAG_PVSYNC)
> > +             flags |=3D SSD2825_VSYNC_HIGH;
> > +
> > +     if (dsi_dev->mode_flags & MIPI_DSI_MODE_VIDEO)
> > +             flags |=3D SSD2825_NON_BURST_EV;
> > +
> > +     if (input_bus_flags & DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE)
> > +             flags |=3D SSD2825_PCKL_HIGH;
> > +
> > +     ssd2825_write_reg(priv, SSD2825_RGB_INTERFACE_CTRL_REG_6, flags |=
 pixel_format);
> > +     ssd2825_write_reg(priv, SSD2825_LANE_CONFIGURATION_REG, dsi_dev->=
lanes - 1);
> > +     ssd2825_write_reg(priv, SSD2825_TEST_REG, 0x0004);
> > +
> > +     /* Call PLL configuration */
> > +     ssd2825_setup_pll(priv, mode);
> > +
> > +     usleep_range(10000, 11000);
> > +
> > +     config =3D SSD2825_CONF_REG_HS | SSD2825_CONF_REG_CKE | SSD2825_C=
ONF_REG_DCS |
> > +              SSD2825_CONF_REG_ECD | SSD2825_CONF_REG_EOT;
> > +
> > +     if (dsi_dev->mode_flags & MIPI_DSI_MODE_LPM)
> > +             config &=3D ~SSD2825_CONF_REG_HS;
> > +
> > +     if (dsi_dev->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET)
> > +             config &=3D ~SSD2825_CONF_REG_EOT;
> > +
> > +     /* Initial DSI configuration register set */
> > +     ssd2825_write_reg(priv, SSD2825_CONFIGURATION_REG, config);
> > +     ssd2825_write_reg(priv, SSD2825_VC_CTRL_REG, 0);
> > +
> > +     priv->enabled =3D true;
> > +}
> > +
> > +static void ssd2825_bridge_atomic_enable(struct drm_bridge *bridge,
> > +                                      struct drm_atomic_state *state)
> > +{
> > +     /* placeholder */
> > +}
>
> That doesn't work with any bridge or panel that doesn't require any DCS
> command to power up, unfortunately.
>

Yes that is a flaw unfortunately, if you have suggestions of fixing
this just tell me.

> > +static void ssd2825_bridge_atomic_disable(struct drm_bridge *bridge,
> > +                                       struct drm_atomic_state *state)
> > +{
> > +     struct ssd2825_priv *priv =3D bridge_to_ssd2825(bridge);
> > +     int ret;
> > +
> > +     if (!priv->enabled)
> > +             return;
> > +
> > +     msleep(100);
> > +
> > +     /* Exit DSI configuration register set */
> > +     ssd2825_write_reg(priv, SSD2825_CONFIGURATION_REG,
> > +                       SSD2825_CONF_REG_ECD | SSD2825_CONF_REG_EOT);
> > +     ssd2825_write_reg(priv, SSD2825_VC_CTRL_REG, 0);
> > +
> > +     /* HW disable */
> > +     gpiod_set_value_cansleep(priv->reset_gpio, 1);
> > +     usleep_range(5000, 6000);
> > +
> > +     ret =3D regulator_bulk_disable(ARRAY_SIZE(ssd2825_supplies),
> > +                                  priv->supplies);
> > +     if (ret < 0)
> > +             dev_err(priv->dev, "error disabling regulators (%d)\n", r=
et);
> > +
> > +     clk_disable_unprepare(priv->tx_clk);
> > +
> > +     priv->enabled =3D false;
> > +}
> > +
> > +static int ssd2825_bridge_attach(struct drm_bridge *bridge, struct drm=
_encoder *encoder,
> > +                              enum drm_bridge_attach_flags flags)
> > +{
> > +     struct ssd2825_priv *priv =3D bridge_to_ssd2825(bridge);
> > +
> > +     return drm_bridge_attach(bridge->encoder, priv->output.bridge, br=
idge,
> > +                              flags);
> > +}
> > +
> > +static enum drm_mode_status
> > +ssd2825_bridge_mode_valid(struct drm_bridge *bridge,
> > +                       const struct drm_display_info *info,
> > +                       const struct drm_display_mode *mode)
> > +{
> > +     if (mode->hdisplay > 1366)
> > +             return MODE_H_ILLEGAL;
> > +
> > +     if (mode->vdisplay > 1366)
> > +             return MODE_V_ILLEGAL;
> > +
> > +     return MODE_OK;
> > +}
> > +
> > +static bool ssd2825_mode_fixup(struct drm_bridge *bridge,
> > +                            const struct drm_display_mode *mode,
> > +                            struct drm_display_mode *adjusted_mode)
> > +{
> > +     /* Default to positive sync */
> > +
> > +     if (!(adjusted_mode->flags &
> > +           (DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_NHSYNC)))
> > +             adjusted_mode->flags |=3D DRM_MODE_FLAG_PHSYNC;
> > +
> > +     if (!(adjusted_mode->flags &
> > +           (DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_NVSYNC)))
> > +             adjusted_mode->flags |=3D DRM_MODE_FLAG_PVSYNC;
> > +
> > +     return true;
> > +}
> > +
> > +static const struct drm_bridge_funcs ssd2825_bridge_funcs =3D {
> > +     .attach =3D ssd2825_bridge_attach,
> > +     .mode_valid =3D ssd2825_bridge_mode_valid,
> > +     .mode_fixup =3D ssd2825_mode_fixup,
> > +
> > +     .atomic_pre_enable =3D ssd2825_bridge_atomic_pre_enable,
> > +     .atomic_enable =3D ssd2825_bridge_atomic_enable,
> > +     .atomic_disable =3D ssd2825_bridge_atomic_disable,
> > +
> > +     .atomic_reset =3D drm_atomic_helper_bridge_reset,
> > +     .atomic_duplicate_state =3D drm_atomic_helper_bridge_duplicate_st=
ate,
> > +     .atomic_destroy_state =3D drm_atomic_helper_bridge_destroy_state,
> > +};
> > +
> > +static const struct drm_bridge_timings default_ssd2825_timings =3D {
> > +     .input_bus_flags =3D DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE
> > +              | DRM_BUS_FLAG_SYNC_SAMPLE_NEGEDGE
> > +              | DRM_BUS_FLAG_DE_HIGH,
> > +};
> > +
> > +static int ssd2825_probe(struct spi_device *spi)
> > +{
> > +     struct ssd2825_priv *priv;
> > +     struct device *dev =3D &spi->dev;
> > +     struct device_node *np =3D dev->of_node;
> > +     int ret;
> > +
> > +     /* Driver supports only 8 bit 3 Wire mode */
> > +     spi->bits_per_word =3D 9;
> > +
> > +     ret =3D spi_setup(spi);
> > +     if (ret)
> > +             return ret;
> > +
> > +     priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> > +     if (!priv)
> > +             return -ENOMEM;
>
> devm_drm_bridge_alloc()
>

OK

> > +     spi_set_drvdata(spi, priv);
> > +     priv->spi =3D spi;
> > +
> > +     dev_set_drvdata(dev, priv);
> > +     priv->dev =3D dev;
>
> spi_set_drvdata and dev_set_drvdata are doing the same thing here.
>

spi_set_drvdata is actually used, but dev_set_drvdata may be removed, yes.

> Maxime
