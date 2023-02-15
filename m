Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 95CBB697584
	for <lists+dri-devel@lfdr.de>; Wed, 15 Feb 2023 05:45:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96DF810EA22;
	Wed, 15 Feb 2023 04:45:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B74910EA21;
 Wed, 15 Feb 2023 04:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=6haR0Gslot1UK8ZhTQ6ixtzG06W6DKkjfv7cGJc+PJ4=; b=Nf/C1CP2CKbdfVKEnA9yx/FqHN
 YMHMxRAu2f6HRtGof1DBr2KCHAuTE8XnakubiyGmhTzxLAtnpB2JxU7sg1IumBQcSqU9WwFl1RGir
 RVL6YAb/QN1vwM3bIULVStT7IjeYXybqDJjqQ39b7Z5wmdJ9qEiTxxf6Qdga/YtZYOv4XfmHQv9D9
 GRdYer9I/xWQWv1pTULUmmsVLfI8IJLCWFYgXntEv89d9MWQfn5+n/zPaYiEV5FCc+qjsQT0ZAxgL
 qKyD5YOxTz7A9JJF12qbmXPXKfuDHzEd1sTIChDyVUCHO8BWjLqOA6j2tF/beEIhyK6hoPmC60nI2
 o89GqZKg==;
Received: from [2601:1c2:980:9ec0::df2f] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pS9fh-004i4H-Ti; Wed, 15 Feb 2023 04:45:34 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] drm/i915: move a Kconfig symbol to unbreak the menu
 presentation
Date: Tue, 14 Feb 2023 20:45:33 -0800
Message-Id: <20230215044533.4847-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.39.1
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Randy Dunlap <rdunlap@infradead.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gvt-dev@lists.freedesktop.org, Christoph Hellwig <hch@lst.de>,
 Zhi Wang <zhi.a.wang@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Inserting a Kconfig symbol that does not have a dependency (DRM_I915_GVT)
into a list of other symbols that do have a dependency (on DRM_I915)
breaks the driver menu presentation in 'make *config'.

Relocate the DRM_I915_GVT symbol so that it does not cause this
problem.

Fixes: 8b750bf74418 ("drm/i915/gvt: move the gvt code into kvmgt.ko")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Christoph Hellwig <hch@lst.de>
Cc: Zhi Wang <zhi.a.wang@intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org
Cc: intel-gvt-dev@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/i915/Kconfig |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff -- a/drivers/gpu/drm/i915/Kconfig b/drivers/gpu/drm/i915/Kconfig
--- a/drivers/gpu/drm/i915/Kconfig
+++ b/drivers/gpu/drm/i915/Kconfig
@@ -118,9 +118,6 @@ config DRM_I915_USERPTR
 
 	  If in doubt, say "Y".
 
-config DRM_I915_GVT
-	bool
-
 config DRM_I915_GVT_KVMGT
 	tristate "Enable KVM host support Intel GVT-g graphics virtualization"
 	depends on DRM_I915
@@ -172,3 +169,6 @@ menu "drm/i915 Unstable Evolution"
 	depends on DRM_I915
 	source "drivers/gpu/drm/i915/Kconfig.unstable"
 endmenu
+
+config DRM_I915_GVT
+	bool
