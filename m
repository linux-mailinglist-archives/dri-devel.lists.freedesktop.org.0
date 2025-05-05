Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 590B6AA8A2F
	for <lists+dri-devel@lfdr.de>; Mon,  5 May 2025 02:15:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF2E510E279;
	Mon,  5 May 2025 00:15:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="MLkdtaUf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0C3E10E279
 for <dri-devel@lists.freedesktop.org>; Mon,  5 May 2025 00:15:20 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54505xXO019329
 for <dri-devel@lists.freedesktop.org>; Mon, 5 May 2025 00:15:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 2mAZjRTa40l8e4BSdDDl0ubGwkl56NVIuzite4sqbHo=; b=MLkdtaUfVjbjqICO
 vwEtDcRhw4I4sX1D2HCRNt74rpbCq1yQekUobZR8umJwKCiUMyRQpfXllrU6eS70
 OlQPq4uS+rulAq2yjpIuu7ujear8gjz3/E4Nrw1s9IdlUQ+BZaLovq6OKgpuhG5+
 mdS0DLDmSfcY0CdmPyDRB75MPLffhdKIdiLR+TA+9jiqGhoJTt255keab7FlNMdn
 bSOovbhtLeds+sTtDDqFjr22Jyq+HsDnriX7ym9XVV3xJf8G+oKopjriu4eyqSh6
 noOt9pHp+e9vYe1PMLSbIIaN35v+kZzN8Uwiho7NN+xGlt6DPAZ5Bi1YmJNT1dxb
 ILpDWg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dbc5an64-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 05 May 2025 00:15:20 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7c5c77aff55so909392785a.3
 for <dri-devel@lists.freedesktop.org>; Sun, 04 May 2025 17:15:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746404119; x=1747008919;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2mAZjRTa40l8e4BSdDDl0ubGwkl56NVIuzite4sqbHo=;
 b=Vy1+hEukbRFveAQcyuKQnP2wYwbdQIl4/YGORAHzkjChzdO3lR4Hau4x3BfMKGglQJ
 nqePimjrBD6I7rql7BN/TF/p/54icwOEhjOmMPaE9ISk7vJeU5x9Fym0w0FVvDR8HkZf
 XvcKhAN1x3vDxO95BFPT7L1y/b83I9SssHb1gzAo8BuwmU0ctjbpZAeRl3VweNf6OuaO
 1XSS9ukpWSZYNtZQEtYVi3zXrXDcXvyNzPq+/Xi1Tjt8UwR0bOnrMZu9J552hFSt9kek
 VHqPAVDeYQm5dJZowBR2YA2J8YPNT7mhttuMD7XRAlBUso1viUbt6wBqDkW7iIFscloO
 Tvvg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6UkiGBbYqd98aWLW46/iEsxMBxzmDN3VhG54YGU+revrX+IplB51rP1GCl69fwrRJVoe/IDGbiWk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyy2jixL581QelfggRKZoOWBvs0TwMOAE+BV6LsQUPQt/5y1yFw
 2xbV2JeVKfLLkLxcyxaR9w5XQUkfROoQGr8X4p6lULGjU2rfCfeSbTBbHQD8n/ZltkXDdpOF3AV
 OMhriRW8xZr7swWKoKQxfwCsPYP7Pn4JWZWITJvfyLiAbRbDcpxtSsO1IF4ms/Ai/+cc=
X-Gm-Gg: ASbGncuREvXb9DPULBmgPgs5ojLb0lDcwIfRr8qkjU9gdMwocYfizNkd5Ao/L/0f24X
 vZHIAkBbVa/vbjB0ud3vZVOCBx9010hr1vdiALnbh1yQ1xftG2Ee77Z/ICl0nQsW/8F+PeJrMTu
 GIeQph5f70mzq0fbAq0xYvgi6pJ5zArzmNbTq0vpQRg75tfQvJq/MMfy181OM6+kyIpf+WuFudA
 n+OTjcwoBy6ze9+K5hVHaHjDZfaatw9YtbhZGHskoQk9VTCfQ3EH2tcTo/ibxcGfnieTDcI3cn8
 xB2ZI86llYpxK1W0Nfh6ecFW6U9soieSZwkaYHYvs4NqJta4H8noVctU0sOX+V3Vy3QFm8LPzqF
 fNMDN563A9k0kS3SJKtsbl/iq
