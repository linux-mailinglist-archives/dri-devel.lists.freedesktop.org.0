Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 052E2B18060
	for <lists+dri-devel@lfdr.de>; Fri,  1 Aug 2025 12:46:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34B0B10E2E1;
	Fri,  1 Aug 2025 10:46:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="LsNwnUEV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F92110E2E1
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Aug 2025 10:46:47 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5719b9AI007218
 for <dri-devel@lists.freedesktop.org>; Fri, 1 Aug 2025 10:46:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=4dMhx8coEqKsXCZf5pJZOj
 AWLN0cf9W2YmJUYfYiRfU=; b=LsNwnUEVW62I7ybjbIPmKQ0RWa1gcW345BJvpW
 Tsw05JVAVixkveWqtLqK0GhS8gpk88sm36BfmMPF/gKeeQ7apKjHiFKq/9qQzR/c
 H661C574b/7rwgv/UqykcVp/VKT30plb/bmKr1DqurVn0l9UkgA7aXjyzHEjOlOS
 0k8ngonMTq+n5XwQnFDWPvcCHXTux2V3nmFCU7O0o3T3hcbt1aLK12etvTx0v9Mx
 w5RENV7brrxzdeP4YI1biCYefTuOTsKubijAur67y3+4c/SNOju9ceB8OlMszmi+
 rvzBOlv5wN+kvtabS2YQeSUTVHAAQPiS843HmhckFGx8U90w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484pm2udnj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Aug 2025 10:46:46 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4ab44642abeso13284291cf.1
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Aug 2025 03:46:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754045205; x=1754650005;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4dMhx8coEqKsXCZf5pJZOjAWLN0cf9W2YmJUYfYiRfU=;
 b=uBw9aSjNO9jExfHqdmNYhLdD7LgqJgpQk2eHKCJJhGmCBm26ERX6XqqD+FrbONbVW5
 mucsQlQaUlIfyZAiYbAwIAuJy5l70O1DQOwnn2eMSJImAmMGIsBQUzyvvE5+EWYCcyyy
 +QAs2QpsqjnR1IlzNUghjoq/QbT991ERahifVsOpUiF47KjSru5k1Hv2Jr9mhWQbu9lt
 Lqxd0VfP+6oSI0qMvAIJx6BXISL97RUX8MTDN6DzUemqeYWYgAME1eXSfbxBHvMxz2qD
 iet+Jfth4IqjqIu+QImSCT0Yh2r6uZ43/Jh1u2pUQ4U363PPB7EOudk2gmn6g+QU3V9m
 ujGg==
X-Gm-Message-State: AOJu0YyX13aUp04f26ixIAcWEe+OX5AXSSD8ypmevzKF8DEklmRNsgg2
 mmFfVkgYPhcZoE6hdczTosNCRyp5n6GEUYNKmNlZVKblk0G8uJyiTycW6OKMNBwWH/8EfyEHTH+
 EXoCmPMBcfGXtdqT/OkxUE3OKZrlXJ4M0KAWegZGrxXWba5gEgELr23cdGpanbYxd2eAJ5RVVKv
 JgQ/g=
X-Gm-Gg: ASbGncv5WNLnn0yMOmdbOmtlv+fuHH4vsQSM0x0mQbCJsbpxqICJ1+qSQaHb2ViyH6B
 C3A4S4lgWATDGHU5O8oz5PXktTBvt6WUuXDhRBH8HGd1Fh+1XC1JTmciy6FrSLKljvi+4JdrrHY
 jvEWaAbET6VoimN5fVk2edrivcI/Lm5WmqNdhC856X3Z1DMa57+H+tTlIvh3HQOiYGI0rIoDYzp
 lnzLtFf7vuBqGkPJs1S6kMS6CPigxc17vdqHmnqQakSoZInsTxRfGsnKzx0bi3uVqow0Jn+gIqA
 BlsqCLoW4h11WSHhaZNdCJ7uyypKBfV1g8+iZHOMl9R/8DqryBKc+oq7Jqa9HC3dDFzcDsBM4Fj
 bxTMcW9SJoKKe3V0nBW0hVFJN8Ix95cD+Bie9XEUcJViObUXC2dto
