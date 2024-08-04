Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A02BD946C3F
	for <lists+dri-devel@lfdr.de>; Sun,  4 Aug 2024 07:40:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D12710E0A3;
	Sun,  4 Aug 2024 05:40:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Oe5pTTTB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EA3F10E0A0
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Aug 2024 05:40:26 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-5afa207b8bfso10075424a12.0
 for <dri-devel@lists.freedesktop.org>; Sat, 03 Aug 2024 22:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1722750025; x=1723354825; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=F5mt80rOA9qN8jWsdvy84Xdf9Lmua8radXA2BhT4YbQ=;
 b=Oe5pTTTB0J1tFxI4Nxkg72LkmvgHDSpBSqueCkBj5dO1qZQkutlAmzNujS864uElsO
 Ir/7r7T9MnW/w0Beub710GY6FrZr+2GLkQ4nCJxuBtkfI1EXLmn00S5umEzLSvjjDFlZ
 5UKXjiwSdYblBrUmv3sk8HRK4cQSeW3oD0UwyLnHTQqRNTS3enVqd6aAHf9OMS5loqrd
 lreZvL0411vxWUMPRUXgCyzBTaCiD1VYC0spprtie95TYO9nvBG3iBkbM5Z7z59pgGdM
 d9OvWpFBDR0YYeXtjm48uN8u6xMKNgtLEaFFkxyXfS/oL2CwsQz5XY9DFp0bMnHJITx4
 Cy4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722750025; x=1723354825;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F5mt80rOA9qN8jWsdvy84Xdf9Lmua8radXA2BhT4YbQ=;
 b=OFF1A3p8dWX9EghNrPNyLIA77lTlY7RltOWRXAzvrdfcmvlYWh4F8XjZQGFlDgKydV
 0uBnMGRg1FWHiKtFbQSC9g1PhZIReVf6WUl/KdfiYBcVtgFUmyodC5/LFIbvi3gVsVtt
 G2QPAoZRszrHgRDEF1SEdKZWY4qTDmzelBziC0+enQoNDfrLtdlrgtUsq1WZNtIn7lNm
 RuBVi6ANJCXc2kvC17RyabI3z+5s+4YrXQyiub8AUh1UU4mdscAd6dfKhnkiJ+SzJOMC
 7bkA9s0HkPPLy2rLnxMjVT9wvZQKQ8Xatkvvrk/Tc/j9/OQPcD9S/BLUy3oT1BRQ/e4V
 iXHQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXL41Cy72ZA8PiGSVMy7q1OHDED4mnYtEa5xkLHbn/EWQaDtnh84NTyhzdxnCXa91Zxea+vjjWnDE8PsrZ2qG0j65d3JKPyzQvt6Hyzwqsc
X-Gm-Message-State: AOJu0Yz6xUzdyDz9fJtRTebVbztn57ee+1L14uztwwibOPHBD8IziA+C
 6h4o+mfr//e0p7ygw8kadfEA84niW1k6gDfKIaLn8cCRdvuLk7n+FMSdN1a4r6E=
X-Google-Smtp-Source: AGHT+IFcXcCjeK+kirr9HxHNSNYgUwoTUFv8rKvg+BBRx9kFrveQa6yajGPUP6ydfDNRdEA9/ap3lQ==
X-Received: by 2002:a17:907:3f0c:b0:a77:eb34:3b4d with SMTP id
 a640c23a62f3a-a7dc4db8ba5mr615532466b.13.1722750024706; 
 Sat, 03 Aug 2024 22:40:24 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7dc9bc3bd7sm292248466b.34.2024.08.03.22.40.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Aug 2024 22:40:24 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 04 Aug 2024 08:40:08 +0300
