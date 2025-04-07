Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 896E6A7E379
	for <lists+dri-devel@lfdr.de>; Mon,  7 Apr 2025 17:11:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BB3610E4E6;
	Mon,  7 Apr 2025 15:11:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="D85nAQ95";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A3EE10E4EA
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Apr 2025 15:11:22 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5378dntR009956
 for <dri-devel@lists.freedesktop.org>; Mon, 7 Apr 2025 15:11:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 G1ae8VxXVqStJkqbSuwALnEc5YS2/T7OPX6wl6TCcAI=; b=D85nAQ95l3UHoNQV
 MQ+PrKqsPZ9lDJDJmzgH7fU+CZv/qNS1ErTP5Kk+tHnT0HSRWGb9Xd/F1SB7gzZm
 u5qkXhz9grtrCFz+luEs8lYelv23mX/GqfFQTQ3286nNU0LQ8uHHErNL2yEfJg+5
 Av10UIahJrhi1g6q1OWCwiClEoREdOsGSBaueIP1Q8a4hVkOGfABY4PuAEYAF7Qi
 86PH96RbPjsC+fbrj0Rsb3EKFDMtcID9r2mCW57pAu+OCvfTe/5ChVQU4NNxLjfi
 ptY+nGRS+eIRoTa7bHMynjqom8SxLmyAS52BamvXbqjnSyp9rbqMPHfiMVE6230T
 9eUUew==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twpm4jre-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Apr 2025 15:11:21 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c5f3b94827so831269285a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Apr 2025 08:11:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744038680; x=1744643480;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=G1ae8VxXVqStJkqbSuwALnEc5YS2/T7OPX6wl6TCcAI=;
 b=n5yXJxsIHh0LhlOIOI0U+dK0LIH0cF5UBiefOxChIdQjwhsv3BmFrYsdFOI0fAssE0
 7h7BhgTEnPqWrWb9oosokHHqLPMRAEOCSks0G7An6AJTp4wc/b3W+A2/dDGuLSER+HU/
 IEeS/QDZuG48ZyEjgjYrfeZBPL335tLj3R0LmymNBfHSzzstB03K+AVnKgcTz3Sl7svn
 gwknfxw6oZOc1ocqaI6o7dXtiq+vz+EM3rMynkJxdUZV0xrGsjroYgVpMSxmSYh0jRH9
 +AQVaIA+HehWIw486UkCLcjgSMql6oI82qALG7T4apj6/zUKpsoIoI42OuLdmCaOCE1e
 4q7w==
X-Gm-Message-State: AOJu0Yw6o9dkOIsWKzHTqNNPsjN6Tef9BJiX1Zt9vrCU2DtpMCgAOwDI
 UWHrsHpk/LmIDckKDmtSKC39/lJt9qb5dsC3ua6qmvA40FPuwMKMu05fOaDGSxw2aIiNXb6nQyY
 d8GTsoTuGLmMtJh0PB0JQEbD3DtWpUKTzDDS40imeqkqBVGPqL3GS/gAEmkhUnLjlVtM=
X-Gm-Gg: ASbGncsEmsvx+8db9oEfSYIOCNpv+r7HkMl+WiYL4XqB/LhMLy/suRUwlAOkNKZdQ+s
 ozsFk4p59HUcQ27ZD3/mxEdyV3igLjX3Htpj4DLd20rVdWwxo+fqlUxqAAHP2ep081D1rmZ6wWu
 gL1VaigpN0cqMToK7GLJxHu1Yy5ysuF7rCQBB8bwYwsvRi0W/wp5JNvdru04WMhV9zsAQYPcroI
 K0phlrkpM8Kx/go24M4S17Qfsd5WTRD+u7j+zp7YqPSgeu01j+2WzhVay43rVNp04oMnnjb8+NW
 jpo6HuTRbxMKNJ04kDSCiOhdkzKTmIf46MB+JoAWxAUQje8dN24QirBT0/tD0rAnGGtWnmp8sh+
 UPf9GgzfSYX/Y/X7w96hsV6QqcYRQ
X-Received: by 2002:a05:620a:1985:b0:7c7:65fa:674e with SMTP id
 af79cd13be357-7c774d254f5mr2058155085a.1.1744038680430; 
 Mon, 07 Apr 2025 08:11:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF9FXJgKvDLCUZePpUDFSKDRydHaWSVNRxhoLmQaAx1/qkuqar4lsuiXVZFiVRaSsavpRwuAQ==
X-Received: by 2002:a05:620a:1985:b0:7c7:65fa:674e with SMTP id
 af79cd13be357-7c774d254f5mr2058149785a.1.1744038680064; 
 Mon, 07 Apr 2025 08:11:20 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54c1e635becsm1312572e87.127.2025.04.07.08.11.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Apr 2025 08:11:17 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 07 Apr 2025 18:11:06 +0300
