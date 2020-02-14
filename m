Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2391215E157
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 17:18:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A3646FAE8;
	Fri, 14 Feb 2020 16:18:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 544036FAE0
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2020 16:18:26 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 63CD024724;
 Fri, 14 Feb 2020 16:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581697106;
 bh=Bi9cwXXimFbWNix7aSP9cjB9eNvaXUe5lQELcxB3Lbg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GGYswJqslyv2AqRbC0U3h7mJgwfYYwGzlMqRu3yQle/lFt29P85e0GV8rE8OinAYo
 k+LX2PH4gtE8Yr0SDh0pNJgwSChSXTgLDF3AGwf2ft15MQVASf6c9YZ2YfqfM7kYfQ
 5Qly2rO+FX0wjiBdfgESGhvxmBt/hhSR0FdTcs4k=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 055/186] drm/gma500: remove set but not used
 variable 'channel_eq'
Date: Fri, 14 Feb 2020 11:15:04 -0500
Message-Id: <20200214161715.18113-55-sashal@kernel.org>
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

[ Upstream commit a7adabeece570b8a566dd592219410456676796e ]

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/gpu/drm/gma500/cdv_intel_dp.c: In function cdv_intel_dp_complete_link_train:
drivers/gpu/drm/gma500/cdv_intel_dp.c:1596:7: warning: variable channel_eq set but not used [-Wunused-but-set-variable]

It is never used, so remove it.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: zhengbin <zhengbin13@huawei.com>
Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Link: https://patchwork.freedesktop.org/patch/msgid/1573902268-117518-1-git-send-email-zhengbin13@huawei.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/gma500/cdv_intel_dp.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/gma500/cdv_intel_dp.c b/drivers/gpu/drm/gma500/cdv_intel_dp.c
index c52f9adf5e04c..af2cc63f3dcce 100644
--- a/drivers/gpu/drm/gma500/cdv_intel_dp.c
+++ b/drivers/gpu/drm/gma500/cdv_intel_dp.c
@@ -1593,7 +1593,6 @@ cdv_intel_dp_complete_link_train(struct gma_encoder *encoder)
 {
 	struct drm_device *dev = encoder->base.dev;
 	struct cdv_intel_dp *intel_dp = encoder->dev_priv;
-	bool channel_eq = false;
 	int tries, cr_tries;
 	u32 reg;
 	uint32_t DP = intel_dp->DP;
@@ -1601,7 +1600,6 @@ cdv_intel_dp_complete_link_train(struct gma_encoder *encoder)
 	/* channel equalization */
 	tries = 0;
 	cr_tries = 0;
-	channel_eq = false;
 
 	DRM_DEBUG_KMS("\n");
 		reg = DP | DP_LINK_TRAIN_PAT_2;
@@ -1647,7 +1645,6 @@ cdv_intel_dp_complete_link_train(struct gma_encoder *encoder)
 
 		if (cdv_intel_channel_eq_ok(encoder)) {
 			DRM_DEBUG_KMS("PT2 train is done\n");
-			channel_eq = true;
 			break;
 		}
 
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
