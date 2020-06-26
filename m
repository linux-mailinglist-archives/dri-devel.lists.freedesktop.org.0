Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD4A20AF59
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jun 2020 12:01:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D24F46EC5D;
	Fri, 26 Jun 2020 10:01:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 231246EC56
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jun 2020 10:01:12 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200626100110euoutp02c927da6d8e23293965dcadad592f2d5b~cD7yWQzAm2326023260euoutp02f
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jun 2020 10:01:10 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200626100110euoutp02c927da6d8e23293965dcadad592f2d5b~cD7yWQzAm2326023260euoutp02f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1593165670;
 bh=zzYpMezHcCPuAI9WGmae4c4hMI68Rcf9k4HVAnd3Gnw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OnXwuQl/2zZZcghh0En8N22tVuv4q0gKbHR17QkgjhsUL5+z19i7D2wgk9XaaudXt
 GUEfWEWvEIKdVhc9nX9EkTDTpMNSL2/vT2RPRBVFrYZPj8wkbuNV94UTohdiRzalqw
 e0N5WSup0uUpl3rewfZBJq9evpLCU449zLLYloU8=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200626100110eucas1p234cd1b600e94a718a94bef5fec6310f6~cD7x95GAB1856618566eucas1p25;
 Fri, 26 Jun 2020 10:01:10 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id AD.EC.06318.667C5FE5; Fri, 26
 Jun 2020 11:01:10 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200626100110eucas1p2c5b91f2c98a5c6e5739f5af3207d192e~cD7xp296r1867018670eucas1p24;
 Fri, 26 Jun 2020 10:01:10 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200626100110eusmtrp2c937eca2603216d9e16861f32096763f~cD7xpJucK1306813068eusmtrp2D;
 Fri, 26 Jun 2020 10:01:10 +0000 (GMT)
X-AuditID: cbfec7f5-371ff700000018ae-62-5ef5c766c33b
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id C3.86.06017.567C5FE5; Fri, 26
 Jun 2020 11:01:10 +0100 (BST)
Received: from AMDC3748.digital.local (unknown [106.120.51.74]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200626100109eusmtip190f09b3306fb2cc99e90aff84181ad15~cD7w4Nr0M2485024850eusmtip1F;
 Fri, 26 Jun 2020 10:01:09 +0000 (GMT)
From: Andrzej Hajda <a.hajda@samsung.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v6 2/4] driver core: add deferring probe reason to
 devices_deferred property
