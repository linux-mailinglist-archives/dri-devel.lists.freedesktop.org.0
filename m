Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E61ABA7A6
	for <lists+dri-devel@lfdr.de>; Sat, 17 May 2025 03:59:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8FF710E239;
	Sat, 17 May 2025 01:59:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="fsxSOMse";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C5F210E2AE
 for <dri-devel@lists.freedesktop.org>; Sat, 17 May 2025 01:59:48 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54H0K6Gb025698
 for <dri-devel@lists.freedesktop.org>; Sat, 17 May 2025 01:59:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 lOtrynwNsxLQ/5vzpGhNJsN3NBvcPSFOhu9989Fyvnw=; b=fsxSOMseQL+R7TGC
 2yOlAY+bUVEHWcqotupdShY21/o70zqBj9qOAAQELoPyMOD5IaFjBU8v3ZdAO76+
 bnQH2tZ6qdK8PyH3zpZWLyUg0LLZMbUKSJQ+ayH+O4qzWSgQyTdiuE8fLT5xGXuL
 MZb1aKJ+imZpbZRVT6AIPA0nNVLt+P7KjciElbEzI0809su0RTnb0aN9HGdPn2Z2
 SkviealcrSSj2slUVB1At2nW1Cm9qA8MXnHD6NpCrUmzrucmsKtNvphqPkobHL7H
 T7XFm19ub1NyALaB6H/9Le22sz9D95ZSMVvkuPOW0tcF/sknNS/Osmp6zwtLjkJv
 60FTmQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pftq040a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 17 May 2025 01:59:47 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6f6ea9b56c4so46991796d6.1
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 18:59:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747447186; x=1748051986;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lOtrynwNsxLQ/5vzpGhNJsN3NBvcPSFOhu9989Fyvnw=;
 b=qcY1OPhi5FayzfnXUwm/oCLBnjBV3BXs0mvHYsxz8v3ldyCC21ELIs4bZu9GPAGhTg
 +67gZ2kKChv3rkOES63IxOHKSxByaMDUmRuJdD8MGxJTVKXEGIrExYKe3eMIO6OyyOaL
 NmAAjTc5j4TiGghqIGx82xzKoPV0Nwv+UBj4bEtEdUaqhe6gVXUSerwdFQnYX5QLzPlg
 JS5REq6GyzgJNKR5SfjADKz0eugVBEKHPN47fZA7OQFuJjnT+/8bnFXeLNCz42riZsNU
 sOgT2XuWvfMN1rufr31ymyiwGZrg2N5f2nqJnMTabWqU1VivWiRtrvNFVUtR5lmOIOHW
 YHWw==
X-Gm-Message-State: AOJu0YxVlcgx01QnDu1KZfMX9aOaMCJGXadlg6j62BZD1ND5JohLAHB1
 ZUtDeaCYqWc1p45ei3n7+Rp2Xblr+XXV6nbikUSwXiOMB6l85GFnMQcbGFZPWwG3bswJQa9r1FR
 a7bGlktf7qor9FVRK31EJmaK+C5dxOp58BsDRLPiUofLi0Q5FMSQAdbuoAXcP9k5RkFTDsJo=
X-Gm-Gg: ASbGncv1dnA8qeYBtBqi6jRfn+Jfw3wRksgYb4xo8I33z/q70k19Qz1r4N/BEkIoV9N
 jHpUvn49WsQJPbKfPotDOqeX6JUBQkQCrWy67J8YBCR/oQXd2n/NWHDGVMBidDOoYkzAbZc6W3Z
 q7vdxLcjJzHSVl7UL8hOCDG+7LuIr+udEz7T3Lv9ueUXGR3WSxoNcrIy5mbejdPAjOzUggvSViw
 0RyUTvo0wBCjNlOk9rpMQ5yYsv3SIasC9UrVcbdzfvey5GtvxWS2jcP8cks3srn2uBVz6sX+WNv
 1Cu2gf/t+bUhKnSE+7NyqSrcEMzDNdxkbvp2dTeYvhFnBy6RVHO4vRaCmUcKxXQ0M/DT2GEmduu
 R2I9pkMH8BRyHnK1yvyma/91b
X-Received: by 2002:a05:6214:2346:b0:6f8:997d:fc81 with SMTP id
 6a1803df08f44-6f8b2d27bf1mr79878926d6.20.1747447186640; 
 Fri, 16 May 2025 18:59:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF4xL9Easp4CTrvgavbYymdPdT+TCn8QDprrv+JKEbRlucHxgq6Y2vCLa0EOoapFr31HSsmAg==
