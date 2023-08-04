Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4396076FE16
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 12:05:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5514B10E6DF;
	Fri,  4 Aug 2023 10:05:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 951F310E6C7
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 10:05:35 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3fe426b86a8so11327755e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Aug 2023 03:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691143534; x=1691748334;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=sIAHq/1jDJ3volIc3B0Sx8b1rEZsr7IKpdjE2ic5QtQ=;
 b=mJdQzSwdLEYwLjTBaMHEZAQDsxUVd4GMAa3xKNrfYj1fSK0OiyTHOJzBR1xt32jNs6
 AltykHPRKfVYdp3cpXfzbDxD8j7M7IClQb+JoHipgd6KDPBzySTzm18R9TIHNyq4mg2d
 Ns2UVY8lu8RKWYLwQA+hZAPT2fypAKXkxXnVpDi4PvnyXlnoFMDHsom+5PWz9oSQLWv2
 WTgcn0KcsUFJH6ovN73crXG1pNmQCfKPOQCcKLKHXXy/EU6JgbXuD3b5w39wz/eKPQYJ
 nQS+lT4KqXmCb1rw3mpAliVe6VbLBMtZJlyvixcG6y5edeRnJR0KEvudJSYZrNQ49IKC
 g3xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691143534; x=1691748334;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sIAHq/1jDJ3volIc3B0Sx8b1rEZsr7IKpdjE2ic5QtQ=;
 b=e8Y1mq2bIOdCbsVFXwdFW01X8e2o60oTAS1dTnwKdYynKMzHRJusieX++3edzXeVct
 5VE2XFBYkvuJI/VTyzGQCEd46w87VFf4BDb6w0A67O36Cazrffjj+Mg1ngHfy5O8hJ/D
 YXjqkqrPf+3zzR3STwjiFtSaP8uwbhroF6ium6+5RKVvLFMRltn4JKt7CfPP6aZlxI8w
 Uey5ZlWcsI2lnl5nHYbf7G1LiSm0h3PlfTJsF/0lB3eGsbcUu5T9t2p/DU/hxhsT4l16
 8XO0lTIKnSglSbF4myyQdQRtMKz301zZEIgAXF72zOhK4TzmvJXIIAO2mVnbIoPcksg3
 676g==
X-Gm-Message-State: AOJu0YwKBDg2ZG8gyzh4YZi581QAbwwQqsxahVMg9OaehbgRWvY9SsPK
 w1Ms4faYGgvhlLzQM3SSBbxEHA==
X-Google-Smtp-Source: AGHT+IGH4Lb1JAqeectx1kmXkYCj4I9jZw5adL/ue0DojFOxXUMNP7eZS19keqnL9K5i+ZqnM39YWA==
X-Received: by 2002:a05:600c:3641:b0:3fb:b1fd:4183 with SMTP id
 y1-20020a05600c364100b003fbb1fd4183mr1206423wmq.12.1691143534024; 
 Fri, 04 Aug 2023 03:05:34 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:b526:9083:f5a6:4af1?
 ([2a01:e0a:982:cbb0:b526:9083:f5a6:4af1])
 by smtp.gmail.com with ESMTPSA id
 y7-20020a05600c364700b003fe1c332810sm6340986wmq.33.2023.08.04.03.05.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Aug 2023 03:05:33 -0700 (PDT)
Message-ID: <9ece3407-9485-1925-a1ac-4fbc8a124fc4@linaro.org>
Date: Fri, 4 Aug 2023 12:05:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v7 2/9] clk: meson: g12a: add CTS_ENCL & CTS_ENCL_SEL
 clocks
Content-Language: en-US
To: Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jagan Teki <jagan@amarulasolutions.com>, Nicolas Belin <nbelin@baylibre.com>
References: <20230803-amlogic-v6-4-upstream-dsi-ccf-vim3-v7-0-762219fc5b28@linaro.org>
 <20230803-amlogic-v6-4-upstream-dsi-ccf-vim3-v7-2-762219fc5b28@linaro.org>
 <1j1qgjp1im.fsf@starbuckisacylon.baylibre.com>
