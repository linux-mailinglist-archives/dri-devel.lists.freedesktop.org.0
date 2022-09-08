Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B355B2EA0
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 08:19:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAB5A10EBB6;
	Fri,  9 Sep 2022 06:19:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bg4.exmail.qq.com (bg4.exmail.qq.com [43.154.221.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64F2510E8E4;
 Thu,  8 Sep 2022 12:41:32 +0000 (UTC)
X-QQ-mid: bizesmtp76t1662640886tyx8gc2h
Received: from localhost.localdomain ( [182.148.14.0])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Thu, 08 Sep 2022 20:41:24 +0800 (CST)
X-QQ-SSF: 0100000000200090C000B00A0000000
X-QQ-FEAT: fs34Pe/+C2R6x+YrnEANM1wHRE+loiFRNiN8+WfRdXQ13eACKf+RQTz+8oF1P
 ZuXoBR9tWArDfjhqLlUBUEYBPd4sWIeWEXyB2+FWDIXB2OszexxXs5kLO81rFsILrMD3WLU
 O+rBTaJ+90IhSN6e/rxqUDMbJNZPeg3Nh35IEk8J8mbpYQE7iIX8BJVrYNhDUsr/dQa2ewk
 2ZkTOGVyhnI6I/+SMD4lC1r3ULg6855tDiXDOPwYQVt379wFLXtO+Q4SKeopoKmHYE9jy6w
 HSi6nNUXcCAka2snYdCP39PGJHlS2sQoXtRzHNki5+2jwFLCtw9wzwXOGgZIUDV5/3aG5wu
 dmqVSl9uzg8x6KTkwGoea6qqIvDfgBlhi0sdeSSuin41vlAa7CMme+iklxljA==
X-QQ-GoodBg: 0
From: wangjianli <wangjianli@cdjrlc.com>
To: airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH] dc/dce: fix repeated words in comments
Date: Thu,  8 Sep 2022 20:41:17 +0800
Message-Id: <20220908124117.21402-1-wangjianli@cdjrlc.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybglogicsvr:qybglogicsvr7
X-Mailman-Approved-At: Fri, 09 Sep 2022 06:19:19 +0000
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
Cc: wangjianli <wangjianli@cdjrlc.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Delete the redundant word 'in'.

Signed-off-by: wangjianli <wangjianli@cdjrlc.com>
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

