Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2FE791B3F
	for <lists+dri-devel@lfdr.de>; Mon,  4 Sep 2023 18:16:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7903310E391;
	Mon,  4 Sep 2023 16:16:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DF9610E391
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Sep 2023 16:16:09 +0000 (UTC)
Received: from localhost.localdomain (unknown [171.76.82.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 866776607239;
 Mon,  4 Sep 2023 17:16:03 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1693844168;
 bh=8FGqnMwKWzExttutUydgPKrWeHHmGACCAPVXjKbEUGs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Cx6l/QTA5Ypgzbgh3Gxi2LZIdYN8TE5DzBO+iDvwfUOrN2EBswnnWFAalGUm2/Zj2
 2BQaHBNk5PdpYn89YSjFKKBm+Ijnbx0EpfkGUpLsGWU75OY7kRvaIL6uVlKx7XC4iZ
 qSGmIn5p76Qn/hxFN//sMmDpGXrdUVOyl0TgjPcfBb1NrmF29JwwPU1syfalD3Ovb8
 KuXBZbTcBfKjlOruKk5BgbhHzI6DbWClCYA13BlrSR+J5XkJ29afOF8PJ7Cd7rDVEi
 G0j04SHqmsNmLlCTUBGjuLQhlPCmq3YE4siIfR7Hnt9RtXFNdFDZK+eSnGq7jncTD4
 bXOTxbGzB7oiw==
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/7] drm: ci: igt_runner: remove todo
Date: Mon,  4 Sep 2023 21:45:10 +0530
Message-Id: <20230904161516.66751-2-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230904161516.66751-1-vignesh.raman@collabora.com>
References: <20230904161516.66751-1-vignesh.raman@collabora.com>
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
Cc: mripard@kernel.org, robdclark@google.com, daniels@collabora.com,
 emma@anholt.net, gustavo.padovan@collabora.com, linux-arm-msm@vger.kernel.org,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 robclark@freedesktop.org, linux-kernel@vger.kernel.org,
 david.heidelberg@collabora.com, helen.koike@collabora.com, anholt@google.com,
 linux-mediatek@lists.infradead.org, virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

/sys/kernel/debug/dri/*/state exist for every atomic KMS driver.
We do not test non-atomic drivers, so remove the todo.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v2:
  - No changes
  
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

