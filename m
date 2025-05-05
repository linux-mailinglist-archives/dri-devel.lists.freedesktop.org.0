Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B76E4AA8A24
	for <lists+dri-devel@lfdr.de>; Mon,  5 May 2025 02:15:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09B6010E1B2;
	Mon,  5 May 2025 00:15:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="mn23ySEZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5804C10E1B2
 for <dri-devel@lists.freedesktop.org>; Mon,  5 May 2025 00:15:12 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 544NlE7X008408
 for <dri-devel@lists.freedesktop.org>; Mon, 5 May 2025 00:15:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 X5c1T2okNkBRPy3LP55P7/c8OhgWI8CTU4FhNq9qA4o=; b=mn23ySEZ/pXl19HG
 +7YA8VJNFSYz7kXn9vsxvpHYPUpm6e+g0diYAoj0YCUR6XTbKEZu8dWBs8cOu0q5
 wmc1yXobvHKpopc6dBau5/0IZY6pj/m+h4RVigbZ7qmug6GuyCzMNsOPy34rfCOe
 KRO/ER1QoyknRcIohyzH4QlZ8nIaoV+z5FuYmAyhehzS0+FxVwRmG5Ahenx34lVO
 ki+HwOsBUF4uPU7kRzdUCMkPazignGzzdGkEvaqXnCgLUKnB8ybi3E6a+SvbquJ2
 M/5MykGZv+bhx0eo7vOgAXf+gLHuIoOmR+/wAV0xYbyOC6thOHwY7HaNHngN8fVT
 t7n7NQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46d9nktqrc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 05 May 2025 00:15:11 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7c3c8f8ab79so98098085a.2
 for <dri-devel@lists.freedesktop.org>; Sun, 04 May 2025 17:15:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746404110; x=1747008910;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=X5c1T2okNkBRPy3LP55P7/c8OhgWI8CTU4FhNq9qA4o=;
 b=Xh1NGWa3uONp1RY3Hx2YmBqUCqLlBrkPrRAlqpNpnoXuRIlyMCJh/6zDhNS1Kp+P+R
 XovdwR8PEnuq7d+YyNi7e3t/LzcdLs9Y/yhPAI71JoFD4Q1cztmH1QWQ52sUUNWkH9TT
 HLWjzbiyxEoLrr+56ug2ZI8CyJfKb//QSgbCH+wEyYlKQQblz1+0hdeT7F9iT0q2y1UH
 /gj+5vDFdAiYERvSZ/vI2YKaee6bX1MhgWcmc/q4QgRPEC4rG4rCpr3KgJJeHjSRW16j
 xMES4BsZm/JujN+x/se80qrFxnE83z0T3rzBpurwC7gA7A9seqIWuubNo56qFnCORLBW
 G8rA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZJm1Zj/MJPcAem4hqzYZqqwgJ/2/6F9ipbr1EdPbDGyQ+kjqbpdKqFkKFGBRKt9Es60F0yHYNejo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwgGhnIh6J4JVhT2y9n6ElsYi7DemZeupNli6H3G7mDnJ988egq
 JVvJk21P5LeldxClynxrzuC7IwRDT3P9Vmaa8AAapJ39PL/t84YtPtIRQSXXF6JK2wBByIApWmb
 wDCl7kapo+KdX6W3ywtEHs08nLUQ0/Obo731SKlq0KZSqxKE9Ons6MDSqdr+L9uAsLl8=
X-Gm-Gg: ASbGncvIbzIPjYQML3uuPQOEzGslfWrInUFosrreDxYZQfrUusupJgb5lv91EmF16ir
 Y+Unzc7AZ02yq0IloDgYHa7F5gAsZRAHPmTpRe+kP/isVgb2nGv+dsEjAEMIrYZzjRk+dOMpgFl
 nzYJ321mvcyDDvIy0cl0MKr5IEhRFUx5ougLHIAseUYxbGJHoL8CZmyeyXjFMt/+U+zjdv2xqSs
 KXy64hl/0YWG96druNpjVSnsdhAucpA0X6+GL61HZeSq2/zgHqqt4/47Zc54PvU7iS6j/p4LZVg
 KRuMkSNWwqIPMeEA4cOgUqz8W5uXpDL5zbR2q1pjntC8rgdUtN5neIHSk4tcfi2XlpATIMJwKRk
 XHwkTnAZ4gsBJV0aJDpKB0ogu
X-Received: by 2002:a05:620a:190e:b0:7ca:cd43:e46e with SMTP id
 af79cd13be357-7cadfea82a1mr1176854185a.36.1746404110488; 
 Sun, 04 May 2025 17:15:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHQhfFbqpZslO2eWr4LyRzSnWS8Njh66IBcHVpnb9J96WelvVwOaL7E7JvQ4d0L3KLXii73DA==
X-Received: by 2002:a05:620a:190e:b0:7ca:cd43:e46e with SMTP id
 af79cd13be357-7cadfea82a1mr1176849985a.36.1746404110144; 
 Sun, 04 May 2025 17:15:10 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54ea94ce656sm1454066e87.105.2025.05.04.17.15.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 May 2025 17:15:08 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 05 May 2025 03:14:49 +0300
