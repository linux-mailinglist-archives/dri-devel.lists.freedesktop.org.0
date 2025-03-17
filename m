Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64521A65B2B
	for <lists+dri-devel@lfdr.de>; Mon, 17 Mar 2025 18:44:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9435810E27B;
	Mon, 17 Mar 2025 17:44:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pof6fHhQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB53010E144
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 17:44:48 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52HAmeNq018687
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 17:44:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 j5AhBtS2Vmk9tVlC84l/9eOTIRqJEcsajn1eqDXBo5I=; b=Pof6fHhQoFZBhks2
 qKgZwUqsdkZYD1Lbm9OqalOrwX8wgWg/FtIFRRBYaY8AF8qYYYc5QgSWmdPbzRAI
 klwrwWxIbYDV0kkl49pZO1O7McS9SoFyLP6WN9hUVXcJIWy7xP627uFk04PYdqGb
 4lSWPERjrHSBko0eIl4OaE6MeW6HR2HhF9n1n2RKZnjOOPVtNaEqJw11xPfyxQxR
 Jbo+mhuhqRyspkTZ9H1op9kYLkyzWdRB/ha8nqmB75vBO+roc4kdEriW5YgkJvPz
 Znpa1I/O19NihIo5QIEoyKFRV3fxoIEw+LWijju6FfWLWUsJLbypWYJ9FhCGM/Bo
 imsU1g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45d1t4nhs1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 17:44:47 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c0b3cd4cbcso482174585a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 10:44:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742233487; x=1742838287;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=j5AhBtS2Vmk9tVlC84l/9eOTIRqJEcsajn1eqDXBo5I=;
 b=wsDPDCwiwOaXBmDP0Py38VALhMb4EFpNAFKtnVO/YrHx2Xrn3hb/a0IbB3yU3pDqP5
 QO4UvDql2plOUvEojwcKONskUdYWC1aydfnl2WCBjsKqwpRTyqCM/JX55UzFbG9zm4z3
 T6SNyTmlfHiAQ96OrwqaWLQFNRftZWM2DoSpXI67teh8l53ZBP7NDuPpN560Bbc5jpax
 siHhd6S4mck80gZ2tOzuKvR0n5pb3Hwk5nTpo/egKyZYt37XlKKCUwz0zfPeNHyEpV4c
 JZ/tbnWwnE3XWPuP7qmq6k0ZXOBfDthlGt4752VpCQKVA3kJIgr2wVkaBxmDXJTmAP4Z
 EjLg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUajuvdIy2yLMx3k3ny5vz9Hpkxryh6r9xHxqhMXIuSO310bfF4RSvYNEc2XPIEkZsQpplPLrlZrTg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzF7yEWuSO7NcQFKeCXwlY9aEntzuKzjBZrOFGnLlo7cwXnaIKm
 dx38uCCakeCLvxDR6+AVJqm7BtcqWWr2YHhsKhUBRQ57BKJMEqxEVglaSmcOSNFn+1ULg7rq1xh
 I6stc1MFEKtiWjBxkVk08ByfbG5GBKNjF8YlSmAXphE8Ju0Zpjq1AwU/ZSG4CZ0tFAnU=
X-Gm-Gg: ASbGnct6gQPHG1s3mcv7SlaNq+B03kuJ1X5SsVKGtpUG5VDrQCuNbHVf7A3kcGIl0Tn
 oPx+UfSqxwIgf5P/ww+c6cpslpyWLmkMVn1a7sgD3ZoLgdSD+cPUFVFTM6W49pJ+BJ5/3jsfUu5
 g7oGo1PET2zZ1lPLv1ix2DzFItvQH8mo9k4Kjtg13Ack9GaS9ihwqiXBdoHPEZfohdTPDOSO1Zx
 NN6cUJnNkLeYmb55O/DJm1hw8Mxk7GC8myobglF616cat3ijPPKRNp4dUg8R4aJBwH0WxRrscFv
 HmikUSRSwQadoXtGbyhzr2spsMeqVpCLWeWtGxy17iO1n4dW0tCcIhyZmP0yWFr4xnAWNn+fQX3
 0VH5rzcjd74cadMVPEulEFW6/2L4c