X-Received: by 2002:a05:622a:15cf:b0:4a4:2fad:7cdd with SMTP id
 d75a77b69052e-4aedb9ce5b4mr180425051cf.24.1754045204788; 
 Fri, 01 Aug 2025 03:46:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEg/veUEjYhUB9L3VVRtbJjDdyPawkgWzSRdvHMpIF6nrvUZ+T0kKUmxRc0SR+ylGlKty+1Nw==
X-Received: by 2002:a05:622a:15cf:b0:4a4:2fad:7cdd with SMTP id
 d75a77b69052e-4aedb9ce5b4mr180424661cf.24.1754045204161; 
 Fri, 01 Aug 2025 03:46:44 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b88c9b1fesm531862e87.96.2025.08.01.03.46.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Aug 2025 03:46:43 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 01 Aug 2025 13:46:41 +0300
Subject: [PATCH] drm/bridge: document HDMI CEC callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250801-drm-hdmi-cec-docs-v1-1-be63e6008d0e@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIABCbjGgC/x3MQQqAIBBA0avIrBvQyIiuEi1Ex5yFGgoRiHdPW
 r7F/w0qFaYKu2hQ6OHKOQ2oSYANJl2E7IZhlrOWm1ToSsTgIqMliy7binpRRKvxRnsDo7sLeX7
 /53H2/gEsR9OOYwAAAA==
X-Change-ID: 20250801-drm-hdmi-cec-docs-541ee6afa5fa
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Stephen Rothwell <sfr@canb.auug.org.au>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2748;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=w1+bYMIxI9OSbUv26vLEMczzfyh3ZUtUFRS7nZhDrrw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBojJsS5Eh73fanAuFTKmyG7sFpTbsGu0bBxRv04
 NIm5bwIJGOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaIybEgAKCRCLPIo+Aiko
 1V5VB/9JgdoNwOntE2YPl21WMqNdFFlOHMKpgfyM4CM4XmhAEVu04s4eVg79IuKB1+QRouFFjU/
 R55C5fVVWUIp5vsY40gxe/+qQR9yM0C5/3LU1iNasUm0T+l+YMALKKpr2rF0zU1+aI2rRAMvVKk
 QoGfKv0p0NI+vwRj3LbF+oY18gorWsAF2/A6J4RdZC8Ssy8iAoYHn37Ykjd+FuaO1UGl3LQ5Ux/
 n9vEd2IfCm2niIr/0woxNXre3N+2ECxJ8WPKbIKQCZOjjIMYeTE+WdB/Xcz1ulY4lIId7gTsd/W
 IN1IR59jyAy3nUya5MqPVk6O76aQaEgy/KewgnklbdBM8GV+
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 9p8dwaXotUI7sB7iiNjPCgO4-mt9AUlV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDA3OSBTYWx0ZWRfX2jClWCGpxBBs
 5mZrOhBrcmRM02V9bgOjXMTVcHJJsNyp6JNqRF5pM72NiHO+xQ8fT37j2EQLKI5kb9hEglDDp15
 dLLSLarUW2vtsdLstzUQnBQbC+wjJ1yWD81M20Q6o0Q0/7YOTS7F3aoE5y3iRKy8o1hcvKLyrWM
 YxFzXQ5N8UXXW5l20d//AYRIioiHylXC1CIRHSqQBqadAj7lzHeQb/BCGtgrXfuwzyBtcchOHUM
 qBRgRxX7X6xHnPHksyW5Ees8fDNVCovc/LLloGQXKzsmg+b4mE7MgNoo5oamUCBIUcxOWqtY8sx
 zTMlMu7BOfGwRGY8dAlEUz0zLhs2+XYEtvQFT3+MzN/U3yhwfquMiBRN0YxHLCjUlOwGpC4/smL
 u2NYwe6dHMi9QYc75RYoyKBhyVS6c2ePpDEKrZwBeAfnF0Qinni3ANFuUI53eJBMn5fFAEmz
