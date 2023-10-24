Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF3DC7D4438
	for <lists+dri-devel@lfdr.de>; Tue, 24 Oct 2023 02:47:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAE6A10E2A4;
	Tue, 24 Oct 2023 00:47:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A635C10E2A4
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Oct 2023 00:47:00 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2804:14d:e646:872b:1c98:7e30:3cb0:3153])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: koike)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 58AC966072BA;
 Tue, 24 Oct 2023 01:46:55 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1698108419;
 bh=yW5ERsRntlZETbVxSuA1fd5jzaL4jS6hL18Ul9AXKjs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Nrj5cNhPdPAg5Kkz3eUw1ShMHBdLevghOcSkS93znZ3mLK/q0RLrAcg3ubJtcSj3b
 oVUKpj6awJRg9PyKTcOf/Kr/klLdCbL1s30r4K8hUFZsZu1rzyf87S8CKsk1HXdEZ+
 uiA8/m2w2zgcBfInjldVbXAkEThZS21I2mn8Oh5kSRefY7yfp6UAOhKsZyISQzvPvf
 4qLz8v17v+CHGeW6J2E66S0rhsl3lDNfnPqZQAjja1XHFe9aAMQ2bLxvTfury57YQ1
 Pwc8NmAcQJ9pcPWaHsDRSrgk9iDYk832IYq3f39VBI2PPqXqOl0dFgaELSoXfHZ12Q
 SnwWczLhKuxLQ==
From: Helen Koike <helen.koike@collabora.com>
To: dri-devel@lists.freedesktop.org, Helen Koike <helen.koike@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v3 08/10] drm/ci: export kernel config
Date: Mon, 23 Oct 2023 21:45:23 -0300
Message-Id: <20231024004525.169002-9-helen.koike@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231024004525.169002-1-helen.koike@collabora.com>
References: <20231024004525.169002-1-helen.koike@collabora.com>
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
Cc: robdclark@chromium.org, daniels@collabora.com, vignesh.raman@collabora.com,
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
v3:
-no changes
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

