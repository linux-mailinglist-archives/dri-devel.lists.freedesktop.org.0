Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8ABB0A11F
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 12:54:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A692B10E957;
	Fri, 18 Jul 2025 10:54:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Sjynf/u+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9404C10E962;
 Fri, 18 Jul 2025 10:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1752836063;
 bh=k7CAZOnVX3McTF9rA6EaJjI3tqH2gxRiw0k5BhFfu+k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Sjynf/u+D9SjkEYOCSDJrxhLi8UWPgyv13WkmDPUqBdHSgA888JhJLdg2oy4ObMt9
 KYovrzdWiDYVeLa6c/50qDU4SmZUkqP4hdwseHAWYqUiWl9/DLSMkdg/eHjqBXq3V0
 76icLc08zdr3iH8cQQnP3A3TndrdxnqI6Cmnqdkyh8Y5BRBOLwHTMH0bacvHfMhe6u
 IMFfDQ7HPmWFgWTe9AEcT9oOMstEHna+guZKMatkjZkjXJJq9RA01Zr/bWQ7IOaSeV
 dwZJdK6I2M1V9A4pWQ7OUaRAJxUnSC/SMxapeKOdL1pFzZPKZ3IBVSK0VJoykx9kOd
 sz9xgKfJK5huw==
Received: from debian.. (unknown [171.76.80.183])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id C2D9217E156C;
 Fri, 18 Jul 2025 12:54:19 +0200 (CEST)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com, helen.fornazier@gmail.com, airlied@gmail.com,
 simona.vetter@ffwll.ch, robdclark@gmail.com, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, valentine.burley@collabora.com,
 lumag@kernel.org, linux-mediatek@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org,
 amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, virtualization@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/7] drm/ci: disable apq8016 and apq8096 bare-metal jobs
Date: Fri, 18 Jul 2025 16:23:53 +0530
Message-ID: <20250718105407.32878-2-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250718105407.32878-1-vignesh.raman@collabora.com>
References: <20250718105407.32878-1-vignesh.raman@collabora.com>
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

These devices are being moved to LAVA. The jobs will be enabled and the
job definitions will be updated once the move is complete.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---
 drivers/gpu/drm/ci/test.yml | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
index 81147e86bfd0..53d19ffaaf61 100644
--- a/drivers/gpu/drm/ci/test.yml
+++ b/drivers/gpu/drm/ci/test.yml
@@ -148,7 +148,9 @@ msm:sc7180-trogdor-kingoftown:
     GPU_VERSION: ${DEVICE_TYPE}
     RUNNER_TAG: mesa-ci-x86-64-lava-sc7180-trogdor-kingoftown
 
-msm:apq8016:
+# FIXME: Disable the bare-metal jobs. These devices are being moved to LAVA.
+# Once the move is complete, update the job definitions accordingly.
+.msm:apq8016:
   extends:
     - .baremetal-igt-arm64
   stage: msm
@@ -165,7 +167,7 @@ msm:apq8016:
   script:
     - ./install/bare-metal/fastboot.sh || exit $?
 
-msm:apq8096:
+.msm:apq8096:
   extends:
     - .baremetal-igt-arm64
   stage: msm
-- 
2.47.2

