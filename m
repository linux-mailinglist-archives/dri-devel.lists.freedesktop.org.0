Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61AD5AA8A36
	for <lists+dri-devel@lfdr.de>; Mon,  5 May 2025 02:15:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B008E10E27B;
	Mon,  5 May 2025 00:15:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="lHuhT8N0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 573C810E236
 for <dri-devel@lists.freedesktop.org>; Mon,  5 May 2025 00:15:31 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 544MSS9v011474
 for <dri-devel@lists.freedesktop.org>; Mon, 5 May 2025 00:15:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 WKq/kT9g+DsNZXb0KT7/tMrmhMgiNcjrVqoX/ddWVuw=; b=lHuhT8N0IpzXrWhj
 qzyJ2So0umzKv7CWy9gtumN6Zh86h5S30Cg+mK4beZ/BVZMFa0LGcdC1Rlh03Rhm
 A+Y5FNkzOJa93xox7oshmytcGAD7JP4Mo2IwS66smZQ7Jwow3m4qSqnjNJyx7GhJ
 YFauxb5yGsHIDvznsuzf1G37sSnTtzxfXkZ2anFomQVWFm8C3u5Y7H7asQwTkQ2Z
 HsHuOTOlmkeN9LG8A0YHBANvMG/JCbwrTcaXqctwZgn08hAmXHWt4ol9zjSKWNHK
 7660FJZzUVCnnGhC2EfYz/r1Fnsm45jPyxMPuDHl8iEB7urN3qB+34cxageN4Tcn
 nQg7Ew==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dbwfjj62-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 05 May 2025 00:15:30 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4768a1420b6so76151051cf.1
 for <dri-devel@lists.freedesktop.org>; Sun, 04 May 2025 17:15:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746404129; x=1747008929;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WKq/kT9g+DsNZXb0KT7/tMrmhMgiNcjrVqoX/ddWVuw=;
 b=RsqyOwIecw7pEtwe4hhtdZcCDMmmnu9uFG57fjF7TGZT4fx2mzcGnHYNbhVneLk+b6
 shF+ADd1NZho8j08HYU2XMAwocJnyW/Xl9hHfkUy7mORZeej5SeLx4BXAUFNfNPcKCGI
 aqs5jg51ISkkQ9PBJ0V/cU3y60+S2cQrfJcPUOv0cVnkQloKxSkpGxq3IR2UUXpDwJu2
 1DGRSkjIFMR2aJnPsTr2Cb5x4M3ouIyFfZZ341UfJS2sF+Nb3Tc3InLTi8BxVbf7KZH2
 gDW5j+hgO8wR/zaQl5OsBlYeeW0KnejH7TTINRmjpQzaE6lcHlK9yerCusVKwme3ZWHR
 M3gg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8XEAQPBUNVoRuQlNOIl7yRtPoNy1rqg7d8UuHKozEk0aeE8wXgSmYpcxe1d0mEWIWvuqmXUPUyjQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxSPSbk5cDZQAVDzygWNrNTq6TIbcKYAknIr7UYWJWGSjQ697Ry
 f4Gjg8hYadLVzXaUA4FYyx+/gvn8d26m7nVNmlXbgXjCd54KhKXG1+i9YERpmGjUwlrIDAUQl35
 e6a7YuDAyljRjmzzdc3WyinzF2eo9KonENhjwd52hunn7of63LHDOksU8u+D0ZhnXJBo=
X-Gm-Gg: ASbGncurcC93SDsMNKCh4SMaaO6dz4sUnEKH2UdDJGLl6EMgLORQ13GIKBRVadAT2+A
 yB8wbQMq/tFAyUIPXhX8JjFzZAC5c1ordp07I3202On8mxVGHnGX+DbXcWac9NH1mjEFXn7E0Gs
 Y0OKSTWz6Jh85RVgaCaoHRHno8gZoukzzIvBb2nCj2OcKLrFZp9Ft8wJXzEjI/Knfdjjk0z7DlS
 VFVtsmI0PSLxD3SmThNTyWFkj27k8D+GhI9mKEIZRwi2ZOnTog08aIWYx7v2BSSH/3onlfd4Mvq
 Uo3zZhiPYDitBhfxzIguel//2+ef4ktjEIA/VCT83RrWc/kuhe4XsdNRShp/0yrECiSiEOSYkD/
 gxJCjGmiwltrF2y6yPhaWdGvi
