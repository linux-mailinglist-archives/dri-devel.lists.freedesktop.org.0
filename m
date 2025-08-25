Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C29FFB34309
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 16:17:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BDBC10E4BD;
	Mon, 25 Aug 2025 14:17:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="pB6VFKAn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C67B010E4BC
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 14:17:43 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P8I78X021749
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 14:17:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ylX1fqbOkKoSozFRGgeQVfO+D+WkKuR5pGGaL2RByr0=; b=pB6VFKAnnx5MX6p4
 GMY3fnKh8f8r8+HXQr24bRlvfXXkqkNzJpvgC02+vhFhvHUPz4bWrkVLAEwyTzDX
 lqTj2Zpuugm2PtiHPiBk83v4xWqtfiA0d31GmrHm3Ucqj5SiPlU3E/XNYyiZADjA
 oaEq35ygQiii62FwDLbCCGcFTWmbU2qYYOfOe8YMkgfOt0wliEHZU7GtjA+9P35J
 7HXtLP3Rj24XEKm1HB7IJCfDvfO8o8mc3YoIfMmZn6Ldn1J01WHd/vDwpiyS3/8r
 B1hLSiDnHsvPFY4TwJFGXBv/sd8ePyI6lLgC4X4IqwnhPVY90NlZng0yV9lFsOkE
 WsJxDQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5w2nf93-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 14:17:43 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-b471737e673so7648896a12.1
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 07:17:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756131462; x=1756736262;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ylX1fqbOkKoSozFRGgeQVfO+D+WkKuR5pGGaL2RByr0=;
 b=MO4v7QGken2737K8OWixa2juWrJ+FAeS4BuJIVt67+RY7MgWDL3hCQFpr6DZfyPOGL
 MlaxBHkDQnLeRB5BkmjRUsXpXa+0TpysHU+vUfp5yhxBDocfKyv14DvVxpPTmE34Hw/y
 YjenVQ4Ei3mZFS+GmiCXba4xK/XPmRUqpMzIQkqD2ZvpUCYWCR7HVBs0tiSvPpctMmmY
 x6G65DS43wWtoabofLzCZRex4x2ZDc8hK3+ZrQpP1vzjfbxHBEwSM0yiB01CD1UkPB9p
 dmmvqaRxlASO2p5HKSbC6exzS1wFpci+Oh5BmTUP1eIjKOQQYzzU+eOhGSDkfou2bTP0
 FTUQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMUihOQsvuUpRQmfMna5BXJfORsZ0hTXUuDf/kMmwsf60j9DqlpgVWubi6Jv+LL6sm6LWinX8mp8o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzvTL4EiPoxNC68LJgfDTcyeVx3XLbZXew2kDryFXPfnk5kH7EI
 ZdeDxvyufUHOJbZWmrNu4JTEQhYfDsgYDcRjUZTNYb6gxzmaEQEh7wmY6JmCwu3pxZjdXrtSisQ
 1fvQbl30nAqtHbZK1FKxkMcZr3aeprQkSY+AVy6OpFnY0zE7bt77b+G47gxBdXUhEkxmrRqY=
X-Gm-Gg: ASbGncu7fTEa+4lUTtNkVhjAtwLLZxubKjEJInAz/7mhwgKFxokptJmDKtC9G29qYR8
 MpqOolc/WMeR+mmLjrtFo7r1km/JwK6Q4GlddJJiSXs/hkOjxD7YijmrcVBC7bc6nAXE5IdAfPL
 iJDHys0nlOLsU6jX7kT3rE8oyURuqedVl7iptSpfQ35ony/X70yhXGLR4i21482i2x0mG23WAFo
 8NL3pBGSUZeek5hOPCSISu+bkt281lC05N7qBtMPCo6zcSBjj+pcdhzQItudJVZxS4hsnUxRB/e
 suyBVTFrHz9+arrSVgGNcb80jg/044BQnjuQZSKNzRO/UhhTlEn1ApdEfiV3LIubUS7J6Sw=
