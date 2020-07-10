Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5227621B98F
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jul 2020 17:30:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACBB56EC7C;
	Fri, 10 Jul 2020 15:30:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3FE86EC7B
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 15:30:26 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200710153025euoutp014ec574b86dffcd74d8d43d5f61a866f9~gbdQAwiIW2103621036euoutp01E
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 15:30:25 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200710153025euoutp014ec574b86dffcd74d8d43d5f61a866f9~gbdQAwiIW2103621036euoutp01E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1594395025;
 bh=Wcn/fZwn0l0I3UrXznsXGlfRgX1zzz/eHT6cU1JUJ98=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VMEyJ71l0IEYsZA0NxrXLD0ICjP3hL9vF2pDnbG6WNINUPdpXCPinqupaSZ8qR8E0
 XqEvx/o8MIVkplmeBQziEjl+NK7+qDCoZ3cJ8mj81jNjdQBD8QN1zLfM7SYsmI/XoS
 B3TQuFT7e40539DeYKQalj4Ll7y3Gd9muFoT/iUQ=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200710153025eucas1p13e63215101d621cbea138284f5fd975d~gbdPq8YN61776917769eucas1p1_;
 Fri, 10 Jul 2020 15:30:25 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 3A.64.06456.099880F5; Fri, 10
 Jul 2020 16:30:24 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200710153024eucas1p1b0686b4acce78838db93fddb3c23939c~gbdPWHrrM1062710627eucas1p1U;
 Fri, 10 Jul 2020 15:30:24 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200710153024eusmtrp19f63c0e550598b61622ddee35ca63586~gbdPVbMc-2337923379eusmtrp1N;
 Fri, 10 Jul 2020 15:30:24 +0000 (GMT)
X-AuditID: cbfec7f2-809ff70000001938-df-5f08899026a7
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 8D.38.06017.099880F5; Fri, 10
 Jul 2020 16:30:24 +0100 (BST)
Received: from AMDC3748.digital.local (unknown [106.120.51.74]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200710153023eusmtip12bae6a169a109343e875058f8b68f1aa~gbdOkmTaP0658106581eusmtip1h;
 Fri, 10 Jul 2020 15:30:23 +0000 (GMT)
From: Andrzej Hajda <a.hajda@samsung.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v8 2/5] driver core: add deferring probe reason to
 devices_deferred property