X-Received: by 2002:a05:6214:2346:b0:6f8:997d:fc81 with SMTP id
 6a1803df08f44-6f8b2d27bf1mr79878606d6.20.1747447186248; 
 Fri, 16 May 2025 18:59:46 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e70180f7sm672167e87.128.2025.05.16.18.59.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 May 2025 18:59:45 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 17 May 2025 04:59:39 +0300
Subject: [PATCH v6 03/10] drm/connector: add CEC-related fields
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250517-drm-hdmi-connector-cec-v6-3-35651db6f19b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4994;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=ajaCqNSgbIA1IDZCd+vEJPLBT31lOSpLJmY8tw8WOjs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoJ+2LjBQ9BlT78Q2KEMSM1T202uQB2O9I2lxqf
 FthWNAgFlWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCftiwAKCRCLPIo+Aiko
 1aKKCACvak+7ezHPoV1R3z1HvU5a3my63VsT+ZeMakTHpFb/6Y8jqUrjDYefqAC+IH3oGpaeCyg
 ghc7OkyegC5JX47w5m6eb7a6teYdhAay76FKiddP93j4/eRANctu+GHrZvjpGt52yrUJvfEgktC
 lLprCBcl0fNOydTURXjgpMpCKfhhQROK/AgHJXFSTAZQIUI9RFLrAg33AY3/+K6T1dtIQeX/hdL
 702kDOBWOtqhbyFko4FfCamuaYOkWsJwp8dpihrDye/43/ZsCw9JmN/mOj8kjtwvcTLTJw2J1rg
 WXACVN7W4cujaU5xQvX0JoqyDlYu1L3s0F5/zp7eWL4IphUn
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE3MDAxNyBTYWx0ZWRfX902fKmSigtEW
 fcfXS+FIU7Zx/DcuhY1LQjcYYjB6PcvlBw9Po2MGYooAxqNuO5CCx9ZUtkR4P2cp5E1tTslJd8s
 ya9TDDnWzK2hYBB6gsqk6T82wlZGWAf5MoqKw7uubtaWKAOdQMtxwNCBnX6DlPQJHrHXJ0GG6GP
 mie0haxxx7qTjK/iAsIqwn8DkyJJouuDkobzyyRTi+WHKufGue+vSU//NQ8zwbK/OIHrIUY0SDx
 hus374Sf8bHG9Oce2m4WxCNDAk1KOQmyVj8gtFbax1x03NbZ0pq7HOc5PY8+QzRCiffYvy7EldR
 BzqjeostxO4Pma0SLwFm/5ItZTRCxde6yQ3xDb9geF2YYB0SADNavUbIhHuk34DAKGEyOA2nW/1
 fRndjPacwBPwJXC6YaaIEAnXry4BaU4Ow//u9JCbZ4yXrCGnJSLm8QOkR38tLm/8koVIpjp1
X-Proofpoint-GUID: qEVRoU6VPoC_-81iJCyEpBGZGDJX6TkJ
X-Proofpoint-ORIG-GUID: qEVRoU6VPoC_-81iJCyEpBGZGDJX6TkJ
X-Authority-Analysis: v=2.4 cv=Ft4F/3rq c=1 sm=1 tr=0 ts=6827ed93 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=gz6TB5zNMfFrGp8g0GgA:9
 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-17_01,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 adultscore=0 mlxlogscore=999 lowpriorityscore=0 priorityscore=1501
 spamscore=0 phishscore=0 malwarescore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505170017
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

As a preparation to adding HDMI CEC helper code, add CEC-related fields
to the struct drm_connector. The callbacks abstract CEC infrastructure
in order to support CEC adapters and CEC notifiers in a universal way.

