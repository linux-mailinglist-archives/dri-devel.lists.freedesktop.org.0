Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4618BD284BF
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 21:05:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2781010E7C5;
	Thu, 15 Jan 2026 20:05:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="NBbcOpvn";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h3dxbwyd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3F7410E284
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 20:05:48 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60FFYGNN2866206
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 20:05:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 mEUYQxV96PnR8jNNyLBEH4rtFWeaUZ6wJwqJC8OGj6Q=; b=NBbcOpvnUfE/+xRo
 /JctWD51ZYlKt+wisjifw7TeAA99aUyoW/4r2kfNw9AnoeZDPuVaN1zG14to5qiY
 lq9JHTNbPr08dg/h8ZjxbJHueGmcHDtQqBIFX4rfDY/uVoZ7hugIi4rGFmIa1eOd
 /KGZ66OpNiQ/lUsVCOXwJx+FzutTMoBv1kvPUXfm6CdZnefJskkcai7u90G55Oq3
 HMzy3KnCl6yV/5jk6oGs1PRtwsd9Q3cANGrUhkfBdSs3lcE+btvvcj9P1T8I3UsA
 KZp/TTpVNbzLDQMDlnWzvv/5c+cGGWiN+YYOrHW5RiXidUiaEzHLIfS9MLWvtUGa
 fophKw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bptu2japu-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 20:05:47 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8c1cffa1f2dso624972185a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 12:05:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768507547; x=1769112347;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=mEUYQxV96PnR8jNNyLBEH4rtFWeaUZ6wJwqJC8OGj6Q=;
 b=h3dxbwydapBeo0Mblbpn3cb/hBkwYLl/d4N4BzaahyyrQHX9iCC+kpYXsToyRW3xDr
 PZp+n7xoMH76JU11UUeL9Spm1Yae62puDDThbKV1QhrgnyrXGJmUbyG9EJdNmz6DyqGH
 54bWDLNxepjsw8ZdhW19++r+gAuKAKkdHPCe907wRrKT8iGygW8MvSg2aiytB4IETC/P
 KdpXDyvjZoJyDm+B1ycpZqQcq05Zp3wF+Cwp+6Xr2Qt3B7mwioYjGLu3nAmHAn50BLqh
 9h/HMWi/1+GxIak3e8U6Wq5sYXkeowzbJuEotNHGJJIH9ku7UzROpLSUpqt1nICsn3iB
 lGDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768507547; x=1769112347;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=mEUYQxV96PnR8jNNyLBEH4rtFWeaUZ6wJwqJC8OGj6Q=;
 b=GdnECJ1KKgo1GAw0NdlF0rQ9Xf/cq7rRx0PYSp3777Tx65n8zF4hSi+8ajFAXgBcU2
 7eL5lyxj0m5UC3bA6wHE2fhnPooAczrTX+vMezddA3jYE9x4TFQRQG/mv0ofU4ZosRhl
 gZbgwllxhLOJYodkzZnwpCAON+vEDiXVqap2gjgTuNVI20zy7kGkbhbehybdK19Lk2ED
 M5A4cR48mNoCdv4fJyvRHZNrn+R9F7/CMRBBVjlgj3q1pPtxJJqLdXJfs5fx8JH6kcJ1
 jThx2vLTyoV+T/AzreFHDB9QaoK+Do5FLstMFf6lky+80+STa65976aZ1Z3rUFLiMQQ6
 VaIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWeEEV7kd2ExrEu8Fuwjn5gP/pywOGv4XYPK+aIjp428USSVe+CzkrcW9v+qvOUzVdzboRzcGkcqrk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxKjiAQPXugnvdMdX9ohOV2PxVsdzB5+Ho722K7Woyk1HCaWPYt
 Bt8NAYII4T2fvXEaeaDi06TWkQV5kwXzb51wueCoDHn1h1NHrvlrC20nNePMaO0PKYytndDqspD
 fAPBlzX2RlyZxKe+r4nSnJ3d/nQufHN5tjQ3Hj4VopRC9pOE5ic9ZOc4zyqLLmGK7Br/9hxw=
