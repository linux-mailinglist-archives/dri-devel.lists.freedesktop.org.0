Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83289B1F349
	for <lists+dri-devel@lfdr.de>; Sat,  9 Aug 2025 10:34:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3D2510E296;
	Sat,  9 Aug 2025 08:34:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="nMbhVHQh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C41610E14B
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Aug 2025 08:34:02 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5793Lsc7012636
 for <dri-devel@lists.freedesktop.org>; Sat, 9 Aug 2025 08:34:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 VyXYRLJzDKBZ11ZVF0ZtjEW2r8lFG8npoaFqtCmnxaw=; b=nMbhVHQhq8jI5CRp
 7yUt+mqcmsSLef65JrnmWBNO7DIIe/iXwpsU2bd7plPrO051N3wO1Fy4g1Y9i237
 V16xl/4kmgtbX4XZu/dhXavIt6WvbQirQ4/tMXuIjlMb5IHGUUZg8uSnOI+M3fec
 OT/9rjC1sfDbC93NmggK2905T0GnLhcfHK0ESMCSTfWHafIcLdCIx8gJiLFjOb4Q
 ogfOms8YUwjJCVs+fp4TJ0x5JNrQiFAdSSyP/pKj96CIufCxkDWvlKI1g2PIiVWX
 RCz41py0D8qwXDDocQO3oog/7OoDDpjNWMbZ8ejnksDNlqIT6PNh8GQoUsLwQhap
 5KUVPg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dv1fgj3s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 09 Aug 2025 08:34:01 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4b085852fb8so104342061cf.3
 for <dri-devel@lists.freedesktop.org>; Sat, 09 Aug 2025 01:34:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754728440; x=1755333240;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VyXYRLJzDKBZ11ZVF0ZtjEW2r8lFG8npoaFqtCmnxaw=;
 b=bQhES5n2pnfqIjAqFc4MyxqfhPPrXVsV18fv1SYBYGQaJgJFsewf+v8VT2NZ/65Y7c
 J38FFQPt9MP/5KKEMsimXco45+OhW4f8EwZ1WXA87nSrTzrosyOL+Ckzj0Ptg+ueH63T
 ah/gdakUxLSaCpkKCOIIUCNrkNXz17Gjp7OJaeEDsQTIvynPx3a6pIH/ZrCRkvgTkLBW
 J6bHb0gEBRySF7ZrLguD5zLN3TOH5qTdbDoQNnWLisv4/g3wZZMpU3pYyNg8NJDEwq4X
 iQ5XhaN0rfFFSSO7Qnd3lbfLIjdewb0xfJOUXqnRLxK7LA41I9CQOdtrO3iO+kTLCuEC
 Z0dA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWCD3kteiX2pMETsN1bBfZp3UgnLIR4kexlBT8lnZOV1CeftXSl99mY+9r8OE0jteZUG80cH3RBWZU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz2x65OdcGVBaB87PGop2f5MIwKGSFgu/OhCLuE1qKCVAo46QhN
 4E0aRCgkM/aH0Tn49wPDtCcEavieCdLJNMrfx2LC0nuibTWaHZCS6yLa9sftfCUury/b6GMq/Mc
 nBLuwhY4ZP0OcNtywmcsy+DgzJ2MafZHYOpL6oOhtnlElBC3HcqCGwIR5kLAVvPesSa/OwbE=
X-Gm-Gg: ASbGncu/bM8denkAwzgxd3eEqqyhaGrYRIcxTJfCkzfkI9gFou0RbcAtlj31HC3SAf0
 Q38dBoMaSCKG5MRtGwgfmko1bfYiUlGVu6W18IF0oFeTgCLJ6ugHgzyRnwVh8U/eLk/A7ahPG9D
 /LSfiG7Wk7022YskRx7AvYE0rnFfpp9qxupWS1req/QOuXNcK4E6rV5xCp+CV9sMAhm57j3kdAA
 etyLf5+qkPc4tX99RxXnG74ZXnPA1hE5A+T3YOEZbdTYF3bgUfITr0kk6Y0ZfylwmlCGJo9jf4O
 1rtB0Vv3TswnN0g5qdkoz4DUfI6J0VZ+bsRP2gfWCcc0PaWKw+twaDHpIZTDXqDAhap6k1qTOpp
 ZOTVnE6w0033rQ9pOHA0CR4r8ERTjMb+vx9wrURihpV7DyYSoHJq+
