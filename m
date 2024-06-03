Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 648448D7D8E
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2024 10:39:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66D9510E1A9;
	Mon,  3 Jun 2024 08:39:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="MJxK0SWH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D67BB10E1A9
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2024 08:39:50 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4212b4eea2eso24879655e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Jun 2024 01:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717403989; x=1718008789; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=Uu2JN73iSUPpgd6Sc9H34jqx5548zSsn23/5EU+rPy4=;
 b=MJxK0SWH0D7wmztlD1KpSWG5oGVW27XOWs8h+RoirSTXTBDpvQAFkxpWdyKpgpPMa9
 JCQTvOnyzzviGcqBakpS0LLIo6zJwFGfzrQkpWi+X7Chfhe6jM5WAU/4qwPsqs3N3/8X
 DgQxFlnuYc6JKHwz+n6/sqiAXN7ksR1p+ATHDPDfg/poBJQqopqC7Cvo+CuAhnPrapyf
 WhGtFk4QYBLVge8IM+i7giUWJy977drQH/69ojpVwgoWxFoNEDMO4AtV6KJELKGekOR2
 RD7VG2X+Xjm65g6FkYL/k1lX5Al3WsapVSlCy584mkNBb90/qK4c5+YGB4maStfNSv5G
 fykw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717403989; x=1718008789;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Uu2JN73iSUPpgd6Sc9H34jqx5548zSsn23/5EU+rPy4=;
 b=HYwOGP+/EYSvNAkDLsgZzo56JX6gOz9NhLqcDYtd4vcS5h5TAb66JMZbWfsbtqCdrb
 AjdipFA10l7nq2ljCib+6RL8ThgVoCwdXJSZ5pRtlJJcWPrGySoT+in4bHPExa1CFUKK
 YiV4TuwiFddzKzUnZGImGDAqrLQ/YyLQcK7/IkYvLr9r8W4P8lKyjSIWCUT+/6YAqANg
 GEXofKr0UXwaTSi5Dsbp7SQsLtlZhqBVecjmKJWJPGk2mER4R6S1cSmXDpBUC983UXH3
 37E/tZ7R5EsEr5JOi2XLELbrXBBdVkx6wdZ7pdK0D3qkuEhrrROHOjBC7sCZOhKMA/Jd
 GoDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+eI72hWjSbKFNQ2OMeXh2NFP06F0q8dQAcSQRZzDt2SYtzCKr73tOh3/njMPetjcQAnIsThoZchQ1etDyGJfBkLdYIIyjAxLWVZVb9RZ8
X-Gm-Message-State: AOJu0YwtUj41JCR2uh9ehDiDOZjq/4pev2/k0/ijsJkeNDU/mu6VlpUC
 r3BKDlzxeuLBuSfgXjEPth17fwWmWDNoa/0u3vbyTt/Q2d2K72yH6hl2kBSwYaI=
X-Google-Smtp-Source: AGHT+IE1ERNB1VOEGQHUR+a5pOg4HwqlHw0emCPPDPhmDOTTS/H0vAtvg+ONaJitvri0E8L9WgWl7A==
X-Received: by 2002:a7b:ce10:0:b0:421:2a14:3132 with SMTP id
 5b1f17b1804b1-4212e0a52c3mr66977685e9.25.1717403989009; 
 Mon, 03 Jun 2024 01:39:49 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:79fe:b764:2b06:ab4b?
 ([2a01:e0a:982:cbb0:79fe:b764:2b06:ab4b])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4212b2bc975sm110925335e9.29.2024.06.03.01.39.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Jun 2024 01:39:48 -0700 (PDT)
Message-ID: <a408e549-164a-4969-83db-2a1f3ccb4d1f@linaro.org>
Date: Mon, 3 Jun 2024 10:39:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 2/2] drm: panel: nv3052c: Add WL-355608-A8 panel
To: Ryan Walklin <ryan@testtoast.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg
 <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Hironori KIKUCHI <kikuchan98@gmail.com>,
 Chris Morgan <macroalpha82@gmail.com>,
 Andre Przywara <andre.przywara@arm.com>, John Watts <contact@jookia.org>
References: <20240530211415.44201-1-ryan@testtoast.com>
 <20240530211415.44201-4-ryan@testtoast.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20240530211415.44201-4-ryan@testtoast.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Reply-To: neil.armstrong@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30/05/2024 23:12, Ryan Walklin wrote:
