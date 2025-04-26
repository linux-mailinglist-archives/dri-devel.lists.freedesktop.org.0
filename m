Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F699A9D791
	for <lists+dri-devel@lfdr.de>; Sat, 26 Apr 2025 06:51:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEB2110E1EE;
	Sat, 26 Apr 2025 04:51:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="WQAsrqBO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7C1710E295
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Apr 2025 04:51:27 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53Q4lmcF012089
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Apr 2025 04:51:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=M/vRUlRtGuP1B6i19VOq2Z
 Bz1QZQbyfUTe2jgvfQeA8=; b=WQAsrqBOZRjtsM5vH9RcSQ2WvabZUiTs9+F/hO
 nDj83kZOIGKu/ND0JIjLZ18c0uuCTXyzG1iPiLPgoXvnhnofAgLxyOfJ6w2JRv7e
 Mex2laiI73dLWfJXYUyaiIj+bawRHk2Rv4LAMRRdYR/wKE+bae8aAr28Pu8La1of
 HYY7kFNez+k9klbqLe9PyNezy9l60q5xVYJI283c3C0+FaFPYwcuS3ksLxncbrgB
 xyRKkiNYgPUWeVD56wh2havXD4UTq8E7iGeOD3v/eiDAgwgldtWakUHd+ni3WlmN
 XkoULzb3UXiLnoiNDEQ3TGmiH4WUtYi3NjD32YiJYmQrw35A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468rsb00hs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Apr 2025 04:51:26 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c790dc38b4so527518985a.0
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 21:51:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745643085; x=1746247885;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=M/vRUlRtGuP1B6i19VOq2ZBz1QZQbyfUTe2jgvfQeA8=;
 b=S1VsjOG1KnfOtLNDp1vOkdwh/elmBBQgcP4PtEjoquGQhGsmSB6d4g/WynEBH3ZQML
 kn/2LlwwX3X4Kpknnf3qzD6Q2/FIltzyCjqTrPu1petvfPQl39xO4zSZu1tPhfqlJ96r
 Zfe71eyfuv3nny8kz940FUZMQK+QYCfFpkUgbHZHabUZw/B/kMvDZ5ifiqTh8KSW8XcO
 Kv0TUiJ4KqszLix0ZY8+E5q4Oh06aLx/4D/jhdCgutt3bTV4ncgSV+EXWQJxABhJZCGA
 kcdEPJio+jy87+UPYIIj8qq3iS8vtbhoIEFxYLpojX+4lFLT1AZ4XZCXqioTb6MZd4ng
 whFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxxg7qDXfzM4V+rbvcf40l1IkGX58j7g1nJe6FAJjpt8Hd6rn9zT0WL2Al7WL5RTXcnLb2V+/1yqc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyJ2GBUR5k6yPI/XjSucGGLbK4ZGrAsx4HuLeSQK5e95j33Eb26
 STKwWaUbzIJtkyrs543/NWytExm8Cczu/ja9JtsHhTVGwj/21V4g2fCn7B2H8BmTIQZlKxQKWNE
 2y2/gii8XaaNwklkBtgqkDeCuy4q1C37vKpK59imp0OrQBlZkiyLXb+rsVfHOygqXOCY=
X-Gm-Gg: ASbGncv+sTZghlkRLxpQ/RbNilSW1Hjc7hLP4XrYnlGh19s/ZU28WN9hdWJcUlt8Tv0
 8OLiqkE7OEYUAw5jdMHo54wZLm8EnAkf7/H31SmU4zyIs10IMp7eX5MYn5SxjiH2STJzkEeg9e/
 1WbfUJ1ExU7jQs+l6P+BWyrC0nohODC3rZKa2LF2ClBj+nCnoAGe23xPEi2fbD/SHSMKsCE+8oA
 e7SdefAWd14BPp996E2vzRi/aBl8/ECfkmL4uPOIPQxgCq5EELHd5OoKPiYtxbegfzCXUMZAnwy
 iOeMcRQ8c/ta0cNJGTW0YUtDdP55GWFXV0sg/8sEQNOMHQQEZirrDtft4OCmK5LrSuzB+SLf9t/
 3DTo5xLy7DYwBz8tp8AJMTfLZ
