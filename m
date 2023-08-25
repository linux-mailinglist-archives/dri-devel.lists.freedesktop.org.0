Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E4678871F
	for <lists+dri-devel@lfdr.de>; Fri, 25 Aug 2023 14:25:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CFDB10E148;
	Fri, 25 Aug 2023 12:25:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB8DD10E148
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 12:25:20 +0000 (UTC)
Received: from localhost.localdomain (unknown [171.76.83.99])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 0FE3A66003AF;
 Fri, 25 Aug 2023 13:25:12 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1692966319;
 bh=TpGrWMGej0KBkC2cyx/cKNP7OiA71j36BN5VYiAV3VQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lLD0NsYOtZxkf6mo7eBz2gg4lh/Hts/J+xwR0xidciO0+8t6vmsW6mU5cIWp0RorF
 uYA2DJ2b+S6KG+U2G011MxglW9/LR4+7ccKk4lh3PB2CABk4JjO4USHA+iqKAn2/Gp
 Ti7gBCddTdOeNo5uYyS8nnYqPguYXthsgD0UN19xFJqkJMd1fnvIRFCzUchjcydB1t
 eHeCpes/MnmqAp4bMjLCxLK+ZF+FCfEvcnWhxXV2E3c52uRnOPsJZI+cRLWVGsjR7A
 Wg+DISGx2Q8555JPHiV0I56CzPnwwbOAi+AQWZdq1kSCYYd1lRl+R2ZAxJPyF3ja4j
 nC8AITdtXb1iw==
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/6] drm: ci: virtio: update ci variables
Date: Fri, 25 Aug 2023 17:54:32 +0530
Message-Id: <20230825122435.316272-4-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230825122435.316272-1-vignesh.raman@collabora.com>
References: <20230825122435.316272-1-vignesh.raman@collabora.com>
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
Cc: emma@anholt.net, linux-doc@vger.kernel.org, david.heidelberg@collabora.com,
 linux-amlogic@lists.infradead.org, jbrunet@baylibre.com, robdclark@google.com,
 corbet@lwn.net, khilman@baylibre.com, sergi.blanch.torne@collabora.com,
 gustavo.padovan@collabora.com, linux-rockchip@lists.infradead.org,
 daniels@collabora.com, martin.blumenstingl@googlemail.com,
 robclark@freedesktop.org, helen.koike@collabora.com, anholt@google.com,
 linux-mediatek@lists.infradead.org, mripard@kernel.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com,
 neil.armstrong@linaro.org, guilherme.gallo@collabora.com,
 linux-kernel@vger.kernel.org, tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Update ci variables to fix the below error,
ERROR - Igt error: malloc(): corrupted top size
ERROR - Igt error: Received signal SIGABRT.
ERROR - Igt error: Stack trace:
ERROR - Igt error:  #0 [fatal_sig_handler+0x17b]

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---
 drivers/gpu/drm/ci/test.yml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
index 6473cddaa7a9..d85add39f425 100644
--- a/drivers/gpu/drm/ci/test.yml
+++ b/drivers/gpu/drm/ci/test.yml
@@ -316,8 +316,11 @@ virtio_gpu:none:
   stage: virtio-gpu
   variables:
     CROSVM_GALLIUM_DRIVER: llvmpipe
-    DRIVER_NAME: virtio_gpu
+    DRIVER_NAME: virtio
     GPU_VERSION: none
+    CROSVM_MEMORY: 12288
+    CROSVM_CPU: $FDO_CI_CONCURRENT
+    CROSVM_GPU_ARGS: "vulkan=true,gles=false,backend=virglrenderer,egl=true,surfaceless=true"
   extends:
     - .test-gl
   tags:
-- 
2.40.1

