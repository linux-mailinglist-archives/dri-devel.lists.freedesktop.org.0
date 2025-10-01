Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D28BAF330
	for <lists+dri-devel@lfdr.de>; Wed, 01 Oct 2025 08:14:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AA5810E33B;
	Wed,  1 Oct 2025 06:14:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vl3rKhlq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4843510E33B
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Oct 2025 06:14:53 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58UJkeAZ027373
 for <dri-devel@lists.freedesktop.org>; Wed, 1 Oct 2025 06:14:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=n5umdDdHc9CY8UIANZXMpe
 JdOMLKPrPjBDN7gFVcYZk=; b=Vl3rKhlquDcNSpnR9C/ETh2E8j+vl4PDTi79mf
 D6icnBZ1ys5wIaaKIW9WcsYElWH4qVE7M5WGRuoQYUNcwTA5BpOytQwVHyovF2lx
 7NVokCwT5IHM/EecizubZf4YLMFspMbxyh2X7jpcyViiAnZ07r7gIXTWOVOO7+aE
 JbRk9LAHsyrsujbIvQ8djY639yVV/b9veqj4qo3pytOI1CC7SwUWDztjIRR44uJO
 0OioOeHNJ2DBNj/dEb5zttF3PJbiQcLTDf52sW2liytf22JWumc1/rdxOHGMi5Ra
 HScc1Zj2CMH3TwllPQTHo1gjuNDqbz+RXzPyXtsURHk+nQig==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e851kgxq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Oct 2025 06:14:52 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4e002f413e4so43653921cf.2
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 23:14:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759299291; x=1759904091;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=n5umdDdHc9CY8UIANZXMpeJdOMLKPrPjBDN7gFVcYZk=;
 b=plwK9gODyz9hP4i4ayHpQkuTRegzwd2zSvp7pN4nu8krlUum7CX5pgbOITFwGd+qBl
 nUzPEqb+mKbJEcQCYLdcj4LJvQ2ESk1ZdApaobtaA3UDBJrrKL84MC1OtH7b/9qfHHf8
 2I6Zd4nwXOSZW/CIUP+n0Mlkvr2bUG2udbn4thMFRGpffdDfqqPvBzllVfkA8fECGKBD
 M0D3yqtQBIU+IyyDYsqSrmGPGcRWPddhUWTr/j7IVCtO470OKA+5ZOxPqyddTA+ToFmn
 EMYsR4k4gYxPWge+l2NZVOMFyXqD01s/qGGt3f1M0fWCKWR6/cxzXlcZgc3mQ0R/Epco
 95wg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUWNmQUAHOtlhx/b8q9odtwxUFfZ3SlqBZgR45/T4qRvRhnO7ZA/Tk3diakWEHlh6nsutg9wll/92o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxnjeUEbX/XcXu94Dvdzbt8O/uymDFVSW3VBccUYA0OmZ2jvLHi
 YnmOh67FKpQdWO/mZ9Lv4sveLNe0L/pZ4v8pxEdDCXjGTE4wSddKD5NQrBKtjb7KLMx1oTkPf+X
 r3SS+BukktJ0vlDLDY9asvM3uPhw7E1T4lW8CEEb3yZSHHSx04VuEyCNuM1ZC0YBZ1hRYuIA=
X-Gm-Gg: ASbGncuFYpXDQMBiJkLhkO4ABst9o2TYY3Gf3QAmqXWy8Mi2pFljQzdrvUj1qYSdehQ
 LHzOXC49iY/4BBsNOBfqVEXu2pEjoA2+iM/PZMnuJ6RSaOitmAL6kOqutJHjAyopsiHsbDzOnqr
 3qi13Ma8fiAdrwnMG+RfjmItRPu+y5Yi3i30mef5vVUrZhdfqCd2Or7xRBksltTnI/qYzKfZse1
 KzenkigfJUufY7Ruaja5yrIGvKOwJAX2+mUcrYyuhipRM5nY77CrG4XoDnK4F8NjcZHz0ZmghIg
 RDhqAFqHk8REGaH2tOg/KEGbWSFDufkR6WX+xL+YrovQtnLGD5stJ5jpj4GQ2e081Qdu9AaPIol
 7eGdUTMLAL2KWOApQMH33NXWyUwAbRPVcdN1mDje3Dztrurro3Auz92E9RQ==
