Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 89BEFC483D
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2019 09:19:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C424D6E8DB;
	Wed,  2 Oct 2019 07:18:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9106489DB8
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Oct 2019 08:12:28 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x918CGLX087648;
 Tue, 1 Oct 2019 03:12:16 -0500
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x918CGEb005529
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 1 Oct 2019 03:12:16 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 1 Oct
 2019 03:12:15 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 1 Oct 2019 03:12:05 -0500
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x918CAVj072277;
 Tue, 1 Oct 2019 03:12:11 -0500
Subject: Re: [PATCH] drm/omap: Migrate minimum FCK/PCK ratio from Kconfig to
 dts
To: Tomi Valkeinen <tomi.valkeinen@ti.com>, Adam Ford <aford173@gmail.com>
References: <20190510194229.20628-1-aford173@gmail.com>
 <CAHCN7xJFrTLOnbqrnH2W_T2whR8Xji0EMNR_cy8GYkDV-JDodQ@mail.gmail.com>
 <854f6130-c8a8-81cb-aa76-4830f218ae54@ti.com>
 <CAHCN7xKocdiWOdmoWQV3POr84qte6WNt0QbQRAwxKSvU8COB_w@mail.gmail.com>
 <0473526e-df0a-94a5-5c22-debd0084ab16@ti.com>
 <36369388-e9c8-22cd-8c19-e2bdf2d0389b@ti.com>
 <eb2eb1f6-3c9b-7ecb-667e-819033af9c14@ti.com>
 <23eba53a-9304-2ceb-d97e-01891ec0b3ed@ti.com>
 <cb028b1e-05ca-9b22-be5d-c63f5fd56cc4@ti.com>
 <F3335195-6EB7-4D44-B884-2F29D9238011@goldelico.com>
 <CAHCN7xL9bFxO=2i1DzmRj6A3XwUNdt=DZeJ2a0EZ0f9gcFTy6g@mail.gmail.com>
 <CAHCN7x+vCfPTRE+zzYUwAXdbBzRotTP2hSOgsHB0FdgBhZV5zA@mail.gmail.com>
 <CAHCN7xJDV=R9Ysjhff7=mEXdciwPP_5LQbHwaUT8KvhSkLKw8A@mail.gmail.com>
 <04306a5e-f9be-35a4-1aa1-5795d780e289@ti.com>
 <3777f1b1-2d9a-334b-b9e7-99dfda2ae29b@ti.com>
 <CAHCN7xJNJca8W_yw5nNY3AmKDSPoLzJ8voPmR1HS3bNcU8uQGg@mail.gmail.com>
 <6cd7c9f0-cb26-588b-dfd1-faf462732549@ti.com>
 <ec718740-bb8f-0d31-3622-89a62bd8fede@ti.com>
From: Tero Kristo <t-kristo@ti.com>
Message-ID: <202ae3b3-f72c-5b5b-4344-be22c8368cc7@ti.com>
Date: Tue, 1 Oct 2019 11:12:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <ec718740-bb8f-0d31-3622-89a62bd8fede@ti.com>
Content-Type: multipart/mixed; boundary="------------7177A182B47F5D946B1AB305"
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Approved-At: Wed, 02 Oct 2019 07:18:31 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1569917536;
 bh=aTd4roGIDcjFhwqb1RrwuZcI3FSaT+bMYigAks2TStw=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=PeGCNBOYFzs7FFkXm9QqEOKX/k7lVMlf0vl2NOa9Bnf4PggXHblN/uR+CdHoIxbrR
 GVnEBQuskOuynQ5OnzOlguYNQXoc7v7tuwymPYbQULIE2inpkPDV3iPv8ah5H84erw
 ZE53sLt7I2e9tR6ZoC0TuQ8r7HTHYjfQ+pR6ZKHs=
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: devicetree <devicetree@vger.kernel.org>, Tony Lindgren <tony@atomide.com>,
 "H. Nikolaus Schaller" <hns@goldelico.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre.com>,
 Linux-OMAP <linux-omap@vger.kernel.org>, Adam Ford <adam.ford@logicpd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--------------7177A182B47F5D946B1AB305
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 01/10/2019 08:07, Tomi Valkeinen wrote:
> On 30/09/2019 20:48, Tero Kristo wrote:
> 
>> Hmmh, after some testing, it seems there is bad stuff happening with 
>> the divider clock implementation, I am re-working it as of now. 
>> Basically what is wrong is that with a divider max value of say 16, 
>> the driver attempts to craft the max value into a mask, but this ends 
>> up being 0x1f. If the max value is 15, it ends up into 0xf which is 
>> correct.
> 
> Ok, that explains the max not working.
> 
> It doesn't explain the other issue, where the TRM says the max div is 
> 32, but it does not work. But taking the max div from the old SoCs, 16, 
> is not correct either, as it seems that dividers up to 31 work ok.
> 
>   Tomi
> 

