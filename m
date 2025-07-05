Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7488AF9F81
	for <lists+dri-devel@lfdr.de>; Sat,  5 Jul 2025 12:02:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB12910E21A;
	Sat,  5 Jul 2025 10:02:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="U0sAAeby";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEC1710E36A
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Jul 2025 10:02:33 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5655VLhl008724
 for <dri-devel@lists.freedesktop.org>; Sat, 5 Jul 2025 10:02:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=8yTWfLiR3ivzVCC1BMznD4
 n6vr2lZu7kT5+xvaCCSNU=; b=U0sAAebyPKrogsLkSvZgChKohivpc8JlrbhxK+
 7aJuiPz1wHi4H/fT5BclW8RvHPdHtW47qiZ3ah72u6+n3oTNk3yaPQHxXgrGAaCG
 qMm7TjULai6QQRq1p7L+97MoRWm6sqIysiz/pG3yWNU9ijhOLkZXDXQ9oTsHXcQG
 9sSz5z57M4WyvbRSJeHklm5QvUb77yXa9MYChPFWxZTZv/DnIW3uPkTYDNC2asbq
 wP1PKYnYjSompwlF662nDaZ1SMArYaH0TJu+IputNiyii5Vxi7LGljsc5clHiOhR
 B9JOJMY+WKRweabLPMjYqXKYDcrA7NIQMoqH/uKwps00mvnA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pun20map-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 05 Jul 2025 10:02:32 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7d44a260e45so263773685a.1
 for <dri-devel@lists.freedesktop.org>; Sat, 05 Jul 2025 03:02:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751709752; x=1752314552;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8yTWfLiR3ivzVCC1BMznD4n6vr2lZu7kT5+xvaCCSNU=;
 b=j0gydGwdrAw4fKFRfF48VFiLrCCLRg8CqNiPlnTbZ9Ep0B9Crwb4Qol9u+Sl9AeaEF
 RWv6BGEh9c4Iv1JdUJ8btFDA21SXGXZnlQXJt2hcdouYXJyceWB+8CUKVFlEBtQZHMB0
 Oikk5ZlEQa1IEvQL+dVvVTfnR3Z0zWjpUXehX062/sEUSQvNoxD8qSK4DotOHTqAmV+Y
 c7KpLzgsnkFRyh40C4igBkCn7nRNUFrgQHvOm8Pdb3UsbUlO8h45zh0EUoT9fkqJmPqO
 7X2P+QI4V5RuQ7lJhCnxvPVFD9s76tJkCYBvoBI7KI0Z6YJM1IiPiSTiZW3CAoUoFvpM
 3GKg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/BwEiPhv6qrRACOCOPTliU20fcEaigfz6NeFKD/dP7ZnmcYK5VDNSI2y9BlVV2TpW1RrXcuZpFi0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwaBONRxh0nss4HwLkeF/MSMXoNDovZXC/WePwVSU8PmePr8QFW
 GlRI5fQHTVYdZG4j2KSFF9w2RdJYyGN/LUrK/OzaM2RzBtoLUciX5Z0P1qOLet9o+/d7DB65NYX
 eyuaFFZrqZQ+9rPShK3WTQl9LTwn2tBHlkbk69BeWUoUHmGyuVeJNFneiVKchWKdpxAVOxfM=
X-Gm-Gg: ASbGnctwR8hPB9t9i9f06Xj7y5/eusjpQGSwi/OApBYBk3bUyYNMMb74srMLkmeOxLs
 IF1ENroAVjIiPnOErwl8XCQfPRGJu3MD+PELw0RaM0jqch0G7+hB6zVjZxDasCcpLIS4NWt6xIy
 NWlNVGnJ/sJlGiH+glFAQJkzItMBLAfa0KbExLI37F+TqEYmCY80blHRftjFmLF6GWX56tTg3rR
 RfHOhYvowTN4vEByLoL8hx0IzvZd/rCb7EY9V2EIPlK8BbY7Gghp5FhzpMYVpEVoNmnX0eDLu3D
 yZjMjZ4VY7K5J7479jSTPGYtZ1al7krlLZgEibtCoYGNifRwlPRAFMxHiBpzuNvFZla5d8JhZ+u
 CiSK/zep/YEQE0PDXKz1i8bWoqfT40nHMOmQ=
