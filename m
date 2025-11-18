Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87CCDC6853C
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 09:53:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FC5910E457;
	Tue, 18 Nov 2025 08:53:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="LkM0/TTx";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ged1UiZT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77C5C10E466
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 08:53:46 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AI3Aq7n027471
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 08:53:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 kg6FTa4q14ZNGOkUdnGlMucEYQPn2MtoqjU3mnf1uE8=; b=LkM0/TTxA6iBg2bp
 caqvCVp4AjAO+m5Yu2BZAMmr8BO7QlZoBeEw+Hflflo3pG/0iBP8C5s7vXjiKk/J
 R1bCYLuvJ+V0DganVweVFB1qcAgnVXA9Pwdxx0yCBQ910NYtuU8EC/84LxjkRDqf
 Tp+xO9z2tVUlzVQnxkTCQPKpHDSOxn9VWHG51GYoEgNO9qWgcrEQ4WBccmf4G549
 78m6z0UOZQMO8T8JtxWZ3PW3bBT7NFb8bITNhHSxJZcKoqCjbauPNME+rgRUF8Hx
 ktK3Q+oRU6eDq/rReA3pk/NEMoIPjmI/Nb56Hr3LnPAy7Rx/o0jKpVmuwJjiNigZ
 QCoHig==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag77t2ep4-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 08:53:46 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-29806c42760so191517715ad.2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 00:53:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763456025; x=1764060825;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=kg6FTa4q14ZNGOkUdnGlMucEYQPn2MtoqjU3mnf1uE8=;
 b=ged1UiZTX/rBVcEmJTcdfoMlK/t1cWX75fWRaMR/pZS0xfEY3SJ0AchzTvyneuPbG9
 7HFFxdKvaXcN4I9+cFtiFth5otMR9rb37HYTqXnCajjESg4OrwWnMNcxz285pMq0kQWR
 vaUlhtC+RMKNKIYZ8ti+/nOl9yR5E+NhnEuozZGYqHHqtbqiIbI9+MmSmQ6ctTorMQqh
 /FSWqmjgqpuLLRQ7J66Wh57YXcY3W4DhqJV6p/cm+geWqbKL5mhVNuzoEBZ3kZgnw6+Q
 qrT4K7uJR/PEngeLlMsDgUAWvcedpG9igsudG8s7kGheTB7e6n4wF77W5dCL8ZZ3VD5y
 BQhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763456025; x=1764060825;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=kg6FTa4q14ZNGOkUdnGlMucEYQPn2MtoqjU3mnf1uE8=;
 b=HlKm2wzqWpxkiTSy77QIqywy+ljFgcHEquSBZEXi2u21ulggjkQ9vK6t2Bue6YCsb4
 0r2ygrxZzSyudB4ni+vRYO1leRzOp6egCNZyyle2rfZqCu6hWxDXvjCYu47gNimmZUXP
 vZKisEZF0RFuU2lhBT3qqpuymj70I4X6lk4AcEA9bJ6GUPW4XwT28KSOGSu/a2BDN9+k
 7o7O02zbLWtMmS6aO6v59ZmW2WCeChZ6v3Np6aw5SH2OOfPX0molSeXwKZqW5cSbr0U5
 L1TDFMakUiCkwJAhHoxcWrq5kQZ0msDf1IjWSI6Oi9MvrJ8YsxSL0vy0LNxDwmkgUmsL
 2ilw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1HGYbBbOjugpojU57OkDCtlysGSufx3T3e/RaATv46XTnZABlohv/sZuDPgs7kX49DxX+tYk/OTY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzQxFxkK8/ZY3acsPZMJhZD8wjOrEwAWcTSQ4tp1z2b8jBOIIYM
 Pi9mvZLH6BnmF9ucr5SVnkQViB7wE4kp75QGFMuWKQ3Ga6/rj35O1QDOwPvIqOC1u9Vvp5ogVST
 6/f2ihtOxramHtdr+/EVX+t1g8/T7NO7NX2sUEJVq2Tn4b44GjVRxYSBBN09rZ/zgv01Gtv4=
