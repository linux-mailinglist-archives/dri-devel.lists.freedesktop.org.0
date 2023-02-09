Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F1D69108D
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 19:45:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16D9910E9AE;
	Thu,  9 Feb 2023 18:45:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0134E10E286;
 Thu,  9 Feb 2023 18:45:05 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 319IHq4s001369; Thu, 9 Feb 2023 18:45:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=/rENSt8LtXnDqxRZE7IgNIkt8L14rlgQ5vJv+KkY3iI=;
 b=HpKdG5VNZwa+CgxFQ9+ALVgH8S+vQiAHfHcr00wlqXMAow9aw5S6yJqS5iprLZeCj5JH
 HiPCiUOgpY27CLNRFoTiuVnPMUv/fg4wo1Bgv2biMyMyrziiX6Cx25GCF9jq3mnmwJy3
 3nPCKMpHtpJTL1Sl5JfpQLfpPp0GKgCoNA943Yh/OBzhzkH7FXvllKAp9nfLUv3+aeTj
 t8by8TIituCHd4uh/XLZ5198vCD6e/giJrle58+IZy2fdxU0ShiZV8n5QH29Xq+MT4kg
 iVEgLOVVTLZS718jVIm4AnyCgGpPEe+1mg1ZIeW61bPBXGXMpp+vivgGEXFPe8YuPj1e kg== 
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nn5ek84jf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Feb 2023 18:45:03 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 319Ij2bY028830
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 9 Feb 2023 18:45:02 GMT
Received: from JESSZHAN.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Thu, 9 Feb 2023 10:45:02 -0800
From: Jessica Zhang <quic_jesszhan@quicinc.com>
To: <freedreno@lists.freedesktop.org>
Subject: [RFC PATCH v2 3/4] drm/msm/dpu: Remove empty prepare_commit() function
Date: Thu, 9 Feb 2023 10:44:25 -0800
Message-ID: <20230209184426.4437-4-quic_jesszhan@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230209184426.4437-1-quic_jesszhan@quicinc.com>
References: <20230209184426.4437-1-quic_jesszhan@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: kYVDN6s30EM4z1gqKjhI9i8GNOADeqXU
X-Proofpoint-GUID: kYVDN6s30EM4z1gqKjhI9i8GNOADeqXU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-09_15,2023-02-09_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 spamscore=0
 adultscore=0 suspectscore=0 phishscore=0 malwarescore=0 mlxscore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302090176
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
Cc: linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, seanpaul@chromium.org,
 marijn.suijten@somainline.org, dmitry.baryshkov@linaro.org,
 Jessica Zhang <quic_jesszhan@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now that the TE setup has been moved to prepare_for_kickoff(),
move empty prepare_commit() from DPU driver.

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 19 -----------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h   |  7 -------
 .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  |  6 ------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       | 21 -------------------
 4 files changed, 53 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index dcceed91aed8..35e120b5ef53 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -2090,25 +2090,6 @@ void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc)
 	ctl->ops.clear_pending_flush(ctl);
 }
 
-void dpu_encoder_prepare_commit(struct drm_encoder *drm_enc)
-{
-	struct dpu_encoder_virt *dpu_enc;
-	struct dpu_encoder_phys *phys;
-	int i;
-
-	if (!drm_enc) {
-		DPU_ERROR("invalid encoder\n");
-		return;
-	}
-	dpu_enc = to_dpu_encoder_virt(drm_enc);
-
-	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
-		phys = dpu_enc->phys_encs[i];
-		if (phys->ops.prepare_commit)
-			phys->ops.prepare_commit(phys);
-	}
-}
-
 #ifdef CONFIG_DEBUG_FS
 static int _dpu_encoder_status_show(struct seq_file *s, void *data)
 {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
index 9e7236ef34e6..2c9ef8d1b877 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
@@ -146,13 +146,6 @@ struct drm_encoder *dpu_encoder_init(
 int dpu_encoder_setup(struct drm_device *dev, struct drm_encoder *enc,
 		struct msm_display_info *disp_info);
 
-/**
- * dpu_encoder_prepare_commit - prepare encoder at the very beginning of an
- *	atomic commit, before any registers are written
- * @drm_enc:    Pointer to previously created drm encoder structure
- */
-void dpu_encoder_prepare_commit(struct drm_encoder *drm_enc);
-
 /**
  * dpu_encoder_set_idle_timeout - set the idle timeout for video
  *                    and command mode encoders.
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index 561406d92a1a..4c189b9fa9b8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -703,11 +703,6 @@ static void dpu_encoder_phys_cmd_prepare_for_kickoff(
 			atomic_read(&phys_enc->pending_kickoff_cnt));
 }
 
-static void dpu_encoder_phys_cmd_prepare_commit(
-		struct dpu_encoder_phys *phys_enc)
-{
-}
-
 static int _dpu_encoder_phys_cmd_wait_for_ctl_start(
 		struct dpu_encoder_phys *phys_enc)
 {
@@ -807,7 +802,6 @@ static void dpu_encoder_phys_cmd_trigger_start(
 static void dpu_encoder_phys_cmd_init_ops(
 		struct dpu_encoder_phys_ops *ops)
 {
-	ops->prepare_commit = dpu_encoder_phys_cmd_prepare_commit;
 	ops->is_master = dpu_encoder_phys_cmd_is_master;
 	ops->atomic_mode_set = dpu_encoder_phys_cmd_atomic_mode_set;
 	ops->enable = dpu_encoder_phys_cmd_enable;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 165958d47ec6..6f7ddbf0d9b7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -425,26 +425,6 @@ static ktime_t dpu_kms_vsync_time(struct msm_kms *kms, struct drm_crtc *crtc)
 	return ktime_get();
 }
 
-static void dpu_kms_prepare_commit(struct msm_kms *kms,
-		struct drm_atomic_state *state)
-{
-	struct drm_crtc *crtc;
-	struct drm_crtc_state *crtc_state;
-	struct drm_encoder *encoder;
-	int i;
-
-	if (!kms)
-		return;
-
-	/* Call prepare_commit for all affected encoders */
-	for_each_new_crtc_in_state(state, crtc, crtc_state, i) {
-		drm_for_each_encoder_mask(encoder, crtc->dev,
-					  crtc_state->encoder_mask) {
-			dpu_encoder_prepare_commit(encoder);
-		}
-	}
-}
-
 static void dpu_kms_flush_commit(struct msm_kms *kms, unsigned crtc_mask)
 {
 	struct dpu_kms *dpu_kms = to_dpu_kms(kms);
@@ -949,7 +929,6 @@ static const struct msm_kms_funcs kms_funcs = {
 	.enable_commit   = dpu_kms_enable_commit,
 	.disable_commit  = dpu_kms_disable_commit,
 	.vsync_time      = dpu_kms_vsync_time,
-	.prepare_commit  = dpu_kms_prepare_commit,
 	.flush_commit    = dpu_kms_flush_commit,
 	.wait_flush      = dpu_kms_wait_flush,
 	.complete_commit = dpu_kms_complete_commit,
-- 
2.39.1

