Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1040C819EAE
	for <lists+dri-devel@lfdr.de>; Wed, 20 Dec 2023 13:11:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8170910E56A;
	Wed, 20 Dec 2023 12:11:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAA3E10E56A
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Dec 2023 12:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1703074296;
 bh=eg8kRP21u0YH5k5O19nEfLv8NisszrC7pvFEeLYJCJ0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=5SfnqrTw+tvO5xIpont2yJMof2vw6iSFAAHIA2y8BfYXeGNz8sjAa0GmNmhukoWLi
 hNp9SYqu4uQU5LQhGauqBmtMB1HOUhUuJFd0YYmdCsF2w2umiEwy6v8Cd3jpPDmbwX
 HDyumfA5bVqVVPDqsnJm4MUVUTCa7eKT1Up5nIJuyKyfdVcghTcUzaBvdm9BTXa/Y2
 P5voO6QIP8mqmQJfe9U73OeJ9mR0Ng78D70+RHLvCssvyrkSpiyIq6rkCJAvrLYBsT
 reaxeA9I0Ng0Y3UF3u56lDA6c5YZRGQweybDBLMT4LJaqwHHeH2HnGvrUNxGWKqLs7
 /IRTg+eF3OcCg==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 81B2F3781FED;
 Wed, 20 Dec 2023 12:11:31 +0000 (UTC)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: helen.koike@collabora.com, airlied@gmail.com, daniel@ffwll.ch,
 daniels@collabora.com
Subject: [PATCH v1 1/8] drm/ci: arm64.config: Enable
 CONFIG_DRM_ANALOGIX_ANX7625
Date: Wed, 20 Dec 2023 17:41:03 +0530
Message-Id: <20231220121110.1441160-2-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231220121110.1441160-1-vignesh.raman@collabora.com>
References: <20231220121110.1441160-1-vignesh.raman@collabora.com>
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
Cc: emma@anholt.net, linux-rockchip@lists.infradead.org,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 david.heidelberg@collabora.com, robdclark@gmail.com,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Enable CONFIG_DRM_ANALOGIX_ANX7625 in the arm64 defconfig to get
display driver probed on the mt8183-kukui-jacuzzi-juniper machine.

arch/arm64/configs/defconfig has CONFIG_DRM_ANALOGIX_ANX7625=m,
but drm-ci don't have initrd with modules, so add
CONFIG_DRM_ANALOGIX_ANX7625=y in CI arm64 config.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---
 drivers/gpu/drm/ci/arm64.config | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/ci/arm64.config b/drivers/gpu/drm/ci/arm64.config
index 8dbce9919a57..37d23fd7a367 100644
--- a/drivers/gpu/drm/ci/arm64.config
+++ b/drivers/gpu/drm/ci/arm64.config
@@ -187,6 +187,7 @@ CONFIG_MTK_DEVAPC=y
 CONFIG_PWM_MTK_DISP=y
 CONFIG_MTK_CMDQ=y
 CONFIG_REGULATOR_DA9211=y
+CONFIG_DRM_ANALOGIX_ANX7625=y
 
 # For nouveau.  Note that DRM must be a module so that it's loaded after NFS is up to provide the firmware.
 CONFIG_ARCH_TEGRA=y
-- 
2.40.1

