Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37EC0CE4881
	for <lists+dri-devel@lfdr.de>; Sun, 28 Dec 2025 04:24:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93D0E10E00B;
	Sun, 28 Dec 2025 03:24:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xyn+Z9VP";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fB4UQiuX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42E0F10E00B
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Dec 2025 03:24:11 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BRKsLbw765244
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Dec 2025 03:24:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=+mefbqI78mAAgT4tjd+9dP
 E0d7cFD7eblAGYUPHQq8s=; b=Xyn+Z9VPs+aj3Nn6M7aC2rbTSxAGyHRyaqme7T
 Q8Y34W6XwW/tPRrfmiaNlU7WjZbCIPGqE0QipM8Ki0rkBo5z4lfhz22LuktoOE8s
 VSosixGmYTS59SDEnVTPZiiUZh7PeOuUC4FJhM/zjRdhVg02yC2uHqKFVscsVzHp
 cfXNOYMsyicV0Fq2HBK8UDWRoOIjU8mqzTyBjoCF6zkdm/dCi80xwPHOdxSwV+Gr
 wtXpoIQI0e3gaqCnQHbxIVbd5QYxVZhhiiZbxuNT0QkfkGJo1irRnCvHApF1foOO
 UDp60KU3dBHe4fcDOIBE9Kn5DAOwUwXVseszkRH9ggqd8/YQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba55e1shk-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Dec 2025 03:24:10 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4f1b39d7ed2so179458741cf.2
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Dec 2025 19:24:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766892250; x=1767497050;
 darn=lists.freedesktop.org; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+mefbqI78mAAgT4tjd+9dPE0d7cFD7eblAGYUPHQq8s=;
 b=fB4UQiuXxOBxohgDNRlr2UD9woT8xFIlSlEAAJFWufgIrC/FnYwAI/zyGyB34FICKP
 uJLtpsxoEReHC0zTwJj1b3E8eiklAknmITxhlmlvLgFppi+CUhxXGgifSU3voPShtQKd
 sewify9FftGauQkfEsEMAE6/HTG80TViY6iJ2iWz34C0h1B9XmxR9AHkEGhMg/gTl+vC
 q6Rsk9CXNl+IeU//v/sWyWnc6ia7GSD/tKHoiLw7wMFVxQDbnH/95vrU1Sol+swkp3ej
 fSz3E+46PZRm/e2pqCNHQ3RhD5moTMjSMn/0nuDHKHYWPrg1wr8gh2vji3K6cz814jiD
 BEIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766892250; x=1767497050;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+mefbqI78mAAgT4tjd+9dPE0d7cFD7eblAGYUPHQq8s=;
 b=cVba8tdQAtGrg+D71gCEbibnfaW8EiFKAMI9p6dzYMMuBnVLboodh8bRytLHIXfr1v
 P6P7O0vFGsJHErIZVOZ66M5d/vEmckbm1VaJL8mJuiomGo1iAiaEq9BO6fxN5v5dVvxh
 yK9VE851CGg8BOF/Snrj82ChyVS43j2b2SChP5313kYhxOq0Q6pvyiuDNR4VoApd8mZL
 t3mcGJtt+qdmS+78aKHOypDOTMA2o7DrWx9GuwkHQ5bPtbE4ikPKIYC5UDFnW4VlYGh3
 ULgEw+uD8r3bAAddBDat/SSQLsRqsuOMWSbHfH5ssMU/RYF2vWtXYRDJ6dR3Uhxlf270
 PNAA==
X-Gm-Message-State: AOJu0Yx9Lyl8JnXfh+GG+Le+PvJrUS4/BNmDABgQaqdh5nWq2czaJm/V
 6vONLCjt3ZeO42A3EdmlKo7VnWxode5XLv8zcrTZeVTmuNmNkynMvi+JcOmCVaCNBbEaInO4nDM
 /vMa7J6oaeEObR/zkjcEpPJpjuxeXQgE9c/BfbsfxmTseZIzOIG8PzlOX+x+fVW5X4wDJPx4=
X-Gm-Gg: AY/fxX5twCVmhnBAtYXUiLSplFkzoCM+qOv2hGW/PwP1Rd2BT99Eas73E6oIHiyBSyB
 pSPvfExEDKFWb4BddggNqz1KhjcHE/t1VgwPUtidlA221qA831KMEcljey0NJFhJH1KAD/6sN1B
 efoNphxMaHwz0cH2z+IOlW/l1v9k2bx0W+6xtjXsvA13Sd8g4/QKU23N3BZV1nJl0Vsq8gwHmw/
 aVlB28AsaqPZM90O2um3Yebs5ol+nTCP0u3q127wic8avOLUewU2Qch68LGJMoGF3dB96fkFK0Y
 lVMy9Yp3lfUsi/G0oPrmDdkK7aewsEIUBpNmBL7QSyUHRV/NPGBNA5RvMaOTJENh8RiH8Ji1DV/
 yDB57FOjfGYSUIBgGz0xdTIyOYE9aw6AQjebu/7TOpStJ3B790Ckg9WhzNgpY3b8lbUAFbw7u4s
 e7UDqaLwZUBW04NbPPNz/D2Qo=
X-Received: by 2002:a05:622a:2b49:b0:4f1:cab1:9d3c with SMTP id
 d75a77b69052e-4f4abda9df8mr406462801cf.57.1766892249575; 
 Sat, 27 Dec 2025 19:24:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE5GlT/APTgMXNo/B5/VYBv0h8PerY7vZK7/eAmmLwLlmn83H8oddc1TK6EgTtTkSAr649qiA==
