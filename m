Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B172A8280A4
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jan 2024 09:24:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82ADC10E6E1;
	Tue,  9 Jan 2024 08:24:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sakura.ysato.name (ik1-413-38519.vs.sakura.ne.jp
 [153.127.30.23])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4A97E10E6DB
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jan 2024 08:24:25 +0000 (UTC)
Received: from SIOS1075.ysato.name (ZM005235.ppp.dion.ne.jp [222.8.5.235])
 by sakura.ysato.name (Postfix) with ESMTPSA id EF9101C0A13;
 Tue,  9 Jan 2024 17:24:22 +0900 (JST)
From: Yoshinori Sato <ysato@users.sourceforge.jp>
To: linux-sh@vger.kernel.org
Subject: [DO NOT MERGE v6 23/37] mfd: sm501: Convert platform_data to OF
 property
Date: Tue,  9 Jan 2024 17:23:20 +0900
Message-Id: <569f0bfb4fa3fcec8fbd64f67fc4fd2d1cba3f77.1704788539.git.ysato@users.sourceforge.jp>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1704788539.git.ysato@users.sourceforge.jp>
References: <cover.1704788539.git.ysato@users.sourceforge.jp>
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
Cc: =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
 linux-fbdev@vger.kernel.org, Rich Felker <dalias@libc.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Bin Meng <bmeng@tinylab.org>,
 Michael Turquette <mturquette@baylibre.com>, linux-pci@vger.kernel.org,
 Jacky Huang <ychuang3@nuvoton.com>, Palmer Dabbelt <palmer@rivosinc.com>,
 linux-kernel@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>,
 Lee Jones <lee@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Hyeonggon Yoo <42.hyeyoo@gmail.com>, Jiri Slaby <jirislaby@kernel.org>,
 linux-clk@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Jonathan Corbet <corbet@lwn.net>,
 Helge Deller <deller@gmx.de>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-serial@vger.kernel.org,
 David Rientjes <rientjes@google.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Maxime Ripard <mripard@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 Chris Morgan <macromorgan@hotmail.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 Vlastimil Babka <vbabka@suse.cz>, Yang Xiwen <forbidden405@foxmail.com>,
 Sergey Shtylyov <s.shtylyov@omp.ru>, Baoquan He <bhe@redhat.com>,
 linux-ide@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Biju Das <biju.das.jz@bp.renesas.com>,
 Sebastian Reichel <sre@kernel.org>, Azeem Shaikh <azeemshaikh38@gmail.com>,
 linux-renesas-soc@vger.kernel.org, Damien Le Moal <dlemoal@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Various parameters of SM501 can be set using platform_data,
so parameters cannot be passed in the DeviceTree target.
Expands the parameters set in platform_data so that they can be
specified using DeviceTree properties.

Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
---
 drivers/mfd/sm501.c           | 436 ++++++++++++++++++++++++++++++++++
 drivers/video/fbdev/sm501fb.c | 106 +++++++++
 2 files changed, 542 insertions(+)

diff --git a/drivers/mfd/sm501.c b/drivers/mfd/sm501.c
index 28027982cf69..3408778e0048 100644
--- a/drivers/mfd/sm501.c
+++ b/drivers/mfd/sm501.c
@@ -82,6 +82,23 @@ struct sm501_devdata {
 	unsigned int			 rev;
 };
 
+enum prop_type {
+	PROP_NUM, PROP_STR,
+};
+
+enum val_type {
+	ENDIS, MT_EX, MT_XC, MT_SSM, MT_SM, MT_DEBUG, MT_DIV, MT_USB, MT_DELAY,
+	MC_PAD,	MC_USBCLK, MC_SSP, MC_FP, MC_FREQ, MC_REFRESH, MC_HOLD, MC_SH,
+	MC_II, MC_GAP, MC_DAC, MC_MC, MC_BL, MC_USB, MC_LB, MC_VR,
+};
+
+struct sm501_config_props {
+	char *name;
+	u32 shift;
+	u32 width;
+	enum prop_type prop_type;
+	enum val_type val_type;
+};
 
 #define MHZ (1000 * 1000)
 
