Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD44D1A719
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 17:57:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29F3B10E516;
	Tue, 13 Jan 2026 16:57:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fv+gz4hJ";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RQ42UNWS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43B5F10E516
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 16:57:28 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60DD1FO63637271
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 16:57:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=jOOAn5FsdoX6OtORQDUyzK
 OqdOTp2Hgauc3T1xnw21Y=; b=Fv+gz4hJd7qxPqScnumc1RxO3EJxmk5jUL69jL
 QUrXqcjNpnbeSwnI9P6FYlkHHhY/cBGqRR1v4x9JJmk0UQtZOmd2LTi3iwWCv9ek
 eabX/0bWdMCjDzQpFzQ1TwJAWEtqysnB6OqjKHPwiFBVlL4ZvS+xPiwRTjkWwjt5
 31oVemX3USHgqA/PfSkzz0JDcTg9y84NwToNjdHXwiXJZcAycj6x/qsu8j7HcZSA
 q0c61n/Rft/vDFjPbYIlwWg2Zsbns4RzYZFbEWvj0mgh7Wx7zVfIrFJhsNdawvKu
 y+R2P/gsdhV34MwtURlcKz4nVN/01V0ixlNb/X/GbSmj7ehw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bng2c26hq-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 16:57:27 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8b6963d163eso1967539485a.3
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 08:57:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768323447; x=1768928247;
 darn=lists.freedesktop.org; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jOOAn5FsdoX6OtORQDUyzKOqdOTp2Hgauc3T1xnw21Y=;
 b=RQ42UNWSaODoa1/uOy6mTpsqU4W4pqDrJzACWJNlu1F+YcZcC6HgvDSCyKGFn69KKG
 HkSb6XpeE1HFcEyYP6dY7kho8C44wg91lvQQcTMgYNCTBCSnDufp3MtzWoVD0yDeBNq0
 Tl7SN8lB17vktRQws9eh/8AbQ7hqxaKBs6vgWSRbSMWsr8rqPmVjcPB/KTq+BnHgFE0S
 fDIgSzdFvSwCIYpSd3qhEcP2dqLzy3LioPGbThLAl4QLCxjCkKr3fF/+k8+FUxz30G+m
 cqkTDIM/WRqBX6a6E/yvCKbxFqWcwXrf15l5AEST8RGYlOXhsfnwG7KGNs1LIwidWPzG
 LCyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768323447; x=1768928247;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jOOAn5FsdoX6OtORQDUyzKOqdOTp2Hgauc3T1xnw21Y=;
 b=SpRkjJ79VY9YmS8Z9xmS2g8WW7a5jMZNyYNIJjuPcZgZSD6GclnsFhWFQWbG+foZ/g
 IgbIpyFdQOU2QTQBFkg/FEkAfajahHtMtqrSRXAU7qqJyATLilXfR6HAgbfWEhfPy24J
 Lcg+XeXt6oYFrysDuUBNXyNE1pxYxd1b88wutZ69wRzjuQlycAoo0mGooJSSwzrDyFFB
 qZDYIYO/WBe+bjEKOAb7UUSKmmnr8Mk83cGQTGdTRbFLGb33TPg3zp34mhO6ZcZShoWR
 C9jaQE9YcsBQ8yB9q0wAprVTrNyA8E2qR6dSNoc5nbp7z0435telKZIK2SxXfA24O5dZ
 wYmg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRt9kMtdPG2Rahb9aQgBcBXaLcJf02l3fIQ+ThcoO+LDkrsurbwly47J5ftfMdLGeh53E3XgDSDRE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxpIhzGALPmcxOaGkU6rnKstkAENSjdiD3GiyilyFbOuQTpkF8g
 hS2KoWre40eHk4XR3NiOXMhKBJNdWYjXvFdoeRp8fyBVtbR/WZWyHvdmcckJ3x6LCG9UWwMZp7A
 t6NbFQSL5LT22652ScU3E3RIUu/ih/RJ8K2fMOnuSS5g4W0DnwR5wN3/6Og9FtTq+64QPgkc=
X-Gm-Gg: AY/fxX4jqH5iViRZ0CliFgOzbZ/28iR1B4kjxrxlujlndCUeH5LM4uRu5KpIm3zkLAb
 7GYL+l8hoX6XswSuTN41vYTVzE+i2zrvUQf8mWpuXu8Q/1C0nqK5dsOHeMMqz1Yh+ryMgKyqr7n
 n8NIFpaJXe802wv9qpwEJCkezl3P8dWu0zg+EL16OcsEViuqI38A15//GguHXyBUzQIh8OeW25Z
 j/vfvB3EomMg13ws9v8pm9Y0Z6jWBKL4A6/RQ/1CwV85WPhUlUg6b7wO3CuELMiZmnRb3RI4q5v
 15nqMcboBIrLv6JgeJ7cj84LB9sUsHYAYJuBRth3IZOpPkWQf1517C+hxfzUkwagu3Bq/SU0G8G
 ex52qmMfViqxKt3xZU1wTEz6pdnHf/R3cABJNQmXiseiQ9GVLBwD7VaqZrEfKkCGr9/Nv87eI9w
 dFOFEIQykmUeeLWfwirMsz0i4=
