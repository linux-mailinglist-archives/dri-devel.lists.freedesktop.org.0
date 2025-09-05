Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BCD1B44C64
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 05:41:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4262610EB0C;
	Fri,  5 Sep 2025 03:41:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="XEbGDZtI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA84910EB0C
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Sep 2025 03:41:48 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 584J3e4e022976
 for <dri-devel@lists.freedesktop.org>; Fri, 5 Sep 2025 03:41:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 s5H/bF7V+/uMeSq3g0gxgqc/EofmL6r/gf0PKGC0ccY=; b=XEbGDZtImuOhkztn
 NA+oNtbKbJYIGX60BiWd5G0nAbAd8pp6+KS9FPAKQWB10IGsEIGWbbEB7LwfKpBQ
 0A5CiO8xVsUUvITNdWFfzji+1SjmCURXUIKeRRWdk3cxfpIv6kObJ/+4BRh6+WJY
 7hiottyza2XXW2mUBfAth518jRCEuBmo8RdBFhRLss+kgXmvQm7hLycAjaDQwFhe
 H3RBzqSP9d+iv60j7WrRN1LAwdr2PsCVADpV1Kcc8CLmOz5cUTLLxEVlwQJxGgYK
 JGsFQvf6HQAB8GuVaD2qv92ArfPdL2R/Ae/8a1EnWtKnSRvQC+C1ZfzrT8Y/Nod4
 6DU9CQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uq0esuqv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Sep 2025 03:41:48 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-32b58dd475eso1851827a91.1
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Sep 2025 20:41:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757043707; x=1757648507;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s5H/bF7V+/uMeSq3g0gxgqc/EofmL6r/gf0PKGC0ccY=;
 b=U8ALYa8LU+l1Ns/Y1AXvg3Z9SBz5LYw+XCvKYTQ/ffSV++xVyBoe8j3foLITiEZqX3
 F7PYdcRTwcLZE5Irtn7vSENLG4gstLBkWdyJpiqpOe51uZr1NwY8R3dAAmzTjP5ZyrbM
 17eipDsjM3fQURhYNT4mLLj6jWlKMFJVHLlUYMFruqBpnJl+NTOXh1AJsRBmKaC4KYAd
 Hd0iIwk/OzNhWpVVtTuRA5/u56nu5IPXmBabxHl6f9yNF1DAX9t55LqJ2HImvehguoQQ
 fMCbPB/6Rcd3vEAKcSnywy+iUX2dXy4Sk8pvfgg4hev3sGNbNOcarNyif+vpA8tZQVqF
 82og==
X-Forwarded-Encrypted: i=1;
 AJvYcCVp/KGKS7Vz8gUAyVBDB5mWIHWC2MA7sHm8nVpRLxs6N0qIW3Q6vr31Ck11o15achobepvy4+4sN2I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxmIIk3iEfY1Uu7Cyxw64EIFdzMkGU4ZfIno6Nt9hP/CQ0w7Nqu
 B6IN25xwG0ILBUhDgcHLpGWSRsICmQMcjGbbJJcO+/h7XsePUVm3pms5OGpuR1uOJZQtg8FNQ4J
 b3LLp+cIK2gb5h6WvNi50ayWWXipj3xiIIfhZUTfgEOqbJyB2TfG9Cyylwk63SK39z3ud++Y=
X-Gm-Gg: ASbGncuHxuXm/qK3Zlu3mlGtrES9XfMRZWVsVs/q9DJEehi2Wnr/AfnLQbWsGItBWhW
 P0yszl6Octgd8GYEQPZkYouyhIZPdE4WE3haOUwEm+myU/DsiDL9y75k19W7WQI3sLE7pKmjRs8
 0VB6UhGMIJIuKxKGboWgZjV+Cq+iiyZpf954GEjIOI3RAww1RgJZIqE+vmAfbJNiOJxz4i+W/vn
 N+Qu4xHNTbAk8E1yJaNpe5AH9WoqzGGvI8xSYAUg/UvdI/xcw9kJOT5cOL+061pd5vs0BXvrETz
 Vqea+3w1TSFi3WsRYEr2E4ZfO8DWqemL30t/orpEERtbF5lsYiB6oMByUBySZO5ULCw=
