Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1726ABAB8F1
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 07:52:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 690A410E4FF;
	Tue, 30 Sep 2025 05:51:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="lKszC5nL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11EB110E4FC
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 05:51:58 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58U4HhDP016961
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 05:51:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 5Hx2GBX9F7NQ8LRgJrlO3MtzBoxHk2zM9UYRVlbcmb0=; b=lKszC5nLb09MCfFy
 9qAXJATNc91t9z5O/MuQrzYAQKzVp+/ETh9Ycr9nQyCqvTraXNxjiKDJtHN5DVA4
 +8VURNjrpCnDtu6r5iwojX/EfAVmZOBXFO/pg6BjrOnYwTWlrs/1AfvpW2Y5fLQc
 dMiEUiUQ9cVUV5GsDmeVRfNTrvEXpOwzmwUXMfZddzEyzMvhiOmPs6Zgjth7PIRi
 Q8UsR/+X1Zwo7107X7hB+QKZ8YzwctDk5yyVUurjtGjBFSLTAja7EaD4tpiAAqtL
 dT3dgCF87O8G6pmKRvmoA22ke0i/JK7jkXyam2ScMjLbo5H0Z6HfmU1Hgs0Jmi5u
 XBgc7g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e93hfj44-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 05:51:57 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-33428befd39so10660916a91.0
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Sep 2025 22:51:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759211517; x=1759816317;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5Hx2GBX9F7NQ8LRgJrlO3MtzBoxHk2zM9UYRVlbcmb0=;
 b=frxAXu0OjSi2UwQDx/ebOsoSOr8pHw59YvW3oXS7pKZ0Pfp2YIoZAR0ZMCgUabkmO0
 wDsQH/UJ+H4NZ9KCi6f30mReUFHBJRZ3T5YFg+90DgWsNwKmM78UEOBYF1C3vsBw1RfO
 k+yKmDeDI/PPdQs7kIpQ1sruAnNImXdULfhbFTauz/cXi1JW3CPs7e1Dc0ulnwDzF/N4
 MGDnuLs55iNgBeGjs0Wb7mapwvpQAh9aZJlqCYDnPbHTnd6MXlMBNuVwZwc6llMJQLXL
 emVQBnfdJ33YYKozfyryMa/U5LsUUHGNhRqL/cPKRNXTPHqFLldswpXL8IBMdTPsX7X3
 juMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMOLd2dI5HF1WtLWfQ/0m0UI0Kkntq+bKhISBwjtRt4rSWfsjI3ApDCeXW9jfTOFvCBpKyZ5bsl5E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxfVveivLjUNrbjbDX+AljtjaGQx8V1SBwx1dN17jtii+ubxBhl
 w/jqBREMsHwbyzLOXMXRteRrVA7StvyW9UMwVKo5n9dadpd7SuUbyJyqZSp3QH7bWhsm5Uf864S
 GzZQXUdbUDKKXzvSidCsn9xPqdSZRg1Nkzw1WX056P8PQMcQCDvPsexnOIXD8ypa19qu6KHs=
X-Gm-Gg: ASbGnctwoY2bUduymGvH6PahKWHSzTH1dtD3W5H6izaLVtAZ0okAonnfZT+59JdREYO
 DJxgKTKxi7qW95Fh+TN1WzuknZjoA2j4S2t+LH9ADFBDRm2ajGqoUVj/+broCoZQJEUMo4WcNmb
 wN5sXL0uf8BRv3HSsb1m0rnNaWfLF4VsH0cotJOGl0KFFSPY+qbtikBOdVtf5VtVWhcCmkcaY/W
 WA455mTBdkDxNfvyonSuRsfYzyZQFhunXoMGRVEO0/OLm+te9C5QbY8w2yZlos+55qKg+QerQ8A
 zhjbUcdYC3gwRjqTM3Msvt5IDzoyRyjvpUNOXIGyBrSKg+FpJx6A+IpR8iw/aOwnZmZFJw==
X-Received: by 2002:a17:90b:4acc:b0:32b:c9c0:2a11 with SMTP id
 98e67ed59e1d1-3342a257424mr20752764a91.4.1759211516695; 
 Mon, 29 Sep 2025 22:51:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHtRSNc4DK7E+v2shAPlx5lz31OGXX7JSkA3qfyFJ7DSBwKjBFDVh4Ipo5Nf9B3OBI5+WubwA==
