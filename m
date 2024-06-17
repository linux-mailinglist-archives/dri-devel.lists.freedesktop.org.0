Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5CE290AF47
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 15:29:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D603510E3CA;
	Mon, 17 Jun 2024 13:29:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="E4TvE328";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA64F10E3CE
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 13:29:10 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id
 41be03b00d2f7-6c5bcb8e8edso3536608a12.2
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 06:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718630950; x=1719235750; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u9q+Z4GD9MpvcYkpXfGOgXbR7/P8MYbKwiRSUUKubKM=;
 b=E4TvE328Z9zM1pqVu4VEsBV2B6EorRbCudC+felHCzWSkQCIzWSL9wrDtX0aCA3QNB
 o6xBNO5+/FHBZSaCdtFYGyqNTgmXtnkdiwHKLbCKeJrZNZZuwMsVPWytgzvcvbRk/a/9
 RaPiYBMVFVk/tN+dpioSVA81j3cbwm/02saW2mRP/Fc9d1BET8UB5CvU/FlZBoBbHgFp
 wUAS6oiCWOeLLi7UgZX8colQoVCc7Y7aIYx8+ZsJAPaqaDr7uQk/fNxV7Zc5vGDej3TI
 wS/SKqLvHpEMNkXBYGAcYU+223jorh+0O9LOl+6poOtjInt2ej35jMDDan7+Hiu2BAHA
 VxXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718630950; x=1719235750;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u9q+Z4GD9MpvcYkpXfGOgXbR7/P8MYbKwiRSUUKubKM=;
 b=NHMEgMQ/RCMqKXB8Hnnk9qz+NsZ94S1wNiJpI8NLDno5hjKVgcUuIu2PRc5bG6Gdya
 cXwkyy+dr34qO1+ukhCkCuyvYK3PQdV+a9w8jO8cijy+c078ijJOEDx7nmvflAjYzZ0H
 eVGjYPfsbKqdb686G8+sknC45IyPB/ICF1cCvks7TB3j/jvrdiCHcUS/8oW367mYVZi/
 ac4OwvXqdI/BfZcnC2sKuWvSwClBA51+F6UsdW06CHDtv6TjOyx9Y6bj9l0/QlM2JJPJ
 F7iRMDvx1MpOhT2Gceeo+nAv8HuhtKWB3LN+z3K0fRCUmrmgrsajuFVSi9P5tk/N9Keh
 dnjg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUBkd4tVOo8wmpRtb0aQEXnYR59BzQF3U3O0CulsQPc+KpwSKNBtRaJSaN1pba2/07723akUzuCqDV4ZclNmvggb3bGnv9CAG+2DVO5Dbio
X-Gm-Message-State: AOJu0YwM1LpH5UaE/Xi4WqIJ2lYyAOvgXf9y8SOcZs9KY3Y39T6m56I4
 mjJTr7uvxX5mBxKqRbVsf/yDaYk5kNolHvJP5q3L1AFxD6fYttzqup8fzh4ivFb2G1vLFizJgMW
 8a0dZgeROqRC6QgM0XuD214tEdWw=
X-Google-Smtp-Source: AGHT+IFHNQnVqTbXey7rmOHY9zC5Gl6630C23KaIy8xKqNcUDOtRiu3TC30yfGx+t6zBKRWmGgrhzjL5YAGs06H5CPg=
X-Received: by 2002:a17:90a:2dc6:b0:2bd:f4cb:bd87 with SMTP id
 98e67ed59e1d1-2c4db24e973mr9926240a91.14.1718630949878; Mon, 17 Jun 2024
 06:29:09 -0700 (PDT)
MIME-Version: 1.0
References: <20240203165307.7806-1-aford173@gmail.com>
 <20240203165307.7806-11-aford173@gmail.com>
 <Zm_UzO4Jmm7Aykcm@atmark-techno.com>
In-Reply-To: <Zm_UzO4Jmm7Aykcm@atmark-techno.com>
From: Adam Ford <aford173@gmail.com>
Date: Mon, 17 Jun 2024 08:28:58 -0500
Message-ID: <CAHCN7xJt+1WGFYeBii1jUDEg9OU176f0AA+rMkXCqNQrfq=XWg@mail.gmail.com>
Subject: Re: drm/bridge/imx8mp-hdmi-tx: Allow inexact pixel clock frequencies
 (Was: [PATCH V8 10/12] drm/bridge: imx: add bridge wrapper driver for
 i.MX8MP DWC HDMI)
To: Dominique MARTINET <dominique.martinet@atmark-techno.com>
Cc: Lucas Stach <l.stach@pengutronix.de>, linux-arm-kernel@lists.infradead.org,
 marex@denx.de, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, 
 NXP Linux Team <linux-imx@nxp.com>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Liu Ying <victor.liu@nxp.com>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 Makoto Sato <makoto.sato@atmark-techno.com>
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