X-Received: by 2002:a05:622a:1101:b0:476:afd2:5b5e with SMTP id
 d75a77b69052e-48d5c072eb3mr105036841cf.13.1746404129019; 
 Sun, 04 May 2025 17:15:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHp/OhsqgAG8SJaelWw/DfK2Sdqi7I0XDMO57EtM6QoFMTFIiepxIj9H3pi7rYjCKkFGpknVA==
X-Received: by 2002:a05:622a:1101:b0:476:afd2:5b5e with SMTP id
 d75a77b69052e-48d5c072eb3mr105036461cf.13.1746404128675; 
 Sun, 04 May 2025 17:15:28 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54ea94ce656sm1454066e87.105.2025.05.04.17.15.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 May 2025 17:15:24 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 05 May 2025 03:14:56 +0300
Subject: [PATCH v5 12/13] drm/msm/hdmi: ensure that HDMI is up if HPD is
 requested
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250505-fd-hdmi-hpd-v5-12-48541f76318c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3985;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=pJMJhJs0UAB/ZtDoYbq6HHPuMctlMC/J56x/3ZZQZmw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoGAL9ltAr7WIgRdaYsly84l2U9p1Mkv0qRemKG
 VIzqb4aVIKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaBgC/QAKCRCLPIo+Aiko
 1RA+CACSefjj1PpWQEvfYkqg7JtJJa0X1TdSZiQO09nfDMqSPYfWz/ASkUmG4t1PV4zHcx5aOjy
 iCoYcQWcbGfRbbVIBwG/P09LhdRzNv4qZH/Y3TLB2TxJER7d+vAgpWZJ82G9stzKWJpeDDJ5HlN
 XM2vUJXLo+iwTNeVf0pf6ID2Zz7G22ezGbF1rZ/eNZTvx+C9MmJ110v2XSOc/IeyWg7EVjlZIB2
 /6UiJykd+FvNCWLn1wmoj7TbJlfsXBo4LxyACOwienD3/M7KyGdA1T+W69jnsAA2jazDSwyO5oz
 R3QYXW0ihyh7XCKH7VYXGGYgA4Q1Bew1NYoCy/mldxveus6C
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: O8FW41POS4irWvO_g-Yekz1j8EILc-NT
X-Proofpoint-GUID: O8FW41POS4irWvO_g-Yekz1j8EILc-NT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDAwMCBTYWx0ZWRfX+2ig+/zmAK2j
 Mw+2GHZ0VN+UDUxfQILePMGUGSUSnsLSWvyZUzY2c+ebkbX96sLaZHVQx0G09nBkTqtTzSFWey/
 UbEMfM+aN9LqPElB1POuSjX+bxjZo/AoBfys34kUmwm2KKOba6T6tAQULp0WsLjoQEGgC3y6z9I
 e37rHVYVZxDyaXVw9dQtjtVblkcrdxzLLs1MWqD4kOJ84JglVx4jdrQhLSWeigJvd3t5PdiML+l
 fmRyWb6E9Wgscx4PWDI1VYd3Mjivi7uSMp/61bjQ36uooP3GNSxC5qAhduhneYRYPUNG3/B4WY6
 DAnbFlRmSuvVLnwMMZXTXvkucDpGusdvyKQgNTDB5R3NZqokFAvRvgZHe8A/USxiS63hKmBZ8YG
 Ha8bWQRv7UC4T31Bn47vlJn5YMGInWmKpbXlw7QYY94CqaBC+9jrsagxnY7If3NR0BtfKKHV
X-Authority-Analysis: v=2.4 cv=AfqxH2XG c=1 sm=1 tr=0 ts=68180322 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=YSH6xZ7kgCKePGnQ2WoA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-04_09,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 phishscore=0 impostorscore=0
 mlxscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 mlxlogscore=999
 spamscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
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

