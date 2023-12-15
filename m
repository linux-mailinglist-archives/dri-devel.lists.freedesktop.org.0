Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B436C8154B1
	for <lists+dri-devel@lfdr.de>; Sat, 16 Dec 2023 00:56:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE67410E044;
	Fri, 15 Dec 2023 23:56:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46F5510E044
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Dec 2023 23:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=6X/8g8dcFseOxoWxBd+fYzojaaVtjnt3eobM6crGlY8=; b=T0vDp6ySun5FruDXtGj19F0xQf
 +h+UsDLCvwXL0LTrclEYZN0neFFBG83g9CZ5e5uTrzFWqLQSHE8ho/EkhSMQSV4ygsBg44kO6cwUa
 A3PwcuvGxFp61US9Jd7fSgAt4MSjSEUravUrdjd2eOtCvzuGRgHlCyRxTe7D0Aw9PHgHCtaGCD4VE
 5J0VqQqau6Nwl4j65OV24vkfswycRIAeQ3Nvho0dBPKauerVYKxKGWBVyv6/hKldGJsBY7qSkNtwH
 FLz93vUK5iCpj9N+MeQrL4+lLbU9Ye7w/Pbv1Km5og2W3ciNaTsKF4aIokBCb14zK5Ca8f3iuu2vV
 bVGrn9fg==;
Received: from [50.53.46.231] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1rEI2p-004tlg-1a; Fri, 15 Dec 2023 23:56:39 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] drm/vmwgfx: fix kernel-doc Excess struct member 'base'
Date: Fri, 15 Dec 2023 15:56:38 -0800
Message-ID: <20231215235638.19189-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.43.0
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
Cc: kernel test robot <lkp@intel.com>, Randy Dunlap <rdunlap@infradead.org>,
 dri-devel@lists.freedesktop.org,
 VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Zack Rusin <zackr@vmware.com>, Kees Cook <keescook@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix a new kernel-doc warning reported by kernel test robot:

vmwgfx_surface.c:55: warning: Excess struct member 'base' description in 'vmw_user_surface'

The other warning is not correct: it is confused by "__counted_by".
Kees has made a separate patch for that.

In -Wall mode, kernel-doc still reports 20 warnings of this nature:
vmwgfx_surface.c:198: warning: No description found for return value of 'vmw_surface_dma_size'
but I am not addressing those.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202312150701.kNI9LuM3-lkp@intel.com/
Cc: Kees Cook <keescook@chromium.org>
Cc: Zack Rusin <zackr@vmware.com>
Cc: VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>
Cc: dri-devel@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c |    1 -
 1 file changed, 1 deletion(-)

diff -- a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c b/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
@@ -44,7 +44,6 @@
  * struct vmw_user_surface - User-space visible surface resource
  *
  * @prime:          The TTM prime object.
- * @base:           The TTM base object handling user-space visibility.
  * @srf:            The surface metadata.
  * @master:         Master of the creating client. Used for security check.
  */
