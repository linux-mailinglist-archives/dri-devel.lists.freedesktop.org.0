Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 409F0A7E370
	for <lists+dri-devel@lfdr.de>; Mon,  7 Apr 2025 17:11:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9137710E4E1;
	Mon,  7 Apr 2025 15:11:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xk+RUZDD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D96C10E4DE
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Apr 2025 15:11:09 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5378doAH017417
 for <dri-devel@lists.freedesktop.org>; Mon, 7 Apr 2025 15:11:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 fe10XrfBEqILF1io3zsejgtJLRr7hZwf/NEsVe8V/L8=; b=Xk+RUZDDrxAGHgbk
 isVgJoTAIhmARH9SLUcunsHiNwF4DHVYnc6JNnSVOBaGINjWUPtPz8aCJ4ElM/Na
 UxPIzclyTxbuzJjFHN2I0/9fRKjzLFBVU3QG42QjiIGawYvGFzSdl4an+cmxxxVV
 2OBwBu8YbS+LVUiN54rvCNv7IlYwkKecAKT8q99O3woaz2XvCaG08bsE/9dAWgFk
 nDqIDguysiDYHNJf5Mj1AaQPeddGbMSMUoD7m1CXOOX66046Jt3d4ZnCVtf6wb7D
 r5ynwwtgU/VYBfOUz8WZmdgoPwpI7pzLGz2dGLqu5M7WfmkWoH8gSCQVA4GPfv2P
 9Z0Tqg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twg3ckmc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Apr 2025 15:11:08 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c5bb68b386so1359209785a.3
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Apr 2025 08:11:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744038668; x=1744643468;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fe10XrfBEqILF1io3zsejgtJLRr7hZwf/NEsVe8V/L8=;
 b=T3F41XExCLDM4BoBqnDl11TJfZNLWOK2vTA0m9grndBNgm8ut5PwOp8FVhQ4T0T1jT
 GruIinBVwQR/ccoVOYkTUYmEa67h7HFgQ9BkLkAKx/xiCAmcqCRMMC5OAuzN4UKXca+0
 PWq4G89l757+pT7zrUvhnzzAQgYJ3qobiYtI4AR7+AtwWkYuuY5KfAAKnjqF7rYXkEMx
 ZDBUr50ttd6l1tWs9vmu23MVr6Rq0cVuNiYRV1KIaCPOVrN7PBMP2Rjy1cwEWmipDJnY
 QgUNyLuJq6alN+uf76cpCmyF18l7YszG2zWbh9aRRJECmKpmj7UMph+qDYIUn+248zK3
 F4Rg==
X-Gm-Message-State: AOJu0Yy9Vds1seTeE6UHcGgfllVCGJ5ZCy+KpMwuYFeAfw/0tHj9xkRV
 dFSiclcjUt0OOmtLDZuB4R66iV2NQS5CnFpa61bT6QQmgrQUcnLE461aTStkqLrNaPUotpI5Npj
 ylMpRnC/2iECyJX6EN8xkX5/cP41k5PwFWtM+kkF9tHgc2lV+WUl/0LLJ77lUjlXuq80=
X-Gm-Gg: ASbGncsoGfMfuJKEVnYDPXhTzd8Yj8VtQ2a1cNDeSNBgFf/6qfjIzmj0w9wmtJr3QbD
 48SYQpN89s+3EXK/ehX1MVt3KpNBKl4gJJEIuUvnz2p5AbyeatL4TnbVy+CsTwDi6nKXqU+TDtz
 ESmm5dJ8plMfPQ6r/hvZpCMcigq/AZ0//oIXyK8nR/FulSyjnvEGkqAd9pFQcKxLMHlx1Ag1VY+
 /gi76Z5v2c9fByWdusDTCMjrvGTApozX6ZdDhYNR5/eHvl+9sjvGFiSWjpKx6Ljvz2wIQqTkWC0
 ofxE9f7QaDjDB/glyxh0RXZJYHfaxC0ibe4bwvdrDSblvbixEU706DZFwk75nT/DaFkujAu/aXD
 sDcu3RY4PxbXSh810gEcY+2qHJrkm
