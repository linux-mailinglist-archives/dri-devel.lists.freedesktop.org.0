Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF10AD0DD5
	for <lists+dri-devel@lfdr.de>; Sat,  7 Jun 2025 16:15:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3ADE10E3B6;
	Sat,  7 Jun 2025 14:15:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="jZGHI5nL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62AF710E3B6
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Jun 2025 14:15:50 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 557DS4v8002106
 for <dri-devel@lists.freedesktop.org>; Sat, 7 Jun 2025 14:15:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 e2nJaAzmCmJpQHSs08XFmrbpQ14EhvsPNPiNTSQUelY=; b=jZGHI5nLZI5hGMaR
 gCxGHxaLP5Y1D1HwZx4aiDNjMae6QwfLi6XgAto57v8VLKsrSKKy9SoH8h5Oktao
 fp6lEIqMepF7jpd7hthOuLbX/BdQsJPvrWBsIfuoAFj9K8TfmuS9jqL8QGNBqqXK
 l0EPCW59iAYf0tYwu5HUujjbGDVLK1dS70Dq2Abw8lArFp2/kfQbYsLX4x94tOmx
 a5u+RAeupT5VKJ4c8/aYfvTMJI6sK3bhWoukt91F2ncPswKdDCYdptPU4Bx2aa+T
 VW3W1AeJsWzU6e6CgZv211VygoZ1F5EzRbb8yQOlW6qfvfvIfJtY1tZYej1dZU0U
 pkg75w==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474eqc8k26-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Jun 2025 14:15:49 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-235c897d378so28424245ad.1
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Jun 2025 07:15:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749305749; x=1749910549;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e2nJaAzmCmJpQHSs08XFmrbpQ14EhvsPNPiNTSQUelY=;
 b=qAiFPRGTe2DEFrIH0FwJpkMKIROyInfgvKvvvX85DAeq5EYmyRek+RY9YP2VO6Dr6B
 gTqGLenoCoqetbLZrzcWq83jXXWl4uYbF8QrAwX6XcM4T7AvtM/8NTY6dJZF3Ih5jo2F
 fKT3m9/2feGb2K+/Uj7/R5bL0OY84WjtmJxvU0mJwsr4QFJXxvTyVlsV2l7ZXvRH8sxC
 ONXzlwL9g9JEsbLw1qhfi6BvGc8sETuekSxSSa+O53M6FN1QGjlTa4czfyPEpyjV+Rnw
 OnkkdNDWsKcXtc0CElso9h9BFr4D4WuYuIw1I2f93Y2uzI+YEmxkTYUTHZMyOW9igFdf
 vJ9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVfTvbZegFRnEoPYJQju03aY3Zg6undlt0h7uLlMaf3Hgu7nsWVpH/fGOaXNvE8/NSK/lMrK7yG6xI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwnwY777KZ2F07RbodcWfqgU7dD3En1lkRukgA6lWgWufdKwYiC
 l3vK1QX9qxmCvyX2e7qTCjHaNXTIg8ZndKd7swjSApXL5SrqtI23jhX1IJn9RApijbEzcGxCY2y
 xraTcLTCc+YyFaXrO/3Aw3Y9i1FVXTqX3eysfH4CWw4Vc9PosH0QTnOqNg7pjM+tY8Vamor8=
X-Gm-Gg: ASbGncs78JMvLiXv3PWAZbI/Cr9+hlICOfiNp8IJjSvMOKqnGR3X3VhigYj9jlMj5o5
 MGbcZnwZHitfxvVtL8hCuLsrqYP33AXfM9hZtieq3laG74ojqHTclglULzQAtxHQdsTx+cxKlq2
 hF7tX3pQsJmR5gaXu9CetPNK5z6bnoIZBkCgLm75SXHRisBKjekF/2LqP75HXk6gD+SHTIBLGFN
 7hK4pjTtLm/yrucAenZhH86DtAtV7CxS7j41ksSFyVnK+ayGGn6ybEKRxpobloIgO+c6PLYkcX9
 NI4WK0OvTDy8WApqgzmkFw==
