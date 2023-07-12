Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1109E7507CB
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 14:12:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE08B10E519;
	Wed, 12 Jul 2023 12:11:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6188310E500
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 12:11:52 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2b734aea34aso19723431fa.0
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 05:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689163910; x=1691755910;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5iZ0+Rb7OzxR3irzWy7ik4oLco7UtnIIF/OZqFHjCIs=;
 b=aSZ9ilttYU+oSle6nCG2IVtk1rk3rDuPmBpxMOfjmKcp8vpugsla43dadeFsxtnWxg
 fvo/41dbSc9DK4Qc7MPMGXC9oUKyMaaXuVVVoaCHmHG3O9vXh3Dm1g7pJLZQITs7A0tM
 bGrbkXRwqgIwVFsbu+aO9pdiiPUMCu6feFhJnelOg/4qXVYLYHzslTrvBzkCNDQ+eUS8
 GCDUpW7sdRvmvreQCXJ507BdpVeJUr6UpJ4N5z6dO9ZRW8A8AI302T0mRVBqrjgAn6TJ
 oTY3UWliClm0JkwFIqMrL5t+2xvU7F7NJQ+h86G6bJEFXO7pvklCnVc1+i0b+9hpF38Q
 /lPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689163910; x=1691755910;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5iZ0+Rb7OzxR3irzWy7ik4oLco7UtnIIF/OZqFHjCIs=;
 b=ekdO+kMI5HttT0gk6H908UmC7/5NA+jpBHd+gOLPBlyVreIkQsX0uMdkSPHy7cBgqL
 8m0///XJtK5kkhlXfx0i0AyA5ziqmRlvWQ/1d2MymQXuCxFTeuczEiq/ptJf8oVmiErj
 DKWGAfa1zzfcEkoX+jeiSDfYFs8wMTqOXUC7jLV8LwRqJsgWeaM4dIu2TPthdkz3/eAO
 8wGpkXoB3UuV1IKtYW3iGIPTtngljLpiZopKnqwAUGS4EXrzPHnK34VkNplpHHrlQAg2
 v2w88wPAFOKpnQ9jq2h4ITsJgw0Ft2awZQAK6k8Ah7eiOwm1nsjwiJvRq+i9FtQ9SuD/
 lyNQ==
X-Gm-Message-State: ABy/qLbFpWgLuCPBG+bVUeXjdmOTWr6vdFMMsj6WSck7SalIe7bfiu2q
 h4tn8k+z6Yt/QvdQzB3hDqUVOg==
X-Google-Smtp-Source: APBJJlHmYa93PvlTRuFcmYOEMhmlhwu+khLDXsukQ2doZ6JboJHZ9ZKKwGLZ+XfYKmA8LUkqKTWRLQ==
X-Received: by 2002:a2e:894d:0:b0:2b6:9ebc:daed with SMTP id
 b13-20020a2e894d000000b002b69ebcdaedmr17610674ljk.35.1689163910531; 
 Wed, 12 Jul 2023 05:11:50 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 p14-20020a2ea40e000000b002b6c8cf48bfsm913135ljn.104.2023.07.12.05.11.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jul 2023 05:11:50 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v2 5/8] drm/msm/mdss: inline msm_mdss_icc_request_bw()
Date: Wed, 12 Jul 2023 15:11:42 +0300
Message-Id: <20230712121145.1994830-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230712121145.1994830-1-dmitry.baryshkov@linaro.org>
References: <20230712121145.1994830-1-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There are just two places where we set the bandwidth: in the resume and
in the suspend paths. Drop the wrapping function
msm_mdss_icc_request_bw() and call icc_set_bw() directly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 809c93b22c9c..eed96976e260 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -74,14 +74,6 @@ static int msm_mdss_parse_data_bus_icc_path(struct device *dev,
 	return 0;
 }
 
-static void msm_mdss_icc_request_bw(struct msm_mdss *msm_mdss, unsigned long bw)
-{
-	int i;
-
-	for (i = 0; i < msm_mdss->num_mdp_paths; i++)
-		icc_set_bw(msm_mdss->mdp_path[i], 0, Bps_to_icc(bw));
-}
-
 static void msm_mdss_irq(struct irq_desc *desc)
 {
 	struct msm_mdss *msm_mdss = irq_desc_get_handler_data(desc);
@@ -229,14 +221,15 @@ static void msm_mdss_setup_ubwc_dec_40(struct msm_mdss *msm_mdss)
 
 static int msm_mdss_enable(struct msm_mdss *msm_mdss)
 {
-	int ret;
+	int ret, i;
 
 	/*
 	 * Several components have AXI clocks that can only be turned on if
 	 * the interconnect is enabled (non-zero bandwidth). Let's make sure
 	 * that the interconnects are at least at a minimum amount.
 	 */
-	msm_mdss_icc_request_bw(msm_mdss, MIN_IB_BW);
+	for (i = 0; i < msm_mdss->num_mdp_paths; i++)
+		icc_set_bw(msm_mdss->mdp_path[i], 0, Bps_to_icc(MIN_IB_BW));
 
 	ret = clk_bulk_prepare_enable(msm_mdss->num_clocks, msm_mdss->clocks);
 	if (ret) {
@@ -284,8 +277,12 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
 
 static int msm_mdss_disable(struct msm_mdss *msm_mdss)
 {
+	int i;
+
 	clk_bulk_disable_unprepare(msm_mdss->num_clocks, msm_mdss->clocks);
-	msm_mdss_icc_request_bw(msm_mdss, 0);
+
+	for (i = 0; i < msm_mdss->num_mdp_paths; i++)
+		icc_set_bw(msm_mdss->mdp_path[i], 0, 0);
 
 	return 0;
 }
-- 
2.40.1

