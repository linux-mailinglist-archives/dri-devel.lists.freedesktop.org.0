Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE972570944
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 19:42:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E10189034D;
	Mon, 11 Jul 2022 17:41:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC6E69034A
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 17:41:29 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 152745C0071;
 Mon, 11 Jul 2022 13:41:29 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 11 Jul 2022 13:41:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1657561289; x=
 1657647689; bh=+ldo9PEJZhMd0qQGBauz79m4k+yWVKutgr3hw2Nfyl8=; b=d
 hqLrSp8lkUxvk+C/45+svv1wSOrwwaW5+7sLUlj1Idf3E93XXkG/RQcZx1TsraWV
 E4yTnMSM4u8GfNcxOT7vK2yZOu8JvikuLQArxm1emABOSpFh0vpHy5aHKQluYJuV
 fnyybPfSByXoneFc2KJl3CWJaV4OtjPoIT9GGcbmGa0cikiVXZNHGW20IJsDYDtK
 2PV/fv1b8Qbt2rwXaz9doyzhFttTXRXvZF+ACMkGRRFk9sG6KMe20hvG7nQY/PzV
 xoU8J3AXJIuI9+Ot9XdegpDAF41iNSaMru5+eEezG87onqYCaCfdwhxgi4AgcRu/
 CQepXOaiHmlfTQSAIyMEQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1657561289; x=
 1657647689; bh=+ldo9PEJZhMd0qQGBauz79m4k+yWVKutgr3hw2Nfyl8=; b=H
 uw5l1rzNn/PjNeb6yqbXjT+xBEwh7QbXsL92ZbhgONcBp0hnh6/z+PYS7OpXg5aH
 oz3vNoXhWGp9/T7cSwo7Yv3G6lBvXbRevlxbTY6kq1hhTvEniBhM5ZYtlNzskayk
 oIq4Jf6P6oQnZk3sOx/rMs3t8sW96VDF2CZq1or98EqM8Zf/4m9MiyBaqA7FZaym
 tlDOzuRSp5j8QClZB3uQtyW7DxsS/XZZkghosdLI7H1bdDKXCi3Y0069l7PhmIXs
 BQSPu0bUL4UoQ2pvfbhOXdTQjm+2bUhz2tfs8bLI56idWCQEvXxXGyyyFRsqH6QX
 VIBsR5G2tL8s/gP2tnmWQ==
X-ME-Sender: <xms:yGDMYtMURSc7XRUOvHEhQR3wBfzWKNd4B3KY2wivQZDm2mxfxM8G4g>
 <xme:yGDMYv-LmT22jmNISMt4LlFJxH8kLGdWddyKUFiGP4tow3FDySjv9fT-yWUe3o377
 Bkd-MQuee9d3xHk_cQ>
X-ME-Received: <xmr:yGDMYsQNnFZbmIiPz8sVCUKjKxp7DjpzKUvLSP_IwLlRM56EFAxpSWrQi1oRjshJ_rATgaA89EgRqj0ER3yl9gXxqmN3_S8v_3D_RWM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejfedgudduhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgr
 gihimhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtf
 frrghtthgvrhhnpeeuieeggffhffffieefheduieeuvdetgeeufeffvefgtedvffehheek
 ffevudefieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:yGDMYptgYwKUcih7Q-SuqjUYQqznxMoyh3Vsd3kgi00-2D3PZfjoVg>
 <xmx:yGDMYlcoQwLE1hDqPevduZRhnX4-Ckf4AzaIcNfSvpl-i332vBXj-Q>
 <xmx:yGDMYl3z8G8UiYPmq-jxklrndzWC-8HSTddzud628XK8NldMoD3KNg>
 <xmx:yWDMYs5R8BmJUtN7Imx1hx_juRfA0K6Yr1MKSnhkL9ib6h5IVBtrcw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Jul 2022 13:41:28 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v5 62/69] drm/vc4: debugfs: Protect device resources
Date: Mon, 11 Jul 2022 19:39:32 +0200
Message-Id: <20220711173939.1132294-63-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220711173939.1132294-1-maxime@cerno.tech>
References: <20220711173939.1132294-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Our current code now mixes some resources whose lifetime are tied to the
device (clocks, IO mappings, etc.) and some that are tied to the DRM device
(encoder, bridge).

The device one will be freed at unbind time, but the DRM one will only be
freed when the last user of the DRM device closes its file handle.

So we end up with a time window during which we can call the encoder hooks,
but we don't have access to the underlying resources and device.

Let's protect all those sections with drm_dev_enter() and drm_dev_exit() so
that we bail out if we are during that window.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_debugfs.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_debugfs.c b/drivers/gpu/drm/vc4/vc4_debugfs.c
index ba2d8ea562af..d6350a8ca048 100644
--- a/drivers/gpu/drm/vc4/vc4_debugfs.c
+++ b/drivers/gpu/drm/vc4/vc4_debugfs.c
@@ -3,6 +3,8 @@
  *  Copyright © 2014 Broadcom
  */
 
+#include <drm/drm_drv.h>
+
 #include <linux/seq_file.h>
 #include <linux/circ_buf.h>
 #include <linux/ctype.h>
@@ -41,11 +43,18 @@ vc4_debugfs_init(struct drm_minor *minor)
 static int vc4_debugfs_regset32(struct seq_file *m, void *unused)
 {
 	struct drm_info_node *node = (struct drm_info_node *)m->private;
+	struct drm_device *drm = node->minor->dev;
 	struct debugfs_regset32 *regset = node->info_ent->data;
 	struct drm_printer p = drm_seq_file_printer(m);
+	int idx;
+
+	if (!drm_dev_enter(drm, &idx))
+		return -ENODEV;
 
 	drm_print_regset32(&p, regset);
 
+	drm_dev_exit(idx);
+
 	return 0;
 }
 
-- 
2.36.1