X-Received: by 2002:a05:622a:1e8e:b0:4d9:f929:1531 with SMTP id
 d75a77b69052e-4e41c9242e5mr28802611cf.23.1759299290808; 
 Tue, 30 Sep 2025 23:14:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH4e0YRPO81W/CpiiD+KlpHYUytUQG96m+1u1Lgj6YphtU1NzQ6flSLG2tPHZj60wyULeR4xg==
X-Received: by 2002:a05:622a:1e8e:b0:4d9:f929:1531 with SMTP id
 d75a77b69052e-4e41c9242e5mr28802361cf.23.1759299290191; 
 Tue, 30 Sep 2025 23:14:50 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5860c76287fsm3331195e87.30.2025.09.30.23.14.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Sep 2025 23:14:49 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 01 Oct 2025 09:14:45 +0300
Subject: [PATCH RFC / WIP] drm/display: add DisplayPort high-level helper code
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251001-drm-dp-connector-v1-1-ac54fa4cc667@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIANTG3GgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDAwND3ZSiXN2UAt3k/Ly81OSS/CLdRAsjI2OLpBTTJAtDJaC2gqLUtMw
 KsJHRSkFuzgr6CuGeAUqxtbUAO7v2LG0AAAA=
X-Change-ID: 20251001-drm-dp-connector-a82238bd5b81
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Thierry Reding <thierry.reding@gmail.com>, Imre Deak <imre.deak@intel.com>,
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=12485;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=UIGaDFJydBwC+exWcXL16jDqQ+NQjFNXTvXcG12uN2I=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBo3MbYA4Ob3PluFO5aIDEfft3MHfx1bj+hw+rJ9
 HOKQLiLs/6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaNzG2AAKCRCLPIo+Aiko
 1VMNB/0Zp3/PccuM9lUwEDkPAYGbqO/jgiy/XlmGF+FGzZUviCLdo56x/C2vwefs4Cve63LG4KK
 FAgNHWjFyCJtJUhbh50Q+/INeOJ2JKf2v6NR6X4iiynUMgEYfLTpfLjQU23ortBXEwGSX+Whnu/
 h6XB/QDp9YaJlv5IWyqgR4eC0spgAKu5JnVOphjrMd4vEgSf5SFsWyzGqiyMw8wqsyc0+MRzHTl
 4UR0qlMWibxPG1WJFuMGkV6pYF/nKpkOYRIHjtBEFPJv0PbwdXdM+ZD1GSWWxpizc/BpVBwAiDI
 hRUYFlUTpSpcNtn8iGfbci8SowXuMlryCmxSpS8MtboK9dd9
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=OJoqHCaB c=1 sm=1 tr=0 ts=68dcc6dc cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=gBhEkUvOPZmXN5-cvzYA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzMiBTYWx0ZWRfXxNSlLAYiPhiS
 Pww4y/7zrXGjx5rHx//FGqZOp79yQDT850eqqlc59xU4O05GASJzEAEbEJCdlUYU7gjtHPUmnGj
 0vIET+jDafeZjk8aw7pP92ydVmjL8Yeerp99j5P1QVE57Hy09DJwrSJd+oX3dcb0EOSj1a8hY7b
 cThH/mltBjHMIzncZAAmWjhEboyTXHcPUXpQBDmimWMLy4PeYYpWQFX0XmIxTQsQQg03qQ4hsyN
 IaacbaXLQuZ0nbdrigVZjAdtvNaRalYQw75ETR34rR6fuNPxOZb9ziW9UB5PfFAyx/Z2ipArFvR
 6qxcG4TfLaDpuPMlRccp2L1Dx2SBNHLF0IQwh5VbMFvqTFAj36Yi49MI3WhD+rB+zV3brm0UNj+
 yqIj/Be2nGb2XbzHNH6xYR+hu45A9A==
