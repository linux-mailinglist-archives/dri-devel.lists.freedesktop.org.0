Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 866552B409A
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 11:18:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 745B989DA6;
	Mon, 16 Nov 2020 10:18:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1981589DA6
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 10:18:29 +0000 (UTC)
Received: from mail.kernel.org (ip5f5ad5de.dynamic.kabel-deutschland.de
 [95.90.213.222])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6A14422447;
 Mon, 16 Nov 2020 10:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605521908;
 bh=O4qZGNDBJFOujXhRHfmeXCL9QARjpkuE22vOQsuBA08=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=EQghPL1JaNZUao4JPdg4jceD1QVGAYBBDS6veO8IxitRQk52FkcKOgc1eyFN/ggqV
 d9BHNJDJHXudwIl3LEQTKo6ckL828g0daV2hvADdh770o2a+JDzEfwQUfTO6lFAyCy
 mFQDw5EhMJr6ht4gvrmjcNlVP5zkNOv2As+WmGUM=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
 (envelope-from <mchehab@kernel.org>)
 id 1kebac-00FwEB-6h; Mon, 16 Nov 2020 11:18:26 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Subject: [PATCH v4 10/27] video: fix some kernel-doc markups
Date: Mon, 16 Nov 2020 11:18:06 +0100
Message-Id: <21661aed9892a1bacc7ef76a5dc9f5c7b37f5d8f.1605521731.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1605521731.git.mchehab+huawei@kernel.org>
References: <cover.1605521731.git.mchehab+huawei@kernel.org>
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
 Bernard Zhao <bernard@vivo.com>, Jonathan Corbet <corbet@lwn.net>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org, Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Sam Ravnborg <sam@ravnborg.org>,
 linux-kernel@vger.kernel.org
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
@@ -59,41 +59,41 @@ static u16 blue16[] __read_mostly = {
     0x0000, 0xaaaa, 0x0000, 0xaaaa, 0x0000, 0xaaaa, 0x0000, 0xaaaa,
     0x5555, 0xffff, 0x5555, 0xffff, 0x5555, 0xffff, 0x5555, 0xffff
 };
 
 static const struct fb_cmap default_2_colors = {
     .len=2, .red=red2, .green=green2, .blue=blue2
 };
 static const struct fb_cmap default_8_colors = {
     .len=8, .red=red8, .green=green8, .blue=blue8
 };
 static const struct fb_cmap default_4_colors = {
     .len=4, .red=red4, .green=green4, .blue=blue4
 };
 static const struct fb_cmap default_16_colors = {
     .len=16, .red=red16, .green=green16, .blue=blue16
 };
 
 
 
 /**
- *	fb_alloc_cmap - allocate a colormap
+ *	fb_alloc_cmap_gfp - allocate a colormap
  *	@cmap: frame buffer colormap structure
  *	@len: length of @cmap
  *	@transp: boolean, 1 if there is transparency, 0 otherwise
  *	@flags: flags for kmalloc memory allocation
  *
  *	Allocates memory for a colormap @cmap.  @len is the
  *	number of entries in the palette.
  *
  *	Returns negative errno on error, or zero on success.
  *
  */
 
 int fb_alloc_cmap_gfp(struct fb_cmap *cmap, int len, int transp, gfp_t flags)
 {
 	int size = len * sizeof(u16);
 	int ret = -ENOMEM;
 
 	flags |= __GFP_NOWARN;
 
 	if (cmap->len != len) {
diff --git a/drivers/video/hdmi.c b/drivers/video/hdmi.c
index 1e4cb63d0d11..947be761dfa4 100644
--- a/drivers/video/hdmi.c
+++ b/drivers/video/hdmi.c
@@ -1675,41 +1675,42 @@ static int hdmi_audio_infoframe_unpack(struct hdmi_audio_infoframe *frame,
 
 	ret = hdmi_audio_infoframe_init(frame);
 	if (ret)
 		return ret;
 
 	ptr += HDMI_INFOFRAME_HEADER_SIZE;
 
 	frame->channels = ptr[0] & 0x7;
 	frame->coding_type = (ptr[0] >> 4) & 0xf;
 	frame->sample_size = ptr[1] & 0x3;
 	frame->sample_frequency = (ptr[1] >> 2) & 0x7;
 	frame->coding_type_ext = ptr[2] & 0x1f;
 	frame->channel_allocation = ptr[3];
 	frame->level_shift_value = (ptr[4] >> 3) & 0xf;
 	frame->downmix_inhibit = ptr[4] & 0x80 ? true : false;
 
 	return 0;
 }
 
 /**
- * hdmi_vendor_infoframe_unpack() - unpack binary buffer to a HDMI vendor infoframe
+ * hdmi_vendor_any_infoframe_unpack() - unpack binary buffer to a HDMI
+ * 	vendor infoframe
  * @frame: HDMI Vendor infoframe
  * @buffer: source buffer
  * @size: size of buffer
  *
  * Unpacks the information contained in binary @buffer into a structured
  * @frame of the HDMI Vendor information frame.
  * Also verifies the checksum as required by section 5.3.5 of the HDMI 1.4
  * specification.
  *
  * Returns 0 on success or a negative error code on failure.
  */
 static int
 hdmi_vendor_any_infoframe_unpack(union hdmi_vendor_any_infoframe *frame,
 				 const void *buffer, size_t size)
 {
 	const u8 *ptr = buffer;
 	size_t length;
 	int ret;
 	u8 hdmi_video_format;
 	struct hdmi_vendor_infoframe *hvf = &frame->hdmi;
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