X-Received: by 2002:a05:622a:2b49:b0:4f1:cab1:9d3c with SMTP id
 d75a77b69052e-4f4abda9df8mr406462661cf.57.1766892249116; 
 Sat, 27 Dec 2025 19:24:09 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3812262b36dsm72149561fa.30.2025.12.27.19.24.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Dec 2025 19:24:07 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2 0/3] drm/atomic: restrict the size of of gamma / degamma
 LUTs
Date: Sun, 28 Dec 2025 05:24:04 +0200
Message-Id: <20251228-drm-fix-lut-checks-v2-0-50f5d1a260a7@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANSiUGkC/22OSw6DMAxEr4KyrikJpEWseo+KBQmmROVT4oCoE
 HdvALHrxvJYM2+8MEJrkFgWLMziZMj0nRfiEjBdF90LwZReMxEJyTlPoLQtVGaGZnSga9RvgkS
 pWEgUCecR88GPRe/Yoc/c69qQ6+1375j4dj1x8h9u4hBBLNNbJVMplb4/eqJwGItG920b+sHy9
 aixOIz+ZXd0MVUQwmYyLgs2cmtIX88FOpydj64/gCmbofUAAAA=
X-Change-ID: 20251114-drm-fix-lut-checks-4bb325e24110
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1831;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=zsa037ZkWHg+UkzB5M9pGxG/5tA66JObKZx1JVgStlU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpUKLWC6NDHBI4HLPe0eKRwoOgAnWwpY8YvTQdR
 81y4rMs/eWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaVCi1gAKCRCLPIo+Aiko
 1SEtB/9f4v5FSpqIlCfN8gnuMJuVkJU0dwZAAyzC6kq0NHZ1Swqv5HaBBgchyUKt46HYu9c5/Lz
 6lcUe8Gl7do17DAEFln09DSsCEaaH2aq7wByKVEXhna2R3GWII9IFUphxqQDjewwREgbCyRKEq5
 iJkGAb/XPnxhGVVZzDeoWsJJnxzyryqhqCqtgYM2AYcrabl62G6DYKM5/JiurVDyjB6VSq/EVWf
 micahUm9BSglntsEWpwPOTfqCDYx6Q+mgtxc+65wKlpj/qXVWalXKCYK+zddB/RPmCtFc+DXzUn
 WbGk5skO/Kawt3MszWT8qmEIi8hHZuHKeXlnZdxY8LtubdtJ
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI4MDAyOSBTYWx0ZWRfXwBdmkUtD6EkU
 OS5caBjxuSLmYTgvlzq01DPA4Dds13045ACOxZfFQk0mxtDjKLhM8a3RaX1VwJMa3XBPTc+YKkx
 6mxPGGYXIoxE+eIwH7P3Q5jzl27HyWOs0mmVeczICrCTe3lNSh35S4HYwN460l4Dhsn9G23GSeQ
 o0eo82qBBFOTrEAJbySKJV+pD/6ohYK866p5R+jkDsK+pAcEwiRy7h4TYCCZ7ZTNIglI9klbzSw
 OwUqE3N46sQXeRcrhn4+t301wAHTBVCYl9RIA05sRmLDjW2m5Uy5ojdlg73niaEgVsK1J9oPk4z
 tshSB+Lqkf2OQiGI8GlQQ9USWOSSS4wbBto6AoctQC7Mk0jNmzC4mt0FeAr96LbidV1rxKdxWyp
 uqVx7KaI3rSGsEjR7YCXeL09j2yAQuwnRgBSG72VvIJEC1xx/B61eyO+A/mcTzf/4wJlbxXr7Qc
 pOGUPyCvQe6TdbsYRIw==
X-Authority-Analysis: v=2.4 cv=UMDQ3Sfy c=1 sm=1 tr=0 ts=6950a2da cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KipMzqLmMTXpIc6q-14A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: ayiE1kBWilz3NaLWMujCwvxttz3Im_4Y
X-Proofpoint-GUID: ayiE1kBWilz3NaLWMujCwvxttz3Im_4Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-28_01,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512280029
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

While picking up the Gamma correction patch for the msm driver I noticed
that kms_color@invalid-gamma-lut-sizes and
kms_color@invalid-degamma-lut-sizes tests fail. These tests attempt
submitting LUT tables greater than the size specified by the
corresponding property. The issue doesn't seem to be specific to msm
driver only. Add generic check that LUT size is not greater than the
size passed to drm_crtc_enable_color_mgmt().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v2:
- Fixed comments for drm_object_immutable_property_get_value(), changed
  it to use drm_WARN_ON (Thomas)
- Reordered arguments of drm_property_replace_blob_from_id(), moving
  max_size before expected_size (Thomas)
- Link to v1: https://lore.kernel.org/r/20251115-drm-fix-lut-checks-v1-0-3586f5855bc7@oss.qualcomm.com,
  resent at https://lore.kernel.org/all/20251210-drm-fix-lut-checks-v1-0-10ae38519f43@oss.qualcomm.com/

---
Dmitry Baryshkov (3):
      drm/mode_object: add drm_object_immutable_property_get_value()
      drm/atomic: add max_size check to drm_property_replace_blob_from_id()
      drm/atomic: verify that gamma/degamma LUTs are not too big

 .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c    | 18 ++++++------
 drivers/gpu/drm/drm_atomic_uapi.c                  | 32 ++++++++++++++++------
 drivers/gpu/drm/drm_mode_object.c                  | 25 +++++++++++++++++
 drivers/gpu/drm/drm_property.c                     | 11 ++++++++
 include/drm/drm_mode_object.h                      |  3 ++
 include/drm/drm_property.h                         |  1 +
 6 files changed, 73 insertions(+), 17 deletions(-)
---
base-commit: 130343ee6bca9895c47d314467db7dd3dcc8bc35
change-id: 20251114-drm-fix-lut-checks-4bb325e24110

Best regards,
-- 
With best wishes
Dmitry

