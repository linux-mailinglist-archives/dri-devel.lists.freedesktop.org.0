Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2476AA80CF9
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 15:54:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08FD110E6B4;
	Tue,  8 Apr 2025 13:54:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="cMrvIdiX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BFAB10E6B4
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Apr 2025 13:54:29 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538BFsTi019576
 for <dri-devel@lists.freedesktop.org>; Tue, 8 Apr 2025 13:54:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=TyLBffc6+Zo9a+g3rn1MCD
 E5irMVpwaOybEI3TjyU48=; b=cMrvIdiX3EvQ4oF2tosKDwCY6xoVZesE/rTp0O
 PHT3kURTaTNnC0SpCaA9HX83yPFSH6bS+DHhzDRDN5tbDAmDOC1ODtBerIINO+fI
 OkCAQVNF6n39LGpAsTQpZf6ysgCzZ4xQCi9pGpBsYMbehjwNAfbZknpxlCenVhpY
 LznKXoAZmAFiQqHhbpXrQK5eHXt9RU8/5OvYeU6EMj+hURdcXCM1f0yo2rUJGXrw
 RvRm+pVeIMbWgYlefnfiUe9YJbEtKfjF4ha6C4aSOqu0e6J/LydTd61MnjBMO7HK
 EOCItygwD8+7O9Z3LW4KTXIlaj1b7Vu9/6wEJrz0ULdYuosw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twg3fwtu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Apr 2025 13:54:28 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6eeffdba0e2so112993566d6.2
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Apr 2025 06:54:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744120467; x=1744725267;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TyLBffc6+Zo9a+g3rn1MCDE5irMVpwaOybEI3TjyU48=;
 b=BUGx+oh0I9sX5nLlhbZcPApxrIv+jf4rPwb9xZKCUuoe2q7ISm+zrzvbBHdq8FKXha
 FPF1l1De6sWsqaFj+wbJFFkb+lxDDVEvP/s/wJZWBT3KJ22G9d9t5JIioO0Yb4Dxtdrh
 uOaxBqZOXmaeHMSM81eFu1q93mEf95IPm83mdFoJUv7qW8/+/3NMshMSBTVAbDr5SB3+
 XTmPfvqmW0gwyn/ycfVdovFuAAMjMoCDgZEHTTPba7LZviKx4kYaePR8EB7T/32+PDBN
 e9Itu70vXZg3VpNnyuxBae7ore8e+L+ucXdCs4Svd1BZzKNf+HfWtWnNa9jxyruTSoLW
 M2Mw==
X-Gm-Message-State: AOJu0YxBe/D3OnnbWwBBlP+Kcjebf4joQvccz0AHWPS/zvNblKnpuqSR
 HBtGJ8HiGMCckHGcjhqEgfuGAvvOB/TxzfNtIuA1qNdaZqpMs5MBP9q0d6qo1j+4X29lCwD2hju
 LTT6cUuPRo78kKDTWL+Uwm3HCGt1k4QTaQBeMQ0gNRcpGM+voMCbZzAF7d5eQP1UIf1M=
X-Gm-Gg: ASbGncsqE2S172llDPK2+6113pLUmPzYpc4Rq+LU6i0k1Ke0EGj1dwkD1xYlyH+0o43
 xerm82NLD0iGC/pEc7yF5MfYLhLIcW3HVCrhlyen9Otjb0DerJKSMRMr0TIjl+i5eV2+Hrkj7Sc
 DX/7n8eAP5lPxs+ahK4sKhmQttCYZbCpbZuQvNdy0PbY27evMqUdyIc2bhfZiPYmXCWjxhOYnvx
 SzYlGfpGva/r+dvEbSa+NfMppOo2i5j+6HsUjAbxwsC0yNMCB8mSQea3uBbPCFn1YbCyCRNqSFZ
 VEFBHOkM657TA7caC2Z81lhCxXiTFuvWcpVaLTAQebJ5SCbWkyLh28CVy6rBj7gYxUgp6xNxf1T
 Kb4Oj0kzQTLhJLwPcGtS7OiYQNArt
X-Received: by 2002:ad4:5c8f:0:b0:6e8:e8dd:30d1 with SMTP id
 6a1803df08f44-6f0584b88ebmr238679916d6.22.1744120467500; 
 Tue, 08 Apr 2025 06:54:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFVfoTd+9pfqW+ErYCeqPWeMLcCY/0R1//lWUB1/CyCJ8Yk1+OfEXowetQ/OcPL/wroNcfq8g==