X-Gm-Gg: ASbGnctQJLhWeO7yd7338Q4KaNm2d8nnWzNSwIJZM0QqEZ4uKbhxEF1aIPiUC+usLjU
 PlxGq3kCMg9SC+wcJ+4Rk8q4g8KjJhCndnv5ONBJzB5w7DS3TaWv69VO1swqs3drlUlUgd53TwY
 LJ44yKDg/2zR0sREY2tcZ6dYpxTQ7yvcW4cpSpC7pu3CtqIf66wD8N3vRvKulcdPA8Mw8VOhaq5
 mmuKj6YYMaN6NjOs0KG3x7ttyPPWFr5AxrQEyCk8olkMXNvohGPnhNNnoLoSP7JiQ25v1q53Qm1
 CK8nwMB2il/3dljBFXta+tur0BWxeAbasliQ/uT+qziCH7YfELwcGZBcRl8GLmt2epjhD0e9Pex
 Fah+IuexNYb6pLehGTca1xTA=
X-Received: by 2002:a17:902:e84c:b0:295:9e4e:4092 with SMTP id
 d9443c01a7336-2986a76b624mr185293515ad.56.1763456025376; 
 Tue, 18 Nov 2025 00:53:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHJLx55VIEQR1X1kdhaTupHT64CD5j1PJ74J97Jx8OWItPIbJf1c2CruPdv9q63aQsbVJdMRA==
X-Received: by 2002:a17:902:e84c:b0:295:9e4e:4092 with SMTP id
 d9443c01a7336-2986a76b624mr185293105ad.56.1763456024830; 
 Tue, 18 Nov 2025 00:53:44 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2985c2568c1sm162910695ad.47.2025.11.18.00.53.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Nov 2025 00:53:44 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 14:20:46 +0530
Subject: [PATCH v4 19/22] dt-bindings: arm-smmu: Add Kaanapali and Glymur
 GPU SMMU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-kaana-gpu-support-v4-19-86eeb8e93fb6@oss.qualcomm.com>
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
 devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763455868; l=984;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=b8dhLGeLQCmbMQGCYbMJAVhuNtUDEylRDp1y1629j4w=;
 b=jOmgC3U/mxErhlMr4MADnr67IrIUEIl8TZO8WCrxFy8KxEMIAkZL3bL9elKhtgNJKsYb8oNbp
 LrlluiY4THhC/9gW3BN/csHmcffGEBaqOL6sP0AXVDDO4ygLkT1IjBr
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA2OSBTYWx0ZWRfX5qu+5oZRKdbh
 pXMSDD9k9gAG+GnEdl4rDh0YzLpMbnGkXl6XG7+QpXJ681CzdQ912lrZYplGpPlprcLSHjZLE8B
 /8+ZlvQOBzB4nlVtLv75gdYD8FxKwXoUvRD7ibcjIpUGqTtRUXTbSLR/zurSBbBOwk+Q/TqyIXm
 sdRbqrQivUaKMf9yxuBDz1lI9nrnAtKMIeRV4EJWYmEaNF6IF/L8iFasphHvxcfHahT0/QNG1fB
 nmO9rVWMQSxS/C247NkCMxHwzAkxCvSyh401mnZqTY70veD1SEawkYJxC31CABSgaB/teIrrKjl
 0VqFdSzhcuUlFuKLzJbRl05OcLK44K4eUkjPR0i7Y/HE1XfzojHub/7ai8h+7MjdZYotcg3BBKF
 zT9x9ItG+VknnEa19gxvVmV9S777QA==
X-Authority-Analysis: v=2.4 cv=EPoLElZC c=1 sm=1 tr=0 ts=691c341a cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=nx9Ee08JJy_q_36Bb04A:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: Hpz7XCiP-SmLD3SuEFnDcX6rFMxkeX6R
X-Proofpoint-GUID: Hpz7XCiP-SmLD3SuEFnDcX6rFMxkeX6R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 spamscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
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

Update the devicetree bindings to document the GPU SMMUs present in
Kaanapali and Glymur chipsets.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 89495f094d52..c9efdd1a6d1c 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -89,6 +89,8 @@ properties:
       - description: Qcom Adreno GPUs implementing "qcom,smmu-500" and "arm,mmu-500"
         items:
           - enum:
+              - qcom,glymur-smmu-500
+              - qcom,kaanapali-smmu-500
               - qcom,milos-smmu-500
               - qcom,qcm2290-smmu-500
               - qcom,qcs615-smmu-500

-- 
2.51.0

