Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02805AF9FAD
	for <lists+dri-devel@lfdr.de>; Sat,  5 Jul 2025 12:05:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A64CC10E373;
	Sat,  5 Jul 2025 10:05:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="I0IakTtj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BEB210E373
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Jul 2025 10:05:24 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5652Y8Yt006926
 for <dri-devel@lists.freedesktop.org>; Sat, 5 Jul 2025 10:05:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=mNW1ZYUh5DOico3cpn+0P1
 bwLPOHnmH6GIgzVBmfRpk=; b=I0IakTtjUo8tn+qCH4bddYxogTXaFhZXAMAZGM
 vJ8J0dWaWzv3CZN+mf1DqmWQqJFsyXHsjKtMEJ7CJTZMW8HyNhkcf3RwuqJEw3xX
 Dj/lbQGJ9oTuIM38jXx1+Jps9qd7c5cbw319Clf6vBa+zvBpA0u8hXt4zsUBRut/
 jPTY6b8LGBQ1+/e2dnbh5XIT86+ICFAAFAAW57V/pRvxOwscMhXnBYjX/K/mwXUO
 TEVP3SL6MlqOqmuNWDH1kRh+JBsZZ7j2jV7bnBPF+1b39K+d8enpcSLgqbonmVNP
 pz0H3pa9B+TuQ9P37+peVZAl5i7Y/3v9ejp+p+KSitoo2lew==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pucm8n5j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 05 Jul 2025 10:05:23 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7d44a260e45so264128185a.1
 for <dri-devel@lists.freedesktop.org>; Sat, 05 Jul 2025 03:05:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751709922; x=1752314722;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mNW1ZYUh5DOico3cpn+0P1bwLPOHnmH6GIgzVBmfRpk=;
 b=p2jW363rXwDNP+HmlynI3p9R2O6qyVpCYEZHwuebB4kmG5BFwY55j7DcNtZqZYUQ2G
 xdGWnSja8iNzhm2id/iWjWYsf26AetPoFnucCIzE48VgESZcxIP2os0fjN4l+W3rg5D0
 gkoaRsA+YHc67Z7L1Em2m8GYQstTtp2Ywafeo1gbGzZAJveaHsVIL8U3TNPPdKj8Oeoh
 hhwFdjyH+ebRKZYNDlHxVAkiY1owTv44duHWf9cO7ha0p56jTgEeqKjTu+49oGEhSV8Z
 1lYQeAguCu05pHHXl7KRKcfG1IiaMAMFpE68H9kTACfsH5rcvjc/vfB3SRSB2qZM+zDx
 FTmA==
X-Gm-Message-State: AOJu0YxXD19ojpLIYStQwybUz9S1NYkOy3fgehKoz4iArHY+22zXr47R
 x7XssfGns/KSBNLYHabbo36X4H+uR8vFjmebMVZp3vAFG+qel8BHN160zFOglIAEiZwsD78LO5D
 INEOa+Gn98kdFbDxAL97etbidloznsYheJlcBFiXdVpC3LTHUwLEEn5nnZNcxbUqUZ4FMCWU=
X-Gm-Gg: ASbGnctLh0gmDotKN370RLBw2Oi+xJeymjSNbrrcnJz3ARnpgTIEwUUqcN+lLmhZBQ0
 HHPiFOGWobJ48afkZgeOr4zBOzxVOGKjWb7oj343Sa+ZHfnbFTQt6MP1pgQmljiWWdUHEJeN+dM
 5pF6/M/blthN/OGqOhLIT32vSlqpK8PP0GZB/HwIQFpQpJ2eaiBj3fOsY23NUzNxqr0E2lOUeJ2
 A96o2FZ0g/Xh19K8DMlGYzaEsTqtEqY9iPC2cIFNvEVf+hAABFJ4VOXXiUurgSgjgbjK4yCHh7J
 3sbZIaGh8hRZJcmt6aF02PqcoE9AJZaEnW2gitP4ktdmy6SrcdLS9HG3XAwQDa3tI5OFMNmtwGa
 YtX3j6Soqmk1s3M1MFdsekiZXs4LYPvOQgU8=
