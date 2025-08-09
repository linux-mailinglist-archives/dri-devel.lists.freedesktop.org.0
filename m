Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C546B1F38C
	for <lists+dri-devel@lfdr.de>; Sat,  9 Aug 2025 11:16:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB97B10E2A1;
	Sat,  9 Aug 2025 09:16:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="HETUexZq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EE6A10E2B4
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Aug 2025 09:16:29 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5793ULhb003012
 for <dri-devel@lists.freedesktop.org>; Sat, 9 Aug 2025 09:16:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 cxfuy14u1nD4xI/i3c1nKgU2lIEUsDht3WPVHTU7Mno=; b=HETUexZqTVdDOGRP
 RWasJYih7V6A+xvow361DxvLJY+SHqeJbak02pkjsA+kJQtjdMd/18Vgb9uIY4Eb
 TM2viu6jTQEBxrNvN43BLhzGYkq814eQ28TKkQpwhsQvEY2X9M7zw5b1kAqPRWez
 HqNeh+Nd1/8ZSG0EMyHNVNWNV4B7IeGww0yVR4u+VKsfQcg+J7tmEeSaGnPyn2ZY
 NyO7WfeAy9v0eYEA6rI+6QijwHiemy7vPKJFco94VLx2rN93ZffGF6z5Z4x93GKd
 ecNsesXKjUHtln0854kKQyiEfyvLVRuSUh7yV7S4Fd76x+A+tGjiEAXWIfX2A4sE
 2cXlLA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dwb70fp6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 09 Aug 2025 09:16:28 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4b08431923dso67865281cf.0
 for <dri-devel@lists.freedesktop.org>; Sat, 09 Aug 2025 02:16:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754730987; x=1755335787;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cxfuy14u1nD4xI/i3c1nKgU2lIEUsDht3WPVHTU7Mno=;
 b=eo/P/jM6jBcHFIWxysUBf2IhrKJ0CzPNAm68G2jeuoojQHEyGoj0oZm8nel027iG9N
 z2DFDQLhuualZu/bvhllu7z7xaO9n5Cq97aPRmHye8hXzo6+a+04Xw6OrbNB9404pra2
 8Vm2ixo/z/wCCkvdmnAiTODJS7VTqDH9EC5/TfJYYp4aQAkYywjaMR7h5Ceu9PYyITmr
 sUbmvbSQYtt32GSQrsJ49ApdB6l7Wm33BzuHP+La0rBCjEwzqrtxgRq2BbEocp8Og6J7
 tk3OC4d62EougXrxo/hZWwp+Bvr21bOH9agnPE/VfyjeEYs068u+R1B6JnSOa72z7q0g
 CFtg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVoUBgugGadpaL570gHJeS1jNmZTJg30W8clJZGNcjvpa5TM26dEsroL05BJjB3Q03RKeud91phKkM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz9cMre5w9mU05fIQx3PgCPT/xRnkU4smZ9vrV0/PL/SKAH2aK7
 o5MTQnXZG4o77PDYl+cp5ndzsbF0uEViGG2dASGDnNuPUEz6g95de5d/7q4Ep93kLs3ZuGIgj9l
 rP0h5o8XgGgyFCCti6CmAz/Orb1IZjUrXuxFCRXWvl7svtJqtI+AFPkP+SW8ST8jmBTdSNLw=
X-Gm-Gg: ASbGncuEYiV8KKZX3NM9X8UfMGa59M7ObIdmgMzmT4CY9lBXWZgbeJB0WzcTydLM1zx
 zcpOYoR7owD+8IyaDPW86fTqLCc3B2dBgqZwjgfLkqLJlmgZAtBDOYf9+vglvSB8oBE6W3qXCs9
 MJdJJ2CsKKKC8bzt7hTW9fNPjFooDl7a6EHvDyrFT1yPlbQqaENXhvrFrGGZk4YF7CpkiTogEaI
 RXqqAPTEW17FeCQEN2ri8ImTXtnIQNOpg9Eu6ZqQgmdpM4T4nj4y0U2azYSsOi7c+muxKQmBMNu
 ZZMuhG/lkbjcDLhHibKL9Q2lwK+Pi4qsvD6o0C9pFJV8F/qYEaMFfbxhB/kIx7j74x7yOzGmLaz
 4w5Cot10hyjX9umK3p+Tsk6CQYl8g7FU+0jzHbn2nFvp4+WewB8Mp