> The WL-355608-A8 is a 3.5" 640x480@60Hz RGB LCD display from an unknown
> OEM used in a number of handheld gaming devices made by Anbernic.
> Limited information is available online however the panel timing values
> (below) have been obtained from the vendor BSP. The panel appears to
> integrate a NV3052C LCD driver (or clone). Available devices address it
> in SPI/RGB mode, with the timing signals generated from the device
> SoC (Allwinner H700) and passed through.
> 
> Add a panel definition and display mode to the existing NV3502C driver.
> 
> It was assumed during bringup that the initialisation sequence was the
> same as the existing Fascontek FS035VG158 panel, proved working during
> experimentation, however subsequent dumping of the init sequence with a
> logic analyser confirms one small change to VCOM_ADJ3 from 0x4a to 0x44,
> therefore a separate set of registers is also added.
> 
> Timings:
>             | Active |  FP  | Sync |  BP  | Total
> -----------|--------|------|------|------|-------
> Horizontal |   640  |  64  |  20  |  46  |  770
>    Vertical |   480  |  21  |   4  |  15  |  520
> 
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> Co-developed-by: Hironori KIKUCHI <kikuchan98@gmail.com>
> Signed-off-by: Hironori KIKUCHI <kikuchan98@gmail.com>
> Reviewed-by: John Watts <contact@jookia.org>
> 
> ---
> 
> Changelog v1..v2:
> - Update .compatible string to match dt-binding
> - Add co-developer sign-off and review tags
> 
> Changelog v2..v3:
> - Trailing whitespace as per checkpatch.pl (no functional changes)
> ---
>   .../gpu/drm/panel/panel-newvision-nv3052c.c   | 225 ++++++++++++++++++
>   1 file changed, 225 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-newvision-nv3052c.c b/drivers/gpu/drm/panel/panel-newvision-nv3052c.c
> index 1aab0c9ae5..e986d98235 100644
> --- a/drivers/gpu/drm/panel/panel-newvision-nv3052c.c
> +++ b/drivers/gpu/drm/panel/panel-newvision-nv3052c.c
> @@ -433,6 +433,202 @@ static const struct nv3052c_reg fs035vg158_panel_regs[] = {
>   	{ 0x36, 0x0a }, // bgr = 1, ss = 1, gs = 0
>   };
>   
> +
> +static const struct nv3052c_reg wl_355608_a8_panel_regs[] = {
> +	// EXTC Command set enable, select page 1
> +	{ 0xff, 0x30 }, { 0xff, 0x52 }, { 0xff, 0x01 },
> +	// Mostly unknown registers
> +	{ 0xe3, 0x00 },
> +	{ 0x40, 0x00 },
> +	{ 0x03, 0x40 },
> +	{ 0x04, 0x00 },
> +	{ 0x05, 0x03 },
> +	{ 0x08, 0x00 },
> +	{ 0x09, 0x07 },
> +	{ 0x0a, 0x01 },
> +	{ 0x0b, 0x32 },
> +	{ 0x0c, 0x32 },
> +	{ 0x0d, 0x0b },
> +	{ 0x0e, 0x00 },
> +	{ 0x23, 0xa0 },
> +	{ 0x24, 0x0c },
> +	{ 0x25, 0x06 },
> +	{ 0x26, 0x14 },
> +	{ 0x27, 0x14 },
> +	{ 0x38, 0xcc }, // VCOM_ADJ1
> +	{ 0x39, 0xd7 }, // VCOM_ADJ2
> +	{ 0x3a, 0x44 }, // VCOM_ADJ3
> +	{ 0x28, 0x40 },
> +	{ 0x29, 0x01 },
> +	{ 0x2a, 0xdf },
> +	{ 0x49, 0x3c },
> +	{ 0x91, 0x77 }, // EXTPW_CTRL2
> +	{ 0x92, 0x77 }, // EXTPW_CTRL3
> +	{ 0xa0, 0x55 },
> +	{ 0xa1, 0x50 },
> +	{ 0xa4, 0x9c },
> +	{ 0xa7, 0x02 },
> +	{ 0xa8, 0x01 },
> +	{ 0xa9, 0x01 },
> +	{ 0xaa, 0xfc },
> +	{ 0xab, 0x28 },
> +	{ 0xac, 0x06 },
> +	{ 0xad, 0x06 },
> +	{ 0xae, 0x06 },
> +	{ 0xaf, 0x03 },
> +	{ 0xb0, 0x08 },
> +	{ 0xb1, 0x26 },
> +	{ 0xb2, 0x28 },
> +	{ 0xb3, 0x28 },
> +	{ 0xb4, 0x33 },
> +	{ 0xb5, 0x08 },
> +	{ 0xb6, 0x26 },
> +	{ 0xb7, 0x08 },
> +	{ 0xb8, 0x26 },
> +	{ 0xf0, 0x00 },
> +	{ 0xf6, 0xc0 },
> +	// EXTC Command set enable, select page 2
> +	{ 0xff, 0x30 }, { 0xff, 0x52 }, { 0xff, 0x02 },
> +	// Set gray scale voltage to adjust gamma
> +	{ 0xb0, 0x0b }, // PGAMVR0
> +	{ 0xb1, 0x16 }, // PGAMVR1
> +	{ 0xb2, 0x17 }, // PGAMVR2
> +	{ 0xb3, 0x2c }, // PGAMVR3
> +	{ 0xb4, 0x32 }, // PGAMVR4
> +	{ 0xb5, 0x3b }, // PGAMVR5
> +	{ 0xb6, 0x29 }, // PGAMPR0
> +	{ 0xb7, 0x40 }, // PGAMPR1
> +	{ 0xb8, 0x0d }, // PGAMPK0
> +	{ 0xb9, 0x05 }, // PGAMPK1
> +	{ 0xba, 0x12 }, // PGAMPK2
> +	{ 0xbb, 0x10 }, // PGAMPK3
> +	{ 0xbc, 0x12 }, // PGAMPK4
> +	{ 0xbd, 0x15 }, // PGAMPK5
> +	{ 0xbe, 0x19 }, // PGAMPK6
> +	{ 0xbf, 0x0e }, // PGAMPK7
> +	{ 0xc0, 0x16 }, // PGAMPK8
> +	{ 0xc1, 0x0a }, // PGAMPK9
> +	// Set gray scale voltage to adjust gamma
> +	{ 0xd0, 0x0c }, // NGAMVR0
> +	{ 0xd1, 0x17 }, // NGAMVR0
> +	{ 0xd2, 0x14 }, // NGAMVR1
> +	{ 0xd3, 0x2e }, // NGAMVR2
> +	{ 0xd4, 0x32 }, // NGAMVR3
> +	{ 0xd5, 0x3c }, // NGAMVR4
> +	{ 0xd6, 0x22 }, // NGAMPR0
> +	{ 0xd7, 0x3d }, // NGAMPR1
> +	{ 0xd8, 0x0d }, // NGAMPK0
> +	{ 0xd9, 0x07 }, // NGAMPK1
> +	{ 0xda, 0x13 }, // NGAMPK2
> +	{ 0xdb, 0x13 }, // NGAMPK3
> +	{ 0xdc, 0x11 }, // NGAMPK4
> +	{ 0xdd, 0x15 }, // NGAMPK5
> +	{ 0xde, 0x19 }, // NGAMPK6
> +	{ 0xdf, 0x10 }, // NGAMPK7
> +	{ 0xe0, 0x17 }, // NGAMPK8
> +	{ 0xe1, 0x0a }, // NGAMPK9
> +	// EXTC Command set enable, select page 3
> +	{ 0xff, 0x30 }, { 0xff, 0x52 }, { 0xff, 0x03 },
> +	// Set various timing settings
> +	{ 0x00, 0x2a }, // GIP_VST_1
> +	{ 0x01, 0x2a }, // GIP_VST_2
> +	{ 0x02, 0x2a }, // GIP_VST_3
> +	{ 0x03, 0x2a }, // GIP_VST_4
> +	{ 0x04, 0x61 }, // GIP_VST_5
> +	{ 0x05, 0x80 }, // GIP_VST_6
> +	{ 0x06, 0xc7 }, // GIP_VST_7
> +	{ 0x07, 0x01 }, // GIP_VST_8
> +	{ 0x08, 0x03 }, // GIP_VST_9
> +	{ 0x09, 0x04 }, // GIP_VST_10
> +	{ 0x70, 0x22 }, // GIP_ECLK1
> +	{ 0x71, 0x80 }, // GIP_ECLK2
> +	{ 0x30, 0x2a }, // GIP_CLK_1
> +	{ 0x31, 0x2a }, // GIP_CLK_2
> +	{ 0x32, 0x2a }, // GIP_CLK_3
> +	{ 0x33, 0x2a }, // GIP_CLK_4
> +	{ 0x34, 0x61 }, // GIP_CLK_5
> +	{ 0x35, 0xc5 }, // GIP_CLK_6
> +	{ 0x36, 0x80 }, // GIP_CLK_7
> +	{ 0x37, 0x23 }, // GIP_CLK_8
> +	{ 0x40, 0x03 }, // GIP_CLKA_1
> +	{ 0x41, 0x04 }, // GIP_CLKA_2
> +	{ 0x42, 0x05 }, // GIP_CLKA_3
> +	{ 0x43, 0x06 }, // GIP_CLKA_4
> +	{ 0x44, 0x11 }, // GIP_CLKA_5
> +	{ 0x45, 0xe8 }, // GIP_CLKA_6
> +	{ 0x46, 0xe9 }, // GIP_CLKA_7
> +	{ 0x47, 0x11 }, // GIP_CLKA_8
> +	{ 0x48, 0xea }, // GIP_CLKA_9
> +	{ 0x49, 0xeb }, // GIP_CLKA_10
> +	{ 0x50, 0x07 }, // GIP_CLKB_1
> +	{ 0x51, 0x08 }, // GIP_CLKB_2
> +	{ 0x52, 0x09 }, // GIP_CLKB_3
> +	{ 0x53, 0x0a }, // GIP_CLKB_4
> +	{ 0x54, 0x11 }, // GIP_CLKB_5
> +	{ 0x55, 0xec }, // GIP_CLKB_6
> +	{ 0x56, 0xed }, // GIP_CLKB_7
> +	{ 0x57, 0x11 }, // GIP_CLKB_8
> +	{ 0x58, 0xef }, // GIP_CLKB_9
> +	{ 0x59, 0xf0 }, // GIP_CLKB_10
> +	// Map internal GOA signals to GOA output pad
> +	{ 0xb1, 0x01 }, // PANELD2U2
> +	{ 0xb4, 0x15 }, // PANELD2U5
> +	{ 0xb5, 0x16 }, // PANELD2U6
> +	{ 0xb6, 0x09 }, // PANELD2U7
> +	{ 0xb7, 0x0f }, // PANELD2U8
> +	{ 0xb8, 0x0d }, // PANELD2U9
> +	{ 0xb9, 0x0b }, // PANELD2U10
> +	{ 0xba, 0x00 }, // PANELD2U11
> +	{ 0xc7, 0x02 }, // PANELD2U24
> +	{ 0xca, 0x17 }, // PANELD2U27
> +	{ 0xcb, 0x18 }, // PANELD2U28
> +	{ 0xcc, 0x0a }, // PANELD2U29
> +	{ 0xcd, 0x10 }, // PANELD2U30
> +	{ 0xce, 0x0e }, // PANELD2U31
> +	{ 0xcf, 0x0c }, // PANELD2U32
> +	{ 0xd0, 0x00 }, // PANELD2U33
> +	// Map internal GOA signals to GOA output pad
> +	{ 0x81, 0x00 }, // PANELU2D2
> +	{ 0x84, 0x15 }, // PANELU2D5
> +	{ 0x85, 0x16 }, // PANELU2D6
> +	{ 0x86, 0x10 }, // PANELU2D7
> +	{ 0x87, 0x0a }, // PANELU2D8
> +	{ 0x88, 0x0c }, // PANELU2D9
> +	{ 0x89, 0x0e }, // PANELU2D10
> +	{ 0x8a, 0x02 }, // PANELU2D11
> +	{ 0x97, 0x00 }, // PANELU2D24
> +	{ 0x9a, 0x17 }, // PANELU2D27
> +	{ 0x9b, 0x18 }, // PANELU2D28
> +	{ 0x9c, 0x0f }, // PANELU2D29
> +	{ 0x9d, 0x09 }, // PANELU2D30
> +	{ 0x9e, 0x0b }, // PANELU2D31
> +	{ 0x9f, 0x0d }, // PANELU2D32
> +	{ 0xa0, 0x01 }, // PANELU2D33
> +	// EXTC Command set enable, select page 2
> +	{ 0xff, 0x30 }, { 0xff, 0x52 }, { 0xff, 0x02 },
> +	// Unknown registers
> +	{ 0x01, 0x01 },
> +	{ 0x02, 0xda },
> +	{ 0x03, 0xba },
> +	{ 0x04, 0xa8 },
> +	{ 0x05, 0x9a },
> +	{ 0x06, 0x70 },
> +	{ 0x07, 0xff },
> +	{ 0x08, 0x91 },
> +	{ 0x09, 0x90 },
> +	{ 0x0a, 0xff },
> +	{ 0x0b, 0x8f },
> +	{ 0x0c, 0x60 },
> +	{ 0x0d, 0x58 },
> +	{ 0x0e, 0x48 },
> +	{ 0x0f, 0x38 },
> +	{ 0x10, 0x2b },
> +	// EXTC Command set enable, select page 0
> +	{ 0xff, 0x30 }, { 0xff, 0x52 }, { 0xff, 0x00 },
> +	// Display Access Control
> +	{ 0x36, 0x0a }, // bgr = 1, ss = 1, gs = 0
> +};
> +
>   static inline struct nv3052c *to_nv3052c(struct drm_panel *panel)
>   {
>   	return container_of(panel, struct nv3052c, panel);
> @@ -670,6 +866,21 @@ static const struct drm_display_mode fs035vg158_modes[] = {
>   	},
>   };
>   
> +static const struct drm_display_mode wl_355608_a8_mode[] = {
> +	{
> +		.clock = 24000,
> +		.hdisplay = 640,
> +		.hsync_start = 640 + 64,
> +		.hsync_end = 640 + 64 + 20,
> +		.htotal = 640 + 64 + 20 + 46,
> +		.vdisplay = 480,
> +		.vsync_start = 480 + 21,
> +		.vsync_end = 480 + 21 + 4,
> +		.vtotal = 480 + 21 + 4 + 15,
> +		.flags = DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
> +	},
> +};
> +
>   static const struct nv3052c_panel_info ltk035c5444t_panel_info = {
>   	.display_modes = ltk035c5444t_modes,
>   	.num_modes = ARRAY_SIZE(ltk035c5444t_modes),
> @@ -692,9 +903,21 @@ static const struct nv3052c_panel_info fs035vg158_panel_info = {
>   	.panel_regs_len = ARRAY_SIZE(fs035vg158_panel_regs),
>   };
>   
> +static const struct nv3052c_panel_info wl_355608_a8_panel_info = {
> +	.display_modes = wl_355608_a8_mode,
> +	.num_modes = ARRAY_SIZE(wl_355608_a8_mode),
> +	.width_mm = 150,
> +	.height_mm = 94,
> +	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
> +	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE,
> +	.panel_regs = wl_355608_a8_panel_regs,
> +	.panel_regs_len = ARRAY_SIZE(wl_355608_a8_panel_regs),
> +};
> +
>   static const struct spi_device_id nv3052c_ids[] = {
>   	{ "ltk035c5444t", },
>   	{ "fs035vg158", },
> +	{ "wl-355608-a8", },
>   	{ /* sentinel */ }
>   };
>   MODULE_DEVICE_TABLE(spi, nv3052c_ids);
> @@ -702,6 +925,7 @@ MODULE_DEVICE_TABLE(spi, nv3052c_ids);
>   static const struct of_device_id nv3052c_of_match[] = {
>   	{ .compatible = "leadtek,ltk035c5444t", .data = &ltk035c5444t_panel_info },
>   	{ .compatible = "fascontek,fs035vg158", .data = &fs035vg158_panel_info },
> +	{ .compatible = "wl-355608-a8", .data = &wl_355608_a8_panel_info },
>   	{ /* sentinel */ }
>   };
>   MODULE_DEVICE_TABLE(of, nv3052c_of_match);
> @@ -719,4 +943,5 @@ module_spi_driver(nv3052c_driver);
>   
>   MODULE_AUTHOR("Paul Cercueil <paul@crapouillou.net>");
>   MODULE_AUTHOR("Christophe Branchereau <cbranchereau@gmail.com>");
> +MODULE_AUTHOR("Ryan Walklin <ryan@testtoast.com");
>   MODULE_LICENSE("GPL v2");

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
