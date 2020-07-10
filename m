Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D500621B990
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jul 2020 17:30:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04A916EC76;
	Fri, 10 Jul 2020 15:30:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 771656EC7D
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 15:30:29 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200710153028euoutp017bcff9c1e87c2eaa0f0bcda5430b51ad~gbdSn_K_t2103621036euoutp01K
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 15:30:28 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200710153028euoutp017bcff9c1e87c2eaa0f0bcda5430b51ad~gbdSn_K_t2103621036euoutp01K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1594395028;
 bh=/GuB4fVLrH0EVz7PTsFzmWXh5JX3KwLVO+RWvFi1gMk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sIhsjpIDa+BYbAWCH2LHQt1wkGFufh6Od5H0PJPlCyj+OcV/mrNPxSf1uVkwM6vI9
 LcXgWHw+GVHVco11us42UCmCSkb5sPaft+krKXjIoubMqrej69jtJqJF6d9RbzU656
 0MPgjTeb059ZSS0ccESHiv3XiaEtM00jMJE+8SSQ=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200710153027eucas1p2d0cab0e693a1a0fbc69852bf6bcbc98c~gbdSF-3jT2486824868eucas1p2v;
 Fri, 10 Jul 2020 15:30:27 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id DB.64.06456.399880F5; Fri, 10
 Jul 2020 16:30:27 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200710153027eucas1p1c893327b918e99a9b0cbd7b0a00af96b~gbdRjCRmP1062810628eucas1p1E;
 Fri, 10 Jul 2020 15:30:27 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200710153027eusmtrp1a432c1479ae923017dc8ba9ba83267fd~gbdRiYGjr2243522435eusmtrp1v;
 Fri, 10 Jul 2020 15:30:27 +0000 (GMT)
X-AuditID: cbfec7f2-809ff70000001938-e5-5f088993e039
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 23.D8.06314.299880F5; Fri, 10
 Jul 2020 16:30:27 +0100 (BST)
Received: from AMDC3748.digital.local (unknown [106.120.51.74]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200710153026eusmtip19a1e45e8ac77cd6755cf6598008ec3e2~gbdQzdtzI0686906869eusmtip1N;
 Fri, 10 Jul 2020 15:30:26 +0000 (GMT)
From: Andrzej Hajda <a.hajda@samsung.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v8 5/5] coccinelle: add script looking for cases where
 probe__err can be used
