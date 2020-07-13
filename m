Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C40E221D8D1
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jul 2020 16:43:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3923C6E113;
	Mon, 13 Jul 2020 14:43:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE50E89F6F
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jul 2020 14:43:34 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200713144333euoutp02948c95bc70096d81d56a72de00a2d62e~hVwL41Q5n2796527965euoutp02G
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jul 2020 14:43:33 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200713144333euoutp02948c95bc70096d81d56a72de00a2d62e~hVwL41Q5n2796527965euoutp02G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1594651413;
 bh=xtHQpB9I0fMd3M6jsSOBpjS4km8smy714jJr/xf+IDE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=azR3ja2JhbMKcIeI23lbrvXFnnVp9reuUL5JKu99KAJ50xg6Y/CXmtWmTrEba5031
 zO3t6Vz18PaDhKxc6WcS5sclMLzzm8tEDtszEp8Uk4BJc+I5P1gvqoYM76qlKjK7Dq
 8VCf4kb6ZUsbBuRccVJ4ZvgbqQvvJI/AV/JtEfo4=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200713144333eucas1p174bdf6fb0d37fdec8b925be44ebda76d~hVwLlCfAH2096020960eucas1p1P;
 Mon, 13 Jul 2020 14:43:33 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id D1.69.06318.4137C0F5; Mon, 13
 Jul 2020 15:43:32 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200713144332eucas1p2f46275f84ec0cca6e23dcf040234005a~hVwLBtN7V0910709107eucas1p2x;
 Mon, 13 Jul 2020 14:43:32 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200713144332eusmtrp11b7548bb0ed5d6efe0c0fc6a63e01bc2~hVwLA-gIU0993509935eusmtrp1Y;
 Mon, 13 Jul 2020 14:43:32 +0000 (GMT)
X-AuditID: cbfec7f5-38bff700000018ae-f6-5f0c7314c13d
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id B3.5A.06017.4137C0F5; Mon, 13
 Jul 2020 15:43:32 +0100 (BST)
Received: from AMDC3748.digital.local (unknown [106.120.51.74]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200713144331eusmtip16ed42ebed53347d486148c2f4f09a0b6~hVwKSaHZG2060320603eusmtip1I;
 Mon, 13 Jul 2020 14:43:31 +0000 (GMT)
From: Andrzej Hajda <a.hajda@samsung.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v9 2/4] driver core: add deferring probe reason to
 devices_deferred property
