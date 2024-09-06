Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A135896F68E
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2024 16:20:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85CF910E0B4;
	Fri,  6 Sep 2024 14:20:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=thaumatec-com.20230601.gappssmtp.com header.i=@thaumatec-com.20230601.gappssmtp.com header.b="SLkW9obU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 825A710E0B4
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2024 14:20:41 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-2f406034874so24755691fa.1
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Sep 2024 07:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=thaumatec-com.20230601.gappssmtp.com; s=20230601; t=1725632440; x=1726237240;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EyrXtbzfkJ2qcMutIVumsIJniKM+4zkeN/47MqaDQFQ=;
 b=SLkW9obUlItNEd90B6iQsmOquV8EMiz1x4SNM2x87CupOkq/VaEZQ0wxAlUjpcxK8p
 i6X+v0F6MXNOn78Ww2qEsVdhiCVJ3VuHZcvplHMk8e7IoTzEn+SxSEbm2GZdIVFF6FDa
 nH/Njh1CjeV/T2ofTuMykNayEQRXG/LgoVItpxsiMKJ3EXT4nCKYHa7Y7D35LPJcVpKA
 X8yvedbifTgAwWfT4U1b5rWVmgbkEP6tAVIctvvc+xlilhGZopZsOtDaPbBMvIv25n/u
 dpIEPvXN5Fr+e+Z2uyOjLu/eJ0iWLr0+kXXn+84be3MN8CdS9QkYvDr28jD/9ZJ0sGfM
 INnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725632440; x=1726237240;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EyrXtbzfkJ2qcMutIVumsIJniKM+4zkeN/47MqaDQFQ=;
 b=iGX3H2qYXureVZove8eFg6YZXCFgngQBvQg/Wb9M/XHdJz1DPBnVtSVf2ABeuQC1kb
 xJU8fYO1m0YmYTSVL+CQFZXzFvtVZmnjWbPwkMXGcImX2wUwUgBewkog48JwcTRIGx56
 INkSrZYA0k0z5LCPp4CQaxCAWuUar835D+6IoHBL/W19dUQ7tW+43nrE8Ek4uzSxWvHA
 CfdF3/LVoGjQ5r2XTBRCFhp77FOIIlzCRLmDknu12H8DXzj49bVYKcVLW5FbPxtsT5Tw
 N426KB6QTgzHr7SiDpr2jX4FNplo1gc7hSXkTBNKHJTnQ6PrDoptdtAwBcU1KPPSt++l
 HSbQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXNdx86gKVrBtbkm/UFN1Nx/3/sKvzPeGfDvn0lS2mDnqZb+DXAHqEIDtasY/XTYiGM13cEnnskUOc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxVGXduw41nHLV941PRVBX5l4ya9aKOyTvHmKAaii1s1sbZUCzf
 wusYcOVz9TUufbvUlFjBpCkCly4gQmvfIub1e4AOFksGmI7eCmwCjNqHnnL1q8V84v818DQto/a
 I+3TIEJr2PbgrRpzTe9rSF7WvxViCu896QmvPKg==
X-Google-Smtp-Source: AGHT+IHtrjIX9SiVNRlY+i3UMGuEvIPbzq+NyW1Z8vRRgxniTG/aS0jGvGsF6c1SbfkZ6JVW1koyRlbyba/UViBbpEs=
X-Received: by 2002:a2e:a587:0:b0:2f7:52c5:b67 with SMTP id
 38308e7fff4ca-2f752c50e4amr17556431fa.29.1725632439382; Fri, 06 Sep 2024
 07:20:39 -0700 (PDT)
MIME-Version: 1.0
References: <20240506-tc358775-fix-powerup-v1-0-545dcf00b8dd@kernel.org>
 <20240506-tc358775-fix-powerup-v1-9-545dcf00b8dd@kernel.org>
