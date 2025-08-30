Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC6DB3C61C
	for <lists+dri-devel@lfdr.de>; Sat, 30 Aug 2025 02:23:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 123DC10E2B7;
	Sat, 30 Aug 2025 00:23:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="o12dTTKN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0731010E0DB
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Aug 2025 00:23:04 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57TFaleZ001824
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Aug 2025 00:23:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=IN6pTMVXIP/HlenGwHRNNU
 K4pAbKppfkJLc5GQ+V4dk=; b=o12dTTKNN6jLOc/Zc9GjC8QFtOr6OY4ayJtqWF
 61qJNUDD+dOZ47GtKiiRoD+XQgjX9sMYPTblN1Zf4TxXQPGKppJKHrOs6KB5DY4L
 fx6Ijclr9LavmQFUfv/1GFOE70+UWHBbODZ7SaRI74d1o/bo7XvlidvgiF/bXv8T
 9hxDjVEg1zj7O0Usu1c5UiOuwELRndortQVlB4HmuwKPFbVIjVt4zagVjBshNMLa
 4RKRTer1RKfWedqgaZ1QnifY5NpK/agukFqwcCeZxZy0TwZ2xvKdKS8IrUO9ZBMy
 Tf/gnj+b4515XWSkMIRArLIBJzhHhG3p0ZCfMdYfwT3dr2fA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5wectfr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Aug 2025 00:23:03 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4b31bea5896so2536321cf.2
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Aug 2025 17:23:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756513383; x=1757118183;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IN6pTMVXIP/HlenGwHRNNUK4pAbKppfkJLc5GQ+V4dk=;
 b=Ipx9As2GeX9LUwYGhN2PwkIkSD2Msi3FmlETyOtPsBSm9l/TnfWWsb5fd0HMDmgO+E
 QLLsI5JxxnuTD6yraqVFjTNqs43+PwLbsaBWwqsBSnCC38fWgiXDz3NqxKH6fI4/52z0
 XqQlnavmwZjuuS73DmrqDGJJih+86Tvpx6aEyP4HRPZp0QvJTF0pgkNL7SrUOnR04UpX
 5bPkKr8lmS5rfgu2bgXESj/DA69wgG9fyc9duj3gZo/fs+zKMWVoRPFI7zkwhr39/ugW
 TGy63bikDYPPNIpVlYvW2yWj4dqmN8yWhXOEic9pWi51Oxqrx3YD++VqgyvFc9B3cP0X
 iE7Q==
X-Gm-Message-State: AOJu0Yy2xdEqHOB3BjnIAdDBj191cDHC+VVTcmNYbJJ1f7o8ZIBE1fu7
 cvUqhyQ2oqA+lVJduF5Jt2RWFrp5rNpTrc3QWg1O+GGfnbPSN9J1Rua4NIBqD1Lrcn4Lb5AxGDB
 os9Z/zfdqjMnsefHwg31QeptWYvSM27Bfofw47E1nmGe3/uFT3EGyh/zJAceTGzUP92Sfdd8=
X-Gm-Gg: ASbGncu2o47wk6MS6IPRmx06P2A6++/lG1z8Zsqdri2jN4hRCCuk/6pWOGTucl83Lyh
 gOcuBp9vhnd1sPzExmHHOFIWEcD3vNs/oOwWf9OjdZ/ByJGkS5PhLHFqGkwvDoX4SwYjYXPtX7b
 4wxw8CuzSWl1E+9G2og9NYKhiTl6YhcwYJBTmNmWzhlc4MQzdwF08hj9tm7XQKA10TJbixkTBc2
 /AGPIv9TENWjM2gYAiNSXwStsOKCswgV+dKOPeFF7u2eX+syHoWcL/mIKzeC80o/eVLObXta6Sk
 UKJks4vmDEwHVi5jedGrQlxi6/ZS8S9PyyMfljJsHxlCYpK94Me0EwVfRu7UNOCx6e/upvU14Eu
 4ulTyAqslli+nMneif2UNBBIe698oO8fmqD33ENSFkgCUS/jUtoRI
