Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC811B1F34C
	for <lists+dri-devel@lfdr.de>; Sat,  9 Aug 2025 10:34:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D93F010E29E;
	Sat,  9 Aug 2025 08:34:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="AD3yxyqu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C0EE10E29E
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Aug 2025 08:34:04 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5794e21u010455
 for <dri-devel@lists.freedesktop.org>; Sat, 9 Aug 2025 08:34:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 cxfuy14u1nD4xI/i3c1nKgU2lIEUsDht3WPVHTU7Mno=; b=AD3yxyquwP1uFabh
 TGxA2LNS+njOoqMl35MUrGXiZ2pCWfcFTjiPji3yNVoOB8E0R5g4CdWYHgT3duWr
 KCkWnTe7dpj21WcFPS4WTK+iSs6cZNCNeSaU4xSwsdcyw3WTITeJjaY32JNQEFlX
 Z/oO3XJMsFCTR0QVwaEo83Itkfbs6UrAaQrY82OVIuivGdBXVy0I85cJh2wtRSaE
 KZDitMxICUKFAjj7Nvs6yAExrVxSy0ndi5P56+vv/VMhsg2bNxuTvs5PaU1KJ48Q
 FPDXFA7t+ziJi8gX5nd4kgwQE2UVbwI2qDR1z3eY0MzITbsjHrfLczKZFcfU7obW
 s5Uuwg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dygm88tg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 09 Aug 2025 08:34:03 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7e7ffcbce34so547881385a.1
 for <dri-devel@lists.freedesktop.org>; Sat, 09 Aug 2025 01:34:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754728442; x=1755333242;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cxfuy14u1nD4xI/i3c1nKgU2lIEUsDht3WPVHTU7Mno=;
 b=cZzI64Y1HZyvCIXYL13iwGL2RJ+y8sP1ubLL9RdrdiPTLlXN/7YMXZeKX4RSEzDfRE
 ker1OPRhF4CU6ZQXQH1dDZJvjfHX/Mn0y6XFaSTzHPtZLyeIoj1nDO7wRXp1jLOkHNvj
 qWQ/Yz50KVn/1hdar50VV0ufKxBKT2HIZyFUjdo8YfGLlxkmof8KO+r/wte2rX3BMisT
 7YZstSOcflW9ZgFLEQ4714zu/cDrESI3Fui0fRR3cg8kj8H6UUv3BFQcogZsHwj1Ld6v
 eo4HnWoFyjZzhubZ5wxnhAkwLcObf0o6pymSu6AZDmVTDssVa7CQFsMdRxAS86dMZeSW
 +M9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUxR09qLHawx98g7iDPo5adv+TIn1Ze+ysh5R3PS9ow1xjXlzBInsHQWeVx277PsWH/zuYYkioIF7c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzYjNYXjwTG49GUurlCmGQEsJ4rPGpOjTTQjzxfKS0OaJNpx6m0
 ZUTs76Bu2+/oUBDKl0YSSQFU0Bg9l6YoToXwjeXNKsVdyYfPTWkW2HzOMKH8FqS697+Uc12BT9P
 1uxvNdSnalJnU5hxLnvHPn5DEzk453OD8S8hfihr6+EWWTuN3c3RRIC0Q2V/1ajp7pLgCRlI=
X-Gm-Gg: ASbGnctHM+W6oJ6UlwJbI9oaXgOmZ42RKVzANFrmgdg10lDekbmbW07dr0Jx4RywVsj
 Gxe5I/uIUV4ZQgSKeIY9kMjDUArF1rEV2XZhR23514ZW6gIEslMpIgh4HIqQgARcH5C3x21tU4M
 onoejahHdCPRe/uJeTwhjJj2SlYhgJoxPhuKZitDOYguz07syaFvvKJyOQN8ygfdN9pm8/GsnLs
 JcjaCPjTNRv6BP6tdgLMG1JeDY8P0X3cJaatLmFflInnyqnuPhzqMJu2jV1CVaPFDZvmtYGuIcG
 Q8UwT8lGl7DUW7irEn9Qis1vZ7ejQgTjIGfCnBsAaBkbQpoVCpbesQ4YfNHSxkhVrdGoSmXygrg
 PgenyEvNhMa9/nqgmqysynYxmQcdW67ZpeoWjwEiGjtwmyyY5a44e
