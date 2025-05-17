Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F221AABA7A2
	for <lists+dri-devel@lfdr.de>; Sat, 17 May 2025 03:59:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B239310E0A0;
	Sat, 17 May 2025 01:59:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="F1q6phCQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5822110E0A0
 for <dri-devel@lists.freedesktop.org>; Sat, 17 May 2025 01:59:44 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54GFwpUv027744
 for <dri-devel@lists.freedesktop.org>; Sat, 17 May 2025 01:59:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=qGWiMePQgV6L4yTAdBmFNw
 MO2iLQuv57rmtFIgCbF/E=; b=F1q6phCQDYnAdxZae9pCWHkC3iAr+0XU0MB7cQ
 1bL2GutQi0t+vyiMI4rBJwZpfqUIKThV3rVKuB113ga92Mnqf6ovOiNMMix2RRBy
 2ElIPKBglJ8PlTOZkgTw61HVHNq7AmOXKArpjLp0fAUPP5Ivu1IWs5kVpT3j5in9
 E8usU7CdC6mwfaJW2J6NrERvF850k+l+sIoVKOjhlNps6h7DaRqFQ9bgWL6Fh3b4
 cmUHADppu2KLZuJ7VQxJo6SAjMKW++XVXaOJ2xyq80yR8lsSn/iYKts0iGPVZRAO
 61bf5t8pMcioUgpKiCcYqDk4ep+hz7NsnYCbael/V/j5D8MQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46p01n2m7m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 17 May 2025 01:59:42 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6f2b0a75decso65051896d6.2
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 18:59:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747447182; x=1748051982;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qGWiMePQgV6L4yTAdBmFNwMO2iLQuv57rmtFIgCbF/E=;
 b=E1ZeTYf9YaClwf/T82qtxSfw6KQoQQhaIjn0T3AdKOow5kxZVzwlQbSnU9eHhQ/b/I
 11zAGNpXVmE+09fu5ch9BsnercPfZERp7dtryn/9BLBP9+zG+HeZqwqcVZdk8MGhlie5
 DGJrwMYADzRzAHxz4WuUE6wDmRyWY+kDrtSkTpMQt8wD16Fx8j1Ixt7FlRjQvmNwvhff
 gBg2DmRW6eGBiYUSp9i6on103Ixh1KI0yuPGGHfmoHhZCDrHRKU8rjVxcz1uroj+UcFs
 PRcS0b5xVg7g6ZCojAN2iRWHq3SQDO3HC1SNWk3vaE1JjlrjxLcJQjLXqhxIVebdocxm
 KiUQ==
X-Gm-Message-State: AOJu0YwpRhehmKV/LfmRZpdL+qmw5dAhbpBrHqTxmQUphVNy/L1cPL94
 rAqczxLxSwwKGKh5fXeQTSza+Waxhpc2WMOrBoIO8jDFyTWKPReYRFV5sEfcoxWM9sePHeITAMJ
 K/o3XysyPkdNkGObXoJW4ixkG3o46NNVPIKekmZjOYNY+QFV9WR8fVOXNASxTC8dfpvUkl0A=
X-Gm-Gg: ASbGncvbNnJwi5SnIIMlS9f719hut71cBtRVHe2f9fV9hU5oCGRvX/rk2PPkorTySed
 y3zuinRrskY/2tTdOKb2G2w4fh11MNtaq1b5DYyjShV8plNlHpieK6rE3xMBZ5p1zUtPU10TrL/
 u12CpkhvhGVPHCPbnS7d1KWtzppMQsiXytC4xdtYYtIyUks5+aRgLnL/MxYfNxAbVZz/kSkE/GJ
 j7varQTKjPg0h+uOWPqAZoKh7Dyzt7ARi/Dtt6qLwSl/XcuU28FykeuornmIce3JPE3LuaBuxBY
 TkMMPHti57UZhgaZT1SFzq0hPwVil3z4VLv3YfQLt/XIrXgmOLxOgrs2yQVRrnpqkSM4AVptKxt
 y0NROZTkh1J9T2OB1u6EaBfUr
X-Received: by 2002:a05:6214:252c:b0:6f8:ae32:39a5 with SMTP id
 6a1803df08f44-6f8b2c57bd1mr84368626d6.10.1747447182046; 
 Fri, 16 May 2025 18:59:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHdRJsYEsxk0BEmeVebS2Cx8g0s90b9cPEntoWzF2SPmhijU54V83iK564eilKYSjqBg9QfZw==
X-Received: by 2002:a05:6214:252c:b0:6f8:ae32:39a5 with SMTP id
 6a1803df08f44-6f8b2c57bd1mr84368366d6.10.1747447181644; 
 Fri, 16 May 2025 18:59:41 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e70180f7sm672167e87.128.2025.05.16.18.59.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 May 2025 18:59:40 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v6 00/10] drm/display: generic HDMI CEC helpers
