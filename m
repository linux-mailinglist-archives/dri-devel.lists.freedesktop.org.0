Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C933978363
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 17:08:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0CE010ED22;
	Fri, 13 Sep 2024 15:08:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PYWeDDoe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A69C10ED22
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 15:08:20 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-5c275491c61so2806243a12.0
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 08:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726240099; x=1726844899; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=6fvI1jOCtF6Xl9dCaG3UZuMyIWSGrg53RlYI10axNPM=;
 b=PYWeDDoecnOCtVJXyi0awZMbu45VqrtQzwyqmp87aJoWUYawHHWDhWxEizy3a63Chr
 ZBSO/d21yVlQ+t3ioMb82qmDpGHWCffbOu14vPJe0aiPHJ+v61AYdaRTjJO3Q78xhwwS
 A/0OZSeiQ4w6o/dk1VP3VgcwzHeyXHiH5qPN8CjYgAuWJugRzL6DEhqTf2EDXCjzIxOV
 HOHxFEUwxNibBvsrjfyiv6dy5ZxsuF5Q1jwhE/1QMZnknoEqSHsJX1UUuuVZ0C68Qxux
 3ar7RmxwpHtRJKNd4CGv/E8yY0zTARCTXHW/qJJ9HQDhoGwlBLSKkDlSsYv9em9p11p8
 iIgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726240099; x=1726844899;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6fvI1jOCtF6Xl9dCaG3UZuMyIWSGrg53RlYI10axNPM=;
 b=TrED/C4vT0O6Wd7eOz3tOBS5CjQrJoI3pKtnmvv7PXGbQlWBaj6PlAmkF6C6Otf6F6
 ZiSJAJthB+DEjNLwjvXrvbPkgg+QQGMhAOQN5EIcTBIx2iGS1JkaeYucX/6lz2PFUVRO
 L7Cs3JOBHLpPxPMKpKVj5r5S7st6l73XfsVIcSb7gpKiZnRXGocllfQ1urlWQvDsc4IZ
 oiFb5KjoOF7RWFQG17bdLGCA9LDtRfWahmJ6wyHANnudXZjFnjHEJgWE+tTY3GiwWrf+
 8NAWC6iu5N4Fv5wOwEKrJzZFgNPnC7jbPL4a5k2mV5yTIZ+EHLmTsP03gbtCXvSISpUd
 Zxtg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQI7nPn6mrp6ieOYlv+U7x8aA3mjTLD8vgCkBmQY3U+MuE66Dd4NeSoMvREq3R/7sOT0c+wVPicCc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzREeOjK4PF472fJPHl81RH+WEHf0vkWwxS3Qq640+UbA6dhT2X
 2mgGEH4Qiuz0d517sVJsN0NKC8jCxhIjTTLZ9ZuJxq+EYcovSRc8
X-Google-Smtp-Source: AGHT+IHrrXfIYz4HjX/UrLHfxg4n9InFM0pbyDYkbCAqUrOw5kODsOxMeGLYWr5NO3WVEeKXCONZfQ==
X-Received: by 2002:a05:6402:5204:b0:5c3:9fa9:1b72 with SMTP id
 4fb4d7f45d1cf-5c413e09477mr5257979a12.6.1726240098267; 
 Fri, 13 Sep 2024 08:08:18 -0700 (PDT)
Received: from [127.0.1.1] ([178.127.153.210])
 by smtp.googlemail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3ebd523b4sm7774318a12.51.2024.09.13.08.08.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Sep 2024 08:08:17 -0700 (PDT)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Fri, 13 Sep 2024 18:07:46 +0300
