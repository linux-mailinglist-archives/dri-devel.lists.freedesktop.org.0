Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8916B9933
	for <lists+dri-devel@lfdr.de>; Tue, 14 Mar 2023 16:29:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C300110E83C;
	Tue, 14 Mar 2023 15:29:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2AD210E845
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 15:28:59 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id a32so16422345ljq.1
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 08:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678807739;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=j2eEYWuGcq9/XbTV0ihUo6//o0TPXB2yKOJ5coGxbig=;
 b=Uzol4Md/G1W/pzYZwQoB3jGmnQryqDT9lSjtfbnPEJsMuuIAT/rm+rH9GGfFYFc9x1
 NJ7PXtMsH3QnX8E9evFky454dBOsH96V1JasUM0vLVM6Npfn32ijhf67azhMw/cJjDQC
 DMywU42oXTzkYOPlBsPOT/raFojuHwEbkKyacUbHNQmHXLMIPklH+ed9E1R79gVVOZeh
 UXF3hThDdQPew3cOhG8DhIShnLtEzshjthaTt7xbM1WK60eLZjhmPRBSx5qq9Tce3stT
 z0P+qiorh7YadcM7HlL+d2rHp9bbUTd5l6MaUJ2DtSjPtMAgusHCcEfdmC9A1SmELhgN
 7+3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678807739;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=j2eEYWuGcq9/XbTV0ihUo6//o0TPXB2yKOJ5coGxbig=;
 b=MwWJ1Ahmsiigw0Oep3juVY0SK8QXaiIdj4dDNN0UrInK2IDbaFx3L9/BRnMyRxXzqJ
 Hp95L/BNJ2uTOFebxiB/Jv5rfweSs0ttgofKjwlUkvbUal3qSjfDhNQ/6rx7Uvx97+aF
 ++aGVIDwmmntBjjAKwYbJtWKyLAM8mnNB0ZURH94k7IYyYUryRKBYEPiz16UYiSrUGii
 kp9vKanw+D8MqT6JY+9LrzHqXvVJsnR8ApkO/LmjzOCtcRN9fnmBUWZaErnxQmlrhVaM
 MX1dpC2wZAGtX6Rf90HLTkAE6KK51Bg5/MZ097z6qRkT4kzm8w5J44oSm/An/+3+GmyK
 obGQ==
X-Gm-Message-State: AO0yUKWWZiwgzB8ln+2vhASw4pT0z5bwERd3R3/GVqyVSJZreC//TkeI
 9ndobfZLkkwtKVqb3/9kpjA/KA==
X-Google-Smtp-Source: AK7set/LWyoYvugiC3rN0mWPEx2Fg0KLPVq4uJ85JfYJmzed5o3Q0zVo/UadHn5Zu5NnDMc1F4XBww==
X-Received: by 2002:a2e:994f:0:b0:294:6235:b18e with SMTP id
 r15-20020a2e994f000000b002946235b18emr12097562ljj.14.1678807739431; 
 Tue, 14 Mar 2023 08:28:59 -0700 (PDT)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
 by smtp.gmail.com with ESMTPSA id
 27-20020a2e165b000000b002986a977bf2sm491529ljw.90.2023.03.14.08.28.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 08:28:59 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 14 Mar 2023 16:28:44 +0100
Subject: [PATCH v4 13/14] drm/msm/a6xx: Add A619_holi speedbin support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-topic-gmuwrapper-v4-13-e987eb79d03f@linaro.org>
References: <20230223-topic-gmuwrapper-v4-0-e987eb79d03f@linaro.org>
In-Reply-To: <20230223-topic-gmuwrapper-v4-0-e987eb79d03f@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1678807716; l=1972;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=YbHID1ebzUgv4FADFLbdTcRo/0BAqs1RT5mt5WqUfTo=;
 b=s3HhnOhKViZbWBYgyMxuzL4UDJa8iVASyV+mQYW3iO3PGPZl+eP/2Aeaw6ZMhwFz3SwSFoCG0y33
 Q/Rx0heHCR/EvUr6sEUzL8fuAOHOSGF3DRC9eEc/4mROb2FGKAb7
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

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 71950a5fcc96..27b96a335039 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2148,6 +2148,34 @@ static u32 a618_get_speed_bin(u32 fuse)
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
@@ -2207,6 +2235,9 @@ static u32 fuse_to_supp_hw(struct device *dev, struct adreno_gpu *adreno_gpu, u3
 	if (adreno_is_a618(adreno_gpu))
 		val = a618_get_speed_bin(fuse);
 
+	else if (adreno_is_a619_holi(adreno_gpu))
+		val = a619_holi_get_speed_bin(fuse);
+
 	else if (adreno_is_a619(adreno_gpu))
 		val = a619_get_speed_bin(fuse);
 

-- 
2.39.2

