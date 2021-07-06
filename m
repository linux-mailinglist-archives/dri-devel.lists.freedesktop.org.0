Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6C53BCECE
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jul 2021 13:26:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21FBE6E448;
	Tue,  6 Jul 2021 11:26:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 241406E444
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jul 2021 11:26:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 328EB61C75;
 Tue,  6 Jul 2021 11:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625570802;
 bh=MfhOHP9+n0LI8xfLnM2mS/CsEj2P2NLk0DnPZEVhPb8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ug/nZFY1QC4z396BQi9VMLRYcFvgHI3Hxeirw+8bphlzDn8ZS//6VCmapC3S4el8w
 5kL0U+PHSp/00HvEU47Qhn2gOYpXIJwxW938MLTxsa6lrooie1oD6VhvXvoE6KIHFz
 ZOmk8wV7DoE1+dbwy7TRNEVvLbeXd2u1Y5RaGeqpRA7A0tt0fmKaBmQIbEkxWUDybj
 vC2tNf58djuxEi4WigI3Miz5XDAa97L1xl0KolaGvY21HLwFtE0OGORDOepuVp1hRi
 05N6Tc/BVVRopXFI3Ot1coSQ1GNf5SF57uupiuG9MzACC/FpDnusxctIDH2RSkER06
 rgbrQ47cFqHtQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 02/55] drm/mxsfb: Don't select DRM_KMS_FB_HELPER
Date: Tue,  6 Jul 2021 07:25:45 -0400
Message-Id: <20210706112638.2065023-2-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210706112638.2065023-1-sashal@kernel.org>
References: <20210706112638.2065023-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thomas Zimmermann <tzimmermann@suse.de>

[ Upstream commit 13b29cc3a722c2c0bc9ab9f72f9047d55d08a2f9 ]

Selecting DRM_FBDEV_EMULATION will include the correct settings for
fbdev emulation. Drivers should not override this.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Stefan Agner <stefan@agner.ch>
Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Link: https://patchwork.freedesktop.org/patch/msgid/20210415110040.23525-3-tzimmermann@suse.de
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/mxsfb/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/mxsfb/Kconfig b/drivers/gpu/drm/mxsfb/Kconfig
index e9a8d90e6723..3ed6849d63cb 100644
--- a/drivers/gpu/drm/mxsfb/Kconfig
+++ b/drivers/gpu/drm/mxsfb/Kconfig
@@ -9,7 +9,6 @@ config DRM_MXSFB
 	depends on COMMON_CLK
 	select DRM_MXS
 	select DRM_KMS_HELPER
-	select DRM_KMS_FB_HELPER
 	select DRM_KMS_CMA_HELPER
 	select DRM_PANEL
 	help
-- 
2.30.2

