Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA0394998D
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2024 22:49:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 512D810E403;
	Tue,  6 Aug 2024 20:49:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=googlemail.com header.i=@googlemail.com header.b="S5Mk2v4T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56FE710E403
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2024 20:49:52 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-1fd69e44596so1893975ad.1
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Aug 2024 13:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1722977392; x=1723582192;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bOb7yzxJR8v2Ep13bBP5suT1y7mTdVA2Wy56PSiUs5w=;
 b=S5Mk2v4Tld75+ehtAs5UTqqP1fMTnSZKEVs18CxudNldQxap7ByYNkqsKvIl5NKZWN
 6ZObPhcetKOCyf5h4QLRsvAw4bupnHGJHkQ299lqJQpDBU2DRhQ3fFW+1xyvIr6h5pPU
 4kFi6Vo2XXB99tuFauEiXajgfndl4SFJQgk+eYBO1JOEDEFMEoW1YlH4teNHB0e9BIfI
 1gBp5rTR0XRXf5d+/bFf3/2c2Pq8eNntFYy7aQRO2AdO3pVZAk8wwOmZP0O6sCklNA/u
 LG3qBCoJz9NNHS9iyI5uEJT3RYlxiq9n+nsSNHnqgsaAseD4/13BZv19jY2vzoMthtq+
 Vhzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722977392; x=1723582192;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bOb7yzxJR8v2Ep13bBP5suT1y7mTdVA2Wy56PSiUs5w=;
 b=m8L2cmmhPOFQslvYoiGFbOIl/NyH/IdADGN+Mwg0MdenKe/56rptkDr/Xa/UZJa2yY
 RY0F0iTCaDV5pc1JycDJq4gUPYg4LnwgXo37mNjPf9/CzKRNayRqrk949SlFoMuWxZ0B
 JzE4Xm4VwK8THegPzOpyHohpeutm+QXBRCBQ8k0mxEXsxZyi00bkWzdzCszjkIg2lsz2
 RB9jLNVx4W/lf91lYQI/bAbt0enU9LfHRwJAEWjb/mLNe+d9HD9mgxh8cOksYIP+Cl8j
 cgykmtMZSHlA6Yr+eip5klCVXsDIcoLQJAFMrTdX4GiGF6gPPc1SHczQlfx2I+rfoVEU
 jifg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUkpMa6lni4bs40Jixm/qKazWNexa8+c6HYpDn0PzdWlGg37P4l6HLIw3nwVSxpifNQFZ8kvks7qcz8fIfkSrDsGGoFYTqzwq0/jXh8Zj7n
X-Gm-Message-State: AOJu0Yx+im4cgZUNqlkSkdYZa1q4gGKjCTC56lbmWhl7BjyuOUktoXyn
 Ijvu4I7MeEiB6oh6gfjjGokGPtBkpMySR39hM+JnALMVzshkAx7xIJL9GuUyN+qiH6fdgbfpvWU
 ybax641qxJbKSkNfLwQmzEw5Mmcg=
X-Google-Smtp-Source: AGHT+IEWfPRU2iaveYmuat0ybCTueo7tRCzgALc58m0y0WIi4uI64eQxtPbB6Cb9+AleElQR9RrKgLFpgvj4b6HwZRI=
X-Received: by 2002:a17:902:ec86:b0:1ff:39d7:a1c4 with SMTP id
 d9443c01a7336-2008552d030mr595535ad.25.1722977391739; Tue, 06 Aug 2024
 13:49:51 -0700 (PDT)
MIME-Version: 1.0
References: <20240730125023.710237-1-jbrunet@baylibre.com>
 <20240730125023.710237-6-jbrunet@baylibre.com>
In-Reply-To: <20240730125023.710237-6-jbrunet@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 6 Aug 2024 22:49:40 +0200
Message-ID: <CAFBinCCvWFCCvb9gPvv0-eudG=iuKROk5rPSiorKTnHcToDfTQ@mail.gmail.com>
Subject: Re: [PATCH 5/9] drm/meson: dw-hdmi: split resets out of hw init.
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Kevin Hilman <khilman@baylibre.com>, dri-devel@lists.freedesktop.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
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

Hi Jerome,

On Tue, Jul 30, 2024 at 2:50=E2=80=AFPM Jerome Brunet <jbrunet@baylibre.com=
> wrote:
>
> This prepares the migration to regmap usage.
>
> To properly setup regmap, the APB needs to be in working order.
> This is easier handled if the resets are not mixed with hw init.
>
> More checks are required to determine if the resets are needed
> on resume or not. Add a note for this.
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  drivers/gpu/drm/meson/meson_dw_hdmi.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meso=
n/meson_dw_hdmi.c
> index 5cd3264ab874..47aa3e184e98 100644
> --- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
> +++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> @@ -581,11 +581,6 @@ static void meson_dw_hdmi_init(struct meson_dw_hdmi =
*meson_dw_hdmi)
>         /* Bring HDMITX MEM output of power down */
>         regmap_update_bits(priv->hhi, HHI_MEM_PD_REG0, 0xff << 8, 0);
>
> -       /* Reset HDMITX APB & TX & PHY */
> -       reset_control_reset(meson_dw_hdmi->hdmitx_apb);
> -       reset_control_reset(meson_dw_hdmi->hdmitx_ctrl);
> -       reset_control_reset(meson_dw_hdmi->hdmitx_phy);
> -
>         /* Enable APB3 fail on error */
>         if (!meson_vpu_is_compatible(priv, VPU_COMPATIBLE_G12A)) {
>                 writel_bits_relaxed(BIT(15), BIT(15),
> @@ -675,6 +670,10 @@ static int meson_dw_hdmi_bind(struct device *dev, st=
ruct device *master,
>                 return PTR_ERR(meson_dw_hdmi->hdmitx_phy);
>         }
>
> +       reset_control_reset(meson_dw_hdmi->hdmitx_apb);
> +       reset_control_reset(meson_dw_hdmi->hdmitx_ctrl);
> +       reset_control_reset(meson_dw_hdmi->hdmitx_phy);
The old out of tree vendor driver [0] enables the "isfr" and "iahb"
(in P_HHI_HDMI_CLK_CNTL and P_HHI_GCLK_MPEG2) clocks before triggering
the resets.
Previously meson_dw_hdmi's behavior was identical as it enabled the
clocks in meson_dw_hdmi_bind() and only later triggered the resets.

I'm totally fine with moving the resets to meson_dw_hdmi_bind() but I
think it should happen after devm_clk_bulk_get_all_enable() has been
called (to keep the order and thus avoid side-effects that we don't
know about yet).

Also out of curiosity: are you planning to convert the driver to use
devm_reset_control_bulk_get_exclusive()?


Best regards,
Martin


[0] https://github.com/endlessm/linux-s905x/blob/master/drivers/amlogic/hdm=
i/hdmi_tx_20/hw/hdmi_tx_hw.c#L470
