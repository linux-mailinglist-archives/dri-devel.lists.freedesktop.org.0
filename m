Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37928A87288
	for <lists+dri-devel@lfdr.de>; Sun, 13 Apr 2025 18:33:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77BA410E2F3;
	Sun, 13 Apr 2025 16:33:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="lFxlRlw9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E65BA10E23A
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Apr 2025 16:33:01 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53D9wQqU013837
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Apr 2025 16:33:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=YBl77YCXWG4OvagfLRquKk
 7aupLLR8079UVqKJKZGMQ=; b=lFxlRlw9zR4dMXfQHbQF8y7GJN3ACKQN/PNHRa
 QJhhlQeX24tVvBIUCRQlv6X9zFqROhnfSxnm3izl3XZbBL6thntR4IU7gJXEtV3L
 JfB2QyKMmGVclOEn1tQ3AlkQ8S3MMZ+vRfXMwjnDuIoUMg4rh1N9JjSGOVMgyRJb
 eZSNdIPkSJXghARosTj4nZi2jgfwtHSkIYpOPZegsf0C+wc0fnvtW4060gZl6qhV
 mQJiQqJOBnUM4ThSGSDJ7PxaFyDAh5pNQf05cl9IGo8qR315ti+2VPJF0GQcHhpd
 vfjVl7GcigZe0+c1g7CFk20HQ8ubeml3XEAqI/lxH+SbMgZQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yg8wabcd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Apr 2025 16:33:00 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6ed0cc28f7dso91418346d6.0
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Apr 2025 09:33:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744561980; x=1745166780;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YBl77YCXWG4OvagfLRquKk7aupLLR8079UVqKJKZGMQ=;
 b=Ay76ue6+4odlc0wLu3JnIBUVYKaHk1BQRmqJqwOA2JghKhXB7GIwsf/ypR/oGV22au
 J7HIOZsMkN4LCYiYnvRTN248k0iMwrihs+k1JiyWYjtTWyziPKgiiaxMUY5JntnUMzyd
 4uphLjJ6cojZUaVzHlGGeuqtqEDTwlu2oQY7aTtMgl1GKnBFicVK+BpGgOSy0MdSlNqD
 OQbg75APh9BiOMHpaBjDHVfMxHB3llrnNIpnP3SAaX/pp3c3joRde7E6XfMJp9FNtlj1
 yt7o7x+8trqozr3L8NMU7rMSidkPBFtHeqKE5Crmf+hbi1L1dIdFMvus2YIAwEALUty5
 ngSA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWB0FK6T6BLOho3qlG7BqLvSWfJLuFt3Dk6cIsph7lvyk/jHaVxKCU1y9qngQxwpjlSXUX978WY+C0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxruAWlbfh6wM4ILfTSuHikuanfBUXDHs2Yio/9TbSeV+nc9Izf
 bbNq/4PhpLWxBU1enBRIib+NGEW3Ms32DrxSOEKWgd+D2dxxBDre6UrI8W8kAKQzGjw8I03CCU+
 OwV+NI/4fSzOv9RAPjvICJFMzolAiOtSzT7D0pPy6R4mmJiRZIApPNWs+hih052AwNsM=
X-Gm-Gg: ASbGncs66iGuJ8vOpRb8AWnS2aQsRU8izeDyszy8jRSzcp/WTdaFA61y9px1QBcd4F0
 iZWzcAs8F/4VaHYXBA2YetmEwxb7yvGMPboVdz7Ux5ZKzBOQ0CLTJS4keSzmFXY9TF1l46LcguY
 1THmd98YMog+tsolsCGU+O2K+uGPZ043TbF9N3kGALdW1mg7ksc17XI5ydAhFnDGLoMVF1NyRRC
 TyKzFq515hWmAt3vh1Ms0XHFc6U6Mw4u8zSlpXaowy3Xpt+RXSHeansfLJi4hvHlu7mDR4/Ykx8
 WOvJdI7B421ROXmghYgtZnmDgEuhNWbPmjbwpn/tr4KlBDqVYeE40znkWwW1EHVyj/EJ2jmtpef
 JyKJQ8YpOd3jGOeN7K2+oqoKS