X-Received: by 2002:ac8:574c:0:b0:4b0:7b0a:2a48 with SMTP id
 d75a77b69052e-4b0aee54906mr100496061cf.56.1754728440522; 
 Sat, 09 Aug 2025 01:34:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGn/NnXSPgAnPNiZQ/pbt34Ubwax9v+///1C+g1FSm/0KIGAfDfUO5MlDxi/4Fchku48X0j1A==
X-Received: by 2002:ac8:574c:0:b0:4b0:7b0a:2a48 with SMTP id
 d75a77b69052e-4b0aee54906mr100495691cf.56.1754728440012; 
 Sat, 09 Aug 2025 01:34:00 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b88c99078sm3268166e87.102.2025.08.09.01.33.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Aug 2025 01:33:58 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 09 Aug 2025 11:33:52 +0300
Subject: [PATCH v4 1/6] dt-bindings: display/msm: dp-controller: allow eDP
 for SA8775P
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250809-dp_mst_bindings-v4-1-bb316e638284@oss.qualcomm.com>
References: <20250809-dp_mst_bindings-v4-0-bb316e638284@oss.qualcomm.com>
In-Reply-To: <20250809-dp_mst_bindings-v4-0-bb316e638284@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1543;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=d48/C5oLUka5zAtODxq9StYs/l7s2f/Mtt/RsfxEURo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBolwfzl5BuaDrbT6HWXVPwy0irjYqtk03FHP9tH
 ozEaGP1IfSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaJcH8wAKCRCLPIo+Aiko
 1YtGB/wO+YGdbSiT/sAaWpH4F7MPaKpOP6u5ombiMKD1jY1fO0NYnKDviwkkqiOPLWRRVrFEmRE
 +Piqxk9P0ZAslUYqub7LSouPvPX/tZFgd6fScO2IF3Qcco4tmLdBxCgmKpWqtqmy4ALY2aYg63G
 nytaNqcw0Cdz2zBz0VNm8bwKZofITv0fyMcJrfQghHBzITnRW74DTBJgWg89tHY69TMRzRzsRMT
 B29nt87RjXF9BbuWLzKdKogbhVGl2xrE2xk/jhUcPYtH/heblHz74nSPSAnC70RJ8Vi5BInpJzy
 ScdtcH3nxrSSZEXrJ48+NCv0THnInCInWC8xqVYPfO3t+0kP
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: JcXvx2oHDMB6JaSsNo3mXHa81jfaIZcC
X-Authority-Analysis: v=2.4 cv=cLTgskeN c=1 sm=1 tr=0 ts=689707f9 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=iBDq5nSyD7x731avtJAA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAwMyBTYWx0ZWRfX3GmDVoGQk7aa
 0f8WUD8JtdzJFxYNHAxrIP5KStdWug8LVnSdnwxrXcd0evRbk9JyBLB+bNzb0hPRO4f3B66dJRe
 4rmtDK2VdeRyacgX8xIrZ4Xia+NGUSb7nErJ366fkJjQHjxL3XmWKxyM4tNqMnnayUr5soZdpfq
 7NFU0BP9PVBeQFIKE8PHsSgnrPXFCxnZm1X8TD/rzv8dQAFPGvT7jciD2aYtdXIvREVp9V5AF4w
 DmBah/y5SWX//bz3hLM2tUZhSbJvliPTKMPIu+pgv91wipNd8ryzXIV8eAaAfU55bqZ3ysxu4Fk
 88LmugaOT6CEkvr7k4fftbH0t3k++D2fNq0DjBNduznOu9H2+3wbqbv79gMwj57RjqSYro4R0Vc
 80qr0D6L
X-Proofpoint-ORIG-GUID: JcXvx2oHDMB6JaSsNo3mXHa81jfaIZcC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-09_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090003
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

On Qualcomm SA8775P the DP controller might be driving either a
DisplayPort or a eDP sink (depending on the PHY that is tied to the
controller). Reflect that in the schema.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../bindings/display/msm/dp-controller.yaml        | 25 ++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 9923b065323bbab99de5079b674a0317f3074373..aed3bafa67e3c24d2a876acd29660378b367603a 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -174,12 +174,25 @@ allOf:
       properties:
         "#sound-dai-cells": false
     else:
-      properties:
-        aux-bus: false
-        reg:
-          minItems: 5
-      required:
-        - "#sound-dai-cells"
+      if:
+        properties:
+          compatible:
+            contains:
+              enum:
+                - qcom,sa8775p-dp
+      then:
+        oneOf:
+          - required:
+              - aux-bus
+          - required:
+              - "#sound-dai-cells"
+      else:
+        properties:
+          aux-bus: false
+          reg:
+            minItems: 5
+        required:
+          - "#sound-dai-cells"
 
 additionalProperties: false
 

-- 
2.39.5

