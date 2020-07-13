Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE7021D8CC
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jul 2020 16:43:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4CA589F69;
	Mon, 13 Jul 2020 14:43:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BEC289F69
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jul 2020 14:43:33 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200713144332euoutp0199e87e8fe413ea620df9c405f9ea859a~hVwLMqNz70073900739euoutp01z
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jul 2020 14:43:32 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200713144332euoutp0199e87e8fe413ea620df9c405f9ea859a~hVwLMqNz70073900739euoutp01z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1594651412;
 bh=l2lxSqoqhRbb4X9ynL2i6rkNRlCJlfLxzfEp8Lhp6UE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Khv7GQHxGcl1oNaYb80IKm+Iq2S9vWfliopuPMKNnkTCdyxa+MMzxIeUrv0Hz4O23
 ohUn88mudgrw1inCZ6nY5iot35nZOtPZo6YnYkxRcKmbn2GWOInb6egNNAqhbLQz/S
 JL3DaRKTvZ2XIYR9gTPqaT+NEDvZ9uCUGbvTR+lU=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200713144332eucas1p10094fde0732d18b7b6d4037c81020c76~hVwKyo-Hy1041510415eucas1p1v;
 Mon, 13 Jul 2020 14:43:32 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id F4.22.05997.4137C0F5; Mon, 13
 Jul 2020 15:43:32 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200713144331eucas1p24107a30783dacc92887b80cf082be9fb~hVwKWZbq20910209102eucas1p2k;
 Mon, 13 Jul 2020 14:43:31 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200713144331eusmtrp21fa81494749fc5dfc3a964686afaec07~hVwKVj3bD1147711477eusmtrp2w;
 Mon, 13 Jul 2020 14:43:31 +0000 (GMT)
X-AuditID: cbfec7f4-65dff7000000176d-11-5f0c7314b2b1
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 05.2A.06314.3137C0F5; Mon, 13
 Jul 2020 15:43:31 +0100 (BST)
