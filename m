Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EBF8C68547
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 09:53:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF17310E468;
	Tue, 18 Nov 2025 08:53:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="acW4vh2C";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FmuFb1AP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B06C10E468
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 08:53:54 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AI6P2I9384616
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 08:53:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 NK80NgI1LQ+xDyFsHtTpc6wl2L9uxC1wWhpBghxroMY=; b=acW4vh2C0OBfNK+0
 49zxa4PHlVX/A2qjaLVG/Ltde/DKv2Q8gYXmRe9mSmhL0WU44TeCRR+t1HZ3dSPg
 goarJ/7XHxjsCkDNpR4SmgxNJQwfRey9hFcQDQYG36ZVeNWSjsS4nxCstUQGGx7g
 WD+MbDEcOsXqJ9PUZfbZC2orkJqCu1oyF3hDhP8+qy+ocrDF1zck813KYG3sTxOD
 yqB8MTSbwq/TYvVvePacP2UB1gHNek3BIpXm1o2dJdx0OtuX3Oa5Y6ACWSu+4RZA
 uDZztcrI2M+P8rojhfCjits1PxtYkU+qcJau3x4/m7VGHFlz9Jg9UIxFG+HH0lkM
 qTF1nA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agag8ht7k-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 08:53:53 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-297ddb3c707so47889455ad.2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 00:53:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763456033; x=1764060833;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=NK80NgI1LQ+xDyFsHtTpc6wl2L9uxC1wWhpBghxroMY=;
 b=FmuFb1APuz2uJNlDWbKnDEEQpf3Z2EfBM+ayyp5tnhqvOhMlvMXnkQKusyKr9k0Qui
 vIRZhQ3/UA+3hhk15teloQ/TBgEfPIz2yAhGSdJTdki4uLv7oRUgrEJ52l92yDrqzRlr
 fsk2F2RTsiI6+707OLHupOdww6pyipv23c2y7lmFQRmiGJcgAZWYkSgqJShAUwyu/uga
 1OCtTf0vGU0TmFWbpw93MpN66o4+oZO0cIJGzKQ4GPFYNu2ol31+PN7Wb3cvhT6o+Hoi
 92P/fvw7qsrANIBJ2hkmSCXA96PfzPZzPIF71euvSQb3yPzdJ360/sMD0L1dSGYlFlK3
 unHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763456033; x=1764060833;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=NK80NgI1LQ+xDyFsHtTpc6wl2L9uxC1wWhpBghxroMY=;
 b=MeuTv5l0wYhjLLAOOoNSc9Tts3PjrrqoKRwt78qAO0V3UY0tNLKNZ1t13YyCYEWljv
 LrmI5W3EB6IAlB8XW6xYHgtp9QawWjtIAj6D4PYQW8m/aGQbt6OCPnI6U2Idp46VU1uW
 vqiSiZK66TZeHbp+QAol56Na553yl6AJc52eziVIqjHq2DTD2zhPtaGfZ+Qb1TqMrsro
 JqzsPkFmqGYkC9i+5P1JwC2rCtg8EKVd5FsIl7nMHieAmQjC09Mg3C04owB6WQ4EHADH
 5IQJMoqwqXHMOVh3V0JGaa1GKlBLZhwI6CZAE0xlbhLkIEs5ATABGQoHTJil5MU6WVy4
 27iA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYnCMjd6KVebRXd1bqjBmX7qTAy6rk51LoS47ytwv/BJesiYYgfqLncd03N/CPuEjmdDAOIh/N96E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzEElTHg1CZSYOWcBZr0OyQnOQVTix0V1cBWGBWfkkOxvHtzXzQ
 fBfQRKLVM1wZEegWaEUqi5jQvG1YrO1HMTf1zKQFQelXlwgvuK0eK5ZtbRp3GTXRYp39CalbflQ
 Dj21Dv8wIhyGhCW3SGWvc9ZUc4WBWo6jmruPWObeev238DY0g/O9MZOeyQEuRl5kszuRZpg0=
