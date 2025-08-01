Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 481B7B182B6
	for <lists+dri-devel@lfdr.de>; Fri,  1 Aug 2025 15:51:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1100110E85A;
	Fri,  1 Aug 2025 13:51:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="HBASkNa/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DFA910E85A
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Aug 2025 13:51:21 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5718heOd018840
 for <dri-devel@lists.freedesktop.org>; Fri, 1 Aug 2025 13:51:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=R5/BhHZWXHfoz2PoAt8iPP
 dFYjTG2bedIk3AU8wQfSM=; b=HBASkNa/Hs0jzEUfn96lq/l0dTsR7WwCRZ9RvA
 qB9MjzTzt1vriGZRyYaQRSKNBcJgKm9wvwqONDJYP7GuRxfNATw1LsVhdEFVFbYD
 7wjrslaRLBoAkTJ3d5iZvYr06nWoUswLyIortj2vIabtDE1ebc3o6deiCd+FmOvr
 GZGjRkmVCxJr9M0d+3GCiJZgbsp2epP/OmnI8FmK0sbnz2X8sashd2IDdyAZEAoK
 e8yQE6Lr6WorHOPbMZqWkd5AJii2P8o1CBZYEFA2k5jSqMatJLyH51+Dv/S/f6bp
 ZLVkr94qUy7F3dpg5oxw9MtqphMTwrKwZHO63y0nyslNS37A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484qdabwb8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Aug 2025 13:51:19 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4aeb2e0cb98so37837011cf.1
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Aug 2025 06:51:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754056279; x=1754661079;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=R5/BhHZWXHfoz2PoAt8iPPdFYjTG2bedIk3AU8wQfSM=;
 b=jh8RR82osDDHY4L24w7lF4kBZ26wRMPV0kYWwS0ADDaGvHqZChBgKQ0ZizE8BNdVuN
 CJgGiqc6N39mPDddrCQd39hIueaizNK5NPfmQi3RoSNK2P3iQdbaFXmr5dN3BugjkK3I
 Si6VifIGoaGUKI2P9oE5gb08M9HLIgL+A1qX9J56+Z7OjJPS99a3FwToV7X6H3dc9/H3
 s4Hjoym//qNgVu0uZtnd/xxd+CzB5Y2kV9J23qXPUg0sjRarfvVnbiz5DxtgN02O1f8W
 IJs+YMLaZ2RKlRUmw1oNnAAqPrV2RF5uLvt7qVmoers74Ope8L52aVDkWyW1qTBnMtsF
 hS9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXGC9+69ozfac82oJVP6sVfqMBIQKLcA7mLeZ6Hx5cbWWGwBdNr3tf5ROYBHgTWi+d8s3XH76vtbP4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YybU81RSYXR2AMHwy2BD9wqtgX14qlFNjYjGVtE+sp7SPGMGq5s
 ky+exSIA3d1T5PEA8kXnN+s6JSYn6CGykGE/+bM52Q4ZiGlDgMF9fUwLV3szBqhg/hC5fyMCRe2
 0daDfAfTJWCrpUUsVbOVZ8RTgS3UXQzKdmPH8pJmRKWyaDVBoPuLpkrO9WPIFS7hrBv6AQ2M=
X-Gm-Gg: ASbGncumOJSMXIW5GbbP8w8ZiN77CMolAErMQLWvR9vJlC59QLqnuYnTHuM3fQjXZ0X
 LCLh7Via8JqVItzSHnUNXmQMe5TJ415HvYmra+Uu3ODGQkiqngWHHCEAIfhlPknvdrWH7JgT8iI
 j1NHQ9JcQmjTwCCPF6uRmHu5oSe4eQWVGH7LY+2YeBUwkhdAIaDakS9bXP3MUwX55iRnkWYm/0d
 xZCz8qAKMHmGuwieaGVs//8w8z+NRJGKS1RLz9ktNjWKoyfcwwk7UeC/AcqQSnnxnH3hn2a2HXl
 XWghu+UEzQNt+jim5Th20s9DIKXg4qC9aofKz/e21m5HHiu7B/+RwTBohI0diOIUoAHcnEMvVP3
 nM/hI/xnu3he5fCFixvdooOUW1rxVm6q2Mc2e21iveyxO5OUqkzrj