X-Received: by 2002:a05:620a:1a9d:b0:7d4:4b12:a39c with SMTP id
 af79cd13be357-7d5dc6b8a4amr855386785a.16.1751709751675; 
 Sat, 05 Jul 2025 03:02:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHXvGmikYRm3WVOK8bhN4jyz/OZR+VPtPDg3PsMkeviJGVWLPAoeV6KBDIzLQsF2YVG8aan3w==
X-Received: by 2002:a05:620a:1a9d:b0:7d4:4b12:a39c with SMTP id
 af79cd13be357-7d5dc6b8a4amr855382885a.16.1751709751119; 
 Sat, 05 Jul 2025 03:02:31 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-556384c0558sm526274e87.209.2025.07.05.03.02.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Jul 2025 03:02:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v4 00/10] drm/msm: rework the ties between KMS and GPU
 parts of the driver
Date: Sat, 05 Jul 2025 13:02:25 +0300
Message-Id: <20250705-msm-gpu-split-v4-0-fb470c481131@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADH4aGgC/3XMTQ6CMBCG4auYri2ZmRYRV97DuKgwxSZikQLRG
 O5uITEafzaTvJN8z10Ebh0HsVncRcuDC86fY+jlQhRHc65YujK2IKAUNKKsQy2rppehOblOUgb
 IOmcNFkTcNC1bd5293T720YXOt7eZH3D6PiX1IQ0oQSIqsvqwwlWRbX0IyaU3p8LXdRKPmMCBX
 kgKXwhNCOVUHAzY1JR/EPWG4PoTUREBzpHXnGVA6gcyjuMDkFvzuzsBAAA=
X-Change-ID: 20250411-msm-gpu-split-2701e49e40f0
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3533;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=J4C/0+LOprx+Bc2up6uIFnQA0ASg0Yvpvgf2DAZQvtk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoaPgyKITxu/e3W/8n+dQIe/ccYjZEQmlMEG0p2
 9TOSBgiCGiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaGj4MgAKCRCLPIo+Aiko
 1ernB/0ar0V4CLSSyk+omG2AydPR+Q1hjEoBOIzJAacJCAljf5IwJ/uVfsMJKaO1IF+OdOhnsXp
 927gmANpCD3eKrV4LTfzelZbw8paA64pO6svOHkYNZxMGYyhKSsVEtxNrIyiftlu2/Oqbv793zJ
 PcEuVhktvTYLqbAo6YmIDtdBJdOanL6dQ+59qxv/ZWNnNRhRNluJm2+7JZveFZIBHI1wXKrS43C
 KlPcjtzHqrd/MEPhaVAmj9uMVkboy6oVeyXbaQvqAgSVNwaVLhdcU4AnJgtBoqy+DL3VW4PENjl
 Zhhm8gVbc47UC5g2gTs+vFenbBH2V5pa4qUa87xm0f6inPAB
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: ShH2VRkQiHrzWL0J-Wsv8bWo_sM7WKdD
X-Authority-Analysis: v=2.4 cv=GdUXnRXL c=1 sm=1 tr=0 ts=6868f838 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=3aS5ecUQXdRO32CnfYUA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: ShH2VRkQiHrzWL0J-Wsv8bWo_sM7WKdD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDA2NCBTYWx0ZWRfX9bbxqjJTuQeU
 HnOJQUHcKGPk3G4C01FoEHTfyNjbwLjx765+rO/DQ50ytJMUEcAbiSNu/r0n1013pCXKkf6GjU0
 nGLxWPQzzxgEqR2PmadDXoevL/qPozQdjD8joAmZRM6M/Tvw4Nb0QupL0IqdBsJYXFFC4p4ZyrH
 WOy+8l7DnKNV1gtpRePyI2yzqDklwEIFoUjoAsDPLGICu8JiZ1i4spt6zM3ITrvM4BOXCF7hZvf
 /dS0xKB4caQ9rSH5v474YvuBo7i6H2UdxGoJobv3W4k04VxyU/f2jG5DVHrfXfFG9HV7c/v/dD4
 D+qwsqwNAroGGeh1yl/s7YsFlUCv6INeLoCBppXJSB5OepJHYnnl8jZy5xyB3rAPEJF5VaRD2nk
 r1+v9ehpF1zxmY52mqpGSNj20+H5oMufTsFk2ckdlmrGRhVWvlVcd4F0s+XeG7K51dKlqE+E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 malwarescore=0 mlxscore=0 phishscore=0 impostorscore=0 suspectscore=0
 mlxlogscore=999 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507050064
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