X-Received: by 2002:a05:620a:19a5:b0:7d2:26b4:66d2 with SMTP id
 af79cd13be357-7d5dc6d16f1mr906976185a.22.1751709922192; 
 Sat, 05 Jul 2025 03:05:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEkt6lgdqmXDNyzqwEbcaZubKzbBUJHqVVbH9PK9LwSXaBHmTk2TtHOyqsNHPsV+t+J+JFUzQ==
X-Received: by 2002:a05:620a:19a5:b0:7d2:26b4:66d2 with SMTP id
 af79cd13be357-7d5dc6d16f1mr906971285a.22.1751709921616; 
 Sat, 05 Jul 2025 03:05:21 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-556383d8dccsm524919e87.66.2025.07.05.03.05.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Jul 2025 03:05:20 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 05 Jul 2025 13:05:13 +0300
Subject: [PATCH RESEND v7] drm/vc4: hdmi: switch to generic CEC helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250705-drm-hdmi-connector-cec-v7-1-d14fa0c31b74@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=13618;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=jfmW5LTc9V7uxrBEi3HTV1s8UU21BS7O7jO36LaiN70=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoaPjg8ZTt6AiItbpvAUBSsIMCCvXcG02CXQo3E
 CRZqidJiGKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaGj44AAKCRCLPIo+Aiko
 1ZNdCACvyy/Osd1bS8m0ydpu5eKm6RhaouXBAgpy4hV4rlpH9rFD9IHTt6Tw9vjW7hp30j/aCZl
 6wcR6hWjMCNiAucEhK8QJlWFfc20uobYwqdvNxHYqpxsjXc9K17ped2qsetVBzfY8Nth+tPR7uT
 79h4R/exhC5txSsEqkZmKBNSrBUI+aXQxoNsOE9MGq5q5PqrNRqiRJNbBj+i3BK+dDbpl8Q0mke
 hX+4U/RQ/yLHfAao0QSDTirZwxMwWaC79aEqdD1SSKDME8HcYJL3GW//+wv6HIw14CYDXVFhNdF
 bJu6Sde8iZ97staeUwkNqS3cOFTEDage+O1hOYyn+NCxm+k+
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=GdQXnRXL c=1 sm=1 tr=0 ts=6868f8e3 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=OObKh_pN1NuGipoYyuwA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: Aun6B3iRtG4CDKYfQyr4z95k5Ol2hsho
X-Proofpoint-ORIG-GUID: Aun6B3iRtG4CDKYfQyr4z95k5Ol2hsho
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDA2NCBTYWx0ZWRfXwUDZd77COxbT
 Ij4CxRooIXm0+K64l2idwBVFCTJOQX4R1SkTXFs9NzV1KR9lIEoma6/H3GYy+sJmAg4Qm6ergne
 JF6cLPdnSZc1WR88LOiA4thpNUDmnc4LSfKLyUymMxLJUwAMB6yHO0arGEJDRhBHCxuiRXpM9yT
 KfgEGwocqB4nepiRHUttoBiDA2gUYAufleAc5KXCfv3cKNey4NamD5honWuUqVrw2UfgQlnCZsQ
 PRMi5M3m5HzwmseAoE+4Xnj8TkM/7VYX7bG+TpbmmcxGdhu4FWIO9K8rovubQIBnb6OtB9Xc+go
 oYG7+iPfpE+6frG2EOk+QdXCxa941PsLYzCSOIhU0wfyZ0I8WaLsKsYnDeuqqy59G/g4KjfjImS
 /QQndQfBSlPyE1xv3DXmKM6zmDqMpL40EK5MbQgPgHuXq4fBs2TIu2yDn1WXTyO1Bgiq7ayY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015
 spamscore=0 suspectscore=0 mlxlogscore=999 priorityscore=1501 impostorscore=0
 malwarescore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507050064
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

Switch VC4 driver to using CEC helpers code, simplifying hotplug and
registration / cleanup. The existing vc4_hdmi_cec_release() is kept for
now.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
This is a part of the HDMI CEC rework, posting separately to let it be
tested by the maintainers.
---
Changes in v7:
- Dropped all applied patches, keeping just VC4
- Link to v6: https://lore.kernel.org/r/20250517-drm-hdmi-connector-cec-v6-0-35651db6f19b@oss.qualcomm.com

Changes in v6:
- Fixed vc4 to build with changed API (Maxime)
- Reworked helpers to use drmm to unregister CEC implementations
  (Maxime)
