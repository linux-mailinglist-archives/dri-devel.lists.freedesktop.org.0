Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7214B49F546
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jan 2022 09:36:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48D67112388;
	Fri, 28 Jan 2022 08:36:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFC23112383;
 Fri, 28 Jan 2022 08:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643358982; x=1674894982;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/DxsEBKwfgW0rOPFfBesx2Q3+XXutgIiZyZTOdCGgx8=;
 b=DZbeGjME5SbU9mN6f4eT9l7GcPhzqtqm+fr3NeCJWuYq45BqDx8bu+0t
 Z6nrN4cmQR7Sld5ZQnKW6ArFQekF9mEQRd3MYnoR7G/D6d6c45A7h5YEk
 CDWrcBXgP4nPyzXHtFXQODVBjQCfS3Tz1NMJAX/i28gfUZ64GvyFhOtbY
 YzJned3LER6lMr0PpBl+7BSbqWST34FP3BcBKwhTc3SdqTsrEawnQDsl6
 Vi3u+hXoB1CenU8HI4oppC5gghnKoMLJu8/zDsykxKcjKWa0rH7VNmYGB
 bo8aX6KC9Uw369UE7+JhEKhyfnOcBJU5XiJL2cQhVOFEyorGD+QyDFdO2 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10240"; a="227056610"
X-IronPort-AV: E=Sophos;i="5.88,323,1635231600"; d="scan'208";a="227056610"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2022 00:36:18 -0800
X-IronPort-AV: E=Sophos;i="5.88,323,1635231600"; d="scan'208";a="581788769"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2022 00:36:17 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 13/14] Documentation: Refer to iosys-map instead of dma-buf-map
Date: Fri, 28 Jan 2022 00:36:25 -0800
Message-Id: <20220128083626.3012259-14-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20220128083626.3012259-1-lucas.demarchi@intel.com>
References: <20220128083626.3012259-1-lucas.demarchi@intel.com>
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
Cc: airlied@linux.ie, daniel.vetter@ffwll.ch, christian.koenig@amd.com,
 srinivas.kandagatla@linaro.org, tzimmermann@suse.de,
 gregkh@linuxfoundation.org, nouveau@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

dma-buf-map is being phased out in favor of the equivalent and renamed
interface: iosys-map. Use the new header in documentation.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 Documentation/driver-api/dma-buf.rst |  4 ++--
 Documentation/gpu/todo.rst           | 20 ++++++++++----------
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/Documentation/driver-api/dma-buf.rst b/Documentation/driver-api/dma-buf.rst
index 2cd7db82d9fe..ea1e81894d7c 100644
--- a/Documentation/driver-api/dma-buf.rst
+++ b/Documentation/driver-api/dma-buf.rst
@@ -131,10 +131,10 @@ Kernel Functions and Structures Reference
 Buffer Mapping Helpers
 ~~~~~~~~~~~~~~~~~~~~~~
 
-.. kernel-doc:: include/linux/dma-buf-map.h
+.. kernel-doc:: include/linux/iosys-map.h
    :doc: overview
 
-.. kernel-doc:: include/linux/dma-buf-map.h
+.. kernel-doc:: include/linux/iosys-map.h
    :internal:
 
 Reservation Objects
diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index 1b2372ef4131..ee842606e883 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -222,7 +222,7 @@ Convert drivers to use drm_fbdev_generic_setup()
 Most drivers can use drm_fbdev_generic_setup(). Driver have to implement
 atomic modesetting and GEM vmap support. Historically, generic fbdev emulation
 expected the framebuffer in system memory or system-like memory. By employing
-struct dma_buf_map, drivers with frambuffers in I/O memory can be supported
+struct iosys_map, drivers with frambuffers in I/O memory can be supported
 as well.
 
 Contact: Maintainer of the driver you plan to convert
@@ -234,7 +234,7 @@ Reimplement functions in drm_fbdev_fb_ops without fbdev
 
 A number of callback functions in drm_fbdev_fb_ops could benefit from
 being rewritten without dependencies on the fbdev module. Some of the
-helpers could further benefit from using struct dma_buf_map instead of
+helpers could further benefit from using struct iosys_map instead of
 raw pointers.
 
 Contact: Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter
@@ -434,19 +434,19 @@ Contact: Emil Velikov, respective driver maintainers
 
 Level: Intermediate
 
-Use struct dma_buf_map throughout codebase
-------------------------------------------
+Use struct iosys_map throughout codebase
+----------------------------------------
 
-Pointers to shared device memory are stored in struct dma_buf_map. Each
+Pointers to shared device memory are stored in struct iosys_map. Each
 instance knows whether it refers to system or I/O memory. Most of the DRM-wide
-interface have been converted to use struct dma_buf_map, but implementations
+interface have been converted to use struct iosys_map, but implementations
 often still use raw pointers.
 
-The task is to use struct dma_buf_map where it makes sense.
+The task is to use struct iosys_map where it makes sense.
 
-* Memory managers should use struct dma_buf_map for dma-buf-imported buffers.
-* TTM might benefit from using struct dma_buf_map internally.
-* Framebuffer copying and blitting helpers should operate on struct dma_buf_map.
+* Memory managers should use struct iosys_map for dma-buf-imported buffers.
+* TTM might benefit from using struct iosys_map internally.
+* Framebuffer copying and blitting helpers should operate on struct iosys_map.
 
 Contact: Thomas Zimmermann <tzimmermann@suse.de>, Christian König, Daniel Vetter
 
-- 
2.35.0

