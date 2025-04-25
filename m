Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F555A9C442
	for <lists+dri-devel@lfdr.de>; Fri, 25 Apr 2025 11:52:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B3B810E918;
	Fri, 25 Apr 2025 09:52:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="o7bkyZ8G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D41A810E916
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 09:51:59 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P8T64j030813
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 09:51:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 RGL1av9CKAAAXCna1rw1gPi15ZH6XiWkTlMH9dyZseg=; b=o7bkyZ8GSObqQSQh
 3tPfJiXXzR4nNoMzfJxuJsOLTRtul0ZTMILUWelxWgcrV31+tYXHAwPH7LZFiXgc
 h0fwS+81SqSjiTb5NBc0+XkzQ9hYax8vyfnmOHWHbp7FB+b9W0hXpXXCCeoeAe57
 l0u28LzhKPutCF72xk4rTEWUc+kY6o/4OXOnI8UzzbHrnu3848yV2ZoJtLjS/Zvm
 zSJ1wWkX80Fo0bNv/xy2di1zGNe5kLnNLcUQLa9ncFKoXJgTXEDH3+oFRSVD7z0K
 Fj1v+yJs9BVSHWRNXDrYvFJ5w32FWpur20zDcDXVmP3OdB+cpOIMOuBqbhZ5NOCM
 zdx0Og==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh5gjp0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 09:51:58 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c5e2872e57so353598285a.0
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 02:51:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745574717; x=1746179517;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RGL1av9CKAAAXCna1rw1gPi15ZH6XiWkTlMH9dyZseg=;
 b=j71tBobocwU2owAKqx5SIBIMzVk4k2iu3dfCnCnI1c1RM5gtkYDCiLjFx+j/a3C90H
 EfUzAwlokX5NtCHtXJsN3GQIIvTod8H0cmz1Sf5maeC68W9zPdZQsrzX22TwCVGmxjBv
 D/dPJPq18lB2sxFDolhPFBcIV2ez9ZiGS+vsNpRglwh3olcVXpHcuyy0dDB+AQmagrB3
 cgRCQC+QyX/aNUyy/PSJoDTNqE4lOKcmfoy/j89/7PMvYUs2LB9PkJD6fRiY8Tq6g4XE
 crnNygnGJC5rqUL/gMofbiJnCGjEG9mKQQElOK2fGl9jFjkKcXoId5z20bRicNrrt0Dx
 o5jQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkEP6/DUk3T0d/7mLq6OuNEXD8QshyyPCeVYwQspC9rSJhkcv537qPrfjWCEGlpl4cqerWanL9X+w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzAzWyiuhyMt6fXB+7caPh4JU+xOsHyvIBkKkHRercB7V3emAkL
 tJTmx9CK0t1suhxiIZx6qjB6pxQZwdkLDOyC3i40X2LwzqQSQ6nEjg0W3fCjJNfJrpII+rXRD+a
 7V0R+gc/YgPuvcPHffDksIH+wgH0IITEahXhuM02Fm7V4Qpqh8zD5iA/Pwz5hyovqWyxb4pW62P
 Y=
X-Gm-Gg: ASbGncvkuCnhJnriUBxVJcdYQXOoUzDJTbMUvEbVIcGol7CbDqQ4HqhFxu5ilTeV/ng
 uCzYMMt5OdvrVX1srY0oBkGmxJzlrpxiijP3OIAdPPlTgUaHirWPgE/ogm3I9hWNL7/FrbkyI/2
 8AA2npHe2DsWd6hhLdjw8lYgV+iLaf1asBbT4ly2ikMezrQMum6KKRWXU0QhER5IJCDZ81BpenR
 rOIiULJEC/CbFunPen6MSvZITdRSt3Bc/nUo/gBi93QKuItUy3vSFYagOge0wvrXc+BjdmdqiUA
 QWNEqOfvApVq8i48OYT0myFElFIVT34TmS34Sj00U6Ku7LPSBHFgjYSsAIwnsQCh3Vj9AlgxsT/
 p2cnyrD8q0yTrJCllhCcKOXi1
X-Received: by 2002:a05:620a:1b89:b0:7c5:61b2:b95 with SMTP id
 af79cd13be357-7c960718fc7mr297360785a.30.1745574717633; 
 Fri, 25 Apr 2025 02:51:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1K1UfbQvYJ/2ntuq2gxMNlOns2PWPFkI+8B4IXD4Piapymb4QRyfV5nubnNlzDop1tGHtKg==