CEC data is a void pointer as it allows us to make CEC data
helper-specific. For example, currently it will be either cec_notifier
or cec_adapter + drm_connector_hdmi_cec_funcs. Later cec-pin might store
platform callbacks here. DP CEC might need to store AUX pointer, etc.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/drm_connector.c | 42 ++++++++++++++++++++++++++++++++++++
 include/drm/drm_connector.h     | 48 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 90 insertions(+)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 48b08c9611a7bc70e4d849ff33ecf1c9de3cf0ae..ba08fbd973829e49ea977251c4f0fb6d96ade631 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -279,6 +279,7 @@ static int drm_connector_init_only(struct drm_device *dev,
 	INIT_LIST_HEAD(&connector->probed_modes);
 	INIT_LIST_HEAD(&connector->modes);
 	mutex_init(&connector->mutex);
+	mutex_init(&connector->cec.mutex);
 	mutex_init(&connector->eld_mutex);
 	mutex_init(&connector->edid_override_mutex);
 	mutex_init(&connector->hdmi.infoframes.lock);
@@ -701,6 +702,47 @@ static void drm_mode_remove(struct drm_connector *connector,
 	drm_mode_destroy(connector->dev, mode);
 }
 
+/**
+ * drm_connector_cec_phys_addr_invalidate - invalidate CEC physical address
+ * @connector: connector undergoing CEC operation
+ *
+ * Invalidated CEC physical address set for this DRM connector.
+ */
+void drm_connector_cec_phys_addr_invalidate(struct drm_connector *connector)
+{
+	mutex_lock(&connector->cec.mutex);
+
+	if (connector->cec.funcs &&
+	    connector->cec.funcs->phys_addr_invalidate)
+		connector->cec.funcs->phys_addr_invalidate(connector);
+
+	mutex_unlock(&connector->cec.mutex);
+}
+EXPORT_SYMBOL(drm_connector_cec_phys_addr_invalidate);
+
+
+/**
+ * drm_connector_cec_phys_addr_set - propagate CEC physical address
+ * @connector: connector undergoing CEC operation
+ *
+ * Propagate CEC physical address from the display_info to this DRM connector.
+ */
+void drm_connector_cec_phys_addr_set(struct drm_connector *connector)
+{
+	u16 addr;
+
+	mutex_lock(&connector->cec.mutex);
+
+	addr = connector->display_info.source_physical_address;
+
+	if (connector->cec.funcs &&
+	    connector->cec.funcs->phys_addr_set)
+		connector->cec.funcs->phys_addr_set(connector, addr);
+
+	mutex_unlock(&connector->cec.mutex);
+}
+EXPORT_SYMBOL(drm_connector_cec_phys_addr_set);
+
 /**
  * drm_connector_cleanup - cleans up an initialised connector
  * @connector: connector to cleanup
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index f13d597370a30dc1b14c630ee00145256052ba56..73903c3c842f3803e26c34abe7b5f0416f013d4e 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1191,6 +1191,29 @@ struct drm_connector_hdmi_audio_funcs {
 			   bool enable, int direction);
 };
 
+void drm_connector_cec_phys_addr_invalidate(struct drm_connector *connector);
+void drm_connector_cec_phys_addr_set(struct drm_connector *connector);
+
+/**
+ * struct drm_connector_cec_funcs - drm_hdmi_connector control functions
+ */
+struct drm_connector_cec_funcs {
+	/**
+	 * @phys_addr_invalidate: mark CEC physical address as invalid
+	 *
+	 * The callback to mark CEC physical address as invalid, abstracting
+	 * the operation.
+	 */
+	void (*phys_addr_invalidate)(struct drm_connector *connector);
+
+	/**
+	 * @phys_addr_set: set CEC physical address
+	 *
+	 * The callback to set CEC physical address, abstracting the operation.
+	 */
+	void (*phys_addr_set)(struct drm_connector *connector, u16 addr);
+};
+
 /**
  * struct drm_connector_hdmi_funcs - drm_hdmi_connector control functions
  */
@@ -1832,6 +1855,26 @@ struct drm_connector_hdmi {
 	} infoframes;
 };
 
+/**
+ * struct drm_connector_cec - DRM Connector CEC-related structure
+ */
+struct drm_connector_cec {
+	/**
+	 * @mutex: protects all fields in this structure.
+	 */
+	struct mutex mutex;
+
+	/**
+	 * @funcs: CEC Control Functions
+	 */
+	const struct drm_connector_cec_funcs *funcs;
+
+	/**
+	 * @data: CEC implementation-specific data
+	 */
+	void *data;
+};
+
 /**
  * struct drm_connector - central DRM connector control structure
  *
@@ -2253,6 +2296,11 @@ struct drm_connector {
 	 * @hdmi_audio: HDMI codec properties and non-DRM state.
 	 */
 	struct drm_connector_hdmi_audio hdmi_audio;
+
+	/**
+	 * @cec: CEC-related data.
+	 */
+	struct drm_connector_cec cec;
 };
 
 #define obj_to_connector(x) container_of(x, struct drm_connector, base)

-- 
2.39.5

