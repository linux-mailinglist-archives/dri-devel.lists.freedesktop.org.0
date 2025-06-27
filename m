Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F66AEAE79
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jun 2025 07:34:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B72B210E969;
	Fri, 27 Jun 2025 05:34:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Tlc18/1G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3868510E966;
 Fri, 27 Jun 2025 05:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1751002427;
 bh=Ms2iiL6xHTka+KbRnWw4lch5UjQ/8n+zuH+88WExL5c=;
 h=From:To:Cc:Subject:Date:From;
 b=Tlc18/1GHDYGFI/whANjkPRjiKXbXElX917+cIdO5Zmav24KJxbb92ZQLvZ54tguq
 zoJU8VqWws8FhTMQnbxvUGfBn+gRe5nNVHnUfvq2kBqifLqbunZ3mwKoI6+ewgsSww
 lRw9imU+JK/5Akjod/g1FG3CdeiyDAvH7R3nrGeK95uiWzy58x0ykPE7dfr9euxsro
 2NPHwNKdzghpZzd+jsmIwEGxcVprhoT+rrl7vkt1/5isSz04ZP4RXBqRzW5uJvQn7X
 P4Rhs/xfQPPUma8KkUgQSZEH++Q+4k3hLUiXmusaQp46Q4J6wi8YnvVE4ED6lfV3OC
 Wm0lhja6Pwyog==
Received: from debian.. (unknown [171.76.82.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 4E3B217E04AA;
 Fri, 27 Jun 2025 07:33:43 +0200 (CEST)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com, daniel@fooishbar.org, helen.fornazier@gmail.com,
 airlied@gmail.com, simona.vetter@ffwll.ch, robdclark@gmail.com,
 robin.clark@oss.qualcomm.com, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, valentine.burley@collabora.com,
 lumag@kernel.org, dmitry.baryshkov@oss.qualcomm.com,
 quic_abhinavk@quicinc.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1] drm/ci: i915: cml: Fix the runner tag
Date: Fri, 27 Jun 2025 11:03:19 +0530
Message-ID: <20250627053321.283208-1-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.47.2
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The GitLab runner tags are case sensitive, and Flip-hatch's tag was
incorrectly lowercase. This prevented jobs from being picked up
by the runner. Fix the runner tag for Flip-hatch.

Based on https://gitlab.freedesktop.org/mesa/mesa/-/commit/03b480d3

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v1:
  - MR - https://gitlab.freedesktop.org/drm/msm/-/merge_requests/174
    This series depends on,
    https://lore.kernel.org/all/20250514050340.1418448-1-vignesh.raman@collabora.com/
    https://gitlab.freedesktop.org/drm/msm/-/merge_requests/169

---
 drivers/gpu/drm/ci/test.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
index 795a2631833b..01bb38842123 100644
--- a/drivers/gpu/drm/ci/test.yml
+++ b/drivers/gpu/drm/ci/test.yml
@@ -322,7 +322,7 @@ i915:cml:
   variables:
     DEVICE_TYPE: asus-C436FA-Flip-hatch
     GPU_VERSION: cml
-    RUNNER_TAG: mesa-ci-x86-64-lava-asus-C436FA-flip-hatch
+    RUNNER_TAG: mesa-ci-x86-64-lava-asus-C436FA-Flip-hatch
 
 i915:tgl:
   extends:
-- 
2.47.2