Organization: Linaro Developer Services
In-Reply-To: <1j1qgjp1im.fsf@starbuckisacylon.baylibre.com>
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
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 04/08/2023 11:59, Jerome Brunet wrote:
> 
> On Thu 03 Aug 2023 at 14:03, Neil Armstrong <neil.armstrong@linaro.org> wrote:
> 
>> Add new CTS_ENCL & CTS_ENCL_SEL clocks for the G12A compatible
>> SoCs, they are used to feed the VPU LCD Pixel encoder used for
>> DSI display purposes.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   drivers/clk/meson/g12a.c | 40 ++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 40 insertions(+)
>>
>> diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
>> index ceabd5f4b2ac..5d62134335c1 100644
>> --- a/drivers/clk/meson/g12a.c
>> +++ b/drivers/clk/meson/g12a.c
>> @@ -3549,6 +3549,22 @@ static struct clk_regmap g12a_cts_encp_sel = {
>>   	},
>>   };
>>   
>> +static struct clk_regmap g12a_cts_encl_sel = {
>> +	.data = &(struct clk_regmap_mux_data){
>> +		.offset = HHI_VIID_CLK_DIV,
>> +		.mask = 0xf,
>> +		.shift = 12,
>> +		.table = mux_table_cts_sel,
>> +	},
>> +	.hw.init = &(struct clk_init_data){
>> +		.name = "cts_encl_sel",
>> +		.ops = &clk_regmap_mux_ops,
>> +		.parent_hws = g12a_cts_parent_hws,
>> +		.num_parents = ARRAY_SIZE(g12a_cts_parent_hws),
>> +		.flags = CLK_SET_RATE_NO_REPARENT | CLK_GET_RATE_NOCACHE,
> 
> Why nocache ?
> This is usually used when the consumer driver is poking around behind
> CCF back.
> 
> Any chance this can use assigned-parent or CCF directly ?
> 
>> +	},
>> +};
>> +
>>   static struct clk_regmap g12a_cts_vdac_sel = {
>>   	.data = &(struct clk_regmap_mux_data){
>>   		.offset = HHI_VIID_CLK_DIV,
>> @@ -3628,6 +3644,22 @@ static struct clk_regmap g12a_cts_encp = {
>>   	},
>>   };
>>   
>> +static struct clk_regmap g12a_cts_encl = {
>> +	.data = &(struct clk_regmap_gate_data){
>> +		.offset = HHI_VID_CLK_CNTL2,
>> +		.bit_idx = 3,
>> +	},
>> +	.hw.init = &(struct clk_init_data) {
>> +		.name = "cts_encl",
>> +		.ops = &clk_regmap_gate_ops,
>> +		.parent_hws = (const struct clk_hw *[]) {
>> +			&g12a_cts_encl_sel.hw
>> +		},
>> +		.num_parents = 1,
>> +		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
> 
> What is the reason for IGNORE_UNUSED ?
> If you need to keep the clock on while the driver comes up, please
> document it here.

The clocks are added like other video clock, unused & nocache, then
enabled correctly in patch 4 to be used by CCF.

Neil

> 
>> +	},
>> +};
>> +
>>   static struct clk_regmap g12a_cts_vdac = {
>>   	.data = &(struct clk_regmap_gate_data){
>>   		.offset = HHI_VID_CLK_CNTL2,
>> @@ -4407,10 +4439,12 @@ static struct clk_hw *g12a_hw_clks[] = {
>>   	[CLKID_VCLK2_DIV12]		= &g12a_vclk2_div12.hw,
>>   	[CLKID_CTS_ENCI_SEL]		= &g12a_cts_enci_sel.hw,
>>   	[CLKID_CTS_ENCP_SEL]		= &g12a_cts_encp_sel.hw,
>> +	[CLKID_CTS_ENCL_SEL]		= &g12a_cts_encl_sel.hw,
>>   	[CLKID_CTS_VDAC_SEL]		= &g12a_cts_vdac_sel.hw,
>>   	[CLKID_HDMI_TX_SEL]		= &g12a_hdmi_tx_sel.hw,
>>   	[CLKID_CTS_ENCI]		= &g12a_cts_enci.hw,
>>   	[CLKID_CTS_ENCP]		= &g12a_cts_encp.hw,
>> +	[CLKID_CTS_ENCL]		= &g12a_cts_encl.hw,
>>   	[CLKID_CTS_VDAC]		= &g12a_cts_vdac.hw,
>>   	[CLKID_HDMI_TX]			= &g12a_hdmi_tx.hw,
>>   	[CLKID_HDMI_SEL]		= &g12a_hdmi_sel.hw,
>> @@ -4632,10 +4666,12 @@ static struct clk_hw *g12b_hw_clks[] = {
>>   	[CLKID_VCLK2_DIV12]		= &g12a_vclk2_div12.hw,
>>   	[CLKID_CTS_ENCI_SEL]		= &g12a_cts_enci_sel.hw,
>>   	[CLKID_CTS_ENCP_SEL]		= &g12a_cts_encp_sel.hw,
>> +	[CLKID_CTS_ENCL_SEL]		= &g12a_cts_encl_sel.hw,
>>   	[CLKID_CTS_VDAC_SEL]		= &g12a_cts_vdac_sel.hw,
>>   	[CLKID_HDMI_TX_SEL]		= &g12a_hdmi_tx_sel.hw,
>>   	[CLKID_CTS_ENCI]		= &g12a_cts_enci.hw,
>>   	[CLKID_CTS_ENCP]		= &g12a_cts_encp.hw,
>> +	[CLKID_CTS_ENCL]		= &g12a_cts_encl.hw,
>>   	[CLKID_CTS_VDAC]		= &g12a_cts_vdac.hw,
>>   	[CLKID_HDMI_TX]			= &g12a_hdmi_tx.hw,
>>   	[CLKID_HDMI_SEL]		= &g12a_hdmi_sel.hw,
>> @@ -4892,10 +4928,12 @@ static struct clk_hw *sm1_hw_clks[] = {
>>   	[CLKID_VCLK2_DIV12]		= &g12a_vclk2_div12.hw,
>>   	[CLKID_CTS_ENCI_SEL]		= &g12a_cts_enci_sel.hw,
>>   	[CLKID_CTS_ENCP_SEL]		= &g12a_cts_encp_sel.hw,
>> +	[CLKID_CTS_ENCL_SEL]		= &g12a_cts_encl_sel.hw,
>>   	[CLKID_CTS_VDAC_SEL]		= &g12a_cts_vdac_sel.hw,
>>   	[CLKID_HDMI_TX_SEL]		= &g12a_hdmi_tx_sel.hw,
>>   	[CLKID_CTS_ENCI]		= &g12a_cts_enci.hw,
>>   	[CLKID_CTS_ENCP]		= &g12a_cts_encp.hw,
>> +	[CLKID_CTS_ENCL]		= &g12a_cts_encl.hw,
>>   	[CLKID_CTS_VDAC]		= &g12a_cts_vdac.hw,
>>   	[CLKID_HDMI_TX]			= &g12a_hdmi_tx.hw,
>>   	[CLKID_HDMI_SEL]		= &g12a_hdmi_sel.hw,
>> @@ -5123,10 +5161,12 @@ static struct clk_regmap *const g12a_clk_regmaps[] = {
>>   	&g12a_vclk2_div12_en,
>>   	&g12a_cts_enci_sel,
>>   	&g12a_cts_encp_sel,
>> +	&g12a_cts_encl_sel,
>>   	&g12a_cts_vdac_sel,
>>   	&g12a_hdmi_tx_sel,
>>   	&g12a_cts_enci,
>>   	&g12a_cts_encp,
>> +	&g12a_cts_encl,
>>   	&g12a_cts_vdac,
>>   	&g12a_hdmi_tx,
>>   	&g12a_hdmi_sel,
> 

