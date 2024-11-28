Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CED499DB58C
	for <lists+dri-devel@lfdr.de>; Thu, 28 Nov 2024 11:25:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04AA910E0A0;
	Thu, 28 Nov 2024 10:25:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ZPyN+hvE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 895E010E32C
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2024 10:25:51 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-3823f1ed492so1002719f8f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2024 02:25:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732789550; x=1733394350; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=WD4k8z96es8B14gjovDS2FjtHXDh1zXMm66FOvsAIWE=;
 b=ZPyN+hvErGIZTmC0XFzHECw+WippU9BdZO1sxRodlC9KKF1YoAnd1UAcOWXiUZj3DT
 4i0xze6zmCTDed6CB5DGdOSAURFpqY7mIV//cRAoABQyUFFkqaZV3h6MQh6utbHj80hc
 0G3Z7P4H2FQyWTHwJm5o0kCGpC85wZ8pBgmU9jqMCQaz/asCxm3VwBt0/P7FGbPOCgXG
 I2gjpA6fvPkBFL+0nzkUWJu/qnluRNnafrNbqY4lgol1oaM2x/NnVY+4s4vzZXvKgQPI
 3ypGcGl1Ga5F+DS4nSwK+uKob4/R4rMwUEPCqW7HxoXTWF5Eqa2/0pHbGpIIFD14+RvQ
 XNyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732789550; x=1733394350;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WD4k8z96es8B14gjovDS2FjtHXDh1zXMm66FOvsAIWE=;
 b=h+aJlUusSN1ro61cYKjTllVC2ITrHjqfcOFac69QtQKucZ6wLdUYd0jtEXfudlAhlp
 Ars2DYfCPX3N/GGd41Hx5wBKE/HU3TgDobT1i4ojw3eZqbbwAEevW4EebUrr/vlQHmQI
 Cl65FxwrwAdAw67pb0TYitqQYQEUpHSq8lkP2Wfiq8uo1G9ml+rZxFeDK4vUNfMy+o9+
 jD20bctLti8A5TQf3TIWRvFZ9NhFfXmlPUGjqGSAtg79KMZK6fkKG4k9IT9X9GeRUa+T
 crRJ185l4jzybfitMnJDTvr1S+IV5Z6MifkYrJ5Fe4OxnBduEGbh+yl40GRd0oeD+ht1
 jq3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8DWENHYldBh4TOrVW3/An8zkMLwiBkkUuUNjP7vd+eCoNzOkB17k+yIJx8lnySUSyNwsXToc8q7g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxMLQmcFR6JffvXtZnBAKFazdYu38uGoVlQ+mRW+Q6xmXWweTsv
 HcvlBbEYGLIuzf/7vsB3+9EUqyyM4VRKrs3/nBLcSxnNoDkpaatHPaU4Sig0GtftXyy8zClo0MC
 pC5I=
X-Gm-Gg: ASbGncvS3YJtd+2bOJcqtiuzsjusbt79Wa/RIi6fJ95KER339lnv2TEct2s9X76L+hD
 AHkDQijQMW3ObmE3lllNzy+P+GxEy4JadC3Baxd9rR0u7oeVi6kQm1awSr6ro1TiElliHQu49kx
 g1HL0dC7SiLRLug5bA+UDsD3InJsm5dnGSuVeG6SCSZdY2Ibeh3dkipfesKZAjJuXZzHWfxKrp2
 thkdHcFQAWWoFD0bxyKg7j1U8HpkmnPcawKptydmn/mCX/nOt5dq4VLcLWYiGOmANMaRqM=
X-Google-Smtp-Source: AGHT+IHiah0ZporX1boPQyRJnxWi0PYsdjol0KT8cTMhis10crc5JNx+P71COKeg+wguvfAAotc3mA==
X-Received: by 2002:a05:6000:1886:b0:381:f587:40c4 with SMTP id
 ffacd0b85a97d-385cbd816f8mr1897058f8f.21.1732789549807; 
 Thu, 28 Nov 2024 02:25:49 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-385ccd2db59sm1265909f8f.11.2024.11.28.02.25.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Nov 2024 02:25:49 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 28 Nov 2024 11:25:42 +0100
