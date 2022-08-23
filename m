Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0648459F444
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 09:29:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 303E210E9CB;
	Wed, 24 Aug 2022 07:28:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bg5.exmail.qq.com (bg4.exmail.qq.com [43.154.221.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61803112552
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Aug 2022 12:21:33 +0000 (UTC)
X-QQ-mid: bizesmtp82t1661257285tvampdxi
Received: from localhost.localdomain ( [182.148.14.124])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 23 Aug 2022 20:21:24 +0800 (CST)
X-QQ-SSF: 01000000002000C0D000B00A0000000
X-QQ-FEAT: DQ0OCu3gog0eXFOOnpCwfQFj8W5pO1yvcYnu2yB4JEjFW0CpTRtb4p4mtINdw
 eRzERUAFTv7UB3UEcfhSh8ivr++4kI62EdT5P/cX8N4V/JkcroxZ1CsX7Pnkn6Ccg37ptx8
 Hy4aPKYuzmsHKM8g8tgGXvIriP3C1G8k3Idny93DtEOEG+ILZyHtmEBONjr4RnQIU8pyP1N
 Ab7bAvQXWhDt1Hly1zA0rOnDL6eSSDGCSI/13naVFjDdk6cWUJIz74T8v50J1JInJAd4u3h
 llYvT/ALwXZNDazh6y4I2cPFe7vVlY0yQrF/lGcDEawn4QJ0gshvjhO2xxHBeIpO98uqqAC
 bHsZlAAdE44FZ4NvSZpvdWx1VNSDucE8YOkZlCv6MYp+YpGr1DkQilj4TAmMTU/MWnyrcbT
X-QQ-GoodBg: 0
From: Jilin Yuan <yuanjilin@cdjrlc.com>
To: airlied@linux.ie,
	daniel@ffwll.ch,
	krzysztof.kozlowski@linaro.org
Subject: [PATCH] drm/exynos: fix repeated words in comments
Date: Tue, 23 Aug 2022 20:21:17 +0800
Message-Id: <20220823122117.15757-1-yuanjilin@cdjrlc.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybglogicsvr:qybglogicsvr4
X-Mailman-Approved-At: Wed, 24 Aug 2022 07:28:14 +0000
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
Cc: linux-samsung-soc@vger.kernel.org, Jilin Yuan <yuanjilin@cdjrlc.com>,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

 Delete the redundant word 'next'.

Signed-off-by: Jilin Yuan <yuanjilin@cdjrlc.com>
---
 drivers/gpu/drm/exynos/exynos_drm_g2d.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_g2d.c b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
index 471fd6c8135f..4f9edca66632 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_g2d.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
@@ -1195,7 +1195,7 @@ int exynos_g2d_set_cmdlist_ioctl(struct drm_device *drm_dev, void *data,
 	 * If don't clear SFR registers, the cmdlist is affected by register
 	 * values of previous cmdlist. G2D hw executes SFR clear command and
 	 * a next command at the same time then the next command is ignored and
-	 * is executed rightly from next next command, so needs a dummy command
+	 * is executed rightly from next command, so needs a dummy command
 	 * to next command of SFR clear command.
 	 */
 	cmdlist->data[cmdlist->last++] = G2D_SOFT_RESET;
-- 
2.36.1

