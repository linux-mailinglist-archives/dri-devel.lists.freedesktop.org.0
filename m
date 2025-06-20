Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA01AE1457
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jun 2025 08:55:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 588A810EB21;
	Fri, 20 Jun 2025 06:55:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="SeR6SXb1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93E5B10EB1F
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 06:55:28 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55JJjqNX032388
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 06:55:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 UY8Xz4SAGxjtVkpxY96irg9pXQ6T1NS4IVwFIY8UKPA=; b=SeR6SXb1TsEqQHdC
 p4UluYnmYhsk4gwBJmQfy4n+8j4Cz+An4psweTNeUyZJjCsMFcolWfWiW+v6sFgV
 USDgaX5x7wWUCQnz05F8cgU2NwqCz1AhQTX6/arHEx4E9wVFYy5gwiuODz7I7+lz
 piH2xfuojK08ZNCR2N/pkz6AQ0zKJ8MUTNKfVMLSy6RuvNFZbkifc+SYUF9tzkqm
 r+6V+kioif4KO8eNavxIWQtehgMaePypIL4YyHQO8ce3XGB8PH1IlOi8wws1RdBc
 1injVwtI4E9WRE7s7Hm6MaEsO9g7Q+ckCZYVxs/YRLbUe9lmKZPXQ54XH4rjCIIX
 JoEHBg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47928mt7t0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 06:55:27 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-2369dd58602so14370795ad.1
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jun 2025 23:55:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750402507; x=1751007307;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UY8Xz4SAGxjtVkpxY96irg9pXQ6T1NS4IVwFIY8UKPA=;
 b=suhQuxSUR1jWq9/idyD916RcnMfdN0A6cGNf+nVhDUZgmUJ8iMDb4wIpmw//mkaixM
 DT+Rb+WMO0zN4u/bcqey+8BJEgb6Bn/HHGHjeIMbA19qZswhk9fwvvUloVk/ox8g6S88
 f6MeJB5zYx1bZtHzvRyTy2nCSPDgQw9ADvJ7vpkLsSpWpCrBPJ8+p1YU1xrGyYfli4ZB
 m/8jSzWB3+HhwoVLyII/Lx6ePosIvs2P8q267DX/iFL8i6vnP8aWQNlCErYdQtzBS39T
 tsHH92pQgQ4cqW1v38x84Xv3c/UCjJqdWjcrREWmhc1C0jk2wo8YJQIdbuMkc6lVRo9b
 DyfQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXt+n16LT207/VgkEfga/zie74Z3f84YZtseGLbtrh1IOQVAhvOwtCxc965oLyce2ybgdDFTHuCHAw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzm7zz0yUQ+g9V0pJnA4wfR8gvBgX5DVFn5uZ0n/E8zZAsDsLLW
 wBrf1bkKYv6dvGfLr7ukPe5k9yx5h9ZL3ziGZwa/7LylJaG6rrGZ5XoIXGbZ7Y0F/Bj0S+OmxAE
 mi65Tx0iW0KIX59N53IjQ4vR788Nc4YSn/SvAHM3eDQsP2JzFBOY/+FvcV372eIoiCN1yAlo=
X-Gm-Gg: ASbGncvJg19nZGOkWUCOvy+GH8W8rS4qOG5WWo3fX7SSUwawoRQE8PnmA+6YFRAkORF
 Utlm9CEm0B7JyV0vXA0ZFGcVKSsIXmsODuJcpctNbDsSF2TUkLUd0gEILxIUqS+O99X9jctiBtj
 fRwp7MZhqnxtr4+dcrm/J/t/qKfFQvfn7eH4TwMgTGaBOfw0HebEhWbMhQUzS2OEUbeHQTcjGiA
 t2oHTvkAHNQjN+8XLiEaNAcW93rrrsfN9Py9Ldnwb/J18G04MDPLs0glPCuAw0uz/ZZqiQKurUy
 vaedlOrO1IFdEGde7Ogf9bl9x9W5X4Ya
