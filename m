Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC013B03830
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 09:42:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDB9410E03F;
	Mon, 14 Jul 2025 07:42:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DmVQZ0b/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC39210E03F
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 07:42:43 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-45619d70c72so4018995e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 00:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752478962; x=1753083762; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rnPDzK8frCWGXvDsaAvTU40Ec/UUh2JEKTo0kvGnCWY=;
 b=DmVQZ0b/9Y4ZVme0+AWkVYgwdJ/nCIoEnUV9biEF1dF5kkVRH1Zz8zx8w5y9MCzR1F
 pY0aGdP0dKX5taQGLNgLzX30QQDImYOPPjoEVWOAjDeOMHmIfmlJJekPPy+5HBOEM06A
 5jpobWAIyhNTC5q2mHUgriqsxDhB5Kdwy5Ql1PiV17yIWwH2lNFTMDkBHc2YRwOAYT/l
 mTifRBrpbp9zvE0i7LLXE4sLzAkuW1DW333WXY8d2C4pHNyCm3ckcQ1h2dewSWOtxOFV
 pTZg9VQeZBjjmkAoLIT8AvsshhVFbpU8bzHUN+u/JPgEZHtPaueJNe1IZfGD7BmRUykT
 cBWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752478962; x=1753083762;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rnPDzK8frCWGXvDsaAvTU40Ec/UUh2JEKTo0kvGnCWY=;
 b=qBHidppdGKGELi72w0YXdgU+lkGTPmRciUirjl8z591GX6SVsjoAmo9iutnUG+3Cln
 mVI8qu9omGny5kuR8M+NJDnlybn0UzU25zxPA33S+IFF2B8apo53/oSJ7W/a4ibircnu
 q5QiHu0GdcYcoZIhBjS3GcXn6v6z4PKnV/a2ruHcKzL72lUhr7HLYHgZ0EASp1tQVTP2
 wkphw9/sOLR/pWasjQ2zFIOo/9cVw16w0jEuoVd5jR2hSe2wXJgkaS7SX+LO2uGfgISW
 1AHtn4/Mdd4z23Nv20XBPIWTcnlh55iD4n3vcM2LQoW8E/Il4ZU7rjdsKYot9PlN67Wh
 9XhQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXoflZQOWrHBWNDgGvXPJ+orqORUqb5QObnrcw5cwSHgIr1Byuqg6Zav45hthVY4trEU/hT0mxWQLk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzBaPUDazsr7BIjvrK1pt4z9J6vTroW99t+xrsGesIW1xoIA1A9
 j2iokr30Xv5zAsGD93kS1N72mxM7P9KgQSAgGhUSradkZHQ/G6xGXGAvgV7zBlMAl5cySCur+pT
 s/FK4EeM2gu66w21IO/SmP6Bym3UxJek=
X-Gm-Gg: ASbGncuulJBzdPTYl2gABCZEZZAMORdETlpvlPJDsw/120NAvYgwW9++hklTtQcSdCw
 /7fQ+ISyN8HZpTc6zlZ1ttsPJmeOfDZnEQAxXlY5ZAVtyHbWJcGQFHz2ut/wJvK4GuCLcflHTzn
 pbwSBv1m3OzNDi1oGq0uDDwDAgaleLLeCsBFBf6RV6MU2jArhTpJWq9d4sqokAY4RWU43Xxpz0d
 uR1ff4d
X-Google-Smtp-Source: AGHT+IFr0JlmGJXJxmVbsVGP2sW3eyDOtlQyo45r1avQDzNNuQqbP2hfS28kpM1RpIlHRMDFFRpr+FLqRF465QdeYmA=
X-Received: by 2002:a05:600c:1c1c:b0:454:b93d:f232 with SMTP id
 5b1f17b1804b1-454db88159amr145203735e9.2.1752478961980; Mon, 14 Jul 2025
 00:42:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250526114353.12081-1-clamor95@gmail.com>
 <20250526114353.12081-3-clamor95@gmail.com>
 <20250619-nondescript-holistic-ostrich-6d1efc@houat>
 <CAPVz0n2rG+VJ5dwHmSxtzD5JtRy7p=g-gygKGUoSaECQCEkFfQ@mail.gmail.com>
 <20250619-slim-bright-warthog-77f8ed@houat>
 <CAPVz0n2eDciXnLOo_cEh8Hjy=hY1NW0DNRs8K5Y7d0Ey5JGbNQ@mail.gmail.com>
 <20250619-wondrous-illegal-marten-a365a7@houat>
