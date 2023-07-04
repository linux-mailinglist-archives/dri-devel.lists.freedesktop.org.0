Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13FE87474DB
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jul 2023 17:04:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 826E110E2E4;
	Tue,  4 Jul 2023 15:04:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 862C310E2D7
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jul 2023 15:04:03 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2b69f958ef3so92157641fa.1
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jul 2023 08:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688483042; x=1691075042;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4OmpW03IM72nopc7RqY4/FXVDSlVzzZJgcKrKtH7fe0=;
 b=PxRZS+JrgkzEdLNOzrmbJtDt6JlLldsrDvAu3ZQOsKSQ7aOfS0oX4K84cIZGte/l83
 eBqHLlAHVfz4JG7A4stUTV8yUWcYUrp81vUwdcwdLVUoiH/sZzROMEzGNTjJ6s9JqNDk
 21PbXHaX/8UeJKU2Ks0gE5yIW8Dc8G5OBAWiZAKtljdidx+Sc+InE/s0jDC6IzRMHDqj
 0/hKcfGj9LKRdRtaUj5WuC7u+BJhLzsTBTYqpDaSgMjBGyr7T8m3ai2G4+WNBpfaAXg7
 a+orj2NkPN98jVoijL0EQIbM5+OEJRl1rph2xX2avDcUXt3Yy8Te4VdwiXsCmZAeut7I
 hAbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688483042; x=1691075042;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4OmpW03IM72nopc7RqY4/FXVDSlVzzZJgcKrKtH7fe0=;
 b=gx5QjmvzxhOtE3Nar9uZNp8A2qd4+oAPtupCwy6Iqtq+dCQumUthnfUhbqhrq0Z+Us
 JfXfmKQyjUtZbJJhOD8hKUvSrHh/bxHSV8g8jTl+XxEHclpb7+mjkCWN0d+Pz7T8ZKLW
 iefFPQpIYXmSSaflVHAInF4IZiI30EuT0k6cbETpgtXWAwPjEUA5bYyl816NALZL2go4
 gkIOoxGOb/TNmG88P3hY1cWlbwuoX9BSnKugZnQ3O0tfwoBY9LPDfMj1cMlA16EPrO+n
 3+qKJaN160Wy9SDNywrt0uQCuUjRffI+cRwvXBP6L+uKCfqQD2Rk95axSHDKoXkgHUW+
 DGXw==
X-Gm-Message-State: ABy/qLYQ4lHewDghthVkGGqnrTWqpjoqFVHp6tBoQ5opbSGSWaQXobvP
 WYZYEBGwSoKlVeahOb7+cSxOyg==
X-Google-Smtp-Source: APBJJlFevKH1/FZGiODB7UDLxIkzFthcFVqPh4QOyv9WqNiniAjhGZdy4LYOnX/5zIzz7PlzcZIuDg==
X-Received: by 2002:a2e:681a:0:b0:2b6:e196:68c4 with SMTP id
 c26-20020a2e681a000000b002b6e19668c4mr5685092lja.39.1688483041891; 
 Tue, 04 Jul 2023 08:04:01 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 j10-20020a2e850a000000b002b6ca539d92sm3337354lji.138.2023.07.04.08.04.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jul 2023 08:04:01 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v2 08/14] drm/msm/dpu: rework indentation in dpu_core_perf
Date: Tue,  4 Jul 2023 18:03:48 +0300
Message-Id: <20230704150354.159882-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230704150354.159882-1-dmitry.baryshkov@linaro.org>
References: <20230704150354.159882-1-dmitry.baryshkov@linaro.org>
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
index fe4d7e08ac1d..bdd00c3af1c6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -146,8 +146,8 @@ int dpu_core_perf_crtc_check(struct drm_crtc *crtc,
 
 	drm_for_each_crtc(tmp_crtc, crtc->dev) {
 		if (tmp_crtc->enabled &&
-		    (dpu_crtc_get_client_type(tmp_crtc) ==
-				curr_client_type) && (tmp_crtc != crtc)) {
+		    dpu_crtc_get_client_type(tmp_crtc) == curr_client_type &&
+		    tmp_crtc != crtc) {
 			struct dpu_crtc_state *tmp_cstate =
 				to_dpu_crtc_state(tmp_crtc->state);
 
@@ -338,10 +338,8 @@ int dpu_core_perf_crtc_update(struct drm_crtc *crtc,
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

