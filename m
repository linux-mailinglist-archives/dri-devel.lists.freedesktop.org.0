Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE6C15E14D
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 17:18:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D92E46FAE0;
	Fri, 14 Feb 2020 16:18:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20D476FAD9
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2020 16:18:24 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 216CA246F8;
 Fri, 14 Feb 2020 16:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581697103;
 bh=TC/KpPcIPU52VDqpKV9ZMspVLevk1JgSEAKgRSDF0mk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LMRmRZAG2poapq5YXZGwELO1rMqc2X+qQnieQ3+g0T524NsvbF2KrrwiYuQfA5vf4
 lJNsalx11zV/FnfaKnWVE5re1nsiGxb6H4MLAAMEj/HnPr4FJZaMsrHP/1t6yRxoqt
 ja8Ssp9v/Zd484aWG89Zqwa13smIFJYc29utrP3I=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 053/186] drm/gma500: remove set but not used
 variable 'error'
Date: Fri, 14 Feb 2020 11:15:02 -0500
Message-Id: <20200214161715.18113-53-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200214161715.18113-1-sashal@kernel.org>
References: <20200214161715.18113-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: zhengbin <zhengbin13@huawei.com>, Hulk Robot <hulkci@huawei.com>,
 dri-devel@lists.freedesktop.org, Sasha Levin <sashal@kernel.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: zhengbin <zhengbin13@huawei.com>

[ Upstream commit a5eb29a9d2fc03d07af7d02f6c2e7ae1e6d985f9 ]

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/gpu/drm/gma500/psb_irq.c: In function psb_sgx_interrupt:
drivers/gpu/drm/gma500/psb_irq.c:210:6: warning: variable error set but not used [-Wunused-but-set-variable]

It is introduced by commit 64a4aff283ac ("drm/gma500:
Add support for SGX interrupts"), but never used, so remove it.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: zhengbin <zhengbin13@huawei.com>
Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Link: https://patchwork.freedesktop.org/patch/msgid/1573828027-122323-3-git-send-email-zhengbin13@huawei.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/gma500/psb_irq.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/gma500/psb_irq.c b/drivers/gpu/drm/gma500/psb_irq.c
index 78eb109028091..f75f199c84311 100644
--- a/drivers/gpu/drm/gma500/psb_irq.c
+++ b/drivers/gpu/drm/gma500/psb_irq.c
@@ -207,7 +207,6 @@ static void psb_sgx_interrupt(struct drm_device *dev, u32 stat_1, u32 stat_2)
 {
 	struct drm_psb_private *dev_priv = dev->dev_private;
 	u32 val, addr;
-	int error = false;
 
 	if (stat_1 & _PSB_CE_TWOD_COMPLETE)
 		val = PSB_RSGX32(PSB_CR_2D_BLIT_STATUS);
@@ -242,7 +241,6 @@ static void psb_sgx_interrupt(struct drm_device *dev, u32 stat_1, u32 stat_2)
 
 			DRM_ERROR("\tMMU failing address is 0x%08x.\n",
 				  (unsigned int)addr);
-			error = true;
 		}
 	}
 
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
