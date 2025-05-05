Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7323AA8A31
	for <lists+dri-devel@lfdr.de>; Mon,  5 May 2025 02:15:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 154A910E2CD;
	Mon,  5 May 2025 00:15:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="NJVHk4qT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 724CF10E27E
 for <dri-devel@lists.freedesktop.org>; Mon,  5 May 2025 00:15:24 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 544MP2Jj029526
 for <dri-devel@lists.freedesktop.org>; Mon, 5 May 2025 00:15:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 jajSFMr5lYMffK+9G2gWOOh1EauR/2XrX+fSYkHoXAE=; b=NJVHk4qTFVxyiCln
 EM7Ecp2Z0yhoTyZtUQcHJvnH2FP2DDa4etXsMlATuGxd+ikHccAgGkJTIR4E0ctE
 L0ctV6InLfJ6Rv8RIZyCSHTSQd7WzU1S1wwHPP7aPlgzmUpJQeyLivW55Rk7E63a
 aXlRJQmdG7/ZcdDkP/gzb348yK6MKK/R36qjetRArP+yqdz9alx+B54jXrrRINPG
 bi4JFXYPKLaiBR0uIXluuqB3paygxpttZso0N/NJiwJ3Cmxs0wh0eSPF3Zstb5a1
 PR7+XkWQ5Q7JehnlRb+c+fUAUikp4BpHIjYmKtDgqDLxmW3mqc0RLzyHQ/Rgy0Lk
 BD00PA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46d9nktqsb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 05 May 2025 00:15:23 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c5d608e703so737734985a.3
 for <dri-devel@lists.freedesktop.org>; Sun, 04 May 2025 17:15:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746404122; x=1747008922;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jajSFMr5lYMffK+9G2gWOOh1EauR/2XrX+fSYkHoXAE=;
 b=SreQylOKsvksfF8mDRFEvScosnDsDdiRJ9MSj+abfm3cUGZOOhznKqloZggAdqdOhT
 4Gfe3TbM9GHCFWso9xPPjjHzqSVNkTnOsuG6yxUU6vTZnzR6GHc5J6OvnVWDQRbgwLL+
 /3fukJq9+QYAO863/jarVZy+7XQ9Dbj70yUDfX3gxQXI1aDGz6h3uqOAc2rpJ8E8S6JL
 HzmIGNyiq8v0AfeFu7zFHNmfVuortnvT5139KWTx+0dZVgiYaFICCwppCcefSLBTJiJs
 HnzjMaLjEIPDTFDo9Z8A1S489feuZ13afheaxo+6FfQIVpV1xI9mEugRlNECUOtwZ9fi
 7tCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXN+P7867tJ5St8J4w1BLyJGz8EcWWVIwjx7Z00gSRPv0qBo380dWRJhifGy25y+cKcd4wUQn1CBrY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyrLAtYG33OExVY2zawmEFr51UkXl1mHfnVCUWnlAm33Zb1iZol
 SpQQLdBmyEnAOxXi5qMzsW6vagx1ZrroAUGGnmpbDKBxEnTq58UJKqOZn7xDeVi/Rjj4SL4pJ9L
 NvIMyJC0ibg44774mO8NldgezitxksNbpEaEYrZ1z8IJN0JDgZGjwgFBaOH0wGJWHom0=
X-Gm-Gg: ASbGnctAsQ2TVc3C7H5y19gkkNC4GW+HUK5+LUupm9z4bhifSC8kuHUewGn8oNWB+8X
 7RoBL826XXPZhYWpOwaeWL4gyCljjEl6qtidWsQLgMXzI5IrqzYAk4+oqD+gC1X3NanQB5UxH3t
 v1XqoBx9gNaj+mqUOi1p7waxNGLKt7XuMqij6DdJC628TgFaytNiB8Wvo8Ox5uHfgh1WdqFXxjI
 COjqNXb6YsDObIKoxiN5TPrCN9e1i+C3eHGCgnQSKbKMyTbR/8DxCjt3yVC8BqyDuhhtWR8E2xX
 SDjUkx8KOlqVbst70J9Ks2G4wOQV+XkyCXfZDvPLZg2Fwv+24ARI2zQ7Ht7yaK4bJ4x1LSh2U4s
 tb/IQTTxTef4vu8pWl98rbE9T