Date: Fri, 10 Jul 2020 17:30:18 +0200
Message-Id: <20200710153018.12226-6-a.hajda@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200710153018.12226-1-a.hajda@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0WSa0hTYRjHe3euWrPjNHyxyJr0wUpNK3hD6SIRJwgqCqLC1tLjlNy0TUvr
 g1pmmpc0sUwTLGeKVpr3C16a0tQ1y3kpxQtdKCea5VyRkebxKH37Pc//+T/Pn5eXxiRGwpkO
 UUVwapU8VEra4jWvfr9xz0yiZTv0BZvQ0PNuApnT2wB6kV1GoKwPn0m0UJOBoT7rNIluFJSR
 qP+XGUOdk/04SsrQUqji0wCBehsekkiX1QTQs/YRCunSzqK82SxsP8P2DvRg7PT7mxTb9DMf
 Z+tzRig2N/EBwVaUJJFsR7pJxLbkPaXYsWS9iK3UxrBpVSWAbU3NxFlLxcZj4jO2voFcaMhl
 Tu2597xtsKG5mQzPdo8a/1MsigVW19vAhobMLphQOS+6DWxpCVMMYIbBRAjFLIDWxAekUFgA
 zCzrwlcs5t47y5YiAGdyWyheWLK8HlLxTDJu8G/lIMmzI7MT3jHmULwBY+Zw2H8rgeAFB0YG
 40e7FjfRNM5sgTnNq3kUMwi21fsIt1xgaXkrxrMNswd+y0peCgSZKQoWpdYtBzoIrxdqRQI7
 wAl9FSXwBmjITFmeiYFjxfGYYE4EsLq8HhMEHzjcPUfyh7HF0GUNnkL7AGxI+7oUDTJ28P2U
 Pd/GFvFuzX1MaIthYoJEmN4Mx4zVywudYOFbKykwC5909ODCU6UA+HnyJZYOXHL+H8sHoAQ4
 cZEapYLTeKm4Kx4auVITqVJ4BIQpK8DiJzPM62fqgNV0QQcYGkjXiPPltExCyC9ropU6AGlM
 6ij2MxrOScSB8uirnDpMpo4M5TQ6sJ7GpU7inY/N/hJGIY/gLnJcOKdeUUW0jXMsOBYw/Kgx
 4vjue6fsneeCUqJcfUs3mr60pXuXfPewBLUXu1EujfnlVWluE+9Gj544fbgAizO2PbZh4gZ9
 Lmk7C4jpVZuc1YoFB+DXbZk4cnKgs9N7Xuu6ruraUf9D6urtJ744DWfIPD6uzf4xPt+3bbBW
 quravK/WLiasO+GRdcFLL8U1wXKvrZhaI/8HkVXfb2ADAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHIsWRmVeSWpSXmKPExsVy+t/xu7qTOzniDW4UWNxad47V4uWEw4wW
 G2esZ7WY+vAJm8X/bROZLa58fc9m0bx4PZvF1e8vmS1OvrnKYtE5cQm7xabH11gtLu+aw2Zx
 aOpeRou1R+6yWxzqi7aY+2Uqs4OAx+VrF5k93t9oZffY+20Bi8fOWXfZPWZ3zGT12LSqk83j
 xIRLTB77565h97jffZzJY/OSeo++LasYPQ70Tmbx+LxJLoA3Ss+mKL+0JFUhI7+4xFYp2tDC
 SM/Q0kLPyMRSz9DYPNbKyFRJ384mJTUnsyy1SN8uQS/j9L59bAUzdCte/F7B1MD4VbmLkZND
 QsBE4uXlfqYuRi4OIYGljBIfH7YwQyTEJXbPfwtlC0v8udbFBlH0iVFi6tJ/YAk2AU2Jv5tv
 soHYIgLGEv1nZ7GDFDELtLFKzD3/hB0kISwQK9Ewax9rFyMHB4uAqsSsfdwgJq+AhcThndYQ
 8+UlVm84ADaSU8BS4t3UbrCRQkAlt5d9Z53AyLeAkWEVo0hqaXFuem6xoV5xYm5xaV66XnJ+
 7iZGYFxtO/Zz8w7GSxuDDzEKcDAq8fAuSOSIF2JNLCuuzD3EKMHBrCTC63T2dJwQb0piZVVq
 UX58UWlOavEhRlOgkyYyS4km5wNjPq8k3tDU0NzC0tDc2NzYzEJJnLdD4GCMkEB6Yklqdmpq
 QWoRTB8TB6dUA6Pd46o30UXs09n3h7oaxLGc2habtMXN/y13SO7VaYa/ApLnte7ff6GKrS3q
 f/Xk/C4z5jvVZ6ZGP+S3DWf6+K72/OaWN18UF/jw989efFvybmDlc0XLbVYtoVf6l100SDr+
 MON1RNfbrMv/fjOv/MWsw/xoWbKKn8WPazH7V/Ku93hYKZJ1pVmJpTgj0VCLuag4EQAeZ83F
 wQIAAA==
X-CMS-MailID: 20200710153027eucas1p1c893327b918e99a9b0cbd7b0a00af96b
X-Msg-Generator: CA
X-RootMTR: 20200710153027eucas1p1c893327b918e99a9b0cbd7b0a00af96b
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200710153027eucas1p1c893327b918e99a9b0cbd7b0a00af96b
References: <20200710153018.12226-1-a.hajda@samsung.com>
 <CGME20200710153027eucas1p1c893327b918e99a9b0cbd7b0a00af96b@eucas1p1.samsung.com>
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

