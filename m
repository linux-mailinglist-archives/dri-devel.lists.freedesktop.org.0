Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F6155426A
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 07:53:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CA89113888;
	Wed, 22 Jun 2022 05:52:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpbg.qq.com (smtpbg138.qq.com [106.55.201.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D73E010E0F2
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 14:04:14 +0000 (UTC)
X-QQ-mid: bizesmtp87t1655820118t1d9qvzk
Received: from ubuntu.localdomain ( [106.117.99.68])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 21 Jun 2022 22:01:54 +0800 (CST)
X-QQ-SSF: 0100000000700060B000D00A0000000
X-QQ-FEAT: ZHWZeLXy+8fquXre98dmHnwnqcZlbbq/MHyNm4/DjXuN4jYRiDxUhXrUdiM3b
 8XyattiSZBYFtSCxlDD7uc2MfIlVKyEPgiWZDh3kWO2fqSo2eHjd6uu7u4Yn1Cs6+Ez53+t
 0u2svRNIgS3TwD5XKzFPSK/Ygv0BjubJRT7TqIvVlps0InNjNcIdQeUUcazhs5B91bEMCiq
 PRRk5hx1YXtGWlRbm3/lglTJTvD237apRk2PRfD8DShDF3Tr2nuXwpAH05lv9/ryOP3DVaF
 MyQtxcO936M1ZSule0xThBORc+cYqheUk2/1DzVxJvcQxrHethzeCI7f9/hYLJpXYyz7stZ
 BoMC4VEjYsuhbRa8cfLUI2z440TjnLnMRPmeH1j
X-QQ-GoodBg: 0
From: Jiang Jian <jiangjian@cdjrlc.com>
To: linus.walleij@linaro.org,
	thierry.reding@gmail.com
Subject: [PATCH] drm/panel: nt35510: Remove duplicate 'the' in two places.
Date: Tue, 21 Jun 2022 22:01:51 +0800
Message-Id: <20220621140151.14404-1-jiangjian@cdjrlc.com>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybgspam:qybgspam10
X-Mailman-Approved-At: Wed, 22 Jun 2022 05:52:39 +0000
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jiang Jian <jiangjian@cdjrlc.com>,
 sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

file: ./drivers/gpu/drm/panel/panel-novatek-nt35510.c
line: 193,214,253
* amplification for the the step-up circuit:
changed to
* amplification for the step-up circuit:

Signed-off-by: Jiang Jian <jiangjian@cdjrlc.com>
---
 drivers/gpu/drm/panel/panel-novatek-nt35510.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-novatek-nt35510.c b/drivers/gpu/drm/panel/panel-novatek-nt35510.c
index 873cbd38e6d3..40ea41b0a5dd 100644
--- a/drivers/gpu/drm/panel/panel-novatek-nt35510.c
+++ b/drivers/gpu/drm/panel/panel-novatek-nt35510.c
@@ -190,7 +190,7 @@ struct nt35510_config {
 	 * 6 = Hsync x 2
 	 * 7 = Hsync x 4
 	 * bits 4..6 in the upper nibble controls BTP, the boosting
-	 * amplification for the the step-up circuit:
+	 * amplification for the step-up circuit:
 	 * 0 = Disable
 	 * 1 = 1.5 x VDDB
 	 * 2 = 1.66 x VDDB
@@ -211,7 +211,7 @@ struct nt35510_config {
 	 * bits 0..2 in the lower nibble controls NCK, the booster clock
 	 * frequency, the values are the same as for PCK in @bt1ctr.
 	 * bits 4..5 in the upper nibble controls BTN, the boosting
-	 * amplification for the the step-up circuit.
+	 * amplification for the step-up circuit.
 	 * 0 = Disable
 	 * 1 = -1.5 x VDDB
 	 * 2 = -2 x VDDB
@@ -250,7 +250,7 @@ struct nt35510_config {
 	 * bits 0..2 in the lower nibble controls LCK, the booster clock
 	 * frequency, the values are the same as for PCK in @bt1ctr.
 	 * bits 4..5 in the upper nibble controls BTL, the boosting
-	 * amplification for the the step-up circuit.
+	 * amplification for the step-up circuit.
 	 * 0 = AVEE + VCL
 	 * 1 = AVEE - AVDD
 	 * 2 = AVEE + VCL - AVDD
-- 
2.17.1

