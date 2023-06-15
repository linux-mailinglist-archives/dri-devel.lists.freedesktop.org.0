Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E295732371
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 01:22:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 237F310E56D;
	Thu, 15 Jun 2023 23:22:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA57C10E585
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 23:21:48 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-4f4b2bc1565so11307536e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 16:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686871307; x=1689463307;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=bYVg5xWLgAw8ObPKuarwHrvQ8MbLRWVq3Hh2y66RuC0=;
 b=itrD0BtgTqh/hrdK7JoqVEhInsJX5xlPkjyH3iWs4fsesWXjXeFux5kPxjwoBxdA9h
 AlCi/gFKU+7i6M8N/y9JtJrcz9WnR50EYjea87OeCJy/BHLIcw5K2d4KkMVKWBDWEI5r
 w5Numc3CkC3nEB1aKUOclOwd2LvS6sBmTXPEpigZhJDtCsHvM0uj12mUWpjMyEiv69dr
 cFReB/eFRIks+KFmgv+8Pw8Y7NurVwWPlkcFnBAchfBRdLH+ERmw6ar6F8jKZWu5WKJE
 B1EmThmuNuwcqkZyQpJ5DsFrE48QjjRcxge6ciPfXfBaknRpbmY1oBe9MxZZTjNDaTtb
 bFMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686871307; x=1689463307;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bYVg5xWLgAw8ObPKuarwHrvQ8MbLRWVq3Hh2y66RuC0=;
 b=OYMLzU/WXkbsQ8ojfaahkDAguUrecONeJbGhqiE6z4O2qv+CjuVN6P3ppdCXEE8fi2
 kadr+EaB042mWmbLs2RQfke9EJqV3EKGWu9+4ST6oJtQqE0TZY851J6a+/ZDxkdsxBhB
 8BEg4W3mCN9LT2Bw0kk8Zrzl4Koe6Rohjg7UEKVAn3M1o1qXAmQAaVZ5fGkMCUtdBKaL
 pF5B8KRpKTKmgpHzmNMqSmwT85NKjzfBOJLlpgvuSYf+eJjaAPf02tZ3MNC4rHMuweXL
 RT9ims9RSWxirhT/2lIeojKvpRNkyWe25wyCsvKn+JZhqkdNfUcPEiEGUuB16mw5RIxc
 Bsbw==
X-Gm-Message-State: AC+VfDx5QqlnPCNk2emsa0NyNSNB85JA4EkM54sjnSaFuXadPD0+Zipt
 /lI/+5K9e7UcH1QyCfdP96p/Iw==
X-Google-Smtp-Source: ACHHUZ6w6RF6n9HK1f1WuQMH+vYnBy57Yg9QjeE9N1JkSjR0N7RmOTNO+MYVTCryzpH0E/lj51deTQ==
X-Received: by 2002:ac2:4982:0:b0:4f6:4616:9f68 with SMTP id
 f2-20020ac24982000000b004f646169f68mr110832lfl.38.1686871307097; 
 Thu, 15 Jun 2023 16:21:47 -0700 (PDT)
Received: from [192.168.1.101] (abyj190.neoplus.adsl.tpnet.pl. [83.9.29.190])
 by smtp.gmail.com with ESMTPSA id
 u25-20020a056512041900b004f24ee39661sm2744852lfk.137.2023.06.15.16.21.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jun 2023 16:21:46 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 16 Jun 2023 01:21:00 +0200
Subject: [PATCH v9 19/20] drm/msm/a6xx: Add A619_holi speedbin support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-topic-gmuwrapper-v9-19-890d8f470c8b@linaro.org>
References: <20230223-topic-gmuwrapper-v9-0-890d8f470c8b@linaro.org>
In-Reply-To: <20230223-topic-gmuwrapper-v9-0-890d8f470c8b@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>, 
 Conor Dooley <conor+dt@kernel.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1686871277; l=2089;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=NX9ATH/Ev8PlZhCVhECzg9N+SgoP/jwCI/pQ0YNJQOY=;
 b=YrJ5CN8SWgMcflHDAkdH4AO6i2fC6lh3OlFqiDjWhiSOCXFO3qusmmxcSIxOKmmAc/apeUeP7
 kpCV/GnTH9pAV0Son2yVEiFfcmldMHDzlXfXs2vLVHKp0dlfI7MgkU5
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
Cc: Rob Clark <robdclark@chromium.org>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A619_holi is implemented on at least two SoCs: SM4350 (holi) and SM6375
(blair). This is what seems to be a first occurrence of this happening,
but it's easy to overcome by guarding the SoC-specific fuse values with
of_machine_is_compatible(). Do just that to enable frequency limiting
on these SoCs.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index d7139eae0f73..ff9a8d342c77 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2216,6 +2216,34 @@ static u32 a618_get_speed_bin(u32 fuse)
 	return UINT_MAX;
 }
 
+static u32 a619_holi_get_speed_bin(u32 fuse)
+{
+	/*
+	 * There are (at least) two SoCs implementing A619_holi: SM4350 (holi)
+	 * and SM6375 (blair). Limit the fuse matching to the corresponding
+	 * SoC to prevent bogus frequency setting (as improbable as it may be,
+	 * given unexpected fuse values are.. unexpected! But still possible.)
+	 */
+
+	if (fuse == 0)
+		return 0;
+
+	if (of_machine_is_compatible("qcom,sm4350")) {
+		if (fuse == 138)
+			return 1;
+		else if (fuse == 92)
+			return 2;
+	} else if (of_machine_is_compatible("qcom,sm6375")) {
+		if (fuse == 190)
+			return 1;
+		else if (fuse == 177)
+			return 2;
+	} else
+		pr_warn("Unknown SoC implementing A619_holi!\n");
+
+	return UINT_MAX;
+}
+
 static u32 a619_get_speed_bin(u32 fuse)
 {
 	if (fuse == 0)
@@ -2276,6 +2304,9 @@ static u32 fuse_to_supp_hw(struct device *dev, struct adreno_gpu *adreno_gpu, u3
 	if (adreno_is_a618(adreno_gpu))
 		val = a618_get_speed_bin(fuse);
 
+	else if (adreno_is_a619_holi(adreno_gpu))
+		val = a619_holi_get_speed_bin(fuse);
+
 	else if (adreno_is_a619(adreno_gpu))
 		val = a619_get_speed_bin(fuse);
 

-- 
2.41.0