- Expanded commit message to explain void *data design (Maxime)
- Dropped extra include of drm_connector.h from drm_hdmi_cec_helper.h
  (Jani)
- Link to v5: https://lore.kernel.org/r/20250407-drm-hdmi-connector-cec-v5-0-04809b10d206@oss.qualcomm.com

Changes in v5:
- Fixed the check in adv7511_bridge_hdmi_tmds_char_rate_valid().
- Major rework of HDMI CEC to follow 'helpers' design. Implemented
  generic data structures that can be used for both CEC notifiers and
  CEC adapters (Maxime).
- Link to v4: https://lore.kernel.org/r/20250202-drm-hdmi-connector-cec-v4-0-a71620a54d50@linaro.org

Changes in v4:
- Rebased on top of drm-misc-next + commit 78a5acf5433d ("drm/display:
  hdmi: Do not read EDID on disconnected connectors")
- Moved 'select DRM_DISPLAY_HDMI_CEC_HELPER' under the
  DRM_I2C_ADV7511_CEC symbol
- Fixed documentation for @hdmi_audio_i2s_formats to describe default
  behaviour.
- Split drm_connector_cleanup() patch from the patch adding CEC-related
  data structures (Maxime).
- Documented that CEC mutex protects all data fields in struct
  drm_connector_cec (Maxime).
- Improved drm_connector_cec_funcs.unregister() documentation.
- Documented struct drm_connector_hdmi_cec_adapter_ops fields. Added a
  note to the commit message on the difference between it and struct
  drm_connector_cec_funcs (Maxime).
- Fixed Kconfig dependencies.
- Link to v3: https://lore.kernel.org/r/20250126-drm-hdmi-connector-cec-v3-0-5b5b2d4956da@linaro.org

Changes in v3:
- Moved default available_las setting to
  drm_connector_hdmi_cec_register(), allowing drivers to pass 0 instead
  of CEC_MAX_LOG_ADDRS.
- Reworked drm_bridge interface to store opaque pointer and interpret it
  as drm_connector in CEC helpers code.
- Fixed EINVAL checks in drm_connector_hdmi_cec_register().
- Added the adv7511 patch, demonstrating CEC helpers for the DRM
  bridges.
- Link to v2: https://lore.kernel.org/r/20250110-drm-hdmi-connector-cec-v2-0-9067c8f34663@linaro.org

Changes in v2:
- Refactored CEC funcs, adding more wrappers to provide more consistent
  interface (Maxime)
- Removed export of drm_connector_cec_unregister() (Maxime)
- Restored and rephrased comment in vc4_hdmi (Maxime)
- Squashed vc4 patches
- Link to v1: https://lore.kernel.org/r/20241225-drm-hdmi-connector-cec-v1-0-b80380c67221@linaro.org
---
 drivers/gpu/drm/vc4/Kconfig    |   1 +
 drivers/gpu/drm/vc4/vc4_hdmi.c | 137 ++++++++++++++++-------------------------
 drivers/gpu/drm/vc4/vc4_hdmi.h |   1 -
 3 files changed, 55 insertions(+), 84 deletions(-)

diff --git a/drivers/gpu/drm/vc4/Kconfig b/drivers/gpu/drm/vc4/Kconfig
index 123ab0ce178157c3b39466f87c7ac39c8470f329..bb8c40be325033632d3e94db87a16b03554ad3af 100644
--- a/drivers/gpu/drm/vc4/Kconfig
+++ b/drivers/gpu/drm/vc4/Kconfig
@@ -35,6 +35,7 @@ config DRM_VC4_HDMI_CEC
 	bool "Broadcom VC4 HDMI CEC Support"
 	depends on DRM_VC4
 	select CEC_CORE
+	select DRM_DISPLAY_HDMI_CEC_HELPER
 	help
 	  Choose this option if you have a Broadcom VC4 GPU
 	  and want to use CEC.
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 4797ed1c21f47992fe4d497d904ee31c824cd449..194a73fb821ae5082f308c81293c22fed0dbda80 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -32,6 +32,7 @@
  */
 
 #include <drm/display/drm_hdmi_audio_helper.h>
+#include <drm/display/drm_hdmi_cec_helper.h>
 #include <drm/display/drm_hdmi_helper.h>
 #include <drm/display/drm_hdmi_state_helper.h>
 #include <drm/display/drm_scdc_helper.h>
@@ -375,14 +376,6 @@ static void vc4_hdmi_handle_hotplug(struct vc4_hdmi *vc4_hdmi,
 
 	drm_atomic_helper_connector_hdmi_hotplug(connector, status);
 
-	if (status == connector_status_disconnected) {
-		cec_phys_addr_invalidate(vc4_hdmi->cec_adap);
-		return;
-	}
-
-	cec_s_phys_addr(vc4_hdmi->cec_adap,
-			connector->display_info.source_physical_address, false);
-
 	if (status != connector_status_connected)
 		return;
 
@@ -2378,8 +2371,8 @@ static irqreturn_t vc4_cec_irq_handler_rx_thread(int irq, void *priv)
 	struct vc4_hdmi *vc4_hdmi = priv;
 
 	if (vc4_hdmi->cec_rx_msg.len)
-		cec_received_msg(vc4_hdmi->cec_adap,
-				 &vc4_hdmi->cec_rx_msg);
+		drm_connector_hdmi_cec_received_msg(&vc4_hdmi->connector,
+						    &vc4_hdmi->cec_rx_msg);
 
 	return IRQ_HANDLED;
 }
@@ -2389,15 +2382,17 @@ static irqreturn_t vc4_cec_irq_handler_tx_thread(int irq, void *priv)
 	struct vc4_hdmi *vc4_hdmi = priv;
 
 	if (vc4_hdmi->cec_tx_ok) {
-		cec_transmit_done(vc4_hdmi->cec_adap, CEC_TX_STATUS_OK,
-				  0, 0, 0, 0);
+		drm_connector_hdmi_cec_transmit_done(&vc4_hdmi->connector,
+						     CEC_TX_STATUS_OK,
+						     0, 0, 0, 0);
 	} else {
 		/*
 		 * This CEC implementation makes 1 retry, so if we
 		 * get a NACK, then that means it made 2 attempts.
 		 */
-		cec_transmit_done(vc4_hdmi->cec_adap, CEC_TX_STATUS_NACK,
-				  0, 2, 0, 0);
+		drm_connector_hdmi_cec_transmit_done(&vc4_hdmi->connector,
+						     CEC_TX_STATUS_NACK,
+						     0, 2, 0, 0);
 	}
 	return IRQ_HANDLED;
 }