X-Received: by 2002:a05:620a:371f:b0:8a9:eb9d:512b with SMTP id
 af79cd13be357-8c389370d03mr2851935585a.6.1768323446570; 
 Tue, 13 Jan 2026 08:57:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFnv+zvvUSVye807I3iOxQYYNjQn6GHKp+z4DaM9QnMqbhtS6EBuyv4QUimpYjB1lN8tO2ITQ==
X-Received: by 2002:a05:620a:371f:b0:8a9:eb9d:512b with SMTP id
 af79cd13be357-8c389370d03mr2851931785a.6.1768323445952; 
 Tue, 13 Jan 2026 08:57:25 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59b72af5ed2sm4788677e87.58.2026.01.13.08.57.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jan 2026 08:57:24 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2 00/11] media: iris: migrate to using global UBWC config
Date: Tue, 13 Jan 2026 18:57:15 +0200
Message-Id: <20260113-iris-ubwc-v2-0-4346a6ef07a9@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGt5ZmkC/22MywrCMBBFf6XM2pQkhhRd+R/SRV61A7axGRuVk
 n83du3mwrkczgYUEgaCc7NBChkJ41xBHhpwo5lvgaGvDJJLzYXgDBMSW+3LMa4HrZy1R2ECVP+
 RwoDvvXXtK49Iz5g+ezqL3/uvkgXjzPuOq5Pyznf2EonaZTV3F6eprQN9KeUL0XGXGakAAAA=
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
 linux-media@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2418;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=FuTV8yKkAY6u6qjOMMvptbXjFhaNrD5gYES2m68Z6+c=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpZnlyn4aTfhoELy+96Isg6gj+FEpj2PM4HLF3F
 l1/0r1uUj2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWZ5cgAKCRCLPIo+Aiko
 1TmpCACl8frr4Rr5rQxMRtCKc/tXubQEf7JhK63d4C4QxeYZnM9mBbK21nk9Gc0bY+8Y7CoS1mn
 nJptHC4vVnfgOGY1OdJ9ZwRtMYJTn0qEP/h3Kr6znajAFMoTLydKFY5pKyePXFKR6dkc+qslqR3
 pRdk9RUuy+C3pwtYOYBrdiTWMB74Spzr9LN/6XIGYuAaOp9lJKWxW7krmo28iHhdAymwth4doGn
 y+xaoRDX8j746gcU+LvA3jD1r9fPSgnQaxnMKe6kayC/pXSs1rFxMEYAjJFX/EJ8cuUYMAH3X7K
 9Sm7H23OqzEDJpo3NOWagf6Coc/gfA8H1dIsQqFlVuqlEOOs
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDE0MCBTYWx0ZWRfX6YJenMux06OS
 sAtyjfNuX9CDLd/750fNXOYJ5k+40p6PhFILQ8KJNTt/1O3xouCaaDwhuivJCUpa8XcavGSgl5p
 Ae4xMWKDsrV7nrIq7giE+4kkUjFy4ySa/gV9wcQuqT9g/6wt5oJJDa5kQ0bn+pD8xXoZG6kIn2x
 sfzOvvNQ+4PV6UJ51rJV2JdPKXPLApvgBN6B7oBksGyUdHUuCbzWaVnMt5Yu6x83DWuISDHJAvP
 MruvMnhjT78GuBldteFDAMSLS3wz1hLeqmuuZukbzzwmYCWdpn9oAFrTei/2B//pjNRVu7WAIHr
 N1Bcl3HF3WoDfGthmImJpyuyL8n2Xs39pRGeOGo/vdhviQ+txF0mts2uP0sl2/ItuteHxKgX9zL
 5I4jHLpGrPD6GsXmdakiDkXOtpJpi5h268NGz87sD66stwbj9BcpkHS1x7G4SbEvVWw+130Rjer
 4CH2gXplZM1P4fqtuWw==
X-Authority-Analysis: v=2.4 cv=C5TkCAP+ c=1 sm=1 tr=0 ts=69667977 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=sotOLrqpNFqtnHaJl_IA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: grfZXRLcYXU7UvYAqB-RDmJD5d4kAsqm
X-Proofpoint-ORIG-GUID: grfZXRLcYXU7UvYAqB-RDmJD5d4kAsqm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_04,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 impostorscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601130140
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
Changes in v2:
- Extended the commit message and added a comment for the min_acc length
  helper (Konrad)
- Link to v1: https://lore.kernel.org/r/20260110-iris-ubwc-v1-0-dd70494dcd7b@oss.qualcomm.com

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
 include/linux/soc/qcom/ubwc.h                           | 11 +++++++++++
 9 files changed, 35 insertions(+), 39 deletions(-)
---
base-commit: 0f853ca2a798ead9d24d39cad99b0966815c582a
change-id: 20260110-iris-ubwc-06f64cbb31ae

Best regards,
-- 
With best wishes
Dmitry

