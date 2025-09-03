Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20127B41DE8
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 13:58:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9A8F10E7AF;
	Wed,  3 Sep 2025 11:58:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="chd3mvzi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2F7110E7BE
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Sep 2025 11:58:26 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583BEuhF022405
 for <dri-devel@lists.freedesktop.org>; Wed, 3 Sep 2025 11:58:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 +B6J/aB/tids3HBfaJNu1z9KCUM3gjNbHkRd/sTehYk=; b=chd3mvziinkIxnri
 4Epm3Xc98e2TrW/406+Usjs+Zmx6c4bOUZtzeqPFGZp2xrZs1u/ceKVeuWM2JGk1
 4ZKMAwLc4wBgzptRYoNMZ3/6o2TBwhWp9cYAxlDi/zYR7wCnS1Tmo5SEKa9QGwpz
 T9ZOBgr1iyY/agT8fS3JzDggHcNaaqv0boRjaCAUhDMfrMdHhnOenlWIbEF1Io/l
 o5pT51LDltjawdRmjBwmm2q38rFqimZvkGvA6w4uO3OoZ3A0K+Qrik5Eb6dXKrsj
 zlwDiC1CuiCAZKrIvYRw4PpOEwFo5Tlb+sTmFnTrkVPtdLrzQTS4TvN5jF81tG0t
 6Hjk6A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ut2fkdw8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Sep 2025 11:58:26 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4b2f78511e6so58047361cf.1
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Sep 2025 04:58:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756900705; x=1757505505;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+B6J/aB/tids3HBfaJNu1z9KCUM3gjNbHkRd/sTehYk=;
 b=xIk7LBVT2ClF3qXEn/QYRx4vfxLR1msMT45ggk1cI5lx26Z+f28D2VVp6L6JFllFIW
 NMBZac8Mpz17y7nNINrBLyLV72e3eE5eFvFDnHiIw8y1dNxc/48zru2E4nqyCNRs8tXq
 7NOsPD+g8jDgpGr7Xr8KpULnfLWc9tJijzsxuZEIbSXplPNAhxAHbP/EvjcfO58FhhQH
 lQD5+ZMcEtHpraCUU4E1j4kPjTNgi9+YNN+Skiant4zX1XjE6E9pEzq0FmOy9LCqU5EU
 Sl5tTRrSXyUSaGleqQP274o9jbY2tAHgV/YgAe55WiMD2MlNll/V/flpahGSuDHlqdRD
 fYuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXT2qVOFU7r/Aq4HpXWG33kYhhUv/xGJtep3re0DqNqqoOQKsAl2RHUJLhGsmKkezinAIH74NFN9kM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyuxk+06jPrlliPLy9zClqkQdo/RE900QPE7ynRC9eQjs+/P7Yg
 /M4PSCrnPhvgRVqzFfNLRvVf0UQ3KW/z7efgOHSISGZyjlSVrZWsSaJ5Yl1jAIdumv63U/3MSmO
 hsX2IB97CQLV6D2KXH1inY6cWgt0e2fFox2J3STSnHhBSJMEhqXfMWhf2KGwNREay8xDx1/Y=
X-Gm-Gg: ASbGncvvG/D+0JbCXc2eVv5aN+6FeE9TqVytoCYALTUpWvlwqw6AQ1McHNWdg5RiMRG
 PWefoQ+90CWGJCEb/X0IbybfNMVLX0vXzWnUT/DLmhtdWEqld3Wixvh009WGnFpyUQA7FE611Rg
 w2UHJfWjUuYqeXCGgPg3XPtwswfWQZwTKDfegwdjuYef/x+cZHZqe6g2WojZ0tVONwOdODG9ALe
 5k//QuJ+uXTSQM5TEgbPwABZ3fpjkbwlmUn3lpk3UI4MfAA+rMnJPAi8M7mTnCJcHv2NC/J3ESL
 ZCOE02q0fzseDvX7ln13gLGBq140pGMqvKZ5tIQWwh0dipwlXt0vghKLT6KdJzV/evfh66gtDrI
 U3yGPC6UF/UJWgeW4DCqj5jxdnjSEVXnOUgVDXBdWMNWfCJfR409+
X-Received: by 2002:a05:622a:1f09:b0:4b4:94e7:7305 with SMTP id
 d75a77b69052e-4b494e779admr14573981cf.66.1756900704597; 
 Wed, 03 Sep 2025 04:58:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEec6pipCsiN4bgRNHEInH7xKrhFe7yfQxq516iB19wHmpDvTtGnLGWlQH0T9+x/MPrYZLrfw==
X-Received: by 2002:a05:622a:1f09:b0:4b4:94e7:7305 with SMTP id
 d75a77b69052e-4b494e779admr14573491cf.66.1756900704030; 
 Wed, 03 Sep 2025 04:58:24 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-337f50d30b0sm9891421fa.67.2025.09.03.04.58.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Sep 2025 04:58:22 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 03 Sep 2025 14:58:13 +0300
