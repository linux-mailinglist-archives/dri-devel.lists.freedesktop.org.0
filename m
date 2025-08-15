Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8BEB281BF
	for <lists+dri-devel@lfdr.de>; Fri, 15 Aug 2025 16:30:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B633210E975;
	Fri, 15 Aug 2025 14:30:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="aJYCvFgJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2954F10E96D
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Aug 2025 14:30:42 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57FEIlYo009785
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Aug 2025 14:30:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 9CzfHCqMGwSglqPBGTXjDnFh1Uf1qA700EaDFGkGlqQ=; b=aJYCvFgJ18llElZy
 UoYH1NEgasfGOKpq7t6sIMLByYKibTopr+PrfcUnVZMvkdEFIE3d7guk2cLIV7G4
 Vr83aRMb288cYGJOeI4s6QMLsHS/XCKHlidfE4Z0+Mm2dbNKhmwxWzks7GXJmHc7
 P3nvmCSRKo7NxjoR+Ptk0G3qOZZOaHRU/taFRyT7SJWdZmBBe1DwJfAFFo5Ql01z
 P/PB9vqnPvKnWaXsoNEIPojHwrafEddrHgC9S0wFOE2oyJeeEk4pyYq2rJ1ayJ9n
 wW/90L3ACJvvk7P26rUvHejAfT0u4lR0L2yZfOI0o369nB/YgdYKxalZ4DEsRJLT
 88bd0g==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48gr9rywx3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Aug 2025 14:30:41 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-70ba7aa13dbso10721496d6.1
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Aug 2025 07:30:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755268240; x=1755873040;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9CzfHCqMGwSglqPBGTXjDnFh1Uf1qA700EaDFGkGlqQ=;
 b=WMoFaEwo7D649qoaswgRmHLzpfy1VTykYKS4727421UZSEqj0Pv4opBwLkDg0/Uboo
 PxxwG2VJic1xCaqDGdkIBxi69s90BJDCh14qnPHpw4E1VmnMajG+XmdMf6XSwCEsalL0
 +ybKS3KYsr9mVLx3ovgm9atjVc2wAhcIjsE8CTH+NPiWttMRPLNp1Ld18l9C/aGTD4YR
 97RvxsWyBSGkjKpOS0O1L5pFdF6vXAFweNti6WELJzd6HfwT6qoZYkwQyGgZGuF/BQnU
 hVdsbq6DhnoNdBMFBqR1K/3qBUJWsBODnKdCbn511L7T7AWECM7Dp/TDp7eOaOZDtTOK
 KMdQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4I2rJV6WwJWZ2/MgS0AfE+qA3YGlMQ18yoSqKsTs/HtZ7yfVB+aHJ8ftUnfA3NKXIDCOey9iqKPA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzgSfzOujrdv1TPVM6EV8o0E7m3X7G+UJBVlDsZk8AewOldawPF
 p583AUy1rIYDuoVkiaA2cuDACH13yqgXdufsFVmXdbxvdhM10QwuaIv3pcdYE9wX/dMWz0R200G
 U5iFXrhoZlJZuU7ittnw8Dx8MCDn6d4WOHbpxgIouEPmLf7sD8NKEYvDfrGTBvCYB5S8UKoY=
X-Gm-Gg: ASbGnctBGxhAUwR3ulAvMLssUX81/lmpS7Eu7WpDvIg8yRJgWVEDalnd77vAi+TArAa
 1cUhkdpAvT83Fa64ulqImq5lsuYcILP6YbbTplr9mCCQOPuDFCNd9vOxsyy8LVZIajYZLMsmQHF
 dss28z0/TbM8dZU9gQH0bLcBXuGgnebtg+w5QQJuav9dw9DjHS/dKSiMh5KdXUaIS7UtlleLTeS
 oA2iXM5yxnIelFucYq/CjV6b2hodM2+nqHScj5hIX/9Njln/gsMBvpNmxVk++OI3uChZOd05c6M
 mqMdrNpqNQo4zadUM0XsWwEngWVXnLkckJF1PV6MaNftcHoH8zb3x7/zBDF921dfXOTfT8ojYn2
 c/4o8mh7ZSsTD8ubf66DWNZsX639qRVNj4xU/FkxaRzcldLbi3ids