X-Gm-Gg: AY/fxX7mKz5JJwiZ2hwv2Ou3vfmi/xuhlPpUxGakAybJmhzVvC7Ie9q0k8jbHVsQMTT
 Ay2JbEW9wjM4zdjZPyotCKQu8Gq7YOWMPVH5vzPU/zkvPJbF0nH3cfQ0wGcL4QRGF4LYzfn3t5o
 h+MYN3Lryjp4nY9CZlQfl3quJ2F0g35S4hbk7dJzGi9VPZwoYQKoBStg3dxnvN4vLPrmRE8m4d1
 KM2PTPq4h7Iq7xhoRHGUR6R8GdviC4nOVa6wRPwkl1tdVkJNnF+q7IN4NBvQN0Uh5IzSFyViBvV
 1nypqF58U4offisbDA/KUdCTPe8f8Z6pV1TNP2wTr3cLy4xU/a8d6QEQ3AKcOmfPm0ELXcjxeiu
 irqRLOFI2IKXfQ4FE+MpkAJgXvdswqWcqcvNV7tn1SrQbXjYgsnwHV5CL9wKkbWP1jtQBnKeoRt
 zdcWHOP4G3CVJXDVh4GhHk7ew=
X-Received: by 2002:a05:620a:44d3:b0:8ac:70cd:8727 with SMTP id
 af79cd13be357-8c589b97336mr642832685a.11.1768507547125; 
 Thu, 15 Jan 2026 12:05:47 -0800 (PST)
X-Received: by 2002:a05:620a:44d3:b0:8ac:70cd:8727 with SMTP id
 af79cd13be357-8c589b97336mr642825485a.11.1768507546536; 
 Thu, 15 Jan 2026 12:05:46 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-38384e790casm1381901fa.29.2026.01.15.12.05.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jan 2026 12:05:44 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 15 Jan 2026 22:05:39 +0200
Subject: [PATCH 2/2] drm/msm/dpu: try reserving the DSPP-less LM first
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260115-dpu-fix-dspp-v1-2-b73152c147b3@oss.qualcomm.com>
References: <20260115-dpu-fix-dspp-v1-0-b73152c147b3@oss.qualcomm.com>
In-Reply-To: <20260115-dpu-fix-dspp-v1-0-b73152c147b3@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3109;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=F6xYL/L+rt7LV4dkOFjr+7V2E+S4X2JsuEZcSii4Ri8=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ2amx6T0XMXHt5W2C0ulpAcnvv4znSnHVbeJgbHqxbKkq
 UfFtcI6GY1ZGBi5GGTFFFl8ClqmxmxKDvuwY2o9zCBWJpApDFycAjAR/Vj2f6r9LJ76Ajmz18wy
 ez7hZ3H681ct9uXzGdeEvnt4RPXzxPq5T103lH/OeP3+T862zR7q3Clij2ezLn90a1dQSc+xOTH
 7J65wm3vzNQ+b6cpod4kQn3CRuXflz72+GfXvU/byspY/5QJaMul7ai+f8lGK+M74NT9zyfefEx
 yYAvIEJtusLpHUemdR0C6bXR8UNudc4vRFftErWR9U6L1YvDW38mB8VdnW9FvcfwxliypbF4nbh
 Jvr5+7duO2t+ZLqEJ+japNMIovKche9n2Rh5TInjsVHUFL2wNuEJwanusQLkqsUWd0SxBn2RzR2
 s5maHD7qIHc3V9T213Vr92ye7o5zR1geaGy+s6PbIXQSAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDE1NyBTYWx0ZWRfX8Gcap62RIxVB
 X+A9/lip1Nm6jZ5ZDcn2brBXjyG+6N/6cPdcsoldoN4QcTnJZIYwMusAgbDt2uuBVFwKak88qlG
 MqV++R6m+EIvp78b8UdnZa2b2Rv2EXlEnbOkgU72d7fUR4J44VnO7myzocVJF3/sEQo/tjMreL0
 zZVBrFJWDflFSN5OsLNWI6Hdt8n+/YdrxEpmDkeoGbpEeQ92xI7o3MpI+DNQSU6dsfwRaNYbqWy
 RZjIDyVoFBQe95LKiM3Itkimb3UZFnjX28ksUIuHn4RlSSyFcNHo05uvKUBW1YCHKHqkmoJEP/s
 qO/x4Jpofqw8CSwlzUj1kR+IxuNizIAqNNytLzEQ/YAKWvqViv2TE8IBbuBfoQzkqUSy9onmoR7
 xI94ypgGImzarMd1HvWM4amd06fwg1VXJ342Ypel4OXBMzz0dYrwCEqkqHJ+mS35LbriHn3IfXN
 +mx78e9UKZ/L0jAjQtw==
