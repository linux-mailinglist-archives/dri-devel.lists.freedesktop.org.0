Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C82DF487EF3
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jan 2022 23:33:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BCA510F47A;
	Fri,  7 Jan 2022 22:33:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 150E410F47A
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jan 2022 22:33:27 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id z9so27323289edm.10
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jan 2022 14:33:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8T8doFUfcR5cgStFn5ZLESZonisd/dSTdaOiy5Kb8QA=;
 b=dN/3L7Z6AJTTAnVwtOp76cHCMKCbVrV+Yelp6Q7bWAKzdu9DgwsqDDJBPIVl7NBQXw
 X98xAlhcP4PqGdDmhDbX+ml8mPsZZ4N4uqCqNzxKBuUK27Z5BITKdSKCc+K5NMOuJjQx
 kxYX9+cIGUYuQBh1Ou0R9Sq7Ab+poJcVEUv160oSRKYyQk3628c4DDL+1ssq9kfhUGFo
 UVGOzO4/Nr6chGKB5mGYmRSs2U8xpKO70Yr5fNA1pmv9OUWNyMe/VCGQlp8x7Bdvl33O
 3r2aW42EKd242AsHewkiI4SIjyvGZKqIF3IudfGie7LuOzbVgoYLKTpVbvvNLXmBRKHm
 2czg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8T8doFUfcR5cgStFn5ZLESZonisd/dSTdaOiy5Kb8QA=;
 b=3ggrm1gZl4m5N9y+ap2Az3bU2BM1L4jtgfUh6QUEL9ZETPtKBgbtWIL+qBm8pRxizE
 HzV+pE+51NnvwPtY/E4XyzA96bY8nVvBBbK976KH2jbha+d3W3a5yp02J6nr1acLEmHw
 iX5N+xnJN7y4M5lt8KF9JkiZv3ipop6u/DPSgV15e2pyCTLcfT2HZacqcJWvCmT8SqeZ
 ium+/0Qg2GUx2rkJXWzHGlVlzzL+/SZG+11v2JKKSa7DTrzjP7Mpfpc+SmFi+CaEQARR
 shBZXav3+sXM/tXzOdQmG8iOSWWxaWMRH+nbMfEDA13WxsHMsYbYFaK9HLNCRqZ7wLKV
 Phcg==
X-Gm-Message-State: AOAM532/xaNqXADdOBReFjkXZ+WvKhROOao9sSgYdItmcRUY7P7oUT2N
 JbBzaly6fVWisK54WRWEqnnkgqfwPdcXC15Qgh0=
X-Google-Smtp-Source: ABdhPJzbXsvXpgX9e6hGaq1b/+QGyt2wH0o0Y6/IEpioYHbtcG4YlIfuLJSCGmsgrIbS463oHtb9vsY4g55XDvEjWEo=
X-Received: by 2002:aa7:c7c6:: with SMTP id o6mr5089953eds.32.1641594805544;
 Fri, 07 Jan 2022 14:33:25 -0800 (PST)
MIME-Version: 1.0
References: <20220107145515.613009-1-narmstrong@baylibre.com>
 <20220107145515.613009-4-narmstrong@baylibre.com>
In-Reply-To: <20220107145515.613009-4-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 7 Jan 2022 23:33:14 +0100
Message-ID: <CAFBinCA-df8Sedqh8Arh_BsMCHYv6-Kb3owrkFBd=W_EY2qxSA@mail.gmail.com>
Subject: Re: [PATCH 3/6] drm/meson: venc: add ENCL encoder setup for MIPI-DSI
 output
To: Neil Armstrong <narmstrong@baylibre.com>
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
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

 Hi Neil,

On Fri, Jan 7, 2022 at 3:57 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> This adds supports for the ENCL encoder connected to a MIPI-DSI transceiver on the
> Amlogic AXG SoCs.
Should this be "AXG and newer SoCs" or is this really AXG specific?

[...]
> +#define GAMMA_VCOM_POL    7     /* RW */
> +#define GAMMA_RVS_OUT     6     /* RW */
> +#define ADR_RDY           5     /* Read Only */
> +#define WR_RDY            4     /* Read Only */
> +#define RD_RDY            3     /* Read Only */
> +#define GAMMA_TR          2     /* RW */
> +#define GAMMA_SET         1     /* RW */
> +#define GAMMA_EN          0     /* RW */
> +
> +#define H_RD              12
> +#define H_AUTO_INC        11
> +#define H_SEL_R           10
> +#define H_SEL_G           9
> +#define H_SEL_B           8
I think all values above can be wrapped in the BIT() macro, then you
don't need that below.

