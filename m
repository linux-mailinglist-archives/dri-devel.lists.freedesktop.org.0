Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37DBCAF9846
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 18:32:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC26E10E349;
	Fri,  4 Jul 2025 16:32:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="pzJZNgZo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6CA610E348
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jul 2025 16:32:00 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5648fWtb024904
 for <dri-devel@lists.freedesktop.org>; Fri, 4 Jul 2025 16:31:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 qjHlmwArjTOMKWmC6+bgZpFfSvKDIyWSaR3a4YOlmAs=; b=pzJZNgZoGz5A7zuo
 dinNmipmBGQqxA76MP4Jan0muafX0QVn2EfCIw1yEcZAkF38webrqcQBW2BHWbD5
 OutQGEAqFDeB/WLDbImmiTGnWkUjamw7Q0s558jikPc8JKmYcNgtDAmav74BwPpR
 4T0fRbSwrcPiP+YJnKprkbvVj13LAbSeIExG6ceaQgJVX/aiSHnUbbfuLYnE/YM+
 AX36LvmKAQB1Gxo1jSMICHIpWtinERqnhXs5geNeUAoGzIF7iMThjJS9XQOjRIsZ
 mEZ0UOBM2e43c6xEi2ClE60/zhl9GWBz/RQxCRQEDu+ec5+hC2kd2DclFnhWJui2
 4kSPLg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j802c7b0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Jul 2025 16:31:59 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7d3d3f6471cso174811985a.3
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Jul 2025 09:31:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751646719; x=1752251519;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qjHlmwArjTOMKWmC6+bgZpFfSvKDIyWSaR3a4YOlmAs=;
 b=tT9w9f74Z7rpDYKnJd70Wflm9GO+OeMG/OUWGrUWdzcK1ID3EG6Yo2u/vXH26wRiGr
 0UWftd3TV1hP57TMhlEIWrkg57zKlaCcB2+0UrNG4kIsiuFVb7rl3KSxzlNwSlazeec6
 UF523bgf3Hc35oHRWbLsGWAeHJKI+907/u9a8SMzqktFiUVVCNufjWWTtOql8fRrZ+1t
 nNC+pn6+W9+3CyjKtCXmyPV/+7U40Pk3eaLz2VEL/e/7w/VXQftGYl9kqmQErHBNBfMi
 7D0VFKMPy1NRutqmz2/ALGE4kKpMfqmMHi1mU8xZgrAJPK1+LWFustk409O5rrQQ2UUL
 YHmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUe70U05HX6b1zGmJu34rXCeDNryDjC/U0Dswlk5Csy7vudVMsmix4ESkzqD/6UOtBmXyVW76BGBFg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyWEbKaOGHLOmPHW58bvCfccA2E8XF3P1PKdv1vRGCEuSjS4v2H
 O0Mbj3cM78AaYvx9rxsEsBjGFaB9KiU5MB2wEuSZRHjfETg3MzOyFstumN4vIH8Y+Gc+VFa4Cs8
 b3Qlzcj/wM8932vKzzhfERZZ/3zAdWIYFe13OszmGlkyKpltypyr9R/XBLLmKxVAAqDjaQl0=
X-Gm-Gg: ASbGncskAZhnbUCJjIdkjwusmGeYG6CWH1INdTsLRqkTemhYQhbyUoJr1ii0HNeOPFl
 SGU4T5YfuGHsNFI4kADDLv8j2WNd8FzREf4v/GlBKeF22qTUSVNKfYJWLGiNg/h/yJ1IIRdRIY/
 ZBGwPwx23ECwDaBPYsCmyR1mWYcTyJSnxQZWD/X3a/WI6Ih0EuQVnfININuARcAkEELvQ8ghO64
 gE5QN2brEpxYWQ7Ev4d1zuuFO7opvS1qzU003nOJdh7esPUgSCbcGfQZs9ysAW7JbTu4ljQOGPw
 kmITtLQIF0PCddkLqdCmy3e2p4RUA/AkNjx2LNfzLeGZVqicKsNxj0KG607U4OomPe1izGAaqqC
 MYRcaoHOhBbP2lOXPYnzamYWYiQFRaKM9pwk=
X-Received: by 2002:a05:620a:4114:b0:7d0:998a:2e64 with SMTP id
 af79cd13be357-7d5dcd40ec1mr456502385a.56.1751646718726; 
 Fri, 04 Jul 2025 09:31:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHpMRUrk1CDVU+F2WTSjBGZWFGqazNAhn/w6PL2+6knrtMnP4ChdfOP+UWbEaeEkMn89T79Ag==