X-Received: by 2002:a05:620a:244c:b0:7c7:b5e1:4e45 with SMTP id
 af79cd13be357-7cae3a8944cmr668304785a.9.1746404122578; 
 Sun, 04 May 2025 17:15:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGHfQd4fdpXw2cyT7Pt13a3SfvjKp9b+b5JPOEFBwoYuX3US9TJSLCx2Mkjm87vAk3BLxuWHw==
X-Received: by 2002:a05:620a:244c:b0:7c7:b5e1:4e45 with SMTP id
 af79cd13be357-7cae3a8944cmr668300985a.9.1746404122233; 
 Sun, 04 May 2025 17:15:22 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54ea94ce656sm1454066e87.105.2025.05.04.17.15.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 May 2025 17:15:20 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 05 May 2025 03:14:54 +0300
Subject: [PATCH v5 10/13] drm/msm/hdmi: rename hpd_clks to pwr_clks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250505-fd-hdmi-hpd-v5-10-48541f76318c@oss.qualcomm.com>
References: <20250505-fd-hdmi-hpd-v5-0-48541f76318c@oss.qualcomm.com>
In-Reply-To: <20250505-fd-hdmi-hpd-v5-0-48541f76318c@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Jessica Zhang <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4084;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=+WpYll0ay0xnF4O7o5nyBXY9cEIfu8gX+WDGXWRK1Mc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoGAL85+RFzHM4YW1ldHLSewJCste9D6pvpiH4n
 5xqiI3GQSGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaBgC/AAKCRCLPIo+Aiko
 1bfbB/43PPjrEo0fZiqjfyPKdV/fFRD0T1cm2kWrnY4MjGNPPCrcuHruIMnGeY6iVLXiqEepty1
 ZtAlbR6vbvGcNZcCw+qfBvRYP54xITkPSVDU+O3mTXaO3zBu3cNaBXE4ZkUurvvBbMI90kIC+5d
 7e2Pwj7AxIpS6gvWe4emxps0737rHt1k0NMB49iR0yki8RetQ4KpxJsitfymSZ7xyir+m1kt7pN
 90vTKvqo2y9IzfCeGw5fNa/Sd+vUsqHweUwFRlTtpG7j24czau8dS8xKs8KH3ggDyoB5ZvFtgn1
 /D2zKJ788jbDu5LEhWBdwoaQi66btF5XMGm66pOWOPopxY1W
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDAwMCBTYWx0ZWRfXyjz81zrgvdYT
 FCeq02r38ttkLtD7inLio+406g9aJkh3T4FBwtDKK46WYHWhXfVLxBbzHxktb8UV+aV+FSbcsgb
 y7JPMntQF6GpPygus19IfaoyoAvnw4Q6J/hb5DFC596YgZf/lw5HN8jjZf0PDZavL38EfSv2mTz
 e73fW+W0zynLKJLA/FtA1iTpqnm2e9b+sgKh7j0BTRvbjYw5QgFRXRdygE/fcV0GCv+b9JSCO2Y
 eNRstFa9XBjdAsbdNUK0iHz0t2qb0bwvHqCJEV2k7LUGUn6Bjemb04v6fnuPhdr9VdRx61sUxRt
 yL4jPRzsmH9i1GYbwHomnwSiPcuzWnOwlVf/K4hByDSa5cgcfFJ91oZwdwacAjfKIBnrcQeDg1L
 LiVALbAU3xPdyb/OCaNluQxdH63qf+WO8UTDwua9qC3638YbNJTBDlLmXzpgXPT2vpPJO4mu
X-Proofpoint-GUID: sYGemNo-dGlodGV9Yr43Ebbrp_R3cgSH
X-Authority-Analysis: v=2.4 cv=LpeSymdc c=1 sm=1 tr=0 ts=6818031b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=5NGqCyE2FtwQWQBj1xQA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: sYGemNo-dGlodGV9Yr43Ebbrp_R3cgSH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-04_09,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 adultscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 clxscore=1015 phishscore=0
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505050000
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

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