The HDMI block needs to be enabled to properly generate HPD events. Make
sure it is not turned off in the disable paths if HPD delivery is enabled.

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c        | 1 +
 drivers/gpu/drm/msm/hdmi/hdmi.h        | 2 ++
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 8 +++++++-
 drivers/gpu/drm/msm/hdmi/hdmi_hpd.c    | 9 ++++++++-
 4 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 3d10fe6f8545198365a047b2f5652081703101aa..5355cfd391c5cc3053f771dd03e24dfde16733bf 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -293,6 +293,7 @@ static int msm_hdmi_dev_probe(struct platform_device *pdev)
 	hdmi->pdev = pdev;
 	hdmi->config = config;
 	spin_lock_init(&hdmi->reg_lock);
+	mutex_init(&hdmi->state_mutex);
 
 	ret = drm_of_find_panel_or_bridge(pdev->dev.of_node, 1, 0, NULL, &hdmi->next_bridge);
 	if (ret && ret != -ENODEV)
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h b/drivers/gpu/drm/msm/hdmi/hdmi.h
index fb64652162b6c5e6e2fe3357b89c40e2a28aa47e..e488ee31cc865b4eee9d486d978217c00f7816bf 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.h
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
@@ -41,6 +41,8 @@ struct hdmi {
 
 	/* video state: */
 	bool power_on;
+	bool hpd_enabled;
+	struct mutex state_mutex; /* protects two booleans */
 	unsigned long int pixclock;
 
 	void __iomem *mmio;
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index 665c5e1323d09513621429a6f184fb89bae0a37d..8ff0079abc801448e96b73ebea4730edea55ea6c 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -302,11 +302,13 @@ static void msm_hdmi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
 
 	msm_hdmi_set_timings(hdmi, &crtc_state->adjusted_mode);
 
+	mutex_lock(&hdmi->state_mutex);
 	if (!hdmi->power_on) {
 		msm_hdmi_phy_resource_enable(phy);
 		msm_hdmi_power_on(bridge);
 		hdmi->power_on = true;
 	}
+	mutex_unlock(&hdmi->state_mutex);
 
 	if (connector->display_info.is_hdmi)
 		msm_hdmi_audio_update(hdmi);
@@ -332,7 +334,10 @@ static void msm_hdmi_bridge_atomic_post_disable(struct drm_bridge *bridge,
 		msm_hdmi_hdcp_off(hdmi->hdcp_ctrl);
 
 	DBG("power down");
-	msm_hdmi_set_mode(hdmi, false);
+
+	/* Keep the HDMI enabled if the HPD is enabled */
+	mutex_lock(&hdmi->state_mutex);
+	msm_hdmi_set_mode(hdmi, hdmi->hpd_enabled);
 
 	msm_hdmi_phy_powerdown(phy);
 
@@ -343,6 +348,7 @@ static void msm_hdmi_bridge_atomic_post_disable(struct drm_bridge *bridge,
 			msm_hdmi_audio_update(hdmi);
 		msm_hdmi_phy_resource_disable(phy);
 	}
+	mutex_unlock(&hdmi->state_mutex);
 }
 
 static void msm_hdmi_set_timings(struct hdmi *hdmi,
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
index a42ed26a5b7c7d916d543aa2920754347903062a..e03d0ca230e64d7675534074d6e14587815119b6 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
@@ -76,10 +76,14 @@ int msm_hdmi_hpd_enable(struct drm_bridge *bridge)
 	if (ret)
 		return ret;
 
+	mutex_lock(&hdmi->state_mutex);
 	msm_hdmi_set_mode(hdmi, false);
 	msm_hdmi_phy_reset(hdmi);
 	msm_hdmi_set_mode(hdmi, true);
 
+	hdmi->hpd_enabled = true;
+	mutex_unlock(&hdmi->state_mutex);
+
 	hdmi_write(hdmi, REG_HDMI_USEC_REFTIMER, 0x0001001b);
 
 	/* enable HPD events: */
@@ -109,7 +113,10 @@ void msm_hdmi_hpd_disable(struct hdmi *hdmi)
 	/* Disable HPD interrupt */
 	hdmi_write(hdmi, REG_HDMI_HPD_INT_CTRL, 0);
 
-	msm_hdmi_set_mode(hdmi, false);
+	mutex_lock(&hdmi->state_mutex);
+	hdmi->hpd_enabled = false;
+	msm_hdmi_set_mode(hdmi, hdmi->power_on);
+	mutex_unlock(&hdmi->state_mutex);
 
 	pm_runtime_put(dev);
 }

-- 
2.39.5

