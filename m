Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D2A1AEFF83
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 18:21:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9103F10E5C8;
	Tue,  1 Jul 2025 16:21:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="AXaP810p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9B0510E5C8
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Jul 2025 16:21:14 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 561AiJCn025086
 for <dri-devel@lists.freedesktop.org>; Tue, 1 Jul 2025 16:21:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 azQj83Mmk/KxwVbKtYnkyraSdBj9/Y2r1xncvr9qZTM=; b=AXaP810pOvQYnQYk
 rPwxmcwtgmMQrvF33lMTlg4zr1G8pf1JLEf1I0LYm+z+kTbmXYCbwAwv/mqX8fVy
 wFuHJ/FdZ7OiFJ9KXTF9+Ghn+gAPxFXJqOKnUZH1QliacHWXZsSVRMHS6cmKAT76
 BIW3fjV7WfWmaCZyJtPYiUaUGQlLm7IKyDjZdPbR1/CcEOF8/81hJISfwZJX9nDc
 ePzYNkT1Dc19Ool0I7RIxsiKEDbU/KOE8GW6enaJJXbFJsmol5Tld6pojvh19vC4
 /EYVbO8aBnf9jrZuD04Zb+1nqPq4Jj2RWobfFI7noxr+k/OfwDrS3KwG5A4Qn9bX
 cR1Aww==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8021fde-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Jul 2025 16:21:13 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-74913a4f606so3059412b3a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Jul 2025 09:21:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751386873; x=1751991673;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=azQj83Mmk/KxwVbKtYnkyraSdBj9/Y2r1xncvr9qZTM=;
 b=osJrnpoEP+oG5OJ5RCGuilGbiCk+F4KK7ttoYImeUN/SWZpRnwaYUbnZ/keSDEjzuo
 BR+V1ddll/z3X70jGWBxgfhfK0R87CTrb1ZDins6zPjEnExR/jwng+uctKY2Bq8pGs6v
 TrhoXodGxKUUSndeBk5KJ7gc6tuVMI/h+HaQ10DXsKRaIDJHGxKOyYhbaLm0NR80K8JZ
 ZaQMaYzjKm5KsKqTCgTxG1rvqNOIEXivd33LGaLsKJawJpxzMWwxIvsuB1Ctwzk/myjo
 8j1Ep0dGiavPBRLOarBjHpf9sl+8DQhMgd5ubGvnPZ82hLCKcmN0PeOLeN6H0C3YQrno
 KxwQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUK3A15+nSd8ULSFcKhtdVoykSEl5YaZjXK1CSZDGJp1VJUIWxEuzWl/e74jTQI2Q/AuC4J8xEWj58=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxpTSEMpTjqTMNGIae/RaUNdaz9B6ntv1tBjqB5rVE6RtSvHIBw
 MspmX8jTsOAi5X4U2x0sLd65TfcunPvmmqF8k/1VGsoGW5mBsMGc4ufhvWA+jSSniDQ5kzCx9Ca
 DBqLRP8agr8sobnHn1Z5rOakIYuct4vesGLSXz0vZSqFR/FGFZ71/Ro94oUxjgOqNg2Icw/M=
X-Gm-Gg: ASbGncv7kCKfqLE8d0wSrtQdde4cwP8bOwPJ/u6gkZah9UynOcPdhlGdbrBsCT01VBX
 Q6IktoJhftCHFPb9BxEq508VX3KGEzeZIZPWInu3ypMxsJQHgUtJevvQnZPuQEJr3AvrjcklM3o
 MbFTNqSyfkUqrR79Q1r0TMpek5Crq6D5DCr0PYG2BzksWegNh5I57HScv8DdUpkyhXA9kPmmCUe
 pVAyUQ1rXm1Agx6TvnU94aJ+IKXpclUGEGy+Mocah+0zxSAJ4BCuxFcCKfLHW4t6bagMhSFm8Lg
 92ltnfrYdwZvt2MdHhfqog0aSnDXwo5AsaDw7CMHFDaFPs0=
