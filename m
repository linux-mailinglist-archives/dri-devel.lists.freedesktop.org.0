Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF6D5E6ADC
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 20:27:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5696D10E27E;
	Thu, 22 Sep 2022 18:27:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DA0410E27E
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 18:27:05 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id q3so10637415pjg.3
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 11:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=P2G+h7SMpgZAj0ir+cJJ3OrD93Kkyvw6av5m2/MqFrU=;
 b=EPPhzxlxohXjUEfjcoxBXBc2UpUI4B+r6Z/jngunTL0ICZiBTmGkOrX14rPtWysqEm
 hS2JQF9VSOQDmp1k32CpZI96IrRwOz7OtAaxDQnZMVDOQssBj/cEdTIzXFPP7WVQ+9sY
 9kwPJ8ZWPySmPsQ0rHoNML0SmSq+1q9CMp1gdems2EGTmYmxSlF5UYyZiX2Ckq+/gc8E
 OWZOUEdOWI/4UjRA7zo+Kbeen9ns9/AJsRS56rWLrae9D0IF3yHpa8vNkdeY6QIyQr6q
 rBCx4Skwvgy/b6Tx7Gk7XQLKEMV9S9mCh5EvC5ut/FVRcESOAKGAwHxt1k+4hviHkKZh
 Qk1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=P2G+h7SMpgZAj0ir+cJJ3OrD93Kkyvw6av5m2/MqFrU=;
 b=Qu7jCSDcf08P4SrUdGakdQKM0egdmOR496ILTEJIKho1lMcXCVEk1IPKzRYKvHdbRd
 cKtq6qKlQbexw0m1y9r3NPyCsHeUFZF8YJtynhy3qPu2e1WSVz1HeN9XwFNZHqmbVmu/
 iGkhS2TjkMMRy1FHFfpwheKGhOEUxHFuRewxOtHy65jEJVgNCPQhkmV/jroZelbGHiXH
 sUawrxSuC1syMIv5ymTaiRUa7Ub5wlD7krfU6Am/rOCyyXnZ1MHjmNR0SbCYZvXV3Iwr
 jpu4uMtMl5B82TND9pwdoXRSjIuznB8mtDHn1pEf4YXkHr1a+BU4ABd4ojfUQ/h61qoT
 BxSg==
X-Gm-Message-State: ACrzQf3EcCaHYiK/1ZmFIFnwyjv031UibQgCuTy4jyOd3Kwsk3FTuRLK
 D0DKWV+J2iX2WY5FpREqNOBn3gnYpfvGptVHVt8=
X-Google-Smtp-Source: AMsMyM47BxQFdeBclVFiRtxk1u1ErC3IOjGokQDFqiBDOYs8TbykT/gHzd/h2/dPblMPFgtU0qos6JQnYOYYO3L4acg=
X-Received: by 2002:a17:902:7e83:b0:177:e667:7841 with SMTP id
 z3-20020a1709027e8300b00177e6677841mr4505384pla.18.1663871225158; Thu, 22 Sep
 2022 11:27:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220922124306.34729-1-dev@pschenker.ch>
 <20220922124306.34729-5-dev@pschenker.ch>
In-Reply-To: <20220922124306.34729-5-dev@pschenker.ch>
From: Adrien Grassein <adrien.grassein@gmail.com>
Date: Thu, 22 Sep 2022 20:26:54 +0200
Message-ID: <CABkfQAEZ1Dyqz=rh2yssq0=4sZrt9GRXJCseCQT-in7+cVrh4g@mail.gmail.com>
Subject: Re: [PATCH 4/4] drm/bridge: lt8912b: clarify lvds output status
To: Philippe Schenker <dev@pschenker.ch>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Robert Foss <robert.foss@linaro.org>,
 Philippe Schenker <philippe.schenker@toradex.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Le jeu. 22 sept. 2022 =C3=A0 14:43, Philippe Schenker <dev@pschenker.ch> a =
=C3=A9crit :
>
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
>
> Add comments on the lt8912_write_lvds_config() config to document the
> current settings and to make it clear that this is a hardcoded
> configuration not relevant for the HDMI output (could be removed without
> affecting the HDMI port).
>
> No changes on the actual register writes.
>
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> Signed-off-by: Philippe Schenker <philippe.schenker@toradex.com>
Acked-by: Adrien Grassein <adrien.grassein@gmail.com>
> ---
>
>  drivers/gpu/drm/bridge/lontium-lt8912b.c | 26 ++++++++++++++++--------
>  1 file changed, 17 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/lontium-lt8912b.c b/drivers/gpu/drm/b=
ridge/lontium-lt8912b.c
> index 5968f4af190b..3e870d45f881 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt8912b.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt8912b.c
> @@ -165,24 +165,32 @@ static int lt8912_write_rxlogicres_config(struct lt=
8912 *lt)
>         return ret;
>  };
>
> +/* enable LVDS output with some hardcoded configuration, not required fo=
r the HDMI output */
>  static int lt8912_write_lvds_config(struct lt8912 *lt)
>  {
>         const struct reg_sequence seq[] =3D {
> +               // lvds power up
>                 {0x44, 0x30},
>                 {0x51, 0x05},
> -               {0x50, 0x24},
> -               {0x51, 0x2d},
> -               {0x52, 0x04},
> -               {0x69, 0x0e},
> +
> +               // core pll bypass
> +               {0x50, 0x24}, // cp=3D50uA
> +               {0x51, 0x2d}, // Pix_clk as reference, second order passi=
ve LPF PLL
> +               {0x52, 0x04}, // loopdiv=3D0, use second-order PLL
> +               {0x69, 0x0e}, // CP_PRESET_DIV_RATIO
>                 {0x69, 0x8e},
>                 {0x6a, 0x00},
> -               {0x6c, 0xb8},
> +               {0x6c, 0xb8}, // RGD_CP_SOFT_K_EN,RGD_CP_SOFT_K[13:8]
>                 {0x6b, 0x51},
> -               {0x04, 0xfb},
> +
> +               {0x04, 0xfb}, // core pll reset
>                 {0x04, 0xff},
> -               {0x7f, 0x00},
> -               {0xa8, 0x13},
> -               {0x02, 0xf7},
> +
> +               // scaler bypass
> +               {0x7f, 0x00}, // disable scaler
> +               {0xa8, 0x13}, // 0x13: JEIDA, 0x33: VESA
> +
> +               {0x02, 0xf7}, // lvds pll reset
>                 {0x02, 0xff},
>                 {0x03, 0xcf},
>                 {0x03, 0xff},
> --
> 2.37.3
>