X-Received: by 2002:a17:903:3845:b0:21f:1202:f2f5 with SMTP id
 d9443c01a7336-2462edabc8fmr150254745ad.8.1756131462282; 
 Mon, 25 Aug 2025 07:17:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFy2Vro9AeMJiaynIza+7nP5Vby8B3bd7ehTdif/Ao4hMYbAsTqPKk+bTwETCz0iWQaj9644A==
X-Received: by 2002:a17:903:3845:b0:21f:1202:f2f5 with SMTP id
 d9443c01a7336-2462edabc8fmr150254475ad.8.1756131461800; 
 Mon, 25 Aug 2025 07:17:41 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-770401eb20dsm7672339b3a.79.2025.08.25.07.17.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Aug 2025 07:17:41 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 25 Aug 2025 22:15:54 +0800
Subject: [PATCH v3 08/38] drm/msm/dp: move the pixel clock control to its
 own API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-msm-dp-mst-v3-8-01faacfcdedd@oss.qualcomm.com>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
In-Reply-To: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756131419; l=3942;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=uHsok/LSjjRH5u1NB5xR8K7S+7rsOioV24rr3GH1dtk=;
 b=77C6GNp9DHtOlGJdk1AxhxPkPC/mFy6dOlZiCa+J/fUyAuzdsNIRcNAwfqCLf27wkNFOje5BR
 Ut7PWTTdvqOBYFgQEq8ITbTLfHUl+SvfUsEg2iI7pqluOF4kHoiC1Lk
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Authority-Analysis: v=2.4 cv=Z/vsHGRA c=1 sm=1 tr=0 ts=68ac7087 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=FjMX0bmgnFGAle5WrLgA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX6e7TKmQA/0fR
 HfZIHzEmCDHGcCru/xFpEAUi39zW+NyZLbbvADYqCBeRa/mEUe0Y/Igtx9f0A2hpuxreGXilruL
 5RBFDKJ9X7B51wSZXRdkSkxGJ5k/WARyE0UuPet+xOY6Sa4REmfdmz8W0U+yRNDH61ekjaTJImi
 MNF6aCONAKFbIYu6tAbObvaNSD2LthS6fwutXAQTbW6sSsGIy6zzUkd3FDK7qDS1N3VAugmmLlV
 nQh8XX1r1NZpkfnWC+k1tFbQkLQWeUjvK5KCx456fhwjqxXKjwmqz8rze2m7XTINCXCfV462DsH
 s+O/oqw+x2zt5VGSx2Q/+LI5OQQ7uLR2hXmArJOpmfavmXi8EJ2eAVX+bjomdUP7qxPYI0RKeTF
 5/4H44Ue
X-Proofpoint-GUID: -cofmu3cngohYOo-ZNtnCQWXYOSp2oJD
X-Proofpoint-ORIG-GUID: -cofmu3cngohYOo-ZNtnCQWXYOSp2oJD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_07,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0 clxscore=1015
 suspectscore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033
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

Enable/Disable of DP pixel clock happens in multiple code paths
leading to code duplication. Move it into individual helpers so that
the helpers can be called wherever necessary.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c | 77 +++++++++++++++++++++-------------------
 1 file changed, 41 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 261907446135904a9e479f18051974f5fea88ef1..c0001b93a194821927507028f392877db585fd2c 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -2162,6 +2162,42 @@ static bool msm_dp_ctrl_send_phy_test_pattern(struct msm_dp_ctrl_private *ctrl)
 	return success;
 }
 
