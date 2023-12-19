Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE4C818B0E
	for <lists+dri-devel@lfdr.de>; Tue, 19 Dec 2023 16:20:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F0C710E02A;
	Tue, 19 Dec 2023 15:20:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF95F10E02A
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Dec 2023 15:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702999202; x=1734535202;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WPUC94aeFkxTDRSMtq6zQgY3UiFBP1Ldi/bE9BU6ccY=;
 b=dWc1B/Pj5ruGbfQM+cY7yKIRGUdYZtnc+JbOccY7DD9w6qLOE3wbVoQy
 6wyK4XxmO+vfnVquNgltXPjO4vMDGmaZGaLcSmGXcoOJ7N5hoL3uF6OKB
 TH1v2ZqqZJIIMcLMT2sUA1e1H4DmcOPNTlQNQk57xLxiX26OGcASI4Al7
 ELI/L9m7NWOhmA7vHP4Bm5kqgW390AFcCqTOvFMCcxMl2sTH3HTF/FqKH
 A4oZgQtxYQQWyJS5S9wecrAcptqaepDDEj2MWCzZGyab4ZBSijhTCoeks
 Fyz/S685AYSy4CO65LcWVxMwhusTaAFlqAqu055oVZ9xbWCKuC1ECLNeu A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="2890858"
X-IronPort-AV: E=Sophos;i="6.04,288,1695711600"; 
   d="scan'208";a="2890858"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2023 07:20:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="810266239"
X-IronPort-AV: E=Sophos;i="6.04,288,1695711600"; d="scan'208";a="810266239"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga001.jf.intel.com with ESMTP; 19 Dec 2023 07:19:58 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id E2C2623A; Tue, 19 Dec 2023 17:19:56 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/1] drm/virtio: Spelling fixes
Date: Tue, 19 Dec 2023 17:19:55 +0200
Message-ID: <20231219151955.2477488-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1.gbec44491f096
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
Cc: Maxime Ripard <mripard@kernel.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@redhat.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

While making a spelling mistake myself for `git grep kvalloc`
I found that the only file has such a typo. Fix it and update
to the standard de facto of how we refer to the functions.
Also spell usr-out as user-out, it seems this driver uses its
own terminology nobody else can decypher, make it more readable.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpu/drm/virtio/virtgpu_submit.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_submit.c b/drivers/gpu/drm/virtio/virtgpu_submit.c
index 5c514946bbad..1c7c7f61a222 100644
--- a/drivers/gpu/drm/virtio/virtgpu_submit.c
+++ b/drivers/gpu/drm/virtio/virtgpu_submit.c
@@ -99,8 +99,8 @@ virtio_gpu_parse_deps(struct virtio_gpu_submit *submit)
 		return 0;
 
 	/*
-	 * kvalloc at first tries to allocate memory using kmalloc and
-	 * falls back to vmalloc only on failure. It also uses __GFP_NOWARN
+	 * kvmalloc() at first tries to allocate memory using kmalloc() and
+	 * falls back to vmalloc() only on failure. It also uses __GFP_NOWARN
 	 * internally for allocations larger than a page size, preventing
 	 * storm of KMSG warnings.
 	 */
@@ -529,7 +529,7 @@ int virtio_gpu_execbuffer_ioctl(struct drm_device *dev, void *data,
 	virtio_gpu_submit(&submit);
 
 	/*
-	 * Set up usr-out data after submitting the job to optimize
+	 * Set up user-out data after submitting the job to optimize
 	 * the job submission path.
 	 */
 	virtio_gpu_install_out_fence_fd(&submit);
-- 
2.43.0.rc1.1.gbec44491f096

