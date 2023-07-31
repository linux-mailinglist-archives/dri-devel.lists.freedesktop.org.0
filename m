Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0847D7696BE
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jul 2023 14:49:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2830892A6;
	Mon, 31 Jul 2023 12:49:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2D51892A6
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jul 2023 12:49:32 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-3fbc77e76abso41258075e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jul 2023 05:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690807771; x=1691412571;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=uEHcWcMUxn3CMDHIhxNa126s8EohgFFmT+MYPumWW5A=;
 b=OdcscSXjl3WqwbcyHlc98NLIQOI2jfptXhUxVLDvGSdzViydshmng6QGlxwQYjWHgt
 0AJ/ed2ZdOesi1deNRidSXIhwn5H92vzXHtDVmaRfyaVce8oTyiNdlulGnssTNmMq8X0
 bTeSsrNtWPQggl8imqokS2Z9Aye5mpRNjiP/hSCuEH5+SyALKBl8lG3R1h0jp/2P/vLF
 4gGBFINLkRpflHe/Nsx4zuQPEGHfz6Z7dy/CJahULlBVeoVJCz1FezDQ8SmqmQGXWn5b
 CzDGwyM1VTBECbpM77hTck/9NHBAaNQ8bmoiGMUiwGHViPjkp38UXRj1Wiba1KiBWFEY
 TUIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690807771; x=1691412571;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uEHcWcMUxn3CMDHIhxNa126s8EohgFFmT+MYPumWW5A=;
 b=bZ9MOEc/tS6j6nvoXR9Hi1aClQsW2Bbln2nbL9VGRWBxsETCDmdntb6juDKZNIlHWQ
 I1uN7u4gx2d1opZhAoUH+juvaq8zlY279JUqxqo9SnN3nuAZUPvDkv2TcYjG7UPUGLqO
 Tt144M8GiUEFQAbneHCMDzGpCYYExhPPDRH6YkivG9ui4RrcqCNp+NmwA7kR3FAcLjA4
 Se2pX7Oh8W8nQBmFNyY9v99kYmqute9UwQ9hCDz1f52p940KUivoOHoFU4kfWtEO9BBb
 rrAJlv9zymcsnAaYfwWgX6WtnS8ouKJY0B4my9iy76k0/CoJoyZe3T7guj4bNPfEtlMs
 o3Wg==
X-Gm-Message-State: ABy/qLZ1xDM92EVsqAI0n/KpwOfMpqPKoirhUADApawDiVHOjBCpMUQc
 PNGRHf5Sv/CXkole4HHlc/Gg3g==
X-Google-Smtp-Source: APBJJlHu7h2PTuHRcF1xb7aLuzj15SqJIXtJnW+ZKhEnSqS7DL83SaZ1FayhWMVbC2o2LDDW3UA5Pg==
X-Received: by 2002:a05:600c:2a54:b0:3fb:739d:27b2 with SMTP id
 x20-20020a05600c2a5400b003fb739d27b2mr6663696wme.8.1690807771202; 
 Mon, 31 Jul 2023 05:49:31 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:f723:b60b:92cd:4df4?
 ([2a01:e0a:982:cbb0:f723:b60b:92cd:4df4])
 by smtp.gmail.com with ESMTPSA id
 v24-20020a1cf718000000b003fc05b89e5bsm11166120wmh.34.2023.07.31.05.49.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Jul 2023 05:49:30 -0700 (PDT)
Message-ID: <13ab604e-8177-e080-9411-86954105b325@linaro.org>
Date: Mon, 31 Jul 2023 14:49:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/2] drm/panel: ilitek-ili9881c: Add TDO TL050HDV35 LCD
 panel
Content-Language: en-US
To: Matus Gajdos <matuszpd@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230719102616.2259-1-matuszpd@gmail.com>
 <20230719102616.2259-3-matuszpd@gmail.com>
