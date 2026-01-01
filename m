Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F6C8CECCFA
	for <lists+dri-devel@lfdr.de>; Thu, 01 Jan 2026 06:04:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4067910E75B;
	Thu,  1 Jan 2026 05:04:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bd2f7ubz";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="POwEC3vr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1602010E6F0
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Jan 2026 05:04:55 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6011P1mu917692
 for <dri-devel@lists.freedesktop.org>; Thu, 1 Jan 2026 05:04:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=07+KOjrq6jz1M5PJIyukzP
 CzKsJ5MLq+baFE6H1I/tQ=; b=Bd2f7ubzjj28qGwwkcbdgVh7N//DdtsButYPFo
 MVdLpjIHgUx7HFCfmUugMoyM/Le8yTpgMnataVqggnwUs2R5ovvMNd46s6X4tWxW
 ttpPo6UX2YVDUJIlfnL82OMBeLilfv9KCuO2vfqRgepSW1MO8OJ6fdt5Xid/Xlkz
 BRNm+jiQ//tAS+rDcDJl/Y6OHLOZnH52iIKI0Wc4hOfg9r+yNSj2cnpjRAo3ys4G
 8puld1KKUVjDqoWHxZ9dnjPzmiyOG1I9fn1DpR2HFeqPQg1y5SowChV60CgPv+Cg
 Q1y+lytKKxNUbqBFqJBbqycBPn0W/ja8bhvDD/YdcV+LDJeg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bd2bb1d8s-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Jan 2026 05:04:54 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-7b8a12f0cb4so12670931b3a.3
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Dec 2025 21:04:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767243893; x=1767848693;
 darn=lists.freedesktop.org; 
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=07+KOjrq6jz1M5PJIyukzPCzKsJ5MLq+baFE6H1I/tQ=;
 b=POwEC3vr442r6a5ajd0okMRoJipT5BGq7bQA+Q/CE55CCDhFjhOGd2O0LdCQF7sYh9
 dliMKRXDdXcsfwXSD9N6bdDo0YRX4Om6G1LHX2RUSnpMYJ3m007Pbdb/AMUl6hhu5H0O
 O+tz63lSd8P8ZWhR/zQ8JbC7NNqkvov8Snd/sI9ZgIJewsEuO3aiSWqkpzson5gefEoZ
 NLP0RT7j3P0GKpBefdE7e/+VQsG3XwxFgK+e/WqerAncxeP9bIrvXnrKKajNLwWQOK2A
 vsiDBRqCLNQpAfhOxSBB1Aid+NkQZqX1flXuY6fm1W/GsmsZPvnkKv6mDmC45TYUkqti
 ZlPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767243893; x=1767848693;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=07+KOjrq6jz1M5PJIyukzPCzKsJ5MLq+baFE6H1I/tQ=;
 b=AW33o0IQlgRNCy2SiqkEa+7SgMHcaYm+Kh/7VCOs9Js3IttZb9/v1ECJKbax5M+Ita
 K0H0tRe62RNcS+MsPxuLggLA88QfsHZOcwBB/cNHJlKH/oqXlonDW88C7xaPPHDqz4W1
 /3HpzXQZP9jsGy52guHYNWomgAIC3sooTjrv4N5+Ssvx7HJNgbPgj+yz11zNNFI6tsyT
 qQXwceQHWgesq/gnoLBqtp1vIF+/+iN2nBvHQBHoxTM/kqO+PSAQXd4YePNA9xXssFfh
 jRcIEFPySWzSj23knMp35mILmQklWKFiaYxECLnwwnHjMzDJHNtiuitxgt2deY+ZVsBB
 PGTQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUiamd3wjNuI69C+r6DiqQbtjihp5D5+ZPaaPhuIAYOcb26pxuhFhwAItFpW7jBppS2J4Fz7va61X0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx2WJ8Rc9SyBpMYpfICKMW1cPRSKws4PhcvxUoprLsLbY4MHn3T
 bya7oMm2bQlzuUoSuKa1zfP16Sj7wx/4j0QIywPMS1IKseoPgatvoESdQmvdq5CLdD7esZx8JAS
 K/mQdLG5DqjT7M9z5hq/NSXmxZ3OGXGO5wOedSDBO7cLKf5CEJl7+7/ehXAsoZ7VGq+xsnAk=
