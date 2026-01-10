Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 647B2D0DB6E
	for <lists+dri-devel@lfdr.de>; Sat, 10 Jan 2026 20:38:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90E6010E030;
	Sat, 10 Jan 2026 19:38:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q7k0IuTt";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EGj3QzZt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2420810E030
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jan 2026 19:38:00 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60AHmj5O3846540
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jan 2026 19:37:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=Yuz5Lly3tjYhnq/oakT1C1
 zb0K36bzeIIake9asJ7G4=; b=Q7k0IuTt0bgs+1wxYDvIkBRI3uhXRA8Pnf+mMl
 kfjoas8A5lFet0DZ5Gdyq1fP+KTvc+znxbnqheYWYwLTbY166jzO8ByQg7SZW+CG
 z9njqtC87FI9/b57paRf78O9bSIsT0pBICirj2ImuF5szM2NWnw5m5js8Jh7zPSG
 piu8sNp92/XgtCOu26zMDwflIoyW/ZjckQzPU9t2g96M33pMzvJojbjc7ci3ystx
 7zQuenkCCUzDnNzW5kLEA9vL5mskEPasPNHkQ9EBrXPzuJslq9UgiMwNk8PrQStJ
 /cDQG0sdidsvbx8tNel8brs1TnEW+V0ScrkIAcECCKjixihQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkmem0pm2-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jan 2026 19:37:59 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8b22ab98226so1230360685a.2
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jan 2026 11:37:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768073878; x=1768678678;
 darn=lists.freedesktop.org; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Yuz5Lly3tjYhnq/oakT1C1zb0K36bzeIIake9asJ7G4=;
 b=EGj3QzZtIkfsEaldZs1CpAxPV6rlDfJT1FvPnCEENmGv5jL06/YiStXqhb8vitL5Qr
 Lniwhwdd1Q5jYtxsuk5RWB2zuarZ0dTnu6tOGelknoa9ek2P/+5ZY/JoRjA0JeVKJGLr
 bUDn11IvFjyjw6SBW9iLeT5bL+VNz6732iiuJBktVFvw0SNtNNjCJJgQHJIowqQB+Dis
 i/wHXa6Au55c4gu7BeADP69/POVV9Ujr0Ij110WK7DokTn3tmSM1L7V/AIr+cKBUmiZl
 Ewg8kKalP7A6OwDWHxafdcFSLj5I9Mutx0aJMY2o5clLx4p3fIuMZRxaabo/nJTbMSjK
 00pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768073878; x=1768678678;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Yuz5Lly3tjYhnq/oakT1C1zb0K36bzeIIake9asJ7G4=;
 b=RbkRebiOY/NV0RrcbycP0XKpOIvsK/jCdCrIJ5HLwF0W/StVIjV/TK7H9HNteP7lOM
 O4YkEaisND/Y582qr4WhNs1UumRK0ITLCYwvmmcEWuStUOADwrsyOorIzNvPc6ntSSWY
 gQoWEkNsE4fb758oT+C4tCRjPZbYmue5jTpuTwTeXMvSSiuXOMBt5ESpYlO7Y0yySl5Q
 r/oaUGZ/9rq9SeeiEsA7mf8BhymslhMTBxX178k/QhI83Uch0cAE5BWh8zBh/XF73jVC
 aIFGaNxqE0dJRAz/D+9TehSUCiqn0NUndMSPxQEurOasOXT2uK48XCmUtyNPPboaLjCr
 bQ9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqv1Yktvbkc9sYUW+ZQWgulGN1t1zBooxnRui3VdVKD3189KVphII/H2WezqIM/f/KpVGh7xBs0dA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxgP0iVcIzwbKUazmVmo+tIjbtKznd+aYk54ijb/7oOVmEtVLCE
 Tnl/jpKBd3cydxfzxV5Adfa2kp+9tlrvTHDxghkIDpa60azYfZZ7U/fA6a0qqcbnPdWomOkUdHB
 UE4SzmVFbcShqPuBlnSrcmQfsBigRJXKbiK6fFyunbaFRpvdwcN6Q16d1jYyV6aUaRN6l3SA=
X-Gm-Gg: AY/fxX75xkEnMM0qza1tyfZblUz3miijlHL5Pr2J9taOxYo82lrQtniZ9eQaaDTL6Nh
 Qf8RTRAsSgs3D5nO/xlcjMPf96N64j8T9WgCfqg/bKP+WY01+Xw67060o0/sdWVIMOqNDvak94K
 tv4IkgO4gBZZr3rf7bV1CF2o0ikdEZAutKZHpVLOCeAnfnS+mO9F2aic9+O9pqS0nke8fq65AYy
 Lhyw3yH5Dkv+IVdZBk7GqgUMmcaC1+izzsCFZgV0obeK2BTlk3meUVjtjMqiNMFdstBVLx1phUV
 s1OkWSPN7jIno9hxyhUT4HfD3mi3yV/IrTnH0VMBZTBV26HyAjh026k1J60OxPq9f9pA5Zoi5f/
 XkiEt5qHUZNdXIBPI4InNhodCDe/dwvvnPo//OFD/wBZGxXryzR7l8r70sxaZmp1WvNuZTNReXw
 YPedrqMeSbN9j4CEhb/FXo5js=
X-Received: by 2002:a05:620a:2a14:b0:8b2:74e5:b11 with SMTP id
 af79cd13be357-8c389421d1emr1753485085a.82.1768073878422; 
 Sat, 10 Jan 2026 11:37:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH//Jvdv/1iDO7XXudCXmktmxjLEGbaUM5VpCobiCP3qcmln8zrFrWKnWb1Z3o0q5G1d6WtXg==