X-Received: by 2002:ad4:5c8f:0:b0:6e8:e8dd:30d1 with SMTP id
 6a1803df08f44-6f0584b88ebmr238679396d6.22.1744120467061; 
 Tue, 08 Apr 2025 06:54:27 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54c1e672306sm1515306e87.237.2025.04.08.06.54.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Apr 2025 06:54:26 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2 0/3] drm/display: hdmi: provide common code to get Audio
 Clock Recovery params
Date: Tue, 08 Apr 2025 16:54:24 +0300
Message-Id: <20250408-drm-hdmi-acr-v2-0-dee7298ab1af@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJAq9WcC/1XMQQrCMBCF4auUWTuSxIrWlfeQLpJO0gzYRiZSl
 JK7GwsuXP4P3rdC9sI+w6VZQfzCmdNcw+waGKKdR49MtcEoc1QHdUaSCSNNjHYQPFnSQZHShgL
 Uy0N84NfG3frakfMzyXvTF/1df1D3Dy0aFTrXDaY1oaXWXe88W0n7JCP0pZQPf5TImakAAAA=
X-Change-ID: 20250308-drm-hdmi-acr-7ad1f0d012df
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Dmitry Baryshkov <lumag@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1669;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=xsWGBJl8SLI8+M9O3/9jyj/1Cn/0TZ1NdGVYYXEzM7c=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn9SqRPfqX7xAPkR8Vmyj6YhBnUQjd1EtJetVwi
 N7z9QsIuYqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ/UqkQAKCRCLPIo+Aiko
 1SFxCACvwWCoVqXlqEYSfKXGeSI4vuwcBPWduErCQ3Tqww1D+5gMAePZdnisD6o+fedPih0W5vB
 WJDC6SvpNy1BeJhmSY2r3zfQLgwM7TOIBk+HwCogQnvPPdiUFUV1q46m5kclh9okJCy0whNcLZ2
 yTjxf4I4HbvG+sswym0zIRQUlBerGMC7MZNR1SrJObRDj9ibzBEyWR8OBaOFM7zLhDxWGPhLmEf
 L0XLQHcQqea72NUCNY8okKvAHO67rguEN6mWZySsVWxcpMU5cODcXkk8AtQLeH+yJsqmHea80eT
 YbDWDISq2PVsfG/QUhCHeTiXfTucDtCHqDzOYjqe3mq9SWcZ
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: OTDyO_ygUhf9gRYSh1QditTIPB7QFRaU
X-Proofpoint-ORIG-GUID: OTDyO_ygUhf9gRYSh1QditTIPB7QFRaU
X-Authority-Analysis: v=2.4 cv=I/9lRMgg c=1 sm=1 tr=0 ts=67f52a94 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=mWnm1Bu5f2UsoqAo_2UA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_06,2025-04-08_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0
 phishscore=0 suspectscore=0 mlxlogscore=999 lowpriorityscore=0 spamscore=0
 clxscore=1015 malwarescore=0 adultscore=0 priorityscore=1501
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080098
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

HDMI standards define a recommended set of values to be used for Audio
Clock Regeneration. Nevertheless, each HDMI driver dealing with audio
implements its own way to determine those values. Implement a common
helper and use it for MSM HDMI (tested), VC4 and DW-HDMI (compile-tested
only) drivers.

Note, this helper simply implements the database for these values (HDMI
Section 7.2). The question of selecting supported formats and rates
should be handled by sound/soc/codecs/hdmi-codec.c (pretty much like it
is handled by sound/pci/hda/patch_hdmi.c).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v2:
- Added missing EXPORT_SYMBOL(drm_hdmi_acr_get_n_cts) (LKP)
- Extended documentation to explicitly mention L-PCM (Maxime)
- Dropped VC4 and rockchip patchets as I'm not able to test them.
- Link to v1: https://lore.kernel.org/r/20250309-drm-hdmi-acr-v1-0-bb9c242f4d4b@linaro.org

---
Dmitry Baryshkov (3):
      drm/display: hdmi: provide central data authority for ACR params
      drm/msm/hdmi: move msm_hdmi_audio_update() out of msm_hdmi_set_timings()
      drm/msm/hdmi: use new helper for ACR tables

 drivers/gpu/drm/display/drm_hdmi_helper.c | 168 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/hdmi/hdmi_audio.c     | 107 ++-----------------
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c    |   8 +-
 include/drm/display/drm_hdmi_helper.h     |   6 ++
 4 files changed, 186 insertions(+), 103 deletions(-)
---
base-commit: 2bdde620f7f2bff2ff1cb7dc166859eaa0c78a7c
change-id: 20250308-drm-hdmi-acr-7ad1f0d012df

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

