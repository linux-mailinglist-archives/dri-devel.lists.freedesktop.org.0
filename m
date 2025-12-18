Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6133DCCC4CC
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 15:38:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9C4B10E9EF;
	Thu, 18 Dec 2025 14:38:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="WhFXYpPT";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XyjKfQyz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 832EE10E9EB
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 14:38:28 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BI9EnbL4190492
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 14:38:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=u0iVGQGHwdwFcGy2cbVQCM
 VTGMKGsg7pEu0VkSkasB8=; b=WhFXYpPT3IjJfOPdqq4tDbPI4p8OVCc8W5GFJH
 jlOdLUL+csieuMyLOMJcowv+q3CcZZLYzHIT/8AdbsVjFzLNULjGjdml3YBCYhAV
 F+UswbI5VuA/HSZtRKTB72B6/sEsWOGDuoF7AtLVK766thA6PmB6NHeDgk7hX2sO
 vpOBb7KiSWCF1/JfUenDWqZ6sovhKuVJqf1pVc27z759dEv05Aj8lEAhrLlSbPVG
 LztV6LdCOsb2KCieo6zVjETBzH0PuiSPkr5XbPKEv6JusyJY6KA/ePqPllytN0Mc
 5Ca73ob2c6tuA7QpI4Bj9iaQBNFwJi83IxMmib2q8bQDCJ6g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b47pkjadw-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 14:38:28 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4ed74ab4172so13685981cf.1
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 06:38:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766068707; x=1766673507;
 darn=lists.freedesktop.org; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=u0iVGQGHwdwFcGy2cbVQCMVTGMKGsg7pEu0VkSkasB8=;
 b=XyjKfQyz/1/4C0kb7jagLIMnwpWdyvkQ0+1S3nTExQWL3TrVIjsVfdTJp8B77d6DTl
 1c0I0iSes9JNgZ4eNdY1olwhpdvozxZOEyM8eqh3y1ZOwlhmzAvyprznSkQRSiDiYTlq
 K3lRoi+d1+U52l8v4UDaLqfmK4vWjxEL6tv3VnMtl6WP1t7iD2qBVP2ImMMqi6Ie9bFU
 EcNZUxnVNc8IK862JHo7tdouKJqENmMzNP/O2OVstVV4ZWoICSvTUVfwYLcruYXGFnOe
 y51nlSRXVW/e0nn8pZB88n5MQuN+tVWZ1yPtWqjcqU+bTnrvErebBfPfbPB9LegvTg5b
 yI+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766068707; x=1766673507;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u0iVGQGHwdwFcGy2cbVQCMVTGMKGsg7pEu0VkSkasB8=;
 b=Iw9MlVkoUvsiz4YC1X+MvTwbNeVf4wMSlttGhhBPby9ELu0dWnvC8HFMBd6RlV9llu
 ZzA2yOGT1Ag9FWXaxaww+JxgLiHB4WVopLQWVledCuwIgcsDggQB6SWUP70FE4A/kYPO
 g+kxaUQxfD+Ir3anAxLAeqAgnEgT4XSGTJHCuaXvEmpZfLBxmV3YfFM4Yoj/k+4biIRY
 YgBsN7bO6RUWrstAxWBijxHGNDy+wJTW+LN3EUhshsrZkq4Z5UI7NSRLyce2qfwpPe/S
 AZ1lUGxmxhbLpEZ4ncby1jdGTNHo2Atr/NKKu8QTMXJRcGpPj2RCY6ti7CWuMbV/LfEb
 nHCw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqdAW4mb/qviQfw2HYSBKVH7xdi+HjwACXDYig53UwOFizhC16uAjt4l2C+ZnagIVts0PnksDTzog=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxog52MW/BETzowidopX/+lEOt8tSU4lpVwIIxlmrZ8qSq2YXba
 ScFJLHOarxf/e/qRiB3Ka5XmNsHqI73DE/W7+NySOwDzGGZpErggMsbPHSQS4HZnklBfph17pCy
 s4HBZKgs6z8D9hbWi4iXOpOxMWK7oBv17WJDrtuNao+OG0DIqPc4vh2r6qJlFHAAGGbfpMmY=
X-Gm-Gg: AY/fxX7qQxvYl4Yqy/5LdfIZiYnsFI5vOnp7dcF1oLY7IsPDPiNaIYduD/3ble5/xjP
 /00Ru8bwChtfsqiiSbhN2Vh3xZyciVi/wrgcu3Sw7IqQiCuG3AcKQzT8swbenklaPIT+3le6Mc+
 kEfLEAlkZn3UBiCX0EFPsqITotuZfyGO4zeDFk0obizaCtmwZlljT3lKYe4zwj2QI2y6tTzlJWS
 479HwIWyPSS7padLo69FWc13epNKWrFQui+rGoCewrkjhSucbx2ooFxkdV60zq/T9VHikgkfmfr
 JbE/++MCpDYtfKeI0ORx97Wt5iz7gXDpwue52Zs5oargTfiuAgip3ao7QknAq+pcesUWSq3h93u
 uyWL+W8t1NFMcBI+yXzhjOsE5kWeYrMsLXWScxx2WHlju8LsvVtTb3kmoogKH3zC20Dm3KiEI4f
 kWCmM51IFQbIm7krXOjHwkO1k=
