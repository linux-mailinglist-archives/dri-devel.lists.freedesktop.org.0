Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C672716830
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 17:56:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5837610E183;
	Tue, 30 May 2023 15:56:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B6E510E180
 for <dri-devel@lists.freedesktop.org>; Tue, 30 May 2023 15:56:48 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-30af20f5f67so1500545f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 30 May 2023 08:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685462207; x=1688054207;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=gvER3RE6QsDnp9jIH4cksMRk/aGAiKJRvIzCgHXhJ8k=;
 b=F7w26GmsVNnP5zHFgmJIC5Ms6zwIdUIArobUglmfLg0+sQul2EiUhSli7uzTyWIyNM
 Rmv9cgh1V41xzZH7Rt0trm2gjdUJ7rvL2CncMswgiwbl7wR+Nt4YiDmulk3LwX09s0ue
 tVQH9HnuiRwzRhq5+mz5isx7xdJhfhIeOCLHaskC+Ku9sCpJRrrxmH+qWPDog59nrioo
 wxDO/SDxxhm+6nSXnwhFaV3z4V9LYP4TttDIckc9gXI8cYWNFPU/ZGko5X5xjPhDk0hB
 iydm6ecSyTzs+TuRhYUKPYTKt8s/PQvTidNsUAo13l7Mn15Uk6nVE766h/1P1rkvglMF
 TcWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685462207; x=1688054207;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gvER3RE6QsDnp9jIH4cksMRk/aGAiKJRvIzCgHXhJ8k=;
 b=OfK6Rs+V4KV+99S9f36faY3isNjqIMru9FYM2N7nnnMuCZzHCVxz5ASVVmeDkoNT4m
 x7M4Yh8lMuLGvweP2m0iTetE5iWK7G0FhhyjE7Z7aYl1h+K2lh+l6eunVnGxAqn7wN7t
 ayCALrws4WVaQnxD90S4KWQKrCeD0ZA4ZmeOsJ1EtTQUdR9g6n5w8ASEAteQmaxZN704
 RHAmbCMgF+Ln5w8gXj2YsH7BYSL/lO9IECcIznjln61JFSqbBURDisbRx59aOiJH0Alx
 haNwqFPQFqwEwln1fWvxIASwCiUcpGmiOfZcx68TDs8swbNLjCmWICZFFKPRsR68IcXo
 WwCQ==
X-Gm-Message-State: AC+VfDzFYpBWyct8i9DdildxgPOsqWLSM4jKEBAWAjmm9QzGVjiLC1GA
 xVYgAKj7025eYb6ShVlEWkEUaA==
X-Google-Smtp-Source: ACHHUZ7IiF/4SJux9W8hYZoYu+mPprYPj4hmFlusB/aTcUKe1PBgwdtDAJ4uRunTc7XXk9cHMXu6kw==
X-Received: by 2002:a5d:6289:0:b0:30a:e332:a3ba with SMTP id
 k9-20020a5d6289000000b0030ae332a3bamr1966939wru.27.1685462206810; 
 Tue, 30 May 2023 08:56:46 -0700 (PDT)
Received: from [192.168.27.65] (home.beaume.starnux.net. [82.66.176.246])
 by smtp.gmail.com with ESMTPSA id
 n2-20020a5d6602000000b0030903d44dbcsm3654060wru.33.2023.05.30.08.56.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 May 2023 08:56:46 -0700 (PDT)
Message-ID: <4f8ec61d-f501-7739-51bf-3b8bde920c2d@linaro.org>
Date: Tue, 30 May 2023 17:56:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v5 01/17] clk: meson: g12a: prefix private CLK IDs defines
 with PRIV
Content-Language: en-US
To: Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Philipp Zabel <p.zabel@pengutronix.de>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Sam Ravnborg <sam@ravnborg.org>
References: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v5-0-56eb7a4d5b8e@linaro.org>
 <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v5-1-56eb7a4d5b8e@linaro.org>
 <1j353e5j8m.fsf@starbuckisacylon.baylibre.com>
Organization: Linaro Developer Services
In-Reply-To: <1j353e5j8m.fsf@starbuckisacylon.baylibre.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Nicolas Belin <nbelin@baylibre.com>,
 linux-phy@lists.infradead.org, linux-amlogic@lists.infradead.org,
 "Lukas F. Hartmann" <lukas@mntre.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30/05/2023 10:08, Jerome Brunet wrote:
> 
> On Tue 30 May 2023 at 09:38, Neil Armstrong <neil.armstrong@linaro.org> wrote:
> 
>> Exposing should not be done in a single commit anymore due to
>> dt-bindings enforced rules.
>>
>> Prepend PRIV to the private CLK IDs so we can add new clock to
>> the bindings header and in a separate commit remove such private
>> define and switch to the public CLK IDs identifier.
>>
>> This refers to a discussion at [1] with Arnd and Krzysztof.
>>
>> [1] https://lore.kernel.org/all/2fabe721-7434-43e7-bae5-088a42ba128d@app.fastmail.com/
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> 
> I understand the discussion reported but I don't really like this CLKID_PRIV_
> It adds another layer of IDs.
> 
> I'd much prefer if we just expose all the IDs. That would comply with DT
> new policy and be much simpler in the long run.

While it would solve everything at long term, we'll still need to do the move
in 3 steps (add PRIV, add to bindings, remove PRIV defined), and we should still
decide how to handle NR_CLKS.

Neil