Date: Sat, 17 May 2025 04:59:36 +0300
Message-Id: <20250517-drm-hdmi-connector-cec-v6-0-35651db6f19b@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIjtJ2gC/3XR3YrDIBAF4FcJXq/ZcfxJ0qu+x9ILo7YRGrPVN
 HQpefc16ZYulNwMjnA+D3gnyUXvEtkVdxLd5JMfQl7UR0FMp8PJUW/zThBQMERObexpZ3tPzRC
 CM+MQqXGGctEAGleLqq1IDn9Hd/S3Ff46PPboLtfsj49L0urkMtL3ftwVi9r7ZD6fBxrcbSRLs
 vMpP/KzNpzYGv0rI7fKTIwCbWvgNRhVIbL92Qcdh3KIp9Wc8OlIYAw2HcxOA6oy9ZELpfibw/8
 5qDYdnh3ZyhataKSy+s0RLyePTUdkR1dMIWgprIQ3R74cAdWmI7MDooamZWAR1H5Iqbxc9Xn5j
 zIPcpjn+RdCS4gxHQIAAA==
X-Change-ID: 20241223-drm-hdmi-connector-cec-34902ce847b7
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6185;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=hjFdZEvl37wQhL9LcL8NZ5b+ROX0vh00ZSwY5lXDjpk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoJ+2KUDbjYoJj8Abd+H6zHWTqOwnTDahSEoqfH
 luBDg+KnueJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCftigAKCRCLPIo+Aiko
 1VxKB/0RJvE8XVan9SHutV1bRQYB+BzFsOnAMD/RvNccIxwixPSBYXedOy05FCajXEwy79xHKfF
 eNvoiofGQjNXxfcH5FQYCspQJj7y50VO6KrsP37m2BeObFI/agRJXbjrsSjJVK72wcGiAqJWBuG
 PxmuLBA7Qt0ZncgEpHc9uQnOX8GTItd6ueMsar19fFJG7K05K17YZzVHBaoFjTERrrBMnbeOCwv
 sZ8wdQkuOC84wjk3BfbdnjuY71WdJg02k1oLlixkaD3qNphGJdOF3JwyeeIqxaT9JglBYcEGYDe
 fI2ZPX5Med9OTxIHpEhjMEWUMjTCESUFjcusVB3bib52QjV+
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=M4lNKzws c=1 sm=1 tr=0 ts=6827ed8e cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=71nJb1rnCRvFoa6Wa_EA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE3MDAxNyBTYWx0ZWRfX47lvn/MPZPOd
 9ayBsKqeM/DFzEHaa8wf9HB5h4Qxfdj3DQhs5SUtn9+uJ2OPggv0kKPtbWLPphKtg3OF2iiEbgg
 HIwZbQV2MzaSyT2A/Z4zGBrbndaHIdYJXSy7W6d0zM1OmpBCjtihtJoQw5DS8rxckQOc8fUvnwP
 /UHjwELBd6yRHB17QpoH730cfsyXp2hRzh0c+ZmI9GgbhO126Ji+7VngRCyolNS4Gc3++PxCAGn
 LGUJmzdtRRm5p0IC0hDJEx1CU1FR3B4A0tMq6b9tWDUnSbrGv3Jp7BLvZUlYy3zaeyJxXGHHM9K
 hv1TW6VFB475kEGej1vWqJXcvKgCZzrRhot3vDJ7Rsw7DrPdcwVGRj9cH5dtkKs5+cYuR0RmoTS
 AyuVQi04IJ1VPW219be30ckYnX6Oobd0GWiNrtKqLQ+Fu1+rD/XIqu2hnUqtgmm2DL2/njAe
X-Proofpoint-ORIG-GUID: y-REDyLz11yDnVepz9ZsVpxaHmW2cMJA
X-Proofpoint-GUID: y-REDyLz11yDnVepz9ZsVpxaHmW2cMJA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-17_01,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0 mlxlogscore=999
 mlxscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505170017
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

Currently it is next to impossible to implement CEC handling for the
setup using drm_bridges and drm_bridge_connector: bridges don't have a
hold of the connector at the proper time to be able to route CEC events.

At the same time it not very easy and obvious to get the CEC physical
address handling correctly. Drivers handle it at various places, ending
up with the slight differences in behaviour.

Follow up the HDMI Connector and HDMI Audio series and implement generic
HDMI CEC set of helpers that link into the HDMI Connector and
drm_bridge_connector frameworks and provide a way to implement CEC
handling for HDMI bridges in an easy yet standard way.

Notes:
- the patchset was only compile-tested
- being an RFC some of the API functions and structures are left
  undocumented
- although the patchset provides drm_bridge / drm_bridge_connector API
  for working with CEC, there is no actual bridge that uses the API
  (yet)

- I'm pretty unhappy with the drm_bridge integration code, we end up
  duplicating wrappers for CEC functions instead of reusing the
  drm_connector wrapping functions. An easy way would be to map
  drm_bridge to the corresponding drm_connector, but that would
  either require a state or storing drm_connector inside a drm_bridge.
  Current code stores cec_adapter instead.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v6:
- Fixed vc4 to build with changed API (Maxime)
- Reworked helpers to use drmm to unregister CEC implementations
  (Maxime)
- Expanded commit message to explain void *data design (Maxime)
- Dropped extra include of drm_connector.h from drm_hdmi_cec_helper.h
  (Jani)