X-Received: by 2002:a05:6a00:928d:b0:736:2a73:6756 with SMTP id
 d2e1a72fcca58-74af70a7cd5mr22530374b3a.21.1751386872611; 
 Tue, 01 Jul 2025 09:21:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEecrO+V7Bz+q8mJ2CDKZ/SQ9oZaD+cS9NTiHZCC1vT0OJ9WMqoEMlvUTMNHQy3TEelC0HoMQ==
X-Received: by 2002:a05:6a00:928d:b0:736:2a73:6756 with SMTP id
 d2e1a72fcca58-74af70a7cd5mr22530329b3a.21.1751386872172; 
 Tue, 01 Jul 2025 09:21:12 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74af5805265sm12573010b3a.168.2025.07.01.09.21.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jul 2025 09:21:11 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 01 Jul 2025 21:50:45 +0530
Subject: [PATCH v2 2/3] dt-bindings: power: qcom,rpmpd: add Turbo L5 corner
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-x1e-speedbin-b4-v2-2-a8a7e06d39fb@oss.qualcomm.com>
References: <20250701-x1e-speedbin-b4-v2-0-a8a7e06d39fb@oss.qualcomm.com>
In-Reply-To: <20250701-x1e-speedbin-b4-v2-0-a8a7e06d39fb@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751386855; l=878;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=Za6lIWF/Guy1GsjD4sh7LPCArHr2/CqqWk9C2FJ2SII=;
 b=/qoadYRq2CIL3dDt2uzdosYg4pWF6aJq3+3r7tYv+cVDujCQFvGoNr2jCHbcRIo/G7YiE+DAY
 GzgGzFreaATBfb5Mp8vvtOk/qRs2irrznGDZk++QBrGbmk4hgKxq+O0
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: ndF11I8YPuPRqMQP-cX_d-rnOcPQxhbK
X-Authority-Analysis: v=2.4 cv=YPWfyQGx c=1 sm=1 tr=0 ts=68640af9 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=S83do3EnnC4SDWe4yxQA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: ndF11I8YPuPRqMQP-cX_d-rnOcPQxhbK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDExMCBTYWx0ZWRfX8TsuB80GXr4Y
 uzLVG0/8kDvJaVtJZ425YtWQzcqL0JTqfS79Sn7rXTjuDt43SzuSj36/+RMNj7o+nIg2e6/CPEM
 jzn9dUkg2TYOIWz91fagLwc1uIPzEv08yGvO9pfM5oLxQ+G44MHBPpcl5PeoGGMT9hb4XukhQhf
 BQUOLYqC6VU1aQJP2/fBKlcCJJMca7bB2LCNLvJbSUCdBp0m9coE8WBw3ELHLYiyVABuaYDnlP3
 ukyt7WlomNvIWVtbAyLRwB+Hu+Sdi/7tZ5mkjPf1MbBJWpusP4dQ3wjio67d8dN2uOQYYGUl9vw
 ewaeGWAc1BST65Do9iG3EddZVdJ9SToycAhkhc/NAfXhHUDlcnbp+fyuze0FdMfL1s616jhKDgm
 2tTq+QkpmjCi5WsE4jMQH8XV1kxmvPq5NYqvbwZf+7NMhqq38QeP6KZ6b9Objp5jK9uEEcIY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxlogscore=794 mlxscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507010110
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

Update the RPMH level definitions to include TURBO_L5 corner.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 include/dt-bindings/power/qcom-rpmpd.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/power/qcom-rpmpd.h b/include/dt-bindings/power/qcom-rpmpd.h
index d9b7bac309537cbfd2488e7d4fe21d195c919ef5..f15bcee7c9283e74dc8e6f9b6b6f73c0ced009e4 100644
--- a/include/dt-bindings/power/qcom-rpmpd.h
+++ b/include/dt-bindings/power/qcom-rpmpd.h
@@ -240,6 +240,7 @@
 #define RPMH_REGULATOR_LEVEL_TURBO_L2		432
 #define RPMH_REGULATOR_LEVEL_TURBO_L3		448
 #define RPMH_REGULATOR_LEVEL_TURBO_L4		452
+#define RPMH_REGULATOR_LEVEL_TURBO_L5		456
 #define RPMH_REGULATOR_LEVEL_SUPER_TURBO 	464
 #define RPMH_REGULATOR_LEVEL_SUPER_TURBO_NO_CPR	480
 

-- 
2.48.1