Subject: [PATCH v3 2/7] drm/msm: adreno: add plumbing to generate bandwidth
 vote table for GMU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241128-topic-sm8x50-gpu-bw-vote-v3-2-81d60c10fb73@linaro.org>
References: <20241128-topic-sm8x50-gpu-bw-vote-v3-0-81d60c10fb73@linaro.org>
In-Reply-To: <20241128-topic-sm8x50-gpu-bw-vote-v3-0-81d60c10fb73@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10352;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=Yox7ns7AWe9CCOqpJVniXlXb56y0ulJikyMV2//ouGw=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnSEUoF3bv93h4bMtSfLxgVWFRxPI4RsyxrQT7pcdh
 TeLsSv2JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ0hFKAAKCRB33NvayMhJ0c8MD/
 9bauAz6BQ24jKdL3MiaRqjsQBXRnyyN8H3+OEHNERAiuRP4eySuHynn3f22rF7gjzsoRH9InqhoCZv
 DRFmWyNKjug262/7fUBef1PN0Qo2cvLZyrrpuJpaDbwopt8274/A/P/qQ397pEUDnHyIn6awF6nOsg
 /t/llMHRpp+CRNpIfJMXRiSpU3nXUBAJDyQ7EzT46rgsgii1IO+/HGQdoSGSSjHg4MQlMjmUbPl31u
 LV2rYH+ns7evutzj7fsJP4SEG0/mdSZDekDmeO4ROgI68nl1IRslLLcEAVsiH7Ac2w0utCbU+EFKlr
 5izNzJVg5ZBsaf6azN4S+YhhHjzMV+AHLSA9TJiWtq72n7CIdN6ZyxwwlMp+Xo20qt536Zm3rIDxTr
 VS6dwHj/Bo0Mq6KLXQYKezI/EUuAsCQ49v8FBYTcIIS2loJCDpNjKIKZBjYeAr4ULDGHMK4Dq3/gag
 TX6opBk9lOX4aGq7OlPvOGjT5WvoQVmbFcG8jkplv6IA33Hlim92pTbHDA6Y/I+bb2ayLpCYe54JxJ
 bZzsntw8c6rPC62+U5Om5Jv4HcMtnfyh7oJB1oBkicJr2Lrvu58Yf3J4YHfuX8/BmvtEBn5A96Vv6X
 GhM/gJkh1TpKJ6rwAhc5ok911tYKHrcQKnZuhxn1LqHeUiDT3fC+j3E8h51A==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Adreno GPU Management Unit (GMU) can also scale DDR Bandwidth along
the Frequency and Power Domain level, but by default we leave the
OPP core scale the interconnect ddr path.

While scaling via the interconnect path was sufficient, newer GPUs
like the A750 requires specific vote paremeters and bandwidth to
achieve full functionality.

In order to calculate vote values used by the GPU Management
Unit (GMU), we need to parse all the possible OPP Bandwidths and
create a vote value to be sent to the appropriate Bus Control
Modules (BCMs) declared in the GPU info struct.

This vote value is called IB, while on the othe side the GMU also
takes another vote called AB which is a 16bit quantized value
of the bandwidth against the maximum supported bandwidth.

The vote array will then be used to dynamically generate the GMU
bw_table sent during the GMU power-up.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 174 ++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h |  14 +++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h |   1 +
 drivers/gpu/drm/msm/adreno/a6xx_hfi.h |   5 +
 4 files changed, 194 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 14db7376c712d19446b38152e480bd5a1e0a5198..ee2010a01186721dd377f1655fcf05ddaff77131 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -9,6 +9,7 @@
 #include <linux/pm_domain.h>
 #include <linux/pm_opp.h>
 #include <soc/qcom/cmd-db.h>