X-Received: by 2002:a05:620a:470e:b0:7c5:59a6:bae6 with SMTP id
 af79cd13be357-7c57c73d882mr1684572885a.3.1742233487095; 
 Mon, 17 Mar 2025 10:44:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGBxYIzksBGnChS/AovmHUHeN2e5lmyChYe4xYLbphU3GfTQPEwubfYg38kAyG5wmIS15rzkw==
X-Received: by 2002:a05:620a:470e:b0:7c5:59a6:bae6 with SMTP id
 af79cd13be357-7c57c73d882mr1684569985a.3.1742233486764; 
 Mon, 17 Mar 2025 10:44:46 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30c3f0e9985sm16687121fa.29.2025.03.17.10.44.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Mar 2025 10:44:44 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 17 Mar 2025 19:44:36 +0200
Subject: [PATCH 1/9] dt-bindings: soc: qcom,rpm: add missing
 clock-controller node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250317-fix-nexus-4-v1-1-655c52e2ad97@oss.qualcomm.com>
References: <20250317-fix-nexus-4-v1-0-655c52e2ad97@oss.qualcomm.com>
In-Reply-To: <20250317-fix-nexus-4-v1-0-655c52e2ad97@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Leo Yan <leo.yan@linux.dev>, Kumar Gala <galak@codeaurora.org>,
 Andy Gross <agross@codeaurora.org>,
 "Ivan T. Ivanov" <ivan.ivanov@linaro.org>,
 Andy Gross <andy.gross@linaro.org>, Georgi Djakov <djakov@kernel.org>,
 David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1167;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=8nULrIfJrBwoVzJEZHCD0NA8+LCu25kRS1unw7M1muU=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ/qN+LY9vVJvvG4ptU0UP+XAEbBBkuv81pfWVQtnCtYn8
 HaJzWXqZDRmYWDkYpAVU2TxKWiZGrMpOezDjqn1MINYmUCmMHBxCsBEHvxg/82uqB/ctvpQ4b6c
 83NYnGQkyqb+n36xhzFCP/kYx89ch/jIla4+v5L8ldoUHVIjRSUWB6jk2KQdKnhz7GtObPC67t1
 pVd4/LV39cgs+bDlwYkPxb9ONtmc/dUfda+7bELRWz1wl5c+sjQ/dE9KfbeBcy6V8ujKFl3u5VO
 yCr/d2br7l7ZafaHksyNzDXHy//7MtYv805qnuEffaon9BnEPTQP9uTPyEBpYUwQvffkewHhBkt
 T2rffSG+Bkey8/KdcFiaft3p3ea14rxCcuWc++9zPf0g+Uqt9Osvftfz+oqLj099/XRWYpBnfXL
 P0vJxtvwZre+evbh0lH2mkl75ygb/J13/0Qb/wWDnHu7AA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=VLPdn8PX c=1 sm=1 tr=0 ts=67d85f8f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=-Z_mRg2wFor0aBS9cE8A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: Pq9Pw4IUqoTWiMOxa7BMXJqsHXcTRQEw
X-Proofpoint-GUID: Pq9Pw4IUqoTWiMOxa7BMXJqsHXcTRQEw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-17_07,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=999 impostorscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503170128
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

On Qualcomm platforms in addition to regulators the RPM also provides
clocks via the child clock-controller node. Describe it properly in the
schema.

Fixes: 6b42133d2189 ("dt-bindings: soc: qcom: convert non-smd RPM bindings to dt-schema")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,rpm.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,rpm.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,rpm.yaml
index b00be9e01206d1c61802dee9f9ec777c4b946b7b..10956240df0856a4241d6032d3aff7d447af9ce6 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,rpm.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,rpm.yaml
@@ -46,6 +46,14 @@ properties:
     description:
       Three entries specifying the outgoing ipc bit used for signaling the RPM.
 
+  clock-controller:
+    type: object
+    additionalProperties: true
+    properties:
+      compatible:
+        contains:
+          const: qcom,rpmcc
+
 patternProperties:
   "^regulators(-[01])?$":
     type: object

-- 
2.39.5