X-Received: by 2002:a05:620a:3705:b0:7c5:a2de:71d3 with SMTP id
 af79cd13be357-7cae3aa7dccmr710182885a.20.1746404118926; 
 Sun, 04 May 2025 17:15:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJvT2qXEA+3qgUD9BONo0ieQGGIaGCVQ0ND5SLSFhAwExotlMLJ/1Dm1zx+Ha2IJcArypA1Q==
X-Received: by 2002:a05:620a:3705:b0:7c5:a2de:71d3 with SMTP id
 af79cd13be357-7cae3aa7dccmr710180085a.20.1746404118531; 
 Sun, 04 May 2025 17:15:18 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54ea94ce656sm1454066e87.105.2025.05.04.17.15.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 May 2025 17:15:16 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 05 May 2025 03:14:53 +0300
Subject: [PATCH v5 09/13] drm/msm/hdmi: implement proper runtime PM
 handling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250505-fd-hdmi-hpd-v5-9-48541f76318c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=9382;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=03nwODxsaeTmx63o5nvi9in7Q0eD5uMPd8cMRsyvZo0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoGAL81CMtn0s/fUQMfCDvzbQVQPs5xvSHf1AaA
 lnsYs3+a6OJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaBgC/AAKCRCLPIo+Aiko
 1UU1B/4mcG9UB2+HV1URSbHawbcWzIpOvWrp3klhn5IMEYsNXir5XoGy8ouhN/ojtuCT+hq8aZH
 +dtXh6kNGnHIgCLiz/kFvOSvG75ua7FQtkHeJDezXyoErUmzLCSJgqVcYsUUBkPv4FiWD/vXABR
 K0NCz4mILOu6A0uPmMTpzB0yvnmHdiPRQWpvamBwsatBWa6rfDkLYqCDeknfHtRzGQpdiT/OqOj
 kl49dtxohNwXLiD5L/1fdI7sye8Sda2anZ3jxwvLk6w/dbdI78fFriBT12I3HFzOX3K/Met+7PZ
 18/u+CTAy+mqoCfqsMvDYieoWMikHbF7+XRWHpxFl0DwVerX
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: ZWr91o4ceEmBAeGZWCqFMdA3vKxfhLdw
X-Authority-Analysis: v=2.4 cv=O7Y5vA9W c=1 sm=1 tr=0 ts=68180318 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=5f27SdGkVz2AZoGoeocA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: ZWr91o4ceEmBAeGZWCqFMdA3vKxfhLdw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDAwMCBTYWx0ZWRfX8Z9NU0T+nR8D
 vtI6Wxmqohr0rQCkj+yLBkZFy1BLl+uqP9PzZ4hiNx7LeNczxzlx/SW+PY/w7QGiK8DmkezoY/n
 XNgIXoSW7nNcCZhg1uLudcKywWIFeO+uTNIIj4VpoTNp4YX3t9JAZka6OaK/PfQXi2HdTI2v8XQ
 egBC//Wg0x53VbkEKB1XjT8YEoZMfIq2AZaqklJcYz/PDLw5DghEjkAKYjCYP0+fOmuwHP2Ysge
 /KctwhnhYb0RzKUn2PmNRC8rCdZ9e6kOQBiqg6QX3tGAd0ch70Gho+gxBF0+neffgKPawVEVhZ5
 UTd5wfRJ8GZzNtNDfiOgwU63WqgEFDVRsL0KQ6CrCRlRth787bvdadzPqX39V0WUNI1K4S15UzG
 /O+adeLml4mCe72nBNr5Jbx8QHkdMKJNnlnoGOl7WEJZB2K5bUOP47tKtvxruB0PZjouUgGc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-04_09,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
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

