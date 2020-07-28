Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D292312A4
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 21:31:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 411FE6E3AC;
	Tue, 28 Jul 2020 19:30:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D90DA6E283
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 11:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1595935510;
 bh=+AN/A7LaJ8QE7aEa8re6PrqGoq/kSyCmQ9u1D7Iy5LI=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=c3N2Ie2zUBUMu5bY4EPMooZ2Wh97BFNQO2YAJwLeSaPQ9sNSAMzpmH4FmAEgqhUb7
 2l+MWBQvzL0laVy8bHN7tOfYlXMJ2lxjzy8AOb82R6mNWeR7blnWOuWYRjEczW3HIg
 gC0mBD/61N/YlzrLtaBO10V251wsgZIYOhhWxj/0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([80.208.215.239]) by mail.gmx.com
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MgNh1-1kiFof40mV-00hsD8; Tue, 28 Jul 2020 13:18:23 +0200
From: Frank Wunderlich <frank-w@public-files.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH v2 2/5] drm/mediatek: fix boot up for 720 and 480 but 1080
Date: Tue, 28 Jul 2020 13:17:57 +0200
Message-Id: <20200728111800.77641-3-frank-w@public-files.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200728111800.77641-1-frank-w@public-files.de>
References: <20200728111800.77641-1-frank-w@public-files.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:ak6ylIwTkGEi+mVAT3DUFYeBflxF5UYrm21Ep/FvtMOgSVvosry
 re5T5r+z1mGqxMwD61JmDn8kXvfaEsk8E5o6GNX/A4yzkKQh5AmNhTlp8O1kK8euvhrXFWp
 NhVShiqVk49RchrRqkTBVvSn/O/dsTnEra+yI4Ykv0nQELNnk7mjirt/GkINhIpGwhrgcNx
 8Jnt6M95h7lBxQSpTgtWQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:XYmAxyeEJAs=:1eHRGnyRJRzxdvzmVu0hUS
 hDuCVogkODQLUxkc6+6Arp9CLs/nrPiDs1AfB4HUDaywozhhXDFz4G2A0499HYCt8ihQMfO0g
 eW8p2XPmddidRrZ4Sb7RY1TKxYJpP3w8ErNX+r6bk9+jVYiVZABAROeU71dkwHTBJaHPTEC+B
 9KctfMOXKcRcR1RnaxknBxbqnK/UHDaVgQ+IdKCzhw8YjHKXzLdljSuf3X6+TmvQwDAwbGEQb
 7Q4WeXe/YmMETDhblGoQO1udaeujeEZV9Z0PbAv8v/QPKXdYyJRZn7hnB10JUbIoGzbJFe4NS
 RQwA6Nlanzf9NN+fvfQ0R7SPfMNUaOdIn2NVMJzCHRL0yJ1uUP1Xti618qpSKkmADSlg0sENg
 NURodvY3AOtJHTN+TUbawIXO/XHvkgUF04dl2ACASfJH/ZzEpIhX7KZfoLb60Ko3zoB7Ck2sV
 A5kws3xgtdU9Q/PYKn4gQ1da09wJ5vOvNCu6Y4Dc6urr5A/U+I+4/scolbNiX+TEP3bpfqyky
 jTqpDXHtpc/dFoeqoQVA+JjDJxFdn9tRN6ghJbXhH7Jso78Gz3f/unAGfLtGyRQ4SmorjV6qf
 puim78brHuAep7Vu1i123JUmPaudGonJn6cN70SmoqcD+LPDV4mTrUJHdLRJnXLSZeDA2GB+t
 lIUDd9JYrVyqMq9OYiK8qGdbFrDY5PAjlpvQll2L7cj0akOpEelTk52wL+NSMmkMNAA0Ti3Gb
 PkYkkOimruBUCWzZacCpZApJ2myfQvXt0xRxl/G+oq8BfnxODeMWdx++86+KTjIozdqu2me5v
 YtlHIXuvg5mIPXw9yqCJjA45aH2lPJqVY3oBKYXwol+TuH8sN4/UpH5l7KpxQIj6Y0Y4OR49u
 llgPQU/gY1q3JTj2rB9h5luFaR3ZLaRy+2EnhXK3y4PhPluQ45m6ZmHYuBfy9NEaTK3NZCgXe
 vHIVKUEZHZ3LN7UqfEoHh6zIjqoFIKwLw5INNfdK1rzyumXwfGCVxn3tBK8BhUUcO5ONz2cZS
 0HLXinthJH05iBDZ1FDwLRs7NOgzukLB3y/KvSgUhic1mP4Cj91AaWEu+mOUj8SYFaddySsLy
 O70RfjGgc5XaU5+LdfasGS0Rg9nTUsRfr9nVTeW9K8mqUKfvRL1y8u2EOAllIj+jp2Av5QLfG
 42Vjwp7Z0qVonS/V+jwX+5eUlBXJ8QHfLCfOgWzccH/iKQPcbq0K6tPaIs0cm5fX5245WG0K0
 c+0NesNgzXTIlb4cklq3lBkC55w1zGDl9M3qO6A==