X-Received: by 2002:a05:620a:1b89:b0:7c5:61b2:b95 with SMTP id
 af79cd13be357-7c960718fc7mr297359185a.30.1745574717192; 
 Fri, 25 Apr 2025 02:51:57 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54e7ccb7c99sm539164e87.218.2025.04.25.02.51.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Apr 2025 02:51:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 12:51:51 +0300
Subject: [PATCH v4 1/7] dt-bindings: display: msm: mdp4: add LCDC clock and
 PLL source
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-fd-mdp4-lvds-v4-1-6b212160b44c@oss.qualcomm.com>
References: <20250425-fd-mdp4-lvds-v4-0-6b212160b44c@oss.qualcomm.com>
In-Reply-To: <20250425-fd-mdp4-lvds-v4-0-6b212160b44c@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1289;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=nAUeCQaacPy4eDcat81zyQ4FPPYgERyNRUqIhBqqdZk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoC1s5vnKr+pjxAmRELwP3wO3coSSw4Fwr5Bgan
 5WBhmwLHDeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAtbOQAKCRCLPIo+Aiko
 1Q1IB/41yuLT8WBukhCIEw4AaTeuj59DAP+dWh0vz9m1X2dqGBV0YSaqkaY9lqWqJLOQw3qA6D9
 pJXpJ0Hy1H08gNLagSGomLL8ytcz7pK7yUS/hNq6XPbcH6ihYsXgCXOeCfCUTEKLBE0qJrrHCn0
 l0Qak+gEmDNOl98mXcb3p7nGyIOUmOX9u7LnnhgDtUwWYwVgs0lW1sSGyAB7/OGBJ+1fM6M6WV5
 MbsNDg3BOJf4Rf1bn6JiyibAFxU5QDGBtkSlZzev1OKNn/6ftFNCGRpGChPMYCSVbPT7lPjq89U
 m/iEJQWCzd+lx639KNn/vAN+J4R9Nfw76nOaQPt72EzzAmuL
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDA3MSBTYWx0ZWRfX9JfGKqi4KMJt
 Z2uMOhSe13F2LNV0uYgTYxuRzk9yij1DBOtqb9B31V6ZPk+sbax3bppyn7/a8jrtYZCaBBQZfu/
 sDYacW5uPZIe5+KS6rpUX4S9wMoBN8o+abKtFk4NUORtBmLQWqdgGqrQO7dAyCVkwU165+jkfc2
 rqvj9aibrpeU1SIOAEfuQUysehbpcpN69ku6iZEnzLeRyzMmH2urx6FLqWKBWt1i+/xu8DcDjYc
 Durvx7MOSAkoMjiwojIiUAid83P7VMKfMR9w4cOzwqENJYR5prHJTjlxeSh2j9gVkwacEIf+8Y+
 z3bkFtqsZHjV9v4IBTqTkzoCb9Ph+lTCfo9waoRqJJEKYV8hLqmdcFcEI4mL8bVJ3LBSVbiVsYH
 qScDlLWko9gbvbBz4ClOvkhhZTsKDkCWDU1m5KLvjsux+WOe5VQMzx3dhC/U/pxG0YGPYf7X
X-Proofpoint-GUID: UkBEjN4oKC4CJQWoGnom8T7uU439m1su
X-Authority-Analysis: v=2.4 cv=B/S50PtM c=1 sm=1 tr=0 ts=680b5b3e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=JZA2oeZeEnBWUIejbVIA:9
 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: UkBEjN4oKC4CJQWoGnom8T7uU439m1su
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999
 lowpriorityscore=0 bulkscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250071
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

Add the LCDC / LVDS clock input and the XO used to drive internal LVDS
PLL to MDP4 controller bindings. The controller also provides LVDS PHY
PLL, so add optional #clock-cells to the device.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/mdp4.yaml | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/mdp4.yaml b/Documentation/devicetree/bindings/display/msm/mdp4.yaml
index 35204a2875795e2c1f7582c8fab227f8a9107ed9..03ee09faa335f332259b64a42eefa3ec199b8e03 100644
--- a/Documentation/devicetree/bindings/display/msm/mdp4.yaml
+++ b/Documentation/devicetree/bindings/display/msm/mdp4.yaml
@@ -18,9 +18,10 @@ properties:
 
   clocks:
     minItems: 6
-    maxItems: 6
+    maxItems: 8
 
   clock-names:
+    minItems: 6
     items:
       - const: core_clk
       - const: iface_clk
@@ -28,6 +29,12 @@ properties:
       - const: lut_clk
       - const: hdmi_clk
       - const: tv_clk
+      - const: lcdc_clk
+      - const: pxo
+        description: XO used to drive the internal LVDS PLL
+
+  '#clock-cells':
+    const: 0
 
   reg:
     maxItems: 1

-- 
2.39.5