Ok, attached a series that hopefully fixes it, any testing feedback 
welcome before I post this properly.

This also supports omap36xx dpll4_m4_ck divider up-to 31, other omap3 
family is limited to 16.

-Tero


--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
--------------7177A182B47F5D946B1AB305
Content-Type: text/x-patch;
	name="0002-clk-ti-divider-cleanup-ti_clk_parse_divider_data-API.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename*0="0002-clk-ti-divider-cleanup-ti_clk_parse_divider_data-API.pa";
	filename*1="tch"

From ac5652cc42860344c8daf00259a85debf5320763 Mon Sep 17 00:00:00 2001
From: Tero Kristo <t-kristo@ti.com>
Date: Mon, 30 Sep 2019 20:59:29 +0300
Subject: [PATCH 2/4] clk: ti: divider: cleanup ti_clk_parse_divider_data API

Cleanup the ti_clk_parse_divider_data to pass the divider data struct
directly instead of individual values of it. This makes it easier
to modify the implementation later on.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 drivers/clk/ti/clkctrl.c |  2 +-
 drivers/clk/ti/clock.h   |  3 +--
 drivers/clk/ti/divider.c | 18 +++++++-----------
 3 files changed, 9 insertions(+), 14 deletions(-)

diff --git a/drivers/clk/ti/clkctrl.c b/drivers/clk/ti/clkctrl.c
index 975995eea15c..665dfc5e309a 100644
--- a/drivers/clk/ti/clkctrl.c
+++ b/drivers/clk/ti/clkctrl.c
@@ -380,7 +380,7 @@ _ti_clkctrl_setup_div(struct omap_clkctrl_provider *provider,
 
 	if (ti_clk_parse_divider_data((int *)div_data->dividers, 0,
 				      div_data->max_div, div_flags,
-				      &div->width, &div->table)) {
+				      div)) {
 		pr_err("%s: Data parsing for %pOF:%04x:%d failed\n", __func__,
 		       node, offset, data->bit);
 		kfree(div);
diff --git a/drivers/clk/ti/clock.h b/drivers/clk/ti/clock.h
index e4b8392ff63c..f6b6876dfdee 100644
--- a/drivers/clk/ti/clock.h
+++ b/drivers/clk/ti/clock.h
@@ -220,8 +220,7 @@ void ti_clk_latch(struct clk_omap_reg *reg, s8 shift);
 struct clk_hw *ti_clk_build_component_mux(struct ti_clk_mux *setup);
 
 int ti_clk_parse_divider_data(int *div_table, int num_dividers, int max_div,
-			      u8 flags, u8 *width,
-			      const struct clk_div_table **table);
+			      u8 flags, struct clk_omap_divider *div);
 
 int ti_clk_get_reg_addr(struct device_node *node, int index,
 			struct clk_omap_reg *reg);