X-Mailman-Approved-At: Tue, 28 Jul 2020 19:30:50 +0000
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Frank Wunderlich <frank-w@public-files.de>, David Airlie <airlied@linux.ie>,
 chunhui dai <chunhui.dai@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: chunhui dai <chunhui.dai@mediatek.com>

- disable tmds on phy on mt2701
- support other resolutions like 1280x1024

without this Patch i see flickering on my TFT (1280x1024),
so i guess clock is wrong.

Signed-off-by: chunhui dai <chunhui.dai@mediatek.com>
Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
Tested-by: Frank Wunderlich <frank-w@public-files.de>
---
 drivers/gpu/drm/mediatek/mtk_hdmi_phy.c        | 3 +++
 drivers/gpu/drm/mediatek/mtk_hdmi_phy.h        | 1 +
 drivers/gpu/drm/mediatek/mtk_mt2701_hdmi_phy.c | 1 +
 3 files changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_phy.c b/drivers/gpu/drm/mediatek/mtk_hdmi_phy.c
index 5223498502c4..edadb7a700f1 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_phy.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_phy.c
@@ -184,6 +184,9 @@ static int mtk_hdmi_phy_probe(struct platform_device *pdev)
 		return PTR_ERR(phy_provider);
 	}

+	if (hdmi_phy->conf->pll_default_off)
+		hdmi_phy->conf->hdmi_phy_disable_tmds(hdmi_phy);
+
 	return of_clk_add_provider(dev->of_node, of_clk_src_simple_get,
 				   hdmi_phy->pll);
 }
diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_phy.h b/drivers/gpu/drm/mediatek/mtk_hdmi_phy.h
index 2d8b3182470d..f472fdeb63dc 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_phy.h
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_phy.h
@@ -22,6 +22,7 @@ struct mtk_hdmi_phy;
 struct mtk_hdmi_phy_conf {
 	bool tz_disabled;
 	unsigned long flags;
+	bool pll_default_off;
 	const struct clk_ops *hdmi_phy_clk_ops;
 	void (*hdmi_phy_enable_tmds)(struct mtk_hdmi_phy *hdmi_phy);
 	void (*hdmi_phy_disable_tmds)(struct mtk_hdmi_phy *hdmi_phy);
diff --git a/drivers/gpu/drm/mediatek/mtk_mt2701_hdmi_phy.c b/drivers/gpu/drm/mediatek/mtk_mt2701_hdmi_phy.c
index d3cc4022e988..6fbedacfc1e8 100644
--- a/drivers/gpu/drm/mediatek/mtk_mt2701_hdmi_phy.c
+++ b/drivers/gpu/drm/mediatek/mtk_mt2701_hdmi_phy.c
@@ -239,6 +239,7 @@ static void mtk_hdmi_phy_disable_tmds(struct mtk_hdmi_phy *hdmi_phy)
 struct mtk_hdmi_phy_conf mtk_hdmi_phy_2701_conf = {
 	.tz_disabled = true,
 	.flags = CLK_SET_RATE_GATE,
+	.pll_default_off = true,
 	.hdmi_phy_clk_ops = &mtk_hdmi_phy_pll_ops,
 	.hdmi_phy_enable_tmds = mtk_hdmi_phy_enable_tmds,
 	.hdmi_phy_disable_tmds = mtk_hdmi_phy_disable_tmds,
--
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