Subject: [PATCH v8 2/9] dt-bindings: display/msm: dp-controller: fix
 fallback for SM6350
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250903-dp_mst_bindings-v8-2-7526f0311eaa@oss.qualcomm.com>
References: <20250903-dp_mst_bindings-v8-0-7526f0311eaa@oss.qualcomm.com>
In-Reply-To: <20250903-dp_mst_bindings-v8-0-7526f0311eaa@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Abel Vesa <abel.vesa@linaro.org>, Mahadevan <quic_mahap@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1997;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=RDcsC0Xk/SeTiAYs2PrzT5y7v3tCHnCk8IS1ckk2ayU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBouC1XhQYwJ1lOW5eV5P1HT18WaT4m7LdhmkXLt
 BA9hlGisnWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaLgtVwAKCRCLPIo+Aiko
 1VtwB/9dctctbqAzqdpymh47D1RY5EIKq+TYeq9nhWHT7IdEdFJVWIW9yFkpZcx/9Hvp2H2c1Uy
 /ms2Xrcw9raK5q3K70hPRtXSh+dmaHZBhxzYzyV/XfsA3kgNthtuyUBJxz71CF3EYvmttDalY2/
 LXl6G2ErP7DwIbQnWOcYGkofktJLZKbviC4IGwyjQiGdlosNItNsbjuzxncmKgJ7smR4MxUsJy1
 eu1OPmvBqp5CNd1PjEY0yTacTJGkDpormvV/p83MkvKRCwo6muNWM3w0ef7IT2qeTI7Cp4AMQRU
 kHCX9fF87Yw7hguGeHRMXQSxczp6mNgRqCHuahhTkOev3bln
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzOCBTYWx0ZWRfX6A7Z2X7Hw2Aj
 a5iSqqdju2d8JT0DuWN+JB3j5QqOiZi9tXXBoQEmHCmo+wRQfs5/PXChHulTozqXE2tjNQ0WTFU
 4wRzuBRmB5DxfL5AHGjde9g6npVdf3InsSkNZsDfTo7ktr0CiSnYThEzhVk+LlVaJEXhUUgRief
 jfHcGz2Xf6Vao4FAcreOGRJ8tKpY9BnLxq1e4PWDGmmin8DbirLAsGTRBeIU8ASgDXEc/s48bQk
 buJ3lQRudEs8euAR5LpCrRw5JLRUZGStRgQriXc+xYlDlZFZFGeAK9IW48R9Ecpp3BgAGc9GckM
 HEw4amtx64axyp71RlTy2W1GFXqacA4iyf0DNGaeJrys1Es7aqDd3jZWK9EJQjGSSl95dHsspXG
 yR+y2Fwm
X-Proofpoint-ORIG-GUID: bJuMWBMBwDDpILyYQ8jnbj6NSQ4A-RMz
X-Proofpoint-GUID: bJuMWBMBwDDpILyYQ8jnbj6NSQ4A-RMz
X-Authority-Analysis: v=2.4 cv=U7iSDfru c=1 sm=1 tr=0 ts=68b82d62 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=M9OWzbDgh-7tm28R-yYA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_06,2025-08-28_01,2025-03-28_01
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

Currently SM6350 uses qcom,sm8350-dp as a fallback compatible entry.
This works, but adding DP MST support will reveal that this SoC is
not fully compatible with SM8350 platform: the former one doesn't
provide MST support, while the latter one will get it. DT schema for
SM8350 is going to demand MST-related clocks which SM6350 doesn't
provide.

Add new entry for SM6350 with fallback to SC7180 (which belongs to the
same generation and also doesn't have MST support). SC7180 has been
supported by the Linux kernel long ago (and long before SM8350 support
was added).

Fixes: 39086151593a ("dt-bindings: display: msm: dp-controller: document SM6350 compatible")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/dp-controller.yaml     | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index aed3bafa67e3c24d2a876acd29660378b367603a..0f814aa6f51406fdbdd7386027f88dfbacb24392 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -31,13 +31,25 @@ properties:
           - qcom,sm8650-dp
       - items:
           - enum:
-              - qcom,sar2130p-dp
               - qcom,sm6350-dp
+          - const: qcom,sc7180-dp
+
+      # deprecated entry for compatibility with old DT
+      - items:
+          - enum:
+              - qcom,sm6350-dp
+          - const: qcom,sm8350-dp
+        deprecated: true
+
+      - items:
+          - enum:
+              - qcom,sar2130p-dp
               - qcom,sm8150-dp
               - qcom,sm8250-dp
               - qcom,sm8450-dp
               - qcom,sm8550-dp
           - const: qcom,sm8350-dp
+
       - items:
           - enum:
               - qcom,sm8750-dp

-- 
2.47.2

