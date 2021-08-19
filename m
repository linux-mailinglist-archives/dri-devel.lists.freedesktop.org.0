Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD033F1821
	for <lists+dri-devel@lfdr.de>; Thu, 19 Aug 2021 13:23:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B80A6E8B4;
	Thu, 19 Aug 2021 11:23:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A256B6E8B4
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 11:23:07 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id k8so8567107wrn.3
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 04:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=REhMgVT+6ZjXEXXRs/yP5w88X232Fgpi2cGGVzDaXxE=;
 b=FCtD7ltyWf3bpyNg5ZfOHC5FxFeGOP5a3gpqgR0ke4i/yDDEUenPouhSHdH9vqfOPN
 fhMIWL0W1o2h5w6n5EDUmO5hY0UXJiiAzrZK7aX4ZZGoWvWC6w7pW1vbY8KXLWkBwqLu
 HVE886JOmbB2Nl5cZRu6CP2iH11GrlP4H0UcGUTF0SRG/Xj7rfuLNHG1Q75qdF2iElT/
 c0+0X3K8YO3lhntVsRzhLiFCw0q/kwD22JneBZYLuO3VeF2UJI5Fm2hKQp6GqgZ1uyHl
 kQ7bM/IduESIr4fb5Rka8A1YUiOZ70ediQ5Sc3HBUL4DeNygbVWLh80qQMmvXEswoDdk
 0hEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=REhMgVT+6ZjXEXXRs/yP5w88X232Fgpi2cGGVzDaXxE=;
 b=Mb4Vpi9f2bWAXu/qn3xu32nKkg+SBwnTxyr8u4BTa2jLlcoL/npXJu4EqQTRvVCEvR
 0oDF1ol8r2pbvTKRnlan2Ji8weMvaVwRLnDCOPawtiG5Qg5MxRAPOg0OFDmnsRB2HMXP
 0sxQ0duL3oIKUatAtdUMFMr0Z5H4FMaNtXtsuehACqyM4APJRXC8wap1GeLyfk3dJbnN
 DsJ1uZzjwsLLr8MQ0deZdZHkWXE/aC2OCzwcv5ZG6DBTP4WKEXWi+vZEOTJ/6cBV+0Yk
 vXe2vDlFgEKNOo+2RwtnqHOTcFtk46kmGro+AWHE/j7x74Entmo7nW8zlG/xpn/Zelwz
 Lp1g==
X-Gm-Message-State: AOAM530U6zP3PdAmsa4fe5o8/vnOWia35ujvgppyLLXAE2ksm9t98LFS
 XXceO6NM8zf+1sutd1HhVCU=
X-Google-Smtp-Source: ABdhPJyaHdxhTqOlTcWI8sTuvcompSykYd56hFn/HeiPFc2a40cOfBUyvMjZRb5YBRBK/Z0BCwYQcg==
X-Received: by 2002:a5d:6b92:: with SMTP id n18mr3277419wrx.343.1629372186181; 
 Thu, 19 Aug 2021 04:23:06 -0700 (PDT)
Received: from localhost.localdomain (arl-84-90-178-246.netvisao.pt.
 [84.90.178.246])
 by smtp.gmail.com with ESMTPSA id r1sm2700388wrt.24.2021.08.19.04.23.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 04:23:05 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Emma Anholt <emma@anholt.net>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH v2 3/5] drm: v3d: correct reference to config ARCH_BRCMSTB
Date: Thu, 19 Aug 2021 13:22:51 +0200
Message-Id: <20210819112253.16484-4-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210819112253.16484-1-lukas.bulwahn@gmail.com>
References: <20210819112253.16484-1-lukas.bulwahn@gmail.com>
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

Commit 57692c94dcbe ("drm/v3d: Introduce a new DRM driver for Broadcom V3D
V3.x+") adds the config DRM_V3D, which depends on "ARCH_BCMSTB".

Although, a bit confusing: all Broadcom architectures in
./arch/arm/mach-bcm/Kconfig have the prefix "ARCH_BCM", except for
ARCH_BRCMSTB, i.e., the config for Broadcom BCM7XXX based boards.

So, correct the reference ARCH_BCMSTB to the intended ARCH_BRCMSTB.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
 drivers/gpu/drm/v3d/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/v3d/Kconfig b/drivers/gpu/drm/v3d/Kconfig
index 9a5c44606337..e973ec487484 100644
--- a/drivers/gpu/drm/v3d/Kconfig
+++ b/drivers/gpu/drm/v3d/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config DRM_V3D
 	tristate "Broadcom V3D 3.x and newer"
-	depends on ARCH_BCM || ARCH_BCMSTB || COMPILE_TEST
+	depends on ARCH_BCM || ARCH_BRCMSTB || COMPILE_TEST
 	depends on DRM
 	depends on COMMON_CLK
 	depends on MMU
-- 
2.26.2