@@ -1370,6 +1387,419 @@ static int sm501_init_dev(struct sm501_devdata *sm)
 	return 0;
 }
 
+static u32 lookup_str(const char *val, const char * const *list)
+{
+	u32 ret = 0;
+
+	while (*list) {
+		if (strcmp(val, *list) == 0)
+			return ret;
+		list++;
+		ret++;
+	}
+	return ~0;
+}
+
+static u32 lookup_num(u32 val, const u32 *list)
+{
+	u32 ret = 0;
+
+	while (*list != ~0) {
+		if (val == *list)
+			return ret;
+		list++;
+		ret++;
+	}
+	return ~0;
+}
+
+static const struct sm501_config_props misc_timming[] = {
+	{"ex",      28, 4, PROP_NUM, MT_EX},
+	{"xc",      24, 2, PROP_STR, MT_XC},
+	{"us",      23, 1, PROP_STR, ENDIS},
+	{"ssm1",    20, 1, PROP_STR, MT_SSM},
+	{"sm1",     16, 4, PROP_NUM, MT_SM},
+	{"ssm0",    12, 1, PROP_STR, MT_SSM},
+	{"sm0",      8, 4, PROP_NUM, MT_SM},
+	{"deb",      7, 1, PROP_STR, MT_DEBUG},
+	{"acpi",     6, 1, PROP_STR, ENDIS},
+	{"divider",  4, 2, PROP_NUM, MT_DIV},
+	{"usb-mode", 3, 1, PROP_STR, MT_USB},
+	{"delay",    0, 3, PROP_NUM, MT_DELAY},
+	{},
+};
+
+static const struct sm501_config_props misc_control[] = {
+	{"pad",      30, 2, PROP_NUM, MC_PAD},
+	{"usbclk",   28, 2, PROP_STR, MC_USBCLK},
+	{"uart-ssp", 27, 1, PROP_STR, MC_SSP},
+	{"lat",      26, 1, PROP_STR, ENDIS},
+	{"fp",       25, 1, PROP_NUM, MC_FP},
+	{"freq",     24, 1, PROP_NUM, MC_FREQ},
+	{"refresh",  21, 2, PROP_NUM, MC_REFRESH},
+	{"hold",     18, 3, PROP_NUM, MC_HOLD},
+	{"sh",       17, 1, PROP_STR, MC_SH},
+	{"ii",       16, 1, PROP_STR, MC_II},
+	{"pll",      15, 1, PROP_STR, ENDIS},
+	{"gap",      13, 2, PROP_STR, MC_GAP},
+	{"dac",      12, 1, PROP_STR, MC_DAC},
+	{"mc",       11, 1, PROP_STR, MC_MC},
+	{"bl",       10, 1, PROP_NUM, MC_BL},
+	{"usb",       9, 1, PROP_STR, MC_USB},
+	{"lb",        8, 1, PROP_STR, MC_LB},
+	{"vr",        4, 1, PROP_NUM, MC_VR},
+	{},
+};
+
+/* Read configuration values */
+static void sm501_of_read_config(struct device *dev, struct device_node *np,
+				 const char *prefix,
+				 const struct sm501_config_props *props,
+				 struct sm501_reg_init *ret)
+{
+	static const char * const endis[] = { "disable", "enable", NULL };
+	static const char * const xc[] = { "internal-pll", "hclk", "gpio33", NULL };
+	static const char * const ssm[] = { "288mhz", "div", NULL };
+	static const char * const debmode[] = { "input-reference", "output", NULL };
+	static const char * const usbmode[] = { "normal", "simulation", NULL };
+	static const char * const usbclk[] = { "crystal", "-", "96mhz", "48mhz", NULL };
+	static const char * const ssp[] = { "uart1", "ssp1", NULL };
+	static const char * const sh_ready[] = { "active-low", "active-high", NULL };
+	static const char * const int_invert[] = { "normal", "invert", NULL };
+	static const char * const slave[] = { "cpu", "8051", NULL };
+	static const char * const usbport[] = { "master", "slave", NULL };
+	static const char * const usbloop[] = { "normal", "loopback", NULL };
+
+	static const u32 divrate[] = { 336, 288, 240, 192, ~0 };
+	static const u32 fpdata[] = { 18, 24, ~0 };
+	static const u32 cfreq[] = { 24, 12, ~0 };
+	static const u32 bushold[] = { 0, 8, 16, 24, 32, ~0 };
+	static const u32 burst[] = { 8, 1, ~0 };
+	static const u32 vrmem[] = { 30, 62, ~0 };
+
+	struct device_node *child;
+	const char *sval;
+	u32 mask;
+	u32 val;
+	int err;
+
+	ret->mask = ~0;
+	ret->set = 0;
+
+	child = of_get_child_by_name(np, prefix);
+	if (!child)
+		return;
+
+	while (props->name) {
+		switch (props->prop_type) {
+		case PROP_NUM:
+			err = of_property_read_u32(child, props->name, &val);
+			break;
+		case PROP_STR:
+			err = of_property_read_string(child, props->name, &sval);
+			break;
+		}
+		if (!err) {
+			switch (props->val_type) {
+			case ENDIS:
+				val = lookup_str(sval, endis);
+				break;
+			case MT_EX:
+				val /= 16;
+				break;
+			case MT_XC:
+				val = lookup_str(sval, xc);
+				break;
+			case MT_SSM:
+				val = lookup_str(sval, ssm);
+				break;
+			case MT_SM:
+				if ((val % 3) == 0) {
+					val /= 3;
+					val = ffs(val);
+					val += 8;
+				} else {
+					val = ffs(val);
+				}
+				break;
+			case MT_DEBUG:
+				val = lookup_str(sval, debmode);
+				break;
+			case MT_DIV:
+				val = lookup_num(val, divrate);
+				break;
+			case MT_USB:
+				val = lookup_str(sval, usbmode);
+				break;
+			case MT_DELAY:
+				val /= 5;
+				break;
+			case MC_PAD:
+				val /= 8;
+				val = 2 - val;
+				break;
+			case MC_USBCLK:
+				val = lookup_str(sval, usbclk);
+				break;
+			case MC_SSP:
+				val = lookup_str(sval, ssp);
+				break;
+			case MC_FP:
+				val = lookup_num(val, fpdata);
+				break;
+			case MC_FREQ:
+				val = lookup_num(val, cfreq);
+				break;
+			case MC_REFRESH:
+				val = ffs(val) - 3;
+				break;
+			case MC_HOLD:
+				val = lookup_num(val, bushold);
+				break;
+			case MC_SH:
+				val = lookup_str(sval, sh_ready);
+				break;
+			case MC_II:
+				val = lookup_str(sval, int_invert);
+				break;
+			case MC_GAP:
+				if (!strcmp(sval, "default"))
+					val = 0;
+				else
+					val = ~0;
+				break;
+			case MC_DAC:
+				val = lookup_str(sval, endis) ^ 1;
+				break;
+			case MC_MC:
+				val = lookup_str(sval, slave);
+				break;
+			case MC_BL:
+				val = lookup_num(val, burst);
+				break;
+			case MC_USB:
+				val = lookup_str(sval, usbport);
+				break;
+			case MC_LB:
+				val = lookup_str(sval, usbloop);
+				break;
+			case MC_VR:
+				val = lookup_num(val, vrmem);
+				break;
+			}
+			mask = (1 << props->width) - 1;
+			if (mask >= val) {
+				mask = ~(mask << props->shift);
+				ret->mask &= mask;
+				ret->set |= val << props->shift;
+			} else {
+				switch (props->prop_type) {
+				case PROP_NUM:
+					dev_warn(dev, "%s invalid value %d",
+						 props->name, val);
+
+					break;
+				case PROP_STR:
+					dev_warn(dev, "%s invalid value %s",
+						 props->name, sval);
+					break;
+				}
+			}
+		}
+		props++;
+	}
+}
+
+/* Read GPIO control */
+/*
+ * DT example.
+ * gpio-pin-control {
+ *   pin@0 {
+ *	 gpio-port;
+ *   };
+ *   pin@1 {
+ *	 function;
+ *   };
+ * };
+ */
+static void sm501_of_read_gpio(struct device *dev, struct device_node *np,
+			       struct sm501_reg_init *hi, struct sm501_reg_init *low)
+{
+	struct device_node *gpio_group, *pin;
+	const char *prop_mode;
+	unsigned int pin_no;
+	int mode;
+	u64 mask;
+	u64 set;
+
+	mask = ~0;
+	set = 0;
+	gpio_group = of_get_child_by_name(np, "gpio-pin-control");
+	if (gpio_group) {
+		for_each_child_of_node(gpio_group, pin) {
+			mode = -1;
+			if (sscanf(pin->full_name, "pin@%u", &pin_no) == 1) {
+				if (of_property_read_bool(pin, "gpio-port"))
+					mode = 0;
+				else if (of_property_read_bool(pin, "function"))
+					mode = 1;
+			}
+			/* GPIO0 - 47 and 55 -63 */
+			if (mode < 0 ||
+			    (pin_no >= 64 || (pin_no >= 48 && pin_no <= 54))) {
+				dev_warn(dev,
+					 "%s mode %s is invalid.", pin->name, prop_mode);
+			} else {
+				mask &= ~(1 << pin_no);
+				set |= mode << pin_no;
+			}
+		}
+	}
+	hi->set = set >> 32;
+	low->set = set & 0xffffffff;
+	hi->mask = mask >> 32;
+	low->mask = mask & 0xffffffff;
+}
+
+static inline int read_i2c_prop(struct device *dev, struct device_node *child,
+				const char *name, u32 *val)
+{
+	if (of_property_read_u32(child, name, val)) {
+		dev_warn(dev, "%s/%s not found. skip it.", of_node_full_name(child), name);
+		return -ENOENT;
+	}
+	return 0;
+}
+
+/* Read GPIO I2C configuration */
+/*
+ * DT example.
+ * gpio-i2c {
+ *    i2c@0 {
+ *	sda = <gpio-pin>;
+ *	scl = <gpio-pin>;
+ *	delay = <delay>;
+ *	timeout = <timeout>;
+ *    };
+ *    i2c@1 {
+ *      :
+ *    };
+ *    :
+ * };
+ */
+static int sm501_parse_dt_gpio_i2c(struct device *dev, struct sm501_platdata *plat,
+				   struct device_node *np)
+{
+	struct device_node *i2c_group, *child;
+	unsigned int i;
+	u32 i2c_nr;
+	int err;
+
+	i2c_group = of_get_child_by_name(np, "gpio-i2c");
+	if (!i2c_group)
+		return 0;
+
+	i2c_nr = of_get_child_count(i2c_group);
+	plat->gpio_i2c = devm_kzalloc(dev, sizeof(*plat->gpio_i2c) * i2c_nr,
+				      GFP_KERNEL);
+	if (!plat->gpio_i2c)
+		return -ENOMEM;
+
+	plat->gpio_i2c_nr = i2c_nr;
+	i = 0;
+	for_each_child_of_node(i2c_group, child) {
+		u32 bus;
+
+		if (sscanf(child->full_name, "i2c@%u", &bus) != 1) {
+			dev_warn(dev, "Unknown address %s\n", child->name);
+			continue;
+		}
+
+		err = 0;
+		plat->gpio_i2c[i].bus_num = bus;
+		err += read_i2c_prop(dev, child, "sda", &plat->gpio_i2c[i].pin_sda);
+		err += read_i2c_prop(dev, child, "scl", &plat->gpio_i2c[i].pin_scl);
+		err += read_i2c_prop(dev, child, "delay", &plat->gpio_i2c[i].udelay);
+		err += read_i2c_prop(dev, child, "timeout", &plat->gpio_i2c[i].timeout);
+		if (err == 0)
+			i++;
+	}
+
+	return 0;
+}
+
+/* Read device functions */
+static u32 sm501_read_devices(struct device *dev, struct device_node *np)
+{
+	static const char * const funcname[] = {
+		"usb-host", "usb-slave", "ssp0", "ssp1",
+		"uart0", "uart1", "fbaccel", "ac97",
+		"i2s", "gpio",
+	};
+	struct property *prop;
+	unsigned int i;
+	const char *s;
+	u32 ret = 0;
+
+	of_property_for_each_string(np, "smi,devices", prop, s) {
+		for (i = 0; i < ARRAY_SIZE(funcname); i++) {
+			if (strcmp(s, funcname[i]) == 0) {
+				ret |= 1 << i;
+				goto next;
+			}
+		}
+		dev_warn(dev, "Unknown device function '%s'", s);
+next:
+	}
+	if (!ret)
+		dev_warn(dev, "devices not defined. disable all functions.");
+	return ret;
+}
+
+/* Build platform_data from OF property */
+struct plat_dt {
+	struct sm501_platdata plat;
+	struct sm501_initdata init;
+};
+
+static int sm501_parse_dt(struct sm501_devdata *sm, struct device_node *np)
+{
+	struct sm501_platdata *plat;
+	struct plat_dt *dt_p;
+	u32 word;
+	int ret;
+
+	dt_p = devm_kzalloc(sm->dev, sizeof(*dt_p), GFP_KERNEL);
+	if (!dt_p)
+		return -ENOMEM;
+
+	plat = &dt_p->plat;
+	plat->init = &dt_p->init;
+
+	plat->init->devices = sm501_read_devices(sm->dev, np);
+	/* mclk and m1xclk are not u32, so convert between them using intermediate variables. */
+	of_property_read_u32(np, "smi,mclk", &word);
+	plat->init->mclk = word;
+	of_property_read_u32(np, "smi,m1xclk", &word);
+	plat->init->m1xclk = word;
+
+	sm501_of_read_config(sm->dev, np, "misc-timing", misc_timming,
+			     &plat->init->misc_timing);
+	sm501_of_read_config(sm->dev, np, "misc-control", misc_control,
+			     &plat->init->misc_control);
+	sm501_of_read_gpio(sm->dev, np,
+			   &plat->init->gpio_high, &plat->init->gpio_low);
+
+	if (IS_ENABLED(CONFIG_MFD_SM501_GPIO) &&
+	    (plat->init->devices & SM501_USE_GPIO)) {
+		ret = sm501_parse_dt_gpio_i2c(sm->dev, plat, np);
+		if (ret)
+			return ret;
+	}
+	sm->platdata = plat;
+	return 0;
+}
+
 static int sm501_plat_probe(struct platform_device *dev)
 {
 	struct sm501_devdata *sm;
@@ -1406,6 +1836,12 @@ static int sm501_plat_probe(struct platform_device *dev)
 		goto err_res;
 	}
 
