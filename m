Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 120336A081C
	for <lists+dri-devel@lfdr.de>; Thu, 23 Feb 2023 13:07:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BC6510E1F9;
	Thu, 23 Feb 2023 12:07:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C11C110EB6F
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Feb 2023 12:07:09 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id n2so10229980lfb.12
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Feb 2023 04:07:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=C4+BbvaxTKosi1VX2ZfgyFw5uKrIVyEHJTEyhGEltZ8=;
 b=Y2jcSJHhF5U7EQu4pplmwN6DCqvLxec404zwfZZnPgxsphRj/bZKem0lSAXaMsKAPF
 4IVbe4H2jrX3UZbOoh3MyeDnq8yRX3crwsGY0UDg8F8wo1yxX+KiFtRiWeP9OTwhaSHq
 mU3xs1HoR0dgTBhQjEv1e4VUvDqucQ1JVcdLXEeKnsvVSmZbelyiiaGNZy4ilyFoW4LF
 fcXKmYY7Mh5f5yV3b+mA3S1dUsnPcfd9hm+IL/kC8X7lOwANQFIpXQYMnlSZnAE8EU0m
 tB0VOaJ7j2XemYKYIO3cverm+e45CmLb9TN0zsXKm7H/4I7Blpvbpgai+dZUIc7glGGU
 feAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C4+BbvaxTKosi1VX2ZfgyFw5uKrIVyEHJTEyhGEltZ8=;
 b=45moW8Z4BxYn/LLOnOP/J/zAoxUL0InysHosO7vJSIZsFlY1xccpo9IdQEQGlMut8B
 a8oNbHiuXQAqKxZxBBpITgTItCuXsQE28ckYRGW0VTUxvPnQjEMV6eQ4SV7F+4uShurQ
 i5RrvdFS3wsXCx6NWUXHH+xNFGSmvgy5BV8ENnYE4NsAEsCAB/Jlxe8ItD7MrWuI3E8k
 YJg+IisH+fGaSTkcxZkQzTIg58Pqc5LE/101czUVlUeXbvN2PLu8tBUagBPosyH6/3PI
 ED9QOlASfyBoKmxhjEbsBVbuhsyvLpEDDdgvY+7JnHbdXit+CW6q1XFuGCLRyXzFebYv
 i1wg==
X-Gm-Message-State: AO0yUKWxWKaRDI/JSBw+lEBhnzQNQ9KP6bIYTGZx0OKKh3TT7y59jKDN
 ewl3nHRLLGGJsbKxLN4yOHLptw==
X-Google-Smtp-Source: AK7set/BfkcYxE6t0vClbaGDWrcWIMEVdt6dbBzCVaxKh/DZJn4Hjr2vb/yRmNsYoPwWnzNvdxDLyw==
X-Received: by 2002:ac2:54ab:0:b0:4ce:e95c:f300 with SMTP id
 w11-20020ac254ab000000b004cee95cf300mr3781292lfk.39.1677154028161; 
 Thu, 23 Feb 2023 04:07:08 -0800 (PST)
Received: from [192.168.1.101] (abxi151.neoplus.adsl.tpnet.pl. [83.9.2.151])
 by smtp.gmail.com with ESMTPSA id
 h23-20020a2ea497000000b0029599744c02sm414838lji.75.2023.02.23.04.07.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 04:07:07 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Thu, 23 Feb 2023 13:06:49 +0100
Subject: [PATCH v3 15/15] drm/msm/a6xx: Add A610 speedbin support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-topic-gmuwrapper-v3-15-5be55a336819@linaro.org>
References: <20230223-topic-gmuwrapper-v3-0-5be55a336819@linaro.org>
In-Reply-To: <20230223-topic-gmuwrapper-v3-0-5be55a336819@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1677154003; l=1852;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=gmn1Idn/yrEmcHwFxm5qk9hU1gD03yCxhKSKpAQYKug=;
 b=6S8Wn5QB1UAWFq1YBi3uGUxAV7PpjS5h2hGvXXaJ1yZCevQezsRpJqu0PBnlHJn+L2usM1ipmYK9
 ml6T9bHWATtmbl+C50XUojlihXpuGxw3y8/01fMYjx91UqJg0ouL
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
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A610 is implemented on at least three SoCs: SM6115 (bengal), SM6125
(trinket) and SM6225 (khaje). Trinket does not support speed binning
(only a single SKU exists) and we don't yet support khaje upstream.
Hence, add a fuse mapping table for bengal to allow for per-chip
frequency limiting.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 81f99f8d1978..f78077abb886 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2151,6 +2151,30 @@ static bool a6xx_progress(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
 	return progress;
 }
 
+static u32 a610_get_speed_bin(u32 fuse)
+{
+	/*
+	 * There are (at least) three SoCs implementing A610: SM6125 (trinket),
+	 * SM6115 (bengal) and SM6225 (khaje). Trinket does not have speedbinning,
+	 * as only a single SKU exists and we don't support khaje upstream yet.
+	 * Hence, this matching table is only valid for bengal and can be easily
+	 * expanded if need be.
+	 */
+
+	if (fuse == 0)
+		return 0;
+	else if (fuse == 206)
+		return 1;
+	else if (fuse == 200)
+		return 2;
+	else if (fuse == 157)
+		return 3;
+	else if (fuse == 127)
+		return 4;
+
+	return UINT_MAX;
+}
+
 static u32 a618_get_speed_bin(u32 fuse)
 {
 	if (fuse == 0)
@@ -2247,6 +2271,9 @@ static u32 fuse_to_supp_hw(struct device *dev, struct adreno_gpu *adreno_gpu, u3
 {
 	u32 val = UINT_MAX;
 
+	if (adreno_is_a610(adreno_gpu))
+		val = a610_get_speed_bin(fuse);
+
 	if (adreno_is_a618(adreno_gpu))
 		val = a618_get_speed_bin(fuse);
 

-- 
2.39.2

