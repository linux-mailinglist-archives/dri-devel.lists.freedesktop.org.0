Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC6F0AA8A29
	for <lists+dri-devel@lfdr.de>; Mon,  5 May 2025 02:15:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D9A410E18B;
	Mon,  5 May 2025 00:15:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="kZ1oK6V8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7761110E207
 for <dri-devel@lists.freedesktop.org>; Mon,  5 May 2025 00:15:15 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 544MG7gt020706
 for <dri-devel@lists.freedesktop.org>; Mon, 5 May 2025 00:15:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 rzjD6W4PVhu5bnBRA6TwITh0IKW78wTDC6QACU3Fu6Y=; b=kZ1oK6V84mEwN0v+
 3Y6GE+RRy3ttADEs4G9dkCBiySKIBJddQpSz+L+IK82Bzrn8JDHUy5QMvX1Brchc
 v32VgXZLmP4mcLsoxbPrs/f1oMZ/montVVwKviY9FXnxZLPOD0QQI67wZFNOh6nz
 uu2jyZc7kryMHf8XUj8fllk7+S+1KDY+Tslqsz9Al0jelRnYKKMmwJLiQWFifRUI
 dMnS4kCRoZtT9DJtpDkRl+F4Jn/AaKEk3GAeKYB3DJ5IFhcvOM4Ets9ybb7GYdIm
 YAvfpJofWFtcdxHWdYIlq2C7kfI9VSoovL7g1uBXYyIcXhMZuwWDf42cDL9aG2O6
 XibAjw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46e0xss593-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 05 May 2025 00:15:14 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-47682f9e7b9so72888331cf.2
 for <dri-devel@lists.freedesktop.org>; Sun, 04 May 2025 17:15:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746404114; x=1747008914;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rzjD6W4PVhu5bnBRA6TwITh0IKW78wTDC6QACU3Fu6Y=;
 b=Ihx6B/uic5aoAQQtp7b4ozgHY5g6QTx+s/kXSIa9cazTEARHpUxfueIA7LBDvur74i
 utb1RcQ2Yv5Q9a/U2NZxZLponhjO5/3TQlLBb4YBnLF8+YYCGiMiBP/eQms275ELR0OK
 mL/+ikV1b3gIwKBlKHJUkvQM7Ho9M7sqYaQihgBaVy2kvBDcBmXVHZgAUsp2zRY/o54a
 5VmOyyrQEpHmJOejbFX+pKrBE+uEMh5dqo52gT5wW6st191eiHs+8i8n/2WGojgfPwrT
 frAUfe9eAFeJPsXfo09bY0Gc8f2EABuBcgCyjg8ebKH6ALbDfCcoCeSTkSIkx6k5YLIo
 3ZXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBWIIBXvQX1tVziI/Verz87uE/9jtiOBtbac6K/nMbvwTbBiYtl2C201ikidwtRdik31fgyRkevlI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwzExGuD9FiaIzVpAlXgnLhxdy6Oc+PwoocD8DO6FsVTHFbDBsT
 rthUiPwCbKZLSGxLCyFUvWe5NAT7tTPY2ZeFAF7wsfFQYWkQ7h0defGoyzCd1Jnp86Ah+sxBCvc
 eOiEDQsGVyJOCrRpNsuNYurl86wBZCvm7HAF1SZ/6VvolW/XYrpng7BnRweaiR1p4jgE=
X-Gm-Gg: ASbGncs4w9qCy/Xd+kRKBGW9V5wvAjCAOaz0JS+IsXlB+Nx1Q+r7CNWHS1jDec/P+PO
 Pk+Sc/ghlqm6Y8uIjGu0fzRWj0hTGv6UVx8mJyt/ul5DhuidToPh4zwSyjAtFifMbq19CGPVqDG
 zvrCCBq2f+xsqNZbOjv2GvoaxLXpwR1U5y/ZRSfA7kJTwWP7aE4ci1F8oFDp7y69MQIfjsvamjT
 q08l+8ZfaSMZBXBBUPJ7Q4W5K3VVXVConHu9E4BgVsvsh0ZoS+AleIoTITFI0N6/UZumkCZWBdb
 mtmmb9twayEECsjjcU7TeB+YuCiM/wgPkG2541JPydWU0XJDiC5btzerv7c7N/6pUPvps+vyUmy
 QNhDjH5skaj0l+xQD1/9zi1Xu
X-Received: by 2002:a05:622a:490:b0:476:a895:7e87 with SMTP id
 d75a77b69052e-48e01552e3dmr83379051cf.48.1746404113770; 
 Sun, 04 May 2025 17:15:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGjy4BDq/ngBUylfvyk62dWRjQlZU6LHc8tgPXKTj0ZxRujx94ZtnGHTZ4N/Ax9Z0ejvKtJ3w==
X-Received: by 2002:a05:622a:490:b0:476:a895:7e87 with SMTP id
 d75a77b69052e-48e01552e3dmr83378621cf.48.1746404113439; 
 Sun, 04 May 2025 17:15:13 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54ea94ce656sm1454066e87.105.2025.05.04.17.15.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 May 2025 17:15:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 05 May 2025 03:14:51 +0300