+static int msm_dp_ctrl_on_pixel_clk(struct msm_dp_ctrl_private *ctrl, unsigned long pixel_rate)
+{
+	int ret;
+
+	ret = clk_set_rate(ctrl->pixel_clk, pixel_rate * 1000);
+	if (ret) {
+		DRM_ERROR("Failed to set pixel clock rate. ret=%d\n", ret);
+		return ret;
+	}
+
+	if (ctrl->stream_clks_on) {
+		drm_dbg_dp(ctrl->drm_dev, "pixel clks already enabled\n");
+	} else {
+		ret = clk_prepare_enable(ctrl->pixel_clk);
+		if (ret) {
+			DRM_ERROR("Failed to start pixel clocks. ret=%d\n", ret);
+			return ret;
+		}
+		ctrl->stream_clks_on = true;
+	}
+
+	return ret;
+}
+
+static void msm_dp_ctrl_off_pixel_clk(struct msm_dp_ctrl *msm_dp_ctrl)
+{
+	struct msm_dp_ctrl_private *ctrl;
+
+	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
+
+	if (ctrl->stream_clks_on) {
+		clk_disable_unprepare(ctrl->pixel_clk);
+		ctrl->stream_clks_on = false;
+	}
+}
+
 static int msm_dp_ctrl_process_phy_test_request(struct msm_dp_ctrl_private *ctrl)
 {
 	int ret;
@@ -2187,22 +2223,7 @@ static int msm_dp_ctrl_process_phy_test_request(struct msm_dp_ctrl_private *ctrl
 	}
 
 	pixel_rate = ctrl->panel->msm_dp_mode.drm_mode.clock;
-	ret = clk_set_rate(ctrl->pixel_clk, pixel_rate * 1000);
-	if (ret) {
-		DRM_ERROR("Failed to set pixel clock rate. ret=%d\n", ret);
-		return ret;
-	}
-
-	if (ctrl->stream_clks_on) {
-		drm_dbg_dp(ctrl->drm_dev, "pixel clks already enabled\n");
-	} else {
-		ret = clk_prepare_enable(ctrl->pixel_clk);
-		if (ret) {
-			DRM_ERROR("Failed to start pixel clocks. ret=%d\n", ret);
-			return ret;
-		}
-		ctrl->stream_clks_on = true;
-	}
+	ret = msm_dp_ctrl_on_pixel_clk(ctrl, pixel_rate);
 
 	msm_dp_ctrl_send_phy_test_pattern(ctrl);
 
@@ -2518,21 +2539,10 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
 
 	drm_dbg_dp(ctrl->drm_dev, "pixel_rate=%lu\n", pixel_rate);
 
-	ret = clk_set_rate(ctrl->pixel_clk, pixel_rate * 1000);
+	ret = msm_dp_ctrl_on_pixel_clk(ctrl, pixel_rate);
 	if (ret) {
-		DRM_ERROR("Failed to set pixel clock rate. ret=%d\n", ret);
-		goto end;
-	}
-
-	if (ctrl->stream_clks_on) {
-		drm_dbg_dp(ctrl->drm_dev, "pixel clks already enabled\n");
-	} else {
-		ret = clk_prepare_enable(ctrl->pixel_clk);
-		if (ret) {
-			DRM_ERROR("Failed to start pixel clocks. ret=%d\n", ret);
-			goto end;
-		}
-		ctrl->stream_clks_on = true;
+		DRM_ERROR("failed to enable pixel clk\n");
+		return ret;
 	}
 
 	/*
@@ -2566,7 +2576,6 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
 	drm_dbg_dp(ctrl->drm_dev,
 		"mainlink %s\n", mainlink_ready ? "READY" : "NOT READY");
 
-end:
 	return ret;
 }
 
@@ -2600,11 +2609,7 @@ void msm_dp_ctrl_off(struct msm_dp_ctrl *msm_dp_ctrl)
 
 	msm_dp_ctrl_reset(&ctrl->msm_dp_ctrl);
 
-	if (ctrl->stream_clks_on) {
-		clk_disable_unprepare(ctrl->pixel_clk);
-		ctrl->stream_clks_on = false;
-	}
-
+	msm_dp_ctrl_off_pixel_clk(msm_dp_ctrl);
 	dev_pm_opp_set_rate(ctrl->dev, 0);
 	msm_dp_ctrl_link_clk_disable(&ctrl->msm_dp_ctrl);
 

-- 
2.34.1

