Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E47B0B28EE0
	for <lists+dri-devel@lfdr.de>; Sat, 16 Aug 2025 17:19:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 011A410E385;
	Sat, 16 Aug 2025 15:19:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="oCAgJmfF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B41F010E385
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Aug 2025 15:19:41 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57G3AQR3020672
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Aug 2025 15:19:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=5lryexlqd0cwKQzcmybpaI
 +3EMl9PhbQcl2IWaTvkAM=; b=oCAgJmfFi/I2hzZFvUUpZcIkfXUtBg3UORsCZf
 JW43oqB6fB7mnzKdW1JpGIZ9TtzLtE+W3jZ36ZMH0RXXf53Mhu96U37P8XUnxarY
 oimPLzWmgJZFXbICcXB0HBA1w1gu09hc1CXhdn16cHauAmztii6bPGsJnEFJoSC3
 aYiCb5CpR3aeAnly/872UnqG7qWifllQ4xar86OOnxToYp63YUVDlMLJ7cDGODHY
 oH6TvRWa1VymRh1hvQ7/2Lbt+4Mcrs7mZQrgFZ+OPFp7MRkfVs3ANWt4JXNERfd9
 6AHTINJsBENxDPhLNKJRYyljl1ij1Dn+lNT1choVU6dt8tAQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jhjy8v1w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Aug 2025 15:19:40 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-709e7485b3eso73484546d6.1
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Aug 2025 08:19:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755357580; x=1755962380;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5lryexlqd0cwKQzcmybpaI+3EMl9PhbQcl2IWaTvkAM=;
 b=e67bfXucjPdJmTeFkuMytvvHX7xkcmS9UU14L8Pwt5zr6zcrihLJWGtRHRg50D8z5j
 JljVOiOfXqx0b1aWTRzSf5hbF2QFkp/+UKqQZvpFRcRaGOXwsaSX4133eBJxStPxtQna
 c5TTS3DXJBwX97TUiWvIGDLt12i4yAoang4PxrZkKUfjrB7Es7uRI9u8DwekvJM4mGT5
 +6tj3TnKBABvicoxImxRVEd+JxEuWvu1h1hubJKEBNaYJue7X5i3iT3ZpwnR/IIaaSLm
 QoWM5+BgXKIyM93KFFCwKWoGzPy9jSc4vf5zp/3DTqvQVKu/CTduFbgWPK0MSwgmn2FN
 dNXg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVaHNJMf4grcGWXjUMvsi1PtPBU1glAuRvmP25nIuyhuQxUdaoreu0BXnLZQePvgChNXwB3YxheFi8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyNxKcfsWN/p8+WHKPDs9+kWeOoxV2iJJQgHbWE5aqY/AD9pJhd
 2kqj0QA/KiCjqjUFN34XhYyoRcMKFrptCJQVs0kaHKtrJhbBZKszglU8xhXbc9/KnKEbkQdW7Bt
 DVENLdyH1OtKNiSEXeDM2uadxYNt4ynuaJKu1hAVdu6NR8MbTc95bTRHXDM7fv0bPuLDdS5Q=
X-Gm-Gg: ASbGncuuw85RhfIzzo13WQtZ1xb3tWEItsU4vBfb2Ty0vfhLMRz/t8i/vdSKkHdPA6P
 v5st6+KUg/1XdwI7D8ewvy+YcB0u7CoTqNfapqs5b7SZm2YcWt3JH+8NQPF9rk2pXhs5lRQdhcz
 R0Pxy48zuYMetryNjzIdjGMBRBYCIZozY0vHha3extZH/Lx1kOb0WFDEC1orXv9kOAeAd8saVqw
 Ux0yzVJX7+yjDo/b8uRZAmTFQD0l/pV8PbJK+/JWum9qr7Jv5j5E0qENVsVV+2tLOdOw4S+q3ws
 YPP+6MUcUdlLd1CwSY3flyRM3aibiRsR006Hq2J351dVrGErwTNKW07eWwk21BhnU4PqQQj/2eM
 4V4qZU6RT5stSz3oI+m0f/we5KQLHpXzzhcZfuiX6QE48ObpUqkRq
X-Received: by 2002:ad4:5587:0:b0:70b:ae3b:4fcf with SMTP id
 6a1803df08f44-70bae3b53demr47856516d6.23.1755357579675; 
 Sat, 16 Aug 2025 08:19:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHfelfomvA5wci6xz+3wi0J8SULNHFeOUuYXDPXJ1C+6Dag8vtfdR/Y+CaRJy4U66cTGuwdXA==
X-Received: by 2002:ad4:5587:0:b0:70b:ae3b:4fcf with SMTP id
 6a1803df08f44-70bae3b53demr47856216d6.23.1755357579187; 
 Sat, 16 Aug 2025 08:19:39 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55cef35965fsm907579e87.37.2025.08.16.08.19.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Aug 2025 08:19:38 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2 0/8] drm: writeback: clean up writeback connector
 initialization
Date: Sat, 16 Aug 2025 18:19:34 +0300
Message-Id: <20250816-wb-drop-encoder-v2-0-f951de04f4f9@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIahoGgC/3WOwQ6DIBBEf8Vw7lokKtZT/6PxgLBWkioKaG2M/
 17U9NjLZmeyM29X4tBqdKSMVmJx1k6bPgh2iYhsRf9E0CpowijLaEETeNegrBkAe2kUWrhxQSX
 PapUpTkJqsNjo5Wh8VEG32nljPwdgTnb3f9ecAIWCpXma05Q1XN2Nc/E4iZc0XReHQartZFgcp
 /CsP0GkFg5hP9K+jJTtoNNOXn8L9Lj4EN2+MNFAzu8AAAA=