Date: Mon, 13 Jul 2020 16:43:22 +0200
Message-Id: <20200713144324.23654-3-a.hajda@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200713144324.23654-1-a.hajda@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0VSaUhUURjlzlsVx16j4a1caigiKU0UumGrFbwfQRItULg886WSYzZP2yg0
 KhuXbEyktCQxLcclzWXaS6fMZHLJLRWnobJkxNFMLbPS5vWs/p17lu98fFwaUxiJBXRUTByv
 juGilaQ9rn/xvWWls+AQsipbuwb13m4mkEX7DKA7V8oJlPWun0Qz+gwMdUyMkOjMjXISdX6z
 YKhxqBNHyRkFFKr80EWg9gfXSGTIegxQ2XMThQzp+1DueBa2kWHbu15j7Ej3OYp9/DUPZ+/n
 mCj2qiabYCuLk0n2pbZNxj7NLaVYc2qDjK0qSGDTq4sBW3shE2fHKt0D5Xvt14bz0VFHeLX3
 +lD7yPEPw7JY65Jjby8mYongo3sKoGnI+MGUUpAC7GkFUwTgYEk2ngLsbI9xAG/WbZCEMQAr
 EtuAKIiBwYFeUhJu2YS6YvJfIjXDU8Qksxz+qur5wzszvvBiUw4lBjBmCoed55MIsdqJCYbW
 oa2iB2eWwsmZs5iI5QyCeRYzKZV5wJKKWky02zFr4PX0PeIYyFgoWNt6WyZ5tsDTLfpZ7AQH
 G6opCbtCY2YaLuEEaC4S54thDYA1FfcxSfCHfc1TpFiA2ZYuf+At0ZtgflEjJV3IEXZb54o0
 ZoOX9JcxiZZDTZJCci+G5qaa2YEusLB1YnZ7Fuqq6gnpVGkANv/oI7TAI+d/WR4AxcCFjxdU
 EbzgG8Mf9RI4lRAfE+G1/5CqEti+mHG6YeIeePIzzAAYGigd5HC7Q4iC4I4Ix1UGAGlM6SwP
 aDIGK+Th3PETvPpQiDo+mhcMYCGNK13kvvmWIAUTwcXxB3k+llf/VWW03YJE8LA7STX8aN5Q
 4IDG/f1Li9/n7MOfZB2M62rd5rFT+v5Rn23C0fyTl9V1OtP8TrPb3aUlDbvcyrS10aZC84Hp
 OV2TgaaZgPAv8aE7l7X568L6m1uuhHnB0tZFnF2y37t1cQfo9vr9ad92rwjihmN18jeZmwd7
 wotevxrd4fjCy1qyQokLkZyPJ6YWuN/RQPDBXgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPIsWRmVeSWpSXmKPExsVy+t/xu7oixTzxBlcuC1rcWneO1eLlhMOM
 FhtnrGe1mPrwCZvF/20TmS2ufH3PZtG8eD2bxdXvL5ktTr65ymLROXEJu8Wmx9dYLS7vmsNm
 cWjqXkaLtUfuslsc6ou2mPtlKrODgMflaxeZPd7faGX32PttAYvHzll32T1md8xk9di0qpPN
 48SES0we++euYfe4332cyWPzknqPvi2rGD0O9E5m8fi8SS6AN0rPpii/tCRVISO/uMRWKdrQ
 wkjP0NJCz8jEUs/Q2DzWyshUSd/OJiU1J7MstUjfLkEv48vjd0wFb1Uq7vU3MDcwPpXrYuTk
 kBAwkXj1/BZbFyMXh5DAUkaJNSt2MkIkxCV2z3/LDGELS/y51gVV9IlRYuLbKWAJNgFNib+b
 b7KB2CICxhL9Z2exgxQxC7SxSsw9/4QdJCEsECOx7fZcsAYWAVWJH/9bwGxeAQuJBS/vs0Fs
 kJdYveEAUJyDg1PAUmJ+XziIKQRUcuKt5wRGvgWMDKsYRVJLi3PTc4uN9IoTc4tL89L1kvNz
 NzECI2vbsZ9bdjB2vQs+xCjAwajEwyvhzxMvxJpYVlyZe4hRgoNZSYTX6ezpOCHelMTKqtSi
 /Pii0pzU4kOMpkAnTWSWEk3OB0Z9Xkm8oamhuYWlobmxubGZhZI4b4fAwRghgfTEktTs1NSC
 1CKYPiYOTqkGRjNXGR6Hv2ntR96GzJjH9SPM0DfVMXaXpptlzN2XskEhS/7kf7Kb0PLzWt73
 /Ki5ytpPnZjNi6c7q27Z5rDBU+33fYEO9/qbXNnitqtb0mR7y/efcWfZuTv6pP2TIzYpD6KO
 PeT6ZLn3yfmZgf/jFE5vX11adYpBeP38G0ar4htc901KPfL7vRJLcUaioRZzUXEiAMgL3KLC
 AgAA
X-CMS-MailID: 20200713144332eucas1p2f46275f84ec0cca6e23dcf040234005a
X-Msg-Generator: CA
X-RootMTR: 20200713144332eucas1p2f46275f84ec0cca6e23dcf040234005a
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200713144332eucas1p2f46275f84ec0cca6e23dcf040234005a
References: <20200713144324.23654-1-a.hajda@samsung.com>
 <CGME20200713144332eucas1p2f46275f84ec0cca6e23dcf040234005a@eucas1p2.samsung.com>
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
v9:
- fixed typo in function name
v8:
- improved commit message
---
 drivers/base/base.h |  3 +++
 drivers/base/core.c |  8 ++++++--
 drivers/base/dd.c   | 23 ++++++++++++++++++++++-
 3 files changed, 31 insertions(+), 3 deletions(-)

diff --git a/drivers/base/base.h b/drivers/base/base.h
index 95c22c0f9036..c3562adf4789 100644
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
+extern void device_set_deferred_probe_reason(const struct device *dev,
+					     struct va_format *vaf);
 static inline int driver_match_device(struct device_driver *drv,
 				      struct device *dev)
 {
diff --git a/drivers/base/core.c b/drivers/base/core.c
index 3a827c82933f..d04d19458795 100644
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
+		device_set_deferred_probe_reason(dev, &vaf);
 		dev_dbg(dev, "error %d: %pV", err, &vaf);
+	}
 
 	va_end(args);
 
diff --git a/drivers/base/dd.c b/drivers/base/dd.c
index 9a1d940342ac..7555b31bdfdc 100644
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
+ * device_set_deferred_probe_reason() - Set defer probe reason message for device
+ * @dev: the pointer to the struct device
+ * @vaf: the pointer to va_format structure with message
+ */
+void device_set_deferred_probe_reason(const struct device *dev, struct va_format *vaf)
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
