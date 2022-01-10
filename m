Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 429FE489584
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jan 2022 10:46:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D735212B55C;
	Mon, 10 Jan 2022 09:46:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AB2E12B55E
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jan 2022 09:46:01 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 q141-20020a1ca793000000b00347b48dfb53so4804674wme.0
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jan 2022 01:46:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Eacw/tyhjTY73nKE+OAvPP936rhHlBL8K/HAn04RZx8=;
 b=5yHruTufsx2YyQ9ACpftxElp7YafCGeJeRbmvO6bkBA8J5ZL0UJO84gtytWcClAiOJ
 manvwG83Kft7Saxv6ZZI7TZVBy9kn+5aG6w3GvoLmn6iGUdPaU9XL3tjz5NyXV8L8MjW
 JBZisXE/LWM8eJoQ6/M6vkgu64lplvvNSYnjGNYqgfMUSr2CN12oRdiiGDHekIKqmZzD
 Ijj1DFGghFh++6uE+jHR11vE+pwJtW8Bq1x5a19SN84vUjXA7gzqkeQW+mQ6cYgf9QN5
 uqU1rcTiX8QlZPMaW6qKstcmAztEBYKKyGc17WM+tjrSxyh44qqEeOoGkEqEuATcmxnx
 gSnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=Eacw/tyhjTY73nKE+OAvPP936rhHlBL8K/HAn04RZx8=;
 b=N4gvR0xBjtgyxEN61k+MKSWxsekV0+54Mei0mbaTOsq6s9F1HmtH1YZke+spz0PxJW
 RYl5NDF3w0IpPT1Q4axesL7dnV4tLKUpqAgPi/H2HT8d7aIpKOHyx0bHBCAWRXZIiBCQ
 5EQh1/WbWVYozaAg9KgwkDYGQ/nxroYDmADS0Kgtxl7sclV/cnexWVBA3J6U+lMlFblX
 KkJdg8gxtwqCC7cd95StaG19O48lh5xA1jzHc0jLCgxl6XCEhYe3YyZ5BoyIXKsR3pYr
 5w9myChkW1jf1e/d4sBxk6sGccbg9YojVOzCrCfHCFgTbdmB/D6T7dU+VlDOO/sCcbQv
 BTig==
X-Gm-Message-State: AOAM531QtBtdmTtxv8eDJJjG6ctcJ7D+bBlMj43FDmGv5jo0URMa8ktl
 rhR1+qS+biOHYl7VW4HkeOrRwQ==
X-Google-Smtp-Source: ABdhPJzrUKFjgDnkaX/O5vXtjiHHwkmXO4NlmMNAvu986vJGYFnR96tPDGiPyVJv+4AGLYsqxlPPiQ==
X-Received: by 2002:a05:600c:3ba7:: with SMTP id
 n39mr21842082wms.88.1641807959521; 
 Mon, 10 Jan 2022 01:45:59 -0800 (PST)
Received: from ?IPv6:2001:861:44c0:66c0:94e5:2e36:6bcc:a9f1?
 ([2001:861:44c0:66c0:94e5:2e36:6bcc:a9f1])
 by smtp.gmail.com with ESMTPSA id g12sm6807309wrd.71.2022.01.10.01.45.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jan 2022 01:45:59 -0800 (PST)
Subject: Re: [PATCH 3/6] drm/meson: venc: add ENCL encoder setup for MIPI-DSI
 output
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20220107145515.613009-1-narmstrong@baylibre.com>
 <20220107145515.613009-4-narmstrong@baylibre.com>
 <CAFBinCA-df8Sedqh8Arh_BsMCHYv6-Kb3owrkFBd=W_EY2qxSA@mail.gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <6f62eeaa-1feb-274a-e1e8-377c582c428f@baylibre.com>
Date: Mon, 10 Jan 2022 10:45:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAFBinCA-df8Sedqh8Arh_BsMCHYv6-Kb3owrkFBd=W_EY2qxSA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

On 07/01/2022 23:33, Martin Blumenstingl wrote:
>  Hi Neil,
> 
> On Fri, Jan 7, 2022 at 3:57 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>>
>> This adds supports for the ENCL encoder connected to a MIPI-DSI transceiver on the
>> Amlogic AXG SoCs> Should this be "AXG and newer SoCs" or is this really AXG specific?

Yup should be, thanks for noting

> 
> [...]
>> +#define GAMMA_VCOM_POL    7     /* RW */
>> +#define GAMMA_RVS_OUT     6     /* RW */
>> +#define ADR_RDY           5     /* Read Only */
>> +#define WR_RDY            4     /* Read Only */
>> +#define RD_RDY            3     /* Read Only */
>> +#define GAMMA_TR          2     /* RW */
>> +#define GAMMA_SET         1     /* RW */
>> +#define GAMMA_EN          0     /* RW */
>> +
>> +#define H_RD              12
>> +#define H_AUTO_INC        11
>> +#define H_SEL_R           10
>> +#define H_SEL_G           9
>> +#define H_SEL_B           8
> I think all values above can be wrapped in the BIT() macro, then you
> don't need that below.