X-Gm-Gg: ASbGncsPHpkXnu7P018TJ7z8eIFZeyWrnSy1Ob+fGpeVogm1JKSSganzHu4OrscxnF6
 mIfptdo+dk82rc/Ut/T/ivqPl35RiMf0kD7ItsLmrQoHj26ltRtnU1HJUys1aJZOx06BMhzQ3bp
 lB6iMnL/AWZHrCpLeKzVMWYpnRDjk5IjCW/D9xoQxfQ7+e3ajXgRvPf29+W5qi5Cd2abgINwAQi
 B6c22ZTD+ESbpQtE/73j1nOiUqSS1+ox+suw5imAUbTdYuVku3z5OLUiczMxYvdb/OqHrCCoapm
 1Uv6cXuCGIbbUHAsCmtqQbRI2I2R+74Ud/MDw0LZA8lCOh1/+zGS4M2DInodB/gxgHOHJI0Tv6k
 lFnz6VxJs6bwfdyEtNIp7Vtw=
X-Received: by 2002:a17:903:1a2e:b0:295:f508:9d32 with SMTP id
 d9443c01a7336-2986a733373mr199740025ad.37.1763456032938; 
 Tue, 18 Nov 2025 00:53:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGAYYS70u+Ee2zagd/j5aTO/ulost5I9qswBrR/l8KD04TpBbwpgzQvRoU7wV90gj86EvfwBQ==
X-Received: by 2002:a17:903:1a2e:b0:295:f508:9d32 with SMTP id
 d9443c01a7336-2986a733373mr199739635ad.37.1763456032365; 
 Tue, 18 Nov 2025 00:53:52 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2985c2568c1sm162910695ad.47.2025.11.18.00.53.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Nov 2025 00:53:52 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 14:20:47 +0530
Subject: [PATCH v4 20/22] dt-bindings: display/msm/gmu: Add Adreno 840 GMU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-kaana-gpu-support-v4-20-86eeb8e93fb6@oss.qualcomm.com>
References: <20251118-kaana-gpu-support-v4-0-86eeb8e93fb6@oss.qualcomm.com>
In-Reply-To: <20251118-kaana-gpu-support-v4-0-86eeb8e93fb6@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Marek <jonathan@marek.ca>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Connor Abbott <cwabbott0@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763455868; l=1792;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=NcxT59isJ8a73ABBo5632Wjovo4V8SjmsWcRhDa2gQw=;
 b=j7F8HzU/j38mbjoyk5aE6lcoDgwRxl8yKHoa/I9iVW6SXOUfEtgqkULnZ3q2RFEcVTcBHYZqN
 5H9tDBA4YdZBkuxB8GVxkab8xAf7MHBF8hHFiFj7sxlD9y89W4liF17
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: VNz_LGGMFNwDFU1VJb3pk-RKtLBbICyi
X-Proofpoint-ORIG-GUID: VNz_LGGMFNwDFU1VJb3pk-RKtLBbICyi
X-Authority-Analysis: v=2.4 cv=G6sR0tk5 c=1 sm=1 tr=0 ts=691c3422 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=e8idWDajkKX97RI96f4A:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA2OSBTYWx0ZWRfX1YNFM2wV9zaz
 9tRSO9naP/0g4tJkixJFR0iDBTRal6rKYz1pfke9Jvq4/MGq9cqDpyHmQm+cyABfPeneV2W3Imi
 UrG6cqm6NeuR9SI4EM6IVqYb6tCA8R0IJVyPQPzrP2wnC1WobGG4lPtrQzjy1Fca/4w5cRLYsMy
 fovBzNU18SFhKnsAAEoWlglfUUvnqwY2uSgtL31XunYQfBlHKYnwfVwYshURLLGesQPGRDgwb1S
 YT2Z91mulPXfLOk0foobqiSwRJPb4XOYEtO98GayDmKSuc2Ap9EXdS98S5wjzOV1IsyA+YZZUhl
 AzFnuE+9TbHG8IQmrAKuRM6h5AuMiQ2Utob6KwlxvRPkXeYXIe4aydVnOaia89Tu+IvZEJhFQ3b
 vdleucwWdpustyFpZHkWmsJnXdRa4g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511180069
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

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/gmu.yaml       | 30 +++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/gmu.yaml
index afc187935744..2ef8fd7e9f52 100644
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