X-Gm-Gg: AY/fxX4k/HMRkCfq/n2la1OsWXjN61ZfifFGnRmRB90DPjebmzx4YP9r6VR40qtSrWL
 Opg91EJxfJi3H2lwVlKkiejSnwJw5dw7N5SvPB+kI/p9BR0N6rA3Lg2j6ActYTwsWWy6PggnbC+
 ywMHGTaHSrOR019XaW4lyz+FZI4kyj41CnFL4I+U9y50pCnoFXuLDtiCHA5Pj/keMeaa/t/bJWZ
 R3S8jnRpi5nTtURrGaMJwM90lBvaB8ZoCUxsE6O3vvJ/xkvUkj84DMxgRFuqEnTx9Fq3Bmaro4T
 pUMr12vlffZT09R3zhF7FIaKdaNeoUxVYYq9ZNA6TPEQBrhwmDfHFjjonVzFgsu0C8LlUXil7GD
 piSFQGhC15esbojJjk4FurgrRea4O7VZajoyU
X-Received: by 2002:a05:6a00:1d98:b0:7aa:8397:7754 with SMTP id
 d2e1a72fcca58-7ff64ed1413mr31668847b3a.2.1767243892976; 
 Wed, 31 Dec 2025 21:04:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHd5bbetNMmPFCI2o+xooK+bp2gy/VQ6yWacZiMYQSjS52Fb5kSaL215a+Cf++Nt/UijyQRMg==
X-Received: by 2002:a05:6a00:1d98:b0:7aa:8397:7754 with SMTP id
 d2e1a72fcca58-7ff64ed1413mr31668826b3a.2.1767243892499; 
 Wed, 31 Dec 2025 21:04:52 -0800 (PST)
Received: from hu-mahap-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7ff7e0a0595sm36404922b3a.44.2025.12.31.21.04.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Dec 2025 21:04:52 -0800 (PST)
From: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Date: Thu, 01 Jan 2026 10:34:38 +0530
Subject: [PATCH v2] drm/msm/disp/dpu: add merge3d support for sc7280
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260101-4k-v2-1-712ae3c1f816@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAGUAVmkC/0XMzQrCMBAE4FcpObulu0l/4sn3EA8x2bZB02iiR
 Sh9d4MXLwMfzMwmMifPWRyrTSReffZxKaBDJexslonBu2JBDbVIEkHdQHf62kpHbJQVpfhIPPr
 P7+R8KR5TDPCaE5v/FElB4DSxdJBtT0MDKwJCrwenFSF21J1izvXzbe42hlCXEPv+BQ4IemmhA
 AAA
X-Change-ID: 20251231-4k-969b53d2ea4c
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Mahadevan P <mahadevan.p@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767243888; l=2753;
 i=mahadevan.p@oss.qualcomm.com; s=20250923; h=from:subject:message-id;
 bh=xqa4amP8z0/9O5shd3ZQo8nN7+fGD7ILoQmcbkQw+kY=;
 b=dL/Y8sUl8BHZxZ3ipn/80+emTBzda4tXdgTE4WQI5DmIWYKmgZQAYgVHSvbrvkkDVk7X/6vcx
 GuMPq2YMMKOCrsZodaxsgQ0hbvYsFd5WsrwKbx0N5ACTqJVOJqC1564
X-Developer-Key: i=mahadevan.p@oss.qualcomm.com; a=ed25519;
 pk=wed9wuAek0VbCYfkANx7ujIG4VY0XfCYrffFKPN2p0Y=