Subject: [PATCH v4 03/27] gcc-sdm845: Add general purpose clock ops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240913-starqltechn_integration_upstream-v4-3-2d2efd5c5877@gmail.com>
References: <20240913-starqltechn_integration_upstream-v4-0-2d2efd5c5877@gmail.com>
In-Reply-To: <20240913-starqltechn_integration_upstream-v4-0-2d2efd5c5877@gmail.com>
To: Sebastian Reichel <sre@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Pavel Machek <pavel@ucw.cz>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, 
 Simona Vetter <simona@ffwll.ch>, cros-qcom-dts-watchers@chromium.org, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Simona Vetter <simona.vetter@ffwll.ch>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-leds@vger.kernel.org, 
 linux-pwm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 Dzmitry Sankouski <dsankouski@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726240085; l=11498;
 i=dsankouski@gmail.com; s=20240618; h=from:subject:message-id;
 bh=yHgVDv+qlZ6l11Z1oOme3t1OLz7PLjLr8ANIj+xIB5s=;
 b=DCvJ81YAf9O46UqRzheehrcTwNur3mOg0JIghb5LqGFYmHsEb4j4smZqH6livH/0THjxK3IkM
 LzaB5BKjaTiB7s8PEeVxckl43hm2+c1y+iuN/Wvrs71ek3UBLlb5Imf
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=6pMMVVDDReSiRgPCbMOUauN5nS3ty4Sf5b7a2gi4x0M=
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

SDM845 has "General Purpose" clocks that can be muxed to
SoC pins to clock various external devices.
Those clocks may be used as e.g. PWM sources for external peripherals.

GPCLK can in theory have arbitrary value depending on the use case, so
the concept of frequency tables, used in rcg2 clock driver, is not
efficient, because it allows only defined frequencies.

Introduce clk_rcg2_gp_ops, which automatically calculate clock
mnd values for arbitrary clock rate. The calculation done as follows:
- upon determine rate request, we calculate m/n/pre_div as follows:
  - find parent(from our client's assigned-clock-parent) rate
  - find scaled rates by dividing rates on its greatest common divisor
  - assign requested scaled rate to m
  - factorize scaled parent rate, put multipliers to n till max value
    (determined by mnd_width)
- validate calculated values with *_width:
  - if doesn't fit, delete divisor and multiplier by 2 until fit
- return determined rate

Limitations:
- The driver doesn't select a parent clock (it may be selected by client
  in device tree with assigned-clocks, assigned-clock-parents properties)

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
 drivers/clk/qcom/clk-rcg.h    |   1 +
 drivers/clk/qcom/clk-rcg2.c   | 192 ++++++++++++++++++++++++++++++++++++++++--
 drivers/clk/qcom/gcc-sdm845.c |  21 ++---
 3 files changed, 193 insertions(+), 21 deletions(-)

diff --git a/drivers/clk/qcom/clk-rcg.h b/drivers/clk/qcom/clk-rcg.h
index 8e0f3372dc7a..8817d14bbda4 100644
--- a/drivers/clk/qcom/clk-rcg.h
+++ b/drivers/clk/qcom/clk-rcg.h
@@ -189,6 +189,7 @@ struct clk_rcg2_gfx3d {
 	container_of(to_clk_rcg2(_hw), struct clk_rcg2_gfx3d, rcg)
 
 extern const struct clk_ops clk_rcg2_ops;
+extern const struct clk_ops clk_rcg2_gp_ops;
 extern const struct clk_ops clk_rcg2_floor_ops;
 extern const struct clk_ops clk_rcg2_fm_ops;
 extern const struct clk_ops clk_rcg2_mux_closest_ops;
diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
index df491540ef39..1397cbd39bdb 100644
--- a/drivers/clk/qcom/clk-rcg2.c
+++ b/drivers/clk/qcom/clk-rcg2.c
@@ -8,11 +8,13 @@
 #include <linux/err.h>
 #include <linux/bug.h>
 #include <linux/export.h>
+#include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/delay.h>
 #include <linux/rational.h>
 #include <linux/regmap.h>
 #include <linux/math64.h>
+#include <linux/gcd.h>
 #include <linux/minmax.h>
 #include <linux/slab.h>
 
@@ -32,6 +34,7 @@
 
 #define CFG_REG			0x4
 #define CFG_SRC_DIV_SHIFT	0
+#define CFG_SRC_DIV_LENGTH	8
 #define CFG_SRC_SEL_SHIFT	8
 #define CFG_SRC_SEL_MASK	(0x7 << CFG_SRC_SEL_SHIFT)
 #define CFG_MODE_SHIFT		12
@@ -148,6 +151,14 @@ static int clk_rcg2_set_parent(struct clk_hw *hw, u8 index)
 	return update_config(rcg);
 }
 
