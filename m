Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D4304FBBF6
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 14:23:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EEE810E10E;
	Mon, 11 Apr 2022 12:23:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6434089C7F
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 12:23:19 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id r13so30512449ejd.5
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 05:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=p3K7UtkaAmdhk912uS6+rgvTEva2rfQRiBVV1ZuGdMU=;
 b=HuRiT0ANWZP6UjYHsieS+X9qE6PsH2PKM2SYytRq+JFCv0R5RmnbZtuIb92jaMAoA1
 CU1bYkB3vNDTzZhz5mTVdtOwAz/kBMmW2V0WjEB9KnIF7nsso4pHx5fe6Cf+2yas0d3p
 12eO3FxEv3QPW+wOKls+pOMVwIyanCa3i8T7cECKjMQdHGPXPSppHr9Ujv3eoq4Qnn4i
 vjK2BWfvTsuxFdfa/au0BoitJtj8X4J+WNwPbS9JyHoZm6goW06I2+5LHI6YzJn+AFJO
 Ro1+PhAntdQIxLZyVewl/V4cB2fXIAysnGi1g3KAJMTD+SWNbYmxOsapExdpoPprZ8uJ
 fWRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=p3K7UtkaAmdhk912uS6+rgvTEva2rfQRiBVV1ZuGdMU=;
 b=EOFO0ad2Jhruk6rn5bLRDfXuDAkIMcMMKNDmUkrCS0y7XWR+IZsi7z2kW+cP/XLAA7
 s3V9lJ29nwWkRRwdN5wvBqB6v7z0XQo7V4LL0knuolZlFqZCzrm5fKqhBYiX5AlvGSSQ
 lg2r4wOCBbdwrpGfxvhyF/D6Z5xMRl/77fgMmJVrWyeNcbLY0BBZ1RNaoVRk1XAhuUW2
 XEX9y+ShxCw1z5NohBU8l31oTGnIA6j2eC4Pqicrs/i2TofUUKFgbw6tjShHJREQyrXq
 abtC4eVht/vwjp5KhIRUGx/TPhlMHW7uyYbXPdhI4FPhVax3g7QKtdL8jk67n0eJhro0
 DLAA==
X-Gm-Message-State: AOAM530DIIK+WeO4UpwwtN4C19Htu+0YI5V7DtTG+26Eg6JNPrdWb+SG
 5FzKvS8gOTBhZIy/YHliIUPjO/LucWQLw/JfgkI=
X-Google-Smtp-Source: ABdhPJzsx8ixnvvwZcOQCCytMaslcnBviduIWhYCyNcWaDzDXQGHfmdS2Pi2TSFE/QDGHSZVNBuOgw3JW5mhtnvztq0=
X-Received: by 2002:a17:907:7b8b:b0:6e8:9dd9:59ac with SMTP id
 ne11-20020a1709077b8b00b006e89dd959acmr1655923ejc.588.1649679797613; Mon, 11
 Apr 2022 05:23:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220408162108.184583-1-jagan@amarulasolutions.com>
 <20220408162108.184583-5-jagan@amarulasolutions.com>
In-Reply-To: <20220408162108.184583-5-jagan@amarulasolutions.com>
From: Adam Ford <aford173@gmail.com>
Date: Mon, 11 Apr 2022 07:23:06 -0500
Message-ID: <CAHCN7xJmiEBsbZRepsM0FLd8YDSQj8GUwwyYm4M_ViJFPoU8FQ@mail.gmail.com>
Subject: Re: [PATCH 04/11] drm: bridge: samsung-dsim: Add DSI init in bridge
 pre_enable()
To: Jagan Teki <jagan@amarulasolutions.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 devicetree <devicetree@vger.kernel.org>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, NXP Linux Team <linux-imx@nxp.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Fancy Fang <chen.fang@nxp.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 arm-soc <linux-arm-kernel@lists.infradead.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 8, 2022 at 11:22 AM Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> Host transfer() in DSI master will invoke only when the DSI commands
> are sent from DSI devices like DSI Panel or DSI bridges and this
> host transfer wouldn't invoke for I2C-based-DSI bridge drivers.
>
> Handling DSI host initialization in transfer calls misses the
> controller setup for I2C configured DSI bridges.
>
> This patch adds the DSI initialization from transfer to bridge
> pre_enable as the bridge pre_enable API is invoked by core as
> it is common across all classes of DSI device drivers.
>
> v1:
> * keep DSI init in host transfer
>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
>  drivers/gpu/drm/bridge/samsung-dsim.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
> index ff05c8e01cff..3e12b469dfa8 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -1290,6 +1290,13 @@ static void samsung_dsim_atomic_pre_enable(struct drm_bridge *bridge,
>         }
>
>         dsi->state |= DSIM_STATE_ENABLED;
> +
> +       if (!(dsi->state & DSIM_STATE_INITIALIZED)) {
> +               ret = samsung_dsim_init(dsi);
> +               if (ret)
> +                       return;
> +               dsi->state |= DSIM_STATE_INITIALIZED;

Out of curiosity, is there a reason that  dsi->state cannot add
DSIM_STATE_INITIALIZED inside the samsung_dsim_init function call?  It
seems to me that if samsung_dsim_init returns successfully, it should
set that flag.  I don't know if it's called from other places or not.

adam
> +       }
>  }
>
>  static void samsung_dsim_atomic_enable(struct drm_bridge *bridge,
> --
> 2.25.1
>