X-Received: by 2002:a05:620a:410c:b0:7c5:3b8d:9f2f with SMTP id
 af79cd13be357-7c9585e4f8amr1389050385a.17.1745643085033; 
 Fri, 25 Apr 2025 21:51:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGS+5iXVyeLi/uuarwcn2rcygT2YD15yqXIwjFvPYHzO1HEziTA19ChjNR3JwyIgBNCUB61LQ==
X-Received: by 2002:a05:620a:410c:b0:7c5:3b8d:9f2f with SMTP id
 af79cd13be357-7c9585e4f8amr1389048785a.17.1745643084603; 
 Fri, 25 Apr 2025 21:51:24 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-317cf659c1dsm10670491fa.1.2025.04.25.21.51.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Apr 2025 21:51:23 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 26 Apr 2025 07:51:17 +0300
Subject: [PATCH v7] drm/msm/dpu: allow sharing SSPP between planes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250426-dpu-share-sspp-v7-1-6f4c719e373c@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAERmDGgC/3XMQQrCMBCF4auUrI00aWbauPIe4iI00zYgTUg0K
 KV3Ny24EHH5Hnz/whJFR4mdqoVFyi45P5fRHirWT2YeiTtbNpO1VEIK4DY8eJpMJJ5SCLwFA4h
 EveiAFRQiDe65By/XsieX7j6+9n6G7f2bysAFRwQrEUXXDPp8c7OJ/ujjyLZWxo+HWsr2x2Pxy
 irUWtRDo7/9uq5vBiLsz+0AAAA=
X-Change-ID: 20241215-dpu-share-sspp-75a566eec185
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10784;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=cvM+rFSttFrCnA5Dtpe9rwoSgqfSbbDaMnA+P4ETru4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoDGZLeUbhv5769s7b6SZbhNjOUa5WNq7iG+Fqy
 3roFPEfSi+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAxmSwAKCRCLPIo+Aiko
 1ZzqB/4ww/TtJNnE8uEyKaYbzOMHOKh372Uw3w4Ods/he1s+dAgfMGYEIFhSHRrwn+g/8K8UyLB
 FLPyhoZqsDZyLxm8nqAxSmCMYfN57KV0WShuHHJ+kki04wZX22O1FbXt9MxO4buu2pOSOY1BIlH
 JlQkVmYKFBMHcmz506WPoaExhQCb24/c4LYlhc3PC+OeZm/CY+0S5ppozcOfIvf1papq1FK2BaV
 7B2XWhoQNMKDQkSUSm2qgI7WWiUXBB6A0qyocPbx7PTEHl84ukZx0ENVUiQiItsvKpScQf4/iph
 lzXTSuMS9M6qSBoT1+M0mRbzJZ37DznJ0gnXusq/itNbkUs7
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI2MDAzMCBTYWx0ZWRfX8kzcbycMcSks
 rWvHg8OYAIl+0n90Ygc0sOl+kZjVVtGMMILEgnk0tbdYo2Ck00LIWdKxgOiITib6bY4Yx6uj2re
 jWN53s8hDNAOEzwnb0Q1xJjuEg0g//WopTL3VApgttrZDnphKIzxXEQEMITS6OHwoGoZsOiBgOu
 mM4wpcHYiNOoGfqVXu54ToDTJDmRSgRY6mXwju601QfDHZz0vEYQqqtUjPQtZuTlmDfk+gjYFGc
 g2K+nKo7eioE+Uk/9D7eHAZaPxA7AHxjUTl1CfVyL2uBkrfwHaPOFnrM570goEMJsPvJhP4aMa0
 Fe1jLE/laLr3D8mWjSKzehImuZM736iSkizZXTC8XFfqF712WG0oAC2bsvKBsa1L68qBMW6lsLv
 oFQg/o92fFyDkUdYpEZX1p6xvXRs26OIOqM0sj6LCKOKopqd9ya9/dvLGaE+vUXUAyxCn05x
