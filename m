Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C13959FE02
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 17:13:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E714B14A70E;
	Wed, 24 Aug 2022 15:13:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bg5.exmail.qq.com (bg4.exmail.qq.com [43.155.65.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0176D10E19E
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Aug 2022 13:01:00 +0000 (UTC)
X-QQ-mid: bizesmtp62t1661346053ti9axgbk
Received: from localhost.localdomain ( [182.148.14.124])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Wed, 24 Aug 2022 21:00:52 +0800 (CST)
X-QQ-SSF: 01000000002000C0E000B00A0000000
X-QQ-FEAT: znfcQSa1hKYHO1gX45sTNKeH1GcIr48myKvElCaFdXX4Yh+Ntz1JV2w8Srvvm
 1P5NupsHSAJGFT09LT9HZeS/pXp8CrMRoRepDVw3fm36Rw2xvAr8QxKM8S1FW0h1dSqVZ6r
 vZvgA6ukXFjh/BFBDLfPLAaRjnr+ZqkwioOd7EML2MNIoFw9k/K9cA3gbQT97r7uTNkMAkU
 swVyI2LcoYr9g/7vMOTkXbZ6Fa0N4ckqpibNc9fKYAYiVYmXexnsbVQqUk5W3CpykZ1YlTR
 Y/WX5fzHqurshg/0diUe44gcXa3OzPpAx+wk8u/7YziJm2bjED1+q8rSmKWqRW7wgq3x2kz
 Hd55sjfQJ9PjyDQclTlySh90gvm+F0PqjDWu0CLx+4vlQ/KXkI=
X-QQ-GoodBg: 0
From: Jilin Yuan <yuanjilin@cdjrlc.com>
To: airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH] drm/vc4: fix repeated words in comments
Date: Wed, 24 Aug 2022 21:00:45 +0800
Message-Id: <20220824130045.32211-1-yuanjilin@cdjrlc.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybglogicsvr:qybglogicsvr4
X-Mailman-Approved-At: Wed, 24 Aug 2022 15:12:28 +0000
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
Cc: Jilin Yuan <yuanjilin@cdjrlc.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

 Delete the redundant word 'the'.

Signed-off-by: Jilin Yuan <yuanjilin@cdjrlc.com>
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
2.36.1

