Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 578AC557758
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jun 2022 12:03:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5DBF112779;
	Thu, 23 Jun 2022 10:03:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpbg.qq.com (smtpbg136.qq.com [106.55.201.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27D6010ECFC
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 10:03:14 +0000 (UTC)
X-QQ-mid: bizesmtp78t1655978521tbfj69q5
Received: from ubuntu.localdomain ( [106.117.99.68])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Thu, 23 Jun 2022 18:01:57 +0800 (CST)
X-QQ-SSF: 01000000008000B0C000B00A0000000
X-QQ-FEAT: hOPADF7UwX4iFB/7g9JVub6CWGg5wL+Zwsx+9FUj+tJK97Ei0f+gQUuzavP5y
 3z7R5vr7gKFIJejzAb+9iYRtSW4d8HJqBkBq4/II4Z5l9Otnt7GJRHqN9VKsayV8SDIBxjM
 6BTqf+lUZ9Jt+Fy5r0VSv0TXD41wTiHW71aZO8rEDypAkFQBr3KMmQ3KLCId6AgcHfrEpkl
 4PXCloDmexVIaHmRIcsyxZdvZEQLxHLFyWbMkGFO2RO32t6ai5zhNpJE+LQmxyRa6vFAXk0
 95pT9AW5s+8h4sZPSpXHi3l8j6+URymXTd2HkbOJh+/fmZvTwYMrsoyTKYPVraZNON0+bXt
 H9dmLnRsmoUWJXrClklHt8oQGZCoA==
X-QQ-GoodBg: 0
From: Jiang Jian <jiangjian@cdjrlc.com>
To: patrik.r.jakobsson@gmail.com,
	airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH] drm/gma500: drop unexpected word 'for' in comments
Date: Thu, 23 Jun 2022 18:01:55 +0800
Message-Id: <20220623100155.24806-1-jiangjian@cdjrlc.com>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybgspam:qybgspam7
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
Cc: Jiang Jian <jiangjian@cdjrlc.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

there is an unexpected word 'for' in the comments that need to be dropped

file - drivers/gpu/drm/gma500/oaktrail_crtc.c
line - 312

/* Wait for for the pipe disable to take effect. */

changed to:

/* Wait for the pipe disable to take effect. */

Signed-off-by: Jiang Jian <jiangjian@cdjrlc.com>
---
 drivers/gpu/drm/gma500/oaktrail_crtc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/gma500/oaktrail_crtc.c b/drivers/gpu/drm/gma500/oaktrail_crtc.c
index 22398d34853a..407ce948bf68 100644
--- a/drivers/gpu/drm/gma500/oaktrail_crtc.c
+++ b/drivers/gpu/drm/gma500/oaktrail_crtc.c
@@ -309,7 +309,7 @@ static void oaktrail_crtc_dpms(struct drm_crtc *crtc, int mode)
 						   temp & ~PIPEACONF_ENABLE, i);
 				REG_READ_WITH_AUX(map->conf, i);
 			}
-			/* Wait for for the pipe disable to take effect. */
+			/* Wait for the pipe disable to take effect. */
 			gma_wait_for_vblank(dev);
 
 			temp = REG_READ_WITH_AUX(map->dpll, i);
-- 
2.17.1