Subject: [PATCH v5 05/13] drm/msm/hdmi: drop clock frequency assignment
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250505-fd-hdmi-hpd-v5-5-48541f76318c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2616;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=WW4ls3rpXG1GIIqJFaRsd5YlkFmkvDhOcZwn0x64Row=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoGAL82x04Ldn8u0VpFSsk00EMCwD9Pm1yAeD5b
 ys5oLHbZ7uJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaBgC/AAKCRCLPIo+Aiko
 1WmsB/sHPPAf9NychOLipLaNxz2HhgodbrgZJWqKAWrZjaD1lVAT7NmeDWPl9qIV1saOMtOU5lr
 wVowfYQ399VVJQq2/C26DQKbVs8j4NxaEOJNTfJbOnoWc/6OlCBe01vp28OrqdjzDnp+vPPJln4
 JYK7wO+dvBtHfERYjMhTyUKsBzR8G/GReWfTdL9oug+KvOcMytfwahFaxQXH5UJo16spstBcpiW
 5xVK8bJgepjs8phsyTDqNNta2we+VYBqxdJd7BArrtlYmmdCQC+HPJVzuf3Myr4rMQrVmDNtj6A
 9CC+Cv8ORrYXG2FbKrevADexNzYZvs3VBeEbuYf1gDkC6n7m
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDAwMCBTYWx0ZWRfX8/03gaIuTtvw
 burCRYq/0d4E5CumYz00mgvE7i/klpugiLIrDcr5KvKb/m49YTwWBP0R999b03s0Hs3hJaqPjJJ
 XRDHQGQQUYuBBgsC4jasRXuj5+8nacF9Ft1oRHj2lbkOx8H3FdVjtDdGWiQ6Vtd13xInL/yZUhJ
 HLNfhbsytmivW2SXnjpEDMLbN42c/B6/JeLG6TqzWyNXO43c8Rqt56L7YO2ZJSKZujaCLSOIt8m
 Q+qxAv5YIoD1lMT5cI/qEeaeBcLjZMatY4sd+eS6PbuEF0w2Wx3eo75KMwj6Q1HPzz7A/C3P2k4
 5nAdyZQOYCILTfP79iA1ZZyJHS/d1T/fha1Flfrz5zaTi0ys/J9MP24KyfVeDnF70QrsZOgs/DO
 HjRFUSR9/qyAFTh0kueWE12eyTmgzbAc3pxJKe5xjbqjiBnPYaMjf+gOhB1ImqKAmQc42tW6
X-Proofpoint-GUID: 2ZdNr2hmZ0GKU_mTAwX--oXLmY2EzuoY
X-Authority-Analysis: v=2.4 cv=LpeSymdc c=1 sm=1 tr=0 ts=6818030f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=F7atGr4GHeWUWaFcoCIA:9
 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 2ZdNr2hmZ0GKU_mTAwX--oXLmY2EzuoY
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

The only clock which has frequency being set through hpd_freqs is the
"core" aka MDSS_HDMI_CLK clock. It always has the specified frequency,
so we can drop corresponding clk_set_rate() call together with the
hpd_freq infrastructure.

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c     | 2 --
 drivers/gpu/drm/msm/hdmi/hdmi.h     | 1 -
 drivers/gpu/drm/msm/hdmi/hdmi_hpd.c | 9 ---------
 3 files changed, 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 104f9cefa14834d04fb957eb48777e605d1e29a5..6f09920c58190a9c195de0407e4c2dcc3d58b30f 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -234,12 +234,10 @@ static const struct hdmi_platform_config hdmi_tx_8960_config = {
 
 static const char * const pwr_reg_names_8x74[] = {"core-vdda", "core-vcc"};
 static const char * const hpd_clk_names_8x74[] = {"iface", "core", "mdp_core", "alt_iface"};
-static unsigned long hpd_clk_freq_8x74[] = {0, 19200000, 0, 0};
 
 static const struct hdmi_platform_config hdmi_tx_8974_config = {
 		HDMI_CFG(pwr_reg, 8x74),
 		HDMI_CFG(hpd_clk, 8x74),
-		.hpd_freq      = hpd_clk_freq_8x74,
 };
 
 static int msm_hdmi_bind(struct device *dev, struct device *master, void *data)
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h b/drivers/gpu/drm/msm/hdmi/hdmi.h
index 3314bb8a09d6bea7e34ad9050970bf43c64d1558..e93d49d9e86936cb6c1f852a958398de2e134ad4 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.h
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
@@ -93,7 +93,6 @@ struct hdmi_platform_config {
 
 	/* clks that need to be on for hpd: */
 	const char * const *hpd_clk_names;
-	const long unsigned *hpd_freq;
 	int hpd_clk_cnt;
 };
 
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
index 9ce0ffa3541795a076b433566a3cafe156120b15..7ae69b14e953f0ee6deea8a216bfa9d3616b09af 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
@@ -68,15 +68,6 @@ static void enable_hpd_clocks(struct hdmi *hdmi, bool enable)
 
 	if (enable) {
 		for (i = 0; i < config->hpd_clk_cnt; i++) {
-			if (config->hpd_freq && config->hpd_freq[i]) {
-				ret = clk_set_rate(hdmi->hpd_clks[i],
-						   config->hpd_freq[i]);
-				if (ret)
-					dev_warn(dev,
-						 "failed to set clk %s (%d)\n",
-						 config->hpd_clk_names[i], ret);
-			}
-
 			ret = clk_prepare_enable(hdmi->hpd_clks[i]);
 			if (ret) {
 				DRM_DEV_ERROR(dev,

-- 
2.39.5

