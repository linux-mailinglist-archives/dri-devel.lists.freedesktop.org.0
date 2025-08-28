Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A405B3ADBC
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 00:48:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D009E10EAF9;
	Thu, 28 Aug 2025 22:48:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="KOwXSvHF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE87610EAF9
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 22:48:28 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57SLWwmH014877
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 22:48:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 9CzfHCqMGwSglqPBGTXjDnFh1Uf1qA700EaDFGkGlqQ=; b=KOwXSvHFq3Q+Sk3H
 wqB+Kx1iY6eREtTX+dCys026Z+kuLoItLwF20J+IUUAS+sgKyZuaMlRnv5ChnnsV
 rhhtsM1RYXNDX4PYtVZ9UzD0+fWa/TzwTjszfmmkirPJ1uK/5Bs9o8IZoN+uYQpu
 piCBnyHWj3wzdJa3I3aEg2ftc7b5dfS8Xqz0qvk2Who+gGPpKVMqAKNqoolLjJ9R
 3JVxKLQpHWFBcV5Y1hiSuRFkOutEFWxg7VN8BE3ch8OoUmMTVnhf1eF8B9Nmo5Q7
 xrzEkmwqOy7QALHn41Rn6xYpJj+a32J+uFSlMHsLOVS4hXtsGGcARM07N2CLGwPH
 IzLeXw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48rtpf49px-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 22:48:27 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4b109bccebaso34832111cf.2
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 15:48:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756421307; x=1757026107;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9CzfHCqMGwSglqPBGTXjDnFh1Uf1qA700EaDFGkGlqQ=;
 b=ns5rwLzz7oy4c9Emt+yWQg4yrUp1N7LbuJPRM3wS7NDXFd0VA/adv5FC/nnK91zDEc
 v1b952ROkPWAokD6onH4e5/SbDtrTMIY+iweXJcVsg3digDIAECyhOf2zXoyu4PkIBIN
 /4rYt6AvGLQE+5plFDEBMRZ3IyNcipEsEQ5S6Ev/S/tnIqdGcLq1d6YoJ6sWYE/SqcnD
 CqkiEnSmn6fwboKI3eMZotAvXwKeHZNyMgT527DqhLb0AwtQB+M4zpDm+SXI6ZlhkWcN
 Dl3dkHGpccC8icr5n/e74oBP0e8KW2lAQUYDkXU+cz7rHgZ8rR11g8v5AQMSbZ+fqlzj
 yZ7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWAsiKGg3OZq/D3CDagcdurrR/nV4c0pdOHEO+B4Ak+JYnXxhtT+Tc9uaE1/4t2Yz7R76S86ehp0ik=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxeAbAuxdWDu/ZW8beQm4zKWqELjyVNR9c8LwOp3B7tkjIBebEF
 sc/MZ50XScKBd9nklucYpNC3p7X2VZJwFWoHXwbEH0rymporZMctbFzEBx0wY0Ky4I2eqsVEdIi
 4jOo6UzUwAy6bRsYmYhYvufxRGx1JLXSq8NK+rFD6gwvBZkjQ9zkTxJpe3oLV0aTPL9x3qQw=
X-Gm-Gg: ASbGncvcAzHnfR6O0RoYNNl8uLGZtdNscLJgMIG+QqqBkGY1I+dxHFuA5OG+AsLfA5Z
 V/oQOljuf7PiA8u5Rs7kmxO5AxJwl+5BCk7DzIw7Fp9QH2RmHt4v/kiWS1VhgE0hp0m7XRoGDaR
 MSh/wzNC8oBNmHy6nHMnU5+I9qX36eigSDhM0P54odDIttDxP8hkmFA2OXvfZza94h8RP2S4hqo
 ajikLMXVPiX/2Vycs9I/UVE3TxXXrBV4GYBwfAWu4wjBI0i2J9XytMV0d8sjqncqAu1eNszcXlt
 +aOMEfs/XnJX51hqqI4w0UyOvs98gWV/urXwvCdmWpbPljt5SYpdzOTlh1wR1OIJLwEYyTT5mxb
 hdwKSSk4AqjYXwDgCzV3ACYmZzfPeSVRFIf55Tkci7hsaD0FiJtCX
X-Received: by 2002:a05:622a:1448:b0:4b2:d2e6:65c2 with SMTP id
 d75a77b69052e-4b2d2e668b9mr191806211cf.80.1756421306594; 
 Thu, 28 Aug 2025 15:48:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGCdAdhID476E4FJAsgJd9Dlj9RXcXjRQlt01OfE2NZY0X5oYh9UoxCNApwcv9zL+zVkYW02A==