Currently the KMS and GPU parts of the msm driver are pretty much
intertwined. It is impossible to register a KMS-only device and
registering a GPU-only DRM device requires modifying the DT.  Not to
mention that binding the GPU-only device creates an interim platform
devices, which complicates IOMMU setup.

Rework the driver:
- Make it possible to disable KMS parts (if MDP4, MDP5 and DPU drivers
  are disabled).
- Register GPU-only devices without an interim platform device.
- Add module param that makes msm driver register GPU and KMS devices
  separately.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v4:
- Rebased on msm-next(-robclark)
- Temporarily dropped the "no-GPU" patch, it will be reposted later
  (Rob)
- Link to v3: https://lore.kernel.org/r/20250518-msm-gpu-split-v3-0-0e91e8e77023@oss.qualcomm.com

Changes in v3:
- Disabled SYNCOBJ / SYNCOBJ_TIMELINE for KMS-only driver (Rob Clark)
- Further refine Kconfig dependencies
- Link to v2: https://lore.kernel.org/r/20250503-msm-gpu-split-v2-0-1292cba0f5ad@oss.qualcomm.com

Changes in v2:
- Got rid of mdp4_crtc.id and msm_drm_private.num_crtcs
- Moved msm_drm_private.wq and msm_drm_private.event_thread to struct
  msm_kms (Rob Clark)
- Moved HDMI / DSI / DP pointers to msm_kms (Abhinav)
- Link to v1: https://lore.kernel.org/r/20250413-msm-gpu-split-v1-0-1132f4b616c7@oss.qualcomm.com

---
Dmitry Baryshkov (10):
      drm/msm: move wq handling to KMS code
      drm/msm: move helper calls to msm_kms.c
      drm/msm/mdp4: get rid of mdp4_crtc.id
      drm/msm: get rid of msm_drm_private::num_crtcs
      drm/msm: move KMS driver data to msm_kms
      drm/msm: make it possible to disable KMS-related code.
      drm/msm: bail out late_init_minor() if it is not a GPU device
      drm/msm: rearrange symbol selection
      drm/msm: rework binding of Imageon GPUs
      drm/msm: enable separate binding of GPU and display devices

 drivers/gpu/drm/msm/Kconfig                       |  34 +++--
 drivers/gpu/drm/msm/Makefile                      |  19 +--
 drivers/gpu/drm/msm/adreno/adreno_device.c        |  39 ++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c          |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c       |  13 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c           |  35 +++--
 drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c         |   9 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c          |  13 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h          |   2 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c         |   2 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c          |  17 ++-
 drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c |  12 +-
 drivers/gpu/drm/msm/dp/dp_debug.c                 |   4 +
 drivers/gpu/drm/msm/dp/dp_display.c               |   6 +-
 drivers/gpu/drm/msm/dsi/dsi.c                     |   4 +-
 drivers/gpu/drm/msm/hdmi/hdmi.c                   |   9 +-
 drivers/gpu/drm/msm/msm_debugfs.c                 |  97 ++++++++-----
 drivers/gpu/drm/msm/msm_drv.c                     | 166 ++++++++++++++--------
 drivers/gpu/drm/msm/msm_drv.h                     |  31 ++--
 drivers/gpu/drm/msm/msm_kms.c                     |  41 +++++-
 drivers/gpu/drm/msm/msm_kms.h                     |  46 ++++++
 21 files changed, 360 insertions(+), 243 deletions(-)
---
base-commit: 7df7b18268eb5c75e3978da5d183d8cc24d4e201
change-id: 20250411-msm-gpu-split-2701e49e40f0

Best regards,
-- 
With best wishes
Dmitry

