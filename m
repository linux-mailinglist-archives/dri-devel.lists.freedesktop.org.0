Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 729D3C480A0
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 17:40:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0CF210E491;
	Mon, 10 Nov 2025 16:40:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="mfb5RfcM";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hYqwK1j6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43FD710E491
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 16:40:44 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AACOJ7b2407325
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 16:40:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 NK80NgI1LQ+xDyFsHtTpc6wl2L9uxC1wWhpBghxroMY=; b=mfb5RfcMzuKHoEwN
 bE/7sAthi6igUtT7/JkWPEeev5XN9rHHFoloGCk0VSPlSTJG/dFXReEi9t/AFBwF
 rLZOEj5lM0LS5lQodxix27ElTFsUVSWdWpfmnn0RI2jvTQB1wyMIgul1RZmgYMNX
 9rP9bkQNkRJEz4VpaQgvOBKccWu5MbtL1J8lX2xtbaws10fA2Zng1C49+WajOKC3
 ZghEAo8v/AcssjoShvDRK9kH66nbQ+SZsP4d71kPVOoCbMlwdNpKrQC3jhjDbrRs
 M+y7S8EKKJQTlh7J1QFtJij2Nhtgxngc65a8UVrLyawJGF4EKvPz7jU8rxty20MU
 UvZ+hA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abatd9v1d-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 16:40:43 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-3407734d98bso4203784a91.3
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 08:40:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762792843; x=1763397643;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=NK80NgI1LQ+xDyFsHtTpc6wl2L9uxC1wWhpBghxroMY=;
 b=hYqwK1j6lepCoP/PF60bX6302Iepe6/NYzvVzGkloqWIlxsYMyzDTlgSYm3GfLc+JG
 RG5XITA8hcQ+TSD2qIXRYOghth8PXKCEyCJytbWwtyvQs8hr2/fC5vKlt7i/8Oo7DRqt
 zINyUjWsx7exwxyCfcWR+7UlTiM5n+/btqyzIuw7m3KNY0nhvtGw/E3OtGpCMFNqDdlA
 RVqLCliZaPoQ7ZYhARPwFagEbd5OcinnwIE6v6IJNcqKJ7ZFw/mw3ehl/+9Wk/nZt6f4
 SahUUyIRRG63doHnn4HnQ8pdm+JEsqusq8Yw9NCUNjw9R9uNc7DnFgCX4V198xr95C5L
 DtrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762792843; x=1763397643;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=NK80NgI1LQ+xDyFsHtTpc6wl2L9uxC1wWhpBghxroMY=;
 b=EfuWYRo5G3HT7NZkrc8H5WEDKyvYA17ySkNrPtg3/lpgVho0J1hkydGAE3+t2JJjBA
 NGBVfgIzj2EUHHv1skwMCkMBH/MFIbmnPKZ3fKxiTZ0eB79IdIRQ1zXCUib+rTnei3aX
 O8xr5UjJxsjH0ROuiQh6gO5NR9NVvS75Iyx/hgCMP8opoz0eYJb2YFwDlQOez+pEcPGP
 UiiDpFH5BrYC2NHpOR3jS/6JTl9S8AySAhKQ5zTgRX7jJ0V30Q4Fq1VPLe7DmlCFIVZ7
 Um/nmkqG7IYMsSfjDOgqEvR1Y6MTw7xAdrathx6IPEy6QM8ViWWN7T9DzXAioTyYL4Wg
 UwXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqNCS5FyzCW/qs3ufsLoVXBoIU+JhakcGx89aHkAWiqophFCsV7TT4fUc33kGzran6egxEA8lLiUY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzYcy3gXXp7g52L0SAaE6OVxCOkoasiTqW7dv+7cn8pPqZ9WcNj
 NGGfcXhTMG2PSM78YHfDbgElYBxxr83b53Vb+KrrxmnfQy50zfhkoJHcb0tBFqeq9gpTywlDb2E
 1viiGDi0hOlJVgzhbu5x6Hc0wdRVh5ZYJ4VTbSCYLUfgpMiaScyLFETkozSvnaUmFAlhLj94=
