Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39AB86D3085
	for <lists+dri-devel@lfdr.de>; Sat,  1 Apr 2023 13:56:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19B3B10E2F5;
	Sat,  1 Apr 2023 11:56:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E04110E24F
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Apr 2023 11:55:34 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id c9so21810008lfb.1
 for <dri-devel@lists.freedesktop.org>; Sat, 01 Apr 2023 04:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680350132;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=l7iaKrmXzAocug0zm1BXOXimd3i27ycjAt6X7axyt1c=;
 b=huSfh3WPWOS2hUfnr6lymatuU4DazhafyQESbHCwz8Ux2BCzKiKR3v5FqeLRU7ZiaG
 lgvVM230rE0+NDVKiljZYLo75J16DwD20JogzRb4tvNyNqXe4Ou4ku0kHLPlnOX1M0ZM
 9qG/mRyuVeib84/v6csmnNde7gUfbYKX4aRuoqas9hSBjUMHDzLR9Pnx3oscWpKSojmW
 XhqVJ87ULKEBcdD+UaCFWSLTlnAm29es/bjn0unZqNZMgXVkT5dXgzWJGf6pt7iQE4/G
 j4v/VZjeXhogtWAVq9cFlfGQVNQqc9cxXxAA9pzpJ5rdI8VUqvy65zPSnoO5nwEwkkir
 kppA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680350132;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=l7iaKrmXzAocug0zm1BXOXimd3i27ycjAt6X7axyt1c=;
 b=7Y1FNnft+z3d4gmX7kCKQOVlMEhx1ydv/qS5cyZbJnu8a1BYocQG/m4GJL0fIf32bk
 A9dJe0XQ4PR7OzyGzMs5hZG1FMc+AdixPpgYV9fJfpCPDxXFvuvYRTbDkcNbaTdrAq4Y
 ityropNUvw/ZYw2BgQKpVW5NDRsUT6BIe13voASVrbQdMy+BsdAT1idi/hzy3Xy+61K4
 uMs7OPv9b4m2alINtpTvl6hq6I+ye6fkLq0xPpU7/vbxhHr8Qwaz9YzVaaYgtwlo5Ey1
 4aJ0uz8sinMJOvkXtT9wiz/A8/eJtZVv4QsS+P2jOsaSMydMEen9s6dAafNmi5FA5/qv
 OQKA==
X-Gm-Message-State: AAQBX9eQcrKgKmo9dytu0zoq792lFzaps19PQma/DPc5RktSNDv20/UY
 4OGbEbvv3uvbZL9Y2EufJPYr7w==
X-Google-Smtp-Source: AKy350azx5qjLTJIYLCDCfdeM/z+nx8o5HVz0WcrmXuRcb964FuH1R/r2IAXFnphdVUg7ElZbC7SXg==
X-Received: by 2002:ac2:43a4:0:b0:4ea:f526:5bee with SMTP id
 t4-20020ac243a4000000b004eaf5265beemr7893904lfl.11.1680350132632; 
 Sat, 01 Apr 2023 04:55:32 -0700 (PDT)
Received: from [192.168.1.101] (abxj225.neoplus.adsl.tpnet.pl. [83.9.3.225])
 by smtp.gmail.com with ESMTPSA id
 w8-20020ac254a8000000b004e83f386878sm786737lfk.153.2023.04.01.04.55.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Apr 2023 04:55:32 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Sat, 01 Apr 2023 13:54:52 +0200
Subject: [PATCH v6 15/15] drm/msm/a6xx: Add A610 speedbin support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-topic-gmuwrapper-v6-15-2034115bb60c@linaro.org>
References: <20230223-topic-gmuwrapper-v6-0-2034115bb60c@linaro.org>
In-Reply-To: <20230223-topic-gmuwrapper-v6-0-2034115bb60c@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1680350084; l=1852;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=/AkqnGngmcLmZe0/0dqCMVNhVeDNpUZqOtTS2j9nX1Q=;
 b=usbd75h1G/MzZMxQHI2wq6t4BEKTNhpk+Isjf6v/HYYNAGutNoR1I0u4FRvYOZtYxNIEFB5z0ccu
 bEdbYbPfDgPxI6HxpJwVMuOz7DB944fAMB/nw7uB9a+8Ff7nuHQO
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
index f692f540c13c..e3be878afbb0 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2100,6 +2100,30 @@ static bool a6xx_progress(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
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
@@ -2196,6 +2220,9 @@ static u32 fuse_to_supp_hw(struct device *dev, struct adreno_gpu *adreno_gpu, u3
 {
 	u32 val = UINT_MAX;
 
+	if (adreno_is_a610(adreno_gpu))
+		val = a610_get_speed_bin(fuse);
+
 	if (adreno_is_a618(adreno_gpu))
 		val = a618_get_speed_bin(fuse);
 

-- 
2.40.0