+#include <soc/qcom/tcs.h>
 #include <drm/drm_gem.h>
 
 #include "a6xx_gpu.h"
@@ -1287,6 +1288,131 @@ static int a6xx_gmu_memory_probe(struct a6xx_gmu *gmu)
 	return 0;
 }
 
+/**
+ * struct bcm_db - Auxiliary data pertaining to each Bus Clock Manager (BCM)
+ * @unit: divisor used to convert bytes/sec bw value to an RPMh msg
+ * @width: multiplier used to convert bytes/sec bw value to an RPMh msg
+ * @vcd: virtual clock domain that this bcm belongs to
+ * @reserved: reserved field
+ */
+struct bcm_db {
+	__le32 unit;
+	__le16 width;
+	u8 vcd;
+	u8 reserved;
+};
+
+static u64 bcm_div(u64 num, u32 base)
+{
+	/* Ensure that small votes aren't lost. */
+	if (num && num < base)
+		return 1;
+
+	do_div(num, base);
+
+	return num;
+}
+
+static int a6xx_gmu_rpmh_bw_votes_init(const struct a6xx_info *info,
+				       struct a6xx_gmu *gmu)
+{
+	const struct bcm_db *bcm_data[GMU_MAX_BCMS] = { 0 };
+	unsigned int bcm_index, bw_index, bcm_count = 0;
+
+	if (!info->bcms)
+		return 0;
+
+	/* Retrieve BCM data from cmd-db */
+	for (bcm_index = 0; bcm_index < GMU_MAX_BCMS; bcm_index++) {
+		size_t count;
+
+		/* Stop at first unconfigured bcm */
+		if (!info->bcms[bcm_index].name)
+			break;
+
+		bcm_data[bcm_index] = cmd_db_read_aux_data(
+						info->bcms[bcm_index].name,
+						&count);
+		if (IS_ERR(bcm_data[bcm_index]))
+			return PTR_ERR(bcm_data[bcm_index]);
+
+		if (!count)
+			return -EINVAL;
+
+		++bcm_count;
+	}
+
+	/* Generate BCM votes values for each bandwidth & BCM */
+	for (bw_index = 0; bw_index < gmu->nr_gpu_bws; bw_index++) {
+		u32 *data = gmu->gpu_ib_votes[bw_index];
+		u32 bw = gmu->gpu_bw_table[bw_index];
+
+		/* Calculations loosely copied from bcm_aggregate() & tcs_cmd_gen() */
+		for (bcm_index = 0; bcm_index < bcm_count; bcm_index++) {
+			bool commit = false;
+			u64 peak, vote;
+			u16 width;
+			u32 unit;
+
+			/* Skip unconfigured BCM */
+			if (!bcm_data[bcm_index])
+				continue;
+
+			if (bcm_index == bcm_count - 1 ||
+			    (bcm_data[bcm_index + 1] &&
+			     bcm_data[bcm_index]->vcd != bcm_data[bcm_index + 1]->vcd))
+				commit = true;
+
+			if (!bw) {
+				data[bcm_index] = BCM_TCS_CMD(commit, false, 0, 0);
+				continue;
+			}
+
+			if (info->bcms[bcm_index].fixed) {
+				u32 perfmode = 0;
+
+				if (bw >= info->bcms[bcm_index].perfmode_bw)
+					perfmode = info->bcms[bcm_index].perfmode;
+
+				data[bcm_index] = BCM_TCS_CMD(commit, true, 0, perfmode);
+				continue;
+			}
+
+			/* Multiply the bandwidth by the width of the connection */
+			width = le16_to_cpu(bcm_data[bcm_index]->width);
+			peak = bcm_div((u64)bw * width, info->bcms[bcm_index].buswidth);
+
+			/* Input bandwidth value is in KBps, scale the value to BCM unit */
+			unit = le32_to_cpu(bcm_data[bcm_index]->unit);
+			vote = bcm_div(peak * 1000ULL, unit);
+
+			if (vote > BCM_TCS_CMD_VOTE_MASK)
+				vote = BCM_TCS_CMD_VOTE_MASK;
+
+			data[bcm_index] = BCM_TCS_CMD(commit, true, vote, vote);
+		}
+	}
+
+	/* Generate AB votes which are a quantitized bandwidth value */
+	for (bw_index = 0; bw_index < gmu->nr_gpu_bws; bw_index++) {
+		u64 tmp;
+
+		/*
+		 * The AB vote consists of a 16 bit wide quantized level
+		 * against the maximum supported bandwidth.
+		 * Quantization can be calculated as below:
+		 * vote = (bandwidth * 2^16) / max bandwidth
+		 */
+		tmp = gmu->gpu_bw_table[bw_index] * MAX_AB_VOTE;
+
+		/* Divide by the maximum bandwidth to get a quantized value */
+		gmu->gpu_ab_votes[bw_index] =
+			bcm_div(tmp, gmu->gpu_bw_table[gmu->nr_gpu_bws - 1]);
+	}
+
+	return 0;
+}
+
 /* Return the 'arc-level' for the given frequency */
 static unsigned int a6xx_gmu_get_arc_level(struct device *dev,
 					   unsigned long freq)
