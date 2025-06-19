Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92AAFAE0544
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jun 2025 14:16:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 973D710EA0D;
	Thu, 19 Jun 2025 12:16:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Za3jSJ2u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0A6710E9FF
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jun 2025 12:16:47 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-3a525eee2e3so489998f8f.2
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jun 2025 05:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750335406; x=1750940206; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bsuVMHdPyoMl29LL1KXzCdxntqN9YJP95SRtroOttNI=;
 b=Za3jSJ2uX/TluNNw5PZkZwTPF7eBrC3QCSemCzpMA37TQiSwzcRBSeEl8HPTyoxdeQ
 eXh6J+XD89e4TivRo5U3ba0bcOrfNkH1j/9hGoU9fUsAzOW4K/zidB9ZQKeJz8py1QIH
 xVLqdIbVcifzztDbHNTzxISELlsmfEgdLb1kgllqZvKySN68EK/wx1j+xb/fx5sNGWrG
 5cUdTb4+5GJ/zzzUVCewGP87DpXwLsm2fcMWi0UPR84srdYwtQ6iggeMTGEvbXpPUZcF
 Ke9JjOmQLJAHx8rCGPqWplxVmjM0cB/doXTAesT77hcmuZV3yu+kT47K5tlkxkNyiiTD
 WTeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750335406; x=1750940206;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bsuVMHdPyoMl29LL1KXzCdxntqN9YJP95SRtroOttNI=;
 b=v7BrpzuladS6Pb211CQi37ibPHXMzC8fjZUaFWmf0VKHTpIAaKFKLu2bsU6TPm97W6
 HHZMd6/VWRN6RSG7NyUCNC/qyWQbPv1L0m00Hjd7cU5OLosiJON6h9i9fXc5cTid0IVP
 KIA+RsI/bqd0BN1vkYqADCNI0DUnvymMCJUHZqK3Sccl4DD2R0q5ZuzR0kIT9k9WaUD9
 O/NK7v/zzlMewYTRJmcDQDBMc/ChPFjSsRETcxVzQm9iGTlTw4pBW31T4mHODlWdWwXN
 BUrN2tDmjq7QzRZOXcoxprLZpJvzs4d760LzbRozRVt8x5osJOJztzwtmyVngSXhB5bE
 6WRw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmt9rxw0Tte3jLe98W6TXUlXflaTQEF0pFaWaJ6HkNwPSDSU/b9Qu68D1qeyODZ+aTpj7RutI005M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx2O7gST3vOxMTyqFG8aAHGdjNcR67/1/GUT1empiZ11+pUKjvU
 0y5CQ/82CBefCqghuFGwu2hPLwmHLbatHugeKcrLS0GNIhYdC0+1GmNX1j93XD1UgpPr80hvRx1
 n0DPcsIlWLwbmR5YF+RBCPTJm7CZH8aA=
X-Gm-Gg: ASbGncscPtMBuycJoSuKTIQtdo1h+OwtpX8kLkBmAr8BYo6L/Y474dAtPdLw7NpIIct
 VL4/VdF/zlfeXz6+1Jvtw7d5XjaABoMa9BVnmX1W97x4QEfLJvs1jB2pf5lWLpzcmTaWl0Lvdh/
 /V8J04PmDiS8YKrBOOrZWQNIJHKnpUF9oK+iXBaTMZno9I
X-Google-Smtp-Source: AGHT+IHxoyMAzrf2LbgQDNwEuwJWUIdpjjM+Ph04bO+CgSJPWdYFSEfS4CRU7pDTnsLGVs9SUjjHJrw11Y4guCcdrIQ=
X-Received: by 2002:a5d:64c9:0:b0:3a4:dde7:ee12 with SMTP id
 ffacd0b85a97d-3a572e9e01cmr18889997f8f.53.1750335406067; Thu, 19 Jun 2025
 05:16:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250526114353.12081-1-clamor95@gmail.com>
 <20250526114353.12081-3-clamor95@gmail.com>
 <20250619-nondescript-holistic-ostrich-6d1efc@houat>
 <CAPVz0n2rG+VJ5dwHmSxtzD5JtRy7p=g-gygKGUoSaECQCEkFfQ@mail.gmail.com>
 <20250619-slim-bright-warthog-77f8ed@houat>
In-Reply-To: <20250619-slim-bright-warthog-77f8ed@houat>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 19 Jun 2025 15:16:34 +0300
X-Gm-Features: Ac12FXx30xubSIzbk_WR5SeH8bWRwhhe_clcHUJEn_GMfTRXwnQ2inDKt96s1Qk
Message-ID: <CAPVz0n2eDciXnLOo_cEh8Hjy=hY1NW0DNRs8K5Y7d0Ey5JGbNQ@mail.gmail.com>
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