X-Received: by 2002:a17:903:2f08:b0:235:efbb:9539 with SMTP id
 d9443c01a7336-237d9906e40mr27772745ad.17.1750402507473; 
 Thu, 19 Jun 2025 23:55:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJ5LpDJJHEcZBAtNAGjCwyfD1eLqoPaVU68U54gQ31anHAn9sWvOPT8dxNj9uXQ8vEOHStmw==
X-Received: by 2002:a17:903:2f08:b0:235:efbb:9539 with SMTP id
 d9443c01a7336-237d9906e40mr27772265ad.17.1750402507104; 
 Thu, 19 Jun 2025 23:55:07 -0700 (PDT)
Received: from [10.213.111.143] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-237d8701c0csm10636185ad.223.2025.06.19.23.55.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jun 2025 23:55:06 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 20 Jun 2025 12:24:29 +0530
Subject: [PATCH v3 2/4] arm64: defconfig: Enable X1P42100 GPUCC driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250620-x1p-adreno-v3-2-56398c078c15@oss.qualcomm.com>
References: <20250620-x1p-adreno-v3-0-56398c078c15@oss.qualcomm.com>
In-Reply-To: <20250620-x1p-adreno-v3-0-56398c078c15@oss.qualcomm.com>
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
 linux-pm@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750402486; l=857;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=1oxyf68EFFylCmMjwV5jb0pfG0MEgVawKDcLqM/rxmo=;
 b=8PF3//AD3gGPG03AcLC4ONVS69EyuqXu0pNc26VvETNgzRpHlRintCMdeMBUfPaRptrZsJlyV
 vJLwgH/Zyh0BgDMciHJYI0hdt2oscEXRCGJBuuNwMM8XQ99xTylLnso
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDA1MSBTYWx0ZWRfXw2XySq6tPfx7
 kyD1P/oedohqZMWG40lFfnUXf9YA1kjCeFTtFC+88fEftYeFVoYGpKWXjLTXSgfkZI+vfzvg1Gg
 h/kaznu4PpWwVUCgxukPAGm196rh5xUZRUoHP7fy3uzv2kFDzKKzvWK17hIdYPUNLSRit2Sw+Sz
 1bdt13YY16irwRPa9ePqVSujQJacv+KGdGXJDKI5PMjksCbLXqZji/gVo7aFg5GPYlFcp9TeBAC
 HlR37VW2gtcO/hAipxI+KFum3Wy3xCErmEn9fWWcuEVajpme3ALysHoMICdYN2s8sDRa0mucAoJ
 J56GgbivCrE06ulRowQAqpDcqKXUtUnUOHqSChxIuaq54KFfOITgJhNhqJOJQbjp4AUCqj6Sn1d
 gKID+wAwti9gL5FwCHz9dKnJIwFyyF9TOD2XpiCplzrXp3IpeNSRV6+d7d/0ZNwo4JZ1mWDY
X-Authority-Analysis: v=2.4 cv=fvbcZE4f c=1 sm=1 tr=0 ts=685505df cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=gxl3bz0cAAAA:8 a=EUspDBNiAAAA:8
 a=GAw9eemyJ_aXAIuB88AA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-GUID: ReGjf2fPlEz9sV6j8gcUIKSt9sNUFy7c
X-Proofpoint-ORIG-GUID: ReGjf2fPlEz9sV6j8gcUIKSt9sNUFy7c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_02,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 mlxlogscore=564 phishscore=0 clxscore=1015 mlxscore=0 impostorscore=0
 adultscore=0 spamscore=0 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506200051
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

Tested-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 897fc686e6a91b79770639d3eb15beb3ee48ef77..ccd03ab5de495498281175a4550bc73d3e65f3f4 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1347,6 +1347,7 @@ CONFIG_CLK_X1E80100_CAMCC=m
 CONFIG_CLK_X1E80100_DISPCC=m
 CONFIG_CLK_X1E80100_GCC=y
 CONFIG_CLK_X1E80100_GPUCC=m
+CONFIG_CLK_X1P42100_GPUCC=m
 CONFIG_CLK_X1E80100_TCSRCC=y
 CONFIG_CLK_QCM2290_GPUCC=m
 CONFIG_QCOM_A53PLL=y

-- 
2.48.1