+// Converts divisors to corresponding clock register values.
+// @param f - Frequency table with pure m/n/pre_div parameters.
+static void convert_to_reg_val(struct freq_tbl *f)
+{
+	f->pre_div *= 2;
+	f->pre_div -= 1;
+}
+
 /*
  * Calculate m/n:d rate
  *
@@ -400,16 +411,116 @@ static int clk_rcg2_fm_determine_rate(struct clk_hw *hw,
 	return _freq_tbl_fm_determine_rate(hw, rcg->freq_multi_tbl, req);
 }
 
-static int __clk_rcg2_configure(struct clk_rcg2 *rcg, const struct freq_tbl *f,
-				u32 *_cfg)
+// Split multiplier that doesn't fit in n neither in pre_div.
+//
+// @param multiplier - multiplier to split between n and pre_div
+// @param pre_div_pure - pointer to pre divisor value
+// @param n - pointer to n divisor value
+// @param hid_max - pre divisor maximum value
+//
+static inline void clk_rcg2_split_div(int multiplier, unsigned int *pre_div_pure,
+				      u16 *n, unsigned int hid_max)
+{
+	*n = mult_frac(multiplier * *n, *pre_div_pure, hid_max);
+	*pre_div_pure = hid_max;
+}
+
+static void clk_rcg2_calc_mnd(u64 parent_rate, u64 rate, struct freq_tbl *f,
+			unsigned int mnd_max, unsigned int hid_max)
+{
+	int i = 2, count = 0;
+	unsigned int pre_div_pure = 1;
+	unsigned long rates_gcd, scaled_parent_rate;
+	u16 m, n = 1, n_candidate = 1, n_max;
+
+	rates_gcd = gcd(parent_rate, rate);
+	m = rate / rates_gcd;
+	scaled_parent_rate = parent_rate / rates_gcd;
+	while (scaled_parent_rate > (mnd_max + m) * hid_max) {
+		// we're exceeding divisor's range, trying lower scale.
+		if (m > 1) {
+			m--;
+			scaled_parent_rate = mult_frac(scaled_parent_rate, m, (m + 1));
+		} else {
+			f->n = mnd_max + m;
+			f->pre_div = hid_max;
+			f->m = m;
+		}
+	}
+
+	n_max = m + mnd_max;
+
+	while (scaled_parent_rate > 1) {
+		while (scaled_parent_rate % i == 0) {
+			n_candidate *= i;
+			if (n_candidate < n_max)
+				n = n_candidate;
+			else if (pre_div_pure * i < hid_max)
+				pre_div_pure *= i;
+			else
+				clk_rcg2_split_div(i, &pre_div_pure, &n, hid_max);
+
+			scaled_parent_rate /= i;
+		}
+		i++;
+		count++;
+	}
+
+	f->m = m;
+	f->n = n;
+	f->pre_div = pre_div_pure > 1 ? pre_div_pure : 0;
+}
+
+static int clk_rcg2_determine_gp_rate(struct clk_hw *hw,
+				   struct clk_rate_request *req)
+{
+	struct clk_rcg2 *rcg = to_clk_rcg2(hw);
+	struct freq_tbl *f;
+	int mnd_max = BIT(rcg->mnd_width) - 1;
+	int hid_max = BIT(rcg->hid_width) - 1;
+	struct clk_hw *parent;
+	u64 parent_rate;
+
+	parent = clk_hw_get_parent(hw);
+	parent_rate = clk_get_rate(parent->clk);
+	if (!parent_rate)
+		return -EINVAL;
+
+	f = kzalloc(sizeof(*f), GFP_KERNEL);
+
+	if (!f)
+		return -ENOMEM;
+
+	clk_rcg2_calc_mnd(parent_rate, req->rate, f, mnd_max, hid_max / 2);
+	convert_to_reg_val(f);
+	req->rate = calc_rate(parent_rate, f->m, f->n, f->n, f->pre_div);
+
+	kfree(f);
+
+	return 0;
+}
+
+static int __clk_rcg2_configure_parent(struct clk_rcg2 *rcg, u8 src, u32 *_cfg)
 {
-	u32 cfg, mask, d_val, not2d_val, n_minus_m;
 	struct clk_hw *hw = &rcg->clkr.hw;
-	int ret, index = qcom_find_src_index(hw, rcg->parent_map, f->src);
+	u32 mask = CFG_SRC_SEL_MASK;
+	int index = qcom_find_src_index(hw, rcg->parent_map, src);
 
 	if (index < 0)
 		return index;
 
+	*_cfg &= ~mask;
+	*_cfg |= rcg->parent_map[index].cfg << CFG_SRC_SEL_SHIFT;
+
+	return 0;
+}
+
+static int __clk_rcg2_configure_mnd(struct clk_rcg2 *rcg, const struct freq_tbl *f,
+				u32 *_cfg)
+{
+	u32 cfg, mask, d_val, not2d_val, n_minus_m;
+	int ret;
+
 	if (rcg->mnd_width && f->n) {
 		mask = BIT(rcg->mnd_width) - 1;
 		ret = regmap_update_bits(rcg->clkr.regmap,
@@ -438,9 +549,8 @@ static int __clk_rcg2_configure(struct clk_rcg2 *rcg, const struct freq_tbl *f,
 	}
 
 	mask = BIT(rcg->hid_width) - 1;
-	mask |= CFG_SRC_SEL_MASK | CFG_MODE_MASK | CFG_HW_CLK_CTRL_MASK;
+	mask |= CFG_MODE_MASK | CFG_HW_CLK_CTRL_MASK;
 	cfg = f->pre_div << CFG_SRC_DIV_SHIFT;
-	cfg |= rcg->parent_map[index].cfg << CFG_SRC_SEL_SHIFT;
 	if (rcg->mnd_width && f->n && (f->m != f->n))
 		cfg |= CFG_MODE_DUAL_EDGE;
 	if (rcg->hw_clk_ctrl)
@@ -452,6 +562,22 @@ static int __clk_rcg2_configure(struct clk_rcg2 *rcg, const struct freq_tbl *f,
 	return 0;
 }
 
+static int __clk_rcg2_configure(struct clk_rcg2 *rcg, const struct freq_tbl *f,
+				u32 *_cfg)
+{
+	int ret;
+
+	ret = __clk_rcg2_configure_parent(rcg, f->src, _cfg);
+	if (ret)
+		return ret;
+
+	ret = __clk_rcg2_configure_mnd(rcg, f, _cfg);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
 static int clk_rcg2_configure(struct clk_rcg2 *rcg, const struct freq_tbl *f)
 {
 	u32 cfg;
@@ -472,6 +598,26 @@ static int clk_rcg2_configure(struct clk_rcg2 *rcg, const struct freq_tbl *f)
 	return update_config(rcg);
 }
 
+static int clk_rcg2_configure_gp(struct clk_rcg2 *rcg, const struct freq_tbl *f)
+{
+	u32 cfg;
+	int ret;
+
+	ret = regmap_read(rcg->clkr.regmap, RCG_CFG_OFFSET(rcg), &cfg);
+	if (ret)
+		return ret;
+
+	ret = __clk_rcg2_configure_mnd(rcg, f, &cfg);
+	if (ret)
+		return ret;
+
+	ret = regmap_write(rcg->clkr.regmap, RCG_CFG_OFFSET(rcg), cfg);
+	if (ret)
+		return ret;
+
+	return update_config(rcg);
+}
+
 static int __clk_rcg2_set_rate(struct clk_hw *hw, unsigned long rate,
 			       enum freq_policy policy)
 {
@@ -525,6 +671,28 @@ static int clk_rcg2_set_rate(struct clk_hw *hw, unsigned long rate,
 	return __clk_rcg2_set_rate(hw, rate, CEIL);
 }
 
+static int clk_rcg2_set_gp_rate(struct clk_hw *hw, unsigned long rate,
+			    unsigned long parent_rate)
+{
+	struct clk_rcg2 *rcg = to_clk_rcg2(hw);
+	int mnd_max = BIT(rcg->mnd_width) - 1;
+	int hid_max = BIT(rcg->hid_width) - 1;
+	struct freq_tbl *f;
+	int ret;
+
+	f = kzalloc(sizeof(*f), GFP_KERNEL);
+
+	if (!f)
+		return -ENOMEM;
+
+	clk_rcg2_calc_mnd(parent_rate, rate, f, mnd_max, hid_max / 2);
+	convert_to_reg_val(f);
+	ret = clk_rcg2_configure_gp(rcg, f);
+	kfree(f);
+
+	return ret;
+}
+
 static int clk_rcg2_set_floor_rate(struct clk_hw *hw, unsigned long rate,
 				   unsigned long parent_rate)
 {
@@ -652,6 +820,18 @@ const struct clk_ops clk_rcg2_ops = {
 };
 EXPORT_SYMBOL_GPL(clk_rcg2_ops);
 
+const struct clk_ops clk_rcg2_gp_ops = {
+	.is_enabled = clk_rcg2_is_enabled,
+	.get_parent = clk_rcg2_get_parent,
+	.set_parent = clk_rcg2_set_parent,
+	.recalc_rate = clk_rcg2_recalc_rate,
+	.determine_rate = clk_rcg2_determine_gp_rate,
+	.set_rate = clk_rcg2_set_gp_rate,
+	.get_duty_cycle = clk_rcg2_get_duty_cycle,
+	.set_duty_cycle = clk_rcg2_set_duty_cycle,
+};
+EXPORT_SYMBOL_GPL(clk_rcg2_gp_ops);
+
 const struct clk_ops clk_rcg2_floor_ops = {
 	.is_enabled = clk_rcg2_is_enabled,
 	.get_parent = clk_rcg2_get_parent,
diff --git a/drivers/clk/qcom/gcc-sdm845.c b/drivers/clk/qcom/gcc-sdm845.c
index dc3aa7014c3e..82da8138b766 100644
--- a/drivers/clk/qcom/gcc-sdm845.c
+++ b/drivers/clk/qcom/gcc-sdm845.c
@@ -283,26 +283,17 @@ static struct clk_rcg2 gcc_sdm670_cpuss_rbcpr_clk_src = {
 	},
 };
 
-static const struct freq_tbl ftbl_gcc_gp1_clk_src[] = {
-	F(19200000, P_BI_TCXO, 1, 0, 0),
-	F(25000000, P_GPLL0_OUT_EVEN, 12, 0, 0),
-	F(50000000, P_GPLL0_OUT_EVEN, 6, 0, 0),
-	F(100000000, P_GPLL0_OUT_MAIN, 6, 0, 0),
-	F(200000000, P_GPLL0_OUT_MAIN, 3, 0, 0),
-	{ }
-};
-
 static struct clk_rcg2 gcc_gp1_clk_src = {
 	.cmd_rcgr = 0x64004,
 	.mnd_width = 8,
 	.hid_width = 5,
 	.parent_map = gcc_parent_map_1,
-	.freq_tbl = ftbl_gcc_gp1_clk_src,
+	.freq_tbl = {},
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_gp1_clk_src",
 		.parent_data = gcc_parent_data_1,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_1),
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_gp_ops,
 	},
 };
 
@@ -311,12 +302,12 @@ static struct clk_rcg2 gcc_gp2_clk_src = {
 	.mnd_width = 8,
 	.hid_width = 5,
 	.parent_map = gcc_parent_map_1,
-	.freq_tbl = ftbl_gcc_gp1_clk_src,
+	.freq_tbl = {},
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_gp2_clk_src",
 		.parent_data = gcc_parent_data_1,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_1),
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_gp_ops,
 	},
 };
 
@@ -325,12 +316,12 @@ static struct clk_rcg2 gcc_gp3_clk_src = {
 	.mnd_width = 8,
 	.hid_width = 5,
 	.parent_map = gcc_parent_map_1,
-	.freq_tbl = ftbl_gcc_gp1_clk_src,
+	.freq_tbl = {},
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_gp3_clk_src",
 		.parent_data = gcc_parent_data_1,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_1),
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_gp_ops,
 	},
 };
 

-- 
2.39.2