@@ -1390,12 +1516,15 @@ static int a6xx_gmu_rpmh_arc_votes_init(struct device *dev, u32 *votes,
  * The GMU votes with the RPMh for itself and on behalf of the GPU but we need
  * to construct the list of votes on the CPU and send it over. Query the RPMh
  * voltage levels and build the votes
+ * The GMU can also vote for DDR interconnects, use the OPP bandwidth entries
+ * and BCM parameters to build the votes.
  */
 
 static int a6xx_gmu_rpmh_votes_init(struct a6xx_gmu *gmu)
 {
 	struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
 	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
+	const struct a6xx_info *info = adreno_gpu->info->a6xx;
 	struct msm_gpu *gpu = &adreno_gpu->base;
 	int ret;
 
@@ -1407,6 +1536,10 @@ static int a6xx_gmu_rpmh_votes_init(struct a6xx_gmu *gmu)
 	ret |= a6xx_gmu_rpmh_arc_votes_init(gmu->dev, gmu->cx_arc_votes,
 		gmu->gmu_freqs, gmu->nr_gmu_freqs, "cx.lvl");
 
+	/* Build the interconnect votes */
+	if (info->bcms && gmu->nr_gpu_bws > 1)
+		ret |= a6xx_gmu_rpmh_bw_votes_init(info, gmu);
+
 	return ret;
 }
 
@@ -1442,10 +1575,43 @@ static int a6xx_gmu_build_freq_table(struct device *dev, unsigned long *freqs,
 	return index;
 }
 
+static int a6xx_gmu_build_bw_table(struct device *dev, unsigned long *bandwidths,
+		u32 size)
+{
+	int count = dev_pm_opp_get_opp_count(dev);
+	struct dev_pm_opp *opp;
+	int i, index = 0;
+	unsigned int bandwidth = 1;
+
+	/*
+	 * The OPP table doesn't contain the "off" bandwidth level so we need to
+	 * add 1 to the table size to account for it
+	 */
+
+	if (WARN(count + 1 > size,
+		"The GMU bandwidth table is being truncated\n"))
+		count = size - 1;
+
+	/* Set the "off" bandwidth */
+	bandwidths[index++] = 0;
+
+	for (i = 0; i < count; i++) {
+		opp = dev_pm_opp_find_bw_ceil(dev, &bandwidth, 0);
+		if (IS_ERR(opp))
+			break;
+
+		dev_pm_opp_put(opp);
+		bandwidths[index++] = bandwidth++;
+	}
+
+	return index;
+}
+
 static int a6xx_gmu_pwrlevels_probe(struct a6xx_gmu *gmu)
 {
 	struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
 	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
+	const struct a6xx_info *info = adreno_gpu->info->a6xx;
 	struct msm_gpu *gpu = &adreno_gpu->base;
 
 	int ret = 0;
@@ -1472,6 +1638,14 @@ static int a6xx_gmu_pwrlevels_probe(struct a6xx_gmu *gmu)
 
 	gmu->current_perf_index = gmu->nr_gpu_freqs - 1;
 
+	/*
+	 * The GMU also handles GPU Interconnect Votes so build a list
+	 * of DDR bandwidths from the GPU OPP table
+	 */
+	if (info->bcms)
+		gmu->nr_gpu_bws = a6xx_gmu_build_bw_table(&gpu->pdev->dev,
+			gmu->gpu_bw_table, ARRAY_SIZE(gmu->gpu_bw_table));
+
 	/* Build the list of RPMh votes that we'll send to the GMU */
 	return a6xx_gmu_rpmh_votes_init(gmu);
 }
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
index 88f18ea6a38a08b5b171709e5020010947a5d347..bdfc106cb3a578c90d7cd84f7d4fe228d761a994 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
@@ -21,6 +21,15 @@ struct a6xx_gmu_bo {
 
 #define GMU_MAX_GX_FREQS	16
 #define GMU_MAX_CX_FREQS	4
+#define GMU_MAX_BCMS		3
+
+struct a6xx_bcm {
+	char *name;
+	unsigned int buswidth;
+	bool fixed;
+	unsigned int perfmode;
+	unsigned int perfmode_bw;
+};
 
 /*
  * These define the different GMU wake up options - these define how both the
@@ -85,6 +94,11 @@ struct a6xx_gmu {
 	unsigned long gpu_freqs[GMU_MAX_GX_FREQS];
 	u32 gx_arc_votes[GMU_MAX_GX_FREQS];
 
+	int nr_gpu_bws;
+	unsigned long gpu_bw_table[GMU_MAX_GX_FREQS];
+	u32 gpu_ib_votes[GMU_MAX_GX_FREQS][GMU_MAX_BCMS];
+	u16 gpu_ab_votes[GMU_MAX_GX_FREQS];
+
 	int nr_gmu_freqs;
 	unsigned long gmu_freqs[GMU_MAX_CX_FREQS];
 	u32 cx_arc_votes[GMU_MAX_CX_FREQS];
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index 4aceffb6aae89c781facc2a6e4a82b20b341b6cb..9201a53dd341bf432923ffb44947e015208a3d02 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -44,6 +44,7 @@ struct a6xx_info {
 	u32 gmu_chipid;
 	u32 gmu_cgc_mode;
 	u32 prim_fifo_threshold;
+	const struct a6xx_bcm *bcms;
 };
 
 struct a6xx_gpu {
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.h b/drivers/gpu/drm/msm/adreno/a6xx_hfi.h
index 528110169398f69f16443a29a1594d19c36fb595..52ba4a07d7b9a709289acd244a751ace9bdaab5d 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.h
@@ -173,6 +173,11 @@ struct a6xx_hfi_gx_bw_perf_vote_cmd {
 	u32 bw;
 };
 
+#define AB_VOTE_MASK		GENMASK(31, 16)
+#define MAX_AB_VOTE		(FIELD_MAX(AB_VOTE_MASK) - 1)
+#define AB_VOTE(vote)		FIELD_PREP(AB_VOTE_MASK, (vote))
+#define AB_VOTE_ENABLE		BIT(8)
+
 #define HFI_H2F_MSG_PREPARE_SLUMBER 33
 
 struct a6xx_hfi_prep_slumber_cmd {

-- 
2.34.1