On Mon, Jun 17, 2024 at 1:17=E2=80=AFAM Dominique MARTINET
<dominique.martinet@atmark-techno.com> wrote:
>
> Adam Ford wrote on Sat, Feb 03, 2024 at 10:52:50AM -0600:
> > From: Lucas Stach <l.stach@pengutronix.de>
> >
> > Add a simple wrapper driver for the DWC HDMI bridge driver that
> > implements the few bits that are necessary to abstract the i.MX8MP
> > SoC integration.
>
> Hi Lucas, Adam,
> (trimmed ccs a bit)
>
> First, thank you for the effort of upstreaming all of this!! It's really
> appreciated, and with display working I'll really be wanting to upstream
> our DTS as well as soon as I have time (which is going to be a while,
> but better late than never ?)
>
> Until then, it's been a few months but I've got a question on this bit:
>
> > diff --git a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c b/drivers/gpu/=
drm/bridge/imx/imx8mp-hdmi-tx.c
> > new file mode 100644
> > index 000000000000..89fc432ac611
> > --- /dev/null
> > +++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
> > +static enum drm_mode_status
> > +imx8mp_hdmi_mode_valid(struct dw_hdmi *dw_hdmi, void *data,
> > +                    const struct drm_display_info *info,
> > +                    const struct drm_display_mode *mode)
> > +{
> > +     struct imx8mp_hdmi *hdmi =3D (struct imx8mp_hdmi *)data;
> > +
> > +     if (mode->clock < 13500)
> > +             return MODE_CLOCK_LOW;
> > +
> > +     if (mode->clock > 297000)
> > +             return MODE_CLOCK_HIGH;
> > +
> > +     if (clk_round_rate(hdmi->pixclk, mode->clock * 1000) !=3D
> > +         mode->clock * 1000)
> > +             return MODE_CLOCK_RANGE;
>
> Do you know why such a check is here?

I didn't write the original code, so I'll defer to Lucas here.  I just
tried to edit/fix issues as they were identified to get it pushed
upstream.

>
> When plugging in a screen with no frequency identically supported in its
> EDID this check causes the screen to stay black, and we've been telling
> customers to override the EDID but it's a huge pain.
>
> Commit 6ad082bee902 ("phy: freescale: add Samsung HDMI PHY") already
> "fixed" the samsung hdmi phy driver to return the next frequency if an
> exact match hasn't been found (NXP tree's match frequencies exactly, but
> this gets the first clock with pixclk <=3D rate), so if this check is als=
o
> relaxed our displays would work out of the box.

Are you proposing to replace 'return MODE_CLOCK_RANGE' with a printed warni=
ng?

>
> I also don't see any other bridge doing this kind of check.
> drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c has a similar check with a
> 0.5% leeway, and all the other drivers don't check anything.
> If you want to add some level of safety, I think we could make this work
> with a 5% margin easily... Printing a warning in dmesg could work if
> you're worried about artifacts, but litteraly anything is better than a
> black screen with no error message in my opinion.
>
>
> In practice the screen I'm looking at has an EDID which only supports
> 51.2MHz and the closest frequency supported by the Samsung HDMI phy is
> 50.4MHz, so that's a ~1.5% difference and it'd be great if it could work
> out of the box.

I wonder if the HDMI PHY could be improved to better dynamically
calculate values instead of the look tables.

adam
>
> For reference, the output of edid-decode is as follow:
> ---
> edid-decode /sys/devices/platform/display-subsystem/drm/car
> d1/card1-HDMI-A-1/edid
> edid-decode (hex):
>
> 00 ff ff ff ff ff ff 00 3a 49 03 00 01 00 00 00
> 20 1e 01 03 80 10 09 00 0a 00 00 00 00 00 00 00
> 00 00 00 00 00 00 01 01 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 00 14 00 40 41 58 23 20 a0 20
> c8 00 9a 56 00 00 00 18 00 00 00 10 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 10 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 10
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 9a
>
> ----------------
>
> Block 0, Base EDID:
>   EDID Structure Version & Revision: 1.3
>   Vendor & Product Identification:
>     Manufacturer: NRI
>     Model: 3
>     Serial Number: 1
>     Made in: week 32 of 2020
>   Basic Display Parameters & Features:
>     Digital display
>     Maximum image size: 16 cm x 9 cm
>     Gamma: 1.00
>     RGB color display
>     First detailed timing is the preferred timing
>   Color Characteristics:
>     Red  : 0.0000, 0.0000
>     Green: 0.0000, 0.0000
>     Blue : 0.0000, 0.0000
>     White: 0.0000, 0.0000
>   Established Timings I & II: none
>   Standard Timings: none
>   Detailed Timing Descriptors:
>     DTD 1:  1024x600    59.993 Hz 128:75   38.095 kHz  51.200 MHz (154 mm=
 x 86 m
> m)
>                  Hfront  160 Hsync  32 Hback 128 Hpol N
>                  Vfront   12 Vsync   8 Vback  15 Vpol N
>     Dummy Descriptor:
>     Dummy Descriptor:
>     Dummy Descriptor:
> Checksum: 0x9a
> ---
>
>
> Thanks,
> --
> Dominique Martinet
>
>
>
> --
> linux-phy mailing list
> linux-phy@lists.infradead.org
> https://lists.infradead.org/mailman/listinfo/linux-phy
