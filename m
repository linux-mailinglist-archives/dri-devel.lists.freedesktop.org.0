Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE229693517
	for <lists+dri-devel@lfdr.de>; Sun, 12 Feb 2023 00:14:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CBB410E3F4;
	Sat, 11 Feb 2023 23:13:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC6A310E3F2
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Feb 2023 23:13:40 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id d40so7341673eda.8
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Feb 2023 15:13:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qe8rVCHG/b1Lvwa2nv85/t2Q0g5G/UidRqSlfbx2gLg=;
 b=jQ0uVyZyuYYaQSo0S0Nxi+se8xg/Mp0cHDyx7xOH36xXTnv5fIekXoQsqvvKN4//id
 jHZdMZ+KS5UgZcmy/DMr+bhVAIo8GToa63ugewX20SzJ122mDlXUJ12VqyKxZhHsqAqm
 ishpZdwtCNVZOO11uGOpXbBZTXxiwQkHUfKkUHDTSzSkea6vpdN9YElcIAvbitO7C0ED
 J+1e40h6db9cn+zRONMkc6mWehjwbAef2/UmQImMLNop/r8T9YhvY+set83QdznfJkoy
 XTOUzAB1oKM0nIrIonyB4OP5yuf5Xil/Ms0/CYkIH5dEupJ74vg4ISSUW9wnGmCGtTA7
 VQSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qe8rVCHG/b1Lvwa2nv85/t2Q0g5G/UidRqSlfbx2gLg=;
 b=atS9OhBV/YqOB3qrfSZadJdyVhSiwZjKls7nlPAJikZ/zRP3G14j/Yt7v9OP1X+iEn
 ugxGJ9OK5FVmsWLlSmmvup8llrAXPzAqE+zNqRT8z3Gj4hSwOI7do8st6dCbbDJXI9kk
 /IReBL9CGaptPM4RQ3rsDEgY3TnJ0ehXPqTDANom841i05CFF8dm2MYSbh6TQ/vzGa4v
 JIydTHBaJbAI7WIkz8C0QDXQYgSjZ/UuGslewFadboKHxBz4Y2w2+wfmoDDjgZYOcLpg
 DQ+FhgFO0SjGdilt9AbT12b6i0Q4MF9UaLJbfIVU6aFHuf+UE0p6x8bW/sae9EKFv//V
 KHsg==
X-Gm-Message-State: AO0yUKWUVNRBY6Ah+krqWJXMS2TYx+RIzfmSqX5W4hXbmBpFPKpCmt9g
 QJ7iDEjGtmNF9rGlpxrzApMx0w==
X-Google-Smtp-Source: AK7set/K/wj+ZcPJ2JI+tM9o5aEEQG+uPXHygDitJEWGEfr3mH8pfIrdj46Jx2Y7XxkXuj8+Nc/KBQ==
X-Received: by 2002:a50:f68e:0:b0:4ac:b2cb:14d4 with SMTP id
 d14-20020a50f68e000000b004acb2cb14d4mr4924178edn.15.1676157219451; 
 Sat, 11 Feb 2023 15:13:39 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 k20-20020a1709061c1400b00871390a3b74sm4517149ejg.177.2023.02.11.15.13.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Feb 2023 15:13:39 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v2 32/50] drm/msm/dpu: duplicate sc7180 catalog entries
Date: Sun, 12 Feb 2023 01:12:41 +0200
Message-Id: <20230211231259.1308718-33-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230211231259.1308718-1-dmitry.baryshkov@linaro.org>
References: <20230211231259.1308718-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Duplicate some of sc7180 catalog entries to remove dependencies between
DPU major generations.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
index 8977878890f1..3117bb358117 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
@@ -82,6 +82,11 @@ static const struct dpu_lm_cfg sc7280_lm[] = {
 		&sc7180_lm_sblk, PINGPONG_3, LM_2, 0),
 };
 
+static const struct dpu_dspp_cfg sc7280_dspp[] = {
+	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
+		 &sc7180_dspp_sblk),
+};
+
 static const struct dpu_pingpong_cfg sc7280_pp[] = {
 	PP_BLK("pingpong_0", PINGPONG_0, 0x59000, 0, sc7280_pp_sblk, -1, -1),
 	PP_BLK("pingpong_1", PINGPONG_1, 0x6a000, 0, sc7280_pp_sblk, -1, -1),
@@ -132,8 +137,8 @@ static const struct dpu_mdss_cfg sc7280_dpu_cfg = {
 	.ctl = sc7280_ctl,
 	.sspp_count = ARRAY_SIZE(sc7280_sspp),
 	.sspp = sc7280_sspp,
-	.dspp_count = ARRAY_SIZE(sc7180_dspp),
-	.dspp = sc7180_dspp,
+	.dspp_count = ARRAY_SIZE(sc7280_dspp),
+	.dspp = sc7280_dspp,
 	.mixer_count = ARRAY_SIZE(sc7280_lm),
 	.mixer = sc7280_lm,
 	.pingpong_count = ARRAY_SIZE(sc7280_pp),
-- 
2.39.1

