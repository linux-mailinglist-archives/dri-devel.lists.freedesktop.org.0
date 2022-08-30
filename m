Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3375D5A6967
	for <lists+dri-devel@lfdr.de>; Tue, 30 Aug 2022 19:18:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E5FB10E22E;
	Tue, 30 Aug 2022 17:18:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DCE510E22E
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Aug 2022 17:18:36 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C8D2F6172F;
 Tue, 30 Aug 2022 17:18:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19438C433B5;
 Tue, 30 Aug 2022 17:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661879915;
 bh=rsBZ9omJFlXHM0Xnd/vfXJa6R/hMrsdX9ze4QNMC77g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SzL9Y6BKyT76d1+fdRAWVThk1hNkIpLXZ5nbjrZlRYUhP1hLnRJYtchsjHDrigI5Z
 pxWtqogInrp2H7Q7Sn9cm7dJNLV3Em+E7JLcQKc5DNKOmTKihKcKkGHlAdyGZO1nHF
 U61bsQijNvO2yS58zM1gJLnJILDXs5Vk0cGB+SyejCGi3HcvV0fK09AZxqGnmmS79r
 43XnW1IrJSstb4zK9JKYNCJOvo4YQjOQXBzDOsMezK/Fb8k9tSVezfw7lKXlainYlC
 KB4Xu0IsGz2HFm2i5g+brWOa3dhSebZkRVSNtFEcSzLCUamRp3agTATRybZxqS+58z
 0sJh9z/4lZKKA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.19 05/33] drm/vc4: hdmi: Depends on CONFIG_PM
Date: Tue, 30 Aug 2022 13:17:56 -0400
Message-Id: <20220830171825.580603-5-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220830171825.580603-1-sashal@kernel.org>
References: <20220830171825.580603-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Stefan Wahren <stefan.wahren@i2se.com>, Sasha Levin <sashal@kernel.org>,
 emma@anholt.net, airlied@linux.ie, dri-devel@lists.freedesktop.org,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Maxime Ripard <maxime@cerno.tech>

[ Upstream commit 72e2329e7c9bbe15e7a813670497ec9c6f919af3 ]

We already depend on runtime PM to get the power domains and clocks for
most of the devices supported by the vc4 driver, so let's just select it
to make sure it's there.

Link: https://lore.kernel.org/r/20220629123510.1915022-38-maxime@cerno.tech
Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Tested-by: Stefan Wahren <stefan.wahren@i2se.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
(cherry picked from commit f1bc386b319e93e56453ae27e9e83817bb1f6f95)
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/vc4/Kconfig    | 1 +
 drivers/gpu/drm/vc4/vc4_hdmi.c | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/Kconfig b/drivers/gpu/drm/vc4/Kconfig
index 061be9a6619df..b0f3117102ca5 100644
--- a/drivers/gpu/drm/vc4/Kconfig
+++ b/drivers/gpu/drm/vc4/Kconfig
@@ -8,6 +8,7 @@ config DRM_VC4
 	depends on DRM
 	depends on SND && SND_SOC
 	depends on COMMON_CLK
+	depends on PM
 	select DRM_DISPLAY_HDMI_HELPER
 	select DRM_DISPLAY_HELPER
 	select DRM_KMS_HELPER
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 23ff6aa5e8f60..c5702f22fe1a8 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -2875,7 +2875,7 @@ static int vc5_hdmi_init_resources(struct vc4_hdmi *vc4_hdmi)
 	return 0;
 }
 
-static int __maybe_unused vc4_hdmi_runtime_suspend(struct device *dev)
+static int vc4_hdmi_runtime_suspend(struct device *dev)
 {
 	struct vc4_hdmi *vc4_hdmi = dev_get_drvdata(dev);
 
-- 
2.35.1

