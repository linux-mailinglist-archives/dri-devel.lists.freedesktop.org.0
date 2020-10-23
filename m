Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 066CC29740F
	for <lists+dri-devel@lfdr.de>; Fri, 23 Oct 2020 18:34:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 218FD6E2DE;
	Fri, 23 Oct 2020 16:33:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58A296E2D5
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Oct 2020 16:33:49 +0000 (UTC)
Received: from mail.kernel.org (ip5f5ad5a3.dynamic.kabel-deutschland.de
 [95.90.213.163])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2C45C24641;
 Fri, 23 Oct 2020 16:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603470828;
 bh=QtoGRTSylDJqRgGFl+2IEK4wws+paYf2E8QEhkhHbdI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hEIB+q2tWBVixEjqnwpiMbiJeCp/19tHBnF+K+4L7lCcqpnSY2d5cQDUHnRqq8E3B
 GYXKY5Gvf1/QwKaYsYY0ExUq9v7xK7WjiVF4T6LX4K4Z3LiIZ+S5lJI4DFIwSoyPBY
 yDd8aKrlBhPYRJ0nItAd61UlPvnIkM5HOjgvwudA=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
 (envelope-from <mchehab@kernel.org>)
 id 1kW00g-002Awn-4Z; Fri, 23 Oct 2020 18:33:46 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Subject: [PATCH v3 32/56] video: fix some kernel-doc markups
Date: Fri, 23 Oct 2020 18:33:19 +0200
Message-Id: <8078dde13eac44d5361abb606e098abd724b2ccd.1603469755.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1603469755.git.mchehab+huawei@kernel.org>
References: <cover.1603469755.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
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
Cc: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some identifiers have different names between their prototypes
and the kernel-doc markup.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/video/fbdev/core/fbcmap.c | 2 +-
 drivers/video/hdmi.c              | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/core/fbcmap.c b/drivers/video/fbdev/core/fbcmap.c
index e5ae33c1a8e8..757d5c3f620b 100644
--- a/drivers/video/fbdev/core/fbcmap.c
+++ b/drivers/video/fbdev/core/fbcmap.c
@@ -76,7 +76,7 @@ static const struct fb_cmap default_16_colors = {
 
 
 /**
- *	fb_alloc_cmap - allocate a colormap
+ *	fb_alloc_cmap_gfp - allocate a colormap
  *	@cmap: frame buffer colormap structure
  *	@len: length of @cmap
  *	@transp: boolean, 1 if there is transparency, 0 otherwise
diff --git a/drivers/video/hdmi.c b/drivers/video/hdmi.c
index b7a1d6fae90d..e44b7cec95fd 100644
--- a/drivers/video/hdmi.c
+++ b/drivers/video/hdmi.c
@@ -1688,7 +1688,8 @@ static int hdmi_audio_infoframe_unpack(struct hdmi_audio_infoframe *frame,
 }
 
 /**
- * hdmi_vendor_infoframe_unpack() - unpack binary buffer to a HDMI vendor infoframe
+ * hdmi_vendor_any_infoframe_unpack() - unpack binary buffer to a HDMI
+ * 	vendor infoframe
  * @frame: HDMI Vendor infoframe
  * @buffer: source buffer
  * @size: size of buffer
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
