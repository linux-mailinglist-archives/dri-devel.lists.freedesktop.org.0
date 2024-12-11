Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 367679EC739
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 09:30:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5634210EAB5;
	Wed, 11 Dec 2024 08:30:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="or39lskY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BCF810EAAF
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 08:30:03 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-435f8f29f8aso9410955e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 00:30:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733905802; x=1734510602; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=TFLBZPihl+blTy7cMJJuq67tqHiNDu0l7ncCwh5bLTM=;
 b=or39lskYL+sNKKpUi2c0xMxPW+rln6qqReOeRjcVu8rxFPDHC6jV4aNw7jVLGw7tpM
 vBvRm9TTiDV+HDol2RDyxXH4hv9Qw/lGCZ4z7n0e4luG2Brv9wBRz9W0URndhxq0AcMl
 c1exSdI4Cd4NIkNVtlhW3wF+ZCpAxEm0i3ldXQYlXQjD+08YR3a+Rol0kvTtPU5JD0vA
 KcaVdNvuCfKDUsuoXVLTPEbb/Pwhh6Pi2GMggtW/GrG1AJBD28hLUhBARd+oPACdoyZ2
 0lL1QiUrlVg5IXxWbtMLrFH1GoTM+5XHwmqkJMXjMinMjTljMYj3vfYWIG9AiE2H+XUd
 bZ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733905802; x=1734510602;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TFLBZPihl+blTy7cMJJuq67tqHiNDu0l7ncCwh5bLTM=;
 b=gJ3UeF3x07HoSTvpyTy9WVgi69NhYFAvZhYmJvhcf7nYPWbDoB6oLa7p4ti+VFp+fJ
 1Hwg3K5fyHJmxsbtoYP6NRtCSLnFqyMi8Jch6pFytkzM9ZAJunzM/ITVsP9ho3Jz5tF8
 5wGzypQ3sXYcMIFbphIs1lGvuMuCiMuRU5Y5HVFX9dxX+XS0Pp+nkMhSp/oQlexfeJ6e
 r9Qa9J9ut3ibTwFw16DQxvvRKMOK5uVgbhMrLgSqKjzZ/rZwOXpJZ0ybqko2o0hDCnjD
 SbkAGcnKpZHxC5j79LlgMy9TolW4gDvvbPp8N4Mwre+rZoAUTTlMDpqZgKiO+v2VY8CU
 kAFA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWS/cnx5lzC8CzjYr+egECipdnL4/5pLbtecr7jrAW8qeDxUl4oJW6viPf//4K3bl54JMrH55jte7k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzzM1PQ17BksXmgVB2ehgXmIOqN5ZM0lrniqnoJUKvao0ZcKwt/
 fGk5q0QgaHlpMrFAgBnC+++2AKiMQPx6jdMbAZ93pCv8K8FC1Iv8aNF/ptFYp5s=
X-Gm-Gg: ASbGncsmtv9iqnb7T/X/Cg+jL4eBXvbqxpRitLbsNxQZqbEAknpHo2P+lXe5qnwjRjH
 75O7QdLKF92pjz2PeFkrePOHWtMsVGLKT9DX0bLY3SIG6YuzjKVMYlH0uh8YEttGHjdZMPZSgfW
 7+x9qex2sQjjjHdmGJRUOgdQiFhih5EAh+Zt77AtRiuHPv9vCmdJb8GyJCA7lBE4kETf4DIdO/n
 STMV/Mvdi6IQZ2MlpxXP16eWScnq2m+kqyg0xMqkhVSxbzcbZRrbkJt+s2ehjUxU8uCKAcODI8=
X-Google-Smtp-Source: AGHT+IFrQVS3ZF4RkFzo+v35cjZwBpc/gjOsA2T1oPths/28fR1+Yw+VKhxVNh/VM1JIEwssDxFXhQ==
X-Received: by 2002:a05:600c:b86:b0:434:a367:2bd9 with SMTP id
 5b1f17b1804b1-4361c376058mr14027255e9.14.1733905801638; 
 Wed, 11 Dec 2024 00:30:01 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-387824a3e38sm735687f8f.23.2024.12.11.00.30.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 00:30:01 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 11 Dec 2024 09:29:52 +0100
Subject: [PATCH v5 2/7] drm/msm: adreno: add plumbing to generate bandwidth
 vote table for GMU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241211-topic-sm8x50-gpu-bw-vote-v5-2-6112f9f785ec@linaro.org>