X-Received: by 2002:a05:622a:1650:b0:4f1:c66a:f36d with SMTP id
 d75a77b69052e-4f1d059c8cemr280931731cf.42.1766068706875; 
 Thu, 18 Dec 2025 06:38:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGMddQCMG9BtpvkMgSK06ak6LcdGd49TxzsRUXmdS7e3Yvtv9k6Fp2kJTz4/n9I4p5vK3azOQ==
X-Received: by 2002:a05:622a:1650:b0:4f1:c66a:f36d with SMTP id
 d75a77b69052e-4f1d059c8cemr280931281cf.42.1766068706333; 
 Thu, 18 Dec 2025 06:38:26 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59a132d3c3dsm1160214e87.33.2025.12.18.06.38.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Dec 2025 06:38:25 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2 0/3] drm/msm: drop DPU 3.x support from the MDP5 driver
Date: Thu, 18 Dec 2025 16:38:22 +0200
Message-Id: <20251218-mdp5-drop-dpu3-v2-0-11299f1999d2@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN8RRGkC/13MTQ7CIBCG4as0s3Yahpb+rbyH6aICWhJbECzRN
 Nxd7NLNJO8k37ND0N7oAEOxg9fRBGPXHPxUgJyn9a7RqNzAGRes5w0uyglU3jpUbquw6q6S1aq
 uiVWQR87rm3kf4GXMPZvwsv5z+JF+34MiTvRPRUJCNjHqGtXzVrRnG0L53KaHtMtS5gNjSukLG
 v8/o7MAAAA=
X-Change-ID: 20250926-mdp5-drop-dpu3-38bc04d44103
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Alexey Minnekhanov <alexeymin@postmarketos.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Alexey Minnekhanov <alexeymin@postmarketos.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1198;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=skgYU2ATdXa4HLO1nWx2MKL1Wt4wqHYpnzIFM5Tv+14=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpRBHgi1WjyxtMhrF1cFwCRRGOsBYLWC+6uYzk2
 0WfDDJf68CJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaUQR4AAKCRCLPIo+Aiko
 1djnB/9s/IC/n4w+7mYJoqD8XnCWjgi4bh9GChLiphIU7QMq4+1OZClsx7gVpkvw+UOxr9wGkvq
 wo4c7CdG81AZfZ0xFCumgnF5UjKTtj2v8M6yTYfLp9yQrkf+eOz1S4UTXcCCV6ebZ1c2BbataOk
 I+lPnouEYTT9eAU+ctbrb+e7viSnUWlJKl++/VLaICaEwjgSFQj1ofvZHsA/NcQ8P36cVb457WL
 Ge27UfahbyLoctQYXAsRu75tEBM3I4/TL1Ajs6/qVCz8FWiEoCUfuXKgF4UBIyMRQoN1eZwCo3Y
 en8BQcGNpVmkb9Y6P80d8cV4zoqoqGBF8mNZFH3t9n1tapbx
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: WqtP66y8ohopjgIGcSWWwYStA4T2zB7I
X-Authority-Analysis: v=2.4 cv=Md9hep/f c=1 sm=1 tr=0 ts=694411e4 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=YAzajJBEG-g-3Vxjg9QA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDEyMSBTYWx0ZWRfXwF/IYndVmcMe
 E5EQIyFEtc4pP56l81Tse1qi84Cnzwh2dgXgtjlXCzh8AViwlL4I2dGrr7pm1PwRMCuxPkg1KPX
 H+oK2DEOzaOajM50Ozonv3wn7kvEMvxc/L0jfACjDxK8p44x0Fk9v4EkEX+uJOlWVHeWj0nWH8A
 EylibR5fheeC84whsQhUyt8bh1gyLCsTo9ESxdY5xsm9CaAqCD+JeIGx3a2nOc7gc+paIf4TIb9
 4Hqy2+lQDOJ54q/ytuiUBs5e/tWekDBK/VLhg1IS15mJmqU5xA1NJiediOS7CGJNXZcoXg/v36m
 KkguuCv1b2xlfECyvIYh8A0OyLEWfG2J8Uc7EqrPOilmG2Vupk19PjAOTG8z+alm4iSpb1ZL7r0
 SJirEP/UIjvNpgLXn5UMnM+AmLARmw==
X-Proofpoint-GUID: WqtP66y8ohopjgIGcSWWwYStA4T2zB7I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_02,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180121
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

Fix commands pannels support on DPU 3.x platforms and drop support for
those platforms (MSM8998, SDM660 / SDM636, SDM630) from the MDP5 driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v2:
- Fixed CTL_START interrupt handling on DPU 3.x
- Link to v1: https://lore.kernel.org/r/20251211-mdp5-drop-dpu3-v1-1-0a0186d92757@oss.qualcomm.com

---
Dmitry Baryshkov (3):
      drm/msm/dpu: drop intr_start from DPU 3.x catalog files
      drm/msm/dpu: fix CMD panels on DPU 1.x - 3.x
      drm/msm/mdp5: drop support for MSM8998, SDM630 and SDM660

 .../drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h    |   5 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h |   5 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h |   5 -
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   |   3 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c           | 314 ---------------------
 drivers/gpu/drm/msm/msm_drv.c                      |  16 +-
 6 files changed, 15 insertions(+), 333 deletions(-)
---
base-commit: f2d03d96ebe8f6948cea9a47d11728f42d62d0f9
change-id: 20250926-mdp5-drop-dpu3-38bc04d44103

Best regards,
-- 
With best wishes
Dmitry