X-Proofpoint-ORIG-GUID: 0A5F51df8NTsjrKo_Db50yFtNxbgEysq
X-Proofpoint-GUID: 0A5F51df8NTsjrKo_Db50yFtNxbgEysq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_01,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270032
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

Add common structure to drm_connector and a set of high-level helpers to
be used by DRM drivers to implement DisplayPort support.

Note: this is currently early WIP patch, sent in order to kick off the
discussion and the hackaton at the XDC 2025.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/display/Kconfig                   |   6 +
 drivers/gpu/drm/display/Makefile                  |   2 +
 drivers/gpu/drm/display/drm_dp_connector_helper.c | 184 ++++++++++++++++++++++
 include/drm/display/drm_dp_connector_helper.h     |  33 ++++
 include/drm/drm_connector.h                       | 102 +++++++++++-
 5 files changed, 323 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/display/Kconfig b/drivers/gpu/drm/display/Kconfig
index df09cf9a8ca19ea894d6f2fad68c0b191e81e3d0..e042a2b7a666e71f5eac748dee8bc506e725533b 100644
--- a/drivers/gpu/drm/display/Kconfig
+++ b/drivers/gpu/drm/display/Kconfig
@@ -40,6 +40,12 @@ config DRM_DISPLAY_DP_AUX_CHARDEV
 	  read and write values to arbitrary DPCD registers on the DP aux
 	  channel.
 
+config DRM_DISPLAY_DP_CONNECTOR_HELPER
+	bool "test dp_conn"
+	select DRM_DISPLAY_DP_HELPER
+	help
+	  DRM display helpers for DisplayPort.
+
 config DRM_DISPLAY_DP_HELPER
 	bool
 	help
diff --git a/drivers/gpu/drm/display/Makefile b/drivers/gpu/drm/display/Makefile
index 0ff4a1ad0222078bf495175915007f1b1f903296..ee7a09adf3baacbbd7ad251ba92dc78458881192 100644
--- a/drivers/gpu/drm/display/Makefile
+++ b/drivers/gpu/drm/display/Makefile
@@ -5,6 +5,8 @@ obj-$(CONFIG_DRM_DISPLAY_DP_AUX_BUS) += drm_dp_aux_bus.o
 drm_display_helper-y := drm_display_helper_mod.o
 drm_display_helper-$(CONFIG_DRM_BRIDGE_CONNECTOR) += \
 	drm_bridge_connector.o
+drm_display_helper-$(CONFIG_DRM_DISPLAY_DP_CONNECTOR_HELPER) += \
+	drm_dp_connector_helper.o
 drm_display_helper-$(CONFIG_DRM_DISPLAY_DP_HELPER) += \
 	drm_dp_dual_mode_helper.o \
 	drm_dp_helper.o \
