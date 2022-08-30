Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C96E5A5A11
	for <lists+dri-devel@lfdr.de>; Tue, 30 Aug 2022 05:33:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBDA710E9E0;
	Tue, 30 Aug 2022 03:33:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C2E410E8A2;
 Tue, 30 Aug 2022 03:33:25 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27TMnxwN008240;
 Tue, 30 Aug 2022 03:33:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=hGeZiiTOxpovkxzOnTmMUzW9RuF+eLieMkrJVYCT+Ao=;
 b=TzN7aTlkW23wP+F56gMxDSnok3Aay1g7GmB+nTYaV/On2lD3mbC8e6jjsf+PtbmgZo8J
 eNYwdbYVoiMeErCs5A2rMA504dRykoiLGzndgKbQ3qUA92kCtcb3AfVsCRoKzxe+41qx
 tmUxcfCX/gF5g5u0V3O++kyqX/zOQOCHmqhJu8GBbpZUpMd5RFFk8ZVLu4zlh6WPglgW
 aJ/vdfIRJ/C/r0U2bFqKB1XdLkvVatvq7uzUN1C4gynqeFhHdnoP6uW8lIEc8WiNwfsB
 lUR1doY1okxURlrxhegs6O5V1+KJjKvX+SOo8vJ+xZexzViKuYdhWQYTjcF+vE5r+nRR dg== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3j8x1j1yph-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Aug 2022 03:33:22 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 27U3XKs0016704
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Aug 2022 03:33:20 GMT
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Mon, 29 Aug 2022 20:33:20 -0700
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <freedreno@lists.freedesktop.org>
Subject: [RFC PATCH 1/3] drm/msm/dpu: add max external pixel clock for all
 targets
Date: Mon, 29 Aug 2022 20:33:07 -0700
Message-ID: <1661830389-22439-2-git-send-email-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1661830389-22439-1-git-send-email-quic_abhinavk@quicinc.com>
References: <1661830389-22439-1-git-send-email-quic_abhinavk@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: HQnPkLU-qvWGMwzs6BousUWp6FKtAdb_
X-Proofpoint-ORIG-GUID: HQnPkLU-qvWGMwzs6BousUWp6FKtAdb_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-29_13,2022-08-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015
 bulkscore=0 mlxscore=0 mlxlogscore=999 lowpriorityscore=0 adultscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208300015
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
Cc: dianders@chromium.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, seanpaul@chromium.org,
 dmitry.baryshkov@linaro.org, quic_jesszhan@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add maximum external pixel clock for all targets based on
the advertised limits for each of them.

The pixel clock has been calculated from the timings mentioned
in the CEA specification for CEA modes and according to
the VESA CVT standard for the others.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 8 ++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 2 ++
 2 files changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 27f029fdc682..b04d219ac380 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -277,6 +277,7 @@ static const struct dpu_caps msm8998_dpu_caps = {
 	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
 	.max_hdeci_exp = MAX_HORZ_DECIMATION,
 	.max_vdeci_exp = MAX_VERT_DECIMATION,
+	.max_ext_pclk = 594000,
 };
 
 static const struct dpu_caps qcm2290_dpu_caps = {
@@ -288,6 +289,7 @@ static const struct dpu_caps qcm2290_dpu_caps = {
 	.has_idle_pc = true,
 	.max_linewidth = 2160,
 	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
+	.max_ext_pclk = 101250,
 };
 
 static const struct dpu_caps sdm845_dpu_caps = {
@@ -304,6 +306,7 @@ static const struct dpu_caps sdm845_dpu_caps = {
 	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
 	.max_hdeci_exp = MAX_HORZ_DECIMATION,
 	.max_vdeci_exp = MAX_VERT_DECIMATION,
+	.max_ext_pclk = 594000,
 };
 
 static const struct dpu_caps sc7180_dpu_caps = {
@@ -316,6 +319,7 @@ static const struct dpu_caps sc7180_dpu_caps = {
 	.has_idle_pc = true,
 	.max_linewidth = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
+	.max_ext_pclk = 312250,
 };
 
 static const struct dpu_caps sm8150_dpu_caps = {
@@ -332,6 +336,7 @@ static const struct dpu_caps sm8150_dpu_caps = {
 	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
 	.max_hdeci_exp = MAX_HORZ_DECIMATION,
 	.max_vdeci_exp = MAX_VERT_DECIMATION,
+	.max_ext_pclk = 594000,
 };
 
 static const struct dpu_caps sc8180x_dpu_caps = {
@@ -348,6 +353,7 @@ static const struct dpu_caps sc8180x_dpu_caps = {
 	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
 	.max_hdeci_exp = MAX_HORZ_DECIMATION,
 	.max_vdeci_exp = MAX_VERT_DECIMATION,
+	.max_ext_pclk = 594000,
 };
 
 static const struct dpu_caps sm8250_dpu_caps = {
@@ -362,6 +368,7 @@ static const struct dpu_caps sm8250_dpu_caps = {
 	.has_3d_merge = true,
 	.max_linewidth = 4096,
 	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
+	.max_ext_pclk = 594000,
 };
 
 static const struct dpu_caps sc7280_dpu_caps = {
@@ -374,6 +381,7 @@ static const struct dpu_caps sc7280_dpu_caps = {
 	.has_idle_pc = true,
 	.max_linewidth = 2400,
 	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
+	.max_ext_pclk = 312250,
 };
 
 static const struct dpu_mdp_cfg msm8998_mdp[] = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 38aa38ab1568..35cab76d9530 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -370,6 +370,7 @@ struct dpu_rotation_cfg {
 
 /**
  * struct dpu_caps - define DPU capabilities
+ * @max_ext_pclk       max pixel clock of the external display
  * @max_mixer_width    max layer mixer line width support.
  * @max_mixer_blendstages max layer mixer blend stages or
  *                       supported z order
@@ -386,6 +387,7 @@ struct dpu_rotation_cfg {
  * @max_vdeci_exp      max vertical decimation supported (max is 2^value)
  */
 struct dpu_caps {
+	int max_ext_pclk;
 	u32 max_mixer_width;
 	u32 max_mixer_blendstages;
 	u32 qseed_type;
-- 
2.7.4

