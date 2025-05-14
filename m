Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 281E1AB79EC
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 01:52:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D67A10E08E;
	Wed, 14 May 2025 23:52:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="fcrQhX3f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3E9310E06E
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 23:52:46 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EJQeO9002734
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 23:52:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 BRhu8YwpNijobr+4MmZRMLh9GsM2sOZBqrXfVfnRJic=; b=fcrQhX3fdoFCcpD7
 AknFry9k2Xe+dFYn3N+icIbWQjQzXqxCPvSbpxxsW6a1anwubaB8BYUy2Pyo8X3q
 qCNTxwXs07TQtEYcHRD54ZjoBe7jkz1FkpAf1VelGod6Uix1ZA1VqRn8N6h09arA
 SprFx3kgePYVBINNitFc/Aa2JncrLt+zsmbWy9Q7V98k7gP1VNhaqXRtZDiIGjNm
 NXfZWW20b4ls5uwZn/UqvfuzvIB+Gyd2xrebZn4CTclm3gjdwgkZaABnerN+IJxD
 nb4Tp05VUIWdVzPEe+TcoSUmexVrW/X2GNen1DDk5e14+JjsUSKocMyl20gjibCn
 eFB/6g==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcpccxk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 23:52:46 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-b220b318de5so1077563a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 16:52:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747266765; x=1747871565;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BRhu8YwpNijobr+4MmZRMLh9GsM2sOZBqrXfVfnRJic=;
 b=uuJxzwb6dp9t+FX9gZVG5PyI8BB+x7SuvARi1tHffVz4uHmiGi2Iw28bfkCLxfMmpm
 5AoNc4vBapenpHAonaa8POemEOeHG3tgJYyb4tBh4WODNyIFcmMxBfJfEVOW8dvC0nLq
 CvGS+Q6uZEZkuQ+gRnlxaTpjgNKiX1c9lL1sds84K9Tt9zxdr+tTj+TB/ka+9FJDxhFc
 uet+B3GlRZkJlvz2kTh4356PHov62z9vJU1QkbzoUenjfQMANXtO+9jrwAnkZe/9krax
 shtaX23BrLpw1QmXQhp9+2R8Psqr9o5BzrtrsroG0G2DAGs7Xf7VPnAQpnTwg9KLpHzv
 E/VQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWchzIRoBmGrACBVFdgd6sWRVeztQlO0rep+NDcIuJXbh5c8aQN4ksvp97/9DR655X+CxdFohoiPak=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx2S631MopNeVRoH94Ic9BK2oEpCO8IBZfhTdHyKLUUlk3FAgEr
 lOTLfrgH+zNIJMK/E/PU3BIW4li9yY0/KsZQv+jhMdga9r3R7ush6iH61tjatQaWCgacVLadRvM
 2yUZzlm5GraMdChKqtDK0kgKsiJGVq6fhFaHchhDtkOGOe/hGEdU5YkErRrFsKXRQfSw=
X-Gm-Gg: ASbGncuw3LuyRSYtbPdR+4PLmFEnuTc2EKytdFDpZSr5BlW9vac+sKdOJp9Kk32qTo6
 yUccNyuGvQobMeRBe5mq/PIVJ/5r4SELLw7NjYXdSW2cXgmQcD74z5P1Wav2obRxKD40z5mEjTo
 w3JWG8/CSMCMxAOCEysoTxyzmZzGi2/ytdOq9ID4n3BFS0Ct+XWjGQmUOhkZTxYfaFX9zfiQFdS
 3Nt9DjbvlZiSl/qeuiSeGnV6zDZQ7JvaT2C4YuFKjBqWn9XTWn27W2Kq+9DU9OZSIOYV3A2T/N4
 bDdskzuUkr5cV3A74UN6VE6Vwyju+SrR8/v4zDs4BmY8ysqDrwKmO7ws2avLfowytFSHA3qw
X-Received: by 2002:a17:903:1cb:b0:220:fe36:650c with SMTP id
 d9443c01a7336-231b39cd939mr22860365ad.23.1747266765430; 
 Wed, 14 May 2025 16:52:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFWl547Eaa1HuST8YsC2jvoeIi/sfGg5wLzo0RdOuox7kr71FkkOobMA7KhfIji7/1nw2Luug==
X-Received: by 2002:a17:903:1cb:b0:220:fe36:650c with SMTP id
 d9443c01a7336-231b39cd939mr22860075ad.23.1747266765016; 
 Wed, 14 May 2025 16:52:45 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22fc8271aebsm104468735ad.107.2025.05.14.16.52.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 16:52:44 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Wed, 14 May 2025 16:52:31 -0700