diff --git a/drivers/gpu/drm/display/drm_dp_connector_helper.c b/drivers/gpu/drm/display/drm_dp_connector_helper.c
new file mode 100644
index 0000000000000000000000000000000000000000..1251a25af1a65d05255e763385eeca24c0b49292
--- /dev/null
+++ b/drivers/gpu/drm/display/drm_dp_connector_helper.c
@@ -0,0 +1,184 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ *
+ * Based on Nouveau DP code:
+ * Copyright 2009 Red Hat Inc.
+ */
+
+#include <drm/drm_connector.h>
+#include <drm/drm_print.h>
+#include <drm/display/drm_dp_connector_helper.h>
+#include <drm/display/drm_dp_helper.h>
+
+static void drm_connector_dp_init_lttpr_caps(struct drm_connector *connector)
+{
+	struct drm_dp_aux *aux = connector->dp.aux;
+	u8 *lttpr_caps = connector->dp.lttpr_caps;
+	u8 dpcd[DP_RECEIVER_CAP_SIZE];
+	int ret, nr;
+
+	if (connector->dp.caps.forbid_lttpr_init)
+		return;
+
+	/*
+	 * First access should be to the
+	 * DP_LT_TUNABLE_PHY_REPEATER_FIELD_DATA_STRUCTURE_REV,
+	 * otherwise LTTPRs might be not initialized correctly.
+	 */
+	ret = drm_dp_dpcd_probe(aux, DP_LT_TUNABLE_PHY_REPEATER_FIELD_DATA_STRUCTURE_REV);
+	if (ret)
+		goto err;
+
+	ret = drm_dp_read_dpcd_caps(aux, dpcd);
+	if (ret)
+		goto err;
+
+	ret = drm_dp_read_lttpr_common_caps(aux, dpcd, lttpr_caps);
+	if (ret)
+		goto err;
+
+	/* FIXME: don't attempt switching LTTPR mode on active link */
+	nr = drm_dp_lttpr_count(lttpr_caps);
+	ret = drm_dp_lttpr_init(aux, nr);
+	if (ret)
+		goto err;
+
+	connector->dp.lttpr_count = nr;
+
+	return;
+
+err:
+	memset(lttpr_caps, 0, DP_LTTPR_COMMON_CAP_SIZE);
+	connector->dp.lttpr_count = 0;
+}
+
+enum drm_connector_status drm_atomic_helper_connector_dp_detect(struct drm_connector *connector)
+{
+	struct drm_dp_aux *aux = connector->dp.aux;
+	u8 *dpcd = connector->dp.dpcd;
+	struct drm_dp_desc desc;
+	int ret;
+
+	drm_connector_dp_init_lttpr_caps(connector);
+
+	ret = drm_dp_read_dpcd_caps(aux, dpcd);
+	if (ret)
+		return connector_status_disconnected;
+
+	if (connector->connector_type == DRM_MODE_CONNECTOR_eDP) {
+		u8 value;
+
+		ret = drm_dp_dpcd_read_byte(aux, DP_EDP_DPCD_REV, &value);
+		if (ret < 0)
+			return connector_status_disconnected;
+
+		connector->dp.edp = value;
+	}
+
+	ret = drm_dp_read_desc(aux, &desc, drm_dp_is_branch(dpcd));
+	if (ret < 0)
+		return connector_status_disconnected;
+
+	if (drm_dp_read_sink_count_cap(connector, dpcd, &desc)) {
+		ret = drm_dp_read_sink_count(aux);
+		if (ret < 0)
+			return connector_status_disconnected;
+
+		/* No sink devices */
+		if (!ret)
+			return connector_status_disconnected;
+	}
+
+	return connector_status_connected;
+}
+EXPORT_SYMBOL(drm_atomic_helper_connector_dp_detect);
+
+static bool drm_connector_dp_check_rate(struct drm_connector *connector,
+					u32 rate)
+{
+	for (int j = 0; j < connector->dp.caps.num_supported_rates; j++)
+		if (connector->dp.caps.supported_rates[j] == rate)
+			return true;
+
+	return false;
+}
+
+void drm_atomic_helper_connector_dp_hotplug(struct drm_connector *connector,
+					    enum drm_connector_status status)
+{
+	struct drm_dp_aux *aux = connector->dp.aux;
+	u8 *lttpr_caps = connector->dp.lttpr_caps;
+	u8 *dpcd = connector->dp.dpcd;
+	u32 lane_count;
+	int ret;
+
+	connector->dp.rate_count = 0;
+	if (connector->connector_type == DRM_MODE_CONNECTOR_eDP &&
+	    connector->dp.edp >= DP_EDP_14) {
+		__le16 rates[DP_MAX_SUPPORTED_RATES];
+		int num_rates;
+
+		ret = drm_dp_dpcd_read_data(aux, DP_SUPPORTED_LINK_RATES,
+					    rates, sizeof(rates));
+		if (ret)
+			rates[0] = 0;
+
+		for (num_rates = 0;
+		     num_rates < DP_MAX_SUPPORTED_RATES && rates[num_rates] != 0;
+		     num_rates++)
+			;
+
+		for (int i = num_rates; i > 0; i--) {
+			u32 rate = (le16_to_cpu(rates[i - 1]) * 200) / 10;
+
+			if (!rate)
+				break;
+
+			if (!drm_connector_dp_check_rate(connector, rate))
+				continue;
+
+			connector->dp.rate[connector->dp.rate_count].dpcd = i - 1;
+			connector->dp.rate[connector->dp.rate_count].rate = rate;
+			connector->dp.rate_count++;
+		}
+	}
+
+	if (!connector->dp.rate_count) {
+		const u32 rates[] = { 810000, 540000, 270000, 162000 };
+		u32 max_rate = dpcd[DP_MAX_LINK_RATE] * 27000;
+
+		if (connector->dp.lttpr_count) {
+			int rate = drm_dp_lttpr_max_link_rate(connector->dp.lttpr_caps);
+
+			if (rate && rate < max_rate)
+				max_rate = rate;
+		}
+
+		for (int i = 0; i < ARRAY_SIZE(rates); i++) {
+			u32 rate = rates[i];
+
+			if (rate > max_rate)
+				continue;
+
+			if (!drm_connector_dp_check_rate(connector, rate))
+				continue;
+
+			connector->dp.rate[connector->dp.rate_count].dpcd = -1;
+			connector->dp.rate[connector->dp.rate_count].rate = rate;
+			connector->dp.rate_count++;
+		}
+	}
+
+	lane_count = dpcd[DP_MAX_LANE_COUNT] & DP_MAX_LANE_COUNT_MASK;
+	if (connector->dp.lttpr_count) {
+		unsigned int lttpr_lane_count = drm_dp_lttpr_max_lane_count(lttpr_caps);
+
+		if (lttpr_lane_count)
+			lane_count = min(lane_count, lttpr_lane_count);
+	}
+
+	connector->dp.dprx_lanes = lane_count;
+
+}
+EXPORT_SYMBOL(drm_atomic_helper_connector_dp_hotplug);
diff --git a/include/drm/display/drm_dp_connector_helper.h b/include/drm/display/drm_dp_connector_helper.h
new file mode 100644
index 0000000000000000000000000000000000000000..a15ae1a4b1a5ef038e2cca3966f88ea1dafa9c13
--- /dev/null
+++ b/include/drm/display/drm_dp_connector_helper.h
@@ -0,0 +1,33 @@
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ *
+ * Permission to use, copy, modify, distribute, and sell this software and its
+ * documentation for any purpose is hereby granted without fee, provided that
+ * the above copyright notice appear in all copies and that both that copyright
+ * notice and this permission notice appear in supporting documentation, and
+ * that the name of the copyright holders not be used in advertising or
+ * publicity pertaining to distribution of the software without specific,
+ * written prior permission.  The copyright holders make no representations
+ * about the suitability of this software for any purpose.  It is provided "as
+ * is" without express or implied warranty.
+ *
+ * THE COPYRIGHT HOLDERS DISCLAIM ALL WARRANTIES WITH REGARD TO THIS SOFTWARE,
+ * INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS, IN NO
+ * EVENT SHALL THE COPYRIGHT HOLDERS BE LIABLE FOR ANY SPECIAL, INDIRECT OR
+ * CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE,
+ * DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER
+ * TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE
+ * OF THIS SOFTWARE.
+ */
+
+#ifndef __DRM_DP_CONNECTOR_HELPER_H__
+#define __DRM_DP_CONNECTOR_HELPER_H__
+
+enum drm_connector_status;
+
+enum drm_connector_status drm_atomic_helper_connector_dp_detect(struct drm_connector *connector);
+
+void drm_atomic_helper_connector_dp_hotplug(struct drm_connector *connector,
+					    enum drm_connector_status status);
+
+#endif
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 8f34f4b8183d83dccd3e820a444fbf74fb6c16f2..953affeff0d6b7ca574d2b70fc1117dc435a97e8 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -31,6 +31,7 @@
 #include <drm/drm_mode_object.h>
 #include <drm/drm_util.h>
 #include <drm/drm_property.h>