X-Received: by 2002:ac8:570f:0:b0:4b0:6c7c:a955 with SMTP id
 d75a77b69052e-4b0aedc899emr75036121cf.35.1754730987334; 
 Sat, 09 Aug 2025 02:16:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZvWtm4YlKcaL23W+nUW97ef++KL1gDtBq38oi2j2iC9f5MjRqW8FMjd3aynm+3WxWfkZZ6w==
X-Received: by 2002:ac8:570f:0:b0:4b0:6c7c:a955 with SMTP id
 d75a77b69052e-4b0aedc899emr75035961cf.35.1754730986918; 
 Sat, 09 Aug 2025 02:16:26 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b8898beb4sm3361989e87.30.2025.08.09.02.16.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Aug 2025 02:16:25 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 09 Aug 2025 12:16:16 +0300
Subject: [PATCH v5 2/6] dt-bindings: display/msm: qcom,x1e80100-mdss:
 correct DP addresses
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250809-dp_mst_bindings-v5-2-b185fe574f38@oss.qualcomm.com>
References: <20250809-dp_mst_bindings-v5-0-b185fe574f38@oss.qualcomm.com>
In-Reply-To: <20250809-dp_mst_bindings-v5-0-b185fe574f38@oss.qualcomm.com>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBolxHiy8bk2eyMWBCLg7kj5oWCwhIy6ZQzsXJ5v
 Fg6f80aQbGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaJcR4gAKCRCLPIo+Aiko
 1a9RCACZtDdNaFddD3qCGcB/weJbCYH+yRFlmWQ7lGHxAxSSQjfDYujPMeEaA4yIbucYI0Y4Oup
 NuNyAcq9AMWwDBUYJRiY6KKLIUTrd5tlAT9LV7qF+jAUot8QnbFw8sT3XTJFmaiNx0luXWSVfcj
 tF0NCenZp1Mr3dYPKq7kmLPkDSJb5UJItb11+ZKvjP5ibrZkOUQxKiiUpd7YUyk8vGTQiufx932
 SWyQrYNKRXzcas23G902tyZ5HlLxaM1+CJEWGOake5tBi/fbHlL/z+bl5roh/U3XeP3Fo+ufB/K
 uh9QGEy32Ll4xc1qcDI7fJGvkcynbeIW3T+iKj54CGRaUVh6
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=K6oiHzWI c=1 sm=1 tr=0 ts=689711ec cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=fvGZ3mk3BhhUN7shqj8A:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 9wITMc6Uljx12aYtZruqmwE0SVRcesDM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAxMyBTYWx0ZWRfX18Utdl0Su/Z6
 dLsg2KJV+7iWLzsMbohUde/5EmIIcXQ3g0WqeNiXQgQdhJXR9qMugzf+HmZL2cdjY/1lfIQ/HiB
 PUCp4DseEBggUpT35nt0w5zy52hckGkc+m28XZs8C/6JxNjw8NtYP+PQdS1VyfIIv2BDW4/crfU
 HOXH9mv+iag5ibItvPiG+IiK4VgLrMZ6xlbV/1Cy4QHzbQVb0P+NIU00us74YlFHKwFEaSZY9ra
 Dj6OM27D3T15nqZzs4AaL/sXWPwsp6f82ygnNYxANyMxSxfsceMHipZK9aiHcpoc0AU6CHutObX
 JnN2dvWDEwBrflgMa9sTa/MNXAKxcQi8kU6Ok3sSoovj0KPb6Y3jqUBal/DMzMwIfeDL+F9eeyU
 fIg59YMc
X-Proofpoint-ORIG-GUID: 9wITMc6Uljx12aYtZruqmwE0SVRcesDM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-09_03,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0
 bulkscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508090013
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

