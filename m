Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0574721B987
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jul 2020 17:30:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11FC06EC7B;
	Fri, 10 Jul 2020 15:30:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62EB96EC7B
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 15:30:26 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200710153024euoutp0163c9c79593fab6b43409ebdaf9501039~gbdPk1_T51950919509euoutp01g
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 15:30:24 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200710153024euoutp0163c9c79593fab6b43409ebdaf9501039~gbdPk1_T51950919509euoutp01g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1594395024;
 bh=l2lxSqoqhRbb4X9ynL2i6rkNRlCJlfLxzfEp8Lhp6UE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lOZpDe31bwa7jADfvG7anCVHVgjcVJ15O7IOR3txNwDUKBBmQWU6GDu9jvQfPSuWb
 cKEUBxd/P4JQ7eJ2ceMgG2xuXyJ0+6giE9pwHLdS6hkHBLb7AytLmDx1YeOGkXrJ08
 eoPtECmGCjJsZskqwCtKTepq7kjM77bc3R3rfLBA=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200710153024eucas1p2400dd1dde4c0ab042dd6c1ccb4710ac4~gbdPHE2I52487224872eucas1p24;
 Fri, 10 Jul 2020 15:30:24 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 29.64.06456.099880F5; Fri, 10
 Jul 2020 16:30:24 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200710153023eucas1p1564ece8b49581616a5bfed978a5164f0~gbdOmfAr-1062710627eucas1p1T;
 Fri, 10 Jul 2020 15:30:23 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200710153023eusmtrp1e1f685ab06673404ac89b20505dc379f~gbdOluId52243522435eusmtrp1q;
 Fri, 10 Jul 2020 15:30:23 +0000 (GMT)
X-AuditID: cbfec7f2-809ff70000001938-dd-5f088990be0b
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 6C.38.06017.F89880F5; Fri, 10
 Jul 2020 16:30:23 +0100 (BST)
Received: from AMDC3748.digital.local (unknown [106.120.51.74]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200710153023eusmtip1b455300e49a61e0ba238580d832232ea~gbdN1dLdH0686906869eusmtip1M;
 Fri, 10 Jul 2020 15:30:23 +0000 (GMT)
From: Andrzej Hajda <a.hajda@samsung.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v8 1/5] driver core: add device probe log helper
Date: Fri, 10 Jul 2020 17:30:14 +0200
Message-Id: <20200710153018.12226-2-a.hajda@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200710153018.12226-1-a.hajda@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0VSWUwTURTN60ynA1oyFiJPUYk1xGhkS/l4BELQqJkYjSZKNBqWKhNAWUyH
 /UcIyC4UERCQWKEoQaW0IMgmUGUtoIIQFBuCyAcooEAhRUUpU/Xv3PPOuefk5pGYaJC/kwwJ
 j2Rk4dJQMWGJ13cZXzvK00l/l/JEa/ShepCPZuQvAVLfVfFR/uRnAv2uz8XQO8MCgZLKVQQa
 WZ3BUO/XERyl5yoFSDM1ykfDTfcIpM1vBejpK70AabMvodLlfMyboodH32L0wthNAd26osDp
 xmK9gC5JK+LTmqp0gu6RD/HottInAnois5tH1ypv0Nl1VYBuv5WH00uaPWeEFy09A5nQkGhG
 5uwVYBncpkrjXW/aHvtT8QJPAM2iDGBBQsoNNqzfwTKAJSmiKgHU9H8TcMMygJ+61Dg3LAG4
 oFbify19NR1myyMA9fcX+f8sPVk5wKQiqAPwV+17woRtKAnMGSje3ItRazgcSU3ZcJCkNeUN
 s3SeJg1OOUDjZNumXkgh2HtrGuPS7OHjmvZNbEG5w/n8TMK0B1JzAji1UAA40VFYMN5irmcN
 Z7vrBBzeBXV5WWb+BpyoTMY4cxqAz2oazQke8OPgGmEqhG20VjU5c/RhuKjXABMNKSs4NrfN
 RGMb8HZ9IcbRQpiWYr7jXjgx8My80BZWvDEQnISGCUmx3HmyAOysaAFyYF/8P0sBQBWwZaLY
 sCCGdQ1nYpxYaRgbFR7kdCUiTAM2fpluvXvxOTAMXdYCigTirUKFlPQX8aXRbFyYFkASE9sI
 jwzo/ETCQGlcPCOL8JdFhTKsFtiRuNhWKCmb8RVRQdJI5hrDXGdkf195pMXOBIB/6Zya7Zro
 1bnE7dD5676f31Lh4x01VFTHzp8MKLDY52Gl5zUed/MYaDb49ROJNonV6pgT8XFvwEFl0Qp+
 wXjudKFbH5DEXj2mVDXUqgfH46m2Q3kOCr38wWrk0kyJlfGHl3H3ft/6Mq1dh3vkqWkJnska
 Cs5K+nweJhenOopxNljqehCTsdI/e7rCpmEDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrAIsWRmVeSWpSXmKPExsVy+t/xu7r9nRzxBv8/GlrcWneO1eLlhMOM
 FhtnrGe1mPrwCZvF/20TmS2ufH3PZtG8eD2bxdXvL5ktTr65ymLROXEJu8Wmx9dYLS7vmsNm
 cWjqXkaLtUfuslsc6ou2mPtlKrODgMflaxeZPd7faGX32PttAYvHzll32T1md8xk9di0qpPN
 48SES0we++euYfe4332cyWPzknqPvi2rGD0O9E5m8fi8SS6AN0rPpii/tCRVISO/uMRWKdrQ
 wkjP0NJCz8jEUs/Q2DzWyshUSd/OJiU1J7MstUjfLkEvY//6DqaCXWIVfxbsY2lg3C3UxcjJ
 ISFgInFqw0HmLkYuDiGBpYwSt6/PZIRIiEvsnv+WGcIWlvhzrYsNougTo8SO7xPBEmwCmhJ/
 N99kA7FFBIwl+s/OYgcpYhZoY5WYe/4JkMPBISzgINFz2gakhkVAVeLnw/1g9bwCFhIne59C
 LZCXWL3hAJjNKWAp8W5qN1iNEFDN7WXfWScw8i1gZFjFKJJaWpybnltspFecmFtcmpeul5yf
 u4kRGFvbjv3csoOx613wIUYBDkYlHt4FiRzxQqyJZcWVuYcYJTiYlUR4nc6ejhPiTUmsrEot
 yo8vKs1JLT7EaAp01ERmKdHkfGDc55XEG5oamltYGpobmxubWSiJ83YIHIwREkhPLEnNTk0t
 SC2C6WPi4JRqYDzJE8xYzVlwLvityIFn7ZPyXG89O/pvd3aQkubk89JMitnvJxwxnVn++4Xz
 jcIU1+k3XHmcvS9PvbZ4umH7oXN3P3UELE1W0Jbd9sH81POep7uMyzTX6zfNX7zn3LaHb13S
 7vw9ctHaMGjekjsHcv6U1V7z+2G8j1nvvMOb9DvHfe9cmmL3vZ1TiaU4I9FQi7moOBEA4Jmr
 XMMCAAA=
