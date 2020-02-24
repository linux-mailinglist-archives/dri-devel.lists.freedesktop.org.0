Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1476C16A286
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2020 10:39:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CDEA6E2EA;
	Mon, 24 Feb 2020 09:39:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E1296E225
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2020 09:09:27 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id 19ACF616;
 Mon, 24 Feb 2020 04:09:26 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Mon, 24 Feb 2020 04:09:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=Paw5PYMOhjhZy
 +fzKf6WIcWIW2DlVtCPhwp3fbzQ4Bk=; b=cJY4cQ86Zd4RIzH7Jk2uoasZUIj/4
 em2wwa1BQtaeaIhUtfAGeokvj0lYbNeKPpjxALSMwXkTC1lMEhoZ3VEh5DiMQuwb
 5j/PJ+RaLPICoz7ZPtmFGae2qZqtoNRX1G2GaVpZACCH8fbWJ4urRy789+C1DOnJ
 qvEs3A2pRag85+yuFaT/DDhiM5GeLnl4b7zB80TzWoxcUBZ62XeodSgwVva31OLE
 e/dY6L5ysKMpnwrpITYxdTs9AFFXXbMx+b5pPRimuOJRVW+Kr7ZM0vtEpmgJQEor
 bp08f2otkaGYSqnUfWiEDAVNy3H0Wc1hikbJrcOsC1wK0urunGhF7Uk1g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=Paw5PYMOhjhZy+fzKf6WIcWIW2DlVtCPhwp3fbzQ4Bk=; b=lX7OCsN2
 khDMZjqJIky/SO09jtlluBzQmLSVyo17jYhHNYBkDiOpxa0L6w0D4oeytqbj4nkp
 ZZssrYMRjQkKtWolzBy3YSuSKTnHU2sTVvLot+4yQrfmfvCEPw5igtp/wIrh0eui
 8dtboIx3Mnpjb1/+nZ5FQHFv7JRSOP1RERhz7Y/3zypQaubYG1Co6iJ/hrsSbSWz
 5ZyhmXIVcIo0uKMNDGKq1mPj0fUr9xQxTYwG18cciTCeyHGOcaFwT2TTLyN/562U
 hiyOrx18uJeUTeYhj0N52VBVj3Tq3M5S3Xv0+v8VjQin3wBLWZxRCjMXSLOFoJMe
 uTjrMDSmczZ3ew==
X-ME-Sender: <xms:xZJTXjzTlNBDOXWu7FwEXbWOVhPzD3dUTHBef84dDaHoEtERmPP2rw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrledtucetufdoteggodetrfdotffvucfrrh
 hofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgenuceurghi
 lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
 ephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcutfhi
 phgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecukfhppeeltddrkeelrd
 eikedrjeeinecuvehluhhsthgvrhfuihiivgepvddunecurfgrrhgrmhepmhgrihhlfhhr
 ohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:xZJTXqgQLG1wf-NGiw1uiIOrr8NB5_1vhoD1Qyvz9Kx_0_A9GxiqWQ>
 <xmx:xZJTXgL8-DfjgCI5NtdjVCy1jPlV8I0Nz_HDx8l4IDcLGv5UetO2eg>
 <xmx:xZJTXlDwFhKgJJOZ75ltU_VMiBGzvWZqTA_0fuYIDLHUbK9pWdpyiA>
 <xmx:xZJTXoifcz0S1IK_GZkhLDq4wzYitIk2swV2pwUZGKNtzOIOj2z0QN16-HY>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 59B3D3060BD1;
 Mon, 24 Feb 2020 04:09:25 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH 25/89] reset: simple: Add reset callback
Date: Mon, 24 Feb 2020 10:06:27 +0100
Message-Id: <e7e2c84206f2cc8c0cb36cd734226f73f3331198.1582533919.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.6c896ace9a5a7840e9cec008b553cbb004ca1f91.1582533919.git-series.maxime@cerno.tech>
References: <cover.6c896ace9a5a7840e9cec008b553cbb004ca1f91.1582533919.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 24 Feb 2020 09:39:03 +0000
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org, Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The reset-simple code lacks a reset callback that is still pretty easy to
implement. The only real thing to consider is the delay needed for a device
to be reset, so let's expose that as part of the reset-simple driver data.

Cc: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/reset/reset-simple.c       | 21 +++++++++++++++++++++
 include/linux/reset/reset-simple.h |  4 ++++
 2 files changed, 25 insertions(+)

diff --git a/drivers/reset/reset-simple.c b/drivers/reset/reset-simple.c
index c854aa351640..7a8c56512ae9 100644
--- a/drivers/reset/reset-simple.c
+++ b/drivers/reset/reset-simple.c
@@ -11,6 +11,7 @@
  * Maxime Ripard <maxime.ripard@free-electrons.com>
  */
 
+#include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/io.h>
@@ -63,6 +64,25 @@ static int reset_simple_deassert(struct reset_controller_dev *rcdev,
 	return reset_simple_update(rcdev, id, false);
 }
 
+static int reset_simple_reset(struct reset_controller_dev *rcdev,
+			       unsigned long id)
+{
+	struct reset_simple_data *data = to_reset_simple_data(rcdev);
+	int ret;
+
+	ret = reset_simple_assert(rcdev, id);
+	if (ret)
+		return ret;
+
+	mdelay(data->reset_ms);
+
+	ret = reset_simple_deassert(rcdev, id);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
 static int reset_simple_status(struct reset_controller_dev *rcdev,
 			       unsigned long id)
 {
@@ -80,6 +100,7 @@ static int reset_simple_status(struct reset_controller_dev *rcdev,
 const struct reset_control_ops reset_simple_ops = {
 	.assert		= reset_simple_assert,
 	.deassert	= reset_simple_deassert,
+	.reset		= reset_simple_reset,
 	.status		= reset_simple_status,
 };
 EXPORT_SYMBOL_GPL(reset_simple_ops);
diff --git a/include/linux/reset/reset-simple.h b/include/linux/reset/reset-simple.h
index 08ccb25a55e6..a5887f6cbe50 100644
--- a/include/linux/reset/reset-simple.h
+++ b/include/linux/reset/reset-simple.h
@@ -27,6 +27,9 @@
  * @status_active_low: if true, bits read back as cleared while the reset is
  *                     asserted. Otherwise, bits read back as set while the
  *                     reset is asserted.
+ * @reset_ms: Minimum delay in milliseconds needed that needs to be
+ *            waited for between an assert and a deassert to reset the
+ *            device.
  */
 struct reset_simple_data {
 	spinlock_t			lock;
@@ -34,6 +37,7 @@ struct reset_simple_data {
 	struct reset_controller_dev	rcdev;
 	bool				active_low;
 	bool				status_active_low;
+	unsigned int			reset_ms;
 };
 
 extern const struct reset_control_ops reset_simple_ops;
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
