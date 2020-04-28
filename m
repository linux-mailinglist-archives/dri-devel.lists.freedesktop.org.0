Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB6A1BBE19
	for <lists+dri-devel@lfdr.de>; Tue, 28 Apr 2020 14:47:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C59046E41A;
	Tue, 28 Apr 2020 12:46:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FF0389E32
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Apr 2020 06:45:58 +0000 (UTC)
X-QQ-mid: bizesmtp19t1588056327tj8asepz
Received: from localhost.localdomain (unknown [210.242.163.205])
 by esmtp10.qq.com (ESMTP) with 
 id ; Tue, 28 Apr 2020 14:45:25 +0800 (CST)
X-QQ-SSF: 01400000002000K0SF10000A0000000
X-QQ-FEAT: BeVngaJjHKNREsd38tLYUW5E6j6WMHissM/1ue54eYCf8aHjE4UxLKGmn1Vod
 lmEUl2MIRuslkRXPkpYO2cDTpAplgnYG0kuwF2jMPbZshcSme4KCW02ELBphqD/gEei+OaQ
 Nq/h3VgipEqZDeBx4ebGggIcXaPk1yY9wto9J7Mnf8ZJSOD+XOOsvcWIp5CPpYtalgi2srX
 nHRwja9X8EWtLMAu+9/J31AtgzhHxRMyYkB4xs1dcU2IGq/03lCEYu1lejbqq/3Ev0pPXH2
 /VW9XUH+D0wF3swIKtIqp/VgO462aODaYw29LWpOvjtRFMXgTxPgEIbfaUwxLFt8ogbRuqm
 tG0v7p7KszR22JL4MPelrgyO4UewRe0ydL4Wfrt
X-QQ-GoodBg: 2
From: David Lu <david.lu@bitland.com.cn>
To: scott.chao@bitland.com.cn
Subject: [PATCH] drm/panel: boe-tv101wum-n16: fine tune clock
Date: Tue, 28 Apr 2020 14:45:21 +0800
Message-Id: <20200428064521.21511-1-david.lu@bitland.com.cn>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:bitland.com.cn:qybgforeign:qybgforeign6
X-QQ-Bgrelay: 1
X-Mailman-Approved-At: Tue, 28 Apr 2020 12:46:22 +0000
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
Cc: David Lu <david.lu@bitland.com.cn>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Thierry Reding <thierry.reding@gmail.com>, casper.chang@bitland.com.cn,
 Sam Ravnborg <sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

fix boe_tv105wum_nw0 display shift.

Signed-off-by: David Lu <david.lu@bitland.com.cn>
---
 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
index f89861c8598a..46fe1805c588 100644
--- a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
+++ b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
@@ -697,15 +697,15 @@ static const struct panel_desc auo_b101uan08_3_desc = {
 };
 
 static const struct drm_display_mode boe_tv105wum_nw0_default_mode = {
-	.clock = 159260,
+	.clock = 159916,
 	.hdisplay = 1200,
 	.hsync_start = 1200 + 80,
 	.hsync_end = 1200 + 80 + 24,
 	.htotal = 1200 + 80 + 24 + 60,
 	.vdisplay = 1920,
-	.vsync_start = 1920 + 10,
-	.vsync_end = 1920 + 10 + 2,
-	.vtotal = 1920 + 10 + 2 + 14,
+	.vsync_start = 1920 + 20,
+	.vsync_end = 1920 + 20 + 4,
+	.vtotal = 1920 + 20 + 4 + 10,
 	.vrefresh = 60,
 	.type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
 };
-- 
2.17.1



_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
