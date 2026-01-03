Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF12CF0058
	for <lists+dri-devel@lfdr.de>; Sat, 03 Jan 2026 14:45:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2B5710E1D6;
	Sat,  3 Jan 2026 13:45:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="dUVuyuyy";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e9MTPHyD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 657A710E1D6
 for <dri-devel@lists.freedesktop.org>; Sat,  3 Jan 2026 13:45:11 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 603BMwVv3910279
 for <dri-devel@lists.freedesktop.org>; Sat, 3 Jan 2026 13:45:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 /wcs7WndFuV4NrmzF+q/q7Lo8YaqkaYiZJXqCxYd/1U=; b=dUVuyuyyw1u4T2UX
 ckUMw3m4GVGrwqWPWMig040pg2Lp3z3ij3z9dtNTBRFy0vMzym9HISCbweN24A35
 fTVW5J80HOGuY2Q1z9eHQoSs76Odpq+WbpcPoqqcHomRg+6tBJBkNR40rN4pTUqs
 rX+YNSUq+ko/kfHl9ZtN3UufWiCHtEb3SVvU3Vnd1HDVlZmaMzPVV1gbwGqalra7
 M6V12gkEiUjiPKaqmpfj1nwtLDaoHGrdkUVlS0lWN6D5SIzBqjAxGO12XnAl9G+K
 cljr3nr1GfKZipZlFSV9VcjOQlp8KzV2rvrKBk0QfvHC46C9tin5PMG1TA49jE3z
 dUDtng==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4beuvd0jh8-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 03 Jan 2026 13:45:10 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4ee04f4c632so255262341cf.3
 for <dri-devel@lists.freedesktop.org>; Sat, 03 Jan 2026 05:45:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767447909; x=1768052709;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=/wcs7WndFuV4NrmzF+q/q7Lo8YaqkaYiZJXqCxYd/1U=;
 b=e9MTPHyD17wNwajZAs2yVDZ1DKu+094UncyogNbQEajdeH1yFDHE5N1yq5hZnqauDz
 KHT2klgZhGY7ELdXxcmqsiWe9Vq7ZhSIfYnJGwuQbNvyeRYbsHUZwp1aw12Feo0a/Dgf
 p6XGZr/6WijkjUdiUBbnc09FQzinSK8PTvUKrJA4Gel6+HT4v3YD5eqHNid90sAi3xgO
 dTGx4lrQjITElNTSGmjm2DifaT8ykTTfszaBBFc8KRivXYjx7TKy1JU98lmxTlY4oL/1
 nFA6cj/YLHTuv5PIoa5ZDRQX9p7Y4HAV3XLstbjG/TGnBaY0HGfYypUlRqaFMNqXcgiK
 vIaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767447909; x=1768052709;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=/wcs7WndFuV4NrmzF+q/q7Lo8YaqkaYiZJXqCxYd/1U=;
 b=BT7pA0kBRjPQlsKNM2z+OH8PnxlgRpsRpRSkutdkAB9x9m6eih6OcF5x3Pq7DOlLAf
 83ZlRTGFiG+qT8gSY4UwlssjKVKx4/WdIPCOspiPgmyjw1BfsXxXQuUwWrmZSrMBf7Qe
 yVQrQrpcw/olmFHlMzwmjlP3+nt0K5DIPOjYEb8FxW7JxRVk/tZuj6wPgtcPRFyg5eVO
 14sz9XFcpb4aDY0D+CIP5IqkTVACoMtn+n7SNwq6c8DarWr9/K11e3YYwvDjfgguwqpo
 E7JbIU0LYfGDffqlybv66jGOVfjkmNKZce+XtfvX8AsnA4+T0k7HC9UcEa14Dr8aVtpc
 rnnA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXnBSZayVfUmfa48T6xIqLQCVz6Vbi8LFgmtDenWRI5SWaOLAgsjoFrJ7FzMCJaGoMslBc6FuPXETA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzhAdX0j/vL2jqbTa830kZSkv1fAjRY2GNOfrugQeFQvSUvoPB7
 OjC3vTg4nD9OkZ1orsEXVpxCsX8IQiQWSYRE/JZTSxfwm/g2m3wlwy7Rsbj1ai4un+YyrCmKQR/
 GnMdPR98/PrOWALOgQgHitMLN4m7cwTjz5whgpvLR32rQ0FiuZ6X8pG7WpHyTxzGpqcedmLs=