X-Change-ID: 20250801-wb-drop-encoder-97a0c75bd5d7
To: Jani Nikula <jani.nikula@linux.intel.com>,
 "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2260;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=A/d943iupZVCsxCU+H3jAnKd2fBEwptYqE3Wnl3fWfg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBooKGIGMd13UWHpYiChLD84LKwc5yW7HTOFZ5Nc
 BeTRdJYMi+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaKChiAAKCRCLPIo+Aiko
 1VU2B/4olLxWynZ6yiMZ4UeXGeUOQWFTHVS0OmcvLMCYAz5OQG0aZQ8ccKIlHwyxoHSBsBg78Mr
 5QdHuJQEQDktITLER+XgXzSQGcAgijiinR/nhTa+NfpLIGR/EZrDmm2Pzno0MlDiSYg29IhxB4T
 kEyqTv5mjfkGwilg9DYt3nua1zSszeQdW1SnwwmS2bJ5BNDrwFKw9Be1apeVE0V5bbt3gjV9cJ1
 CTyH4/m6IJr1ZW1Z9GAeYcsmchIGnAeuuUGT6OENI6yZkiEVDemT5O54HW7bSXSXNU41/Le5fiv
 QQeKwVTkV8cEZ7a13v/GM/cWDBTcehtOQTW4bxGUsGsKFDS6
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: 174pS7FAAoKYh49IZXZP9OFz8gMvRIga
X-Authority-Analysis: v=2.4 cv=ZJHXmW7b c=1 sm=1 tr=0 ts=68a0a18c cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=cFjmsF-WLDi_aLc5EnEA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: 174pS7FAAoKYh49IZXZP9OFz8gMvRIga
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyOCBTYWx0ZWRfXyEic5Ywmm5ob
 /7qjQnhX5wbMA1zf1BuMCny0ZbKikAPeRCRqYyXKUq63z/Q9ijQjqbg74x0pDOithAfnuUaZ12d
 vw5oLNC7UCpzjs4NhO+o1gQ2xva4r6rtr7k4a37GwbXLT6GRpkRPWSL273IZd44AorkrsjFDSeb
 7Kug3XfpRn4L5SLuasa8ixigh7PSS+gN4q/VAdtMFYEuMIJ/1igizgJsNFp42HBgj+/HBDDrSff
 cx5Jfa15uwTC/9+GYYUeOic0/zCuLlYVy2DvcCSTZGyVFMEJzXvWpfdFxA7vxr49oNL1jc9/e5A
 41PJdjxUrURnADtqmt5zgaZJxojRywBhullA39HfsQ6Dc7E2jwSSsRQYQ9Dm+gGEAIZVuewO0Ly
 xOXPXMX/
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-16_04,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0 clxscore=1015
 bulkscore=0 spamscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160028
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

Drivers using drm_writeback_connector_init() / _with_encoder() don't
perform cleanup in a manner similar to drmm_writeback_connector_init()
(see drm_writeback_connector_cleanup()). Migrate all existing drivers
to use drmm_writeback_connector_init(), drop
drm_writeback_connector_init() and drm_writeback_connector::encoder
(it's unused afterwards).

This series leaves former drm_writeback_connector_init_with_encoder()
(renamed to drm_writeback_connector_init as a non-managed counterpart
for drmm_writeback_connector_init()). It is supposed to be used by
drivers which can not use drmm functions (like Intel). However I think
it would be better to drop it completely.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v2:
- Switched to drm_crtc_mask() where applicable (Louis Chauvet)
- Link to v1: https://lore.kernel.org/r/20250801-wb-drop-encoder-v1-0-824646042f7d@oss.qualcomm.com

---
Dmitry Baryshkov (8):
      drm/amd/display: use drmm_writeback_connector_init()
      drm/komeda: use drmm_writeback_connector_init()
      drm/mali: use drmm_writeback_connector_init()
      drm/msm/dpu: use drmm_writeback_connector_init()
      drm/msm/dpu: use drmm_writeback_connector_init()
      drm/vc4: use drmm_writeback_connector_init()
      drm: writeback: drop excess connector initialization functions
      drm: writeback: rename drm_writeback_connector_init_with_encoder()

 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  2 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c   | 18 ++++--
 .../drm/arm/display/komeda/komeda_wb_connector.c   | 30 ++++++----
 drivers/gpu/drm/arm/malidp_mw.c                    | 25 ++++----
 drivers/gpu/drm/drm_writeback.c                    | 69 +++-------------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c      | 10 +---
 .../gpu/drm/renesas/rcar-du/rcar_du_writeback.c    | 23 +++++---
 drivers/gpu/drm/vc4/vc4_txp.c                      |  9 ++-
 include/drm/drm_writeback.h                        | 22 +------
 9 files changed, 77 insertions(+), 131 deletions(-)
---
base-commit: cb640b2ca54617f4a9d4d6efd5ff2afd6be11f19
change-id: 20250801-wb-drop-encoder-97a0c75bd5d7

Best regards,
-- 
With best wishes
Dmitry

