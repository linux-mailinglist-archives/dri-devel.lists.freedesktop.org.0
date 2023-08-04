Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A12376FE09
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 12:04:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 564EE10E143;
	Fri,  4 Aug 2023 10:04:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED25410E143
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 10:04:04 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3178dd771ceso1707794f8f.2
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Aug 2023 03:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1691143443; x=1691748243; 
 h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
 :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
 bh=wRmmMJ0HPgLCCnErClqViv0JGVjCSwWzjpmp9XzOBvQ=;
 b=IEpr2nCRcjfsHIjC0h14j9bNjpY/hRdpQWYa0wF+DpLvhSmBJE8J9SHNKA9hLanAzT
 XrZUGyDjmYSVEPKz9+knyknq78bLuEE9Ha7f2/VuGs25I3YJpyiRKKThMrcGslgtTYQP
 Dcb7wzJkdJB4YBBQYYOrJWTZ7lb/winmygvMmTC9C13bDNhromkfZOxxNJmQr3w7R1lA
 KEetBoEffX+8/5wgkOPyb4/WIPp+H8Gq7phV5HIzTvPGQ65Z7Cd8/kMYpH/d3/U4rmNJ
 iewqIMyp9eHKHr28OGydZTWptKA1bYhxkMU9umInOYcGB7BAqFi6JYtfe8cgq26q0RiP
 5pMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691143443; x=1691748243;
 h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
 :user-agent:references:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wRmmMJ0HPgLCCnErClqViv0JGVjCSwWzjpmp9XzOBvQ=;
 b=DMtn+z6aOETb5lZGE4CMYlfRhWFlfklUEtchtsF6a2YHH4y6zrj9AoJFOaXY8BH2A3
 611Cy+da4KwaNXgHqU4255RM15PijrFt3ehChUJDNwX9zhATi2hHma/NOPSd23t/eL61
 JSra4mrLzOxOX3kn9YmZZyn4Jo23HXxJgfpGomFz9G4piTrshx9AS4zkvKghhEs/3P9o
 aqGwP5J4zmNz+9Y5bAZd0d2AHNUlzB7cLzAwAzQnFPuqQj3O2tyqXd7D9CAGC4yFB6Dc
 2Q3dsjM1xmycVdDdVAGBxOVc06CfH7LDEwpiw48jte71uHuSuvtQSitNa8OR1CzXfpBT
 hwzg==
X-Gm-Message-State: AOJu0YzYzqe3F7y64ahCOO1pLC3wafPWdWtKYhWjBk+sbqn/Bc00ttlf
 vGVldjJUhM8iVB+BmRae9d3uTQ==
X-Google-Smtp-Source: AGHT+IEp+pnWLGdyMaoZ+C0S9nVfAxiYGTYwTISALv/MBtsZDW2daFfcXuYYxuyUmnrQXKvEaYJ4Dw==
X-Received: by 2002:a5d:4447:0:b0:317:3d36:b2cd with SMTP id
 x7-20020a5d4447000000b003173d36b2cdmr810107wrr.71.1691143443322; 
 Fri, 04 Aug 2023 03:04:03 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:aeaf:609a:5eef:39a8])
 by smtp.gmail.com with ESMTPSA id
 z13-20020a5d640d000000b003176053506fsm2104960wru.99.2023.08.04.03.04.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Aug 2023 03:04:02 -0700 (PDT)
References: <20230803-amlogic-v6-4-upstream-dsi-ccf-vim3-v7-0-762219fc5b28@linaro.org>
 <20230803-amlogic-v6-4-upstream-dsi-ccf-vim3-v7-2-762219fc5b28@linaro.org>
User-agent: mu4e 1.8.13; emacs 28.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jagan Teki <jagan@amarulasolutions.com>,
 Nicolas Belin <nbelin@baylibre.com>
Subject: Re: [PATCH v7 2/9] clk: meson: g12a: add CTS_ENCL & CTS_ENCL_SEL
 clocks
Date: Fri, 04 Aug 2023 11:59:21 +0200
In-reply-to: <20230803-amlogic-v6-4-upstream-dsi-ccf-vim3-v7-2-762219fc5b28@linaro.org>
Message-ID: <1j1qgjp1im.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Thu 03 Aug 2023 at 14:03, Neil Armstrong <neil.armstrong@linaro.org> wrote:

