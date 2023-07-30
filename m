Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2821768316
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jul 2023 03:01:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 393F410E130;
	Sun, 30 Jul 2023 01:01:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8930310E130
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Jul 2023 01:01:08 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2b72161c6e9so57586101fa.0
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jul 2023 18:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690678867; x=1691283667;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EZNp47+5mB8X0hcppySWiLzPp8uuJeeDzihUIEzaqAU=;
 b=d0aLnx44WreqBxfzVKUyHNRC/2znwkN7OM8Tji+REbbNyPGLBq/IH4t/qbJsm5oNLG
 Qf1hc7aknH3OfUZyp9RIcBdxOSm79q954WelFeI/roGpJyqZjdBBNcS7IJjuxUIhUcEu
 22EhGmlhhUv9eFcazbD/b5X9itTR6IXAyW2RFMo7DD8NzdVVguWs9ecyqDCIZF7yb75f
 skJjp5JGSy0QmdUCyxH4ABDCyojviAkYQmeqHpV/FKLXOLUVzn+oiqmf1E5UJDBlvFuC
 BCd61/qOYVvyrtePtiQ6e4MrV24FW+YIX4neCrv4Z865kTzKMX+vuWLaAmzh1XPGbnfD
 5BBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690678867; x=1691283667;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EZNp47+5mB8X0hcppySWiLzPp8uuJeeDzihUIEzaqAU=;
 b=Vy2Y0hW4NsYR1+u1c4ITCX4GCpS/72GXfeEJz8HKGXFIfEYvrSQry7DEif/zaKXKks
 MYkdegu840wMvk5KU1L6fwSKWK2DEjCK0MCCgZcL6yBxiwzTZ6qN7Ogs4DEpZyU4xD8J
 WzFihGwIV5cOWOBN3e+7Hcn74NxivjXBuK2AhSlURplVxXkhnxZEGObgmtV7mUazVzM+
 J1iS7jflJ/xpHfRGA1AUSsbihCEzcGCmIGh+oYXI8686cYbpj4Mq9v6WTsVJZu6TkvuS
 wAvl8l6lFsS4T4FvqGWUB3MAoHMtGikZ/iFC/0W1OIynQO7V2VLVn6U4r0XhCmY/zYkm
 iPtw==
X-Gm-Message-State: ABy/qLZ697K54qlxpj9X53gCWHpN97Ea0WBUifQGOC3FB6RnFy70mTBO
 Vo21/6HxEgK2pANLVhoWD2ah/Q==
X-Google-Smtp-Source: APBJJlFqXEBAJVvdNEpnw4uL7J0jdLoGKMd2O45vURHylZnvimMbfKv+vUqEa42Drvky3tUeT5Xm6A==
X-Received: by 2002:a2e:b601:0:b0:2b4:50b8:5d3b with SMTP id
 r1-20020a2eb601000000b002b450b85d3bmr2202311ljn.0.1690678866934; 
 Sat, 29 Jul 2023 18:01:06 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 22-20020a05651c009600b002b9e501a6acsm169898ljq.3.2023.07.29.18.01.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Jul 2023 18:01:06 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v5 04/10] drm/msm/dpu: rework indentation in dpu_core_perf
Date: Sun, 30 Jul 2023 04:00:56 +0300
Message-Id: <20230730010102.350713-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230730010102.350713-1-dmitry.baryshkov@linaro.org>
References: <20230730010102.350713-1-dmitry.baryshkov@linaro.org>
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
 Stephen Boyd <swboyd@chromium.org>, Konrad Dybcio <konrad.dybcio@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

dpu_core_perf.c contains several multi-line conditions which are hard to
comprehent because of the indentation. Rework the identation of these
conditions to make it easier to understand them.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index 34f3d30ab7d6..6ddbedb83e66 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -173,8 +173,8 @@ int dpu_core_perf_crtc_check(struct drm_crtc *crtc,
 
 	drm_for_each_crtc(tmp_crtc, crtc->dev) {
 		if (tmp_crtc->enabled &&
-		    (dpu_crtc_get_client_type(tmp_crtc) ==
-				curr_client_type) && (tmp_crtc != crtc)) {
+		    dpu_crtc_get_client_type(tmp_crtc) == curr_client_type &&
+		    tmp_crtc != crtc) {
 			struct dpu_crtc_state *tmp_cstate =
 				to_dpu_crtc_state(tmp_crtc->state);
 
@@ -360,10 +360,8 @@ int dpu_core_perf_crtc_update(struct drm_crtc *crtc,
 			update_bus = true;
 		}
 
-		if ((params_changed &&
-			(new->core_clk_rate > old->core_clk_rate)) ||
-			(!params_changed &&
-			(new->core_clk_rate < old->core_clk_rate))) {
+		if ((params_changed && new->core_clk_rate > old->core_clk_rate) ||
+		    (!params_changed && new->core_clk_rate < old->core_clk_rate)) {
 			old->core_clk_rate = new->core_clk_rate;
 			update_clk = true;
 		}
-- 
2.39.2