X-Received: by 2002:a17:90b:4acc:b0:32b:c9c0:2a11 with SMTP id
 98e67ed59e1d1-3342a257424mr20752741a91.4.1759211516271; 
 Mon, 29 Sep 2025 22:51:56 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3341be23412sm19029779a91.20.2025.09.29.22.51.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Sep 2025 22:51:55 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 30 Sep 2025 11:18:22 +0530
Subject: [PATCH 17/17] dt-bindings: display/msm/gmu: Add Adreno 840 GMU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250930-kaana-gpu-support-v1-17-73530b0700ed@oss.qualcomm.com>
References: <20250930-kaana-gpu-support-v1-0-73530b0700ed@oss.qualcomm.com>
In-Reply-To: <20250930-kaana-gpu-support-v1-0-73530b0700ed@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Marek <jonathan@marek.ca>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759211380; l=1801;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=pH7QzqfVd66CUSD6i7hLasiAtJ31uRcCjsRKu6nI+uU=;
 b=PGjrYLobY/yshGg2rKdYdHx3hBf1rR+pcl0fXzC/zlsE0Q4LT53RJdWXkdzvjlbXr1Lox1Rsg
 V1eBxYAHSsbA85oYuhGvB/V8bDV+FCIysw3mOWm7AUUVLL+RIKg+LcJ
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDA0MSBTYWx0ZWRfX5VqJlT+OQtoy
 5oFNNLHidbFDEg48FgjaeX+a88ydsQxozbDvmqPgm5c2OxS184nxHTbEMMXwIBZsxB8zIHuG2Tt
 Qn5gJbkgjlvsVkSvd3TzcgrNpBHeOiXAHDuDGTcMM9BgkngyGbSpNS4TQdmmXREHLlcgz3biTi0
 FBCrf8mjAiDnIrL4Z30Nd0jiSmgmXQOJkamtY4JlYazFneUgUfHjFX+FGv8rfp6zw4kuWbFZGLI
 od4ASrJUB75tqO7S1hGusQgOB/uUbnhhvCTPwPZrkEXgf7o8VjVEUSRD9vFzJ8m7E4RwZ5UM8G6
 DZ5Ut8N+D0R2iWpdTGDcpt4mpbFZbDsnOA4ERp91gZpko3exc43l6AVFwRHtvCu2fsXp3Gzwrjq
 0xHL23y08F018ZimqP6yOjQlB6ktig==
X-Proofpoint-GUID: htcr6CXwgMp9VHsG2J6ugv4mYXG8un1a
X-Proofpoint-ORIG-GUID: htcr6CXwgMp9VHsG2J6ugv4mYXG8un1a
X-Authority-Analysis: v=2.4 cv=Rfydyltv c=1 sm=1 tr=0 ts=68db6ffd cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=qH2KftFUxmXysmBszocA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_01,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270041
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

Document Adreno 840 GMU in the dt-binding specification.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/gmu.yaml       | 30 +++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/gmu.yaml
index afc1879357440c137cadeb2d9a74ae8459570a25..2ef8fd7e9f529967e28131e1d71a6a6f455c4390 100644
--- a/Documentation/devicetree/bindings/display/msm/gmu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
@@ -21,7 +21,7 @@ properties:
   compatible:
     oneOf:
       - items:
-          - pattern: '^qcom,adreno-gmu-[67][0-9][0-9]\.[0-9]$'
+          - pattern: '^qcom,adreno-gmu-[6-8][0-9][0-9]\.[0-9]$'
           - const: qcom,adreno-gmu
       - items:
           - pattern: '^qcom,adreno-gmu-x[1-9][0-9][0-9]\.[0-9]$'
@@ -299,6 +299,34 @@ allOf:
       required:
         - qcom,qmp
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,adreno-gmu-840.1
+    then:
+      properties:
+        reg:
+          items:
+            - description: Core GMU registers
+        reg-names:
+          items:
+            - const: gmu
+        clocks:
+          items:
+            - description: GPU AHB clock
+            - description: GMU clock
+            - description: GPU CX clock
+            - description: GPU MEMNOC clock
+            - description: GMU HUB clock
+        clock-names:
+          items:
+            - const: ahb
+            - const: gmu
+            - const: cxo
+            - const: memnoc
+            - const: hub
+
   - if:
       properties:
         compatible:

-- 
2.51.0