In-Reply-To: <20240506-tc358775-fix-powerup-v1-9-545dcf00b8dd@kernel.org>
From: Daniel Semkowicz <dse@thaumatec.com>
Date: Fri, 6 Sep 2024 16:20:28 +0200
Message-ID: <CAHgnY3=KCD4gyJ4nL6nN1tvWcsiRQL+Oz11RNOniDdyMoEPcSg@mail.gmail.com>
Subject: Re: [PATCH 09/20] drm/bridge: tc358775: remove complex vsdelay
 calculation
To: Michael Walle <mwalle@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Sam Ravnborg <sam@ravnborg.org>, 
 Vinay Simha BN <simhavcs@gmail.com>, Tony Lindgren <tony@atomide.com>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org
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

Hello Michael,

On Mon, May 6, 2024 at 3:35=E2=80=AFPM Michael Walle <mwalle@kernel.org> wr=
ote:
>
> To cite the datasheet on VSDELAY:
>   During DSI link speed is slower than that of LVDS link=E2=80=99s, data =
needs
>   to be buffer within 775XBG before outputting to prevent data from
>   underflow. Register field VPCTRL[VSDELAY] is used to for this purpose
>
> This driver assumes that the DSI link speed is the pixel clock (as does
> every DSI bridge driver), after all the LVDS clock is derived from the
> DSI clock. Thus we know for a fact, that the DSI link is not slower than
> the LVDS side. Just use the (sane) default value of the bridge and drop
> the complicated calculation here.

I am not convinced this is a good idea to revert to a default
VSdelay value. I tested your patch series with RK3399 platform
and default value (5) was not enough there. There was small data
underflow visible, resulting in display offset. Removing this patch
and using the original calculation formula fixed the problem.
The calculated VSDELAY value seems to be a lot bigger than required,
but keeps us on the safe side.

It looks that hback-porch value for panel is used also on DSI link,
effectively delaying hactive data delivered to TC358775 bridge.
I suspect this causes the requirement for higher VSDELAY.

>
> While at it, replace the TC358775_VPCTRL_MSF() and
> TC358775_VPCTRL_OPXLFMT() inline functions by the usual macros for a bit
> flag.
>
> Signed-off-by: Michael Walle <mwalle@kernel.org>
> ---
>  drivers/gpu/drm/bridge/tc358775.c | 49 +++++++--------------------------=
------
>  1 file changed, 8 insertions(+), 41 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/tc358775.c b/drivers/gpu/drm/bridge/t=
c358775.c
> index 54aea58a3406..a9d731e87970 100644
> --- a/drivers/gpu/drm/bridge/tc358775.c
> +++ b/drivers/gpu/drm/bridge/tc358775.c
> @@ -109,7 +109,9 @@
>  #define RDPKTLN         0x0404  /* Command Read Packet Length */
>
>  #define VPCTRL          0x0450  /* Video Path Control */
> -#define EVTMODE                BIT(5)  /* Video event mode enable, tc358=
76x only */
> +#define VPCTRL_MSF     BIT(0)
> +#define VPCTRL_OPXLFMT BIT(8)
> +#define VPCTRL_EVTMODE BIT(5)  /* Video event mode enable, tc35876x only=
 */
