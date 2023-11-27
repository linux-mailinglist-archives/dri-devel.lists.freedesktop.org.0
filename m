Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A0B7FA6AF
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 17:41:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2772710E3A4;
	Mon, 27 Nov 2023 16:41:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48D7810E3A4
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 16:41:44 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40b27726369so31139185e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 08:41:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1701103302; x=1701708102;
 darn=lists.freedesktop.org; 
 h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
 :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
 bh=/Icj54IjZp5B4hkXeCz67YIlN6i5tKQ8M88cBBrEKK4=;
 b=nEYUPbYCsjzG2L36G81eMMAGVoGC1vw8hTmXC9yAvodcm3xyKwfA1Mry5N6AoWHFS1
 AydzdcGoMrr+nmSwjQqFrNH3FUodwMGvqW7j7VUvPEiY/TDajO/e0q+rR+jvKPK8FwjN
 yGuzZXsQQdDQxoj7LD7Ob8lI8fBosHZGNvjgA7VcIcsyB7jVonuiD8ERBszDLrSpBM2N
 5qgobHu8WykLqSHPwi9Jco8n2HZMo2GZh9mKOBip8NT3PW2KwnAmJYDRWwrbOszQeOTQ
 pOMNKlI3S+9RPYlXQy3OjEfAY4KMbJlEjDBFXwDVIZWDX9zkenJMgxh5p5WWPU8/rj/7
 At8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701103302; x=1701708102;
 h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
 :user-agent:references:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/Icj54IjZp5B4hkXeCz67YIlN6i5tKQ8M88cBBrEKK4=;
 b=GCtFY3HZ69bfXlNJAJ9G5mZceM8QpukVB0ipnXKbU+dvof4moJNdF+9pQnHHL/cQQb
 Wrk5rKgcgT/2uGVSSxNrNrCt6kxeOyVvqlQGgp0GOD49de4lpUsM4XDK9otl8JDW5+XY
 LphUQTmzCXBysdOK4l4YvwP8NBfz91dV0BHsY6cRTQJ//7kjUtCUTuoHTjhPoVTPgr1k
 +EUwr2dgAP0r7hotUldvDs0jA+J1CfvUBXJFBcnN0qBd+3/vWtISBTySWbJ7b+w+tjcG
 HgQXnwCPqMRrwMlM1DRkDIsEgHF5dQRN7caZZ5rc/G1u3uDgVTKoOU0B0paGxjE88dEP
 E4IQ==
X-Gm-Message-State: AOJu0Yzzkqhj9RUnKLAHFh11IX7eB5AOzWt6z8c5t4oeF9SWKNDKfxh+
 GrYiNHkyZLDqmXtIpMUd0WC0sQ==
X-Google-Smtp-Source: AGHT+IHFJl3YREfNRJgTH6qJi9k1kF+E8TGrqHCGdE2czDiGzqH3Az0cJk7/KmShVK5MIed8bqNenw==
X-Received: by 2002:a5d:52ca:0:b0:332:fa1b:9f66 with SMTP id
 r10-20020a5d52ca000000b00332fa1b9f66mr3648641wrv.59.1701103302575; 
 Mon, 27 Nov 2023 08:41:42 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:3675:e2e8:2f93:3d3b])
 by smtp.gmail.com with ESMTPSA id
 c14-20020a056000104e00b00332f95ab44esm5864136wrx.57.2023.11.27.08.41.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Nov 2023 08:41:42 -0800 (PST)
References: <20231124-amlogic-v6-4-upstream-dsi-ccf-vim3-v9-0-95256ed139e6@linaro.org>
 <20231124-amlogic-v6-4-upstream-dsi-ccf-vim3-v9-7-95256ed139e6@linaro.org>
 <1j7cm7dx1b.fsf@starbuckisacylon.baylibre.com>
 <4e5e33c1-45d5-4c83-b647-bfb603347156@linaro.org>
User-agent: mu4e 1.10.8; emacs 29.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: neil.armstrong@linaro.org
Subject: Re: [PATCH v9 07/12] clk: meson: add vclk driver
Date: Mon, 27 Nov 2023 17:24:03 +0100
In-reply-to: <4e5e33c1-45d5-4c83-b647-bfb603347156@linaro.org>
Message-ID: <1jfs0rywqi.fsf@starbuckisacylon.baylibre.com>
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
Cc: Michael Turquette <mturquette@baylibre.com>,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-phy@lists.infradead.org, linux-clk@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Jagan Teki <jagan@amarulasolutions.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Maxime Ripard <mripard@kernel.org>, Remi Pommarel <repk@triplefau.lt>,
 linux-amlogic@lists.infradead.org, Nicolas Belin <nbelin@baylibre.com>,
 linux-arm-kernel@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>,
 linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Mon 27 Nov 2023 at 17:14, Neil Armstrong <neil.armstrong@linaro.org> wrote:

> On 24/11/2023 15:41, Jerome Brunet wrote:
>> On Fri 24 Nov 2023 at 09:41, Neil Armstrong <neil.armstrong@linaro.org>
>> wrote:
>> 
>>> The VCLK and VCLK_DIV clocks have supplementary bits.
>>>
>>> The VCLK has a "SOFT RESET" bit to toggle after the whole
>>> VCLK sub-tree rate has been set, this is implemented in
>>> the gate enable callback.
>>>
>>> The VCLK_DIV clocks as enable and reset bits used to disable
>>> and reset the divider, associated with CLK_SET_RATE_GATE it ensures
>>> the rate is set while the divider is disabled and in reset mode.
>>>
>>> The VCLK_DIV enable bit isn't implemented as a gate since it's part
>>> of the divider logic and vendor does this exact sequence to ensure
>>> the divider is correctly set.
>>>
>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>> ---
>>>   drivers/clk/meson/Kconfig  |   5 ++
>>>   drivers/clk/meson/Makefile |   1 +
>>>   drivers/clk/meson/vclk.c   | 141 +++++++++++++++++++++++++++++++++++++++++++++
>>>   drivers/clk/meson/vclk.h   |  51 ++++++++++++++++
>>>   4 files changed, 198 insertions(+)
>>>
>>> diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
>>> index 29ffd14d267b..59a40a49f8e1 100644
>>> --- a/drivers/clk/meson/Kconfig
>>> +++ b/drivers/clk/meson/Kconfig
>>> @@ -30,6 +30,10 @@ config COMMON_CLK_MESON_VID_PLL_DIV
>>>   	tristate
>>>   	select COMMON_CLK_MESON_REGMAP
>>>   +config COMMON_CLK_MESON_VCLK
>>> +	tristate
>>> +	select COMMON_CLK_MESON_REGMAP
>>> +
>>>   config COMMON_CLK_MESON_CLKC_UTILS
>>>   	tristate
>>>   @@ -140,6 +144,7 @@ config COMMON_CLK_G12A
>>>   	select COMMON_CLK_MESON_EE_CLKC
>>>   	select COMMON_CLK_MESON_CPU_DYNDIV
>>>   	select COMMON_CLK_MESON_VID_PLL_DIV
>>> +	select COMMON_CLK_MESON_VCLK
>> This particular line belong in the next patch
>> 
>>>   	select MFD_SYSCON
>>>   	help
>>>   	  Support for the clock controller on Amlogic S905D2, S905X2 and S905Y2
>>> diff --git a/drivers/clk/meson/Makefile b/drivers/clk/meson/Makefile
>>> index 9ee4b954c896..9ba43fe7a07a 100644
>>> --- a/drivers/clk/meson/Makefile
>>> +++ b/drivers/clk/meson/Makefile
>>> @@ -12,6 +12,7 @@ obj-$(CONFIG_COMMON_CLK_MESON_PLL) += clk-pll.o
>>>   obj-$(CONFIG_COMMON_CLK_MESON_REGMAP) += clk-regmap.o
>>>   obj-$(CONFIG_COMMON_CLK_MESON_SCLK_DIV) += sclk-div.o
>>>   obj-$(CONFIG_COMMON_CLK_MESON_VID_PLL_DIV) += vid-pll-div.o
>>> +obj-$(CONFIG_COMMON_CLK_MESON_VCLK) += vclk.o
>>>     # Amlogic Clock controllers
>>>   diff --git a/drivers/clk/meson/vclk.c b/drivers/clk/meson/vclk.c
>>> new file mode 100644
>>> index 000000000000..47f08a52b49f
>>> --- /dev/null
>>> +++ b/drivers/clk/meson/vclk.c
>>> @@ -0,0 +1,141 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +/*
>>> + * Copyright (c) 2023 Neil Armstrong <neil.armstrong@linaro.org>
>>> + */
>>> +
>>> +#include <linux/module.h>
>>> +#include "vclk.h"
>>> +
>>> +/* The VCLK gate has a supplementary reset bit to pulse after ungating */
>>> +
>>> +static inline struct clk_regmap_vclk_data *
>>> +clk_get_regmap_vclk_data(struct clk_regmap *clk)
>>> +{
>>> +	return (struct clk_regmap_vclk_data *)clk->data;
>>> +}
>>> +
>>> +static int clk_regmap_vclk_enable(struct clk_hw *hw)
>>> +{
>>> +	struct clk_regmap *clk = to_clk_regmap(hw);
>>> +	struct clk_regmap_vclk_data *vclk = clk_get_regmap_vclk_data(clk);
>>> +
>>> +	meson_parm_write(clk->map, &vclk->enable, 1);
>>> +
>>> +	/* Do a reset pulse */
>>> +	meson_parm_write(clk->map, &vclk->reset, 1);
>>> +	meson_parm_write(clk->map, &vclk->reset, 0);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static void clk_regmap_vclk_disable(struct clk_hw *hw)
>>> +{
>>> +	struct clk_regmap *clk = to_clk_regmap(hw);
>>> +	struct clk_regmap_vclk_data *vclk = clk_get_regmap_vclk_data(clk);
>>> +
>>> +	meson_parm_write(clk->map, &vclk->enable, 0);
>>> +}
>>> +
>>> +static int clk_regmap_vclk_is_enabled(struct clk_hw *hw)
>>> +{
>>> +	struct clk_regmap *clk = to_clk_regmap(hw);
>>> +	struct clk_regmap_vclk_data *vclk = clk_get_regmap_vclk_data(clk);
>>> +
>>> +	return meson_parm_read(clk->map, &vclk->enable);
>>> +}
>>> +
>>> +const struct clk_ops clk_regmap_vclk_ops = {
>>> +	.enable = clk_regmap_vclk_enable,
>>> +	.disable = clk_regmap_vclk_disable,
>>> +	.is_enabled = clk_regmap_vclk_is_enabled,
>>> +};
>>> +EXPORT_SYMBOL_GPL(clk_regmap_vclk_ops);
>> s/clk_regmap_vclk/meson_vclk at least for what is exported, ideally most
>> all the code.
>> I get clk_regmap_ comes from code copied from clk_regmap.c.
>> The reason the this part is different (and not using parm) if that when
>> I converted amlogic to regmap, I hope we could make this generic,
>> possibly converging between aml and qcom (which was the only other
>> platform using regmap for clock at the time). This is why clk_regmap.c
>> is a bit different from the other driver.
>> For the aml specific drivers, best to look at the mpll or cpu-dyndiv one.
>> 
>>> +
>>> +/* The VCLK Divider has supplementary reset & enable bits */
>>> +
>>> +static inline struct clk_regmap_vclk_div_data *
>>> +clk_get_regmap_vclk_div_data(struct clk_regmap *clk)
>>> +{
>>> +	return (struct clk_regmap_vclk_div_data *)clk->data;
>>> +}
>>> +
>>> +static unsigned long clk_regmap_vclk_div_recalc_rate(struct clk_hw *hw,
>>> +						     unsigned long prate)
>>> +{
>>> +	struct clk_regmap *clk = to_clk_regmap(hw);
>>> +	struct clk_regmap_vclk_div_data *vclk = clk_get_regmap_vclk_div_data(clk);
>>> +
>>> +	return divider_recalc_rate(hw, prate, meson_parm_read(clk->map, &vclk->div),
>>> +				   vclk->table, vclk->flags, vclk->div.width);
>>> +}
>>> +
>>> +static int clk_regmap_vclk_div_determine_rate(struct clk_hw *hw,
>>> +					      struct clk_rate_request *req)
>>> +{
>>> +	struct clk_regmap *clk = to_clk_regmap(hw);
>>> +	struct clk_regmap_vclk_div_data *vclk = clk_get_regmap_vclk_div_data(clk);
>>> +
>>> +	return divider_determine_rate(hw, req, vclk->table, vclk->div.width,
>>> +				      vclk->flags);
>>> +}
>>> +
>>> +static int clk_regmap_vclk_div_set_rate(struct clk_hw *hw, unsigned long rate,
>>> +					unsigned long parent_rate)
>>> +{
>>> +	struct clk_regmap *clk = to_clk_regmap(hw);
>>> +	struct clk_regmap_vclk_div_data *vclk = clk_get_regmap_vclk_div_data(clk);
>>> +	int ret;
>>> +
>>> +	ret = divider_get_val(rate, parent_rate, vclk->table, vclk->div.width,
>>> +			      vclk->flags);
>>> +	if (ret < 0)
>>> +		return ret;
>>> +
>>> +	meson_parm_write(clk->map, &vclk->div, ret);
>>> +
>>> +	return 0;
>>> +};
>>> +
>>> +static int clk_regmap_vclk_div_enable(struct clk_hw *hw)
>>> +{
>>> +	struct clk_regmap *clk = to_clk_regmap(hw);
>>> +	struct clk_regmap_vclk_div_data *vclk = clk_get_regmap_vclk_div_data(clk);
>>> +
>>> +	/* Unreset the divider when ungating */
>>> +	meson_parm_write(clk->map, &vclk->reset, 0);
>>> +	meson_parm_write(clk->map, &vclk->enable, 1);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static void clk_regmap_vclk_div_disable(struct clk_hw *hw)
>>> +{
>>> +	struct clk_regmap *clk = to_clk_regmap(hw);
>>> +	struct clk_regmap_vclk_div_data *vclk = clk_get_regmap_vclk_div_data(clk);
>>> +
>>> +	/* Reset the divider when gating */
>>> +	meson_parm_write(clk->map, &vclk->enable, 0);
>>> +	meson_parm_write(clk->map, &vclk->reset, 1);
>>> +}
>>> +
>>> +static int clk_regmap_vclk_div_is_enabled(struct clk_hw *hw)
>>> +{
>>> +	struct clk_regmap *clk = to_clk_regmap(hw);
>>> +	struct clk_regmap_vclk_div_data *vclk = clk_get_regmap_vclk_div_data(clk);
>>> +
>>> +	return meson_parm_read(clk->map, &vclk->enable);
>>> +}
>>> +
>>> +const struct clk_ops clk_regmap_vclk_div_ops = {
>>> +	.recalc_rate = clk_regmap_vclk_div_recalc_rate,
>>> +	.determine_rate = clk_regmap_vclk_div_determine_rate,
>>> +	.set_rate = clk_regmap_vclk_div_set_rate,
>>> +	.enable = clk_regmap_vclk_div_enable,
>>> +	.disable = clk_regmap_vclk_div_disable,
>>> +	.is_enabled = clk_regmap_vclk_div_is_enabled,
>>> +};
>>> +EXPORT_SYMBOL_GPL(clk_regmap_vclk_div_ops);
>>> +
>>> +MODULE_DESCRIPTION("Amlogic vclk clock driver");
>>> +MODULE_AUTHOR("Neil Armstrong <neil.armstrong@linaro.org>");
>>> +MODULE_LICENSE("GPL v2");
>>> diff --git a/drivers/clk/meson/vclk.h b/drivers/clk/meson/vclk.h
>>> new file mode 100644
>>> index 000000000000..4f25d7ad2717
>>> --- /dev/null
>>> +++ b/drivers/clk/meson/vclk.h
>
> Is vclk.c/h ok ? clk-vclk doesn't look pretty, but I can switch to it to
> keep files organized.

I don't have a strong opinion about it.
I would have suggested vclk-div.c/h - like sclk ... but you do have gate
ops in there, so ... :/

This made me realize that one does not really go without the other.
It is more a coherent block, isn't it ?
Would it make more sense to have these 2 merged in a single clk_ops ?

It's bit late to point this out, sorry about that.

I let you decide whether to merge the ops or not and which name to pick.

If you keep them separated, meson_vclk_gate_ops instead of just
meson_vclk_ops, to make things clear.

>
> Neil
>
>>> @@ -0,0 +1,51 @@
>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>> +/*
>>> + * Copyright (c) 2023 Neil Armstrong <neil.armstrong@linaro.org>
>>> + */
>>> +
>>> +#ifndef __VCLK_H
>>> +#define __VCLK_H
>> This is too generic.
>> Please add the MESON prefix like the other clock driver please.
>> 
>>> +
>>> +#include "clk-regmap.h"
>>> +#include "parm.h"
>>> +
>>> +/**
>>> + * struct clk_regmap_vclk_data - vclk regmap backed specific data
>>> + *
>>> + * @enable:	vclk enable field
>>> + * @reset:	vclk reset field
>>> + * @flags:	hardware-specific flags
>>> + *
>>> + * Flags:
>>> + * Same as clk_gate except CLK_GATE_HIWORD_MASK which is ignored
>>> + */
>>> +struct clk_regmap_vclk_data {
>>> +	struct parm enable;
>>> +	struct parm reset;
>>> +	u8 flags;
>>> +};
>>> +
>>> +extern const struct clk_ops clk_regmap_vclk_ops;
>>> +
>>> +/**
>>> + * struct clk_regmap_vclk_div_data - vclk_div regmap back specific data
>>> + *
>>> + * @div:	divider field
>>> + * @enable:	vclk divider enable field
>>> + * @reset:	vclk divider reset field
>>> + * @table:	array of value/divider pairs, last entry should have div = 0
>>> + *
>>> + * Flags:
>>> + * Same as clk_divider except CLK_DIVIDER_HIWORD_MASK which is ignored
>>> + */
>>> +struct clk_regmap_vclk_div_data {
>>> +	struct parm div;
>>> +	struct parm enable;
>>> +	struct parm reset;
>>> +	const struct clk_div_table *table;
>>> +	u8 flags;
>>> +};
>>> +
>>> +extern const struct clk_ops clk_regmap_vclk_div_ops;
>>> +
>>> +#endif /* __VCLK_H */
>> 


-- 
Jerome