X-Received: by 2002:a05:620a:ac06:b0:7e3:460a:a90 with SMTP id
 af79cd13be357-7e82c6a7bd0mr923015385a.28.1754728442113; 
 Sat, 09 Aug 2025 01:34:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH/n9eSGH3YW6fEMmHip0Qcvr9RZrfIXk0CDWrNNpteBC2vjmKnlIyVvB4nA9KO5IfYmcr80w==
X-Received: by 2002:a05:620a:ac06:b0:7e3:460a:a90 with SMTP id
 af79cd13be357-7e82c6a7bd0mr923012385a.28.1754728441654; 
 Sat, 09 Aug 2025 01:34:01 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b88c99078sm3268166e87.102.2025.08.09.01.34.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Aug 2025 01:34:00 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 09 Aug 2025 11:33:53 +0300
Subject: [PATCH v4 2/6] dt-bindings: display/msm: qcom,x1e80100-mdss:
 correct DP addresses
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250809-dp_mst_bindings-v4-2-bb316e638284@oss.qualcomm.com>
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
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1755;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=NXtQ3bomvI5JzHf8G2204y7/eJt5cmkeL6NKDMpr9gg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBolwf0hkKuweP/CdMP6B7vrf+thq0QX9XqRhZKZ
 NkMwSEJ0uKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaJcH9AAKCRCLPIo+Aiko
 1TPCB/972cV7KvtYTwIYjb8O6Xz+V9IwlaAu7GBJzOX0It0UuUU5jAb3vX17nSDCrJ8xsClvk7U
 lOcaS9r5jm8C3s3LTR2oAjlxxqwE4chNHCAFsZzoNTBNWHJQZItpJSHDOWp+OYzaeNTeNBLLyZg
 4IuGu96fiAoZZTweZF/+sYIhnTgzeDDtHPYusw+eNHxB/LR9mqpFokeGbZSG9gBIJnm+Dvp7uDM
 mNRVSo2wxC3VCLmhkySaogOqgYJFBEs2Hibgp1UxQkZURLndrDB1oPVYduguZZSVB4pGXId0rT5
 ObCu6d8pjRKXmX6qfQe3pX+negO9CjCPIl5OhTuzrL17uSOv
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAzNSBTYWx0ZWRfX+F/B9vuQH9Ok
 Q0ZZRIIdSqB0GFmFvifDwD1lMmhqTHTlV+ol1IjnflOpSDva1Y4n5ECnIFhEQXi3a7LVbjJyv99
 xB4FlBdQwk0VErDLfDropNAp0gIxxzAEEfRLbmOyTogAgng0Wtki58V6zIfUEm9WinW9cAUQ2mx
 n0L3eBT5mRJqL9N4FhBQAjPpOa9V1F++DaekLXAJtDXU5OIjvaQGqFd/G6xqKIWzkMXtORYGEjA
 MAWE001R5/CTGGAGxnlD4PEj/jEw+JUaHDN3M0My0VmnaldYLWuEz8dNeccy+HuTI4MYQGHkr6g
 9i/xKn0Fl9yhil8ZPVQO716MW7p/qZNuPYc3yJz/fjle0nz0CTvwxwfRW7EDgWPll+M71kWPIxP
 vubxTYD3
X-Authority-Analysis: v=2.4 cv=FvMF/3rq c=1 sm=1 tr=0 ts=689707fb cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=fvGZ3mk3BhhUN7shqj8A:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: qNEDSb8ylM_On6-f-IEqonKlfsFWWQ57
X-Proofpoint-ORIG-GUID: qNEDSb8ylM_On6-f-IEqonKlfsFWWQ57
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-09_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 suspectscore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090035
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
2.39.5

