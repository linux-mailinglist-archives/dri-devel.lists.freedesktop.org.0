Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80FACB44AD0
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 02:39:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3A0F10EAFF;
	Fri,  5 Sep 2025 00:38:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="UAlKFWoy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01EC910EB03
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Sep 2025 00:38:58 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 584J4lj6023892
 for <dri-devel@lists.freedesktop.org>; Fri, 5 Sep 2025 00:38:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 9brpOFp+/3/6vV4g7EI38M1O3ti6c1WPwrR8J+VQwpE=; b=UAlKFWoyVvB7CyPE
 Nlvg0Sg+fFeWVIeDfuo+4jbax5cJ7h8ZXtsS3+dHpihKgxWC93cU3ND5N663+4pI
 xdqefPyl9lJDAWc+uSxHWmBBhHMfYe0INp37Wt+QagDegVmYi/KkQeRwB04Ol3a/
 Yv0BIZy3oyEa+obXQ3SNSaQgqkN4kilIOcNjd75iZKUb+YTJT2JSBYSU3p2uW84o
 1dZnAct7+Mg8vV8UXXzgFTRJX1IplwEE1lbnK+pPfrOWnrCeWWz9M51MoQ2XTpJb
 iiDYbUSO12O066hWaa1Zap4o5GhR5AFpvXjbMkSXWhxCUiRR8VXnxjwu9faJG1MV
 kv1kHg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ut2fs4kd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Sep 2025 00:38:58 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-80382234104so280727285a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Sep 2025 17:38:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757032737; x=1757637537;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9brpOFp+/3/6vV4g7EI38M1O3ti6c1WPwrR8J+VQwpE=;
 b=wMfPs2wVXy+FghmLKEIWHXJUpqH5tN61DhIM6dQpscBhzrKc3ScU9BkFU7RXvbHZKi
 m/tJ5FLW7wVp0pP9FCL7JatO68loBzvhmHu61Nx6op6Qto8Dma1pbL3SfItEFRj8D+A7
 5GdL5TxMjsKXStquFvP9RBsOxpIdMw0wRi6oRjzodNx/LSWVB0kdusHmjFFTj7lA3Q3y
 QHB1wPc4sQgwLivmLcsv/h/R9TL8vfLVSQdCNsGk01yzqj/oDckcp90DAYR04Lwd0nfW
 y0ef/tBII/ilZo+jF9BLyEp/RKstowsjynsHU226/MEODjZIdAhwkTzrkupubbU35KhG
 UduQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXOtV+DJwHU5J2X5uUVQFQq+S/kcPjmDp8oRsA01jfKBg8+380iXmLm8bO7JsJxwxi22oP3q7cqczM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzH+PmA8CYz9nKyQs/N4XMkHdVV9KtzLxKJvmQmmsY8297BJUaH
 DA3iAE9N0EkgwmGVhAuZUsst8URRVnWf5588TIjU1Kcyi1G6abVg3yHHENBVH+QZEm5IarENy0g
 VZX2r9FjW7eq2PdxTvz+kY/2uCPnmVlHQeMT0NDmhEvjPQz4g3CyJCHNnen1R+/yUChYy62E=
X-Gm-Gg: ASbGncvDzcjRYjEO/sWWOZt8K3Rxunhn6qJekI5qk1i0IeTzLC0ZxjHP4svd3Y03EBv
 1Q2qImlA6lNcOE43js2B68h5fGHbvVUFTDfexgotSuJtDNbFSevK9m/ZYFm8UUue+IWJYBqqel0
 RmcgqRDuqEVlUk4YLtR7Imp1PL1D2a43m8V0CYJ+7B12MeZ8U6PkeLE5mn+/Hel7kpvDqNVtFmi
 +YDz88Wvgd4ae+AU/qYbNwZoXi2URrW0L/F65XVFxoUZUdD+BYYQcHHKUCX9afgsPk7knSj+NyZ
 ZN4sk0khckrImKZ/L7LbcH+1YfjRL+vuHRzlYamkVcSJTOkaQfH2j5uJBTNfujPwGJ2/XSvvqqa
 O8PkLRVxTpr+PPPV8+o9bUwz9SIzSvh8aKxnzMJ1lopaAAmLstIMc
X-Received: by 2002:a05:6214:2469:b0:72c:cc04:c3a4 with SMTP id
 6a1803df08f44-72ccc04c455mr9697136d6.8.1757032737094; 
 Thu, 04 Sep 2025 17:38:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGggptVB7yJzNpKmjyKL+r1E5aqNrdPD/lf2zm9l0aUlD3mzu8IDaTE/VSOjY55ioVtIEDZgQ==
X-Received: by 2002:a05:6214:2469:b0:72c:cc04:c3a4 with SMTP id
 6a1803df08f44-72ccc04c455mr9696816d6.8.1757032736562; 
 Thu, 04 Sep 2025 17:38:56 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5608acfd938sm1510059e87.109.2025.09.04.17.38.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Sep 2025 17:38:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 05 Sep 2025 03:38:36 +0300
