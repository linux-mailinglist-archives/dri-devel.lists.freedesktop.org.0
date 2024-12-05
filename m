Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F0F49E591B
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2024 16:01:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE81610EEB8;
	Thu,  5 Dec 2024 15:01:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="PB5GHFvU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AEF910EEAF
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2024 15:01:21 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4349e4e252dso11130305e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Dec 2024 07:01:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733410879; x=1734015679; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=SLp+DbXq90D3dyKDJuecin1rC2Og8R+EfL4+PzPI0T8=;
 b=PB5GHFvUIqD4oDS62xYcp79W8ZyLzW/ExOOx9VZpNF/umv3+DinnleoDJYb8OMtZsU
 6sMnxFg382LCh996crQzv5gLmXVD4In933BCR3GJRfBK8YDPIFkIXhHy8KSmGbc3tz9k
 nO1IILLnJ0aVSi1u3f5yTQko5FJ/B7rgec0NscM1wYI5uUrspLtCnAoBuvpI2tqKVLKy
 mY2NymdO03GSUyhSyk2VJftp3owttdvAOqFvKD78JAwAVCzmtIlB6IhMxpxa6ysxnAlA
 gh9kaPN1Ypbe35oUB+eQ8EkWvqkMmueXSPlOwKrZoN7pbl5Jr6FMGOwD1my0mSuh8JVq
 sABw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733410879; x=1734015679;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SLp+DbXq90D3dyKDJuecin1rC2Og8R+EfL4+PzPI0T8=;
 b=Su5O8ZANVOuz/gn7u/fVbyKdcSFbdsQw2HGV1Liav6BuBEF1h2BgTKRZ1fwdVi4h6o
 XCIdjIJE3gE27VFIxAVNnyLav4Qkkkcz+ZNQptmqQUnWCGmuJ8Tht3tNzn4JK6y0kIjh
 vT28zm7L75Hb+GNYzUTdhxBx/RPLKYJLHBe0ZswFiI/st89Y0+wKnVqVFpnbi2btGLOV
 DhSDce5gM30BzZAIn/tP/Cp9OiyUaZCK375o5SZSE8y6HLbZHvNPSE6FglyR14NgOIKE
 foMr1w5FV65OIMiWDID88NSIVTHDSb4Vkasdj2xpZnjb6CE1jD54wQxtj9x+8UrH7+vm
 Dxgw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUcMLL98aKDidnqjaX+ub6Fe28CqUrz650vYhgvoOXGmtNysH7VDQMJ3msCljxmjwwVqhVnvkwWjag=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxAxzMRrrE2OK6zzCSLSXf8RwCzz7Til5cBIMgMVuqE3xo7oyrS
 uMIriXaxH7n6j3ithI0sPB1kG4h87xAG0BqQYmfmihgs/B6BI/8Yepe0wbakmkc=
X-Gm-Gg: ASbGncuSwqgsO4FNxW+0K89cxjx1r6uzK9Pc49Hxdkq1dA+PvOfKyGXEGSOZT9HWDhR
 oVJNQn5dos7w1IoHDxK7+vP2t4nzhKeHJDbvGYERg2mOOtDBJipQQn2biLh5zRVV3GLkZ3kvwyL
 0fSH3mZlN5N7k+1BmitqeGLCzYF1xlUBQwrTKmd1uPwvYpOGKF714Iixu9JsWScfAHrAD7iR/EN
 Sy+Wi8QypDOvWIpKyMI2DZEmriXp4iCVwZU0VQXEKs2lyX5OZsEvIkSnpvwe9vTOwDMDuY=
X-Google-Smtp-Source: AGHT+IEMfDY9Qmea0MCuZ1uuDSp1eGa3UO0w2WAQemaQFoYnGy/nc2emuVkuUMMIV2sbm4DADpQ7RA==
X-Received: by 2002:a05:600c:314a:b0:42c:b905:2bf9 with SMTP id
 5b1f17b1804b1-434d09c3249mr99659355e9.16.1733410878906; 
 Thu, 05 Dec 2024 07:01:18 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434d52c0bc7sm62830795e9.35.2024.12.05.07.01.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Dec 2024 07:01:18 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 05 Dec 2024 16:01:06 +0100
Subject: [PATCH v4 2/7] drm/msm: adreno: add plumbing to generate bandwidth
 vote table for GMU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241205-topic-sm8x50-gpu-bw-vote-v4-2-9650d15dd435@linaro.org>
References: <20241205-topic-sm8x50-gpu-bw-vote-v4-0-9650d15dd435@linaro.org>
In-Reply-To: <20241205-topic-sm8x50-gpu-bw-vote-v4-0-9650d15dd435@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=8870;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=AFBn2s+RM4tSelG+CSWlChEN5C6TfvYSz1urqnevF9E=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnUcA46zLn82xY6K0FF4hjXrIYBRa0M+n6rSmgUKwc
 yNTphQ2JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ1HAOAAKCRB33NvayMhJ0Zv1EA
 CoBQu+5nY+g6PBrEdwALlbQpe/VH9d6/I4KIrwVAjxCzvNNztj222JIlbKSL1xEZfLbfMuYkGwnEQF
 B78yKVToBBAS6o0HbZMVICgi8gUZPZcHCFVcBy9Enpr5fgQvMoDcKY3ofLmgI32PASGs0VjRY3wQNC
 wc9O++ya2oZToSO0aEzBLrv4Djtjb3BbTORY12lWC0n1tXvL1aQgoy/H/mI6YuaxX3SuUFboNE6jSS
 wC+9tOmbc48j/Mupo8xtdThpwkSBcZJvU1b2p/7KN6GPqlk2DEDzNC3gBQplUI+mKjz1SR66+UYVqc
 TFzIX8riw9P428CeWDCyCQWxKbX9eNL8U/CQj0HdZQsk9jd2YAn2BgNMjyBuoqQACbGtRc034dQM9k
 CbP5ddhrOevV8PGewEQjGV1aEXTDxIgOqe+3Hi2JeUtb86xaxdEoo2jON+CxVLs7cK8YMyVdBVJb4f
 XFKPBfmHCPHyhc0ihCeZrpXX0Oifo9YWKvfU4LWhT+t1eCQSU7YEddWtZ5Smut5eOlwqKkIgJeoQGx
 Rkl3/PypZEcr5TdHzzulmtXrQYBdA2IBJYYoBE4W8m2jb9Ms3zj+8b7YMh01oWLPjTwJaWUFutoVm8
 8siD5GDqkLom14D7pwoXIyjRA9EWrrBQaIrbdUEUrgnIkN3qDMtqcK2k0i0Q==
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

