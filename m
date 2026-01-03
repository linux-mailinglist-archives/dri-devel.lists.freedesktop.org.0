Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21773CF0055
	for <lists+dri-devel@lfdr.de>; Sat, 03 Jan 2026 14:45:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D912F10E193;
	Sat,  3 Jan 2026 13:45:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="DvJXS0m2";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YSyzCQO3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19B9B10E159
 for <dri-devel@lists.freedesktop.org>; Sat,  3 Jan 2026 13:45:10 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 603Cu6wA3468606
 for <dri-devel@lists.freedesktop.org>; Sat, 3 Jan 2026 13:45:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=PVewRUz4/OoxL8WpJ0DLj+
 kQy80dzRVNPuaXhm1lqHA=; b=DvJXS0m2XiaYTT8G+JbUE8FA5ZhWWYEz8W50YC
 tp4ka2YISzc++mU+Dz4ycbCkmNSokXDbmhAgo4/YvDvcEfDwL4N4qYW2p5dqRv1b
 WJrAfQqbItX8Hvv8DmJbUciYvwz/BsvSAf/7XD6FQF2FArsduy0TzgHGcftKdw4q
 h3De2O0oBQjEh9fMRwSbQnkyG8IorpSHh/tIxcvF/Dhyrc7JIoy3E7PYupKmwjfD
 /fK/ilgi9oNLyeTRh1pJB5nMjbK5wy8CEcm/Sy+YxolzKE4SMNbXJnmy890kMdye
 ZeDQSEYnN8yf3ldxxXmdGzzRTdqvHj/ohsZZEYnR666cwGwQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4betefrnwq-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 03 Jan 2026 13:45:08 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-88051c72070so249327206d6.1
 for <dri-devel@lists.freedesktop.org>; Sat, 03 Jan 2026 05:45:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767447908; x=1768052708;
 darn=lists.freedesktop.org; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PVewRUz4/OoxL8WpJ0DLj+kQy80dzRVNPuaXhm1lqHA=;
 b=YSyzCQO3oAjbd3Lot8f95hw46d/+JAByh9VL5VGeJIh33miJuePJx3CM9CnhtPWdyt
 Svd1mLrq6WwJgchR6lAvnyDDcV7pqte391XRTkY+3+SXcbRjL8Ds1IHQjUaafdUQTDKf
 9PdTAVGdmHbCLNqCKX6nIz22szgBOSeu6foNtllUD320o1t4WFP3Zcx5nLhTox9N/stw
 JBArj6V0PKqNcJjcFo9qm7WTUlMkEzo8gaaF0DrHdn0HCRrKYGiZUkZmaJphpLg4ZwbT
 STB7CdksfZtgMvHAvPnaabKFgPL29mLkwAEjbV79tzv8/SrVuPKPcuEQLJFl2gW3lnWV
 /KAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767447908; x=1768052708;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PVewRUz4/OoxL8WpJ0DLj+kQy80dzRVNPuaXhm1lqHA=;
 b=LD/HYQw0sYWn0/i/nVxDgNxD9XiVed8B1u3Qo8gRpLlR+32TkT2dXwuDlK1roXIiMH
 C/zdFXXLE/cqlkBd75f5CzP4teI1F7ERH1ldrssOEsIKnuBMQADpJt61skycZUIRWKhr
 bkpsBz+ep7+0jTESc6WAtBiO/PyhKd8V5xMB0nO8ORNktL2F0Ge7K0c7FC9EvFLi+TZJ
 DYMeQCkOSli2Sw7ZVr2fBx3U+F2NH+7zCoFJAlFXap+/AAEYYgZXD+ADqWiAFnCQpICf
 fI0svYYFjJ5uXyMJxAZV1PGoZ+xkjOkLQXdxLV9cWlI3i5MIURQl9f7SawhwzH/CmH1U
 QE2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQfH8BCQqzWNa6qbzkVYYipnFcgsvndmR201vlYad7TguBTEV8AqqG9lAqTfzruHkI932shBxQrAc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyTu8fy2F37XuZidUTDqgFzlT9LmsWEe4lC2ZH30ARV6Ep1dwIO
 YLqwx5MwY2zP3Vxt6d+FhtIztdSf2Q4b03BeezAZUaOG+ZmldPPZdOiAd6yg9M7FAaF+p5SHn2Q
 mpPkrk9omawSldGZ7KnkRyre7MDURqbTKCgaxdJiEqh1yUrV4CeLo6yqjIvZ67wXFfObLKMY=
