Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B7A15E042
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 17:13:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2FBB6FAA0;
	Fri, 14 Feb 2020 16:13:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2C066FA97
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2020 16:13:10 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E1A99246BE;
 Fri, 14 Feb 2020 16:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581696790;
 bh=+jis4DE3IIgqFeCmKzwXpOLiKwa1li8NWsKZs+Gltg4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=q4xQsPmrVvoaMpcM5LTtuKMwGgOWzBUXEi0gt8y7l6KUekBL+8fQ/O2Lp6XSDV5W9
 jrY012KBYh5G79y2ACWCTJ6pik/eOf6f3xbXzii8WYLiV4fMFEzamLyitqui1tuvRE
 ILmTU37CbPmiR0OxS+SP1oUER4okQxjRX7ws2W24=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 065/252] drm/gma500: remove set but not used
 variable 'is_hdmi', 'is_crt'
Date: Fri, 14 Feb 2020 11:08:40 -0500
Message-Id: <20200214161147.15842-65-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200214161147.15842-1-sashal@kernel.org>
References: <20200214161147.15842-1-sashal@kernel.org>
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

[ Upstream commit 834c43a97f341d319aa7b74099bbce2c4e75bc72 ]

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/gpu/drm/gma500/cdv_intel_display.c: In function cdv_intel_crtc_mode_set:
drivers/gpu/drm/gma500/cdv_intel_display.c:594:7: warning: variable is_hdmi set but not used [-Wunused-but-set-variable]
drivers/gpu/drm/gma500/cdv_intel_display.c: In function cdv_intel_crtc_mode_set:
drivers/gpu/drm/gma500/cdv_intel_display.c:593:7: warning: variable is_crt set but not used [-Wunused-but-set-variable]

They are not used since commit acd7ef927e06 ("gma500:
Update the Cedarview clock handling")

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: zhengbin <zhengbin13@huawei.com>
Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Link: https://patchwork.freedesktop.org/patch/msgid/1573828027-122323-4-git-send-email-zhengbin13@huawei.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/gma500/cdv_intel_display.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/gma500/cdv_intel_display.c b/drivers/gpu/drm/gma500/cdv_intel_display.c
index 17db4b4749d5a..9854fdd7c51cf 100644
--- a/drivers/gpu/drm/gma500/cdv_intel_display.c
+++ b/drivers/gpu/drm/gma500/cdv_intel_display.c
@@ -590,8 +590,8 @@ static int cdv_intel_crtc_mode_set(struct drm_crtc *crtc,
 	struct gma_clock_t clock;
 	u32 dpll = 0, dspcntr, pipeconf;
 	bool ok;
-	bool is_crt = false, is_lvds = false, is_tv = false;
-	bool is_hdmi = false, is_dp = false;
+	bool is_lvds = false, is_tv = false;
+	bool is_dp = false;
 	struct drm_mode_config *mode_config = &dev->mode_config;
 	struct drm_connector *connector;
 	const struct gma_limit_t *limit;
@@ -615,10 +615,7 @@ static int cdv_intel_crtc_mode_set(struct drm_crtc *crtc,
 			is_tv = true;
 			break;
 		case INTEL_OUTPUT_ANALOG:
-			is_crt = true;
-			break;
 		case INTEL_OUTPUT_HDMI:
-			is_hdmi = true;
 			break;
 		case INTEL_OUTPUT_DISPLAYPORT:
 			is_dp = true;
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