Subject: [PATCH v5 09/11] drm/display: bridge-connector: hook in CEC
 notifier support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-drm-hdmi-connector-cec-v5-9-04809b10d206@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3887;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=uklYweWBlwLbC6gTQ6PCbwQsVuPXcE9aRj3J6MFYXSs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn8+sEr/nW4cyUp9iMLeFQl1VURYW4LGyPfC++A
 MYRcNOfR5GJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ/PrBAAKCRCLPIo+Aiko
 1TmxCACPf5vMjXdlaY4Kj2n0X93HdTHmJPPW+ZG1bU3vDa/otnWjg19X+oZJIW3rX7n7SexAGhe
 jg42xhJto/hQ/f3346I4G7qYbJ1aX9nJ/GzEgwlvBNhvUjnMMvzGJCKd6gl5b/hu+jIITEhbaG4
 89Y8hpkH8205JXdWjalqCPyidHIuqeHDxfZF5k1npM0Ay/RLh3NAM2IiJF9YL349StGekracFV+
 hj9i/16VPdPbBGUA4RvrsgjY5POuuvNHxtJOuzBnQY5zmMeZHAer1MM0YyWv2nsuy9BNMkOLL/1
 vZf8WQOM54BgaRV2jo+38ycnEGWq0vLIOwYbN1s8ub3Z+gZ3
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: -eqCP9seui2MAUHL3ybiUks6rOXEXwuE
X-Proofpoint-ORIG-GUID: -eqCP9seui2MAUHL3ybiUks6rOXEXwuE
X-Authority-Analysis: v=2.4 cv=MpRS63ae c=1 sm=1 tr=0 ts=67f3eb19 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=ueZRYqln2k_rfa3UlOQA:9
 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_04,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 mlxlogscore=991 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0
 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
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

Allow HDMI DRM bridges to create CEC notifier. Physical address is
handled automatically by drm_atomic_helper_connector_hdmi_hotplug()
being called from .detect() path.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/display/Kconfig                |  1 +
 drivers/gpu/drm/display/drm_bridge_connector.c | 24 ++++++++++++++++++++++++
 include/drm/drm_bridge.h                       | 11 +++++++++++
 3 files changed, 36 insertions(+)

diff --git a/drivers/gpu/drm/display/Kconfig b/drivers/gpu/drm/display/Kconfig
index 6376ea01ec3093a72de25064e31223d2c9868ed7..df09cf9a8ca19ea894d6f2fad68c0b191e81e3d0 100644
--- a/drivers/gpu/drm/display/Kconfig
+++ b/drivers/gpu/drm/display/Kconfig
@@ -17,6 +17,7 @@ if DRM_DISPLAY_HELPER
 config DRM_BRIDGE_CONNECTOR
 	bool
 	select DRM_DISPLAY_HDMI_AUDIO_HELPER
+	select DRM_DISPLAY_HDMI_CEC_HELPER
 	select DRM_DISPLAY_HDMI_STATE_HELPER
 	help
 	  DRM connector implementation terminating DRM bridge chains.
diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 381a0f9d4259bf9f72d3a292b7dcc82e45c61bae..daf6117268d9d3bb0c0c12b5094e79ad13cf72dd 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -20,6 +20,7 @@
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/display/drm_hdmi_audio_helper.h>
+#include <drm/display/drm_hdmi_cec_helper.h>
 #include <drm/display/drm_hdmi_helper.h>
 #include <drm/display/drm_hdmi_state_helper.h>
 
@@ -113,6 +114,13 @@ struct drm_bridge_connector {
 	 * &DRM_BRIDGE_OP_DP_AUDIO).
 	 */
 	struct drm_bridge *bridge_dp_audio;
+	/**
+	 * @bridge_hdmi_cec:
+	 *
+	 * The bridge in the chain that implements CEC support, if any (see
+	 * DRM_BRIDGE_OP_HDMI_CEC_NOTIFIER).
+	 */
+	struct drm_bridge *bridge_hdmi_cec;
 };
 
 #define to_drm_bridge_connector(x) \
@@ -662,6 +670,13 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 			bridge_connector->bridge_dp_audio = bridge;
 		}
 
+		if (bridge->ops & DRM_BRIDGE_OP_HDMI_CEC_NOTIFIER) {
+			if (bridge_connector->bridge_hdmi_cec)
+				return ERR_PTR(-EBUSY);
+
+			bridge_connector->bridge_hdmi_cec = bridge;
+		}
+
 		if (!drm_bridge_get_next_bridge(bridge))
 			connector_type = bridge->type;
 
@@ -724,6 +739,15 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 			return ERR_PTR(ret);
 	}
 
+	if (bridge_connector->bridge_hdmi_cec &&
+	    bridge_connector->bridge_hdmi_cec->ops & DRM_BRIDGE_OP_HDMI_CEC_NOTIFIER) {
+		ret = drm_connector_hdmi_cec_notifier_register(connector,
+							       NULL,
+							       bridge->hdmi_cec_dev);
+		if (ret)
+			return ERR_PTR(ret);
+	}
+
 	drm_connector_helper_add(connector, &drm_bridge_connector_helper_funcs);
 
 	if (bridge_connector->bridge_hpd)
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index db0d374d863b0b1f774d395743f1e29bb84e8937..0e5f6a007d536215bd50e11846433290c2060b9c 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -907,6 +907,11 @@ enum drm_bridge_ops {
 	 * flag.
 	 */
 	DRM_BRIDGE_OP_DP_AUDIO = BIT(6),
+	/**
+	 * @DRM_BRIDGE_OP_HDMI_CEC_NOTIFIER: The bridge requires CEC notifier
+	 * to be present.
+	 */
+	DRM_BRIDGE_OP_HDMI_CEC_NOTIFIER = BIT(7),
 };
 
 /**
@@ -1003,6 +1008,12 @@ struct drm_bridge {
 	 */
 	unsigned int max_bpc;
 
+	/**
+	 * @hdmi_cec_dev: device to be used as a containing device for CEC
+	 * functions.
+	 */
+	struct device *hdmi_cec_dev;
+
 	/**
 	 * @hdmi_audio_dev: device to be used as a parent for the HDMI Codec if
 	 * either of @DRM_BRIDGE_OP_HDMI_AUDIO or @DRM_BRIDGE_OP_DP_AUDIO is set.

-- 
2.39.5