X-Authority-Analysis: v=2.4 cv=HfYUTjE8 c=1 sm=1 tr=0 ts=688c9b16 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=rOUgymgbAAAA:8 a=EUspDBNiAAAA:8
 a=F0gKrZKVUcZZPVP-J9gA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=MP9ZtiD8KjrkvI0BhSjB:22
X-Proofpoint-ORIG-GUID: 9p8dwaXotUI7sB7iiNjPCgO4-mt9AUlV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_03,2025-07-31_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=999 phishscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508010079
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

Provide documentation for the drm_bridge callbacks related to the
DRM_BRIDGE_OP_HDMI_CEC_ADAPTER flag.

Fixes: a74288c8ded7 ("drm/display: bridge-connector: handle CEC adapters")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Closes: https://lore.kernel.org/r/20250611140933.1429a1b8@canb.auug.org.au
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 include/drm/drm_bridge.h | 48 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 8ed80cad77ec4b40d0aa6159e802a2839d5b8792..b0e6653ee42ecc088f420a9a32cf3b0428737a4a 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -866,13 +866,61 @@ struct drm_bridge_funcs {
 				      struct drm_connector *connector,
 				      bool enable, int direction);
 
+	/**
+	 * @hdmi_cec_init:
+	 *
+	 * Initialize CEC part of the bridge.
+	 *
+	 * This callback is optional, it can be implemented by bridges that
+	 * set the @DRM_BRIDGE_OP_HDMI_CEC_ADAPTER flag in their
+	 * &drm_bridge->ops.
+	 *
+	 * Returns:
+	 * 0 on success, a negative error code otherwise
+	 */
 	int (*hdmi_cec_init)(struct drm_bridge *bridge,
 			     struct drm_connector *connector);
 
+	/**
+	 * @hdmi_cec_enable:
+	 *
+	 * Enable or disable the CEC adapter inside the bridge.
+	 *
+	 * This callback is optional, it can be implemented by bridges that
+	 * set the @DRM_BRIDGE_OP_HDMI_CEC_ADAPTER flag in their
+	 * &drm_bridge->ops.
+	 *
+	 * Returns:
+	 * 0 on success, a negative error code otherwise
+	 */
 	int (*hdmi_cec_enable)(struct drm_bridge *bridge, bool enable);
 
+	/**
+	 * @hdmi_cec_log_addr:
+	 *
+	 * Set the logical address of the CEC adapter inside the bridge.
+	 *
+	 * This callback is optional, it can be implemented by bridges that
+	 * set the @DRM_BRIDGE_OP_HDMI_CEC_ADAPTER flag in their
+	 * &drm_bridge->ops.
+	 *
+	 * Returns:
+	 * 0 on success, a negative error code otherwise
+	 */
 	int (*hdmi_cec_log_addr)(struct drm_bridge *bridge, u8 logical_addr);
 
+	/**
+	 * @hdmi_cec_transmit:
+	 *
+	 * Transmit the message using the CEC adapter inside the bridge.
+	 *
+	 * This callback is optional, it can be implemented by bridges that
+	 * set the @DRM_BRIDGE_OP_HDMI_CEC_ADAPTER flag in their
+	 * &drm_bridge->ops.
+	 *
+	 * Returns:
+	 * 0 on success, a negative error code otherwise
+	 */
 	int (*hdmi_cec_transmit)(struct drm_bridge *bridge, u8 attempts,
 				 u32 signal_free_time, struct cec_msg *msg);
 

---
base-commit: a933d3dc1968fcfb0ab72879ec304b1971ed1b9a
change-id: 20250801-drm-hdmi-cec-docs-541ee6afa5fa

Best regards,
-- 
With best wishes
Dmitry