+#include <drm/display/drm_dp.h>
 
 #include <uapi/drm/drm_mode.h>
 
@@ -46,6 +47,7 @@ struct drm_property_blob;
 struct drm_printer;
 struct drm_privacy_screen;
 struct drm_edid;
+struct drm_dp_aux;
 struct edid;
 struct hdmi_codec_daifmt;
 struct hdmi_codec_params;
@@ -1882,6 +1884,91 @@ struct drm_connector_cec {
 	void *data;
 };
 
+struct drm_connector_dp_rate_entry {
+	int dpcd;
+	u32 rate;
+};
+
+/**
+ * struct drm_connector_dp - DRM Connector DisplayPort capabilities
+ */
+struct drm_connector_dp_caps {
+	/**
+	 * @forbid_lttpr_init - forbid LTTPR init and access, e.g. on platforms
+	 * with AUX timeout < 3.2 ms.
+	 */
+	bool forbid_lttpr_init;
+
+	/**
+	 * @supported_rates - array of supported link rates, sorted in
+	 * ascending order
+	 */
+	u32 supported_rates[DP_MAX_SUPPORTED_RATES + 1];
+
+	/**
+	 * @num_supported_rates - number of valied entries in the
+	 * @supported_rates array
+	 */
+	u32 num_supported_rates;
+
+	/**
+	 * @dptx_lanes - number of lanes provided by DPTX
+	 */
+	u32 dptx_lanes;
+};
+
+/**
+ * struct drm_connector_dp - DRM Connector DisplayPort-related structure
+ */
+struct drm_connector_dp {
+	/* field set by the driver before registering the connector */
+
+	struct drm_connector_dp_caps caps;
+
+	/**
+	 * @aux - pointer to the DP AUX instance
+	 */
+	struct drm_dp_aux *aux;
+
+	/*
+	 * fields set by the drm_atomic_helper_connector_dp_detect(),
+	 * protected by connection_mutex
+	 */
+
+	/**
+	 * @dpcd - cached DPCD registers
+	 */
+	u8 dpcd[DP_RECEIVER_CAP_SIZE];
+
+	/**
+	 * @edp - cached eDP panel version
+	 */
+	u8 edp;
+
+	/**
+	 * @lttpr_caps - LTTPR capabilities read from DPRX
+	 */
+	u8 lttpr_caps[DP_LTTPR_COMMON_CAP_SIZE];
+
+	/**
+	 * @lttpr_count - the count of LTTPRs that are present and initialized
+	 * in a non-transparent mode
+	 */
+	u32 lttpr_count;
+
+	/*
+	 * fields set in drm_atomic_helper_connector_dp_hotplug, protected by FIXME
+	 */
+
+	/**
+	 * @dprx_lanes - number of lanes reported by DPRX
+	 */
+	u32 dprx_lanes;
+
+	struct drm_connector_dp_rate_entry rate[DP_MAX_SUPPORTED_RATES];
+	int rate_count;
+};
+
 /**
  * struct drm_connector - central DRM connector control structure
  *
@@ -2291,10 +2378,17 @@ struct drm_connector {
 	 */
 	struct llist_node free_node;
 
-	/**
-	 * @hdmi: HDMI-related variable and properties.
-	 */
-	struct drm_connector_hdmi hdmi;
+	union {
+		/**
+		 * @hdmi: HDMI-related variable and properties.
+		 */
+		struct drm_connector_hdmi hdmi;
+
+		/**
+		 * @dp: DisplayPort-related variable and properties.
+		 */
+		struct drm_connector_dp dp;
+	};
 
 	/**
 	 * @hdmi_audio: HDMI codec properties and non-DRM state.

---
base-commit: 457f4393d02fdb612a93912fb09cef70e6e545c9
change-id: 20251001-drm-dp-connector-a82238bd5b81

Best regards,
-- 
With best wishes
Dmitry