X-Received: by 2002:a05:620a:4114:b0:7d0:998a:2e64 with SMTP id
 af79cd13be357-7d5dcd40ec1mr456496585a.56.1751646718065; 
 Fri, 04 Jul 2025 09:31:58 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-32e1af83102sm2813571fa.6.2025.07.04.09.31.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jul 2025 09:31:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 04 Jul 2025 19:31:53 +0300
Subject: [PATCH 1/4] dt-bindings: display/msm: dsi-controller-main: add SC8180X
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-mdss-schema-v1-1-e978e4e73e14@oss.qualcomm.com>
References: <20250704-mdss-schema-v1-0-e978e4e73e14@oss.qualcomm.com>
In-Reply-To: <20250704-mdss-schema-v1-0-e978e4e73e14@oss.qualcomm.com>
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
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1468;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Wcfz4bb2UH4k4iauZC9yeDtbL/XAGvi5MpIvhkWE+84=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoaAH6NdCA26k5w7rflaL/C0ZoQBv6Ah0F9ug1Z
 Y0jE0oTs9eJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaGgB+gAKCRCLPIo+Aiko
 1d3tB/49669MgQgqtdl5XpVt4x+mRqFwJOfQhto4TFrSToyu4TtQroVaUAA0a6PXNNJnQKjjNaI
 zFcWAAfwkbz2xbvtLvaz9CEuHTV7yq1UGmSJdfhIWDdx1UMkgcpTBkt03Z2JXQDiCdpYW9wHeQe
 VE6dOe0zm0s9ZZ0k8z/RoPPerz2ixTynYeSrH1FrVYczgX3FPjxmAHmPmWKgLoMDpe+GeyhhiaU
 kh2E7j7iwjoP5uijoLT9MNEVA+bqzIB6KAMqE5ohGphvVzjTpZqoH1bIxc7GsrlhMZwy9U5ujE1
 SwLVtNqyyAH5k88oPBL3fDVVygagjafuxZSgqDdaJgUc3fk8
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: S2gh-kajgG0GmVeAGcU3m2Vm2-j1RUPF
X-Authority-Analysis: v=2.4 cv=YPWfyQGx c=1 sm=1 tr=0 ts=686801ff cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=93dKIss0COAcHyiF0SEA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: S2gh-kajgG0GmVeAGcU3m2Vm2-j1RUPF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDEyNCBTYWx0ZWRfX4vEH5O09rrlu
 GxPQLNYZTT0xFmxAQAz782wMDSSbJrO3sr/nBKPxfm9gCcyGWgtvCasNPiajBatuDmbXva3Yh0v
 ra/YZbTd3IaVVwiwAUtBSptNrb7FdKOECLwACV7yjzY5ByIilWu4fPBmBH1zhgQ3J/EnK9WYcwh
 sAINa0xRqepiOTUYUeTbKxZln58D/njPF2e3CqEcsS507OLTQ+pEF1qmaKtraddmwuPpUwTqS8m
 ZcLY8fTdwLJ/t9RAIQE1fI+bkTakh4Wr2Y6w0FWybGG20pdvWMNK3qRwjXUi0kCOXG7RChKuAGx
 Ps0O2pzm8peYOFCv3J/uqK29g3NYvJM6PdZ4IAzIJqpD9gmbMxVyTfhQUgb/X/vvsZOr7OKI1QU
 uOf4+5S3Ger3JjWbfX8v7obkXL3XhXuod6Tt1olT2wIiyFRBrfQ8ZgFzwJprTd8AbiHLDbCW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_06,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507040124
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

Describe the SC8180X-specific compatible for the DSI controller persent
on the SoC. While the current DT for SC8180X doesn't use this
compatible, all other platforms were updated to have one. This change
makes SC8180X follow the lead.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index d4bb65c660af8ce8a6bda129a8275c579a705871..4400d4cce07227c2f8938f126c77213b2e4bb9a5 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -27,6 +27,7 @@ properties:
               - qcom,sar2130p-dsi-ctrl
               - qcom,sc7180-dsi-ctrl
               - qcom,sc7280-dsi-ctrl
+              - qcom,sc8180x-dsi-ctrl
               - qcom,sdm660-dsi-ctrl
               - qcom,sdm670-dsi-ctrl
               - qcom,sdm845-dsi-ctrl
@@ -332,6 +333,7 @@ allOf:
               - qcom,sar2130p-dsi-ctrl
               - qcom,sc7180-dsi-ctrl
               - qcom,sc7280-dsi-ctrl
+              - qcom,sc8180x-dsi-ctrl
               - qcom,sdm845-dsi-ctrl
               - qcom,sm6115-dsi-ctrl
               - qcom,sm6125-dsi-ctrl

-- 
2.39.5