X-Received: by 2002:a05:622a:3d0:b0:4b0:8e2e:fd9b with SMTP id
 d75a77b69052e-4b31d841b8bmr6340701cf.28.1756513383045; 
 Fri, 29 Aug 2025 17:23:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE9LDaqfPkXcTKRcfc1aA44E7iMFC4s0jpuyP6SEvxDgqx16wPnVQjbJmp4eKUiP/CaJNa52g==
X-Received: by 2002:a05:622a:3d0:b0:4b0:8e2e:fd9b with SMTP id
 d75a77b69052e-4b31d841b8bmr6340331cf.28.1756513382427; 
 Fri, 29 Aug 2025 17:23:02 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55f676dc52esm1019907e87.8.2025.08.29.17.23.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 17:23:01 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v3 00/11] drm/connector: hdmi: limit infoframes per driver
 capabilities
Date: Sat, 30 Aug 2025 03:22:56 +0300
Message-Id: <20250830-drm-limit-infoframes-v3-0-32fcbec4634e@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGBEsmgC/3XQwW7DIAwG4FeJOM8dISM0Oe09ph1oMK2lElZMo
 1RR372kVaUd2gvyj+wPi0UwJkIWfbWIhBMxxbGE5qMSw8GOewRyJQsllZbbWoNLAY4UKAONPvp
 kAzKg2SpvjW+aVooy+pfQ03xnf35LPhDnmC73V6Z6vX2C7WtwqkFC64baOO2lwe47Mm9OZ3scY
 gibcojVndR/q3tjqWIZ3WnnrPryO/fCuj6WTng6ly/Ij83FzjLC2kS5r1Y7EA+fzwJGnHMZvd4
 ASbw2h0UBAAA=
X-Change-ID: 20250815-drm-limit-infoframes-e782fa7f3360
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sandy Huang <hjc@rock-chips.com>,
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Liu Ying <victor.liu@nxp.com>, Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3718;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=j2WFIoiYZY4mvy1n1cE7iNg5twCtSflR486EGLADOXY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoskRjU90bIF/CWwFMn6YjwNwwP4vc6O+nHPJdM
 peW29wEpNmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaLJEYwAKCRCLPIo+Aiko
 1bynCACiJto6tHqy6NRaMI9XSFtJjDhGG9NxaK8XYGS50rbbkRizcc6WRtsCcNv0x4E8tURgw5d
 xD/LGzTuMjBl03KdrIc1pxIl9YB6IabYmi8V1oapcB9mFf6Z9cA6B/nRxe1rZEppabTUE5N3/Ln
 AQC0I6KKebn5PuPQtJLUovBxSXnu1nIugsl8CK4KZ7Fp+0IPpKcpLvGQgm/eGjdw8scPgD/i8tm
 FDGJHbs8XR1rv3RDvp4P5QgCynMvltkRCGGPQCspMHPNY+A8PoH05xLW86JnIQ4B6Rrb8wy9Yrk
 jKR550siSDIxvPLD7lP43sT32WfeM+BVoBY2Ceq2X/kh56h6
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: JSIzqccWtbx7fHGf9-RZTqDGTEzajMRs
X-Proofpoint-ORIG-GUID: JSIzqccWtbx7fHGf9-RZTqDGTEzajMRs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX9aoi/1Kb9+4l
 T3yq7JGQcdQaP5DDsSr/iQ5kSelQQzEJ9lhB70gk3qcPDham7oCr1HUs2PT7bDHGRyo6SloumR8
 lE+2hfOvexOY583uWjxvYPKmFUS9p2j9oI9pi/TINdV3mQ6IxOe9CGHmtTx1o2c3+VUqIBaka2S
 Yd9FCTfZFvxTTI/dDLY4NVgc/MReJUGyzRoQzXM81VNYaFd7Kz+ot8cd7B9NL9RtegC8nOGOMco
 94dspBk4WR7f1LwVPjpre3rhdi+wqckm8TWUZ9TMHRkU2Pjz2bl6mdx/2Q5bYvADYGKjdAIcFdw
 JbHiSvJGBZeCRhONF0AhW17JPgz8+uw7PdQw9YxzPZw1PIv4o7bRn3AZk/a036rfhDmo84GpHsE
 d1i682yQ
