Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3034AAA237
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 00:56:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06B7910E594;
	Mon,  5 May 2025 22:56:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nXeMpFG3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10AE910E5A0
 for <dri-devel@lists.freedesktop.org>; Mon,  5 May 2025 22:56:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 52E585C5B2B;
 Mon,  5 May 2025 22:54:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10585C4CEED;
 Mon,  5 May 2025 22:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746485786;
 bh=/FZSzGvvXFvyjUQqlRnoJZJp2TxUajuFUp//+i3ALVs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nXeMpFG3R/HU2Mp0s/VUaUOPCMg4NSpLf6aRs0F5x3earTMfVRegMWtoK3Gf+fw+W
 HPoD1sCTI8st5VJ7r/ZgxbMYTvhrpXpImAzmgwhgi5a09LFrx5XZIr5Sklbt+CPNIc
 u2G8P/NpHc18EKTfjrBat034wXUFcYGsceLWpVhVVlmcVQH8ZsNoQhrGc6O2RZ8fUB
 kWh3CR3/h47qoOutI1AhTloqt5Q7ABBsROs0KD11xE07bcvKuxfHwg20rAIpfL9B09
 euz/2qo7LoAXb9brTb2lhMbyJEEaYWmtc/RCiyHatZ4qcoRh3dlCMKCVLvsnnAvPai
 v6XmgruSRUIGQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Douglas Anderson <dianders@chromium.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Sasha Levin <sashal@kernel.org>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.12 484/486] drm/panel-edp: Add Starry 116KHD024006
Date: Mon,  5 May 2025 18:39:20 -0400
Message-Id: <20250505223922.2682012-484-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505223922.2682012-1-sashal@kernel.org>
References: <20250505223922.2682012-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.26
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

From: Douglas Anderson <dianders@chromium.org>

[ Upstream commit 749b5b279e5636cdcef51e15d67b77162cca6caa ]

We have a few reports of sc7180-trogdor-pompom devices that have a
panel in them that IDs as STA 0x0004 and has the following raw EDID:

  00 ff ff ff ff ff ff 00  4e 81 04 00 00 00 00 00
  10 20 01 04 a5 1a 0e 78  0a dc dd 96 5b 5b 91 28
  1f 52 54 00 00 00 01 01  01 01 01 01 01 01 01 01
  01 01 01 01 01 01 8e 1c  56 a0 50 00 1e 30 28 20
  55 00 00 90 10 00 00 18  00 00 00 00 00 00 00 00
  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00
  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 fe
  00 31 31 36 4b 48 44 30  32 34 30 30 36 0a 00 e6

We've been unable to locate a datasheet for this panel and our partner
has not been responsive, but all Starry eDP datasheets that we can
find agree on the same timing (delay_100_500_e200) so it should be
safe to use that here instead of the super conservative timings. We'll
still go a little extra conservative and allow `hpd_absent` of 200
instead of 100 because that won't add any real-world delay in most
cases.

We'll associate the string from the EDID ("116KHD024006") with this
panel. Given that the ID is the suspicious value of 0x0004 it seems
likely that Starry doesn't always update their IDs but the string will
still work to differentiate if we ever need to in the future.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20250109142853.1.Ibcc3009933fd19507cc9c713ad0c99c7a9e4fe17@changeid
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/panel/panel-edp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 767e47a2b0c14..663af985d1b38 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1983,6 +1983,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('S', 'H', 'P', 0x153a, &delay_200_500_e50, "LQ140T1JH01"),
 	EDP_PANEL_ENTRY('S', 'H', 'P', 0x154c, &delay_200_500_p2e100, "LQ116M1JW10"),
 
+	EDP_PANEL_ENTRY('S', 'T', 'A', 0x0004, &delay_200_500_e200, "116KHD024006"),
 	EDP_PANEL_ENTRY('S', 'T', 'A', 0x0100, &delay_100_500_e200, "2081116HHD028001-51D"),
 
 	{ /* sentinal */ }
-- 
2.39.5