diff --git a/drivers/clk/ti/divider.c b/drivers/clk/ti/divider.c
index d9f7dc94e2a6..39e890204156 100644
--- a/drivers/clk/ti/divider.c
+++ b/drivers/clk/ti/divider.c
@@ -338,8 +338,7 @@ static struct clk *_register_divider(struct device_node *node,
 }
 
 int ti_clk_parse_divider_data(int *div_table, int num_dividers, int max_div,
-			      u8 flags, u8 *width,
-			      const struct clk_div_table **table)
+			      u8 flags, struct clk_omap_divider *divider)
 {
 	int valid_div = 0;
 	u32 val;
@@ -363,8 +362,7 @@ int ti_clk_parse_divider_data(int *div_table, int num_dividers, int max_div,
 			val++;
 		}
 
-		*width = fls(val);
-		*table = NULL;
+		divider->width = fls(val);
 
 		return 0;
 	}
@@ -382,24 +380,22 @@ int ti_clk_parse_divider_data(int *div_table, int num_dividers, int max_div,
 	num_dividers = i;
 
 	tmp = kcalloc(valid_div + 1, sizeof(*tmp), GFP_KERNEL);
-	if (!tmp) {
-		*table = ERR_PTR(-ENOMEM);
+	if (!tmp)
 		return -ENOMEM;
-	}
 
 	valid_div = 0;
-	*width = 0;
+	divider->width = 0;
 
 	for (i = 0; i < num_dividers; i++)
 		if (div_table[i] > 0) {
 			tmp[valid_div].div = div_table[i];
 			tmp[valid_div].val = i;
 			valid_div++;
-			*width = i;
+			divider->width = i;
 		}
 
-	*width = fls(*width);
-	*table = tmp;
+	divider->width = fls(divider->width);
+	divider->table = tmp;
 
 	return 0;
 }
-- 
2.17.1


--------------7177A182B47F5D946B1AB305
Content-Type: text/x-patch;
	name="0003-clk-ti-divider-convert-to-use-min-max-mask-instead-o.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename*0="0003-clk-ti-divider-convert-to-use-min-max-mask-instead-o.pa";
	filename*1="tch"

From 7f62f45d12cec77fd006ac37ab5e8a840274fc0f Mon Sep 17 00:00:00 2001
From: Tero Kristo <t-kristo@ti.com>
Date: Tue, 1 Oct 2019 10:56:31 +0300
Subject: [PATCH 3/4] clk: ti: divider: convert to use min,max,mask instead of
 width

The existing width field used to check divider validity does not provide
enough protection against bad values. For example, if max divider value
is 4, the smallest all-1 bitmask that can hold this value is 7, which
allows values higher than 4 to be used. This typically causes
unpredictable results with hardware. So far this issue hasn't been
noticed as most of the dividers actually have maximum values which fit
the whole bitfield, but there are certain clocks for which this is a
problem, like dpll4_m4 divider on omap3 devices.

Thus, convert the whole validity logic to use min,max and mask values
for determining if a specific divider is valid or not. This prevents
the odd cases where bad value would otherwise be written to a divider
config register.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 drivers/clk/ti/clock.h   |   4 +-
 drivers/clk/ti/divider.c | 151 ++++++++++++++++-----------------------
 2 files changed, 64 insertions(+), 91 deletions(-)

diff --git a/drivers/clk/ti/clock.h b/drivers/clk/ti/clock.h
index f6b6876dfdee..e6995c04001e 100644
--- a/drivers/clk/ti/clock.h
+++ b/drivers/clk/ti/clock.h
@@ -20,9 +20,11 @@ struct clk_omap_divider {
 	struct clk_hw		hw;
 	struct clk_omap_reg	reg;
 	u8			shift;
-	u8			width;
 	u8			flags;
 	s8			latch;
+	u16			min;
+	u16			max;
+	u16			mask;
 	const struct clk_div_table	*table;
 	u32		context;
 };
diff --git a/drivers/clk/ti/divider.c b/drivers/clk/ti/divider.c
index 39e890204156..c75cc54772f6 100644
--- a/drivers/clk/ti/divider.c
+++ b/drivers/clk/ti/divider.c
@@ -26,30 +26,6 @@
 #undef pr_fmt
 #define pr_fmt(fmt) "%s: " fmt, __func__
 