It is completely not obvious, but the so-called 'hpd' clocks and
regulators are required for the HDMI host to function properly. Merge
pwr and hpd regulators. Use regulators, clocks and pinctrl to implement
proper runtime PM callbacks.

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c        | 62 +++++++++++++++++++++++++---------
 drivers/gpu/drm/msm/hdmi/hdmi.h        |  5 ---
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 12 -------
 drivers/gpu/drm/msm/hdmi/hdmi_hpd.c    | 42 +----------------------
 4 files changed, 47 insertions(+), 74 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 69e337d551799b4d35c8c8c7ecb5c4680b9a9e5f..ded20176aa805db98b0599e617eb6ea9bce122d8 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -8,6 +8,7 @@
 #include <linux/gpio/consumer.h>
 #include <linux/of_irq.h>
 #include <linux/of_platform.h>
+#include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
 
 #include <drm/drm_bridge_connector.h>
@@ -224,11 +225,11 @@ int msm_hdmi_modeset_init(struct hdmi *hdmi,
 	.item ## _names = item ##_names_ ## entry, \
 	.item ## _cnt   = ARRAY_SIZE(item ## _names_ ## entry)
 
-static const char * const hpd_reg_names_8960[] = {"core-vdda"};
+static const char * const pwr_reg_names_8960[] = {"core-vdda"};
 static const char * const hpd_clk_names_8960[] = {"core", "master_iface", "slave_iface"};
 
 static const struct hdmi_platform_config hdmi_tx_8960_config = {
-		HDMI_CFG(hpd_reg, 8960),
+		HDMI_CFG(pwr_reg, 8960),
 		HDMI_CFG(hpd_clk, 8960),
 };
 
@@ -318,20 +319,6 @@ static int msm_hdmi_dev_probe(struct platform_device *pdev)
 	if (hdmi->irq < 0)
 		return hdmi->irq;
 
-	hdmi->hpd_regs = devm_kcalloc(&pdev->dev,
-				      config->hpd_reg_cnt,
-				      sizeof(hdmi->hpd_regs[0]),
-				      GFP_KERNEL);
-	if (!hdmi->hpd_regs)
-		return -ENOMEM;
-
-	for (i = 0; i < config->hpd_reg_cnt; i++)
-		hdmi->hpd_regs[i].supply = config->hpd_reg_names[i];
-
-	ret = devm_regulator_bulk_get(&pdev->dev, config->hpd_reg_cnt, hdmi->hpd_regs);
-	if (ret)
-		return dev_err_probe(dev, ret, "failed to get hpd regulators\n");
-
 	hdmi->pwr_regs = devm_kcalloc(&pdev->dev,
 				      config->pwr_reg_cnt,
 				      sizeof(hdmi->pwr_regs[0]),
@@ -409,6 +396,48 @@ static void msm_hdmi_dev_remove(struct platform_device *pdev)
 	msm_hdmi_put_phy(hdmi);
 }
 
+static int msm_hdmi_runtime_suspend(struct device *dev)
+{
+	struct hdmi *hdmi = dev_get_drvdata(dev);
+	const struct hdmi_platform_config *config = hdmi->config;
+
+	clk_bulk_disable_unprepare(config->hpd_clk_cnt, hdmi->hpd_clks);
+
+	pinctrl_pm_select_sleep_state(dev);
+
+	regulator_bulk_disable(config->pwr_reg_cnt, hdmi->pwr_regs);
+
+	return 0;
+}
+
+static int msm_hdmi_runtime_resume(struct device *dev)
+{
+	struct hdmi *hdmi = dev_get_drvdata(dev);
+	const struct hdmi_platform_config *config = hdmi->config;
+	int ret;
+
+	ret = regulator_bulk_enable(config->pwr_reg_cnt, hdmi->pwr_regs);
+	if (ret)
+		return ret;
+
+	ret = pinctrl_pm_select_default_state(dev);
+	if (ret)
+		goto fail;
+
+	ret = clk_bulk_prepare_enable(config->hpd_clk_cnt, hdmi->hpd_clks);
+	if (ret)
+		goto fail;
+
+	return 0;
+
+fail:
+	pinctrl_pm_select_sleep_state(dev);
+
+	return ret;
+}
+
+DEFINE_RUNTIME_DEV_PM_OPS(msm_hdmi_pm_ops, msm_hdmi_runtime_suspend, msm_hdmi_runtime_resume, NULL);
+
 static const struct of_device_id msm_hdmi_dt_match[] = {
 	{ .compatible = "qcom,hdmi-tx-8998", .data = &hdmi_tx_8974_config },
 	{ .compatible = "qcom,hdmi-tx-8996", .data = &hdmi_tx_8974_config },
@@ -426,6 +455,7 @@ static struct platform_driver msm_hdmi_driver = {
 	.driver = {
 		.name = "hdmi_msm",
 		.of_match_table = msm_hdmi_dt_match,
+		.pm = &msm_hdmi_pm_ops,
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h b/drivers/gpu/drm/msm/hdmi/hdmi.h
index 3f87535bcf43e20f0618d3016307fe1642d7baf9..7e3c035cf913d713ed63379a843897fad96b23ab 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.h
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
@@ -47,7 +47,6 @@ struct hdmi {
 	void __iomem *qfprom_mmio;
 	phys_addr_t mmio_phy_addr;
 
-	struct regulator_bulk_data *hpd_regs;
 	struct regulator_bulk_data *pwr_regs;
 	struct clk_bulk_data *hpd_clks;
 	struct clk *extp_clk;
@@ -83,10 +82,6 @@ struct hdmi {
 
 /* platform config data (ie. from DT, or pdata) */
 struct hdmi_platform_config {
-	/* regulators that need to be on for hpd: */
-	const char * const *hpd_reg_names;
-	int hpd_reg_cnt;
-
 	/* regulators that need to be on for screen pwr: */
 	const char * const *pwr_reg_names;
 	int pwr_reg_cnt;
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index 3ae305e868a5931a8982e261f518cd8134d559cc..665c5e1323d09513621429a6f184fb89bae0a37d 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -18,15 +18,10 @@ static void msm_hdmi_power_on(struct drm_bridge *bridge)
 	struct drm_device *dev = bridge->dev;
 	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
 	struct hdmi *hdmi = hdmi_bridge->hdmi;
-	const struct hdmi_platform_config *config = hdmi->config;
 	int ret;
 
 	pm_runtime_resume_and_get(&hdmi->pdev->dev);
 
-	ret = regulator_bulk_enable(config->pwr_reg_cnt, hdmi->pwr_regs);
-	if (ret)
-		DRM_DEV_ERROR(dev->dev, "failed to enable pwr regulator: %d\n", ret);
-
 	if (hdmi->extp_clk) {
 		DBG("pixclock: %lu", hdmi->pixclock);
 		ret = clk_set_rate(hdmi->extp_clk, hdmi->pixclock);
@@ -41,11 +36,8 @@ static void msm_hdmi_power_on(struct drm_bridge *bridge)
 
 static void power_off(struct drm_bridge *bridge)
 {
-	struct drm_device *dev = bridge->dev;
 	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
 	struct hdmi *hdmi = hdmi_bridge->hdmi;
-	const struct hdmi_platform_config *config = hdmi->config;
-	int ret;
 
 	/* TODO do we need to wait for final vblank somewhere before
 	 * cutting the clocks?
@@ -55,10 +47,6 @@ static void power_off(struct drm_bridge *bridge)
 	if (hdmi->extp_clk)
 		clk_disable_unprepare(hdmi->extp_clk);
 
-	ret = regulator_bulk_disable(config->pwr_reg_cnt, hdmi->pwr_regs);
-	if (ret)
-		DRM_DEV_ERROR(dev->dev, "failed to disable pwr regulator: %d\n", ret);
-
 	pm_runtime_put(&hdmi->pdev->dev);
 }
 
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
index d77c68914c5f525cf12971c1058b1abc33792b24..a42ed26a5b7c7d916d543aa2920754347903062a 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
@@ -64,36 +64,17 @@ int msm_hdmi_hpd_enable(struct drm_bridge *bridge)
 {
 	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
 	struct hdmi *hdmi = hdmi_bridge->hdmi;
-	const struct hdmi_platform_config *config = hdmi->config;
 	struct device *dev = &hdmi->pdev->dev;
 	uint32_t hpd_ctrl;
 	int ret;
 	unsigned long flags;
 
-	ret = regulator_bulk_enable(config->hpd_reg_cnt, hdmi->hpd_regs);
-	if (ret) {
-		DRM_DEV_ERROR(dev, "failed to enable hpd regulators: %d\n", ret);
-		goto fail;
-	}
-
-	ret = pinctrl_pm_select_default_state(dev);
-	if (ret) {
-		DRM_DEV_ERROR(dev, "pinctrl state chg failed: %d\n", ret);
-		goto fail;
-	}
-
 	if (hdmi->hpd_gpiod)
 		gpiod_set_value_cansleep(hdmi->hpd_gpiod, 1);
 
 	ret = pm_runtime_resume_and_get(dev);
-	if (ret) {
-		DRM_DEV_ERROR(dev, "runtime resume failed: %d\n", ret);
-		goto fail;
-	}
-
-	ret = clk_bulk_prepare_enable(config->hpd_clk_cnt, hdmi->hpd_clks);
 	if (ret)
-		goto fail;
+		return ret;
 
 	msm_hdmi_set_mode(hdmi, false);
 	msm_hdmi_phy_reset(hdmi);
@@ -119,32 +100,18 @@ int msm_hdmi_hpd_enable(struct drm_bridge *bridge)
 	spin_unlock_irqrestore(&hdmi->reg_lock, flags);
 
 	return 0;
-
-fail:
-	return ret;
 }
 
 void msm_hdmi_hpd_disable(struct hdmi *hdmi)
 {
-	const struct hdmi_platform_config *config = hdmi->config;
 	struct device *dev = &hdmi->pdev->dev;
-	int ret;
 
 	/* Disable HPD interrupt */
 	hdmi_write(hdmi, REG_HDMI_HPD_INT_CTRL, 0);
 
 	msm_hdmi_set_mode(hdmi, false);
 
-	clk_bulk_disable_unprepare(config->hpd_clk_cnt, hdmi->hpd_clks);
 	pm_runtime_put(dev);
-
-	ret = pinctrl_pm_select_sleep_state(dev);
-	if (ret)
-		dev_warn(dev, "pinctrl state chg failed: %d\n", ret);
-
-	ret = regulator_bulk_disable(config->hpd_reg_cnt, hdmi->hpd_regs);
-	if (ret)
-		dev_warn(dev, "failed to disable hpd regulator: %d\n", ret);
 }
 
 void msm_hdmi_hpd_irq(struct drm_bridge *bridge)
@@ -179,7 +146,6 @@ void msm_hdmi_hpd_irq(struct drm_bridge *bridge)
 
 static enum drm_connector_status detect_reg(struct hdmi *hdmi)
 {
-	const struct hdmi_platform_config *config = hdmi->config;
 	u32 hpd_int_status = 0;
 	int ret;
 
@@ -187,14 +153,8 @@ static enum drm_connector_status detect_reg(struct hdmi *hdmi)
 	if (ret)
 		goto out;
 
-	ret = clk_bulk_prepare_enable(config->hpd_clk_cnt, hdmi->hpd_clks);
-	if (ret)
-		goto out;
-
 	hpd_int_status = hdmi_read(hdmi, REG_HDMI_HPD_INT_STATUS);
 
-	clk_bulk_disable_unprepare(config->hpd_clk_cnt, hdmi->hpd_clks);
-
 out:
 	pm_runtime_put(&hdmi->pdev->dev);
 

-- 
2.39.5

