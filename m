Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 054B3AE4627
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jun 2025 16:14:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E14FC10E3CB;
	Mon, 23 Jun 2025 14:14:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="P5YqHr6M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44EF510E3C2
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jun 2025 14:14:27 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N938ZQ015389
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jun 2025 14:14:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 wZMlnY8BYR2NJHtTMgElKXRX8o21D4nyviqYLbRcalE=; b=P5YqHr6MEH8Mx9NB
 /WYUbki4mLK2IqtMi4oqNA8F76ApbOVt9fG/gMv39Td96PfzaXZHfVdcbyi9d8lY
 LgSt97mPI5rvnDUC7a2kyvPIwvkbtm7hbut8Rpji80JQ/IICE4+Zx/aRB2JgzaQC
 WFgZkhvtNq8K18mTI/bW7USM9s+KoGbZ/4x6QHLhyplCc/xdgqAFmUaWckdYAhRz
 +x3u2b/YE9Ub9h8d7p2XmFqR8cstAcXXzZ+mfSVL8FPQZI765U5b8pVaBRSeSjNi
 bYB6XNwbvBfgC2ZUEYGhScDIrDB5K+ko5x85KNIRvJC8zP5XILZTDDp2koJ5PzVM
 sOXn6w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f3xu0vg7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jun 2025 14:14:26 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-235f77f86f6so42281995ad.2
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jun 2025 07:14:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750688065; x=1751292865;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wZMlnY8BYR2NJHtTMgElKXRX8o21D4nyviqYLbRcalE=;
 b=IpzE5qklIWbPEuGySurTWbxTceghZ6PcabjAhXk9tISciWhsLU8QAP0+S9Fm58y+9o
 f9jzL5kUCUgxfYJrUQQQl21SoJq5mxoUaF5p4fgCcnuk8qJMNKvdSngUhnsfvobfgVHW
 QQPgwTiTRSFzt3q0DADMwrVa9NpXyQDer6uGdsgmL56O5OEPJeucnnQrAuBMj56iSeHg
 A9jJt6UTZ7/524YVGO53q09eNqJNUHk8Q4Q1HuBRNNz1QnSBz/SCQeH38cqw7qhVxX3v
 oX85qJd1Q80B9vok3hSYLRC691oUb4/rMjPK9TBxeeqBRmRWC7sIH9gFgOeyjI18Nz9F
 c8og==
X-Forwarded-Encrypted: i=1;
 AJvYcCVRsAkEArDYCsv31gTr4FDiUNREZMdDkrgP5hQkIPJFAkuwB6aHBm+KeHAv4+WmseWvgSNHcg+poBI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwhhUvHYumetqnXQUFAEOOck9Rxxe+7E6DGHOZINZtU0GoZ4Dbl
 ES0XfWrUTffKkXYj/qz5hBFoe5CXBzKvxNOuTPQEd0Cq2rrsViHqJKei8K/IPi+xv/RW3UfYzna
 pXePSLRvqdt8FqYTWvHmI4xj+nP0eOvYoVPobf/KbVH4zRfsOSYxY8/raya3X/RoJL3Xd0Lk=
X-Gm-Gg: ASbGnctzO4SkrLBeSE4kjPB6KXwRaBniecYyeEt1Usvy/d6JC21qJF5XCmsIhSado9X
 huthLW8xBTL9pPARkpfhFDTiD8RUjX8Q0DtnEvQ6BkklWiPnfbtNSHTm2XW5NKMzGkFVu3NSmV+
 Zu1wSodBZR2dTvZrfpHHOlg6zBidQlwkH+9b3jgOXEc+hgswMSHHtqVmQkck4y6eo9yOjvM4lkW
 j5Vs0RV03R1VPZENWAryl2Zc2d4cu2fd+PgVfLcqjam2GFzC1euGZDoMPZncWFQ0XHhC0euuS3G
 +Ep8//US3q28mB7QGWxOUQV75Cbjg82+
X-Received: by 2002:a17:903:2381:b0:235:779:edfd with SMTP id
 d9443c01a7336-237d9aa9e27mr198761105ad.39.1750688065068; 
 Mon, 23 Jun 2025 07:14:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJYwVOtji4ivszfg3dCwr+wwwtTLGvgE3mvwgNUp3nkK1wJ0Yg7CyP113mzC0FYbbRpk6BeA==