yep

> 
>> +#define HADR_MSB          7            /* 7:0 */
>> +#define HADR              0            /* 7:0 */
> Here GENMASK(7, 0) can be used for HADR
> 
> Also I think prefixing all macros above with their register name
> (L_GAMMA_CNTL_PORT_ or L_GAMMA_ADDR_PORT_) will make the code easier
> to read.
> 
> [...]
>> +       writel_relaxed(0x8000, priv->io_base + _REG(ENCL_VIDEO_MODE));
> The public S905 datasheet calls 0x8000 ENCL_PX_LN_CNT_SHADOW_EN

Thanks for searching !

> 
>> +       writel_relaxed(0x0418, priv->io_base + _REG(ENCL_VIDEO_MODE_ADV));
> According to the public S905 datasheet this is:
> - BIT(3): ENCL_VIDEO_MODE_ADV_VFIFO_EN
> - BIT(4): ENCL_VIDEO_MODE_ADV_GAIN_HDTV
> - BIT(10): ENCL_SEL_GAMMA_RGB_IN
> 
>> +       writel_relaxed(0x1000, priv->io_base + _REG(ENCL_VIDEO_FILT_CTRL));
> I don't know the exact name but the 32-bit vendor kernel sources have
> a comment [0] saying that 0x1000 is "bypass filter"
> But maybe we can simply call it ENCL_VIDEO_FILT_CTRL_BYPASS_FILTER

Yep

> 
> [...]
>> +       writel_relaxed(3, priv->io_base + _REG(ENCL_VIDEO_RGBIN_CTRL));
> The public S905 datasheet says:
> - BIT(0): USE RGB data from VIU, furthermore a comment in the 3.10
> kernel sources make this more clear: bit[0] 1:RGB, 0:YUV
> - BIT(1): CFG_VIDEO_RGBIN_ZBLK
> 
>> +       /* default black pattern */
>> +       writel_relaxed(0, priv->io_base + _REG(ENCL_TST_MDSEL));
>> +       writel_relaxed(0, priv->io_base + _REG(ENCL_TST_Y));
>> +       writel_relaxed(0, priv->io_base + _REG(ENCL_TST_CB));
>> +       writel_relaxed(0, priv->io_base + _REG(ENCL_TST_CR));
>> +       writel_relaxed(1, priv->io_base + _REG(ENCL_TST_EN));
>> +       writel_bits_relaxed(BIT(3), 0, priv->io_base + _REG(ENCL_VIDEO_MODE_ADV));
> same as above: ENCL_VIDEO_MODE_ADV_VFIFO_EN
> 
>> +
>> +       writel_relaxed(1, priv->io_base + _REG(ENCL_VIDEO_EN));
>> +
>> +       writel_relaxed(0, priv->io_base + _REG(L_RGB_BASE_ADDR));
>> +       writel_relaxed(0x400, priv->io_base + _REG(L_RGB_COEFF_ADDR));
> note to self: L_RGB_COEFF_ADDR seems to contain some "magic" value,
> there's no further info in the 3.10 kernel sources or datasheet
> 
>> +       writel_relaxed(0x400, priv->io_base + _REG(L_DITH_CNTL_ADDR));
> According to the public S905 datasheet BIT(10) is DITH10_EN (10-bits
> Dithering to 8 Bits Enable).
> I am not sure if this would belong to the selected video mode/bit depth.
> I'll let other reviewers decide if this is relevant or not because I don't know.


it would probably for pre-GXL when the pipeline was 8bit, would probably need to add
a comment if someone wants to us DPI/LVDS on pre-GXL.

> 
> [...]
>> +       writel_relaxed(0, priv->io_base + _REG(L_INV_CNT_ADDR));
>> +       writel_relaxed(BIT(4) | BIT(5),
>> +                      priv->io_base + _REG(L_TCON_MISC_SEL_ADDR));
> the public S905 datasheet states:
> - BIT(4): STV1_SEL (STV1 is frame Signal)
> - BIT(5): STV2_SEL (STV2 is frame Signal)
> This doesn't seem helpful to me though, but maybe you can still create
> preprocessor macros for this (for consistency)?

yep

> 
> [...]
>> +       switch (priv->venc.current_mode) {
>> +       case MESON_VENC_MODE_MIPI_DSI:
>> +               writel_relaxed(0x200,
>> +                              priv->io_base + _REG(VENC_INTCTRL));
> the public S905 datasheet documents this as:
> - BIT(9): ENCP_LNRST_INT_EN (Progressive encoder filed change interrupt enable)
> Please add a preprocessor macro to make it consistent with
> VENC_INTCTRL_ENCI_LNRST_INT_EN which already exists and is used below.

Yep

Thanks for the review :-)

Neil

> 
> 
> Best regards,
> Martin
> 

