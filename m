Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6562CABA7B0
	for <lists+dri-devel@lfdr.de>; Sat, 17 May 2025 04:00:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5E3710EBC2;
	Sat, 17 May 2025 02:00:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="bbKCV9ZY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67F3C10EBAB
 for <dri-devel@lists.freedesktop.org>; Sat, 17 May 2025 02:00:02 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54GBWkBr020897
 for <dri-devel@lists.freedesktop.org>; Sat, 17 May 2025 02:00:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 pzoCVGuuCG8OuzWqLizoElhfY931yJkLZD9sIcqllt0=; b=bbKCV9ZY1DqEjhMV
 zBbB2ZDNjeKDDGH26bF2uHBPFK0XixAd78ElXqCNsfikzibdfJaD7dEqFPK/BNkz
 r8ujn5DrY54ulanf2jEYQxoyPMSRoW6quVA/C03kdpWf/hPrXvbb88HfZPBsuku9
 A/zAImEXeyBLjIrYRdKXqjTRngoOoxb0X1FF6h0/JwAcYQpvOGyqYO2ulW9IVzSA
 XMSzVsJmGwCAB3QpOFfX5dhHZ7Z48HQxcy6XOvTwVww/B9qzHxyTpz0invcwyQ1b
 Ti9taHVBDxlbyMeMEp/UXip8dTPtybSDh3x0Lwh/v9Zz3BpZwOkms/+IGixX/8FZ
 3hSD6A==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbewbd4v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 17 May 2025 02:00:01 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6f6899cccbdso63118436d6.3
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 19:00:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747447200; x=1748052000;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pzoCVGuuCG8OuzWqLizoElhfY931yJkLZD9sIcqllt0=;
 b=Ys9MDkdhlGd5CnyZf1Ly8uJgqHmOPUy3N6om+4efdWY0DY2hg4vRPAkQi/ySEGle6u
 0f9LXOmZUpd4MpJd96s0my00LBy11dcAEYrUB9i7rmODZ7eyhwOKO93AXFqIV5hC3zJf
 Ij4C38HGwLvOxmUznPtN2XGuonUN7vyD61fDOYbRl9P+ypnE90EKU5vcKnXKXFsZ2iaJ
 nKSEjzt5/Vdh13Zfuq47B1G+IDOpcpHDO4V/7CXh2+Ga3fXD0snWb5xZ/eCx+RGX0wuF
 imWXPARe3aYiNMHrSgGQqEatVAmiIaXlD5yW+PPR8Qfvgqo11migmg9LP9t3PJ9XyGa+
 r4nw==
X-Gm-Message-State: AOJu0Yw0tMIPTDcvCDFGcmR40YV0isSAIvBlf7oBhT3TOBjlwrRxPS9D
 hL52jUPlrQUmjdDXHoFs6z1RjsQPrOZi3o+LVETahy2//0hxnrZ1PKOIX+OgJSUmu6AcJQu49XW
 2I6iV//YEK7BnwWeqmcbCAA0xefUu5qk7lYRkL2rkNWXdtUVPt8OeTo3lLFdpOmcg3XdXsS8=
X-Gm-Gg: ASbGncs13+vAoSLVW9ilxflhHEK8sfD0EZSZAGpY/NCsWsWoaftdXSZ2vRHQ6MhR6Yo
 eTmWkTS/ilDn0e74L01NQMlTEdeK8eWJii0JlNm4qSMoGBJirXVZcUcSSmYAuZP/g+O9VTqAtYm
 /iIWxNHLKikSyFsqEoIni7TBNs95LuVp5Ly2iBzjDy4HDBtvbWat6wtw4keCRu0X5cZNsUpAyLd
 M3IAptXrYZ5RFlxoFWnzUb3PLSEwfw1mJeuhPYnabBViWwGt7sHHxY43/Rpvrd1nFpRfdYi/iVg
 9Tjb1t1DkOlRw8we+zkgMzatuMvFzuV74QgtFAoQBwe9qi7IhpNnZospvBd8zvlM7ypQEg7ykL0
 86vuxezlShavrTAtAO+cca5h6
X-Received: by 2002:a05:6214:cc2:b0:6f8:a6fe:24ed with SMTP id
 6a1803df08f44-6f8b082861fmr89883926d6.10.1747447200520; 
 Fri, 16 May 2025 19:00:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGa6ZwlC44UP8jsEQ22lvWdm6wcoZvnONq7h1t9qxDd3KoV8uXhs6K7zmRDjNk8uSamqIJjsg==