References: <20241211-topic-sm8x50-gpu-bw-vote-v5-0-6112f9f785ec@linaro.org>
In-Reply-To: <20241211-topic-sm8x50-gpu-bw-vote-v5-0-6112f9f785ec@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=8926;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=5CQHNDz98zwjgzxFxwxhDaL+J5xp8wvGGCM/v4qnlp4=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnWU2DiMnkrLgdct0amdtuFol1zXjE5Cut3ZaMI8mB
 qtbahcuJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ1lNgwAKCRB33NvayMhJ0XRaEA
 CMvkIs8udDLimnoSNTlE7H67AU6hRyEXwzbaPPpD814BjSk49zeghkYFhUZq9inwJRUaF/3f26Y7Lf
 wnM7Yh1yoO70l9H42NeTbO8/MrljxOnw0ZIICpIyxi32sKaVFP5F5QdrcrCQdEjR3c5WqSaAknabCV
 rQz2aEiwqbOu5VGa8VnMDDJDlqpjgn05x84K0IXHnbWp5Oy+19Y4ROIvs8Qxuwa0pjmErGC9MnBXBx
 BffSfxFjQjMK3BiXTp8mcpUwDchnN/qiwvN1MplajbkwEdxH9y1UI+lYXG3FR6kN+HiGaMiIZPZjVN
 6Li0JnSbiSQxJiJzNu0ZHjE4DUBQxEv8aj/yWSaKQLgfc/cPztNDo+l06IEVGbxO1lkCMRHfDj0cei
 tB6Av6wotgObyDbjbNLq3FvZJcQvHEXTOvNUAEuuHVduBEneBn1W9+T6mNcnkBJmyCRkQTDnLvwdki
 E5vmSQBvSywRxeL8UtWDO7VZXG3ZnNwCz4URR6mrdbRrhlz2ej3jrALZxCzH1uhO5Lp8GNLZLvN5Wc
 1dKTKjY0mVUjF+kGNFjeFhai5+nJcpM9EQ8mk26SAaB0PRzGmQwDJBvAFRxAQiQf3SNQ3ugnwxGEsZ
 QtWyKFi0BjpRqryHMN3O0zFU8eKUfk+L6XBOzao5UW+ec7xcEiBJsfc4pQMQ==
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

This vote value is called IB, while on the other side the GMU also
takes another vote called AB which is a 16bit quantized value
of the floor bandwidth against the maximum supported bandwidth.
The AB vote will be calculated later when setting the frequency.

The vote array will then be used to dynamically generate the GMU
bw_table sent during the GMU power-up.

Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 144 ++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h |  13 +++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h |   1 +
 3 files changed, 158 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 14db7376c712d19446b38152e480bd5a1e0a5198..36696d372a42a27b26a018b19e73bc6d8a4a5235 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -9,6 +9,7 @@
 #include <linux/pm_domain.h>
 #include <linux/pm_opp.h>
 #include <soc/qcom/cmd-db.h>
+#include <soc/qcom/tcs.h>
 #include <drm/drm_gem.h>
 
 #include "a6xx_gpu.h"
@@ -1287,6 +1288,101 @@ static int a6xx_gmu_memory_probe(struct a6xx_gmu *gmu)
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
+			u64 peak;
+			u32 vote;
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
+			peak = (u64)bw * le16_to_cpu(bcm_data[bcm_index]->width);
+			do_div(peak, info->bcms[bcm_index].buswidth);
+
+			/* Input bandwidth value is in KBps, scale the value to BCM unit */
+			peak *= 1000ULL;
+			do_div(peak, le32_to_cpu(bcm_data[bcm_index]->unit));
+
+			vote = clamp(peak, 1, BCM_TCS_CMD_VOTE_MASK);
+
+			data[bcm_index] = BCM_TCS_CMD(commit, true, vote, vote);
+		}
+	}
+
+	return 0;
+}
+
 /* Return the 'arc-level' for the given frequency */
 static unsigned int a6xx_gmu_get_arc_level(struct device *dev,
 					   unsigned long freq)
@@ -1390,12 +1486,15 @@ static int a6xx_gmu_rpmh_arc_votes_init(struct device *dev, u32 *votes,
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
 
@@ -1407,6 +1506,10 @@ static int a6xx_gmu_rpmh_votes_init(struct a6xx_gmu *gmu)
 	ret |= a6xx_gmu_rpmh_arc_votes_init(gmu->dev, gmu->cx_arc_votes,
 		gmu->gmu_freqs, gmu->nr_gmu_freqs, "cx.lvl");
 
+	/* Build the interconnect votes */
+	if (info->bcms && gmu->nr_gpu_bws > 1)
+		ret |= a6xx_gmu_rpmh_bw_votes_init(info, gmu);
+
 	return ret;
 }
 
@@ -1442,10 +1545,43 @@ static int a6xx_gmu_build_freq_table(struct device *dev, unsigned long *freqs,
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
@@ -1472,6 +1608,14 @@ static int a6xx_gmu_pwrlevels_probe(struct a6xx_gmu *gmu)
 
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
index 88f18ea6a38a08b5b171709e5020010947a5d347..2062a2be224768c1937d7768f7b8439920e9e127 100644
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
@@ -85,6 +94,10 @@ struct a6xx_gmu {
 	unsigned long gpu_freqs[GMU_MAX_GX_FREQS];
 	u32 gx_arc_votes[GMU_MAX_GX_FREQS];
 
+	int nr_gpu_bws;
+	unsigned long gpu_bw_table[GMU_MAX_GX_FREQS];
+	u32 gpu_ib_votes[GMU_MAX_GX_FREQS][GMU_MAX_BCMS];
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

-- 
2.34.1

