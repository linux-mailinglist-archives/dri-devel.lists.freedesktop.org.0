Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 281A483CC90
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jan 2024 20:39:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13F8010F5F9;
	Thu, 25 Jan 2024 19:39:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0216910F4B0;
 Thu, 25 Jan 2024 19:39:08 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40PFMQAA012220; Thu, 25 Jan 2024 19:39:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 qcppdkim1; bh=/7EaD9pJzeKabomNNHpxeFWttr7YWCtlI+XF5wDlIGs=; b=I9
 HnJ5Fwy/YxUHd/0DQkDlpbZwYh31R/3TdHvXqHMpA9B7zi9qktaWsRcnyoInqkqm
 XbwhUhr9WzzV65I2R3P1LHLkJsIjNJGPSDQJiT6XdZHUaLY1kNykHTECCJZmxt4/
 3SC0/4r6zKrd5PC/kGptVbXZ6pvIWLySD94+fDJmVwNgqE7ZRLOIjA9Mc9VOL+Al
 hpaptC6TeyLuqVTGmPDV/3SAL5Q8E0IYdEB/StAuAQ6hWZxZwByY3e224zkBej96
 Vqu1rWlaXAYMX+PkxCczOcRgtqzWTvuncaZtOTefZb+GiQYR90kth0xNuEa2EAFg
 3BnGvPX0QA9cHdQYHlmg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vufwxaauy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Jan 2024 19:39:06 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40PJd5wM023715
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Jan 2024 19:39:05 GMT
Received: from hu-parellan-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 25 Jan 2024 11:39:05 -0800
From: Paloma Arellano <quic_parellan@quicinc.com>
To: <freedreno@lists.freedesktop.org>
Subject: [PATCH 10/17] drm/msm/dp: modify dp_catalog_hw_revision to show major
 and minor val
Date: Thu, 25 Jan 2024 11:38:19 -0800
Message-ID: <20240125193834.7065-11-quic_parellan@quicinc.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240125193834.7065-1-quic_parellan@quicinc.com>
References: <20240125193834.7065-1-quic_parellan@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: MJnTmwjn3QmfEXZsqzmkymNDijP5TuPZ
X-Proofpoint-ORIG-GUID: MJnTmwjn3QmfEXZsqzmkymNDijP5TuPZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-25_12,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 clxscore=1015
 mlxlogscore=999 impostorscore=0 lowpriorityscore=0 mlxscore=0
 malwarescore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2401190000 definitions=main-2401250142
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
Cc: neil.armstrong@linaro.org, marijn.suijten@somainline.org,
 linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, seanpaul@chromium.org,
 quic_jesszhan@quicinc.com, dmitry.baryshkov@linaro.org,
 Paloma Arellano <quic_parellan@quicinc.com>, quic_khsieh@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Modify dp_catalog_hw_revision to make the major and minor version values
known instead of outputting the entire hex value of the hardware version
register in preparation of using it for VSC SDP programming.

Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_catalog.c | 12 +++++++++---
 drivers/gpu/drm/msm/dp/dp_catalog.h |  2 +-
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index 5d84c089e520a..c025786170ba5 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -24,6 +24,9 @@
 #define DP_INTERRUPT_STATUS_ACK_SHIFT	1
 #define DP_INTERRUPT_STATUS_MASK_SHIFT	2
 
+#define DP_HW_VERSION_MAJOR(reg)	FIELD_GET(GENMASK(31, 28), reg)
+#define DP_HW_VERSION_MINOR(reg)	FIELD_GET(GENMASK(27, 16), reg)
+
 #define DP_INTF_CONFIG_DATABUS_WIDEN     BIT(4)
 
 #define DP_INTERRUPT_STATUS1 \
@@ -531,15 +534,18 @@ int dp_catalog_ctrl_set_pattern_state_bit(struct dp_catalog *dp_catalog,
  *
  * @dp_catalog: DP catalog structure
  *
- * Return: DP controller hw revision
+ * Return: void
  *
  */
-u32 dp_catalog_hw_revision(const struct dp_catalog *dp_catalog)
+void dp_catalog_hw_revision(const struct dp_catalog *dp_catalog, u16 *major, u16 *minor)
 {
 	const struct dp_catalog_private *catalog = container_of(dp_catalog,
 				struct dp_catalog_private, dp_catalog);
+	u32 reg_dp_hw_version;
 
-	return dp_read_ahb(catalog, REG_DP_HW_VERSION);
+	reg_dp_hw_version = dp_read_ahb(catalog, REG_DP_HW_VERSION);
+	*major = DP_HW_VERSION_MAJOR(reg_dp_hw_version);
+	*minor = DP_HW_VERSION_MINOR(reg_dp_hw_version);
 }
 
 /**
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
index 563903605b3a7..94c377ef90c35 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.h
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
@@ -170,7 +170,7 @@ void dp_catalog_ctrl_config_misc(struct dp_catalog *dp_catalog, u32 cc, u32 tb);
 void dp_catalog_ctrl_config_msa(struct dp_catalog *dp_catalog, u32 rate,
 				u32 stream_rate_khz, bool fixed_nvid, bool is_ycbcr_420);
 int dp_catalog_ctrl_set_pattern_state_bit(struct dp_catalog *dp_catalog, u32 pattern);
-u32 dp_catalog_hw_revision(const struct dp_catalog *dp_catalog);
+void dp_catalog_hw_revision(const struct dp_catalog *dp_catalog, u16 *major, u16 *minor);
 void dp_catalog_ctrl_reset(struct dp_catalog *dp_catalog);
 bool dp_catalog_ctrl_mainlink_ready(struct dp_catalog *dp_catalog);
 void dp_catalog_ctrl_enable_irq(struct dp_catalog *dp_catalog, bool enable);
-- 
2.39.2

