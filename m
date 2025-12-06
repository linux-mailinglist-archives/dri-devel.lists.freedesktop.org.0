Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59FA7CAAB5C
	for <lists+dri-devel@lfdr.de>; Sat, 06 Dec 2025 18:46:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C24A10E07F;
	Sat,  6 Dec 2025 17:46:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=packett.cool header.i=@packett.cool header.b="AngKPNf6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 503 seconds by postgrey-1.36 at gabe;
 Sat, 06 Dec 2025 17:46:35 UTC
Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com
 [91.218.175.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EB0110E07F
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Dec 2025 17:46:35 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
 s=key1; t=1765042688;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=JgXlU8nghNrfhSPRoG5tQ1X6YeBmJudZf6qiifnnsX8=;
 b=AngKPNf6JfWX8BiY9VuiP/HxKXBBntPICuNQZdAInIwjM6A+9h8A78SuB2JUGLVsFazG3T
 koyq+agDKsY2UP5oACDkQ5zFJ+3W/bBMRM6iUIPahniut5NxHv9VojzxbBcjytHpS4d1uR
 rdblNmX/OQHwqYQOeTRZJm8LEnJ8P7yA1Y6xBrpOGgd17fMtH1GHyduBLC1T+jjg3fVjas
 4rI0eajB0VCr6TpW6bQzW4KPjx5K8s34f0+xDpJ3k2ea96roKCBWNgbrI3474VxcfmzJoI
 Z35087/Yv09trMJBunE7/aGNOld3XYoYaZ2I3d366+K8Tad8E7LN+RLp46k9Pw==
From: Val Packett <val@packett.cool>
To: Douglas Anderson <dianders@chromium.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Val Packett <val@packett.cool>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/panel-edp: Add AUO B140QAX01.H panel
Date: Sat,  6 Dec 2025 14:37:28 -0300
Message-ID: <20251206173739.2222940-1-val@packett.cool>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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

A 14-inch 2560x1600 60Hz matte touch panel, found on a Dell Latitude 7455
laptop (second-source with BOE NE14QDM), according to online sources it's
also found on the Latitude 7440 and some ASUS models.

Raw EDID dump:

00 ff ff ff ff ff ff 00 06 af a4 0b 00 00 00 00
00 20 01 04 a5 1e 13 78 03 ad f5 a8 54 47 9c 24
0e 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
01 01 01 01 01 01 f0 68 00 a0 a0 40 2e 60 30 20
35 00 2d bc 10 00 00 1a f3 53 00 a0 a0 40 2e 60
30 20 35 00 2d bc 10 00 00 1a 00 00 00 fe 00 36
39 52 31 57 80 42 31 34 30 51 41 58 00 00 00 00
00 02 41 21 a8 00 01 00 00 1a 41 0a 20 20 00 a1

Don't have datasheet access, but the same timing as for other panels from
the same manufacturer works fine.

Signed-off-by: Val Packett <val@packett.cool>
---
 drivers/gpu/drm/panel/panel-edp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 415b894890ad..b71cef842ea7 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1913,6 +1913,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0xb7a9, &delay_200_500_e50, "B140HAK03.3"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0xc4b4, &delay_200_500_e50, "B116XAT04.1"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0xc9a8, &delay_200_500_e50, "B140QAN08.H"),
+	EDP_PANEL_ENTRY('A', 'U', 'O', 0x0ba4, &delay_200_500_e50, "B140QAX01.H"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0xcdba, &delay_200_500_e50, "B140UAX01.2"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0xd497, &delay_200_500_e50, "B120XAN01.0"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0xf390, &delay_200_500_e50, "B140XTN07.7"),
-- 
2.51.2