X-Received: by 2002:a05:6214:cc2:b0:6f8:a6fe:24ed with SMTP id
 6a1803df08f44-6f8b082861fmr89882496d6.10.1747447196940; 
 Fri, 16 May 2025 18:59:56 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e70180f7sm672167e87.128.2025.05.16.18.59.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 May 2025 18:59:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 17 May 2025 04:59:44 +0300
Subject: [PATCH v6 08/10] drm/display: bridge-connector: hook in CEC
 notifier support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250517-drm-hdmi-connector-cec-v6-8-35651db6f19b@oss.qualcomm.com>
References: <20250517-drm-hdmi-connector-cec-v6-0-35651db6f19b@oss.qualcomm.com>
In-Reply-To: <20250517-drm-hdmi-connector-cec-v6-0-35651db6f19b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3344;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=LMfOqZbcmDFI+UGpgbtzZXyktFHpBBqyKOs2nIEEJWo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoJ+2LwoerEyNYi7ihJJAMmqPFArPVA3VlmHCN3
 IiEZ71MP8eJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCftiwAKCRCLPIo+Aiko
 1RYxB/4j1PzOGgcvMIrL6Y/yAmjXrjoiaIyQtPY7SBGeyzLFYpBbOWFsy9l2v/ad2VZdYpJb90S
 Z3+NqKQa290lV+bJjeOOyY65rfHMKGoe/lMsGzpBVqltcf+R048HtdasvXYhPckf6FqgYxKnTVg
 zhE7IDPNx/t1WgX/3D5c+KdaWubqyWyAIkUxZCgIMrTC6kN7ZlRaiKatLdAzNeMsAgSFpFBD4V+
 upFmVqaL1dINpqiMr0z041KN9TeizUX0Fnslv6ksZIyizbkidwVMpgoL+RODcRQXSUTup4vaGJh
 ZezI+qMf/8pRN5Mzoz5ELiSmEv+KUFETUaVmspYQKr/cdP8F
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: nxs0wq2F6h0fwqndxOAjxTDA_letY2CJ
X-Proofpoint-ORIG-GUID: nxs0wq2F6h0fwqndxOAjxTDA_letY2CJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE3MDAxNyBTYWx0ZWRfX5loL/ks4OJ7N
 B6yqZ4OFgI+52pj/8xM7Pv404Iuj+j3bN54PB1wlt+pNgOoat2lIdelqHtHB4hk4sSc8t5gFXrT
 hzKaooR2zmxwqTDY1p8DTOTYfX+EPjpvgh1P3nH6EwaHJIjY5iprttT6xwgvat9LaH4NQC0+2I3
 /BXFGLjmo91K5evJfygDEK2xIYKHIxaepDtuS9nhwMrpQHbBEw1J0IY4YxCmj1p5sAYo/qnaqJ0
 gCnncG/We0Ssc5Ef278k18E4vNzfFU4u2PDHqs7nomVMCcaoIVJ7bxhWGzG8vVIcNujI/GjmX0T
 LzRFjLLwOlUEM4hYUrR3lXv2/OSnqW+Rykw+OvWGpQQCtUOwIH6W9+VL7JRNTOkjWUQfTmW4LMK
 8UF5hAdizi3VNRfh3uSvpI1gUJ7ZVB0eGtgN7GRabMFk0Ed4MgkY12qSgaXNa+AGLQ2hyL7S
X-Authority-Analysis: v=2.4 cv=LOFmQIW9 c=1 sm=1 tr=0 ts=6827eda1 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=wPpwn6IxAmBijdVEDHIA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-17_01,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 malwarescore=0 mlxlogscore=890 impostorscore=0 bulkscore=0
 clxscore=1015 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505170017
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
Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 24 ++++++++++++++++++++++++
 include/drm/drm_bridge.h                       | 11 +++++++++++
 2 files changed, 35 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 381a0f9d4259bf9f72d3a292b7dcc82e45c61bae..0377dcd691a871643710d667248b05f8eb9e84d6 100644
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
+		ret = drmm_connector_hdmi_cec_notifier_register(connector,
+								NULL,
+								bridge->hdmi_cec_dev);
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

