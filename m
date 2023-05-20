Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9636F70A7F0
	for <lists+dri-devel@lfdr.de>; Sat, 20 May 2023 14:20:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEA2A10E193;
	Sat, 20 May 2023 12:20:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D520A10E188
 for <dri-devel@lists.freedesktop.org>; Sat, 20 May 2023 12:20:14 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-4f14468ef54so4782389e87.0
 for <dri-devel@lists.freedesktop.org>; Sat, 20 May 2023 05:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684585214; x=1687177214;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=VGVJDUVzLD/MSS0RtIw1KV+SoY/TdXx+81YSilsEy4I=;
 b=hxrpeuCSCHVlpA+2MThbj6OBvovY9fnTj/JGHkFH3cfAA4nmLGW4mXSf6YAwE26wmf
 oLpt9v6z6MKePbU4M3H6Fr+oiB5E53NoQXlDmAIfcXrCi2UEBO3QLL0YGnrpH/0agsI7
 43KIquRD6tK+h7ATC/Ym+/htnr4y1yvXEmpCJ0ql3J4+6JM5v8v5fK864zrSk69/cz1G
 tAlEDkgIe+UKHoUFuK0uPXCqC/377FNnA9hR7ThuI4rtjeLySm6DBBHNyswliDG6Vqq4
 9GZ4cd4+cgrZ1VwOqyIbpUqSlefXZ9q/mwZklolvbt7nPCRTlNjd1Eu2+9kUGtdlYN82
 2hbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684585214; x=1687177214;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VGVJDUVzLD/MSS0RtIw1KV+SoY/TdXx+81YSilsEy4I=;
 b=K0fj8T+mizXYwS3KsmQ3sJ5NRd+7f7qJ39j46dd1Bs6iulXwM94ilxw9tz5RK5hTDz
 RfA+Uq3HUbaEIwKC0L47jqGwJZzWXWLm0c545iC5MwXT6+r+Q5oQrSHUYS6fXRBdiP2I
 vD9LTI9ey7YL1UKdwK6NTt6Ofzg+Alse1Wi27TrYHA9B5Y1pqYXAfV0Dt952wdvZu0A2
 JQDjaudCfpJGnSSh5Ab0DJYfwj/tA2U8AdnVqaUI3qUx/UlsDy5xZNXfXMcrAgmR0E/E
 jc9Lpyu8Gem8nFM81Hv6VOsp1detq/aWrJfi0HPWPhkvIvlZZUMALlVUb0MzVX6AC1nE
 7rSA==
X-Gm-Message-State: AC+VfDyl/Xswgcqzus00321Zb1Kw8x/e25O87v/wvRcUyUrVxALv/kXc
 evPxcpkLgiTsM+w+Vkh691fwNQ==
X-Google-Smtp-Source: ACHHUZ7/LQp5mmYM41FBE98hULfDEX7wBaKm3z5ceNFfarB94+1UiTOxpx+XZTkD3KmXrmdkxdxiFQ==
X-Received: by 2002:ac2:539a:0:b0:4f2:769a:120e with SMTP id
 g26-20020ac2539a000000b004f2769a120emr1581950lfh.2.1684585214408; 
 Sat, 20 May 2023 05:20:14 -0700 (PDT)
Received: from [192.168.1.101] (abxi58.neoplus.adsl.tpnet.pl. [83.9.2.58])
 by smtp.gmail.com with ESMTPSA id
 y6-20020ac24466000000b004f37bd02a89sm244766lfl.287.2023.05.20.05.20.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 May 2023 05:20:14 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Sat, 20 May 2023 14:19:57 +0200
Subject: [PATCH v7 17/18] drm/msm/a6xx: Add A619_holi speedbin support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-topic-gmuwrapper-v7-17-ecc7aab83556@linaro.org>
References: <20230223-topic-gmuwrapper-v7-0-ecc7aab83556@linaro.org>
In-Reply-To: <20230223-topic-gmuwrapper-v7-0-ecc7aab83556@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1684585186; l=2033;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=JE+me8wGwvbnigS+vGj1riDnfhLDy9pbL1Nubu9j+Dc=;
 b=dT0oolqAVMMfgO9v3OoI1L7wZfY6VcvoXmE+KZnvpMRRrSkLeeK/PGZdVcbjn4ZCPycmZ21nx
 xGdZfeBZUmFCKCLxETbmTMGf8f1a8qxk/0opUNcKMwsqX6hphWypB3w
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
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 5ad19978390c..c07b25fc2bd9 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2114,6 +2114,34 @@ static u32 a618_get_speed_bin(u32 fuse)
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
@@ -2174,6 +2202,9 @@ static u32 fuse_to_supp_hw(struct device *dev, struct adreno_gpu *adreno_gpu, u3
 	if (adreno_is_a618(adreno_gpu))
 		val = a618_get_speed_bin(fuse);
 
+	else if (adreno_is_a619_holi(adreno_gpu))
+		val = a619_holi_get_speed_bin(fuse);
+
 	else if (adreno_is_a619(adreno_gpu))
 		val = a619_get_speed_bin(fuse);
 

-- 
2.40.1

