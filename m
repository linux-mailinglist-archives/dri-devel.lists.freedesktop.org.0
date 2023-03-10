Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 626C06B4215
	for <lists+dri-devel@lfdr.de>; Fri, 10 Mar 2023 14:59:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B527510E2B0;
	Fri, 10 Mar 2023 13:59:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F75610E2B0;
 Fri, 10 Mar 2023 13:59:25 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 96ABA617B4;
 Fri, 10 Mar 2023 13:59:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71A58C4339B;
 Fri, 10 Mar 2023 13:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1678456764;
 bh=FiGWTSRi8jwQPxcgYZ80FI0oc0kERnP0xwXyK8GlclA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ewcl2s42hOBuS7bvmFdp9M4QLVoPUTv22xBkhIMe1osZc+2sX9RUgmYseIvDF/imY
 ey0s+aujCRLLFajRzBPMheckI5jSbxbYrOc6bCAhYFqGx/7VJIA2NLFjyD8Vpo7A/H
 EiKCis9c9qLa+P7ExoLkjhBwzm7mMynLk0abkl1M=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Subject: [PATCH 6.2 075/211] drm/i915: move a Kconfig symbol to unbreak the
 menu presentation
Date: Fri, 10 Mar 2023 14:37:35 +0100
Message-Id: <20230310133721.064604104@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230310133718.689332661@linuxfoundation.org>
References: <20230310133718.689332661@linuxfoundation.org>
User-Agent: quilt/0.67
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
Cc: Sasha Levin <sashal@kernel.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dri-devel@lists.freedesktop.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 intel-gfx@lists.freedesktop.org, Randy Dunlap <rdunlap@infradead.org>,
 patches@lists.linux.dev, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gvt-dev@lists.freedesktop.org, Christoph Hellwig <hch@lst.de>,
 Zhi Wang <zhi.a.wang@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Randy Dunlap <rdunlap@infradead.org>

[ Upstream commit 0b93efca3659f6d55ed31cff6722dca5f6e4d6e2 ]

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
Reviewed-by: Christoph Hellwig <hch@lst.de>
Acked-by: Zhenyu Wang <zhenyuw@linux.intel.com>
Signed-off-by: Zhenyu Wang <zhenyuw@linux.intel.com>
Link: http://patchwork.freedesktop.org/patch/msgid/20230215044533.4847-1-rdunlap@infradead.org
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/i915/Kconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/Kconfig b/drivers/gpu/drm/i915/Kconfig
index 3efce05d7b57c..3a6e176d77aa5 100644
--- a/drivers/gpu/drm/i915/Kconfig
+++ b/drivers/gpu/drm/i915/Kconfig
@@ -107,9 +107,6 @@ config DRM_I915_USERPTR
 
 	  If in doubt, say "Y".
 
-config DRM_I915_GVT
-	bool
-
 config DRM_I915_GVT_KVMGT
 	tristate "Enable KVM host support Intel GVT-g graphics virtualization"
 	depends on DRM_I915
@@ -160,3 +157,6 @@ menu "drm/i915 Unstable Evolution"
 	depends on DRM_I915
 	source "drivers/gpu/drm/i915/Kconfig.unstable"
 endmenu
+
+config DRM_I915_GVT
+	bool
-- 
2.39.2



