Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 034DC78871D
	for <lists+dri-devel@lfdr.de>; Fri, 25 Aug 2023 14:25:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EC4210E13E;
	Fri, 25 Aug 2023 12:25:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B69BC10E13E
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 12:25:06 +0000 (UTC)
Received: from localhost.localdomain (unknown [171.76.83.99])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 0DE23660319E;
 Fri, 25 Aug 2023 13:24:58 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1692966305;
 bh=x4lq+tbR066pnVQGeJjEJAxiYr3tkgjX1Xjly0l74rI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Wi+smrECNXlcnUOBI7muZ/8Nm8As7l8y6nvRVAqrMSZgU8xWkdOzhvNJ1TL2rVRhV
 ablXvIcmLPu01xDlOLUujge/fRUGoYyfbaMnP8OzGLVRWu4uNvbLUi72C+BIEC7IHn
 SmwjvI3b0cokzv+aOFSSS6t5++foVeu6fhuBewNDxrwj4wOouQAoCbczYw+GL9faM2
 dsdEDuy32afZqIehx19Ir2PfDFDxoJlt5EBHg/5d3C5GcxgRq/PqPk4RHTMU8viPzL
 f9zUHPHN10hz9hxR3tDpz682Sgh+7HwXDx7f9dLpOIJ5csTx1kiIlNDT0j2nPAtHqF
 4dnfo7WtXwSdA==
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/6] drm: ci: igt_runner: remove todo
Date: Fri, 25 Aug 2023 17:54:30 +0530
Message-Id: <20230825122435.316272-2-vignesh.raman@collabora.com>
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

/sys/kernel/debug/dri/*/state exist for every atomic KMS driver.
We do not test non-atomic drivers, so remove the todo.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---
 drivers/gpu/drm/ci/igt_runner.sh | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/ci/igt_runner.sh b/drivers/gpu/drm/ci/igt_runner.sh
index 2bb759165063..5bf130ac57c9 100755
--- a/drivers/gpu/drm/ci/igt_runner.sh
+++ b/drivers/gpu/drm/ci/igt_runner.sh
@@ -15,7 +15,6 @@ cat /sys/kernel/debug/device_component/*
 '
 
 # Dump drm state to confirm that kernel was able to find a connected display:
-# TODO this path might not exist for all drivers.. maybe run modetest instead?
 set +e
 cat /sys/kernel/debug/dri/*/state
 set -e
-- 
2.40.1

