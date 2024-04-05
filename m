Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D8E8998A7
	for <lists+dri-devel@lfdr.de>; Fri,  5 Apr 2024 10:58:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A79510F7BB;
	Fri,  5 Apr 2024 08:58:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="v+WtQqWN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51F9910E20F
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Apr 2024 08:58:42 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-343c7fae6e4so965497f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Apr 2024 01:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712307521; x=1712912321;
 darn=lists.freedesktop.org; 
 h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
 :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
 bh=tvTd0Fm8ZquDDVIbm2YOHB7MsYv/hDWQ2T1VR/OyIKU=;
 b=v+WtQqWNHhGf4YSDxuI5KGzsJo6wKPK7P8WIqOmaMD7nkYQZVum91LllENpfuhLBxR
 FxBaCbVH4QVIjSc250tS6c4iBApx4c7U7EccG0pKM5GNBPfvnqajOuugZYlRTKHTRpNT
 agX/bM7Rz5bi7pcI9NSfsMYqlZDpD07aOV9Xilm6/JGxIAT9L6Q1mOqnotDEty/M65cV
 B+lyB9E/TiSn3bGJm3G8S/3JiZE+iOOoKYJEB2remzxioaFFNvaAZIpMro8hYJdgMbMe
 aOlgqXRsdYwe8y5xbGPz+YJ8gt0M5E/D3yiZd5A/kM/4kQEl3Wijw//tJtCQjc81KUiY
 HFgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712307521; x=1712912321;
 h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
 :user-agent:references:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tvTd0Fm8ZquDDVIbm2YOHB7MsYv/hDWQ2T1VR/OyIKU=;
 b=xGHST0t3zQ9livCJJGIL2u9KWkdrI8idiV6VgZ9bP2qe1okeTx+PqNqqtE859Ld9fQ
 pcBxKCzGwBfGLQppjxNzXdzbAlcbt0T65E9w8BF/2iGtX2+RajZaJ9xJ5qa1vJL/4I/k
 RnT4G/AudEQsuw7jGAyPXCIvu/7KKrkY2Z8Yjv/WKngnGYTzo8qXgro2llO2N4IZQcsN
 RpqYHPkfUPAE3QaRmk9eFcaKBYsLYRg3HEUEFc9VsDyz5Nv6FoVoTMc9dwqmzIJhGxI+
 CK9xPQXFc5UsjzYeQUi5sryZA5/XYfOqqpbTZtP+PUV4oQBO+tYottosJcCIPxXNqzzK
 gw2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4ds+i1ESRO8QtifnnE9tHqiA9oLOIGlluLHX5ahX6UPrH9jbsggek2QUBCde4XxkfGmJKHOs6T9wXCVXwCQsrRfYQOOJOZr9EGgaqLlAe
X-Gm-Message-State: AOJu0YyfUDeLihUnYHTwPywO+pbtaUJn8Gj/g35B6GnUXGIBylVF/ZGQ
 X9gafkK8mxN/PQzFqmKeWCiQOdCI5Wvk+4mAVHYtpwDnq6+hrwjyzIXOlmCpgoQ=
X-Google-Smtp-Source: AGHT+IFkeZDLwHmb5ksDQvkIX1BxNeAKFtQ2xaawsaOuYE3qt3kcvau+dHTVrKGw3Ss9d7qEh2aORA==
X-Received: by 2002:adf:a486:0:b0:33e:bfd0:41f9 with SMTP id
 g6-20020adfa486000000b0033ebfd041f9mr633683wrb.31.1712307520708; 
 Fri, 05 Apr 2024 01:58:40 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:dd7a:d766:e9e8:454c])
 by smtp.gmail.com with ESMTPSA id
 g11-20020adfe40b000000b00341cb22a8d4sm1494134wrm.108.2024.04.05.01.58.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Apr 2024 01:58:40 -0700 (PDT)