Date: Fri, 26 Jun 2020 12:01:01 +0200
Message-Id: <20200626100103.18879-3-a.hajda@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200626100103.18879-1-a.hajda@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0VSfUyMcRz3u+e553muOR7npu+6MGdsMmElPzLDSs8/zB9kWMfRo5q6y10v
 Slu3RbrSGxJHqxFa5OhtQqpD52WXihpX7bIyotaoY7Xz0uPJ/Pf5fj8v398++zGEwiH1YWJ0
 CbxBp41VU15kfevEqxWH7W7NqmwrYOftNikeKniM8N0LVikuej9I4d/1hQR+4x6lcMZVK4W7
 fgwR+PlwF4nNheU0rh7oluLX9y9T2FbUiHDVkz4a2/L24ZLxImITy73u7iC40bcnaa7xexnJ
 NVj6aO5S1kUpV11pprhnBZ0SrqnkFs25cuwSrqY8ncurrURcc+5ZkhurXrBDvtdrQyQfG5PE
 G1ZuPOAVnd3dQ8b3Lz72JdeJTOjb/GwkY4ANhMr+U2Q28mIUbAWCKxMZEnEYR+Dq6Z0exhBc
 eNhC/bOc85QjkbiBwNI5+d/ScfsDLagodhn8rHn316FkAyDfYaEFEcFOktB1KlMqEHNZDXQU
 X51yMwzJLoGGx37CWs5iGHBWIfHaQrh5p5kQsIxdB8XOXKmQA+wIDa6iB3+9wIaA2RIu6ufC
 Z3stLWJf+N1QKhFxOrgqThCiNwtB3Z0GQiSCobdtkhJyiKlHW++vFCM3w7WBIBHOgrcjcwQx
 MQXP1BcT4loOWZkKMWMRuBx103necK3dPV0VB2eyhBKEdk4jGBj+igrQQsv/W2UIVSJvPtEY
 F8UbA3R8sr9RG2dM1EX5H9LHVaOpT/byl919Dz3yHLQhlkHqmfLmwnGNQqpNMqbE2RAwhFop
 3+J4qVHII7UpqbxBv9+QGMsbbUjFkGpvecCVoQgFG6VN4I/wfDxv+MdKGJmPCcmG604/cETl
 fLTPnnA2kYN7XoREDM7LDzNfClK684NCN7Wb14e16qmEArVq67C+NDDoU//OtJalyZHbU2Wu
 Nv38zWXbYHlaaPNqree6b+nRNRC2S3nZ7/hTPqRtRvjYbs9gTvxB5azwEkWSb4fphEsXnK4c
 Mp2PMKl2RRsMqrVq0hitXe1HGIzaP6XapvFgAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPIsWRmVeSWpSXmKPExsVy+t/xu7ppx7/GGexoYbS4te4cq8XLCYcZ
 LTbOWM9qMfXhEzaL/9smMltc+fqezaJ58Xo2i6vfXzJbnHxzlcWic+ISdotNj6+xWlzeNYfN
 4tDUvYwWa4/cZbc41BdtMffLVGYHAY/L1y4ye7y/0crusffbAhaPnbPusnvM7pjJ6rFpVSeb
 x4kJl5g89s9dw+5xv/s4k8fmJfUefVtWMXoc6J3M4vF5k1wAb5SeTVF+aUmqQkZ+cYmtUrSh
 hZGeoaWFnpGJpZ6hsXmslZGpkr6dTUpqTmZZapG+XYJeRte12ywFD5QrXvfeYmxg/CTbxcjJ
 ISFgIjHlzxLGLkYuDiGBpYwS3TubWSES4hK7579lhrCFJf5c62KDKPrEKPG2uwusiE1AU+Lv
 5ptsILaIgLFE/9lZ7CBFzAJtrBJzzz9hB0kIC8RIvDvcA7SCg4NFQFVi52EtkDCvgIXE41tr
 GSEWyEus3nAAbBmngKXE9Fu9rCDlQkA1nUsiJzDyLWBkWMUoklpanJueW2ykV5yYW1yal66X
 nJ+7iREYWduO/dyyg7HrXfAhRgEORiUe3gMTv8QJsSaWFVfmHmKU4GBWEuF1Ons6Tog3JbGy
 KrUoP76oNCe1+BCjKdBJE5mlRJPzgVGfVxJvaGpobmFpaG5sbmxmoSTO2yFwMEZIID2xJDU7
 NbUgtQimj4mDU6qBMeHQMhOjk2ES0hdvvFN64ZYnM1dN1feqWeyG3UXeImvdlI+4FJov107V
 fXiLy3jytpqfm/zeGLxOVfgZ9W5Z8IIfize9O23U+ueYknePfeZShlVLf3gt+yHGLf4uxDEx
 w3H/xJA7nx+tvLTgH2tEkOi1rze3CclFq7ikROZ+LVmQ+jJO58M3eSWW4oxEQy3mouJEABQO
 xHbCAgAA
X-CMS-MailID: 20200626100110eucas1p2c5b91f2c98a5c6e5739f5af3207d192e
X-Msg-Generator: CA
X-RootMTR: 20200626100110eucas1p2c5b91f2c98a5c6e5739f5af3207d192e
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200626100110eucas1p2c5b91f2c98a5c6e5739f5af3207d192e
References: <20200626100103.18879-1-a.hajda@samsung.com>
 <CGME20200626100110eucas1p2c5b91f2c98a5c6e5739f5af3207d192e@eucas1p2.samsung.com>
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
The natural place to set the reason is probe_err function introduced recently,
ie. if probe_err will be called with -EPROBE_DEFER instead of printk the message
will be attached to deferred device and printed when user read devices_deferred
property.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
Reviewed-by: Mark Brown <broonie@kernel.org>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
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
