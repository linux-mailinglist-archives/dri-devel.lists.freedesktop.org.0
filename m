Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F9C6E4D3D
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 17:30:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3916210E444;
	Mon, 17 Apr 2023 15:30:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE6C010E41E
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Apr 2023 15:30:29 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-4edc114c716so1065117e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Apr 2023 08:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681745428; x=1684337428;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=hUGnN7QmHFXWvkEalaWeWFmgMZnzSnPU7k2aFfVSknQ=;
 b=b48X3TNr8x0xwcnL9k2Alm3yyl/qFo8VMA9g3p2UCJmh7v3XG+eV0kL8LoTcNHq+e+
 hrTlFeselhHOQp9hqlV/QkxOl6XD0LnF/pvdpgwh8mtfIPUKusX5lKkPrgtLWJUJo5GR
 7L+QNLIXQVcU6p/AY28X4eOm4EZU5zUTdu79KV2Ylb78O1uDB9FTod9tn4iCWaNQ+WUQ
 H4RDaET6z7Qx/Px37ZY7KAOOmcXr0imjCXximuEsz1scm+kX7B0dis5bbSdguzMuluiK
 ZiMTC6p7CuW7p8t3SaywKuARPlwH9zbzGzb2dgWBFJbBGsF1nPXjKtPLqeXVo6EAqnUJ
 Pvqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681745428; x=1684337428;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hUGnN7QmHFXWvkEalaWeWFmgMZnzSnPU7k2aFfVSknQ=;
 b=HNaotJJTRvqmbyvko6r+is8nJjYRJa4ZBcFmZ7nQKCsphugm5JPbYfq/iMKwGsfYmE
 TMePeTcIo8IPQ8i2Gozab4g/TcyuRYFUNDJx/Qfs85LCh8YHCnGcRZl60vnO5ZaB5lVt
 IRkt0SpCh4preDlWGnD3RC35DTQ02FFpLqeqTgMVVodtndIfHKDtvNJYQjPehms28aUf
 IWY2LE6eaWA2bEJGoKd4y9vmQerPtzDNRcu2wkFDeBwLHQYH7RXPaeFKI2FVf1pkaxx/
 C1W7fiMYslF1XoFVycfUKS9j7sd5luXcgwUhxJhIfcHcXghInIRC8jPJP15imD91jktw
 IbAg==
X-Gm-Message-State: AAQBX9fX9RJGPCS9vVgPhQRRkqoM6ZVVP6gBxYFG9FwC/0I7KO/mdh96
 aZL279kgqPUoqvMb6U7IHMKYdA==
X-Google-Smtp-Source: AKy350aVcGCz0I18YLBMozsCg0j2xuZX+ENATzTw/Z9m/9K5H3xo357Cw68Kxt0jP4lRQZo7OjAxwA==
X-Received: by 2002:ac2:42ca:0:b0:4ec:b1bf:a562 with SMTP id
 n10-20020ac242ca000000b004ecb1bfa562mr2112180lfl.51.1681745427914; 
 Mon, 17 Apr 2023 08:30:27 -0700 (PDT)
Received: from [192.168.1.101] (abyk99.neoplus.adsl.tpnet.pl. [83.9.30.99])
 by smtp.gmail.com with ESMTPSA id
 b16-20020ac25e90000000b004ec8a3d4200sm2053439lfq.293.2023.04.17.08.30.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Apr 2023 08:30:27 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Mon, 17 Apr 2023 17:30:17 +0200
Subject: [PATCH 3/5] drm/msm/mdss: Rename path references to mdp_path
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230417-topic-dpu_regbus-v1-3-06fbdc1643c0@linaro.org>
References: <20230417-topic-dpu_regbus-v1-0-06fbdc1643c0@linaro.org>
In-Reply-To: <20230417-topic-dpu_regbus-v1-0-06fbdc1643c0@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1681745422; l=2175;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=mFT0UyX9LhxCNCpprLZW/XLO+LLNqKMZSGZE8MZeFUU=;
 b=BXHtHcUcP4g/hixvZ0bGJVRvqCP7askf6+3q9wseZvQ/7VfvWeLIM9JhT3BU/O5D9uFsmsKTreg+
 diV6OtW0D5MqNkqhqHE4VLhrMAs+6iejgdtaEbsRGpVZvrINpjs1
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The DPU1 driver needs to handle all MDPn<->DDR paths, as well as
CPU<->SLAVE_DISPLAY_CFG. The former ones share how their values are
calculated, but the latter one has static predefines spanning all SoCs.

In preparation for supporting the CPU<->SLAVE_DISPLAY_CFG path, rename
the path-related struct members to include "mdp_".

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index e8c93731aaa1..9e2ce7f22677 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -48,8 +48,8 @@ struct msm_mdss {
 		struct irq_domain *domain;
 	} irq_controller;
 	const struct msm_mdss_data *mdss_data;
-	struct icc_path *path[2];
-	u32 num_paths;
+	struct icc_path *mdp_path[2];
+	u32 num_mdp_paths;
 };
 
 static int msm_mdss_parse_data_bus_icc_path(struct device *dev,
@@ -62,13 +62,13 @@ static int msm_mdss_parse_data_bus_icc_path(struct device *dev,
 	if (IS_ERR_OR_NULL(path0))
 		return PTR_ERR_OR_ZERO(path0);
 
-	msm_mdss->path[0] = path0;
-	msm_mdss->num_paths = 1;
+	msm_mdss->mdp_path[0] = path0;
+	msm_mdss->num_mdp_paths = 1;
 
 	path1 = of_icc_get(dev, "mdp1-mem");
 	if (!IS_ERR_OR_NULL(path1)) {
-		msm_mdss->path[1] = path1;
-		msm_mdss->num_paths++;
+		msm_mdss->mdp_path[1] = path1;
+		msm_mdss->num_mdp_paths++;
 	}
 
 	return 0;
@@ -79,16 +79,16 @@ static void msm_mdss_put_icc_path(void *data)
 	struct msm_mdss *msm_mdss = data;
 	int i;
 
-	for (i = 0; i < msm_mdss->num_paths; i++)
-		icc_put(msm_mdss->path[i]);
+	for (i = 0; i < msm_mdss->num_mdp_paths; i++)
+		icc_put(msm_mdss->mdp_path[i]);
 }
 
 static void msm_mdss_icc_request_bw(struct msm_mdss *msm_mdss, unsigned long bw)
 {
 	int i;
 
-	for (i = 0; i < msm_mdss->num_paths; i++)
-		icc_set_bw(msm_mdss->path[i], 0, Bps_to_icc(bw));
+	for (i = 0; i < msm_mdss->num_mdp_paths; i++)
+		icc_set_bw(msm_mdss->mdp_path[i], 0, Bps_to_icc(bw));
 }
 
 static void msm_mdss_irq(struct irq_desc *desc)

-- 
2.40.0