Subject: [PATCH v5 07/13] drm/msm/hdmi: switch to pm_runtime_resume_and_get()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250505-fd-hdmi-hpd-v5-7-48541f76318c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2832;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=+KLC0hKahtw/rbBVi8TNRT2LZxqudcybFb57eB3iUWw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoGAL8TRmPzNRqLG+vuhB2OEaPuUfxiYybPe2DY
 iYf3qhPCjqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaBgC/AAKCRCLPIo+Aiko
 1XvzB/9S+1ACKUPSypEkRCWGDaqh9SspuUlnqat6JuNHZy0JmdmQyysnZprtX8J5FnlMWKfkSFg
 vkTXQbQ56FkcctwjfGdlhRDd3FnrRMd7S0xJGxu8ayZhKKz42fOr5eanjXTpu2hHoAQQyCv93tL
 2AD9FDzMWrYekF6U+KrooN1wXnjeaixp/nE4xl3Nsvn5l2IIGr1HlFClIkMbgcuUisOkODon2OB
 82+rZQDq4qkSb4dSHILyWcPOx8ThWXkk0d1u5ylyJSzB/Zx8nYn+hjj5CGcwUr16gM1YnruIi4E
 Et9ns3K0HrLR30SEUYGkS7S6+Np/5LAV25eMUCniYw5NYryT
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: RyUrFh3mJavkJnNmP7nCskwc9enCQB7C
X-Proofpoint-ORIG-GUID: RyUrFh3mJavkJnNmP7nCskwc9enCQB7C
X-Authority-Analysis: v=2.4 cv=bdprUPPB c=1 sm=1 tr=0 ts=68180312 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=-J1M-BTCRiek0Q83fKAA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDAwMCBTYWx0ZWRfX7FnQU9V9/sUB
 QhCqz1r/PIstcp3E+dxNViRk5F6DcpkAoGjFwmFTUui74hzLe7BklOn58jQJzsOH4YKSsT2h6gl
 qG2m6EsQPdkoefynb/OZQT69GECRObhS/D4BKECUGK89MS9+9B/pCbIYOiztoz7ud/puX1ZAKqW
 ECc4hooTeLQYuR+AEPH6nOtoAIYIXljS2uAV3TH/OPV2z7yTAYJrpItT/Rn5+UPLORtqySopoan
 Uh+IwHXVAG7aNhpp6wUZ73ffmLYiRqYJfIbUDs5QWkFqTDrOI8UV4jLNXOWfQy5oV43JPcDxTvd
 s0uaAaiSN+czo1ayhz3Iy04N17Xh2NxW1VAk7+BxQFw4P9MukodartlrQZbWGVj3O82yuLeVpFm
 +ePSes44dpSKzheeV0DrbOATJ+kgE/XayXyDt5t00tzHxJvI7qpbidMQD+AT9SCS7cS5Xhqm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-04_09,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 phishscore=0 adultscore=0 spamscore=0 impostorscore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505050000
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

The pm_runtime_get_sync() function is a bad choise for runtime power
management. Switch HDMI driver to pm_runtime_resume_and_get() and add
proper error handling, while we are at it.

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c |  2 +-
 drivers/gpu/drm/msm/hdmi/hdmi_hpd.c    | 12 ++++++++++--
 drivers/gpu/drm/msm/hdmi/hdmi_phy.c    |  6 +++++-
 3 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index e7997e4a741c3b27c9086651efe6b79dbba6bf88..3ae305e868a5931a8982e261f518cd8134d559cc 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -21,7 +21,7 @@ static void msm_hdmi_power_on(struct drm_bridge *bridge)
 	const struct hdmi_platform_config *config = hdmi->config;
 	int ret;
 
-	pm_runtime_get_sync(&hdmi->pdev->dev);
+	pm_runtime_resume_and_get(&hdmi->pdev->dev);
 
 	ret = regulator_bulk_enable(config->pwr_reg_cnt, hdmi->pwr_regs);
 	if (ret)
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
index e253c1408dd1c6dcd7e94506f0b8edcfd4a9a159..d77c68914c5f525cf12971c1058b1abc33792b24 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
@@ -85,7 +85,12 @@ int msm_hdmi_hpd_enable(struct drm_bridge *bridge)
 	if (hdmi->hpd_gpiod)
 		gpiod_set_value_cansleep(hdmi->hpd_gpiod, 1);
 
-	pm_runtime_get_sync(dev);
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret) {
+		DRM_DEV_ERROR(dev, "runtime resume failed: %d\n", ret);
+		goto fail;
+	}
+
 	ret = clk_bulk_prepare_enable(config->hpd_clk_cnt, hdmi->hpd_clks);
 	if (ret)
 		goto fail;
@@ -178,7 +183,10 @@ static enum drm_connector_status detect_reg(struct hdmi *hdmi)
 	u32 hpd_int_status = 0;
 	int ret;
 
-	pm_runtime_get_sync(&hdmi->pdev->dev);
+	ret = pm_runtime_resume_and_get(&hdmi->pdev->dev);
+	if (ret)
+		goto out;
+
 	ret = clk_bulk_prepare_enable(config->hpd_clk_cnt, hdmi->hpd_clks);
 	if (ret)
 		goto out;
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_phy.c b/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
index 03120c54ced686dcd2ddfe809dd9c9011f608235..667573f1db7c6bfef6c75828b5c581c147a86d0d 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
@@ -58,7 +58,11 @@ int msm_hdmi_phy_resource_enable(struct hdmi_phy *phy)
 	struct device *dev = &phy->pdev->dev;
 	int i, ret = 0;
 
-	pm_runtime_get_sync(dev);
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret) {
+		DRM_DEV_ERROR(dev, "runtime resume failed: %d\n", ret);
+		return ret;
+	}
 
 	ret = regulator_bulk_enable(cfg->num_regs, phy->regs);
 	if (ret) {

-- 
2.39.5