X-Received: by 2002:a05:622a:1448:b0:4b2:d2e6:65c2 with SMTP id
 d75a77b69052e-4b2d2e668b9mr191806001cf.80.1756421306131; 
 Thu, 28 Aug 2025 15:48:26 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55f678452e1sm143807e87.85.2025.08.28.15.48.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Aug 2025 15:48:24 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 29 Aug 2025 01:48:17 +0300
Subject: [PATCH v7 4/9] dt-bindings: display/msm: qcom,x1e80100-mdss:
 correct DP addresses
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250829-dp_mst_bindings-v7-4-2b268a43917b@oss.qualcomm.com>
References: <20250829-dp_mst_bindings-v7-0-2b268a43917b@oss.qualcomm.com>
In-Reply-To: <20250829-dp_mst_bindings-v7-0-2b268a43917b@oss.qualcomm.com>
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
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1755;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=jGBROFXef1Ek+8wHh+Y3Ci+prYLBgIDZTxGb8ga6KTM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBosNyw/ResXLlslDfwBRdxj/Br6oQIkGV9nwqWN
 G2EP6JxFBmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaLDcsAAKCRCLPIo+Aiko
 1Z2YB/4pMQvDDG5j4PigCLCfVpG/aqvA10fBcLpnjQZin+TrGjbiVbyaanCFF0bOzmLTy9U/XFP
 w0eocswluxidVH3/VuavvWJZPsTJLgvSlLm828Dwuy4iXwi49S/yYtrVv4nzQtIBPWZyO/mjdQC
 cXy9ekuZHQ3gUXTbOZYdV2ceKluEniDwCSwsghhKvmAb7NvwrMwWIu+20OiSKhPc1Erjk5xooNe
 KlHIG7x+yKff2WlskCbxjIbztAiLvGHYRIS2HcVAZOBeXvzaB3UKiFVJZf4ZyVwnEKXT8nLqdVK
 eeKd8mXeg81XaOPvubEnlUKfO2etkVGN+SEXRcuScEUxhT9i
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: MiNearFCHiQL1XmAHnyh4W3OcWaJABiG
X-Proofpoint-ORIG-GUID: MiNearFCHiQL1XmAHnyh4W3OcWaJABiG
X-Authority-Analysis: v=2.4 cv=Hd8UTjE8 c=1 sm=1 tr=0 ts=68b0dcbb cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=fvGZ3mk3BhhUN7shqj8A:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI1MDE0MiBTYWx0ZWRfX1brJFY7WFfI3
 f7SIz0lN6m0BIKhT1XuGO6Cmyr8weIo+jp6Ah9mReqPTCY7g3TbuA8Np2DcH+plLHVAtObcQzQT
 0PuJUDq04E/VgNXh+YK0+W+mrkVZojX3yhX2wLmllquXLgToNf1iCIsG+CbVaepxhPQvUMEC14a
 CGdfi4s0F8z45Q1HBbNuL2X80rfJP24ryLCiEJais796/dsyTXc3NASRA31/aN5ZCqFA0nI01Yz
 9ondjVYP48jPKOdBGAY2UQRC11mO5ox+ZxG+sI0u1MnnX9cpRlUkHZU5D+xtfN0+qXWYBziZGu8
 kH57AycNsAChwLgBYQ5U5ATojyWod4yWFQIuo+JeObk2hBEZ4sYXBUaRSGLzJVDaUFfCNC2L3c4
 DPD+HpqV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508250142
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

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

Fix c&p error and correct example to use 32-bit addressing (as the rest
of the example DT does) instead of 64-bit (as the platform does).  It
got unnoticed before since DP controller node wasn't validated against
DT schema because of the missing compatible.

Fixes: 81de267367d4 ("dt-bindings: display/msm: Document MDSS on X1E80100")
Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml    | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml
index 3b01a0e473332c331be36f7983fb8012652a8412..e35230a864379c195600ff67820d6a39b6f73ef4 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml
@@ -170,11 +170,11 @@ examples:
 
         displayport-controller@ae90000 {
             compatible = "qcom,x1e80100-dp";
-            reg = <0 0xae90000 0 0x200>,
-                  <0 0xae90200 0 0x200>,
-                  <0 0xae90400 0 0x600>,
-                  <0 0xae91000 0 0x400>,
-                  <0 0xae91400 0 0x400>;
+            reg = <0xae90000 0x200>,
+                  <0xae90200 0x200>,
+                  <0xae90400 0x600>,
+                  <0xae91000 0x400>,
+                  <0xae91400 0x400>;
 
             interrupt-parent = <&mdss>;
             interrupts = <12>;

-- 
2.47.2