X-Received: by 2002:a05:620a:2a14:b0:8b2:74e5:b11 with SMTP id
 af79cd13be357-8c389421d1emr1753482085a.82.1768073877982; 
 Sat, 10 Jan 2026 11:37:57 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59b65d0f6absm3539700e87.42.2026.01.10.11.37.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Jan 2026 11:37:57 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 00/11] media: iris: migrate to using global UBWC config
Date: Sat, 10 Jan 2026 21:37:52 +0200
Message-Id: <20260110-iris-ubwc-v1-0-dd70494dcd7b@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJCqYmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQ0MD3cyizGLd0qTyZF0DszQzk+SkJGPDxFQloPqCotS0zAqwWdGxtbU
 ADnX8sFsAAAA=
X-Change-ID: 20260110-iris-ubwc-06f64cbb31ae
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-media@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2204;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=WL3d3CbQkqsT5zxsu4BufhsTO/iq7v3zRTnxS5ulCyQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpYqqSYXXJp+CINOgQyxIC8KNSqNqPLA1uV+wmA
 TBShj2YlOKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWKqkgAKCRCLPIo+Aiko
 1X6xCACQkrwtfDBCLgeJWHdhLUmz7ViXaWlVL0txKsubcrgrqF3essnxA5RKl4ftlpb07gWfkgD
 mxXSxRsuQlaa1gJ/QtpVHdwP4fFZmEZ68pQs/+3TrbYz3ifw9Jze5a3U4yqx3d3xxQgreC4++Gn
 X55d2kJq/5G3Ojqsm+cTR5V8JuWIcECgDWdy78/IkG5vTtUyePREAmTO3H3Hxpv7b0TMzpay6xW
 +NWN/n2lm2avE+UOZNsbuODMTNVWIRHyeMbKiHdQnpm5QzEyHnU/9HfHmNyPubK8hu2wt0FGxue
 bfOCrPiMS2X1QR38X0/pJYtbbi6Lu4Dtmecy3g06bBuaRaNb
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: -W_jtIgpgm7s4iiGSctqzlnQ3CkuwDtb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEwMDE3MyBTYWx0ZWRfX/R4NwcPEUhE7
 RDe0bWOkX9eHyXTDGFhYsGxMvbV8WNey49bEdIN2l2enTKTrUJwLkb4l+mAnNONUpAt8VXLKjZy
 9zmw8443VHmh9rCD9RsbuCSAfIjEJ7BROG72+7sSDQeCTwoSxCEX+O/nFiPFvay0Mn2JrtTKTl2
 G+23VopOU9iJR7MQxZQQHn3OkDduHWM0l+NK72uZLTAoqUdEH6mgtNqeKsKbtbmkkc7+s6pcL6G
 DQYYgRhyTkD3sCkvvPyi//rHwb+YXZUbjMSm6WbE2RXRT5uTTAj32LikSGcc3i/tBvZCUJqXcAf
 wpHYaZtSwkzIXuDcLrZeA8j/a98Zo4XHmjTppOFcBTQIHA3KNKAxiMgF7DaiNK3jEevliJSH61L
 9PKBNCAW+nivGfR7Rk+oPoconCyAy8Xqr8v7ck/UmNidHSSs/8bacXgo78PvQpEAoNaBzPFkA1u
 UURtc5k3hTP/emvbIog==
X-Authority-Analysis: v=2.4 cv=Z7zh3XRA c=1 sm=1 tr=0 ts=6962aa97 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=sotOLrqpNFqtnHaJl_IA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: -W_jtIgpgm7s4iiGSctqzlnQ3CkuwDtb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-10_06,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601100173
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

Having UBWC configuration in the driver is error prone. For example, the
driver specifies fixed values for HBB, while the actual value might
depend on the DDR type. Stop defining UBWC data in the iris driver and
use the global UBWC configuration registry.

Merge strategy: either merge SoC bits directly through the media tree
(with Bjorn's ack) or merge to the media tree through the immutable tag.
The drm patches will follow depending on the way the SoC patches are
merged.

Note: the patches are compile-tested only because of the lack of the
Gen2 hardware at hand.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (11):
      soc: qcom: ubwc: add missing include
      soc: qcom: ubwc: add helper to get min_acc length
      media: iris: retrieve UBWC platform configuration
      media: iris: don't specify min_acc_length in the source code
      media: iris: don't specify highest_bank_bit in the source code
      media: iris: don't specify ubwc_swizzle in the source code
      media: iris: don't specify bank_spreading in the source code
      media: iris: don't specify max_channels in the source code
      media: iris: drop remnants of UBWC configuration
      drm/msm/mdss: use new helper to set min_acc length
      drm/msm/a6xx: use new helper to set min_acc length

 drivers/gpu/drm/msm/adreno/a6xx_gpu.c                   |  5 ++---
 drivers/gpu/drm/msm/msm_mdss.c                          |  6 ++----
 drivers/media/platform/qcom/iris/Kconfig                |  1 +
 drivers/media/platform/qcom/iris/iris_core.h            |  4 ++++
 drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c | 17 ++++++++++-------
 drivers/media/platform/qcom/iris/iris_platform_common.h | 11 -----------
 drivers/media/platform/qcom/iris/iris_platform_gen2.c   | 14 --------------
 drivers/media/platform/qcom/iris/iris_probe.c           |  5 +++++
 include/linux/soc/qcom/ubwc.h                           |  8 ++++++++
 9 files changed, 32 insertions(+), 39 deletions(-)
---
base-commit: fc4e91c639c0af93d63c3d5bc0ee45515dd7504a
change-id: 20260110-iris-ubwc-06f64cbb31ae

Best regards,
-- 
With best wishes
Dmitry

