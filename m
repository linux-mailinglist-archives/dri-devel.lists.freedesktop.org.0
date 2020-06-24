Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF51F207250
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jun 2020 13:41:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A75336EB03;
	Wed, 24 Jun 2020 11:41:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55AA46EAD8
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jun 2020 11:41:38 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200624114137euoutp02614b6e5bf142fc0ac3c76641ac88000f~beA6J-Sam1634616346euoutp02H
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jun 2020 11:41:37 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200624114137euoutp02614b6e5bf142fc0ac3c76641ac88000f~beA6J-Sam1634616346euoutp02H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1592998897;
 bh=51rAgLVMknT7XcPL6Scm/eo5/G0AD6Pah8B2adU5o7Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hZDcbxGVRuUGEqdoFWFQ/sBsr6ulzwX9QYZeU1ns4X1uqT5ZJ75TGivDKyx/Z1QQ8
 L715YwS0936PYWqCOz0kBRbYy9XlY3gHYeqFda02yEylRt3idzLCNTNkH65Kyu4cKQ
 lxPS7w8M/a3Ff/mwNqPjCWMglwsr/t6voRbxcqKs=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200624114136eucas1p2be2df4866a49144fe5b9525735acdcf8~beA5wOL4i0284402844eucas1p2c;
 Wed, 24 Jun 2020 11:41:36 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 42.1F.05997.0FB33FE5; Wed, 24
 Jun 2020 12:41:36 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200624114136eucas1p1a3a31d95d86754201c7965f26ccd5de0~beA5awlgt2496024960eucas1p1L;
 Wed, 24 Jun 2020 11:41:36 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200624114136eusmtrp1e49b026849a70843ee186c566f27c1c9~beA5Z7fih0702007020eusmtrp1I;
 Wed, 24 Jun 2020 11:41:36 +0000 (GMT)
X-AuditID: cbfec7f4-677ff7000000176d-05-5ef33bf015f5
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id E2.74.06314.0FB33FE5; Wed, 24
 Jun 2020 12:41:36 +0100 (BST)