In-Reply-To: <20250619-wondrous-illegal-marten-a365a7@houat>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 14 Jul 2025 10:42:30 +0300
X-Gm-Features: Ac12FXw1K6UziSJrLMhM3EPvhkSFrT3F-DKT9ZN9SexkJ4X21fdIRvjSA7AOG5s
Message-ID: <CAPVz0n3ooaYOoT8ONyUmE3w0T4714vVMsuEg6UbohehptdD=ew@mail.gmail.com>
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

=D1=87=D1=82, 19 =D1=87=D0=B5=D1=80=D0=B2. 2025=E2=80=AF=D1=80. =D0=BE 16:1=
3 Maxime Ripard <mripard@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Thu, Jun 19, 2025 at 03:16:34PM +0300, Svyatoslav Ryhel wrote:
> > =D1=87=D1=82, 19 =D1=87=D0=B5=D1=80=D0=B2. 2025=E2=80=AF=D1=80. =D0=BE =
15:05 Maxime Ripard <mripard@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > On Thu, Jun 19, 2025 at 01:17:12PM +0300, Svyatoslav Ryhel wrote:
> > > > =D1=87=D1=82, 19 =D1=87=D0=B5=D1=80=D0=B2. 2025=E2=80=AF=D1=80. =D0=
=BE 12:41 Maxime Ripard <mripard@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> > > > >
> > > > > On Mon, May 26, 2025 at 02:43:53PM +0300, Svyatoslav Ryhel wrote:
> > > > > > +static ssize_t ssd2825_dsi_host_transfer(struct mipi_dsi_host =
*host,
> > > > > > +                                      const struct mipi_dsi_ms=
g *msg)
> > > > > > +{
> > > > > > +     struct ssd2825_priv *priv =3D dsi_host_to_ssd2825(host);
> > > > > > +     struct mipi_dsi_device *dsi_dev =3D priv->output.dev;
> > > > > > +     u8 buf =3D *(u8 *)msg->tx_buf;
> > > > > > +     u16 config;
> > > > > > +     int ret;
> > > > > > +
> > > > > > +     if (!priv->enabled) {
> > > > > > +             dev_err(priv->dev, "Bridge is not enabled\n");
> > > > > > +             return -ENODEV;
> > > > > > +     }
> > > > >
> > > > > Transfers can and should happen even when the bridge is disabled.=
 The
> > > > > hardware might not permit that, but you'll need to elaborate in t=
he
> > > > > comment about why.
> > > >
> > > > This ensures that hw was configured properly in pre_enable and sinc=
e
> > > > pre_enable is void it will not return any errors if it fails.
> > >
> > > There's no relationship between the bridge pre_enable and enable hook=
s,
> > > and the MIPI-DSI host transfer one. It's perfectly valid to call
> > > transfer if the bridge is detached or disabled.
> >
> > That is twisted logic, but ok, fine, I don't care.
>
> It's not twisted. It's perfectly valid for a panel to read its revision
> at probe time, before it registers, for example.
>
> It would happen before the panel is enabled, and before the bridge is
> enabled.
>
> > > > > > +     if (msg->rx_len) {
> > > > > > +             dev_warn(priv->dev, "MIPI rx is not supported\n")=
;
> > > > > > +             return -EOPNOTSUPP;
> > > > > > +     }
> > > > > > +
> > > > > > +     guard(mutex)(&priv->mlock);
> > > > > > +
> > > > > > +     ret =3D ssd2825_read_reg(priv, SSD2825_CONFIGURATION_REG,=
 &config);
> > > > > > +     if (ret)
> > > > > > +             return ret;
> > > > > > +
> > > > > > +     switch (msg->type) {
> > > > > > +     case MIPI_DSI_DCS_SHORT_WRITE:
> > > > > > +     case MIPI_DSI_DCS_SHORT_WRITE_PARAM:
> > > > > > +     case MIPI_DSI_DCS_LONG_WRITE:
> > > > > > +             config |=3D SSD2825_CONF_REG_DCS;
> > > > > > +             break;
> > > > > > +     case MIPI_DSI_GENERIC_SHORT_WRITE_0_PARAM:
> > > > > > +     case MIPI_DSI_GENERIC_SHORT_WRITE_1_PARAM:
> > > > > > +     case MIPI_DSI_GENERIC_SHORT_WRITE_2_PARAM:
> > > > > > +     case MIPI_DSI_GENERIC_LONG_WRITE:
> > > > > > +             config &=3D ~SSD2825_CONF_REG_DCS;
> > > > > > +             break;
> > > > > > +     case MIPI_DSI_DCS_READ:
> > > > > > +     case MIPI_DSI_GENERIC_READ_REQUEST_0_PARAM:
> > > > > > +     case MIPI_DSI_GENERIC_READ_REQUEST_1_PARAM:
> > > > > > +     case MIPI_DSI_GENERIC_READ_REQUEST_2_PARAM:
> > > > > > +     default:
> > > > > > +             return 0;
> > > > > > +     }
> > > > > > +
> > > > > > +     ret =3D ssd2825_write_reg(priv, SSD2825_CONFIGURATION_REG=
, config);
> > > > > > +     if (ret)
> > > > > > +             return ret;
> > > > > > +
> > > > > > +     ret =3D ssd2825_write_reg(priv, SSD2825_VC_CTRL_REG, 0x00=
00);
> > > > > > +     if (ret)
> > > > > > +             return ret;
> > > > > > +
> > > > > > +     ret =3D ssd2825_write_dsi(priv, msg->tx_buf, msg->tx_len)=
;
> > > > > > +     if (ret)
> > > > > > +             return ret;
> > > > > > +
> > > > > > +     if (buf =3D=3D MIPI_DCS_SET_DISPLAY_ON) {
> > > > > > +             /*
> > > > > > +              * NOTE! This is here since it cannot be called i=
n bridge enable because
> > > > > > +              * bridge pre enable and bridge enable have no ga=
p in between.
> > > > > > +              *
> > > > > > +              * Existing framework bridge-panel seq is:
> > > > > > +              *      panel_prepare > bridge_pre_enable > bridg=
e_enable > panel_enable
> > > > > > +              *
> > > > > > +              * Using prepare_prev_first was tested, but it sw=
itches seq like this:
> > > > > > +              *      bridge_pre_enable > panel_prepare > bridg=
e_enable > panel_enable
> > > > > > +              *
> > > > > > +              * This will not work since panel hw MUST be prep=
ared before bridge is
> > > > > > +              * configured. Correct seq should be:
> > > > > > +              *      panel_prepare > bridge_pre_enable > panel=
_enable > bridge_enable
> > > > >
> > > > > Where is that requirement coming from?
> > > >
> > > > This is how my device's (LG P895) bridge-panel combo works. Panel h=
w
> > > > must be enabled before bridge, then bridge hw, then panel can send
> > > > init sequence and then bridge must complete configuration.
> > >
> > > Do you have a documentation for that DSI device?
> > >
> >
> > No
> >
> > > DSI devices typically come with requirement of the power states of th=
e
> > > lanes, that's what you want to discuss here. How we can model that in
> > > software is a discussion we need to have once we've identified what t=
he
> > > hardware needs exactly.
> > >
> > > > > panel prepare is documented as:
> > > > >
> > > > >   The .prepare() function is typically called before the display =
controller
> > > > >   starts to transmit video data.
> > > > >
> > > > >
> > > > > And video data transmission for bridges only happen at bridge_ena=
ble
> > > > > time.
> > > > >
> > > > > So, from an API PoV, all the sequences above are correct.
> > > >
> > > > There is no way ATM for this bridge to complete configuration, ther=
e
> > > > either should be a way to swap panel_enable and bridge_enable or th=
ere
> > > > should be added an additional operation like bridge_post_enable or
> > > > smth like that for cases like here when bridge has to complete
> > > > configuration after panel init seq is sent.
> > > >
> > > > > > +              * Last two functions should be swapped related t=
o existing framework.
> > > > > > +              * I am not aware about method which allows that.
> > > > > > +              *
> > > > > > +              * Once there will be such method/flag, code belo=
w should be moved into
> > > > > > +              * bridge_enable since it is basically a bridge c=
onfiguration completing
> > > > > > +              * after initial panel DSI sequence is completed.
> > > > > > +              */
> > > > >
> > > > > If there's anything to fix, we should do it before introducing th=
at
> > > > > driver.
> > > >
> > > > I just want to have a bridge my device uses to be supported by
> > > > mainline linux. I have no intention to touch any part of DRM framew=
ork
> > > > and cause instabilities, maintainers rage and hate.
> > >
> > > And I just want all drivers to behave consistently.
> > >
> >
> > Ye, sure.
> >
> > > > > > +static void ssd2825_bridge_atomic_pre_enable(struct drm_bridge=
 *bridge,
> > > > > > +                                          struct drm_atomic_st=
ate *state)
> > > > > > +{
> > > > > > +     struct ssd2825_priv *priv =3D bridge_to_ssd2825(bridge);
> > > > > > +     struct mipi_dsi_device *dsi_dev =3D priv->output.dev;
> > > > > > +     const struct drm_crtc_state *crtc_state;
> > > > > > +     const struct drm_display_mode *mode;
> > > > > > +     struct drm_connector *connector;
> > > > > > +     struct drm_crtc *crtc;
> > > > > > +     u32 input_bus_flags =3D bridge->timings->input_bus_flags;
> > > > > > +     u16 flags =3D 0, config;
> > > > > > +     u8 pixel_format;
> > > > > > +     int ret;
> > > > > > +
> > > > > > +     if (priv->enabled)
> > > > > > +             return;
> > > > >
> > > > > What is this guarding against?
> > > >
> > > > blocks repeating ssd2825_bridge_atomic_pre_enable calls
> > >
> > > Which happens in which situation?
> > >
> > > > > > +     /* Power Sequence */
> > > > > > +     ret =3D clk_prepare_enable(priv->tx_clk);
> > > > > > +     if (ret)
> > > > > > +             dev_err(priv->dev, "error enabling tx_clk (%d)\n"=
, ret);
> > > > > > +
> > > > > > +     ret =3D regulator_bulk_enable(ARRAY_SIZE(ssd2825_supplies=
), priv->supplies);
> > > > > > +     if (ret)
> > > > > > +             dev_err(priv->dev, "error enabling regulators (%d=
)\n", ret);
> > > > > > +
> > > > > > +     usleep_range(1000, 2000);
> > > > > > +
> > > > > > +     ssd2825_hw_reset(priv);
> > > > > > +
> > > > > > +     /* Perform SW reset */
> > > > > > +     ssd2825_write_reg(priv, SSD2825_OPERATION_CTRL_REG, 0x010=
0);
> > > > > > +
> > > > > > +     /* Set pixel format */
> > > > > > +     switch (dsi_dev->format) {
> > > > > > +     case MIPI_DSI_FMT_RGB565:
> > > > > > +             pixel_format =3D 0x00;
> > > > > > +             break;
> > > > > > +     case MIPI_DSI_FMT_RGB666_PACKED:
> > > > > > +             pixel_format =3D 0x01;
> > > > > > +             break;
> > > > > > +     case MIPI_DSI_FMT_RGB666:
> > > > > > +             pixel_format =3D 0x02;
> > > > > > +             break;
> > > > > > +     case MIPI_DSI_FMT_RGB888:
> > > > > > +     default:
> > > > > > +             pixel_format =3D 0x03;
> > > > > > +             break;
> > > > > > +     }
> > > > > > +
> > > > > > +     connector =3D drm_atomic_get_new_connector_for_encoder(st=
ate, bridge->encoder);
> > > > > > +     crtc =3D drm_atomic_get_new_connector_state(state, connec=
tor)->crtc;
> > > > > > +     crtc_state =3D drm_atomic_get_new_crtc_state(state, crtc)=
;
> > > > > > +     mode =3D &crtc_state->adjusted_mode;
> > > > > > +
> > > > > > +     /* Set panel timings */
> > > > > > +     ssd2825_write_reg(priv, SSD2825_RGB_INTERFACE_CTRL_REG_1,
> > > > > > +                       ((mode->vtotal - mode->vsync_end) << 8)=
 |
> > > > > > +                       (mode->htotal - mode->hsync_end));
> > > > > > +     ssd2825_write_reg(priv, SSD2825_RGB_INTERFACE_CTRL_REG_2,
> > > > > > +                       ((mode->vtotal - mode->vsync_start) << =
8) |
> > > > > > +                       (mode->htotal - mode->hsync_start));
> > > > > > +     ssd2825_write_reg(priv, SSD2825_RGB_INTERFACE_CTRL_REG_3,
> > > > > > +                       ((mode->vsync_start - mode->vdisplay) <=
< 8) |
> > > > > > +                       (mode->hsync_start - mode->hdisplay));
> > > > > > +     ssd2825_write_reg(priv, SSD2825_RGB_INTERFACE_CTRL_REG_4,=
 mode->hdisplay);
> > > > > > +     ssd2825_write_reg(priv, SSD2825_RGB_INTERFACE_CTRL_REG_5,=
 mode->vdisplay);
> > > > > > +
> > > > > > +     if (mode->flags & DRM_MODE_FLAG_PHSYNC)
> > > > > > +             flags |=3D SSD2825_HSYNC_HIGH;
> > > > > > +
> > > > > > +     if (mode->flags & DRM_MODE_FLAG_PVSYNC)
> > > > > > +             flags |=3D SSD2825_VSYNC_HIGH;
> > > > > > +
> > > > > > +     if (dsi_dev->mode_flags & MIPI_DSI_MODE_VIDEO)
> > > > > > +             flags |=3D SSD2825_NON_BURST_EV;
> > > > > > +
> > > > > > +     if (input_bus_flags & DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE=
)
> > > > > > +             flags |=3D SSD2825_PCKL_HIGH;
> > > > > > +
> > > > > > +     ssd2825_write_reg(priv, SSD2825_RGB_INTERFACE_CTRL_REG_6,=
 flags | pixel_format);
> > > > > > +     ssd2825_write_reg(priv, SSD2825_LANE_CONFIGURATION_REG, d=
si_dev->lanes - 1);
> > > > > > +     ssd2825_write_reg(priv, SSD2825_TEST_REG, 0x0004);
> > > > > > +
> > > > > > +     /* Call PLL configuration */
> > > > > > +     ssd2825_setup_pll(priv, mode);
> > > > > > +
> > > > > > +     usleep_range(10000, 11000);
> > > > > > +
> > > > > > +     config =3D SSD2825_CONF_REG_HS | SSD2825_CONF_REG_CKE | S=
SD2825_CONF_REG_DCS |
> > > > > > +              SSD2825_CONF_REG_ECD | SSD2825_CONF_REG_EOT;
> > > > > > +
> > > > > > +     if (dsi_dev->mode_flags & MIPI_DSI_MODE_LPM)
> > > > > > +             config &=3D ~SSD2825_CONF_REG_HS;
> > > > > > +
> > > > > > +     if (dsi_dev->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET)
> > > > > > +             config &=3D ~SSD2825_CONF_REG_EOT;
> > > > > > +
> > > > > > +     /* Initial DSI configuration register set */
> > > > > > +     ssd2825_write_reg(priv, SSD2825_CONFIGURATION_REG, config=
);
> > > > > > +     ssd2825_write_reg(priv, SSD2825_VC_CTRL_REG, 0);
> > > > > > +
> > > > > > +     priv->enabled =3D true;
> > > > > > +}
> > > > > > +
> > > > > > +static void ssd2825_bridge_atomic_enable(struct drm_bridge *br=
idge,
> > > > > > +                                      struct drm_atomic_state =
*state)
> > > > > > +{
> > > > > > +     /* placeholder */
> > > > > > +}
> > > > >
> > > > > That doesn't work with any bridge or panel that doesn't require a=
ny DCS
> > > > > command to power up, unfortunately.
> > > >
> > > > Yes that is a flaw unfortunately, if you have suggestions of fixing
> > > > this just tell me.
> > >
> > > Untangle pre_enable and enable from transfer, and in enable actually
> > > enable the bridge, and it will work just fine.
> > >
> >
> > No it will not, I have tried and panel fails cause panel hw is init in
> > pre-enable and init sequence is sent in enable, which is expected
> > logic. Yet bridge cannot complete configuration because panel enable
> > function is called AFTER bridge enable.
>
> Then I guess we're at a dead-end now, aren't we?
>

I tried to address issues that you have pointed to here in v7 version
of this patch set.
https://lore.kernel.org/lkml/20250623081504.58622-3-clamor95@gmail.com/

> Maxime