References: <20240403-amlogic-v6-4-upstream-dsi-ccf-vim3-v12-0-99ecdfdc87fc@linaro.org>
 <20240403-amlogic-v6-4-upstream-dsi-ccf-vim3-v12-2-99ecdfdc87fc@linaro.org>
 <1jmsq9pmgd.fsf@starbuckisacylon.baylibre.com>
 <2cf79f07-0ae1-4267-ac08-fe40366d87d4@linaro.org>
User-agent: mu4e 1.10.8; emacs 29.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: neil.armstrong@linaro.org
Cc: Jerome Brunet <jbrunet@baylibre.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, Jagan Teki <jagan@amarulasolutions.com>, Nicolas Belin
 <nbelin@baylibre.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v12 2/7] clk: meson: add vclk driver
Date: Fri, 05 Apr 2024 09:00:43 +0200
In-reply-to: <2cf79f07-0ae1-4267-ac08-fe40366d87d4@linaro.org>
Message-ID: <1ja5m8p4n4.fsf@starbuckisacylon.baylibre.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Thu 04 Apr 2024 at 18:59, Neil Armstrong <neil.armstrong@linaro.org> wrote:

> On 04/04/2024 10:13, Jerome Brunet wrote:
>> On Wed 03 Apr 2024 at 09:46, Neil Armstrong <neil.armstrong@linaro.org>
>> wrote:
>> 
>>> The VCLK and VCLK_DIV clocks have supplementary bits.
>>>
>>> The VCLK gate has a "SOFT RESET" bit to toggle after the whole
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
>> The checkpatch warning is still there. Is it a choice or a mistake ?
>> Documentation says "GPL v2" exists for historic reason which seems to
>> hint "GPL" is preferred, and I suppose this is why checkpatch warns for
>> it.
>
> Well I didn't see this warning, this is what I fixed:
>
> $ scripts/checkpatch.pl --strict drivers/clk/meson/vclk.c
> CHECK: Alignment should match open parenthesis
> #63: FILE: drivers/clk/meson/vclk.c:63:
> +static unsigned long meson_vclk_div_recalc_rate(struct clk_hw *hw,
> +                                                    unsigned long prate)
>
> CHECK: Alignment should match open parenthesis
> #73: FILE: drivers/clk/meson/vclk.c:73:
> +static int meson_vclk_div_determine_rate(struct clk_hw *hw,
> +                                             struct clk_rate_request *req)
>
> CHECK: Alignment should match open parenthesis
> #83: FILE: drivers/clk/meson/vclk.c:83:
> +static int meson_vclk_div_set_rate(struct clk_hw *hw, unsigned long rate,
> +                                       unsigned long parent_rate)
>

I would not ask a respin solely for this. It's nice to fix it but I was
mostly after the warning TBH.

> <snip>
>
> It seems that checking a commit triggers an extra check....
>
> $ scripts/checkpatch.pl --strict -G 1bac9f6aa3c3
> WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
> #58:
> new file mode 100644
>
> <snip>
>
> WARNING: Prefer "GPL" over "GPL v2" - see commit bf7fbeeae6db ("module: Cure the MODULE_LICENSE "GPL" vs. "GPL v2" bogosity")
> #203: FILE: drivers/clk/meson/vclk.c:141:
> +MODULE_LICENSE("GPL v2");

Hum, I'm running checkpatch against the mail itself, not the commit. I
still get the warning

