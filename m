Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB3F57FA16
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jul 2022 09:23:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 339C5112F82;
	Mon, 25 Jul 2022 07:23:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpbg.qq.com (biz-43-154-221-58.mail.qq.com [43.154.221.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73DA31123A3;
 Sun, 24 Jul 2022 12:53:52 +0000 (UTC)
X-QQ-mid: bizesmtp86t1658667219tiqqdwip
Received: from localhost.localdomain ( [171.223.97.251])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Sun, 24 Jul 2022 20:53:37 +0800 (CST)
X-QQ-SSF: 01000000002000F0U000B00A0000000
X-QQ-FEAT: RrZlkntZBflKcuY8rrgOtE6VDI+adS2tmGpOUI5TaU9rC6YaVQCXtBpTxBiDD
 w/Tu1RgqOoKHEX2qqZGRqWAw0LKbxyzhsG9oW+KkLDWgYINr33l572bzy+wU7mdQdzHeY8U
 qQe4xOhQ9A8iGRjzbufEFp01vo8aCb9pXyyviQfM79ZfpyvxGyNG+9w96D8SLtu6wicASts
 phknQuDRPu5AyKs7BrJvKlKvpasIkXiyYpo0b3Ve+SqxJ3/upzksCZkAb+moGdJIRti4aLD
 ROfi2F5VcHDiz71+BpqVkQwjZI/vzDr/JypXAVwQ9MWNE8+bRNSU2j/dYzTtXsVYOPMZhpH
 f5bGHj8orl0TIOEMOxBGANgMBDw8X5vsd6fwzkJmzFOHEpZs216OoB9gFI17Gy/vDtl7AOi
X-QQ-GoodBg: 0
From: Jason Wang <wangborong@cdjrlc.com>
To: quic_abhinavk@quicinc.com
Subject: [PATCH] drm/msm/dpu: Fix comment typo
Date: Mon, 25 Jul 2022 04:42:42 +0800
Message-Id: <20220724204242.4107-1-wangborong@cdjrlc.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybglogicsvr:qybglogicsvr6
X-Mailman-Approved-At: Mon, 25 Jul 2022 07:23:20 +0000
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
Cc: quic_kalyant@quicinc.com, freedreno@lists.freedesktop.org, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, vkoul@kernel.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 Jason Wang <wangborong@cdjrlc.com>, dmitry.baryshkov@linaro.org,
 quic_vpolimer@quicinc.com, sean@poorly.run, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The double `be' is duplicated in the comment, remove one.

Signed-off-by: Jason Wang <wangborong@cdjrlc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 71fe4c505f5b..38aa38ab1568 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -76,7 +76,7 @@ enum {
 
 /**
  * MDP TOP BLOCK features
- * @DPU_MDP_PANIC_PER_PIPE Panic configuration needs to be be done per pipe
+ * @DPU_MDP_PANIC_PER_PIPE Panic configuration needs to be done per pipe
  * @DPU_MDP_10BIT_SUPPORT, Chipset supports 10 bit pixel formats
  * @DPU_MDP_BWC,           MDSS HW supports Bandwidth compression.
  * @DPU_MDP_UBWC_1_0,      This chipsets supports Universal Bandwidth
-- 
2.35.1