X-Proofpoint-ORIG-GUID: xlr30N2RovVmQ3MKU4k3eWJR_XJeCSMb
X-Authority-Analysis: v=2.4 cv=W6Y1lBWk c=1 sm=1 tr=0 ts=6969489b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=8oFmcx1cRZW0fiqr4cUA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: xlr30N2RovVmQ3MKU4k3eWJR_XJeCSMb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_06,2026-01-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601150157
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

On most of the platforms only some mixers have connected DSPP blocks.
If DSPP is not required for the CRTC, try looking for the LM with no
DSSP block, leaving DSPP-enabled LMs to CRTCs which actually require
those.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 52 +++++++++++++++++++++++++---------
 1 file changed, 38 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index 7e77d88f8959..451a4fcf3e65 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -350,28 +350,26 @@ static bool _dpu_rm_check_lm_and_get_connected_blks(struct dpu_rm *rm,
 	return true;
 }
 
-static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
-			       struct dpu_global_state *global_state,
-			       uint32_t crtc_id,
-			       struct msm_display_topology *topology)
+static bool dpu_rm_find_lms(struct dpu_rm *rm,
+			    struct dpu_global_state *global_state,
+			    uint32_t crtc_id, bool skip_dspp,
+			    struct msm_display_topology *topology,
+			    int *lm_idx, int *pp_idx, int *dspp_idx)
 
 {
-	int lm_idx[MAX_BLOCKS];
-	int pp_idx[MAX_BLOCKS];
-	int dspp_idx[MAX_BLOCKS] = {0};
 	int i, lm_count = 0;
 
-	if (!topology->num_lm) {
-		DPU_ERROR("zero LMs in topology\n");
-		return -EINVAL;
-	}
-
 	/* Find a primary mixer */
 	for (i = 0; i < ARRAY_SIZE(rm->mixer_blks) &&
 			lm_count < topology->num_lm; i++) {
 		if (!rm->mixer_blks[i])
 			continue;
 
+		if (skip_dspp && to_dpu_hw_mixer(rm->mixer_blks[i])->cap->dspp) {
+			DPU_DEBUG("Skipping LM_%d, skipping LMs with DSPPs\n", i);
+			continue;
+		}
+
 		/*
 		 * Reset lm_count to an even index. This will drop the previous
 		 * primary mixer if failed to find its peer.
@@ -410,12 +408,38 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
 		}
 	}
 
-	if (lm_count != topology->num_lm) {
+	return lm_count == topology->num_lm;
+}
+
+static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
+			       struct dpu_global_state *global_state,
+			       uint32_t crtc_id,
+			       struct msm_display_topology *topology)
+
+{
+	int lm_idx[MAX_BLOCKS];
+	int pp_idx[MAX_BLOCKS];
+	int dspp_idx[MAX_BLOCKS] = {0};
+	int i;
+	bool found;
+
+	if (!topology->num_lm) {
+		DPU_ERROR("zero LMs in topology\n");
+		return -EINVAL;
+	}
+
+	/* Try using non-DSPP LM blocks first */
+	found = dpu_rm_find_lms(rm, global_state, crtc_id, !topology->num_dspp,
+				topology, lm_idx, pp_idx, dspp_idx);
+	if (!found && !topology->num_dspp)
+		found = dpu_rm_find_lms(rm, global_state, crtc_id, false,
+					topology, lm_idx, pp_idx, dspp_idx);
+	if (!found) {
 		DPU_DEBUG("unable to find appropriate mixers\n");
 		return -ENAVAIL;
 	}
 
-	for (i = 0; i < lm_count; i++) {
+	for (i = 0; i < topology->num_lm; i++) {
 		global_state->mixer_to_crtc_id[lm_idx[i]] = crtc_id;
 		global_state->pingpong_to_crtc_id[pp_idx[i]] = crtc_id;
 		global_state->dspp_to_crtc_id[dspp_idx[i]] =

-- 
2.47.3