X-Proofpoint-GUID: eC54GTMOzUBwNo2UgSY5jquOZSbciMV6
X-Proofpoint-ORIG-GUID: eC54GTMOzUBwNo2UgSY5jquOZSbciMV6
X-Authority-Analysis: v=2.4 cv=I8ZlRMgg c=1 sm=1 tr=0 ts=680c664e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=8xA1kSRHgp9pt_5ip2oA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-26_01,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 impostorscore=0 mlxscore=0 adultscore=0 spamscore=0
 mlxlogscore=999 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504260030
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

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Since SmartDMA planes provide two rectangles, it is possible to use them
to drive two different DRM planes, first plane getting the rect_0,
another one using rect_1 of the same SSPP. The sharing algorithm is
pretty simple, it requires that each of the planes can be driven by the
single rectangle and only consecutive planes are considered.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
This patch has been deferred from v4 of virtual wide patchset to
simplify the merging path. Now as the wide planes have been merged, pick
up the patch that allows sharing of the SSPPs between two planes.
---
Changes in v7:
- Fixed typo (adjancent -> adjacent) (Abhinav)
- Link to v6: https://lore.kernel.org/r/20250227-dpu-share-sspp-v6-1-4d469910f399@linaro.org

Changes in v6:
- Fixed typo (consecutive) in the commit message (Abhinav)
- Renamed prev_plane_state to prev_adjancent_plane_state (Abhinav)
- Renamed prev_pstate to prev_adjancent_pstate as a followup to the
  previous change
- Link to v5: https://lore.kernel.org/r/20241215-dpu-share-sspp-v5-1-665d266183f9@linaro.org

Changes in v5:
- Rebased on top of the current msm-next-lumag
- Renamed dpu_plane_try_multirect() to dpu_plane_try_multirect_shared()
  (Abhinav)
- Link to v4: https://lore.kernel.org/dri-devel/20240314000216.392549-11-dmitry.baryshkov@linaro.org/
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 156 +++++++++++++++++++++++++-----
 1 file changed, 130 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index e03d6091f73640af96604a46740d58ae1f1fced1..421138bc3cb779c45fcfd5319056f0d31c862452 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -915,10 +915,9 @@ static int dpu_plane_atomic_check_nosspp(struct drm_plane *plane,
 	return 0;
 }
 