Received: from AMDC3748.digital.local (unknown [106.120.51.74]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200713144330eusmtip1ebe4f1fbd587ac6c7a4eaf92371da882~hVwJpKMJY1706817068eusmtip1Y;
 Mon, 13 Jul 2020 14:43:30 +0000 (GMT)
From: Andrzej Hajda <a.hajda@samsung.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v9 1/4] driver core: add device probe log helper
Date: Mon, 13 Jul 2020 16:43:21 +0200
Message-Id: <20200713144324.23654-2-a.hajda@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200713144324.23654-1-a.hajda@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0WSe0hTURzHObuP3S0nt7nypJU0CHqQlgadHtSKgksQFmFFUbryqpmbsesj
 CzKs5iPzkWm6Hmqp6axm85UTH6zwkW2kpqj5yJLALLTUrGGZ8yr99/19f5/f63AoTGohXKiz
 6jBWo1aGyEkxXtHw27pBxjn4bjQVEajnmZVAwykvAXqeaSBQ+uAQiWYqUjH0bnKURFcfGUjU
 MTWMoeavHTiKT80TIuOnTgK1m+6RyJxeA9DTV31CZE46ge5PpGMKmmnvbMWY0a7rQqbmZw7O
 VOn6hMzduCyCMerjSaYppU3A1N1/ImQGbjQKmNK8aCapTA+Y+ptpODNuXHlQcly8w58NORvB
 ajx2+omD6gxxgvOmpRemc2rxK6BamgAoCtKbYfddRQIQU1K6EEBr0hjggwkAc43fST4YBzDf
 nI8nANFcRVvbZ4JPPAbQ+GaBmi0Zqikn7BRJr4V/SrtJu5bRXjDZohPaIYy24bAjVjsHOdEK
 WBL7bg7C6dUwdaoYs2sJjeAHs25+nBssLqnH7MuK6K0wO+movQ+kvwnhg+qPQp7ZC9umWwW8
 doJfGsvm/eVwpip73o+GA4XXML44DsDykiqMT2yHvVYbaR+AzW5tMHnw9m4Y2zyC84/kCLu+
 Lbbb2Ky8VXEH420JjNNKeXoVHLCUzzd0hvlvJ0leM7DgdebcJVI6EcCGmegU4Kb7PysHAD1w
 ZsM5VSDLearZSHdOqeLC1YHuZ0JVRjD7yVr+Nk68AKbp02ZAU0DuIIHeDr5SQhnBRanMAFKY
 XCbZY2k5JZX4K6MusppQX014CMuZgSuFy50lXg+HT0rpQGUYe45lz7OahayAErlcAWV0kDXK
 p7lojWjwlM8vKvdIb2Vk0VP5kgBlQViAQi/rF/uNypYomoqD98bLI/AYT1I7Ol4Ymda/pceW
 MWRxFSdmOdUeOlD6I/Cky3vH0NsDhhWyzku9+WmX91cme7U4TTzxWO+9zFubmbGo6rZfj9g0
 Fvw9Zuywbdsun33o2OUROc4FKTetwzSc8h9uQOSkYAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPIsWRmVeSWpSXmKPExsVy+t/xu7rCxTzxBvNXq1jcWneO1eLlhMOM
 FhtnrGe1mPrwCZvF/20TmS2ufH3PZtG8eD2bxdXvL5ktTr65ymLROXEJu8Wmx9dYLS7vmsNm
 cWjqXkaLtUfuslsc6ou2mPtlKrODgMflaxeZPd7faGX32PttAYvHzll32T1md8xk9di0qpPN
 48SES0we++euYfe4332cyWPzknqPvi2rGD0O9E5m8fi8SS6AN0rPpii/tCRVISO/uMRWKdrQ
 wkjP0NJCz8jEUs/Q2DzWyshUSd/OJiU1J7MstUjfLkEvY//6DqaCXWIVfxbsY2lg3C3UxcjJ
 ISFgInHp0jPWLkYuDiGBpYwSHw5dZYNIiEvsnv+WGcIWlvhzrYsNougTo8Tsk2vYQRJsApoS
 fzffBGsQETCW6D87ix2kiFmgjVVi7vknYEXCAg4SG9qvgBWxCKhKTPy+Gmwqr4CFxINDs1gg
 NshLrN5wACjOwcEpYCkxvy8cxBQCKjnx1nMCI98CRoZVjCKppcW56bnFhnrFibnFpXnpesn5
 uZsYgZG17djPzTsYL20MPsQowMGoxMMr4c8TL8SaWFZcmXuIUYKDWUmE1+ns6Tgh3pTEyqrU
 ovz4otKc1OJDjKZAJ01klhJNzgdGfV5JvKGpobmFpaG5sbmxmYWSOG+HwMEYIYH0xJLU7NTU
 gtQimD4mDk6pBsbMW6GftLkONjmathxTS4ual39tg77Gnefl9ZX7bDiZbvifebZ45f/So54J
 K+6uS/l4KOLq34WCRcvKZ31IXmCWXbVPrtdB77vH7Hiri95ua492tO4WbFhw9ZTtdxnHhJV9
 Bz8eX7ZoBtvvs9M6Pn5NC2ta+i2pLYvV4lvj3Td/vxw9PV1ovr2iEktxRqKhFnNRcSIAvpDW
 98ICAAA=
X-CMS-MailID: 20200713144331eucas1p24107a30783dacc92887b80cf082be9fb
X-Msg-Generator: CA
X-RootMTR: 20200713144331eucas1p24107a30783dacc92887b80cf082be9fb
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200713144331eucas1p24107a30783dacc92887b80cf082be9fb
References: <20200713144324.23654-1-a.hajda@samsung.com>
 <CGME20200713144331eucas1p24107a30783dacc92887b80cf082be9fb@eucas1p2.samsung.com>
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