X-Gm-Gg: AY/fxX51P/KtT5nuNSfQQB9zLLeIgWdpvF3IVWAukb7veSRalSWiCK7vXfTZ4BukvZW
 mqeLiXtD2Rgv3wQK8N47De40FyV8zoJe/h3ISYEeCgSjhFPoFY1jEItqJGL4XcgrfIyGhBwTseB
 +5J+ghWZ4vOQGUL6OVY4RtSrucAGCgaaouSrQCt3Cpf05Jzos2xN1RwuSm7kGpm+91VmbzffqhI
 mlQfHwlaBJ29PjVoTD5TxTR1mQe5/cZ2kHgcHx7NPg53ewvb3iDghI+wFDidvSH1q74dnEQ3jO/
 uwQwpI0NeGOuDw74tdZcIJ/GmI+8nnVaAgOotgMjAykEYciFAaoBlJRgIWy4Jtq4IqRIYGmv5rt
 DkxPDOBjMienDG37K6mMN0PN5/Yr9bfR86KYcLFHG6krGaGtnoNnMFOn15cYIDxbAZu51i8R9FK
 pB4oGaMmwT0NrJkceZzgQNXFA=
X-Received: by 2002:a05:6214:2626:b0:88f:ce04:3261 with SMTP id
 6a1803df08f44-88fce043356mr609201686d6.6.1767447908262; 
 Sat, 03 Jan 2026 05:45:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG9C7I4ZqjoudC7nVN7fRk1ATaRrFw7J3YjztPqT00J1e59eX1vgYQAtskZhvEvIhLBC2QEeQ==
X-Received: by 2002:a05:6214:2626:b0:88f:ce04:3261 with SMTP id
 6a1803df08f44-88fce043356mr609201266d6.6.1767447907807; 
 Sat, 03 Jan 2026 05:45:07 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59a18628422sm12920873e87.101.2026.01.03.05.45.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Jan 2026 05:45:07 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2 0/3] drm/msm/dpu: Drop max_mixer_width and
 MAX_HDISPLAY_SPLIT
Date: Sat, 03 Jan 2026 15:45:03 +0200
Message-Id: <20260103-max-mixer-width-v2-0-ef5d3d246709@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF8dWWkC/2WOwQ6CMBBEf4X0bLGtEMGT/2E4tGWVTSyVbkEM4
 d8tcvSyyezOzpuFEQQEYpdsYQEmJPR9EuqQMdvp/gEc26SZEqoUhZDc6Zk7nCHwN7ax47U9WaF
 sUVlzZunrFeCezlvirUm6Q4o+fH6ASW7bPauUxV/WJLngtjJatLUxVVldPVE+jPppvXN5GqxZd
 0aAYUxl4w5iRhPwzYQx62GOR6cpQkj29Qta/ST/4wAAAA==