-static int dpu_plane_is_multirect_parallel_capable(struct dpu_hw_sspp *sspp,
-						   struct dpu_sw_pipe_cfg *pipe_cfg,
-						   const struct msm_format *fmt,
-						   uint32_t max_linewidth)
+static int dpu_plane_is_multirect_capable(struct dpu_hw_sspp *sspp,
+					  struct dpu_sw_pipe_cfg *pipe_cfg,
+					  const struct msm_format *fmt)
 {
 	if (drm_rect_width(&pipe_cfg->src_rect) != drm_rect_width(&pipe_cfg->dst_rect) ||
 	    drm_rect_height(&pipe_cfg->src_rect) != drm_rect_height(&pipe_cfg->dst_rect))
@@ -930,10 +929,6 @@ static int dpu_plane_is_multirect_parallel_capable(struct dpu_hw_sspp *sspp,
 	if (MSM_FORMAT_IS_YUV(fmt))
 		return false;
 
-	if (MSM_FORMAT_IS_UBWC(fmt) &&
-	    drm_rect_width(&pipe_cfg->src_rect) > max_linewidth / 2)
-		return false;
-
 	if (!test_bit(DPU_SSPP_SMART_DMA_V1, &sspp->cap->features) &&
 	    !test_bit(DPU_SSPP_SMART_DMA_V2, &sspp->cap->features))
 		return false;
@@ -941,6 +936,27 @@ static int dpu_plane_is_multirect_parallel_capable(struct dpu_hw_sspp *sspp,
 	return true;
 }
 
+static int dpu_plane_is_parallel_capable(struct dpu_sw_pipe_cfg *pipe_cfg,
+					 const struct msm_format *fmt,
+					 uint32_t max_linewidth)
+{
+	if (MSM_FORMAT_IS_UBWC(fmt) &&
+	    drm_rect_width(&pipe_cfg->src_rect) > max_linewidth / 2)
+		return false;
+
+	return true;
+}
+
+static int dpu_plane_is_multirect_parallel_capable(struct dpu_hw_sspp *sspp,
+						   struct dpu_sw_pipe_cfg *pipe_cfg,
+						   const struct msm_format *fmt,
+						   uint32_t max_linewidth)
+{
+	return dpu_plane_is_multirect_capable(sspp, pipe_cfg, fmt) &&
+		dpu_plane_is_parallel_capable(pipe_cfg, fmt, max_linewidth);
+}
+
+
 static int dpu_plane_atomic_check_sspp(struct drm_plane *plane,
 				       struct drm_atomic_state *state,
 				       const struct drm_crtc_state *crtc_state)
@@ -1002,6 +1018,69 @@ static bool dpu_plane_try_multirect_parallel(struct dpu_sw_pipe *pipe, struct dp
 	return true;
 }
 
+static int dpu_plane_try_multirect_shared(struct dpu_plane_state *pstate,
+					  struct dpu_plane_state *prev_adjacent_pstate,
+					  const struct msm_format *fmt,
+					  uint32_t max_linewidth)
+{
+	struct dpu_sw_pipe *pipe = &pstate->pipe;
+	struct dpu_sw_pipe *r_pipe = &pstate->r_pipe;
+	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
+	struct dpu_sw_pipe *prev_pipe = &prev_adjacent_pstate->pipe;
+	struct dpu_sw_pipe_cfg *prev_pipe_cfg = &prev_adjacent_pstate->pipe_cfg;
+	const struct msm_format *prev_fmt = msm_framebuffer_format(prev_adjacent_pstate->base.fb);
+	u16 max_tile_height = 1;
+
+	if (prev_adjacent_pstate->r_pipe.sspp != NULL ||
+	    prev_pipe->multirect_mode != DPU_SSPP_MULTIRECT_NONE)
+		return false;
+
+	if (!dpu_plane_is_multirect_capable(pipe->sspp, pipe_cfg, fmt) ||
+	    !dpu_plane_is_multirect_capable(prev_pipe->sspp, prev_pipe_cfg, prev_fmt))
+		return false;
+
+	if (MSM_FORMAT_IS_UBWC(fmt))
+		max_tile_height = max(max_tile_height, fmt->tile_height);
+
+	if (MSM_FORMAT_IS_UBWC(prev_fmt))
+		max_tile_height = max(max_tile_height, prev_fmt->tile_height);
+
+	r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
+	r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+
+	r_pipe->sspp = NULL;
+
+	if (dpu_plane_is_parallel_capable(pipe_cfg, fmt, max_linewidth) &&
+	    dpu_plane_is_parallel_capable(prev_pipe_cfg, prev_fmt, max_linewidth) &&
+	    (pipe_cfg->dst_rect.x1 >= prev_pipe_cfg->dst_rect.x2 ||
+	     prev_pipe_cfg->dst_rect.x1 >= pipe_cfg->dst_rect.x2)) {
+		pipe->sspp = prev_pipe->sspp;
+
+		pipe->multirect_index = DPU_SSPP_RECT_1;
+		pipe->multirect_mode = DPU_SSPP_MULTIRECT_PARALLEL;
+
+		prev_pipe->multirect_index = DPU_SSPP_RECT_0;
+		prev_pipe->multirect_mode = DPU_SSPP_MULTIRECT_PARALLEL;
+
+		return true;
+	}
+
+	if (pipe_cfg->dst_rect.y1 >= prev_pipe_cfg->dst_rect.y2 + 2 * max_tile_height ||
+	    prev_pipe_cfg->dst_rect.y1 >= pipe_cfg->dst_rect.y2 + 2 * max_tile_height) {
+		pipe->sspp = prev_pipe->sspp;
+
+		pipe->multirect_index = DPU_SSPP_RECT_1;
+		pipe->multirect_mode = DPU_SSPP_MULTIRECT_TIME_MX;
+
+		prev_pipe->multirect_index = DPU_SSPP_RECT_0;
+		prev_pipe->multirect_mode = DPU_SSPP_MULTIRECT_TIME_MX;
+
+		return true;
+	}
+
+	return false;
+}
+
 static int dpu_plane_atomic_check(struct drm_plane *plane,
 				  struct drm_atomic_state *state)
 {
@@ -1102,13 +1181,14 @@ static int dpu_plane_virtual_atomic_check(struct drm_plane *plane,
 static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 					      struct dpu_global_state *global_state,
 					      struct drm_atomic_state *state,
-					      struct drm_plane_state *plane_state)
+					      struct drm_plane_state *plane_state,
+					      struct drm_plane_state *prev_adjacent_plane_state)
 {
 	const struct drm_crtc_state *crtc_state = NULL;
 	struct drm_plane *plane = plane_state->plane;
 	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
 	struct dpu_rm_sspp_requirements reqs;
-	struct dpu_plane_state *pstate;
+	struct dpu_plane_state *pstate, *prev_adjacent_pstate;
 	struct dpu_sw_pipe *pipe;
 	struct dpu_sw_pipe *r_pipe;
 	struct dpu_sw_pipe_cfg *pipe_cfg;
@@ -1120,6 +1200,8 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 							   plane_state->crtc);
 
 	pstate = to_dpu_plane_state(plane_state);
+	prev_adjacent_pstate = prev_adjacent_plane_state ?
+		to_dpu_plane_state(prev_adjacent_plane_state) : NULL;
 	pipe = &pstate->pipe;
 	r_pipe = &pstate->r_pipe;
 	pipe_cfg = &pstate->pipe_cfg;
@@ -1138,24 +1220,42 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 
 	reqs.rot90 = drm_rotation_90_or_270(plane_state->rotation);
 
-	pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
-	if (!pipe->sspp)
-		return -ENODEV;
+	if (drm_rect_width(&r_pipe_cfg->src_rect) == 0) {
+		if (!prev_adjacent_pstate ||
+		    !dpu_plane_try_multirect_shared(pstate, prev_adjacent_pstate, fmt,
+						    dpu_kms->catalog->caps->max_linewidth)) {
+			pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
+			if (!pipe->sspp)
+				return -ENODEV;
 
-	if (!dpu_plane_try_multirect_parallel(pipe, pipe_cfg, r_pipe, r_pipe_cfg,
-					      pipe->sspp,
-					      msm_framebuffer_format(plane_state->fb),
-					      dpu_kms->catalog->caps->max_linewidth)) {
-		/* multirect is not possible, use two SSPP blocks */
-		r_pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
-		if (!r_pipe->sspp)
+			r_pipe->sspp = NULL;
+
+			pipe->multirect_index = DPU_SSPP_RECT_SOLO;
+			pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+
+			r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
+			r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+		}
+	} else {
+		pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
+		if (!pipe->sspp)
 			return -ENODEV;
 
-		pipe->multirect_index = DPU_SSPP_RECT_SOLO;
-		pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+		if (!dpu_plane_try_multirect_parallel(pipe, pipe_cfg, r_pipe, r_pipe_cfg,
+						      pipe->sspp,
+						      msm_framebuffer_format(plane_state->fb),
+						      dpu_kms->catalog->caps->max_linewidth)) {
+			/* multirect is not possible, use two SSPP blocks */
+			r_pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
+			if (!r_pipe->sspp)
+				return -ENODEV;
 
-		r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
-		r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+			pipe->multirect_index = DPU_SSPP_RECT_SOLO;
+			pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+
+			r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
+			r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+		}
 	}
 
 	return dpu_plane_atomic_check_sspp(plane, state, crtc_state);
@@ -1168,6 +1268,7 @@ int dpu_assign_plane_resources(struct dpu_global_state *global_state,
 			       unsigned int num_planes)
 {
 	unsigned int i;
+	struct drm_plane_state *prev_adjacent_plane_state = NULL;
 
 	for (i = 0; i < num_planes; i++) {
 		struct drm_plane_state *plane_state = states[i];
@@ -1177,9 +1278,12 @@ int dpu_assign_plane_resources(struct dpu_global_state *global_state,
 			continue;
 
 		int ret = dpu_plane_virtual_assign_resources(crtc, global_state,
-							 state, plane_state);
+							     state, plane_state,
+							     prev_adjacent_plane_state);
 		if (ret)
-			return ret;
+			break;
+
+		prev_adjacent_plane_state = plane_state;
 	}
 
 	return 0;

---
base-commit: 6c0be3e511b9191b90bc73af10f93f0f62b8cbe8
change-id: 20241215-dpu-share-sspp-75a566eec185

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