X-Received: by 2002:a17:90b:3a4d:b0:32b:d79e:58ac with SMTP id
 98e67ed59e1d1-32bd79e5d33mr12769a91.31.1757043707415; 
 Thu, 04 Sep 2025 20:41:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGZ9PvfDXRf85pIKpaZ0+e/fu4IJhXoTc6zGnbjcuhclxnsGhnVwS+OEgvprD3RTJKovkaIJA==
X-Received: by 2002:a17:90b:3a4d:b0:32b:d79e:58ac with SMTP id
 98e67ed59e1d1-32bd79e5d33mr12743a91.31.1757043706922; 
 Thu, 04 Sep 2025 20:41:46 -0700 (PDT)
Received: from cse-cd01-lnx.qualcomm.com ([114.94.8.21])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-772818bd5e1sm5922315b3a.86.2025.09.04.20.41.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Sep 2025 20:41:46 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v11 6/6] drm/msm/dp: Add DisplayPort controller for QCS8300
Date: Fri,  5 Sep 2025 11:41:38 +0800
Message-Id: <20250904-qcs8300_mdss-v11-6-b6b6a67a1719@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250904-qcs8300_mdss-v11-0-b6b6a67a1719@oss.qualcomm.com>
References: <20250904-qcs8300_mdss-v11-0-b6b6a67a1719@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756974526; l=1242;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=jmOF3YxLYSDfb8Ohpc4kXPJtA6m1LCaahphFup+ozoQ=;
 b=y2MHkOnGCX4UsKhNfZcloL+SNbTVPfVHc05X62CuJDECzxLMqihVz5DujWeU192GbDQtUNiCY
 iWrYKbzafawBZxMW0395JwCyixV/fY4bmbxq9iyL4VKvKizfzB4Xkwb
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: jD9K_YlcrxzFiSRsAthctOwZR6CQyyOm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwNCBTYWx0ZWRfX3zRkU7iUVURt
 t2mE7OKfvHiCeQu8UkjggG6TsRYE0kNiUhe6r2/m8kx1UCaXLFBCANHPs+/SQnlfeK+dK43RfWl
 Sat3wV/h90ti8TIBi1QJ5bEQdQzgRXvUGmiJ+8pX3waiXN2Kve0xicaLqcS348POkyIsSWSCwHK
 UtLS/gAz2U3iKHr2NUL/miyr9k6dRS/emREvNvMnmN+5AiSbjg/F5bdLUPKejLFtg9z4axPfwB4
 JpGzpy9QBgi1iDsUkeU759PJs+RIW7PQS3DsTbIvTKGTMWVZskD8FU3aou17SOARd7OdpufhaRp
 f1uS5OpsdY1WaG5xre7vnz4FzUhTszQE2LV4hgDAGP0rYImpCxylO+Y9pMGY1g+hGNl/Hw8gb4N
 PDzZLUNN
X-Proofpoint-ORIG-GUID: jD9K_YlcrxzFiSRsAthctOwZR6CQyyOm
X-Authority-Analysis: v=2.4 cv=ea09f6EH c=1 sm=1 tr=0 ts=68ba5bfc cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=E9mFum2VwHQHOKsBOicA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_01,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0 phishscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300004
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

The Qualcomm QCS8300 platform comes with one DisplayPort controller
with same base offset as SM8650. But it requires new compatible string
because QCS8300 controller supports 4 MST streams. 4 MST streams will
be enabled as part of MST feature support. Currently, using SM8650 data
structure to enable SST on QCS8300.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index d87d47cc7ec3eb757ac192c411000bc50b824c59..bb4660585849d1a67921a28e7e12422e0c327ab2 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -187,6 +187,7 @@ static const struct msm_dp_desc msm_dp_desc_x1e80100[] = {
 };
 
 static const struct of_device_id msm_dp_dt_match[] = {
+	{ .compatible = "qcom,qcs8300-dp", .data = &msm_dp_desc_sm8650 },
 	{ .compatible = "qcom,sa8775p-dp", .data = &msm_dp_desc_sa8775p },
 	{ .compatible = "qcom,sc7180-dp", .data = &msm_dp_desc_sc7180 },
 	{ .compatible = "qcom,sc7280-dp", .data = &msm_dp_desc_sc7280 },

-- 
2.34.1