X-Change-ID: 20250401-max-mixer-width-9c3c02c48cb7
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Xilin Wu <sophon@radxa.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3081;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=X9sF3LaDgRv/B45HUHc0a5tLkJCayBzMWIFKEyiafEk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpWR1iWMRaaNZrUCikmwh0dRlBiXd025GIw5C2b
 vPaIKlvIUeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaVkdYgAKCRCLPIo+Aiko
 1cTGB/9EXQoT5YcrFrQ95HwRtx7BQsX5KnVwrXP9AjuFOHuIH4GLxQsBD/BDsGGoHUyeN+t+0Nc
 QDJNRc3acCtHQ1zPrQJG6EQpWQU8ZkNkQv5TtC3j/iknAwrVRkJuOjZVhweOGUurs3j/RhY/AQX
 yzyfF20t3ayzRAfJ8dbki01SPHtpavgsJcfByDMCgvYJWpArxWH3BSLo+gDfUjgFZYcaoiLevbh
 2TZmKejTuOcGnacMRm5Hx0qusnykcqnHBvQoNZwcPw3Sm03Daq5/UjPd/ESUz9R2lOiGfV5GmDl
 gxiy4CGeec66Xqu4guxbN8rYu6p9H9uWFlFmKQeDIehL5fcS
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=Hq572kTS c=1 sm=1 tr=0 ts=69591d65 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=d6ssToJDxaT8U7i-MUwA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: C-QakJCmRK1xEluc0DBPyDj4Ump9Lc9p
X-Proofpoint-GUID: C-QakJCmRK1xEluc0DBPyDj4Ump9Lc9p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAzMDEyNCBTYWx0ZWRfX+id7YW/h1E1t
 y6ar65aQ59NfnefZd0v9tC8xwV2eabeZXCHnbyBe69aEzzb91NlvYUpVij/iabNHPwB0DpUWQm/
 kiKOSuBRv3cDkvcZUZvoDummyZ+76BKMk6QmPIDsSGkPgn74//KWUxiIDUZ0eLeik526WEosTHJ
 609x5xVn5SxubJoNFsrgJ/4Ig95mM+U/btEaKqNDt6pk4lfPsTDMjbBg0hzDQI4oJM5USHkYIOf
 87q+K3p07ShK74QQCchqxwJpbrjK3PobERV1vvq8Bjf5s9H9HqP1YKmuVykr9ubpDLo+chWS83p
 mvMQA/ORpLQAFxoMfK6S2n4qfwXRt9d9BFBvFIbM27GoJVda+1mfEJm4v+vixU+FR6vkmDwLmHg
 Zzs0yqdbljZWGKAPulTgS+hryk6qbHvTFqaDtQAhBp1iNBoVPaRrD+4gRUST/AvrorB5SiKOxJR
 QMwGw7KuwZT4UgQgfrg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-03_02,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 phishscore=0 adultscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601030124
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

Currently, the DPU driver bases LM reservation off of the maximum
supported width for the layer mixer and an arbitrary MAX_HDISPLAY_SPLIT.
However, these limits are not hardware limits meaning that a single LM
can support higher resolutions.

Switch to basing LM reservation off of PINGPONG and DSC encoder hardware
limits.

---
Changes in v2:
- Dropped PP and DSC encoder width drop the catalog, they are now
  determined in the code by using the DPU programming
- Corrected DSC encoder width for DPUs < 8.x (2048 vs 2560)
- Link to v1: https://lore.kernel.org/r/20250514-max-mixer-width-v1-0-c8ba0d9bb858@oss.qualcomm.com

---
Jessica Zhang (3):
      drm/msm/dpu: Check mode against PINGPONG or DSC max width
      drm/msm/dpu: Filter writeback modes using writeback maxlinewidth
      drm/msm/dpu: Remove max_mixer_width from catalog

 .../drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h    |  1 -
 .../drm/msm/disp/dpu1/catalog/dpu_12_0_sm8750.h    |  1 -
 .../drm/msm/disp/dpu1/catalog/dpu_12_2_glymur.h    |  1 -
 .../drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h   |  1 -
 .../drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h   |  1 -
 .../drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h   |  1 -
 .../drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h    |  1 -
 .../drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h    |  1 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h |  1 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h |  1 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h |  1 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h |  1 -
 .../drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h    |  1 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h |  1 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h |  1 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h |  1 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h |  1 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h |  1 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h |  1 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h |  1 -
 .../drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h    |  1 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h |  1 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h |  1 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h |  1 -
 .../drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h   |  1 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h |  1 -
 .../drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h    |  1 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h |  1 -
 .../drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h   |  1 -
 .../drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h   |  1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           | 44 ++++++++++++++++++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |  9 ++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c      |  9 +----
 33 files changed, 45 insertions(+), 47 deletions(-)
---
base-commit: 19eee9de953679506fd24a2db2613e165c6fe801
change-id: 20250401-max-mixer-width-9c3c02c48cb7

Best regards,
-- 
With best wishes
Dmitry