> Add new CTS_ENCL & CTS_ENCL_SEL clocks for the G12A compatible
> SoCs, they are used to feed the VPU LCD Pixel encoder used for
> DSI display purposes.
>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/clk/meson/g12a.c | 40 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
>
> diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
> index ceabd5f4b2ac..5d62134335c1 100644
> --- a/drivers/clk/meson/g12a.c
> +++ b/drivers/clk/meson/g12a.c
> @@ -3549,6 +3549,22 @@ static struct clk_regmap g12a_cts_encp_sel = {
>  	},
>  };
>  
> +static struct clk_regmap g12a_cts_encl_sel = {
> +	.data = &(struct clk_regmap_mux_data){
> +		.offset = HHI_VIID_CLK_DIV,
> +		.mask = 0xf,
> +		.shift = 12,
> +		.table = mux_table_cts_sel,
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "cts_encl_sel",
> +		.ops = &clk_regmap_mux_ops,
> +		.parent_hws = g12a_cts_parent_hws,
> +		.num_parents = ARRAY_SIZE(g12a_cts_parent_hws),
> +		.flags = CLK_SET_RATE_NO_REPARENT | CLK_GET_RATE_NOCACHE,

Why nocache ?
This is usually used when the consumer driver is poking around behind
CCF back.

Any chance this can use assigned-parent or CCF directly ?

> +	},
> +};
> +
>  static struct clk_regmap g12a_cts_vdac_sel = {
>  	.data = &(struct clk_regmap_mux_data){
>  		.offset = HHI_VIID_CLK_DIV,
> @@ -3628,6 +3644,22 @@ static struct clk_regmap g12a_cts_encp = {
>  	},
>  };
>  
> +static struct clk_regmap g12a_cts_encl = {
> +	.data = &(struct clk_regmap_gate_data){
> +		.offset = HHI_VID_CLK_CNTL2,
> +		.bit_idx = 3,
> +	},
> +	.hw.init = &(struct clk_init_data) {
> +		.name = "cts_encl",
> +		.ops = &clk_regmap_gate_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&g12a_cts_encl_sel.hw
> +		},
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,

What is the reason for IGNORE_UNUSED ?
If you need to keep the clock on while the driver comes up, please
document it here.

> +	},
> +};
> +
>  static struct clk_regmap g12a_cts_vdac = {
>  	.data = &(struct clk_regmap_gate_data){
>  		.offset = HHI_VID_CLK_CNTL2,
> @@ -4407,10 +4439,12 @@ static struct clk_hw *g12a_hw_clks[] = {
>  	[CLKID_VCLK2_DIV12]		= &g12a_vclk2_div12.hw,
>  	[CLKID_CTS_ENCI_SEL]		= &g12a_cts_enci_sel.hw,
>  	[CLKID_CTS_ENCP_SEL]		= &g12a_cts_encp_sel.hw,
> +	[CLKID_CTS_ENCL_SEL]		= &g12a_cts_encl_sel.hw,
>  	[CLKID_CTS_VDAC_SEL]		= &g12a_cts_vdac_sel.hw,
>  	[CLKID_HDMI_TX_SEL]		= &g12a_hdmi_tx_sel.hw,
>  	[CLKID_CTS_ENCI]		= &g12a_cts_enci.hw,
>  	[CLKID_CTS_ENCP]		= &g12a_cts_encp.hw,
> +	[CLKID_CTS_ENCL]		= &g12a_cts_encl.hw,
>  	[CLKID_CTS_VDAC]		= &g12a_cts_vdac.hw,
>  	[CLKID_HDMI_TX]			= &g12a_hdmi_tx.hw,
>  	[CLKID_HDMI_SEL]		= &g12a_hdmi_sel.hw,
> @@ -4632,10 +4666,12 @@ static struct clk_hw *g12b_hw_clks[] = {
>  	[CLKID_VCLK2_DIV12]		= &g12a_vclk2_div12.hw,
>  	[CLKID_CTS_ENCI_SEL]		= &g12a_cts_enci_sel.hw,
>  	[CLKID_CTS_ENCP_SEL]		= &g12a_cts_encp_sel.hw,
> +	[CLKID_CTS_ENCL_SEL]		= &g12a_cts_encl_sel.hw,
>  	[CLKID_CTS_VDAC_SEL]		= &g12a_cts_vdac_sel.hw,
>  	[CLKID_HDMI_TX_SEL]		= &g12a_hdmi_tx_sel.hw,
>  	[CLKID_CTS_ENCI]		= &g12a_cts_enci.hw,
>  	[CLKID_CTS_ENCP]		= &g12a_cts_encp.hw,
> +	[CLKID_CTS_ENCL]		= &g12a_cts_encl.hw,
>  	[CLKID_CTS_VDAC]		= &g12a_cts_vdac.hw,
>  	[CLKID_HDMI_TX]			= &g12a_hdmi_tx.hw,
>  	[CLKID_HDMI_SEL]		= &g12a_hdmi_sel.hw,
> @@ -4892,10 +4928,12 @@ static struct clk_hw *sm1_hw_clks[] = {
>  	[CLKID_VCLK2_DIV12]		= &g12a_vclk2_div12.hw,
>  	[CLKID_CTS_ENCI_SEL]		= &g12a_cts_enci_sel.hw,
>  	[CLKID_CTS_ENCP_SEL]		= &g12a_cts_encp_sel.hw,
> +	[CLKID_CTS_ENCL_SEL]		= &g12a_cts_encl_sel.hw,
>  	[CLKID_CTS_VDAC_SEL]		= &g12a_cts_vdac_sel.hw,
>  	[CLKID_HDMI_TX_SEL]		= &g12a_hdmi_tx_sel.hw,
>  	[CLKID_CTS_ENCI]		= &g12a_cts_enci.hw,
>  	[CLKID_CTS_ENCP]		= &g12a_cts_encp.hw,
> +	[CLKID_CTS_ENCL]		= &g12a_cts_encl.hw,
>  	[CLKID_CTS_VDAC]		= &g12a_cts_vdac.hw,
>  	[CLKID_HDMI_TX]			= &g12a_hdmi_tx.hw,
>  	[CLKID_HDMI_SEL]		= &g12a_hdmi_sel.hw,
> @@ -5123,10 +5161,12 @@ static struct clk_regmap *const g12a_clk_regmaps[] = {
>  	&g12a_vclk2_div12_en,
>  	&g12a_cts_enci_sel,
>  	&g12a_cts_encp_sel,
> +	&g12a_cts_encl_sel,
>  	&g12a_cts_vdac_sel,
>  	&g12a_hdmi_tx_sel,
>  	&g12a_cts_enci,
>  	&g12a_cts_encp,
> +	&g12a_cts_encl,
>  	&g12a_cts_vdac,
>  	&g12a_hdmi_tx,
>  	&g12a_hdmi_sel,