>
> <snip>
>
> Neil
>
>> 
>>>
>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>> ---
>>>   drivers/clk/meson/Kconfig  |   4 ++
>>>   drivers/clk/meson/Makefile |   1 +
>>>   drivers/clk/meson/vclk.c   | 141 +++++++++++++++++++++++++++++++++++++++++++++
>>>   drivers/clk/meson/vclk.h   |  51 ++++++++++++++++
>>>   4 files changed, 197 insertions(+)
>>>
>>> diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
>>> index 29ffd14d267b..8a9823789fa3 100644
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
>>>   diff --git a/drivers/clk/meson/Makefile b/drivers/clk/meson/Makefile
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
>>> index 000000000000..45dc216941ea
>>> --- /dev/null
>>> +++ b/drivers/clk/meson/vclk.c
>>> @@ -0,0 +1,141 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +/*
>>> + * Copyright (c) 2024 Neil Armstrong <neil.armstrong@linaro.org>
>>> + */
>>> +
>>> +#include <linux/module.h>
>>> +#include "vclk.h"
>>> +
>>> +/* The VCLK gate has a supplementary reset bit to pulse after ungating */
>>> +
>>> +static inline struct meson_vclk_gate_data *
>>> +clk_get_meson_vclk_gate_data(struct clk_regmap *clk)
>>> +{
>>> +	return (struct meson_vclk_gate_data *)clk->data;
>>> +}
>>> +
>>> +static int meson_vclk_gate_enable(struct clk_hw *hw)
>>> +{
>>> +	struct clk_regmap *clk = to_clk_regmap(hw);
>>> +	struct meson_vclk_gate_data *vclk = clk_get_meson_vclk_gate_data(clk);
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
>>> +static void meson_vclk_gate_disable(struct clk_hw *hw)
>>> +{
>>> +	struct clk_regmap *clk = to_clk_regmap(hw);
>>> +	struct meson_vclk_gate_data *vclk = clk_get_meson_vclk_gate_data(clk);
>>> +
>>> +	meson_parm_write(clk->map, &vclk->enable, 0);
>>> +}
>>> +
>>> +static int meson_vclk_gate_is_enabled(struct clk_hw *hw)
>>> +{
>>> +	struct clk_regmap *clk = to_clk_regmap(hw);
>>> +	struct meson_vclk_gate_data *vclk = clk_get_meson_vclk_gate_data(clk);
>>> +
>>> +	return meson_parm_read(clk->map, &vclk->enable);
>>> +}
>>> +
>>> +const struct clk_ops meson_vclk_gate_ops = {
>>> +	.enable = meson_vclk_gate_enable,
>>> +	.disable = meson_vclk_gate_disable,
>>> +	.is_enabled = meson_vclk_gate_is_enabled,
>>> +};
>>> +EXPORT_SYMBOL_GPL(meson_vclk_gate_ops);
>>> +
>>> +/* The VCLK Divider has supplementary reset & enable bits */
>>> +
>>> +static inline struct meson_vclk_div_data *
>>> +clk_get_meson_vclk_div_data(struct clk_regmap *clk)
>>> +{
>>> +	return (struct meson_vclk_div_data *)clk->data;
>>> +}
>>> +
>>> +static unsigned long meson_vclk_div_recalc_rate(struct clk_hw *hw,
>>> +						unsigned long prate)
>>> +{
>>> +	struct clk_regmap *clk = to_clk_regmap(hw);
>>> +	struct meson_vclk_div_data *vclk = clk_get_meson_vclk_div_data(clk);
>>> +
>>> +	return divider_recalc_rate(hw, prate, meson_parm_read(clk->map, &vclk->div),
>>> +				   vclk->table, vclk->flags, vclk->div.width);
>>> +}
>>> +
>>> +static int meson_vclk_div_determine_rate(struct clk_hw *hw,
>>> +					 struct clk_rate_request *req)
>>> +{
>>> +	struct clk_regmap *clk = to_clk_regmap(hw);
>>> +	struct meson_vclk_div_data *vclk = clk_get_meson_vclk_div_data(clk);
>>> +
>>> +	return divider_determine_rate(hw, req, vclk->table, vclk->div.width,
>>> +				      vclk->flags);
>>> +}
>>> +
>>> +static int meson_vclk_div_set_rate(struct clk_hw *hw, unsigned long rate,
>>> +				   unsigned long parent_rate)
>>> +{
>>> +	struct clk_regmap *clk = to_clk_regmap(hw);
>>> +	struct meson_vclk_div_data *vclk = clk_get_meson_vclk_div_data(clk);
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
>>> +static int meson_vclk_div_enable(struct clk_hw *hw)
>>> +{
>>> +	struct clk_regmap *clk = to_clk_regmap(hw);
>>> +	struct meson_vclk_div_data *vclk = clk_get_meson_vclk_div_data(clk);
>>> +
>>> +	/* Unreset the divider when ungating */
>>> +	meson_parm_write(clk->map, &vclk->reset, 0);
>>> +	meson_parm_write(clk->map, &vclk->enable, 1);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static void meson_vclk_div_disable(struct clk_hw *hw)
>>> +{
>>> +	struct clk_regmap *clk = to_clk_regmap(hw);
>>> +	struct meson_vclk_div_data *vclk = clk_get_meson_vclk_div_data(clk);
>>> +
>>> +	/* Reset the divider when gating */
>>> +	meson_parm_write(clk->map, &vclk->enable, 0);
>>> +	meson_parm_write(clk->map, &vclk->reset, 1);
>>> +}
>>> +
>>> +static int meson_vclk_div_is_enabled(struct clk_hw *hw)
>>> +{
>>> +	struct clk_regmap *clk = to_clk_regmap(hw);
>>> +	struct meson_vclk_div_data *vclk = clk_get_meson_vclk_div_data(clk);
>>> +
>>> +	return meson_parm_read(clk->map, &vclk->enable);
>>> +}
>>> +
>>> +const struct clk_ops meson_vclk_div_ops = {
>>> +	.recalc_rate = meson_vclk_div_recalc_rate,
>>> +	.determine_rate = meson_vclk_div_determine_rate,
>>> +	.set_rate = meson_vclk_div_set_rate,
>>> +	.enable = meson_vclk_div_enable,
>>> +	.disable = meson_vclk_div_disable,
>>> +	.is_enabled = meson_vclk_div_is_enabled,
>>> +};
>>> +EXPORT_SYMBOL_GPL(meson_vclk_div_ops);
>>> +
>>> +MODULE_DESCRIPTION("Amlogic vclk clock driver");
>>> +MODULE_AUTHOR("Neil Armstrong <neil.armstrong@linaro.org>");
>>> +MODULE_LICENSE("GPL v2");
>>> diff --git a/drivers/clk/meson/vclk.h b/drivers/clk/meson/vclk.h
>>> new file mode 100644
>>> index 000000000000..20b0b181db09
>>> --- /dev/null
>>> +++ b/drivers/clk/meson/vclk.h
>>> @@ -0,0 +1,51 @@
>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>> +/*
>>> + * Copyright (c) 2024 Neil Armstrong <neil.armstrong@linaro.org>
>>> + */
>>> +
>>> +#ifndef __VCLK_H
>>> +#define __VCLK_H
>>> +
>>> +#include "clk-regmap.h"
>>> +#include "parm.h"
>>> +
>>> +/**
>>> + * struct meson_vclk_gate_data - vclk_gate regmap backed specific data
>>> + *
>>> + * @enable:	vclk enable field
>>> + * @reset:	vclk reset field
>>> + * @flags:	hardware-specific flags
>>> + *
>>> + * Flags:
>>> + * Same as clk_gate except CLK_GATE_HIWORD_MASK which is ignored
>>> + */
>>> +struct meson_vclk_gate_data {
>>> +	struct parm enable;
>>> +	struct parm reset;
>>> +	u8 flags;
>>> +};
>>> +
>>> +extern const struct clk_ops meson_vclk_gate_ops;
>>> +
>>> +/**
>>> + * struct meson_vclk_div_data - vclk_div regmap back specific data
>>> + *
>>> + * @div:	divider field
>>> + * @enable:	vclk divider enable field
>>> + * @reset:	vclk divider reset field
>>> + * @table:	array of value/divider pairs, last entry should have div = 0
>>> + *
>>> + * Flags:
>>> + * Same as clk_divider except CLK_DIVIDER_HIWORD_MASK which is ignored
>>> + */
>>> +struct meson_vclk_div_data {
>>> +	struct parm div;
>>> +	struct parm enable;
>>> +	struct parm reset;
>>> +	const struct clk_div_table *table;
>>> +	u8 flags;
>>> +};
>>> +
>>> +extern const struct clk_ops meson_vclk_div_ops;
>>> +
>>> +#endif /* __VCLK_H */
>> 


-- 
Jerome
