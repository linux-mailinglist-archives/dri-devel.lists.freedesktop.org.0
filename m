Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A4A7E9ADE
	for <lists+dri-devel@lfdr.de>; Mon, 13 Nov 2023 12:24:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65E5510E084;
	Mon, 13 Nov 2023 11:24:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5706D10E066;
 Mon, 13 Nov 2023 11:24:02 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-40859c466efso33253355e9.3; 
 Mon, 13 Nov 2023 03:24:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699874641; x=1700479441; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4/UMvWLGwbB65y4MgNgbTrhLeriroJNqxOaU5RBpd/A=;
 b=ReU3n2VR/eDzsvpcwoBaylOONtUUzQYaE1EHdRkNHzJo9tP/cWtnAASy8MwRnIpEkf
 dY67iclsy4hBTB/1FUpDooa3msWSO76IlsvVE9DocHrNewI/zhSX30K1YlppKDDifA9h
 FRcACapFxSU3OKq12GT8hmruAPTP/whFyX6gcBHg3cVXhYKYhRCmtxEBCcg1oNwqurm3
 az+1xI5Kqp4k7rVA7GBMZ2W4TUknCk0xrIO9bvw51kiCNrnV12NAWfWUDPut1JXLx2Z4
 T5tFrmwYl9/DN1x3TIVZeWmYtYkURAbP+qFQMUbn9ORjU3NSpv198p9DDVR8otrn2cJX
 Bq6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699874641; x=1700479441;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4/UMvWLGwbB65y4MgNgbTrhLeriroJNqxOaU5RBpd/A=;
 b=Ojau1HxDsVoGxW096zZRrIlsu21XgxM0cUhu+n1VmBtl6e/lO/9aseRezb1LQvTFw+
 JtQLRlj7yfutxEDFlunDPbCkQhaKAWthii0VPSZEl6+H02JHZRr/EoBecoqDiz6Z3sct
 yjez6oX+P3gHW9ExIJmFxC5wR++g/r1iGWZM6q3MLVms+/rcSIvEMJkC/iPgDwSBKSaj
 GM2PU49kHia8ILw+Upaqs+iYoRiYncu0LRQDtf52AjgixE6fRP433XMpQ/XH6nxCFhLz
 qYZpr6zeC5cHpua62xAqa3Gi4X7yBbKGCJZpM3H8dU80+MIiZFVRbwX3IcEWngYY7PLl
 fG3w==
X-Gm-Message-State: AOJu0YxeojRDtZewBAAsF0R0slKXhc5y6ApsPuFBAScwzlwCh0vNJ7X0
 JybSUCWBrDHNNZuBF6jbVjc=
X-Google-Smtp-Source: AGHT+IHeSfxulnBJhsxmWDCBwohx10bO7bTu1BHjhSiyjqQiFY1QaU+JjC7xoDkTmTAquVkbrdJhaA==
X-Received: by 2002:a05:600c:4fd2:b0:404:7670:90b8 with SMTP id
 o18-20020a05600c4fd200b00404767090b8mr5004204wmq.27.1699874640270; 
 Mon, 13 Nov 2023 03:24:00 -0800 (PST)
Received: from zotac.lan.
 (dynamic-2a01-0c22-6e16-fe00-2223-08ff-fe18-0310.c22.pool.telefonica.de.
 [2a01:c22:6e16:fe00:2223:8ff:fe18:310])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a05600c4f1300b0040772138bb7sm13565787wmq.2.2023.11.13.03.23.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Nov 2023 03:23:59 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 00/20] remove I2C_CLASS_DDC support
Date: Mon, 13 Nov 2023 12:23:24 +0100
Message-ID: <20231113112344.719-1-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.42.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Yongqin Liu <yongqin.liu@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, amd-gfx@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>, linux-sunxi@lists.linux.dev,
 Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org, Jocelyn Falempe <jfalempe@redhat.com>,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, John Stultz <jstultz@google.com>,
 Heiner Kallweit <hkallweit1@gmail.com>, freedreno@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

After removal of the legacy EEPROM driver and I2C_CLASS_DDC support in
olpc_dcon there's no i2c client driver left supporting I2C_CLASS_DDC.
Class-based device auto-detection is a legacy mechanism and shouldn't
be used in new code. So we can remove this class completely now.

Preferably this series should be applied via the i2c tree.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

---

 drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c           |    1 -
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |    1 -
 drivers/gpu/drm/ast/ast_i2c.c                     |    1 -
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c         |    1 -
 drivers/gpu/drm/display/drm_dp_helper.c           |    1 -
 drivers/gpu/drm/display/drm_dp_mst_topology.c     |    1 -
 drivers/gpu/drm/gma500/cdv_intel_dp.c             |    1 -
 drivers/gpu/drm/gma500/intel_gmbus.c              |    1 -
 drivers/gpu/drm/gma500/oaktrail_hdmi_i2c.c        |    1 -
 drivers/gpu/drm/gma500/psb_intel_sdvo.c           |    1 -
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_i2c.c   |    1 -
 drivers/gpu/drm/i915/display/intel_gmbus.c        |    1 -
 drivers/gpu/drm/i915/display/intel_sdvo.c         |    1 -
 drivers/gpu/drm/loongson/lsdc_i2c.c               |    1 -
 drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c           |    1 -
 drivers/gpu/drm/mgag200/mgag200_i2c.c             |    1 -
 drivers/gpu/drm/msm/hdmi/hdmi_i2c.c               |    1 -
 drivers/gpu/drm/radeon/radeon_i2c.c               |    1 -
 drivers/gpu/drm/rockchip/inno_hdmi.c              |    1 -
 drivers/gpu/drm/rockchip/rk3066_hdmi.c            |    1 -
 drivers/gpu/drm/sun4i/sun4i_hdmi_i2c.c            |    1 -
 drivers/video/fbdev/core/fb_ddc.c                 |    1 -
 drivers/video/fbdev/cyber2000fb.c                 |    1 -
 drivers/video/fbdev/i740fb.c                      |    1 -
 drivers/video/fbdev/intelfb/intelfb_i2c.c         |   15 +++++----------
 drivers/video/fbdev/matrox/i2c-matroxfb.c         |   12 ++++--------
 drivers/video/fbdev/s3fb.c                        |    1 -
 drivers/video/fbdev/tdfxfb.c                      |    1 -
 drivers/video/fbdev/tridentfb.c                   |    1 -
 drivers/video/fbdev/via/via_i2c.c                 |    1 -
 include/linux/i2c.h                               |    1 -
 31 files changed, 9 insertions(+), 47 deletions(-)