X-Gm-Gg: AY/fxX4XyXS7FUwef6QkPb4Rwq4qy0OP76Mr2rIfJ9VggnRJUuxj+KG//NWdmv1mOuK
 BqAA0h59u7u3KTlRXQlP0+S2KrTUmEd37pIDimyBFDfFpcyapsvye/qXxYUbDTL/iIK9/2tZLVz
 2iW2fJVzHJLKYjRquex8zh2KUXzhb5+5LJ1udvKmrBL/2K8pqcOkiVk+Cc6SW+Hw9Longtpdpev
 t3DTPJhJys3MhuAhufoq6mFYaUyBJhx7tAQKsxWFeT7zc1OujSyKnoMvkxVBcdfh/cFt5KO9LrW
 vdEZtKf4R+grqDTTs9cOJIiOupDJEjLS6DsNfL1GrmWeJLUvuTzQIiHNfPKiVUXRyaGLkS4tSu4
 Hci4yF1YWRoePtr9iNoThhjJNIhPfjrFplK9bcJWuYbnGbYNLnNcPt6z6ypYbbv1mJc2ur9CiLt
 ucE6adE19DUCd89pfHOoe3908=
X-Received: by 2002:a05:622a:52:b0:4ee:2154:8032 with SMTP id
 d75a77b69052e-4f4abccfbf9mr669959801cf.6.1767447909491; 
 Sat, 03 Jan 2026 05:45:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHtRGaEFNGZAjXZRw0vILk7ro1kk7a/w0mzqVaoPclwICa5mz2eIm3sp++pOArbv3jxj57h/g==
X-Received: by 2002:a05:622a:52:b0:4ee:2154:8032 with SMTP id
 d75a77b69052e-4f4abccfbf9mr669959401cf.6.1767447908959; 
 Sat, 03 Jan 2026 05:45:08 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59a18628422sm12920873e87.101.2026.01.03.05.45.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Jan 2026 05:45:08 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 03 Jan 2026 15:45:04 +0200
Subject: [PATCH v2 1/3] drm/msm/dpu: Check mode against PINGPONG or DSC max
 width
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260103-max-mixer-width-v2-1-ef5d3d246709@oss.qualcomm.com>
References: <20260103-max-mixer-width-v2-0-ef5d3d246709@oss.qualcomm.com>
In-Reply-To: <20260103-max-mixer-width-v2-0-ef5d3d246709@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Xilin Wu <sophon@radxa.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6701;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=XxW40C1bPDwTGr6XGqsFvtEWPDf2zqGDYU7eSYwzR3E=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpWR1ibTf0NkyTLcLTmJEx64Xhmyic5FeUe3FdR
 e/pGjZVMDqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaVkdYgAKCRCLPIo+Aiko
 1VB0CACun8gKPGcBnTWOozE0spTi/qU4fsdw9cAroeBYsr2XFpkYX09lZ3yEzGMxeFgjJNjBMxm
 ULt3yMPsi82ie+FmJQvAPpb4TK8bb55fP60+hNvODbK4O5CcZlv0xCPSFjPB+LN4lRw2DtrK/aM
 cbppOSF1efZEIIcnooYwIu1U74r2etTMNDsLAwdjqnFQsQxpvjdnOwMCOlOuHRY0yUujplGFM6l
 K0O1MTT8SWvsmVhGBEu04etpcPTRiQ8X5c/Z6WW8NBOZPq8VQy8dNvu+sDD0H/K7P7B6eHSbpw3
 /un9ym6S70njE1azlOwlFNCI1/ETNUN+P07E3mCG4iuiSPHU
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: D6UGEdJmgu7yFt5A84yN1zf1zHv9jKel
X-Proofpoint-GUID: D6UGEdJmgu7yFt5A84yN1zf1zHv9jKel
X-Authority-Analysis: v=2.4 cv=OuhCCi/t c=1 sm=1 tr=0 ts=69591d66 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=ksxQWNrZAAAA:8 a=LLqVbBr0KbdSWhQ7gwEA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAzMDEyNCBTYWx0ZWRfX0V6ON94/yd+I
 EWepwjn8s4H3y2RMamS5cU/+VekeucWUQS6qXJa9qhj5GsOrpZhzTDoG0lhx//LqAicnw3lDHf9
 5tYZspXhIJQDmjBMlOE+4z+5krc19Rxj/I0+JXdBsD5BszV32H86LWaiq/1HaOs7DIsifeRimWI
 sdfl4wjgYJtW4ciMIIht2GPeohVsGQI9tzrSzSnr0g61juBDRW3DZ6PfR84HJ+ED/Fx9Q2jr9G4
 ie+1hBVGC/oFO+3xUU87JVcTSRr+j4ggQgko43p8pWr0/QhAkHGmHheq8JTRDWAagwIo4ETod3H
 oRD12Zdb9JYwo+PGDfq0UbZrH74lzjAGK8EmvEuNTzmmQLx7hqyjscMFyt4E/uWY09PVHD8aiuH
 G4Kmh9Gzlc2nsotpz8QWADOUeO4kkFVrqGPg+WeOckB4FKbK7MqKQA6tfuCpghL6+IK/osAoHAw
 F/FLYolktM9iTydfNbw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-03_02,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601030124
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