X-Received: by 2002:a05:620a:c4a:b0:7c5:9fd3:a90b with SMTP id
 af79cd13be357-7c774df4276mr1590640285a.47.1744038667691; 
 Mon, 07 Apr 2025 08:11:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFo2fUe3/lYQ8LvRJBQqKBkkclZXyu5YwhanQNqO6xzwNCiJ9Xy9mecSFfO542e2pF6L41v5Q==
X-Received: by 2002:a05:620a:c4a:b0:7c5:9fd3:a90b with SMTP id
 af79cd13be357-7c774df4276mr1590636385a.47.1744038667381; 
 Mon, 07 Apr 2025 08:11:07 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54c1e635becsm1312572e87.127.2025.04.07.08.11.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Apr 2025 08:11:06 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 07 Apr 2025 18:11:00 +0300
Subject: [PATCH v5 03/11] drm/connector: add CEC-related fields
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-drm-hdmi-connector-cec-v5-3-04809b10d206@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4933;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=54WKoDcdJyjz62IAsiH81XQN48gV/uJbhVTZ/pWNAxU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn8+sD6cvwtteDotOSmKG7WC/u6//3vAxe6iMA6
 VLaYEOY7XSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ/PrAwAKCRCLPIo+Aiko
 1ZICB/4orDENRUizoSYNKf5t3NAEOAtkOzoBiFDKADkJ/J0MozhssRAydqfPXkJwvHyILfY3xaK
 ErUEErKsHPJNTBEODsaYwEWYsQE27XyKzT1PJp+Ly+nYEgDg2htXz8mta88d3gjFQaHjuETzMAl
 Pm5SUHcuz/1b4YD0OVsAILZJjz6/eKfE/+GehiWI8+HgzSXhoPzwEoFnIa57vQMigz1/5xv7Go3
 jiPnLH4lQA6T6i+IMRLngCjBobSPrXZTZ/AIz73Z7vPJ2F0S06NF93VnKMeH/sgfCxC0+gaZnNj
 7X8gI+tod8Egj9rTHjTqQHv2EDnP1f6gun+3KvoYyUNy4NXG
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: mhRv8-HGiMBWWlZ6bMj0xr0RxLaX0kge
X-Proofpoint-ORIG-GUID: mhRv8-HGiMBWWlZ6bMj0xr0RxLaX0kge
X-Authority-Analysis: v=2.4 cv=I/9lRMgg c=1 sm=1 tr=0 ts=67f3eb0c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=AOKA84pl558A9rEY638A:9
 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
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

As a preparation to adding HDMI CEC helper code, add CEC-related fields
to the struct drm_connector. The callbacks abstract CEC infrastructure
in order to support CEC adapters and CEC notifiers in a universal way.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/drm_connector.c | 42 +++++++++++++++++++++++++++++++
 include/drm/drm_connector.h     | 56 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 98 insertions(+)

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
index f13d597370a30dc1b14c630ee00145256052ba56..5f47df9a586a3e0acc26204b86ee7242acad7403 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1191,6 +1191,37 @@ struct drm_connector_hdmi_audio_funcs {
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
+
+	/**
+	 * @unregister: unregister CEC adapter / notifier.
+	 *
+	 * The callback to unregister CEC adapter or notifier, abstracting the
+	 * operation.
+	 */
+	void (*unregister)(struct drm_connector *connector);
+};
+
 /**
  * struct drm_connector_hdmi_funcs - drm_hdmi_connector control functions
  */
@@ -1832,6 +1863,26 @@ struct drm_connector_hdmi {
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
@@ -2253,6 +2304,11 @@ struct drm_connector {
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

