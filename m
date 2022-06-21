Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D402554264
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 07:52:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E27C113538;
	Wed, 22 Jun 2022 05:52:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpbg.qq.com (smtpbg138.qq.com [106.55.201.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2E2A10EFEA
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 13:31:24 +0000 (UTC)
X-QQ-mid: bizesmtp79t1655818272t2kqiz35
Received: from ubuntu.localdomain ( [106.117.99.68])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 21 Jun 2022 21:31:09 +0800 (CST)
X-QQ-SSF: 0100000000700050B000D00A0000000
X-QQ-FEAT: hOPADF7UwX6UhkRp296GqMQ5mOWCHugCJHmaYevsI0MlO0eU+rKDA7c6457hY
 9I2erBsA16xegyGcn6PVyHxiQZorUFP1wl6X9AxcJ9ukwsqpDlk6dPes9zoNZffDspquUDG
 oHfkA2vNSBVmGa/AKibWMUT7DCFr4foPJ2OHZiK92CzwCXdc5rdeNNPsBlpALD39PbWUtaX
 oEwWM3NaGMTUUBRWrrQGjmVnAcX1+2dTzZfsUVVZEO3PCOdekoBufY2ksffLukQrMm2BiUc
 BalZEmO1GKhx/DS/bcjuGuLPmDn5uybYs1Gu2dkS3L27EpFevRjfmawZpOMAO+r0yyyahJs
 j/AxtBaTKUm7TOMFu+/BIABUrnYTFWxiqciKXfs
X-QQ-GoodBg: 0
From: Jiang Jian <jiangjian@cdjrlc.com>
To: airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH] drm/pl111: drop unexpected word "the" in the comments
Date: Tue, 21 Jun 2022 21:31:07 +0800
Message-Id: <20220621133107.3752-1-jiangjian@cdjrlc.com>
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
Cc: Jiang Jian <jiangjian@cdjrlc.com>, dri-devel@lists.freedesktop.org,
 emma@anholt.net, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

there is an unexpected word "the" in the comments that need to be dropped

file: drivers/gpu/drm/pl111/pl111_display.c
line: 251
* Note that the the ARM hardware's format reader takes 'r' from
changed to
* Note that the the ARM hardware's format reader takes 'r' from

Signed-off-by: Jiang Jian <jiangjian@cdjrlc.com>
---
 drivers/gpu/drm/pl111/pl111_display.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/pl111/pl111_display.c b/drivers/gpu/drm/pl111/pl111_display.c
index 443e3b932322..2fdd3b968e87 100644
--- a/drivers/gpu/drm/pl111/pl111_display.c
+++ b/drivers/gpu/drm/pl111/pl111_display.c
@@ -248,7 +248,7 @@ static void pl111_display_enable(struct drm_simple_display_pipe *pipe,
 		cntl |= CNTL_ST_CDWID_24;
 
 	/*
-	 * Note that the the ARM hardware's format reader takes 'r' from
+	 * Note that the ARM hardware's format reader takes 'r' from
 	 * the low bit, while DRM formats list channels from high bit
 	 * to low bit as you read left to right. The ST Micro version of
 	 * the PL110 (LCDC) however uses the standard DRM format.
-- 
2.17.1