+	if (IS_ENABLED(CONFIG_OF) && dev->dev.of_node) {
+		ret = sm501_parse_dt(sm, dev->dev.of_node);
+		if (ret)
+			goto err_res;
+	}
+
 	platform_set_drvdata(dev, sm);
 
 	sm->regs = ioremap(sm->io_res->start, resource_size(sm->io_res));
diff --git a/drivers/video/fbdev/sm501fb.c b/drivers/video/fbdev/sm501fb.c
index d6fdc1737cd2..5de00f2570aa 100644
--- a/drivers/video/fbdev/sm501fb.c
+++ b/drivers/video/fbdev/sm501fb.c
@@ -1932,6 +1932,106 @@ static int sm501fb_start_one(struct sm501fb_info *info,
 	return 0;
 }
 
+#if defined(CONFIG_OF)
+static u32 read_display_flags(struct device_node *np)
+{
+	static const char * const name[] = {
+		"use-init-done", "disable-at-exit", "use-hwcursor", "use-hwaccel",
+		"panel-no-fpen", "panel-no-vbiasen", "panel-inv-fpen", "panel-inv-vbiasen",
+	};
+
+	struct property *prop;
+	unsigned int i;
+	const char *s;
+	u32 ret = 0;
+
+	of_property_for_each_string(np, "smi,flags", prop, s) {
+		for (i = 0; i < ARRAY_SIZE(name); i++) {
+			if (strcmp(s, name[i]) == 0) {
+				ret |= 1 << i;
+				break;
+			}
+		}
+	}
+	return ret;
+}
+
+/* parse CRT / panel configuration */
+static struct sm501_platdata_fbsub *dt_fbsub(struct device *dev,
+					     struct device_node *np,
+					     const char *name)
+{
+	struct sm501_platdata_fbsub *fbsub = NULL;
+	struct fb_videomode *def_mode = NULL;
+	struct device_node *child;
+	const void *p_edid;
+	u32 flags = 0;
+	u32 bpp = 0;
+	int len;
+
+	child = of_get_child_by_name(np, name);
+	if (child == NULL)
+		return NULL;
+
+	p_edid = of_get_property(child, "edid", &len);
+	if (p_edid && len == EDID_LENGTH) {
+		struct fb_monspecs *specs;
+		u8 *edid;
+
+		edid = kmemdup(p_edid, EDID_LENGTH, GFP_KERNEL);
+		if (edid) {
+			specs = kzalloc(sizeof(*specs), GFP_KERNEL);
+			if (specs) {
+				fb_edid_to_monspecs(edid, specs);
+				def_mode = specs->modedb;
+			}
+		}
+		kfree(edid);
+	}
+
+	of_property_read_u32(child, "bpp", &bpp);
+
+	/* If flags property is obtained, fbsub is returned. */
+	flags = read_display_flags(child);
+	if (flags) {
+		fbsub = devm_kzalloc(dev, sizeof(*fbsub), GFP_KERNEL);
+		if (fbsub) {
+			fbsub->def_mode = def_mode;
+			fbsub->def_bpp = bpp;
+			fbsub->flags = flags;
+		}
+	}
+	return fbsub;
+}
+
+/* Build platform_data from OF property */
+static struct sm501_platdata_fb *pdata_from_dt(struct device *dev, struct device_node *np)
+{
+	enum sm501_fb_routing fb_route = SM501_FB_OWN;
+	struct sm501_platdata_fb *pdata = NULL;
+	struct sm501_platdata_fbsub *fb_crt;
+	struct sm501_platdata_fbsub *fb_pnl;
+	unsigned int flags = 0;
+
+	if (of_property_read_bool(np, "route-crt-panel"))
+		fb_route = SM501_FB_CRT_PANEL;
+	if (of_property_read_bool(np, "swap-fb-endian"))
+		flags = SM501_FBPD_SWAP_FB_ENDIAN;
+	fb_crt = dt_fbsub(dev, np, "crt");
+	fb_pnl = dt_fbsub(dev, np, "panel");
+	if (fb_crt || fb_pnl) {
+		pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
+		if (pdata) {
+			pdata->fb_route = fb_route;
+			pdata->flags = flags;
+			pdata->fb_crt = fb_crt;
+			pdata->fb_pnl = fb_pnl;
+		}
+	}
+	return pdata;
+}
+#endif
+
 static int sm501fb_probe(struct platform_device *pdev)
 {
 	struct sm501fb_info *info;
@@ -1974,6 +2074,12 @@ static int sm501fb_probe(struct platform_device *pdev)
 				if (info->edid_data)
 					found = 1;
 			}
+			/* Get platform data compatible configuration */
+			if (!found) {
+				info->pdata = pdata_from_dt(dev, np);
+				if (info->pdata)
+					found = 1;
+			}
 		}
 #endif
 		if (!found) {
-- 
2.39.2