@@ -2554,9 +2549,9 @@ static irqreturn_t vc4_cec_irq_handler(int irq, void *priv)
 	return ret;
 }
 
-static int vc4_hdmi_cec_enable(struct cec_adapter *adap)
+static int vc4_hdmi_cec_enable(struct drm_connector *connector)
 {
-	struct vc4_hdmi *vc4_hdmi = cec_get_drvdata(adap);
+	struct vc4_hdmi *vc4_hdmi = connector_to_vc4_hdmi(connector);
 	struct drm_device *drm = vc4_hdmi->connector.dev;
 	/* clock period in microseconds */
 	const u32 usecs = 1000000 / CEC_CLOCK_FREQ;
@@ -2621,9 +2616,9 @@ static int vc4_hdmi_cec_enable(struct cec_adapter *adap)
 	return 0;
 }
 
-static int vc4_hdmi_cec_disable(struct cec_adapter *adap)
+static int vc4_hdmi_cec_disable(struct drm_connector *connector)
 {
-	struct vc4_hdmi *vc4_hdmi = cec_get_drvdata(adap);
+	struct vc4_hdmi *vc4_hdmi = connector_to_vc4_hdmi(connector);
 	struct drm_device *drm = vc4_hdmi->connector.dev;
 	unsigned long flags;
 	int idx;
@@ -2657,17 +2652,17 @@ static int vc4_hdmi_cec_disable(struct cec_adapter *adap)
 	return 0;
 }
 
-static int vc4_hdmi_cec_adap_enable(struct cec_adapter *adap, bool enable)
+static int vc4_hdmi_cec_adap_enable(struct drm_connector *connector, bool enable)
 {
 	if (enable)
-		return vc4_hdmi_cec_enable(adap);
+		return vc4_hdmi_cec_enable(connector);
 	else
-		return vc4_hdmi_cec_disable(adap);
+		return vc4_hdmi_cec_disable(connector);
 }
 