Received: from AMDC3748.digital.local (unknown [106.120.51.74]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200624114135eusmtip25f90617942c98e56bb3b5c4801ad3554~beA4wr7t_2216922169eusmtip28;
 Wed, 24 Jun 2020 11:41:35 +0000 (GMT)
From: Andrzej Hajda <a.hajda@samsung.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [RESEND PATCH v5 2/5] driver core: add deferring probe reason to
 devices_deferred property
Date: Wed, 24 Jun 2020 13:41:24 +0200
Message-Id: <20200624114127.3016-3-a.hajda@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200624114127.3016-1-a.hajda@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0VSa0hTYRju27m6XByn4YeK4gmLArMb9IHdsToERRD9MTJnHrzNKZtaiuEy
 zcu8i5SapU5LTZ3NaTnoNqNpQ83UsvJaYSwTCy9dqMx5tP4973P53oeXj8akPYQLHaaI4ZUK
 mZwlxXjr0x893l98ZwK2NCaz6E1jN4Gsee0A3bmqI1DR+AcSLbTmY6h/bppEl7Q6Eg18s2Ko
 8/MAjjLyqyikf/+SQH3GayQyFd0HqOHJMIVMOadQ2WwRto/h+l72Ytz0YCrF3Z8vx7m2kmGK
 K00vJjh9XQbJdeS9EHEPy+opblRjFnHNVUlcjqEOcI+yC3FuRu9+XOIv3hXMy8PieKXPnkBx
 aPG7bjx6lD1vqH1FqMGCWyawoyGzA3beTQaZQExLmRoAh1oshDDMAqj7chMXhhkA306oRSuR
 1PpSUhBuAfisc4r8F0nT6iibi2Q2wt/Nr0kbdmK2w9yuEspmwpifOBxIu0zYBEeGhxUXa5ZM
 OOMFtZrxpbCE2Qn7UycpYZ0HvN30CLNhOwbBgpReIPBWChos6wXsB0f0g8v1HOEns2E56wYt
 hVm4gJPgaE0KZisBmXQAW5raMEHwhUPdPxdL0IvtNkKd0Ueg98MR4+MlGjJr4OCUg43GFmFB
 6xVMoCUw/bJUcHvC0a6W5QedYfXzOVLAHBzWZFPCfTQAam9Pk3nAo+T/snIA6oAzH6uKDOFV
 2xT8uc0qWaQqVhGy+WxUpB4sfjPLH/PsPWD8FWQCDA1Ye0nT2NcAKSGLU8VHmgCkMdZJcqDL
 EiCVBMviE3hl1BllrJxXmYArjbPOku2V1tNSJkQWw0fwfDSvXFFFtJ2LGnj0zQdpc+YcblTY
 m6d2V4sLqqoGTtpPFB7xTH6QGJeV9VEfLndf5RjKTk6tjTg05nrBo/+tprWdUx8NV8itja9q
 /dySq3/trfYXpdj9GZlQUgsdgeqGAsI7JvcEveH7uvXXNyQefOhlLN1Tm2kOb8uqTxiuZNOO
 efeujjp874FhgsVVobKtmzClSvYXz7QMqWIDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPIsWRmVeSWpSXmKPExsVy+t/xe7ofrD/HGfy9w2Nxa905VouXEw4z
 WmycsZ7VYurDJ2wW/7dNZLa48vU9m0Xz4vVsFle/v2S2OPnmKotF58Ql7BabHl9jtbi8aw6b
 xaGpexkt1h65y25xqC/aYu6XqcwOAh6Xr11k9nh/o5XdY++3BSweO2fdZfeY3TGT1WPTqk42
 jxMTLjF57J+7ht3jfvdxJo/NS+o9+rasYvQ40DuZxePzJrkA3ig9m6L80pJUhYz84hJbpWhD
 CyM9Q0sLPSMTSz1DY/NYKyNTJX07m5TUnMyy1CJ9uwS9jJmPzrEU3Feq2LLyOmsD43+ZLkZO
 DgkBE4nWNbPZQGwhgaWMEndmhUDExSV2z3/LDGELS/y51gVV84lR4tomTxCbTUBT4u/mm2Bx
 EQFjif6zs9i7GLk4mAXaWCXmnn/CDpIQFkiWuHziBBOIzSKgKrG4+yFYnFfAXOJK62t2iAXy
 Eqs3HABbxilgITGp5SIjxDJziUPXF7NOYORbwMiwilEktbQ4Nz232FCvODG3uDQvXS85P3cT
 IzCyth37uXkH46WNwYcYBTgYlXh4Nzz4GCfEmlhWXJl7iFGCg1lJhNfp7Ok4Id6UxMqq1KL8
 +KLSnNTiQ4ymQEdNZJYSTc4HRn1eSbyhqaG5haWhubG5sZmFkjhvh8DBGCGB9MSS1OzU1ILU
 Ipg+Jg5OqQbGnhUVs3O8HkxN8LFekZsUv7g1/9yc+LD/y95Hdv89k+ovOd3nWwaTYa1vwo7F
 ffVWAacZbFbP+ZTH80aD3UZZ5ufjnI+r5qb/qfFPb0veW7fLKOJTk8g/70+zns6SOrJQOuvJ
 N7e7N1Vk8pOE92csfbmi4v/5PIGj7L1PEsxPPxDf9aZq/k8VJZbijERDLeai4kQADK/hIcIC
 AAA=
X-CMS-MailID: 20200624114136eucas1p1a3a31d95d86754201c7965f26ccd5de0
X-Msg-Generator: CA
X-RootMTR: 20200624114136eucas1p1a3a31d95d86754201c7965f26ccd5de0
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200624114136eucas1p1a3a31d95d86754201c7965f26ccd5de0
References: <20200624114127.3016-1-a.hajda@samsung.com>
 <CGME20200624114136eucas1p1a3a31d95d86754201c7965f26ccd5de0@eucas1p1.samsung.com>
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
 drivers/base/core.c | 10 ++++++----
 drivers/base/dd.c   | 21 ++++++++++++++++++++-
 3 files changed, 29 insertions(+), 5 deletions(-)

diff --git a/drivers/base/base.h b/drivers/base/base.h
index 95c22c0f9036..93ef1c2f4c1f 100644
--- a/drivers/base/base.h
+++ b/drivers/base/base.h
@@ -93,6 +93,7 @@ struct device_private {
 	struct klist_node knode_class;
 	struct list_head deferred_probe;
 	struct device_driver *async_driver;
+	char *deferred_probe_msg;
 	struct device *device;
 	u8 dead:1;
 };
@@ -134,6 +135,8 @@ extern void device_release_driver_internal(struct device *dev,
 extern void driver_detach(struct device_driver *drv);
 extern int driver_probe_device(struct device_driver *drv, struct device *dev);
 extern void driver_deferred_probe_del(struct device *dev);
+extern void __deferred_probe_set_msg(const struct device *dev,
+				     struct va_format *vaf);
 static inline int driver_match_device(struct device_driver *drv,
 				      struct device *dev)
 {
diff --git a/drivers/base/core.c b/drivers/base/core.c
index ee9da66bff1b..2a96954d5460 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -3962,6 +3962,8 @@ define_dev_printk_level(_dev_info, KERN_INFO);
  *
  * This helper implements common pattern present in probe functions for error
  * checking: print message if the error is not -EPROBE_DEFER and propagate it.
+ * In case of -EPROBE_DEFER it sets defer probe reason, which can be checked
+ * later by reading devices_deferred debugfs attribute.
  * It replaces code sequence:
  * 	if (err != -EPROBE_DEFER)
  * 		dev_err(dev, ...);
@@ -3977,14 +3979,14 @@ int probe_err(const struct device *dev, int err, const char *fmt, ...)
 	struct va_format vaf;
 	va_list args;
 
-	if (err == -EPROBE_DEFER)
-		return err;
-
 	va_start(args, fmt);
 	vaf.fmt = fmt;
 	vaf.va = &args;
 
-	dev_err(dev, "error %d: %pV", err, &vaf);
+	if (err == -EPROBE_DEFER)
+		__deferred_probe_set_msg(dev, &vaf);
+	else
+		dev_err(dev, "error %d: %pV", err, &vaf);
 
 	va_end(args);
 
diff --git a/drivers/base/dd.c b/drivers/base/dd.c
index 9a1d940342ac..f44d26454b6a 100644
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
+		kfree(dev->p->deferred_probe_msg);
+		dev->p->deferred_probe_msg = NULL;
 	}
 	mutex_unlock(&deferred_probe_mutex);
 }
@@ -211,6 +214,21 @@ void device_unblock_probing(void)
 	driver_deferred_probe_trigger();
 }
 
+/*
+ * __deferred_probe_set_msg() - Set defer probe reason message for device
+ */
+void __deferred_probe_set_msg(const struct device *dev, struct va_format *vaf)
+{
+	const char *drv = dev_driver_string(dev);
+
+	mutex_lock(&deferred_probe_mutex);
+
+	kfree(dev->p->deferred_probe_msg);
+	dev->p->deferred_probe_msg = kasprintf(GFP_KERNEL, "%s: %pV", drv, vaf);
+
+	mutex_unlock(&deferred_probe_mutex);
+}
+
 /*
  * deferred_devs_show() - Show the devices in the deferred probe pending list.
  */
@@ -221,7 +239,8 @@ static int deferred_devs_show(struct seq_file *s, void *data)
 	mutex_lock(&deferred_probe_mutex);
 
 	list_for_each_entry(curr, &deferred_probe_pending_list, deferred_probe)
-		seq_printf(s, "%s\n", dev_name(curr->device));
+		seq_printf(s, "%s\t%s", dev_name(curr->device),
+			   curr->device->p->deferred_probe_msg ?: "\n");
 
 	mutex_unlock(&deferred_probe_mutex);
 
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