X-Gm-Gg: ASbGncugHkOzR+t6XXshAtgb7atGiYgtIp48dLtTNMRJdkrsmj9GDgph1JO/Wnv+CAj
 JV3YQOuGycCrFFytaPKqapyg03brpedJAmLD9FxEPTCKrbk+lV9TPZ7gDvaTRIrrBbRP8OLkL2J
 MX3qolQnSI2rZYUwFbo55TKSG6RLnw146of1WBc+ePCQ+7S04YzASxOJ636jdTT8YhzPkOL7JId
 i0r0lJspbTC/KjoSE+a0/1w8OpqayW36FBItEwBrZ8kCJ4Phvvg9ToBo5+xjwRUiHcN4PSEdCVL
 D1x4Gscmlqvx7z+zQkxJPmBa6B5d8pSYlY3Khtnbqx123/20nZ3NnLIGDNy/1TSI3gnbP0sHYDU
 FGD0wKMfP1Z6Ap6Y/+UbRlqg=
X-Received: by 2002:a17:90b:3bcb:b0:340:b152:efe7 with SMTP id
 98e67ed59e1d1-3436cb91d57mr10342266a91.11.1762792842926; 
 Mon, 10 Nov 2025 08:40:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHKgiLlV4ge4N7aykjwSwNvV4o0Enwd4Uv2Fhb5/BsT0fXjzUdfmFl0uh16HkMMpYGhsNkY5A==
X-Received: by 2002:a17:90b:3bcb:b0:340:b152:efe7 with SMTP id
 98e67ed59e1d1-3436cb91d57mr10342217a91.11.1762792842430; 
 Mon, 10 Nov 2025 08:40:42 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3434c337b20sm11468922a91.13.2025.11.10.08.40.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Nov 2025 08:40:42 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Mon, 10 Nov 2025 22:07:25 +0530
Subject: [PATCH v2 19/21] dt-bindings: display/msm/gmu: Add Adreno 840 GMU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-kaana-gpu-support-v2-19-bef18acd5e94@oss.qualcomm.com>
References: <20251110-kaana-gpu-support-v2-0-bef18acd5e94@oss.qualcomm.com>
In-Reply-To: <20251110-kaana-gpu-support-v2-0-bef18acd5e94@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762792679; l=1792;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=NcxT59isJ8a73ABBo5632Wjovo4V8SjmsWcRhDa2gQw=;
 b=eQNZUxkw5igOzSHswIKdod1+5/8HKSYuY9+tGDZhsMU72Rcrco55Fm5uE0tPCMdIF2KWAnNZM
 /YOiz8V/KyiDqaG+09P3D1DWGc74RvvkXZCpIovZE2CAEjx+EVlVC6f
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: aDhsU5U6MJFSQwT_nxQaDZhxgm96_Z6b
X-Authority-Analysis: v=2.4 cv=eZowvrEH c=1 sm=1 tr=0 ts=6912158b cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=e8idWDajkKX97RI96f4A:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: aDhsU5U6MJFSQwT_nxQaDZhxgm96_Z6b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDE0MCBTYWx0ZWRfXz6LKk07K840z
 eygYKTRkCIIDwYJ/3qg2rljFl24CYhiWkN/d1xwz5DMaeigGJdLvVfQxhD+G+x2HZjjyvApJA7M
 F9ug4vufrWnBtcNGZ67Zxv2tNwj+58+vd0GkropTolxGdwR3U6fZ9NMu0xXDW7NvnD1N3MgqjQf
 AJQex7ekjRq7fbcpNhv099XMDhK+ISHqF9RwVKUzgdRMa/JzBeDAl/gYJx9XFn6H5RMgBJ3ZXWG
 SWLlPn6/Ed97Ry26lVqnyWmakEZFJnh85HknHjwPPsqJq9BeTU9heNmS8jm0pzJhtHsym61bM6J
 XqZJfU3DVjqJYWidEtYB2ACJK9QZQh8NXYdprKKzbPvB0p7pC1kluaaRRX1B5ajZT30JXXeDLXj
 wyDAC9WfIRhla1SEMsKnxbQKZLCiRQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_06,2025-11-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100140
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

