Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A1AA7E36C
	for <lists+dri-devel@lfdr.de>; Mon,  7 Apr 2025 17:11:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CF6E10E4DD;
	Mon,  7 Apr 2025 15:11:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="EJBAfHd2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2541D10E4DD
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Apr 2025 15:11:07 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5378doPQ017443
 for <dri-devel@lists.freedesktop.org>; Mon, 7 Apr 2025 15:11:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 2dg8MLoyMdO4bnciC488h9CAEdYdwBoAJfBSIFF1DXs=; b=EJBAfHd2tPpYvhW/
 L5x9CMmR9sxSO104dBmdeVMBZNEmjod0Dzqb9vXTyqKGibfwIBwKnsAI6rpCJwhg
 Cb8yuZQ15D6lEwYO9cyFcjp5LSp3SmAUX4VK4tw5D9XgAwnD2yhM2q1tZmDEloAI
 8WsyHYGBaMSpjtJyYLycipSlW9og0DfyyxsXInEftiOAP3OSYuY5sr3mtM20JyTf
 PmZmKrQWYRDdjZj7c2B4WYZ/lQfRCXYUjo4tRffB1Cw97dZXQYlcUs+Kx+IRTGzg
 pToY9WexAFxVh+7Ao84pQf0HggV+52oWYlMTIiU0oDgVTtrvVyNsm3kTv5pzSdNT
 qQWGbQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twg3ckm2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Apr 2025 15:11:05 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c791987cf6so101947485a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Apr 2025 08:11:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744038665; x=1744643465;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2dg8MLoyMdO4bnciC488h9CAEdYdwBoAJfBSIFF1DXs=;
 b=NS8rvmp8wv0ktVDDMmZi/k/08rkyhKq2jHF0+pa5puh1ZLzAcT74cVnuC9ny9pgGNb
 njdVNngIztCHYfaI2/qVnOJ/OGavu4+Z5dySCsmNaQpU5XBWFltn+o/4TBQZo6CL2RfY
 qZ5dGYKtLCYVRa5Nzd8kxBTXcLWRA6NKwFHalb01QL6vmTOKXRw7vpgGDPnXkqFuGrNw
 i/eU1C5rogJhrGhxyPHjp9af9of5a09YZqLO7pn2tTNeROEXQvn+UKCZRsPFHvylLwPq
 ko4u5hSaabLL9cXHDSD8dKrb12Le/8BHn/0t+FGCgVkcKlJ/Z3fYxAGBvvQUTItFnT+E
 5bpw==
X-Gm-Message-State: AOJu0YxYgUItZjMCRXPf/greRwZk/08Vl0CeKygyVb8fQ+AwRuxkEuWB
 l3YDHwwdoeHPTEnFoktM38KaI5a2yl0rezikwx1kzo7foROr514slTmHOnauv6gaEO01n7XB70y
 I7zOzbYi6JMXnHuRzKxtilMDhVfy7vRQkQ87Pu+3lr437SUD943z9SCJ5+0DKUROGBeM=
X-Gm-Gg: ASbGncvbrRLotjl6h8jnEqMInVR+7Oh1nYDMsuSlRHrHtpiajPZ9pvdnrHge8LGQxF5
 lnnv8SGokRh3a2EtsMxLhympG5X6ut2J3dneS5KkvklaPvpM4VP9Mhg+PXrGFg/43f+EtCMa4PH
 W7OtC1Nqfp9nY1DZD3zSPt63P+fi6n1zQiplYC0/dfq8FrYjK1adZTKYdrsWg4PTmHUdBmEbtxt
 2YobKL0p5IBJ0bvoAVM5gmSU50NNJU/lFteEgjptCX3UX791WH1xXqJJrVua62ARl15VUZ0sMmF
 mXyc1QeA4QAPIcxttsXn23jX1sGGCvzsuVdiLUCiWf0YaB8Ijvba/diTL5P4fRKSNIyX0blmI8I
 5qQSUGoqgA2dm/PIA0i20Pc1WUUA7
X-Received: by 2002:a05:620a:3908:b0:7c5:3c62:804c with SMTP id
 af79cd13be357-7c775a0fefcmr1906201385a.21.1744038665216; 
 Mon, 07 Apr 2025 08:11:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEDlJRYmAoin8RKcPtomZTWpx/eM/BRNf+B6vRyttUb2e1lAlCh/h5v9AMfZuwT13z+HVbcFg==
