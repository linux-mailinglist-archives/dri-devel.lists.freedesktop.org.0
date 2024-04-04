Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D163897F9A
	for <lists+dri-devel@lfdr.de>; Thu,  4 Apr 2024 07:16:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54C7A1131C4;
	Thu,  4 Apr 2024 05:16:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sakura.ysato.name (ik1-413-38519.vs.sakura.ne.jp
 [153.127.30.23])
 by gabe.freedesktop.org (Postfix) with ESMTP id 097C3112D91
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Apr 2024 05:15:21 +0000 (UTC)
Received: from SIOS1075.ysato.name (al128006.dynamic.ppp.asahi-net.or.jp
 [111.234.128.6])
 by sakura.ysato.name (Postfix) with ESMTPSA id 465851C0FEF;
 Thu,  4 Apr 2024 14:15:19 +0900 (JST)
From: Yoshinori Sato <ysato@users.sourceforge.jp>
To: linux-sh@vger.kernel.org
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>,
 Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Thomas Gleixner <tglx@linutronix.de>, Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Rich Felker <dalias@libc.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Lee Jones <lee@kernel.org>, Helge Deller <deller@gmx.de>,
 Heiko Stuebner <heiko.stuebner@cherry.de>, Shawn Guo <shawnguo@kernel.org>,
 Sebastian Reichel <sre@kernel.org>, Chris Morgan <macromorgan@hotmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 David Rientjes <rientjes@google.com>, Hyeonggon Yoo <42.hyeyoo@gmail.com>,
 Vlastimil Babka <vbabka@suse.cz>, Baoquan He <bhe@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Kefeng Wang <wangkefeng.wang@huawei.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Javier Martinez Canillas <javierm@redhat.com>, Guo Ren <guoren@kernel.org>,
 Azeem Shaikh <azeemshaikh38@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>, Jacky Huang <ychuang3@nuvoton.com>,
 Herve Codina <herve.codina@bootlin.com>,
 Manikanta Guntupalli <manikanta.guntupalli@amd.com>,
 Anup Patel <apatel@ventanamicro.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Sam Ravnborg <sam@ravnborg.org>, Sergey Shtylyov <s.shtylyov@omp.ru>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 linux-ide@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-pci@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-fbdev@vger.kernel.org
Subject: [RESEND v7 14/37] clk: Compatible with narrow registers
Date: Thu,  4 Apr 2024 14:14:25 +0900
Message-Id: <9c1d56d37f5d3780d3c506ae680133b6bdaa5fdc.1712207606.git.ysato@users.sourceforge.jp>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1712207606.git.ysato@users.sourceforge.jp>
References: <cover.1712207606.git.ysato@users.sourceforge.jp>
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

divider and gate only support 32-bit registers.
Older hardware uses narrower registers, so I want to be able to handle
8-bit and 16-bit wide registers.

Seven clk_divider flags are used, and if I add flags for 8bit access and
16bit access, 8bit will not be enough, so I expanded it to u16.

Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
---
 drivers/clk/clk-divider.c    | 56 +++++++++++++++++++++-----------
 drivers/clk/clk-gate.c       | 62 ++++++++++++++++++++++++++++--------
 include/linux/clk-provider.h | 22 ++++++++++---
 3 files changed, 103 insertions(+), 37 deletions(-)

diff --git a/drivers/clk/clk-divider.c b/drivers/clk/clk-divider.c
index a2c2b5203b0a..a1b5187cd63d 100644
--- a/drivers/clk/clk-divider.c
+++ b/drivers/clk/clk-divider.c
@@ -26,20 +26,38 @@
  * parent - fixed parent.  No clk_set_parent support
  */
 
