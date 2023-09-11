Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1360C79A761
	for <lists+dri-devel@lfdr.de>; Mon, 11 Sep 2023 12:42:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2764A10E00D;
	Mon, 11 Sep 2023 10:42:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BD6210E184
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Sep 2023 10:42:09 +0000 (UTC)
Received: from localhost.localdomain (unknown [171.76.82.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 527E46606F5E;
 Mon, 11 Sep 2023 11:42:01 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1694428927;
 bh=uOfKmnGqS1mdLmWpPUw+MA783YWewPk/pzRvEU2KZgw=;
 h=From:To:Cc:Subject:Date:From;
 b=aCG3wBPhRkqT6IY1WGsg6Gz1Uz0s4qR5o1gnSdwN+UQ2nnImc2gdhCjavnBRWfEyS
 WfEMwBSm3vw/o/ihz78mi/QYOOiT8e5Mbflp9BMNk40y+qIMZayPfKqZqB0QhL12Fi
 4GjdQb6kbda3VFxdI2lebCBDMN4967z6EhdPpofi+ikZjmNF9DF6SXMWoLZfJDBNPs
 FFs/RLizTKYuQrMw3ri/EYGZ49xcjJsZN32ikmz6ijAffLlDWS6VorSDccR1w9N5gI
 fa9rYtBxVAicWhJVm2ciAqp9vzqvX6zUzgp8rwG1k7wVD9cc5+8o26CxofGPtcuWOs
 L7pi6614WvGWQ==
From: Vignesh Raman <vignesh.raman@collabora.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH] arm64: defconfig: Enable DA9211 regulator
Date: Mon, 11 Sep 2023 16:11:39 +0530
Message-Id: <20230911104139.617448-1-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
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
Cc: peng.fan@nxp.com, emma@anholt.net, catalin.marinas@arm.com,
 dri-devel@lists.freedesktop.org, rafal@milecki.pl, will@kernel.org,
 quic_bjorande@quicinc.com, geert+renesas@glider.be, robdclark@google.com,
 david.heidelberg@collabora.com, sergi.blanch.torne@collabora.com,
 krzysztof.kozlowski@linaro.org, gustavo.padovan@collabora.com,
 nfraprado@collabora.com, daniels@collabora.com, arnd@arndb.de,
 mripard@kernel.org, helen.koike@collabora.com, anholt@google.com,
 linux-mediatek@lists.infradead.org, robclark@freedesktop.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 neil.armstrong@linaro.org, guilherme.gallo@collabora.com,
 linux-kernel@vger.kernel.org, konrad.dybcio@linaro.org,
 dmitry.baryshkov@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Mediatek mt8173 board fails to boot with DA9211 regulator disabled.
Enabling CONFIG_REGULATOR_DA9211=y in drm-ci fixes the issue.

So enable it in the defconfig since kernel-ci also requires it.

Suggested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 5315789f4868..8359899d291f 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -729,6 +729,7 @@ CONFIG_REGULATOR_AXP20X=y
 CONFIG_REGULATOR_BD718XX=y
 CONFIG_REGULATOR_BD9571MWV=y
 CONFIG_REGULATOR_CROS_EC=y
+CONFIG_REGULATOR_DA9211=m
 CONFIG_REGULATOR_FAN53555=y
 CONFIG_REGULATOR_GPIO=y
 CONFIG_REGULATOR_HI6421V530=y
-- 
2.40.1