X-Received: by 2002:a05:620a:3908:b0:7c5:3c62:804c with SMTP id
 af79cd13be357-7c775a0fefcmr1906194285a.21.1744038664674; 
 Mon, 07 Apr 2025 08:11:04 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54c1e635becsm1312572e87.127.2025.04.07.08.11.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Apr 2025 08:11:02 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 07 Apr 2025 18:10:58 +0300
Subject: [PATCH v5 01/11] drm/bridge: move private data to the end of the
 struct
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-drm-hdmi-connector-cec-v5-1-04809b10d206@oss.qualcomm.com>
References: <20250407-drm-hdmi-connector-cec-v5-0-04809b10d206@oss.qualcomm.com>
In-Reply-To: <20250407-drm-hdmi-connector-cec-v5-0-04809b10d206@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1928;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=oaS6Po7R+cg+gJ6q7cqgSpb16Fo8ijum1OmXH8rf4TE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn8+sDBPrxcJmfZPhNdN842fpYMxj7J8nlN1ioL
 70Hx3z+0/SJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ/PrAwAKCRCLPIo+Aiko
 1RohCACfAxxhoIw9G7469v4BcpdAOjvEAiBG0ASIgfXb6OMbyhi4he+gtbgczPRs7gyvF0Ts4up
 cNwmrHfHkqpUQTABWTPK4eVPzOCPkFW+HawfYEpl32hpmDpxBLC2IlXBOHi5KIGcNypLrRQp3Kd
 FXOI4YI9pzTI9nF12WAu2G20oKSMI3sZu4DSbK0pWggbr0Jtq95gPNMvBnZGO/EG+i4qAdE20Wf
 QXt/B0mldnwC080GR/NxFCUnZ8mVfs5GDQn01yV6IzllPGK+jz5g1V3ctWLvnSaggKZh8zFuXDY
 I1aAgeHeWM29/4xl9VKR50VWwn/RsG9vn/Ill1Zq28MzV53k
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 9-OY0mlD9h3vo4KU32sGZOcIT2SZRSGb
X-Proofpoint-ORIG-GUID: 9-OY0mlD9h3vo4KU32sGZOcIT2SZRSGb
X-Authority-Analysis: v=2.4 cv=I/9lRMgg c=1 sm=1 tr=0 ts=67f3eb0a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Am12PNO99IVxJwGJ:21 a=xqWC_Br6kY4A:10
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8
 a=V95sz_wBBgzcx4ufKaUA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_04,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0
 phishscore=0 suspectscore=0 mlxlogscore=999 lowpriorityscore=0 spamscore=0
 clxscore=1015 malwarescore=0 adultscore=0 priorityscore=1501
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504070106
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

WHen adding HDMI fields I didn't notice the private: declaration for HPD
fields. Move private fields to the end of the struct drm_bride to have
clear distinction between private and public fields.

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 include/drm/drm_bridge.h | 31 ++++++++++++++++---------------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 4e418a29a9ff9d014d6ac0910a5d9bcf7118195e..286f6fb3fe2b80f237db85dc8459430dc82337e2 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -977,21 +977,6 @@ struct drm_bridge {
 	 * @ddc: Associated I2C adapter for DDC access, if any.
 	 */
 	struct i2c_adapter *ddc;
-	/** private: */
-	/**
-	 * @hpd_mutex: Protects the @hpd_cb and @hpd_data fields.
-	 */
-	struct mutex hpd_mutex;
-	/**
-	 * @hpd_cb: Hot plug detection callback, registered with
-	 * drm_bridge_hpd_enable().
-	 */
-	void (*hpd_cb)(void *data, enum drm_connector_status status);
-	/**
-	 * @hpd_data: Private data passed to the Hot plug detection callback
-	 * @hpd_cb.
-	 */
-	void *hpd_data;
 
 	/**
 	 * @vendor: Vendor of the product to be used for the SPD InfoFrame
@@ -1043,6 +1028,22 @@ struct drm_bridge {
 	 * not used.
 	 */
 	int hdmi_audio_dai_port;
+
+	/** private: */
+	/**
+	 * @hpd_mutex: Protects the @hpd_cb and @hpd_data fields.
+	 */
+	struct mutex hpd_mutex;
+	/**
+	 * @hpd_cb: Hot plug detection callback, registered with
+	 * drm_bridge_hpd_enable().
+	 */
+	void (*hpd_cb)(void *data, enum drm_connector_status status);
+	/**
+	 * @hpd_data: Private data passed to the Hot plug detection callback
+	 * @hpd_cb.
+	 */
+	void *hpd_data;
 };
 
 static inline struct drm_bridge *

-- 
2.39.5