X-Received: by 2002:ad4:5be4:0:b0:6e4:41b3:497e with SMTP id
 6a1803df08f44-6f23f16f311mr145153116d6.40.1744561979963; 
 Sun, 13 Apr 2025 09:32:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHtCj60GSXxfWYW6yCvFGLGwmwV2r19VcaQu0T/FGwl59yVWji21Ut9R7m3Ll7RuSOvQbKz3Q==
X-Received: by 2002:ad4:5be4:0:b0:6e4:41b3:497e with SMTP id
 6a1803df08f44-6f23f16f311mr145152756d6.40.1744561979496; 
 Sun, 13 Apr 2025 09:32:59 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30f464e9812sm13345431fa.49.2025.04.13.09.32.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Apr 2025 09:32:58 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 0/7] drm/msm: rework the ties between KMS and GPU parts of
 the driver
Date: Sun, 13 Apr 2025 19:32:54 +0300
Message-Id: <20250413-msm-gpu-split-v1-0-1132f4b616c7@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADbn+2cC/x3MSwqAMAwA0atI1gbSUhG9irgQjTXgpzQqQvHuF
 pdvMZNAOQortEWCyLeoHHuGKQsYl2H3jDJlgyVbkTMGN93Qhws1rHKircmwa9jRTJCbEHmW5/9
 1/ft+QL+XvF8AAAA=
X-Change-ID: 20250411-msm-gpu-split-2701e49e40f0
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1842;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=9yxMEHvKcP03zKtalrD4vW6AanrAlYnI7Y8o1GM4qBg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn++c4vA3nd9QkmmdiQrZIPvD22E3LjnDqLpDGA
 ryY5j7Da7qJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ/vnOAAKCRCLPIo+Aiko
 1aPSCACvx9Tr29RYG5QYv4mlFUzXExNlNdqg2FBYwRpglLSvUiiNhiLE/JINv+O4UNIDQIAl67N
 QXDf3cOGw5+9GuPQWMZfDZ6zIO5uUXnmyLUlbv4lmz2zmaqB9K3ddfls6oIot9C12zfu5nRx3Jf
 fGW1FIUAAN0cbGD/OPwER5sX2wCcW29UBzkOzPDHaxmqTTuUhhchVxT1ieZQ+m16x+nGQkvrAeO
 bK1QTCWmym68tB/O58e4YiQib8OtH4f9OkC0xqGRgGfFx2ni3684pkZFSXjYHuFuVs5P0tp9ZFt
 oVMNVLYEApTa2H0Etq2VaYlo8TTjVDpQjh+Y1M726qplCqDe
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=E9TNpbdl c=1 sm=1 tr=0 ts=67fbe73c cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=gunw-TT0iufYsHqiWz4A:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: 6JyKuxPItHBEFNrClnkpV25rIWBTgkG4
X-Proofpoint-GUID: 6JyKuxPItHBEFNrClnkpV25rIWBTgkG4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-13_08,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0
 mlxscore=0 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 suspectscore=0 mlxlogscore=999 spamscore=0 priorityscore=1501
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504130127
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
Dmitry Baryshkov (7):
      drm/msm: move wq handling to KMS code
      drm/msm: move helper calls to msm_kms.c
      drm/msm: make it possible to disable KMS-related code.
      drm/msm: bail out late_init_minor() if it is not a GPU device
      drm/msm: rearrange symbol selection
      drm/msm: rework binding of Imageon GPUs
      drm/msm: enable separate binding of GPU and display devices

 drivers/gpu/drm/msm/Kconfig                |  34 ++++--
 drivers/gpu/drm/msm/Makefile               |  16 +--
 drivers/gpu/drm/msm/adreno/adreno_device.c |  39 ++-----
 drivers/gpu/drm/msm/dp/dp_debug.c          |   4 +
 drivers/gpu/drm/msm/msm_debugfs.c          |  97 ++++++++++-------
 drivers/gpu/drm/msm/msm_drv.c              | 168 +++++++++++++++++++----------
 drivers/gpu/drm/msm/msm_drv.h              |  13 ++-
 drivers/gpu/drm/msm/msm_kms.c              |  36 ++++++-
 drivers/gpu/drm/msm/msm_kms.h              |  25 +++++
 9 files changed, 285 insertions(+), 147 deletions(-)
---
base-commit: a4e1d05abd6847ba11edf46734efecec86a1fe2c
change-id: 20250411-msm-gpu-split-2701e49e40f0

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