>  #define HTIM1           0x0454  /* Horizontal Timing Control 1 */
>  #define HTIM2           0x0458  /* Horizontal Timing Control 2 */
>  #define VTIM1           0x045C  /* Vertical Timing Control 1 */
> @@ -187,30 +189,6 @@ enum {
>
>  #define L0EN BIT(1)
>
> -#define TC358775_VPCTRL_VSDELAY__MASK  0x3FF00000
> -#define TC358775_VPCTRL_VSDELAY__SHIFT 20
> -static inline u32 TC358775_VPCTRL_VSDELAY(uint32_t val)
> -{
> -       return ((val) << TC358775_VPCTRL_VSDELAY__SHIFT) &
> -                       TC358775_VPCTRL_VSDELAY__MASK;
> -}
> -
> -#define TC358775_VPCTRL_OPXLFMT__MASK  0x00000100
> -#define TC358775_VPCTRL_OPXLFMT__SHIFT 8
> -static inline u32 TC358775_VPCTRL_OPXLFMT(uint32_t val)
> -{
> -       return ((val) << TC358775_VPCTRL_OPXLFMT__SHIFT) &
> -                       TC358775_VPCTRL_OPXLFMT__MASK;
> -}
> -
> -#define TC358775_VPCTRL_MSF__MASK      0x00000001
> -#define TC358775_VPCTRL_MSF__SHIFT     0
> -static inline u32 TC358775_VPCTRL_MSF(uint32_t val)
> -{
> -       return ((val) << TC358775_VPCTRL_MSF__SHIFT) &
> -                       TC358775_VPCTRL_MSF__MASK;
> -}
> -
>  #define TC358775_LVCFG_PCLKDIV__MASK   0x000000f0
>  #define TC358775_LVCFG_PCLKDIV__SHIFT  4
>  static inline u32 TC358775_LVCFG_PCLKDIV(uint32_t val)
> @@ -350,7 +328,6 @@ static void tc_bridge_enable(struct drm_bridge *bridg=
e)
>         u32 hback_porch, hsync_len, hfront_porch, hactive, htime1, htime2=
;
>         u32 vback_porch, vsync_len, vfront_porch, vactive, vtime1, vtime2=
;
>         unsigned int val =3D 0;
> -       u16 dsiclk, clkdiv, byteclk, t1, t2, t3, vsdelay;
>         struct drm_display_mode *mode;
>         struct drm_connector *connector =3D get_connector(bridge->encoder=
);
>
> @@ -398,27 +375,17 @@ static void tc_bridge_enable(struct drm_bridge *bri=
dge)
>
>         /* Video event mode vs pulse mode bit, does not exist for tc35877=
5 */
>         if (tc->type =3D=3D TC358765)
> -               val =3D EVTMODE;
> +               val =3D VPCTRL_EVTMODE;
>         else
>                 val =3D 0;
>
>         if (tc->bpc =3D=3D 8)
> -               val |=3D TC358775_VPCTRL_OPXLFMT(1);
> +               val |=3D VPCTRL_OPXLFMT;
>         else /* bpc =3D 6; */
> -               val |=3D TC358775_VPCTRL_MSF(1);
> -
> -       dsiclk =3D mode->crtc_clock * 3 * tc->bpc / tc->num_dsi_lanes / 1=
000;
> -       clkdiv =3D dsiclk / (tc->lvds_link =3D=3D DUAL_LINK ? DIVIDE_BY_6=
 : DIVIDE_BY_3);
> -       byteclk =3D dsiclk / 4;
> -       t1 =3D hactive * (tc->bpc * 3 / 8) / tc->num_dsi_lanes;
> -       t2 =3D ((100000 / clkdiv)) * (hactive + hback_porch + hsync_len +=
 hfront_porch) / 1000;
> -       t3 =3D ((t2 * byteclk) / 100) - (hactive * (tc->bpc * 3 / 8) /
> -               tc->num_dsi_lanes);
> -
> -       vsdelay =3D (clkdiv * (t1 + t3) / byteclk) - hback_porch - hsync_=
len - hactive;
> +               val |=3D VPCTRL_MSF;
>
> -       val |=3D TC358775_VPCTRL_VSDELAY(vsdelay);
> -       regmap_write(tc->regmap, VPCTRL, val);
> +       regmap_update_bits(tc->regmap, VPCTRL, val,
> +                          VPCTRL_OPXLFMT | VPCTRL_MSF | VPCTRL_EVTMODE);
>
>         regmap_write(tc->regmap, HTIM1, htime1);
>         regmap_write(tc->regmap, VTIM1, vtime1);
>
> --
> 2.39.2
>

Kind regards
Daniel