As these clocks are now used in the runtime PM callbacks, they have no
connection to 'HPD'. Rename corresponding fields to follow clocks
purpose, to power up the HDMI controller.

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c | 26 +++++++++++++-------------
 drivers/gpu/drm/msm/hdmi/hdmi.h |  6 +++---
 2 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index ded20176aa805db98b0599e617eb6ea9bce122d8..8e6e3e6a04bd2d86bcbd23c110f3533f56c17887 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -226,19 +226,19 @@ int msm_hdmi_modeset_init(struct hdmi *hdmi,
 	.item ## _cnt   = ARRAY_SIZE(item ## _names_ ## entry)
 
 static const char * const pwr_reg_names_8960[] = {"core-vdda"};
-static const char * const hpd_clk_names_8960[] = {"core", "master_iface", "slave_iface"};
+static const char * const pwr_clk_names_8960[] = {"core", "master_iface", "slave_iface"};
 
 static const struct hdmi_platform_config hdmi_tx_8960_config = {
 		HDMI_CFG(pwr_reg, 8960),
-		HDMI_CFG(hpd_clk, 8960),
+		HDMI_CFG(pwr_clk, 8960),
 };
 
 static const char * const pwr_reg_names_8x74[] = {"core-vdda", "core-vcc"};
-static const char * const hpd_clk_names_8x74[] = {"iface", "core", "mdp_core", "alt_iface"};
+static const char * const pwr_clk_names_8x74[] = {"iface", "core", "mdp_core", "alt_iface"};
 
 static const struct hdmi_platform_config hdmi_tx_8974_config = {
 		HDMI_CFG(pwr_reg, 8x74),
-		HDMI_CFG(hpd_clk, 8x74),
+		HDMI_CFG(pwr_clk, 8x74),
 };
 
 static int msm_hdmi_bind(struct device *dev, struct device *master, void *data)
@@ -333,17 +333,17 @@ static int msm_hdmi_dev_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to get pwr regulators\n");
 
-	hdmi->hpd_clks = devm_kcalloc(&pdev->dev,
-				      config->hpd_clk_cnt,
-				      sizeof(hdmi->hpd_clks[0]),
+	hdmi->pwr_clks = devm_kcalloc(&pdev->dev,
+				      config->pwr_clk_cnt,
+				      sizeof(hdmi->pwr_clks[0]),
 				      GFP_KERNEL);
-	if (!hdmi->hpd_clks)
+	if (!hdmi->pwr_clks)
 		return -ENOMEM;
 
-	for (i = 0; i < config->hpd_clk_cnt; i++)
-		hdmi->hpd_clks[i].id = config->hpd_clk_names[i];
+	for (i = 0; i < config->pwr_clk_cnt; i++)
+		hdmi->pwr_clks[i].id = config->pwr_clk_names[i];
 
-	ret = devm_clk_bulk_get(&pdev->dev, config->hpd_clk_cnt, hdmi->hpd_clks);
+	ret = devm_clk_bulk_get(&pdev->dev, config->pwr_clk_cnt, hdmi->pwr_clks);
 	if (ret)
 		return ret;
 
@@ -401,7 +401,7 @@ static int msm_hdmi_runtime_suspend(struct device *dev)
 	struct hdmi *hdmi = dev_get_drvdata(dev);
 	const struct hdmi_platform_config *config = hdmi->config;
 
-	clk_bulk_disable_unprepare(config->hpd_clk_cnt, hdmi->hpd_clks);
+	clk_bulk_disable_unprepare(config->pwr_clk_cnt, hdmi->pwr_clks);
 
 	pinctrl_pm_select_sleep_state(dev);
 
@@ -424,7 +424,7 @@ static int msm_hdmi_runtime_resume(struct device *dev)
 	if (ret)
 		goto fail;
 
-	ret = clk_bulk_prepare_enable(config->hpd_clk_cnt, hdmi->hpd_clks);
+	ret = clk_bulk_prepare_enable(config->pwr_clk_cnt, hdmi->pwr_clks);
 	if (ret)
 		goto fail;
 
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h b/drivers/gpu/drm/msm/hdmi/hdmi.h
index 7e3c035cf913d713ed63379a843897fad96b23ab..a28437beb1574553c1dc00a0c693b390389353e0 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.h
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
@@ -48,7 +48,7 @@ struct hdmi {
 	phys_addr_t mmio_phy_addr;
 
 	struct regulator_bulk_data *pwr_regs;
-	struct clk_bulk_data *hpd_clks;
+	struct clk_bulk_data *pwr_clks;
 	struct clk *extp_clk;
 
 	struct gpio_desc *hpd_gpiod;
@@ -87,8 +87,8 @@ struct hdmi_platform_config {
 	int pwr_reg_cnt;
 
 	/* clks that need to be on for hpd: */
-	const char * const *hpd_clk_names;
-	int hpd_clk_cnt;
+	const char * const *pwr_clk_names;
+	int pwr_clk_cnt;
 };
 
 struct hdmi_bridge {

-- 
2.39.5