-#define div_mask(d)	((1 << ((d)->width)) - 1)
-
-static unsigned int _get_table_maxdiv(const struct clk_div_table *table)
-{
-	unsigned int maxdiv = 0;
-	const struct clk_div_table *clkt;
-
-	for (clkt = table; clkt->div; clkt++)
-		if (clkt->div > maxdiv)
-			maxdiv = clkt->div;
-	return maxdiv;
-}
-
-static unsigned int _get_maxdiv(struct clk_omap_divider *divider)
-{
-	if (divider->flags & CLK_DIVIDER_ONE_BASED)
-		return div_mask(divider);
-	if (divider->flags & CLK_DIVIDER_POWER_OF_TWO)
-		return 1 << div_mask(divider);
-	if (divider->table)
-		return _get_table_maxdiv(divider->table);
-	return div_mask(divider) + 1;
-}
-
 static unsigned int _get_table_div(const struct clk_div_table *table,
 				   unsigned int val)
 {
@@ -61,6 +37,24 @@ static unsigned int _get_table_div(const struct clk_div_table *table,
 	return 0;
 }
 
+static void _setup_mask(struct clk_omap_divider *divider)
+{
+	u16 mask;
+	u32 max_val;
+
+	max_val = divider->max;
+
+	if (!(divider->flags & CLK_DIVIDER_ONE_BASED))
+		max_val--;
+
+	if (divider->flags & CLK_DIVIDER_POWER_OF_TWO)
+		mask = fls(max_val) - 1;
+	else
+		mask = max_val;
+
+	divider->mask = (1 << fls(mask)) - 1;
+}
+
 static unsigned int _get_div(struct clk_omap_divider *divider, unsigned int val)
 {
 	if (divider->flags & CLK_DIVIDER_ONE_BASED)
@@ -101,7 +95,7 @@ static unsigned long ti_clk_divider_recalc_rate(struct clk_hw *hw,
 	unsigned int div, val;
 
 	val = ti_clk_ll_ops->clk_readl(&divider->reg) >> divider->shift;
-	val &= div_mask(divider);
+	val &= divider->mask;
 
 	div = _get_div(divider, val);
 	if (!div) {
@@ -180,7 +174,7 @@ static int ti_clk_divider_bestdiv(struct clk_hw *hw, unsigned long rate,
 	if (!rate)
 		rate = 1;
 
-	maxdiv = _get_maxdiv(divider);
+	maxdiv = divider->max;
 
 	if (!(clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT)) {
 		parent_rate = *best_parent_rate;
@@ -219,7 +213,7 @@ static int ti_clk_divider_bestdiv(struct clk_hw *hw, unsigned long rate,
 	}
 
 	if (!bestdiv) {
-		bestdiv = _get_maxdiv(divider);
+		bestdiv = divider->max;
 		*best_parent_rate =
 			clk_hw_round_rate(clk_hw_get_parent(hw), 1);
 	}
@@ -249,17 +243,16 @@ static int ti_clk_divider_set_rate(struct clk_hw *hw, unsigned long rate,
 	divider = to_clk_omap_divider(hw);
 
 	div = DIV_ROUND_UP(parent_rate, rate);
-	value = _get_val(divider, div);
 
-	if (value > div_mask(divider))
-		value = div_mask(divider);
+	if (div > divider->max)
+		div = divider->max;
+	if (div < divider->min)
+		div = divider->min;
 
-	if (divider->flags & CLK_DIVIDER_HIWORD_MASK) {
-		val = div_mask(divider) << (divider->shift + 16);
-	} else {
-		val = ti_clk_ll_ops->clk_readl(&divider->reg);
-		val &= ~(div_mask(divider) << divider->shift);
-	}
+	value = _get_val(divider, div);
+
+	val = ti_clk_ll_ops->clk_readl(&divider->reg);
+	val &= ~(divider->mask << divider->shift);
 	val |= value << divider->shift;
 	ti_clk_ll_ops->clk_writel(val, &divider->reg);
 
@@ -280,7 +273,7 @@ static int clk_divider_save_context(struct clk_hw *hw)
 	u32 val;
 
 	val = ti_clk_ll_ops->clk_readl(&divider->reg) >> divider->shift;
-	divider->context = val & div_mask(divider);
+	divider->context = val & divider->mask;
 
 	return 0;
 }
@@ -297,7 +290,7 @@ static void clk_divider_restore_context(struct clk_hw *hw)
 	u32 val;
 
 	val = ti_clk_ll_ops->clk_readl(&divider->reg);
-	val &= ~(div_mask(divider) << divider->shift);
+	val &= ~(divider->mask << divider->shift);
 	val |= divider->context << divider->shift;
 	ti_clk_ll_ops->clk_writel(val, &divider->reg);
 }
@@ -341,29 +334,14 @@ int ti_clk_parse_divider_data(int *div_table, int num_dividers, int max_div,
 			      u8 flags, struct clk_omap_divider *divider)
 {
 	int valid_div = 0;
-	u32 val;
-	int div;
 	int i;
 	struct clk_div_table *tmp;
+	u16 min_div = 0;
 
 	if (!div_table) {
-		if (flags & CLKF_INDEX_STARTS_AT_ONE)
-			val = 1;
-		else
-			val = 0;
-
-		div = 1;
-
-		while (div < max_div) {
-			if (flags & CLKF_INDEX_POWER_OF_TWO)
-				div <<= 1;
-			else
-				div++;
-			val++;
-		}
-
-		divider->width = fls(val);
-
+		divider->min = 1;
+		divider->max = max_div;
+		_setup_mask(divider);
 		return 0;
 	}
 
@@ -384,17 +362,21 @@ int ti_clk_parse_divider_data(int *div_table, int num_dividers, int max_div,
 		return -ENOMEM;
 
 	valid_div = 0;
-	divider->width = 0;
 
 	for (i = 0; i < num_dividers; i++)
 		if (div_table[i] > 0) {
 			tmp[valid_div].div = div_table[i];
 			tmp[valid_div].val = i;
 			valid_div++;
-			divider->width = i;
+			if (tmp[valid_div].div > max_div)
+				max_div = tmp[valid_div].div;
+			if (!min_div || tmp[valid_div].div < min_div)
+				min_div = tmp[valid_div].div;
 		}
 
-	divider->width = fls(divider->width);
+	divider->min = min_div;
+	divider->max = max_div;
+	_setup_mask(divider);
 	divider->table = tmp;
 
 	return 0;
@@ -451,16 +433,15 @@ static int __init ti_clk_get_div_table(struct device_node *node,
 	return 0;
 }
 
-static int _get_divider_width(struct device_node *node,
-			      const struct clk_div_table *table,
-			      u8 flags)
+static int _populate_divider_min_max(struct device_node *node,
+				     struct clk_omap_divider *divider)
 {
-	u32 min_div;
-	u32 max_div;
-	u32 val = 0;
-	u32 div;
+	u32 min_div = 0;
+	u32 max_div = 0;
+	u32 val;
+	const struct clk_div_table *clkt;
 
-	if (!table) {
+	if (!divider->table) {
 		/* Clk divider table not provided, determine min/max divs */
 		if (of_property_read_u32(node, "ti,min-div", &min_div))
 			min_div = 1;
@@ -469,30 +450,22 @@ static int _get_divider_width(struct device_node *node,
 			pr_err("no max-div for %pOFn!\n", node);
 			return -EINVAL;
 		}
-
-		/* Determine bit width for the field */
-		if (flags & CLK_DIVIDER_ONE_BASED)
-			val = 1;
-
-		div = min_div;
-
-		while (div < max_div) {
-			if (flags & CLK_DIVIDER_POWER_OF_TWO)
-				div <<= 1;
-			else
-				div++;
-			val++;
-		}
 	} else {
-		div = 0;
 
-		while (table[div].div) {
-			val = table[div].val;
-			div++;
+		for (clkt = divider->table; clkt->div; clkt++) {
+			val = clkt->div;
+			if (val > max_div)
+				max_div = val;
+			if (!min_div || val < min_div)
+				min_div = val;
 		}
 	}
 
-	return fls(val);
+	divider->min = min_div;
+	divider->max = max_div;
+	_setup_mask(divider);
+
+	return 0;
 }
 
 static int __init ti_clk_divider_populate(struct device_node *node,
@@ -532,9 +505,7 @@ static int __init ti_clk_divider_populate(struct device_node *node,
 	if (ret)
 		return ret;
 
-	div->width = _get_divider_width(node, div->table, div->flags);
-
-	return 0;
+	return _populate_divider_min_max(node, div);
 }
 
 /**
-- 
2.17.1


--------------7177A182B47F5D946B1AB305
Content-Type: text/x-patch;
	name="0004-ARM-dts-omap3-fix-DPLL4-M4-divider-max-value.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="0004-ARM-dts-omap3-fix-DPLL4-M4-divider-max-value.patch"

From 39a54036c7e653ab86384466803f78320332b1b5 Mon Sep 17 00:00:00 2001
From: Tero Kristo <t-kristo@ti.com>
Date: Mon, 30 Sep 2019 11:49:39 +0300
Subject: [PATCH 4/4] ARM: dts: omap3: fix DPLL4 M4 divider max value

The maximum divider value for DPLL4 M4 divider appears wrong. For most
OMAP3 family SoCs this is 16, but it is defined as 32, which is maybe
only valid for omap36xx. To avoid any overflows in trying to write this
register, set the max to 16 for all omap3 family, except omap36xx. For
omap36xx the maximum is set to 31, as it appears value 32 is not working
properly.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 arch/arm/boot/dts/omap36xx-clocks.dtsi | 4 ++++
 arch/arm/boot/dts/omap3xxx-clocks.dtsi | 2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/omap36xx-clocks.dtsi b/arch/arm/boot/dts/omap36xx-clocks.dtsi
index e66fc57ec35d..4e9cc9003594 100644
--- a/arch/arm/boot/dts/omap36xx-clocks.dtsi
+++ b/arch/arm/boot/dts/omap36xx-clocks.dtsi
@@ -105,3 +105,7 @@
 			 <&mcbsp4_ick>, <&uart4_fck>;
 	};
 };
+
+&dpll4_m4_ck {
+	ti,max-div = <31>;
+};
diff --git a/arch/arm/boot/dts/omap3xxx-clocks.dtsi b/arch/arm/boot/dts/omap3xxx-clocks.dtsi
index 685c82a9d03e..0656c32439d2 100644
--- a/arch/arm/boot/dts/omap3xxx-clocks.dtsi
+++ b/arch/arm/boot/dts/omap3xxx-clocks.dtsi
@@ -416,7 +416,7 @@
 		#clock-cells = <0>;
 		compatible = "ti,divider-clock";
 		clocks = <&dpll4_ck>;
-		ti,max-div = <32>;
+		ti,max-div = <16>;
 		reg = <0x0e40>;
 		ti,index-starts-at-one;
 	};
-- 
2.17.1


--------------7177A182B47F5D946B1AB305
Content-Type: text/x-patch;
	name="0001-clk-ti-divider-cleanup-_register_divider-and-ti_clk_.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename*0="0001-clk-ti-divider-cleanup-_register_divider-and-ti_clk_.pa";
	filename*1="tch"

From 9171eba432a7d8677eb89ebed1f37c00ad9d8852 Mon Sep 17 00:00:00 2001
From: Tero Kristo <t-kristo@ti.com>
Date: Mon, 30 Sep 2019 20:50:24 +0300
Subject: [PATCH 1/4] clk: ti: divider: cleanup _register_divider and
 ti_clk_get_div_table

Cleanup couple of TI divider clock internal APIs. These currently pass
huge amount of parameters, which makes it difficult to track what is
going on. Abstract most of these under struct clk_omap_div which gets
passed over the APIs.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 drivers/clk/ti/divider.c | 113 ++++++++++++++-------------------------
 1 file changed, 41 insertions(+), 72 deletions(-)

diff --git a/drivers/clk/ti/divider.c b/drivers/clk/ti/divider.c
index 6cb863c13648..d9f7dc94e2a6 100644
--- a/drivers/clk/ti/divider.c
+++ b/drivers/clk/ti/divider.c
@@ -310,47 +310,26 @@ const struct clk_ops ti_clk_divider_ops = {
 	.restore_context = clk_divider_restore_context,
 };
 
-static struct clk *_register_divider(struct device *dev, const char *name,
-				     const char *parent_name,
-				     unsigned long flags,
-				     struct clk_omap_reg *reg,
-				     u8 shift, u8 width, s8 latch,
-				     u8 clk_divider_flags,
-				     const struct clk_div_table *table)
+static struct clk *_register_divider(struct device_node *node,
+				     u32 flags,
+				     struct clk_omap_divider *div)
 {
-	struct clk_omap_divider *div;
 	struct clk *clk;
 	struct clk_init_data init;
+	const char *parent_name;
 
-	if (clk_divider_flags & CLK_DIVIDER_HIWORD_MASK) {
-		if (width + shift > 16) {
-			pr_warn("divider value exceeds LOWORD field\n");
-			return ERR_PTR(-EINVAL);
-		}
-	}
-
-	/* allocate the divider */
-	div = kzalloc(sizeof(*div), GFP_KERNEL);
-	if (!div)
-		return ERR_PTR(-ENOMEM);
+	parent_name = of_clk_get_parent_name(node, 0);
 
-	init.name = name;
+	init.name = node->name;
 	init.ops = &ti_clk_divider_ops;
 	init.flags = flags;
 	init.parent_names = (parent_name ? &parent_name : NULL);
 	init.num_parents = (parent_name ? 1 : 0);
 
-	/* struct clk_divider assignments */
-	memcpy(&div->reg, reg, sizeof(*reg));
-	div->shift = shift;
-	div->width = width;
-	div->latch = latch;
-	div->flags = clk_divider_flags;
 	div->hw.init = &init;
-	div->table = table;
 
 	/* register the clock */
-	clk = ti_clk_register(dev, &div->hw, name);
+	clk = ti_clk_register(NULL, &div->hw, node->name);
 
 	if (IS_ERR(clk))
 		kfree(div);
@@ -425,8 +404,8 @@ int ti_clk_parse_divider_data(int *div_table, int num_dividers, int max_div,
 	return 0;
 }
 
-static struct clk_div_table *
-__init ti_clk_get_div_table(struct device_node *node)
+static int __init ti_clk_get_div_table(struct device_node *node,
+				       struct clk_omap_divider *div)
 {
 	struct clk_div_table *table;
 	const __be32 *divspec;
@@ -438,7 +417,7 @@ __init ti_clk_get_div_table(struct device_node *node)
 	divspec = of_get_property(node, "ti,dividers", &num_div);
 
 	if (!divspec)
-		return NULL;
+		return 0;
 
 	num_div /= 4;
 
@@ -453,13 +432,12 @@ __init ti_clk_get_div_table(struct device_node *node)
 
 	if (!valid_div) {
 		pr_err("no valid dividers for %pOFn table\n", node);
-		return ERR_PTR(-EINVAL);
+		return -EINVAL;
 	}
 
 	table = kcalloc(valid_div + 1, sizeof(*table), GFP_KERNEL);
-
 	if (!table)
-		return ERR_PTR(-ENOMEM);
+		return -ENOMEM;
 
 	valid_div = 0;
 
@@ -472,7 +450,9 @@ __init ti_clk_get_div_table(struct device_node *node)
 		}
 	}
 
-	return table;
+	div->table = table;
+
+	return 0;
 }
 
 static int _get_divider_width(struct device_node *node,
@@ -520,46 +500,43 @@ static int _get_divider_width(struct device_node *node,
 }
 
 static int __init ti_clk_divider_populate(struct device_node *node,
-	struct clk_omap_reg *reg, const struct clk_div_table **table,
-	u32 *flags, u8 *div_flags, u8 *width, u8 *shift, s8 *latch)
+					  struct clk_omap_divider *div,
+					  u32 *flags)
 {
 	u32 val;
 	int ret;
 
-	ret = ti_clk_get_reg_addr(node, 0, reg);
+	ret = ti_clk_get_reg_addr(node, 0, &div->reg);
 	if (ret)
 		return ret;
 
 	if (!of_property_read_u32(node, "ti,bit-shift", &val))
-		*shift = val;
+		div->shift = val;
 	else
-		*shift = 0;
+		div->shift = 0;
 
-	if (latch) {
-		if (!of_property_read_u32(node, "ti,latch-bit", &val))
-			*latch = val;
-		else
-			*latch = -EINVAL;
-	}
+	if (!of_property_read_u32(node, "ti,latch-bit", &val))
+		div->latch = val;
+	else
+		div->latch = -EINVAL;
 
 	*flags = 0;
-	*div_flags = 0;
+	div->flags = 0;
 
 	if (of_property_read_bool(node, "ti,index-starts-at-one"))
-		*div_flags |= CLK_DIVIDER_ONE_BASED;
+		div->flags |= CLK_DIVIDER_ONE_BASED;
 
 	if (of_property_read_bool(node, "ti,index-power-of-two"))
-		*div_flags |= CLK_DIVIDER_POWER_OF_TWO;
+		div->flags |= CLK_DIVIDER_POWER_OF_TWO;
 
 	if (of_property_read_bool(node, "ti,set-rate-parent"))
 		*flags |= CLK_SET_RATE_PARENT;
 
-	*table = ti_clk_get_div_table(node);
-
-	if (IS_ERR(*table))
-		return PTR_ERR(*table);
+	ret = ti_clk_get_div_table(node, div);
+	if (ret)
+		return ret;
 
-	*width = _get_divider_width(node, *table, *div_flags);
+	div->width = _get_divider_width(node, div->table, div->flags);
 
 	return 0;
 }
@@ -573,24 +550,17 @@ static int __init ti_clk_divider_populate(struct device_node *node,
 static void __init of_ti_divider_clk_setup(struct device_node *node)
 {
 	struct clk *clk;
-	const char *parent_name;
-	struct clk_omap_reg reg;
-	u8 clk_divider_flags = 0;
-	u8 width = 0;
-	u8 shift = 0;
-	s8 latch = -EINVAL;
-	const struct clk_div_table *table = NULL;
 	u32 flags = 0;
+	struct clk_omap_divider *div;
 
-	parent_name = of_clk_get_parent_name(node, 0);
+	div = kzalloc(sizeof(*div), GFP_KERNEL);
+	if (!div)
+		return;
 
-	if (ti_clk_divider_populate(node, &reg, &table, &flags,
-				    &clk_divider_flags, &width, &shift, &latch))
+	if (ti_clk_divider_populate(node, div, &flags))
 		goto cleanup;
 
-	clk = _register_divider(NULL, node->name, parent_name, flags, &reg,
-				shift, width, latch, clk_divider_flags, table);
-
+	clk = _register_divider(node, flags, div);
 	if (!IS_ERR(clk)) {
 		of_clk_add_provider(node, of_clk_src_simple_get, clk);
 		of_ti_clk_autoidle_setup(node);
@@ -598,22 +568,21 @@ static void __init of_ti_divider_clk_setup(struct device_node *node)
 	}
 
 cleanup:
-	kfree(table);
+	kfree(div->table);
+	kfree(div);
 }
 CLK_OF_DECLARE(divider_clk, "ti,divider-clock", of_ti_divider_clk_setup);
 
 static void __init of_ti_composite_divider_clk_setup(struct device_node *node)
 {
 	struct clk_omap_divider *div;
-	u32 val;
+	u32 tmp;
 
 	div = kzalloc(sizeof(*div), GFP_KERNEL);
 	if (!div)
 		return;
 
-	if (ti_clk_divider_populate(node, &div->reg, &div->table, &val,
-				    &div->flags, &div->width, &div->shift,
-				    NULL) < 0)
+	if (ti_clk_divider_populate(node, div, &tmp))
 		goto cleanup;
 
 	if (!ti_clk_add_component(node, &div->hw, CLK_COMPONENT_TYPE_DIVIDER))
-- 
2.17.1


--------------7177A182B47F5D946B1AB305
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--------------7177A182B47F5D946B1AB305--