X-CMS-MailID: 20200710153023eucas1p1564ece8b49581616a5bfed978a5164f0
X-Msg-Generator: CA
X-RootMTR: 20200710153023eucas1p1564ece8b49581616a5bfed978a5164f0
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200710153023eucas1p1564ece8b49581616a5bfed978a5164f0
References: <20200710153018.12226-1-a.hajda@samsung.com>
 <CGME20200710153023eucas1p1564ece8b49581616a5bfed978a5164f0@eucas1p1.samsung.com>
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

During probe every time driver gets resource it should usually check for
error printk some message if it is not -EPROBE_DEFER and return the error.
This pattern is simple but requires adding few lines after any resource
acquisition code, as a result it is often omitted or implemented only
partially.
dev_err_probe helps to replace such code sequences with simple call,
so code:
	if (err != -EPROBE_DEFER)
		dev_err(dev, ...);
	return err;
becomes:
	return dev_err_probe(dev, err, ...);

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
Reviewed-by: Rafael J. Wysocki <rafael@kernel.org>
Reviewed-by: Mark Brown <broonie@kernel.org>
---
 drivers/base/core.c    | 42 ++++++++++++++++++++++++++++++++++++++++++
 include/linux/device.h |  3 +++
 2 files changed, 45 insertions(+)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index 67d39a90b45c..3a827c82933f 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -3953,6 +3953,48 @@ define_dev_printk_level(_dev_info, KERN_INFO);
 
 #endif
 
+/**
+ * dev_err_probe - probe error check and log helper
+ * @dev: the pointer to the struct device
+ * @err: error value to test
+ * @fmt: printf-style format string
+ * @...: arguments as specified in the format string
+ *
+ * This helper implements common pattern present in probe functions for error
+ * checking: print debug or error message depending if the error value is
+ * -EPROBE_DEFER and propagate error upwards.
+ * It replaces code sequence:
+ * 	if (err != -EPROBE_DEFER)
+ * 		dev_err(dev, ...);
+ * 	else
+ * 		dev_dbg(dev, ...);
+ * 	return err;
+ * with
+ * 	return dev_err_probe(dev, err, ...);
+ *
+ * Returns @err.
+ *
+ */
+int dev_err_probe(const struct device *dev, int err, const char *fmt, ...)
+{
+	struct va_format vaf;
+	va_list args;
+
+	va_start(args, fmt);
+	vaf.fmt = fmt;
+	vaf.va = &args;
+
+	if (err != -EPROBE_DEFER)
+		dev_err(dev, "error %d: %pV", err, &vaf);
+	else
+		dev_dbg(dev, "error %d: %pV", err, &vaf);
+
+	va_end(args);
+
+	return err;
+}
+EXPORT_SYMBOL_GPL(dev_err_probe);
+
 static inline bool fwnode_is_primary(struct fwnode_handle *fwnode)
 {
 	return fwnode && !IS_ERR(fwnode->secondary);
diff --git a/include/linux/device.h b/include/linux/device.h
index 15460a5ac024..6b2272ae9af8 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -964,6 +964,9 @@ void device_link_remove(void *consumer, struct device *supplier);
 void device_links_supplier_sync_state_pause(void);
 void device_links_supplier_sync_state_resume(void);
 
+extern __printf(3, 4)
+int dev_err_probe(const struct device *dev, int err, const char *fmt, ...);
+
 /* Create alias, so I can be autoloaded. */
 #define MODULE_ALIAS_CHARDEV(major,minor) \
 	MODULE_ALIAS("char-major-" __stringify(major) "-" __stringify(minor))
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
