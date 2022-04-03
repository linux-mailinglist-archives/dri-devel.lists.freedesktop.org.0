Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E59884F0CF4
	for <lists+dri-devel@lfdr.de>; Mon,  4 Apr 2022 01:29:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3893010E1FE;
	Sun,  3 Apr 2022 23:29:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80EC810E1FE
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Apr 2022 23:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=F+Um7ld6EmxP0HBmSMTv2gxtaiTsplYMSOL9xPsFLbQ=; b=fBRmr7ifhtoCS23gSy41z85P6M
 z/hurqhTfoKIjAMmgaBZSctAXMxGvKMJk85ro+sWiXnPQWXdSh6PCdD3RynXFq7YQ5MeUmMTvCgqj
 Zp3MXZ08rdRA6hcoP1ejYho9gMqjm8kKvETqKDi05NJ6QvwO8kMp5a2sB2cmyWzOcK1saaH2jtKA6
 ogoSv0ZVMuWJAK2S3+Eyu0pJScGyVW5GXPP3C5YJoPDGWkG4Zf8AUXGqlXEth6lViv10fX2ebSK1O
 5KDKA/OImn/fkUNXxIRBmJgHnImDV4kTCGBDFok7RaQsKtsUIEXOXVu0niZbxBkN5TR9mxbaHF9dx
 zfvnxNmw==;
Received: from [2601:1c0:6280:3f0::aa0b] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nb9ea-00CXHm-Ps; Sun, 03 Apr 2022 23:29:04 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] drm/format_helper: fix a kernel-doc typo
Date: Sun,  3 Apr 2022 16:29:02 -0700
Message-Id: <20220403232902.1753-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Randy Dunlap <rdunlap@infradead.org>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It looks like the incorrect name of a function parameter was used
in the kernel-doc notation, so just change it to the function's
parameter name to quell the kernel-doc warning.

drivers/gpu/drm/drm_format_helper.c:640: warning: Function parameter or member 'vaddr' not described in 'drm_fb_xrgb8888_to_mono_reversed'
drivers/gpu/drm/drm_format_helper.c:640: warning: Excess function parameter 'src' description in 'drm_fb_xrgb8888_to_mono_reversed'

Fixes: bcf8b616deb8 ("drm/format-helper: Add drm_fb_xrgb8888_to_mono_reversed()")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Cc: Javier Martinez Canillas <javierm@redhat.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
CC: Maxime Ripard <mripard@kernel.org>
CC: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_format_helper.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20220401.orig/drivers/gpu/drm/drm_format_helper.c
+++ linux-next-20220401/drivers/gpu/drm/drm_format_helper.c
@@ -624,7 +624,7 @@ static void drm_fb_gray8_to_mono_reverse
  * drm_fb_xrgb8888_to_mono_reversed - Convert XRGB8888 to reversed monochrome
  * @dst: reversed monochrome destination buffer
  * @dst_pitch: Number of bytes between two consecutive scanlines within dst
- * @src: XRGB8888 source buffer
+ * @vaddr: XRGB8888 source buffer
  * @fb: DRM framebuffer
  * @clip: Clip rectangle area to copy
  *