X-Received: by 2002:ac8:5784:0:b0:4ab:95a7:71d1 with SMTP id
 d75a77b69052e-4aedbe7beb9mr161744471cf.55.1754056278944; 
 Fri, 01 Aug 2025 06:51:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFtbade6pZ9wkxnorEF6axWOtrohHvqQculMvY2mHe46exVpYNBH602aw6FU7DeF5T4f4fIgQ==
X-Received: by 2002:ac8:5784:0:b0:4ab:95a7:71d1 with SMTP id
 d75a77b69052e-4aedbe7beb9mr161743521cf.55.1754056278246; 
 Fri, 01 Aug 2025 06:51:18 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-33238273006sm5917801fa.9.2025.08.01.06.51.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Aug 2025 06:51:17 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 0/8] drm: writeback: clean up writeback connector
 initialization
Date: Fri, 01 Aug 2025 16:51:08 +0300
Message-Id: <20250801-wb-drop-encoder-v1-0-824646042f7d@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEzGjGgC/x3MMQqAMAxA0atIZgNVKFWvIg7aRM3SlhRUKN7d4
 viG/wtkVuEMU1NA+ZIsMVR0bQP+XMPBKFQNvemtGUyH94akMSEHH4kVR7ca7+xGlhzUKinv8vz
 HeXnfD6NH1jNhAAAA
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
 freedreno@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2072;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=R+5orXaZWYFqlHQCgWzWcWIKZBQ4MU2KJjCzPihl1hE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBojMZSfeMebHGzi1ad5D9OJIiWxXkAsbLdE3xg4
 nZazyGjsZCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaIzGUgAKCRCLPIo+Aiko
 1SdmCACyivvAMPFOURSFjenFZ8ROTLDqjmHCkE57/8pbDDtOmnvDfJ7Fi6i01/G4wEPnTGHed44
 N+uX0xC10aDYDljZbg9Ye2oCBvC8b8VJfxf1JuBphl5iqinO8bjED8LaJHe/Z1IQHal1TB2a/oo
 PG6bYJEhwq7tv9+s0dTyKqvksmESoD0WDb1DipCPoHx0hVqHvZ1tmNdtf7u/JgHibuAZQ45snAg
 0cRP4v//GNyZU6xiXtGe3Y7K95lbOvjZiSFO2fwFx9NrdrFXD+QX3+JaMCInjnjVO/qKNVipJ10
 sML3WPF2VNylJRkIVccwbCu8kIidTpUocxHhmfn3G52M6APm
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: QfSrL2NvA5jyaNZBxXdq89X8WAA5A4VU
X-Authority-Analysis: v=2.4 cv=Pfv/hjhd c=1 sm=1 tr=0 ts=688cc658 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=cFjmsF-WLDi_aLc5EnEA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: QfSrL2NvA5jyaNZBxXdq89X8WAA5A4VU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDEwMyBTYWx0ZWRfX2DChMqxskQWB
 cK+YCAoOR3NRiq3Vta4rNItbozpbfZ9vrKTK2IdWQLsQotJiNUXi1Jn5T/dsnadJ0YO67LKSdbK
 mkAaXqLxrsdFdznWxLQGxw8gjK8WS4EeBM1Ida0u/yRx0IvyQrC+0PxdaeQOb/OT+9uOv7/+BWI
 ITf2ipA1DxpH48zWN6HIGurO8SJOgmThxWDJ/gVBwpePuq0sqjhf87qBzCeV9gf94wsshBKkKQ+
 j1/Lr+MoySQoUhGIFIpMsHX20nclNZc9MC5QLR+gb+pQrkA1uIQ/xzzi4wS1T3lfq6Cxgzb6o2K
 iPYBSr3+S9cTp0LPkN/oV3/SyHckmiQServA3BSkUVckhgi0fhDCw87p/w13XC7+n1KZi8+mw/Z
 sLbI+i+txrKT2kqVteJzAzY6QZrpSUtO+xYGTSgy1MKHDBU9ptCYvXD8y/d27bdzbbnNhhC0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_04,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=990 clxscore=1015 adultscore=0 priorityscore=1501 mlxscore=0
 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508010103
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
base-commit: 94f208ff622b09309358abaf26d7acca0c318fae
change-id: 20250801-wb-drop-encoder-97a0c75bd5d7

Best regards,
-- 
With best wishes
Dmitry