X-Received: by 2002:a05:6214:d84:b0:706:dee5:fd3a with SMTP id
 6a1803df08f44-70ba7c6fda1mr21010916d6.47.1755268239990; 
 Fri, 15 Aug 2025 07:30:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IESu9wlfWDH7KhI+726PhxhS7B3c8t9B4QgXuWap5FzKvPgEw79c+md6NHYKPbonVOwZ8hFIw==
X-Received: by 2002:a05:6214:d84:b0:706:dee5:fd3a with SMTP id
 6a1803df08f44-70ba7c6fda1mr21010126d6.47.1755268239262; 
 Fri, 15 Aug 2025 07:30:39 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55cef3f358bsm305661e87.110.2025.08.15.07.30.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Aug 2025 07:30:38 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 15 Aug 2025 17:30:29 +0300
Subject: [PATCH v6 2/6] dt-bindings: display/msm: qcom,x1e80100-mdss:
 correct DP addresses
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250815-dp_mst_bindings-v6-2-e715bbbb5386@oss.qualcomm.com>
References: <20250815-dp_mst_bindings-v6-0-e715bbbb5386@oss.qualcomm.com>
In-Reply-To: <20250815-dp_mst_bindings-v6-0-e715bbbb5386@oss.qualcomm.com>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBon0SHDouVFwSMXsubc+sifkSHyNOV0hEn37tkL
 bqSE8McafuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaJ9EhwAKCRCLPIo+Aiko
 1TTxB/4gbz3IsGn9diGtjv2N5oYvAbdCdzHiv3yMsoTJal/i3X9QpJ3Ud66nYST/WdG22kwCghL
 y7bjJZ/Iu9LIOWhO25Qt0NsCoDROQspnDy/3/2+lXYpuuaVdi9bMyTPKR4oZ3nLsUy2B9wemtdS
 /rqpwQbDZCTcqo09i7ylwFNa2qQx66xVy8akja0B2jPMT9uzW/LfADYjGuaK/tUKPaMTZJPE5no
 djBSqP0D2JQ1iAoszmyCEeKWuMGecsRjj0qCXDr2QRkAYYt5x6kIbZM5Mr7DI/MbZgDJgKpyGnJ
 Uq6Eiy3aNNEEqIxG7h9GfNZ2DsGLF+z1g+fqKL+PWmMmV7ok
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEzMDA5NCBTYWx0ZWRfXwSxKSsvNUkW2
 F8P2BI3HkKn4TN7Hzzb1hkmDWdMR8cpwkclhapUG4yqrc4R5HlXgyX3BE93wfPjOifRXqHOY5aT
 ceBBOcqFM6jiFoL75hw/nV3WHcX9ydAxWvQBHxfS3UvUKVRKCgZNKd1MnCY+onEjjwlF0UtqMEP
 ShZUQKqq/Mp2R2bA2XXc7SSukwwuKRgIkGRnKdLmX/0cxKbYELOVXYaILUrRQ841M5DVCRsd++g
 9S08sWGjuTjriSRJfV3bGf7fh95yleJ4Yi3Y5/eHMIXmCTKHj6ivsipZH2vOof/5lY9+npHO4fb
 Ix34l0L51/S0zQE1mlkhQ9ivX4ZaNsAjPHBj4pasFKLw47111lxYJuaB+efoRs3gKRjfg6hYdYs
 C+3YGseS
X-Authority-Analysis: v=2.4 cv=NIrV+16g c=1 sm=1 tr=0 ts=689f4491 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=fvGZ3mk3BhhUN7shqj8A:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 3HW7LucGI1ax9fGBMpdIj929P8XUsMrv
X-Proofpoint-GUID: 3HW7LucGI1ax9fGBMpdIj929P8XUsMrv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-15_05,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 adultscore=0 suspectscore=0
 spamscore=0 malwarescore=0 phishscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508130094
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