From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>

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
Tested-by: Xilin Wu <sophon@radxa.com> # qcs6490-radxa-dragon-q6a
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c       | 44 ++++++++++++++++++++++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |  7 ++++
 2 files changed, 44 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index c39f1908ea65..0b74d85a6142 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -762,6 +762,22 @@ void dpu_crtc_complete_commit(struct drm_crtc *crtc)
 	_dpu_crtc_complete_flip(crtc);
 }
 
+static int msm_display_get_max_pingpong_width(struct dpu_kms *dpu_kms)
+{
+	/*
+	 * Note: While, for DPU 8.x+, PINGPONG_0 can technically support up to
+	 * 8k resolutions, this requires reworking the RM to try to reserve
+	 * PINGPONG_0 for modes greater than 5k.
+	 *
+	 * Once this additional logic is implemented, we can probably drop this
+	 * helper and use the reserved PINGPONG's max_linewidth
+	 */
+	if (dpu_kms->catalog->mdss_ver->core_major_ver < 6)
+		return DPU_1_x_MAX_PINGPONG_WIDTH;
+	else
+		return DPU_6_x_MAX_PINGPONG_WIDTH;
+}
+
 static int _dpu_crtc_check_and_setup_lm_bounds(struct drm_crtc *crtc,
 		struct drm_crtc_state *state)
 {
@@ -769,13 +785,14 @@ static int _dpu_crtc_check_and_setup_lm_bounds(struct drm_crtc *crtc,
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
@@ -787,7 +804,7 @@ static int _dpu_crtc_check_and_setup_lm_bounds(struct drm_crtc *crtc,
 
 		trace_dpu_crtc_setup_lm_bounds(DRMID(crtc), i, r);
 
-		if (drm_rect_width(r) > dpu_kms->catalog->caps->max_mixer_width)
+		if (drm_rect_width(r) > max_pingpong_width)
 			return -E2BIG;
 	}
 
@@ -1318,7 +1335,6 @@ static int dpu_crtc_reassign_planes(struct drm_crtc *crtc, struct drm_crtc_state
 }
 
 #define MAX_CHANNELS_PER_CRTC PIPES_PER_PLANE
-#define MAX_HDISPLAY_SPLIT 1080
 
 static struct msm_display_topology dpu_crtc_get_topology(
 		struct drm_crtc *crtc,
@@ -1328,6 +1344,7 @@ static struct msm_display_topology dpu_crtc_get_topology(
 	struct drm_display_mode *mode = &crtc_state->adjusted_mode;
 	struct msm_display_topology topology = {0};
 	struct drm_encoder *drm_enc;
+	u32 max_hdisplay_split;
 	u32 num_rt_intf;
 
 	drm_for_each_encoder_mask(drm_enc, crtc->dev, crtc_state->encoder_mask)
@@ -1335,6 +1352,18 @@ static struct msm_display_topology dpu_crtc_get_topology(
 					    &crtc_state->adjusted_mode);
 
 	topology.cwb_enabled = drm_crtc_in_clone_mode(crtc_state);
+	max_hdisplay_split = msm_display_get_max_pingpong_width(dpu_kms);
+
+	if (topology.num_dsc > 0) {
+		u32 max_dsc_encoder_width;
+
+		if (dpu_kms->catalog->mdss_ver->core_major_ver < 6)
+			max_dsc_encoder_width = DPU_1_x_MAX_DSC_ENCODER_WIDTH;
+		else
+			max_dsc_encoder_width = DPU_8_x_MAX_DSC_ENCODER_WIDTH;
+
+		max_hdisplay_split = min(max_hdisplay_split, max_dsc_encoder_width);
+	}
 
 	/*
 	 * Datapath topology selection
@@ -1358,7 +1387,7 @@ static struct msm_display_topology dpu_crtc_get_topology(
 	 * count both the WB and real-time phys encoders.
 	 *
 	 * For non-DSC CWB usecases, have the num_lm be decided by the
-	 * (mode->hdisplay > MAX_HDISPLAY_SPLIT) check.
+	 * (mode->hdisplay > max_hdisplay_split) check.
 	 */
 
 	num_rt_intf = topology.num_intf;
@@ -1374,7 +1403,7 @@ static struct msm_display_topology dpu_crtc_get_topology(
 	} else if (num_rt_intf == 2) {
 		topology.num_lm = 2;
 	} else if (dpu_kms->catalog->caps->has_3d_merge) {
-		topology.num_lm = (mode->hdisplay > MAX_HDISPLAY_SPLIT) ? 2 : 1;
+		topology.num_lm = (mode->hdisplay > max_hdisplay_split) ? 2 : 1;
 	} else {
 		topology.num_lm = 1;
 	}
@@ -1553,13 +1582,14 @@ static enum drm_mode_status dpu_crtc_mode_valid(struct drm_crtc *crtc,
 						const struct drm_display_mode *mode)
 {
 	struct dpu_kms *dpu_kms = _dpu_crtc_get_kms(crtc);
+	int max_pingpong_width = msm_display_get_max_pingpong_width(dpu_kms);
 	u64 adjusted_mode_clk;
 
 	/* if there is no 3d_mux block we cannot merge LMs so we cannot
 	 * split the large layer into 2 LMs, filter out such modes
 	 */
 	if (!dpu_kms->catalog->caps->has_3d_merge &&
-	    mode->hdisplay > dpu_kms->catalog->caps->max_mixer_width)
+	    mode->hdisplay > max_pingpong_width)
 		return MODE_BAD_HVALUE;
 
 	adjusted_mode_clk = dpu_core_perf_adjusted_mode_clk(mode->clock,
@@ -1579,7 +1609,7 @@ static enum drm_mode_status dpu_crtc_mode_valid(struct drm_crtc *crtc,
 	 * max crtc width is equal to the max mixer width * 2 and max height is 4K
 	 */
 	return drm_mode_validate_size(mode,
-				      2 * dpu_kms->catalog->caps->max_mixer_width,
+				      2 * max_pingpong_width,
 				      4096);
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 336757103b5a..ee94d0ccb8a3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -24,6 +24,13 @@
 #define DPU_MAX_IMG_WIDTH 0x3fff
 #define DPU_MAX_IMG_HEIGHT 0x3fff
 
+#define DPU_1_x_MAX_PINGPONG_WIDTH	4096
+#define DPU_6_x_MAX_PINGPONG_WIDTH	5120
+#define DPU_8_x_MAX_PINGPONG_0_WIDTH	8960
+
+#define DPU_1_x_MAX_DSC_ENCODER_WIDTH	2048
+#define DPU_8_x_MAX_DSC_ENCODER_WIDTH	2560
+
 #define CRTC_QUAD_MIXERS	4
 
 #define MAX_XIN_COUNT 16

-- 
2.47.3

