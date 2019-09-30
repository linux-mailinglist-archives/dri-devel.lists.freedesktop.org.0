Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11175C1BAD
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2019 08:45:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC09289AC2;
	Mon, 30 Sep 2019 06:45:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C65D89AC2
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2019 06:45:22 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8U6jBTQ020413;
 Mon, 30 Sep 2019 01:45:11 -0500
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8U6jBTV113153;
 Mon, 30 Sep 2019 01:45:11 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 30
 Sep 2019 01:45:01 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 30 Sep 2019 01:45:01 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8U6j7BA053440;
 Mon, 30 Sep 2019 01:45:07 -0500
Subject: Re: [PATCH] drm/omap: Migrate minimum FCK/PCK ratio from Kconfig to
 dts
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: Tero Kristo <t-kristo@ti.com>, Adam Ford <aford173@gmail.com>
References: <20190510194229.20628-1-aford173@gmail.com>
 <af325707-3e42-493d-e858-77878ef06138@ti.com>
 <CAHCN7xLzoCNW6q5yDCsqMHeNvdNegkGhd0N+q9+Gd8JUGbG=_g@mail.gmail.com>
 <7ada0752-6f65-2906-cb29-a47c9490fd57@ti.com>
 <CAHCN7xJexJvh71vyb31ETgo=n_y_CupHH-AZwVK9mZe3GzJfEQ@mail.gmail.com>
 <845055e2-8182-de74-2077-629fdf50ac6c@ti.com>
 <CAHCN7xJFrTLOnbqrnH2W_T2whR8Xji0EMNR_cy8GYkDV-JDodQ@mail.gmail.com>
 <854f6130-c8a8-81cb-aa76-4830f218ae54@ti.com>
 <CAHCN7xKocdiWOdmoWQV3POr84qte6WNt0QbQRAwxKSvU8COB_w@mail.gmail.com>
 <0473526e-df0a-94a5-5c22-debd0084ab16@ti.com>
 <36369388-e9c8-22cd-8c19-e2bdf2d0389b@ti.com>
 <eb2eb1f6-3c9b-7ecb-667e-819033af9c14@ti.com>
Message-ID: <23eba53a-9304-2ceb-d97e-01891ec0b3ed@ti.com>
Date: Mon, 30 Sep 2019 09:45:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <eb2eb1f6-3c9b-7ecb-667e-819033af9c14@ti.com>
Content-Type: multipart/mixed; boundary="------------E535A013B30481111D3FF646"
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1569825911;
 bh=dlyAxSo9w4zvYiYi2wXuDXDEgZj5TQvjr0lxVu6lwdg=;
 h=Subject:From:To:CC:References:Date:In-Reply-To;
 b=npOy7yrvM6dTpEjvI06MFY3Rbb+7HKLJ6RhybeaH/GqTht740C6nV2TJEEV5DOAlw
 gpYF2iuebTaArDcdSTDxzLxnZr4NIXuMRO30Te5Jqt7oqIqhqe02JDVggNpim21Ypz
 e9h4t/atraoMFAspVb2IDaa2KO73qhfDt+Kk/9Mk=
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
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre.com>,
 Linux-OMAP <linux-omap@vger.kernel.org>, Adam Ford <adam.ford@logicpd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--------------E535A013B30481111D3FF646
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 27/09/2019 18:47, Tomi Valkeinen wrote:
> On 27/09/2019 18:37, Tero Kristo wrote:
> 
>> If you can provide details about what clock framework / driver does 
>> wrong (sample clk_set_xyz call sequence, expected results via 
>> clk_get_xyz, and what fails), I can take a look at it. Just reporting 
>> arbitrary display driver issues I won't be able to debug at all (I 
>> don't have access to any of the displays, nor do I want to waste time 
>> debugging them without absolutely no knowledge whatsoever.)
> 
> I used your hack patches to allow changing rates via debugfs. And set 
> dss1_alwon_fck_3430es2 to 27000000 or 27870967. The end result was that 
> DSS gets some very high clock from dss1_alwon_fck_3430es2, as the frame 
> rate jumps to many hundreds fps.
> 
> So, these numbers are not real, but to give the idea what I saw. Running 
> first with 50 MHz, I can see, say, 40 fps. Then I set the clock to 30 
> MHz, and fps dropped to, say, 30fps, as expected with lower clock. Then 
> I set the clock to 27MHz (or the other one), expecting a bit lower fps, 
> but instead I saw hundreds of fps.
> 
> I don't know if there's any other way to observe the wrong clock rate 
> but have the dss enabled and running kmstest or similar. I can help you 
> set that up next week, should be trivial. You don't need a display for 
> that.

Here's how to reproduce. I have the attached patches. Three of them are 
the clk-debug ones, and one of mine to make it easy to test without a 
display, and without underflow flood halting the device. There are on 
top of v5.3. Kernel config also attached.

kmstest is from kms++ project (https://github.com/tomba/kmsxx). It 
should be straightforward to compile, but kmstest binary is also 
included in TI's rootfs.

I boot up, and run this in one terminal:

# kmstest -c dvi -r 640x480 --flip

It shows ~60 fps, as expected:

Connector 0: fps 60.499982, slowest 16.72 ms

In another terminal:

# cd /debug/clk/dss1_alwon_fck_3430es2/
# cat clk_rate
50823530
# echo 30000000 > clk_rate

Now with lower clock, the fps dropped as expected:

Connector 0: fps 35.468961, slowest 28.41 ms

Then:

# echo 27000000 > clk_rate

And fps goes through the roof and underflows start to come:

Connector 0: fps 514.734527, slowest 2.11 ms

I don't know what exactly goes on here, but 514 fps matches quite 
exactly the PLL/2 rate:

864000000/2/2/((640+16+96+48)*(480+10+2+33)) = 514.2857142857143

(The second /2 there is DSS's internal pclk divider)

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

--------------E535A013B30481111D3FF646
Content-Type: text/x-patch;
	name="0001-clk-debug-add-support-for-setting-clk_rate-from-debu.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename*0="0001-clk-debug-add-support-for-setting-clk_rate-from-debu.pa";
	filename*1="tch"

From 4289f2a98b2fc5a0fd98f9809281442aac5e07a9 Mon Sep 17 00:00:00 2001
From: Tero Kristo <t-kristo@ti.com>
Date: Wed, 20 Jun 2018 14:48:26 +0300
Subject: [PATCH 1/4] clk: debug: add support for setting clk_rate from debugfs

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 drivers/clk/clk.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 1c46babeb093..3429680691bd 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -3087,6 +3087,26 @@ static int clk_duty_cycle_show(struct seq_file *s, void *data)
 }
 DEFINE_SHOW_ATTRIBUTE(clk_duty_cycle);
 
+static int clk_dbg_rate_get(void *data, u64 *val)
+{
+	struct clk_core *core = data;
+
+	*val = core->rate;
+
+	return 0;
+}
+
+static int clk_dbg_rate_set(void *data, u64 val)
+{
+	struct clk_core *core = data;
+
+	clk_core_set_rate_nolock(core, val);
+
+	return 0;
+}
+
+DEFINE_SIMPLE_ATTRIBUTE(clk_dbg_option_rate, clk_dbg_rate_get, clk_dbg_rate_set, "%llu\n");
+
 static void clk_debug_create_one(struct clk_core *core, struct dentry *pdentry)
 {
 	struct dentry *root;
@@ -3097,7 +3117,7 @@ static void clk_debug_create_one(struct clk_core *core, struct dentry *pdentry)
 	root = debugfs_create_dir(core->name, pdentry);
 	core->dentry = root;
 
-	debugfs_create_ulong("clk_rate", 0444, root, &core->rate);
+	debugfs_create_file("clk_rate", 0666, root, core, &clk_dbg_option_rate);
 	debugfs_create_ulong("clk_accuracy", 0444, root, &core->accuracy);
 	debugfs_create_u32("clk_phase", 0444, root, &core->phase);
 	debugfs_create_file("clk_flags", 0444, root, core, &clk_flags_fops);
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki


--------------E535A013B30481111D3FF646
Content-Type: text/x-patch;
	name="0002-sci-clk-debug-add-reparenting-support-via-debugfs.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="0002-sci-clk-debug-add-reparenting-support-via-debugfs.patch"

From 97c030ef053c7f7aa09cfed3e273f6b5600c471b Mon Sep 17 00:00:00 2001
From: Tero Kristo <t-kristo@ti.com>
Date: Fri, 21 Sep 2018 10:53:20 +0300
Subject: [PATCH 2/4] sci-clk: debug: add reparenting support via debugfs

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 drivers/clk/keystone/sci-clk.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/clk/keystone/sci-clk.c b/drivers/clk/keystone/sci-clk.c
index 7edf8c8432b6..7df582bb4ceb 100644
--- a/drivers/clk/keystone/sci-clk.c
+++ b/drivers/clk/keystone/sci-clk.c
@@ -24,6 +24,7 @@
 #include <linux/soc/ti/ti_sci_protocol.h>
 #include <linux/bsearch.h>
 #include <linux/list_sort.h>
+#include <linux/debugfs.h>
 
 #define SCI_CLK_SSC_ENABLE		BIT(0)
 #define SCI_CLK_ALLOW_FREQ_CHANGE	BIT(1)
@@ -254,6 +255,36 @@ static int sci_clk_set_parent(struct clk_hw *hw, u8 index)
 					      index + 1 + clk->clk_id);
 }
 
+static int dbg_pid_get(void *data, u64 *val)
+{
+	struct clk_hw *hw = data;
+
+	*val = sci_clk_get_parent(hw);
+
+	return 0;
+}
+
+static int dbg_pid_set(void *data, u64 val)
+{
+	struct clk_hw *hw = data;
+	struct clk_hw *parent = clk_hw_get_parent_by_index(hw, val);
+
+	if (!parent)
+		return -EINVAL;
+
+	clk_hw_reparent(hw, parent);
+
+	return sci_clk_set_parent(hw, val);
+}
+
+DEFINE_SIMPLE_ATTRIBUTE(sci_parent_id_fops, dbg_pid_get, dbg_pid_set, "%llu\n");
+
+static void sci_clk_debug_init(struct clk_hw *hw, struct dentry *dentry)
+{
+	debugfs_create_file("parent_id", S_IRUGO | S_IWUSR, dentry,
+			    hw, &sci_parent_id_fops);
+}
+
 static const struct clk_ops sci_clk_ops = {
 	.prepare = sci_clk_prepare,
 	.unprepare = sci_clk_unprepare,
@@ -263,6 +294,7 @@ static const struct clk_ops sci_clk_ops = {
 	.set_rate = sci_clk_set_rate,
 	.get_parent = sci_clk_get_parent,
 	.set_parent = sci_clk_set_parent,
+	.debug_init = sci_clk_debug_init,
 };
 
 /**
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki


--------------E535A013B30481111D3FF646
Content-Type: text/x-patch;
	name="0003-clk-debug-add-support-for-enabling-preparing-clocks-.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename*0="0003-clk-debug-add-support-for-enabling-preparing-clocks-.pa";
	filename*1="tch"

From 0560509bb2dc01fe2e8b173336ffb06830e49f20 Mon Sep 17 00:00:00 2001
From: Tero Kristo <t-kristo@ti.com>
Date: Mon, 1 Oct 2018 15:53:47 +0300
Subject: [PATCH 3/4] clk: debug: add support for enabling / preparing clocks
 manually

Add support for enabling / disabling clocks manually from debugfs.
Setting 1 to prepare/enable counts calls corresponding enable routine
once, incrementing the usecounts by 1. Setting the same files as -1
does the unprepare / disable call similarly. Reading both files
returns the current usecount, as is done without this patch.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 drivers/clk/clk.c | 54 +++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 52 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 3429680691bd..b40b3cae0c6b 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -3107,6 +3107,56 @@ static int clk_dbg_rate_set(void *data, u64 val)
 
 DEFINE_SIMPLE_ATTRIBUTE(clk_dbg_option_rate, clk_dbg_rate_get, clk_dbg_rate_set, "%llu\n");
 
+static int clk_dbg_prepare_get(void *data, u64 *val)
+{
+	struct clk_core *core = data;
+
+	*val = core->prepare_count;
+
+	return 0;
+}
+
+static int clk_dbg_prepare_set(void *data, u64 val)
+{
+	struct clk_core *core = data;
+
+	if (val == 1) {
+		return clk_core_prepare(core);
+	} else if (val == -1) {
+		clk_core_unprepare(core);
+		return 0;
+	} else {
+		pr_err("1: prepare, -1: unprepare\n");
+		return -EINVAL;
+	}
+}
+DEFINE_SIMPLE_ATTRIBUTE(clk_dbg_option_prepare, clk_dbg_prepare_get, clk_dbg_prepare_set, "%llu\n");
+
+static int clk_dbg_enable_get(void *data, u64 *val)
+{
+	struct clk_core *core = data;
+
+	*val = core->enable_count;
+
+	return 0;
+}
+
+static int clk_dbg_enable_set(void *data, u64 val)
+{
+	struct clk_core *core = data;
+
+	if (val == 1) {
+		return clk_core_enable(core);
+	} else if (val == -1) {
+		clk_core_disable(core);
+		return 0;
+	} else {
+		pr_err("1: enable, -1: disable\n");
+		return -EINVAL;
+	}
+}
+DEFINE_SIMPLE_ATTRIBUTE(clk_dbg_option_enable, clk_dbg_enable_get, clk_dbg_enable_set, "%llu\n");
+
 static void clk_debug_create_one(struct clk_core *core, struct dentry *pdentry)
 {
 	struct dentry *root;
@@ -3121,8 +3171,8 @@ static void clk_debug_create_one(struct clk_core *core, struct dentry *pdentry)
 	debugfs_create_ulong("clk_accuracy", 0444, root, &core->accuracy);
 	debugfs_create_u32("clk_phase", 0444, root, &core->phase);
 	debugfs_create_file("clk_flags", 0444, root, core, &clk_flags_fops);
-	debugfs_create_u32("clk_prepare_count", 0444, root, &core->prepare_count);
-	debugfs_create_u32("clk_enable_count", 0444, root, &core->enable_count);
+	debugfs_create_file("clk_prepare_count", 0666, root, core, &clk_dbg_option_prepare);
+	debugfs_create_file("clk_enable_count", 0666, root, core, &clk_dbg_option_enable);
 	debugfs_create_u32("clk_protect_count", 0444, root, &core->protect_count);
 	debugfs_create_u32("clk_notifier_count", 0444, root, &core->notifier_count);
 	debugfs_create_file("clk_duty_cycle", 0444, root, core,
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki


--------------E535A013B30481111D3FF646
Content-Type: text/x-patch;
	name="0004-dss1_alwon_fck_3430es2-test-hacks.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="0004-dss1_alwon_fck_3430es2-test-hacks.patch"

From 34c0611b55551dfbe2aea119f25ad8fd19c6d091 Mon Sep 17 00:00:00 2001
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Date: Mon, 30 Sep 2019 09:17:54 +0300
Subject: [PATCH 4/4] dss1_alwon_fck_3430es2 test hacks

---
 drivers/gpu/drm/bridge/ti-tfp410.c | 4 ++++
 drivers/gpu/drm/omapdrm/omap_irq.c | 4 ++--
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-tfp410.c b/drivers/gpu/drm/bridge/ti-tfp410.c
index dbf35c7bc85e..f048823e8bc9 100644
--- a/drivers/gpu/drm/bridge/ti-tfp410.c
+++ b/drivers/gpu/drm/bridge/ti-tfp410.c
@@ -55,6 +55,8 @@ static int tfp410_get_modes(struct drm_connector *connector)
 	struct edid *edid;
 	int ret;
 
+	goto fallback;
+
 	if (!dvi->ddc)
 		goto fallback;
 
@@ -91,6 +93,8 @@ tfp410_connector_detect(struct drm_connector *connector, bool force)
 {
 	struct tfp410 *dvi = drm_connector_to_tfp410(connector);
 
+	return connector_status_connected;
+
 	if (dvi->hpd) {
 		if (gpiod_get_value_cansleep(dvi->hpd))
 			return connector_status_connected;
diff --git a/drivers/gpu/drm/omapdrm/omap_irq.c b/drivers/gpu/drm/omapdrm/omap_irq.c
index 726a013e7988..eb388ec4e250 100644
--- a/drivers/gpu/drm/omapdrm/omap_irq.c
+++ b/drivers/gpu/drm/omapdrm/omap_irq.c
@@ -272,7 +272,7 @@ int omap_drm_irq_install(struct drm_device *dev)
 	INIT_LIST_HEAD(&priv->wait_list);
 
 	priv->irq_mask = DISPC_IRQ_OCP_ERR;
-
+/*
 	max_planes = min(ARRAY_SIZE(priv->planes),
 			 ARRAY_SIZE(omap_underflow_irqs));
 	for (i = 0; i < max_planes; ++i) {
@@ -282,7 +282,7 @@ int omap_drm_irq_install(struct drm_device *dev)
 
 	for (i = 0; i < num_mgrs; ++i)
 		priv->irq_mask |= priv->dispc_ops->mgr_get_sync_lost_irq(priv->dispc, i);
-
+*/
 	priv->dispc_ops->runtime_get(priv->dispc);
 	priv->dispc_ops->clear_irqstatus(priv->dispc, 0xffffffff);
 	priv->dispc_ops->runtime_put(priv->dispc);
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki


--------------E535A013B30481111D3FF646
Content-Type: text/plain; charset="UTF-8"; name="tomi-config"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="tomi-config"

IwojIEF1dG9tYXRpY2FsbHkgZ2VuZXJhdGVkIGZpbGU7IERPIE5PVCBFRElULgojIExpbnV4
L2FybSA1LjMuMCBLZXJuZWwgQ29uZmlndXJhdGlvbgojCgojCiMgQ29tcGlsZXI6IGFybS1s
aW51eC1nbnVlYWJpaGYtZ2NjIChHTlUgVG9vbGNoYWluIGZvciB0aGUgQS1wcm9maWxlIEFy
Y2hpdGVjdHVyZSA4LjItMjAxOS4wMSAoYXJtLXJlbC04LjI4KSkgOC4yLjEgMjAxODA4MDIK
IwpDT05GSUdfQ0NfSVNfR0NDPXkKQ09ORklHX0dDQ19WRVJTSU9OPTgwMjAxCkNPTkZJR19D
TEFOR19WRVJTSU9OPTAKQ09ORklHX0NDX0NBTl9MSU5LPXkKQ09ORklHX0NDX0hBU19BU01f
R09UTz15CkNPTkZJR19DQ19IQVNfV0FSTl9NQVlCRV9VTklOSVRJQUxJWkVEPXkKQ09ORklH
X0lSUV9XT1JLPXkKQ09ORklHX0JVSUxEVElNRV9FWFRBQkxFX1NPUlQ9eQoKIwojIEdlbmVy
YWwgc2V0dXAKIwpDT05GSUdfSU5JVF9FTlZfQVJHX0xJTUlUPTMyCiMgQ09ORklHX0NPTVBJ
TEVfVEVTVCBpcyBub3Qgc2V0CiMgQ09ORklHX0hFQURFUl9URVNUIGlzIG5vdCBzZXQKQ09O
RklHX0xPQ0FMVkVSU0lPTj0iIgpDT05GSUdfTE9DQUxWRVJTSU9OX0FVVE89eQpDT05GSUdf
QlVJTERfU0FMVD0iIgpDT05GSUdfSEFWRV9LRVJORUxfR1pJUD15CkNPTkZJR19IQVZFX0tF
Uk5FTF9MWk1BPXkKQ09ORklHX0hBVkVfS0VSTkVMX1haPXkKQ09ORklHX0hBVkVfS0VSTkVM
X0xaTz15CkNPTkZJR19IQVZFX0tFUk5FTF9MWjQ9eQojIENPTkZJR19LRVJORUxfR1pJUCBp
cyBub3Qgc2V0CkNPTkZJR19LRVJORUxfTFpNQT15CiMgQ09ORklHX0tFUk5FTF9YWiBpcyBu
b3Qgc2V0CiMgQ09ORklHX0tFUk5FTF9MWk8gaXMgbm90IHNldAojIENPTkZJR19LRVJORUxf
TFo0IGlzIG5vdCBzZXQKQ09ORklHX0RFRkFVTFRfSE9TVE5BTUU9Iihub25lKSIKQ09ORklH
X1NXQVA9eQpDT05GSUdfU1lTVklQQz15CkNPTkZJR19TWVNWSVBDX1NZU0NUTD15CkNPTkZJ
R19QT1NJWF9NUVVFVUU9eQpDT05GSUdfUE9TSVhfTVFVRVVFX1NZU0NUTD15CkNPTkZJR19D
Uk9TU19NRU1PUllfQVRUQUNIPXkKIyBDT05GSUdfVVNFTElCIGlzIG5vdCBzZXQKQ09ORklH
X0FVRElUPXkKQ09ORklHX0hBVkVfQVJDSF9BVURJVFNZU0NBTEw9eQpDT05GSUdfQVVESVRT
WVNDQUxMPXkKCiMKIyBJUlEgc3Vic3lzdGVtCiMKQ09ORklHX0dFTkVSSUNfSVJRX1BST0JF
PXkKQ09ORklHX0dFTkVSSUNfSVJRX1NIT1c9eQpDT05GSUdfR0VORVJJQ19JUlFfU0hPV19M
RVZFTD15CkNPTkZJR19HRU5FUklDX0lSUV9FRkZFQ1RJVkVfQUZGX01BU0s9eQpDT05GSUdf
R0VORVJJQ19JUlFfTUlHUkFUSU9OPXkKQ09ORklHX0hBUkRJUlFTX1NXX1JFU0VORD15CkNP
TkZJR19HRU5FUklDX0lSUV9DSElQPXkKQ09ORklHX0lSUV9ET01BSU49eQpDT05GSUdfSVJR
X0RPTUFJTl9ISUVSQVJDSFk9eQpDT05GSUdfR0VORVJJQ19NU0lfSVJRPXkKQ09ORklHX0dF
TkVSSUNfTVNJX0lSUV9ET01BSU49eQpDT05GSUdfSEFORExFX0RPTUFJTl9JUlE9eQpDT05G
SUdfSVJRX0ZPUkNFRF9USFJFQURJTkc9eQpDT05GSUdfU1BBUlNFX0lSUT15CiMgQ09ORklH
X0dFTkVSSUNfSVJRX0RFQlVHRlMgaXMgbm90IHNldAojIGVuZCBvZiBJUlEgc3Vic3lzdGVt
CgpDT05GSUdfR0VORVJJQ19JUlFfTVVMVElfSEFORExFUj15CkNPTkZJR19BUkNIX0NMT0NL
U09VUkNFX0RBVEE9eQpDT05GSUdfR0VORVJJQ19USU1FX1ZTWVNDQUxMPXkKQ09ORklHX0dF
TkVSSUNfQ0xPQ0tFVkVOVFM9eQpDT05GSUdfQVJDSF9IQVNfVElDS19CUk9BRENBU1Q9eQpD
T05GSUdfR0VORVJJQ19DTE9DS0VWRU5UU19CUk9BRENBU1Q9eQoKIwojIFRpbWVycyBzdWJz
eXN0ZW0KIwpDT05GSUdfVElDS19PTkVTSE9UPXkKQ09ORklHX05PX0haX0NPTU1PTj15CiMg
Q09ORklHX0haX1BFUklPRElDIGlzIG5vdCBzZXQKQ09ORklHX05PX0haX0lETEU9eQojIENP
TkZJR19OT19IWl9GVUxMIGlzIG5vdCBzZXQKQ09ORklHX05PX0haPXkKQ09ORklHX0hJR0hf
UkVTX1RJTUVSUz15CiMgZW5kIG9mIFRpbWVycyBzdWJzeXN0ZW0KCiMgQ09ORklHX1BSRUVN
UFRfTk9ORSBpcyBub3Qgc2V0CiMgQ09ORklHX1BSRUVNUFRfVk9MVU5UQVJZIGlzIG5vdCBz
ZXQKQ09ORklHX1BSRUVNUFQ9eQpDT05GSUdfUFJFRU1QVF9DT1VOVD15CkNPTkZJR19QUkVF
TVBUSU9OPXkKCiMKIyBDUFUvVGFzayB0aW1lIGFuZCBzdGF0cyBhY2NvdW50aW5nCiMKQ09O
RklHX1RJQ0tfQ1BVX0FDQ09VTlRJTkc9eQojIENPTkZJR19WSVJUX0NQVV9BQ0NPVU5USU5H
X0dFTiBpcyBub3Qgc2V0CiMgQ09ORklHX0lSUV9USU1FX0FDQ09VTlRJTkcgaXMgbm90IHNl
dApDT05GSUdfQlNEX1BST0NFU1NfQUNDVD15CiMgQ09ORklHX0JTRF9QUk9DRVNTX0FDQ1Rf
VjMgaXMgbm90IHNldAojIENPTkZJR19UQVNLU1RBVFMgaXMgbm90IHNldAojIENPTkZJR19Q
U0kgaXMgbm90IHNldAojIGVuZCBvZiBDUFUvVGFzayB0aW1lIGFuZCBzdGF0cyBhY2NvdW50
aW5nCgpDT05GSUdfQ1BVX0lTT0xBVElPTj15CgojCiMgUkNVIFN1YnN5c3RlbQojCkNPTkZJ
R19QUkVFTVBUX1JDVT15CiMgQ09ORklHX1JDVV9FWFBFUlQgaXMgbm90IHNldApDT05GSUdf
U1JDVT15CkNPTkZJR19UUkVFX1NSQ1U9eQpDT05GSUdfVEFTS1NfUkNVPXkKQ09ORklHX1JD
VV9TVEFMTF9DT01NT049eQpDT05GSUdfUkNVX05FRURfU0VHQ0JMSVNUPXkKIyBlbmQgb2Yg
UkNVIFN1YnN5c3RlbQoKQ09ORklHX0lLQ09ORklHPXkKQ09ORklHX0lLQ09ORklHX1BST0M9
eQojIENPTkZJR19JS0hFQURFUlMgaXMgbm90IHNldApDT05GSUdfTE9HX0JVRl9TSElGVD0x
NgpDT05GSUdfTE9HX0NQVV9NQVhfQlVGX1NISUZUPTEyCkNPTkZJR19QUklOVEtfU0FGRV9M
T0dfQlVGX1NISUZUPTEzCkNPTkZJR19HRU5FUklDX1NDSEVEX0NMT0NLPXkKCiMKIyBTY2hl
ZHVsZXIgZmVhdHVyZXMKIwojIGVuZCBvZiBTY2hlZHVsZXIgZmVhdHVyZXMKCkNPTkZJR19D
R1JPVVBTPXkKQ09ORklHX1BBR0VfQ09VTlRFUj15CkNPTkZJR19NRU1DRz15CkNPTkZJR19N
RU1DR19TV0FQPXkKQ09ORklHX01FTUNHX1NXQVBfRU5BQkxFRD15CkNPTkZJR19NRU1DR19L
TUVNPXkKQ09ORklHX0JMS19DR1JPVVA9eQpDT05GSUdfQ0dST1VQX1dSSVRFQkFDSz15CkNP
TkZJR19DR1JPVVBfU0NIRUQ9eQpDT05GSUdfRkFJUl9HUk9VUF9TQ0hFRD15CkNPTkZJR19D
RlNfQkFORFdJRFRIPXkKQ09ORklHX1JUX0dST1VQX1NDSEVEPXkKIyBDT05GSUdfQ0dST1VQ
X1BJRFMgaXMgbm90IHNldAojIENPTkZJR19DR1JPVVBfUkRNQSBpcyBub3Qgc2V0CkNPTkZJ
R19DR1JPVVBfRlJFRVpFUj15CkNPTkZJR19DUFVTRVRTPXkKQ09ORklHX1BST0NfUElEX0NQ
VVNFVD15CkNPTkZJR19DR1JPVVBfREVWSUNFPXkKQ09ORklHX0NHUk9VUF9DUFVBQ0NUPXkK
Q09ORklHX0NHUk9VUF9QRVJGPXkKIyBDT05GSUdfQ0dST1VQX0RFQlVHIGlzIG5vdCBzZXQK
Q09ORklHX05BTUVTUEFDRVM9eQpDT05GSUdfVVRTX05TPXkKQ09ORklHX0lQQ19OUz15CiMg
Q09ORklHX1VTRVJfTlMgaXMgbm90IHNldApDT05GSUdfUElEX05TPXkKQ09ORklHX05FVF9O
Uz15CiMgQ09ORklHX0NIRUNLUE9JTlRfUkVTVE9SRSBpcyBub3Qgc2V0CiMgQ09ORklHX1ND
SEVEX0FVVE9HUk9VUCBpcyBub3Qgc2V0CiMgQ09ORklHX1NZU0ZTX0RFUFJFQ0FURUQgaXMg
bm90IHNldAojIENPTkZJR19SRUxBWSBpcyBub3Qgc2V0CkNPTkZJR19CTEtfREVWX0lOSVRS
RD15CkNPTkZJR19JTklUUkFNRlNfU09VUkNFPSIiCkNPTkZJR19SRF9HWklQPXkKQ09ORklH
X1JEX0JaSVAyPXkKQ09ORklHX1JEX0xaTUE9eQpDT05GSUdfUkRfWFo9eQpDT05GSUdfUkRf
TFpPPXkKQ09ORklHX1JEX0xaND15CkNPTkZJR19DQ19PUFRJTUlaRV9GT1JfUEVSRk9STUFO
Q0U9eQojIENPTkZJR19DQ19PUFRJTUlaRV9GT1JfU0laRSBpcyBub3Qgc2V0CkNPTkZJR19T
WVNDVEw9eQpDT05GSUdfSEFWRV9VSUQxNj15CkNPTkZJR19CUEY9eQpDT05GSUdfRVhQRVJU
PXkKQ09ORklHX1VJRDE2PXkKQ09ORklHX01VTFRJVVNFUj15CiMgQ09ORklHX1NHRVRNQVNL
X1NZU0NBTEwgaXMgbm90IHNldApDT05GSUdfU1lTRlNfU1lTQ0FMTD15CiMgQ09ORklHX1NZ
U0NUTF9TWVNDQUxMIGlzIG5vdCBzZXQKQ09ORklHX0ZIQU5ETEU9eQpDT05GSUdfUE9TSVhf
VElNRVJTPXkKQ09ORklHX1BSSU5USz15CkNPTkZJR19QUklOVEtfTk1JPXkKQ09ORklHX0JV
Rz15CkNPTkZJR19FTEZfQ09SRT15CkNPTkZJR19CQVNFX0ZVTEw9eQpDT05GSUdfRlVURVg9
eQpDT05GSUdfRlVURVhfUEk9eQpDT05GSUdfRVBPTEw9eQpDT05GSUdfU0lHTkFMRkQ9eQpD
T05GSUdfVElNRVJGRD15CkNPTkZJR19FVkVOVEZEPXkKQ09ORklHX1NITUVNPXkKQ09ORklH
X0FJTz15CkNPTkZJR19JT19VUklORz15CkNPTkZJR19BRFZJU0VfU1lTQ0FMTFM9eQpDT05G
SUdfTUVNQkFSUklFUj15CkNPTkZJR19LQUxMU1lNUz15CiMgQ09ORklHX0tBTExTWU1TX0FM
TCBpcyBub3Qgc2V0CkNPTkZJR19LQUxMU1lNU19CQVNFX1JFTEFUSVZFPXkKIyBDT05GSUdf
QlBGX1NZU0NBTEwgaXMgbm90IHNldAojIENPTkZJR19VU0VSRkFVTFRGRCBpcyBub3Qgc2V0
CkNPTkZJR19BUkNIX0hBU19NRU1CQVJSSUVSX1NZTkNfQ09SRT15CkNPTkZJR19SU0VRPXkK
IyBDT05GSUdfREVCVUdfUlNFUSBpcyBub3Qgc2V0CiMgQ09ORklHX0VNQkVEREVEIGlzIG5v
dCBzZXQKQ09ORklHX0hBVkVfUEVSRl9FVkVOVFM9eQpDT05GSUdfUEVSRl9VU0VfVk1BTExP
Qz15CiMgQ09ORklHX1BDMTA0IGlzIG5vdCBzZXQKCiMKIyBLZXJuZWwgUGVyZm9ybWFuY2Ug
RXZlbnRzIEFuZCBDb3VudGVycwojCkNPTkZJR19QRVJGX0VWRU5UUz15CiMgQ09ORklHX0RF
QlVHX1BFUkZfVVNFX1ZNQUxMT0MgaXMgbm90IHNldAojIGVuZCBvZiBLZXJuZWwgUGVyZm9y
bWFuY2UgRXZlbnRzIEFuZCBDb3VudGVycwoKQ09ORklHX1ZNX0VWRU5UX0NPVU5URVJTPXkK
Q09ORklHX0NPTVBBVF9CUks9eQpDT05GSUdfU0xBQj15CiMgQ09ORklHX1NMVUIgaXMgbm90
IHNldAojIENPTkZJR19TTE9CIGlzIG5vdCBzZXQKQ09ORklHX1NMQUJfTUVSR0VfREVGQVVM
VD15CiMgQ09ORklHX1NMQUJfRlJFRUxJU1RfUkFORE9NIGlzIG5vdCBzZXQKIyBDT05GSUdf
U0hVRkZMRV9QQUdFX0FMTE9DQVRPUiBpcyBub3Qgc2V0CkNPTkZJR19QUk9GSUxJTkc9eQpD
T05GSUdfVFJBQ0VQT0lOVFM9eQojIGVuZCBvZiBHZW5lcmFsIHNldHVwCgpDT05GSUdfQVJN
PXkKQ09ORklHX0FSTV9IQVNfU0dfQ0hBSU49eQpDT05GSUdfU1lTX1NVUFBPUlRTX0FQTV9F
TVVMQVRJT049eQpDT05GSUdfSEFWRV9QUk9DX0NQVT15CkNPTkZJR19TVEFDS1RSQUNFX1NV
UFBPUlQ9eQpDT05GSUdfTE9DS0RFUF9TVVBQT1JUPXkKQ09ORklHX1RSQUNFX0lSUUZMQUdT
X1NVUFBPUlQ9eQpDT05GSUdfQVJDSF9IQVNfQkFOREdBUD15CkNPTkZJR19GSVhfRUFSTFlD
T05fTUVNPXkKQ09ORklHX0dFTkVSSUNfSFdFSUdIVD15CkNPTkZJR19HRU5FUklDX0NBTElC
UkFURV9ERUxBWT15CkNPTkZJR19BUkNIX1NVUFBPUlRTX1VQUk9CRVM9eQpDT05GSUdfQVJN
X1BBVENIX1BIWVNfVklSVD15CkNPTkZJR19HRU5FUklDX0JVRz15CkNPTkZJR19QR1RBQkxF
X0xFVkVMUz0yCgojCiMgU3lzdGVtIFR5cGUKIwpDT05GSUdfTU1VPXkKQ09ORklHX0FSQ0hf
TU1BUF9STkRfQklUU19NSU49OApDT05GSUdfQVJDSF9NTUFQX1JORF9CSVRTX01BWD0xNgpD
T05GSUdfQVJDSF9NVUxUSVBMQVRGT1JNPXkKIyBDT05GSUdfQVJDSF9FQlNBMTEwIGlzIG5v
dCBzZXQKIyBDT05GSUdfQVJDSF9FUDkzWFggaXMgbm90IHNldAojIENPTkZJR19BUkNIX0ZP
T1RCUklER0UgaXMgbm90IHNldAojIENPTkZJR19BUkNIX0lPUDEzWFggaXMgbm90IHNldAoj
IENPTkZJR19BUkNIX0lPUDMyWCBpcyBub3Qgc2V0CiMgQ09ORklHX0FSQ0hfSU9QMzNYIGlz
IG5vdCBzZXQKIyBDT05GSUdfQVJDSF9JWFA0WFggaXMgbm90IHNldAojIENPTkZJR19BUkNI
X0RPVkUgaXMgbm90IHNldAojIENPTkZJR19BUkNIX0tTODY5NSBpcyBub3Qgc2V0CiMgQ09O
RklHX0FSQ0hfVzkwWDkwMCBpcyBub3Qgc2V0CiMgQ09ORklHX0FSQ0hfTFBDMzJYWCBpcyBu
b3Qgc2V0CiMgQ09ORklHX0FSQ0hfUFhBIGlzIG5vdCBzZXQKIyBDT05GSUdfQVJDSF9SUEMg
aXMgbm90IHNldAojIENPTkZJR19BUkNIX1NBMTEwMCBpcyBub3Qgc2V0CiMgQ09ORklHX0FS
Q0hfUzNDMjRYWCBpcyBub3Qgc2V0CiMgQ09ORklHX0FSQ0hfREFWSU5DSSBpcyBub3Qgc2V0
CiMgQ09ORklHX0FSQ0hfT01BUDEgaXMgbm90IHNldAoKIwojIE11bHRpcGxlIHBsYXRmb3Jt
IHNlbGVjdGlvbgojCgojCiMgQ1BVIENvcmUgZmFtaWx5IHNlbGVjdGlvbgojCkNPTkZJR19B
UkNIX01VTFRJX1Y2PXkKQ09ORklHX0FSQ0hfTVVMVElfVjc9eQpDT05GSUdfQVJDSF9NVUxU
SV9WNl9WNz15CiMgZW5kIG9mIE11bHRpcGxlIHBsYXRmb3JtIHNlbGVjdGlvbgoKIyBDT05G
SUdfQVJDSF9WSVJUIGlzIG5vdCBzZXQKIyBDT05GSUdfQVJDSF9BQ1RJT05TIGlzIG5vdCBz
ZXQKIyBDT05GSUdfQVJDSF9BTFBJTkUgaXMgbm90IHNldAojIENPTkZJR19BUkNIX0FSVFBF
QyBpcyBub3Qgc2V0CiMgQ09ORklHX0FSQ0hfQVNQRUVEIGlzIG5vdCBzZXQKIyBDT05GSUdf
QVJDSF9BVDkxIGlzIG5vdCBzZXQKIyBDT05GSUdfQVJDSF9CQ00gaXMgbm90IHNldAojIENP
TkZJR19BUkNIX0JFUkxJTiBpcyBub3Qgc2V0CiMgQ09ORklHX0FSQ0hfQ05TM1hYWCBpcyBu
b3Qgc2V0CiMgQ09ORklHX0FSQ0hfRElHSUNPTE9SIGlzIG5vdCBzZXQKIyBDT05GSUdfQVJD
SF9FWFlOT1MgaXMgbm90IHNldAojIENPTkZJR19BUkNIX0hJR0hCQU5LIGlzIG5vdCBzZXQK
IyBDT05GSUdfQVJDSF9ISVNJIGlzIG5vdCBzZXQKIyBDT05GSUdfQVJDSF9NWEMgaXMgbm90
IHNldAojIENPTkZJR19BUkNIX0lOVEVHUkFUT1IgaXMgbm90IHNldAojIENPTkZJR19BUkNI
X0tFWVNUT05FIGlzIG5vdCBzZXQKIyBDT05GSUdfQVJDSF9NRURJQVRFSyBpcyBub3Qgc2V0
CiMgQ09ORklHX0FSQ0hfTUVTT04gaXMgbm90IHNldAojIENPTkZJR19BUkNIX01JTEJFQVVU
IGlzIG5vdCBzZXQKIyBDT05GSUdfQVJDSF9NTVAgaXMgbm90IHNldAojIENPTkZJR19BUkNI
X01WRUJVIGlzIG5vdCBzZXQKIyBDT05GSUdfQVJDSF9OUENNIGlzIG5vdCBzZXQKQ09ORklH
X0FSQ0hfT01BUD15CgojCiMgVEkgT01BUCBDb21tb24gRmVhdHVyZXMKIwoKIwojIE9NQVAg
RmVhdHVyZSBTZWxlY3Rpb25zCiMKQ09ORklHX1BPV0VSX0FWU19PTUFQPXkKQ09ORklHX1BP
V0VSX0FWU19PTUFQX0NMQVNTMz15CkNPTkZJR19PTUFQX1JFU0VUX0NMT0NLUz15CkNPTkZJ
R19PTUFQXzMyS19USU1FUj15CiMgQ09ORklHX09NQVAzX0wyX0FVWF9TRUNVUkVfU0FWRV9S
RVNUT1JFIGlzIG5vdCBzZXQKIyBlbmQgb2YgVEkgT01BUCBDb21tb24gRmVhdHVyZXMKCkNP
TkZJR19NQUNIX09NQVBfR0VORVJJQz15CgojCiMgVEkgT01BUC9BTS9ETS9EUkEgRmFtaWx5
CiMKQ09ORklHX0FSQ0hfT01BUDI9eQpDT05GSUdfQVJDSF9PTUFQMz15CkNPTkZJR19BUkNI
X09NQVA0PXkKQ09ORklHX1NPQ19PTUFQNT15CkNPTkZJR19TT0NfQU0zM1hYPXkKQ09ORklH
X1NPQ19BTTQzWFg9eQpDT05GSUdfU09DX0RSQTdYWD15CkNPTkZJR19BUkNIX09NQVAyUExV
Uz15CkNPTkZJR19PTUFQX0lOVEVSQ09OTkVDVF9CQVJSSUVSPXkKCiMKIyBUSSBPTUFQMi8z
LzQgU3BlY2lmaWMgRmVhdHVyZXMKIwpDT05GSUdfQVJDSF9PTUFQMlBMVVNfVFlQSUNBTD15
CkNPTkZJR19TT0NfSEFTX09NQVAyX1NEUkM9eQpDT05GSUdfU09DX0hBU19SRUFMVElNRV9D
T1VOVEVSPXkKCiMKIyBPTUFQIENvcmUgVHlwZQojCkNPTkZJR19TT0NfT01BUDI0MjA9eQpD
T05GSUdfU09DX09NQVAyNDMwPXkKQ09ORklHX1NPQ19PTUFQMzQzMD15CkNPTkZJR19TT0Nf
VEk4MVhYPXkKQ09ORklHX09NQVBfUEFDS0FHRV9DQkI9eQoKIwojIE9NQVAgTGVnYWN5IFBs
YXRmb3JtIERhdGEgQm9hcmQgVHlwZQojCkNPTkZJR19NQUNIX09NQVAyX1RVU0I2MDEwPXkK
Q09ORklHX01BQ0hfT01BUDM1MTdFVk09eQpDT05GSUdfTUFDSF9PTUFQM19QQU5ET1JBPXkK
Q09ORklHX01BQ0hfTk9LSUFfTjgxMD15CkNPTkZJR19NQUNIX05PS0lBX044MTBfV0lNQVg9
eQpDT05GSUdfTUFDSF9OT0tJQV9OOFgwPXkKIyBDT05GSUdfT01BUDNfU0RSQ19BQ19USU1J
TkcgaXMgbm90IHNldAojIGVuZCBvZiBUSSBPTUFQMi8zLzQgU3BlY2lmaWMgRmVhdHVyZXMK
CiMgQ09ORklHX09NQVA1X0VSUkFUQV84MDE4MTkgaXMgbm90IHNldAojIGVuZCBvZiBUSSBP
TUFQL0FNL0RNL0RSQSBGYW1pbHkKCiMgQ09ORklHX0FSQ0hfT1hOQVMgaXMgbm90IHNldAoj
IENPTkZJR19BUkNIX1BJQ09YQ0VMTCBpcyBub3Qgc2V0CiMgQ09ORklHX0FSQ0hfU0lSRiBp
cyBub3Qgc2V0CiMgQ09ORklHX0FSQ0hfUUNPTSBpcyBub3Qgc2V0CiMgQ09ORklHX0FSQ0hf
UkRBIGlzIG5vdCBzZXQKIyBDT05GSUdfQVJDSF9SRUFMVklFVyBpcyBub3Qgc2V0CiMgQ09O
RklHX0FSQ0hfUk9DS0NISVAgaXMgbm90IHNldAojIENPTkZJR19BUkNIX1MzQzY0WFggaXMg
bm90IHNldAojIENPTkZJR19BUkNIX1M1UFYyMTAgaXMgbm90IHNldAojIENPTkZJR19BUkNI
X1JFTkVTQVMgaXMgbm90IHNldAojIENPTkZJR19BUkNIX1NPQ0ZQR0EgaXMgbm90IHNldAoj
IENPTkZJR19QTEFUX1NQRUFSIGlzIG5vdCBzZXQKIyBDT05GSUdfQVJDSF9TVEkgaXMgbm90
IHNldAojIENPTkZJR19BUkNIX1NUTTMyIGlzIG5vdCBzZXQKIyBDT05GSUdfQVJDSF9TVU5Y
SSBpcyBub3Qgc2V0CiMgQ09ORklHX0FSQ0hfVEFOR08gaXMgbm90IHNldAojIENPTkZJR19B
UkNIX1RFR1JBIGlzIG5vdCBzZXQKIyBDT05GSUdfQVJDSF9VTklQSElFUiBpcyBub3Qgc2V0
CiMgQ09ORklHX0FSQ0hfVTg1MDAgaXMgbm90IHNldAojIENPTkZJR19BUkNIX1ZFWFBSRVNT
IGlzIG5vdCBzZXQKIyBDT05GSUdfQVJDSF9XTTg3NTAgaXMgbm90IHNldAojIENPTkZJR19B
UkNIX1dNODg1MCBpcyBub3Qgc2V0CiMgQ09ORklHX0FSQ0hfWlggaXMgbm90IHNldAojIENP
TkZJR19BUkNIX1pZTlEgaXMgbm90IHNldAoKIwojIFByb2Nlc3NvciBUeXBlCiMKQ09ORklH
X0NQVV9WNj15CkNPTkZJR19DUFVfVjZLPXkKQ09ORklHX0NQVV9WNz15CkNPTkZJR19DUFVf
VEhVTUJfQ0FQQUJMRT15CkNPTkZJR19DUFVfMzJ2Nj15CkNPTkZJR19DUFVfMzJ2Nks9eQpD
T05GSUdfQ1BVXzMydjc9eQpDT05GSUdfQ1BVX0FCUlRfRVY2PXkKQ09ORklHX0NQVV9BQlJU
X0VWNz15CkNPTkZJR19DUFVfUEFCUlRfVjY9eQpDT05GSUdfQ1BVX1BBQlJUX1Y3PXkKQ09O
RklHX0NQVV9DQUNIRV9WNj15CkNPTkZJR19DUFVfQ0FDSEVfVjc9eQpDT05GSUdfQ1BVX0NB
Q0hFX1ZJUFQ9eQpDT05GSUdfQ1BVX0NPUFlfVjY9eQpDT05GSUdfQ1BVX1RMQl9WNj15CkNP
TkZJR19DUFVfVExCX1Y3PXkKQ09ORklHX0NQVV9IQVNfQVNJRD15CkNPTkZJR19DUFVfQ1Ax
NT15CkNPTkZJR19DUFVfQ1AxNV9NTVU9eQoKIwojIFByb2Nlc3NvciBGZWF0dXJlcwojCkNP
TkZJR19BUk1fVEhVTUI9eQpDT05GSUdfQVJNX1RIVU1CRUU9eQpDT05GSUdfQVJNX1ZJUlRf
RVhUPXkKQ09ORklHX1NXUF9FTVVMQVRFPXkKIyBDT05GSUdfQ1BVX0lDQUNIRV9ESVNBQkxF
IGlzIG5vdCBzZXQKIyBDT05GSUdfQ1BVX0lDQUNIRV9NSVNNQVRDSF9XT1JLQVJPVU5EIGlz
IG5vdCBzZXQKIyBDT05GSUdfQ1BVX0JQUkVESUNUX0RJU0FCTEUgaXMgbm90IHNldApDT05G
SUdfQ1BVX1NQRUNUUkU9eQpDT05GSUdfSEFSREVOX0JSQU5DSF9QUkVESUNUT1I9eQpDT05G
SUdfS1VTRVJfSEVMUEVSUz15CkNPTkZJR19WRFNPPXkKQ09ORklHX0RNQV9DQUNIRV9SV0ZP
PXkKQ09ORklHX09VVEVSX0NBQ0hFPXkKQ09ORklHX09VVEVSX0NBQ0hFX1NZTkM9eQpDT05G
SUdfTUlHSFRfSEFWRV9DQUNIRV9MMlgwPXkKQ09ORklHX0NBQ0hFX0wyWDA9eQojIENPTkZJ
R19DQUNIRV9MMlgwX1BNVSBpcyBub3Qgc2V0CkNPTkZJR19QTDMxMF9FUlJBVEFfNTg4MzY5
PXkKQ09ORklHX1BMMzEwX0VSUkFUQV83Mjc5MTU9eQojIENPTkZJR19QTDMxMF9FUlJBVEFf
NzUzOTcwIGlzIG5vdCBzZXQKIyBDT05GSUdfUEwzMTBfRVJSQVRBXzc2OTQxOSBpcyBub3Qg
c2V0CkNPTkZJR19BUk1fTDFfQ0FDSEVfU0hJRlRfNj15CkNPTkZJR19BUk1fTDFfQ0FDSEVf
U0hJRlQ9NgpDT05GSUdfQVJNX0RNQV9NRU1fQlVGRkVSQUJMRT15CkNPTkZJR19BUk1fSEVB
VllfTUI9eQpDT05GSUdfREVCVUdfQUxJR05fUk9EQVRBPXkKIyBDT05GSUdfQVJNX0VSUkFU
QV8zMjYxMDMgaXMgbm90IHNldApDT05GSUdfQVJNX0VSUkFUQV80MTE5MjA9eQpDT05GSUdf
QVJNX0VSUkFUQV80MzA5NzM9eQpDT05GSUdfQVJNX0VSUkFUQV82NDM3MTk9eQpDT05GSUdf
QVJNX0VSUkFUQV83MjA3ODk9eQpDT05GSUdfQVJNX0VSUkFUQV83NTQzMjI9eQojIENPTkZJ
R19BUk1fRVJSQVRBXzc1NDMyNyBpcyBub3Qgc2V0CiMgQ09ORklHX0FSTV9FUlJBVEFfMzY0
Mjk2IGlzIG5vdCBzZXQKIyBDT05GSUdfQVJNX0VSUkFUQV83NjQzNjkgaXMgbm90IHNldApD
T05GSUdfQVJNX0VSUkFUQV83NzU0MjA9eQpDT05GSUdfQVJNX0VSUkFUQV83OTgxODE9eQoj
IENPTkZJR19BUk1fRVJSQVRBXzc3MzAyMiBpcyBub3Qgc2V0CiMgQ09ORklHX0FSTV9FUlJB
VEFfODE4MzI1Xzg1MjQyMiBpcyBub3Qgc2V0CiMgQ09ORklHX0FSTV9FUlJBVEFfODIxNDIw
IGlzIG5vdCBzZXQKIyBDT05GSUdfQVJNX0VSUkFUQV84MjU2MTkgaXMgbm90IHNldAojIENP
TkZJR19BUk1fRVJSQVRBXzg1NzI3MSBpcyBub3Qgc2V0CiMgQ09ORklHX0FSTV9FUlJBVEFf
ODUyNDIxIGlzIG5vdCBzZXQKIyBDT05GSUdfQVJNX0VSUkFUQV84NTI0MjMgaXMgbm90IHNl
dAojIENPTkZJR19BUk1fRVJSQVRBXzg1NzI3MiBpcyBub3Qgc2V0CiMgZW5kIG9mIFN5c3Rl
bSBUeXBlCgojCiMgQnVzIHN1cHBvcnQKIwojIENPTkZJR19BUk1fRVJSQVRBXzgxNDIyMCBp
cyBub3Qgc2V0CiMgZW5kIG9mIEJ1cyBzdXBwb3J0CgojCiMgS2VybmVsIEZlYXR1cmVzCiMK
Q09ORklHX0hBVkVfU01QPXkKQ09ORklHX1NNUD15CkNPTkZJR19TTVBfT05fVVA9eQpDT05G
SUdfQVJNX0NQVV9UT1BPTE9HWT15CiMgQ09ORklHX1NDSEVEX01DIGlzIG5vdCBzZXQKIyBD
T05GSUdfU0NIRURfU01UIGlzIG5vdCBzZXQKQ09ORklHX0hBVkVfQVJNX1NDVT15CkNPTkZJ
R19IQVZFX0FSTV9BUkNIX1RJTUVSPXkKQ09ORklHX0hBVkVfQVJNX1RXRD15CiMgQ09ORklH
X01DUE0gaXMgbm90IHNldAojIENPTkZJR19CSUdfTElUVExFIGlzIG5vdCBzZXQKQ09ORklH
X1ZNU1BMSVRfM0c9eQojIENPTkZJR19WTVNQTElUXzNHX09QVCBpcyBub3Qgc2V0CiMgQ09O
RklHX1ZNU1BMSVRfMkcgaXMgbm90IHNldAojIENPTkZJR19WTVNQTElUXzFHIGlzIG5vdCBz
ZXQKQ09ORklHX1BBR0VfT0ZGU0VUPTB4QzAwMDAwMDAKQ09ORklHX05SX0NQVVM9MgpDT05G
SUdfSE9UUExVR19DUFU9eQojIENPTkZJR19BUk1fUFNDSSBpcyBub3Qgc2V0CkNPTkZJR19B
UkNIX05SX0dQSU89NTEyCkNPTkZJR19IWl9GSVhFRD0wCkNPTkZJR19IWl8xMDA9eQojIENP
TkZJR19IWl8yMDAgaXMgbm90IHNldAojIENPTkZJR19IWl8yNTAgaXMgbm90IHNldAojIENP
TkZJR19IWl8zMDAgaXMgbm90IHNldAojIENPTkZJR19IWl81MDAgaXMgbm90IHNldAojIENP
TkZJR19IWl8xMDAwIGlzIG5vdCBzZXQKQ09ORklHX0haPTEwMApDT05GSUdfU0NIRURfSFJU
SUNLPXkKQ09ORklHX0FSTV9QQVRDSF9JRElWPXkKQ09ORklHX0FFQUJJPXkKIyBDT05GSUdf
T0FCSV9DT01QQVQgaXMgbm90IHNldApDT05GSUdfQVJDSF9IQVNfSE9MRVNfTUVNT1JZTU9E
RUw9eQpDT05GSUdfSEFWRV9BUkNIX1BGTl9WQUxJRD15CkNPTkZJR19ISUdITUVNPXkKQ09O
RklHX0hJR0hQVEU9eQpDT05GSUdfQ1BVX1NXX0RPTUFJTl9QQU49eQpDT05GSUdfSFdfUEVS
Rl9FVkVOVFM9eQpDT05GSUdfQVJDSF9XQU5UX0dFTkVSQUxfSFVHRVRMQj15CkNPTkZJR19B
Uk1fTU9EVUxFX1BMVFM9eQpDT05GSUdfRk9SQ0VfTUFYX1pPTkVPUkRFUj0xMgpDT05GSUdf
QUxJR05NRU5UX1RSQVA9eQojIENPTkZJR19VQUNDRVNTX1dJVEhfTUVNQ1BZIGlzIG5vdCBz
ZXQKQ09ORklHX1NFQ0NPTVA9eQojIENPTkZJR19QQVJBVklSVCBpcyBub3Qgc2V0CiMgQ09O
RklHX1BBUkFWSVJUX1RJTUVfQUNDT1VOVElORyBpcyBub3Qgc2V0CiMgZW5kIG9mIEtlcm5l
bCBGZWF0dXJlcwoKIwojIEJvb3Qgb3B0aW9ucwojCkNPTkZJR19VU0VfT0Y9eQpDT05GSUdf
QVRBR1M9eQojIENPTkZJR19ERVBSRUNBVEVEX1BBUkFNX1NUUlVDVCBpcyBub3Qgc2V0CkNP
TkZJR19aQk9PVF9ST01fVEVYVD0weDAKQ09ORklHX1pCT09UX1JPTV9CU1M9MHgwCkNPTkZJ
R19BUk1fQVBQRU5ERURfRFRCPXkKQ09ORklHX0FSTV9BVEFHX0RUQl9DT01QQVQ9eQpDT05G
SUdfQVJNX0FUQUdfRFRCX0NPTVBBVF9DTURMSU5FX0ZST01fQk9PVExPQURFUj15CiMgQ09O
RklHX0FSTV9BVEFHX0RUQl9DT01QQVRfQ01ETElORV9FWFRFTkQgaXMgbm90IHNldApDT05G
SUdfQ01ETElORT0icm9vdD0vZGV2L21tY2JsazBwMiByb290d2FpdCBjb25zb2xlPXR0eU8y
LDExNTIwMCIKQ09ORklHX0NNRExJTkVfRlJPTV9CT09UTE9BREVSPXkKIyBDT05GSUdfQ01E
TElORV9FWFRFTkQgaXMgbm90IHNldAojIENPTkZJR19DTURMSU5FX0ZPUkNFIGlzIG5vdCBz
ZXQKQ09ORklHX0tFWEVDPXkKQ09ORklHX0FUQUdTX1BST0M9eQojIENPTkZJR19DUkFTSF9E
VU1QIGlzIG5vdCBzZXQKQ09ORklHX0FVVE9fWlJFTEFERFI9eQojIENPTkZJR19FRkkgaXMg
bm90IHNldAojIGVuZCBvZiBCb290IG9wdGlvbnMKCiMKIyBDUFUgUG93ZXIgTWFuYWdlbWVu
dAojCgojCiMgQ1BVIEZyZXF1ZW5jeSBzY2FsaW5nCiMKQ09ORklHX0NQVV9GUkVRPXkKQ09O
RklHX0NQVV9GUkVRX0dPVl9BVFRSX1NFVD15CkNPTkZJR19DUFVfRlJFUV9HT1ZfQ09NTU9O
PXkKIyBDT05GSUdfQ1BVX0ZSRVFfU1RBVCBpcyBub3Qgc2V0CiMgQ09ORklHX0NQVV9GUkVR
X0RFRkFVTFRfR09WX1BFUkZPUk1BTkNFIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1BVX0ZSRVFf
REVGQVVMVF9HT1ZfUE9XRVJTQVZFIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1BVX0ZSRVFfREVG
QVVMVF9HT1ZfVVNFUlNQQUNFIGlzIG5vdCBzZXQKQ09ORklHX0NQVV9GUkVRX0RFRkFVTFRf
R09WX09OREVNQU5EPXkKIyBDT05GSUdfQ1BVX0ZSRVFfREVGQVVMVF9HT1ZfQ09OU0VSVkFU
SVZFIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1BVX0ZSRVFfREVGQVVMVF9HT1ZfU0NIRURVVElM
IGlzIG5vdCBzZXQKQ09ORklHX0NQVV9GUkVRX0dPVl9QRVJGT1JNQU5DRT15CkNPTkZJR19D
UFVfRlJFUV9HT1ZfUE9XRVJTQVZFPXkKQ09ORklHX0NQVV9GUkVRX0dPVl9VU0VSU1BBQ0U9
eQpDT05GSUdfQ1BVX0ZSRVFfR09WX09OREVNQU5EPXkKQ09ORklHX0NQVV9GUkVRX0dPVl9D
T05TRVJWQVRJVkU9eQojIENPTkZJR19DUFVfRlJFUV9HT1ZfU0NIRURVVElMIGlzIG5vdCBz
ZXQKCiMKIyBDUFUgZnJlcXVlbmN5IHNjYWxpbmcgZHJpdmVycwojCiMgQ09ORklHX0NQVUZS
RVFfRFQgaXMgbm90IHNldAojIENPTkZJR19BUk1fQklHX0xJVFRMRV9DUFVGUkVRIGlzIG5v
dCBzZXQKIyBDT05GSUdfQVJNX09NQVAyUExVU19DUFVGUkVRIGlzIG5vdCBzZXQKQ09ORklH
X0FSTV9USV9DUFVGUkVRPXkKIyBDT05GSUdfUU9SSVFfQ1BVRlJFUSBpcyBub3Qgc2V0CiMg
ZW5kIG9mIENQVSBGcmVxdWVuY3kgc2NhbGluZwoKIwojIENQVSBJZGxlCiMKQ09ORklHX0NQ
VV9JRExFPXkKIyBDT05GSUdfQ1BVX0lETEVfR09WX0xBRERFUiBpcyBub3Qgc2V0CkNPTkZJ
R19DUFVfSURMRV9HT1ZfTUVOVT15CiMgQ09ORklHX0NQVV9JRExFX0dPVl9URU8gaXMgbm90
IHNldAoKIwojIEFSTSBDUFUgSWRsZSBEcml2ZXJzCiMKIyBDT05GSUdfQVJNX0NQVUlETEUg
aXMgbm90IHNldAojIGVuZCBvZiBBUk0gQ1BVIElkbGUgRHJpdmVycwoKQ09ORklHX0FSQ0hf
TkVFRFNfQ1BVX0lETEVfQ09VUExFRD15CiMgZW5kIG9mIENQVSBJZGxlCiMgZW5kIG9mIENQ
VSBQb3dlciBNYW5hZ2VtZW50CgojCiMgRmxvYXRpbmcgcG9pbnQgZW11bGF0aW9uCiMKCiMK
IyBBdCBsZWFzdCBvbmUgZW11bGF0aW9uIG11c3QgYmUgc2VsZWN0ZWQKIwpDT05GSUdfVkZQ
PXkKQ09ORklHX1ZGUHYzPXkKQ09ORklHX05FT049eQpDT05GSUdfS0VSTkVMX01PREVfTkVP
Tj15CiMgZW5kIG9mIEZsb2F0aW5nIHBvaW50IGVtdWxhdGlvbgoKIwojIFBvd2VyIG1hbmFn
ZW1lbnQgb3B0aW9ucwojCkNPTkZJR19TVVNQRU5EPXkKQ09ORklHX1NVU1BFTkRfRlJFRVpF
Uj15CiMgQ09ORklHX1NVU1BFTkRfU0tJUF9TWU5DIGlzIG5vdCBzZXQKIyBDT05GSUdfSElC
RVJOQVRJT04gaXMgbm90IHNldApDT05GSUdfUE1fU0xFRVA9eQpDT05GSUdfUE1fU0xFRVBf
U01QPXkKIyBDT05GSUdfUE1fQVVUT1NMRUVQIGlzIG5vdCBzZXQKIyBDT05GSUdfUE1fV0FL
RUxPQ0tTIGlzIG5vdCBzZXQKQ09ORklHX1BNPXkKQ09ORklHX1BNX0RFQlVHPXkKIyBDT05G
SUdfUE1fQURWQU5DRURfREVCVUcgaXMgbm90IHNldAojIENPTkZJR19QTV9URVNUX1NVU1BF
TkQgaXMgbm90IHNldApDT05GSUdfUE1fU0xFRVBfREVCVUc9eQojIENPTkZJR19BUE1fRU1V
TEFUSU9OIGlzIG5vdCBzZXQKQ09ORklHX1BNX0NMSz15CiMgQ09ORklHX1dRX1BPV0VSX0VG
RklDSUVOVF9ERUZBVUxUIGlzIG5vdCBzZXQKQ09ORklHX0NQVV9QTT15CiMgQ09ORklHX0VO
RVJHWV9NT0RFTCBpcyBub3Qgc2V0CkNPTkZJR19BUkNIX1NVU1BFTkRfUE9TU0lCTEU9eQpD
T05GSUdfQVJNX0NQVV9TVVNQRU5EPXkKQ09ORklHX0FSQ0hfSElCRVJOQVRJT05fUE9TU0lC
TEU9eQojIGVuZCBvZiBQb3dlciBtYW5hZ2VtZW50IG9wdGlvbnMKCiMKIyBGaXJtd2FyZSBE
cml2ZXJzCiMKIyBDT05GSUdfRklSTVdBUkVfTUVNTUFQIGlzIG5vdCBzZXQKIyBDT05GSUdf
RldfQ0ZHX1NZU0ZTIGlzIG5vdCBzZXQKIyBDT05GSUdfVFJVU1RFRF9GT1VOREFUSU9OUyBp
cyBub3Qgc2V0CkNPTkZJR19IQVZFX0FSTV9TTUNDQz15CiMgQ09ORklHX0dPT0dMRV9GSVJN
V0FSRSBpcyBub3Qgc2V0CgojCiMgVGVncmEgZmlybXdhcmUgZHJpdmVyCiMKIyBlbmQgb2Yg
VGVncmEgZmlybXdhcmUgZHJpdmVyCiMgZW5kIG9mIEZpcm13YXJlIERyaXZlcnMKCkNPTkZJ
R19BUk1fQ1JZUFRPPXkKIyBDT05GSUdfQ1JZUFRPX1NIQTFfQVJNIGlzIG5vdCBzZXQKIyBD
T05GSUdfQ1JZUFRPX1NIQTFfQVJNX05FT04gaXMgbm90IHNldAojIENPTkZJR19DUllQVE9f
U0hBMV9BUk1fQ0UgaXMgbm90IHNldAojIENPTkZJR19DUllQVE9fU0hBMl9BUk1fQ0UgaXMg
bm90IHNldAojIENPTkZJR19DUllQVE9fU0hBMjU2X0FSTSBpcyBub3Qgc2V0CiMgQ09ORklH
X0NSWVBUT19TSEE1MTJfQVJNIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JZUFRPX0FFU19BUk0g
aXMgbm90IHNldAojIENPTkZJR19DUllQVE9fQUVTX0FSTV9CUyBpcyBub3Qgc2V0CiMgQ09O
RklHX0NSWVBUT19BRVNfQVJNX0NFIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JZUFRPX0dIQVNI
X0FSTV9DRSBpcyBub3Qgc2V0CiMgQ09ORklHX0NSWVBUT19DUkNUMTBESUZfQVJNX0NFIGlz
IG5vdCBzZXQKIyBDT05GSUdfQ1JZUFRPX0NSQzMyX0FSTV9DRSBpcyBub3Qgc2V0CiMgQ09O
RklHX0NSWVBUT19DSEFDSEEyMF9ORU9OIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JZUFRPX05I
UE9MWTEzMDVfTkVPTiBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJUlRVQUxJWkFUSU9OIGlzIG5v
dCBzZXQKCiMKIyBHZW5lcmFsIGFyY2hpdGVjdHVyZS1kZXBlbmRlbnQgb3B0aW9ucwojCkNP
TkZJR19DUkFTSF9DT1JFPXkKQ09ORklHX0tFWEVDX0NPUkU9eQpDT05GSUdfT1BST0ZJTEU9
eQpDT05GSUdfSEFWRV9PUFJPRklMRT15CkNPTkZJR19LUFJPQkVTPXkKIyBDT05GSUdfSlVN
UF9MQUJFTCBpcyBub3Qgc2V0CkNPTkZJR19PUFRQUk9CRVM9eQpDT05GSUdfVVBST0JFUz15
CkNPTkZJR19IQVZFX0VGRklDSUVOVF9VTkFMSUdORURfQUNDRVNTPXkKQ09ORklHX0FSQ0hf
VVNFX0JVSUxUSU5fQlNXQVA9eQpDT05GSUdfS1JFVFBST0JFUz15CkNPTkZJR19IQVZFX0tQ
Uk9CRVM9eQpDT05GSUdfSEFWRV9LUkVUUFJPQkVTPXkKQ09ORklHX0hBVkVfT1BUUFJPQkVT
PXkKQ09ORklHX0hBVkVfTk1JPXkKQ09ORklHX0hBVkVfQVJDSF9UUkFDRUhPT0s9eQpDT05G
SUdfSEFWRV9ETUFfQ09OVElHVU9VUz15CkNPTkZJR19HRU5FUklDX1NNUF9JRExFX1RIUkVB
RD15CkNPTkZJR19HRU5FUklDX0lETEVfUE9MTF9TRVRVUD15CkNPTkZJR19BUkNIX0hBU19G
T1JUSUZZX1NPVVJDRT15CkNPTkZJR19BUkNIX0hBU19LRUVQSU5JVFJEPXkKQ09ORklHX0FS
Q0hfSEFTX1NFVF9NRU1PUlk9eQpDT05GSUdfSEFWRV9BUkNIX1RIUkVBRF9TVFJVQ1RfV0hJ
VEVMSVNUPXkKQ09ORklHX0FSQ0hfMzJCSVRfT0ZGX1Q9eQpDT05GSUdfSEFWRV9SRUdTX0FO
RF9TVEFDS19BQ0NFU1NfQVBJPXkKQ09ORklHX0hBVkVfUlNFUT15CkNPTkZJR19IQVZFX0NM
Sz15CkNPTkZJR19IQVZFX0hXX0JSRUFLUE9JTlQ9eQpDT05GSUdfSEFWRV9QRVJGX1JFR1M9
eQpDT05GSUdfSEFWRV9QRVJGX1VTRVJfU1RBQ0tfRFVNUD15CkNPTkZJR19IQVZFX0FSQ0hf
SlVNUF9MQUJFTD15CkNPTkZJR19BUkNIX1dBTlRfSVBDX1BBUlNFX1ZFUlNJT049eQpDT05G
SUdfSEFWRV9BUkNIX1NFQ0NPTVBfRklMVEVSPXkKQ09ORklHX1NFQ0NPTVBfRklMVEVSPXkK
Q09ORklHX0hBVkVfU1RBQ0tQUk9URUNUT1I9eQpDT05GSUdfQ0NfSEFTX1NUQUNLUFJPVEVD
VE9SX05PTkU9eQpDT05GSUdfU1RBQ0tQUk9URUNUT1I9eQpDT05GSUdfU1RBQ0tQUk9URUNU
T1JfU1RST05HPXkKQ09ORklHX0hBVkVfQ09OVEVYVF9UUkFDS0lORz15CkNPTkZJR19IQVZF
X1ZJUlRfQ1BVX0FDQ09VTlRJTkdfR0VOPXkKQ09ORklHX0hBVkVfSVJRX1RJTUVfQUNDT1VO
VElORz15CkNPTkZJR19IQVZFX01PRF9BUkNIX1NQRUNJRklDPXkKQ09ORklHX01PRFVMRVNf
VVNFX0VMRl9SRUw9eQpDT05GSUdfQVJDSF9IQVNfRUxGX1JBTkRPTUlaRT15CkNPTkZJR19I
QVZFX0FSQ0hfTU1BUF9STkRfQklUUz15CkNPTkZJR19IQVZFX0VYSVRfVEhSRUFEPXkKQ09O
RklHX0FSQ0hfTU1BUF9STkRfQklUUz04CkNPTkZJR19DTE9ORV9CQUNLV0FSRFM9eQpDT05G
SUdfT0xEX1NJR1NVU1BFTkQzPXkKQ09ORklHX09MRF9TSUdBQ1RJT049eQpDT05GSUdfNjRC
SVRfVElNRT15CkNPTkZJR19DT01QQVRfMzJCSVRfVElNRT15CkNPTkZJR19BUkNIX09QVElP
TkFMX0tFUk5FTF9SV1g9eQpDT05GSUdfQVJDSF9PUFRJT05BTF9LRVJORUxfUldYX0RFRkFV
TFQ9eQpDT05GSUdfQVJDSF9IQVNfU1RSSUNUX0tFUk5FTF9SV1g9eQpDT05GSUdfU1RSSUNU
X0tFUk5FTF9SV1g9eQpDT05GSUdfQVJDSF9IQVNfU1RSSUNUX01PRFVMRV9SV1g9eQpDT05G
SUdfU1RSSUNUX01PRFVMRV9SV1g9eQpDT05GSUdfQVJDSF9IQVNfUEhZU19UT19ETUE9eQpD
T05GSUdfUkVGQ09VTlRfRlVMTD15CiMgQ09ORklHX0xPQ0tfRVZFTlRfQ09VTlRTIGlzIG5v
dCBzZXQKCiMKIyBHQ09WLWJhc2VkIGtlcm5lbCBwcm9maWxpbmcKIwojIENPTkZJR19HQ09W
X0tFUk5FTCBpcyBub3Qgc2V0CkNPTkZJR19BUkNIX0hBU19HQ09WX1BST0ZJTEVfQUxMPXkK
IyBlbmQgb2YgR0NPVi1iYXNlZCBrZXJuZWwgcHJvZmlsaW5nCgpDT05GSUdfUExVR0lOX0hP
U1RDQz0iIgpDT05GSUdfSEFWRV9HQ0NfUExVR0lOUz15CiMgZW5kIG9mIEdlbmVyYWwgYXJj
aGl0ZWN0dXJlLWRlcGVuZGVudCBvcHRpb25zCgpDT05GSUdfUlRfTVVURVhFUz15CkNPTkZJ
R19CQVNFX1NNQUxMPTAKQ09ORklHX01PRFVMRVM9eQpDT05GSUdfTU9EVUxFX0ZPUkNFX0xP
QUQ9eQpDT05GSUdfTU9EVUxFX1VOTE9BRD15CkNPTkZJR19NT0RVTEVfRk9SQ0VfVU5MT0FE
PXkKQ09ORklHX01PRFZFUlNJT05TPXkKQ09ORklHX01PRFVMRV9TUkNWRVJTSU9OX0FMTD15
CiMgQ09ORklHX01PRFVMRV9TSUcgaXMgbm90IHNldAojIENPTkZJR19NT0RVTEVfQ09NUFJF
U1MgaXMgbm90IHNldAojIENPTkZJR19UUklNX1VOVVNFRF9LU1lNUyBpcyBub3Qgc2V0CkNP
TkZJR19NT0RVTEVTX1RSRUVfTE9PS1VQPXkKQ09ORklHX0JMT0NLPXkKQ09ORklHX0JMS19T
Q1NJX1JFUVVFU1Q9eQojIENPTkZJR19CTEtfREVWX0JTRyBpcyBub3Qgc2V0CiMgQ09ORklH
X0JMS19ERVZfQlNHTElCIGlzIG5vdCBzZXQKIyBDT05GSUdfQkxLX0RFVl9JTlRFR1JJVFkg
aXMgbm90IHNldAojIENPTkZJR19CTEtfREVWX1pPTkVEIGlzIG5vdCBzZXQKIyBDT05GSUdf
QkxLX0RFVl9USFJPVFRMSU5HIGlzIG5vdCBzZXQKIyBDT05GSUdfQkxLX0NNRExJTkVfUEFS
U0VSIGlzIG5vdCBzZXQKIyBDT05GSUdfQkxLX1dCVCBpcyBub3Qgc2V0CiMgQ09ORklHX0JM
S19DR1JPVVBfSU9MQVRFTkNZIGlzIG5vdCBzZXQKQ09ORklHX0JMS19ERUJVR19GUz15CiMg
Q09ORklHX0JMS19TRURfT1BBTCBpcyBub3Qgc2V0CgojCiMgUGFydGl0aW9uIFR5cGVzCiMK
Q09ORklHX1BBUlRJVElPTl9BRFZBTkNFRD15CiMgQ09ORklHX0FDT1JOX1BBUlRJVElPTiBp
cyBub3Qgc2V0CiMgQ09ORklHX0FJWF9QQVJUSVRJT04gaXMgbm90IHNldAojIENPTkZJR19P
U0ZfUEFSVElUSU9OIGlzIG5vdCBzZXQKIyBDT05GSUdfQU1JR0FfUEFSVElUSU9OIGlzIG5v
dCBzZXQKIyBDT05GSUdfQVRBUklfUEFSVElUSU9OIGlzIG5vdCBzZXQKIyBDT05GSUdfTUFD
X1BBUlRJVElPTiBpcyBub3Qgc2V0CkNPTkZJR19NU0RPU19QQVJUSVRJT049eQojIENPTkZJ
R19CU0RfRElTS0xBQkVMIGlzIG5vdCBzZXQKIyBDT05GSUdfTUlOSVhfU1VCUEFSVElUSU9O
IGlzIG5vdCBzZXQKIyBDT05GSUdfU09MQVJJU19YODZfUEFSVElUSU9OIGlzIG5vdCBzZXQK
IyBDT05GSUdfVU5JWFdBUkVfRElTS0xBQkVMIGlzIG5vdCBzZXQKIyBDT05GSUdfTERNX1BB
UlRJVElPTiBpcyBub3Qgc2V0CiMgQ09ORklHX1NHSV9QQVJUSVRJT04gaXMgbm90IHNldAoj
IENPTkZJR19VTFRSSVhfUEFSVElUSU9OIGlzIG5vdCBzZXQKIyBDT05GSUdfU1VOX1BBUlRJ
VElPTiBpcyBub3Qgc2V0CiMgQ09ORklHX0tBUk1BX1BBUlRJVElPTiBpcyBub3Qgc2V0CkNP
TkZJR19FRklfUEFSVElUSU9OPXkKIyBDT05GSUdfU1lTVjY4X1BBUlRJVElPTiBpcyBub3Qg
c2V0CiMgQ09ORklHX0NNRExJTkVfUEFSVElUSU9OIGlzIG5vdCBzZXQKIyBlbmQgb2YgUGFy
dGl0aW9uIFR5cGVzCgpDT05GSUdfQkxLX01RX1BDST15CkNPTkZJR19CTEtfUE09eQoKIwoj
IElPIFNjaGVkdWxlcnMKIwpDT05GSUdfTVFfSU9TQ0hFRF9ERUFETElORT15CkNPTkZJR19N
UV9JT1NDSEVEX0tZQkVSPXkKIyBDT05GSUdfSU9TQ0hFRF9CRlEgaXMgbm90IHNldAojIGVu
ZCBvZiBJTyBTY2hlZHVsZXJzCgpDT05GSUdfVU5JTkxJTkVfU1BJTl9VTkxPQ0s9eQpDT05G
SUdfQVJDSF9TVVBQT1JUU19BVE9NSUNfUk1XPXkKQ09ORklHX01VVEVYX1NQSU5fT05fT1dO
RVI9eQpDT05GSUdfUldTRU1fU1BJTl9PTl9PV05FUj15CkNPTkZJR19MT0NLX1NQSU5fT05f
T1dORVI9eQpDT05GSUdfRlJFRVpFUj15CgojCiMgRXhlY3V0YWJsZSBmaWxlIGZvcm1hdHMK
IwpDT05GSUdfQklORk1UX0VMRj15CiMgQ09ORklHX0JJTkZNVF9FTEZfRkRQSUMgaXMgbm90
IHNldApDT05GSUdfRUxGQ09SRT15CkNPTkZJR19DT1JFX0RVTVBfREVGQVVMVF9FTEZfSEVB
REVSUz15CkNPTkZJR19CSU5GTVRfU0NSSVBUPXkKQ09ORklHX0FSQ0hfSEFTX0JJTkZNVF9G
TEFUPXkKIyBDT05GSUdfQklORk1UX0ZMQVQgaXMgbm90IHNldApDT05GSUdfQklORk1UX0ZM
QVRfQVJHVlBfRU5WUF9PTl9TVEFDSz15CkNPTkZJR19CSU5GTVRfTUlTQz15CkNPTkZJR19D
T1JFRFVNUD15CiMgZW5kIG9mIEV4ZWN1dGFibGUgZmlsZSBmb3JtYXRzCgojCiMgTWVtb3J5
IE1hbmFnZW1lbnQgb3B0aW9ucwojCkNPTkZJR19GTEFUTUVNPXkKQ09ORklHX0ZMQVRfTk9E
RV9NRU1fTUFQPXkKQ09ORklHX0FSQ0hfS0VFUF9NRU1CTE9DSz15CkNPTkZJR19NRU1PUllf
SVNPTEFUSU9OPXkKQ09ORklHX1NQTElUX1BUTE9DS19DUFVTPTQKQ09ORklHX0NPTVBBQ1RJ
T049eQpDT05GSUdfTUlHUkFUSU9OPXkKQ09ORklHX0NPTlRJR19BTExPQz15CkNPTkZJR19C
T1VOQ0U9eQojIENPTkZJR19LU00gaXMgbm90IHNldApDT05GSUdfREVGQVVMVF9NTUFQX01J
Tl9BRERSPTQwOTYKIyBDT05GSUdfQ0xFQU5DQUNIRSBpcyBub3Qgc2V0CiMgQ09ORklHX0ZS
T05UU1dBUCBpcyBub3Qgc2V0CkNPTkZJR19DTUE9eQojIENPTkZJR19DTUFfREVCVUcgaXMg
bm90IHNldAojIENPTkZJR19DTUFfREVCVUdGUyBpcyBub3Qgc2V0CkNPTkZJR19DTUFfQVJF
QVM9NwojIENPTkZJR19aUE9PTCBpcyBub3Qgc2V0CiMgQ09ORklHX1pCVUQgaXMgbm90IHNl
dAojIENPTkZJR19aU01BTExPQyBpcyBub3Qgc2V0CkNPTkZJR19HRU5FUklDX0VBUkxZX0lP
UkVNQVA9eQojIENPTkZJR19JRExFX1BBR0VfVFJBQ0tJTkcgaXMgbm90IHNldApDT05GSUdf
RlJBTUVfVkVDVE9SPXkKIyBDT05GSUdfUEVSQ1BVX1NUQVRTIGlzIG5vdCBzZXQKIyBDT05G
SUdfR1VQX0JFTkNITUFSSyBpcyBub3Qgc2V0CiMgZW5kIG9mIE1lbW9yeSBNYW5hZ2VtZW50
IG9wdGlvbnMKCkNPTkZJR19ORVQ9eQpDT05GSUdfTkVUX0lOR1JFU1M9eQpDT05GSUdfU0tC
X0VYVEVOU0lPTlM9eQoKIwojIE5ldHdvcmtpbmcgb3B0aW9ucwojCkNPTkZJR19QQUNLRVQ9
eQojIENPTkZJR19QQUNLRVRfRElBRyBpcyBub3Qgc2V0CkNPTkZJR19VTklYPXkKQ09ORklH
X1VOSVhfU0NNPXkKIyBDT05GSUdfVU5JWF9ESUFHIGlzIG5vdCBzZXQKIyBDT05GSUdfVExT
IGlzIG5vdCBzZXQKQ09ORklHX1hGUk09eQpDT05GSUdfWEZSTV9BTEdPPXkKQ09ORklHX1hG
Uk1fVVNFUj15CiMgQ09ORklHX1hGUk1fU1VCX1BPTElDWSBpcyBub3Qgc2V0CkNPTkZJR19Y
RlJNX01JR1JBVEU9eQojIENPTkZJR19YRlJNX1NUQVRJU1RJQ1MgaXMgbm90IHNldApDT05G
SUdfTkVUX0tFWT15CkNPTkZJR19ORVRfS0VZX01JR1JBVEU9eQpDT05GSUdfSU5FVD15CkNP
TkZJR19JUF9NVUxUSUNBU1Q9eQojIENPTkZJR19JUF9BRFZBTkNFRF9ST1VURVIgaXMgbm90
IHNldApDT05GSUdfSVBfUE5QPXkKQ09ORklHX0lQX1BOUF9ESENQPXkKQ09ORklHX0lQX1BO
UF9CT09UUD15CkNPTkZJR19JUF9QTlBfUkFSUD15CiMgQ09ORklHX05FVF9JUElQIGlzIG5v
dCBzZXQKIyBDT05GSUdfTkVUX0lQR1JFX0RFTVVYIGlzIG5vdCBzZXQKIyBDT05GSUdfSVBf
TVJPVVRFIGlzIG5vdCBzZXQKIyBDT05GSUdfU1lOX0NPT0tJRVMgaXMgbm90IHNldAojIENP
TkZJR19ORVRfSVBWVEkgaXMgbm90IHNldAojIENPTkZJR19ORVRfRk9VIGlzIG5vdCBzZXQK
IyBDT05GSUdfSU5FVF9BSCBpcyBub3Qgc2V0CiMgQ09ORklHX0lORVRfRVNQIGlzIG5vdCBz
ZXQKIyBDT05GSUdfSU5FVF9JUENPTVAgaXMgbm90IHNldApDT05GSUdfSU5FVF9ESUFHPXkK
Q09ORklHX0lORVRfVENQX0RJQUc9eQojIENPTkZJR19JTkVUX1VEUF9ESUFHIGlzIG5vdCBz
ZXQKIyBDT05GSUdfSU5FVF9SQVdfRElBRyBpcyBub3Qgc2V0CiMgQ09ORklHX0lORVRfRElB
R19ERVNUUk9ZIGlzIG5vdCBzZXQKIyBDT05GSUdfVENQX0NPTkdfQURWQU5DRUQgaXMgbm90
IHNldApDT05GSUdfVENQX0NPTkdfQ1VCSUM9eQpDT05GSUdfREVGQVVMVF9UQ1BfQ09ORz0i
Y3ViaWMiCiMgQ09ORklHX1RDUF9NRDVTSUcgaXMgbm90IHNldAojIENPTkZJR19JUFY2IGlz
IG5vdCBzZXQKIyBDT05GSUdfTkVUTEFCRUwgaXMgbm90IHNldAojIENPTkZJR19ORVRXT1JL
X1NFQ01BUksgaXMgbm90IHNldApDT05GSUdfTkVUX1BUUF9DTEFTU0lGWT15CiMgQ09ORklH
X05FVFdPUktfUEhZX1RJTUVTVEFNUElORyBpcyBub3Qgc2V0CkNPTkZJR19ORVRGSUxURVI9
eQpDT05GSUdfTkVURklMVEVSX0FEVkFOQ0VEPXkKCiMKIyBDb3JlIE5ldGZpbHRlciBDb25m
aWd1cmF0aW9uCiMKQ09ORklHX05FVEZJTFRFUl9JTkdSRVNTPXkKIyBDT05GSUdfTkVURklM
VEVSX05FVExJTktfQUNDVCBpcyBub3Qgc2V0CiMgQ09ORklHX05FVEZJTFRFUl9ORVRMSU5L
X1FVRVVFIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVURklMVEVSX05FVExJTktfTE9HIGlzIG5v
dCBzZXQKIyBDT05GSUdfTkVURklMVEVSX05FVExJTktfT1NGIGlzIG5vdCBzZXQKIyBDT05G
SUdfTkZfQ09OTlRSQUNLIGlzIG5vdCBzZXQKIyBDT05GSUdfTkZfTE9HX05FVERFViBpcyBu
b3Qgc2V0CiMgQ09ORklHX05GX1RBQkxFUyBpcyBub3Qgc2V0CiMgQ09ORklHX05FVEZJTFRF
Ul9YVEFCTEVTIGlzIG5vdCBzZXQKIyBlbmQgb2YgQ29yZSBOZXRmaWx0ZXIgQ29uZmlndXJh
dGlvbgoKIyBDT05GSUdfSVBfU0VUIGlzIG5vdCBzZXQKIyBDT05GSUdfSVBfVlMgaXMgbm90
IHNldAoKIwojIElQOiBOZXRmaWx0ZXIgQ29uZmlndXJhdGlvbgojCiMgQ09ORklHX05GX1NP
Q0tFVF9JUFY0IGlzIG5vdCBzZXQKIyBDT05GSUdfTkZfVFBST1hZX0lQVjQgaXMgbm90IHNl
dAojIENPTkZJR19ORl9EVVBfSVBWNCBpcyBub3Qgc2V0CiMgQ09ORklHX05GX0xPR19BUlAg
aXMgbm90IHNldAojIENPTkZJR19ORl9MT0dfSVBWNCBpcyBub3Qgc2V0CiMgQ09ORklHX05G
X1JFSkVDVF9JUFY0IGlzIG5vdCBzZXQKIyBDT05GSUdfSVBfTkZfSVBUQUJMRVMgaXMgbm90
IHNldAojIENPTkZJR19JUF9ORl9BUlBUQUJMRVMgaXMgbm90IHNldAojIGVuZCBvZiBJUDog
TmV0ZmlsdGVyIENvbmZpZ3VyYXRpb24KCiMgQ09ORklHX0JQRklMVEVSIGlzIG5vdCBzZXQK
IyBDT05GSUdfSVBfRENDUCBpcyBub3Qgc2V0CiMgQ09ORklHX0lQX1NDVFAgaXMgbm90IHNl
dAojIENPTkZJR19SRFMgaXMgbm90IHNldAojIENPTkZJR19USVBDIGlzIG5vdCBzZXQKIyBD
T05GSUdfQVRNIGlzIG5vdCBzZXQKIyBDT05GSUdfTDJUUCBpcyBub3Qgc2V0CiMgQ09ORklH
X0JSSURHRSBpcyBub3Qgc2V0CkNPTkZJR19IQVZFX05FVF9EU0E9eQojIENPTkZJR19ORVRf
RFNBIGlzIG5vdCBzZXQKIyBDT05GSUdfVkxBTl84MDIxUSBpcyBub3Qgc2V0CiMgQ09ORklH
X0RFQ05FVCBpcyBub3Qgc2V0CiMgQ09ORklHX0xMQzIgaXMgbm90IHNldAojIENPTkZJR19B
VEFMSyBpcyBub3Qgc2V0CiMgQ09ORklHX1gyNSBpcyBub3Qgc2V0CiMgQ09ORklHX0xBUEIg
aXMgbm90IHNldAojIENPTkZJR19QSE9ORVQgaXMgbm90IHNldAojIENPTkZJR19JRUVFODAy
MTU0IGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX1NDSEVEIGlzIG5vdCBzZXQKIyBDT05GSUdf
RENCIGlzIG5vdCBzZXQKQ09ORklHX0ROU19SRVNPTFZFUj15CiMgQ09ORklHX0JBVE1BTl9B
RFYgaXMgbm90IHNldAojIENPTkZJR19PUEVOVlNXSVRDSCBpcyBub3Qgc2V0CiMgQ09ORklH
X1ZTT0NLRVRTIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUTElOS19ESUFHIGlzIG5vdCBzZXQK
IyBDT05GSUdfTVBMUyBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9OU0ggaXMgbm90IHNldAoj
IENPTkZJR19IU1IgaXMgbm90IHNldAojIENPTkZJR19ORVRfU1dJVENIREVWIGlzIG5vdCBz
ZXQKIyBDT05GSUdfTkVUX0wzX01BU1RFUl9ERVYgaXMgbm90IHNldAojIENPTkZJR19ORVRf
TkNTSSBpcyBub3Qgc2V0CkNPTkZJR19SUFM9eQpDT05GSUdfUkZTX0FDQ0VMPXkKQ09ORklH
X1hQUz15CiMgQ09ORklHX0NHUk9VUF9ORVRfUFJJTyBpcyBub3Qgc2V0CiMgQ09ORklHX0NH
Uk9VUF9ORVRfQ0xBU1NJRCBpcyBub3Qgc2V0CkNPTkZJR19ORVRfUlhfQlVTWV9QT0xMPXkK
Q09ORklHX0JRTD15CiMgQ09ORklHX0JQRl9KSVQgaXMgbm90IHNldApDT05GSUdfTkVUX0ZM
T1dfTElNSVQ9eQoKIwojIE5ldHdvcmsgdGVzdGluZwojCiMgQ09ORklHX05FVF9QS1RHRU4g
aXMgbm90IHNldAojIENPTkZJR19ORVRfRFJPUF9NT05JVE9SIGlzIG5vdCBzZXQKIyBlbmQg
b2YgTmV0d29yayB0ZXN0aW5nCiMgZW5kIG9mIE5ldHdvcmtpbmcgb3B0aW9ucwoKIyBDT05G
SUdfSEFNUkFESU8gaXMgbm90IHNldAojIENPTkZJR19DQU4gaXMgbm90IHNldAojIENPTkZJ
R19CVCBpcyBub3Qgc2V0CiMgQ09ORklHX0FGX1JYUlBDIGlzIG5vdCBzZXQKIyBDT05GSUdf
QUZfS0NNIGlzIG5vdCBzZXQKIyBDT05GSUdfV0lSRUxFU1MgaXMgbm90IHNldAojIENPTkZJ
R19XSU1BWCBpcyBub3Qgc2V0CiMgQ09ORklHX1JGS0lMTCBpcyBub3Qgc2V0CiMgQ09ORklH
X05FVF85UCBpcyBub3Qgc2V0CiMgQ09ORklHX0NBSUYgaXMgbm90IHNldAojIENPTkZJR19D
RVBIX0xJQiBpcyBub3Qgc2V0CiMgQ09ORklHX05GQyBpcyBub3Qgc2V0CiMgQ09ORklHX1BT
QU1QTEUgaXMgbm90IHNldAojIENPTkZJR19ORVRfSUZFIGlzIG5vdCBzZXQKIyBDT05GSUdf
TFdUVU5ORUwgaXMgbm90IHNldApDT05GSUdfR1JPX0NFTExTPXkKQ09ORklHX1BBR0VfUE9P
TD15CiMgQ09ORklHX0ZBSUxPVkVSIGlzIG5vdCBzZXQKQ09ORklHX0hBVkVfRUJQRl9KSVQ9
eQoKIwojIERldmljZSBEcml2ZXJzCiMKQ09ORklHX0hBVkVfUENJPXkKQ09ORklHX1BDST15
CkNPTkZJR19QQ0lfRE9NQUlOUz15CkNPTkZJR19QQ0lfRE9NQUlOU19HRU5FUklDPXkKQ09O
RklHX1BDSV9TWVNDQUxMPXkKIyBDT05GSUdfUENJRVBPUlRCVVMgaXMgbm90IHNldApDT05G
SUdfUENJX01TST15CkNPTkZJR19QQ0lfTVNJX0lSUV9ET01BSU49eQpDT05GSUdfUENJX1FV
SVJLUz15CiMgQ09ORklHX1BDSV9ERUJVRyBpcyBub3Qgc2V0CiMgQ09ORklHX1BDSV9TVFVC
IGlzIG5vdCBzZXQKIyBDT05GSUdfUENJX0lPViBpcyBub3Qgc2V0CiMgQ09ORklHX1BDSV9Q
UkkgaXMgbm90IHNldAojIENPTkZJR19QQ0lfUEFTSUQgaXMgbm90IHNldAojIENPTkZJR19I
T1RQTFVHX1BDSSBpcyBub3Qgc2V0CgojCiMgUENJIGNvbnRyb2xsZXIgZHJpdmVycwojCgoj
CiMgQ2FkZW5jZSBQQ0llIGNvbnRyb2xsZXJzIHN1cHBvcnQKIwojIENPTkZJR19QQ0lFX0NB
REVOQ0VfSE9TVCBpcyBub3Qgc2V0CiMgQ09ORklHX1BDSUVfQ0FERU5DRV9FUCBpcyBub3Qg
c2V0CiMgZW5kIG9mIENhZGVuY2UgUENJZSBjb250cm9sbGVycyBzdXBwb3J0CgojIENPTkZJ
R19QQ0lfRlRQQ0kxMDAgaXMgbm90IHNldAojIENPTkZJR19QQ0lfSE9TVF9HRU5FUklDIGlz
IG5vdCBzZXQKIyBDT05GSUdfUENJRV9YSUxJTlggaXMgbm90IHNldAojIENPTkZJR19QQ0lf
VjNfU0VNSSBpcyBub3Qgc2V0CiMgQ09ORklHX1BDSUVfQUxURVJBIGlzIG5vdCBzZXQKCiMK
IyBEZXNpZ25XYXJlIFBDSSBDb3JlIFN1cHBvcnQKIwpDT05GSUdfUENJRV9EVz15CkNPTkZJ
R19QQ0lFX0RXX0hPU1Q9eQpDT05GSUdfUENJRV9EV19FUD15CkNPTkZJR19QQ0lfRFJBN1hY
PXkKQ09ORklHX1BDSV9EUkE3WFhfSE9TVD15CkNPTkZJR19QQ0lfRFJBN1hYX0VQPXkKIyBD
T05GSUdfUENJRV9EV19QTEFUX0hPU1QgaXMgbm90IHNldAojIENPTkZJR19QQ0lFX0RXX1BM
QVRfRVAgaXMgbm90IHNldAojIENPTkZJR19QQ0lfTEFZRVJTQ0FQRSBpcyBub3Qgc2V0CiMg
Q09ORklHX1BDSV9NRVNPTiBpcyBub3Qgc2V0CiMgZW5kIG9mIERlc2lnbldhcmUgUENJIENv
cmUgU3VwcG9ydAojIGVuZCBvZiBQQ0kgY29udHJvbGxlciBkcml2ZXJzCgojCiMgUENJIEVu
ZHBvaW50CiMKQ09ORklHX1BDSV9FTkRQT0lOVD15CkNPTkZJR19QQ0lfRU5EUE9JTlRfQ09O
RklHRlM9eQojIENPTkZJR19QQ0lfRVBGX1RFU1QgaXMgbm90IHNldAojIGVuZCBvZiBQQ0kg
RW5kcG9pbnQKCiMKIyBQQ0kgc3dpdGNoIGNvbnRyb2xsZXIgZHJpdmVycwojCiMgQ09ORklH
X1BDSV9TV19TV0lUQ0hURUMgaXMgbm90IHNldAojIGVuZCBvZiBQQ0kgc3dpdGNoIGNvbnRy
b2xsZXIgZHJpdmVycwoKIyBDT05GSUdfUENDQVJEIGlzIG5vdCBzZXQKIyBDT05GSUdfUkFQ
SURJTyBpcyBub3Qgc2V0CgojCiMgR2VuZXJpYyBEcml2ZXIgT3B0aW9ucwojCiMgQ09ORklH
X1VFVkVOVF9IRUxQRVIgaXMgbm90IHNldApDT05GSUdfREVWVE1QRlM9eQpDT05GSUdfREVW
VE1QRlNfTU9VTlQ9eQpDT05GSUdfU1RBTkRBTE9ORT15CkNPTkZJR19QUkVWRU5UX0ZJUk1X
QVJFX0JVSUxEPXkKCiMKIyBGaXJtd2FyZSBsb2FkZXIKIwpDT05GSUdfRldfTE9BREVSPXkK
Q09ORklHX0VYVFJBX0ZJUk1XQVJFPSIiCiMgQ09ORklHX0ZXX0xPQURFUl9VU0VSX0hFTFBF
UiBpcyBub3Qgc2V0CiMgQ09ORklHX0ZXX0xPQURFUl9DT01QUkVTUyBpcyBub3Qgc2V0CiMg
ZW5kIG9mIEZpcm13YXJlIGxvYWRlcgoKQ09ORklHX0FMTE9XX0RFVl9DT1JFRFVNUD15CiMg
Q09ORklHX0RFQlVHX0RSSVZFUiBpcyBub3Qgc2V0CiMgQ09ORklHX0RFQlVHX0RFVlJFUyBp
cyBub3Qgc2V0CiMgQ09ORklHX0RFQlVHX1RFU1RfRFJJVkVSX1JFTU9WRSBpcyBub3Qgc2V0
CiMgQ09ORklHX1RFU1RfQVNZTkNfRFJJVkVSX1BST0JFIGlzIG5vdCBzZXQKQ09ORklHX0dF
TkVSSUNfQ1BVX0FVVE9QUk9CRT15CkNPTkZJR19TT0NfQlVTPXkKQ09ORklHX1JFR01BUD15
CkNPTkZJR19SRUdNQVBfSTJDPXkKQ09ORklHX1JFR01BUF9TUEk9eQpDT05GSUdfUkVHTUFQ
X01NSU89eQpDT05GSUdfUkVHTUFQX0lSUT15CkNPTkZJR19ETUFfU0hBUkVEX0JVRkZFUj15
CiMgQ09ORklHX0RNQV9GRU5DRV9UUkFDRSBpcyBub3Qgc2V0CkNPTkZJR19HRU5FUklDX0FS
Q0hfVE9QT0xPR1k9eQojIGVuZCBvZiBHZW5lcmljIERyaXZlciBPcHRpb25zCgojCiMgQnVz
IGRldmljZXMKIwojIENPTkZJR19CUkNNU1RCX0dJU0JfQVJCIGlzIG5vdCBzZXQKQ09ORklH
X09NQVBfSU5URVJDT05ORUNUPXkKQ09ORklHX09NQVBfT0NQMlNDUD15CiMgQ09ORklHX1NJ
TVBMRV9QTV9CVVMgaXMgbm90IHNldApDT05GSUdfVElfU1lTQz15CiMgQ09ORklHX1ZFWFBS
RVNTX0NPTkZJRyBpcyBub3Qgc2V0CiMgZW5kIG9mIEJ1cyBkZXZpY2VzCgojIENPTkZJR19D
T05ORUNUT1IgaXMgbm90IHNldAojIENPTkZJR19HTlNTIGlzIG5vdCBzZXQKQ09ORklHX01U
RD15CiMgQ09ORklHX01URF9URVNUUyBpcyBub3Qgc2V0CkNPTkZJR19NVERfQ01ETElORV9Q
QVJUUz15CkNPTkZJR19NVERfT0ZfUEFSVFM9eQojIENPTkZJR19NVERfQVI3X1BBUlRTIGlz
IG5vdCBzZXQKCiMKIyBQYXJ0aXRpb24gcGFyc2VycwojCiMgQ09ORklHX01URF9BRlNfUEFS
VFMgaXMgbm90IHNldAojIENPTkZJR19NVERfUkVEQk9PVF9QQVJUUyBpcyBub3Qgc2V0CiMg
ZW5kIG9mIFBhcnRpdGlvbiBwYXJzZXJzCgojCiMgVXNlciBNb2R1bGVzIEFuZCBUcmFuc2xh
dGlvbiBMYXllcnMKIwpDT05GSUdfTVREX0JMS0RFVlM9eQpDT05GSUdfTVREX0JMT0NLPXkK
IyBDT05GSUdfRlRMIGlzIG5vdCBzZXQKIyBDT05GSUdfTkZUTCBpcyBub3Qgc2V0CiMgQ09O
RklHX0lORlRMIGlzIG5vdCBzZXQKIyBDT05GSUdfUkZEX0ZUTCBpcyBub3Qgc2V0CiMgQ09O
RklHX1NTRkRDIGlzIG5vdCBzZXQKIyBDT05GSUdfU01fRlRMIGlzIG5vdCBzZXQKQ09ORklH
X01URF9PT1BTPXkKIyBDT05GSUdfTVREX1NXQVAgaXMgbm90IHNldAojIENPTkZJR19NVERf
UEFSVElUSU9ORURfTUFTVEVSIGlzIG5vdCBzZXQKCiMKIyBSQU0vUk9NL0ZsYXNoIGNoaXAg
ZHJpdmVycwojCkNPTkZJR19NVERfQ0ZJPXkKIyBDT05GSUdfTVREX0pFREVDUFJPQkUgaXMg
bm90IHNldApDT05GSUdfTVREX0dFTl9QUk9CRT15CiMgQ09ORklHX01URF9DRklfQURWX09Q
VElPTlMgaXMgbm90IHNldApDT05GSUdfTVREX01BUF9CQU5LX1dJRFRIXzE9eQpDT05GSUdf
TVREX01BUF9CQU5LX1dJRFRIXzI9eQpDT05GSUdfTVREX01BUF9CQU5LX1dJRFRIXzQ9eQpD
T05GSUdfTVREX0NGSV9JMT15CkNPTkZJR19NVERfQ0ZJX0kyPXkKQ09ORklHX01URF9DRklf
SU5URUxFWFQ9eQojIENPTkZJR19NVERfQ0ZJX0FNRFNURCBpcyBub3Qgc2V0CiMgQ09ORklH
X01URF9DRklfU1RBQSBpcyBub3Qgc2V0CkNPTkZJR19NVERfQ0ZJX1VUSUw9eQojIENPTkZJ
R19NVERfUkFNIGlzIG5vdCBzZXQKIyBDT05GSUdfTVREX1JPTSBpcyBub3Qgc2V0CiMgQ09O
RklHX01URF9BQlNFTlQgaXMgbm90IHNldAojIGVuZCBvZiBSQU0vUk9NL0ZsYXNoIGNoaXAg
ZHJpdmVycwoKIwojIE1hcHBpbmcgZHJpdmVycyBmb3IgY2hpcCBhY2Nlc3MKIwojIENPTkZJ
R19NVERfQ09NUExFWF9NQVBQSU5HUyBpcyBub3Qgc2V0CkNPTkZJR19NVERfUEhZU01BUD15
CiMgQ09ORklHX01URF9QSFlTTUFQX0NPTVBBVCBpcyBub3Qgc2V0CkNPTkZJR19NVERfUEhZ
U01BUF9PRj15CiMgQ09ORklHX01URF9QSFlTTUFQX1ZFUlNBVElMRSBpcyBub3Qgc2V0CiMg
Q09ORklHX01URF9QSFlTTUFQX0dFTUlOSSBpcyBub3Qgc2V0CiMgQ09ORklHX01URF9JTlRF
TF9WUl9OT1IgaXMgbm90IHNldAojIENPTkZJR19NVERfUExBVFJBTSBpcyBub3Qgc2V0CiMg
ZW5kIG9mIE1hcHBpbmcgZHJpdmVycyBmb3IgY2hpcCBhY2Nlc3MKCiMKIyBTZWxmLWNvbnRh
aW5lZCBNVEQgZGV2aWNlIGRyaXZlcnMKIwojIENPTkZJR19NVERfUE1DNTUxIGlzIG5vdCBz
ZXQKIyBDT05GSUdfTVREX0RBVEFGTEFTSCBpcyBub3Qgc2V0CiMgQ09ORklHX01URF9NQ0hQ
MjNLMjU2IGlzIG5vdCBzZXQKIyBDT05GSUdfTVREX1NTVDI1TCBpcyBub3Qgc2V0CiMgQ09O
RklHX01URF9TTFJBTSBpcyBub3Qgc2V0CiMgQ09ORklHX01URF9QSFJBTSBpcyBub3Qgc2V0
CiMgQ09ORklHX01URF9NVERSQU0gaXMgbm90IHNldAojIENPTkZJR19NVERfQkxPQ0syTVRE
IGlzIG5vdCBzZXQKCiMKIyBEaXNrLU9uLUNoaXAgRGV2aWNlIERyaXZlcnMKIwojIENPTkZJ
R19NVERfRE9DRzMgaXMgbm90IHNldAojIGVuZCBvZiBTZWxmLWNvbnRhaW5lZCBNVEQgZGV2
aWNlIGRyaXZlcnMKCkNPTkZJR19NVERfTkFORF9DT1JFPXkKQ09ORklHX01URF9PTkVOQU5E
PXkKQ09ORklHX01URF9PTkVOQU5EX1ZFUklGWV9XUklURT15CiMgQ09ORklHX01URF9PTkVO
QU5EX0dFTkVSSUMgaXMgbm90IHNldApDT05GSUdfTVREX09ORU5BTkRfT01BUDI9eQojIENP
TkZJR19NVERfT05FTkFORF9PVFAgaXMgbm90IHNldAojIENPTkZJR19NVERfT05FTkFORF8y
WF9QUk9HUkFNIGlzIG5vdCBzZXQKQ09ORklHX01URF9OQU5EX0VDQ19TV19IQU1NSU5HPXkK
IyBDT05GSUdfTVREX05BTkRfRUNDX1NXX0hBTU1JTkdfU01DIGlzIG5vdCBzZXQKQ09ORklH
X01URF9SQVdfTkFORD15CkNPTkZJR19NVERfTkFORF9FQ0NfU1dfQkNIPXkKCiMKIyBSYXcv
cGFyYWxsZWwgTkFORCBmbGFzaCBjb250cm9sbGVycwojCiMgQ09ORklHX01URF9OQU5EX0RF
TkFMSV9QQ0kgaXMgbm90IHNldAojIENPTkZJR19NVERfTkFORF9ERU5BTElfRFQgaXMgbm90
IHNldApDT05GSUdfTVREX05BTkRfT01BUDI9eQpDT05GSUdfTVREX05BTkRfT01BUF9CQ0g9
eQpDT05GSUdfTVREX05BTkRfT01BUF9CQ0hfQlVJTEQ9eQojIENPTkZJR19NVERfTkFORF9D
QUZFIGlzIG5vdCBzZXQKIyBDT05GSUdfTVREX05BTkRfQlJDTU5BTkQgaXMgbm90IHNldAoj
IENPTkZJR19NVERfTkFORF9HUElPIGlzIG5vdCBzZXQKIyBDT05GSUdfTVREX05BTkRfUExB
VEZPUk0gaXMgbm90IHNldAoKIwojIE1pc2MKIwojIENPTkZJR19NVERfTkFORF9OQU5EU0lN
IGlzIG5vdCBzZXQKIyBDT05GSUdfTVREX05BTkRfUklDT0ggaXMgbm90IHNldAojIENPTkZJ
R19NVERfTkFORF9ESVNLT05DSElQIGlzIG5vdCBzZXQKIyBDT05GSUdfTVREX1NQSV9OQU5E
IGlzIG5vdCBzZXQKCiMKIyBMUEREUiAmIExQRERSMiBQQ00gbWVtb3J5IGRyaXZlcnMKIwoj
IENPTkZJR19NVERfTFBERFIgaXMgbm90IHNldAojIENPTkZJR19NVERfTFBERFIyX05WTSBp
cyBub3Qgc2V0CiMgZW5kIG9mIExQRERSICYgTFBERFIyIFBDTSBtZW1vcnkgZHJpdmVycwoK
IyBDT05GSUdfTVREX1NQSV9OT1IgaXMgbm90IHNldApDT05GSUdfTVREX1VCST15CkNPTkZJ
R19NVERfVUJJX1dMX1RIUkVTSE9MRD00MDk2CkNPTkZJR19NVERfVUJJX0JFQl9MSU1JVD0y
MAojIENPTkZJR19NVERfVUJJX0ZBU1RNQVAgaXMgbm90IHNldAojIENPTkZJR19NVERfVUJJ
X0dMVUVCSSBpcyBub3Qgc2V0CiMgQ09ORklHX01URF9VQklfQkxPQ0sgaXMgbm90IHNldAoj
IENPTkZJR19NVERfSFlQRVJCVVMgaXMgbm90IHNldApDT05GSUdfRFRDPXkKQ09ORklHX09G
PXkKIyBDT05GSUdfT0ZfVU5JVFRFU1QgaXMgbm90IHNldApDT05GSUdfT0ZfRkxBVFRSRUU9
eQpDT05GSUdfT0ZfRUFSTFlfRkxBVFRSRUU9eQpDT05GSUdfT0ZfS09CSj15CkNPTkZJR19P
Rl9BRERSRVNTPXkKQ09ORklHX09GX0lSUT15CkNPTkZJR19PRl9ORVQ9eQpDT05GSUdfT0Zf
TURJTz15CkNPTkZJR19PRl9SRVNFUlZFRF9NRU09eQojIENPTkZJR19PRl9PVkVSTEFZIGlz
IG5vdCBzZXQKQ09ORklHX0FSQ0hfTUlHSFRfSEFWRV9QQ19QQVJQT1JUPXkKIyBDT05GSUdf
UEFSUE9SVCBpcyBub3Qgc2V0CkNPTkZJR19CTEtfREVWPXkKIyBDT05GSUdfQkxLX0RFVl9O
VUxMX0JMSyBpcyBub3Qgc2V0CiMgQ09ORklHX0JMS19ERVZfUENJRVNTRF9NVElQMzJYWCBp
cyBub3Qgc2V0CiMgQ09ORklHX0JMS19ERVZfVU1FTSBpcyBub3Qgc2V0CkNPTkZJR19CTEtf
REVWX0xPT1A9eQpDT05GSUdfQkxLX0RFVl9MT09QX01JTl9DT1VOVD04CiMgQ09ORklHX0JM
S19ERVZfQ1JZUFRPTE9PUCBpcyBub3Qgc2V0CiMgQ09ORklHX0JMS19ERVZfRFJCRCBpcyBu
b3Qgc2V0CiMgQ09ORklHX0JMS19ERVZfTkJEIGlzIG5vdCBzZXQKIyBDT05GSUdfQkxLX0RF
Vl9TWDggaXMgbm90IHNldApDT05GSUdfQkxLX0RFVl9SQU09eQpDT05GSUdfQkxLX0RFVl9S
QU1fQ09VTlQ9MTYKQ09ORklHX0JMS19ERVZfUkFNX1NJWkU9MTYzODQKIyBDT05GSUdfQ0RS
T01fUEtUQ0RWRCBpcyBub3Qgc2V0CiMgQ09ORklHX0FUQV9PVkVSX0VUSCBpcyBub3Qgc2V0
CiMgQ09ORklHX0JMS19ERVZfUkJEIGlzIG5vdCBzZXQKIyBDT05GSUdfQkxLX0RFVl9SU1hY
IGlzIG5vdCBzZXQKCiMKIyBOVk1FIFN1cHBvcnQKIwojIENPTkZJR19CTEtfREVWX05WTUUg
aXMgbm90IHNldAojIENPTkZJR19OVk1FX0ZDIGlzIG5vdCBzZXQKIyBDT05GSUdfTlZNRV9U
QVJHRVQgaXMgbm90IHNldAojIGVuZCBvZiBOVk1FIFN1cHBvcnQKCiMKIyBNaXNjIGRldmlj
ZXMKIwojIENPTkZJR19BRDUyNVhfRFBPVCBpcyBub3Qgc2V0CiMgQ09ORklHX0RVTU1ZX0lS
USBpcyBub3Qgc2V0CiMgQ09ORklHX1BIQU5UT00gaXMgbm90IHNldAojIENPTkZJR19TR0lf
SU9DNCBpcyBub3Qgc2V0CiMgQ09ORklHX1RJRk1fQ09SRSBpcyBub3Qgc2V0CiMgQ09ORklH
X0lDUzkzMlM0MDEgaXMgbm90IHNldAojIENPTkZJR19FTkNMT1NVUkVfU0VSVklDRVMgaXMg
bm90IHNldAojIENPTkZJR19IUF9JTE8gaXMgbm90IHNldAojIENPTkZJR19BUERTOTgwMkFM
UyBpcyBub3Qgc2V0CiMgQ09ORklHX0lTTDI5MDAzIGlzIG5vdCBzZXQKIyBDT05GSUdfSVNM
MjkwMjAgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX1RTTDI1NTAgaXMgbm90IHNldAoj
IENPTkZJR19TRU5TT1JTX0JIMTc3MCBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfQVBE
Uzk5MFggaXMgbm90IHNldAojIENPTkZJR19ITUM2MzUyIGlzIG5vdCBzZXQKIyBDT05GSUdf
RFMxNjgyIGlzIG5vdCBzZXQKIyBDT05GSUdfTEFUVElDRV9FQ1AzX0NPTkZJRyBpcyBub3Qg
c2V0CkNPTkZJR19TUkFNPXkKQ09ORklHX1NSQU1fRVhFQz15CiMgQ09ORklHX1BDSV9FTkRQ
T0lOVF9URVNUIGlzIG5vdCBzZXQKIyBDT05GSUdfWElMSU5YX1NERkVDIGlzIG5vdCBzZXQK
IyBDT05GSUdfUFZQQU5JQyBpcyBub3Qgc2V0CiMgQ09ORklHX0MyUE9SVCBpcyBub3Qgc2V0
CgojCiMgRUVQUk9NIHN1cHBvcnQKIwojIENPTkZJR19FRVBST01fQVQyNCBpcyBub3Qgc2V0
CiMgQ09ORklHX0VFUFJPTV9BVDI1IGlzIG5vdCBzZXQKIyBDT05GSUdfRUVQUk9NX0xFR0FD
WSBpcyBub3Qgc2V0CiMgQ09ORklHX0VFUFJPTV9NQVg2ODc1IGlzIG5vdCBzZXQKQ09ORklH
X0VFUFJPTV85M0NYNj15CiMgQ09ORklHX0VFUFJPTV85M1hYNDYgaXMgbm90IHNldAojIENP
TkZJR19FRVBST01fSURUXzg5SFBFU1ggaXMgbm90IHNldAojIENPTkZJR19FRVBST01fRUUx
MDA0IGlzIG5vdCBzZXQKIyBlbmQgb2YgRUVQUk9NIHN1cHBvcnQKCiMgQ09ORklHX0NCNzEw
X0NPUkUgaXMgbm90IHNldAoKIwojIFRleGFzIEluc3RydW1lbnRzIHNoYXJlZCB0cmFuc3Bv
cnQgbGluZSBkaXNjaXBsaW5lCiMKIyBDT05GSUdfVElfU1QgaXMgbm90IHNldAojIGVuZCBv
ZiBUZXhhcyBJbnN0cnVtZW50cyBzaGFyZWQgdHJhbnNwb3J0IGxpbmUgZGlzY2lwbGluZQoK
IyBDT05GSUdfU0VOU09SU19MSVMzX1NQSSBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNf
TElTM19JMkMgaXMgbm90IHNldAojIENPTkZJR19BTFRFUkFfU1RBUEwgaXMgbm90IHNldAoK
IwojIEludGVsIE1JQyAmIHJlbGF0ZWQgc3VwcG9ydAojCgojCiMgSW50ZWwgTUlDIEJ1cyBE
cml2ZXIKIwoKIwojIFNDSUYgQnVzIERyaXZlcgojCgojCiMgVk9QIEJ1cyBEcml2ZXIKIwoj
IENPTkZJR19WT1BfQlVTIGlzIG5vdCBzZXQKCiMKIyBJbnRlbCBNSUMgSG9zdCBEcml2ZXIK
IwoKIwojIEludGVsIE1JQyBDYXJkIERyaXZlcgojCgojCiMgU0NJRiBEcml2ZXIKIwoKIwoj
IEludGVsIE1JQyBDb3Byb2Nlc3NvciBTdGF0ZSBNYW5hZ2VtZW50IChDT1NNKSBEcml2ZXJz
CiMKCiMKIyBWT1AgRHJpdmVyCiMKIyBlbmQgb2YgSW50ZWwgTUlDICYgcmVsYXRlZCBzdXBw
b3J0CgojIENPTkZJR19FQ0hPIGlzIG5vdCBzZXQKIyBDT05GSUdfTUlTQ19BTENPUl9QQ0kg
aXMgbm90IHNldAojIENPTkZJR19NSVNDX1JUU1hfUENJIGlzIG5vdCBzZXQKIyBDT05GSUdf
TUlTQ19SVFNYX1VTQiBpcyBub3Qgc2V0CiMgQ09ORklHX0hBQkFOQV9BSSBpcyBub3Qgc2V0
CiMgZW5kIG9mIE1pc2MgZGV2aWNlcwoKQ09ORklHX0hBVkVfSURFPXkKIyBDT05GSUdfSURF
IGlzIG5vdCBzZXQKCiMKIyBTQ1NJIGRldmljZSBzdXBwb3J0CiMKQ09ORklHX1NDU0lfTU9E
PXkKIyBDT05GSUdfUkFJRF9BVFRSUyBpcyBub3Qgc2V0CkNPTkZJR19TQ1NJPXkKQ09ORklH
X1NDU0lfRE1BPXkKQ09ORklHX1NDU0lfUFJPQ19GUz15CgojCiMgU0NTSSBzdXBwb3J0IHR5
cGUgKGRpc2ssIHRhcGUsIENELVJPTSkKIwpDT05GSUdfQkxLX0RFVl9TRD15CiMgQ09ORklH
X0NIUl9ERVZfU1QgaXMgbm90IHNldAojIENPTkZJR19CTEtfREVWX1NSIGlzIG5vdCBzZXQK
IyBDT05GSUdfQ0hSX0RFVl9TRyBpcyBub3Qgc2V0CiMgQ09ORklHX0NIUl9ERVZfU0NIIGlz
IG5vdCBzZXQKIyBDT05GSUdfU0NTSV9DT05TVEFOVFMgaXMgbm90IHNldAojIENPTkZJR19T
Q1NJX0xPR0dJTkcgaXMgbm90IHNldApDT05GSUdfU0NTSV9TQ0FOX0FTWU5DPXkKCiMKIyBT
Q1NJIFRyYW5zcG9ydHMKIwojIENPTkZJR19TQ1NJX1NQSV9BVFRSUyBpcyBub3Qgc2V0CiMg
Q09ORklHX1NDU0lfRkNfQVRUUlMgaXMgbm90IHNldAojIENPTkZJR19TQ1NJX0lTQ1NJX0FU
VFJTIGlzIG5vdCBzZXQKIyBDT05GSUdfU0NTSV9TQVNfQVRUUlMgaXMgbm90IHNldAojIENP
TkZJR19TQ1NJX1NBU19MSUJTQVMgaXMgbm90IHNldAojIENPTkZJR19TQ1NJX1NSUF9BVFRS
UyBpcyBub3Qgc2V0CiMgZW5kIG9mIFNDU0kgVHJhbnNwb3J0cwoKQ09ORklHX1NDU0lfTE9X
TEVWRUw9eQojIENPTkZJR19JU0NTSV9UQ1AgaXMgbm90IHNldAojIENPTkZJR19JU0NTSV9C
T09UX1NZU0ZTIGlzIG5vdCBzZXQKIyBDT05GSUdfU0NTSV9DWEdCM19JU0NTSSBpcyBub3Qg
c2V0CiMgQ09ORklHX1NDU0lfQ1hHQjRfSVNDU0kgaXMgbm90IHNldAojIENPTkZJR19TQ1NJ
X0JOWDJfSVNDU0kgaXMgbm90IHNldAojIENPTkZJR19CRTJJU0NTSSBpcyBub3Qgc2V0CiMg
Q09ORklHX0JMS19ERVZfM1dfWFhYWF9SQUlEIGlzIG5vdCBzZXQKIyBDT05GSUdfU0NTSV9I
UFNBIGlzIG5vdCBzZXQKIyBDT05GSUdfU0NTSV8zV185WFhYIGlzIG5vdCBzZXQKIyBDT05G
SUdfU0NTSV8zV19TQVMgaXMgbm90IHNldAojIENPTkZJR19TQ1NJX0FDQVJEIGlzIG5vdCBz
ZXQKIyBDT05GSUdfU0NTSV9BQUNSQUlEIGlzIG5vdCBzZXQKIyBDT05GSUdfU0NTSV9BSUM3
WFhYIGlzIG5vdCBzZXQKIyBDT05GSUdfU0NTSV9BSUM3OVhYIGlzIG5vdCBzZXQKIyBDT05G
SUdfU0NTSV9BSUM5NFhYIGlzIG5vdCBzZXQKIyBDT05GSUdfU0NTSV9NVlNBUyBpcyBub3Qg
c2V0CiMgQ09ORklHX1NDU0lfTVZVTUkgaXMgbm90IHNldAojIENPTkZJR19TQ1NJX0FEVkFO
U1lTIGlzIG5vdCBzZXQKIyBDT05GSUdfU0NTSV9BUkNNU1IgaXMgbm90IHNldAojIENPTkZJ
R19TQ1NJX0VTQVMyUiBpcyBub3Qgc2V0CiMgQ09ORklHX01FR0FSQUlEX05FV0dFTiBpcyBu
b3Qgc2V0CiMgQ09ORklHX01FR0FSQUlEX0xFR0FDWSBpcyBub3Qgc2V0CiMgQ09ORklHX01F
R0FSQUlEX1NBUyBpcyBub3Qgc2V0CiMgQ09ORklHX1NDU0lfTVBUM1NBUyBpcyBub3Qgc2V0
CiMgQ09ORklHX1NDU0lfTVBUMlNBUyBpcyBub3Qgc2V0CiMgQ09ORklHX1NDU0lfU01BUlRQ
UUkgaXMgbm90IHNldAojIENPTkZJR19TQ1NJX1VGU0hDRCBpcyBub3Qgc2V0CiMgQ09ORklH
X1NDU0lfSFBUSU9QIGlzIG5vdCBzZXQKIyBDT05GSUdfU0NTSV9NWVJCIGlzIG5vdCBzZXQK
IyBDT05GSUdfU0NTSV9NWVJTIGlzIG5vdCBzZXQKIyBDT05GSUdfU0NTSV9TTklDIGlzIG5v
dCBzZXQKIyBDT05GSUdfU0NTSV9ETVgzMTkxRCBpcyBub3Qgc2V0CiMgQ09ORklHX1NDU0lf
RkRPTUFJTl9QQ0kgaXMgbm90IHNldAojIENPTkZJR19TQ1NJX0dEVEggaXMgbm90IHNldAoj
IENPTkZJR19TQ1NJX0lQUyBpcyBub3Qgc2V0CiMgQ09ORklHX1NDU0lfSU5JVElPIGlzIG5v
dCBzZXQKIyBDT05GSUdfU0NTSV9JTklBMTAwIGlzIG5vdCBzZXQKIyBDT05GSUdfU0NTSV9T
VEVYIGlzIG5vdCBzZXQKIyBDT05GSUdfU0NTSV9TWU01M0M4WFhfMiBpcyBub3Qgc2V0CiMg
Q09ORklHX1NDU0lfSVBSIGlzIG5vdCBzZXQKIyBDT05GSUdfU0NTSV9RTE9HSUNfMTI4MCBp
cyBub3Qgc2V0CiMgQ09ORklHX1NDU0lfUUxBX0lTQ1NJIGlzIG5vdCBzZXQKIyBDT05GSUdf
U0NTSV9EQzM5NXggaXMgbm90IHNldAojIENPTkZJR19TQ1NJX0FNNTNDOTc0IGlzIG5vdCBz
ZXQKIyBDT05GSUdfU0NTSV9OU1AzMiBpcyBub3Qgc2V0CiMgQ09ORklHX1NDU0lfV0Q3MTlY
IGlzIG5vdCBzZXQKIyBDT05GSUdfU0NTSV9ERUJVRyBpcyBub3Qgc2V0CiMgQ09ORklHX1ND
U0lfUE1DUkFJRCBpcyBub3Qgc2V0CiMgQ09ORklHX1NDU0lfUE04MDAxIGlzIG5vdCBzZXQK
IyBDT05GSUdfU0NTSV9ESCBpcyBub3Qgc2V0CiMgZW5kIG9mIFNDU0kgZGV2aWNlIHN1cHBv
cnQKCkNPTkZJR19BVEE9eQpDT05GSUdfQVRBX1ZFUkJPU0VfRVJST1I9eQpDT05GSUdfU0FU
QV9QTVA9eQoKIwojIENvbnRyb2xsZXJzIHdpdGggbm9uLVNGRiBuYXRpdmUgaW50ZXJmYWNl
CiMKIyBDT05GSUdfU0FUQV9BSENJIGlzIG5vdCBzZXQKQ09ORklHX1NBVEFfQUhDSV9QTEFU
Rk9STT15CiMgQ09ORklHX0FIQ0lfRE04MTYgaXMgbm90IHNldAojIENPTkZJR19BSENJX0NF
VkEgaXMgbm90IHNldAojIENPTkZJR19BSENJX1FPUklRIGlzIG5vdCBzZXQKIyBDT05GSUdf
U0FUQV9JTklDMTYyWCBpcyBub3Qgc2V0CiMgQ09ORklHX1NBVEFfQUNBUkRfQUhDSSBpcyBu
b3Qgc2V0CiMgQ09ORklHX1NBVEFfU0lMMjQgaXMgbm90IHNldApDT05GSUdfQVRBX1NGRj15
CgojCiMgU0ZGIGNvbnRyb2xsZXJzIHdpdGggY3VzdG9tIERNQSBpbnRlcmZhY2UKIwojIENP
TkZJR19QRENfQURNQSBpcyBub3Qgc2V0CiMgQ09ORklHX1NBVEFfUVNUT1IgaXMgbm90IHNl
dAojIENPTkZJR19TQVRBX1NYNCBpcyBub3Qgc2V0CkNPTkZJR19BVEFfQk1ETUE9eQoKIwoj
IFNBVEEgU0ZGIGNvbnRyb2xsZXJzIHdpdGggQk1ETUEKIwojIENPTkZJR19BVEFfUElJWCBp
cyBub3Qgc2V0CiMgQ09ORklHX1NBVEFfRFdDIGlzIG5vdCBzZXQKIyBDT05GSUdfU0FUQV9N
ViBpcyBub3Qgc2V0CiMgQ09ORklHX1NBVEFfTlYgaXMgbm90IHNldAojIENPTkZJR19TQVRB
X1BST01JU0UgaXMgbm90IHNldAojIENPTkZJR19TQVRBX1NJTCBpcyBub3Qgc2V0CiMgQ09O
RklHX1NBVEFfU0lTIGlzIG5vdCBzZXQKIyBDT05GSUdfU0FUQV9TVlcgaXMgbm90IHNldAoj
IENPTkZJR19TQVRBX1VMSSBpcyBub3Qgc2V0CiMgQ09ORklHX1NBVEFfVklBIGlzIG5vdCBz
ZXQKIyBDT05GSUdfU0FUQV9WSVRFU1NFIGlzIG5vdCBzZXQKCiMKIyBQQVRBIFNGRiBjb250
cm9sbGVycyB3aXRoIEJNRE1BCiMKIyBDT05GSUdfUEFUQV9BTEkgaXMgbm90IHNldAojIENP
TkZJR19QQVRBX0FNRCBpcyBub3Qgc2V0CiMgQ09ORklHX1BBVEFfQVJUT1AgaXMgbm90IHNl
dAojIENPTkZJR19QQVRBX0FUSUlYUCBpcyBub3Qgc2V0CiMgQ09ORklHX1BBVEFfQVRQODY3
WCBpcyBub3Qgc2V0CiMgQ09ORklHX1BBVEFfQ01ENjRYIGlzIG5vdCBzZXQKIyBDT05GSUdf
UEFUQV9DWVBSRVNTIGlzIG5vdCBzZXQKIyBDT05GSUdfUEFUQV9FRkFSIGlzIG5vdCBzZXQK
IyBDT05GSUdfUEFUQV9IUFQzNjYgaXMgbm90IHNldAojIENPTkZJR19QQVRBX0hQVDM3WCBp
cyBub3Qgc2V0CiMgQ09ORklHX1BBVEFfSFBUM1gyTiBpcyBub3Qgc2V0CiMgQ09ORklHX1BB
VEFfSFBUM1gzIGlzIG5vdCBzZXQKIyBDT05GSUdfUEFUQV9JVDgyMTMgaXMgbm90IHNldAoj
IENPTkZJR19QQVRBX0lUODIxWCBpcyBub3Qgc2V0CiMgQ09ORklHX1BBVEFfSk1JQ1JPTiBp
cyBub3Qgc2V0CiMgQ09ORklHX1BBVEFfTUFSVkVMTCBpcyBub3Qgc2V0CiMgQ09ORklHX1BB
VEFfTkVUQ0VMTCBpcyBub3Qgc2V0CiMgQ09ORklHX1BBVEFfTklOSkEzMiBpcyBub3Qgc2V0
CiMgQ09ORklHX1BBVEFfTlM4NzQxNSBpcyBub3Qgc2V0CiMgQ09ORklHX1BBVEFfT0xEUElJ
WCBpcyBub3Qgc2V0CiMgQ09ORklHX1BBVEFfT1BUSURNQSBpcyBub3Qgc2V0CiMgQ09ORklH
X1BBVEFfUERDMjAyN1ggaXMgbm90IHNldAojIENPTkZJR19QQVRBX1BEQ19PTEQgaXMgbm90
IHNldAojIENPTkZJR19QQVRBX1JBRElTWVMgaXMgbm90IHNldAojIENPTkZJR19QQVRBX1JE
QyBpcyBub3Qgc2V0CiMgQ09ORklHX1BBVEFfU0NIIGlzIG5vdCBzZXQKIyBDT05GSUdfUEFU
QV9TRVJWRVJXT1JLUyBpcyBub3Qgc2V0CiMgQ09ORklHX1BBVEFfU0lMNjgwIGlzIG5vdCBz
ZXQKIyBDT05GSUdfUEFUQV9TSVMgaXMgbm90IHNldAojIENPTkZJR19QQVRBX1RPU0hJQkEg
aXMgbm90IHNldAojIENPTkZJR19QQVRBX1RSSUZMRVggaXMgbm90IHNldAojIENPTkZJR19Q
QVRBX1ZJQSBpcyBub3Qgc2V0CiMgQ09ORklHX1BBVEFfV0lOQk9ORCBpcyBub3Qgc2V0Cgoj
CiMgUElPLW9ubHkgU0ZGIGNvbnRyb2xsZXJzCiMKIyBDT05GSUdfUEFUQV9DTUQ2NDBfUENJ
IGlzIG5vdCBzZXQKIyBDT05GSUdfUEFUQV9NUElJWCBpcyBub3Qgc2V0CiMgQ09ORklHX1BB
VEFfTlM4NzQxMCBpcyBub3Qgc2V0CiMgQ09ORklHX1BBVEFfT1BUSSBpcyBub3Qgc2V0CiMg
Q09ORklHX1BBVEFfUExBVEZPUk0gaXMgbm90IHNldAojIENPTkZJR19QQVRBX1JaMTAwMCBp
cyBub3Qgc2V0CgojCiMgR2VuZXJpYyBmYWxsYmFjayAvIGxlZ2FjeSBkcml2ZXJzCiMKIyBD
T05GSUdfQVRBX0dFTkVSSUMgaXMgbm90IHNldAojIENPTkZJR19QQVRBX0xFR0FDWSBpcyBu
b3Qgc2V0CiMgQ09ORklHX01EIGlzIG5vdCBzZXQKIyBDT05GSUdfVEFSR0VUX0NPUkUgaXMg
bm90IHNldAojIENPTkZJR19GVVNJT04gaXMgbm90IHNldAoKIwojIElFRUUgMTM5NCAoRmly
ZVdpcmUpIHN1cHBvcnQKIwojIENPTkZJR19GSVJFV0lSRSBpcyBub3Qgc2V0CiMgQ09ORklH
X0ZJUkVXSVJFX05PU1kgaXMgbm90IHNldAojIGVuZCBvZiBJRUVFIDEzOTQgKEZpcmVXaXJl
KSBzdXBwb3J0CgpDT05GSUdfTkVUREVWSUNFUz15CkNPTkZJR19NSUk9eQpDT05GSUdfTkVU
X0NPUkU9eQojIENPTkZJR19CT05ESU5HIGlzIG5vdCBzZXQKIyBDT05GSUdfRFVNTVkgaXMg
bm90IHNldAojIENPTkZJR19FUVVBTElaRVIgaXMgbm90IHNldAojIENPTkZJR19ORVRfRkMg
aXMgbm90IHNldAojIENPTkZJR19ORVRfVEVBTSBpcyBub3Qgc2V0CiMgQ09ORklHX01BQ1ZM
QU4gaXMgbm90IHNldAojIENPTkZJR19JUFZMQU4gaXMgbm90IHNldAojIENPTkZJR19WWExB
TiBpcyBub3Qgc2V0CiMgQ09ORklHX0dFTkVWRSBpcyBub3Qgc2V0CiMgQ09ORklHX0dUUCBp
cyBub3Qgc2V0CiMgQ09ORklHX01BQ1NFQyBpcyBub3Qgc2V0CiMgQ09ORklHX05FVENPTlNP
TEUgaXMgbm90IHNldAojIENPTkZJR19UVU4gaXMgbm90IHNldAojIENPTkZJR19UVU5fVk5F
VF9DUk9TU19MRSBpcyBub3Qgc2V0CiMgQ09ORklHX1ZFVEggaXMgbm90IHNldAojIENPTkZJ
R19OTE1PTiBpcyBub3Qgc2V0CiMgQ09ORklHX0FSQ05FVCBpcyBub3Qgc2V0CgojCiMgQ0FJ
RiB0cmFuc3BvcnQgZHJpdmVycwojCgojCiMgRGlzdHJpYnV0ZWQgU3dpdGNoIEFyY2hpdGVj
dHVyZSBkcml2ZXJzCiMKIyBlbmQgb2YgRGlzdHJpYnV0ZWQgU3dpdGNoIEFyY2hpdGVjdHVy
ZSBkcml2ZXJzCgpDT05GSUdfRVRIRVJORVQ9eQpDT05GSUdfTkVUX1ZFTkRPUl8zQ09NPXkK
IyBDT05GSUdfVk9SVEVYIGlzIG5vdCBzZXQKIyBDT05GSUdfVFlQSE9PTiBpcyBub3Qgc2V0
CkNPTkZJR19ORVRfVkVORE9SX0FEQVBURUM9eQojIENPTkZJR19BREFQVEVDX1NUQVJGSVJF
IGlzIG5vdCBzZXQKQ09ORklHX05FVF9WRU5ET1JfQUdFUkU9eQojIENPTkZJR19FVDEzMVgg
aXMgbm90IHNldApDT05GSUdfTkVUX1ZFTkRPUl9BTEFDUklURUNIPXkKIyBDT05GSUdfU0xJ
Q09TUyBpcyBub3Qgc2V0CkNPTkZJR19ORVRfVkVORE9SX0FMVEVPTj15CiMgQ09ORklHX0FD
RU5JQyBpcyBub3Qgc2V0CiMgQ09ORklHX0FMVEVSQV9UU0UgaXMgbm90IHNldApDT05GSUdf
TkVUX1ZFTkRPUl9BTUFaT049eQojIENPTkZJR19FTkFfRVRIRVJORVQgaXMgbm90IHNldApD
T05GSUdfTkVUX1ZFTkRPUl9BTUQ9eQojIENPTkZJR19BTUQ4MTExX0VUSCBpcyBub3Qgc2V0
CiMgQ09ORklHX1BDTkVUMzIgaXMgbm90IHNldApDT05GSUdfTkVUX1ZFTkRPUl9BUVVBTlRJ
QT15CiMgQ09ORklHX05FVF9WRU5ET1JfQVJDIGlzIG5vdCBzZXQKQ09ORklHX05FVF9WRU5E
T1JfQVRIRVJPUz15CiMgQ09ORklHX0FUTDIgaXMgbm90IHNldAojIENPTkZJR19BVEwxIGlz
IG5vdCBzZXQKIyBDT05GSUdfQVRMMUUgaXMgbm90IHNldAojIENPTkZJR19BVEwxQyBpcyBu
b3Qgc2V0CiMgQ09ORklHX0FMWCBpcyBub3Qgc2V0CkNPTkZJR19ORVRfVkVORE9SX0FVUk9S
QT15CiMgQ09ORklHX0FVUk9SQV9OQjg4MDAgaXMgbm90IHNldAojIENPTkZJR19ORVRfVkVO
RE9SX0JST0FEQ09NIGlzIG5vdCBzZXQKQ09ORklHX05FVF9WRU5ET1JfQlJPQ0FERT15CiMg
Q09ORklHX0JOQSBpcyBub3Qgc2V0CkNPTkZJR19ORVRfVkVORE9SX0NBREVOQ0U9eQojIENP
TkZJR19NQUNCIGlzIG5vdCBzZXQKQ09ORklHX05FVF9WRU5ET1JfQ0FWSVVNPXkKQ09ORklH
X05FVF9WRU5ET1JfQ0hFTFNJTz15CiMgQ09ORklHX0NIRUxTSU9fVDEgaXMgbm90IHNldAoj
IENPTkZJR19DSEVMU0lPX1QzIGlzIG5vdCBzZXQKIyBDT05GSUdfQ0hFTFNJT19UNCBpcyBu
b3Qgc2V0CiMgQ09ORklHX0NIRUxTSU9fVDRWRiBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9W
RU5ET1JfQ0lSUlVTIGlzIG5vdCBzZXQKQ09ORklHX05FVF9WRU5ET1JfQ0lTQ089eQojIENP
TkZJR19FTklDIGlzIG5vdCBzZXQKQ09ORklHX05FVF9WRU5ET1JfQ09SVElOQT15CiMgQ09O
RklHX0dFTUlOSV9FVEhFUk5FVCBpcyBub3Qgc2V0CkNPTkZJR19ETTkwMDA9eQojIENPTkZJ
R19ETTkwMDBfRk9SQ0VfU0lNUExFX1BIWV9QT0xMIGlzIG5vdCBzZXQKIyBDT05GSUdfRE5F
VCBpcyBub3Qgc2V0CkNPTkZJR19ORVRfVkVORE9SX0RFQz15CiMgQ09ORklHX05FVF9UVUxJ
UCBpcyBub3Qgc2V0CkNPTkZJR19ORVRfVkVORE9SX0RMSU5LPXkKIyBDT05GSUdfREwySyBp
cyBub3Qgc2V0CiMgQ09ORklHX1NVTkRBTkNFIGlzIG5vdCBzZXQKQ09ORklHX05FVF9WRU5E
T1JfRU1VTEVYPXkKIyBDT05GSUdfQkUyTkVUIGlzIG5vdCBzZXQKQ09ORklHX05FVF9WRU5E
T1JfRVpDSElQPXkKIyBDT05GSUdfRVpDSElQX05QU19NQU5BR0VNRU5UX0VORVQgaXMgbm90
IHNldAojIENPTkZJR19ORVRfVkVORE9SX0ZBUkFEQVkgaXMgbm90IHNldApDT05GSUdfTkVU
X1ZFTkRPUl9HT09HTEU9eQojIENPTkZJR19HVkUgaXMgbm90IHNldAojIENPTkZJR19ORVRf
VkVORE9SX0hJU0lMSUNPTiBpcyBub3Qgc2V0CkNPTkZJR19ORVRfVkVORE9SX0hQPXkKIyBD
T05GSUdfSFAxMDAgaXMgbm90IHNldApDT05GSUdfTkVUX1ZFTkRPUl9IVUFXRUk9eQojIENP
TkZJR19ORVRfVkVORE9SX0lOVEVMIGlzIG5vdCBzZXQKIyBDT05GSUdfSk1FIGlzIG5vdCBz
ZXQKIyBDT05GSUdfTkVUX1ZFTkRPUl9NQVJWRUxMIGlzIG5vdCBzZXQKQ09ORklHX05FVF9W
RU5ET1JfTUVMTEFOT1g9eQojIENPTkZJR19NTFg0X0VOIGlzIG5vdCBzZXQKIyBDT05GSUdf
TUxYNV9DT1JFIGlzIG5vdCBzZXQKIyBDT05GSUdfTUxYU1dfQ09SRSBpcyBub3Qgc2V0CiMg
Q09ORklHX01MWEZXIGlzIG5vdCBzZXQKQ09ORklHX05FVF9WRU5ET1JfTUlDUkVMPXkKIyBD
T05GSUdfS1M4ODQyIGlzIG5vdCBzZXQKQ09ORklHX0tTODg1MT15CkNPTkZJR19LUzg4NTFf
TUxMPXkKIyBDT05GSUdfS1NaODg0WF9QQ0kgaXMgbm90IHNldAojIENPTkZJR19ORVRfVkVO
RE9SX01JQ1JPQ0hJUCBpcyBub3Qgc2V0CkNPTkZJR19ORVRfVkVORE9SX01JQ1JPU0VNST15
CkNPTkZJR19ORVRfVkVORE9SX01ZUkk9eQojIENPTkZJR19NWVJJMTBHRSBpcyBub3Qgc2V0
CiMgQ09ORklHX0ZFQUxOWCBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9WRU5ET1JfTkFUU0VN
SSBpcyBub3Qgc2V0CkNPTkZJR19ORVRfVkVORE9SX05FVEVSSU9OPXkKIyBDT05GSUdfUzJJ
TyBpcyBub3Qgc2V0CiMgQ09ORklHX1ZYR0UgaXMgbm90IHNldApDT05GSUdfTkVUX1ZFTkRP
Ul9ORVRST05PTUU9eQojIENPTkZJR19ORlAgaXMgbm90IHNldApDT05GSUdfTkVUX1ZFTkRP
Ul9OST15CiMgQ09ORklHX05JX1hHRV9NQU5BR0VNRU5UX0VORVQgaXMgbm90IHNldApDT05G
SUdfTkVUX1ZFTkRPUl9OVklESUE9eQojIENPTkZJR19GT1JDRURFVEggaXMgbm90IHNldApD
T05GSUdfTkVUX1ZFTkRPUl9PS0k9eQojIENPTkZJR19FVEhPQyBpcyBub3Qgc2V0CkNPTkZJ
R19ORVRfVkVORE9SX1BBQ0tFVF9FTkdJTkVTPXkKIyBDT05GSUdfSEFNQUNISSBpcyBub3Qg
c2V0CiMgQ09ORklHX1lFTExPV0ZJTiBpcyBub3Qgc2V0CkNPTkZJR19ORVRfVkVORE9SX1FM
T0dJQz15CiMgQ09ORklHX1FMQTNYWFggaXMgbm90IHNldAojIENPTkZJR19RTENOSUMgaXMg
bm90IHNldAojIENPTkZJR19RTEdFIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUWEVOX05JQyBp
cyBub3Qgc2V0CiMgQ09ORklHX1FFRCBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9WRU5ET1Jf
UVVBTENPTU0gaXMgbm90IHNldApDT05GSUdfTkVUX1ZFTkRPUl9SREM9eQojIENPTkZJR19S
NjA0MCBpcyBub3Qgc2V0CkNPTkZJR19ORVRfVkVORE9SX1JFQUxURUs9eQojIENPTkZJR184
MTM5Q1AgaXMgbm90IHNldAojIENPTkZJR184MTM5VE9PIGlzIG5vdCBzZXQKIyBDT05GSUdf
UjgxNjkgaXMgbm90IHNldApDT05GSUdfTkVUX1ZFTkRPUl9SRU5FU0FTPXkKQ09ORklHX05F
VF9WRU5ET1JfUk9DS0VSPXkKIyBDT05GSUdfTkVUX1ZFTkRPUl9TQU1TVU5HIGlzIG5vdCBz
ZXQKIyBDT05GSUdfTkVUX1ZFTkRPUl9TRUVRIGlzIG5vdCBzZXQKQ09ORklHX05FVF9WRU5E
T1JfU09MQVJGTEFSRT15CiMgQ09ORklHX1NGQyBpcyBub3Qgc2V0CiMgQ09ORklHX1NGQ19G
QUxDT04gaXMgbm90IHNldApDT05GSUdfTkVUX1ZFTkRPUl9TSUxBTj15CiMgQ09ORklHX1ND
OTIwMzEgaXMgbm90IHNldApDT05GSUdfTkVUX1ZFTkRPUl9TSVM9eQojIENPTkZJR19TSVM5
MDAgaXMgbm90IHNldAojIENPTkZJR19TSVMxOTAgaXMgbm90IHNldApDT05GSUdfTkVUX1ZF
TkRPUl9TTVNDPXkKQ09ORklHX1NNQzkxWD15CiMgQ09ORklHX0VQSUMxMDAgaXMgbm90IHNl
dAojIENPTkZJR19TTUM5MTFYIGlzIG5vdCBzZXQKQ09ORklHX1NNU0M5MTFYPXkKIyBDT05G
SUdfU01TQzk0MjAgaXMgbm90IHNldApDT05GSUdfTkVUX1ZFTkRPUl9TT0NJT05FWFQ9eQoj
IENPTkZJR19ORVRfVkVORE9SX1NUTUlDUk8gaXMgbm90IHNldApDT05GSUdfTkVUX1ZFTkRP
Ul9TVU49eQojIENPTkZJR19IQVBQWU1FQUwgaXMgbm90IHNldAojIENPTkZJR19TVU5HRU0g
aXMgbm90IHNldAojIENPTkZJR19DQVNTSU5JIGlzIG5vdCBzZXQKIyBDT05GSUdfTklVIGlz
IG5vdCBzZXQKQ09ORklHX05FVF9WRU5ET1JfU1lOT1BTWVM9eQojIENPTkZJR19EV0NfWExH
TUFDIGlzIG5vdCBzZXQKQ09ORklHX05FVF9WRU5ET1JfVEVIVVRJPXkKIyBDT05GSUdfVEVI
VVRJIGlzIG5vdCBzZXQKQ09ORklHX05FVF9WRU5ET1JfVEk9eQpDT05GSUdfVElfREFWSU5D
SV9FTUFDPXkKQ09ORklHX1RJX0RBVklOQ0lfTURJTz15CiMgQ09ORklHX1RJX0NQU1dfUEhZ
X1NFTCBpcyBub3Qgc2V0CkNPTkZJR19USV9DUFNXPXkKQ09ORklHX1RJX0NQVFM9eQpDT05G
SUdfVElfQ1BUU19NT0Q9eQojIENPTkZJR19UTEFOIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVU
X1ZFTkRPUl9WSUEgaXMgbm90IHNldAojIENPTkZJR19ORVRfVkVORE9SX1dJWk5FVCBpcyBu
b3Qgc2V0CkNPTkZJR19ORVRfVkVORE9SX1hJTElOWD15CiMgQ09ORklHX1hJTElOWF9BWElf
RU1BQyBpcyBub3Qgc2V0CiMgQ09ORklHX0ZEREkgaXMgbm90IHNldAojIENPTkZJR19ISVBQ
SSBpcyBub3Qgc2V0CkNPTkZJR19NRElPX0RFVklDRT15CkNPTkZJR19NRElPX0JVUz15CiMg
Q09ORklHX01ESU9fQkNNX1VOSU1BQyBpcyBub3Qgc2V0CiMgQ09ORklHX01ESU9fQklUQkFO
RyBpcyBub3Qgc2V0CiMgQ09ORklHX01ESU9fQlVTX01VWF9HUElPIGlzIG5vdCBzZXQKIyBD
T05GSUdfTURJT19CVVNfTVVYX01NSU9SRUcgaXMgbm90IHNldAojIENPTkZJR19NRElPX0JV
U19NVVhfTVVMVElQTEVYRVIgaXMgbm90IHNldAojIENPTkZJR19NRElPX0hJU0lfRkVNQUMg
aXMgbm90IHNldAojIENPTkZJR19NRElPX01TQ0NfTUlJTSBpcyBub3Qgc2V0CkNPTkZJR19Q
SFlMSUI9eQpDT05GSUdfU1dQSFk9eQojIENPTkZJR19MRURfVFJJR0dFUl9QSFkgaXMgbm90
IHNldAoKIwojIE1JSSBQSFkgZGV2aWNlIGRyaXZlcnMKIwojIENPTkZJR19BTURfUEhZIGlz
IG5vdCBzZXQKIyBDT05GSUdfQVFVQU5USUFfUEhZIGlzIG5vdCBzZXQKIyBDT05GSUdfQVg4
ODc5NkJfUEhZIGlzIG5vdCBzZXQKQ09ORklHX0FUODAzWF9QSFk9eQojIENPTkZJR19CQ003
WFhYX1BIWSBpcyBub3Qgc2V0CiMgQ09ORklHX0JDTTg3WFhfUEhZIGlzIG5vdCBzZXQKIyBD
T05GSUdfQlJPQURDT01fUEhZIGlzIG5vdCBzZXQKIyBDT05GSUdfQ0lDQURBX1BIWSBpcyBu
b3Qgc2V0CiMgQ09ORklHX0NPUlRJTkFfUEhZIGlzIG5vdCBzZXQKIyBDT05GSUdfREFWSUNP
TV9QSFkgaXMgbm90IHNldAojIENPTkZJR19EUDgzODIyX1BIWSBpcyBub3Qgc2V0CiMgQ09O
RklHX0RQODNUQzgxMV9QSFkgaXMgbm90IHNldApDT05GSUdfRFA4Mzg0OF9QSFk9eQpDT05G
SUdfRFA4Mzg2N19QSFk9eQpDT05GSUdfRklYRURfUEhZPXkKIyBDT05GSUdfSUNQTFVTX1BI
WSBpcyBub3Qgc2V0CiMgQ09ORklHX0lOVEVMX1hXQVlfUEhZIGlzIG5vdCBzZXQKIyBDT05G
SUdfTFNJX0VUMTAxMUNfUEhZIGlzIG5vdCBzZXQKIyBDT05GSUdfTFhUX1BIWSBpcyBub3Qg
c2V0CiMgQ09ORklHX01BUlZFTExfUEhZIGlzIG5vdCBzZXQKIyBDT05GSUdfTUFSVkVMTF8x
MEdfUEhZIGlzIG5vdCBzZXQKQ09ORklHX01JQ1JFTF9QSFk9eQojIENPTkZJR19NSUNST0NI
SVBfUEhZIGlzIG5vdCBzZXQKIyBDT05GSUdfTUlDUk9DSElQX1QxX1BIWSBpcyBub3Qgc2V0
CiMgQ09ORklHX01JQ1JPU0VNSV9QSFkgaXMgbm90IHNldAojIENPTkZJR19OQVRJT05BTF9Q
SFkgaXMgbm90IHNldAojIENPTkZJR19RU0VNSV9QSFkgaXMgbm90IHNldAojIENPTkZJR19S
RUFMVEVLX1BIWSBpcyBub3Qgc2V0CiMgQ09ORklHX1JFTkVTQVNfUEhZIGlzIG5vdCBzZXQK
IyBDT05GSUdfUk9DS0NISVBfUEhZIGlzIG5vdCBzZXQKQ09ORklHX1NNU0NfUEhZPXkKIyBD
T05GSUdfU1RFMTBYUCBpcyBub3Qgc2V0CiMgQ09ORklHX1RFUkFORVRJQ1NfUEhZIGlzIG5v
dCBzZXQKIyBDT05GSUdfVklURVNTRV9QSFkgaXMgbm90IHNldAojIENPTkZJR19YSUxJTlhf
R01JSTJSR01JSSBpcyBub3Qgc2V0CiMgQ09ORklHX01JQ1JFTF9LUzg5OTVNQSBpcyBub3Qg
c2V0CiMgQ09ORklHX1BQUCBpcyBub3Qgc2V0CiMgQ09ORklHX1NMSVAgaXMgbm90IHNldApD
T05GSUdfVVNCX05FVF9EUklWRVJTPXkKIyBDT05GSUdfVVNCX0NBVEMgaXMgbm90IHNldAoj
IENPTkZJR19VU0JfS0FXRVRIIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX1BFR0FTVVMgaXMg
bm90IHNldAojIENPTkZJR19VU0JfUlRMODE1MCBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9S
VEw4MTUyIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX0xBTjc4WFggaXMgbm90IHNldApDT05G
SUdfVVNCX1VTQk5FVD15CkNPTkZJR19VU0JfTkVUX0FYODgxN1g9eQpDT05GSUdfVVNCX05F
VF9BWDg4MTc5XzE3OEE9eQpDT05GSUdfVVNCX05FVF9DRENFVEhFUj15CiMgQ09ORklHX1VT
Ql9ORVRfQ0RDX0VFTSBpcyBub3Qgc2V0CkNPTkZJR19VU0JfTkVUX0NEQ19OQ009eQojIENP
TkZJR19VU0JfTkVUX0hVQVdFSV9DRENfTkNNIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX05F
VF9DRENfTUJJTSBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9ORVRfRE05NjAxIGlzIG5vdCBz
ZXQKIyBDT05GSUdfVVNCX05FVF9TUjk3MDAgaXMgbm90IHNldAojIENPTkZJR19VU0JfTkVU
X1NSOTgwMCBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9ORVRfU01TQzc1WFggaXMgbm90IHNl
dApDT05GSUdfVVNCX05FVF9TTVNDOTVYWD15CiMgQ09ORklHX1VTQl9ORVRfR0w2MjBBIGlz
IG5vdCBzZXQKQ09ORklHX1VTQl9ORVRfTkVUMTA4MD15CiMgQ09ORklHX1VTQl9ORVRfUExV
U0IgaXMgbm90IHNldAojIENPTkZJR19VU0JfTkVUX01DUzc4MzAgaXMgbm90IHNldAojIENP
TkZJR19VU0JfTkVUX1JORElTX0hPU1QgaXMgbm90IHNldApDT05GSUdfVVNCX05FVF9DRENf
U1VCU0VUX0VOQUJMRT15CkNPTkZJR19VU0JfTkVUX0NEQ19TVUJTRVQ9eQpDT05GSUdfVVNC
X0FMSV9NNTYzMj15CkNPTkZJR19VU0JfQU4yNzIwPXkKQ09ORklHX1VTQl9CRUxLSU49eQpD
T05GSUdfVVNCX0FSTUxJTlVYPXkKQ09ORklHX1VTQl9FUFNPTjI4ODg9eQpDT05GSUdfVVNC
X0tDMjE5MD15CkNPTkZJR19VU0JfTkVUX1pBVVJVUz15CiMgQ09ORklHX1VTQl9ORVRfQ1g4
MjMxMF9FVEggaXMgbm90IHNldAojIENPTkZJR19VU0JfTkVUX0tBTE1JQSBpcyBub3Qgc2V0
CiMgQ09ORklHX1VTQl9ORVRfUU1JX1dXQU4gaXMgbm90IHNldAojIENPTkZJR19VU0JfTkVU
X0lOVDUxWDEgaXMgbm90IHNldAojIENPTkZJR19VU0JfSVBIRVRIIGlzIG5vdCBzZXQKIyBD
T05GSUdfVVNCX1NJRVJSQV9ORVQgaXMgbm90IHNldAojIENPTkZJR19VU0JfVkw2MDAgaXMg
bm90IHNldAojIENPTkZJR19VU0JfTkVUX0NIOTIwMCBpcyBub3Qgc2V0CiMgQ09ORklHX1VT
Ql9ORVRfQVFDMTExIGlzIG5vdCBzZXQKIyBDT05GSUdfV0xBTiBpcyBub3Qgc2V0CgojCiMg
RW5hYmxlIFdpTUFYIChOZXR3b3JraW5nIG9wdGlvbnMpIHRvIHNlZSB0aGUgV2lNQVggZHJp
dmVycwojCiMgQ09ORklHX1dBTiBpcyBub3Qgc2V0CiMgQ09ORklHX1ZNWE5FVDMgaXMgbm90
IHNldAojIENPTkZJR19ORVRERVZTSU0gaXMgbm90IHNldAojIENPTkZJR19ORVRfRkFJTE9W
RVIgaXMgbm90IHNldAojIENPTkZJR19JU0ROIGlzIG5vdCBzZXQKIyBDT05GSUdfTlZNIGlz
IG5vdCBzZXQKCiMKIyBJbnB1dCBkZXZpY2Ugc3VwcG9ydAojCkNPTkZJR19JTlBVVD15CkNP
TkZJR19JTlBVVF9MRURTPXkKIyBDT05GSUdfSU5QVVRfRkZfTUVNTEVTUyBpcyBub3Qgc2V0
CiMgQ09ORklHX0lOUFVUX1BPTExERVYgaXMgbm90IHNldAojIENPTkZJR19JTlBVVF9TUEFS
U0VLTUFQIGlzIG5vdCBzZXQKIyBDT05GSUdfSU5QVVRfTUFUUklYS01BUCBpcyBub3Qgc2V0
CgojCiMgVXNlcmxhbmQgaW50ZXJmYWNlcwojCiMgQ09ORklHX0lOUFVUX01PVVNFREVWIGlz
IG5vdCBzZXQKIyBDT05GSUdfSU5QVVRfSk9ZREVWIGlzIG5vdCBzZXQKQ09ORklHX0lOUFVU
X0VWREVWPXkKIyBDT05GSUdfSU5QVVRfRVZCVUcgaXMgbm90IHNldAoKIwojIElucHV0IERl
dmljZSBEcml2ZXJzCiMKQ09ORklHX0lOUFVUX0tFWUJPQVJEPXkKIyBDT05GSUdfS0VZQk9B
UkRfQURQNTU4OCBpcyBub3Qgc2V0CiMgQ09ORklHX0tFWUJPQVJEX0FEUDU1ODkgaXMgbm90
IHNldAojIENPTkZJR19LRVlCT0FSRF9BVEtCRCBpcyBub3Qgc2V0CiMgQ09ORklHX0tFWUJP
QVJEX1FUMTA1MCBpcyBub3Qgc2V0CiMgQ09ORklHX0tFWUJPQVJEX1FUMTA3MCBpcyBub3Qg
c2V0CiMgQ09ORklHX0tFWUJPQVJEX1FUMjE2MCBpcyBub3Qgc2V0CiMgQ09ORklHX0tFWUJP
QVJEX0RMSU5LX0RJUjY4NSBpcyBub3Qgc2V0CiMgQ09ORklHX0tFWUJPQVJEX0xLS0JEIGlz
IG5vdCBzZXQKIyBDT05GSUdfS0VZQk9BUkRfR1BJTyBpcyBub3Qgc2V0CiMgQ09ORklHX0tF
WUJPQVJEX0dQSU9fUE9MTEVEIGlzIG5vdCBzZXQKIyBDT05GSUdfS0VZQk9BUkRfVENBNjQx
NiBpcyBub3Qgc2V0CiMgQ09ORklHX0tFWUJPQVJEX1RDQTg0MTggaXMgbm90IHNldAojIENP
TkZJR19LRVlCT0FSRF9NQVRSSVggaXMgbm90IHNldAojIENPTkZJR19LRVlCT0FSRF9MTTgz
MjMgaXMgbm90IHNldAojIENPTkZJR19LRVlCT0FSRF9MTTgzMzMgaXMgbm90IHNldAojIENP
TkZJR19LRVlCT0FSRF9NQVg3MzU5IGlzIG5vdCBzZXQKIyBDT05GSUdfS0VZQk9BUkRfTUNT
IGlzIG5vdCBzZXQKIyBDT05GSUdfS0VZQk9BUkRfTVBSMTIxIGlzIG5vdCBzZXQKIyBDT05G
SUdfS0VZQk9BUkRfTkVXVE9OIGlzIG5vdCBzZXQKIyBDT05GSUdfS0VZQk9BUkRfT1BFTkNP
UkVTIGlzIG5vdCBzZXQKIyBDT05GSUdfS0VZQk9BUkRfU0FNU1VORyBpcyBub3Qgc2V0CiMg
Q09ORklHX0tFWUJPQVJEX1NUT1dBV0FZIGlzIG5vdCBzZXQKIyBDT05GSUdfS0VZQk9BUkRf
U1VOS0JEIGlzIG5vdCBzZXQKIyBDT05GSUdfS0VZQk9BUkRfT01BUDQgaXMgbm90IHNldAoj
IENPTkZJR19LRVlCT0FSRF9UTTJfVE9VQ0hLRVkgaXMgbm90IHNldAojIENPTkZJR19LRVlC
T0FSRF9UV0w0MDMwIGlzIG5vdCBzZXQKIyBDT05GSUdfS0VZQk9BUkRfWFRLQkQgaXMgbm90
IHNldAojIENPTkZJR19LRVlCT0FSRF9DQVAxMVhYIGlzIG5vdCBzZXQKIyBDT05GSUdfS0VZ
Qk9BUkRfQkNNIGlzIG5vdCBzZXQKIyBDT05GSUdfSU5QVVRfTU9VU0UgaXMgbm90IHNldAoj
IENPTkZJR19JTlBVVF9KT1lTVElDSyBpcyBub3Qgc2V0CiMgQ09ORklHX0lOUFVUX1RBQkxF
VCBpcyBub3Qgc2V0CkNPTkZJR19JTlBVVF9UT1VDSFNDUkVFTj15CkNPTkZJR19UT1VDSFND
UkVFTl9QUk9QRVJUSUVTPXkKIyBDT05GSUdfVE9VQ0hTQ1JFRU5fQURTNzg0NiBpcyBub3Qg
c2V0CiMgQ09ORklHX1RPVUNIU0NSRUVOX0FENzg3NyBpcyBub3Qgc2V0CiMgQ09ORklHX1RP
VUNIU0NSRUVOX0FENzg3OSBpcyBub3Qgc2V0CiMgQ09ORklHX1RPVUNIU0NSRUVOX0FSMTAy
MV9JMkMgaXMgbm90IHNldAojIENPTkZJR19UT1VDSFNDUkVFTl9BVE1FTF9NWFQgaXMgbm90
IHNldAojIENPTkZJR19UT1VDSFNDUkVFTl9BVU9fUElYQ0lSIGlzIG5vdCBzZXQKIyBDT05G
SUdfVE9VQ0hTQ1JFRU5fQlUyMTAxMyBpcyBub3Qgc2V0CiMgQ09ORklHX1RPVUNIU0NSRUVO
X0JVMjEwMjkgaXMgbm90IHNldAojIENPTkZJR19UT1VDSFNDUkVFTl9DSElQT05FX0lDTjgz
MTggaXMgbm90IHNldAojIENPTkZJR19UT1VDSFNDUkVFTl9DWThDVE1HMTEwIGlzIG5vdCBz
ZXQKIyBDT05GSUdfVE9VQ0hTQ1JFRU5fQ1lUVFNQX0NPUkUgaXMgbm90IHNldAojIENPTkZJ
R19UT1VDSFNDUkVFTl9DWVRUU1A0X0NPUkUgaXMgbm90IHNldAojIENPTkZJR19UT1VDSFND
UkVFTl9EWU5BUFJPIGlzIG5vdCBzZXQKIyBDT05GSUdfVE9VQ0hTQ1JFRU5fSEFNUFNISVJF
IGlzIG5vdCBzZXQKIyBDT05GSUdfVE9VQ0hTQ1JFRU5fRUVUSSBpcyBub3Qgc2V0CiMgQ09O
RklHX1RPVUNIU0NSRUVOX0VHQUxBWCBpcyBub3Qgc2V0CiMgQ09ORklHX1RPVUNIU0NSRUVO
X0VHQUxBWF9TRVJJQUwgaXMgbm90IHNldAojIENPTkZJR19UT1VDSFNDUkVFTl9FWEMzMDAw
IGlzIG5vdCBzZXQKIyBDT05GSUdfVE9VQ0hTQ1JFRU5fRlVKSVRTVSBpcyBub3Qgc2V0CkNP
TkZJR19UT1VDSFNDUkVFTl9HT09ESVg9eQojIENPTkZJR19UT1VDSFNDUkVFTl9ISURFRVAg
aXMgbm90IHNldAojIENPTkZJR19UT1VDSFNDUkVFTl9JTEkyMTBYIGlzIG5vdCBzZXQKIyBD
T05GSUdfVE9VQ0hTQ1JFRU5fUzZTWTc2MSBpcyBub3Qgc2V0CiMgQ09ORklHX1RPVUNIU0NS
RUVOX0dVTlpFIGlzIG5vdCBzZXQKIyBDT05GSUdfVE9VQ0hTQ1JFRU5fRUtURjIxMjcgaXMg
bm90IHNldAojIENPTkZJR19UT1VDSFNDUkVFTl9FTEFOIGlzIG5vdCBzZXQKIyBDT05GSUdf
VE9VQ0hTQ1JFRU5fRUxPIGlzIG5vdCBzZXQKIyBDT05GSUdfVE9VQ0hTQ1JFRU5fV0FDT01f
VzgwMDEgaXMgbm90IHNldAojIENPTkZJR19UT1VDSFNDUkVFTl9XQUNPTV9JMkMgaXMgbm90
IHNldAojIENPTkZJR19UT1VDSFNDUkVFTl9NQVgxMTgwMSBpcyBub3Qgc2V0CiMgQ09ORklH
X1RPVUNIU0NSRUVOX01DUzUwMDAgaXMgbm90IHNldAojIENPTkZJR19UT1VDSFNDUkVFTl9N
TVMxMTQgaXMgbm90IHNldAojIENPTkZJR19UT1VDSFNDUkVFTl9NRUxGQVNfTUlQNCBpcyBu
b3Qgc2V0CiMgQ09ORklHX1RPVUNIU0NSRUVOX01UT1VDSCBpcyBub3Qgc2V0CiMgQ09ORklH
X1RPVUNIU0NSRUVOX0lNWDZVTF9UU0MgaXMgbm90IHNldAojIENPTkZJR19UT1VDSFNDUkVF
Tl9JTkVYSU8gaXMgbm90IHNldAojIENPTkZJR19UT1VDSFNDUkVFTl9NSzcxMiBpcyBub3Qg
c2V0CiMgQ09ORklHX1RPVUNIU0NSRUVOX1BFTk1PVU5UIGlzIG5vdCBzZXQKQ09ORklHX1RP
VUNIU0NSRUVOX0VEVF9GVDVYMDY9eQojIENPTkZJR19UT1VDSFNDUkVFTl9UT1VDSFJJR0hU
IGlzIG5vdCBzZXQKIyBDT05GSUdfVE9VQ0hTQ1JFRU5fVE9VQ0hXSU4gaXMgbm90IHNldApD
T05GSUdfVE9VQ0hTQ1JFRU5fUElYQ0lSPXkKIyBDT05GSUdfVE9VQ0hTQ1JFRU5fV0RUODdY
WF9JMkMgaXMgbm90IHNldAojIENPTkZJR19UT1VDSFNDUkVFTl9VU0JfQ09NUE9TSVRFIGlz
IG5vdCBzZXQKIyBDT05GSUdfVE9VQ0hTQ1JFRU5fVE9VQ0hJVDIxMyBpcyBub3Qgc2V0CiMg
Q09ORklHX1RPVUNIU0NSRUVOX1RTQ19TRVJJTyBpcyBub3Qgc2V0CiMgQ09ORklHX1RPVUNI
U0NSRUVOX1RTQzIwMDQgaXMgbm90IHNldAojIENPTkZJR19UT1VDSFNDUkVFTl9UU0MyMDA1
IGlzIG5vdCBzZXQKIyBDT05GSUdfVE9VQ0hTQ1JFRU5fVFNDMjAwNyBpcyBub3Qgc2V0CiMg
Q09ORklHX1RPVUNIU0NSRUVOX1JNX1RTIGlzIG5vdCBzZXQKIyBDT05GSUdfVE9VQ0hTQ1JF
RU5fU0lMRUFEIGlzIG5vdCBzZXQKIyBDT05GSUdfVE9VQ0hTQ1JFRU5fU0lTX0kyQyBpcyBu
b3Qgc2V0CiMgQ09ORklHX1RPVUNIU0NSRUVOX1NUMTIzMiBpcyBub3Qgc2V0CiMgQ09ORklH
X1RPVUNIU0NSRUVOX1NUTUZUUyBpcyBub3Qgc2V0CiMgQ09ORklHX1RPVUNIU0NSRUVOX1NV
UkZBQ0UzX1NQSSBpcyBub3Qgc2V0CiMgQ09ORklHX1RPVUNIU0NSRUVOX1NYODY1NCBpcyBu
b3Qgc2V0CiMgQ09ORklHX1RPVUNIU0NSRUVOX1RQUzY1MDdYIGlzIG5vdCBzZXQKIyBDT05G
SUdfVE9VQ0hTQ1JFRU5fWkVUNjIyMyBpcyBub3Qgc2V0CiMgQ09ORklHX1RPVUNIU0NSRUVO
X1pGT1JDRSBpcyBub3Qgc2V0CiMgQ09ORklHX1RPVUNIU0NSRUVOX1JPSE1fQlUyMTAyMyBp
cyBub3Qgc2V0CiMgQ09ORklHX1RPVUNIU0NSRUVOX0lRUzVYWCBpcyBub3Qgc2V0CkNPTkZJ
R19JTlBVVF9NSVNDPXkKIyBDT05GSUdfSU5QVVRfQUQ3MTRYIGlzIG5vdCBzZXQKIyBDT05G
SUdfSU5QVVRfQVRNRUxfQ0FQVE9VQ0ggaXMgbm90IHNldAojIENPTkZJR19JTlBVVF9CTUEx
NTAgaXMgbm90IHNldAojIENPTkZJR19JTlBVVF9FM1gwX0JVVFRPTiBpcyBub3Qgc2V0CiMg
Q09ORklHX0lOUFVUX01TTV9WSUJSQVRPUiBpcyBub3Qgc2V0CiMgQ09ORklHX0lOUFVUX01N
QTg0NTAgaXMgbm90IHNldAojIENPTkZJR19JTlBVVF9HUDJBIGlzIG5vdCBzZXQKIyBDT05G
SUdfSU5QVVRfR1BJT19CRUVQRVIgaXMgbm90IHNldAojIENPTkZJR19JTlBVVF9HUElPX0RF
Q09ERVIgaXMgbm90IHNldAojIENPTkZJR19JTlBVVF9HUElPX1ZJQlJBIGlzIG5vdCBzZXQK
IyBDT05GSUdfSU5QVVRfQ1BDQVBfUFdSQlVUVE9OIGlzIG5vdCBzZXQKIyBDT05GSUdfSU5Q
VVRfQVRJX1JFTU9URTIgaXMgbm90IHNldAojIENPTkZJR19JTlBVVF9LRVlTUEFOX1JFTU9U
RSBpcyBub3Qgc2V0CiMgQ09ORklHX0lOUFVUX0tYVEo5IGlzIG5vdCBzZXQKIyBDT05GSUdf
SU5QVVRfUE9XRVJNQVRFIGlzIG5vdCBzZXQKIyBDT05GSUdfSU5QVVRfWUVBTElOSyBpcyBu
b3Qgc2V0CiMgQ09ORklHX0lOUFVUX0NNMTA5IGlzIG5vdCBzZXQKIyBDT05GSUdfSU5QVVRf
UkVHVUxBVE9SX0hBUFRJQyBpcyBub3Qgc2V0CiMgQ09ORklHX0lOUFVUX1RQUzY1MjE4X1BX
UkJVVFRPTiBpcyBub3Qgc2V0CiMgQ09ORklHX0lOUFVUX1RXTDQwMzBfUFdSQlVUVE9OIGlz
IG5vdCBzZXQKIyBDT05GSUdfSU5QVVRfVFdMNDAzMF9WSUJSQSBpcyBub3Qgc2V0CiMgQ09O
RklHX0lOUFVUX1RXTDYwNDBfVklCUkEgaXMgbm90IHNldAojIENPTkZJR19JTlBVVF9VSU5Q
VVQgaXMgbm90IHNldAojIENPTkZJR19JTlBVVF9QQUxNQVNfUFdSQlVUVE9OIGlzIG5vdCBz
ZXQKIyBDT05GSUdfSU5QVVRfUENGODU3NCBpcyBub3Qgc2V0CiMgQ09ORklHX0lOUFVUX1BX
TV9CRUVQRVIgaXMgbm90IHNldAojIENPTkZJR19JTlBVVF9QV01fVklCUkEgaXMgbm90IHNl
dAojIENPTkZJR19JTlBVVF9HUElPX1JPVEFSWV9FTkNPREVSIGlzIG5vdCBzZXQKIyBDT05G
SUdfSU5QVVRfQURYTDM0WCBpcyBub3Qgc2V0CiMgQ09ORklHX0lOUFVUX0lNU19QQ1UgaXMg
bm90IHNldAojIENPTkZJR19JTlBVVF9DTUEzMDAwIGlzIG5vdCBzZXQKIyBDT05GSUdfSU5Q
VVRfRFJWMjYwWF9IQVBUSUNTIGlzIG5vdCBzZXQKIyBDT05GSUdfSU5QVVRfRFJWMjY2NV9I
QVBUSUNTIGlzIG5vdCBzZXQKIyBDT05GSUdfSU5QVVRfRFJWMjY2N19IQVBUSUNTIGlzIG5v
dCBzZXQKIyBDT05GSUdfUk1JNF9DT1JFIGlzIG5vdCBzZXQKCiMKIyBIYXJkd2FyZSBJL08g
cG9ydHMKIwojIENPTkZJR19TRVJJTyBpcyBub3Qgc2V0CiMgQ09ORklHX0dBTUVQT1JUIGlz
IG5vdCBzZXQKIyBlbmQgb2YgSGFyZHdhcmUgSS9PIHBvcnRzCiMgZW5kIG9mIElucHV0IGRl
dmljZSBzdXBwb3J0CgojCiMgQ2hhcmFjdGVyIGRldmljZXMKIwpDT05GSUdfVFRZPXkKQ09O
RklHX1ZUPXkKQ09ORklHX0NPTlNPTEVfVFJBTlNMQVRJT05TPXkKQ09ORklHX1ZUX0NPTlNP
TEU9eQpDT05GSUdfVlRfQ09OU09MRV9TTEVFUD15CkNPTkZJR19IV19DT05TT0xFPXkKIyBD
T05GSUdfVlRfSFdfQ09OU09MRV9CSU5ESU5HIGlzIG5vdCBzZXQKQ09ORklHX1VOSVg5OF9Q
VFlTPXkKIyBDT05GSUdfTEVHQUNZX1BUWVMgaXMgbm90IHNldAojIENPTkZJR19TRVJJQUxf
Tk9OU1RBTkRBUkQgaXMgbm90IHNldAojIENPTkZJR19OT1pPTUkgaXMgbm90IHNldAojIENP
TkZJR19OX0dTTSBpcyBub3Qgc2V0CiMgQ09ORklHX1RSQUNFX1NJTksgaXMgbm90IHNldAoj
IENPTkZJR19OVUxMX1RUWSBpcyBub3Qgc2V0CkNPTkZJR19MRElTQ19BVVRPTE9BRD15CkNP
TkZJR19ERVZNRU09eQojIENPTkZJR19ERVZLTUVNIGlzIG5vdCBzZXQKCiMKIyBTZXJpYWwg
ZHJpdmVycwojCkNPTkZJR19TRVJJQUxfRUFSTFlDT049eQpDT05GSUdfU0VSSUFMXzgyNTA9
eQpDT05GSUdfU0VSSUFMXzgyNTBfREVQUkVDQVRFRF9PUFRJT05TPXkKIyBDT05GSUdfU0VS
SUFMXzgyNTBfRklOVEVLIGlzIG5vdCBzZXQKQ09ORklHX1NFUklBTF84MjUwX0NPTlNPTEU9
eQojIENPTkZJR19TRVJJQUxfODI1MF9ETUEgaXMgbm90IHNldApDT05GSUdfU0VSSUFMXzgy
NTBfUENJPXkKQ09ORklHX1NFUklBTF84MjUwX0VYQVI9eQpDT05GSUdfU0VSSUFMXzgyNTBf
TlJfVUFSVFM9MzIKQ09ORklHX1NFUklBTF84MjUwX1JVTlRJTUVfVUFSVFM9MTAKQ09ORklH
X1NFUklBTF84MjUwX0VYVEVOREVEPXkKQ09ORklHX1NFUklBTF84MjUwX01BTllfUE9SVFM9
eQojIENPTkZJR19TRVJJQUxfODI1MF9BU1BFRURfVlVBUlQgaXMgbm90IHNldApDT05GSUdf
U0VSSUFMXzgyNTBfU0hBUkVfSVJRPXkKQ09ORklHX1NFUklBTF84MjUwX0RFVEVDVF9JUlE9
eQpDT05GSUdfU0VSSUFMXzgyNTBfUlNBPXkKQ09ORklHX1NFUklBTF84MjUwX0ZTTD15CiMg
Q09ORklHX1NFUklBTF84MjUwX0RXIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VSSUFMXzgyNTBf
RU0gaXMgbm90IHNldAojIENPTkZJR19TRVJJQUxfODI1MF9SVDI4OFggaXMgbm90IHNldApD
T05GSUdfU0VSSUFMXzgyNTBfT01BUD15CkNPTkZJR19TRVJJQUxfODI1MF9PTUFQX1RUWU9f
RklYVVA9eQojIENPTkZJR19TRVJJQUxfODI1MF9NT1hBIGlzIG5vdCBzZXQKQ09ORklHX1NF
UklBTF9PRl9QTEFURk9STT15CgojCiMgTm9uLTgyNTAgc2VyaWFsIHBvcnQgc3VwcG9ydAoj
CiMgQ09ORklHX1NFUklBTF9FQVJMWUNPTl9BUk1fU0VNSUhPU1QgaXMgbm90IHNldAojIENP
TkZJR19TRVJJQUxfTUFYMzEwMCBpcyBub3Qgc2V0CiMgQ09ORklHX1NFUklBTF9NQVgzMTBY
IGlzIG5vdCBzZXQKIyBDT05GSUdfU0VSSUFMX1VBUlRMSVRFIGlzIG5vdCBzZXQKQ09ORklH
X1NFUklBTF9DT1JFPXkKQ09ORklHX1NFUklBTF9DT1JFX0NPTlNPTEU9eQojIENPTkZJR19T
RVJJQUxfSlNNIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VSSUFMX09NQVAgaXMgbm90IHNldAoj
IENPTkZJR19TRVJJQUxfU0lGSVZFIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VSSUFMX1NDQ05Y
UCBpcyBub3Qgc2V0CiMgQ09ORklHX1NFUklBTF9TQzE2SVM3WFggaXMgbm90IHNldAojIENP
TkZJR19TRVJJQUxfQkNNNjNYWCBpcyBub3Qgc2V0CiMgQ09ORklHX1NFUklBTF9BTFRFUkFf
SlRBR1VBUlQgaXMgbm90IHNldAojIENPTkZJR19TRVJJQUxfQUxURVJBX1VBUlQgaXMgbm90
IHNldAojIENPTkZJR19TRVJJQUxfSUZYNlg2MCBpcyBub3Qgc2V0CiMgQ09ORklHX1NFUklB
TF9YSUxJTlhfUFNfVUFSVCBpcyBub3Qgc2V0CiMgQ09ORklHX1NFUklBTF9BUkMgaXMgbm90
IHNldAojIENPTkZJR19TRVJJQUxfUlAyIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VSSUFMX0ZT
TF9MUFVBUlQgaXMgbm90IHNldAojIENPTkZJR19TRVJJQUxfQ09ORVhBTlRfRElHSUNPTE9S
IGlzIG5vdCBzZXQKIyBDT05GSUdfU0VSSUFMX1NUX0FTQyBpcyBub3Qgc2V0CiMgZW5kIG9m
IFNlcmlhbCBkcml2ZXJzCgpDT05GSUdfU0VSSUFMX01DVFJMX0dQSU89eQpDT05GSUdfU0VS
SUFMX0RFVl9CVVM9eQpDT05GSUdfU0VSSUFMX0RFVl9DVFJMX1RUWVBPUlQ9eQojIENPTkZJ
R19UVFlfUFJJTlRLIGlzIG5vdCBzZXQKIyBDT05GSUdfSFZDX0RDQyBpcyBub3Qgc2V0CiMg
Q09ORklHX0lQTUlfSEFORExFUiBpcyBub3Qgc2V0CkNPTkZJR19IV19SQU5ET009bQojIENP
TkZJR19IV19SQU5ET01fVElNRVJJT01FTSBpcyBub3Qgc2V0CkNPTkZJR19IV19SQU5ET01f
T01BUD1tCkNPTkZJR19IV19SQU5ET01fT01BUDNfUk9NPW0KIyBDT05GSUdfQVBQTElDT00g
aXMgbm90IHNldAojIENPTkZJR19SQVdfRFJJVkVSIGlzIG5vdCBzZXQKIyBDT05GSUdfVENH
X1RQTSBpcyBub3Qgc2V0CkNPTkZJR19ERVZQT1JUPXkKIyBDT05GSUdfWElMTFlCVVMgaXMg
bm90IHNldAojIGVuZCBvZiBDaGFyYWN0ZXIgZGV2aWNlcwoKIwojIEkyQyBzdXBwb3J0CiMK
Q09ORklHX0kyQz15CkNPTkZJR19JMkNfQk9BUkRJTkZPPXkKQ09ORklHX0kyQ19DT01QQVQ9
eQpDT05GSUdfSTJDX0NIQVJERVY9eQpDT05GSUdfSTJDX01VWD15CgojCiMgTXVsdGlwbGV4
ZXIgSTJDIENoaXAgc3VwcG9ydAojCiMgQ09ORklHX0kyQ19BUkJfR1BJT19DSEFMTEVOR0Ug
aXMgbm90IHNldAojIENPTkZJR19JMkNfTVVYX0dQSU8gaXMgbm90IHNldAojIENPTkZJR19J
MkNfTVVYX0dQTVVYIGlzIG5vdCBzZXQKIyBDT05GSUdfSTJDX01VWF9MVEM0MzA2IGlzIG5v
dCBzZXQKIyBDT05GSUdfSTJDX01VWF9QQ0E5NTQxIGlzIG5vdCBzZXQKIyBDT05GSUdfSTJD
X01VWF9QQ0E5NTR4IGlzIG5vdCBzZXQKIyBDT05GSUdfSTJDX01VWF9QSU5DVFJMIGlzIG5v
dCBzZXQKIyBDT05GSUdfSTJDX01VWF9SRUcgaXMgbm90IHNldAojIENPTkZJR19JMkNfREVN
VVhfUElOQ1RSTCBpcyBub3Qgc2V0CiMgQ09ORklHX0kyQ19NVVhfTUxYQ1BMRCBpcyBub3Qg
c2V0CiMgZW5kIG9mIE11bHRpcGxleGVyIEkyQyBDaGlwIHN1cHBvcnQKCkNPTkZJR19JMkNf
SEVMUEVSX0FVVE89eQpDT05GSUdfSTJDX0FMR09CSVQ9eQoKIwojIEkyQyBIYXJkd2FyZSBC
dXMgc3VwcG9ydAojCgojCiMgUEMgU01CdXMgaG9zdCBjb250cm9sbGVyIGRyaXZlcnMKIwoj
IENPTkZJR19JMkNfQUxJMTUzNSBpcyBub3Qgc2V0CiMgQ09ORklHX0kyQ19BTEkxNTYzIGlz
IG5vdCBzZXQKIyBDT05GSUdfSTJDX0FMSTE1WDMgaXMgbm90IHNldAojIENPTkZJR19JMkNf
QU1ENzU2IGlzIG5vdCBzZXQKIyBDT05GSUdfSTJDX0FNRDgxMTEgaXMgbm90IHNldAojIENP
TkZJR19JMkNfSTgwMSBpcyBub3Qgc2V0CiMgQ09ORklHX0kyQ19JU0NIIGlzIG5vdCBzZXQK
IyBDT05GSUdfSTJDX1BJSVg0IGlzIG5vdCBzZXQKIyBDT05GSUdfSTJDX05GT1JDRTIgaXMg
bm90IHNldAojIENPTkZJR19JMkNfTlZJRElBX0dQVSBpcyBub3Qgc2V0CiMgQ09ORklHX0ky
Q19TSVM1NTk1IGlzIG5vdCBzZXQKIyBDT05GSUdfSTJDX1NJUzYzMCBpcyBub3Qgc2V0CiMg
Q09ORklHX0kyQ19TSVM5NlggaXMgbm90IHNldAojIENPTkZJR19JMkNfVklBIGlzIG5vdCBz
ZXQKIyBDT05GSUdfSTJDX1ZJQVBSTyBpcyBub3Qgc2V0CgojCiMgSTJDIHN5c3RlbSBidXMg
ZHJpdmVycyAobW9zdGx5IGVtYmVkZGVkIC8gc3lzdGVtLW9uLWNoaXApCiMKIyBDT05GSUdf
STJDX0NCVVNfR1BJTyBpcyBub3Qgc2V0CiMgQ09ORklHX0kyQ19ERVNJR05XQVJFX1BMQVRG
T1JNIGlzIG5vdCBzZXQKIyBDT05GSUdfSTJDX0RFU0lHTldBUkVfUENJIGlzIG5vdCBzZXQK
IyBDT05GSUdfSTJDX0VNRVYyIGlzIG5vdCBzZXQKIyBDT05GSUdfSTJDX0dQSU8gaXMgbm90
IHNldAojIENPTkZJR19JMkNfT0NPUkVTIGlzIG5vdCBzZXQKQ09ORklHX0kyQ19PTUFQPXkK
IyBDT05GSUdfSTJDX1BDQV9QTEFURk9STSBpcyBub3Qgc2V0CiMgQ09ORklHX0kyQ19SSzNY
IGlzIG5vdCBzZXQKIyBDT05GSUdfSTJDX1NJTVRFQyBpcyBub3Qgc2V0CiMgQ09ORklHX0ky
Q19YSUxJTlggaXMgbm90IHNldAoKIwojIEV4dGVybmFsIEkyQy9TTUJ1cyBhZGFwdGVyIGRy
aXZlcnMKIwojIENPTkZJR19JMkNfRElPTEFOX1UyQyBpcyBub3Qgc2V0CiMgQ09ORklHX0ky
Q19QQVJQT1JUX0xJR0hUIGlzIG5vdCBzZXQKIyBDT05GSUdfSTJDX1JPQk9URlVaWl9PU0lG
IGlzIG5vdCBzZXQKIyBDT05GSUdfSTJDX1RBT1NfRVZNIGlzIG5vdCBzZXQKIyBDT05GSUdf
STJDX1RJTllfVVNCIGlzIG5vdCBzZXQKCiMKIyBPdGhlciBJMkMvU01CdXMgYnVzIGRyaXZl
cnMKIwojIGVuZCBvZiBJMkMgSGFyZHdhcmUgQnVzIHN1cHBvcnQKCiMgQ09ORklHX0kyQ19T
VFVCIGlzIG5vdCBzZXQKIyBDT05GSUdfSTJDX1NMQVZFIGlzIG5vdCBzZXQKIyBDT05GSUdf
STJDX0RFQlVHX0NPUkUgaXMgbm90IHNldAojIENPTkZJR19JMkNfREVCVUdfQUxHTyBpcyBu
b3Qgc2V0CiMgQ09ORklHX0kyQ19ERUJVR19CVVMgaXMgbm90IHNldAojIGVuZCBvZiBJMkMg
c3VwcG9ydAoKIyBDT05GSUdfSTNDIGlzIG5vdCBzZXQKQ09ORklHX1NQST15CiMgQ09ORklH
X1NQSV9ERUJVRyBpcyBub3Qgc2V0CkNPTkZJR19TUElfTUFTVEVSPXkKIyBDT05GSUdfU1BJ
X01FTSBpcyBub3Qgc2V0CgojCiMgU1BJIE1hc3RlciBDb250cm9sbGVyIERyaXZlcnMKIwoj
IENPTkZJR19TUElfQUxURVJBIGlzIG5vdCBzZXQKIyBDT05GSUdfU1BJX0FYSV9TUElfRU5H
SU5FIGlzIG5vdCBzZXQKIyBDT05GSUdfU1BJX0JJVEJBTkcgaXMgbm90IHNldAojIENPTkZJ
R19TUElfQ0FERU5DRSBpcyBub3Qgc2V0CiMgQ09ORklHX1NQSV9ERVNJR05XQVJFIGlzIG5v
dCBzZXQKIyBDT05GSUdfU1BJX05YUF9GTEVYU1BJIGlzIG5vdCBzZXQKIyBDT05GSUdfU1BJ
X0dQSU8gaXMgbm90IHNldAojIENPTkZJR19TUElfRlNMX1NQSSBpcyBub3Qgc2V0CiMgQ09O
RklHX1NQSV9PQ19USU5ZIGlzIG5vdCBzZXQKQ09ORklHX1NQSV9PTUFQMjRYWD15CiMgQ09O
RklHX1NQSV9USV9RU1BJIGlzIG5vdCBzZXQKIyBDT05GSUdfU1BJX1BYQTJYWCBpcyBub3Qg
c2V0CiMgQ09ORklHX1NQSV9ST0NLQ0hJUCBpcyBub3Qgc2V0CiMgQ09ORklHX1NQSV9TQzE4
SVM2MDIgaXMgbm90IHNldAojIENPTkZJR19TUElfU0lGSVZFIGlzIG5vdCBzZXQKIyBDT05G
SUdfU1BJX01YSUMgaXMgbm90IHNldAojIENPTkZJR19TUElfWENPTU0gaXMgbm90IHNldAoj
IENPTkZJR19TUElfWElMSU5YIGlzIG5vdCBzZXQKIyBDT05GSUdfU1BJX1pZTlFNUF9HUVNQ
SSBpcyBub3Qgc2V0CgojCiMgU1BJIFByb3RvY29sIE1hc3RlcnMKIwojIENPTkZJR19TUElf
U1BJREVWIGlzIG5vdCBzZXQKIyBDT05GSUdfU1BJX0xPT1BCQUNLX1RFU1QgaXMgbm90IHNl
dAojIENPTkZJR19TUElfVExFNjJYMCBpcyBub3Qgc2V0CiMgQ09ORklHX1NQSV9TTEFWRSBp
cyBub3Qgc2V0CiMgQ09ORklHX1NQTUkgaXMgbm90IHNldAojIENPTkZJR19IU0kgaXMgbm90
IHNldApDT05GSUdfUFBTPXkKIyBDT05GSUdfUFBTX0RFQlVHIGlzIG5vdCBzZXQKCiMKIyBQ
UFMgY2xpZW50cyBzdXBwb3J0CiMKIyBDT05GSUdfUFBTX0NMSUVOVF9LVElNRVIgaXMgbm90
IHNldAojIENPTkZJR19QUFNfQ0xJRU5UX0xESVNDIGlzIG5vdCBzZXQKIyBDT05GSUdfUFBT
X0NMSUVOVF9HUElPIGlzIG5vdCBzZXQKCiMKIyBQUFMgZ2VuZXJhdG9ycyBzdXBwb3J0CiMK
CiMKIyBQVFAgY2xvY2sgc3VwcG9ydAojCkNPTkZJR19QVFBfMTU4OF9DTE9DSz15CgojCiMg
RW5hYmxlIFBIWUxJQiBhbmQgTkVUV09SS19QSFlfVElNRVNUQU1QSU5HIHRvIHNlZSB0aGUg
YWRkaXRpb25hbCBjbG9ja3MuCiMKIyBlbmQgb2YgUFRQIGNsb2NrIHN1cHBvcnQKCkNPTkZJ
R19QSU5DVFJMPXkKQ09ORklHX0dFTkVSSUNfUElOQ1RSTF9HUk9VUFM9eQpDT05GSUdfUElO
TVVYPXkKQ09ORklHX0dFTkVSSUNfUElOTVVYX0ZVTkNUSU9OUz15CkNPTkZJR19QSU5DT05G
PXkKQ09ORklHX0dFTkVSSUNfUElOQ09ORj15CiMgQ09ORklHX0RFQlVHX1BJTkNUUkwgaXMg
bm90IHNldAojIENPTkZJR19QSU5DVFJMX0FNRCBpcyBub3Qgc2V0CiMgQ09ORklHX1BJTkNU
UkxfTUNQMjNTMDggaXMgbm90IHNldApDT05GSUdfUElOQ1RSTF9TSU5HTEU9eQojIENPTkZJ
R19QSU5DVFJMX1NYMTUwWCBpcyBub3Qgc2V0CiMgQ09ORklHX1BJTkNUUkxfU1RNRlggaXMg
bm90IHNldAojIENPTkZJR19QSU5DVFJMX1BBTE1BUyBpcyBub3Qgc2V0CiMgQ09ORklHX1BJ
TkNUUkxfT0NFTE9UIGlzIG5vdCBzZXQKQ09ORklHX1BJTkNUUkxfVElfSU9ERUxBWT15CkNP
TkZJR19BUkNIX0hBVkVfQ1VTVE9NX0dQSU9fSD15CkNPTkZJR19HUElPTElCPXkKQ09ORklH
X0dQSU9MSUJfRkFTVFBBVEhfTElNSVQ9NTEyCkNPTkZJR19PRl9HUElPPXkKQ09ORklHX0dQ
SU9MSUJfSVJRQ0hJUD15CiMgQ09ORklHX0RFQlVHX0dQSU8gaXMgbm90IHNldApDT05GSUdf
R1BJT19TWVNGUz15CgojCiMgTWVtb3J5IG1hcHBlZCBHUElPIGRyaXZlcnMKIwojIENPTkZJ
R19HUElPXzc0WFhfTU1JTyBpcyBub3Qgc2V0CiMgQ09ORklHX0dQSU9fQUxURVJBIGlzIG5v
dCBzZXQKIyBDT05GSUdfR1BJT19DQURFTkNFIGlzIG5vdCBzZXQKIyBDT05GSUdfR1BJT19E
V0FQQiBpcyBub3Qgc2V0CiMgQ09ORklHX0dQSU9fRVhBUiBpcyBub3Qgc2V0CiMgQ09ORklH
X0dQSU9fRlRHUElPMDEwIGlzIG5vdCBzZXQKIyBDT05GSUdfR1BJT19HRU5FUklDX1BMQVRG
T1JNIGlzIG5vdCBzZXQKIyBDT05GSUdfR1BJT19HUkdQSU8gaXMgbm90IHNldAojIENPTkZJ
R19HUElPX0hMV0QgaXMgbm90IHNldAojIENPTkZJR19HUElPX01CODZTN1ggaXMgbm90IHNl
dAojIENPTkZJR19HUElPX01QQzhYWFggaXMgbm90IHNldApDT05GSUdfR1BJT19PTUFQPXkK
IyBDT05GSUdfR1BJT19TQU1BNUQyX1BJT0JVIGlzIG5vdCBzZXQKIyBDT05GSUdfR1BJT19T
WVNDT04gaXMgbm90IHNldAojIENPTkZJR19HUElPX1hJTElOWCBpcyBub3Qgc2V0CiMgQ09O
RklHX0dQSU9fWkVWSU8gaXMgbm90IHNldAojIENPTkZJR19HUElPX0FNRF9GQ0ggaXMgbm90
IHNldAojIGVuZCBvZiBNZW1vcnkgbWFwcGVkIEdQSU8gZHJpdmVycwoKIwojIEkyQyBHUElP
IGV4cGFuZGVycwojCiMgQ09ORklHX0dQSU9fQURQNTU4OCBpcyBub3Qgc2V0CiMgQ09ORklH
X0dQSU9fQUROUCBpcyBub3Qgc2V0CiMgQ09ORklHX0dQSU9fR1dfUExEIGlzIG5vdCBzZXQK
IyBDT05GSUdfR1BJT19NQVg3MzAwIGlzIG5vdCBzZXQKIyBDT05GSUdfR1BJT19NQVg3MzJY
IGlzIG5vdCBzZXQKQ09ORklHX0dQSU9fUENBOTUzWD15CiMgQ09ORklHX0dQSU9fUENBOTUz
WF9JUlEgaXMgbm90IHNldApDT05GSUdfR1BJT19QQ0Y4NTdYPXkKIyBDT05GSUdfR1BJT19U
UElDMjgxMCBpcyBub3Qgc2V0CiMgZW5kIG9mIEkyQyBHUElPIGV4cGFuZGVycwoKIwojIE1G
RCBHUElPIGV4cGFuZGVycwojCiMgQ09ORklHX0hUQ19FR1BJTyBpcyBub3Qgc2V0CiMgQ09O
RklHX0dQSU9fTFA4NzNYIGlzIG5vdCBzZXQKQ09ORklHX0dQSU9fTFA4NzU2NT15CkNPTkZJ
R19HUElPX1BBTE1BUz15CiMgQ09ORklHX0dQSU9fVFBTNjUyMTggaXMgbm90IHNldAojIENP
TkZJR19HUElPX1RQUzY1OTEwIGlzIG5vdCBzZXQKQ09ORklHX0dQSU9fVFdMNDAzMD15CiMg
Q09ORklHX0dQSU9fVFdMNjA0MCBpcyBub3Qgc2V0CiMgZW5kIG9mIE1GRCBHUElPIGV4cGFu
ZGVycwoKIwojIFBDSSBHUElPIGV4cGFuZGVycwojCiMgQ09ORklHX0dQSU9fQlQ4WFggaXMg
bm90IHNldAojIENPTkZJR19HUElPX1BDSV9JRElPXzE2IGlzIG5vdCBzZXQKIyBDT05GSUdf
R1BJT19QQ0lFX0lESU9fMjQgaXMgbm90IHNldAojIENPTkZJR19HUElPX1JEQzMyMVggaXMg
bm90IHNldAojIGVuZCBvZiBQQ0kgR1BJTyBleHBhbmRlcnMKCiMKIyBTUEkgR1BJTyBleHBh
bmRlcnMKIwojIENPTkZJR19HUElPXzc0WDE2NCBpcyBub3Qgc2V0CiMgQ09ORklHX0dQSU9f
TUFYMzE5MVggaXMgbm90IHNldAojIENPTkZJR19HUElPX01BWDczMDEgaXMgbm90IHNldAoj
IENPTkZJR19HUElPX01DMzM4ODAgaXMgbm90IHNldAojIENPTkZJR19HUElPX1BJU09TUiBp
cyBub3Qgc2V0CiMgQ09ORklHX0dQSU9fWFJBMTQwMyBpcyBub3Qgc2V0CiMgZW5kIG9mIFNQ
SSBHUElPIGV4cGFuZGVycwoKIwojIFVTQiBHUElPIGV4cGFuZGVycwojCiMgZW5kIG9mIFVT
QiBHUElPIGV4cGFuZGVycwoKIyBDT05GSUdfR1BJT19NT0NLVVAgaXMgbm90IHNldAojIENP
TkZJR19XMSBpcyBub3Qgc2V0CkNPTkZJR19QT1dFUl9BVlM9eQpDT05GSUdfUE9XRVJfUkVT
RVQ9eQojIENPTkZJR19QT1dFUl9SRVNFVF9CUkNNS09OQSBpcyBub3Qgc2V0CiMgQ09ORklH
X1BPV0VSX1JFU0VUX0JSQ01TVEIgaXMgbm90IHNldApDT05GSUdfUE9XRVJfUkVTRVRfR1BJ
Tz15CiMgQ09ORklHX1BPV0VSX1JFU0VUX0dQSU9fUkVTVEFSVCBpcyBub3Qgc2V0CiMgQ09O
RklHX1BPV0VSX1JFU0VUX0xUQzI5NTIgaXMgbm90IHNldAojIENPTkZJR19QT1dFUl9SRVNF
VF9SRVNUQVJUIGlzIG5vdCBzZXQKIyBDT05GSUdfUE9XRVJfUkVTRVRfVkVSU0FUSUxFIGlz
IG5vdCBzZXQKIyBDT05GSUdfUE9XRVJfUkVTRVRfU1lTQ09OIGlzIG5vdCBzZXQKIyBDT05G
SUdfUE9XRVJfUkVTRVRfU1lTQ09OX1BPV0VST0ZGIGlzIG5vdCBzZXQKIyBDT05GSUdfU1lT
Q09OX1JFQk9PVF9NT0RFIGlzIG5vdCBzZXQKIyBDT05GSUdfTlZNRU1fUkVCT09UX01PREUg
aXMgbm90IHNldApDT05GSUdfUE9XRVJfU1VQUExZPXkKIyBDT05GSUdfUE9XRVJfU1VQUExZ
X0RFQlVHIGlzIG5vdCBzZXQKIyBDT05GSUdfUERBX1BPV0VSIGlzIG5vdCBzZXQKIyBDT05G
SUdfVEVTVF9QT1dFUiBpcyBub3Qgc2V0CiMgQ09ORklHX0NIQVJHRVJfQURQNTA2MSBpcyBu
b3Qgc2V0CiMgQ09ORklHX0JBVFRFUllfRFMyNzgwIGlzIG5vdCBzZXQKIyBDT05GSUdfQkFU
VEVSWV9EUzI3ODEgaXMgbm90IHNldAojIENPTkZJR19CQVRURVJZX0RTMjc4MiBpcyBub3Qg
c2V0CiMgQ09ORklHX0JBVFRFUllfU0JTIGlzIG5vdCBzZXQKIyBDT05GSUdfQ0hBUkdFUl9T
QlMgaXMgbm90IHNldAojIENPTkZJR19NQU5BR0VSX1NCUyBpcyBub3Qgc2V0CiMgQ09ORklH
X0JBVFRFUllfQlEyN1hYWCBpcyBub3Qgc2V0CiMgQ09ORklHX0JBVFRFUllfTUFYMTcwNDAg
aXMgbm90IHNldAojIENPTkZJR19CQVRURVJZX01BWDE3MDQyIGlzIG5vdCBzZXQKIyBDT05G
SUdfQ0hBUkdFUl9JU1AxNzA0IGlzIG5vdCBzZXQKIyBDT05GSUdfQ0hBUkdFUl9NQVg4OTAz
IGlzIG5vdCBzZXQKIyBDT05GSUdfQ0hBUkdFUl9MUDg3MjcgaXMgbm90IHNldAojIENPTkZJ
R19DSEFSR0VSX0dQSU8gaXMgbm90IHNldAojIENPTkZJR19DSEFSR0VSX01BTkFHRVIgaXMg
bm90IHNldAojIENPTkZJR19DSEFSR0VSX0xUMzY1MSBpcyBub3Qgc2V0CiMgQ09ORklHX0NI
QVJHRVJfREVURUNUT1JfTUFYMTQ2NTYgaXMgbm90IHNldAojIENPTkZJR19DSEFSR0VSX0JR
MjQxNVggaXMgbm90IHNldAojIENPTkZJR19DSEFSR0VSX0JRMjQxOTAgaXMgbm90IHNldAoj
IENPTkZJR19DSEFSR0VSX0JRMjQyNTcgaXMgbm90IHNldAojIENPTkZJR19DSEFSR0VSX0JR
MjQ3MzUgaXMgbm90IHNldAojIENPTkZJR19DSEFSR0VSX0JRMjU4OTAgaXMgbm90IHNldAoj
IENPTkZJR19DSEFSR0VSX1NNQjM0NyBpcyBub3Qgc2V0CiMgQ09ORklHX0NIQVJHRVJfVFBT
NjUyMTcgaXMgbm90IHNldAojIENPTkZJR19CQVRURVJZX0dBVUdFX0xUQzI5NDEgaXMgbm90
IHNldAojIENPTkZJR19DSEFSR0VSX1JUOTQ1NSBpcyBub3Qgc2V0CiMgQ09ORklHX0NIQVJH
RVJfVUNTMTAwMiBpcyBub3Qgc2V0CiMgQ09ORklHX0hXTU9OIGlzIG5vdCBzZXQKIyBDT05G
SUdfVEhFUk1BTCBpcyBub3Qgc2V0CkNPTkZJR19XQVRDSERPRz15CiMgQ09ORklHX1dBVENI
RE9HX0NPUkUgaXMgbm90IHNldAojIENPTkZJR19XQVRDSERPR19OT1dBWU9VVCBpcyBub3Qg
c2V0CkNPTkZJR19XQVRDSERPR19IQU5ETEVfQk9PVF9FTkFCTEVEPXkKQ09ORklHX1dBVENI
RE9HX09QRU5fVElNRU9VVD0wCiMgQ09ORklHX1dBVENIRE9HX1NZU0ZTIGlzIG5vdCBzZXQK
CiMKIyBXYXRjaGRvZyBQcmV0aW1lb3V0IEdvdmVybm9ycwojCgojCiMgV2F0Y2hkb2cgRGV2
aWNlIERyaXZlcnMKIwojIENPTkZJR19TT0ZUX1dBVENIRE9HIGlzIG5vdCBzZXQKIyBDT05G
SUdfR1BJT19XQVRDSERPRyBpcyBub3Qgc2V0CiMgQ09ORklHX1hJTElOWF9XQVRDSERPRyBp
cyBub3Qgc2V0CiMgQ09ORklHX1pJSVJBVkVfV0FUQ0hET0cgaXMgbm90IHNldAojIENPTkZJ
R19DQURFTkNFX1dBVENIRE9HIGlzIG5vdCBzZXQKIyBDT05GSUdfRlRXRFQwMTBfV0FUQ0hE
T0cgaXMgbm90IHNldAojIENPTkZJR19EV19XQVRDSERPRyBpcyBub3Qgc2V0CiMgQ09ORklH
X09NQVBfV0FUQ0hET0cgaXMgbm90IHNldAojIENPTkZJR19UV0w0MDMwX1dBVENIRE9HIGlz
IG5vdCBzZXQKIyBDT05GSUdfTUFYNjNYWF9XQVRDSERPRyBpcyBub3Qgc2V0CiMgQ09ORklH
X0FMSU03MTAxX1dEVCBpcyBub3Qgc2V0CiMgQ09ORklHX0k2MzAwRVNCX1dEVCBpcyBub3Qg
c2V0CiMgQ09ORklHX01FTl9BMjFfV0RUIGlzIG5vdCBzZXQKCiMKIyBQQ0ktYmFzZWQgV2F0
Y2hkb2cgQ2FyZHMKIwojIENPTkZJR19QQ0lQQ1dBVENIRE9HIGlzIG5vdCBzZXQKIyBDT05G
SUdfV0RUUENJIGlzIG5vdCBzZXQKCiMKIyBVU0ItYmFzZWQgV2F0Y2hkb2cgQ2FyZHMKIwoj
IENPTkZJR19VU0JQQ1dBVENIRE9HIGlzIG5vdCBzZXQKQ09ORklHX1NTQl9QT1NTSUJMRT15
CiMgQ09ORklHX1NTQiBpcyBub3Qgc2V0CkNPTkZJR19CQ01BX1BPU1NJQkxFPXkKIyBDT05G
SUdfQkNNQSBpcyBub3Qgc2V0CgojCiMgTXVsdGlmdW5jdGlvbiBkZXZpY2UgZHJpdmVycwoj
CkNPTkZJR19NRkRfQ09SRT15CiMgQ09ORklHX01GRF9BQ1Q4OTQ1QSBpcyBub3Qgc2V0CiMg
Q09ORklHX01GRF9BUzM3MTEgaXMgbm90IHNldAojIENPTkZJR19NRkRfQVMzNzIyIGlzIG5v
dCBzZXQKIyBDT05GSUdfUE1JQ19BRFA1NTIwIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX0FB
VDI4NzBfQ09SRSBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9BVE1FTF9GTEVYQ09NIGlzIG5v
dCBzZXQKIyBDT05GSUdfTUZEX0FUTUVMX0hMQ0RDIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZE
X0JDTTU5MFhYIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX0JEOTU3MU1XViBpcyBub3Qgc2V0
CiMgQ09ORklHX01GRF9BWFAyMFhfSTJDIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX0NST1Nf
RUMgaXMgbm90IHNldAojIENPTkZJR19NRkRfTUFERVJBIGlzIG5vdCBzZXQKIyBDT05GSUdf
TUZEX0FTSUMzIGlzIG5vdCBzZXQKIyBDT05GSUdfUE1JQ19EQTkwM1ggaXMgbm90IHNldAoj
IENPTkZJR19NRkRfREE5MDUyX1NQSSBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9EQTkwNTJf
STJDIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX0RBOTA1NSBpcyBub3Qgc2V0CiMgQ09ORklH
X01GRF9EQTkwNjIgaXMgbm90IHNldAojIENPTkZJR19NRkRfREE5MDYzIGlzIG5vdCBzZXQK
IyBDT05GSUdfTUZEX0RBOTE1MCBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9ETE4yIGlzIG5v
dCBzZXQKIyBDT05GSUdfTUZEX01DMTNYWFhfU1BJIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZE
X01DMTNYWFhfSTJDIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX0hJNjQyMV9QTUlDIGlzIG5v
dCBzZXQKIyBDT05GSUdfSFRDX1BBU0lDMyBpcyBub3Qgc2V0CiMgQ09ORklHX0hUQ19JMkNQ
TEQgaXMgbm90IHNldAojIENPTkZJR19MUENfSUNIIGlzIG5vdCBzZXQKIyBDT05GSUdfTFBD
X1NDSCBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9KQU5aX0NNT0RJTyBpcyBub3Qgc2V0CiMg
Q09ORklHX01GRF9LRU1QTEQgaXMgbm90IHNldAojIENPTkZJR19NRkRfODhQTTgwMCBpcyBu
b3Qgc2V0CiMgQ09ORklHX01GRF84OFBNODA1IGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEXzg4
UE04NjBYIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX01BWDE0NTc3IGlzIG5vdCBzZXQKIyBD
T05GSUdfTUZEX01BWDc3NjIwIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX01BWDc3NjUwIGlz
IG5vdCBzZXQKIyBDT05GSUdfTUZEX01BWDc3Njg2IGlzIG5vdCBzZXQKIyBDT05GSUdfTUZE
X01BWDc3NjkzIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX01BWDc3ODQzIGlzIG5vdCBzZXQK
IyBDT05GSUdfTUZEX01BWDg5MDcgaXMgbm90IHNldAojIENPTkZJR19NRkRfTUFYODkyNSBp
cyBub3Qgc2V0CiMgQ09ORklHX01GRF9NQVg4OTk3IGlzIG5vdCBzZXQKIyBDT05GSUdfTUZE
X01BWDg5OTggaXMgbm90IHNldAojIENPTkZJR19NRkRfTVQ2Mzk3IGlzIG5vdCBzZXQKIyBD
T05GSUdfTUZEX01FTkYyMUJNQyBpcyBub3Qgc2V0CiMgQ09ORklHX0VaWF9QQ0FQIGlzIG5v
dCBzZXQKQ09ORklHX01GRF9DUENBUD15CiMgQ09ORklHX01GRF9WSVBFUkJPQVJEIGlzIG5v
dCBzZXQKIyBDT05GSUdfTUZEX1JFVFUgaXMgbm90IHNldAojIENPTkZJR19NRkRfUENGNTA2
MzMgaXMgbm90IHNldAojIENPTkZJR19NRkRfUE04WFhYIGlzIG5vdCBzZXQKIyBDT05GSUdf
TUZEX1JEQzMyMVggaXMgbm90IHNldAojIENPTkZJR19NRkRfUlQ1MDMzIGlzIG5vdCBzZXQK
IyBDT05GSUdfTUZEX1JDNVQ1ODMgaXMgbm90IHNldAojIENPTkZJR19NRkRfUks4MDggaXMg
bm90IHNldAojIENPTkZJR19NRkRfUk41VDYxOCBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9T
RUNfQ09SRSBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9TSTQ3NlhfQ09SRSBpcyBub3Qgc2V0
CiMgQ09ORklHX01GRF9TTTUwMSBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9TS1k4MTQ1MiBp
cyBub3Qgc2V0CiMgQ09ORklHX01GRF9TTVNDIGlzIG5vdCBzZXQKIyBDT05GSUdfQUJYNTAw
X0NPUkUgaXMgbm90IHNldAojIENPTkZJR19NRkRfU1RNUEUgaXMgbm90IHNldApDT05GSUdf
TUZEX1NZU0NPTj15CiMgQ09ORklHX01GRF9USV9BTTMzNVhfVFNDQURDIGlzIG5vdCBzZXQK
IyBDT05GSUdfTUZEX0xQMzk0MyBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9MUDg3ODggaXMg
bm90IHNldAojIENPTkZJR19NRkRfVElfTE1VIGlzIG5vdCBzZXQKQ09ORklHX01GRF9PTUFQ
X1VTQl9IT1NUPXkKQ09ORklHX01GRF9QQUxNQVM9eQojIENPTkZJR19UUFM2MTA1WCBpcyBu
b3Qgc2V0CiMgQ09ORklHX1RQUzY1MDEwIGlzIG5vdCBzZXQKIyBDT05GSUdfVFBTNjUwN1gg
aXMgbm90IHNldAojIENPTkZJR19NRkRfVFBTNjUwODYgaXMgbm90IHNldAojIENPTkZJR19N
RkRfVFBTNjUwOTAgaXMgbm90IHNldApDT05GSUdfTUZEX1RQUzY1MjE3PXkKQ09ORklHX01G
RF9USV9MUDg3M1g9eQpDT05GSUdfTUZEX1RJX0xQODc1NjU9eQpDT05GSUdfTUZEX1RQUzY1
MjE4PXkKIyBDT05GSUdfTUZEX1RQUzY1ODZYIGlzIG5vdCBzZXQKQ09ORklHX01GRF9UUFM2
NTkxMD15CiMgQ09ORklHX01GRF9UUFM2NTkxMl9JMkMgaXMgbm90IHNldAojIENPTkZJR19N
RkRfVFBTNjU5MTJfU1BJIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX1RQUzgwMDMxIGlzIG5v
dCBzZXQKQ09ORklHX1RXTDQwMzBfQ09SRT15CkNPTkZJR19UV0w0MDMwX1BPV0VSPXkKIyBD
T05GSUdfTUZEX1RXTDQwMzBfQVVESU8gaXMgbm90IHNldApDT05GSUdfVFdMNjA0MF9DT1JF
PXkKQ09ORklHX01FTkVMQVVTPXkKIyBDT05GSUdfTUZEX1dMMTI3M19DT1JFIGlzIG5vdCBz
ZXQKIyBDT05GSUdfTUZEX0xNMzUzMyBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9UQzM1ODlY
IGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX1Q3TDY2WEIgaXMgbm90IHNldAojIENPTkZJR19N
RkRfVEM2Mzg3WEIgaXMgbm90IHNldAojIENPTkZJR19NRkRfVEM2MzkzWEIgaXMgbm90IHNl
dAojIENPTkZJR19NRkRfVFFNWDg2IGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX1ZYODU1IGlz
IG5vdCBzZXQKIyBDT05GSUdfTUZEX0xPQ0hOQUdBUiBpcyBub3Qgc2V0CiMgQ09ORklHX01G
RF9BUklaT05BX0kyQyBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9BUklaT05BX1NQSSBpcyBu
b3Qgc2V0CiMgQ09ORklHX01GRF9XTTg0MDAgaXMgbm90IHNldAojIENPTkZJR19NRkRfV004
MzFYX0kyQyBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9XTTgzMVhfU1BJIGlzIG5vdCBzZXQK
IyBDT05GSUdfTUZEX1dNODM1MF9JMkMgaXMgbm90IHNldAojIENPTkZJR19NRkRfV004OTk0
IGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX1JPSE1fQkQ3MThYWCBpcyBub3Qgc2V0CiMgQ09O
RklHX01GRF9ST0hNX0JENzA1MjggaXMgbm90IHNldAojIENPTkZJR19NRkRfU1RQTUlDMSBp
cyBub3Qgc2V0CiMgQ09ORklHX01GRF9TVE1GWCBpcyBub3Qgc2V0CiMgQ09ORklHX1JBVkVf
U1BfQ09SRSBpcyBub3Qgc2V0CiMgZW5kIG9mIE11bHRpZnVuY3Rpb24gZGV2aWNlIGRyaXZl
cnMKCkNPTkZJR19SRUdVTEFUT1I9eQojIENPTkZJR19SRUdVTEFUT1JfREVCVUcgaXMgbm90
IHNldApDT05GSUdfUkVHVUxBVE9SX0ZJWEVEX1ZPTFRBR0U9eQojIENPTkZJR19SRUdVTEFU
T1JfVklSVFVBTF9DT05TVU1FUiBpcyBub3Qgc2V0CiMgQ09ORklHX1JFR1VMQVRPUl9VU0VS
U1BBQ0VfQ09OU1VNRVIgaXMgbm90IHNldAojIENPTkZJR19SRUdVTEFUT1JfODhQRzg2WCBp
cyBub3Qgc2V0CiMgQ09ORklHX1JFR1VMQVRPUl9BQ1Q4ODY1IGlzIG5vdCBzZXQKIyBDT05G
SUdfUkVHVUxBVE9SX0FENTM5OCBpcyBub3Qgc2V0CiMgQ09ORklHX1JFR1VMQVRPUl9BTkFU
T1AgaXMgbm90IHNldApDT05GSUdfUkVHVUxBVE9SX0NQQ0FQPXkKIyBDT05GSUdfUkVHVUxB
VE9SX0RBOTIxMCBpcyBub3Qgc2V0CiMgQ09ORklHX1JFR1VMQVRPUl9EQTkyMTEgaXMgbm90
IHNldAojIENPTkZJR19SRUdVTEFUT1JfRkFONTM1NTUgaXMgbm90IHNldApDT05GSUdfUkVH
VUxBVE9SX0dQSU89eQojIENPTkZJR19SRUdVTEFUT1JfSVNMOTMwNSBpcyBub3Qgc2V0CiMg
Q09ORklHX1JFR1VMQVRPUl9JU0w2MjcxQSBpcyBub3Qgc2V0CiMgQ09ORklHX1JFR1VMQVRP
Ul9MUDM5NzEgaXMgbm90IHNldAojIENPTkZJR19SRUdVTEFUT1JfTFAzOTcyIGlzIG5vdCBz
ZXQKQ09ORklHX1JFR1VMQVRPUl9MUDg3Mlg9eQpDT05GSUdfUkVHVUxBVE9SX0xQODczWD15
CiMgQ09ORklHX1JFR1VMQVRPUl9MUDg3NTUgaXMgbm90IHNldApDT05GSUdfUkVHVUxBVE9S
X0xQODc1NjU9eQojIENPTkZJR19SRUdVTEFUT1JfTFRDMzU4OSBpcyBub3Qgc2V0CiMgQ09O
RklHX1JFR1VMQVRPUl9MVEMzNjc2IGlzIG5vdCBzZXQKIyBDT05GSUdfUkVHVUxBVE9SX01B
WDE1ODYgaXMgbm90IHNldAojIENPTkZJR19SRUdVTEFUT1JfTUFYODY0OSBpcyBub3Qgc2V0
CiMgQ09ORklHX1JFR1VMQVRPUl9NQVg4NjYwIGlzIG5vdCBzZXQKIyBDT05GSUdfUkVHVUxB
VE9SX01BWDg5NTIgaXMgbm90IHNldAojIENPTkZJR19SRUdVTEFUT1JfTUNQMTY1MDIgaXMg
bm90IHNldAojIENPTkZJR19SRUdVTEFUT1JfTVQ2MzExIGlzIG5vdCBzZXQKQ09ORklHX1JF
R1VMQVRPUl9QQUxNQVM9eQpDT05GSUdfUkVHVUxBVE9SX1BCSUFTPXkKIyBDT05GSUdfUkVH
VUxBVE9SX1BGVVpFMTAwIGlzIG5vdCBzZXQKIyBDT05GSUdfUkVHVUxBVE9SX1BWODgwNjAg
aXMgbm90IHNldAojIENPTkZJR19SRUdVTEFUT1JfUFY4ODA4MCBpcyBub3Qgc2V0CiMgQ09O
RklHX1JFR1VMQVRPUl9QVjg4MDkwIGlzIG5vdCBzZXQKIyBDT05GSUdfUkVHVUxBVE9SX1BX
TSBpcyBub3Qgc2V0CiMgQ09ORklHX1JFR1VMQVRPUl9TTEc1MTAwMCBpcyBub3Qgc2V0CkNP
TkZJR19SRUdVTEFUT1JfVElfQUJCPXkKIyBDT05GSUdfUkVHVUxBVE9SX1NZODEwNkEgaXMg
bm90IHNldAojIENPTkZJR19SRUdVTEFUT1JfVFBTNTE2MzIgaXMgbm90IHNldAojIENPTkZJ
R19SRUdVTEFUT1JfVFBTNjIzNjAgaXMgbm90IHNldApDT05GSUdfUkVHVUxBVE9SX1RQUzY1
MDIzPXkKQ09ORklHX1JFR1VMQVRPUl9UUFM2NTA3WD15CiMgQ09ORklHX1JFR1VMQVRPUl9U
UFM2NTEzMiBpcyBub3Qgc2V0CkNPTkZJR19SRUdVTEFUT1JfVFBTNjUyMTc9eQpDT05GSUdf
UkVHVUxBVE9SX1RQUzY1MjE4PXkKIyBDT05GSUdfUkVHVUxBVE9SX1RQUzY1MjRYIGlzIG5v
dCBzZXQKQ09ORklHX1JFR1VMQVRPUl9UUFM2NTkxMD15CkNPTkZJR19SRUdVTEFUT1JfVFdM
NDAzMD15CiMgQ09ORklHX1JFR1VMQVRPUl9WQ1RSTCBpcyBub3Qgc2V0CkNPTkZJR19DRUNf
Q09SRT15CiMgQ09ORklHX1JDX0NPUkUgaXMgbm90IHNldApDT05GSUdfTUVESUFfU1VQUE9S
VD15CgojCiMgTXVsdGltZWRpYSBjb3JlIHN1cHBvcnQKIwpDT05GSUdfTUVESUFfQ0FNRVJB
X1NVUFBPUlQ9eQojIENPTkZJR19NRURJQV9BTkFMT0dfVFZfU1VQUE9SVCBpcyBub3Qgc2V0
CiMgQ09ORklHX01FRElBX0RJR0lUQUxfVFZfU1VQUE9SVCBpcyBub3Qgc2V0CiMgQ09ORklH
X01FRElBX1JBRElPX1NVUFBPUlQgaXMgbm90IHNldAojIENPTkZJR19NRURJQV9TRFJfU1VQ
UE9SVCBpcyBub3Qgc2V0CkNPTkZJR19NRURJQV9DRUNfU1VQUE9SVD15CkNPTkZJR19NRURJ
QV9DT05UUk9MTEVSPXkKQ09ORklHX1ZJREVPX0RFVj15CkNPTkZJR19WSURFT19WNEwyX1NV
QkRFVl9BUEk9eQpDT05GSUdfVklERU9fVjRMMj15CiMgQ09ORklHX1ZJREVPX0FEVl9ERUJV
RyBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJREVPX0ZJWEVEX01JTk9SX1JBTkdFUyBpcyBub3Qg
c2V0CkNPTkZJR19WNEwyX01FTTJNRU1fREVWPXkKQ09ORklHX1Y0TDJfRldOT0RFPXkKCiMK
IyBNZWRpYSBkcml2ZXJzCiMKIyBDT05GSUdfTUVESUFfVVNCX1NVUFBPUlQgaXMgbm90IHNl
dAojIENPTkZJR19NRURJQV9QQ0lfU1VQUE9SVCBpcyBub3Qgc2V0CkNPTkZJR19WNExfUExB
VEZPUk1fRFJJVkVSUz15CiMgQ09ORklHX1ZJREVPX0NBRkVfQ0NJQyBpcyBub3Qgc2V0CiMg
Q09ORklHX1ZJREVPX0NBREVOQ0UgaXMgbm90IHNldAojIENPTkZJR19WSURFT19BU1BFRUQg
aXMgbm90IHNldAojIENPTkZJR19WSURFT19NVVggaXMgbm90IHNldAojIENPTkZJR19WSURF
T19PTUFQMyBpcyBub3Qgc2V0CkNPTkZJR19WSURFT19BTTQzN1hfVlBGRT15CiMgQ09ORklH
X1ZJREVPX1hJTElOWCBpcyBub3Qgc2V0CkNPTkZJR19WSURFT19USV9DQUw9eQpDT05GSUdf
VjRMX01FTTJNRU1fRFJJVkVSUz15CiMgQ09ORklHX1ZJREVPX01FTTJNRU1fREVJTlRFUkxB
Q0UgaXMgbm90IHNldAojIENPTkZJR19WSURFT19TSF9WRVUgaXMgbm90IHNldApDT05GSUdf
VklERU9fVElfVlBFPXkKIyBDT05GSUdfVklERU9fVElfVlBFX0RFQlVHIGlzIG5vdCBzZXQK
Q09ORklHX1ZJREVPX1RJX1ZQRE1BPXkKQ09ORklHX1ZJREVPX1RJX1NDPXkKQ09ORklHX1ZJ
REVPX1RJX0NTQz15CiMgQ09ORklHX1Y0TF9URVNUX0RSSVZFUlMgaXMgbm90IHNldApDT05G
SUdfQ0VDX1BMQVRGT1JNX0RSSVZFUlM9eQojIENPTkZJR19DRUNfR1BJTyBpcyBub3Qgc2V0
CgojCiMgU3VwcG9ydGVkIE1NQy9TRElPIGFkYXB0ZXJzCiMKIyBDT05GSUdfQ1lQUkVTU19G
SVJNV0FSRSBpcyBub3Qgc2V0CkNPTkZJR19WSURFT0JVRjJfQ09SRT15CkNPTkZJR19WSURF
T0JVRjJfVjRMMj15CkNPTkZJR19WSURFT0JVRjJfTUVNT1BTPXkKQ09ORklHX1ZJREVPQlVG
Ml9ETUFfQ09OVElHPXkKCiMKIyBNZWRpYSBhbmNpbGxhcnkgZHJpdmVycyAodHVuZXJzLCBz
ZW5zb3JzLCBpMmMsIHNwaSwgZnJvbnRlbmRzKQojCiMgQ09ORklHX01FRElBX1NVQkRSVl9B
VVRPU0VMRUNUIGlzIG5vdCBzZXQKCiMKIyBJMkMgRW5jb2RlcnMsIGRlY29kZXJzLCBzZW5z
b3JzIGFuZCBvdGhlciBoZWxwZXIgY2hpcHMKIwoKIwojIEF1ZGlvIGRlY29kZXJzLCBwcm9j
ZXNzb3JzIGFuZCBtaXhlcnMKIwojIENPTkZJR19WSURFT19UVkFVRElPIGlzIG5vdCBzZXQK
IyBDT05GSUdfVklERU9fVERBNzQzMiBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJREVPX1REQTk4
NDAgaXMgbm90IHNldAojIENPTkZJR19WSURFT19UREExOTk3WCBpcyBub3Qgc2V0CiMgQ09O
RklHX1ZJREVPX1RFQTY0MTVDIGlzIG5vdCBzZXQKIyBDT05GSUdfVklERU9fVEVBNjQyMCBp
cyBub3Qgc2V0CiMgQ09ORklHX1ZJREVPX01TUDM0MDAgaXMgbm90IHNldAojIENPTkZJR19W
SURFT19DUzMzMDggaXMgbm90IHNldAojIENPTkZJR19WSURFT19DUzUzNDUgaXMgbm90IHNl
dAojIENPTkZJR19WSURFT19DUzUzTDMyQSBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJREVPX1RM
VjMyMEFJQzIzQiBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJREVPX1VEQTEzNDIgaXMgbm90IHNl
dAojIENPTkZJR19WSURFT19XTTg3NzUgaXMgbm90IHNldAojIENPTkZJR19WSURFT19XTTg3
MzkgaXMgbm90IHNldAojIENPTkZJR19WSURFT19WUDI3U01QWCBpcyBub3Qgc2V0CiMgQ09O
RklHX1ZJREVPX1NPTllfQlRGX01QWCBpcyBub3Qgc2V0CgojCiMgUkRTIGRlY29kZXJzCiMK
IyBDT05GSUdfVklERU9fU0FBNjU4OCBpcyBub3Qgc2V0CgojCiMgVmlkZW8gZGVjb2RlcnMK
IwojIENPTkZJR19WSURFT19BRFY3MTgwIGlzIG5vdCBzZXQKIyBDT05GSUdfVklERU9fQURW
NzE4MyBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJREVPX0FEVjc0OFggaXMgbm90IHNldAojIENP
TkZJR19WSURFT19BRFY3NjA0IGlzIG5vdCBzZXQKIyBDT05GSUdfVklERU9fQURWNzg0MiBp
cyBub3Qgc2V0CiMgQ09ORklHX1ZJREVPX0JUODE5IGlzIG5vdCBzZXQKIyBDT05GSUdfVklE
RU9fQlQ4NTYgaXMgbm90IHNldAojIENPTkZJR19WSURFT19CVDg2NiBpcyBub3Qgc2V0CiMg
Q09ORklHX1ZJREVPX0tTMDEyNyBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJREVPX01MODZWNzY2
NyBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJREVPX1NBQTcxMTAgaXMgbm90IHNldAojIENPTkZJ
R19WSURFT19TQUE3MTFYIGlzIG5vdCBzZXQKIyBDT05GSUdfVklERU9fVEMzNTg3NDMgaXMg
bm90IHNldAojIENPTkZJR19WSURFT19UVlA1MTRYIGlzIG5vdCBzZXQKIyBDT05GSUdfVklE
RU9fVFZQNTE1MCBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJREVPX1RWUDcwMDIgaXMgbm90IHNl
dAojIENPTkZJR19WSURFT19UVzI4MDQgaXMgbm90IHNldAojIENPTkZJR19WSURFT19UVzk5
MDMgaXMgbm90IHNldAojIENPTkZJR19WSURFT19UVzk5MDYgaXMgbm90IHNldAojIENPTkZJ
R19WSURFT19UVzk5MTAgaXMgbm90IHNldAojIENPTkZJR19WSURFT19WUFgzMjIwIGlzIG5v
dCBzZXQKCiMKIyBWaWRlbyBhbmQgYXVkaW8gZGVjb2RlcnMKIwojIENPTkZJR19WSURFT19T
QUE3MTdYIGlzIG5vdCBzZXQKIyBDT05GSUdfVklERU9fQ1gyNTg0MCBpcyBub3Qgc2V0Cgoj
CiMgVmlkZW8gZW5jb2RlcnMKIwojIENPTkZJR19WSURFT19TQUE3MTI3IGlzIG5vdCBzZXQK
IyBDT05GSUdfVklERU9fU0FBNzE4NSBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJREVPX0FEVjcx
NzAgaXMgbm90IHNldAojIENPTkZJR19WSURFT19BRFY3MTc1IGlzIG5vdCBzZXQKIyBDT05G
SUdfVklERU9fQURWNzM0MyBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJREVPX0FEVjczOTMgaXMg
bm90IHNldAojIENPTkZJR19WSURFT19BRFY3NTExIGlzIG5vdCBzZXQKIyBDT05GSUdfVklE
RU9fQUQ5Mzg5QiBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJREVPX0FLODgxWCBpcyBub3Qgc2V0
CiMgQ09ORklHX1ZJREVPX1RIUzgyMDAgaXMgbm90IHNldAoKIwojIENhbWVyYSBzZW5zb3Ig
ZGV2aWNlcwojCiMgQ09ORklHX1ZJREVPX0lNWDIxNCBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJ
REVPX0lNWDI1OCBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJREVPX0lNWDI3NCBpcyBub3Qgc2V0
CiMgQ09ORklHX1ZJREVPX0lNWDMxOSBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJREVPX0lNWDM1
NSBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJREVPX09WMjY0MCBpcyBub3Qgc2V0CkNPTkZJR19W
SURFT19PVjI2NTk9eQojIENPTkZJR19WSURFT19PVjI2ODAgaXMgbm90IHNldAojIENPTkZJ
R19WSURFT19PVjI2ODUgaXMgbm90IHNldApDT05GSUdfVklERU9fT1Y1NjQwPW0KIyBDT05G
SUdfVklERU9fT1Y1NjQ1IGlzIG5vdCBzZXQKIyBDT05GSUdfVklERU9fT1Y1NjQ3IGlzIG5v
dCBzZXQKIyBDT05GSUdfVklERU9fT1Y2NjUwIGlzIG5vdCBzZXQKIyBDT05GSUdfVklERU9f
T1Y1NjcwIGlzIG5vdCBzZXQKIyBDT05GSUdfVklERU9fT1Y1Njk1IGlzIG5vdCBzZXQKIyBD
T05GSUdfVklERU9fT1Y3MjUxIGlzIG5vdCBzZXQKIyBDT05GSUdfVklERU9fT1Y3NzJYIGlz
IG5vdCBzZXQKIyBDT05GSUdfVklERU9fT1Y3NjQwIGlzIG5vdCBzZXQKIyBDT05GSUdfVklE
RU9fT1Y3NjcwIGlzIG5vdCBzZXQKIyBDT05GSUdfVklERU9fT1Y3NzQwIGlzIG5vdCBzZXQK
IyBDT05GSUdfVklERU9fT1Y4ODU2IGlzIG5vdCBzZXQKIyBDT05GSUdfVklERU9fT1Y5NjQw
IGlzIG5vdCBzZXQKIyBDT05GSUdfVklERU9fT1Y5NjUwIGlzIG5vdCBzZXQKIyBDT05GSUdf
VklERU9fT1YxMzg1OCBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJREVPX1ZTNjYyNCBpcyBub3Qg
c2V0CiMgQ09ORklHX1ZJREVPX01UOU0wMDEgaXMgbm90IHNldAojIENPTkZJR19WSURFT19N
VDlNMDMyIGlzIG5vdCBzZXQKIyBDT05GSUdfVklERU9fTVQ5TTExMSBpcyBub3Qgc2V0CiMg
Q09ORklHX1ZJREVPX01UOVAwMzEgaXMgbm90IHNldAojIENPTkZJR19WSURFT19NVDlUMDAx
IGlzIG5vdCBzZXQKIyBDT05GSUdfVklERU9fTVQ5VDExMiBpcyBub3Qgc2V0CiMgQ09ORklH
X1ZJREVPX01UOVYwMTEgaXMgbm90IHNldAojIENPTkZJR19WSURFT19NVDlWMDMyIGlzIG5v
dCBzZXQKIyBDT05GSUdfVklERU9fTVQ5VjExMSBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJREVP
X1NSMDMwUEMzMCBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJREVPX05PT04wMTBQQzMwIGlzIG5v
dCBzZXQKIyBDT05GSUdfVklERU9fTTVNT0xTIGlzIG5vdCBzZXQKIyBDT05GSUdfVklERU9f
Uko1NE4xIGlzIG5vdCBzZXQKIyBDT05GSUdfVklERU9fUzVLNkFBIGlzIG5vdCBzZXQKIyBD
T05GSUdfVklERU9fUzVLNkEzIGlzIG5vdCBzZXQKIyBDT05GSUdfVklERU9fUzVLNEVDR1gg
aXMgbm90IHNldAojIENPTkZJR19WSURFT19TNUs1QkFGIGlzIG5vdCBzZXQKIyBDT05GSUdf
VklERU9fU01JQVBQIGlzIG5vdCBzZXQKIyBDT05GSUdfVklERU9fRVQ4RUs4IGlzIG5vdCBz
ZXQKIyBDT05GSUdfVklERU9fUzVDNzNNMyBpcyBub3Qgc2V0CgojCiMgTGVucyBkcml2ZXJz
CiMKIyBDT05GSUdfVklERU9fQUQ1ODIwIGlzIG5vdCBzZXQKIyBDT05GSUdfVklERU9fQUs3
Mzc1IGlzIG5vdCBzZXQKIyBDT05GSUdfVklERU9fRFc5NzE0IGlzIG5vdCBzZXQKIyBDT05G
SUdfVklERU9fRFc5ODA3X1ZDTSBpcyBub3Qgc2V0CgojCiMgRmxhc2ggZGV2aWNlcwojCiMg
Q09ORklHX1ZJREVPX0FEUDE2NTMgaXMgbm90IHNldAojIENPTkZJR19WSURFT19MTTM1NjAg
aXMgbm90IHNldAojIENPTkZJR19WSURFT19MTTM2NDYgaXMgbm90IHNldAoKIwojIFZpZGVv
IGltcHJvdmVtZW50IGNoaXBzCiMKIyBDT05GSUdfVklERU9fVVBENjQwMzFBIGlzIG5vdCBz
ZXQKIyBDT05GSUdfVklERU9fVVBENjQwODMgaXMgbm90IHNldAoKIwojIEF1ZGlvL1ZpZGVv
IGNvbXByZXNzaW9uIGNoaXBzCiMKIyBDT05GSUdfVklERU9fU0FBNjc1MkhTIGlzIG5vdCBz
ZXQKCiMKIyBTRFIgdHVuZXIgY2hpcHMKIwoKIwojIE1pc2NlbGxhbmVvdXMgaGVscGVyIGNo
aXBzCiMKIyBDT05GSUdfVklERU9fVEhTNzMwMyBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJREVP
X001Mjc5MCBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJREVPX0kyQyBpcyBub3Qgc2V0CiMgQ09O
RklHX1ZJREVPX1NUX01JUElEMDIgaXMgbm90IHNldAojIGVuZCBvZiBJMkMgRW5jb2RlcnMs
IGRlY29kZXJzLCBzZW5zb3JzIGFuZCBvdGhlciBoZWxwZXIgY2hpcHMKCiMKIyBTUEkgaGVs
cGVyIGNoaXBzCiMKIyBDT05GSUdfVklERU9fR1MxNjYyIGlzIG5vdCBzZXQKIyBlbmQgb2Yg
U1BJIGhlbHBlciBjaGlwcwoKIwojIE1lZGlhIFNQSSBBZGFwdGVycwojCiMgZW5kIG9mIE1l
ZGlhIFNQSSBBZGFwdGVycwoKIwojIEN1c3RvbWlzZSBEVkIgRnJvbnRlbmRzCiMKCiMKIyBU
b29scyB0byBkZXZlbG9wIG5ldyBmcm9udGVuZHMKIwojIGVuZCBvZiBDdXN0b21pc2UgRFZC
IEZyb250ZW5kcwoKIwojIEdyYXBoaWNzIHN1cHBvcnQKIwpDT05GSUdfVkdBX0FSQj15CkNP
TkZJR19WR0FfQVJCX01BWF9HUFVTPTE2CiMgQ09ORklHX0lNWF9JUFVWM19DT1JFIGlzIG5v
dCBzZXQKQ09ORklHX0RSTT15CiMgQ09ORklHX0RSTV9EUF9BVVhfQ0hBUkRFViBpcyBub3Qg
c2V0CiMgQ09ORklHX0RSTV9ERUJVR19NTSBpcyBub3Qgc2V0CiMgQ09ORklHX0RSTV9ERUJV
R19TRUxGVEVTVCBpcyBub3Qgc2V0CkNPTkZJR19EUk1fS01TX0hFTFBFUj15CkNPTkZJR19E
Uk1fS01TX0ZCX0hFTFBFUj15CkNPTkZJR19EUk1fRkJERVZfRU1VTEFUSU9OPXkKQ09ORklH
X0RSTV9GQkRFVl9PVkVSQUxMT0M9MTAwCiMgQ09ORklHX0RSTV9GQkRFVl9MRUFLX1BIWVNf
U01FTSBpcyBub3Qgc2V0CkNPTkZJR19EUk1fTE9BRF9FRElEX0ZJUk1XQVJFPXkKIyBDT05G
SUdfRFJNX0RQX0NFQyBpcyBub3Qgc2V0CgojCiMgSTJDIGVuY29kZXIgb3IgaGVscGVyIGNo
aXBzCiMKIyBDT05GSUdfRFJNX0kyQ19DSDcwMDYgaXMgbm90IHNldAojIENPTkZJR19EUk1f
STJDX1NJTDE2NCBpcyBub3Qgc2V0CkNPTkZJR19EUk1fSTJDX05YUF9UREE5OThYPW0KIyBD
T05GSUdfRFJNX0kyQ19OWFBfVERBOTk1MCBpcyBub3Qgc2V0CiMgZW5kIG9mIEkyQyBlbmNv
ZGVyIG9yIGhlbHBlciBjaGlwcwoKIwojIEFSTSBkZXZpY2VzCiMKIyBDT05GSUdfRFJNX0hE
TENEIGlzIG5vdCBzZXQKIyBDT05GSUdfRFJNX01BTElfRElTUExBWSBpcyBub3Qgc2V0CiMg
Q09ORklHX0RSTV9LT01FREEgaXMgbm90IHNldAojIGVuZCBvZiBBUk0gZGV2aWNlcwoKIyBD
T05GSUdfRFJNX1JBREVPTiBpcyBub3Qgc2V0CiMgQ09ORklHX0RSTV9BTURHUFUgaXMgbm90
IHNldAoKIwojIEFDUCAoQXVkaW8gQ29Qcm9jZXNzb3IpIENvbmZpZ3VyYXRpb24KIwojIGVu
ZCBvZiBBQ1AgKEF1ZGlvIENvUHJvY2Vzc29yKSBDb25maWd1cmF0aW9uCgojIENPTkZJR19E
Uk1fTk9VVkVBVSBpcyBub3Qgc2V0CiMgQ09ORklHX0RSTV9WR0VNIGlzIG5vdCBzZXQKIyBD
T05GSUdfRFJNX1ZLTVMgaXMgbm90IHNldAojIENPTkZJR19EUk1fRVhZTk9TIGlzIG5vdCBz
ZXQKIyBDT05GSUdfRFJNX1VETCBpcyBub3Qgc2V0CiMgQ09ORklHX0RSTV9BU1QgaXMgbm90
IHNldAojIENPTkZJR19EUk1fTUdBRzIwMCBpcyBub3Qgc2V0CiMgQ09ORklHX0RSTV9DSVJS
VVNfUUVNVSBpcyBub3Qgc2V0CiMgQ09ORklHX0RSTV9BUk1BREEgaXMgbm90IHNldAojIENP
TkZJR19EUk1fUkNBUl9EV19IRE1JIGlzIG5vdCBzZXQKIyBDT05GSUdfRFJNX1JDQVJfTFZE
UyBpcyBub3Qgc2V0CkNPTkZJR19EUk1fT01BUD15CkNPTkZJR19PTUFQMl9EU1NfSU5JVD15
CkNPTkZJR19PTUFQX0RTU19CQVNFPXkKQ09ORklHX09NQVAyX0RTUz15CiMgQ09ORklHX09N
QVAyX0RTU19ERUJVRyBpcyBub3Qgc2V0CkNPTkZJR19PTUFQMl9EU1NfREVCVUdGUz15CiMg
Q09ORklHX09NQVAyX0RTU19DT0xMRUNUX0lSUV9TVEFUUyBpcyBub3Qgc2V0CkNPTkZJR19P
TUFQMl9EU1NfRFBJPXkKQ09ORklHX09NQVAyX0RTU19WRU5DPXkKQ09ORklHX09NQVAyX0RT
U19IRE1JX0NPTU1PTj15CkNPTkZJR19PTUFQNF9EU1NfSERNST15CkNPTkZJR19PTUFQNF9E
U1NfSERNSV9DRUM9eQpDT05GSUdfT01BUDVfRFNTX0hETUk9eQpDT05GSUdfT01BUDJfRFNT
X1NEST15CkNPTkZJR19PTUFQMl9EU1NfRFNJPXkKQ09ORklHX09NQVAyX0RTU19NSU5fRkNL
X1BFUl9QQ0s9MApDT05GSUdfT01BUDJfRFNTX1NMRUVQX0FGVEVSX1ZFTkNfUkVTRVQ9eQoK
IwojIE9NQVBEUk0gRXh0ZXJuYWwgRGlzcGxheSBEZXZpY2UgRHJpdmVycwojCiMgQ09ORklH
X0RSTV9PTUFQX0VOQ09ERVJfT1BBMzYyIGlzIG5vdCBzZXQKIyBDT05GSUdfRFJNX09NQVBf
RU5DT0RFUl9UUEQxMlMwMTUgaXMgbm90IHNldAojIENPTkZJR19EUk1fT01BUF9DT05ORUNU
T1JfSERNSSBpcyBub3Qgc2V0CkNPTkZJR19EUk1fT01BUF9DT05ORUNUT1JfQU5BTE9HX1RW
PXkKIyBDT05GSUdfRFJNX09NQVBfUEFORUxfRFNJX0NNIGlzIG5vdCBzZXQKIyBDT05GSUdf
RFJNX09NQVBfUEFORUxfU09OWV9BQ1g1NjVBS00gaXMgbm90IHNldAojIENPTkZJR19EUk1f
T01BUF9QQU5FTF9MR1BISUxJUFNfTEIwMzVRMDIgaXMgbm90IHNldAojIENPTkZJR19EUk1f
T01BUF9QQU5FTF9TSEFSUF9MUzAzN1Y3RFcwMSBpcyBub3Qgc2V0CiMgQ09ORklHX0RSTV9P
TUFQX1BBTkVMX1RQT19URDAyOFRURUMxIGlzIG5vdCBzZXQKIyBDT05GSUdfRFJNX09NQVBf
UEFORUxfVFBPX1REMDQzTVRFQTEgaXMgbm90IHNldAojIENPTkZJR19EUk1fT01BUF9QQU5F
TF9ORUNfTkw4MDQ4SEwxMSBpcyBub3Qgc2V0CiMgZW5kIG9mIE9NQVBEUk0gRXh0ZXJuYWwg
RGlzcGxheSBEZXZpY2UgRHJpdmVycwoKIyBDT05GSUdfRFJNX1RJTENEQyBpcyBub3Qgc2V0
CiMgQ09ORklHX0RSTV9RWEwgaXMgbm90IHNldAojIENPTkZJR19EUk1fQk9DSFMgaXMgbm90
IHNldAojIENPTkZJR19EUk1fRlNMX0RDVSBpcyBub3Qgc2V0CiMgQ09ORklHX0RSTV9TVE0g
aXMgbm90IHNldApDT05GSUdfRFJNX1BBTkVMPXkKCiMKIyBEaXNwbGF5IFBhbmVscwojCiMg
Q09ORklHX0RSTV9QQU5FTF9BUk1fVkVSU0FUSUxFIGlzIG5vdCBzZXQKQ09ORklHX0RSTV9Q
QU5FTF9MVkRTPW0KQ09ORklHX0RSTV9QQU5FTF9TSU1QTEU9bQojIENPTkZJR19EUk1fUEFO
RUxfSUxJVEVLX0lMOTMyMiBpcyBub3Qgc2V0CiMgQ09ORklHX0RSTV9QQU5FTF9TQU1TVU5H
X0xEOTA0MCBpcyBub3Qgc2V0CiMgQ09ORklHX0RSTV9QQU5FTF9MR19MRzQ1NzMgaXMgbm90
IHNldAojIENPTkZJR19EUk1fUEFORUxfT0xJTUVYX0xDRF9PTElOVVhJTk8gaXMgbm90IHNl
dAojIENPTkZJR19EUk1fUEFORUxfU0FNU1VOR19TNkU2M00wIGlzIG5vdCBzZXQKIyBDT05G
SUdfRFJNX1BBTkVMX1NBTVNVTkdfUzZFOEFBMCBpcyBub3Qgc2V0CiMgQ09ORklHX0RSTV9Q
QU5FTF9TRUlLT180M1dWRjFHIGlzIG5vdCBzZXQKIyBDT05GSUdfRFJNX1BBTkVMX1NJVFJP
TklYX1NUNzc4OVYgaXMgbm90IHNldAojIENPTkZJR19EUk1fUEFORUxfVFBPX1RQRzExMCBp
cyBub3Qgc2V0CiMgZW5kIG9mIERpc3BsYXkgUGFuZWxzCgpDT05GSUdfRFJNX0JSSURHRT15
CkNPTkZJR19EUk1fUEFORUxfQlJJREdFPXkKCiMKIyBEaXNwbGF5IEludGVyZmFjZSBCcmlk
Z2VzCiMKIyBDT05GSUdfRFJNX0FOQUxPR0lYX0FOWDc4WFggaXMgbm90IHNldAojIENPTkZJ
R19EUk1fQ0ROU19EU0kgaXMgbm90IHNldAojIENPTkZJR19EUk1fRFVNQl9WR0FfREFDIGlz
IG5vdCBzZXQKIyBDT05GSUdfRFJNX0xWRFNfRU5DT0RFUiBpcyBub3Qgc2V0CiMgQ09ORklH
X0RSTV9NRUdBQ0hJUFNfU1REUFhYWFhfR0VfQjg1MFYzX0ZXIGlzIG5vdCBzZXQKIyBDT05G
SUdfRFJNX05YUF9QVE4zNDYwIGlzIG5vdCBzZXQKIyBDT05GSUdfRFJNX1BBUkFERV9QUzg2
MjIgaXMgbm90IHNldAojIENPTkZJR19EUk1fU0lMX1NJSTg2MjAgaXMgbm90IHNldAojIENP
TkZJR19EUk1fU0lJOTAyWCBpcyBub3Qgc2V0CiMgQ09ORklHX0RSTV9TSUk5MjM0IGlzIG5v
dCBzZXQKIyBDT05GSUdfRFJNX1RISU5FX1RIQzYzTFZEMTAyNCBpcyBub3Qgc2V0CiMgQ09O
RklHX0RSTV9UT1NISUJBX1RDMzU4NzY0IGlzIG5vdCBzZXQKIyBDT05GSUdfRFJNX1RPU0hJ
QkFfVEMzNTg3NjcgaXMgbm90IHNldApDT05GSUdfRFJNX1RJX1RGUDQxMD15CiMgQ09ORklH
X0RSTV9USV9TTjY1RFNJODYgaXMgbm90IHNldAojIENPTkZJR19EUk1fSTJDX0FEVjc1MTEg
aXMgbm90IHNldAojIGVuZCBvZiBEaXNwbGF5IEludGVyZmFjZSBCcmlkZ2VzCgojIENPTkZJ
R19EUk1fU1RJIGlzIG5vdCBzZXQKIyBDT05GSUdfRFJNX0VUTkFWSVYgaXMgbm90IHNldAoj
IENPTkZJR19EUk1fQVJDUEdVIGlzIG5vdCBzZXQKIyBDT05GSUdfRFJNX0hJU0lfSElCTUMg
aXMgbm90IHNldAojIENPTkZJR19EUk1fTVhTRkIgaXMgbm90IHNldAojIENPTkZJR19EUk1f
VElOWURSTSBpcyBub3Qgc2V0CiMgQ09ORklHX0RSTV9QTDExMSBpcyBub3Qgc2V0CiMgQ09O
RklHX0RSTV9UVkUyMDAgaXMgbm90IHNldAojIENPTkZJR19EUk1fTElNQSBpcyBub3Qgc2V0
CiMgQ09ORklHX0RSTV9QQU5GUk9TVCBpcyBub3Qgc2V0CiMgQ09ORklHX0RSTV9NQ0RFIGlz
IG5vdCBzZXQKIyBDT05GSUdfRFJNX0xFR0FDWSBpcyBub3Qgc2V0CkNPTkZJR19EUk1fUEFO
RUxfT1JJRU5UQVRJT05fUVVJUktTPXkKCiMKIyBGcmFtZSBidWZmZXIgRGV2aWNlcwojCkNP
TkZJR19GQl9DTURMSU5FPXkKQ09ORklHX0ZCX05PVElGWT15CkNPTkZJR19GQj15CkNPTkZJ
R19GSVJNV0FSRV9FRElEPXkKQ09ORklHX0ZCX0NGQl9GSUxMUkVDVD15CkNPTkZJR19GQl9D
RkJfQ09QWUFSRUE9eQpDT05GSUdfRkJfQ0ZCX0lNQUdFQkxJVD15CkNPTkZJR19GQl9TWVNf
RklMTFJFQ1Q9eQpDT05GSUdfRkJfU1lTX0NPUFlBUkVBPXkKQ09ORklHX0ZCX1NZU19JTUFH
RUJMSVQ9eQojIENPTkZJR19GQl9GT1JFSUdOX0VORElBTiBpcyBub3Qgc2V0CkNPTkZJR19G
Ql9TWVNfRk9QUz15CkNPTkZJR19GQl9ERUZFUlJFRF9JTz15CkNPTkZJR19GQl9NT0RFX0hF
TFBFUlM9eQpDT05GSUdfRkJfVElMRUJMSVRUSU5HPXkKCiMKIyBGcmFtZSBidWZmZXIgaGFy
ZHdhcmUgZHJpdmVycwojCiMgQ09ORklHX0ZCX0NJUlJVUyBpcyBub3Qgc2V0CiMgQ09ORklH
X0ZCX1BNMiBpcyBub3Qgc2V0CiMgQ09ORklHX0ZCX0NZQkVSMjAwMCBpcyBub3Qgc2V0CiMg
Q09ORklHX0ZCX0FTSUxJQU5UIGlzIG5vdCBzZXQKIyBDT05GSUdfRkJfSU1TVFQgaXMgbm90
IHNldAojIENPTkZJR19GQl9PUEVOQ09SRVMgaXMgbm90IHNldAojIENPTkZJR19GQl9TMUQx
M1hYWCBpcyBub3Qgc2V0CiMgQ09ORklHX0ZCX05WSURJQSBpcyBub3Qgc2V0CiMgQ09ORklH
X0ZCX1JJVkEgaXMgbm90IHNldAojIENPTkZJR19GQl9JNzQwIGlzIG5vdCBzZXQKIyBDT05G
SUdfRkJfTUFUUk9YIGlzIG5vdCBzZXQKIyBDT05GSUdfRkJfUkFERU9OIGlzIG5vdCBzZXQK
IyBDT05GSUdfRkJfQVRZMTI4IGlzIG5vdCBzZXQKIyBDT05GSUdfRkJfQVRZIGlzIG5vdCBz
ZXQKIyBDT05GSUdfRkJfUzMgaXMgbm90IHNldAojIENPTkZJR19GQl9TQVZBR0UgaXMgbm90
IHNldAojIENPTkZJR19GQl9TSVMgaXMgbm90IHNldAojIENPTkZJR19GQl9ORU9NQUdJQyBp
cyBub3Qgc2V0CiMgQ09ORklHX0ZCX0tZUk8gaXMgbm90IHNldAojIENPTkZJR19GQl8zREZY
IGlzIG5vdCBzZXQKIyBDT05GSUdfRkJfVk9PRE9PMSBpcyBub3Qgc2V0CiMgQ09ORklHX0ZC
X1ZUODYyMyBpcyBub3Qgc2V0CiMgQ09ORklHX0ZCX1RSSURFTlQgaXMgbm90IHNldAojIENP
TkZJR19GQl9BUksgaXMgbm90IHNldAojIENPTkZJR19GQl9QTTMgaXMgbm90IHNldAojIENP
TkZJR19GQl9DQVJNSU5FIGlzIG5vdCBzZXQKIyBDT05GSUdfRkJfU01TQ1VGWCBpcyBub3Qg
c2V0CkNPTkZJR19GQl9VREw9eQojIENPTkZJR19GQl9JQk1fR1hUNDUwMCBpcyBub3Qgc2V0
CiMgQ09ORklHX0ZCX0RBOFhYIGlzIG5vdCBzZXQKIyBDT05GSUdfRkJfVklSVFVBTCBpcyBu
b3Qgc2V0CiMgQ09ORklHX0ZCX01FVFJPTk9NRSBpcyBub3Qgc2V0CiMgQ09ORklHX0ZCX01C
ODYyWFggaXMgbm90IHNldAojIENPTkZJR19GQl9TSU1QTEUgaXMgbm90IHNldAojIENPTkZJ
R19GQl9TU0QxMzA3IGlzIG5vdCBzZXQKIyBDT05GSUdfRkJfU003MTIgaXMgbm90IHNldAoj
IGVuZCBvZiBGcmFtZSBidWZmZXIgRGV2aWNlcwoKIwojIEJhY2tsaWdodCAmIExDRCBkZXZp
Y2Ugc3VwcG9ydAojCkNPTkZJR19MQ0RfQ0xBU1NfREVWSUNFPXkKIyBDT05GSUdfTENEX0w0
RjAwMjQyVDAzIGlzIG5vdCBzZXQKIyBDT05GSUdfTENEX0xNUzI4M0dGMDUgaXMgbm90IHNl
dAojIENPTkZJR19MQ0RfTFRWMzUwUVYgaXMgbm90IHNldAojIENPTkZJR19MQ0RfSUxJOTIy
WCBpcyBub3Qgc2V0CiMgQ09ORklHX0xDRF9JTEk5MzIwIGlzIG5vdCBzZXQKIyBDT05GSUdf
TENEX1RETzI0TSBpcyBub3Qgc2V0CiMgQ09ORklHX0xDRF9WR0cyNDMyQTQgaXMgbm90IHNl
dApDT05GSUdfTENEX1BMQVRGT1JNPXkKIyBDT05GSUdfTENEX0FNUzM2OUZHMDYgaXMgbm90
IHNldAojIENPTkZJR19MQ0RfTE1TNTAxS0YwMyBpcyBub3Qgc2V0CiMgQ09ORklHX0xDRF9I
WDgzNTcgaXMgbm90IHNldAojIENPTkZJR19MQ0RfT1RNMzIyNUEgaXMgbm90IHNldApDT05G
SUdfQkFDS0xJR0hUX0NMQVNTX0RFVklDRT15CiMgQ09ORklHX0JBQ0tMSUdIVF9HRU5FUklD
IGlzIG5vdCBzZXQKQ09ORklHX0JBQ0tMSUdIVF9QV009eQojIENPTkZJR19CQUNLTElHSFRf
UE04OTQxX1dMRUQgaXMgbm90IHNldAojIENPTkZJR19CQUNLTElHSFRfQURQODg2MCBpcyBu
b3Qgc2V0CiMgQ09ORklHX0JBQ0tMSUdIVF9BRFA4ODcwIGlzIG5vdCBzZXQKIyBDT05GSUdf
QkFDS0xJR0hUX0xNMzYzMEEgaXMgbm90IHNldAojIENPTkZJR19CQUNLTElHSFRfTE0zNjM5
IGlzIG5vdCBzZXQKIyBDT05GSUdfQkFDS0xJR0hUX0xQODU1WCBpcyBub3Qgc2V0CiMgQ09O
RklHX0JBQ0tMSUdIVF9QQU5ET1JBIGlzIG5vdCBzZXQKIyBDT05GSUdfQkFDS0xJR0hUX1RQ
UzY1MjE3IGlzIG5vdCBzZXQKQ09ORklHX0JBQ0tMSUdIVF9HUElPPXkKIyBDT05GSUdfQkFD
S0xJR0hUX0xWNTIwN0xQIGlzIG5vdCBzZXQKIyBDT05GSUdfQkFDS0xJR0hUX0JENjEwNyBp
cyBub3Qgc2V0CiMgQ09ORklHX0JBQ0tMSUdIVF9BUkNYQ05OIGlzIG5vdCBzZXQKIyBlbmQg
b2YgQmFja2xpZ2h0ICYgTENEIGRldmljZSBzdXBwb3J0CgpDT05GSUdfVklERU9NT0RFX0hF
TFBFUlM9eQpDT05GSUdfSERNST15CgojCiMgQ29uc29sZSBkaXNwbGF5IGRyaXZlciBzdXBw
b3J0CiMKQ09ORklHX0RVTU1ZX0NPTlNPTEU9eQojIENPTkZJR19GUkFNRUJVRkZFUl9DT05T
T0xFIGlzIG5vdCBzZXQKIyBlbmQgb2YgQ29uc29sZSBkaXNwbGF5IGRyaXZlciBzdXBwb3J0
CgojIENPTkZJR19MT0dPIGlzIG5vdCBzZXQKIyBlbmQgb2YgR3JhcGhpY3Mgc3VwcG9ydAoK
Q09ORklHX1NPVU5EPXkKQ09ORklHX1NPVU5EX09TU19DT1JFPXkKQ09ORklHX1NPVU5EX09T
U19DT1JFX1BSRUNMQUlNPXkKQ09ORklHX1NORD15CkNPTkZJR19TTkRfVElNRVI9eQpDT05G
SUdfU05EX1BDTT15CkNPTkZJR19TTkRfUENNX0VMRD15CkNPTkZJR19TTkRfUENNX0lFQzk1
OD15CkNPTkZJR19TTkRfRE1BRU5HSU5FX1BDTT15CkNPTkZJR19TTkRfSkFDSz15CkNPTkZJ
R19TTkRfSkFDS19JTlBVVF9ERVY9eQpDT05GSUdfU05EX09TU0VNVUw9eQojIENPTkZJR19T
TkRfTUlYRVJfT1NTIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1BDTV9PU1MgaXMgbm90IHNl
dApDT05GSUdfU05EX1BDTV9USU1FUj15CiMgQ09ORklHX1NORF9IUlRJTUVSIGlzIG5vdCBz
ZXQKIyBDT05GSUdfU05EX0RZTkFNSUNfTUlOT1JTIGlzIG5vdCBzZXQKQ09ORklHX1NORF9T
VVBQT1JUX09MRF9BUEk9eQpDT05GSUdfU05EX1BST0NfRlM9eQpDT05GSUdfU05EX1ZFUkJP
U0VfUFJPQ0ZTPXkKQ09ORklHX1NORF9WRVJCT1NFX1BSSU5USz15CkNPTkZJR19TTkRfREVC
VUc9eQojIENPTkZJR19TTkRfREVCVUdfVkVSQk9TRSBpcyBub3Qgc2V0CiMgQ09ORklHX1NO
RF9QQ01fWFJVTl9ERUJVRyBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TRVFVRU5DRVIgaXMg
bm90IHNldApDT05GSUdfU05EX0RSSVZFUlM9eQojIENPTkZJR19TTkRfRFVNTVkgaXMgbm90
IHNldAojIENPTkZJR19TTkRfQUxPT1AgaXMgbm90IHNldAojIENPTkZJR19TTkRfTVRQQVYg
aXMgbm90IHNldAojIENPTkZJR19TTkRfU0VSSUFMX1UxNjU1MCBpcyBub3Qgc2V0CiMgQ09O
RklHX1NORF9NUFU0MDEgaXMgbm90IHNldApDT05GSUdfU05EX1BDST15CiMgQ09ORklHX1NO
RF9BRDE4ODkgaXMgbm90IHNldAojIENPTkZJR19TTkRfQVRJSVhQIGlzIG5vdCBzZXQKIyBD
T05GSUdfU05EX0FUSUlYUF9NT0RFTSBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9BVTg4MTAg
aXMgbm90IHNldAojIENPTkZJR19TTkRfQVU4ODIwIGlzIG5vdCBzZXQKIyBDT05GSUdfU05E
X0FVODgzMCBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9BVzIgaXMgbm90IHNldAojIENPTkZJ
R19TTkRfQlQ4N1ggaXMgbm90IHNldAojIENPTkZJR19TTkRfQ0EwMTA2IGlzIG5vdCBzZXQK
IyBDT05GSUdfU05EX0NNSVBDSSBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9PWFlHRU4gaXMg
bm90IHNldAojIENPTkZJR19TTkRfQ1M0MjgxIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX0NT
NDZYWCBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9DVFhGSSBpcyBub3Qgc2V0CiMgQ09ORklH
X1NORF9EQVJMQTIwIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX0dJTkEyMCBpcyBub3Qgc2V0
CiMgQ09ORklHX1NORF9MQVlMQTIwIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX0RBUkxBMjQg
aXMgbm90IHNldAojIENPTkZJR19TTkRfR0lOQTI0IGlzIG5vdCBzZXQKIyBDT05GSUdfU05E
X0xBWUxBMjQgaXMgbm90IHNldAojIENPTkZJR19TTkRfTU9OQSBpcyBub3Qgc2V0CiMgQ09O
RklHX1NORF9NSUEgaXMgbm90IHNldAojIENPTkZJR19TTkRfRUNITzNHIGlzIG5vdCBzZXQK
IyBDT05GSUdfU05EX0lORElHTyBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9JTkRJR09JTyBp
cyBub3Qgc2V0CiMgQ09ORklHX1NORF9JTkRJR09ESiBpcyBub3Qgc2V0CiMgQ09ORklHX1NO
RF9JTkRJR09JT1ggaXMgbm90IHNldAojIENPTkZJR19TTkRfSU5ESUdPREpYIGlzIG5vdCBz
ZXQKIyBDT05GSUdfU05EX0VOUzEzNzAgaXMgbm90IHNldAojIENPTkZJR19TTkRfRU5TMTM3
MSBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9GTTgwMSBpcyBub3Qgc2V0CiMgQ09ORklHX1NO
RF9IRFNQIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX0hEU1BNIGlzIG5vdCBzZXQKIyBDT05G
SUdfU05EX0lDRTE3MjQgaXMgbm90IHNldAojIENPTkZJR19TTkRfSU5URUw4WDAgaXMgbm90
IHNldAojIENPTkZJR19TTkRfSU5URUw4WDBNIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX0tP
UkcxMjEyIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX0xPTEEgaXMgbm90IHNldAojIENPTkZJ
R19TTkRfTFg2NDY0RVMgaXMgbm90IHNldAojIENPTkZJR19TTkRfTUlYQVJUIGlzIG5vdCBz
ZXQKIyBDT05GSUdfU05EX05NMjU2IGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1BDWEhSIGlz
IG5vdCBzZXQKIyBDT05GSUdfU05EX1JJUFRJREUgaXMgbm90IHNldAojIENPTkZJR19TTkRf
Uk1FMzIgaXMgbm90IHNldAojIENPTkZJR19TTkRfUk1FOTYgaXMgbm90IHNldAojIENPTkZJ
R19TTkRfUk1FOTY1MiBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TRTZYIGlzIG5vdCBzZXQK
IyBDT05GSUdfU05EX1ZJQTgyWFggaXMgbm90IHNldAojIENPTkZJR19TTkRfVklBODJYWF9N
T0RFTSBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9WSVJUVU9TTyBpcyBub3Qgc2V0CiMgQ09O
RklHX1NORF9WWDIyMiBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9ZTUZQQ0kgaXMgbm90IHNl
dAoKIwojIEhELUF1ZGlvCiMKIyBDT05GSUdfU05EX0hEQV9JTlRFTCBpcyBub3Qgc2V0CiMg
ZW5kIG9mIEhELUF1ZGlvCgpDT05GSUdfU05EX0hEQV9QUkVBTExPQ19TSVpFPTY0CkNPTkZJ
R19TTkRfQVJNPXkKQ09ORklHX1NORF9TUEk9eQpDT05GSUdfU05EX1VTQj15CiMgQ09ORklH
X1NORF9VU0JfQVVESU8gaXMgbm90IHNldAojIENPTkZJR19TTkRfVVNCX1VBMTAxIGlzIG5v
dCBzZXQKIyBDT05GSUdfU05EX1VTQl9DQUlBUSBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9V
U0JfNkZJUkUgaXMgbm90IHNldAojIENPTkZJR19TTkRfVVNCX0hJRkFDRSBpcyBub3Qgc2V0
CiMgQ09ORklHX1NORF9CQ0QyMDAwIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1VTQl9QT0Qg
aXMgbm90IHNldAojIENPTkZJR19TTkRfVVNCX1BPREhEIGlzIG5vdCBzZXQKIyBDT05GSUdf
U05EX1VTQl9UT05FUE9SVCBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9VU0JfVkFSSUFYIGlz
IG5vdCBzZXQKQ09ORklHX1NORF9TT0M9eQpDT05GSUdfU05EX1NPQ19HRU5FUklDX0RNQUVO
R0lORV9QQ009eQojIENPTkZJR19TTkRfU09DX0FNRF9BQ1AgaXMgbm90IHNldAojIENPTkZJ
R19TTkRfQVRNRUxfU09DIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX0RFU0lHTldBUkVfSTJT
IGlzIG5vdCBzZXQKCiMKIyBTb0MgQXVkaW8gZm9yIEZyZWVzY2FsZSBDUFVzCiMKCiMKIyBD
b21tb24gU29DIEF1ZGlvIG9wdGlvbnMgZm9yIEZyZWVzY2FsZSBDUFVzOgojCiMgQ09ORklH
X1NORF9TT0NfRlNMX0FTUkMgaXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX0ZTTF9TQUkg
aXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX0ZTTF9BVURNSVggaXMgbm90IHNldAojIENP
TkZJR19TTkRfU09DX0ZTTF9TU0kgaXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX0ZTTF9T
UERJRiBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfRlNMX0VTQUkgaXMgbm90IHNldAoj
IENPTkZJR19TTkRfU09DX0ZTTF9NSUNGSUwgaXMgbm90IHNldAojIENPTkZJR19TTkRfU09D
X0lNWF9BVURNVVggaXMgbm90IHNldAojIGVuZCBvZiBTb0MgQXVkaW8gZm9yIEZyZWVzY2Fs
ZSBDUFVzCgojIENPTkZJR19TTkRfSTJTX0hJNjIxMF9JMlMgaXMgbm90IHNldAojIENPTkZJ
R19TTkRfU09DX0lNRyBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfTVRLX0JUQ1ZTRCBp
cyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfU09GX1RPUExFVkVMIGlzIG5vdCBzZXQKCiMK
IyBTVE1pY3JvZWxlY3Ryb25pY3MgU1RNMzIgU09DIGF1ZGlvIHN1cHBvcnQKIwojIGVuZCBv
ZiBTVE1pY3JvZWxlY3Ryb25pY3MgU1RNMzIgU09DIGF1ZGlvIHN1cHBvcnQKCiMKIyBBdWRp
byBzdXBwb3J0IGZvciBUZXhhcyBJbnN0cnVtZW50cyBTb0NzCiMKQ09ORklHX1NORF9TT0Nf
VElfRURNQV9QQ009eQpDT05GSUdfU05EX1NPQ19USV9TRE1BX1BDTT15CgojCiMgVGV4YXMg
SW5zdHJ1bWVudHMgREFJIHN1cHBvcnQgZm9yOgojCkNPTkZJR19TTkRfU09DX0RBVklOQ0lf
TUNBU1A9eQojIENPTkZJR19TTkRfU09DX09NQVBfRE1JQyBpcyBub3Qgc2V0CiMgQ09ORklH
X1NORF9TT0NfT01BUF9NQ0JTUCBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfT01BUF9N
Q1BETSBpcyBub3Qgc2V0CgojCiMgQXVkaW8gc3VwcG9ydCBmb3IgYm9hcmRzIHdpdGggVGV4
YXMgSW5zdHJ1bWVudHMgU29DcwojCiMgQ09ORklHX1NORF9TT0NfTk9LSUFfTjgxMCBpcyBu
b3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfTk9LSUFfUlg1MSBpcyBub3Qgc2V0CiMgQ09ORklH
X1NORF9TT0NfT01BUDNfUEFORE9SQSBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfT01B
UDNfVFdMNDAzMCBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfT01BUF9BQkVfVFdMNjA0
MCBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfT01BUF9IRE1JIGlzIG5vdCBzZXQKIyBl
bmQgb2YgQXVkaW8gc3VwcG9ydCBmb3IgVGV4YXMgSW5zdHJ1bWVudHMgU29DcwoKIyBDT05G
SUdfU05EX1NPQ19YSUxJTlhfSTJTIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19YSUxJ
TlhfQVVESU9fRk9STUFUVEVSIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19YSUxJTlhf
U1BESUYgaXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX1hURlBHQV9JMlMgaXMgbm90IHNl
dAojIENPTkZJR19aWF9URE0gaXMgbm90IHNldApDT05GSUdfU05EX1NPQ19JMkNfQU5EX1NQ
ST15CgojCiMgQ09ERUMgZHJpdmVycwojCiMgQ09ORklHX1NORF9TT0NfQUM5N19DT0RFQyBp
cyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfQURBVTE3MDEgaXMgbm90IHNldAojIENPTkZJ
R19TTkRfU09DX0FEQVUxNzYxX0kyQyBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfQURB
VTE3NjFfU1BJIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19BREFVNzAwMiBpcyBub3Qg
c2V0CiMgQ09ORklHX1NORF9TT0NfQUs0MTA0IGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NP
Q19BSzQxMTggaXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX0FLNDQ1OCBpcyBub3Qgc2V0
CiMgQ09ORklHX1NORF9TT0NfQUs0NTU0IGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19B
SzQ2MTMgaXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX0FLNDY0MiBpcyBub3Qgc2V0CiMg
Q09ORklHX1NORF9TT0NfQUs1Mzg2IGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19BSzU1
NTggaXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX0FMQzU2MjMgaXMgbm90IHNldAojIENP
TkZJR19TTkRfU09DX0JEMjg2MjMgaXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX0JUX1ND
TyBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfQ1BDQVAgaXMgbm90IHNldAojIENPTkZJ
R19TTkRfU09DX0NTMzVMMzIgaXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX0NTMzVMMzMg
aXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX0NTMzVMMzQgaXMgbm90IHNldAojIENPTkZJ
R19TTkRfU09DX0NTMzVMMzUgaXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX0NTMzVMMzYg
aXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX0NTNDJMNDIgaXMgbm90IHNldAojIENPTkZJ
R19TTkRfU09DX0NTNDJMNTFfSTJDIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19DUzQy
TDUyIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19DUzQyTDU2IGlzIG5vdCBzZXQKIyBD
T05GSUdfU05EX1NPQ19DUzQyTDczIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19DUzQy
NjUgaXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX0NTNDI3MCBpcyBub3Qgc2V0CiMgQ09O
RklHX1NORF9TT0NfQ1M0MjcxX0kyQyBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfQ1M0
MjcxX1NQSSBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfQ1M0MlhYOF9JMkMgaXMgbm90
IHNldAojIENPTkZJR19TTkRfU09DX0NTNDMxMzAgaXMgbm90IHNldAojIENPTkZJR19TTkRf
U09DX0NTNDM0MSBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfQ1M0MzQ5IGlzIG5vdCBz
ZXQKIyBDT05GSUdfU05EX1NPQ19DUzUzTDMwIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NP
Q19DWDIwNzJYIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19ETUlDIGlzIG5vdCBzZXQK
Q09ORklHX1NORF9TT0NfSERNSV9DT0RFQz1tCiMgQ09ORklHX1NORF9TT0NfRVM3MTM0IGlz
IG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19FUzcyNDEgaXMgbm90IHNldAojIENPTkZJR19T
TkRfU09DX0VTODMxNiBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfRVM4MzI4X0kyQyBp
cyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfRVM4MzI4X1NQSSBpcyBub3Qgc2V0CiMgQ09O
RklHX1NORF9TT0NfR1RNNjAxIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19JTk5PX1JL
MzAzNiBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfTUFYOTgwODggaXMgbm90IHNldAoj
IENPTkZJR19TTkRfU09DX01BWDk4MzU3QSBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0Nf
TUFYOTg1MDQgaXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX01BWDk4NjcgaXMgbm90IHNl
dAojIENPTkZJR19TTkRfU09DX01BWDk4OTI3IGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NP
Q19NQVg5ODM3MyBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfTUFYOTg2MCBpcyBub3Qg
c2V0CiMgQ09ORklHX1NORF9TT0NfTVNNODkxNl9XQ0RfRElHSVRBTCBpcyBub3Qgc2V0CiMg
Q09ORklHX1NORF9TT0NfUENNMTY4MSBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfUENN
MTc4OV9JMkMgaXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX1BDTTE3OVhfSTJDIGlzIG5v
dCBzZXQKIyBDT05GSUdfU05EX1NPQ19QQ00xNzlYX1NQSSBpcyBub3Qgc2V0CiMgQ09ORklH
X1NORF9TT0NfUENNMTg2WF9JMkMgaXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX1BDTTE4
NlhfU1BJIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19QQ00zMDYwX0kyQyBpcyBub3Qg
c2V0CiMgQ09ORklHX1NORF9TT0NfUENNMzA2MF9TUEkgaXMgbm90IHNldAojIENPTkZJR19T
TkRfU09DX1BDTTMxNjhBX0kyQyBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfUENNMzE2
OEFfU1BJIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19QQ001MTJ4X0kyQyBpcyBub3Qg
c2V0CiMgQ09ORklHX1NORF9TT0NfUENNNTEyeF9TUEkgaXMgbm90IHNldAojIENPTkZJR19T
TkRfU09DX1JLMzMyOCBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfUlQ1NjE2IGlzIG5v
dCBzZXQKIyBDT05GSUdfU05EX1NPQ19SVDU2MzEgaXMgbm90IHNldAojIENPTkZJR19TTkRf
U09DX1NHVEw1MDAwIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19TSU1QTEVfQU1QTElG
SUVSIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19TSVJGX0FVRElPX0NPREVDIGlzIG5v
dCBzZXQKIyBDT05GSUdfU05EX1NPQ19TUERJRiBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9T
T0NfU1NNMjMwNSBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfU1NNMjYwMl9TUEkgaXMg
bm90IHNldAojIENPTkZJR19TTkRfU09DX1NTTTI2MDJfSTJDIGlzIG5vdCBzZXQKIyBDT05G
SUdfU05EX1NPQ19TU000NTY3IGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19TVEEzMlgg
aXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX1NUQTM1MCBpcyBub3Qgc2V0CiMgQ09ORklH
X1NORF9TT0NfU1RJX1NBUyBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfVEFTMjU1MiBp
cyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfVEFTNTA4NiBpcyBub3Qgc2V0CiMgQ09ORklH
X1NORF9TT0NfVEFTNTcxWCBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfVEFTNTcyMCBp
cyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfVEFTNjQyNCBpcyBub3Qgc2V0CiMgQ09ORklH
X1NORF9TT0NfVERBNzQxOSBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfVEZBOTg3OSBp
cyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfVExWMzIwQUlDMjNfSTJDIGlzIG5vdCBzZXQK
IyBDT05GSUdfU05EX1NPQ19UTFYzMjBBSUMyM19TUEkgaXMgbm90IHNldAojIENPTkZJR19T
TkRfU09DX1RMVjMyMEFJQzMxWFggaXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX1RMVjMy
MEFJQzMyWDRfSTJDIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19UTFYzMjBBSUMzMlg0
X1NQSSBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfVExWMzIwQUlDM1ggaXMgbm90IHNl
dAojIENPTkZJR19TTkRfU09DX1RTM0EyMjdFIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NP
Q19UU0NTNDJYWCBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfVFNDUzQ1NCBpcyBub3Qg
c2V0CiMgQ09ORklHX1NORF9TT0NfV004NTEwIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NP
Q19XTTg1MjMgaXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX1dNODUyNCBpcyBub3Qgc2V0
CiMgQ09ORklHX1NORF9TT0NfV004NTgwIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19X
TTg3MTEgaXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX1dNODcyOCBpcyBub3Qgc2V0CiMg
Q09ORklHX1NORF9TT0NfV004NzMxIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19XTTg3
MzcgaXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX1dNODc0MSBpcyBub3Qgc2V0CiMgQ09O
RklHX1NORF9TT0NfV004NzUwIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19XTTg3NTMg
aXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX1dNODc3MCBpcyBub3Qgc2V0CiMgQ09ORklH
X1NORF9TT0NfV004Nzc2IGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19XTTg3ODIgaXMg
bm90IHNldAojIENPTkZJR19TTkRfU09DX1dNODgwNF9JMkMgaXMgbm90IHNldAojIENPTkZJ
R19TTkRfU09DX1dNODgwNF9TUEkgaXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX1dNODkw
MyBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfV004OTA0IGlzIG5vdCBzZXQKIyBDT05G
SUdfU05EX1NPQ19XTTg5NjAgaXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX1dNODk2MiBp
cyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfV004OTc0IGlzIG5vdCBzZXQKIyBDT05GSUdf
U05EX1NPQ19XTTg5NzggaXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX1dNODk4NSBpcyBu
b3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfWlhfQVVEOTZQMjIgaXMgbm90IHNldAojIENPTkZJ
R19TTkRfU09DX01BWDk3NTkgaXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX01UNjM1MSBp
cyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfTVQ2MzU4IGlzIG5vdCBzZXQKIyBDT05GSUdf
U05EX1NPQ19OQVU4NTQwIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19OQVU4ODEwIGlz
IG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19OQVU4ODIyIGlzIG5vdCBzZXQKIyBDT05GSUdf
U05EX1NPQ19OQVU4ODI0IGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19UUEE2MTMwQTIg
aXMgbm90IHNldAojIGVuZCBvZiBDT0RFQyBkcml2ZXJzCgpDT05GSUdfU05EX1NJTVBMRV9D
QVJEX1VUSUxTPXkKQ09ORklHX1NORF9TSU1QTEVfQ0FSRD15CiMgQ09ORklHX1NORF9BVURJ
T19HUkFQSF9DQVJEIGlzIG5vdCBzZXQKCiMKIyBISUQgc3VwcG9ydAojCkNPTkZJR19ISUQ9
eQojIENPTkZJR19ISURfQkFUVEVSWV9TVFJFTkdUSCBpcyBub3Qgc2V0CiMgQ09ORklHX0hJ
RFJBVyBpcyBub3Qgc2V0CiMgQ09ORklHX1VISUQgaXMgbm90IHNldApDT05GSUdfSElEX0dF
TkVSSUM9eQoKIwojIFNwZWNpYWwgSElEIGRyaXZlcnMKIwojIENPTkZJR19ISURfQTRURUNI
IGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX0FDQ1VUT1VDSCBpcyBub3Qgc2V0CiMgQ09ORklH
X0hJRF9BQ1JVWCBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9BUFBMRSBpcyBub3Qgc2V0CiMg
Q09ORklHX0hJRF9BUFBMRUlSIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX0FTVVMgaXMgbm90
IHNldAojIENPTkZJR19ISURfQVVSRUFMIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX0JFTEtJ
TiBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9CRVRPUF9GRiBpcyBub3Qgc2V0CiMgQ09ORklH
X0hJRF9CSUdCRU5fRkYgaXMgbm90IHNldAojIENPTkZJR19ISURfQ0hFUlJZIGlzIG5vdCBz
ZXQKIyBDT05GSUdfSElEX0NISUNPTlkgaXMgbm90IHNldAojIENPTkZJR19ISURfQ09SU0FJ
UiBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9DT1VHQVIgaXMgbm90IHNldAojIENPTkZJR19I
SURfTUFDQUxMWSBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9QUk9ESUtFWVMgaXMgbm90IHNl
dAojIENPTkZJR19ISURfQ01FRElBIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX0NZUFJFU1Mg
aXMgbm90IHNldAojIENPTkZJR19ISURfRFJBR09OUklTRSBpcyBub3Qgc2V0CiMgQ09ORklH
X0hJRF9FTVNfRkYgaXMgbm90IHNldAojIENPTkZJR19ISURfRUxBTiBpcyBub3Qgc2V0CiMg
Q09ORklHX0hJRF9FTEVDT00gaXMgbm90IHNldAojIENPTkZJR19ISURfRUxPIGlzIG5vdCBz
ZXQKIyBDT05GSUdfSElEX0VaS0VZIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX0dFTUJJUkQg
aXMgbm90IHNldAojIENPTkZJR19ISURfR0ZSTSBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9I
T0xURUsgaXMgbm90IHNldAojIENPTkZJR19ISURfR1Q2ODNSIGlzIG5vdCBzZXQKIyBDT05G
SUdfSElEX0tFWVRPVUNIIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX0tZRSBpcyBub3Qgc2V0
CiMgQ09ORklHX0hJRF9VQ0xPR0lDIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX1dBTFRPUCBp
cyBub3Qgc2V0CiMgQ09ORklHX0hJRF9WSUVXU09OSUMgaXMgbm90IHNldAojIENPTkZJR19I
SURfR1lSQVRJT04gaXMgbm90IHNldAojIENPTkZJR19ISURfSUNBREUgaXMgbm90IHNldAoj
IENPTkZJR19ISURfSVRFIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX0pBQlJBIGlzIG5vdCBz
ZXQKIyBDT05GSUdfSElEX1RXSU5IQU4gaXMgbm90IHNldAojIENPTkZJR19ISURfS0VOU0lO
R1RPTiBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9MQ1BPV0VSIGlzIG5vdCBzZXQKIyBDT05G
SUdfSElEX0xFRCBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9MRU5PVk8gaXMgbm90IHNldAoj
IENPTkZJR19ISURfTE9HSVRFQ0ggaXMgbm90IHNldAojIENPTkZJR19ISURfTUFHSUNNT1VT
RSBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9NQUxUUk9OIGlzIG5vdCBzZXQKIyBDT05GSUdf
SElEX01BWUZMQVNIIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX1JFRFJBR09OIGlzIG5vdCBz
ZXQKIyBDT05GSUdfSElEX01JQ1JPU09GVCBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9NT05U
RVJFWSBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9NVUxUSVRPVUNIIGlzIG5vdCBzZXQKIyBD
T05GSUdfSElEX05USSBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9OVFJJRyBpcyBub3Qgc2V0
CiMgQ09ORklHX0hJRF9PUlRFSyBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9QQU5USEVSTE9S
RCBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9QRU5NT1VOVCBpcyBub3Qgc2V0CiMgQ09ORklH
X0hJRF9QRVRBTFlOWCBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9QSUNPTENEIGlzIG5vdCBz
ZXQKIyBDT05GSUdfSElEX1BMQU5UUk9OSUNTIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX1BS
SU1BWCBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9SRVRST0RFIGlzIG5vdCBzZXQKIyBDT05G
SUdfSElEX1JPQ0NBVCBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9TQUlURUsgaXMgbm90IHNl
dAojIENPTkZJR19ISURfU0FNU1VORyBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9TT05ZIGlz
IG5vdCBzZXQKIyBDT05GSUdfSElEX1NQRUVETElOSyBpcyBub3Qgc2V0CiMgQ09ORklHX0hJ
RF9TVEVBTSBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9TVEVFTFNFUklFUyBpcyBub3Qgc2V0
CiMgQ09ORklHX0hJRF9TVU5QTFVTIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX1JNSSBpcyBu
b3Qgc2V0CiMgQ09ORklHX0hJRF9HUkVFTkFTSUEgaXMgbm90IHNldAojIENPTkZJR19ISURf
U01BUlRKT1lQTFVTIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX1RJVk8gaXMgbm90IHNldAoj
IENPTkZJR19ISURfVE9QU0VFRCBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9USElOR00gaXMg
bm90IHNldAojIENPTkZJR19ISURfVEhSVVNUTUFTVEVSIGlzIG5vdCBzZXQKIyBDT05GSUdf
SElEX1VEUkFXX1BTMyBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9VMkZaRVJPIGlzIG5vdCBz
ZXQKIyBDT05GSUdfSElEX1dBQ09NIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX1dJSU1PVEUg
aXMgbm90IHNldAojIENPTkZJR19ISURfWElOTU8gaXMgbm90IHNldAojIENPTkZJR19ISURf
WkVST1BMVVMgaXMgbm90IHNldAojIENPTkZJR19ISURfWllEQUNST04gaXMgbm90IHNldAoj
IENPTkZJR19ISURfU0VOU09SX0hVQiBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9BTFBTIGlz
IG5vdCBzZXQKIyBlbmQgb2YgU3BlY2lhbCBISUQgZHJpdmVycwoKIwojIFVTQiBISUQgc3Vw
cG9ydAojCkNPTkZJR19VU0JfSElEPXkKIyBDT05GSUdfSElEX1BJRCBpcyBub3Qgc2V0CkNP
TkZJR19VU0JfSElEREVWPXkKIyBlbmQgb2YgVVNCIEhJRCBzdXBwb3J0CgojCiMgSTJDIEhJ
RCBzdXBwb3J0CiMKIyBDT05GSUdfSTJDX0hJRCBpcyBub3Qgc2V0CiMgZW5kIG9mIEkyQyBI
SUQgc3VwcG9ydAojIGVuZCBvZiBISUQgc3VwcG9ydAoKQ09ORklHX1VTQl9PSENJX0xJVFRM
RV9FTkRJQU49eQpDT05GSUdfVVNCX1NVUFBPUlQ9eQpDT05GSUdfVVNCX0NPTU1PTj15CkNP
TkZJR19VU0JfQVJDSF9IQVNfSENEPXkKQ09ORklHX1VTQj15CkNPTkZJR19VU0JfUENJPXkK
Q09ORklHX1VTQl9BTk5PVU5DRV9ORVdfREVWSUNFUz15CgojCiMgTWlzY2VsbGFuZW91cyBV
U0Igb3B0aW9ucwojCkNPTkZJR19VU0JfREVGQVVMVF9QRVJTSVNUPXkKIyBDT05GSUdfVVNC
X0RZTkFNSUNfTUlOT1JTIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX09URyBpcyBub3Qgc2V0
CiMgQ09ORklHX1VTQl9PVEdfV0hJVEVMSVNUIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX09U
R19CTEFDS0xJU1RfSFVCIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX0xFRFNfVFJJR0dFUl9V
U0JQT1JUIGlzIG5vdCBzZXQKQ09ORklHX1VTQl9BVVRPU1VTUEVORF9ERUxBWT0yCiMgQ09O
RklHX1VTQl9NT04gaXMgbm90IHNldAojIENPTkZJR19VU0JfV1VTQl9DQkFGIGlzIG5vdCBz
ZXQKCiMKIyBVU0IgSG9zdCBDb250cm9sbGVyIERyaXZlcnMKIwojIENPTkZJR19VU0JfQzY3
WDAwX0hDRCBpcyBub3Qgc2V0CkNPTkZJR19VU0JfWEhDSV9IQ0Q9eQojIENPTkZJR19VU0Jf
WEhDSV9EQkdDQVAgaXMgbm90IHNldApDT05GSUdfVVNCX1hIQ0lfUENJPXkKQ09ORklHX1VT
Ql9YSENJX1BMQVRGT1JNPXkKQ09ORklHX1VTQl9FSENJX0hDRD15CiMgQ09ORklHX1VTQl9F
SENJX1JPT1RfSFVCX1RUIGlzIG5vdCBzZXQKQ09ORklHX1VTQl9FSENJX1RUX05FV1NDSEVE
PXkKQ09ORklHX1VTQl9FSENJX1BDST15CiMgQ09ORklHX1VTQl9FSENJX0ZTTCBpcyBub3Qg
c2V0CkNPTkZJR19VU0JfRUhDSV9IQ0RfT01BUD15CiMgQ09ORklHX1VTQl9FSENJX0hDRF9Q
TEFURk9STSBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9PWFUyMTBIUF9IQ0QgaXMgbm90IHNl
dAojIENPTkZJR19VU0JfSVNQMTE2WF9IQ0QgaXMgbm90IHNldAojIENPTkZJR19VU0JfRk9U
RzIxMF9IQ0QgaXMgbm90IHNldAojIENPTkZJR19VU0JfTUFYMzQyMV9IQ0QgaXMgbm90IHNl
dApDT05GSUdfVVNCX09IQ0lfSENEPXkKQ09ORklHX1VTQl9PSENJX0hDRF9PTUFQMz15CkNP
TkZJR19VU0JfT0hDSV9IQ0RfUENJPXkKQ09ORklHX1VTQl9PSENJX0hDRF9QTEFURk9STT15
CiMgQ09ORklHX1VTQl9VSENJX0hDRCBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9TTDgxMV9I
Q0QgaXMgbm90IHNldAojIENPTkZJR19VU0JfUjhBNjY1OTdfSENEIGlzIG5vdCBzZXQKIyBD
T05GSUdfVVNCX0hDRF9URVNUX01PREUgaXMgbm90IHNldAoKIwojIFVTQiBEZXZpY2UgQ2xh
c3MgZHJpdmVycwojCiMgQ09ORklHX1VTQl9BQ00gaXMgbm90IHNldAojIENPTkZJR19VU0Jf
UFJJTlRFUiBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9XRE0gaXMgbm90IHNldAojIENPTkZJ
R19VU0JfVE1DIGlzIG5vdCBzZXQKCiMKIyBOT1RFOiBVU0JfU1RPUkFHRSBkZXBlbmRzIG9u
IFNDU0kgYnV0IEJMS19ERVZfU0QgbWF5CiMKCiMKIyBhbHNvIGJlIG5lZWRlZDsgc2VlIFVT
Ql9TVE9SQUdFIEhlbHAgZm9yIG1vcmUgaW5mbwojCiMgQ09ORklHX1VTQl9TVE9SQUdFIGlz
IG5vdCBzZXQKCiMKIyBVU0IgSW1hZ2luZyBkZXZpY2VzCiMKIyBDT05GSUdfVVNCX01EQzgw
MCBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9NSUNST1RFSyBpcyBub3Qgc2V0CiMgQ09ORklH
X1VTQklQX0NPUkUgaXMgbm90IHNldApDT05GSUdfVVNCX01VU0JfSERSQz15CkNPTkZJR19V
U0JfTVVTQl9IT1NUPXkKCiMKIyBQbGF0Zm9ybSBHbHVlIExheWVyCiMKIyBDT05GSUdfVVNC
X01VU0JfVFVTQjYwMTAgaXMgbm90IHNldApDT05GSUdfVVNCX01VU0JfT01BUDJQTFVTPXkK
IyBDT05GSUdfVVNCX01VU0JfQU0zNVggaXMgbm90IHNldApDT05GSUdfVVNCX01VU0JfRFNQ
Uz15CkNPTkZJR19VU0JfTVVTQl9BTTMzNVhfQ0hJTEQ9eQoKIwojIE1VU0IgRE1BIG1vZGUK
IwojIENPTkZJR19NVVNCX1BJT19PTkxZIGlzIG5vdCBzZXQKQ09ORklHX1VTQl9JTlZFTlRS
QV9ETUE9eQpDT05GSUdfVVNCX1RJX0NQUEk0MV9ETUE9eQpDT05GSUdfVVNCX0RXQzM9eQpD
T05GSUdfVVNCX0RXQzNfSE9TVD15CgojCiMgUGxhdGZvcm0gR2x1ZSBEcml2ZXIgU3VwcG9y
dAojCkNPTkZJR19VU0JfRFdDM19PTUFQPXkKQ09ORklHX1VTQl9EV0MzX0hBUFM9eQpDT05G
SUdfVVNCX0RXQzNfT0ZfU0lNUExFPXkKIyBDT05GSUdfVVNCX0RXQzIgaXMgbm90IHNldAoj
IENPTkZJR19VU0JfQ0hJUElERUEgaXMgbm90IHNldAojIENPTkZJR19VU0JfSVNQMTc2MCBp
cyBub3Qgc2V0CgojCiMgVVNCIHBvcnQgZHJpdmVycwojCiMgQ09ORklHX1VTQl9TRVJJQUwg
aXMgbm90IHNldAoKIwojIFVTQiBNaXNjZWxsYW5lb3VzIGRyaXZlcnMKIwojIENPTkZJR19V
U0JfRU1JNjIgaXMgbm90IHNldAojIENPTkZJR19VU0JfRU1JMjYgaXMgbm90IHNldAojIENP
TkZJR19VU0JfQURVVFVYIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX1NFVlNFRyBpcyBub3Qg
c2V0CiMgQ09ORklHX1VTQl9SSU81MDAgaXMgbm90IHNldAojIENPTkZJR19VU0JfTEVHT1RP
V0VSIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX0xDRCBpcyBub3Qgc2V0CiMgQ09ORklHX1VT
Ql9DWVBSRVNTX0NZN0M2MyBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9DWVRIRVJNIGlzIG5v
dCBzZXQKIyBDT05GSUdfVVNCX0lETU9VU0UgaXMgbm90IHNldAojIENPTkZJR19VU0JfRlRE
SV9FTEFOIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX0FQUExFRElTUExBWSBpcyBub3Qgc2V0
CiMgQ09ORklHX1VTQl9TSVNVU0JWR0EgaXMgbm90IHNldAojIENPTkZJR19VU0JfTEQgaXMg
bm90IHNldAojIENPTkZJR19VU0JfVFJBTkNFVklCUkFUT1IgaXMgbm90IHNldAojIENPTkZJ
R19VU0JfSU9XQVJSSU9SIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX1RFU1QgaXMgbm90IHNl
dAojIENPTkZJR19VU0JfRUhTRVRfVEVTVF9GSVhUVVJFIGlzIG5vdCBzZXQKIyBDT05GSUdf
VVNCX0lTSUdIVEZXIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX1lVUkVYIGlzIG5vdCBzZXQK
IyBDT05GSUdfVVNCX0VaVVNCX0ZYMiBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9IVUJfVVNC
MjUxWEIgaXMgbm90IHNldAojIENPTkZJR19VU0JfSFNJQ19VU0IzNTAzIGlzIG5vdCBzZXQK
IyBDT05GSUdfVVNCX0hTSUNfVVNCNDYwNCBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9MSU5L
X0xBWUVSX1RFU1QgaXMgbm90IHNldAojIENPTkZJR19VU0JfQ0hBT1NLRVkgaXMgbm90IHNl
dAoKIwojIFVTQiBQaHlzaWNhbCBMYXllciBkcml2ZXJzCiMKQ09ORklHX1VTQl9QSFk9eQpD
T05GSUdfTk9QX1VTQl9YQ0VJVj15CiMgQ09ORklHX0FNMzM1WF9QSFlfVVNCIGlzIG5vdCBz
ZXQKQ09ORklHX1RXTDYwMzBfVVNCPXkKIyBDT05GSUdfVVNCX0dQSU9fVkJVUyBpcyBub3Qg
c2V0CiMgQ09ORklHX1VTQl9JU1AxMzAxIGlzIG5vdCBzZXQKQ09ORklHX1VTQl9VTFBJPXkK
Q09ORklHX1VTQl9VTFBJX1ZJRVdQT1JUPXkKIyBlbmQgb2YgVVNCIFBoeXNpY2FsIExheWVy
IGRyaXZlcnMKCiMgQ09ORklHX1VTQl9HQURHRVQgaXMgbm90IHNldAojIENPTkZJR19UWVBF
QyBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9ST0xFX1NXSVRDSCBpcyBub3Qgc2V0CiMgQ09O
RklHX1VTQl9MRURfVFJJRyBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9VTFBJX0JVUyBpcyBu
b3Qgc2V0CiMgQ09ORklHX1VXQiBpcyBub3Qgc2V0CiMgQ09ORklHX01NQyBpcyBub3Qgc2V0
CiMgQ09ORklHX01FTVNUSUNLIGlzIG5vdCBzZXQKQ09ORklHX05FV19MRURTPXkKQ09ORklH
X0xFRFNfQ0xBU1M9eQojIENPTkZJR19MRURTX0NMQVNTX0ZMQVNIIGlzIG5vdCBzZXQKIyBD
T05GSUdfTEVEU19CUklHSFRORVNTX0hXX0NIQU5HRUQgaXMgbm90IHNldAoKIwojIExFRCBk
cml2ZXJzCiMKIyBDT05GSUdfTEVEU19BTjMwMjU5QSBpcyBub3Qgc2V0CiMgQ09ORklHX0xF
RFNfQkNNNjMyOCBpcyBub3Qgc2V0CiMgQ09ORklHX0xFRFNfQkNNNjM1OCBpcyBub3Qgc2V0
CiMgQ09ORklHX0xFRFNfQ1BDQVAgaXMgbm90IHNldAojIENPTkZJR19MRURTX0NSMDAxNDEx
NCBpcyBub3Qgc2V0CiMgQ09ORklHX0xFRFNfTE0zNTMwIGlzIG5vdCBzZXQKIyBDT05GSUdf
TEVEU19MTTM1MzIgaXMgbm90IHNldAojIENPTkZJR19MRURTX0xNMzY0MiBpcyBub3Qgc2V0
CiMgQ09ORklHX0xFRFNfTE0zNjkyWCBpcyBub3Qgc2V0CiMgQ09ORklHX0xFRFNfUENBOTUz
MiBpcyBub3Qgc2V0CiMgQ09ORklHX0xFRFNfR1BJTyBpcyBub3Qgc2V0CiMgQ09ORklHX0xF
RFNfTFAzOTQ0IGlzIG5vdCBzZXQKIyBDT05GSUdfTEVEU19MUDM5NTIgaXMgbm90IHNldAoj
IENPTkZJR19MRURTX0xQNTUyMSBpcyBub3Qgc2V0CiMgQ09ORklHX0xFRFNfTFA1NTIzIGlz
IG5vdCBzZXQKIyBDT05GSUdfTEVEU19MUDU1NjIgaXMgbm90IHNldAojIENPTkZJR19MRURT
X0xQODUwMSBpcyBub3Qgc2V0CiMgQ09ORklHX0xFRFNfTFA4ODYwIGlzIG5vdCBzZXQKIyBD
T05GSUdfTEVEU19QQ0E5NTVYIGlzIG5vdCBzZXQKIyBDT05GSUdfTEVEU19QQ0E5NjNYIGlz
IG5vdCBzZXQKIyBDT05GSUdfTEVEU19EQUMxMjRTMDg1IGlzIG5vdCBzZXQKIyBDT05GSUdf
TEVEU19QV00gaXMgbm90IHNldAojIENPTkZJR19MRURTX1JFR1VMQVRPUiBpcyBub3Qgc2V0
CiMgQ09ORklHX0xFRFNfQkQyODAyIGlzIG5vdCBzZXQKIyBDT05GSUdfTEVEU19MVDM1OTMg
aXMgbm90IHNldAojIENPTkZJR19MRURTX1RDQTY1MDcgaXMgbm90IHNldApDT05GSUdfTEVE
U19UTEM1OTFYWD15CiMgQ09ORklHX0xFRFNfTE0zNTV4IGlzIG5vdCBzZXQKIyBDT05GSUdf
TEVEU19JUzMxRkwzMTlYIGlzIG5vdCBzZXQKIyBDT05GSUdfTEVEU19JUzMxRkwzMlhYIGlz
IG5vdCBzZXQKCiMKIyBMRUQgZHJpdmVyIGZvciBibGluaygxKSBVU0IgUkdCIExFRCBpcyB1
bmRlciBTcGVjaWFsIEhJRCBkcml2ZXJzIChISURfVEhJTkdNKQojCiMgQ09ORklHX0xFRFNf
QkxJTktNIGlzIG5vdCBzZXQKIyBDT05GSUdfTEVEU19TWVNDT04gaXMgbm90IHNldAojIENP
TkZJR19MRURTX01MWFJFRyBpcyBub3Qgc2V0CiMgQ09ORklHX0xFRFNfVVNFUiBpcyBub3Qg
c2V0CiMgQ09ORklHX0xFRFNfU1BJX0JZVEUgaXMgbm90IHNldAojIENPTkZJR19MRURTX1RJ
X0xNVV9DT01NT04gaXMgbm90IHNldAoKIwojIExFRCBUcmlnZ2VycwojCkNPTkZJR19MRURT
X1RSSUdHRVJTPXkKIyBDT05GSUdfTEVEU19UUklHR0VSX1RJTUVSIGlzIG5vdCBzZXQKIyBD
T05GSUdfTEVEU19UUklHR0VSX09ORVNIT1QgaXMgbm90IHNldAojIENPTkZJR19MRURTX1RS
SUdHRVJfRElTSyBpcyBub3Qgc2V0CiMgQ09ORklHX0xFRFNfVFJJR0dFUl9NVEQgaXMgbm90
IHNldAojIENPTkZJR19MRURTX1RSSUdHRVJfSEVBUlRCRUFUIGlzIG5vdCBzZXQKIyBDT05G
SUdfTEVEU19UUklHR0VSX0JBQ0tMSUdIVCBpcyBub3Qgc2V0CkNPTkZJR19MRURTX1RSSUdH
RVJfQ1BVPXkKIyBDT05GSUdfTEVEU19UUklHR0VSX0FDVElWSVRZIGlzIG5vdCBzZXQKIyBD
T05GSUdfTEVEU19UUklHR0VSX0dQSU8gaXMgbm90IHNldAojIENPTkZJR19MRURTX1RSSUdH
RVJfREVGQVVMVF9PTiBpcyBub3Qgc2V0CgojCiMgaXB0YWJsZXMgdHJpZ2dlciBpcyB1bmRl
ciBOZXRmaWx0ZXIgY29uZmlnIChMRUQgdGFyZ2V0KQojCiMgQ09ORklHX0xFRFNfVFJJR0dF
Ul9UUkFOU0lFTlQgaXMgbm90IHNldAojIENPTkZJR19MRURTX1RSSUdHRVJfQ0FNRVJBIGlz
IG5vdCBzZXQKIyBDT05GSUdfTEVEU19UUklHR0VSX1BBTklDIGlzIG5vdCBzZXQKIyBDT05G
SUdfTEVEU19UUklHR0VSX05FVERFViBpcyBub3Qgc2V0CiMgQ09ORklHX0xFRFNfVFJJR0dF
Ul9QQVRURVJOIGlzIG5vdCBzZXQKIyBDT05GSUdfTEVEU19UUklHR0VSX0FVRElPIGlzIG5v
dCBzZXQKIyBDT05GSUdfQUNDRVNTSUJJTElUWSBpcyBub3Qgc2V0CiMgQ09ORklHX0lORklO
SUJBTkQgaXMgbm90IHNldApDT05GSUdfRURBQ19BVE9NSUNfU0NSVUI9eQpDT05GSUdfRURB
Q19TVVBQT1JUPXkKQ09ORklHX1JUQ19MSUI9eQpDT05GSUdfUlRDX0NMQVNTPXkKQ09ORklH
X1JUQ19IQ1RPU1lTPXkKQ09ORklHX1JUQ19IQ1RPU1lTX0RFVklDRT0icnRjMCIKQ09ORklH
X1JUQ19TWVNUT0hDPXkKQ09ORklHX1JUQ19TWVNUT0hDX0RFVklDRT0icnRjMCIKIyBDT05G
SUdfUlRDX0RFQlVHIGlzIG5vdCBzZXQKQ09ORklHX1JUQ19OVk1FTT15CgojCiMgUlRDIGlu
dGVyZmFjZXMKIwpDT05GSUdfUlRDX0lOVEZfU1lTRlM9eQpDT05GSUdfUlRDX0lOVEZfUFJP
Qz15CkNPTkZJR19SVENfSU5URl9ERVY9eQojIENPTkZJR19SVENfSU5URl9ERVZfVUlFX0VN
VUwgaXMgbm90IHNldAojIENPTkZJR19SVENfRFJWX1RFU1QgaXMgbm90IHNldAoKIwojIEky
QyBSVEMgZHJpdmVycwojCiMgQ09ORklHX1JUQ19EUlZfQUJCNVpFUzMgaXMgbm90IHNldAoj
IENPTkZJR19SVENfRFJWX0FCRU9aOSBpcyBub3Qgc2V0CiMgQ09ORklHX1JUQ19EUlZfQUJY
ODBYIGlzIG5vdCBzZXQKIyBDT05GSUdfUlRDX0RSVl9EUzEzMDcgaXMgbm90IHNldAojIENP
TkZJR19SVENfRFJWX0RTMTM3NCBpcyBub3Qgc2V0CiMgQ09ORklHX1JUQ19EUlZfRFMxNjcy
IGlzIG5vdCBzZXQKIyBDT05GSUdfUlRDX0RSVl9IWU04NTYzIGlzIG5vdCBzZXQKIyBDT05G
SUdfUlRDX0RSVl9NQVg2OTAwIGlzIG5vdCBzZXQKIyBDT05GSUdfUlRDX0RSVl9SUzVDMzcy
IGlzIG5vdCBzZXQKIyBDT05GSUdfUlRDX0RSVl9JU0wxMjA4IGlzIG5vdCBzZXQKIyBDT05G
SUdfUlRDX0RSVl9JU0wxMjAyMiBpcyBub3Qgc2V0CiMgQ09ORklHX1JUQ19EUlZfSVNMMTIw
MjYgaXMgbm90IHNldAojIENPTkZJR19SVENfRFJWX1gxMjA1IGlzIG5vdCBzZXQKIyBDT05G
SUdfUlRDX0RSVl9QQ0Y4NTIzIGlzIG5vdCBzZXQKIyBDT05GSUdfUlRDX0RSVl9QQ0Y4NTA2
MyBpcyBub3Qgc2V0CiMgQ09ORklHX1JUQ19EUlZfUENGODUzNjMgaXMgbm90IHNldAojIENP
TkZJR19SVENfRFJWX1BDRjg1NjMgaXMgbm90IHNldAojIENPTkZJR19SVENfRFJWX1BDRjg1
ODMgaXMgbm90IHNldAojIENPTkZJR19SVENfRFJWX000MVQ4MCBpcyBub3Qgc2V0CiMgQ09O
RklHX1JUQ19EUlZfQkQ3MDUyOCBpcyBub3Qgc2V0CiMgQ09ORklHX1JUQ19EUlZfQlEzMksg
aXMgbm90IHNldApDT05GSUdfUlRDX0RSVl9UV0w5MjMzMD15CiMgQ09ORklHX1JUQ19EUlZf
VFdMNDAzMCBpcyBub3Qgc2V0CiMgQ09ORklHX1JUQ19EUlZfUEFMTUFTIGlzIG5vdCBzZXQK
IyBDT05GSUdfUlRDX0RSVl9UUFM2NTkxMCBpcyBub3Qgc2V0CiMgQ09ORklHX1JUQ19EUlZf
UzM1MzkwQSBpcyBub3Qgc2V0CiMgQ09ORklHX1JUQ19EUlZfRk0zMTMwIGlzIG5vdCBzZXQK
IyBDT05GSUdfUlRDX0RSVl9SWDgwMTAgaXMgbm90IHNldAojIENPTkZJR19SVENfRFJWX1JY
ODU4MSBpcyBub3Qgc2V0CiMgQ09ORklHX1JUQ19EUlZfUlg4MDI1IGlzIG5vdCBzZXQKIyBD
T05GSUdfUlRDX0RSVl9FTTMwMjcgaXMgbm90IHNldAojIENPTkZJR19SVENfRFJWX1JWMzAy
OCBpcyBub3Qgc2V0CiMgQ09ORklHX1JUQ19EUlZfUlY4ODAzIGlzIG5vdCBzZXQKIyBDT05G
SUdfUlRDX0RSVl9TRDMwNzggaXMgbm90IHNldAoKIwojIFNQSSBSVEMgZHJpdmVycwojCiMg
Q09ORklHX1JUQ19EUlZfTTQxVDkzIGlzIG5vdCBzZXQKIyBDT05GSUdfUlRDX0RSVl9NNDFU
OTQgaXMgbm90IHNldAojIENPTkZJR19SVENfRFJWX0RTMTMwMiBpcyBub3Qgc2V0CiMgQ09O
RklHX1JUQ19EUlZfRFMxMzA1IGlzIG5vdCBzZXQKIyBDT05GSUdfUlRDX0RSVl9EUzEzNDMg
aXMgbm90IHNldAojIENPTkZJR19SVENfRFJWX0RTMTM0NyBpcyBub3Qgc2V0CiMgQ09ORklH
X1JUQ19EUlZfRFMxMzkwIGlzIG5vdCBzZXQKIyBDT05GSUdfUlRDX0RSVl9NQVg2OTE2IGlz
IG5vdCBzZXQKIyBDT05GSUdfUlRDX0RSVl9SOTcwMSBpcyBub3Qgc2V0CiMgQ09ORklHX1JU
Q19EUlZfUlg0NTgxIGlzIG5vdCBzZXQKIyBDT05GSUdfUlRDX0RSVl9SWDYxMTAgaXMgbm90
IHNldAojIENPTkZJR19SVENfRFJWX1JTNUMzNDggaXMgbm90IHNldAojIENPTkZJR19SVENf
RFJWX01BWDY5MDIgaXMgbm90IHNldAojIENPTkZJR19SVENfRFJWX1BDRjIxMjMgaXMgbm90
IHNldAojIENPTkZJR19SVENfRFJWX01DUDc5NSBpcyBub3Qgc2V0CkNPTkZJR19SVENfSTJD
X0FORF9TUEk9eQoKIwojIFNQSSBhbmQgSTJDIFJUQyBkcml2ZXJzCiMKIyBDT05GSUdfUlRD
X0RSVl9EUzMyMzIgaXMgbm90IHNldAojIENPTkZJR19SVENfRFJWX1BDRjIxMjcgaXMgbm90
IHNldAojIENPTkZJR19SVENfRFJWX1JWMzAyOUMyIGlzIG5vdCBzZXQKCiMKIyBQbGF0Zm9y
bSBSVEMgZHJpdmVycwojCiMgQ09ORklHX1JUQ19EUlZfQ01PUyBpcyBub3Qgc2V0CiMgQ09O
RklHX1JUQ19EUlZfRFMxMjg2IGlzIG5vdCBzZXQKIyBDT05GSUdfUlRDX0RSVl9EUzE1MTEg
aXMgbm90IHNldAojIENPTkZJR19SVENfRFJWX0RTMTU1MyBpcyBub3Qgc2V0CiMgQ09ORklH
X1JUQ19EUlZfRFMxNjg1X0ZBTUlMWSBpcyBub3Qgc2V0CiMgQ09ORklHX1JUQ19EUlZfRFMx
NzQyIGlzIG5vdCBzZXQKIyBDT05GSUdfUlRDX0RSVl9EUzI0MDQgaXMgbm90IHNldAojIENP
TkZJR19SVENfRFJWX1NUSzE3VEE4IGlzIG5vdCBzZXQKIyBDT05GSUdfUlRDX0RSVl9NNDhU
ODYgaXMgbm90IHNldAojIENPTkZJR19SVENfRFJWX000OFQzNSBpcyBub3Qgc2V0CiMgQ09O
RklHX1JUQ19EUlZfTTQ4VDU5IGlzIG5vdCBzZXQKIyBDT05GSUdfUlRDX0RSVl9NU002MjQy
IGlzIG5vdCBzZXQKIyBDT05GSUdfUlRDX0RSVl9CUTQ4MDIgaXMgbm90IHNldAojIENPTkZJ
R19SVENfRFJWX1JQNUMwMSBpcyBub3Qgc2V0CiMgQ09ORklHX1JUQ19EUlZfVjMwMjAgaXMg
bm90IHNldAojIENPTkZJR19SVENfRFJWX1pZTlFNUCBpcyBub3Qgc2V0CgojCiMgb24tQ1BV
IFJUQyBkcml2ZXJzCiMKIyBDT05GSUdfUlRDX0RSVl9PTUFQIGlzIG5vdCBzZXQKIyBDT05G
SUdfUlRDX0RSVl9DQURFTkNFIGlzIG5vdCBzZXQKIyBDT05GSUdfUlRDX0RSVl9GVFJUQzAx
MCBpcyBub3Qgc2V0CiMgQ09ORklHX1JUQ19EUlZfU05WUyBpcyBub3Qgc2V0CiMgQ09ORklH
X1JUQ19EUlZfUjczMDEgaXMgbm90IHNldAojIENPTkZJR19SVENfRFJWX0NQQ0FQIGlzIG5v
dCBzZXQKCiMKIyBISUQgU2Vuc29yIFJUQyBkcml2ZXJzCiMKQ09ORklHX0RNQURFVklDRVM9
eQojIENPTkZJR19ETUFERVZJQ0VTX0RFQlVHIGlzIG5vdCBzZXQKCiMKIyBETUEgRGV2aWNl
cwojCkNPTkZJR19ETUFfRU5HSU5FPXkKQ09ORklHX0RNQV9WSVJUVUFMX0NIQU5ORUxTPXkK
Q09ORklHX0RNQV9PRj15CiMgQ09ORklHX0FMVEVSQV9NU0dETUEgaXMgbm90IHNldAojIENP
TkZJR19EV19BWElfRE1BQyBpcyBub3Qgc2V0CiMgQ09ORklHX0ZTTF9FRE1BIGlzIG5vdCBz
ZXQKIyBDT05GSUdfRlNMX1FETUEgaXMgbm90IHNldAojIENPTkZJR19JTlRFTF9JRE1BNjQg
aXMgbm90IHNldAojIENPTkZJR19OQlBGQVhJX0RNQSBpcyBub3Qgc2V0CiMgQ09ORklHX1FD
T01fSElETUFfTUdNVCBpcyBub3Qgc2V0CiMgQ09ORklHX1FDT01fSElETUEgaXMgbm90IHNl
dAojIENPTkZJR19EV19ETUFDIGlzIG5vdCBzZXQKIyBDT05GSUdfRFdfRE1BQ19QQ0kgaXMg
bm90IHNldAojIENPTkZJR19EV19FRE1BIGlzIG5vdCBzZXQKIyBDT05GSUdfRFdfRURNQV9Q
Q0lFIGlzIG5vdCBzZXQKQ09ORklHX1RJX0NQUEk0MT15CkNPTkZJR19USV9FRE1BPXkKQ09O
RklHX0RNQV9PTUFQPXkKQ09ORklHX1RJX0RNQV9DUk9TU0JBUj15CgojCiMgRE1BIENsaWVu
dHMKIwojIENPTkZJR19BU1lOQ19UWF9ETUEgaXMgbm90IHNldAojIENPTkZJR19ETUFURVNU
IGlzIG5vdCBzZXQKCiMKIyBETUFCVUYgb3B0aW9ucwojCkNPTkZJR19TWU5DX0ZJTEU9eQoj
IENPTkZJR19TV19TWU5DIGlzIG5vdCBzZXQKIyBDT05GSUdfVURNQUJVRiBpcyBub3Qgc2V0
CiMgZW5kIG9mIERNQUJVRiBvcHRpb25zCgojIENPTkZJR19BVVhESVNQTEFZIGlzIG5vdCBz
ZXQKIyBDT05GSUdfVUlPIGlzIG5vdCBzZXQKIyBDT05GSUdfVkZJTyBpcyBub3Qgc2V0CiMg
Q09ORklHX1ZJUlRfRFJJVkVSUyBpcyBub3Qgc2V0CkNPTkZJR19WSVJUSU9fTUVOVT15CiMg
Q09ORklHX1ZJUlRJT19QQ0kgaXMgbm90IHNldAojIENPTkZJR19WSVJUSU9fTU1JTyBpcyBu
b3Qgc2V0CgojCiMgTWljcm9zb2Z0IEh5cGVyLVYgZ3Vlc3Qgc3VwcG9ydAojCiMgZW5kIG9m
IE1pY3Jvc29mdCBIeXBlci1WIGd1ZXN0IHN1cHBvcnQKCiMgQ09ORklHX1NUQUdJTkcgaXMg
bm90IHNldAojIENPTkZJR19HT0xERklTSCBpcyBub3Qgc2V0CiMgQ09ORklHX0NIUk9NRV9Q
TEFURk9STVMgaXMgbm90IHNldAojIENPTkZJR19NRUxMQU5PWF9QTEFURk9STSBpcyBub3Qg
c2V0CkNPTkZJR19DTEtERVZfTE9PS1VQPXkKQ09ORklHX0hBVkVfQ0xLX1BSRVBBUkU9eQpD
T05GSUdfQ09NTU9OX0NMSz15CgojCiMgQ29tbW9uIENsb2NrIEZyYW1ld29yawojCiMgQ09O
RklHX0NMS19IU0RLIGlzIG5vdCBzZXQKIyBDT05GSUdfQ09NTU9OX0NMS19NQVg5NDg1IGlz
IG5vdCBzZXQKIyBDT05GSUdfQ09NTU9OX0NMS19TSTUzNDEgaXMgbm90IHNldAojIENPTkZJ
R19DT01NT05fQ0xLX1NJNTM1MSBpcyBub3Qgc2V0CiMgQ09ORklHX0NPTU1PTl9DTEtfU0k1
MTQgaXMgbm90IHNldAojIENPTkZJR19DT01NT05fQ0xLX1NJNTQ0IGlzIG5vdCBzZXQKIyBD
T05GSUdfQ09NTU9OX0NMS19TSTU3MCBpcyBub3Qgc2V0CiMgQ09ORklHX0NPTU1PTl9DTEtf
Q0RDRTcwNiBpcyBub3Qgc2V0CiMgQ09ORklHX0NPTU1PTl9DTEtfQ0RDRTkyNSBpcyBub3Qg
c2V0CiMgQ09ORklHX0NPTU1PTl9DTEtfQ1MyMDAwX0NQIGlzIG5vdCBzZXQKIyBDT05GSUdf
Q0xLX1RXTDYwNDAgaXMgbm90IHNldAojIENPTkZJR19DTEtfUU9SSVEgaXMgbm90IHNldAoj
IENPTkZJR19DT01NT05fQ0xLX1BBTE1BUyBpcyBub3Qgc2V0CiMgQ09ORklHX0NPTU1PTl9D
TEtfUFdNIGlzIG5vdCBzZXQKIyBDT05GSUdfQ09NTU9OX0NMS19WQzUgaXMgbm90IHNldAoj
IENPTkZJR19DT01NT05fQ0xLX0ZJWEVEX01NSU8gaXMgbm90IHNldApDT05GSUdfQ09NTU9O
X0NMS19USV9BRFBMTD15CiMgZW5kIG9mIENvbW1vbiBDbG9jayBGcmFtZXdvcmsKCiMgQ09O
RklHX0hXU1BJTkxPQ0sgaXMgbm90IHNldAoKIwojIENsb2NrIFNvdXJjZSBkcml2ZXJzCiMK
Q09ORklHX1RJTUVSX09GPXkKQ09ORklHX1RJTUVSX1BST0JFPXkKQ09ORklHX09NQVBfRE1f
VElNRVI9eQpDT05GSUdfQ0xLU1JDX01NSU89eQpDT05GSUdfQ0xLU1JDX1RJXzMySz15CkNP
TkZJR19BUk1fQVJDSF9USU1FUj15CkNPTkZJR19BUk1fQVJDSF9USU1FUl9FVlRTVFJFQU09
eQojIGVuZCBvZiBDbG9jayBTb3VyY2UgZHJpdmVycwoKIyBDT05GSUdfTUFJTEJPWCBpcyBu
b3Qgc2V0CkNPTkZJR19JT01NVV9BUEk9eQpDT05GSUdfSU9NTVVfU1VQUE9SVD15CgojCiMg
R2VuZXJpYyBJT01NVSBQYWdldGFibGUgU3VwcG9ydAojCiMgQ09ORklHX0lPTU1VX0lPX1BH
VEFCTEVfTFBBRSBpcyBub3Qgc2V0CiMgQ09ORklHX0lPTU1VX0lPX1BHVEFCTEVfQVJNVjdT
IGlzIG5vdCBzZXQKIyBlbmQgb2YgR2VuZXJpYyBJT01NVSBQYWdldGFibGUgU3VwcG9ydAoK
IyBDT05GSUdfSU9NTVVfREVCVUdGUyBpcyBub3Qgc2V0CiMgQ09ORklHX0lPTU1VX0RFRkFV
TFRfUEFTU1RIUk9VR0ggaXMgbm90IHNldApDT05GSUdfT0ZfSU9NTVU9eQpDT05GSUdfT01B
UF9JT01NVT15CiMgQ09ORklHX09NQVBfSU9NTVVfREVCVUcgaXMgbm90IHNldAojIENPTkZJ
R19BUk1fU01NVSBpcyBub3Qgc2V0CgojCiMgUmVtb3RlcHJvYyBkcml2ZXJzCiMKIyBDT05G
SUdfUkVNT1RFUFJPQyBpcyBub3Qgc2V0CiMgZW5kIG9mIFJlbW90ZXByb2MgZHJpdmVycwoK
IwojIFJwbXNnIGRyaXZlcnMKIwojIENPTkZJR19SUE1TR19WSVJUSU8gaXMgbm90IHNldAoj
IGVuZCBvZiBScG1zZyBkcml2ZXJzCgojIENPTkZJR19TT1VORFdJUkUgaXMgbm90IHNldAoK
IwojIFNPQyAoU3lzdGVtIE9uIENoaXApIHNwZWNpZmljIERyaXZlcnMKIwoKIwojIEFtbG9n
aWMgU29DIGRyaXZlcnMKIwojIGVuZCBvZiBBbWxvZ2ljIFNvQyBkcml2ZXJzCgojCiMgQXNw
ZWVkIFNvQyBkcml2ZXJzCiMKIyBlbmQgb2YgQXNwZWVkIFNvQyBkcml2ZXJzCgojCiMgQnJv
YWRjb20gU29DIGRyaXZlcnMKIwojIENPTkZJR19TT0NfQlJDTVNUQiBpcyBub3Qgc2V0CiMg
ZW5kIG9mIEJyb2FkY29tIFNvQyBkcml2ZXJzCgojCiMgTlhQL0ZyZWVzY2FsZSBRb3JJUSBT
b0MgZHJpdmVycwojCiMgZW5kIG9mIE5YUC9GcmVlc2NhbGUgUW9ySVEgU29DIGRyaXZlcnMK
CiMKIyBpLk1YIFNvQyBkcml2ZXJzCiMKIyBlbmQgb2YgaS5NWCBTb0MgZHJpdmVycwoKIwoj
IFF1YWxjb21tIFNvQyBkcml2ZXJzCiMKIyBlbmQgb2YgUXVhbGNvbW0gU29DIGRyaXZlcnMK
CkNPTkZJR19TT0NfVEk9eQoKIwojIFhpbGlueCBTb0MgZHJpdmVycwojCiMgQ09ORklHX1hJ
TElOWF9WQ1UgaXMgbm90IHNldAojIGVuZCBvZiBYaWxpbnggU29DIGRyaXZlcnMKIyBlbmQg
b2YgU09DIChTeXN0ZW0gT24gQ2hpcCkgc3BlY2lmaWMgRHJpdmVycwoKIyBDT05GSUdfUE1f
REVWRlJFUSBpcyBub3Qgc2V0CkNPTkZJR19FWFRDT049eQoKIwojIEV4dGNvbiBEZXZpY2Ug
RHJpdmVycwojCiMgQ09ORklHX0VYVENPTl9GU0E5NDgwIGlzIG5vdCBzZXQKQ09ORklHX0VY
VENPTl9HUElPPXkKIyBDT05GSUdfRVhUQ09OX01BWDMzNTUgaXMgbm90IHNldApDT05GSUdf
RVhUQ09OX1BBTE1BUz15CiMgQ09ORklHX0VYVENPTl9QVE41MTUwIGlzIG5vdCBzZXQKIyBD
T05GSUdfRVhUQ09OX1JUODk3M0EgaXMgbm90IHNldAojIENPTkZJR19FWFRDT05fU001NTAy
IGlzIG5vdCBzZXQKQ09ORklHX0VYVENPTl9VU0JfR1BJTz15CkNPTkZJR19NRU1PUlk9eQoj
IENPTkZJR19USV9FTUlGIGlzIG5vdCBzZXQKQ09ORklHX09NQVBfR1BNQz15CiMgQ09ORklH
X09NQVBfR1BNQ19ERUJVRyBpcyBub3Qgc2V0CiMgQ09ORklHX1RJX0VNSUZfU1JBTSBpcyBu
b3Qgc2V0CiMgQ09ORklHX0lJTyBpcyBub3Qgc2V0CiMgQ09ORklHX05UQiBpcyBub3Qgc2V0
CiMgQ09ORklHX1ZNRV9CVVMgaXMgbm90IHNldApDT05GSUdfUFdNPXkKQ09ORklHX1BXTV9T
WVNGUz15CiMgQ09ORklHX1BXTV9GU0xfRlRNIGlzIG5vdCBzZXQKIyBDT05GSUdfUFdNX09N
QVBfRE1USU1FUiBpcyBub3Qgc2V0CiMgQ09ORklHX1BXTV9QQ0E5Njg1IGlzIG5vdCBzZXQK
Q09ORklHX1BXTV9USUVDQVA9eQpDT05GSUdfUFdNX1RJRUhSUFdNPXkKQ09ORklHX1BXTV9U
SVBXTVNTPXkKQ09ORklHX1BXTV9UV0w9eQpDT05GSUdfUFdNX1RXTF9MRUQ9eQoKIwojIElS
USBjaGlwIHN1cHBvcnQKIwpDT05GSUdfSVJRQ0hJUD15CkNPTkZJR19BUk1fR0lDPXkKQ09O
RklHX0FSTV9HSUNfTUFYX05SPTEKIyBDT05GSUdfQUxfRklDIGlzIG5vdCBzZXQKQ09ORklH
X09NQVBfSVJRQ0hJUD15CkNPTkZJR19JUlFfQ1JPU1NCQVI9eQojIGVuZCBvZiBJUlEgY2hp
cCBzdXBwb3J0CgojIENPTkZJR19JUEFDS19CVVMgaXMgbm90IHNldAojIENPTkZJR19SRVNF
VF9DT05UUk9MTEVSIGlzIG5vdCBzZXQKCiMKIyBQSFkgU3Vic3lzdGVtCiMKQ09ORklHX0dF
TkVSSUNfUEhZPXkKIyBDT05GSUdfQkNNX0tPTkFfVVNCMl9QSFkgaXMgbm90IHNldApDT05G
SUdfUEhZX0NBREVOQ0VfRFA9bQojIENPTkZJR19QSFlfQ0FERU5DRV9EUEhZIGlzIG5vdCBz
ZXQKIyBDT05GSUdfUEhZX0ZTTF9JTVg4TVFfVVNCIGlzIG5vdCBzZXQKIyBDT05GSUdfUEhZ
X01JWEVMX01JUElfRFBIWSBpcyBub3Qgc2V0CiMgQ09ORklHX1BIWV9QWEFfMjhOTV9IU0lD
IGlzIG5vdCBzZXQKIyBDT05GSUdfUEhZX1BYQV8yOE5NX1VTQjIgaXMgbm90IHNldAojIENP
TkZJR19QSFlfTUFQUEhPTkVfTURNNjYwMCBpcyBub3Qgc2V0CiMgQ09ORklHX1BIWV9PQ0VM
T1RfU0VSREVTIGlzIG5vdCBzZXQKIyBDT05GSUdfUEhZX0RNODE2WF9VU0IgaXMgbm90IHNl
dApDT05GSUdfT01BUF9DT05UUk9MX1BIWT15CkNPTkZJR19PTUFQX1VTQjI9eQpDT05GSUdf
VElfUElQRTM9eQpDT05GSUdfVFdMNDAzMF9VU0I9eQpDT05GSUdfUEhZX1RJX0dNSUlfU0VM
PXkKIyBlbmQgb2YgUEhZIFN1YnN5c3RlbQoKIyBDT05GSUdfUE9XRVJDQVAgaXMgbm90IHNl
dAojIENPTkZJR19NQ0IgaXMgbm90IHNldAoKIwojIFBlcmZvcm1hbmNlIG1vbml0b3Igc3Vw
cG9ydAojCiMgQ09ORklHX0FSTV9DQ0lfUE1VIGlzIG5vdCBzZXQKIyBDT05GSUdfQVJNX0ND
TiBpcyBub3Qgc2V0CkNPTkZJR19BUk1fUE1VPXkKIyBlbmQgb2YgUGVyZm9ybWFuY2UgbW9u
aXRvciBzdXBwb3J0CgojIENPTkZJR19SQVMgaXMgbm90IHNldAoKIwojIEFuZHJvaWQKIwoj
IENPTkZJR19BTkRST0lEIGlzIG5vdCBzZXQKIyBlbmQgb2YgQW5kcm9pZAoKIyBDT05GSUdf
REFYIGlzIG5vdCBzZXQKQ09ORklHX05WTUVNPXkKQ09ORklHX05WTUVNX1NZU0ZTPXkKCiMK
IyBIVyB0cmFjaW5nIHN1cHBvcnQKIwojIENPTkZJR19TVE0gaXMgbm90IHNldAojIENPTkZJ
R19JTlRFTF9USCBpcyBub3Qgc2V0CiMgZW5kIG9mIEhXIHRyYWNpbmcgc3VwcG9ydAoKIyBD
T05GSUdfRlBHQSBpcyBub3Qgc2V0CiMgQ09ORklHX0ZTSSBpcyBub3Qgc2V0CiMgQ09ORklH
X1RFRSBpcyBub3Qgc2V0CkNPTkZJR19QTV9PUFA9eQojIENPTkZJR19TSU9YIGlzIG5vdCBz
ZXQKIyBDT05GSUdfU0xJTUJVUyBpcyBub3Qgc2V0CiMgQ09ORklHX0lOVEVSQ09OTkVDVCBp
cyBub3Qgc2V0CiMgQ09ORklHX0NPVU5URVIgaXMgbm90IHNldAojIGVuZCBvZiBEZXZpY2Ug
RHJpdmVycwoKIwojIEZpbGUgc3lzdGVtcwojCkNPTkZJR19EQ0FDSEVfV09SRF9BQ0NFU1M9
eQojIENPTkZJR19WQUxJREFURV9GU19QQVJTRVIgaXMgbm90IHNldApDT05GSUdfRlNfSU9N
QVA9eQpDT05GSUdfRVhUMl9GUz15CiMgQ09ORklHX0VYVDJfRlNfWEFUVFIgaXMgbm90IHNl
dApDT05GSUdfRVhUM19GUz15CiMgQ09ORklHX0VYVDNfRlNfUE9TSVhfQUNMIGlzIG5vdCBz
ZXQKIyBDT05GSUdfRVhUM19GU19TRUNVUklUWSBpcyBub3Qgc2V0CkNPTkZJR19FWFQ0X0ZT
PXkKIyBDT05GSUdfRVhUNF9GU19QT1NJWF9BQ0wgaXMgbm90IHNldAojIENPTkZJR19FWFQ0
X0ZTX1NFQ1VSSVRZIGlzIG5vdCBzZXQKIyBDT05GSUdfRVhUNF9ERUJVRyBpcyBub3Qgc2V0
CkNPTkZJR19KQkQyPXkKIyBDT05GSUdfSkJEMl9ERUJVRyBpcyBub3Qgc2V0CkNPTkZJR19G
U19NQkNBQ0hFPXkKIyBDT05GSUdfUkVJU0VSRlNfRlMgaXMgbm90IHNldAojIENPTkZJR19K
RlNfRlMgaXMgbm90IHNldAojIENPTkZJR19YRlNfRlMgaXMgbm90IHNldAojIENPTkZJR19H
RlMyX0ZTIGlzIG5vdCBzZXQKIyBDT05GSUdfT0NGUzJfRlMgaXMgbm90IHNldAojIENPTkZJ
R19CVFJGU19GUyBpcyBub3Qgc2V0CiMgQ09ORklHX05JTEZTMl9GUyBpcyBub3Qgc2V0CiMg
Q09ORklHX0YyRlNfRlMgaXMgbm90IHNldApDT05GSUdfRlNfUE9TSVhfQUNMPXkKQ09ORklH
X0VYUE9SVEZTPXkKIyBDT05GSUdfRVhQT1JURlNfQkxPQ0tfT1BTIGlzIG5vdCBzZXQKQ09O
RklHX0ZJTEVfTE9DS0lORz15CkNPTkZJR19NQU5EQVRPUllfRklMRV9MT0NLSU5HPXkKIyBD
T05GSUdfRlNfRU5DUllQVElPTiBpcyBub3Qgc2V0CkNPTkZJR19GU05PVElGWT15CkNPTkZJ
R19ETk9USUZZPXkKQ09ORklHX0lOT1RJRllfVVNFUj15CkNPTkZJR19GQU5PVElGWT15CiMg
Q09ORklHX0ZBTk9USUZZX0FDQ0VTU19QRVJNSVNTSU9OUyBpcyBub3Qgc2V0CkNPTkZJR19R
VU9UQT15CiMgQ09ORklHX1FVT1RBX05FVExJTktfSU5URVJGQUNFIGlzIG5vdCBzZXQKQ09O
RklHX1BSSU5UX1FVT1RBX1dBUk5JTkc9eQojIENPTkZJR19RVU9UQV9ERUJVRyBpcyBub3Qg
c2V0CkNPTkZJR19RVU9UQV9UUkVFPXkKIyBDT05GSUdfUUZNVF9WMSBpcyBub3Qgc2V0CkNP
TkZJR19RRk1UX1YyPXkKQ09ORklHX1FVT1RBQ1RMPXkKIyBDT05GSUdfQVVUT0ZTNF9GUyBp
cyBub3Qgc2V0CiMgQ09ORklHX0FVVE9GU19GUyBpcyBub3Qgc2V0CiMgQ09ORklHX0ZVU0Vf
RlMgaXMgbm90IHNldAojIENPTkZJR19PVkVSTEFZX0ZTIGlzIG5vdCBzZXQKCiMKIyBDYWNo
ZXMKIwojIENPTkZJR19GU0NBQ0hFIGlzIG5vdCBzZXQKIyBlbmQgb2YgQ2FjaGVzCgojCiMg
Q0QtUk9NL0RWRCBGaWxlc3lzdGVtcwojCiMgQ09ORklHX0lTTzk2NjBfRlMgaXMgbm90IHNl
dAojIENPTkZJR19VREZfRlMgaXMgbm90IHNldAojIGVuZCBvZiBDRC1ST00vRFZEIEZpbGVz
eXN0ZW1zCgojCiMgRE9TL0ZBVC9OVCBGaWxlc3lzdGVtcwojCkNPTkZJR19GQVRfRlM9eQpD
T05GSUdfTVNET1NfRlM9eQpDT05GSUdfVkZBVF9GUz15CkNPTkZJR19GQVRfREVGQVVMVF9D
T0RFUEFHRT00MzcKQ09ORklHX0ZBVF9ERUZBVUxUX0lPQ0hBUlNFVD0iaXNvODg1OS0xIgoj
IENPTkZJR19GQVRfREVGQVVMVF9VVEY4IGlzIG5vdCBzZXQKIyBDT05GSUdfTlRGU19GUyBp
cyBub3Qgc2V0CiMgZW5kIG9mIERPUy9GQVQvTlQgRmlsZXN5c3RlbXMKCiMKIyBQc2V1ZG8g
ZmlsZXN5c3RlbXMKIwpDT05GSUdfUFJPQ19GUz15CkNPTkZJR19QUk9DX1NZU0NUTD15CkNP
TkZJR19QUk9DX1BBR0VfTU9OSVRPUj15CiMgQ09ORklHX1BST0NfQ0hJTERSRU4gaXMgbm90
IHNldApDT05GSUdfS0VSTkZTPXkKQ09ORklHX1NZU0ZTPXkKQ09ORklHX1RNUEZTPXkKQ09O
RklHX1RNUEZTX1BPU0lYX0FDTD15CkNPTkZJR19UTVBGU19YQVRUUj15CkNPTkZJR19NRU1G
RF9DUkVBVEU9eQpDT05GSUdfQ09ORklHRlNfRlM9eQojIGVuZCBvZiBQc2V1ZG8gZmlsZXN5
c3RlbXMKCkNPTkZJR19NSVNDX0ZJTEVTWVNURU1TPXkKIyBDT05GSUdfT1JBTkdFRlNfRlMg
aXMgbm90IHNldAojIENPTkZJR19BREZTX0ZTIGlzIG5vdCBzZXQKIyBDT05GSUdfQUZGU19G
UyBpcyBub3Qgc2V0CiMgQ09ORklHX0VDUllQVF9GUyBpcyBub3Qgc2V0CiMgQ09ORklHX0hG
U19GUyBpcyBub3Qgc2V0CiMgQ09ORklHX0hGU1BMVVNfRlMgaXMgbm90IHNldAojIENPTkZJ
R19CRUZTX0ZTIGlzIG5vdCBzZXQKIyBDT05GSUdfQkZTX0ZTIGlzIG5vdCBzZXQKIyBDT05G
SUdfRUZTX0ZTIGlzIG5vdCBzZXQKQ09ORklHX0pGRlMyX0ZTPXkKQ09ORklHX0pGRlMyX0ZT
X0RFQlVHPTAKQ09ORklHX0pGRlMyX0ZTX1dSSVRFQlVGRkVSPXkKIyBDT05GSUdfSkZGUzJf
RlNfV0JVRl9WRVJJRlkgaXMgbm90IHNldApDT05GSUdfSkZGUzJfU1VNTUFSWT15CkNPTkZJ
R19KRkZTMl9GU19YQVRUUj15CkNPTkZJR19KRkZTMl9GU19QT1NJWF9BQ0w9eQpDT05GSUdf
SkZGUzJfRlNfU0VDVVJJVFk9eQpDT05GSUdfSkZGUzJfQ09NUFJFU1NJT05fT1BUSU9OUz15
CkNPTkZJR19KRkZTMl9aTElCPXkKQ09ORklHX0pGRlMyX0xaTz15CkNPTkZJR19KRkZTMl9S
VElNRT15CkNPTkZJR19KRkZTMl9SVUJJTj15CiMgQ09ORklHX0pGRlMyX0NNT0RFX05PTkUg
aXMgbm90IHNldApDT05GSUdfSkZGUzJfQ01PREVfUFJJT1JJVFk9eQojIENPTkZJR19KRkZT
Ml9DTU9ERV9TSVpFIGlzIG5vdCBzZXQKIyBDT05GSUdfSkZGUzJfQ01PREVfRkFWT1VSTFpP
IGlzIG5vdCBzZXQKQ09ORklHX1VCSUZTX0ZTPXkKIyBDT05GSUdfVUJJRlNfRlNfQURWQU5D
RURfQ09NUFIgaXMgbm90IHNldApDT05GSUdfVUJJRlNfRlNfTFpPPXkKQ09ORklHX1VCSUZT
X0ZTX1pMSUI9eQpDT05GSUdfVUJJRlNfRlNfWlNURD15CiMgQ09ORklHX1VCSUZTX0FUSU1F
X1NVUFBPUlQgaXMgbm90IHNldApDT05GSUdfVUJJRlNfRlNfWEFUVFI9eQpDT05GSUdfVUJJ
RlNfRlNfU0VDVVJJVFk9eQojIENPTkZJR19VQklGU19GU19BVVRIRU5USUNBVElPTiBpcyBu
b3Qgc2V0CkNPTkZJR19DUkFNRlM9eQpDT05GSUdfQ1JBTUZTX0JMT0NLREVWPXkKIyBDT05G
SUdfQ1JBTUZTX01URCBpcyBub3Qgc2V0CiMgQ09ORklHX1NRVUFTSEZTIGlzIG5vdCBzZXQK
IyBDT05GSUdfVlhGU19GUyBpcyBub3Qgc2V0CiMgQ09ORklHX01JTklYX0ZTIGlzIG5vdCBz
ZXQKIyBDT05GSUdfT01GU19GUyBpcyBub3Qgc2V0CiMgQ09ORklHX0hQRlNfRlMgaXMgbm90
IHNldAojIENPTkZJR19RTlg0RlNfRlMgaXMgbm90IHNldAojIENPTkZJR19RTlg2RlNfRlMg
aXMgbm90IHNldAojIENPTkZJR19ST01GU19GUyBpcyBub3Qgc2V0CiMgQ09ORklHX1BTVE9S
RSBpcyBub3Qgc2V0CiMgQ09ORklHX1NZU1ZfRlMgaXMgbm90IHNldAojIENPTkZJR19VRlNf
RlMgaXMgbm90IHNldApDT05GSUdfTkVUV09SS19GSUxFU1lTVEVNUz15CkNPTkZJR19ORlNf
RlM9eQpDT05GSUdfTkZTX1YyPXkKQ09ORklHX05GU19WMz15CkNPTkZJR19ORlNfVjNfQUNM
PXkKQ09ORklHX05GU19WND15CiMgQ09ORklHX05GU19TV0FQIGlzIG5vdCBzZXQKIyBDT05G
SUdfTkZTX1Y0XzEgaXMgbm90IHNldApDT05GSUdfUk9PVF9ORlM9eQojIENPTkZJR19ORlNf
VVNFX0xFR0FDWV9ETlMgaXMgbm90IHNldApDT05GSUdfTkZTX1VTRV9LRVJORUxfRE5TPXkK
IyBDT05GSUdfTkZTRCBpcyBub3Qgc2V0CkNPTkZJR19HUkFDRV9QRVJJT0Q9eQpDT05GSUdf
TE9DS0Q9eQpDT05GSUdfTE9DS0RfVjQ9eQpDT05GSUdfTkZTX0FDTF9TVVBQT1JUPXkKQ09O
RklHX05GU19DT01NT049eQpDT05GSUdfU1VOUlBDPXkKQ09ORklHX1NVTlJQQ19HU1M9eQoj
IENPTkZJR19TVU5SUENfREVCVUcgaXMgbm90IHNldAojIENPTkZJR19DRVBIX0ZTIGlzIG5v
dCBzZXQKIyBDT05GSUdfQ0lGUyBpcyBub3Qgc2V0CiMgQ09ORklHX0NPREFfRlMgaXMgbm90
IHNldAojIENPTkZJR19BRlNfRlMgaXMgbm90IHNldApDT05GSUdfTkxTPXkKQ09ORklHX05M
U19ERUZBVUxUPSJpc284ODU5LTEiCkNPTkZJR19OTFNfQ09ERVBBR0VfNDM3PXkKIyBDT05G
SUdfTkxTX0NPREVQQUdFXzczNyBpcyBub3Qgc2V0CiMgQ09ORklHX05MU19DT0RFUEFHRV83
NzUgaXMgbm90IHNldAojIENPTkZJR19OTFNfQ09ERVBBR0VfODUwIGlzIG5vdCBzZXQKIyBD
T05GSUdfTkxTX0NPREVQQUdFXzg1MiBpcyBub3Qgc2V0CiMgQ09ORklHX05MU19DT0RFUEFH
RV84NTUgaXMgbm90IHNldAojIENPTkZJR19OTFNfQ09ERVBBR0VfODU3IGlzIG5vdCBzZXQK
IyBDT05GSUdfTkxTX0NPREVQQUdFXzg2MCBpcyBub3Qgc2V0CiMgQ09ORklHX05MU19DT0RF
UEFHRV84NjEgaXMgbm90IHNldAojIENPTkZJR19OTFNfQ09ERVBBR0VfODYyIGlzIG5vdCBz
ZXQKIyBDT05GSUdfTkxTX0NPREVQQUdFXzg2MyBpcyBub3Qgc2V0CiMgQ09ORklHX05MU19D
T0RFUEFHRV84NjQgaXMgbm90IHNldAojIENPTkZJR19OTFNfQ09ERVBBR0VfODY1IGlzIG5v
dCBzZXQKIyBDT05GSUdfTkxTX0NPREVQQUdFXzg2NiBpcyBub3Qgc2V0CiMgQ09ORklHX05M
U19DT0RFUEFHRV84NjkgaXMgbm90IHNldAojIENPTkZJR19OTFNfQ09ERVBBR0VfOTM2IGlz
IG5vdCBzZXQKIyBDT05GSUdfTkxTX0NPREVQQUdFXzk1MCBpcyBub3Qgc2V0CiMgQ09ORklH
X05MU19DT0RFUEFHRV85MzIgaXMgbm90IHNldAojIENPTkZJR19OTFNfQ09ERVBBR0VfOTQ5
IGlzIG5vdCBzZXQKIyBDT05GSUdfTkxTX0NPREVQQUdFXzg3NCBpcyBub3Qgc2V0CiMgQ09O
RklHX05MU19JU084ODU5XzggaXMgbm90IHNldAojIENPTkZJR19OTFNfQ09ERVBBR0VfMTI1
MCBpcyBub3Qgc2V0CiMgQ09ORklHX05MU19DT0RFUEFHRV8xMjUxIGlzIG5vdCBzZXQKIyBD
T05GSUdfTkxTX0FTQ0lJIGlzIG5vdCBzZXQKQ09ORklHX05MU19JU084ODU5XzE9eQojIENP
TkZJR19OTFNfSVNPODg1OV8yIGlzIG5vdCBzZXQKIyBDT05GSUdfTkxTX0lTTzg4NTlfMyBp
cyBub3Qgc2V0CiMgQ09ORklHX05MU19JU084ODU5XzQgaXMgbm90IHNldAojIENPTkZJR19O
TFNfSVNPODg1OV81IGlzIG5vdCBzZXQKIyBDT05GSUdfTkxTX0lTTzg4NTlfNiBpcyBub3Qg
c2V0CiMgQ09ORklHX05MU19JU084ODU5XzcgaXMgbm90IHNldAojIENPTkZJR19OTFNfSVNP
ODg1OV85IGlzIG5vdCBzZXQKIyBDT05GSUdfTkxTX0lTTzg4NTlfMTMgaXMgbm90IHNldAoj
IENPTkZJR19OTFNfSVNPODg1OV8xNCBpcyBub3Qgc2V0CiMgQ09ORklHX05MU19JU084ODU5
XzE1IGlzIG5vdCBzZXQKIyBDT05GSUdfTkxTX0tPSThfUiBpcyBub3Qgc2V0CiMgQ09ORklH
X05MU19LT0k4X1UgaXMgbm90IHNldAojIENPTkZJR19OTFNfTUFDX1JPTUFOIGlzIG5vdCBz
ZXQKIyBDT05GSUdfTkxTX01BQ19DRUxUSUMgaXMgbm90IHNldAojIENPTkZJR19OTFNfTUFD
X0NFTlRFVVJPIGlzIG5vdCBzZXQKIyBDT05GSUdfTkxTX01BQ19DUk9BVElBTiBpcyBub3Qg
c2V0CiMgQ09ORklHX05MU19NQUNfQ1lSSUxMSUMgaXMgbm90IHNldAojIENPTkZJR19OTFNf
TUFDX0dBRUxJQyBpcyBub3Qgc2V0CiMgQ09ORklHX05MU19NQUNfR1JFRUsgaXMgbm90IHNl
dAojIENPTkZJR19OTFNfTUFDX0lDRUxBTkQgaXMgbm90IHNldAojIENPTkZJR19OTFNfTUFD
X0lOVUlUIGlzIG5vdCBzZXQKIyBDT05GSUdfTkxTX01BQ19ST01BTklBTiBpcyBub3Qgc2V0
CiMgQ09ORklHX05MU19NQUNfVFVSS0lTSCBpcyBub3Qgc2V0CiMgQ09ORklHX05MU19VVEY4
IGlzIG5vdCBzZXQKIyBDT05GSUdfRExNIGlzIG5vdCBzZXQKIyBDT05GSUdfVU5JQ09ERSBp
cyBub3Qgc2V0CiMgZW5kIG9mIEZpbGUgc3lzdGVtcwoKIwojIFNlY3VyaXR5IG9wdGlvbnMK
IwpDT05GSUdfS0VZUz15CiMgQ09ORklHX0tFWVNfUkVRVUVTVF9DQUNIRSBpcyBub3Qgc2V0
CiMgQ09ORklHX1BFUlNJU1RFTlRfS0VZUklOR1MgaXMgbm90IHNldAojIENPTkZJR19CSUdf
S0VZUyBpcyBub3Qgc2V0CiMgQ09ORklHX0VOQ1JZUFRFRF9LRVlTIGlzIG5vdCBzZXQKIyBD
T05GSUdfS0VZX0RIX09QRVJBVElPTlMgaXMgbm90IHNldAojIENPTkZJR19TRUNVUklUWV9E
TUVTR19SRVNUUklDVCBpcyBub3Qgc2V0CkNPTkZJR19TRUNVUklUWT15CiMgQ09ORklHX1NF
Q1VSSVRZRlMgaXMgbm90IHNldAojIENPTkZJR19TRUNVUklUWV9ORVRXT1JLIGlzIG5vdCBz
ZXQKIyBDT05GSUdfU0VDVVJJVFlfUEFUSCBpcyBub3Qgc2V0CkNPTkZJR19IQVZFX0hBUkRF
TkVEX1VTRVJDT1BZX0FMTE9DQVRPUj15CiMgQ09ORklHX0hBUkRFTkVEX1VTRVJDT1BZIGlz
IG5vdCBzZXQKIyBDT05GSUdfRk9SVElGWV9TT1VSQ0UgaXMgbm90IHNldAojIENPTkZJR19T
VEFUSUNfVVNFUk1PREVIRUxQRVIgaXMgbm90IHNldAojIENPTkZJR19TRUNVUklUWV9TTUFD
SyBpcyBub3Qgc2V0CiMgQ09ORklHX1NFQ1VSSVRZX1RPTU9ZTyBpcyBub3Qgc2V0CiMgQ09O
RklHX1NFQ1VSSVRZX0FQUEFSTU9SIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VDVVJJVFlfTE9B
RFBJTiBpcyBub3Qgc2V0CiMgQ09ORklHX1NFQ1VSSVRZX1lBTUEgaXMgbm90IHNldAojIENP
TkZJR19TRUNVUklUWV9TQUZFU0VUSUQgaXMgbm90IHNldApDT05GSUdfSU5URUdSSVRZPXkK
IyBDT05GSUdfSU5URUdSSVRZX1NJR05BVFVSRSBpcyBub3Qgc2V0CkNPTkZJR19JTlRFR1JJ
VFlfQVVESVQ9eQojIENPTkZJR19JTUEgaXMgbm90IHNldAojIENPTkZJR19FVk0gaXMgbm90
IHNldApDT05GSUdfREVGQVVMVF9TRUNVUklUWV9EQUM9eQpDT05GSUdfTFNNPSJ5YW1hLGxv
YWRwaW4sc2FmZXNldGlkLGludGVncml0eSIKCiMKIyBLZXJuZWwgaGFyZGVuaW5nIG9wdGlv
bnMKIwoKIwojIE1lbW9yeSBpbml0aWFsaXphdGlvbgojCkNPTkZJR19JTklUX1NUQUNLX05P
TkU9eQojIENPTkZJR19JTklUX09OX0FMTE9DX0RFRkFVTFRfT04gaXMgbm90IHNldAojIENP
TkZJR19JTklUX09OX0ZSRUVfREVGQVVMVF9PTiBpcyBub3Qgc2V0CiMgZW5kIG9mIE1lbW9y
eSBpbml0aWFsaXphdGlvbgojIGVuZCBvZiBLZXJuZWwgaGFyZGVuaW5nIG9wdGlvbnMKIyBl
bmQgb2YgU2VjdXJpdHkgb3B0aW9ucwoKQ09ORklHX0NSWVBUTz15CgojCiMgQ3J5cHRvIGNv
cmUgb3IgaGVscGVyCiMKQ09ORklHX0NSWVBUT19BTEdBUEk9eQpDT05GSUdfQ1JZUFRPX0FM
R0FQSTI9eQpDT05GSUdfQ1JZUFRPX0JMS0NJUEhFUj15CkNPTkZJR19DUllQVE9fQkxLQ0lQ
SEVSMj15CkNPTkZJR19DUllQVE9fSEFTSD15CkNPTkZJR19DUllQVE9fSEFTSDI9eQpDT05G
SUdfQ1JZUFRPX1JORzI9eQpDT05GSUdfQ1JZUFRPX0FDT01QMj15CiMgQ09ORklHX0NSWVBU
T19NQU5BR0VSIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JZUFRPX1VTRVIgaXMgbm90IHNldAoj
IENPTkZJR19DUllQVE9fTlVMTCBpcyBub3Qgc2V0CiMgQ09ORklHX0NSWVBUT19QQ1JZUFQg
aXMgbm90IHNldAojIENPTkZJR19DUllQVE9fQ1JZUFREIGlzIG5vdCBzZXQKIyBDT05GSUdf
Q1JZUFRPX0FVVEhFTkMgaXMgbm90IHNldAojIENPTkZJR19DUllQVE9fVEVTVCBpcyBub3Qg
c2V0CgojCiMgUHVibGljLWtleSBjcnlwdG9ncmFwaHkKIwojIENPTkZJR19DUllQVE9fUlNB
IGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JZUFRPX0RIIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JZ
UFRPX0VDREggaXMgbm90IHNldAojIENPTkZJR19DUllQVE9fRUNSRFNBIGlzIG5vdCBzZXQK
CiMKIyBBdXRoZW50aWNhdGVkIEVuY3J5cHRpb24gd2l0aCBBc3NvY2lhdGVkIERhdGEKIwoj
IENPTkZJR19DUllQVE9fQ0NNIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JZUFRPX0dDTSBpcyBu
b3Qgc2V0CiMgQ09ORklHX0NSWVBUT19DSEFDSEEyMFBPTFkxMzA1IGlzIG5vdCBzZXQKIyBD
T05GSUdfQ1JZUFRPX0FFR0lTMTI4IGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JZUFRPX0FFR0lT
MTI4TCBpcyBub3Qgc2V0CiMgQ09ORklHX0NSWVBUT19BRUdJUzI1NiBpcyBub3Qgc2V0CiMg
Q09ORklHX0NSWVBUT19NT1JVUzY0MCBpcyBub3Qgc2V0CiMgQ09ORklHX0NSWVBUT19NT1JV
UzEyODAgaXMgbm90IHNldAojIENPTkZJR19DUllQVE9fU0VRSVYgaXMgbm90IHNldAojIENP
TkZJR19DUllQVE9fRUNIQUlOSVYgaXMgbm90IHNldAoKIwojIEJsb2NrIG1vZGVzCiMKIyBD
T05GSUdfQ1JZUFRPX0NCQyBpcyBub3Qgc2V0CiMgQ09ORklHX0NSWVBUT19DRkIgaXMgbm90
IHNldAojIENPTkZJR19DUllQVE9fQ1RSIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JZUFRPX0NU
UyBpcyBub3Qgc2V0CiMgQ09ORklHX0NSWVBUT19FQ0IgaXMgbm90IHNldAojIENPTkZJR19D
UllQVE9fTFJXIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JZUFRPX09GQiBpcyBub3Qgc2V0CiMg
Q09ORklHX0NSWVBUT19QQ0JDIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JZUFRPX1hUUyBpcyBu
b3Qgc2V0CiMgQ09ORklHX0NSWVBUT19LRVlXUkFQIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JZ
UFRPX0FESUFOVFVNIGlzIG5vdCBzZXQKCiMKIyBIYXNoIG1vZGVzCiMKIyBDT05GSUdfQ1JZ
UFRPX0NNQUMgaXMgbm90IHNldAojIENPTkZJR19DUllQVE9fSE1BQyBpcyBub3Qgc2V0CiMg
Q09ORklHX0NSWVBUT19YQ0JDIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JZUFRPX1ZNQUMgaXMg
bm90IHNldAoKIwojIERpZ2VzdAojCkNPTkZJR19DUllQVE9fQ1JDMzJDPXkKIyBDT05GSUdf
Q1JZUFRPX0NSQzMyIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JZUFRPX1hYSEFTSCBpcyBub3Qg
c2V0CkNPTkZJR19DUllQVE9fQ1JDVDEwRElGPXkKIyBDT05GSUdfQ1JZUFRPX0dIQVNIIGlz
IG5vdCBzZXQKIyBDT05GSUdfQ1JZUFRPX1BPTFkxMzA1IGlzIG5vdCBzZXQKIyBDT05GSUdf
Q1JZUFRPX01ENCBpcyBub3Qgc2V0CiMgQ09ORklHX0NSWVBUT19NRDUgaXMgbm90IHNldApD
T05GSUdfQ1JZUFRPX01JQ0hBRUxfTUlDPXkKIyBDT05GSUdfQ1JZUFRPX1JNRDEyOCBpcyBu
b3Qgc2V0CiMgQ09ORklHX0NSWVBUT19STUQxNjAgaXMgbm90IHNldAojIENPTkZJR19DUllQ
VE9fUk1EMjU2IGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JZUFRPX1JNRDMyMCBpcyBub3Qgc2V0
CiMgQ09ORklHX0NSWVBUT19TSEExIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JZUFRPX1NIQTI1
NiBpcyBub3Qgc2V0CiMgQ09ORklHX0NSWVBUT19TSEE1MTIgaXMgbm90IHNldAojIENPTkZJ
R19DUllQVE9fU0hBMyBpcyBub3Qgc2V0CiMgQ09ORklHX0NSWVBUT19TTTMgaXMgbm90IHNl
dAojIENPTkZJR19DUllQVE9fU1RSRUVCT0cgaXMgbm90IHNldAojIENPTkZJR19DUllQVE9f
VEdSMTkyIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JZUFRPX1dQNTEyIGlzIG5vdCBzZXQKCiMK
IyBDaXBoZXJzCiMKIyBDT05GSUdfQ1JZUFRPX0FFUyBpcyBub3Qgc2V0CiMgQ09ORklHX0NS
WVBUT19BRVNfVEkgaXMgbm90IHNldAojIENPTkZJR19DUllQVE9fQU5VQklTIGlzIG5vdCBz
ZXQKIyBDT05GSUdfQ1JZUFRPX0FSQzQgaXMgbm90IHNldAojIENPTkZJR19DUllQVE9fQkxP
V0ZJU0ggaXMgbm90IHNldAojIENPTkZJR19DUllQVE9fQ0FNRUxMSUEgaXMgbm90IHNldAoj
IENPTkZJR19DUllQVE9fQ0FTVDUgaXMgbm90IHNldAojIENPTkZJR19DUllQVE9fQ0FTVDYg
aXMgbm90IHNldAojIENPTkZJR19DUllQVE9fREVTIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JZ
UFRPX0ZDUllQVCBpcyBub3Qgc2V0CiMgQ09ORklHX0NSWVBUT19LSEFaQUQgaXMgbm90IHNl
dAojIENPTkZJR19DUllQVE9fU0FMU0EyMCBpcyBub3Qgc2V0CiMgQ09ORklHX0NSWVBUT19D
SEFDSEEyMCBpcyBub3Qgc2V0CiMgQ09ORklHX0NSWVBUT19TRUVEIGlzIG5vdCBzZXQKIyBD
T05GSUdfQ1JZUFRPX1NFUlBFTlQgaXMgbm90IHNldAojIENPTkZJR19DUllQVE9fU000IGlz
IG5vdCBzZXQKIyBDT05GSUdfQ1JZUFRPX1RFQSBpcyBub3Qgc2V0CiMgQ09ORklHX0NSWVBU
T19UV09GSVNIIGlzIG5vdCBzZXQKCiMKIyBDb21wcmVzc2lvbgojCkNPTkZJR19DUllQVE9f
REVGTEFURT15CkNPTkZJR19DUllQVE9fTFpPPXkKIyBDT05GSUdfQ1JZUFRPXzg0MiBpcyBu
b3Qgc2V0CiMgQ09ORklHX0NSWVBUT19MWjQgaXMgbm90IHNldAojIENPTkZJR19DUllQVE9f
TFo0SEMgaXMgbm90IHNldApDT05GSUdfQ1JZUFRPX1pTVEQ9eQoKIwojIFJhbmRvbSBOdW1i
ZXIgR2VuZXJhdGlvbgojCiMgQ09ORklHX0NSWVBUT19BTlNJX0NQUk5HIGlzIG5vdCBzZXQK
IyBDT05GSUdfQ1JZUFRPX0RSQkdfTUVOVSBpcyBub3Qgc2V0CiMgQ09ORklHX0NSWVBUT19K
SVRURVJFTlRST1BZIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JZUFRPX1VTRVJfQVBJX0hBU0gg
aXMgbm90IHNldAojIENPTkZJR19DUllQVE9fVVNFUl9BUElfU0tDSVBIRVIgaXMgbm90IHNl
dAojIENPTkZJR19DUllQVE9fVVNFUl9BUElfUk5HIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JZ
UFRPX1VTRVJfQVBJX0FFQUQgaXMgbm90IHNldApDT05GSUdfQ1JZUFRPX0hBU0hfSU5GTz15
CkNPTkZJR19DUllQVE9fSFc9eQojIENPTkZJR19DUllQVE9fREVWX0hJRk5fNzk1WCBpcyBu
b3Qgc2V0CiMgQ09ORklHX0NSWVBUT19ERVZfT01BUCBpcyBub3Qgc2V0CiMgQ09ORklHX0NS
WVBUT19ERVZfQVRNRUxfRUNDIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JZUFRPX0RFVl9BVE1F
TF9TSEEyMDRBIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JZUFRPX0RFVl9DQ1JFRSBpcyBub3Qg
c2V0CiMgQ09ORklHX0FTWU1NRVRSSUNfS0VZX1RZUEUgaXMgbm90IHNldAoKIwojIENlcnRp
ZmljYXRlcyBmb3Igc2lnbmF0dXJlIGNoZWNraW5nCiMKIyBDT05GSUdfU1lTVEVNX0JMQUNL
TElTVF9LRVlSSU5HIGlzIG5vdCBzZXQKIyBlbmQgb2YgQ2VydGlmaWNhdGVzIGZvciBzaWdu
YXR1cmUgY2hlY2tpbmcKCkNPTkZJR19CSU5BUllfUFJJTlRGPXkKCiMKIyBMaWJyYXJ5IHJv
dXRpbmVzCiMKIyBDT05GSUdfUEFDS0lORyBpcyBub3Qgc2V0CkNPTkZJR19CSVRSRVZFUlNF
PXkKQ09ORklHX0dFTkVSSUNfU1RSTkNQWV9GUk9NX1VTRVI9eQpDT05GSUdfR0VORVJJQ19T
VFJOTEVOX1VTRVI9eQpDT05GSUdfR0VORVJJQ19ORVRfVVRJTFM9eQojIENPTkZJR19DT1JE
SUMgaXMgbm90IHNldApDT05GSUdfUkFUSU9OQUw9eQpDT05GSUdfR0VORVJJQ19QQ0lfSU9N
QVA9eQpDT05GSUdfQVJDSF9VU0VfQ01QWENIR19MT0NLUkVGPXkKQ09ORklHX0NSQ19DQ0lU
VD15CkNPTkZJR19DUkMxNj15CkNPTkZJR19DUkNfVDEwRElGPXkKQ09ORklHX0NSQ19JVFVf
VD15CkNPTkZJR19DUkMzMj15CiMgQ09ORklHX0NSQzMyX1NFTEZURVNUIGlzIG5vdCBzZXQK
Q09ORklHX0NSQzMyX1NMSUNFQlk4PXkKIyBDT05GSUdfQ1JDMzJfU0xJQ0VCWTQgaXMgbm90
IHNldAojIENPTkZJR19DUkMzMl9TQVJXQVRFIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JDMzJf
QklUIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JDNjQgaXMgbm90IHNldAojIENPTkZJR19DUkM0
IGlzIG5vdCBzZXQKQ09ORklHX0NSQzc9eQpDT05GSUdfTElCQ1JDMzJDPXkKIyBDT05GSUdf
Q1JDOCBpcyBub3Qgc2V0CkNPTkZJR19YWEhBU0g9eQpDT05GSUdfQVVESVRfR0VORVJJQz15
CiMgQ09ORklHX1JBTkRPTTMyX1NFTEZURVNUIGlzIG5vdCBzZXQKQ09ORklHX1pMSUJfSU5G
TEFURT15CkNPTkZJR19aTElCX0RFRkxBVEU9eQpDT05GSUdfTFpPX0NPTVBSRVNTPXkKQ09O
RklHX0xaT19ERUNPTVBSRVNTPXkKQ09ORklHX0xaNF9ERUNPTVBSRVNTPXkKQ09ORklHX1pT
VERfQ09NUFJFU1M9eQpDT05GSUdfWlNURF9ERUNPTVBSRVNTPXkKQ09ORklHX1haX0RFQz15
CkNPTkZJR19YWl9ERUNfWDg2PXkKQ09ORklHX1haX0RFQ19QT1dFUlBDPXkKQ09ORklHX1ha
X0RFQ19JQTY0PXkKQ09ORklHX1haX0RFQ19BUk09eQpDT05GSUdfWFpfREVDX0FSTVRIVU1C
PXkKQ09ORklHX1haX0RFQ19TUEFSQz15CkNPTkZJR19YWl9ERUNfQkNKPXkKIyBDT05GSUdf
WFpfREVDX1RFU1QgaXMgbm90IHNldApDT05GSUdfREVDT01QUkVTU19HWklQPXkKQ09ORklH
X0RFQ09NUFJFU1NfQlpJUDI9eQpDT05GSUdfREVDT01QUkVTU19MWk1BPXkKQ09ORklHX0RF
Q09NUFJFU1NfWFo9eQpDT05GSUdfREVDT01QUkVTU19MWk89eQpDT05GSUdfREVDT01QUkVT
U19MWjQ9eQpDT05GSUdfR0VORVJJQ19BTExPQ0FUT1I9eQpDT05GSUdfQkNIPXkKQ09ORklH
X0FTU09DSUFUSVZFX0FSUkFZPXkKQ09ORklHX0hBU19JT01FTT15CkNPTkZJR19IQVNfSU9Q
T1JUX01BUD15CkNPTkZJR19IQVNfRE1BPXkKQ09ORklHX05FRURfRE1BX01BUF9TVEFURT15
CkNPTkZJR19ETUFfREVDTEFSRV9DT0hFUkVOVD15CkNPTkZJR19BUkNIX0hBU19TRVRVUF9E
TUFfT1BTPXkKQ09ORklHX0FSQ0hfSEFTX1RFQVJET1dOX0RNQV9PUFM9eQpDT05GSUdfRE1B
X1JFTUFQPXkKQ09ORklHX0RNQV9DTUE9eQoKIwojIERlZmF1bHQgY29udGlndW91cyBtZW1v
cnkgYXJlYSBzaXplOgojCkNPTkZJR19DTUFfU0laRV9NQllURVM9MzIKQ09ORklHX0NNQV9T
SVpFX1NFTF9NQllURVM9eQojIENPTkZJR19DTUFfU0laRV9TRUxfUEVSQ0VOVEFHRSBpcyBu
b3Qgc2V0CiMgQ09ORklHX0NNQV9TSVpFX1NFTF9NSU4gaXMgbm90IHNldAojIENPTkZJR19D
TUFfU0laRV9TRUxfTUFYIGlzIG5vdCBzZXQKQ09ORklHX0NNQV9BTElHTk1FTlQ9OApDT05G
SUdfRE1BX0FQSV9ERUJVRz15CkNPTkZJR19ETUFfQVBJX0RFQlVHX1NHPXkKQ09ORklHX1NH
TF9BTExPQz15CkNPTkZJR19DUFVfUk1BUD15CkNPTkZJR19EUUw9eQpDT05GSUdfR0xPQj15
CiMgQ09ORklHX0dMT0JfU0VMRlRFU1QgaXMgbm90IHNldApDT05GSUdfTkxBVFRSPXkKQ09O
RklHX0dFTkVSSUNfQVRPTUlDNjQ9eQojIENPTkZJR19JUlFfUE9MTCBpcyBub3Qgc2V0CkNP
TkZJR19ESU1MSUI9eQpDT05GSUdfTElCRkRUPXkKQ09ORklHX09JRF9SRUdJU1RSWT15CkNP
TkZJR19TR19TUExJVD15CkNPTkZJR19TR19QT09MPXkKQ09ORklHX1NCSVRNQVA9eQojIENP
TkZJR19TVFJJTkdfU0VMRlRFU1QgaXMgbm90IHNldAojIGVuZCBvZiBMaWJyYXJ5IHJvdXRp
bmVzCgojCiMgS2VybmVsIGhhY2tpbmcKIwoKIwojIHByaW50ayBhbmQgZG1lc2cgb3B0aW9u
cwojCkNPTkZJR19QUklOVEtfVElNRT15CiMgQ09ORklHX1BSSU5US19DQUxMRVIgaXMgbm90
IHNldApDT05GSUdfQ09OU09MRV9MT0dMRVZFTF9ERUZBVUxUPTcKQ09ORklHX0NPTlNPTEVf
TE9HTEVWRUxfUVVJRVQ9NApDT05GSUdfTUVTU0FHRV9MT0dMRVZFTF9ERUZBVUxUPTQKIyBD
T05GSUdfQk9PVF9QUklOVEtfREVMQVkgaXMgbm90IHNldApDT05GSUdfRFlOQU1JQ19ERUJV
Rz15CiMgZW5kIG9mIHByaW50ayBhbmQgZG1lc2cgb3B0aW9ucwoKIwojIENvbXBpbGUtdGlt
ZSBjaGVja3MgYW5kIGNvbXBpbGVyIG9wdGlvbnMKIwpDT05GSUdfREVCVUdfSU5GTz15CkNP
TkZJR19ERUJVR19JTkZPX1JFRFVDRUQ9eQpDT05GSUdfREVCVUdfSU5GT19TUExJVD15CkNP
TkZJR19ERUJVR19JTkZPX0RXQVJGND15CiMgQ09ORklHX0RFQlVHX0lORk9fQlRGIGlzIG5v
dCBzZXQKIyBDT05GSUdfR0RCX1NDUklQVFMgaXMgbm90IHNldApDT05GSUdfRU5BQkxFX01V
U1RfQ0hFQ0s9eQpDT05GSUdfRlJBTUVfV0FSTj0xMDI0CiMgQ09ORklHX1NUUklQX0FTTV9T
WU1TIGlzIG5vdCBzZXQKIyBDT05GSUdfUkVBREFCTEVfQVNNIGlzIG5vdCBzZXQKIyBDT05G
SUdfVU5VU0VEX1NZTUJPTFMgaXMgbm90IHNldApDT05GSUdfREVCVUdfRlM9eQojIENPTkZJ
R19IRUFERVJTX0lOU1RBTEwgaXMgbm90IHNldAojIENPTkZJR19PUFRJTUlaRV9JTkxJTklO
RyBpcyBub3Qgc2V0CiMgQ09ORklHX0RFQlVHX1NFQ1RJT05fTUlTTUFUQ0ggaXMgbm90IHNl
dApDT05GSUdfU0VDVElPTl9NSVNNQVRDSF9XQVJOX09OTFk9eQojIENPTkZJR19ERUJVR19G
T1JDRV9XRUFLX1BFUl9DUFUgaXMgbm90IHNldAojIGVuZCBvZiBDb21waWxlLXRpbWUgY2hl
Y2tzIGFuZCBjb21waWxlciBvcHRpb25zCgpDT05GSUdfTUFHSUNfU1lTUlE9eQpDT05GSUdf
TUFHSUNfU1lTUlFfREVGQVVMVF9FTkFCTEU9MHgxCkNPTkZJR19NQUdJQ19TWVNSUV9TRVJJ
QUw9eQpDT05GSUdfREVCVUdfS0VSTkVMPXkKQ09ORklHX0RFQlVHX01JU0M9eQoKIwojIE1l
bW9yeSBEZWJ1Z2dpbmcKIwojIENPTkZJR19QQUdFX0VYVEVOU0lPTiBpcyBub3Qgc2V0CkNP
TkZJR19ERUJVR19QQUdFQUxMT0M9eQojIENPTkZJR19ERUJVR19QQUdFQUxMT0NfRU5BQkxF
X0RFRkFVTFQgaXMgbm90IHNldAojIENPTkZJR19QQUdFX09XTkVSIGlzIG5vdCBzZXQKQ09O
RklHX1BBR0VfUE9JU09OSU5HPXkKIyBDT05GSUdfUEFHRV9QT0lTT05JTkdfTk9fU0FOSVRZ
IGlzIG5vdCBzZXQKIyBDT05GSUdfUEFHRV9QT0lTT05JTkdfWkVSTyBpcyBub3Qgc2V0CiMg
Q09ORklHX0RFQlVHX1BBR0VfUkVGIGlzIG5vdCBzZXQKIyBDT05GSUdfREVCVUdfUk9EQVRB
X1RFU1QgaXMgbm90IHNldAojIENPTkZJR19ERUJVR19PQkpFQ1RTIGlzIG5vdCBzZXQKQ09O
RklHX0RFQlVHX1NMQUI9eQpDT05GSUdfSEFWRV9ERUJVR19LTUVNTEVBSz15CiMgQ09ORklH
X0RFQlVHX0tNRU1MRUFLIGlzIG5vdCBzZXQKIyBDT05GSUdfREVCVUdfU1RBQ0tfVVNBR0Ug
aXMgbm90IHNldAojIENPTkZJR19ERUJVR19WTSBpcyBub3Qgc2V0CkNPTkZJR19BUkNIX0hB
U19ERUJVR19WSVJUVUFMPXkKIyBDT05GSUdfREVCVUdfVklSVFVBTCBpcyBub3Qgc2V0CiMg
Q09ORklHX0RFQlVHX01FTU9SWV9JTklUIGlzIG5vdCBzZXQKIyBDT05GSUdfREVCVUdfUEVS
X0NQVV9NQVBTIGlzIG5vdCBzZXQKIyBDT05GSUdfREVCVUdfSElHSE1FTSBpcyBub3Qgc2V0
CkNPTkZJR19DQ19IQVNfS0FTQU5fR0VORVJJQz15CkNPTkZJR19LQVNBTl9TVEFDSz0xCiMg
ZW5kIG9mIE1lbW9yeSBEZWJ1Z2dpbmcKCkNPTkZJR19BUkNIX0hBU19LQ09WPXkKQ09ORklH
X0NDX0hBU19TQU5DT1ZfVFJBQ0VfUEM9eQojIENPTkZJR19LQ09WIGlzIG5vdCBzZXQKQ09O
RklHX0RFQlVHX1NISVJRPXkKCiMKIyBEZWJ1ZyBMb2NrdXBzIGFuZCBIYW5ncwojCiMgQ09O
RklHX1NPRlRMT0NLVVBfREVURUNUT1IgaXMgbm90IHNldApDT05GSUdfREVURUNUX0hVTkdf
VEFTSz15CkNPTkZJR19ERUZBVUxUX0hVTkdfVEFTS19USU1FT1VUPTEyMAojIENPTkZJR19C
T09UUEFSQU1fSFVOR19UQVNLX1BBTklDIGlzIG5vdCBzZXQKQ09ORklHX0JPT1RQQVJBTV9I
VU5HX1RBU0tfUEFOSUNfVkFMVUU9MAojIENPTkZJR19XUV9XQVRDSERPRyBpcyBub3Qgc2V0
CiMgZW5kIG9mIERlYnVnIExvY2t1cHMgYW5kIEhhbmdzCgojIENPTkZJR19QQU5JQ19PTl9P
T1BTIGlzIG5vdCBzZXQKQ09ORklHX1BBTklDX09OX09PUFNfVkFMVUU9MApDT05GSUdfUEFO
SUNfVElNRU9VVD0wCkNPTkZJR19TQ0hFRF9ERUJVRz15CkNPTkZJR19TQ0hFRF9JTkZPPXkK
Q09ORklHX1NDSEVEU1RBVFM9eQpDT05GSUdfU0NIRURfU1RBQ0tfRU5EX0NIRUNLPXkKIyBD
T05GSUdfREVCVUdfVElNRUtFRVBJTkcgaXMgbm90IHNldApDT05GSUdfREVCVUdfUFJFRU1Q
VD15CgojCiMgTG9jayBEZWJ1Z2dpbmcgKHNwaW5sb2NrcywgbXV0ZXhlcywgZXRjLi4uKQoj
CkNPTkZJR19MT0NLX0RFQlVHR0lOR19TVVBQT1JUPXkKIyBDT05GSUdfUFJPVkVfTE9DS0lO
RyBpcyBub3Qgc2V0CiMgQ09ORklHX0xPQ0tfU1RBVCBpcyBub3Qgc2V0CiMgQ09ORklHX0RF
QlVHX1JUX01VVEVYRVMgaXMgbm90IHNldAojIENPTkZJR19ERUJVR19TUElOTE9DSyBpcyBu
b3Qgc2V0CiMgQ09ORklHX0RFQlVHX01VVEVYRVMgaXMgbm90IHNldAojIENPTkZJR19ERUJV
R19XV19NVVRFWF9TTE9XUEFUSCBpcyBub3Qgc2V0CiMgQ09ORklHX0RFQlVHX1JXU0VNUyBp
cyBub3Qgc2V0CiMgQ09ORklHX0RFQlVHX0xPQ0tfQUxMT0MgaXMgbm90IHNldApDT05GSUdf
REVCVUdfQVRPTUlDX1NMRUVQPXkKIyBDT05GSUdfREVCVUdfTE9DS0lOR19BUElfU0VMRlRF
U1RTIGlzIG5vdCBzZXQKIyBDT05GSUdfTE9DS19UT1JUVVJFX1RFU1QgaXMgbm90IHNldAoj
IENPTkZJR19XV19NVVRFWF9TRUxGVEVTVCBpcyBub3Qgc2V0CiMgZW5kIG9mIExvY2sgRGVi
dWdnaW5nIChzcGlubG9ja3MsIG11dGV4ZXMsIGV0Yy4uLikKCkNPTkZJR19TVEFDS1RSQUNF
PXkKIyBDT05GSUdfV0FSTl9BTExfVU5TRUVERURfUkFORE9NIGlzIG5vdCBzZXQKIyBDT05G
SUdfREVCVUdfS09CSkVDVCBpcyBub3Qgc2V0CkNPTkZJR19ERUJVR19CVUdWRVJCT1NFPXkK
Q09ORklHX0RFQlVHX0xJU1Q9eQojIENPTkZJR19ERUJVR19QTElTVCBpcyBub3Qgc2V0CkNP
TkZJR19ERUJVR19TRz15CkNPTkZJR19ERUJVR19OT1RJRklFUlM9eQojIENPTkZJR19ERUJV
R19DUkVERU5USUFMUyBpcyBub3Qgc2V0CgojCiMgUkNVIERlYnVnZ2luZwojCiMgQ09ORklH
X1JDVV9QRVJGX1RFU1QgaXMgbm90IHNldAojIENPTkZJR19SQ1VfVE9SVFVSRV9URVNUIGlz
IG5vdCBzZXQKQ09ORklHX1JDVV9DUFVfU1RBTExfVElNRU9VVD0yMQojIENPTkZJR19SQ1Vf
VFJBQ0UgaXMgbm90IHNldAojIENPTkZJR19SQ1VfRVFTX0RFQlVHIGlzIG5vdCBzZXQKIyBl
bmQgb2YgUkNVIERlYnVnZ2luZwoKIyBDT05GSUdfREVCVUdfV1FfRk9SQ0VfUlJfQ1BVIGlz
IG5vdCBzZXQKIyBDT05GSUdfREVCVUdfQkxPQ0tfRVhUX0RFVlQgaXMgbm90IHNldAojIENP
TkZJR19DUFVfSE9UUExVR19TVEFURV9DT05UUk9MIGlzIG5vdCBzZXQKIyBDT05GSUdfTk9U
SUZJRVJfRVJST1JfSU5KRUNUSU9OIGlzIG5vdCBzZXQKIyBDT05GSUdfRkFVTFRfSU5KRUNU
SU9OIGlzIG5vdCBzZXQKIyBDT05GSUdfTEFURU5DWVRPUCBpcyBub3Qgc2V0CkNPTkZJR19O
T1BfVFJBQ0VSPXkKQ09ORklHX0hBVkVfRlVOQ1RJT05fVFJBQ0VSPXkKQ09ORklHX0hBVkVf
RlVOQ1RJT05fR1JBUEhfVFJBQ0VSPXkKQ09ORklHX0hBVkVfRFlOQU1JQ19GVFJBQ0U9eQpD
T05GSUdfSEFWRV9EWU5BTUlDX0ZUUkFDRV9XSVRIX1JFR1M9eQpDT05GSUdfSEFWRV9GVFJB
Q0VfTUNPVU5UX1JFQ09SRD15CkNPTkZJR19IQVZFX1NZU0NBTExfVFJBQ0VQT0lOVFM9eQpD
T05GSUdfSEFWRV9DX1JFQ09SRE1DT1VOVD15CkNPTkZJR19UUkFDRV9DTE9DSz15CkNPTkZJ
R19SSU5HX0JVRkZFUj15CkNPTkZJR19FVkVOVF9UUkFDSU5HPXkKQ09ORklHX0NPTlRFWFRf
U1dJVENIX1RSQUNFUj15CkNPTkZJR19SSU5HX0JVRkZFUl9BTExPV19TV0FQPXkKQ09ORklH
X1RSQUNJTkc9eQpDT05GSUdfVFJBQ0lOR19TVVBQT1JUPXkKQ09ORklHX0ZUUkFDRT15CiMg
Q09ORklHX0ZVTkNUSU9OX1RSQUNFUiBpcyBub3Qgc2V0CiMgQ09ORklHX1BSRUVNUFRJUlFf
RVZFTlRTIGlzIG5vdCBzZXQKIyBDT05GSUdfSVJRU09GRl9UUkFDRVIgaXMgbm90IHNldAoj
IENPTkZJR19QUkVFTVBUX1RSQUNFUiBpcyBub3Qgc2V0CiMgQ09ORklHX1NDSEVEX1RSQUNF
UiBpcyBub3Qgc2V0CiMgQ09ORklHX0hXTEFUX1RSQUNFUiBpcyBub3Qgc2V0CiMgQ09ORklH
X0VOQUJMRV9ERUZBVUxUX1RSQUNFUlMgaXMgbm90IHNldAojIENPTkZJR19GVFJBQ0VfU1lT
Q0FMTFMgaXMgbm90IHNldAojIENPTkZJR19UUkFDRVJfU05BUFNIT1QgaXMgbm90IHNldApD
T05GSUdfQlJBTkNIX1BST0ZJTEVfTk9ORT15CiMgQ09ORklHX1BST0ZJTEVfQU5OT1RBVEVE
X0JSQU5DSEVTIGlzIG5vdCBzZXQKIyBDT05GSUdfUFJPRklMRV9BTExfQlJBTkNIRVMgaXMg
bm90IHNldAojIENPTkZJR19TVEFDS19UUkFDRVIgaXMgbm90IHNldAojIENPTkZJR19CTEtf
REVWX0lPX1RSQUNFIGlzIG5vdCBzZXQKQ09ORklHX0tQUk9CRV9FVkVOVFM9eQpDT05GSUdf
VVBST0JFX0VWRU5UUz15CkNPTkZJR19EWU5BTUlDX0VWRU5UUz15CkNPTkZJR19QUk9CRV9F
VkVOVFM9eQojIENPTkZJR19UUkFDRVBPSU5UX0JFTkNITUFSSyBpcyBub3Qgc2V0CiMgQ09O
RklHX1JJTkdfQlVGRkVSX0JFTkNITUFSSyBpcyBub3Qgc2V0CiMgQ09ORklHX1JJTkdfQlVG
RkVSX1NUQVJUVVBfVEVTVCBpcyBub3Qgc2V0CiMgQ09ORklHX1BSRUVNUFRJUlFfREVMQVlf
VEVTVCBpcyBub3Qgc2V0CiMgQ09ORklHX1RSQUNFX0VWQUxfTUFQX0ZJTEUgaXMgbm90IHNl
dApDT05GSUdfUlVOVElNRV9URVNUSU5HX01FTlU9eQojIENPTkZJR19MS0RUTSBpcyBub3Qg
c2V0CiMgQ09ORklHX1RFU1RfTElTVF9TT1JUIGlzIG5vdCBzZXQKIyBDT05GSUdfVEVTVF9T
T1JUIGlzIG5vdCBzZXQKIyBDT05GSUdfS1BST0JFU19TQU5JVFlfVEVTVCBpcyBub3Qgc2V0
CiMgQ09ORklHX0JBQ0tUUkFDRV9TRUxGX1RFU1QgaXMgbm90IHNldAojIENPTkZJR19SQlRS
RUVfVEVTVCBpcyBub3Qgc2V0CiMgQ09ORklHX1JFRURfU09MT01PTl9URVNUIGlzIG5vdCBz
ZXQKIyBDT05GSUdfSU5URVJWQUxfVFJFRV9URVNUIGlzIG5vdCBzZXQKIyBDT05GSUdfUEVS
Q1BVX1RFU1QgaXMgbm90IHNldAojIENPTkZJR19BVE9NSUM2NF9TRUxGVEVTVCBpcyBub3Qg
c2V0CiMgQ09ORklHX1RFU1RfSEVYRFVNUCBpcyBub3Qgc2V0CiMgQ09ORklHX1RFU1RfU1RS
SU5HX0hFTFBFUlMgaXMgbm90IHNldAojIENPTkZJR19URVNUX1NUUlNDUFkgaXMgbm90IHNl
dAojIENPTkZJR19URVNUX0tTVFJUT1ggaXMgbm90IHNldAojIENPTkZJR19URVNUX1BSSU5U
RiBpcyBub3Qgc2V0CiMgQ09ORklHX1RFU1RfQklUTUFQIGlzIG5vdCBzZXQKIyBDT05GSUdf
VEVTVF9CSVRGSUVMRCBpcyBub3Qgc2V0CiMgQ09ORklHX1RFU1RfVVVJRCBpcyBub3Qgc2V0
CiMgQ09ORklHX1RFU1RfWEFSUkFZIGlzIG5vdCBzZXQKIyBDT05GSUdfVEVTVF9PVkVSRkxP
VyBpcyBub3Qgc2V0CiMgQ09ORklHX1RFU1RfUkhBU0hUQUJMRSBpcyBub3Qgc2V0CiMgQ09O
RklHX1RFU1RfSEFTSCBpcyBub3Qgc2V0CiMgQ09ORklHX1RFU1RfSURBIGlzIG5vdCBzZXQK
IyBDT05GSUdfVEVTVF9MS00gaXMgbm90IHNldAojIENPTkZJR19URVNUX1ZNQUxMT0MgaXMg
bm90IHNldAojIENPTkZJR19URVNUX1VTRVJfQ09QWSBpcyBub3Qgc2V0CiMgQ09ORklHX1RF
U1RfQlBGIGlzIG5vdCBzZXQKIyBDT05GSUdfVEVTVF9CTEFDS0hPTEVfREVWIGlzIG5vdCBz
ZXQKIyBDT05GSUdfRklORF9CSVRfQkVOQ0hNQVJLIGlzIG5vdCBzZXQKIyBDT05GSUdfVEVT
VF9GSVJNV0FSRSBpcyBub3Qgc2V0CiMgQ09ORklHX1RFU1RfU1lTQ1RMIGlzIG5vdCBzZXQK
IyBDT05GSUdfVEVTVF9VREVMQVkgaXMgbm90IHNldAojIENPTkZJR19URVNUX1NUQVRJQ19L
RVlTIGlzIG5vdCBzZXQKIyBDT05GSUdfVEVTVF9LTU9EIGlzIG5vdCBzZXQKIyBDT05GSUdf
VEVTVF9NRU1DQVRfUCBpcyBub3Qgc2V0CiMgQ09ORklHX1RFU1RfU1RBQ0tJTklUIGlzIG5v
dCBzZXQKIyBDT05GSUdfVEVTVF9NRU1JTklUIGlzIG5vdCBzZXQKIyBDT05GSUdfTUVNVEVT
VCBpcyBub3Qgc2V0CiMgQ09ORklHX0JVR19PTl9EQVRBX0NPUlJVUFRJT04gaXMgbm90IHNl
dAojIENPTkZJR19TQU1QTEVTIGlzIG5vdCBzZXQKQ09ORklHX0hBVkVfQVJDSF9LR0RCPXkK
IyBDT05GSUdfS0dEQiBpcyBub3Qgc2V0CiMgQ09ORklHX1VCU0FOIGlzIG5vdCBzZXQKQ09O
RklHX1VCU0FOX0FMSUdOTUVOVD15CkNPTkZJR19BUkNIX0hBU19ERVZNRU1fSVNfQUxMT1dF
RD15CiMgQ09ORklHX1NUUklDVF9ERVZNRU0gaXMgbm90IHNldAojIENPTkZJR19BUk1fUFRE
VU1QX0RFQlVHRlMgaXMgbm90IHNldAojIENPTkZJR19ERUJVR19XWCBpcyBub3Qgc2V0CiMg
Q09ORklHX1VOV0lOREVSX0ZSQU1FX1BPSU5URVIgaXMgbm90IHNldApDT05GSUdfVU5XSU5E
RVJfQVJNPXkKQ09ORklHX0FSTV9VTldJTkQ9eQojIENPTkZJR19ERUJVR19VU0VSIGlzIG5v
dCBzZXQKIyBDT05GSUdfREVCVUdfTEwgaXMgbm90IHNldApDT05GSUdfREVCVUdfTExfSU5D
TFVERT0ibWFjaC9kZWJ1Zy1tYWNyby5TIgpDT05GSUdfVU5DT01QUkVTU19JTkNMVURFPSJk
ZWJ1Zy91bmNvbXByZXNzLmgiCiMgQ09ORklHX0FSTV9LUFJPQkVTX1RFU1QgaXMgbm90IHNl
dAojIENPTkZJR19QSURfSU5fQ09OVEVYVElEUiBpcyBub3Qgc2V0CiMgQ09ORklHX0NPUkVT
SUdIVCBpcyBub3Qgc2V0CiMgZW5kIG9mIEtlcm5lbCBoYWNraW5nCg==
--------------E535A013B30481111D3FF646
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--------------E535A013B30481111D3FF646--