This is AD-HOC script, it should nt be merged.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 probe_err.cocci | 247 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 247 insertions(+)
 create mode 100644 probe_err.cocci

diff --git a/probe_err.cocci b/probe_err.cocci
new file mode 100644
index 000000000000..0ef9a9b4c9bc
--- /dev/null
+++ b/probe_err.cocci
@@ -0,0 +1,247 @@
+virtual context
+virtual patch
+
+@initialize:python@
+@@
+
+import re
+
+@@
+expression err, dev;
+constant char [] fmt;
+expression list args;
+@@
+
+-   if (err != -EPROBE_DEFER) { dev_err(dev, fmt, args); }
++   dev_err_probe(dev, err, fmt, args);
+
+@@
+expression ptr, dev;
+constant char [] fmt;
+expression list args;
+@@
+
+-   if (ptr != ERR_PTR(-EPROBE_DEFER)) { dev_err(dev, fmt, args); }
++   dev_err_probe(dev, PTR_ERR(ptr), fmt, args);
+
+@@
+expression e, dev;
+identifier err;
+identifier fget =~ "^(devm_)?(clk_get|gpiod_get|gpiod_get_optional|gpiod_get_index|gpiod_get_index_optional|regulator_get|regulator_get_optional|reset_control_get|reset_control_get_exclusive|reset_control_get_shared|phy_get|pinctrl_get|iio_channel_get|pwm_get)$";
+identifier flog =~ "^(dev_err|dev_warn|dev_info)$";
+expression list args;
+@@
+    e = fget(...);
+    if (IS_ERR(e)) {
+(
+	err = PTR_ERR(e);
+-	flog(dev, args);
++	dev_err_probe(dev, err, args);
+|
+-	flog(dev, args);
++	dev_err_probe(dev, PTR_ERR(e), args);
+)
+	...
+    }
+
+@@
+expression dev;
+identifier err;
+identifier fget =~ "^(devm_)?(request_irq|request_threaded_irq|regulator_bulk_get)$";
+identifier flog =~ "^(dev_err|dev_warn|dev_info)$";
+expression list args;
+@@
+    err = fget(...);
+    if ( \( err \| err < 0 \) ) {
+	...
+-	flog(dev, args);
++	dev_err_probe(dev, err, args);
+	...
+    }
+
+@catch_no_nl@
+expression dev, err;
+constant char [] fmt !~ "\\n$";
+@@
+    dev_err_probe(dev, err, fmt, ...)
+
+@script:python add_nl depends on catch_no_nl@
+fmt << catch_no_nl.fmt;
+nfmt;
+@@
+print "add_nl " + fmt
+coccinelle.nfmt = fmt[:-1] + '\\n"';
+
+@fix_no_nl depends on catch_no_nl@
+constant char [] catch_no_nl.fmt;
+identifier add_nl.nfmt;
+@@
+-  fmt
++  nfmt
+
+@catch_fmt@
+expression err, dev;
+expression fmt;
+position p;
+@@
+
+    dev_err_probe@p(dev, err, fmt, ..., \( (int)err \| err \) )
+
+@script:python trim_fmt@
+fmt << catch_fmt.fmt;
+new_fmt;
+@@
+
+tmp = fmt
+tmp = re.sub('failed: irq request (IRQ: %d, error :%d)', 'irq request %d', tmp)
+tmp = re.sub('Error %l?[di] ', 'Error ', tmp)
+tmp = re.sub(' as irq = %d\\\\n', ', bad irq\\\\n', tmp)
+tmp = re.sub('[:,]? ?((ret|err|with|error)[ =]?)?%l?[di]\.?\\\\n', '\\\\n', tmp)
+tmp = re.sub(' ?\(((err|ret|error)\s*=?\s*)?%l?[diu]\)[!.]?\\\\n', '\\\\n', tmp)
+
+assert tmp != fmt, "cannot trim_fmt in: " + fmt
+print "trim_fmt " + fmt + " " + tmp
+coccinelle.new_fmt = tmp
+
+@fix_fmt@
+expression err, err1, dev;
+expression fmt;
+expression list l;
+identifier trim_fmt.new_fmt;
+position catch_fmt.p;
+@@
+
+-   dev_err_probe@p(dev, err, fmt, l, err1)
++   dev_err_probe(dev, err, new_fmt, l)
+
+@err_ass1@
+identifier err;
+expression dev, ptr;
+expression list args;
+@@
+
+-   err = PTR_ERR(ptr);
+-   dev_err_probe(dev, err, args);
+-   return ERR_PTR(err);
++   dev_err_probe(dev, PTR_ERR(ptr), args);
++   return ERR_CAST(ptr);
+
+@err_ass2@
+identifier err, f1, f2;
+expression dev, e;
+expression list args;
+@@
+-   err = PTR_ERR(e);
+-   dev_err_probe(dev, err, args);
+(
+|
+    f1(...);
+|
+    f1(...);
+    f2(...);
+)
+-   return err;
++   return dev_err_probe(dev, PTR_ERR(e), args);
+
+@@
+identifier err;
+expression dev, e;
+expression list args;
+@@
+
+-   int err = e;
+-   dev_err_probe(dev, err, args);
+-   return err;
++   return dev_err_probe(dev, e, args);
+
+@@
+expression err, dev;
+expression list args;
+@@
+
+-   dev_err_probe(dev, err, args);
+-   return err;
++   return dev_err_probe(dev, err, args);
+
+@@
+expression err, dev, ptr;
+expression list args;
+@@
+
+-   dev_err_probe(dev, PTR_ERR(ptr), args);
+    err = PTR_ERR(ptr);
++   dev_err_probe(dev, err, args);
+
+@@
+expression e;
+expression list args;
+statement s, s1;
+@@
+
+// without s1 spatch generates extra empty line after s
+-   if (e) { return dev_err_probe(args); } else s s1
++   if (e) return dev_err_probe(args); s s1
+
+@@
+expression e;
+expression list args;
+@@
+
+-   if (e) { return dev_err_probe(args); }
++   if (e) return dev_err_probe(args);
+
+@@
+expression e, s, v;
+expression list args;
+@@
+
+-   if (e == v) { s; } else { return dev_err_probe(args); }
++   if (e != v) return dev_err_probe(args); s;
+
+@err_ass3@
+identifier err;
+expression dev, ptr;
+expression list args;
+@@
+
+-   err = PTR_ERR_OR_ZERO(ptr);
+-   if (err) return dev_err_probe(dev, err, args);
++   if (IS_ERR(ptr)) return dev_err_probe(dev, PTR_ERR(ptr), args);
+
+@@
+expression dev, ptr;
+expression list args;
+@@
+
+-   DROP_probe_err(dev, PTR_ERR(ptr), args)
++   probe_err(dev, ptr, args)
+
+@@
+identifier err_ass1.err;
+expression e;
+identifier f =~ "^(dev_err_probe|probe_err_ptr)$";
+@@
+-    \( int err; \| int err = e; \)
+    <+... when != err
+    f
+    ...+>
+
+@@
+identifier err_ass2.err;
+expression e;
+identifier f =~ "^(dev_err_probe|probe_err_ptr)$";
+@@
+-    \( int err; \| int err = e; \)
+    <+... when != err
+    f
+    ...+>
+
+@@
+identifier err_ass3.err;
+expression e;
+identifier f =~ "^(dev_err_probe|probe_err_ptr)$";
+@@
+-    \( int err; \| int err = e; \)
+    <+... when != err
+    f
+    ...+>
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