- Link to v5: https://lore.kernel.org/r/20250407-drm-hdmi-connector-cec-v5-0-04809b10d206@oss.qualcomm.com

Changes in v5:
- Fixed the check in adv7511_bridge_hdmi_tmds_char_rate_valid().
- Major rework of HDMI CEC to follow 'helpers' design. Implemented
  generic data structures that can be used for both CEC notifiers and
  CEC adapters (Maxime).
- Link to v4: https://lore.kernel.org/r/20250202-drm-hdmi-connector-cec-v4-0-a71620a54d50@linaro.org

Changes in v4:
- Rebased on top of drm-misc-next + commit 78a5acf5433d ("drm/display:
  hdmi: Do not read EDID on disconnected connectors")
- Moved 'select DRM_DISPLAY_HDMI_CEC_HELPER' under the
  DRM_I2C_ADV7511_CEC symbol
- Fixed documentation for @hdmi_audio_i2s_formats to describe default
  behaviour.
- Split drm_connector_cleanup() patch from the patch adding CEC-related
  data structures (Maxime).
- Documented that CEC mutex protects all data fields in struct
  drm_connector_cec (Maxime).
- Improved drm_connector_cec_funcs.unregister() documentation.
- Documented struct drm_connector_hdmi_cec_adapter_ops fields. Added a
  note to the commit message on the difference between it and struct
  drm_connector_cec_funcs (Maxime).
- Fixed Kconfig dependencies.
- Link to v3: https://lore.kernel.org/r/20250126-drm-hdmi-connector-cec-v3-0-5b5b2d4956da@linaro.org

Changes in v3:
- Moved default available_las setting to
  drm_connector_hdmi_cec_register(), allowing drivers to pass 0 instead
  of CEC_MAX_LOG_ADDRS.
- Reworked drm_bridge interface to store opaque pointer and interpret it
  as drm_connector in CEC helpers code.
- Fixed EINVAL checks in drm_connector_hdmi_cec_register().
- Added the adv7511 patch, demonstrating CEC helpers for the DRM
  bridges.
- Link to v2: https://lore.kernel.org/r/20250110-drm-hdmi-connector-cec-v2-0-9067c8f34663@linaro.org

Changes in v2:
- Refactored CEC funcs, adding more wrappers to provide more consistent
  interface (Maxime)
- Removed export of drm_connector_cec_unregister() (Maxime)
- Restored and rephrased comment in vc4_hdmi (Maxime)
- Squashed vc4 patches
- Link to v1: https://lore.kernel.org/r/20241225-drm-hdmi-connector-cec-v1-0-b80380c67221@linaro.org

---
Dmitry Baryshkov (10):
      drm/bridge: move private data to the end of the struct
      drm/bridge: allow limiting I2S formats
      drm/connector: add CEC-related fields
      drm/display: move CEC_CORE selection to DRM_DISPLAY_HELPER
      drm/display: add CEC helpers code
      drm/display: hdmi-state-helper: handle CEC physical address
      drm/vc4: hdmi: switch to generic CEC helpers
      drm/display: bridge-connector: hook in CEC notifier support
      drm/display: bridge-connector: handle CEC adapters
      drm/bridge: adv7511: switch to the HDMI connector helpers

 drivers/gpu/drm/bridge/adv7511/Kconfig             |   5 +-
 drivers/gpu/drm/bridge/adv7511/adv7511.h           |  52 ++--
 drivers/gpu/drm/bridge/adv7511/adv7511_audio.c     |  77 +----
 drivers/gpu/drm/bridge/adv7511/adv7511_cec.c       |  57 ++--
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c       | 345 +++++++++------------
 drivers/gpu/drm/bridge/adv7511/adv7533.c           |   4 -
 drivers/gpu/drm/display/Kconfig                    |  13 +-
 drivers/gpu/drm/display/Makefile                   |   4 +
 drivers/gpu/drm/display/drm_bridge_connector.c     | 108 +++++++
 drivers/gpu/drm/display/drm_hdmi_audio_helper.c    |   3 +
 drivers/gpu/drm/display/drm_hdmi_cec_helper.c      | 192 ++++++++++++
 .../gpu/drm/display/drm_hdmi_cec_notifier_helper.c |  64 ++++
 drivers/gpu/drm/display/drm_hdmi_state_helper.c    |   7 +-
 drivers/gpu/drm/drm_connector.c                    |  42 +++
 drivers/gpu/drm/vc4/Kconfig                        |   1 +
 drivers/gpu/drm/vc4/vc4_hdmi.c                     | 139 ++++-----
 drivers/gpu/drm/vc4/vc4_hdmi.h                     |   1 -
 include/drm/display/drm_hdmi_audio_helper.h        |   1 +
 include/drm/display/drm_hdmi_cec_helper.h          |  72 +++++
 include/drm/drm_bridge.h                           |  76 ++++-
 include/drm/drm_connector.h                        |  48 +++
 21 files changed, 880 insertions(+), 431 deletions(-)
---
base-commit: 3330b71caff6cdc387fdad68a895c9c81cc2f477
change-id: 20241223-drm-hdmi-connector-cec-34902ce847b7

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