Subject: [PATCH 3/5] drm/msm/dpu: Check mode against PINGPONG or DSC max width
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250514-max-mixer-width-v1-3-c8ba0d9bb858@oss.qualcomm.com>
References: <20250514-max-mixer-width-v1-0-c8ba0d9bb858@oss.qualcomm.com>
In-Reply-To: <20250514-max-mixer-width-v1-0-c8ba0d9bb858@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Abhinav Kumar <abhinav.kumar@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-64971
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747266760; l=5882;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=LJxoREKG1XL73gufxTJCA+SzAt6XGYHG0jVRmznmXOc=;
 b=PwYU3BVpIjrVur560crJv94muOZ+bjKPiVJMa6Mn80V71LJ+zJ4Nklg2I2Jdj6vcsAh0tD709
 ypiHuz+F2u9AGOg+Gk5SGrpZXYi/rkvb6Oddh+8RJPoNVP65Oxzx+Sx
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Proofpoint-GUID: ckEM97gLG0hEFM0xYOtb6p48zLaGh7Ht
X-Proofpoint-ORIG-GUID: ckEM97gLG0hEFM0xYOtb6p48zLaGh7Ht
X-Authority-Analysis: v=2.4 cv=cO7gskeN c=1 sm=1 tr=0 ts=68252cce cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=EO3rimgR04ZbLxXHhHQA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDIyMiBTYWx0ZWRfX/VDp/+V7wOMh
 Kb4RhN+/KmOG0sIsg0Shn5a7bgDqS93zl44LE48QHm9W0R7kHfxIO0A1d+U299hMzg3vWLAqYuW
 hPdCzHMUyYa/mYE74AU/H2IGNXAuvU/7NiQPYs4g2gkjV5XI5kyQddy8xG+X4JxOMX7FDTlp9Dl
 8sPlkeTn6IgC/BwSVSGQci0lagZnoj2cwFbevpkge7dlqOGHjXNGryXn6XEZVELhB3eZJMLI3kr
 p0hK6jw9TEeJcPXmElHAhxHB/TwUUFH5cT9GYPFOH1MLT3ZBtY2RBHSjIYoQEv/dvqGSahtywL7
 FVf7m/0cd30MjiHty6LEHIwpT6U9jsAwO2VmDcAXjxRjFdrrMdWAq0rro5sUmJPX0l3rk45sONO
 f+jqQgQxJGcwKxfxssFFXCF9nu8fuRwBZG1MlZLqFvZ1Vn3d1bcYeGxNwrSQ3ld03j+TEb6R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 bulkscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505140222
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

Validate requested mode and topology based on the PINGPONG or DSC encoder
max width. In addition, drop MAX_HDISPLAY_SPLIT and base LM reservation
off of PINGPONG or DSC encoder max width

As noted in the patch, while DPU 8.x+ supports a max linewidth of 8960
for PINGPONG_0, there is some additional logic that needs to be added to
the resource manager to specifically try and reserve PINGPONG_0 for
modes that are greater than 5k.

Since this is out of the scope of this series, add a helper that will
get the overall minimum PINGPONG max linewidth for a given chipset.

Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 46 +++++++++++++++++++++++++++-----
 1 file changed, 39 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 0714936d8835..6131d071b051 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -723,6 +723,31 @@ void dpu_crtc_complete_commit(struct drm_crtc *crtc)
 	_dpu_crtc_complete_flip(crtc);
 }
 