X-Proofpoint-GUID: iktTpCgbFSq4VhlFe5RZ-lgQ3CBoXkuu
X-Proofpoint-ORIG-GUID: iktTpCgbFSq4VhlFe5RZ-lgQ3CBoXkuu
X-Authority-Analysis: v=2.4 cv=dMKrWeZb c=1 sm=1 tr=0 ts=69560076 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=5FlqbPEWv7NCXEe-mtIA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAxMDA0NCBTYWx0ZWRfXwvsdHv01x1Yv
 TsnFOf9CrHFM+LhEvqhfxSyBQA2W9McDetqsblKjByUuWEN2yj05a+1owogbDSsD213y+KbEycq
 GYlgB6ckW2ajpQdP5W1eecBLB/OW23SVLVQUe/QGe1WfW/LuO/c7g7iAEUOwGbBZ5OsEyp8tpZ3
 NOkqCY0wUq/aKGiyfUJjr0ywJ2yb6APImbgPKUPFRLDunoc9+S7ij44/oEV2fLzldkRHchvEt4e
 SrQM77BnXfxo5uYDalaRiQD95jHgRf1dPzRCobuOk15YH9rKQTdJQbWtSgFWB0qhk3wryIITL1i
 YZftYFRR0c8ZVE6cIhyBpIdTaCizVLrGLJTyTQPIeXq3K5R4c2UP7AZueQ1ytB5cq2IEg/6USFx
 6MuGR/xA8rRRwOYI1w8vtK9fX831dZ79GIIuMS09yd2dRMmTPDQX1rJLCITR5+ohPkSPfi2OtyH
 uWfEMh1TnUm/zfD8agw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-01_02,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0
 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601010044
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

On SC7280 targets, display modes with a width greater than the
max_mixer_width (2400) are rejected during mode validation when
merge3d is disabled. This limitation exists because, without a
3D merge block, two layer mixers cannot be combined(non-DSC interface),
preventing large layers from being split across mixers. As a result,
higher resolution modes cannot be supported.

Enable merge3d support on SC7280 to allow combining streams from
two layer mixers into a single non-DSC interface. This capability
removes the width restriction and enables buffer sizes beyond the
2400-pixel limit.

Fixes: 591e34a091d1 ("drm/msm/disp/dpu1: add support for display for SC7280 target")
Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
---
Changes in v2:
  - Updated commit message for clarity (Dmitry).
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
index 8f978b9c3452..2f8688224f34 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
@@ -13,6 +13,7 @@ static const struct dpu_caps sc7280_dpu_caps = {
 	.has_dim_layer = true,
 	.has_idle_pc = true,
 	.max_linewidth = 2400,
+	.has_3d_merge = true,
 	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
 };
 
@@ -134,17 +135,24 @@ static const struct dpu_pingpong_cfg sc7280_pp[] = {
 		.name = "pingpong_2", .id = PINGPONG_2,
 		.base = 0x6b000, .len = 0,
 		.sblk = &sc7280_pp_sblk,
-		.merge_3d = 0,
+		.merge_3d = MERGE_3D_1,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
 	}, {
 		.name = "pingpong_3", .id = PINGPONG_3,
 		.base = 0x6c000, .len = 0,
 		.sblk = &sc7280_pp_sblk,
-		.merge_3d = 0,
+		.merge_3d = MERGE_3D_1,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
 	},
 };
 
+static const struct dpu_merge_3d_cfg sc7280_merge_3d[] = {
+	{
+		.name = "merge_3d_1", .id = MERGE_3D_1,
+		.base = 0x4f000, .len = 0x8,
+	},
+};
+
 /* NOTE: sc7280 only has one DSC hard slice encoder */
 static const struct dpu_dsc_cfg sc7280_dsc[] = {
 	{
@@ -247,6 +255,8 @@ const struct dpu_mdss_cfg dpu_sc7280_cfg = {
 	.mixer = sc7280_lm,
 	.pingpong_count = ARRAY_SIZE(sc7280_pp),
 	.pingpong = sc7280_pp,
+	.merge_3d_count = ARRAY_SIZE(sc7280_merge_3d),
+	.merge_3d = sc7280_merge_3d,
 	.dsc_count = ARRAY_SIZE(sc7280_dsc),
 	.dsc = sc7280_dsc,
 	.wb_count = ARRAY_SIZE(sc7280_wb),

---
base-commit: efb26a23ed5f5dc3554886ab398f559dcb1de96b
change-id: 20251231-4k-969b53d2ea4c

Best regards,
-- 
Mahadevan P <mahadevan.p@oss.qualcomm.com>

