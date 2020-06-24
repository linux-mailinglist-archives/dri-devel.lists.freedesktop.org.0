Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C5F3207256
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jun 2020 13:41:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42BBF6EB0C;
	Wed, 24 Jun 2020 11:41:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C99866EB03
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jun 2020 11:41:37 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200624114136euoutp0220cd6283cc3b2197af1e4a98850c51a7~beA5lMeZv1634616346euoutp02G
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jun 2020 11:41:36 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200624114136euoutp0220cd6283cc3b2197af1e4a98850c51a7~beA5lMeZv1634616346euoutp02G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1592998896;
 bh=HhEMsisY02ZOuY2/gjpIMi/WSmd5AdgRdcQapho3Kl8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BmsA0fznDtVTqN7hyIBo1SznJi5uPjqavYxDu/DcdIPMu99H72KddvRGVn68Pc4cX
 NJoyGwQaOv8T4/uVZZsXr1kZ1AQ7uRRKocaH8Erf9tWwKRMzS0ARLEC9GL4LYAaw14
 7eewpaRDBsRRx+i4QD5TIO2g465ed9zMlFI6Plro=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200624114136eucas1p113aa4f8987e7c1092a5bfec32e859dfa~beA5MkD490804208042eucas1p1K;
 Wed, 24 Jun 2020 11:41:36 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 21.1F.05997.FEB33FE5; Wed, 24
 Jun 2020 12:41:35 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200624114135eucas1p26e2e4683d60cebdce7acd55177013992~beA4xUzId0286002860eucas1p2T;
 Wed, 24 Jun 2020 11:41:35 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200624114135eusmtrp122a25f28c380107d069f8d7c313f9d2f~beA4worMw0702007020eusmtrp1H;
 Wed, 24 Jun 2020 11:41:35 +0000 (GMT)
X-AuditID: cbfec7f4-65dff7000000176d-04-5ef33befd65a
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 23.53.06017.FEB33FE5; Wed, 24
 Jun 2020 12:41:35 +0100 (BST)