X-Received: by 2002:a17:903:2381:b0:235:779:edfd with SMTP id
 d9443c01a7336-237d9aa9e27mr198760425ad.39.1750688064536; 
 Mon, 23 Jun 2025 07:14:24 -0700 (PDT)
Received: from [10.213.111.143] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3159df71c4bsm8112049a91.2.2025.06.23.07.14.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jun 2025 07:14:24 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Mon, 23 Jun 2025 19:42:07 +0530
Subject: [PATCH v4 2/4] arm64: defconfig: Enable X1P42100 GPUCC driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250623-x1p-adreno-v4-2-d2575c839cbb@oss.qualcomm.com>
References: <20250623-x1p-adreno-v4-0-d2575c839cbb@oss.qualcomm.com>
In-Reply-To: <20250623-x1p-adreno-v4-0-d2575c839cbb@oss.qualcomm.com>
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
 Conor Dooley <conor+dt@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
 Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-pm@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750688040; l=799;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=CXzUmqLlLPgJV9fUhlYdmN7WEdQrsY5odxja3TUwO60=;
 b=4uyHJkQisGznH0LxP67gAcDDVSB8DRWaZ/k7WS/BKOKxwSHsZEn2+ComoaYVBYm9FmzCZNeKG
 czEusA45p6KAGXSG+1Cj3wlPTXnM/Xmw3CDRQojl9WKtXxK9jjDoCMb
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA4NCBTYWx0ZWRfX84utaV7NLLqk
 oqG8PNNWTKy1MIiaDOUwThMdJTgr/xGQIF96iS0u8Ywe2t7sLjG7d7koCc4gc+gpZkAP6saKsdN
 026Zc0fU70imBfRNafUDDsFe7TOtfBa5XiOFePMHp12N4StmEIcUZu9y6HKDL8kDvQtWjBbZzkY
 cjiZbSsq1MZReNO/dCf3SErvfcP8lXMDRaG/TBxZUARbwW3BDpedBs2kI1UMji2Nw+FJR+xE5z6
 lLFLAiuyJQPZCwp0au9OWEsf21KqUl17CJpMct+Cvm+gVLUTVlJmzcs8za8tetBu4sEi3KlVBOn
 VaeKuPKzRmiRXzg8sFt//YPTpN8ZI0AAb6dhlLXKa91swWzCLGKeEqKoXyxYVBe0zYRgvuURJ1J
 Rhne53g9C0sWfX9WpB8Au4riCRMt5B/Qe9tsnTkLZDoqfSCFKW2m+Y3ZQNJCISFPrJBoLfK/
X-Authority-Analysis: v=2.4 cv=SvuQ6OO0 c=1 sm=1 tr=0 ts=68596142 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=GAw9eemyJ_aXAIuB88AA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: X44q3CaqWCLHHo3XQNLTfNd3Sv_QDYIw
X-Proofpoint-GUID: X44q3CaqWCLHHo3XQNLTfNd3Sv_QDYIw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-23_04,2025-06-23_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 impostorscore=0 spamscore=0 phishscore=0 adultscore=0 malwarescore=0
 mlxlogscore=576 bulkscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506230084
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

In order to enable GPU support in X1P42100-CRD and other similar
laptops with Snapdragon X1P42100 SoC, enable X1P42100 GPUCC driver
as a module.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 897fc686e6a91b79770639d3eb15beb3ee48ef77..c381ec0f2b73233cb3b4a19a214b69f534b3f519 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1348,6 +1348,7 @@ CONFIG_CLK_X1E80100_DISPCC=m
 CONFIG_CLK_X1E80100_GCC=y
 CONFIG_CLK_X1E80100_GPUCC=m
 CONFIG_CLK_X1E80100_TCSRCC=y
+CONFIG_CLK_X1P42100_GPUCC=m
 CONFIG_CLK_QCM2290_GPUCC=m
 CONFIG_QCOM_A53PLL=y
 CONFIG_QCOM_CLK_APCS_MSM8916=y

-- 
2.48.1

