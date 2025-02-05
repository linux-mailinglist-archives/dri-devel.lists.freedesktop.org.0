Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 981A0A2871B
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2025 10:55:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE08510E169;
	Wed,  5 Feb 2025 09:54:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="NaFlcSIQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m3277.qiye.163.com (mail-m3277.qiye.163.com
 [220.197.32.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13D1110E169
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Feb 2025 09:54:45 +0000 (UTC)
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id a3acc82b;
 Wed, 5 Feb 2025 17:54:40 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: neil.armstrong@linaro.org
Cc: dianders@chromium.org, quic_jesszhan@quicinc.com,
 dmitry.baryshkov@linaro.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v7] drm/edp-panel: Add LG Display panel model LP079QX1-SP0V
Date: Wed,  5 Feb 2025 17:47:34 +0800
Message-Id: <20250205094734.562992-1-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGRhPTVZMHxpJSUsYTB1IQ0hWFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
 hVSktLVUpCS0tZBg++
X-HM-Tid: 0a94d588826c03a3kunma3acc82b
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Mi46KQw4CDIUTwsKDVZDMTMt
 MhQaCQxVSlVKTEhDTE9CSUNJSkJJVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
 EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFKQkJONwY+
DKIM-Signature: a=rsa-sha256;
 b=NaFlcSIQEJ0KkmS2wQWLhCSRzngClarPNEkm8KraA20SbAJLJEfkg9z9b2x9zRZLApEEJRPPxazxYHmyhUoxSNw3nK2NkyFzcaAm4lOlBtzBBGvj+zSu2MKI1YMw/FnXtyXAsHTxdbBkQWFPGwsQdgdM2wMaFj51JHJxA7ucdpg=;
 s=default; c=relaxed/relaxed; d=rock-chips.com; v=1; 
 bh=FE/n9p9jwS6e5OeM3nh7F9rfxlhPgUmCeDZRa1xz3oY=;
 h=date:mime-version:subject:message-id:from;
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

The raw edid for LP079QX1-SP0V panel model is:

00 ff ff ff ff ff ff 00 16 83 00 00 00 00 00 00
04 17 01 00 a5 10 0c 78 06 ef 05 a3 54 4c 99 26
0f 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
01 01 01 01 01 01 ea 4e 00 4c 60 00 14 80 0c 10
84 00 78 a0 00 00 00 18 00 00 00 10 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 fe 00 4c
50 30 37 39 51 58 31 2d 53 50 30 56 00 00 00 fc
00 43 6f 6c 6f 72 20 4c 43 44 0a 20 20 20 00 3f

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>

---

Picked from:
https://patchwork.kernel.org/project/linux-rockchip/list/?series=927765

changes in v7:
- Add &panel_delay.disable and &panel_delay.powered_on_to_enable
  according to the datasheet
---
 drivers/gpu/drm/panel/panel-edp.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index f8511fe5fb0d..d20ed89b66b7 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1808,6 +1808,14 @@ static const struct panel_delay delay_200_150_e50 = {
 	.enable = 50,
 };
 
+static const struct panel_delay delay_50_500_e200_d200_po2e335 = {
+	.hpd_absent = 50,
+	.unprepare = 500,
+	.enable = 200,
+	.disable = 200,
+	.powered_on_to_enable = 335,
+};
+
 #define EDP_PANEL_ENTRY(vend_chr_0, vend_chr_1, vend_chr_2, product_id, _delay, _name) \
 { \
 	.ident = { \
@@ -1955,6 +1963,8 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('C', 'S', 'W', 0x1100, &delay_200_500_e80_d50, "MNB601LS1-1"),
 	EDP_PANEL_ENTRY('C', 'S', 'W', 0x1104, &delay_200_500_e50, "MNB601LS1-4"),
 
+	EDP_PANEL_ENTRY('E', 'T', 'C', 0x0000, &delay_50_500_e200_d200_po2e335, "LP079QX1-SP0V"),
+
 	EDP_PANEL_ENTRY('H', 'K', 'C', 0x2d51, &delay_200_500_e200, "Unknown"),
 	EDP_PANEL_ENTRY('H', 'K', 'C', 0x2d5b, &delay_200_500_e200, "MB116AN01"),
 	EDP_PANEL_ENTRY('H', 'K', 'C', 0x2d5c, &delay_200_500_e200, "MB116AN01-2"),
-- 
2.34.1

