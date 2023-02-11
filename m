Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD550692D17
	for <lists+dri-devel@lfdr.de>; Sat, 11 Feb 2023 03:11:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3C1A10EE63;
	Sat, 11 Feb 2023 02:11:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D5CC10ECB2
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Feb 2023 02:11:14 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id c26so15413490ejz.10
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Feb 2023 18:11:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rwtA7XXf/jmW76OxegLq4C6A/wcbkGUK+Xfjn7xbYXI=;
 b=Y4qYfwMG7y0G4SNJ6t/CA5vwOyoQsslsSRMBfjIxxUccm7iyxvmK8lbd1mZsrxRXoZ
 O5GtGuGLH8mwjCH/E9JUQ2CSy8A09OqMlJBxv3Tf3zJgbsFeqzQifVwk1fUb2HjjPDSj
 5C7Sm+WCz31se7wqied/VPysCQy+O7xveewu3FxB2s9wEA8XJix5CPN3sHHHu+xZ/1fs
 oRh2V8fkH/E3GqQtjHAhvR/AKFMZs6ky3H3le16lCdpwaBGSV8B4Z54MyMPmdl2Ward4
 eywVEqlDWDoDVEnoOWd9Apg2olTb7GFYWKgW4AdmCiFOG1qtFqMWPX1kD3OgAYRi7oGJ
 bzuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rwtA7XXf/jmW76OxegLq4C6A/wcbkGUK+Xfjn7xbYXI=;
 b=QktTP6ebNKVY7Dt/k9gTKntUB4f/uvb+vg5KA45TrwjQcDy2Mx9qg+zAaUxHdvUfS7
 5h8UtIqESUOc8LxA9SGHjF51KYs1o4WUTJeUY3/4sic5ptgY83sZwaCobXiLNAdxp6NR
 8PfaPksHQTignCn92mxyqYot93hWCobiscWrs9DjmszGml9dPH9+L1wsgbKK39O1snHO
 BaFBduYLiicyRi72MvD9OYhWlM0js3FPZ1cdC3Jm684bxH5hlXXmtFYTcpRQLhsdJdl6
 vDvP7aHLxPBC7jaFWTakAPf0e8liZKnOw751HZGgmrOPsJO9eyqxSg93c/5u81dHfd1B
 gABQ==
X-Gm-Message-State: AO0yUKVLjopp/aOVlx7yCxIrXa6WOOx5eUulGH20OqPv3VnhjjQIgeT7
 Wa6cXDHtt7eeZFRwRUXjMk6B3A==
X-Google-Smtp-Source: AK7set8SRtdbvPFLexTFLkBldvG2BTYELCfAmQggEzxDFwJxH/18afC+WkgyJGtQfaLC6E529ZQ3Gg==
X-Received: by 2002:a17:906:68cd:b0:885:2eb5:68a2 with SMTP id
 y13-20020a17090668cd00b008852eb568a2mr15840227ejr.16.1676081473828; 
 Fri, 10 Feb 2023 18:11:13 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 e20-20020a170906c01400b008ae3324c8adsm3180831ejz.214.2023.02.10.18.11.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Feb 2023 18:11:13 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH 18/43] drm/msm/dpu: duplicate sc7180 catalog entries
Date: Sat, 11 Feb 2023 04:10:28 +0200
Message-Id: <20230211021053.1078648-19-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230211021053.1078648-1-dmitry.baryshkov@linaro.org>
References: <20230211021053.1078648-1-dmitry.baryshkov@linaro.org>
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
index 074d82bacc28..b511e04347ea 100644
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