Subject: [PATCH 04/11] interconnect: qcom: sm8350: drop DISP nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240804-sm8350-fixes-v1-4-1149dd8399fe@linaro.org>
References: <20240804-sm8350-fixes-v1-0-1149dd8399fe@linaro.org>
In-Reply-To: <20240804-sm8350-fixes-v1-0-1149dd8399fe@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Jonathan Marek <jonathan@marek.ca>, 
 Robert Foss <rfoss@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Georgi Djakov <djakov@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Mike Tipton <quic_mdtipton@quicinc.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7265;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=tcJ7LQ1yfUyMvLJV6hSYPEPDWM/piu7AD4k8+F7Xn8M=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmrxQ+ycn2GSCazqz66VoIUtMr5Q536pilX24Rk
 FCuX2JYrTyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZq8UPgAKCRCLPIo+Aiko
 1U+mCACCX8GXfbbnShUSyy2kUZweMQ3X+zXZnp1j4Y19+e8ylvhlxJJkWdiTinLXXILjm81rmzH
 NTE019I3z/wpfIyt29BJZ4GTnZhCgwH0AemWgRpIng9WbpST14WHHPeJEhSMx7+Mg1WfBLobiGv
 4kUa9oHRT7XEFPGPEP7Oyf5vOkilJZXSgHx04kBgAh+u4UhlXzLfHZuhgE64WHIepBb9/XFE/AI
 Y0nlAhwYY6l18Ha3/GIxdt54kwf0+jaIvei7zvg895bwWmvvieBkZzr7Klxrf0Jv3D9mzId5tEW
 KB+wOX/I0cC4qTmC79KjzpoBLPnmjpJPNd6o6lGpPIhUphuG
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

The msm-5.x kernels have additional display RSC and separate display BCM
voter. Since upstream kernel doesn't yet provide display RSC, we end up
duplicating several nodes, which can result in incorrect votes being
cast. Drop *_DISP nodes.

Fixes: d26a56674497 ("interconnect: qcom: Add SM8350 interconnect provider driver")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/interconnect/qcom/sm8350.c | 154 -------------------------------------
 drivers/interconnect/qcom/sm8350.h |  10 ---
 2 files changed, 164 deletions(-)

diff --git a/drivers/interconnect/qcom/sm8350.c b/drivers/interconnect/qcom/sm8350.c
index b321c3009acb..108934fc8ebf 100644
--- a/drivers/interconnect/qcom/sm8350.c
+++ b/drivers/interconnect/qcom/sm8350.c
@@ -628,60 +628,6 @@ static struct qcom_icc_node xm_gic = {
 	.links = { SM8350_SLAVE_SNOC_GEM_NOC_GC },
 };
 