-static int vc4_hdmi_cec_adap_log_addr(struct cec_adapter *adap, u8 log_addr)
+static int vc4_hdmi_cec_adap_log_addr(struct drm_connector *connector, u8 log_addr)
 {
-	struct vc4_hdmi *vc4_hdmi = cec_get_drvdata(adap);
+	struct vc4_hdmi *vc4_hdmi = connector_to_vc4_hdmi(connector);
 	struct drm_device *drm = vc4_hdmi->connector.dev;
 	unsigned long flags;
 	int idx;
@@ -2693,10 +2688,10 @@ static int vc4_hdmi_cec_adap_log_addr(struct cec_adapter *adap, u8 log_addr)
 	return 0;
 }
 
-static int vc4_hdmi_cec_adap_transmit(struct cec_adapter *adap, u8 attempts,
+static int vc4_hdmi_cec_adap_transmit(struct drm_connector *connector, u8 attempts,
 				      u32 signal_free_time, struct cec_msg *msg)
 {
-	struct vc4_hdmi *vc4_hdmi = cec_get_drvdata(adap);
+	struct vc4_hdmi *vc4_hdmi = connector_to_vc4_hdmi(connector);
 	struct drm_device *dev = vc4_hdmi->connector.dev;
 	unsigned long flags;
 	u32 val;
@@ -2739,84 +2734,65 @@ static int vc4_hdmi_cec_adap_transmit(struct cec_adapter *adap, u8 attempts,
 	return 0;
 }
 
-static const struct cec_adap_ops vc4_hdmi_cec_adap_ops = {
-	.adap_enable = vc4_hdmi_cec_adap_enable,
-	.adap_log_addr = vc4_hdmi_cec_adap_log_addr,
-	.adap_transmit = vc4_hdmi_cec_adap_transmit,
-};
-
-static void vc4_hdmi_cec_release(void *ptr)
-{
-	struct vc4_hdmi *vc4_hdmi = ptr;
-
-	cec_unregister_adapter(vc4_hdmi->cec_adap);
-	vc4_hdmi->cec_adap = NULL;
-}
-
-static int vc4_hdmi_cec_init(struct vc4_hdmi *vc4_hdmi)
+static int vc4_hdmi_cec_init(struct drm_connector *connector)
 {
-	struct cec_connector_info conn_info;
+	struct vc4_hdmi *vc4_hdmi = connector_to_vc4_hdmi(connector);
 	struct platform_device *pdev = vc4_hdmi->pdev;
 	struct device *dev = &pdev->dev;
 	int ret;
 
-	if (!of_property_present(dev->of_node, "interrupts")) {
-		dev_warn(dev, "'interrupts' DT property is missing, no CEC\n");
-		return 0;
-	}
-
-	vc4_hdmi->cec_adap = cec_allocate_adapter(&vc4_hdmi_cec_adap_ops,
-						  vc4_hdmi,
-						  vc4_hdmi->variant->card_name,
-						  CEC_CAP_DEFAULTS |
-						  CEC_CAP_CONNECTOR_INFO, 1);
-	ret = PTR_ERR_OR_ZERO(vc4_hdmi->cec_adap);
-	if (ret < 0)
-		return ret;
-
-	cec_fill_conn_info_from_drm(&conn_info, &vc4_hdmi->connector);
-	cec_s_conn_info(vc4_hdmi->cec_adap, &conn_info);
-
 	if (vc4_hdmi->variant->external_irq_controller) {
 		ret = devm_request_threaded_irq(dev, platform_get_irq_byname(pdev, "cec-rx"),
 						vc4_cec_irq_handler_rx_bare,
 						vc4_cec_irq_handler_rx_thread, 0,
 						"vc4 hdmi cec rx", vc4_hdmi);
 		if (ret)
-			goto err_delete_cec_adap;
+			return ret;
 
 		ret = devm_request_threaded_irq(dev, platform_get_irq_byname(pdev, "cec-tx"),
 						vc4_cec_irq_handler_tx_bare,
 						vc4_cec_irq_handler_tx_thread, 0,
 						"vc4 hdmi cec tx", vc4_hdmi);
 		if (ret)
-			goto err_delete_cec_adap;
+			return ret;
 	} else {
 		ret = devm_request_threaded_irq(dev, platform_get_irq(pdev, 0),
 						vc4_cec_irq_handler,
 						vc4_cec_irq_handler_thread, 0,
 						"vc4 hdmi cec", vc4_hdmi);
 		if (ret)
-			goto err_delete_cec_adap;
+			return ret;
 	}
 
-	ret = cec_register_adapter(vc4_hdmi->cec_adap, &pdev->dev);
-	if (ret < 0)
-		goto err_delete_cec_adap;
+	return 0;
+}
+
+static const struct drm_connector_hdmi_cec_funcs vc4_hdmi_cec_funcs = {
+	.init = vc4_hdmi_cec_init,
+	.enable = vc4_hdmi_cec_adap_enable,
+	.log_addr = vc4_hdmi_cec_adap_log_addr,
+	.transmit = vc4_hdmi_cec_adap_transmit,
+};
+
+static int vc4_hdmi_cec_register(struct vc4_hdmi *vc4_hdmi)
+{
+	struct platform_device *pdev = vc4_hdmi->pdev;
+	struct device *dev = &pdev->dev;
+
+	if (!of_property_present(dev->of_node, "interrupts")) {
+		dev_warn(dev, "'interrupts' DT property is missing, no CEC\n");
+		return 0;
+	}
 
 	/*
-	 * NOTE: Strictly speaking, we should probably use a DRM-managed
-	 * registration there to avoid removing the CEC adapter by the
-	 * time the DRM driver doesn't have any user anymore.
+	 * NOTE: the CEC adapter will be unregistered by drmm cleanup from
+	 * drm_managed_release(), which is called from drm_dev_release()
+	 * during device unbind.
 	 *
 	 * However, the CEC framework already cleans up the CEC adapter
 	 * only when the last user has closed its file descriptor, so we
 	 * don't need to handle it in DRM.
 	 *
-	 * By the time the device-managed hook is executed, we will give
-	 * up our reference to the CEC adapter and therefore don't
-	 * really care when it's actually freed.
-	 *
 	 * There's still a problematic sequence: if we unregister our
 	 * CEC adapter, but the userspace keeps a handle on the CEC
 	 * adapter but not the DRM device for some reason. In such a
@@ -2827,19 +2803,14 @@ static int vc4_hdmi_cec_init(struct vc4_hdmi *vc4_hdmi)
 	 * the CEC framework already handles this too, by calling
 	 * cec_is_registered() in cec_ioctl() and cec_poll().
 	 */
-	ret = devm_add_action_or_reset(dev, vc4_hdmi_cec_release, vc4_hdmi);
-	if (ret)
-		return ret;
-
-	return 0;
-
-err_delete_cec_adap:
-	cec_delete_adapter(vc4_hdmi->cec_adap);
-
-	return ret;
+	return drmm_connector_hdmi_cec_register(&vc4_hdmi->connector,
+						&vc4_hdmi_cec_funcs,
+						vc4_hdmi->variant->card_name,
+						1,
+						&pdev->dev);
 }
 #else
-static int vc4_hdmi_cec_init(struct vc4_hdmi *vc4_hdmi)
+static int vc4_hdmi_cec_register(struct vc4_hdmi *vc4_hdmi)
 {
 	return 0;
 }
@@ -3244,7 +3215,7 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 	if (ret)
 		goto err_put_runtime_pm;
 
-	ret = vc4_hdmi_cec_init(vc4_hdmi);
+	ret = vc4_hdmi_cec_register(vc4_hdmi);
 	if (ret)
 		goto err_put_runtime_pm;
 
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index a31157c99bee6b33527c4b558fc72fff65d2a278..8d069718df00d9afc13aadbb12648e2bb75a1721 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -147,7 +147,6 @@ struct vc4_hdmi {
 	 */
 	bool disable_wifi_frequencies;
 
-	struct cec_adapter *cec_adap;
 	struct cec_msg cec_rx_msg;
 	bool cec_tx_ok;
 	bool cec_irq_was_rx;

---
base-commit: ae01d3183d2763ed27ab71f4ef5402b683d9ad8a
change-id: 20241223-drm-hdmi-connector-cec-34902ce847b7

Best regards,
-- 
With best wishes
Dmitry

