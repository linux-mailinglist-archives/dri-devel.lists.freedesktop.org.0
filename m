Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 175F356B6D2
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 12:14:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1CFD10F42C;
	Fri,  8 Jul 2022 10:00:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23A2B1138CA
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 10:00:16 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id EB8E132009E1;
 Fri,  8 Jul 2022 06:00:14 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 08 Jul 2022 06:00:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1657274414; x=
 1657360814; bh=+ldo9PEJZhMd0qQGBauz79m4k+yWVKutgr3hw2Nfyl8=; b=u
 6dZVLfItjO2cj50WPXyQ75ljlJIlEmS235niQeXExCHQ5+c9Liy9MTss4+b8oT9f
 86E4JOYNONSvl25yh1fz3+k3KY3RYy3tl2sWaNEHDULD8s7g4UDNsA6TeaLZAGQj
 E3v0mt8ZCamJ6oJ2W3jVfeMyKy5qtVRQ8dOWZgAZMLLgi9RGarnp5X2MD++FOtGP
 9aw05dDcINatfKNg8t7JkbyAc1S12OGSC7KoOXuNDtLVQIcuDUwyvlucvKH8qfG7
 z1j6ZqD4Yx5pvkIzGUSH85gfkdeLeYp5OzRhyKAdSZu2645RPaqKrciGSpxcsdHs
 I93v3G/Cwt3A7aNLqIFCA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1657274414; x=
 1657360814; bh=+ldo9PEJZhMd0qQGBauz79m4k+yWVKutgr3hw2Nfyl8=; b=Y
 81lI4UkbKfuPL1XkCrJss3yvKH7orktPclxHRwBrN9jBzL7fY92QHYpoYzUwh1sg
 jzri4HBMY3hbmCLsCvPe0vfR/2f+qFHPBA5ZsRNnRur9h/Z7hJvPr4vhU8z3rKrK
 q3eaFDaI8Xrt9HHZdZYLyUtp+90/o3S7SbVKCJjQbZ6SkDdpyd9oTx1d+OmikNF/
 PHNKBg5/90l5zMAJQTRJxziC62fRw+Jvw1rOQNdj/R9KiBVkxlS5UcJNGjb+eOFE
 6PZHJ8Mep1uS1OsTxGD+TEXRBaV/sym+iV5DBD42LJvK2PMnDlHKm7T75HRzv8Co
 2uYiv2qbrol4ybc5qeyzw==
X-ME-Sender: <xms:LgDIYjn9sh0wDTdtxLJJV3fFxvyoVdVvbpwchKJIqb3mR642bnVTxg>
 <xme:LgDIYm0jOZsb89XgOuVWgTdvgGuo5D_pYg_jo3k0_lpoz95cmYK-qrxUa73j4RyGw
 Jmgb2w6IAzyUIx9IYw>
X-ME-Received: <xmr:LgDIYppbBJPAsFufIFtITwJ3hGDOUwgvNUrLvVMTxqI8Whs1vb9ZRGiaUNoL19xk2jpajm27imjS-AfQUnfRbyZAEUUiHwcn7kHu7RA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeijedgvdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepueeigefghfffffeifeehudeiuedvteegueefffevgfetvdffheehkeff
 vedufeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:LgDIYrnIAsZykrxiyePb2YBzdaMK69qptY2LZqPP2UL4if8b9eB0xQ>
 <xmx:LgDIYh1xVYSAczcM75UbS1nl5EwARghSYmKBG3LUBxUH_L1bM-eEHA>
 <xmx:LgDIYqvTowldsUWf99cvlX8dcqES9yDNOuzqGHlKKUtu_34Q8u9qZw>
 <xmx:LgDIYsQX9T8Fb6vL-itazDFL0kvHRdrncLuOAAon7a56qpEpd5n8vQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Jul 2022 06:00:13 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v4 62/69] drm/vc4: debugfs: Protect device resources
Date: Fri,  8 Jul 2022 11:57:00 +0200
Message-Id: <20220708095707.257937-63-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220708095707.257937-1-maxime@cerno.tech>
References: <20220708095707.257937-1-maxime@cerno.tech>
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

