Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2E7554275
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 07:53:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08B4E113896;
	Wed, 22 Jun 2022 05:53:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 451 seconds by postgrey-1.36 at gabe;
 Tue, 21 Jun 2022 13:14:40 UTC
Received: from smtpbg.qq.com (smtpbg139.qq.com [175.27.65.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5367010F7B0
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 13:14:40 +0000 (UTC)
X-QQ-mid: bizesmtp84t1655816757tz4bwr7w
Received: from ubuntu.localdomain ( [106.117.99.68])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 21 Jun 2022 21:05:52 +0800 (CST)
X-QQ-SSF: 0100000000700050B000B00A0000000
X-QQ-FEAT: ZHWZeLXy+8cVkqGqk70IZEdYsDCNTtFptYtfnC7SwFGnX0MxFWBt02UT3ufnU
 S4xgDrTaijqexc3isqvp40esGxJpnEYT4rbvzUE9h21iUo1hR8zPDGPCrDlc1Y+zl7UoYtp
 P2iS9NfE+3E+r6w2EmfH4mvQfRWuVtx28Jxd+digEdJHBsOrPhqkBLmX4ggARqun+r9XRnK
 G4nQoOoS1s79t5ehFcVkRx1NJOU9EJLxludL0wARFfKNcD+W2Gtfzw8VG0Zoi1WtVe58Vga
 MIJv2MeN0JI2o+CUsA7wyCmAMhm1N5W1vwMHpYzsV+ivoHqeRdi/zVJUJ2AihIazIQlRZQL
 QYpBIY3ETg3CcGdarwUJtB/+Cxy2g==
X-QQ-GoodBg: 0
From: Jiang Jian <jiangjian@cdjrlc.com>
To: airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH] drm/vc4: drop unexpected word "the" in the comments
Date: Tue, 21 Jun 2022 21:05:50 +0800
Message-Id: <20220621130550.126915-1-jiangjian@cdjrlc.com>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybgspam:qybgspam6
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
Cc: dri-devel@lists.freedesktop.org, Jiang Jian <jiangjian@cdjrlc.com>,
 emma@anholt.net, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

there is an unexpected word "the" in the comments that need to be dropped

file: drivers/gpu/drm/vc4/vc4_regs.h
line: 267
/* Set when the the downstream tries to read from the display FIFO
changed to
/* Set when the downstream tries to read from the display FIFO

Signed-off-by: Jiang Jian <jiangjian@cdjrlc.com>
---
 drivers/gpu/drm/vc4/vc4_regs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_regs.h b/drivers/gpu/drm/vc4/vc4_regs.h
index a2b5cbbbc1b0..f0290fad991d 100644
--- a/drivers/gpu/drm/vc4/vc4_regs.h
+++ b/drivers/gpu/drm/vc4/vc4_regs.h
@@ -264,7 +264,7 @@
  * output line.
  */
 # define SCALER_DISPSTAT_ESLINE(x)		BIT(10 + ((x) * 8))
-/* Set when the the downstream tries to read from the display FIFO
+/* Set when the downstream tries to read from the display FIFO
  * while it's empty.
  */
 # define SCALER_DISPSTAT_EUFLOW(x)		BIT(9 + ((x) * 8))
-- 
2.17.1

