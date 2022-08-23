Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8002359F448
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 09:29:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C115C112045;
	Wed, 24 Aug 2022 07:28:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bg5.exmail.qq.com (bg4.exmail.qq.com [43.154.221.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E92310FFE0;
 Tue, 23 Aug 2022 11:51:20 +0000 (UTC)
X-QQ-mid: bizesmtp77t1661255468tk4a19c0
Received: from localhost.localdomain ( [182.148.14.124])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 23 Aug 2022 19:51:06 +0800 (CST)
X-QQ-SSF: 01000000002000C0D000B00A0000000
X-QQ-FEAT: DQ0OCu3gog2DpWggEOov9LWZw/zsVocqtlNvD3/KPuL43CWfdojDzP43r+azY
 659Ez1TAChQGnyVD++OW24EVOzEWGIJp6tASNFv8EEEKeUHttUShZ2mSUukTsoHgaG+8AZp
 Cjf9KmdwVlHszv++e1tND9fg0/RQwXpw2ij0jcMbMLMK59EuC8Do82B1GxYCJkDUCE1k8C9
 AxfTDnsPYpAXayeFVcCcClgmkqjZ8d40Jt8qRJ1QDtlcpMwtlayWkuJRhJArjo9UNP41llW
 MsSFTTiM8o1v/aRUZLDZVFTik44kEOScVNswQMdODH6agwdPZ5KyTVD8RHEYliHBsqIlFw2
 z38dkGbdjWtXW8VCGo05O2ldU3YFVOgVt9W97gdz1HNS1R4NHA=
X-QQ-GoodBg: 0
From: Jilin Yuan <yuanjilin@cdjrlc.com>
To: robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org, airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH] disp/dpu1: fix repeated words in comments
Date: Tue, 23 Aug 2022 19:51:00 +0800
Message-Id: <20220823115100.44060-1-yuanjilin@cdjrlc.com>
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
Cc: linux-arm-msm@vger.kernel.org, Jilin Yuan <yuanjilin@cdjrlc.com>,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

 Delete the redundant word 'is'.

Signed-off-by: Jilin Yuan <yuanjilin@cdjrlc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index bce47647d891..59ca7d70a652 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1169,7 +1169,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 
 	/*
 	 * max crtc width is equal to the max mixer width * 2 and max height is
-	 * is 4K
+	 * 4K
 	 */
 	dev->mode_config.max_width =
 			dpu_kms->catalog->caps->max_mixer_width * 2;
-- 
2.36.1