> +#define HADR_MSB          7            /* 7:0 */
> +#define HADR              0            /* 7:0 */
Here GENMASK(7, 0) can be used for HADR

Also I think prefixing all macros above with their register name
(L_GAMMA_CNTL_PORT_ or L_GAMMA_ADDR_PORT_) will make the code easier
to read.

[...]
> +       writel_relaxed(0x8000, priv->io_base + _REG(ENCL_VIDEO_MODE));
The public S905 datasheet calls 0x8000 ENCL_PX_LN_CNT_SHADOW_EN

> +       writel_relaxed(0x0418, priv->io_base + _REG(ENCL_VIDEO_MODE_ADV));
According to the public S905 datasheet this is:
- BIT(3): ENCL_VIDEO_MODE_ADV_VFIFO_EN
- BIT(4): ENCL_VIDEO_MODE_ADV_GAIN_HDTV
- BIT(10): ENCL_SEL_GAMMA_RGB_IN

> +       writel_relaxed(0x1000, priv->io_base + _REG(ENCL_VIDEO_FILT_CTRL));
I don't know the exact name but the 32-bit vendor kernel sources have
a comment [0] saying that 0x1000 is "bypass filter"
But maybe we can simply call it ENCL_VIDEO_FILT_CTRL_BYPASS_FILTER

[...]
> +       writel_relaxed(3, priv->io_base + _REG(ENCL_VIDEO_RGBIN_CTRL));
The public S905 datasheet says:
- BIT(0): USE RGB data from VIU, furthermore a comment in the 3.10
kernel sources make this more clear: bit[0] 1:RGB, 0:YUV
- BIT(1): CFG_VIDEO_RGBIN_ZBLK

> +       /* default black pattern */
> +       writel_relaxed(0, priv->io_base + _REG(ENCL_TST_MDSEL));
> +       writel_relaxed(0, priv->io_base + _REG(ENCL_TST_Y));
> +       writel_relaxed(0, priv->io_base + _REG(ENCL_TST_CB));
> +       writel_relaxed(0, priv->io_base + _REG(ENCL_TST_CR));
> +       writel_relaxed(1, priv->io_base + _REG(ENCL_TST_EN));
> +       writel_bits_relaxed(BIT(3), 0, priv->io_base + _REG(ENCL_VIDEO_MODE_ADV));
same as above: ENCL_VIDEO_MODE_ADV_VFIFO_EN

> +
> +       writel_relaxed(1, priv->io_base + _REG(ENCL_VIDEO_EN));
> +
> +       writel_relaxed(0, priv->io_base + _REG(L_RGB_BASE_ADDR));
> +       writel_relaxed(0x400, priv->io_base + _REG(L_RGB_COEFF_ADDR));
note to self: L_RGB_COEFF_ADDR seems to contain some "magic" value,
there's no further info in the 3.10 kernel sources or datasheet

> +       writel_relaxed(0x400, priv->io_base + _REG(L_DITH_CNTL_ADDR));
According to the public S905 datasheet BIT(10) is DITH10_EN (10-bits
Dithering to 8 Bits Enable).
I am not sure if this would belong to the selected video mode/bit depth.
I'll let other reviewers decide if this is relevant or not because I don't know.

[...]
> +       writel_relaxed(0, priv->io_base + _REG(L_INV_CNT_ADDR));
> +       writel_relaxed(BIT(4) | BIT(5),
> +                      priv->io_base + _REG(L_TCON_MISC_SEL_ADDR));
the public S905 datasheet states:
- BIT(4): STV1_SEL (STV1 is frame Signal)
- BIT(5): STV2_SEL (STV2 is frame Signal)
This doesn't seem helpful to me though, but maybe you can still create
preprocessor macros for this (for consistency)?

[...]
> +       switch (priv->venc.current_mode) {
> +       case MESON_VENC_MODE_MIPI_DSI:
> +               writel_relaxed(0x200,
> +                              priv->io_base + _REG(VENC_INTCTRL));
the public S905 datasheet documents this as:
- BIT(9): ENCP_LNRST_INT_EN (Progressive encoder filed change interrupt enable)
Please add a preprocessor macro to make it consistent with
VENC_INTCTRL_ENCI_LNRST_INT_EN which already exists and is used below.


Best regards,
Martin