Received: from AMDC3748.digital.local (unknown [106.120.51.74]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200624114134eusmtip296b918e1532d3a32de342cba443a9e63~beA4F74i82682326823eusmtip2-;
 Wed, 24 Jun 2020 11:41:34 +0000 (GMT)
From: Andrzej Hajda <a.hajda@samsung.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [RESEND PATCH v5 1/5] driver core: add probe_err log helper
Date: Wed, 24 Jun 2020 13:41:23 +0200
Message-Id: <20200624114127.3016-2-a.hajda@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200624114127.3016-1-a.hajda@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0VSeUiTYRjn3Xcqrb6W4ZtF4qg/ktJSqxcsKxH66CIKjLLMqR8qzYNtXlGo
 qHnlnWeJkmaieaRuqWHaDLVsHnm0RFmmHUYq5cyKzLZ9Wv/9+B3P7+HhoTGRhrCiA4IUnCxI
 IhWT5riq82fvrjnnec/dI0370GhNL4GmMzoAephfS6CciSkSLasyMTS0MEei2NJaEg0vTmPo
 +ZdhHCVlllGofnKEQIMtd0ikzmkFqPrZOIXUaR6oSJ+DHWbYwZEBjJ3TxlNs6/cSnG0uHKfY
 24kFBFtfmUSy3RmvBGxb0QOK1aV0CdiGsig2rbESsO2p2Tg7X7/1tPCC+QFfThoQxsnsXbzM
 /QejG7CQDxsjfqhGiWjwZ30yMKMh4wSb8uMpIxYxFQAOz9glA3MD1gMYO7tI8sI8gLlK99XA
 wrKW5E33ASyO0Qr+JQZeVGNGF8nsgEsNb0xpC8YRpmsKKaMJY37hcDjhBmEUNjBusLBv0hTA
 me2wrLzawNO0kNkPS9878G3WsKqu3WQxYxDMihsAxjmQmaHgUEw5yZvc4CNNsYDHG+DnrkaK
 x1tgT/ZNnMdRUFcRh/HhRACVdc0YLzjDsd5fpLEYM2xd22LP00dgVb/eRENmLdTOmM6FGWCW
 Kg/jaSFMvCHi3TZQp1GuDLSE9/oXVjZjof5WBcXfJwXAJ7oeLANYF/4vKwGgElhyofJAP07u
 EMSF28klgfLQID87n+DAemB4sp4/Xfom0PLbWw0YGojXCOvefvUUEZIweWSgGkAaE1sIXTU9
 niKhryTyKicLviwLlXJyNdhM42JLoePd6Usixk+i4K5wXAgnW1UFtJlVNLgeWzSlPWXhavsx
 PbmUPJqw0ybkjNJlk6xT6uCm+lmdX1uuqFknO+6U6xFledLnYka5tmCpe3ZScU0X15TXqtT0
 tZ/z8K5oi3jZH+61SNid/ZS6lPqu8fwn/6ePuV1jnwXBezu+ca8PujVuS1a4zOXqI9LcE44l
 TUhLspxOHLKIDxbjcn/JHltMJpf8BXReWFxgAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPIsWRmVeSWpSXmKPExsVy+t/xe7rvrT/HGZw4Lmdxa905VouXEw4z
 WmycsZ7VYurDJ2wW/7dNZLa48vU9m0Xz4vVsFle/v2S2OPnmKotF58Ql7BabHl9jtbi8aw6b
 xaGpexkt1h65y25xqC/aYu6XqcwOAh6Xr11k9nh/o5XdY++3BSweO2fdZfeY3TGT1WPTqk42
 jxMTLjF57J+7ht3jfvdxJo/NS+o9+rasYvQ40DuZxePzJrkA3ig9m6L80pJUhYz84hJbpWhD
 CyM9Q0sLPSMTSz1DY/NYKyNTJX07m5TUnMyy1CJ9uwS9jMsNm5kLnolW/Nh2i7WB8Z9gFyMn
 h4SAicTX/zfYuhi5OIQEljJKTNq1iBkiIS6xe/5bKFtY4s+1LjYQW0jgE6NE84QkEJtNQFPi
 7+abYHERAWOJ/rOz2EEGMQu0sUrMPf+EHSQhLOAiMev8Y7BBLAKqEkuWrWXtYuTg4BUwl1j8
 1AhivrzE6g0HwEo4BSwkJrVcZITYZS5x6Ppi1gmMfAsYGVYxiqSWFuem5xYb6RUn5haX5qXr
 JefnbmIERta2Yz+37GDsehd8iFGAg1GJh3fDg49xQqyJZcWVuYcYJTiYlUR4nc6ejhPiTUms
 rEotyo8vKs1JLT7EaAp000RmKdHkfGDU55XEG5oamltYGpobmxubWSiJ83YIHIwREkhPLEnN
 Tk0tSC2C6WPi4JRqYJzhGvJJQW1FlefM7J4lH6u0s9aEXGYw6bvO6yAxf6Hbuuij87PM5+0z
 dzdhYZnhtsqvlNtProXpZO5G+wSXzIaPNnkvjFo8OhrPXli65/VBzcAs92nXZovrTWPewdsp
 8Kb7iQRHXa9ZfJ9kZPGD+yF5xucO/ej4fLjgxfwqsQyNW2xejNdzlViKMxINtZiLihMBkdVG
 U8ICAAA=
X-CMS-MailID: 20200624114135eucas1p26e2e4683d60cebdce7acd55177013992
X-Msg-Generator: CA
X-RootMTR: 20200624114135eucas1p26e2e4683d60cebdce7acd55177013992
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200624114135eucas1p26e2e4683d60cebdce7acd55177013992
References: <20200624114127.3016-1-a.hajda@samsung.com>
 <CGME20200624114135eucas1p26e2e4683d60cebdce7acd55177013992@eucas1p2.samsung.com>
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

During probe every time driver gets resource it should usually check for error
printk some message if it is not -EPROBE_DEFER and return the error. This
pattern is simple but requires adding few lines after any resource acquisition
code, as a result it is often omited or implemented only partially.
probe_err helps to replace such code sequences with simple call, so code:
	if (err != -EPROBE_DEFER)
		dev_err(dev, ...);
	return err;
becomes:
	return probe_err(dev, err, ...);

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Mark Brown <broonie@kernel.org>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/base/core.c    | 39 +++++++++++++++++++++++++++++++++++++++
 include/linux/device.h |  3 +++
 2 files changed, 42 insertions(+)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index 67d39a90b45c..ee9da66bff1b 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -3953,6 +3953,45 @@ define_dev_printk_level(_dev_info, KERN_INFO);
 
 #endif
 
+/**
+ * probe_err - probe error check and log helper
+ * @dev: the pointer to the struct device
+ * @err: error value to test
+ * @fmt: printf-style format string
+ * @...: arguments as specified in the format string
+ *
+ * This helper implements common pattern present in probe functions for error
+ * checking: print message if the error is not -EPROBE_DEFER and propagate it.
+ * It replaces code sequence:
+ * 	if (err != -EPROBE_DEFER)
+ * 		dev_err(dev, ...);
+ * 	return err;
+ * with
+ * 	return probe_err(dev, err, ...);
+ *
+ * Returns @err.
+ *
+ */
+int probe_err(const struct device *dev, int err, const char *fmt, ...)
+{
+	struct va_format vaf;
+	va_list args;
+
+	if (err == -EPROBE_DEFER)
+		return err;
+
+	va_start(args, fmt);
+	vaf.fmt = fmt;
+	vaf.va = &args;
+
+	dev_err(dev, "error %d: %pV", err, &vaf);
+
+	va_end(args);
+
+	return err;
+}
+EXPORT_SYMBOL_GPL(probe_err);
+
 static inline bool fwnode_is_primary(struct fwnode_handle *fwnode)
 {
 	return fwnode && !IS_ERR(fwnode->secondary);
diff --git a/include/linux/device.h b/include/linux/device.h
index 15460a5ac024..40a90d9bf799 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -964,6 +964,9 @@ void device_link_remove(void *consumer, struct device *supplier);
 void device_links_supplier_sync_state_pause(void);
 void device_links_supplier_sync_state_resume(void);
 
+extern __printf(3, 4)
+int probe_err(const struct device *dev, int err, const char *fmt, ...);
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