> 
>> ---
>>   drivers/clk/meson/g12a.c | 628 +++++++++++++++++++++++------------------------
>>   drivers/clk/meson/g12a.h | 260 ++++++++++----------
>>   2 files changed, 444 insertions(+), 444 deletions(-)
>>
>> diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
>> index 310accf94830..d2e481ae2429 100644
>> --- a/drivers/clk/meson/g12a.c
>> +++ b/drivers/clk/meson/g12a.c
>> @@ -4255,8 +4255,8 @@ static struct clk_hw_onecell_data g12a_hw_onecell_data = {
>>   		[CLKID_FCLK_DIV7]		= &g12a_fclk_div7.hw,
>>   		[CLKID_FCLK_DIV2P5]		= &g12a_fclk_div2p5.hw,
>>   		[CLKID_GP0_PLL]			= &g12a_gp0_pll.hw,
>> -		[CLKID_MPEG_SEL]		= &g12a_mpeg_clk_sel.hw,
>> -		[CLKID_MPEG_DIV]		= &g12a_mpeg_clk_div.hw,
>> +		[CLKID_PRIV_MPEG_SEL]		= &g12a_mpeg_clk_sel.hw,
>> +		[CLKID_PRIV_MPEG_DIV]		= &g12a_mpeg_clk_div.hw,
>>   		[CLKID_CLK81]			= &g12a_clk81.hw,
>>   		[CLKID_MPLL0]			= &g12a_mpll0.hw,
>>   		[CLKID_MPLL1]			= &g12a_mpll1.hw,
>> @@ -4307,25 +4307,25 @@ static struct clk_hw_onecell_data g12a_hw_onecell_data = {
>>   		[CLKID_UART2]			= &g12a_uart2.hw,
>>   		[CLKID_VPU_INTR]		= &g12a_vpu_intr.hw,
>>   		[CLKID_GIC]			= &g12a_gic.hw,
>> -		[CLKID_SD_EMMC_A_CLK0_SEL]	= &g12a_sd_emmc_a_clk0_sel.hw,
>> -		[CLKID_SD_EMMC_A_CLK0_DIV]	= &g12a_sd_emmc_a_clk0_div.hw,
>> +		[CLKID_PRIV_SD_EMMC_A_CLK0_SEL]	= &g12a_sd_emmc_a_clk0_sel.hw,
>> +		[CLKID_PRIV_SD_EMMC_A_CLK0_DIV]	= &g12a_sd_emmc_a_clk0_div.hw,
>>   		[CLKID_SD_EMMC_A_CLK0]		= &g12a_sd_emmc_a_clk0.hw,
>> -		[CLKID_SD_EMMC_B_CLK0_SEL]	= &g12a_sd_emmc_b_clk0_sel.hw,
>> -		[CLKID_SD_EMMC_B_CLK0_DIV]	= &g12a_sd_emmc_b_clk0_div.hw,
>> +		[CLKID_PRIV_SD_EMMC_B_CLK0_SEL]	= &g12a_sd_emmc_b_clk0_sel.hw,
>> +		[CLKID_PRIV_SD_EMMC_B_CLK0_DIV]	= &g12a_sd_emmc_b_clk0_div.hw,
>>   		[CLKID_SD_EMMC_B_CLK0]		= &g12a_sd_emmc_b_clk0.hw,
>> -		[CLKID_SD_EMMC_C_CLK0_SEL]	= &g12a_sd_emmc_c_clk0_sel.hw,
>> -		[CLKID_SD_EMMC_C_CLK0_DIV]	= &g12a_sd_emmc_c_clk0_div.hw,
>> +		[CLKID_PRIV_SD_EMMC_C_CLK0_SEL]	= &g12a_sd_emmc_c_clk0_sel.hw,
>> +		[CLKID_PRIV_SD_EMMC_C_CLK0_DIV]	= &g12a_sd_emmc_c_clk0_div.hw,
>>   		[CLKID_SD_EMMC_C_CLK0]		= &g12a_sd_emmc_c_clk0.hw,
>> -		[CLKID_MPLL0_DIV]		= &g12a_mpll0_div.hw,
>> -		[CLKID_MPLL1_DIV]		= &g12a_mpll1_div.hw,
>> -		[CLKID_MPLL2_DIV]		= &g12a_mpll2_div.hw,
>> -		[CLKID_MPLL3_DIV]		= &g12a_mpll3_div.hw,
>> -		[CLKID_FCLK_DIV2_DIV]		= &g12a_fclk_div2_div.hw,
>> -		[CLKID_FCLK_DIV3_DIV]		= &g12a_fclk_div3_div.hw,
>> -		[CLKID_FCLK_DIV4_DIV]		= &g12a_fclk_div4_div.hw,
>> -		[CLKID_FCLK_DIV5_DIV]		= &g12a_fclk_div5_div.hw,
>> -		[CLKID_FCLK_DIV7_DIV]		= &g12a_fclk_div7_div.hw,
>> -		[CLKID_FCLK_DIV2P5_DIV]		= &g12a_fclk_div2p5_div.hw,
>> +		[CLKID_PRIV_MPLL0_DIV]		= &g12a_mpll0_div.hw,
>> +		[CLKID_PRIV_MPLL1_DIV]		= &g12a_mpll1_div.hw,
>> +		[CLKID_PRIV_MPLL2_DIV]		= &g12a_mpll2_div.hw,
>> +		[CLKID_PRIV_MPLL3_DIV]		= &g12a_mpll3_div.hw,
>> +		[CLKID_PRIV_FCLK_DIV2_DIV]	= &g12a_fclk_div2_div.hw,
>> +		[CLKID_PRIV_FCLK_DIV3_DIV]	= &g12a_fclk_div3_div.hw,
>> +		[CLKID_PRIV_FCLK_DIV4_DIV]	= &g12a_fclk_div4_div.hw,
>> +		[CLKID_PRIV_FCLK_DIV5_DIV]	= &g12a_fclk_div5_div.hw,
>> +		[CLKID_PRIV_FCLK_DIV7_DIV]	= &g12a_fclk_div7_div.hw,
>> +		[CLKID_PRIV_FCLK_DIV2P5_DIV]	= &g12a_fclk_div2p5_div.hw,
>>   		[CLKID_HIFI_PLL]		= &g12a_hifi_pll.hw,
>>   		[CLKID_VCLK2_VENCI0]		= &g12a_vclk2_venci0.hw,
>>   		[CLKID_VCLK2_VENCI1]		= &g12a_vclk2_venci1.hw,
>> @@ -4346,56 +4346,56 @@ static struct clk_hw_onecell_data g12a_hw_onecell_data = {
>>   		[CLKID_VCLK2_VENCLMMC]		= &g12a_vclk2_venclmmc.hw,
>>   		[CLKID_VCLK2_VENCL]		= &g12a_vclk2_vencl.hw,
>>   		[CLKID_VCLK2_OTHER1]		= &g12a_vclk2_other1.hw,
>> -		[CLKID_FIXED_PLL_DCO]		= &g12a_fixed_pll_dco.hw,
>> -		[CLKID_SYS_PLL_DCO]		= &g12a_sys_pll_dco.hw,
>> -		[CLKID_GP0_PLL_DCO]		= &g12a_gp0_pll_dco.hw,
>> -		[CLKID_HIFI_PLL_DCO]		= &g12a_hifi_pll_dco.hw,
>> +		[CLKID_PRIV_FIXED_PLL_DCO]	= &g12a_fixed_pll_dco.hw,
>> +		[CLKID_PRIV_SYS_PLL_DCO]	= &g12a_sys_pll_dco.hw,
>> +		[CLKID_PRIV_GP0_PLL_DCO]	= &g12a_gp0_pll_dco.hw,
>> +		[CLKID_PRIV_HIFI_PLL_DCO]	= &g12a_hifi_pll_dco.hw,
>>   		[CLKID_DMA]			= &g12a_dma.hw,
>>   		[CLKID_EFUSE]			= &g12a_efuse.hw,
>>   		[CLKID_ROM_BOOT]		= &g12a_rom_boot.hw,
>>   		[CLKID_RESET_SEC]		= &g12a_reset_sec.hw,
>>   		[CLKID_SEC_AHB_APB3]		= &g12a_sec_ahb_apb3.hw,
>> -		[CLKID_MPLL_PREDIV]		= &g12a_mpll_prediv.hw,
>> +		[CLKID_PRIV_MPLL_PREDIV]	= &g12a_mpll_prediv.hw,
>>   		[CLKID_VPU_0_SEL]		= &g12a_vpu_0_sel.hw,
>> -		[CLKID_VPU_0_DIV]		= &g12a_vpu_0_div.hw,
>> +		[CLKID_PRIV_VPU_0_DIV]		= &g12a_vpu_0_div.hw,
>>   		[CLKID_VPU_0]			= &g12a_vpu_0.hw,
>>   		[CLKID_VPU_1_SEL]		= &g12a_vpu_1_sel.hw,
>> -		[CLKID_VPU_1_DIV]		= &g12a_vpu_1_div.hw,
>> +		[CLKID_PRIV_VPU_1_DIV]		= &g12a_vpu_1_div.hw,
>>   		[CLKID_VPU_1]			= &g12a_vpu_1.hw,
>>   		[CLKID_VPU]			= &g12a_vpu.hw,
>>   		[CLKID_VAPB_0_SEL]		= &g12a_vapb_0_sel.hw,
>> -		[CLKID_VAPB_0_DIV]		= &g12a_vapb_0_div.hw,
>> +		[CLKID_PRIV_VAPB_0_DIV]		= &g12a_vapb_0_div.hw,
>>   		[CLKID_VAPB_0]			= &g12a_vapb_0.hw,
>>   		[CLKID_VAPB_1_SEL]		= &g12a_vapb_1_sel.hw,
>> -		[CLKID_VAPB_1_DIV]		= &g12a_vapb_1_div.hw,
>> +		[CLKID_PRIV_VAPB_1_DIV]		= &g12a_vapb_1_div.hw,
>>   		[CLKID_VAPB_1]			= &g12a_vapb_1.hw,
>>   		[CLKID_VAPB_SEL]		= &g12a_vapb_sel.hw,
>>   		[CLKID_VAPB]			= &g12a_vapb.hw,
>> -		[CLKID_HDMI_PLL_DCO]		= &g12a_hdmi_pll_dco.hw,
>> -		[CLKID_HDMI_PLL_OD]		= &g12a_hdmi_pll_od.hw,
>> -		[CLKID_HDMI_PLL_OD2]		= &g12a_hdmi_pll_od2.hw,
>> +		[CLKID_PRIV_HDMI_PLL_DCO]	= &g12a_hdmi_pll_dco.hw,
>> +		[CLKID_PRIV_HDMI_PLL_OD]	= &g12a_hdmi_pll_od.hw,
>> +		[CLKID_PRIV_HDMI_PLL_OD2]	= &g12a_hdmi_pll_od2.hw,
>>   		[CLKID_HDMI_PLL]		= &g12a_hdmi_pll.hw,
>>   		[CLKID_VID_PLL]			= &g12a_vid_pll_div.hw,
>> -		[CLKID_VID_PLL_SEL]		= &g12a_vid_pll_sel.hw,
>> -		[CLKID_VID_PLL_DIV]		= &g12a_vid_pll.hw,
>> -		[CLKID_VCLK_SEL]		= &g12a_vclk_sel.hw,
>> -		[CLKID_VCLK2_SEL]		= &g12a_vclk2_sel.hw,
>> -		[CLKID_VCLK_INPUT]		= &g12a_vclk_input.hw,
>> -		[CLKID_VCLK2_INPUT]		= &g12a_vclk2_input.hw,
>> -		[CLKID_VCLK_DIV]		= &g12a_vclk_div.hw,
>> -		[CLKID_VCLK2_DIV]		= &g12a_vclk2_div.hw,
>> +		[CLKID_PRIV_VID_PLL_SEL]	= &g12a_vid_pll_sel.hw,
>> +		[CLKID_PRIV_VID_PLL_DIV]	= &g12a_vid_pll.hw,
>> +		[CLKID_PRIV_VCLK_SEL]		= &g12a_vclk_sel.hw,
>> +		[CLKID_PRIV_VCLK2_SEL]		= &g12a_vclk2_sel.hw,
>> +		[CLKID_PRIV_VCLK_INPUT]		= &g12a_vclk_input.hw,
>> +		[CLKID_PRIV_VCLK2_INPUT]	= &g12a_vclk2_input.hw,
>> +		[CLKID_PRIV_VCLK_DIV]		= &g12a_vclk_div.hw,
>> +		[CLKID_PRIV_VCLK2_DIV]		= &g12a_vclk2_div.hw,
>>   		[CLKID_VCLK]			= &g12a_vclk.hw,
>>   		[CLKID_VCLK2]			= &g12a_vclk2.hw,
>>   		[CLKID_VCLK_DIV1]		= &g12a_vclk_div1.hw,
>> -		[CLKID_VCLK_DIV2_EN]		= &g12a_vclk_div2_en.hw,
>> -		[CLKID_VCLK_DIV4_EN]		= &g12a_vclk_div4_en.hw,
>> -		[CLKID_VCLK_DIV6_EN]		= &g12a_vclk_div6_en.hw,
>> -		[CLKID_VCLK_DIV12_EN]		= &g12a_vclk_div12_en.hw,
>> +		[CLKID_PRIV_VCLK_DIV2_EN]	= &g12a_vclk_div2_en.hw,
>> +		[CLKID_PRIV_VCLK_DIV4_EN]	= &g12a_vclk_div4_en.hw,
>> +		[CLKID_PRIV_VCLK_DIV6_EN]	= &g12a_vclk_div6_en.hw,
>> +		[CLKID_PRIV_VCLK_DIV12_EN]	= &g12a_vclk_div12_en.hw,
>>   		[CLKID_VCLK2_DIV1]		= &g12a_vclk2_div1.hw,
>> -		[CLKID_VCLK2_DIV2_EN]		= &g12a_vclk2_div2_en.hw,
>> -		[CLKID_VCLK2_DIV4_EN]		= &g12a_vclk2_div4_en.hw,
>> -		[CLKID_VCLK2_DIV6_EN]		= &g12a_vclk2_div6_en.hw,
>> -		[CLKID_VCLK2_DIV12_EN]		= &g12a_vclk2_div12_en.hw,
>> +		[CLKID_PRIV_VCLK2_DIV2_EN]	= &g12a_vclk2_div2_en.hw,
>> +		[CLKID_PRIV_VCLK2_DIV4_EN]	= &g12a_vclk2_div4_en.hw,
>> +		[CLKID_PRIV_VCLK2_DIV6_EN]	= &g12a_vclk2_div6_en.hw,
>> +		[CLKID_PRIV_VCLK2_DIV12_EN]	= &g12a_vclk2_div12_en.hw,
>>   		[CLKID_VCLK_DIV2]		= &g12a_vclk_div2.hw,
>>   		[CLKID_VCLK_DIV4]		= &g12a_vclk_div4.hw,
>>   		[CLKID_VCLK_DIV6]		= &g12a_vclk_div6.hw,
>> @@ -4404,69 +4404,69 @@ static struct clk_hw_onecell_data g12a_hw_onecell_data = {
>>   		[CLKID_VCLK2_DIV4]		= &g12a_vclk2_div4.hw,
>>   		[CLKID_VCLK2_DIV6]		= &g12a_vclk2_div6.hw,
>>   		[CLKID_VCLK2_DIV12]		= &g12a_vclk2_div12.hw,
>> -		[CLKID_CTS_ENCI_SEL]		= &g12a_cts_enci_sel.hw,
>> -		[CLKID_CTS_ENCP_SEL]		= &g12a_cts_encp_sel.hw,
>> -		[CLKID_CTS_VDAC_SEL]		= &g12a_cts_vdac_sel.hw,
>> -		[CLKID_HDMI_TX_SEL]		= &g12a_hdmi_tx_sel.hw,
>> +		[CLKID_PRIV_CTS_ENCI_SEL]	= &g12a_cts_enci_sel.hw,
>> +		[CLKID_PRIV_CTS_ENCP_SEL]	= &g12a_cts_encp_sel.hw,
>> +		[CLKID_PRIV_CTS_VDAC_SEL]	= &g12a_cts_vdac_sel.hw,
>> +		[CLKID_PRIV_HDMI_TX_SEL]	= &g12a_hdmi_tx_sel.hw,
>>   		[CLKID_CTS_ENCI]		= &g12a_cts_enci.hw,
>>   		[CLKID_CTS_ENCP]		= &g12a_cts_encp.hw,
>>   		[CLKID_CTS_VDAC]		= &g12a_cts_vdac.hw,
>>   		[CLKID_HDMI_TX]			= &g12a_hdmi_tx.hw,
>> -		[CLKID_HDMI_SEL]		= &g12a_hdmi_sel.hw,
>> -		[CLKID_HDMI_DIV]		= &g12a_hdmi_div.hw,
>> +		[CLKID_PRIV_HDMI_SEL]		= &g12a_hdmi_sel.hw,
>> +		[CLKID_PRIV_HDMI_DIV]		= &g12a_hdmi_div.hw,
>>   		[CLKID_HDMI]			= &g12a_hdmi.hw,
>>   		[CLKID_MALI_0_SEL]		= &g12a_mali_0_sel.hw,
>> -		[CLKID_MALI_0_DIV]		= &g12a_mali_0_div.hw,
>> +		[CLKID_PRIV_MALI_0_DIV]		= &g12a_mali_0_div.hw,
>>   		[CLKID_MALI_0]			= &g12a_mali_0.hw,
>>   		[CLKID_MALI_1_SEL]		= &g12a_mali_1_sel.hw,
>> -		[CLKID_MALI_1_DIV]		= &g12a_mali_1_div.hw,
>> +		[CLKID_PRIV_MALI_1_DIV]		= &g12a_mali_1_div.hw,
>>   		[CLKID_MALI_1]			= &g12a_mali_1.hw,
>>   		[CLKID_MALI]			= &g12a_mali.hw,
>> -		[CLKID_MPLL_50M_DIV]		= &g12a_mpll_50m_div.hw,
>> +		[CLKID_PRIV_MPLL_50M_DIV]	= &g12a_mpll_50m_div.hw,
>>   		[CLKID_MPLL_50M]		= &g12a_mpll_50m.hw,
>> -		[CLKID_SYS_PLL_DIV16_EN]	= &g12a_sys_pll_div16_en.hw,
>> -		[CLKID_SYS_PLL_DIV16]		= &g12a_sys_pll_div16.hw,
>> -		[CLKID_CPU_CLK_DYN0_SEL]	= &g12a_cpu_clk_premux0.hw,
>> -		[CLKID_CPU_CLK_DYN0_DIV]	= &g12a_cpu_clk_mux0_div.hw,
>> -		[CLKID_CPU_CLK_DYN0]		= &g12a_cpu_clk_postmux0.hw,
>> -		[CLKID_CPU_CLK_DYN1_SEL]	= &g12a_cpu_clk_premux1.hw,
>> -		[CLKID_CPU_CLK_DYN1_DIV]	= &g12a_cpu_clk_mux1_div.hw,
>> -		[CLKID_CPU_CLK_DYN1]		= &g12a_cpu_clk_postmux1.hw,
>> -		[CLKID_CPU_CLK_DYN]		= &g12a_cpu_clk_dyn.hw,
>> +		[CLKID_PRIV_SYS_PLL_DIV16_EN]	= &g12a_sys_pll_div16_en.hw,
>> +		[CLKID_PRIV_SYS_PLL_DIV16]	= &g12a_sys_pll_div16.hw,
>> +		[CLKID_PRIV_CPU_CLK_DYN0_SEL]	= &g12a_cpu_clk_premux0.hw,
>> +		[CLKID_PRIV_CPU_CLK_DYN0_DIV]	= &g12a_cpu_clk_mux0_div.hw,
>> +		[CLKID_PRIV_CPU_CLK_DYN0]	= &g12a_cpu_clk_postmux0.hw,
>> +		[CLKID_PRIV_CPU_CLK_DYN1_SEL]	= &g12a_cpu_clk_premux1.hw,
>> +		[CLKID_PRIV_CPU_CLK_DYN1_DIV]	= &g12a_cpu_clk_mux1_div.hw,
>> +		[CLKID_PRIV_CPU_CLK_DYN1]	= &g12a_cpu_clk_postmux1.hw,
>> +		[CLKID_PRIV_CPU_CLK_DYN]	= &g12a_cpu_clk_dyn.hw,
>>   		[CLKID_CPU_CLK]			= &g12a_cpu_clk.hw,
>> -		[CLKID_CPU_CLK_DIV16_EN]	= &g12a_cpu_clk_div16_en.hw,
>> -		[CLKID_CPU_CLK_DIV16]		= &g12a_cpu_clk_div16.hw,
>> -		[CLKID_CPU_CLK_APB_DIV]		= &g12a_cpu_clk_apb_div.hw,
>> -		[CLKID_CPU_CLK_APB]		= &g12a_cpu_clk_apb.hw,
>> -		[CLKID_CPU_CLK_ATB_DIV]		= &g12a_cpu_clk_atb_div.hw,
>> -		[CLKID_CPU_CLK_ATB]		= &g12a_cpu_clk_atb.hw,
>> -		[CLKID_CPU_CLK_AXI_DIV]		= &g12a_cpu_clk_axi_div.hw,
>> -		[CLKID_CPU_CLK_AXI]		= &g12a_cpu_clk_axi.hw,
>> -		[CLKID_CPU_CLK_TRACE_DIV]	= &g12a_cpu_clk_trace_div.hw,
>> -		[CLKID_CPU_CLK_TRACE]		= &g12a_cpu_clk_trace.hw,
>> -		[CLKID_PCIE_PLL_DCO]		= &g12a_pcie_pll_dco.hw,
>> -		[CLKID_PCIE_PLL_DCO_DIV2]	= &g12a_pcie_pll_dco_div2.hw,
>> -		[CLKID_PCIE_PLL_OD]		= &g12a_pcie_pll_od.hw,
>> +		[CLKID_PRIV_CPU_CLK_DIV16_EN]	= &g12a_cpu_clk_div16_en.hw,
>> +		[CLKID_PRIV_CPU_CLK_DIV16]	= &g12a_cpu_clk_div16.hw,
>> +		[CLKID_PRIV_CPU_CLK_APB_DIV]	= &g12a_cpu_clk_apb_div.hw,
>> +		[CLKID_PRIV_CPU_CLK_APB]	= &g12a_cpu_clk_apb.hw,
>> +		[CLKID_PRIV_CPU_CLK_ATB_DIV]	= &g12a_cpu_clk_atb_div.hw,
>> +		[CLKID_PRIV_CPU_CLK_ATB]	= &g12a_cpu_clk_atb.hw,
>> +		[CLKID_PRIV_CPU_CLK_AXI_DIV]	= &g12a_cpu_clk_axi_div.hw,
>> +		[CLKID_PRIV_CPU_CLK_AXI]	= &g12a_cpu_clk_axi.hw,
>> +		[CLKID_PRIV_CPU_CLK_TRACE_DIV]	= &g12a_cpu_clk_trace_div.hw,
>> +		[CLKID_PRIV_CPU_CLK_TRACE]	= &g12a_cpu_clk_trace.hw,
>> +		[CLKID_PRIV_PCIE_PLL_DCO]	= &g12a_pcie_pll_dco.hw,
>> +		[CLKID_PRIV_PCIE_PLL_DCO_DIV2]	= &g12a_pcie_pll_dco_div2.hw,
>> +		[CLKID_PRIV_PCIE_PLL_OD]	= &g12a_pcie_pll_od.hw,
>>   		[CLKID_PCIE_PLL]		= &g12a_pcie_pll.hw,
>> -		[CLKID_VDEC_1_SEL]		= &g12a_vdec_1_sel.hw,
>> -		[CLKID_VDEC_1_DIV]		= &g12a_vdec_1_div.hw,
>> +		[CLKID_PRIV_VDEC_1_SEL]		= &g12a_vdec_1_sel.hw,
>> +		[CLKID_PRIV_VDEC_1_DIV]		= &g12a_vdec_1_div.hw,
>>   		[CLKID_VDEC_1]			= &g12a_vdec_1.hw,
>> -		[CLKID_VDEC_HEVC_SEL]		= &g12a_vdec_hevc_sel.hw,
>> -		[CLKID_VDEC_HEVC_DIV]		= &g12a_vdec_hevc_div.hw,
>> +		[CLKID_PRIV_VDEC_HEVC_SEL]	= &g12a_vdec_hevc_sel.hw,
>> +		[CLKID_PRIV_VDEC_HEVC_DIV]	= &g12a_vdec_hevc_div.hw,
>>   		[CLKID_VDEC_HEVC]		= &g12a_vdec_hevc.hw,
>> -		[CLKID_VDEC_HEVCF_SEL]		= &g12a_vdec_hevcf_sel.hw,
>> -		[CLKID_VDEC_HEVCF_DIV]		= &g12a_vdec_hevcf_div.hw,
>> +		[CLKID_PRIV_VDEC_HEVCF_SEL]	= &g12a_vdec_hevcf_sel.hw,
>> +		[CLKID_PRIV_VDEC_HEVCF_DIV]	= &g12a_vdec_hevcf_div.hw,
>>   		[CLKID_VDEC_HEVCF]		= &g12a_vdec_hevcf.hw,
>> -		[CLKID_TS_DIV]			= &g12a_ts_div.hw,
>> +		[CLKID_PRIV_TS_DIV]		= &g12a_ts_div.hw,
>>   		[CLKID_TS]			= &g12a_ts.hw,
>> -		[CLKID_SPICC0_SCLK_SEL]		= &g12a_spicc0_sclk_sel.hw,
>> -		[CLKID_SPICC0_SCLK_DIV]		= &g12a_spicc0_sclk_div.hw,
>> +		[CLKID_PRIV_SPICC0_SCLK_SEL]	= &g12a_spicc0_sclk_sel.hw,
>> +		[CLKID_PRIV_SPICC0_SCLK_DIV]	= &g12a_spicc0_sclk_div.hw,
>>   		[CLKID_SPICC0_SCLK]		= &g12a_spicc0_sclk.hw,
>> -		[CLKID_SPICC1_SCLK_SEL]		= &g12a_spicc1_sclk_sel.hw,
>> -		[CLKID_SPICC1_SCLK_DIV]		= &g12a_spicc1_sclk_div.hw,
>> +		[CLKID_PRIV_SPICC1_SCLK_SEL]	= &g12a_spicc1_sclk_sel.hw,
>> +		[CLKID_PRIV_SPICC1_SCLK_DIV]	= &g12a_spicc1_sclk_div.hw,
>>   		[CLKID_SPICC1_SCLK]		= &g12a_spicc1_sclk.hw,
>>   		[CLKID_MIPI_DSI_PXCLK_SEL]	= &g12a_mipi_dsi_pxclk_sel.hw,
>> -		[CLKID_MIPI_DSI_PXCLK_DIV]	= &g12a_mipi_dsi_pxclk_div.hw,
>> +		[CLKID_PRIV_MIPI_DSI_PXCLK_DIV]	= &g12a_mipi_dsi_pxclk_div.hw,
>>   		[CLKID_MIPI_DSI_PXCLK]		= &g12a_mipi_dsi_pxclk.hw,
>>   		[NR_CLKS]			= NULL,
>>   	},
>> @@ -4484,8 +4484,8 @@ static struct clk_hw_onecell_data g12b_hw_onecell_data = {
>>   		[CLKID_FCLK_DIV7]		= &g12a_fclk_div7.hw,
>>   		[CLKID_FCLK_DIV2P5]		= &g12a_fclk_div2p5.hw,
>>   		[CLKID_GP0_PLL]			= &g12a_gp0_pll.hw,
>> -		[CLKID_MPEG_SEL]		= &g12a_mpeg_clk_sel.hw,
>> -		[CLKID_MPEG_DIV]		= &g12a_mpeg_clk_div.hw,
>> +		[CLKID_PRIV_MPEG_SEL]		= &g12a_mpeg_clk_sel.hw,
>> +		[CLKID_PRIV_MPEG_DIV]		= &g12a_mpeg_clk_div.hw,
>>   		[CLKID_CLK81]			= &g12a_clk81.hw,
>>   		[CLKID_MPLL0]			= &g12a_mpll0.hw,
>>   		[CLKID_MPLL1]			= &g12a_mpll1.hw,
>> @@ -4536,25 +4536,25 @@ static struct clk_hw_onecell_data g12b_hw_onecell_data = {
>>   		[CLKID_UART2]			= &g12a_uart2.hw,
>>   		[CLKID_VPU_INTR]		= &g12a_vpu_intr.hw,
>>   		[CLKID_GIC]			= &g12a_gic.hw,
>> -		[CLKID_SD_EMMC_A_CLK0_SEL]	= &g12a_sd_emmc_a_clk0_sel.hw,
>> -		[CLKID_SD_EMMC_A_CLK0_DIV]	= &g12a_sd_emmc_a_clk0_div.hw,
>> +		[CLKID_PRIV_SD_EMMC_A_CLK0_SEL]	= &g12a_sd_emmc_a_clk0_sel.hw,
>> +		[CLKID_PRIV_SD_EMMC_A_CLK0_DIV]	= &g12a_sd_emmc_a_clk0_div.hw,
>>   		[CLKID_SD_EMMC_A_CLK0]		= &g12a_sd_emmc_a_clk0.hw,
>> -		[CLKID_SD_EMMC_B_CLK0_SEL]	= &g12a_sd_emmc_b_clk0_sel.hw,
>> -		[CLKID_SD_EMMC_B_CLK0_DIV]	= &g12a_sd_emmc_b_clk0_div.hw,
>> +		[CLKID_PRIV_SD_EMMC_B_CLK0_SEL]	= &g12a_sd_emmc_b_clk0_sel.hw,
>> +		[CLKID_PRIV_SD_EMMC_B_CLK0_DIV]	= &g12a_sd_emmc_b_clk0_div.hw,
>>   		[CLKID_SD_EMMC_B_CLK0]		= &g12a_sd_emmc_b_clk0.hw,
>> -		[CLKID_SD_EMMC_C_CLK0_SEL]	= &g12a_sd_emmc_c_clk0_sel.hw,
>> -		[CLKID_SD_EMMC_C_CLK0_DIV]	= &g12a_sd_emmc_c_clk0_div.hw,
>> +		[CLKID_PRIV_SD_EMMC_C_CLK0_SEL]	= &g12a_sd_emmc_c_clk0_sel.hw,
>> +		[CLKID_PRIV_SD_EMMC_C_CLK0_DIV]	= &g12a_sd_emmc_c_clk0_div.hw,
>>   		[CLKID_SD_EMMC_C_CLK0]		= &g12a_sd_emmc_c_clk0.hw,
>> -		[CLKID_MPLL0_DIV]		= &g12a_mpll0_div.hw,
>> -		[CLKID_MPLL1_DIV]		= &g12a_mpll1_div.hw,
>> -		[CLKID_MPLL2_DIV]		= &g12a_mpll2_div.hw,
>> -		[CLKID_MPLL3_DIV]		= &g12a_mpll3_div.hw,
>> -		[CLKID_FCLK_DIV2_DIV]		= &g12a_fclk_div2_div.hw,
>> -		[CLKID_FCLK_DIV3_DIV]		= &g12a_fclk_div3_div.hw,
>> -		[CLKID_FCLK_DIV4_DIV]		= &g12a_fclk_div4_div.hw,
>> -		[CLKID_FCLK_DIV5_DIV]		= &g12a_fclk_div5_div.hw,
>> -		[CLKID_FCLK_DIV7_DIV]		= &g12a_fclk_div7_div.hw,
>> -		[CLKID_FCLK_DIV2P5_DIV]		= &g12a_fclk_div2p5_div.hw,
>> +		[CLKID_PRIV_MPLL0_DIV]		= &g12a_mpll0_div.hw,
>> +		[CLKID_PRIV_MPLL1_DIV]		= &g12a_mpll1_div.hw,
>> +		[CLKID_PRIV_MPLL2_DIV]		= &g12a_mpll2_div.hw,
>> +		[CLKID_PRIV_MPLL3_DIV]		= &g12a_mpll3_div.hw,
>> +		[CLKID_PRIV_FCLK_DIV2_DIV]	= &g12a_fclk_div2_div.hw,
>> +		[CLKID_PRIV_FCLK_DIV3_DIV]	= &g12a_fclk_div3_div.hw,
>> +		[CLKID_PRIV_FCLK_DIV4_DIV]	= &g12a_fclk_div4_div.hw,
>> +		[CLKID_PRIV_FCLK_DIV5_DIV]	= &g12a_fclk_div5_div.hw,
>> +		[CLKID_PRIV_FCLK_DIV7_DIV]	= &g12a_fclk_div7_div.hw,
>> +		[CLKID_PRIV_FCLK_DIV2P5_DIV]	= &g12a_fclk_div2p5_div.hw,
>>   		[CLKID_HIFI_PLL]		= &g12a_hifi_pll.hw,
>>   		[CLKID_VCLK2_VENCI0]		= &g12a_vclk2_venci0.hw,
>>   		[CLKID_VCLK2_VENCI1]		= &g12a_vclk2_venci1.hw,
>> @@ -4575,56 +4575,56 @@ static struct clk_hw_onecell_data g12b_hw_onecell_data = {
>>   		[CLKID_VCLK2_VENCLMMC]		= &g12a_vclk2_venclmmc.hw,
>>   		[CLKID_VCLK2_VENCL]		= &g12a_vclk2_vencl.hw,
>>   		[CLKID_VCLK2_OTHER1]		= &g12a_vclk2_other1.hw,
>> -		[CLKID_FIXED_PLL_DCO]		= &g12a_fixed_pll_dco.hw,
>> -		[CLKID_SYS_PLL_DCO]		= &g12a_sys_pll_dco.hw,
>> -		[CLKID_GP0_PLL_DCO]		= &g12a_gp0_pll_dco.hw,
>> -		[CLKID_HIFI_PLL_DCO]		= &g12a_hifi_pll_dco.hw,
>> +		[CLKID_PRIV_FIXED_PLL_DCO]	= &g12a_fixed_pll_dco.hw,
>> +		[CLKID_PRIV_SYS_PLL_DCO]	= &g12a_sys_pll_dco.hw,
>> +		[CLKID_PRIV_GP0_PLL_DCO]	= &g12a_gp0_pll_dco.hw,
>> +		[CLKID_PRIV_HIFI_PLL_DCO]	= &g12a_hifi_pll_dco.hw,
>>   		[CLKID_DMA]			= &g12a_dma.hw,
>>   		[CLKID_EFUSE]			= &g12a_efuse.hw,
>>   		[CLKID_ROM_BOOT]		= &g12a_rom_boot.hw,
>>   		[CLKID_RESET_SEC]		= &g12a_reset_sec.hw,
>>   		[CLKID_SEC_AHB_APB3]		= &g12a_sec_ahb_apb3.hw,
>> -		[CLKID_MPLL_PREDIV]		= &g12a_mpll_prediv.hw,
>> +		[CLKID_PRIV_MPLL_PREDIV]	= &g12a_mpll_prediv.hw,
>>   		[CLKID_VPU_0_SEL]		= &g12a_vpu_0_sel.hw,
>> -		[CLKID_VPU_0_DIV]		= &g12a_vpu_0_div.hw,
>> +		[CLKID_PRIV_VPU_0_DIV]		= &g12a_vpu_0_div.hw,
>>   		[CLKID_VPU_0]			= &g12a_vpu_0.hw,
>>   		[CLKID_VPU_1_SEL]		= &g12a_vpu_1_sel.hw,
>> -		[CLKID_VPU_1_DIV]		= &g12a_vpu_1_div.hw,
>> +		[CLKID_PRIV_VPU_1_DIV]		= &g12a_vpu_1_div.hw,
>>   		[CLKID_VPU_1]			= &g12a_vpu_1.hw,
>>   		[CLKID_VPU]			= &g12a_vpu.hw,
>>   		[CLKID_VAPB_0_SEL]		= &g12a_vapb_0_sel.hw,
>> -		[CLKID_VAPB_0_DIV]		= &g12a_vapb_0_div.hw,
>> +		[CLKID_PRIV_VAPB_0_DIV]		= &g12a_vapb_0_div.hw,
>>   		[CLKID_VAPB_0]			= &g12a_vapb_0.hw,
>>   		[CLKID_VAPB_1_SEL]		= &g12a_vapb_1_sel.hw,
>> -		[CLKID_VAPB_1_DIV]		= &g12a_vapb_1_div.hw,
>> +		[CLKID_PRIV_VAPB_1_DIV]		= &g12a_vapb_1_div.hw,
>>   		[CLKID_VAPB_1]			= &g12a_vapb_1.hw,
>>   		[CLKID_VAPB_SEL]		= &g12a_vapb_sel.hw,
>>   		[CLKID_VAPB]			= &g12a_vapb.hw,
>> -		[CLKID_HDMI_PLL_DCO]		= &g12a_hdmi_pll_dco.hw,
>> -		[CLKID_HDMI_PLL_OD]		= &g12a_hdmi_pll_od.hw,
>> -		[CLKID_HDMI_PLL_OD2]		= &g12a_hdmi_pll_od2.hw,
>> +		[CLKID_PRIV_HDMI_PLL_DCO]	= &g12a_hdmi_pll_dco.hw,
>> +		[CLKID_PRIV_HDMI_PLL_OD]	= &g12a_hdmi_pll_od.hw,
>> +		[CLKID_PRIV_HDMI_PLL_OD2]	= &g12a_hdmi_pll_od2.hw,
>>   		[CLKID_HDMI_PLL]		= &g12a_hdmi_pll.hw,
>>   		[CLKID_VID_PLL]			= &g12a_vid_pll_div.hw,
>> -		[CLKID_VID_PLL_SEL]		= &g12a_vid_pll_sel.hw,
>> -		[CLKID_VID_PLL_DIV]		= &g12a_vid_pll.hw,
>> -		[CLKID_VCLK_SEL]		= &g12a_vclk_sel.hw,
>> -		[CLKID_VCLK2_SEL]		= &g12a_vclk2_sel.hw,
>> -		[CLKID_VCLK_INPUT]		= &g12a_vclk_input.hw,
>> -		[CLKID_VCLK2_INPUT]		= &g12a_vclk2_input.hw,
>> -		[CLKID_VCLK_DIV]		= &g12a_vclk_div.hw,
>> -		[CLKID_VCLK2_DIV]		= &g12a_vclk2_div.hw,
>> +		[CLKID_PRIV_VID_PLL_SEL]	= &g12a_vid_pll_sel.hw,
>> +		[CLKID_PRIV_VID_PLL_DIV]	= &g12a_vid_pll.hw,
>> +		[CLKID_PRIV_VCLK_SEL]		= &g12a_vclk_sel.hw,
>> +		[CLKID_PRIV_VCLK2_SEL]		= &g12a_vclk2_sel.hw,
>> +		[CLKID_PRIV_VCLK_INPUT]		= &g12a_vclk_input.hw,
>> +		[CLKID_PRIV_VCLK2_INPUT]	= &g12a_vclk2_input.hw,
>> +		[CLKID_PRIV_VCLK_DIV]		= &g12a_vclk_div.hw,
>> +		[CLKID_PRIV_VCLK2_DIV]		= &g12a_vclk2_div.hw,
>>   		[CLKID_VCLK]			= &g12a_vclk.hw,
>>   		[CLKID_VCLK2]			= &g12a_vclk2.hw,
>>   		[CLKID_VCLK_DIV1]		= &g12a_vclk_div1.hw,
>> -		[CLKID_VCLK_DIV2_EN]		= &g12a_vclk_div2_en.hw,
>> -		[CLKID_VCLK_DIV4_EN]		= &g12a_vclk_div4_en.hw,
>> -		[CLKID_VCLK_DIV6_EN]		= &g12a_vclk_div6_en.hw,
>> -		[CLKID_VCLK_DIV12_EN]		= &g12a_vclk_div12_en.hw,
>> +		[CLKID_PRIV_VCLK_DIV2_EN]	= &g12a_vclk_div2_en.hw,
>> +		[CLKID_PRIV_VCLK_DIV4_EN]	= &g12a_vclk_div4_en.hw,
>> +		[CLKID_PRIV_VCLK_DIV6_EN]	= &g12a_vclk_div6_en.hw,
>> +		[CLKID_PRIV_VCLK_DIV12_EN]	= &g12a_vclk_div12_en.hw,
>>   		[CLKID_VCLK2_DIV1]		= &g12a_vclk2_div1.hw,
>> -		[CLKID_VCLK2_DIV2_EN]		= &g12a_vclk2_div2_en.hw,
>> -		[CLKID_VCLK2_DIV4_EN]		= &g12a_vclk2_div4_en.hw,
>> -		[CLKID_VCLK2_DIV6_EN]		= &g12a_vclk2_div6_en.hw,
>> -		[CLKID_VCLK2_DIV12_EN]		= &g12a_vclk2_div12_en.hw,
>> +		[CLKID_PRIV_VCLK2_DIV2_EN]	= &g12a_vclk2_div2_en.hw,
>> +		[CLKID_PRIV_VCLK2_DIV4_EN]	= &g12a_vclk2_div4_en.hw,
>> +		[CLKID_PRIV_VCLK2_DIV6_EN]	= &g12a_vclk2_div6_en.hw,
>> +		[CLKID_PRIV_VCLK2_DIV12_EN]	= &g12a_vclk2_div12_en.hw,
>>   		[CLKID_VCLK_DIV2]		= &g12a_vclk_div2.hw,
>>   		[CLKID_VCLK_DIV4]		= &g12a_vclk_div4.hw,
>>   		[CLKID_VCLK_DIV6]		= &g12a_vclk_div6.hw,
>> @@ -4633,104 +4633,104 @@ static struct clk_hw_onecell_data g12b_hw_onecell_data = {
>>   		[CLKID_VCLK2_DIV4]		= &g12a_vclk2_div4.hw,
>>   		[CLKID_VCLK2_DIV6]		= &g12a_vclk2_div6.hw,
>>   		[CLKID_VCLK2_DIV12]		= &g12a_vclk2_div12.hw,
>> -		[CLKID_CTS_ENCI_SEL]		= &g12a_cts_enci_sel.hw,
>> -		[CLKID_CTS_ENCP_SEL]		= &g12a_cts_encp_sel.hw,
>> -		[CLKID_CTS_VDAC_SEL]		= &g12a_cts_vdac_sel.hw,
>> -		[CLKID_HDMI_TX_SEL]		= &g12a_hdmi_tx_sel.hw,
>> +		[CLKID_PRIV_CTS_ENCI_SEL]	= &g12a_cts_enci_sel.hw,
>> +		[CLKID_PRIV_CTS_ENCP_SEL]	= &g12a_cts_encp_sel.hw,
>> +		[CLKID_PRIV_CTS_VDAC_SEL]	= &g12a_cts_vdac_sel.hw,
>> +		[CLKID_PRIV_HDMI_TX_SEL]	= &g12a_hdmi_tx_sel.hw,
>>   		[CLKID_CTS_ENCI]		= &g12a_cts_enci.hw,
>>   		[CLKID_CTS_ENCP]		= &g12a_cts_encp.hw,
>>   		[CLKID_CTS_VDAC]		= &g12a_cts_vdac.hw,
>>   		[CLKID_HDMI_TX]			= &g12a_hdmi_tx.hw,
>> -		[CLKID_HDMI_SEL]		= &g12a_hdmi_sel.hw,
>> -		[CLKID_HDMI_DIV]		= &g12a_hdmi_div.hw,
>> +		[CLKID_PRIV_HDMI_SEL]		= &g12a_hdmi_sel.hw,
>> +		[CLKID_PRIV_HDMI_DIV]		= &g12a_hdmi_div.hw,
>>   		[CLKID_HDMI]			= &g12a_hdmi.hw,
>>   		[CLKID_MALI_0_SEL]		= &g12a_mali_0_sel.hw,
>> -		[CLKID_MALI_0_DIV]		= &g12a_mali_0_div.hw,
>> +		[CLKID_PRIV_MALI_0_DIV]		= &g12a_mali_0_div.hw,
>>   		[CLKID_MALI_0]			= &g12a_mali_0.hw,
>>   		[CLKID_MALI_1_SEL]		= &g12a_mali_1_sel.hw,
>> -		[CLKID_MALI_1_DIV]		= &g12a_mali_1_div.hw,
>> +		[CLKID_PRIV_MALI_1_DIV]		= &g12a_mali_1_div.hw,
>>   		[CLKID_MALI_1]			= &g12a_mali_1.hw,
>>   		[CLKID_MALI]			= &g12a_mali.hw,
>> -		[CLKID_MPLL_50M_DIV]		= &g12a_mpll_50m_div.hw,
>> +		[CLKID_PRIV_MPLL_50M_DIV]	= &g12a_mpll_50m_div.hw,
>>   		[CLKID_MPLL_50M]		= &g12a_mpll_50m.hw,
>> -		[CLKID_SYS_PLL_DIV16_EN]	= &g12a_sys_pll_div16_en.hw,
>> -		[CLKID_SYS_PLL_DIV16]		= &g12a_sys_pll_div16.hw,
>> -		[CLKID_CPU_CLK_DYN0_SEL]	= &g12a_cpu_clk_premux0.hw,
>> -		[CLKID_CPU_CLK_DYN0_DIV]	= &g12a_cpu_clk_mux0_div.hw,
>> -		[CLKID_CPU_CLK_DYN0]		= &g12a_cpu_clk_postmux0.hw,
>> -		[CLKID_CPU_CLK_DYN1_SEL]	= &g12a_cpu_clk_premux1.hw,
>> -		[CLKID_CPU_CLK_DYN1_DIV]	= &g12a_cpu_clk_mux1_div.hw,
>> -		[CLKID_CPU_CLK_DYN1]		= &g12a_cpu_clk_postmux1.hw,
>> -		[CLKID_CPU_CLK_DYN]		= &g12a_cpu_clk_dyn.hw,
>> +		[CLKID_PRIV_SYS_PLL_DIV16_EN]	= &g12a_sys_pll_div16_en.hw,
>> +		[CLKID_PRIV_SYS_PLL_DIV16]	= &g12a_sys_pll_div16.hw,
>> +		[CLKID_PRIV_CPU_CLK_DYN0_SEL]	= &g12a_cpu_clk_premux0.hw,
>> +		[CLKID_PRIV_CPU_CLK_DYN0_DIV]	= &g12a_cpu_clk_mux0_div.hw,
>> +		[CLKID_PRIV_CPU_CLK_DYN0]	= &g12a_cpu_clk_postmux0.hw,
>> +		[CLKID_PRIV_CPU_CLK_DYN1_SEL]	= &g12a_cpu_clk_premux1.hw,
>> +		[CLKID_PRIV_CPU_CLK_DYN1_DIV]	= &g12a_cpu_clk_mux1_div.hw,
>> +		[CLKID_PRIV_CPU_CLK_DYN1]	= &g12a_cpu_clk_postmux1.hw,
>> +		[CLKID_PRIV_CPU_CLK_DYN]	= &g12a_cpu_clk_dyn.hw,
>>   		[CLKID_CPU_CLK]			= &g12b_cpu_clk.hw,
>> -		[CLKID_CPU_CLK_DIV16_EN]	= &g12a_cpu_clk_div16_en.hw,
>> -		[CLKID_CPU_CLK_DIV16]		= &g12a_cpu_clk_div16.hw,
>> -		[CLKID_CPU_CLK_APB_DIV]		= &g12a_cpu_clk_apb_div.hw,
>> -		[CLKID_CPU_CLK_APB]		= &g12a_cpu_clk_apb.hw,
>> -		[CLKID_CPU_CLK_ATB_DIV]		= &g12a_cpu_clk_atb_div.hw,
>> -		[CLKID_CPU_CLK_ATB]		= &g12a_cpu_clk_atb.hw,
>> -		[CLKID_CPU_CLK_AXI_DIV]		= &g12a_cpu_clk_axi_div.hw,
>> -		[CLKID_CPU_CLK_AXI]		= &g12a_cpu_clk_axi.hw,
>> -		[CLKID_CPU_CLK_TRACE_DIV]	= &g12a_cpu_clk_trace_div.hw,
>> -		[CLKID_CPU_CLK_TRACE]		= &g12a_cpu_clk_trace.hw,
>> -		[CLKID_PCIE_PLL_DCO]		= &g12a_pcie_pll_dco.hw,
>> -		[CLKID_PCIE_PLL_DCO_DIV2]	= &g12a_pcie_pll_dco_div2.hw,
>> -		[CLKID_PCIE_PLL_OD]		= &g12a_pcie_pll_od.hw,
>> +		[CLKID_PRIV_CPU_CLK_DIV16_EN]	= &g12a_cpu_clk_div16_en.hw,
>> +		[CLKID_PRIV_CPU_CLK_DIV16]	= &g12a_cpu_clk_div16.hw,
>> +		[CLKID_PRIV_CPU_CLK_APB_DIV]	= &g12a_cpu_clk_apb_div.hw,
>> +		[CLKID_PRIV_CPU_CLK_APB]	= &g12a_cpu_clk_apb.hw,
>> +		[CLKID_PRIV_CPU_CLK_ATB_DIV]	= &g12a_cpu_clk_atb_div.hw,
>> +		[CLKID_PRIV_CPU_CLK_ATB]	= &g12a_cpu_clk_atb.hw,
>> +		[CLKID_PRIV_CPU_CLK_AXI_DIV]	= &g12a_cpu_clk_axi_div.hw,
>> +		[CLKID_PRIV_CPU_CLK_AXI]	= &g12a_cpu_clk_axi.hw,
>> +		[CLKID_PRIV_CPU_CLK_TRACE_DIV]	= &g12a_cpu_clk_trace_div.hw,
>> +		[CLKID_PRIV_CPU_CLK_TRACE]	= &g12a_cpu_clk_trace.hw,
>> +		[CLKID_PRIV_PCIE_PLL_DCO]	= &g12a_pcie_pll_dco.hw,
>> +		[CLKID_PRIV_PCIE_PLL_DCO_DIV2]	= &g12a_pcie_pll_dco_div2.hw,
>> +		[CLKID_PRIV_PCIE_PLL_OD]	= &g12a_pcie_pll_od.hw,
>>   		[CLKID_PCIE_PLL]		= &g12a_pcie_pll.hw,
>> -		[CLKID_VDEC_1_SEL]		= &g12a_vdec_1_sel.hw,
>> -		[CLKID_VDEC_1_DIV]		= &g12a_vdec_1_div.hw,
>> +		[CLKID_PRIV_VDEC_1_SEL]		= &g12a_vdec_1_sel.hw,
>> +		[CLKID_PRIV_VDEC_1_DIV]		= &g12a_vdec_1_div.hw,
>>   		[CLKID_VDEC_1]			= &g12a_vdec_1.hw,
>> -		[CLKID_VDEC_HEVC_SEL]		= &g12a_vdec_hevc_sel.hw,
>> -		[CLKID_VDEC_HEVC_DIV]		= &g12a_vdec_hevc_div.hw,
>> +		[CLKID_PRIV_VDEC_HEVC_SEL]	= &g12a_vdec_hevc_sel.hw,
>> +		[CLKID_PRIV_VDEC_HEVC_DIV]	= &g12a_vdec_hevc_div.hw,
>>   		[CLKID_VDEC_HEVC]		= &g12a_vdec_hevc.hw,
>> -		[CLKID_VDEC_HEVCF_SEL]		= &g12a_vdec_hevcf_sel.hw,
>> -		[CLKID_VDEC_HEVCF_DIV]		= &g12a_vdec_hevcf_div.hw,
>> +		[CLKID_PRIV_VDEC_HEVCF_SEL]	= &g12a_vdec_hevcf_sel.hw,
>> +		[CLKID_PRIV_VDEC_HEVCF_DIV]	= &g12a_vdec_hevcf_div.hw,
>>   		[CLKID_VDEC_HEVCF]		= &g12a_vdec_hevcf.hw,
>> -		[CLKID_TS_DIV]			= &g12a_ts_div.hw,
>> +		[CLKID_PRIV_TS_DIV]		= &g12a_ts_div.hw,
>>   		[CLKID_TS]			= &g12a_ts.hw,
>> -		[CLKID_SYS1_PLL_DCO]		= &g12b_sys1_pll_dco.hw,
>> -		[CLKID_SYS1_PLL]		= &g12b_sys1_pll.hw,
>> -		[CLKID_SYS1_PLL_DIV16_EN]	= &g12b_sys1_pll_div16_en.hw,
>> -		[CLKID_SYS1_PLL_DIV16]		= &g12b_sys1_pll_div16.hw,
>> -		[CLKID_CPUB_CLK_DYN0_SEL]	= &g12b_cpub_clk_premux0.hw,
>> -		[CLKID_CPUB_CLK_DYN0_DIV]	= &g12b_cpub_clk_mux0_div.hw,
>> -		[CLKID_CPUB_CLK_DYN0]		= &g12b_cpub_clk_postmux0.hw,
>> -		[CLKID_CPUB_CLK_DYN1_SEL]	= &g12b_cpub_clk_premux1.hw,
>> -		[CLKID_CPUB_CLK_DYN1_DIV]	= &g12b_cpub_clk_mux1_div.hw,
>> -		[CLKID_CPUB_CLK_DYN1]		= &g12b_cpub_clk_postmux1.hw,
>> -		[CLKID_CPUB_CLK_DYN]		= &g12b_cpub_clk_dyn.hw,
>> +		[CLKID_PRIV_SYS1_PLL_DCO]	= &g12b_sys1_pll_dco.hw,
>> +		[CLKID_PRIV_SYS1_PLL]		= &g12b_sys1_pll.hw,
>> +		[CLKID_PRIV_SYS1_PLL_DIV16_EN]	= &g12b_sys1_pll_div16_en.hw,
>> +		[CLKID_PRIV_SYS1_PLL_DIV16]	= &g12b_sys1_pll_div16.hw,
>> +		[CLKID_PRIV_CPUB_CLK_DYN0_SEL]	= &g12b_cpub_clk_premux0.hw,
>> +		[CLKID_PRIV_CPUB_CLK_DYN0_DIV]	= &g12b_cpub_clk_mux0_div.hw,
>> +		[CLKID_PRIV_CPUB_CLK_DYN0]	= &g12b_cpub_clk_postmux0.hw,
>> +		[CLKID_PRIV_CPUB_CLK_DYN1_SEL]	= &g12b_cpub_clk_premux1.hw,
>> +		[CLKID_PRIV_CPUB_CLK_DYN1_DIV]	= &g12b_cpub_clk_mux1_div.hw,
>> +		[CLKID_PRIV_CPUB_CLK_DYN1]	= &g12b_cpub_clk_postmux1.hw,
>> +		[CLKID_PRIV_CPUB_CLK_DYN]	= &g12b_cpub_clk_dyn.hw,
>>   		[CLKID_CPUB_CLK]		= &g12b_cpub_clk.hw,
>> -		[CLKID_CPUB_CLK_DIV16_EN]	= &g12b_cpub_clk_div16_en.hw,
>> -		[CLKID_CPUB_CLK_DIV16]		= &g12b_cpub_clk_div16.hw,
>> -		[CLKID_CPUB_CLK_DIV2]		= &g12b_cpub_clk_div2.hw,
>> -		[CLKID_CPUB_CLK_DIV3]		= &g12b_cpub_clk_div3.hw,
>> -		[CLKID_CPUB_CLK_DIV4]		= &g12b_cpub_clk_div4.hw,
>> -		[CLKID_CPUB_CLK_DIV5]		= &g12b_cpub_clk_div5.hw,
>> -		[CLKID_CPUB_CLK_DIV6]		= &g12b_cpub_clk_div6.hw,
>> -		[CLKID_CPUB_CLK_DIV7]		= &g12b_cpub_clk_div7.hw,
>> -		[CLKID_CPUB_CLK_DIV8]		= &g12b_cpub_clk_div8.hw,
>> -		[CLKID_CPUB_CLK_APB_SEL]	= &g12b_cpub_clk_apb_sel.hw,
>> -		[CLKID_CPUB_CLK_APB]		= &g12b_cpub_clk_apb.hw,
>> -		[CLKID_CPUB_CLK_ATB_SEL]	= &g12b_cpub_clk_atb_sel.hw,
>> -		[CLKID_CPUB_CLK_ATB]		= &g12b_cpub_clk_atb.hw,
>> -		[CLKID_CPUB_CLK_AXI_SEL]	= &g12b_cpub_clk_axi_sel.hw,
>> -		[CLKID_CPUB_CLK_AXI]		= &g12b_cpub_clk_axi.hw,
>> -		[CLKID_CPUB_CLK_TRACE_SEL]	= &g12b_cpub_clk_trace_sel.hw,
>> -		[CLKID_CPUB_CLK_TRACE]		= &g12b_cpub_clk_trace.hw,
>> -		[CLKID_SPICC0_SCLK_SEL]		= &g12a_spicc0_sclk_sel.hw,
>> -		[CLKID_SPICC0_SCLK_DIV]		= &g12a_spicc0_sclk_div.hw,
>> +		[CLKID_PRIV_CPUB_CLK_DIV16_EN]	= &g12b_cpub_clk_div16_en.hw,
>> +		[CLKID_PRIV_CPUB_CLK_DIV16]	= &g12b_cpub_clk_div16.hw,
>> +		[CLKID_PRIV_CPUB_CLK_DIV2]	= &g12b_cpub_clk_div2.hw,
>> +		[CLKID_PRIV_CPUB_CLK_DIV3]	= &g12b_cpub_clk_div3.hw,
>> +		[CLKID_PRIV_CPUB_CLK_DIV4]	= &g12b_cpub_clk_div4.hw,
>> +		[CLKID_PRIV_CPUB_CLK_DIV5]	= &g12b_cpub_clk_div5.hw,
>> +		[CLKID_PRIV_CPUB_CLK_DIV6]	= &g12b_cpub_clk_div6.hw,
>> +		[CLKID_PRIV_CPUB_CLK_DIV7]	= &g12b_cpub_clk_div7.hw,
>> +		[CLKID_PRIV_CPUB_CLK_DIV8]	= &g12b_cpub_clk_div8.hw,
>> +		[CLKID_PRIV_CPUB_CLK_APB_SEL]	= &g12b_cpub_clk_apb_sel.hw,
>> +		[CLKID_PRIV_CPUB_CLK_APB]	= &g12b_cpub_clk_apb.hw,
>> +		[CLKID_PRIV_CPUB_CLK_ATB_SEL]	= &g12b_cpub_clk_atb_sel.hw,
>> +		[CLKID_PRIV_CPUB_CLK_ATB]	= &g12b_cpub_clk_atb.hw,
>> +		[CLKID_PRIV_CPUB_CLK_AXI_SEL]	= &g12b_cpub_clk_axi_sel.hw,
>> +		[CLKID_PRIV_CPUB_CLK_AXI]	= &g12b_cpub_clk_axi.hw,
>> +		[CLKID_PRIV_CPUB_CLK_TRACE_SEL]	= &g12b_cpub_clk_trace_sel.hw,
>> +		[CLKID_PRIV_CPUB_CLK_TRACE]	= &g12b_cpub_clk_trace.hw,
>> +		[CLKID_PRIV_SPICC0_SCLK_SEL]	= &g12a_spicc0_sclk_sel.hw,
>> +		[CLKID_PRIV_SPICC0_SCLK_DIV]	= &g12a_spicc0_sclk_div.hw,
>>   		[CLKID_SPICC0_SCLK]		= &g12a_spicc0_sclk.hw,
>> -		[CLKID_SPICC1_SCLK_SEL]		= &g12a_spicc1_sclk_sel.hw,
>> -		[CLKID_SPICC1_SCLK_DIV]		= &g12a_spicc1_sclk_div.hw,
>> +		[CLKID_PRIV_SPICC1_SCLK_SEL]	= &g12a_spicc1_sclk_sel.hw,
>> +		[CLKID_PRIV_SPICC1_SCLK_DIV]	= &g12a_spicc1_sclk_div.hw,
>>   		[CLKID_SPICC1_SCLK]		= &g12a_spicc1_sclk.hw,
>> -		[CLKID_NNA_AXI_CLK_SEL]		= &sm1_nna_axi_clk_sel.hw,
>> -		[CLKID_NNA_AXI_CLK_DIV]		= &sm1_nna_axi_clk_div.hw,
>> +		[CLKID_PRIV_NNA_AXI_CLK_SEL]	= &sm1_nna_axi_clk_sel.hw,
>> +		[CLKID_PRIV_NNA_AXI_CLK_DIV]	= &sm1_nna_axi_clk_div.hw,
>>   		[CLKID_NNA_AXI_CLK]		= &sm1_nna_axi_clk.hw,
>> -		[CLKID_NNA_CORE_CLK_SEL]	= &sm1_nna_core_clk_sel.hw,
>> -		[CLKID_NNA_CORE_CLK_DIV]	= &sm1_nna_core_clk_div.hw,
>> +		[CLKID_PRIV_NNA_CORE_CLK_SEL]	= &sm1_nna_core_clk_sel.hw,
>> +		[CLKID_PRIV_NNA_CORE_CLK_DIV]	= &sm1_nna_core_clk_div.hw,
>>   		[CLKID_NNA_CORE_CLK]		= &sm1_nna_core_clk.hw,
>>   		[CLKID_MIPI_DSI_PXCLK_SEL]	= &g12a_mipi_dsi_pxclk_sel.hw,
>> -		[CLKID_MIPI_DSI_PXCLK_DIV]	= &g12a_mipi_dsi_pxclk_div.hw,
>> +		[CLKID_PRIV_MIPI_DSI_PXCLK_DIV]	= &g12a_mipi_dsi_pxclk_div.hw,
>>   		[CLKID_MIPI_DSI_PXCLK]		= &g12a_mipi_dsi_pxclk.hw,
>>   		[NR_CLKS]			= NULL,
>>   	},
>> @@ -4748,8 +4748,8 @@ static struct clk_hw_onecell_data sm1_hw_onecell_data = {
>>   		[CLKID_FCLK_DIV7]		= &g12a_fclk_div7.hw,
>>   		[CLKID_FCLK_DIV2P5]		= &g12a_fclk_div2p5.hw,
>>   		[CLKID_GP0_PLL]			= &g12a_gp0_pll.hw,
>> -		[CLKID_MPEG_SEL]		= &g12a_mpeg_clk_sel.hw,
>> -		[CLKID_MPEG_DIV]		= &g12a_mpeg_clk_div.hw,
>> +		[CLKID_PRIV_MPEG_SEL]		= &g12a_mpeg_clk_sel.hw,
>> +		[CLKID_PRIV_MPEG_DIV]		= &g12a_mpeg_clk_div.hw,
>>   		[CLKID_CLK81]			= &g12a_clk81.hw,
>>   		[CLKID_MPLL0]			= &g12a_mpll0.hw,
>>   		[CLKID_MPLL1]			= &g12a_mpll1.hw,
>> @@ -4800,25 +4800,25 @@ static struct clk_hw_onecell_data sm1_hw_onecell_data = {
>>   		[CLKID_UART2]			= &g12a_uart2.hw,
>>   		[CLKID_VPU_INTR]		= &g12a_vpu_intr.hw,
>>   		[CLKID_GIC]			= &g12a_gic.hw,
>> -		[CLKID_SD_EMMC_A_CLK0_SEL]	= &g12a_sd_emmc_a_clk0_sel.hw,
>> -		[CLKID_SD_EMMC_A_CLK0_DIV]	= &g12a_sd_emmc_a_clk0_div.hw,
>> +		[CLKID_PRIV_SD_EMMC_A_CLK0_SEL]	= &g12a_sd_emmc_a_clk0_sel.hw,
>> +		[CLKID_PRIV_SD_EMMC_A_CLK0_DIV]	= &g12a_sd_emmc_a_clk0_div.hw,
>>   		[CLKID_SD_EMMC_A_CLK0]		= &g12a_sd_emmc_a_clk0.hw,
>> -		[CLKID_SD_EMMC_B_CLK0_SEL]	= &g12a_sd_emmc_b_clk0_sel.hw,
>> -		[CLKID_SD_EMMC_B_CLK0_DIV]	= &g12a_sd_emmc_b_clk0_div.hw,
>> +		[CLKID_PRIV_SD_EMMC_B_CLK0_SEL]	= &g12a_sd_emmc_b_clk0_sel.hw,
>> +		[CLKID_PRIV_SD_EMMC_B_CLK0_DIV]	= &g12a_sd_emmc_b_clk0_div.hw,
>>   		[CLKID_SD_EMMC_B_CLK0]		= &g12a_sd_emmc_b_clk0.hw,
>> -		[CLKID_SD_EMMC_C_CLK0_SEL]	= &g12a_sd_emmc_c_clk0_sel.hw,
>> -		[CLKID_SD_EMMC_C_CLK0_DIV]	= &g12a_sd_emmc_c_clk0_div.hw,
>> +		[CLKID_PRIV_SD_EMMC_C_CLK0_SEL]	= &g12a_sd_emmc_c_clk0_sel.hw,
>> +		[CLKID_PRIV_SD_EMMC_C_CLK0_DIV]	= &g12a_sd_emmc_c_clk0_div.hw,
>>   		[CLKID_SD_EMMC_C_CLK0]		= &g12a_sd_emmc_c_clk0.hw,
>> -		[CLKID_MPLL0_DIV]		= &g12a_mpll0_div.hw,
>> -		[CLKID_MPLL1_DIV]		= &g12a_mpll1_div.hw,
>> -		[CLKID_MPLL2_DIV]		= &g12a_mpll2_div.hw,
>> -		[CLKID_MPLL3_DIV]		= &g12a_mpll3_div.hw,
>> -		[CLKID_FCLK_DIV2_DIV]		= &g12a_fclk_div2_div.hw,
>> -		[CLKID_FCLK_DIV3_DIV]		= &g12a_fclk_div3_div.hw,
>> -		[CLKID_FCLK_DIV4_DIV]		= &g12a_fclk_div4_div.hw,
>> -		[CLKID_FCLK_DIV5_DIV]		= &g12a_fclk_div5_div.hw,
>> -		[CLKID_FCLK_DIV7_DIV]		= &g12a_fclk_div7_div.hw,
>> -		[CLKID_FCLK_DIV2P5_DIV]		= &g12a_fclk_div2p5_div.hw,
>> +		[CLKID_PRIV_MPLL0_DIV]		= &g12a_mpll0_div.hw,
>> +		[CLKID_PRIV_MPLL1_DIV]		= &g12a_mpll1_div.hw,
>> +		[CLKID_PRIV_MPLL2_DIV]		= &g12a_mpll2_div.hw,
>> +		[CLKID_PRIV_MPLL3_DIV]		= &g12a_mpll3_div.hw,
>> +		[CLKID_PRIV_FCLK_DIV2_DIV]	= &g12a_fclk_div2_div.hw,
>> +		[CLKID_PRIV_FCLK_DIV3_DIV]	= &g12a_fclk_div3_div.hw,
>> +		[CLKID_PRIV_FCLK_DIV4_DIV]	= &g12a_fclk_div4_div.hw,
>> +		[CLKID_PRIV_FCLK_DIV5_DIV]	= &g12a_fclk_div5_div.hw,
>> +		[CLKID_PRIV_FCLK_DIV7_DIV]	= &g12a_fclk_div7_div.hw,
>> +		[CLKID_PRIV_FCLK_DIV2P5_DIV]	= &g12a_fclk_div2p5_div.hw,
>>   		[CLKID_HIFI_PLL]		= &g12a_hifi_pll.hw,
>>   		[CLKID_VCLK2_VENCI0]		= &g12a_vclk2_venci0.hw,
>>   		[CLKID_VCLK2_VENCI1]		= &g12a_vclk2_venci1.hw,
>> @@ -4839,56 +4839,56 @@ static struct clk_hw_onecell_data sm1_hw_onecell_data = {
>>   		[CLKID_VCLK2_VENCLMMC]		= &g12a_vclk2_venclmmc.hw,
>>   		[CLKID_VCLK2_VENCL]		= &g12a_vclk2_vencl.hw,
>>   		[CLKID_VCLK2_OTHER1]		= &g12a_vclk2_other1.hw,
>> -		[CLKID_FIXED_PLL_DCO]		= &g12a_fixed_pll_dco.hw,
>> -		[CLKID_SYS_PLL_DCO]		= &g12a_sys_pll_dco.hw,
>> -		[CLKID_GP0_PLL_DCO]		= &g12a_gp0_pll_dco.hw,
>> -		[CLKID_HIFI_PLL_DCO]		= &g12a_hifi_pll_dco.hw,
>> +		[CLKID_PRIV_FIXED_PLL_DCO]	= &g12a_fixed_pll_dco.hw,
>> +		[CLKID_PRIV_SYS_PLL_DCO]	= &g12a_sys_pll_dco.hw,
>> +		[CLKID_PRIV_GP0_PLL_DCO]	= &g12a_gp0_pll_dco.hw,
>> +		[CLKID_PRIV_HIFI_PLL_DCO]	= &g12a_hifi_pll_dco.hw,
>>   		[CLKID_DMA]			= &g12a_dma.hw,
>>   		[CLKID_EFUSE]			= &g12a_efuse.hw,
>>   		[CLKID_ROM_BOOT]		= &g12a_rom_boot.hw,
>>   		[CLKID_RESET_SEC]		= &g12a_reset_sec.hw,
>>   		[CLKID_SEC_AHB_APB3]		= &g12a_sec_ahb_apb3.hw,
>> -		[CLKID_MPLL_PREDIV]		= &g12a_mpll_prediv.hw,
>> +		[CLKID_PRIV_MPLL_PREDIV]	= &g12a_mpll_prediv.hw,
>>   		[CLKID_VPU_0_SEL]		= &g12a_vpu_0_sel.hw,
>> -		[CLKID_VPU_0_DIV]		= &g12a_vpu_0_div.hw,
>> +		[CLKID_PRIV_VPU_0_DIV]		= &g12a_vpu_0_div.hw,
>>   		[CLKID_VPU_0]			= &g12a_vpu_0.hw,
>>   		[CLKID_VPU_1_SEL]		= &g12a_vpu_1_sel.hw,
>> -		[CLKID_VPU_1_DIV]		= &g12a_vpu_1_div.hw,
>> +		[CLKID_PRIV_VPU_1_DIV]		= &g12a_vpu_1_div.hw,
>>   		[CLKID_VPU_1]			= &g12a_vpu_1.hw,
>>   		[CLKID_VPU]			= &g12a_vpu.hw,
>>   		[CLKID_VAPB_0_SEL]		= &g12a_vapb_0_sel.hw,
>> -		[CLKID_VAPB_0_DIV]		= &g12a_vapb_0_div.hw,
>> +		[CLKID_PRIV_VAPB_0_DIV]		= &g12a_vapb_0_div.hw,
>>   		[CLKID_VAPB_0]			= &g12a_vapb_0.hw,
>>   		[CLKID_VAPB_1_SEL]		= &g12a_vapb_1_sel.hw,
>> -		[CLKID_VAPB_1_DIV]		= &g12a_vapb_1_div.hw,
>> +		[CLKID_PRIV_VAPB_1_DIV]		= &g12a_vapb_1_div.hw,
>>   		[CLKID_VAPB_1]			= &g12a_vapb_1.hw,
>>   		[CLKID_VAPB_SEL]		= &g12a_vapb_sel.hw,
>>   		[CLKID_VAPB]			= &g12a_vapb.hw,
>> -		[CLKID_HDMI_PLL_DCO]		= &g12a_hdmi_pll_dco.hw,
>> -		[CLKID_HDMI_PLL_OD]		= &g12a_hdmi_pll_od.hw,
>> -		[CLKID_HDMI_PLL_OD2]		= &g12a_hdmi_pll_od2.hw,
>> +		[CLKID_PRIV_HDMI_PLL_DCO]	= &g12a_hdmi_pll_dco.hw,
>> +		[CLKID_PRIV_HDMI_PLL_OD]	= &g12a_hdmi_pll_od.hw,
>> +		[CLKID_PRIV_HDMI_PLL_OD2]	= &g12a_hdmi_pll_od2.hw,
>>   		[CLKID_HDMI_PLL]		= &g12a_hdmi_pll.hw,
>>   		[CLKID_VID_PLL]			= &g12a_vid_pll_div.hw,
>> -		[CLKID_VID_PLL_SEL]		= &g12a_vid_pll_sel.hw,
>> -		[CLKID_VID_PLL_DIV]		= &g12a_vid_pll.hw,
>> -		[CLKID_VCLK_SEL]		= &g12a_vclk_sel.hw,
>> -		[CLKID_VCLK2_SEL]		= &g12a_vclk2_sel.hw,
>> -		[CLKID_VCLK_INPUT]		= &g12a_vclk_input.hw,
>> -		[CLKID_VCLK2_INPUT]		= &g12a_vclk2_input.hw,
>> -		[CLKID_VCLK_DIV]		= &g12a_vclk_div.hw,
>> -		[CLKID_VCLK2_DIV]		= &g12a_vclk2_div.hw,
>> +		[CLKID_PRIV_VID_PLL_SEL]	= &g12a_vid_pll_sel.hw,
>> +		[CLKID_PRIV_VID_PLL_DIV]	= &g12a_vid_pll.hw,
>> +		[CLKID_PRIV_VCLK_SEL]		= &g12a_vclk_sel.hw,
>> +		[CLKID_PRIV_VCLK2_SEL]		= &g12a_vclk2_sel.hw,
>> +		[CLKID_PRIV_VCLK_INPUT]		= &g12a_vclk_input.hw,
>> +		[CLKID_PRIV_VCLK2_INPUT]	= &g12a_vclk2_input.hw,
>> +		[CLKID_PRIV_VCLK_DIV]		= &g12a_vclk_div.hw,
>> +		[CLKID_PRIV_VCLK2_DIV]		= &g12a_vclk2_div.hw,
>>   		[CLKID_VCLK]			= &g12a_vclk.hw,
>>   		[CLKID_VCLK2]			= &g12a_vclk2.hw,
>>   		[CLKID_VCLK_DIV1]		= &g12a_vclk_div1.hw,
>> -		[CLKID_VCLK_DIV2_EN]		= &g12a_vclk_div2_en.hw,
>> -		[CLKID_VCLK_DIV4_EN]		= &g12a_vclk_div4_en.hw,
>> -		[CLKID_VCLK_DIV6_EN]		= &g12a_vclk_div6_en.hw,
>> -		[CLKID_VCLK_DIV12_EN]		= &g12a_vclk_div12_en.hw,
>> +		[CLKID_PRIV_VCLK_DIV2_EN]	= &g12a_vclk_div2_en.hw,
>> +		[CLKID_PRIV_VCLK_DIV4_EN]	= &g12a_vclk_div4_en.hw,
>> +		[CLKID_PRIV_VCLK_DIV6_EN]	= &g12a_vclk_div6_en.hw,
>> +		[CLKID_PRIV_VCLK_DIV12_EN]	= &g12a_vclk_div12_en.hw,
>>   		[CLKID_VCLK2_DIV1]		= &g12a_vclk2_div1.hw,
>> -		[CLKID_VCLK2_DIV2_EN]		= &g12a_vclk2_div2_en.hw,
>> -		[CLKID_VCLK2_DIV4_EN]		= &g12a_vclk2_div4_en.hw,
>> -		[CLKID_VCLK2_DIV6_EN]		= &g12a_vclk2_div6_en.hw,
>> -		[CLKID_VCLK2_DIV12_EN]		= &g12a_vclk2_div12_en.hw,
>> +		[CLKID_PRIV_VCLK2_DIV2_EN]	= &g12a_vclk2_div2_en.hw,
>> +		[CLKID_PRIV_VCLK2_DIV4_EN]	= &g12a_vclk2_div4_en.hw,
>> +		[CLKID_PRIV_VCLK2_DIV6_EN]	= &g12a_vclk2_div6_en.hw,
>> +		[CLKID_PRIV_VCLK2_DIV12_EN]	= &g12a_vclk2_div12_en.hw,
>>   		[CLKID_VCLK_DIV2]		= &g12a_vclk_div2.hw,
>>   		[CLKID_VCLK_DIV4]		= &g12a_vclk_div4.hw,
>>   		[CLKID_VCLK_DIV6]		= &g12a_vclk_div6.hw,
>> @@ -4897,89 +4897,89 @@ static struct clk_hw_onecell_data sm1_hw_onecell_data = {
>>   		[CLKID_VCLK2_DIV4]		= &g12a_vclk2_div4.hw,
>>   		[CLKID_VCLK2_DIV6]		= &g12a_vclk2_div6.hw,
>>   		[CLKID_VCLK2_DIV12]		= &g12a_vclk2_div12.hw,
>> -		[CLKID_CTS_ENCI_SEL]		= &g12a_cts_enci_sel.hw,
>> -		[CLKID_CTS_ENCP_SEL]		= &g12a_cts_encp_sel.hw,
>> -		[CLKID_CTS_VDAC_SEL]		= &g12a_cts_vdac_sel.hw,
>> -		[CLKID_HDMI_TX_SEL]		= &g12a_hdmi_tx_sel.hw,
>> +		[CLKID_PRIV_CTS_ENCI_SEL]	= &g12a_cts_enci_sel.hw,
>> +		[CLKID_PRIV_CTS_ENCP_SEL]	= &g12a_cts_encp_sel.hw,
>> +		[CLKID_PRIV_CTS_VDAC_SEL]	= &g12a_cts_vdac_sel.hw,
>> +		[CLKID_PRIV_HDMI_TX_SEL]	= &g12a_hdmi_tx_sel.hw,
>>   		[CLKID_CTS_ENCI]		= &g12a_cts_enci.hw,
>>   		[CLKID_CTS_ENCP]		= &g12a_cts_encp.hw,
>>   		[CLKID_CTS_VDAC]		= &g12a_cts_vdac.hw,
>>   		[CLKID_HDMI_TX]			= &g12a_hdmi_tx.hw,
>> -		[CLKID_HDMI_SEL]		= &g12a_hdmi_sel.hw,
>> -		[CLKID_HDMI_DIV]		= &g12a_hdmi_div.hw,
>> +		[CLKID_PRIV_HDMI_SEL]		= &g12a_hdmi_sel.hw,
>> +		[CLKID_PRIV_HDMI_DIV]		= &g12a_hdmi_div.hw,
>>   		[CLKID_HDMI]			= &g12a_hdmi.hw,
>>   		[CLKID_MALI_0_SEL]		= &g12a_mali_0_sel.hw,
>> -		[CLKID_MALI_0_DIV]		= &g12a_mali_0_div.hw,
>> +		[CLKID_PRIV_MALI_0_DIV]		= &g12a_mali_0_div.hw,
>>   		[CLKID_MALI_0]			= &g12a_mali_0.hw,
>>   		[CLKID_MALI_1_SEL]		= &g12a_mali_1_sel.hw,
>> -		[CLKID_MALI_1_DIV]		= &g12a_mali_1_div.hw,
>> +		[CLKID_PRIV_MALI_1_DIV]		= &g12a_mali_1_div.hw,
>>   		[CLKID_MALI_1]			= &g12a_mali_1.hw,
>>   		[CLKID_MALI]			= &g12a_mali.hw,
>> -		[CLKID_MPLL_50M_DIV]		= &g12a_mpll_50m_div.hw,
>> +		[CLKID_PRIV_MPLL_50M_DIV]	= &g12a_mpll_50m_div.hw,
>>   		[CLKID_MPLL_50M]		= &g12a_mpll_50m.hw,
>> -		[CLKID_SYS_PLL_DIV16_EN]	= &g12a_sys_pll_div16_en.hw,
>> -		[CLKID_SYS_PLL_DIV16]		= &g12a_sys_pll_div16.hw,
>> -		[CLKID_CPU_CLK_DYN0_SEL]	= &g12a_cpu_clk_premux0.hw,
>> -		[CLKID_CPU_CLK_DYN0_DIV]	= &g12a_cpu_clk_mux0_div.hw,
>> -		[CLKID_CPU_CLK_DYN0]		= &g12a_cpu_clk_postmux0.hw,
>> -		[CLKID_CPU_CLK_DYN1_SEL]	= &g12a_cpu_clk_premux1.hw,
>> -		[CLKID_CPU_CLK_DYN1_DIV]	= &g12a_cpu_clk_mux1_div.hw,
>> -		[CLKID_CPU_CLK_DYN1]		= &g12a_cpu_clk_postmux1.hw,
>> -		[CLKID_CPU_CLK_DYN]		= &g12a_cpu_clk_dyn.hw,
>> +		[CLKID_PRIV_SYS_PLL_DIV16_EN]	= &g12a_sys_pll_div16_en.hw,
>> +		[CLKID_PRIV_SYS_PLL_DIV16]	= &g12a_sys_pll_div16.hw,
>> +		[CLKID_PRIV_CPU_CLK_DYN0_SEL]	= &g12a_cpu_clk_premux0.hw,
>> +		[CLKID_PRIV_CPU_CLK_DYN0_DIV]	= &g12a_cpu_clk_mux0_div.hw,
>> +		[CLKID_PRIV_CPU_CLK_DYN0]	= &g12a_cpu_clk_postmux0.hw,
>> +		[CLKID_PRIV_CPU_CLK_DYN1_SEL]	= &g12a_cpu_clk_premux1.hw,
>> +		[CLKID_PRIV_CPU_CLK_DYN1_DIV]	= &g12a_cpu_clk_mux1_div.hw,
>> +		[CLKID_PRIV_CPU_CLK_DYN1]	= &g12a_cpu_clk_postmux1.hw,
>> +		[CLKID_PRIV_CPU_CLK_DYN]	= &g12a_cpu_clk_dyn.hw,
>>   		[CLKID_CPU_CLK]			= &g12a_cpu_clk.hw,
>> -		[CLKID_CPU_CLK_DIV16_EN]	= &g12a_cpu_clk_div16_en.hw,
>> -		[CLKID_CPU_CLK_DIV16]		= &g12a_cpu_clk_div16.hw,
>> -		[CLKID_CPU_CLK_APB_DIV]		= &g12a_cpu_clk_apb_div.hw,
>> -		[CLKID_CPU_CLK_APB]		= &g12a_cpu_clk_apb.hw,
>> -		[CLKID_CPU_CLK_ATB_DIV]		= &g12a_cpu_clk_atb_div.hw,
>> -		[CLKID_CPU_CLK_ATB]		= &g12a_cpu_clk_atb.hw,
>> -		[CLKID_CPU_CLK_AXI_DIV]		= &g12a_cpu_clk_axi_div.hw,
>> -		[CLKID_CPU_CLK_AXI]		= &g12a_cpu_clk_axi.hw,
>> -		[CLKID_CPU_CLK_TRACE_DIV]	= &g12a_cpu_clk_trace_div.hw,
>> -		[CLKID_CPU_CLK_TRACE]		= &g12a_cpu_clk_trace.hw,
>> -		[CLKID_PCIE_PLL_DCO]		= &g12a_pcie_pll_dco.hw,
>> -		[CLKID_PCIE_PLL_DCO_DIV2]	= &g12a_pcie_pll_dco_div2.hw,
>> -		[CLKID_PCIE_PLL_OD]		= &g12a_pcie_pll_od.hw,
>> +		[CLKID_PRIV_CPU_CLK_DIV16_EN]	= &g12a_cpu_clk_div16_en.hw,
>> +		[CLKID_PRIV_CPU_CLK_DIV16]	= &g12a_cpu_clk_div16.hw,
>> +		[CLKID_PRIV_CPU_CLK_APB_DIV]	= &g12a_cpu_clk_apb_div.hw,
>> +		[CLKID_PRIV_CPU_CLK_APB]	= &g12a_cpu_clk_apb.hw,
>> +		[CLKID_PRIV_CPU_CLK_ATB_DIV]	= &g12a_cpu_clk_atb_div.hw,
>> +		[CLKID_PRIV_CPU_CLK_ATB]	= &g12a_cpu_clk_atb.hw,
>> +		[CLKID_PRIV_CPU_CLK_AXI_DIV]	= &g12a_cpu_clk_axi_div.hw,
>> +		[CLKID_PRIV_CPU_CLK_AXI]	= &g12a_cpu_clk_axi.hw,
>> +		[CLKID_PRIV_CPU_CLK_TRACE_DIV]	= &g12a_cpu_clk_trace_div.hw,
>> +		[CLKID_PRIV_CPU_CLK_TRACE]	= &g12a_cpu_clk_trace.hw,
>> +		[CLKID_PRIV_PCIE_PLL_DCO]	= &g12a_pcie_pll_dco.hw,
>> +		[CLKID_PRIV_PCIE_PLL_DCO_DIV2]	= &g12a_pcie_pll_dco_div2.hw,
>> +		[CLKID_PRIV_PCIE_PLL_OD]	= &g12a_pcie_pll_od.hw,
>>   		[CLKID_PCIE_PLL]		= &g12a_pcie_pll.hw,
>> -		[CLKID_VDEC_1_SEL]		= &g12a_vdec_1_sel.hw,
>> -		[CLKID_VDEC_1_DIV]		= &g12a_vdec_1_div.hw,
>> +		[CLKID_PRIV_VDEC_1_SEL]		= &g12a_vdec_1_sel.hw,
>> +		[CLKID_PRIV_VDEC_1_DIV]		= &g12a_vdec_1_div.hw,
>>   		[CLKID_VDEC_1]			= &g12a_vdec_1.hw,
>> -		[CLKID_VDEC_HEVC_SEL]		= &g12a_vdec_hevc_sel.hw,
>> -		[CLKID_VDEC_HEVC_DIV]		= &g12a_vdec_hevc_div.hw,
>> +		[CLKID_PRIV_VDEC_HEVC_SEL]	= &g12a_vdec_hevc_sel.hw,
>> +		[CLKID_PRIV_VDEC_HEVC_DIV]	= &g12a_vdec_hevc_div.hw,
>>   		[CLKID_VDEC_HEVC]		= &g12a_vdec_hevc.hw,
>> -		[CLKID_VDEC_HEVCF_SEL]		= &g12a_vdec_hevcf_sel.hw,
>> -		[CLKID_VDEC_HEVCF_DIV]		= &g12a_vdec_hevcf_div.hw,
>> +		[CLKID_PRIV_VDEC_HEVCF_SEL]	= &g12a_vdec_hevcf_sel.hw,
>> +		[CLKID_PRIV_VDEC_HEVCF_DIV]	= &g12a_vdec_hevcf_div.hw,
>>   		[CLKID_VDEC_HEVCF]		= &g12a_vdec_hevcf.hw,
>> -		[CLKID_TS_DIV]			= &g12a_ts_div.hw,
>> +		[CLKID_PRIV_TS_DIV]		= &g12a_ts_div.hw,
>>   		[CLKID_TS]			= &g12a_ts.hw,
>> -		[CLKID_GP1_PLL_DCO]		= &sm1_gp1_pll_dco.hw,
>> +		[CLKID_PRIV_GP1_PLL_DCO]	= &sm1_gp1_pll_dco.hw,
>>   		[CLKID_GP1_PLL]			= &sm1_gp1_pll.hw,
>> -		[CLKID_DSU_CLK_DYN0_SEL]	= &sm1_dsu_clk_premux0.hw,
>> -		[CLKID_DSU_CLK_DYN0_DIV]	= &sm1_dsu_clk_premux1.hw,
>> -		[CLKID_DSU_CLK_DYN0]		= &sm1_dsu_clk_mux0_div.hw,
>> -		[CLKID_DSU_CLK_DYN1_SEL]	= &sm1_dsu_clk_postmux0.hw,
>> -		[CLKID_DSU_CLK_DYN1_DIV]	= &sm1_dsu_clk_mux1_div.hw,
>> -		[CLKID_DSU_CLK_DYN1]		= &sm1_dsu_clk_postmux1.hw,
>> -		[CLKID_DSU_CLK_DYN]		= &sm1_dsu_clk_dyn.hw,
>> -		[CLKID_DSU_CLK_FINAL]		= &sm1_dsu_final_clk.hw,
>> +		[CLKID_PRIV_DSU_CLK_DYN0_SEL]	= &sm1_dsu_clk_premux0.hw,
>> +		[CLKID_PRIV_DSU_CLK_DYN0_DIV]	= &sm1_dsu_clk_premux1.hw,
>> +		[CLKID_PRIV_DSU_CLK_DYN0]	= &sm1_dsu_clk_mux0_div.hw,
>> +		[CLKID_PRIV_DSU_CLK_DYN1_SEL]	= &sm1_dsu_clk_postmux0.hw,
>> +		[CLKID_PRIV_DSU_CLK_DYN1_DIV]	= &sm1_dsu_clk_mux1_div.hw,
>> +		[CLKID_PRIV_DSU_CLK_DYN1]	= &sm1_dsu_clk_postmux1.hw,
>> +		[CLKID_PRIV_DSU_CLK_DYN]	= &sm1_dsu_clk_dyn.hw,
>> +		[CLKID_PRIV_DSU_CLK_FINAL]	= &sm1_dsu_final_clk.hw,
>>   		[CLKID_DSU_CLK]			= &sm1_dsu_clk.hw,
>>   		[CLKID_CPU1_CLK]		= &sm1_cpu1_clk.hw,
>>   		[CLKID_CPU2_CLK]		= &sm1_cpu2_clk.hw,
>>   		[CLKID_CPU3_CLK]		= &sm1_cpu3_clk.hw,
>> -		[CLKID_SPICC0_SCLK_SEL]		= &g12a_spicc0_sclk_sel.hw,
>> -		[CLKID_SPICC0_SCLK_DIV]		= &g12a_spicc0_sclk_div.hw,
>> +		[CLKID_PRIV_SPICC0_SCLK_SEL]	= &g12a_spicc0_sclk_sel.hw,
>> +		[CLKID_PRIV_SPICC0_SCLK_DIV]	= &g12a_spicc0_sclk_div.hw,
>>   		[CLKID_SPICC0_SCLK]		= &g12a_spicc0_sclk.hw,
>> -		[CLKID_SPICC1_SCLK_SEL]		= &g12a_spicc1_sclk_sel.hw,
>> -		[CLKID_SPICC1_SCLK_DIV]		= &g12a_spicc1_sclk_div.hw,
>> +		[CLKID_PRIV_SPICC1_SCLK_SEL]	= &g12a_spicc1_sclk_sel.hw,
>> +		[CLKID_PRIV_SPICC1_SCLK_DIV]	= &g12a_spicc1_sclk_div.hw,
>>   		[CLKID_SPICC1_SCLK]		= &g12a_spicc1_sclk.hw,
>> -		[CLKID_NNA_AXI_CLK_SEL]		= &sm1_nna_axi_clk_sel.hw,
>> -		[CLKID_NNA_AXI_CLK_DIV]		= &sm1_nna_axi_clk_div.hw,
>> +		[CLKID_PRIV_NNA_AXI_CLK_SEL]	= &sm1_nna_axi_clk_sel.hw,
>> +		[CLKID_PRIV_NNA_AXI_CLK_DIV]	= &sm1_nna_axi_clk_div.hw,
>>   		[CLKID_NNA_AXI_CLK]		= &sm1_nna_axi_clk.hw,
>> -		[CLKID_NNA_CORE_CLK_SEL]	= &sm1_nna_core_clk_sel.hw,
>> -		[CLKID_NNA_CORE_CLK_DIV]	= &sm1_nna_core_clk_div.hw,
>> +		[CLKID_PRIV_NNA_CORE_CLK_SEL]	= &sm1_nna_core_clk_sel.hw,
>> +		[CLKID_PRIV_NNA_CORE_CLK_DIV]	= &sm1_nna_core_clk_div.hw,
>>   		[CLKID_NNA_CORE_CLK]		= &sm1_nna_core_clk.hw,
>>   		[CLKID_MIPI_DSI_PXCLK_SEL]	= &g12a_mipi_dsi_pxclk_sel.hw,
>> -		[CLKID_MIPI_DSI_PXCLK_DIV]	= &g12a_mipi_dsi_pxclk_div.hw,
>> +		[CLKID_PRIV_MIPI_DSI_PXCLK_DIV]	= &g12a_mipi_dsi_pxclk_div.hw,
>>   		[CLKID_MIPI_DSI_PXCLK]		= &g12a_mipi_dsi_pxclk.hw,
>>   		[NR_CLKS]			= NULL,
>>   	},
>> @@ -5246,7 +5246,7 @@ static int meson_g12a_dvfs_setup_common(struct device *dev,
>>   	struct clk_hw *xtal;
>>   	int ret;
>>   
>> -	xtal = clk_hw_get_parent_by_index(hws[CLKID_CPU_CLK_DYN1_SEL], 0);
>> +	xtal = clk_hw_get_parent_by_index(hws[CLKID_PRIV_CPU_CLK_DYN1_SEL], 0);
>>   
>>   	/* Setup clock notifier for cpu_clk_postmux0 */
>>   	g12a_cpu_clk_postmux0_nb_data.xtal = xtal;
>> @@ -5284,7 +5284,7 @@ static int meson_g12b_dvfs_setup(struct platform_device *pdev)
>>   	if (ret)
>>   		return ret;
>>   
>> -	xtal = clk_hw_get_parent_by_index(hws[CLKID_CPU_CLK_DYN1_SEL], 0);
>> +	xtal = clk_hw_get_parent_by_index(hws[CLKID_PRIV_CPU_CLK_DYN1_SEL], 0);
>>   
>>   	/* Setup clock notifier for cpu_clk mux */
>>   	notifier_clk = devm_clk_hw_get_clk(dev, &g12b_cpu_clk.hw,
>> diff --git a/drivers/clk/meson/g12a.h b/drivers/clk/meson/g12a.h
>> index a97613df38b3..a57f4a9717db 100644
>> --- a/drivers/clk/meson/g12a.h
>> +++ b/drivers/clk/meson/g12a.h
>> @@ -135,136 +135,136 @@
>>    * to expose, such as the internal muxes and dividers of composite clocks,
>>    * will remain defined here.
>>    */
>> -#define CLKID_MPEG_SEL				8
>> -#define CLKID_MPEG_DIV				9
>> -#define CLKID_SD_EMMC_A_CLK0_SEL		63
>> -#define CLKID_SD_EMMC_A_CLK0_DIV		64
>> -#define CLKID_SD_EMMC_B_CLK0_SEL		65
>> -#define CLKID_SD_EMMC_B_CLK0_DIV		66
>> -#define CLKID_SD_EMMC_C_CLK0_SEL		67
>> -#define CLKID_SD_EMMC_C_CLK0_DIV		68
>> -#define CLKID_MPLL0_DIV				69
>> -#define CLKID_MPLL1_DIV				70
>> -#define CLKID_MPLL2_DIV				71
>> -#define CLKID_MPLL3_DIV				72
>> -#define CLKID_MPLL_PREDIV			73
>> -#define CLKID_FCLK_DIV2_DIV			75
>> -#define CLKID_FCLK_DIV3_DIV			76
>> -#define CLKID_FCLK_DIV4_DIV			77
>> -#define CLKID_FCLK_DIV5_DIV			78
>> -#define CLKID_FCLK_DIV7_DIV			79
>> -#define CLKID_FCLK_DIV2P5_DIV			100
>> -#define CLKID_FIXED_PLL_DCO			101
>> -#define CLKID_SYS_PLL_DCO			102
>> -#define CLKID_GP0_PLL_DCO			103
>> -#define CLKID_HIFI_PLL_DCO			104
>> -#define CLKID_VPU_0_DIV				111
>> -#define CLKID_VPU_1_DIV				114
>> -#define CLKID_VAPB_0_DIV			118
>> -#define CLKID_VAPB_1_DIV			121
>> -#define CLKID_HDMI_PLL_DCO			125
>> -#define CLKID_HDMI_PLL_OD			126
>> -#define CLKID_HDMI_PLL_OD2			127
>> -#define CLKID_VID_PLL_SEL			130
>> -#define CLKID_VID_PLL_DIV			131
>> -#define CLKID_VCLK_SEL				132
>> -#define CLKID_VCLK2_SEL				133
>> -#define CLKID_VCLK_INPUT			134
>> -#define CLKID_VCLK2_INPUT			135
>> -#define CLKID_VCLK_DIV				136
>> -#define CLKID_VCLK2_DIV				137
>> -#define CLKID_VCLK_DIV2_EN			140
>> -#define CLKID_VCLK_DIV4_EN			141
>> -#define CLKID_VCLK_DIV6_EN			142
>> -#define CLKID_VCLK_DIV12_EN			143
>> -#define CLKID_VCLK2_DIV2_EN			144
>> -#define CLKID_VCLK2_DIV4_EN			145
>> -#define CLKID_VCLK2_DIV6_EN			146
>> -#define CLKID_VCLK2_DIV12_EN			147
>> -#define CLKID_CTS_ENCI_SEL			158
>> -#define CLKID_CTS_ENCP_SEL			159
>> -#define CLKID_CTS_VDAC_SEL			160
>> -#define CLKID_HDMI_TX_SEL			161
>> -#define CLKID_HDMI_SEL				166
>> -#define CLKID_HDMI_DIV				167
>> -#define CLKID_MALI_0_DIV			170
>> -#define CLKID_MALI_1_DIV			173
>> -#define CLKID_MPLL_50M_DIV			176
>> -#define CLKID_SYS_PLL_DIV16_EN			178
>> -#define CLKID_SYS_PLL_DIV16			179
>> -#define CLKID_CPU_CLK_DYN0_SEL			180
>> -#define CLKID_CPU_CLK_DYN0_DIV			181
>> -#define CLKID_CPU_CLK_DYN0			182
>> -#define CLKID_CPU_CLK_DYN1_SEL			183
>> -#define CLKID_CPU_CLK_DYN1_DIV			184
>> -#define CLKID_CPU_CLK_DYN1			185
>> -#define CLKID_CPU_CLK_DYN			186
>> -#define CLKID_CPU_CLK_DIV16_EN			188
>> -#define CLKID_CPU_CLK_DIV16			189
>> -#define CLKID_CPU_CLK_APB_DIV			190
>> -#define CLKID_CPU_CLK_APB			191
>> -#define CLKID_CPU_CLK_ATB_DIV			192
>> -#define CLKID_CPU_CLK_ATB			193
>> -#define CLKID_CPU_CLK_AXI_DIV			194
>> -#define CLKID_CPU_CLK_AXI			195
>> -#define CLKID_CPU_CLK_TRACE_DIV			196
>> -#define CLKID_CPU_CLK_TRACE			197
>> -#define CLKID_PCIE_PLL_DCO			198
>> -#define CLKID_PCIE_PLL_DCO_DIV2			199
>> -#define CLKID_PCIE_PLL_OD			200
>> -#define CLKID_VDEC_1_SEL			202
>> -#define CLKID_VDEC_1_DIV			203
>> -#define CLKID_VDEC_HEVC_SEL			205
>> -#define CLKID_VDEC_HEVC_DIV			206
>> -#define CLKID_VDEC_HEVCF_SEL			208
>> -#define CLKID_VDEC_HEVCF_DIV			209
>> -#define CLKID_TS_DIV				211
>> -#define CLKID_SYS1_PLL_DCO			213
>> -#define CLKID_SYS1_PLL				214
>> -#define CLKID_SYS1_PLL_DIV16_EN			215
>> -#define CLKID_SYS1_PLL_DIV16			216
>> -#define CLKID_CPUB_CLK_DYN0_SEL			217
>> -#define CLKID_CPUB_CLK_DYN0_DIV			218
>> -#define CLKID_CPUB_CLK_DYN0			219
>> -#define CLKID_CPUB_CLK_DYN1_SEL			220
>> -#define CLKID_CPUB_CLK_DYN1_DIV			221
>> -#define CLKID_CPUB_CLK_DYN1			222
>> -#define CLKID_CPUB_CLK_DYN			223
>> -#define CLKID_CPUB_CLK_DIV16_EN			225
>> -#define CLKID_CPUB_CLK_DIV16			226
>> -#define CLKID_CPUB_CLK_DIV2			227
>> -#define CLKID_CPUB_CLK_DIV3			228
>> -#define CLKID_CPUB_CLK_DIV4			229
>> -#define CLKID_CPUB_CLK_DIV5			230
>> -#define CLKID_CPUB_CLK_DIV6			231
>> -#define CLKID_CPUB_CLK_DIV7			232
>> -#define CLKID_CPUB_CLK_DIV8			233
>> -#define CLKID_CPUB_CLK_APB_SEL			234
>> -#define CLKID_CPUB_CLK_APB			235
>> -#define CLKID_CPUB_CLK_ATB_SEL			236
>> -#define CLKID_CPUB_CLK_ATB			237
>> -#define CLKID_CPUB_CLK_AXI_SEL			238
>> -#define CLKID_CPUB_CLK_AXI			239
>> -#define CLKID_CPUB_CLK_TRACE_SEL		240
>> -#define CLKID_CPUB_CLK_TRACE			241
>> -#define CLKID_GP1_PLL_DCO			242
>> -#define CLKID_DSU_CLK_DYN0_SEL			244
>> -#define CLKID_DSU_CLK_DYN0_DIV			245
>> -#define CLKID_DSU_CLK_DYN0			246
>> -#define CLKID_DSU_CLK_DYN1_SEL			247
>> -#define CLKID_DSU_CLK_DYN1_DIV			248
>> -#define CLKID_DSU_CLK_DYN1			249
>> -#define CLKID_DSU_CLK_DYN			250
>> -#define CLKID_DSU_CLK_FINAL			251
>> -#define CLKID_SPICC0_SCLK_SEL			256
>> -#define CLKID_SPICC0_SCLK_DIV			257
>> -#define CLKID_SPICC1_SCLK_SEL			259
>> -#define CLKID_SPICC1_SCLK_DIV			260
>> -#define CLKID_NNA_AXI_CLK_SEL			262
>> -#define CLKID_NNA_AXI_CLK_DIV			263
>> -#define CLKID_NNA_CORE_CLK_SEL			265
>> -#define CLKID_NNA_CORE_CLK_DIV			266
>> -#define CLKID_MIPI_DSI_PXCLK_DIV		268
>> +#define CLKID_PRIV_MPEG_SEL			8
>> +#define CLKID_PRIV_MPEG_DIV			9
>> +#define CLKID_PRIV_SD_EMMC_A_CLK0_SEL		63
>> +#define CLKID_PRIV_SD_EMMC_A_CLK0_DIV		64
>> +#define CLKID_PRIV_SD_EMMC_B_CLK0_SEL		65
>> +#define CLKID_PRIV_SD_EMMC_B_CLK0_DIV		66
>> +#define CLKID_PRIV_SD_EMMC_C_CLK0_SEL		67
>> +#define CLKID_PRIV_SD_EMMC_C_CLK0_DIV		68
>> +#define CLKID_PRIV_MPLL0_DIV			69
>> +#define CLKID_PRIV_MPLL1_DIV			70
>> +#define CLKID_PRIV_MPLL2_DIV			71
>> +#define CLKID_PRIV_MPLL3_DIV			72
>> +#define CLKID_PRIV_MPLL_PREDIV			73
>> +#define CLKID_PRIV_FCLK_DIV2_DIV		75
>> +#define CLKID_PRIV_FCLK_DIV3_DIV		76
>> +#define CLKID_PRIV_FCLK_DIV4_DIV		77
>> +#define CLKID_PRIV_FCLK_DIV5_DIV		78
>> +#define CLKID_PRIV_FCLK_DIV7_DIV		79
>> +#define CLKID_PRIV_FCLK_DIV2P5_DIV		100
>> +#define CLKID_PRIV_FIXED_PLL_DCO		101
>> +#define CLKID_PRIV_SYS_PLL_DCO			102
>> +#define CLKID_PRIV_GP0_PLL_DCO			103
>> +#define CLKID_PRIV_HIFI_PLL_DCO			104
>> +#define CLKID_PRIV_VPU_0_DIV			111
>> +#define CLKID_PRIV_VPU_1_DIV			114
>> +#define CLKID_PRIV_VAPB_0_DIV			118
>> +#define CLKID_PRIV_VAPB_1_DIV			121
>> +#define CLKID_PRIV_HDMI_PLL_DCO			125
>> +#define CLKID_PRIV_HDMI_PLL_OD			126
>> +#define CLKID_PRIV_HDMI_PLL_OD2			127
>> +#define CLKID_PRIV_VID_PLL_SEL			130
>> +#define CLKID_PRIV_VID_PLL_DIV			131
>> +#define CLKID_PRIV_VCLK_SEL			132
>> +#define CLKID_PRIV_VCLK2_SEL			133
>> +#define CLKID_PRIV_VCLK_INPUT			134
>> +#define CLKID_PRIV_VCLK2_INPUT			135
>> +#define CLKID_PRIV_VCLK_DIV			136
>> +#define CLKID_PRIV_VCLK2_DIV			137
>> +#define CLKID_PRIV_VCLK_DIV2_EN			140
>> +#define CLKID_PRIV_VCLK_DIV4_EN			141
>> +#define CLKID_PRIV_VCLK_DIV6_EN			142
>> +#define CLKID_PRIV_VCLK_DIV12_EN		143
>> +#define CLKID_PRIV_VCLK2_DIV2_EN		144
>> +#define CLKID_PRIV_VCLK2_DIV4_EN		145
>> +#define CLKID_PRIV_VCLK2_DIV6_EN		146
>> +#define CLKID_PRIV_VCLK2_DIV12_EN		147
>> +#define CLKID_PRIV_CTS_ENCI_SEL			158
>> +#define CLKID_PRIV_CTS_ENCP_SEL			159
>> +#define CLKID_PRIV_CTS_VDAC_SEL			160
>> +#define CLKID_PRIV_HDMI_TX_SEL			161
>> +#define CLKID_PRIV_HDMI_SEL			166
>> +#define CLKID_PRIV_HDMI_DIV			167
>> +#define CLKID_PRIV_MALI_0_DIV			170
>> +#define CLKID_PRIV_MALI_1_DIV			173
>> +#define CLKID_PRIV_MPLL_50M_DIV			176
>> +#define CLKID_PRIV_SYS_PLL_DIV16_EN		178
>> +#define CLKID_PRIV_SYS_PLL_DIV16		179
>> +#define CLKID_PRIV_CPU_CLK_DYN0_SEL		180
>> +#define CLKID_PRIV_CPU_CLK_DYN0_DIV		181
>> +#define CLKID_PRIV_CPU_CLK_DYN0			182
>> +#define CLKID_PRIV_CPU_CLK_DYN1_SEL		183
>> +#define CLKID_PRIV_CPU_CLK_DYN1_DIV		184
>> +#define CLKID_PRIV_CPU_CLK_DYN1			185
>> +#define CLKID_PRIV_CPU_CLK_DYN			186
>> +#define CLKID_PRIV_CPU_CLK_DIV16_EN		188
>> +#define CLKID_PRIV_CPU_CLK_DIV16		189
>> +#define CLKID_PRIV_CPU_CLK_APB_DIV		190
>> +#define CLKID_PRIV_CPU_CLK_APB			191
>> +#define CLKID_PRIV_CPU_CLK_ATB_DIV		192
>> +#define CLKID_PRIV_CPU_CLK_ATB			193
>> +#define CLKID_PRIV_CPU_CLK_AXI_DIV		194
>> +#define CLKID_PRIV_CPU_CLK_AXI			195
>> +#define CLKID_PRIV_CPU_CLK_TRACE_DIV		196
>> +#define CLKID_PRIV_CPU_CLK_TRACE		197
>> +#define CLKID_PRIV_PCIE_PLL_DCO			198
>> +#define CLKID_PRIV_PCIE_PLL_DCO_DIV2		199
>> +#define CLKID_PRIV_PCIE_PLL_OD			200
>> +#define CLKID_PRIV_VDEC_1_SEL			202
>> +#define CLKID_PRIV_VDEC_1_DIV			203
>> +#define CLKID_PRIV_VDEC_HEVC_SEL		205
>> +#define CLKID_PRIV_VDEC_HEVC_DIV		206
>> +#define CLKID_PRIV_VDEC_HEVCF_SEL		208
>> +#define CLKID_PRIV_VDEC_HEVCF_DIV		209
>> +#define CLKID_PRIV_TS_DIV			211
>> +#define CLKID_PRIV_SYS1_PLL_DCO			213
>> +#define CLKID_PRIV_SYS1_PLL			214
>> +#define CLKID_PRIV_SYS1_PLL_DIV16_EN		215
>> +#define CLKID_PRIV_SYS1_PLL_DIV16		216
>> +#define CLKID_PRIV_CPUB_CLK_DYN0_SEL		217
>> +#define CLKID_PRIV_CPUB_CLK_DYN0_DIV		218
>> +#define CLKID_PRIV_CPUB_CLK_DYN0		219
>> +#define CLKID_PRIV_CPUB_CLK_DYN1_SEL		220
>> +#define CLKID_PRIV_CPUB_CLK_DYN1_DIV		221
>> +#define CLKID_PRIV_CPUB_CLK_DYN1		222
>> +#define CLKID_PRIV_CPUB_CLK_DYN			223
>> +#define CLKID_PRIV_CPUB_CLK_DIV16_EN		225
>> +#define CLKID_PRIV_CPUB_CLK_DIV16		226
>> +#define CLKID_PRIV_CPUB_CLK_DIV2		227
>> +#define CLKID_PRIV_CPUB_CLK_DIV3		228
>> +#define CLKID_PRIV_CPUB_CLK_DIV4		229
>> +#define CLKID_PRIV_CPUB_CLK_DIV5		230
>> +#define CLKID_PRIV_CPUB_CLK_DIV6		231
>> +#define CLKID_PRIV_CPUB_CLK_DIV7		232
>> +#define CLKID_PRIV_CPUB_CLK_DIV8		233
>> +#define CLKID_PRIV_CPUB_CLK_APB_SEL		234
>> +#define CLKID_PRIV_CPUB_CLK_APB			235
>> +#define CLKID_PRIV_CPUB_CLK_ATB_SEL		236
>> +#define CLKID_PRIV_CPUB_CLK_ATB			237
>> +#define CLKID_PRIV_CPUB_CLK_AXI_SEL		238
>> +#define CLKID_PRIV_CPUB_CLK_AXI			239
>> +#define CLKID_PRIV_CPUB_CLK_TRACE_SEL		240
>> +#define CLKID_PRIV_CPUB_CLK_TRACE		241
>> +#define CLKID_PRIV_GP1_PLL_DCO			242
>> +#define CLKID_PRIV_DSU_CLK_DYN0_SEL		244
>> +#define CLKID_PRIV_DSU_CLK_DYN0_DIV		245
>> +#define CLKID_PRIV_DSU_CLK_DYN0			246
>> +#define CLKID_PRIV_DSU_CLK_DYN1_SEL		247
>> +#define CLKID_PRIV_DSU_CLK_DYN1_DIV		248
>> +#define CLKID_PRIV_DSU_CLK_DYN1			249
>> +#define CLKID_PRIV_DSU_CLK_DYN			250
>> +#define CLKID_PRIV_DSU_CLK_FINAL		251
>> +#define CLKID_PRIV_SPICC0_SCLK_SEL		256
>> +#define CLKID_PRIV_SPICC0_SCLK_DIV		257
>> +#define CLKID_PRIV_SPICC1_SCLK_SEL		259
>> +#define CLKID_PRIV_SPICC1_SCLK_DIV		260
>> +#define CLKID_PRIV_NNA_AXI_CLK_SEL		262
>> +#define CLKID_PRIV_NNA_AXI_CLK_DIV		263
>> +#define CLKID_PRIV_NNA_CORE_CLK_SEL		265
>> +#define CLKID_PRIV_NNA_CORE_CLK_DIV		266
>> +#define CLKID_PRIV_MIPI_DSI_PXCLK_DIV		268
>>   
>>   #define NR_CLKS					271
> 