X-Authority-Analysis: v=2.4 cv=BJazrEQG c=1 sm=1 tr=0 ts=68b24468 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=9umpI5-D6xKxpy0QfyMA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-29_07,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 bulkscore=0 phishscore=0 suspectscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508230033
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

It's not uncommon for the particular device to support only a subset of
HDMI InfoFrames. It's not a big problem for the kernel, since we adopted
a model of ignoring the unsupported Infoframes, but it's a bigger
problem for the userspace: we end up having files in debugfs which do
mot match what is being sent on the wire.

Sort that out, making sure that all interfaces are consistent.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v3:
- Fixed supported infoframes initialization (Liu Ying)
- Implemented separate flags for DRM-generated InfoFrames and
  hardware-generated ones
- Warn if required InfoFrames are not supported by the driver (Maxime)
- Changed drivers to error out if the DRM framework requires the
  unsupported InfoFrame (Maxime)
- Implemented DRM_BRIDGE_OP_HDMI and DRM_BRIDGE_OP_HDMI_AUDIO for
  Lontium lt9611uxc bridge.
- Link to v2: https://lore.kernel.org/r/20250819-drm-limit-infoframes-v2-0-7595dda24fbd@oss.qualcomm.com

Changes in v2:
- Corrected whitespace / newline issues & other small syntax fixes (Liu
  Ying)
- Added audio to the list of InfoFrames supported by the VC4 driver (Liu
  Ying)
- Changed drm_dbg_kms() to drm_warn_once() in the Audio InfoFrame update
  code (Liu Ying)
- Corrected subject for ITE IT6263 patch (Liu Ying)
- Added patch, dropping default list of InfoFrames in
  drm_bridge_connector.
- Link to v1: https://lore.kernel.org/r/20250816-drm-limit-infoframes-v1-0-6dc17d5f07e9@oss.qualcomm.com

---
Dmitry Baryshkov (11):
      drm/connector: let drivers declare infoframes as unsupported
      drm/bridge: adv7511: declare supported infoframes
      drm/bridge: ite-it6263: declare supported infoframes
      drm/bridge: lontium-lt9611: declare supported infoframes
      drm/bridge: synopsys/dw-hdmi-qp: declare supported infoframes
      drm/msm: hdmi: declare supported infoframes
      drm/rockchip: rk3066: declare supported infoframes
      drm/display: bridge_connector: drop default list for HDMI Infoframes
      drm/connector: verify that HDMI connectors support necessary InfoFrames
      drm/display: hdmi-audio: warn if HDMI connector doesn't support Audio IF
      drm/bridge: lontium-lt9611uxc: switch to HDMI audio helpers

 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c       |  10 +-
 drivers/gpu/drm/bridge/ite-it6263.c                |  11 +-
 drivers/gpu/drm/bridge/lontium-lt9611.c            |  11 +-
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c         | 130 +++++++++------------
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c       |   7 +-
 drivers/gpu/drm/display/drm_bridge_connector.c     |   2 +
 drivers/gpu/drm/display/drm_hdmi_audio_helper.c    |  12 ++
 drivers/gpu/drm/display/drm_hdmi_state_helper.c    |  53 ++++++++-
 drivers/gpu/drm/drm_connector.c                    |  17 +++
 drivers/gpu/drm/drm_debugfs.c                      |  16 ++-
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c             |   8 +-
 drivers/gpu/drm/rockchip/inno_hdmi.c               |   6 +-
 drivers/gpu/drm/rockchip/rk3066_hdmi.c             |   5 +-
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c             |   4 +-
 drivers/gpu/drm/tests/drm_connector_test.c         |  49 ++++++++
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c |   9 ++
 drivers/gpu/drm/vc4/vc4_hdmi.c                     |   6 +
 include/drm/drm_bridge.h                           |  14 +++
 include/drm/drm_connector.h                        |  39 +++++++
 19 files changed, 306 insertions(+), 103 deletions(-)
---
base-commit: f4028ef65dc4fe9010bcc017597fe0fea6479097
change-id: 20250815-drm-limit-infoframes-e782fa7f3360

Best regards,
-- 
With best wishes
Dmitry

