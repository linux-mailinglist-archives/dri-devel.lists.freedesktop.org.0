Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F296D7D070C
	for <lists+dri-devel@lfdr.de>; Fri, 20 Oct 2023 05:42:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1543410E577;
	Fri, 20 Oct 2023 03:42:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 573AC10E57F
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Oct 2023 03:42:38 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2804:14d:e646:872b:8302:9b9b:d59b:1681])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: koike)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 48082660734D;
 Fri, 20 Oct 2023 04:42:32 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1697773357;
 bh=V6K2VUBWjxN+LHfNphCVJYj4rZzevGT8L0HKOHvoHPY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ASHX5+/qCm5G4u6XsXnRtFmUmYl2z9ifG4QKoWdcAcFdE43NHpZJuohWRdlKTLx7w
 2d24IxFG0Mt8lZddJrW0oPko2CHHvpWy7LzAtbZH4Fax7pfYL/xvCMCUSVRva0BUpS
 WOPzdSMvGik6MosSYFETPkX8R54EwtvTGx1WpuznXm8bz7X501IjUh+YoQU3Y/X+Wc
 skjsmTw+cp7Qb5npSFtml+yTFVI1xAy9enRszBTnwLymj11+nkzLOTPVp4fTAtiFIn
 NuLwZ7695IPSph8vwbdjjMFYYMO4qcsrdLW0EpvrWPb0ncSpXy39OWWL6g1479yplc
 BzRGz3a94Dthg==
From: Helen Koike <helen.koike@collabora.com>
To: dri-devel@lists.freedesktop.org, Helen Koike <helen.koike@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 7/9] drm/ci: export kernel config
Date: Fri, 20 Oct 2023 00:41:22 -0300
Message-Id: <20231020034124.136295-8-helen.koike@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231020034124.136295-1-helen.koike@collabora.com>
References: <20231020034124.136295-1-helen.koike@collabora.com>
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
Cc: robdclark@chromium.org, vignesh.raman@collabora.com,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 david.heidelberg@collabora.com, dmitry.baryshkov@linaro.org,
 quic_jesszhan@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Export the resultant kernel config, making it easier to verify if the
resultant config was correctly generated.

Suggested-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Helen Koike <helen.koike@collabora.com>
Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: David Heidelberg <david.heidelberg@collabora.com>

---

v2:
- no changes
---
 drivers/gpu/drm/ci/build.sh       | 1 +
 drivers/gpu/drm/ci/image-tags.yml | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ci/build.sh b/drivers/gpu/drm/ci/build.sh
index e3908f4d71cb..e5c5dcedd108 100644
--- a/drivers/gpu/drm/ci/build.sh
+++ b/drivers/gpu/drm/ci/build.sh
@@ -153,6 +153,7 @@ mkdir -p artifacts/install/lib
 mv install/* artifacts/install/.
 rm -rf artifacts/install/modules
 ln -s common artifacts/install/ci-common
+cp .config artifacts/${CI_JOB_NAME}_config
 
 for image in ${KERNEL_IMAGE_NAME}; do
     cp /lava-files/$image artifacts/install/.
diff --git a/drivers/gpu/drm/ci/image-tags.yml b/drivers/gpu/drm/ci/image-tags.yml
index 7dd3f995f8a2..7ab4f2514da8 100644
--- a/drivers/gpu/drm/ci/image-tags.yml
+++ b/drivers/gpu/drm/ci/image-tags.yml
@@ -4,7 +4,7 @@ variables:
    DEBIAN_BASE_TAG: "${CONTAINER_TAG}"
 
    DEBIAN_X86_64_BUILD_IMAGE_PATH: "debian/x86_64_build"
-   DEBIAN_BUILD_TAG: "2023-10-08-igt"
+   DEBIAN_BUILD_TAG: "2023-10-08-config"
 
    KERNEL_ROOTFS_TAG: "2023-10-06-amd"
 
-- 
2.39.2

