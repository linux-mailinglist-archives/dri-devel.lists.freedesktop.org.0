Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B586FA2B4
	for <lists+dri-devel@lfdr.de>; Mon,  8 May 2023 10:58:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37FE910E19C;
	Mon,  8 May 2023 08:58:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8D8A10E19C
 for <dri-devel@lists.freedesktop.org>; Mon,  8 May 2023 08:57:59 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3f420618d5bso9744645e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 08 May 2023 01:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683536277; x=1686128277;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KzHUT4dMhUomj9pYklJ/WypYxlz27FOOjWTbVoGXtz0=;
 b=fej1Xepp9nHCOCYnfpfdA05bfp/+104VWtVbbSMcv2+ouIaA9GRx3O72HvkWURJv3g
 xlThRar7lBA2+15Ij1TwfCkz0Jpcw6TJsm3QqkBYhBqQ+jMwo6r9A2SWN7zqbDD9/GQj
 nJz3PNGoDHbSyF0mbnbsQtUvNaL1Qyok0R/13VRt1U2EHfeP9B+AsY59mv28udMT611D
 L59OZOkuwZWolFuLXI1aIjzq6vwzWuDCMGVAe1ca6f28rwZ86/+p0sTIGHroVATk0nQy
 NhNgrjLLmbyVmRHQc/7vF8glvnpSvl4BXUlnEq2a9auUs7d362eQqj1qsaV24ppCDiqe
 GWTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683536277; x=1686128277;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KzHUT4dMhUomj9pYklJ/WypYxlz27FOOjWTbVoGXtz0=;
 b=JvCOLadZ1G4ZqzYAGcFuAHE0118e2ZSmFe9wo4Oj/af7I/4JLt/k/Z16sET52oWu7R
 fDeuEnz6biz2S/T2RkrBwf1DUZ6xcD7twgn4P6ArW3gm9UjI1WjQwzUSD3RO5ds9UoRC
 7FLx7K18pUQ94NTG5G7lAUJD8di/I4HAgxmN852vMeMsvBgVWmXaY94PaQ4zHiE8xjGK
 G8+Y8CesMHCPGDIiOTGufndIKTep9ojIniOUqjDM8Cpe+Ehv9U0NQTuejlti001dDcDp
 N+1GiF0mj1mZby1sE5EOfn2dm1yjELDQkNu9KkCferFyHkPH3CGbKE+GxlwLhwtfFJAW
 NLhw==
X-Gm-Message-State: AC+VfDx/Bx5KLSbhdSihl18LDgH0ji+H6Zi33FGm+fAsWRntMM7W7r9z
 GDFk3i3aaJOiVX6YPpr+Luo=
X-Google-Smtp-Source: ACHHUZ7Yy2EGyep+kRBOOMf4Z5d4p6mnHevZ3uzj+i4tMljsaPea7VybNsMEu+P5XamexGlD/yma4w==
X-Received: by 2002:a7b:cd15:0:b0:3f1:94fe:65e2 with SMTP id
 f21-20020a7bcd15000000b003f194fe65e2mr6555964wmj.33.1683536277594; 
 Mon, 08 May 2023 01:57:57 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 c3-20020a7bc843000000b003f42314832fsm4186303wml.18.2023.05.08.01.57.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 May 2023 01:57:56 -0700 (PDT)
Message-ID: <0cdd2d49-a2a0-4968-a978-3c3caa5741f8@gmail.com>
Date: Mon, 8 May 2023 10:57:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US, ca-ES, es-ES
To: Tom Rix <trix@redhat.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, chunfeng.yun@mediatek.com, vkoul@kernel.org,
 kishon@kernel.org, angelogioacchino.delregno@collabora.com
References: <20230502145005.2927101-1-trix@redhat.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v2] phy: mediatek: rework the floating point comparisons
 to fixed point
In-Reply-To: <20230502145005.2927101-1-trix@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: linux-phy@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 02/05/2023 16:50, Tom Rix wrote:
> gcc on aarch64 reports
> drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c: In function ‘mtk_hdmi_pll_set_rate’:
> drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:240:52: error: ‘-mgeneral-regs-only’
>    is incompatible with the use of floating-point types
>    240 |         else if (tmds_clk >= 54 * MEGA && tmds_clk < 148.35 * MEGA)
> 
> Floating point should not be used, so rework the floating point comparisons
> to fixed point.
> 
> Signed-off-by: Tom Rix <trix@redhat.com>

I think this is worth a fixes tag.

Regards,
Matthias

> ---
> v2: silence robot by casting types to u64
> 
> ---
> drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
> index abfc077fb0a8..093c4d1da557 100644
> --- a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
> +++ b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
> @@ -237,11 +237,11 @@ static int mtk_hdmi_pll_calc(struct mtk_hdmi_phy *hdmi_phy, struct clk_hw *hw,
>   	 */
>   	if (tmds_clk < 54 * MEGA)
>   		txposdiv = 8;
> -	else if (tmds_clk >= 54 * MEGA && tmds_clk < 148.35 * MEGA)
> +	else if (tmds_clk >= 54 * MEGA && (tmds_clk * 100) < 14835 * MEGA)
>   		txposdiv = 4;
> -	else if (tmds_clk >= 148.35 * MEGA && tmds_clk < 296.7 * MEGA)
> +	else if ((tmds_clk * 100) >= 14835 * MEGA && (tmds_clk * 10) < 2967 * MEGA)
>   		txposdiv = 2;
> -	else if (tmds_clk >= 296.7 * MEGA && tmds_clk <= 594 * MEGA)
> +	else if ((tmds_clk * 10) >= 2967 * MEGA && tmds_clk <= 594 * MEGA)
>   		txposdiv = 1;
>   	else
>   		return -EINVAL;
> @@ -328,12 +328,12 @@ static int mtk_hdmi_pll_drv_setting(struct clk_hw *hw)
>   		clk_channel_bias = 0x34; /* 20mA */
>   		impedance_en = 0xf;
>   		impedance = 0x36; /* 100ohm */
> -	} else if (pixel_clk >= 74.175 * MEGA && pixel_clk <= 300 * MEGA) {
> +	} else if (((u64)pixel_clk * 1000) >= 74175 * MEGA && pixel_clk <= 300 * MEGA) {
>   		data_channel_bias = 0x34; /* 20mA */
>   		clk_channel_bias = 0x2c; /* 16mA */
>   		impedance_en = 0xf;
>   		impedance = 0x36; /* 100ohm */
> -	} else if (pixel_clk >= 27 * MEGA && pixel_clk < 74.175 * MEGA) {
> +	} else if (pixel_clk >= 27 * MEGA && ((u64)pixel_clk * 1000) < 74175 * MEGA) {
>   		data_channel_bias = 0x14; /* 10mA */
>   		clk_channel_bias = 0x14; /* 10mA */
>   		impedance_en = 0x0;
