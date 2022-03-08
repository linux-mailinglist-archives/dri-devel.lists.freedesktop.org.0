Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7894D119A
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 09:07:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7426610ECF2;
	Tue,  8 Mar 2022 08:07:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E3BA10ECF4
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 08:07:27 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id qx21so37304918ejb.13
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Mar 2022 00:07:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=hTRmIhZWYqjrPH0EVpw54MDwrT8ekspZmf47wMB3aYw=;
 b=kE/2Zq4ubM6wLrAss4WB+yDR2Ga7+Tg6UfeX2NJT/HlMuMAWaGXiRMavF/t17lVHRM
 4Pl7xgzGuBUMLCc2/txHfim0+gbpjm7A+WnDQq7HPsNPxn0RBSytOwR8lpTMnc7rDy1o
 DbKZCr98OyxM4fgoqzkh2RyhhQxlt5aUJivz8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=hTRmIhZWYqjrPH0EVpw54MDwrT8ekspZmf47wMB3aYw=;
 b=IU/+lNnQGqfgzdx1U1LoXEIO8NbrnzKMBhIs1I/dvRWMS1ahPnALCX1aeSo8okmjPE
 uzkaWcYxQw+0ynSAnhJpK379XniaIz+M1eu9WujVah2I+os/6UEU+3dq52VCSZtOdxsF
 vIiWAQ0belEzQyB2RNaiVzyS0g+7MzdJvRg+LvqEme+ipXJ2OvrN3j2KCV+UoRzqQr0C
 E7OCatWHNseimaxakqr98mSRRkgimtGwlchVVj9vAOC4npfSXLseLVvbBr5oWK7VIVUH
 0NG+upEZkfouxNGsnrEd23/JS+zg2eBvO/49ZCjyxryPm4ImFsoktikxQRReRl+3VLdI
 L8FQ==
X-Gm-Message-State: AOAM5327T98UgNY61TjWK+WpoD7+wLmtvu2c4kisqYAlDWHrUHpVKzqk
 mTk6taqdaj0MjLjxsYP77G25VDYSM8kxVewY0idtpw==
X-Google-Smtp-Source: ABdhPJwo/568jV96cTIv1DducK/hF1ZeWvV9F6rLLnNf9O7UDfN+V4Qo3qA9iPWbURbD1rDhluH8LA+BLJ4npV1epxM=
X-Received: by 2002:a17:907:6ea1:b0:6d6:f910:5141 with SMTP id
 sh33-20020a1709076ea100b006d6f9105141mr12276115ejc.123.1646726845604; Tue, 08
 Mar 2022 00:07:25 -0800 (PST)
MIME-Version: 1.0
References: <20220304002508.75676-1-marex@denx.de>
 <20220304002508.75676-7-marex@denx.de>
In-Reply-To: <20220304002508.75676-7-marex@denx.de>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Tue, 8 Mar 2022 13:37:14 +0530
Message-ID: <CAMty3ZBpb55wB+1PKmmmZoZxjm3epmhhRtrx1p0wHQo_Gm7pnA@mail.gmail.com>
Subject: Re: [PATCH V3 06/13] drm: bridge: icn6211: Add generic DSI-to-DPI PLL
 configuration
To: Marek Vasut <marex@denx.de>
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
Cc: Robert Foss <robert.foss@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 Maxime Ripard <maxime@cerno.tech>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 4, 2022 at 5:55 AM Marek Vasut <marex@denx.de> wrote:
>
> The chip contains fractional PLL, however the driver currently hard-codes
> one specific PLL setting. Implement generic PLL parameter calculation cod=
e,
> so any DPI panel with arbitrary pixel clock can be attached to this bridg=
e.
>
> The datasheet for this bridge is not available, the PLL behavior has been
> inferred from [1] and [2] and by analyzing the DPI pixel clock with scope=
.
> The PLL limits might be wrong, but at least the calculated values match a=
ll
> the example code available. This is better than one hard-coded pixel cloc=
k
> value anyway.
>
> [1] https://github.com/rockchip-linux/kernel/blob/develop-4.19/drivers/gp=
u/drm/bridge/icn6211.c
> [2] https://github.com/tdjastrzebski/ICN6211-Configurator
>
> Acked-by: Maxime Ripard <maxime@cerno.tech>
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Jagan Teki <jagan@amarulasolutions.com>
> Cc: Maxime Ripard <maxime@cerno.tech>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> To: dri-devel@lists.freedesktop.org
> ---
> V2: Rebase on next-20220214
> V3: Add AB from Maxime
> ---
>  drivers/gpu/drm/bridge/chipone-icn6211.c | 87 +++++++++++++++++++++++-
>  1 file changed, 84 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/chipone-icn6211.c b/drivers/gpu/drm/b=
ridge/chipone-icn6211.c
> index df8e75a068ad0..71c83a18984fa 100644
> --- a/drivers/gpu/drm/bridge/chipone-icn6211.c
> +++ b/drivers/gpu/drm/bridge/chipone-icn6211.c
> @@ -163,6 +163,87 @@ static inline int chipone_dsi_write(struct chipone *=
icn,  const void *seq,
>                 chipone_dsi_write(icn, d, ARRAY_SIZE(d));       \
>         }
>
> +static void chipone_configure_pll(struct chipone *icn,
> +                                 const struct drm_display_mode *mode)
> +{
> +       unsigned int best_p =3D 0, best_m =3D 0, best_s =3D 0;
> +       unsigned int delta, min_delta =3D 0xffffffff;
> +       unsigned int freq_p, freq_s, freq_out;
> +       unsigned int p_min, p_max;
> +       unsigned int p, m, s;
> +       unsigned int fin;
> +
> +       /*
> +        * DSI clock lane frequency (input into PLL) is calculated as:
> +        *  DSI_CLK =3D mode clock * bpp / dsi_data_lanes / 2
> +        * the 2 is there because the bus is DDR.
> +        *
> +        * DPI pixel clock frequency (output from PLL) is mode clock.
> +        *
> +        * The chip contains fractional PLL which works as follows:
> +        *  DPI_CLK =3D ((DSI_CLK / P) * M) / S
> +        * P is pre-divider, register PLL_REF_DIV[3:0] is 2^(n+1) divider
> +        *                   register PLL_REF_DIV[4] is extra 1:2 divider
> +        * M is integer multiplier, register PLL_INT(0) is multiplier
> +        * S is post-divider, register PLL_REF_DIV[7:5] is 2^(n+1) divide=
r
> +        *
> +        * It seems the PLL input clock after applying P pre-divider have
> +        * to be lower than 20 MHz.
> +        */
> +       fin =3D mode->clock * mipi_dsi_pixel_format_to_bpp(icn->dsi->form=
at) /

no dsi in chipone structure. please preserve format during the probe.

drivers/gpu/drm/bridge/chipone-icn6211.c:193:61: error: =E2=80=98struct
chipone=E2=80=99 has no member named =E2=80=98dsi=E2=80=99
  193 |         fin =3D mode->clock *
mipi_dsi_pixel_format_to_bpp(icn->dsi->format) /

Thanks,
Jagan.
