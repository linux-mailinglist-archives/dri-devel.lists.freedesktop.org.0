Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA3FF7F05A1
	for <lists+dri-devel@lfdr.de>; Sun, 19 Nov 2023 12:28:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BEFE10E1C0;
	Sun, 19 Nov 2023 11:28:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 335BE10E1C0;
 Sun, 19 Nov 2023 11:28:31 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-9e62ab773f1so479654566b.0; 
 Sun, 19 Nov 2023 03:28:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700393309; x=1700998109; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4zsSf4ZkDNs2IGAtcWQSvygdvnaeiSuxsGnh/E5aZTQ=;
 b=MVj/k3/d+EhxyoltlIyNBeH4BdTjMJJxWGpBUBQ0EGx4Isom+R+BS9fDnA/GJChdQo
 LvNXeFohnKWR7Q+qfZFGAw3Q7/YB5dNfPjCRE2gd3UlbuOk3yqzv2YExNPnTlMOiKeCE
 MgbLKFLFMd3PpgjWRN4Uw7+7/Za4Otq4/hSG73qe61gfP6NFKwQhmaJXf4shX8thGs7M
 5PAx6jfVmbNBTTAoT78VBLAs1jrWbINVsHSzwdB9kuAcIEN9LK+URgW+zwnSCE8UbrJN
 mSJM/bOtnnAI9VEDm6DW7gNmcf3E6IwHvuTUfSn53vMFCXwjsN3rpzMgB0FO1w2Eanqu
 cV/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700393309; x=1700998109;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4zsSf4ZkDNs2IGAtcWQSvygdvnaeiSuxsGnh/E5aZTQ=;
 b=Zw69pBbLghZUha6CoEFt/QYiM88jtOxMiz3S98wKg1t9clpHl5Obf9LDvaAqmxqUZ9
 ID64Er65cE7/0eemtpf6LtlZGfGZR8EWfmqXxYQFzyGuz3/7V0xt4ydhNngEWICtKU6z
 ybWk8gybSuyvQktOouv2KaP0NnZP3Lv5Ix+3qhw082pdhP2mUGjj7elhPbPxzYPJ9JkS
 sLN1+nJyTZVHRZ60qtOhUIJAfEkVudcMZXafiihEY6/TXvNbo5P1gVSTtfNg540sml90
 SLBN9PBy7xE+UUCHRAqnhvydlsSKUuD62T/HUTfCjNAHrDVsDNmXapPBKIqA3oRK3cbg
 VhAQ==
X-Gm-Message-State: AOJu0YxRhH5+zDAQyNf5N1kzPWLPpTPcB6Eg2TLPaaaG+OoSHWXXW9FY
 uwnpeYtuMe2Xn4RlCvNFUKA=
X-Google-Smtp-Source: AGHT+IE5uGBUmol5ov0XxZ5Dqkm6UF3fXf9Nab5r2AlC03wH+Qnp4IS3AGLhaN/CFXgIHkYcW7HMmw==
X-Received: by 2002:a17:906:2b56:b0:9d3:8d1e:cf0 with SMTP id
 b22-20020a1709062b5600b009d38d1e0cf0mr2841220ejg.54.1700393309393; 
 Sun, 19 Nov 2023 03:28:29 -0800 (PST)
Received: from zotac.lan.
 (dynamic-2a01-0c23-bde4-3e00-2223-08ff-fe18-0310.c23.pool.telefonica.de.
 [2a01:c23:bde4:3e00:2223:8ff:fe18:310])
 by smtp.gmail.com with ESMTPSA id
 k22-20020a1709063fd600b009f8af454d0dsm2420378ejj.112.2023.11.19.03.28.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Nov 2023 03:28:29 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 RESEND 00/20] remove I2C_CLASS_DDC support
Date: Sun, 19 Nov 2023 12:28:05 +0100
Message-ID: <20231119112826.5115-1-hkallweit1@gmail.com>
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

v2:
- change tag in commit subject of patch 03
- add ack tags
v3:
- fix a compile error in patch 5

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