Date: Fri, 10 Jul 2020 17:30:15 +0200
Message-Id: <20200710153018.12226-3-a.hajda@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200710153018.12226-1-a.hajda@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0WSa0hTYRjHeXfOzjlKJ46z8iHDchSUkCb14Y0ssgucTxWFEEbqUQ8mOa1N
 rYToZs55SyuZlwTLaeVtOXNYMLJlXtNSm81uUhq1bpamplS2eRZ9+73P/3me/5+HlyEUj+RL
 mfjEZFGdKCQoKU/S3DbTu7ZAx0Suq2Lw8/peOXbkP0C4ocgox4VvRik8Zy4g8NPJMQqfqzBS
 2DbtIHDnZxuJdQUGGptGBuV44O4VClsLLQjXtb6isTXvAC77UUhs5fiBwT6CH7Ofp3nLVDnJ
 3yl5RfOlmcVy3lSto/iO/H4Zf6+sluaHs9tlfKPhFJ93uxrxLbmXSH7C5LeHDfcMiRUT4lNF
 ddCWKM9DdbNa4kjryuOWHhs6jdr8spAHA9wGqNanoyzkySi4GwhGPpTJXYKC+4HgZl6AJEwg
 KKq3kf8mbKPZpCRcR/BmpF8mPZwTv/SdyNVFcWvgd+MQ5eJF3Hq40FNCu5oIbpYEmzZj3sOb
 i4AG+xDhYpJbBYNNhnkLlsMwWKWXS3bLoeZWy3yPB7cRvhZmU1L9Cw3aZi+Jd8DjmRZaYm/4
 2H7bzcug+1KOO/YpGL6RTrhCAJeJoOnWHUISNsHL3lnnUsaZbg0Y7wa5ELhQODu2XcKFYP8y
 70Q48aJZT0hlFjIzFNIOfxjuaXLv84HKJ5PukDw4+mbc181B0FWkpfPR8pL/XuUIVSMfMUWj
 ihM1wYnisUCNoNKkJMYFxiSpTMj5x7r/tI83o8n+aCviGKRcwJYLTKRCLqRqTqisCBhCuYjd
 1tMdoWBjhRNpojopUp2SIGqsyJchlT7s+muOgwouTkgWD4viEVH9T5UxHktPo7SEsNH7J+8X
 68OPdpZ2raoVlvysbDSefehF8CtStvqV8h0XDRBi+Rb1bO/3Xe/Jd/vO9L3toM7Hvvf2D9zd
 FhRu1wZr2/bP5Y7XqsJ+musr9Kzva9tszcerMUMZdaEhq1unzM3RFdt0nZfTRj7FVUXiFztD
 dWmbF+fHT38319jHlaTmkBAcQKg1wl9wW5n0XwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrAIsWRmVeSWpSXmKPExsVy+t/xu7oTOjniDTY/ULG4te4cq8XLCYcZ
 LTbOWM9qMfXhEzaL/9smMltc+fqezaJ58Xo2i6vfXzJbnHxzlcWic+ISdotNj6+xWlzeNYfN
 4tDUvYwWa4/cZbc41BdtMffLVGYHAY/L1y4ye7y/0crusffbAhaPnbPusnvM7pjJ6rFpVSeb
 x4kJl5g89s9dw+5xv/s4k8fmJfUefVtWMXoc6J3M4vF5k1wAb5SeTVF+aUmqQkZ+cYmtUrSh
 hZGeoaWFnpGJpZ6hsXmslZGpkr6dTUpqTmZZapG+XYJextpf7cwFR1Qq9p69ytjAeEyui5GT
 Q0LAROLqk24WEFtIYCmjxO2Z+hBxcYnd898yQ9jCEn+udbF1MXIB1XxilNj59RNYA5uApsTf
 zTfZQGwRAWOJ/rOz2EGKmAXaWCXmnn/CDpIQFoiR+HvjHSOIzSKgKnFt6xKwZl4BC4lry6az
 QmyQl1i94QDYNk4BS4l3U7vZIC6ykLi97DvrBEa+BYwMqxhFUkuLc9Nzi430ihNzi0vz0vWS
 83M3MQJja9uxn1t2MHa9Cz7EKMDBqMTDuyCRI16INbGsuDL3EKMEB7OSCK/T2dNxQrwpiZVV
 qUX58UWlOanFhxhNgY6ayCwlmpwPjPu8knhDU0NzC0tDc2NzYzMLJXHeDoGDMUIC6Yklqdmp
 qQWpRTB9TBycUg2M3sKNZ+MW/vgaaXrujYbR7gebrRTfblkQddLM//WLZMfoW6GZ++2bDp+6
 kaJW+HFKDCtXc2zl1wtfz65/vGra0gXyz67PO27D+iT/LqvT/Rr7a3VpV/LdH9j+Z2/UOb3o
 s82vb3dOtolV7lWIu+x11m9fkl4eS25m2ckrV8+vmJ4ktJx9g80OWyWW4oxEQy3mouJEANLo
 JYXDAgAA
X-CMS-MailID: 20200710153024eucas1p1b0686b4acce78838db93fddb3c23939c
X-Msg-Generator: CA
X-RootMTR: 20200710153024eucas1p1b0686b4acce78838db93fddb3c23939c
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200710153024eucas1p1b0686b4acce78838db93fddb3c23939c
References: <20200710153018.12226-1-a.hajda@samsung.com>
 <CGME20200710153024eucas1p1b0686b4acce78838db93fddb3c23939c@eucas1p1.samsung.com>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 linux-kernel@vger.kernel.org,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Neil Armstrong <narmstrong@baylibre.com>, Andrzej Hajda <a.hajda@samsung.com>,
 andy.shevchenko@gmail.com, Mark Brown <broonie@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

/sys/kernel/debug/devices_deferred property contains list of deferred devices.
This list does not contain reason why the driver deferred probe, the patch
improves it.
The natural place to set the reason is dev_err_probe function introduced
recently, ie. if dev_err_probe will be called with -EPROBE_DEFER instead of
printk the message will be attached to a deferred device and printed when user
reads devices_deferred property.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
Reviewed-by: Mark Brown <broonie@kernel.org>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Reviewed-by: Rafael J. Wysocki <rafael@kernel.org>
---
v8:
- improved commit message
---
 drivers/base/base.h |  3 +++
 drivers/base/core.c |  8 ++++++--
 drivers/base/dd.c   | 23 ++++++++++++++++++++++-
 3 files changed, 31 insertions(+), 3 deletions(-)