Organization: Linaro Developer Services
In-Reply-To: <20230719102616.2259-3-matuszpd@gmail.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 19/07/2023 12:26, Matus Gajdos wrote:
> Add support for TDO TL050HDV35-H1311A LCD panel.
> 
> Signed-off-by: Matus Gajdos <matuszpd@gmail.com>
> ---
>   drivers/gpu/drm/panel/panel-ilitek-ili9881c.c | 194 ++++++++++++++++++
>   1 file changed, 194 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
> index 1ec696adf9de..78ac57224689 100644
> --- a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
> +++ b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
> @@ -455,6 +455,174 @@ static const struct ili9881c_instr k101_im2byl02_init[] = {
>   	ILI9881C_COMMAND_INSTR(0xD3, 0x3F), /* VN0 */
>   };
>   
> +static const struct ili9881c_instr tl050hdv35_init[] = {
> +	ILI9881C_SWITCH_PAGE_INSTR(3),
> +	ILI9881C_COMMAND_INSTR(0x01, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x02, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x03, 0x73),
> +	ILI9881C_COMMAND_INSTR(0x04, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x05, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x06, 0x0a),
> +	ILI9881C_COMMAND_INSTR(0x07, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x08, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x09, 0x01),
> +	ILI9881C_COMMAND_INSTR(0x0a, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x0b, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x0c, 0x01),
> +	ILI9881C_COMMAND_INSTR(0x0d, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x0e, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x0f, 0x1d),
> +	ILI9881C_COMMAND_INSTR(0x10, 0x1d),
> +	ILI9881C_COMMAND_INSTR(0x15, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x16, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x17, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x18, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x19, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x1a, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x1b, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x1c, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x1d, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x1e, 0x40),
> +	ILI9881C_COMMAND_INSTR(0x1f, 0x80),
> +	ILI9881C_COMMAND_INSTR(0x20, 0x06),
> +	ILI9881C_COMMAND_INSTR(0x21, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x28, 0x33),
> +	ILI9881C_COMMAND_INSTR(0x29, 0x03),
> +	ILI9881C_COMMAND_INSTR(0x2a, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x2b, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x2c, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x2d, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x2e, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x2f, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x35, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x36, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x37, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x38, 0x3C),
> +	ILI9881C_COMMAND_INSTR(0x39, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x3a, 0x40),
> +	ILI9881C_COMMAND_INSTR(0x3b, 0x40),
> +	ILI9881C_COMMAND_INSTR(0x3c, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x3d, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x3e, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x3f, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x40, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x41, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x42, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x43, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x44, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x55, 0xab),
> +	ILI9881C_COMMAND_INSTR(0x5a, 0x89),
> +	ILI9881C_COMMAND_INSTR(0x5b, 0xab),
> +	ILI9881C_COMMAND_INSTR(0x5c, 0xcd),
> +	ILI9881C_COMMAND_INSTR(0x5d, 0xef),
> +	ILI9881C_COMMAND_INSTR(0x5e, 0x11),
> +	ILI9881C_COMMAND_INSTR(0x5f, 0x01),
> +	ILI9881C_COMMAND_INSTR(0x60, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x61, 0x15),
> +	ILI9881C_COMMAND_INSTR(0x62, 0x14),
> +	ILI9881C_COMMAND_INSTR(0x63, 0x0e),
> +	ILI9881C_COMMAND_INSTR(0x64, 0x0f),
> +	ILI9881C_COMMAND_INSTR(0x65, 0x0c),
> +	ILI9881C_COMMAND_INSTR(0x66, 0x0d),
> +	ILI9881C_COMMAND_INSTR(0x67, 0x06),
> +	ILI9881C_COMMAND_INSTR(0x68, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x69, 0x07),
> +	ILI9881C_COMMAND_INSTR(0x6a, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x6b, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x6c, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x6d, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x6e, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x6f, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x70, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x71, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x72, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x73, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x74, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x75, 0x01),
> +	ILI9881C_COMMAND_INSTR(0x76, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x77, 0x14),
> +	ILI9881C_COMMAND_INSTR(0x78, 0x15),
> +	ILI9881C_COMMAND_INSTR(0x79, 0x0e),
> +	ILI9881C_COMMAND_INSTR(0x7a, 0x0f),
> +	ILI9881C_COMMAND_INSTR(0x7b, 0x0c),
> +	ILI9881C_COMMAND_INSTR(0x7c, 0x0d),
> +	ILI9881C_COMMAND_INSTR(0x7d, 0x06),
> +	ILI9881C_COMMAND_INSTR(0x7e, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x7f, 0x07),
> +	ILI9881C_COMMAND_INSTR(0x88, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x89, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x8A, 0x02),
> +	ILI9881C_SWITCH_PAGE_INSTR(4),
> +	ILI9881C_COMMAND_INSTR(0x38, 0x01),
> +	ILI9881C_COMMAND_INSTR(0x39, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x6c, 0x15),
> +	ILI9881C_COMMAND_INSTR(0x6e, 0x2b),
> +	ILI9881C_COMMAND_INSTR(0x6f, 0x33),
> +	ILI9881C_COMMAND_INSTR(0x8d, 0x18),
> +	ILI9881C_COMMAND_INSTR(0x87, 0xba),
> +	ILI9881C_COMMAND_INSTR(0x26, 0x76),
> +	ILI9881C_COMMAND_INSTR(0xb2, 0xd1),
> +	ILI9881C_COMMAND_INSTR(0xb5, 0x06),
> +	ILI9881C_COMMAND_INSTR(0x3a, 0x24),
> +	ILI9881C_COMMAND_INSTR(0x35, 0x1f),
> +	ILI9881C_COMMAND_INSTR(0x33, 0x14),
> +	ILI9881C_COMMAND_INSTR(0x3b, 0x98),
> +	ILI9881C_SWITCH_PAGE_INSTR(1),
> +	ILI9881C_COMMAND_INSTR(0x22, 0x0a),
> +	ILI9881C_COMMAND_INSTR(0x31, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x40, 0x33),
> +	ILI9881C_COMMAND_INSTR(0x53, 0xa2),
> +	ILI9881C_COMMAND_INSTR(0x55, 0x92),
> +	ILI9881C_COMMAND_INSTR(0x50, 0x96),
> +	ILI9881C_COMMAND_INSTR(0x51, 0x96),
> +	ILI9881C_COMMAND_INSTR(0x60, 0x22),
> +	ILI9881C_COMMAND_INSTR(0x61, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x62, 0x19),
> +	ILI9881C_COMMAND_INSTR(0x63, 0x00),
> +	ILI9881C_COMMAND_INSTR(0xa0, 0x08),
> +	ILI9881C_COMMAND_INSTR(0xa1, 0x11),
> +	ILI9881C_COMMAND_INSTR(0xa2, 0x19),
> +	ILI9881C_COMMAND_INSTR(0xa3, 0x0d),
> +	ILI9881C_COMMAND_INSTR(0xa4, 0x0d),
> +	ILI9881C_COMMAND_INSTR(0xa5, 0x1e),
> +	ILI9881C_COMMAND_INSTR(0xa6, 0x14),
> +	ILI9881C_COMMAND_INSTR(0xa7, 0x17),
> +	ILI9881C_COMMAND_INSTR(0xa8, 0x4f),
> +	ILI9881C_COMMAND_INSTR(0xa9, 0x1a),
> +	ILI9881C_COMMAND_INSTR(0xaa, 0x27),
> +	ILI9881C_COMMAND_INSTR(0xab, 0x49),
> +	ILI9881C_COMMAND_INSTR(0xac, 0x1a),
> +	ILI9881C_COMMAND_INSTR(0xad, 0x18),
> +	ILI9881C_COMMAND_INSTR(0xae, 0x4c),
> +	ILI9881C_COMMAND_INSTR(0xaf, 0x22),
> +	ILI9881C_COMMAND_INSTR(0xb0, 0x27),
> +	ILI9881C_COMMAND_INSTR(0xb1, 0x4b),
> +	ILI9881C_COMMAND_INSTR(0xb2, 0x60),
> +	ILI9881C_COMMAND_INSTR(0xb3, 0x39),
> +	ILI9881C_COMMAND_INSTR(0xc0, 0x08),
> +	ILI9881C_COMMAND_INSTR(0xc1, 0x11),
> +	ILI9881C_COMMAND_INSTR(0xc2, 0x19),
> +	ILI9881C_COMMAND_INSTR(0xc3, 0x0d),
> +	ILI9881C_COMMAND_INSTR(0xc4, 0x0d),
> +	ILI9881C_COMMAND_INSTR(0xc5, 0x1e),
> +	ILI9881C_COMMAND_INSTR(0xc6, 0x14),
> +	ILI9881C_COMMAND_INSTR(0xc7, 0x17),
> +	ILI9881C_COMMAND_INSTR(0xc8, 0x4f),
> +	ILI9881C_COMMAND_INSTR(0xc9, 0x1a),
> +	ILI9881C_COMMAND_INSTR(0xca, 0x27),
> +	ILI9881C_COMMAND_INSTR(0xcb, 0x49),
> +	ILI9881C_COMMAND_INSTR(0xcc, 0x1a),
> +	ILI9881C_COMMAND_INSTR(0xcd, 0x18),
> +	ILI9881C_COMMAND_INSTR(0xce, 0x4c),
> +	ILI9881C_COMMAND_INSTR(0xcf, 0x33),
> +	ILI9881C_COMMAND_INSTR(0xd0, 0x27),
> +	ILI9881C_COMMAND_INSTR(0xd1, 0x4b),
> +	ILI9881C_COMMAND_INSTR(0xd2, 0x60),
> +	ILI9881C_COMMAND_INSTR(0xd3, 0x39),
> +	ILI9881C_SWITCH_PAGE_INSTR(0),
> +	ILI9881C_COMMAND_INSTR(0x36, 0x03),
> +};
> +
>   static const struct ili9881c_instr w552946ab_init[] = {
>   	ILI9881C_SWITCH_PAGE_INSTR(3),
>   	ILI9881C_COMMAND_INSTR(0x01, 0x00),
> @@ -812,6 +980,23 @@ static const struct drm_display_mode k101_im2byl02_default_mode = {
>   	.height_mm	= 217,
>   };
>   
> +static const struct drm_display_mode tl050hdv35_default_mode = {
> +	.clock		= 59400,
> +
> +	.hdisplay	= 720,
> +	.hsync_start	= 720 + 18,
> +	.hsync_end	= 720 + 18 + 3,
> +	.htotal		= 720 + 18 + 3 + 20,
> +
> +	.vdisplay	= 1280,
> +	.vsync_start	= 1280 + 26,
> +	.vsync_end	= 1280 + 26 + 6,
> +	.vtotal		= 1280 + 26 + 6 + 28,
> +
> +	.width_mm	= 62,
> +	.height_mm	= 110,
> +};
> +
>   static const struct drm_display_mode w552946aba_default_mode = {
>   	.clock		= 64000,
>   
> @@ -944,6 +1129,14 @@ static const struct ili9881c_desc k101_im2byl02_desc = {
>   	.mode_flags = MIPI_DSI_MODE_VIDEO_SYNC_PULSE,
>   };
>   
> +static const struct ili9881c_desc tl050hdv35_desc = {
> +	.init = tl050hdv35_init,
> +	.init_length = ARRAY_SIZE(tl050hdv35_init),
> +	.mode = &tl050hdv35_default_mode,
> +	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
> +		      MIPI_DSI_MODE_LPM,
> +};
> +
>   static const struct ili9881c_desc w552946aba_desc = {
>   	.init = w552946ab_init,
>   	.init_length = ARRAY_SIZE(w552946ab_init),
> @@ -955,6 +1148,7 @@ static const struct ili9881c_desc w552946aba_desc = {
>   static const struct of_device_id ili9881c_of_match[] = {
>   	{ .compatible = "bananapi,lhr050h41", .data = &lhr050h41_desc },
>   	{ .compatible = "feixin,k101-im2byl02", .data = &k101_im2byl02_desc },
> +	{ .compatible = "tdo,tl050hdv35", .data = &tl050hdv35_desc },
>   	{ .compatible = "wanchanglong,w552946aba", .data = &w552946aba_desc },
>   	{ }
>   };

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
