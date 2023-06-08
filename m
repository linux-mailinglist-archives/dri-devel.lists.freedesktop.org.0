Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 755C0727AFD
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jun 2023 11:15:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F96F10E583;
	Thu,  8 Jun 2023 09:15:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8A2810E59E
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jun 2023 09:15:32 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-30d181952a2so387025f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jun 2023 02:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686215730; x=1688807730;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3RySa5TKNiSsUD/90w92orRJEIYhEVSGdB85+66FnSA=;
 b=mpC92LVOdl/5WmkIGe0GW1UkaOKSkWpiVMnE7MxRMUzmduDVvakeDuJbXwzon9xx06
 h2kszxa6Q/zZCGN1TUcANr5Qo8yjUN66VlWcHG2bh7+swXyZ2dAuYAlJrqXwxLviZ+LQ
 nfSLtnAn2NBSeB8TNIQevkWKI/w17xILOPWIuB0I3CZVL2PaJZZO6yucWln3LEk9q1JJ
 xUYDFwhjSHn95HYqNysv1+b/FWgAiQaxikcffL2lgI1B9tCaagdxH/XBX0VOaHHmY5AY
 Y8RHdm6BjCVBK5TM5zqasqPXrvU7IUJm+sJjy76yOm/UsX5Ih7s2QtRYNDGe42gu9YmV
 OPQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686215730; x=1688807730;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3RySa5TKNiSsUD/90w92orRJEIYhEVSGdB85+66FnSA=;
 b=VJZ5QZ2KpEsQ9pvjn1Vsp0uaLDwfJO+YX8iAUeyoE22s62ovlW42AgpL2cBplejV6u
 hSmctSvK8DBoP9AQREtHJTeyAdCeKrEUVPY7LzCfn4JAlXXIaG3mexwdTGwosplqapPV
 wjEYYpi+Yh3JdVS3QuxIHLCNHidUCuqZpGRSukd6BS0ZM4FeDCWvG1poM5hessLqQSU7
 1BPuEiAxpQ2geYwGpE32paAPgytOzCfULVypr2x2ywjuBoPqCkG5NcKCtMb6lZlOxvqU
 PL1iUUwKTftpwgOy2XpgSI3WgP7cZswhrgsGIkObU1pz0S8ux7coELusMHXxDHkJZ4rE
 4CtQ==
X-Gm-Message-State: AC+VfDx88Z+OakEkdBvyipbT1EYoxkaFeIWkTsQ9g3f3V9dDnwAfmkS2
 HaMN/s+mSahxwk2rWRZDM5QE5Q==
X-Google-Smtp-Source: ACHHUZ5sHNLLbkCtJHL6hEVSUHaRtgooC4bpxt6UOn69Qv0TvZpAnODCn/1nIOo+cXufx6q67xuXpg==
X-Received: by 2002:a5d:4003:0:b0:30a:d747:b357 with SMTP id
 n3-20020a5d4003000000b0030ad747b357mr6375438wrp.56.1686215730511; 
 Thu, 08 Jun 2023 02:15:30 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 b14-20020adfe30e000000b00307a86a4bcesm974061wrj.35.2023.06.08.02.15.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jun 2023 02:15:29 -0700 (PDT)
Date: Thu, 8 Jun 2023 11:23:33 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v2] drm/msm/dpu: tidy up some error checking
Message-ID: <907e4b37-b9a2-4e14-bff2-ec2a0aa45965@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 kernel-janitors@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The "vsync_hz" variable is unsigned int so it can't be less
than zero.  The dpu_kms_get_clk_rate() function used to return a u64
but I previously changed it to return an unsigned long and zero on
error so it matches clk_get_rate().

Change the "vsync_hz" type to unsigned long as well and change the
error checking to check for zero instead of negatives.  This change
does not affect runtime at all beyond a minor adjustment to the debug
output.

Suggested-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
---
v2: update the debug output

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index 4f8c9187f76d..27a823c72c06 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -323,8 +323,8 @@ static void dpu_encoder_phys_cmd_tearcheck_config(
 		to_dpu_encoder_phys_cmd(phys_enc);
 	struct dpu_hw_tear_check tc_cfg = { 0 };
 	struct drm_display_mode *mode;
+	unsigned long vsync_hz;
 	bool tc_enable = true;
-	u32 vsync_hz;
 	struct dpu_kms *dpu_kms;
 
 	if (phys_enc->has_intf_te) {
@@ -359,9 +359,8 @@ static void dpu_encoder_phys_cmd_tearcheck_config(
 	 * frequency divided by the no. of rows (lines) in the LCDpanel.
 	 */
 	vsync_hz = dpu_kms_get_clk_rate(dpu_kms, "vsync");
-	if (vsync_hz <= 0) {
-		DPU_DEBUG_CMDENC(cmd_enc, "invalid - vsync_hz %u\n",
-				 vsync_hz);
+	if (!vsync_hz) {
+		DPU_DEBUG_CMDENC(cmd_enc, "no vsync clock\n");
 		return;
 	}
 
@@ -381,7 +380,7 @@ static void dpu_encoder_phys_cmd_tearcheck_config(
 	tc_cfg.rd_ptr_irq = mode->vdisplay + 1;
 
 	DPU_DEBUG_CMDENC(cmd_enc,
-		"tc vsync_clk_speed_hz %u vtotal %u vrefresh %u\n",
+		"tc vsync_clk_speed_hz %lu vtotal %u vrefresh %u\n",
 		vsync_hz, mode->vtotal, drm_mode_vrefresh(mode));
 	DPU_DEBUG_CMDENC(cmd_enc,
 		"tc enable %u start_pos %u rd_ptr_irq %u\n",
-- 
2.39.2