-static inline u32 clk_div_readl(struct clk_divider *divider)
-{
-	if (divider->flags & CLK_DIVIDER_BIG_ENDIAN)
-		return ioread32be(divider->reg);
-
-	return readl(divider->reg);
+static inline u32 clk_div_read(struct clk_divider *divider)
+{
+	if (divider->flags & CLK_DIVIDER_REG_8BIT)
+		return readb(divider->reg);
+	else if (divider->flags & CLK_DIVIDER_REG_16BIT) {
+		if (divider->flags & CLK_DIVIDER_BIG_ENDIAN)
+			return ioread16be(divider->reg);
+		else
+			return readw(divider->reg);
+	} else {
+		if (divider->flags & CLK_DIVIDER_BIG_ENDIAN)
+			return ioread32be(divider->reg);
+		else
+			return readl(divider->reg);
+	}
 }
 
-static inline void clk_div_writel(struct clk_divider *divider, u32 val)
+static inline void clk_div_write(struct clk_divider *divider, u32 val)
 {
-	if (divider->flags & CLK_DIVIDER_BIG_ENDIAN)
-		iowrite32be(val, divider->reg);
-	else
-		writel(val, divider->reg);
+	if (divider->flags & CLK_DIVIDER_REG_8BIT)
+		writeb(val, divider->reg);
+	else if (divider->flags & CLK_DIVIDER_REG_16BIT) {
+		if (divider->flags & CLK_DIVIDER_BIG_ENDIAN)
+			iowrite16be(val, divider->reg);
+		else
+			writew(val, divider->reg);
+	} else {
+		if (divider->flags & CLK_DIVIDER_BIG_ENDIAN)
+			iowrite32be(val, divider->reg);
+		else
+			writel(val, divider->reg);
+	}
 }
 
 static unsigned int _get_table_maxdiv(const struct clk_div_table *table,
@@ -152,7 +170,7 @@ static unsigned long clk_divider_recalc_rate(struct clk_hw *hw,
 	struct clk_divider *divider = to_clk_divider(hw);
 	unsigned int val;
 
-	val = clk_div_readl(divider) >> divider->shift;
+	val = clk_div_read(divider) >> divider->shift;
 	val &= clk_div_mask(divider->width);
 
 	return divider_recalc_rate(hw, parent_rate, val, divider->table,
@@ -434,7 +452,7 @@ static long clk_divider_round_rate(struct clk_hw *hw, unsigned long rate,
 	if (divider->flags & CLK_DIVIDER_READ_ONLY) {
 		u32 val;
 
-		val = clk_div_readl(divider) >> divider->shift;
+		val = clk_div_read(divider) >> divider->shift;
 		val &= clk_div_mask(divider->width);
 
 		return divider_ro_round_rate(hw, rate, prate, divider->table,
@@ -455,7 +473,7 @@ static int clk_divider_determine_rate(struct clk_hw *hw,
 	if (divider->flags & CLK_DIVIDER_READ_ONLY) {
 		u32 val;
 
-		val = clk_div_readl(divider) >> divider->shift;
+		val = clk_div_read(divider) >> divider->shift;
 		val &= clk_div_mask(divider->width);
 
 		return divider_ro_determine_rate(hw, req, divider->table,
@@ -505,11 +523,11 @@ static int clk_divider_set_rate(struct clk_hw *hw, unsigned long rate,
 	if (divider->flags & CLK_DIVIDER_HIWORD_MASK) {
 		val = clk_div_mask(divider->width) << (divider->shift + 16);
 	} else {
-		val = clk_div_readl(divider);
+		val = clk_div_read(divider);
 		val &= ~(clk_div_mask(divider->width) << divider->shift);
 	}
 	val |= (u32)value << divider->shift;
-	clk_div_writel(divider, val);
+	clk_div_write(divider, val);
 
 	if (divider->lock)
 		spin_unlock_irqrestore(divider->lock, flags);
@@ -538,7 +556,7 @@ struct clk_hw *__clk_hw_register_divider(struct device *dev,
 		struct device_node *np, const char *name,
 		const char *parent_name, const struct clk_hw *parent_hw,
 		const struct clk_parent_data *parent_data, unsigned long flags,
-		void __iomem *reg, u8 shift, u8 width, u8 clk_divider_flags,
+		void __iomem *reg, u8 shift, u8 width, u32 clk_divider_flags,
 		const struct clk_div_table *table, spinlock_t *lock)
 {
 	struct clk_divider *div;
@@ -610,7 +628,7 @@ EXPORT_SYMBOL_GPL(__clk_hw_register_divider);
 struct clk *clk_register_divider_table(struct device *dev, const char *name,
 		const char *parent_name, unsigned long flags,
 		void __iomem *reg, u8 shift, u8 width,
-		u8 clk_divider_flags, const struct clk_div_table *table,
+		u32 clk_divider_flags, const struct clk_div_table *table,
 		spinlock_t *lock)
 {
 	struct clk_hw *hw;
@@ -664,7 +682,7 @@ struct clk_hw *__devm_clk_hw_register_divider(struct device *dev,
 		struct device_node *np, const char *name,
 		const char *parent_name, const struct clk_hw *parent_hw,
 		const struct clk_parent_data *parent_data, unsigned long flags,
-		void __iomem *reg, u8 shift, u8 width, u8 clk_divider_flags,
+		void __iomem *reg, u8 shift, u8 width, u32 clk_divider_flags,
 		const struct clk_div_table *table, spinlock_t *lock)
 {
 	struct clk_hw **ptr, *hw;
diff --git a/drivers/clk/clk-gate.c b/drivers/clk/clk-gate.c
index 68e585a02fd9..65191f9684ff 100644
--- a/drivers/clk/clk-gate.c
+++ b/drivers/clk/clk-gate.c
@@ -24,20 +24,38 @@
  * parent - fixed parent.  No clk_set_parent support
  */
 
-static inline u32 clk_gate_readl(struct clk_gate *gate)
+static inline u32 clk_gate_read(struct clk_gate *gate)
 {
-	if (gate->flags & CLK_GATE_BIG_ENDIAN)
-		return ioread32be(gate->reg);
-
-	return readl(gate->reg);
+	if (gate->flags & CLK_GATE_REG_8BIT)
+		return readb(gate->reg);
+	else if (gate->flags & CLK_GATE_REG_16BIT) {
+		if (gate->flags & CLK_GATE_BIG_ENDIAN)
+			return ioread16be(gate->reg);
+		else
+			return readw(gate->reg);
+	} else {
+		if (gate->flags & CLK_GATE_BIG_ENDIAN)
+			return ioread32be(gate->reg);
+		else
+			return readl(gate->reg);
+	}
 }
 
-static inline void clk_gate_writel(struct clk_gate *gate, u32 val)
+static inline void clk_gate_write(struct clk_gate *gate, u32 val)
 {
-	if (gate->flags & CLK_GATE_BIG_ENDIAN)
-		iowrite32be(val, gate->reg);
-	else
-		writel(val, gate->reg);
+	if (gate->flags & CLK_GATE_REG_8BIT)
+		writeb(val, gate->reg);
+	else if (gate->flags & CLK_GATE_REG_16BIT) {
+		if (gate->flags & CLK_GATE_BIG_ENDIAN)
+			iowrite16be(val, gate->reg);
+		else
+			writew(val, gate->reg);
+	} else {
+		if (gate->flags & CLK_GATE_BIG_ENDIAN)
+			iowrite32be(val, gate->reg);
+		else
+			writel(val, gate->reg);
+	}
 }
 
 /*
@@ -72,7 +90,7 @@ static void clk_gate_endisable(struct clk_hw *hw, int enable)
 		if (set)
 			reg |= BIT(gate->bit_idx);
 	} else {
-		reg = clk_gate_readl(gate);
+		reg = clk_gate_read(gate);
 
 		if (set)
 			reg |= BIT(gate->bit_idx);
@@ -80,7 +98,7 @@ static void clk_gate_endisable(struct clk_hw *hw, int enable)
 			reg &= ~BIT(gate->bit_idx);
 	}
 
-	clk_gate_writel(gate, reg);
+	clk_gate_write(gate, reg);
 
 	if (gate->lock)
 		spin_unlock_irqrestore(gate->lock, flags);
@@ -105,7 +123,7 @@ int clk_gate_is_enabled(struct clk_hw *hw)
 	u32 reg;
 	struct clk_gate *gate = to_clk_gate(hw);
 
-	reg = clk_gate_readl(gate);
+	reg = clk_gate_read(gate);
 
 	/* if a set bit disables this clk, flip it before masking */
 	if (gate->flags & CLK_GATE_SET_TO_DISABLE)
@@ -137,12 +155,30 @@ struct clk_hw *__clk_hw_register_gate(struct device *dev,
 	struct clk_init_data init = {};
 	int ret = -EINVAL;
 
+	/* validate register size option and bit_idx */
 	if (clk_gate_flags & CLK_GATE_HIWORD_MASK) {
 		if (bit_idx > 15) {
 			pr_err("gate bit exceeds LOWORD field\n");
 			return ERR_PTR(-EINVAL);
 		}
 	}
+	if (clk_gate_flags & CLK_GATE_REG_16BIT) {
+		if (bit_idx > 15) {
+			pr_err("gate bit exceeds 16 bits\n");
+			return ERR_PTR(-EINVAL);
+		}
+	}
+	if (clk_gate_flags & CLK_GATE_REG_8BIT) {
+		if (bit_idx > 7) {
+			pr_err("gate bit exceeds 8 bits\n");
+			return ERR_PTR(-EINVAL);
+		}
+	}
+	if ((clk_gate_flags & CLK_GATE_HIWORD_MASK) &&
+	    clk_gate_flags & (CLK_GATE_REG_8BIT | CLK_GATE_REG_16BIT)) {
+		pr_err("HIWORD_MASK required 32-bit register\n");
+		return ERR_PTR(-EINVAL);
+	}
 
 	/* allocate the gate */
 	gate = kzalloc(sizeof(*gate), GFP_KERNEL);
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 4a537260f655..eaa6ff1d0b2e 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -508,12 +508,16 @@ void of_fixed_clk_setup(struct device_node *np);
  * CLK_GATE_BIG_ENDIAN - by default little endian register accesses are used for
  *	the gate register.  Setting this flag makes the register accesses big
  *	endian.
+ * CLK_GATE_REG_8BIT - by default 32bit register accesses are used for
+ *	the gate register.  Setting this flag makes the register accesses 8bit.
+ * CLK_GATE_REG_16BIT - by default 32bit register accesses are used for
+ *	the gate register.  Setting this flag makes the register accesses 16bit.
  */
 struct clk_gate {
 	struct clk_hw hw;
 	void __iomem	*reg;
 	u8		bit_idx;
-	u8		flags;
+	u32		flags;
 	spinlock_t	*lock;
 };
 
@@ -522,6 +526,8 @@ struct clk_gate {
 #define CLK_GATE_SET_TO_DISABLE		BIT(0)
 #define CLK_GATE_HIWORD_MASK		BIT(1)
 #define CLK_GATE_BIG_ENDIAN		BIT(2)
+#define CLK_GATE_REG_8BIT		BIT(3)
+#define CLK_GATE_REG_16BIT		BIT(4)
 
 extern const struct clk_ops clk_gate_ops;
 struct clk_hw *__clk_hw_register_gate(struct device *dev,
@@ -675,13 +681,17 @@ struct clk_div_table {
  * CLK_DIVIDER_BIG_ENDIAN - By default little endian register accesses are used
  *	for the divider register.  Setting this flag makes the register accesses
  *	big endian.
+ * CLK_DIVIDER_REG_8BIT - by default 32bit register accesses are used for
+ *	the gate register.  Setting this flag makes the register accesses 8bit.
+ * CLK_DIVIDER_REG_16BIT - by default 32bit register accesses are used for
+ *	the gate register.  Setting this flag makes the register accesses 16bit.
  */
 struct clk_divider {
 	struct clk_hw	hw;
 	void __iomem	*reg;
 	u8		shift;
 	u8		width;
-	u8		flags;
+	u16		flags;
 	const struct clk_div_table	*table;
 	spinlock_t	*lock;
 };
@@ -697,6 +707,8 @@ struct clk_divider {
 #define CLK_DIVIDER_READ_ONLY		BIT(5)
 #define CLK_DIVIDER_MAX_AT_ZERO		BIT(6)
 #define CLK_DIVIDER_BIG_ENDIAN		BIT(7)
+#define CLK_DIVIDER_REG_8BIT		BIT(8)
+#define CLK_DIVIDER_REG_16BIT		BIT(9)
 
 extern const struct clk_ops clk_divider_ops;
 extern const struct clk_ops clk_divider_ro_ops;
@@ -726,18 +738,18 @@ struct clk_hw *__clk_hw_register_divider(struct device *dev,
 		struct device_node *np, const char *name,
 		const char *parent_name, const struct clk_hw *parent_hw,
 		const struct clk_parent_data *parent_data, unsigned long flags,
-		void __iomem *reg, u8 shift, u8 width, u8 clk_divider_flags,
+		void __iomem *reg, u8 shift, u8 width, u32 clk_divider_flags,
 		const struct clk_div_table *table, spinlock_t *lock);
 struct clk_hw *__devm_clk_hw_register_divider(struct device *dev,
 		struct device_node *np, const char *name,
 		const char *parent_name, const struct clk_hw *parent_hw,
 		const struct clk_parent_data *parent_data, unsigned long flags,
-		void __iomem *reg, u8 shift, u8 width, u8 clk_divider_flags,
+		void __iomem *reg, u8 shift, u8 width, u32 clk_divider_flags,
 		const struct clk_div_table *table, spinlock_t *lock);
 struct clk *clk_register_divider_table(struct device *dev, const char *name,
 		const char *parent_name, unsigned long flags,
 		void __iomem *reg, u8 shift, u8 width,
-		u8 clk_divider_flags, const struct clk_div_table *table,
+		u32 clk_divider_flags, const struct clk_div_table *table,
 		spinlock_t *lock);
 /**
  * clk_register_divider - register a divider clock with the clock framework
-- 
2.39.2