+static int msm_display_get_max_pingpong_width(struct dpu_kms *dpu_kms)
+{
+	const struct dpu_pingpong_cfg *pingpong;
+	u32 max_pingpong_width = dpu_kms->catalog->pingpong[0].max_linewidth;
+
+	/*
+	 * Find the smallest overall PINGPONG max_linewidth in the catalog since
+	 * max_linewidth can differ between PINGPONGs even within the same
+	 * chipset.
+	 *
+	 * Note: While, for DPU 8.x+, PINGPONG_0 can technically support up to
+	 * 8k resolutions, this requires reworking the RM to try to reserve
+	 * PINGPONG_0 for modes greater than 5k.
+	 *
+	 * Once this additional logic is implemented, we can drop this helper
+	 * and use the reserved PINGPONG's max_linewidth
+	 */
+	for (int i = 1; i < dpu_kms->catalog->pingpong_count; i++) {
+		pingpong = &dpu_kms->catalog->pingpong[i];
+		max_pingpong_width = min(max_pingpong_width, pingpong->max_linewidth);
+	}
+
+	return max_pingpong_width;
+}
+
 static int _dpu_crtc_check_and_setup_lm_bounds(struct drm_crtc *crtc,
 		struct drm_crtc_state *state)
 {
@@ -730,13 +755,14 @@ static int _dpu_crtc_check_and_setup_lm_bounds(struct drm_crtc *crtc,
 	struct drm_display_mode *adj_mode = &state->adjusted_mode;
 	u32 crtc_split_width = adj_mode->hdisplay / cstate->num_mixers;
 	struct dpu_kms *dpu_kms = _dpu_crtc_get_kms(crtc);
+	int max_pingpong_width = msm_display_get_max_pingpong_width(dpu_kms);
 	int i;
 
 	/* if we cannot merge 2 LMs (no 3d mux) better to fail earlier
 	 * before even checking the width after the split
 	 */
 	if (!dpu_kms->catalog->caps->has_3d_merge &&
-	    adj_mode->hdisplay > dpu_kms->catalog->caps->max_mixer_width)
+	    adj_mode->hdisplay > max_pingpong_width)
 		return -E2BIG;
 
 	for (i = 0; i < cstate->num_mixers; i++) {
@@ -748,7 +774,7 @@ static int _dpu_crtc_check_and_setup_lm_bounds(struct drm_crtc *crtc,
 
 		trace_dpu_crtc_setup_lm_bounds(DRMID(crtc), i, r);
 
-		if (drm_rect_width(r) > dpu_kms->catalog->caps->max_mixer_width)
+		if (drm_rect_width(r) > max_pingpong_width)
 			return -E2BIG;
 	}
 
@@ -1279,7 +1305,6 @@ static int dpu_crtc_reassign_planes(struct drm_crtc *crtc, struct drm_crtc_state
 }
 
 #define MAX_CHANNELS_PER_CRTC 2
-#define MAX_HDISPLAY_SPLIT 1080
 
 static struct msm_display_topology dpu_crtc_get_topology(
 		struct drm_crtc *crtc,
@@ -1289,12 +1314,18 @@ static struct msm_display_topology dpu_crtc_get_topology(
 	struct drm_display_mode *mode = &crtc_state->adjusted_mode;
 	struct msm_display_topology topology = {0};
 	struct drm_encoder *drm_enc;
+	const struct dpu_caps *caps = dpu_kms->catalog->caps;
+	u32 max_hdisplay_split;
 
 	drm_for_each_encoder_mask(drm_enc, crtc->dev, crtc_state->encoder_mask)
 		dpu_encoder_update_topology(drm_enc, &topology, crtc_state->state,
 					    &crtc_state->adjusted_mode);
 
 	topology.cwb_enabled = drm_crtc_in_clone_mode(crtc_state);
+	max_hdisplay_split = msm_display_get_max_pingpong_width(dpu_kms);
+
+	if (topology.num_dsc > 0 && caps->max_dsc_encoder_width > 0)
+		max_hdisplay_split = min(max_hdisplay_split, caps->max_dsc_encoder_width);
 
 	/*
 	 * Datapath topology selection
@@ -1315,7 +1346,7 @@ static struct msm_display_topology dpu_crtc_get_topology(
 	 * count both the WB and real-time phys encoders.
 	 *
 	 * For non-DSC CWB usecases, have the num_lm be decided by the
-	 * (mode->hdisplay > MAX_HDISPLAY_SPLIT) check.
+	 * (mode->hdisplay > max_hdisplay_split) check.
 	 */
 
 	if (topology.num_intf == 2 && !topology.cwb_enabled)
@@ -1323,7 +1354,7 @@ static struct msm_display_topology dpu_crtc_get_topology(
 	else if (topology.num_dsc == 2)
 		topology.num_lm = 2;
 	else if (dpu_kms->catalog->caps->has_3d_merge)
-		topology.num_lm = (mode->hdisplay > MAX_HDISPLAY_SPLIT) ? 2 : 1;
+		topology.num_lm = (mode->hdisplay > max_hdisplay_split) ? 2 : 1;
 	else
 		topology.num_lm = 1;
 
@@ -1501,18 +1532,19 @@ static enum drm_mode_status dpu_crtc_mode_valid(struct drm_crtc *crtc,
 						const struct drm_display_mode *mode)
 {
 	struct dpu_kms *dpu_kms = _dpu_crtc_get_kms(crtc);
+	int max_pingpong_width = msm_display_get_max_pingpong_width(dpu_kms);
 
 	/* if there is no 3d_mux block we cannot merge LMs so we cannot
 	 * split the large layer into 2 LMs, filter out such modes
 	 */
 	if (!dpu_kms->catalog->caps->has_3d_merge &&
-	    mode->hdisplay > dpu_kms->catalog->caps->max_mixer_width)
+	    mode->hdisplay > max_pingpong_width)
 		return MODE_BAD_HVALUE;
 	/*
 	 * max crtc width is equal to the max mixer width * 2 and max height is 4K
 	 */
 	return drm_mode_validate_size(mode,
-				      2 * dpu_kms->catalog->caps->max_mixer_width,
+				      2 * max_pingpong_width,
 				      4096);
 }
 

-- 
2.49.0