diff --git a/drivers/base/base.h b/drivers/base/base.h
index 95c22c0f9036..6954fccab3d7 100644
--- a/drivers/base/base.h
+++ b/drivers/base/base.h
@@ -93,6 +93,7 @@ struct device_private {
 	struct klist_node knode_class;
 	struct list_head deferred_probe;
 	struct device_driver *async_driver;
+	char *deferred_probe_reason;
 	struct device *device;
 	u8 dead:1;
 };
@@ -134,6 +135,8 @@ extern void device_release_driver_internal(struct device *dev,
 extern void driver_detach(struct device_driver *drv);
 extern int driver_probe_device(struct device_driver *drv, struct device *dev);
 extern void driver_deferred_probe_del(struct device *dev);
+extern void device_set_deferred_probe_reson(const struct device *dev,
+					    struct va_format *vaf);
 static inline int driver_match_device(struct device_driver *drv,
 				      struct device *dev)
 {
diff --git a/drivers/base/core.c b/drivers/base/core.c
index 3a827c82933f..fee047f03681 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -3963,6 +3963,8 @@ define_dev_printk_level(_dev_info, KERN_INFO);
  * This helper implements common pattern present in probe functions for error
  * checking: print debug or error message depending if the error value is
  * -EPROBE_DEFER and propagate error upwards.
+ * In case of -EPROBE_DEFER it sets also defer probe reason, which can be
+ * checked later by reading devices_deferred debugfs attribute.
  * It replaces code sequence:
  * 	if (err != -EPROBE_DEFER)
  * 		dev_err(dev, ...);
@@ -3984,10 +3986,12 @@ int dev_err_probe(const struct device *dev, int err, const char *fmt, ...)
 	vaf.fmt = fmt;
 	vaf.va = &args;
 
-	if (err != -EPROBE_DEFER)
+	if (err != -EPROBE_DEFER) {
 		dev_err(dev, "error %d: %pV", err, &vaf);
-	else
+	} else {
+		device_set_deferred_probe_reson(dev, &vaf);
 		dev_dbg(dev, "error %d: %pV", err, &vaf);
+	}
 
 	va_end(args);
 
diff --git a/drivers/base/dd.c b/drivers/base/dd.c
index 9a1d940342ac..dd5683b61f74 100644
--- a/drivers/base/dd.c
+++ b/drivers/base/dd.c
@@ -27,6 +27,7 @@
 #include <linux/async.h>
 #include <linux/pm_runtime.h>
 #include <linux/pinctrl/devinfo.h>
+#include <linux/slab.h>
 
 #include "base.h"
 #include "power/power.h"
@@ -136,6 +137,8 @@ void driver_deferred_probe_del(struct device *dev)
 	if (!list_empty(&dev->p->deferred_probe)) {
 		dev_dbg(dev, "Removed from deferred list\n");
 		list_del_init(&dev->p->deferred_probe);
+		kfree(dev->p->deferred_probe_reason);
+		dev->p->deferred_probe_reason = NULL;
 	}
 	mutex_unlock(&deferred_probe_mutex);
 }
@@ -211,6 +214,23 @@ void device_unblock_probing(void)
 	driver_deferred_probe_trigger();
 }
 
+/**
+ * device_set_deferred_probe_reson() - Set defer probe reason message for device
+ * @dev: the pointer to the struct device
+ * @vaf: the pointer to va_format structure with message
+ */
+void device_set_deferred_probe_reson(const struct device *dev, struct va_format *vaf)
+{
+	const char *drv = dev_driver_string(dev);
+
+	mutex_lock(&deferred_probe_mutex);
+
+	kfree(dev->p->deferred_probe_reason);
+	dev->p->deferred_probe_reason = kasprintf(GFP_KERNEL, "%s: %pV", drv, vaf);
+
+	mutex_unlock(&deferred_probe_mutex);
+}
+
 /*
  * deferred_devs_show() - Show the devices in the deferred probe pending list.
  */
@@ -221,7 +241,8 @@ static int deferred_devs_show(struct seq_file *s, void *data)
 	mutex_lock(&deferred_probe_mutex);
 
 	list_for_each_entry(curr, &deferred_probe_pending_list, deferred_probe)
-		seq_printf(s, "%s\n", dev_name(curr->device));
+		seq_printf(s, "%s\t%s", dev_name(curr->device),
+			   curr->device->p->deferred_probe_reason ?: "\n");
 
 	mutex_unlock(&deferred_probe_mutex);
 
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
