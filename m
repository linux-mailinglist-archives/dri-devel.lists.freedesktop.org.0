Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 724295AFAF7
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 06:11:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA3ED10E0E0;
	Wed,  7 Sep 2022 04:11:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bg4.exmail.qq.com (bg4.exmail.qq.com [43.155.65.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5711A10E109;
 Wed,  7 Sep 2022 04:11:16 +0000 (UTC)
X-QQ-mid: bizesmtp81t1662523866tngcpo18
Received: from localhost.localdomain ( [182.148.14.0])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Wed, 07 Sep 2022 12:11:04 +0800 (CST)
X-QQ-SSF: 01000000000000D0F000000A0000000
X-QQ-FEAT: bQsUcYFpAAYXdJRqwB80RHYaBxZP/Q/TG+x7ozmXciylMDFbSbygBd7c4qNHd
 iXGZIUiievK8azdmEVoz00pm7uV/hKUlFROQSHbxNQcJYSgVN7tFAid2Tr9eH37OSjG4y8R
 ZHtOMLA9b5Ds7DPocbpLHEAIrYa8s+Z/ZUFcmOEYGFagX6vtZRT7ptSmdtBMw0F64qdnuPc
 45fg15gYbOMkyI6qsfm1+lOdVObeRnup9ckLA9DYZpt8MKPf/iSy47I136Np15+WwY8VEDi
 r6zqjGLezaOGMyPvsg4iJw2ekF+4y9qZVEt/w8jGE9WHvWFkvRJ4bkVQrv02ZBId2dVqjSN
 uIP9X+p8EaJ8z5B5shdWBMBKjvIXCL8emTDfNSOzpcvJhh1gxzZvIJfHuCyCw==
X-QQ-GoodBg: 0
From: Jilin Yuan <yuanjilin@cdjrlc.com>
To: airlied@linux.ie,
	daniel@ffwll.ch,
	Charlene.Liu@amd.com
Subject: [PATCH] drm/amd/display: fix repeated words in comments
Date: Wed,  7 Sep 2022 12:10:58 +0800
Message-Id: <20220907041058.935-1-yuanjilin@cdjrlc.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybglogicsvr:qybglogicsvr4
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
Cc: Jilin Yuan <yuanjilin@cdjrlc.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Delete the redundant word 'in'.

Signed-off-by: Jilin Yuan <yuanjilin@cdjrlc.com>
---
 drivers/gpu/drm/amd/display/dc/dce/dce_audio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dce/dce_audio.c b/drivers/gpu/drm/amd/display/dc/dce/dce_audio.c
index bdb6bac8dd97..c94a966c6612 100644
--- a/drivers/gpu/drm/amd/display/dc/dce/dce_audio.c
+++ b/drivers/gpu/drm/amd/display/dc/dce/dce_audio.c
@@ -300,7 +300,7 @@ static void set_high_bit_rate_capable(
 	AZ_REG_WRITE(AZALIA_F0_CODEC_PIN_CONTROL_RESPONSE_HBR, value);
 }
 
-/* set video latency in in ms/2+1 */
+/* set video latency in ms/2+1 */
 static void set_video_latency(
 	struct audio *audio,
 	int latency_in_ms)
-- 
2.36.1