=D1=87=D1=82, 19 =D1=87=D0=B5=D1=80=D0=B2. 2025=E2=80=AF=D1=80. =D0=BE 15:0=
5 Maxime Ripard <mripard@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Thu, Jun 19, 2025 at 01:17:12PM +0300, Svyatoslav Ryhel wrote:
> > =D1=87=D1=82, 19 =D1=87=D0=B5=D1=80=D0=B2. 2025=E2=80=AF=D1=80. =D0=BE =
12:41 Maxime Ripard <mripard@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > On Mon, May 26, 2025 at 02:43:53PM +0300, Svyatoslav Ryhel wrote:
> > > > +static ssize_t ssd2825_dsi_host_transfer(struct mipi_dsi_host *hos=
t,
> > > > +                                      const struct mipi_dsi_msg *m=
sg)
> > > > +{
> > > > +     struct ssd2825_priv *priv =3D dsi_host_to_ssd2825(host);
> > > > +     struct mipi_dsi_device *dsi_dev =3D priv->output.dev;
> > > > +     u8 buf =3D *(u8 *)msg->tx_buf;
> > > > +     u16 config;
> > > > +     int ret;
> > > > +
> > > > +     if (!priv->enabled) {
> > > > +             dev_err(priv->dev, "Bridge is not enabled\n");
> > > > +             return -ENODEV;
> > > > +     }
> > >
> > > Transfers can and should happen even when the bridge is disabled. The
> > > hardware might not permit that, but you'll need to elaborate in the
> > > comment about why.
> >
> > This ensures that hw was configured properly in pre_enable and since
> > pre_enable is void it will not return any errors if it fails.
>
> There's no relationship between the bridge pre_enable and enable hooks,
> and the MIPI-DSI host transfer one. It's perfectly valid to call
> transfer if the bridge is detached or disabled.
>

That is twisted logic, but ok, fine, I don't care.

> > > > +     if (msg->rx_len) {
> > > > +             dev_warn(priv->dev, "MIPI rx is not supported\n");
> > > > +             return -EOPNOTSUPP;
> > > > +     }
> > > > +
> > > > +     guard(mutex)(&priv->mlock);
> > > > +
> > > > +     ret =3D ssd2825_read_reg(priv, SSD2825_CONFIGURATION_REG, &co=
nfig);
> > > > +     if (ret)
> > > > +             return ret;
> > > > +
> > > > +     switch (msg->type) {
> > > > +     case MIPI_DSI_DCS_SHORT_WRITE:
> > > > +     case MIPI_DSI_DCS_SHORT_WRITE_PARAM:
> > > > +     case MIPI_DSI_DCS_LONG_WRITE:
> > > > +             config |=3D SSD2825_CONF_REG_DCS;
> > > > +             break;
> > > > +     case MIPI_DSI_GENERIC_SHORT_WRITE_0_PARAM:
> > > > +     case MIPI_DSI_GENERIC_SHORT_WRITE_1_PARAM:
> > > > +     case MIPI_DSI_GENERIC_SHORT_WRITE_2_PARAM:
> > > > +     case MIPI_DSI_GENERIC_LONG_WRITE:
> > > > +             config &=3D ~SSD2825_CONF_REG_DCS;
> > > > +             break;
> > > > +     case MIPI_DSI_DCS_READ:
> > > > +     case MIPI_DSI_GENERIC_READ_REQUEST_0_PARAM:
> > > > +     case MIPI_DSI_GENERIC_READ_REQUEST_1_PARAM:
> > > > +     case MIPI_DSI_GENERIC_READ_REQUEST_2_PARAM:
> > > > +     default:
> > > > +             return 0;
> > > > +     }
> > > > +
> > > > +     ret =3D ssd2825_write_reg(priv, SSD2825_CONFIGURATION_REG, co=
nfig);
> > > > +     if (ret)
> > > > +             return ret;
> > > > +
> > > > +     ret =3D ssd2825_write_reg(priv, SSD2825_VC_CTRL_REG, 0x0000);
> > > > +     if (ret)
> > > > +             return ret;
> > > > +
> > > > +     ret =3D ssd2825_write_dsi(priv, msg->tx_buf, msg->tx_len);
> > > > +     if (ret)
> > > > +             return ret;
> > > > +
> > > > +     if (buf =3D=3D MIPI_DCS_SET_DISPLAY_ON) {
> > > > +             /*
> > > > +              * NOTE! This is here since it cannot be called in br=
idge enable because
> > > > +              * bridge pre enable and bridge enable have no gap in=
 between.
> > > > +              *
> > > > +              * Existing framework bridge-panel seq is:
> > > > +              *      panel_prepare > bridge_pre_enable > bridge_en=
able > panel_enable
> > > > +              *
> > > > +              * Using prepare_prev_first was tested, but it switch=
es seq like this:
> > > > +              *      bridge_pre_enable > panel_prepare > bridge_en=
able > panel_enable
> > > > +              *
> > > > +              * This will not work since panel hw MUST be prepared=
 before bridge is
> > > > +              * configured. Correct seq should be:
> > > > +              *      panel_prepare > bridge_pre_enable > panel_ena=
ble > bridge_enable
> > >
> > > Where is that requirement coming from?
> >
> > This is how my device's (LG P895) bridge-panel combo works. Panel hw
> > must be enabled before bridge, then bridge hw, then panel can send
> > init sequence and then bridge must complete configuration.
>
> Do you have a documentation for that DSI device?
>

No

> DSI devices typically come with requirement of the power states of the
> lanes, that's what you want to discuss here. How we can model that in
> software is a discussion we need to have once we've identified what the
> hardware needs exactly.
>
> > > panel prepare is documented as:
> > >
> > >   The .prepare() function is typically called before the display cont=
roller
> > >   starts to transmit video data.
> > >
> > >
> > > And video data transmission for bridges only happen at bridge_enable
> > > time.
> > >
> > > So, from an API PoV, all the sequences above are correct.
> >
> > There is no way ATM for this bridge to complete configuration, there
> > either should be a way to swap panel_enable and bridge_enable or there
> > should be added an additional operation like bridge_post_enable or
> > smth like that for cases like here when bridge has to complete
> > configuration after panel init seq is sent.
> >
> > > > +              * Last two functions should be swapped related to ex=
isting framework.
> > > > +              * I am not aware about method which allows that.
> > > > +              *
> > > > +              * Once there will be such method/flag, code below sh=
ould be moved into
> > > > +              * bridge_enable since it is basically a bridge confi=
guration completing
> > > > +              * after initial panel DSI sequence is completed.
> > > > +              */
> > >
> > > If there's anything to fix, we should do it before introducing that
> > > driver.
> >
> > I just want to have a bridge my device uses to be supported by
> > mainline linux. I have no intention to touch any part of DRM framework
> > and cause instabilities, maintainers rage and hate.
>
> And I just want all drivers to behave consistently.
>

Ye, sure.

> > > > +static void ssd2825_bridge_atomic_pre_enable(struct drm_bridge *br=
idge,
> > > > +                                          struct drm_atomic_state =
*state)
> > > > +{
> > > > +     struct ssd2825_priv *priv =3D bridge_to_ssd2825(bridge);
> > > > +     struct mipi_dsi_device *dsi_dev =3D priv->output.dev;
> > > > +     const struct drm_crtc_state *crtc_state;
> > > > +     const struct drm_display_mode *mode;
> > > > +     struct drm_connector *connector;
> > > > +     struct drm_crtc *crtc;
> > > > +     u32 input_bus_flags =3D bridge->timings->input_bus_flags;
> > > > +     u16 flags =3D 0, config;
> > > > +     u8 pixel_format;
> > > > +     int ret;
> > > > +
> > > > +     if (priv->enabled)
> > > > +             return;
> > >
> > > What is this guarding against?
> >
> > blocks repeating ssd2825_bridge_atomic_pre_enable calls
>
> Which happens in which situation?
>
> > > > +     /* Power Sequence */
> > > > +     ret =3D clk_prepare_enable(priv->tx_clk);
> > > > +     if (ret)
> > > > +             dev_err(priv->dev, "error enabling tx_clk (%d)\n", re=
t);
> > > > +
> > > > +     ret =3D regulator_bulk_enable(ARRAY_SIZE(ssd2825_supplies), p=
riv->supplies);
> > > > +     if (ret)
> > > > +             dev_err(priv->dev, "error enabling regulators (%d)\n"=
, ret);
> > > > +
> > > > +     usleep_range(1000, 2000);
> > > > +
> > > > +     ssd2825_hw_reset(priv);
> > > > +
> > > > +     /* Perform SW reset */
> > > > +     ssd2825_write_reg(priv, SSD2825_OPERATION_CTRL_REG, 0x0100);
> > > > +
> > > > +     /* Set pixel format */
> > > > +     switch (dsi_dev->format) {
> > > > +     case MIPI_DSI_FMT_RGB565:
> > > > +             pixel_format =3D 0x00;
> > > > +             break;
> > > > +     case MIPI_DSI_FMT_RGB666_PACKED:
> > > > +             pixel_format =3D 0x01;
> > > > +             break;
> > > > +     case MIPI_DSI_FMT_RGB666:
> > > > +             pixel_format =3D 0x02;
> > > > +             break;
> > > > +     case MIPI_DSI_FMT_RGB888:
> > > > +     default:
> > > > +             pixel_format =3D 0x03;
> > > > +             break;
> > > > +     }
> > > > +
> > > > +     connector =3D drm_atomic_get_new_connector_for_encoder(state,=
 bridge->encoder);
> > > > +     crtc =3D drm_atomic_get_new_connector_state(state, connector)=
->crtc;
> > > > +     crtc_state =3D drm_atomic_get_new_crtc_state(state, crtc);
> > > > +     mode =3D &crtc_state->adjusted_mode;
> > > > +
> > > > +     /* Set panel timings */
> > > > +     ssd2825_write_reg(priv, SSD2825_RGB_INTERFACE_CTRL_REG_1,
> > > > +                       ((mode->vtotal - mode->vsync_end) << 8) |
> > > > +                       (mode->htotal - mode->hsync_end));
> > > > +     ssd2825_write_reg(priv, SSD2825_RGB_INTERFACE_CTRL_REG_2,
> > > > +                       ((mode->vtotal - mode->vsync_start) << 8) |
> > > > +                       (mode->htotal - mode->hsync_start));
> > > > +     ssd2825_write_reg(priv, SSD2825_RGB_INTERFACE_CTRL_REG_3,
> > > > +                       ((mode->vsync_start - mode->vdisplay) << 8)=
 |
> > > > +                       (mode->hsync_start - mode->hdisplay));
> > > > +     ssd2825_write_reg(priv, SSD2825_RGB_INTERFACE_CTRL_REG_4, mod=
e->hdisplay);
> > > > +     ssd2825_write_reg(priv, SSD2825_RGB_INTERFACE_CTRL_REG_5, mod=
e->vdisplay);
> > > > +
> > > > +     if (mode->flags & DRM_MODE_FLAG_PHSYNC)
> > > > +             flags |=3D SSD2825_HSYNC_HIGH;
> > > > +
> > > > +     if (mode->flags & DRM_MODE_FLAG_PVSYNC)
> > > > +             flags |=3D SSD2825_VSYNC_HIGH;
> > > > +
> > > > +     if (dsi_dev->mode_flags & MIPI_DSI_MODE_VIDEO)
> > > > +             flags |=3D SSD2825_NON_BURST_EV;
> > > > +
> > > > +     if (input_bus_flags & DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE)
> > > > +             flags |=3D SSD2825_PCKL_HIGH;
> > > > +
> > > > +     ssd2825_write_reg(priv, SSD2825_RGB_INTERFACE_CTRL_REG_6, fla=
gs | pixel_format);
> > > > +     ssd2825_write_reg(priv, SSD2825_LANE_CONFIGURATION_REG, dsi_d=
ev->lanes - 1);
> > > > +     ssd2825_write_reg(priv, SSD2825_TEST_REG, 0x0004);
> > > > +
> > > > +     /* Call PLL configuration */
> > > > +     ssd2825_setup_pll(priv, mode);
> > > > +
> > > > +     usleep_range(10000, 11000);
> > > > +
> > > > +     config =3D SSD2825_CONF_REG_HS | SSD2825_CONF_REG_CKE | SSD28=
25_CONF_REG_DCS |
> > > > +              SSD2825_CONF_REG_ECD | SSD2825_CONF_REG_EOT;
> > > > +
> > > > +     if (dsi_dev->mode_flags & MIPI_DSI_MODE_LPM)
> > > > +             config &=3D ~SSD2825_CONF_REG_HS;
> > > > +
> > > > +     if (dsi_dev->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET)
> > > > +             config &=3D ~SSD2825_CONF_REG_EOT;
> > > > +
> > > > +     /* Initial DSI configuration register set */
> > > > +     ssd2825_write_reg(priv, SSD2825_CONFIGURATION_REG, config);
> > > > +     ssd2825_write_reg(priv, SSD2825_VC_CTRL_REG, 0);
> > > > +
> > > > +     priv->enabled =3D true;
> > > > +}
> > > > +
> > > > +static void ssd2825_bridge_atomic_enable(struct drm_bridge *bridge=
,
> > > > +                                      struct drm_atomic_state *sta=
te)
> > > > +{
> > > > +     /* placeholder */
> > > > +}
> > >
> > > That doesn't work with any bridge or panel that doesn't require any D=
CS
> > > command to power up, unfortunately.
> >
> > Yes that is a flaw unfortunately, if you have suggestions of fixing
> > this just tell me.
>
> Untangle pre_enable and enable from transfer, and in enable actually
> enable the bridge, and it will work just fine.
>

No it will not, I have tried and panel fails cause panel hw is init in
pre-enable and init sequence is sent in enable, which is expected
logic. Yet bridge cannot complete configuration because panel enable
function is called AFTER bridge enable.

> Maxime