-static struct qcom_icc_node qnm_mnoc_hf_disp = {
-	.name = "qnm_mnoc_hf_disp",
-	.id = SM8350_MASTER_MNOC_HF_MEM_NOC_DISP,
-	.channels = 2,
-	.buswidth = 32,
-	.num_links = 1,
-	.links = { SM8350_SLAVE_LLCC_DISP },
-};
-
-static struct qcom_icc_node qnm_mnoc_sf_disp = {
-	.name = "qnm_mnoc_sf_disp",
-	.id = SM8350_MASTER_MNOC_SF_MEM_NOC_DISP,
-	.channels = 2,
-	.buswidth = 32,
-	.num_links = 1,
-	.links = { SM8350_SLAVE_LLCC_DISP },
-};
-
-static struct qcom_icc_node llcc_mc_disp = {
-	.name = "llcc_mc_disp",
-	.id = SM8350_MASTER_LLCC_DISP,
-	.channels = 4,
-	.buswidth = 4,
-	.num_links = 1,
-	.links = { SM8350_SLAVE_EBI1_DISP },
-};
-
-static struct qcom_icc_node qxm_mdp0_disp = {
-	.name = "qxm_mdp0_disp",
-	.id = SM8350_MASTER_MDP0_DISP,
-	.channels = 1,
-	.buswidth = 32,
-	.num_links = 1,
-	.links = { SM8350_SLAVE_MNOC_HF_MEM_NOC_DISP },
-};
-
-static struct qcom_icc_node qxm_mdp1_disp = {
-	.name = "qxm_mdp1_disp",
-	.id = SM8350_MASTER_MDP1_DISP,
-	.channels = 1,
-	.buswidth = 32,
-	.num_links = 1,
-	.links = { SM8350_SLAVE_MNOC_HF_MEM_NOC_DISP },
-};
-
-static struct qcom_icc_node qxm_rot_disp = {
-	.name = "qxm_rot_disp",
-	.id = SM8350_MASTER_ROTATOR_DISP,
-	.channels = 1,
-	.buswidth = 32,
-	.num_links = 1,
-	.links = { SM8350_SLAVE_MNOC_SF_MEM_NOC_DISP },
-};
-
 static struct qcom_icc_node qns_a1noc_snoc = {
 	.name = "qns_a1noc_snoc",
 	.id = SM8350_SLAVE_A1NOC_SNOC,
@@ -1320,40 +1266,6 @@ static struct qcom_icc_node srvc_snoc = {
 	.buswidth = 4,
 };
 
-static struct qcom_icc_node qns_llcc_disp = {
-	.name = "qns_llcc_disp",
-	.id = SM8350_SLAVE_LLCC_DISP,
-	.channels = 4,
-	.buswidth = 16,
-	.num_links = 1,
-	.links = { SM8350_MASTER_LLCC_DISP },
-};
-
-static struct qcom_icc_node ebi_disp = {
-	.name = "ebi_disp",
-	.id = SM8350_SLAVE_EBI1_DISP,
-	.channels = 4,
-	.buswidth = 4,
-};
-
-static struct qcom_icc_node qns_mem_noc_hf_disp = {
-	.name = "qns_mem_noc_hf_disp",
-	.id = SM8350_SLAVE_MNOC_HF_MEM_NOC_DISP,
-	.channels = 2,
-	.buswidth = 32,
-	.num_links = 1,
-	.links = { SM8350_MASTER_MNOC_HF_MEM_NOC_DISP },
-};
-
-static struct qcom_icc_node qns_mem_noc_sf_disp = {
-	.name = "qns_mem_noc_sf_disp",
-	.id = SM8350_SLAVE_MNOC_SF_MEM_NOC_DISP,
-	.channels = 2,
-	.buswidth = 32,
-	.num_links = 1,
-	.links = { SM8350_MASTER_MNOC_SF_MEM_NOC_DISP },
-};
-
 static struct qcom_icc_bcm bcm_acv = {
 	.name = "ACV",
 	.enable_mask = BIT(3),
@@ -1583,55 +1495,6 @@ static struct qcom_icc_bcm bcm_sn14 = {
 	.nodes = { &qns_pcie_mem_noc },
 };
 
-static struct qcom_icc_bcm bcm_acv_disp = {
-	.name = "ACV",
-	.keepalive = false,
-	.num_nodes = 1,
-	.nodes = { &ebi_disp },
-};
-
-static struct qcom_icc_bcm bcm_mc0_disp = {
-	.name = "MC0",
-	.keepalive = false,
-	.num_nodes = 1,
-	.nodes = { &ebi_disp },
-};
-
-static struct qcom_icc_bcm bcm_mm0_disp = {
-	.name = "MM0",
-	.keepalive = false,
-	.num_nodes = 1,
-	.nodes = { &qns_mem_noc_hf_disp },
-};
-
-static struct qcom_icc_bcm bcm_mm1_disp = {
-	.name = "MM1",
-	.keepalive = false,
-	.num_nodes = 2,
-	.nodes = { &qxm_mdp0_disp, &qxm_mdp1_disp },
-};
-
-static struct qcom_icc_bcm bcm_mm4_disp = {
-	.name = "MM4",
-	.keepalive = false,
-	.num_nodes = 1,
-	.nodes = { &qns_mem_noc_sf_disp },
-};
-
-static struct qcom_icc_bcm bcm_mm5_disp = {
-	.name = "MM5",
-	.keepalive = false,
-	.num_nodes = 1,
-	.nodes = { &qxm_rot_disp },
-};
-
-static struct qcom_icc_bcm bcm_sh0_disp = {
-	.name = "SH0",
-	.keepalive = false,
-	.num_nodes = 1,
-	.nodes = { &qns_llcc_disp },
-};
-
 static struct qcom_icc_bcm * const aggre1_noc_bcms[] = {
 };
 
@@ -1785,7 +1648,6 @@ static struct qcom_icc_bcm * const gem_noc_bcms[] = {
 	&bcm_sh2,
 	&bcm_sh3,
 	&bcm_sh4,
-	&bcm_sh0_disp,
 };
 
 static struct qcom_icc_node * const gem_noc_nodes[] = {
@@ -1808,9 +1670,6 @@ static struct qcom_icc_node * const gem_noc_nodes[] = {
 	[SLAVE_SERVICE_GEM_NOC_1] = &srvc_even_gemnoc,
 	[SLAVE_SERVICE_GEM_NOC_2] = &srvc_odd_gemnoc,
 	[SLAVE_SERVICE_GEM_NOC] = &srvc_sys_gemnoc,
-	[MASTER_MNOC_HF_MEM_NOC_DISP] = &qnm_mnoc_hf_disp,
-	[MASTER_MNOC_SF_MEM_NOC_DISP] = &qnm_mnoc_sf_disp,
-	[SLAVE_LLCC_DISP] = &qns_llcc_disp,
 };
 
 static const struct qcom_icc_desc sm8350_gem_noc = {
@@ -1843,15 +1702,11 @@ static const struct qcom_icc_desc sm8350_lpass_ag_noc = {
 static struct qcom_icc_bcm * const mc_virt_bcms[] = {
 	&bcm_acv,
 	&bcm_mc0,
-	&bcm_acv_disp,
-	&bcm_mc0_disp,
 };
 
 static struct qcom_icc_node * const mc_virt_nodes[] = {
 	[MASTER_LLCC] = &llcc_mc,
 	[SLAVE_EBI1] = &ebi,
-	[MASTER_LLCC_DISP] = &llcc_mc_disp,
-	[SLAVE_EBI1_DISP] = &ebi_disp,
 };
 
 static const struct qcom_icc_desc sm8350_mc_virt = {
@@ -1866,10 +1721,6 @@ static struct qcom_icc_bcm * const mmss_noc_bcms[] = {
 	&bcm_mm1,
 	&bcm_mm4,
 	&bcm_mm5,
-	&bcm_mm0_disp,
-	&bcm_mm1_disp,
-	&bcm_mm4_disp,
-	&bcm_mm5_disp,
 };
 
 static struct qcom_icc_node * const mmss_noc_nodes[] = {
@@ -1886,11 +1737,6 @@ static struct qcom_icc_node * const mmss_noc_nodes[] = {
 	[SLAVE_MNOC_HF_MEM_NOC] = &qns_mem_noc_hf,
 	[SLAVE_MNOC_SF_MEM_NOC] = &qns_mem_noc_sf,
 	[SLAVE_SERVICE_MNOC] = &srvc_mnoc,
-	[MASTER_MDP0_DISP] = &qxm_mdp0_disp,
-	[MASTER_MDP1_DISP] = &qxm_mdp1_disp,
-	[MASTER_ROTATOR_DISP] = &qxm_rot_disp,
-	[SLAVE_MNOC_HF_MEM_NOC_DISP] = &qns_mem_noc_hf_disp,
-	[SLAVE_MNOC_SF_MEM_NOC_DISP] = &qns_mem_noc_sf_disp,
 };
 
 static const struct qcom_icc_desc sm8350_mmss_noc = {
diff --git a/drivers/interconnect/qcom/sm8350.h b/drivers/interconnect/qcom/sm8350.h
index 328d15238a0d..074c6131ab36 100644
--- a/drivers/interconnect/qcom/sm8350.h
+++ b/drivers/interconnect/qcom/sm8350.h
@@ -154,15 +154,5 @@
 #define SM8350_SLAVE_PCIE_1				143
 #define SM8350_SLAVE_QDSS_STM				144
 #define SM8350_SLAVE_TCU				145
-#define SM8350_MASTER_LLCC_DISP				146
-#define SM8350_MASTER_MNOC_HF_MEM_NOC_DISP		147
-#define SM8350_MASTER_MNOC_SF_MEM_NOC_DISP		148
-#define SM8350_MASTER_MDP0_DISP				149
-#define SM8350_MASTER_MDP1_DISP				150
-#define SM8350_MASTER_ROTATOR_DISP			151
-#define SM8350_SLAVE_EBI1_DISP				152
-#define SM8350_SLAVE_LLCC_DISP				153
-#define SM8350_SLAVE_MNOC_HF_MEM_NOC_DISP		154
-#define SM8350_SLAVE_MNOC_SF_MEM_NOC_DISP		155
 
 #endif

-- 
2.39.2