Subject: [PATCH v2 07/12] drm/msm/disp: pull in common tiled YUV format
 parameters
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250905-dpu-formats-v2-7-7a674028c048@oss.qualcomm.com>
References: <20250905-dpu-formats-v2-0-7a674028c048@oss.qualcomm.com>
In-Reply-To: <20250905-dpu-formats-v2-0-7a674028c048@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jordan Crouse <jordan@cosmicpenguin.net>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3220;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=T764qGaUs1J9VFKtvepXHsiXpOOMX042xzB4mztK948=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoujEKmhozhM/+m0ojp5V0LfFbrvFkofA6W7eN2
 zog3jTw8leJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaLoxCgAKCRCLPIo+Aiko
 1WBWCACkbqlPExGRCdiT0UZihOTCLMIN0u56fVd4JKEr4W83H1+sgCf0pawMxOGZCTHPFT5hvxM
 FujC3WWVbcsz1hnM2oRWtPtya6sCIPWKRskqGvJDUsGEa9mW4SP23z9y2AXAk5CgHNcFH9lu7g0
 IeaSCENfkEevQlYsG+m++UAQF+YBbwAI9gEmh2lcqlJG6LFBrkZQz6wPG4Ew9gynLcX5Gl7iSGg
 fQVzC2kJNG94q4D0gQV3mwBX1eqbvgxkfiqY9Ww+ao6uTJBM1ZBucWHIsfj/Ad3oe0m9FbpDFYD
 YIQo8lZLTi8QTq24/iy09Ml0oFMwtxweD1VrgixjGOcT8icP
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzOCBTYWx0ZWRfX7c5dlZbsHBXZ
 mQbSB0/S4o2exF4sXbbnSaqYeqmhVe2Ycb+Y/GE+7qP/pADaliVlLoyNoC187DiW4YQKorl/BRl
 7U8DCGxJ86iStgujgDTj4PNQAcMaP3PKGeI6f+yPy20UsAqPfOP8syn4TDT2MX/MxcIZb19H4bo
 L/pTa7nAcv+tQkVyC61loE099RVRvfAaw9EDP2o8+efn6f8ICn+Qc98112jkXMQyuU5tY7v/4Yf
 WYg00A8rgZrAMfdCXV9QXy1QZ9vnKTDR88rTlCetJXI5zEByNQGnmzO38C2AZt+C7gZaPhhn3oF
 YNpPe3+zA09lLVcSQV8oAKcdi6ywRl6wu8RTCdkLeyZ1/+vICr0xWiZe//A5AB9ppyJHZRE+0k1
 8jIXw0Aa
X-Proofpoint-ORIG-GUID: e5BK7DnBjT3uYbcmdxG1ZJbOrLah56OY
X-Proofpoint-GUID: e5BK7DnBjT3uYbcmdxG1ZJbOrLah56OY
X-Authority-Analysis: v=2.4 cv=U7iSDfru c=1 sm=1 tr=0 ts=68ba3122 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=FCw1dLDEiFPyt24oSuoA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_08,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300038
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

Pull common params of tiled YUV formats into corresponding macro
definitions, simplifying format table.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/mdp_format.c | 27 ++++++++++++---------------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp_format.c b/drivers/gpu/drm/msm/disp/mdp_format.c
index 900b2de252a6eb2eac3d0670f1aaa77f7520fd77..79f7f973dbf348acf2c06e66afedeb8f22e7a8ca 100644
--- a/drivers/gpu/drm/msm/disp/mdp_format.c
+++ b/drivers/gpu/drm/msm/disp/mdp_format.c
@@ -284,8 +284,7 @@ static struct csc_cfg csc_convert[CSC_MAX] = {
 	.tile_height = MDP_TILE_HEIGHT_DEFAULT                            \
 }
 
-#define PSEUDO_YUV_FMT_TILED(fmt, a, r, g, b, e0, e1, chroma,             \
-flg, fm, np, th)                                                          \
+#define PSEUDO_YUV_FMT_TILED(fmt, r, g, b, e0, e1, chroma, flg, th)       \
 {                                                                         \
 	.pixel_format = DRM_FORMAT_ ## fmt,                               \
 	.fetch_type = MDP_PLANE_PSEUDO_PLANAR,                            \
@@ -294,13 +293,14 @@ flg, fm, np, th)                                                          \
 	.bpc_g_y = g,                                                     \
 	.bpc_b_cb = b,                                                    \
 	.bpc_r_cr = r,                                                    \
-	.bpc_a = a,                                                       \
+	.bpc_a = 0,                                                       \
 	.chroma_sample = chroma,                                          \
 	.unpack_count = 2,                                                \
 	.bpp = 2,                                                         \
-	.fetch_mode = fm,                                                 \
-	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT | flg,                      \
-	.num_planes = np,                                                 \
+	.fetch_mode = MDP_FETCH_UBWC,                                     \
+	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT |                           \
+		 MSM_FORMAT_FLAG_COMPRESSED | flg,                        \
+	.num_planes = 4,                                                  \
 	.tile_height = th                                                 \
 }
 
@@ -623,19 +623,16 @@ static const struct msm_format mdp_formats_ubwc[] = {
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA),
 
 	PSEUDO_YUV_FMT_TILED(NV12,
-		0, BPC8, BPC8, BPC8,
+		BPC8, BPC8, BPC8,
 		C1_B_Cb, C2_R_Cr,
-		CHROMA_420, MSM_FORMAT_FLAG_YUV |
-				MSM_FORMAT_FLAG_COMPRESSED,
-		MDP_FETCH_UBWC, 4, MDP_TILE_HEIGHT_NV12),
+		CHROMA_420, 0,
+		MDP_TILE_HEIGHT_NV12),
 
 	PSEUDO_YUV_FMT_TILED(P010,
-		0, BPC8, BPC8, BPC8,
+		BPC8, BPC8, BPC8,
 		C1_B_Cb, C2_R_Cr,
-		CHROMA_420, MSM_FORMAT_FLAG_DX |
-				MSM_FORMAT_FLAG_YUV |
-				MSM_FORMAT_FLAG_COMPRESSED,
-		MDP_FETCH_UBWC, 4, MDP_TILE_HEIGHT_UBWC),
+		CHROMA_420, MSM_FORMAT_FLAG_DX,
+		MDP_TILE_HEIGHT_UBWC),
 };
 
 const struct msm_format *mdp_get_format(struct msm_kms *kms, uint32_t format,

-- 
2.47.2