X-Received: by 2002:a17:902:da8c:b0:234:d7b2:2aa9 with SMTP id
 d9443c01a7336-23601e7f4eamr98882105ad.29.1749305748832; 
 Sat, 07 Jun 2025 07:15:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGHd4AhO0+uyFenbxz5BoU1UkltM+5rAvhX1ayslAlVrN/dKMNnxfksMZHw0Th/YAjYimUSGQ==
X-Received: by 2002:a17:902:da8c:b0:234:d7b2:2aa9 with SMTP id
 d9443c01a7336-23601e7f4eamr98881805ad.29.1749305748452; 
 Sat, 07 Jun 2025 07:15:48 -0700 (PDT)
Received: from [10.213.111.143] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23603405732sm27500435ad.155.2025.06.07.07.15.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Jun 2025 07:15:48 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sat, 07 Jun 2025 19:44:59 +0530
Subject: [PATCH 1/3] arm64: defconfig: Enable X1P42100_GPUCC driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250607-x1p-adreno-v1-1-a8ea80f3b18b@oss.qualcomm.com>
References: <20250607-x1p-adreno-v1-0-a8ea80f3b18b@oss.qualcomm.com>
In-Reply-To: <20250607-x1p-adreno-v1-0-a8ea80f3b18b@oss.qualcomm.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749305735; l=768;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=IqnVoqmB8d59JEJdsGY4n78aKgioKIUNfsYGLkBpCCY=;
 b=orMoZgj6M4ufoVDkueL+fO7/LhI5JIhY3qZdqVDmIqEE50/Kj3kw5xT+6x+14Co9K5qyeq0t5
 mqNkL9pGnTGCbInzyOTHDsuUrJiX9j4N5pxuICrEcKGcCO12weAfn8F
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA3MDEwMiBTYWx0ZWRfX1ltDFZiXvhzs
 uWGY2gAY1/l7MyjKbEhYbOuyd0lM2Jy+PweNlEx9f04Heu1m34xricmRqubg34psJ+RkHCiW4MU
 RxnVKVrxpk157OuRQhkUfQX14xcLFzRRtxNhSC9fQbhACpDITrJ7qEW6wTvA+zjxsSWsAtNP7Jb
 zBwrsZ9COTwbNde9sJuJnMviL69YC0CdvSjl5yY2WsMAUBWGYuLFQjN6DRpUblKfkGLOujfWubB
 sqlMrRpbz+W8IUWJNoqNVkKk0Jo+I3oWimhpy3uTXPkI4z3RdvuYg26H6+8VpilDPYeqqvoH5Nn
 u2HUem8kcSHHa0KSWJOidpt/Wiz+pUDsd5G2xfhbaU4o9KT4Iva82W3W4bh8bCWEkYlu8CKPDjA
 6UGq5sI4wmLabQFx6LRfPzHSlXe3DtuAibeo3alZ6XQo1s9unXxK2zvzurlJqksOe59MWk+z
X-Authority-Analysis: v=2.4 cv=Q7TS452a c=1 sm=1 tr=0 ts=68444995 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=1cELwbfB7FenbO21xW0A:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: G2KJdIE1OXebucT3ZtlzsOI0jFK3oE7w
X-Proofpoint-ORIG-GUID: G2KJdIE1OXebucT3ZtlzsOI0jFK3oE7w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-07_06,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 mlxscore=0 spamscore=0 mlxlogscore=669
 bulkscore=0 clxscore=1011 lowpriorityscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506070102
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

In order to enable GPU support in Snapdragon X1P42100
(8 CPU core version), enable X1P42100 GPUCC driver as a module.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 62d3c87858e1817bac291780dff3823dacd72510..9cc473fd0d3308f7869d00425e17b114c87093b2 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1350,6 +1350,7 @@ CONFIG_CLK_X1E80100_CAMCC=m
 CONFIG_CLK_X1E80100_DISPCC=m
 CONFIG_CLK_X1E80100_GCC=y
 CONFIG_CLK_X1E80100_GPUCC=m
+CONFIG_CLK_X1P42100_GPUCC=m
 CONFIG_CLK_X1E80100_TCSRCC=y
 CONFIG_CLK_QCM2290_GPUCC=m
 CONFIG_QCOM_A53PLL=y

-- 
2.48.1

