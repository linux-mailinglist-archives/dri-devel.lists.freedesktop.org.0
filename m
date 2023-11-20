Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 198F47F1F77
	for <lists+dri-devel@lfdr.de>; Mon, 20 Nov 2023 22:46:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 839CF10E1E1;
	Mon, 20 Nov 2023 21:46:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFC5010E1B9;
 Mon, 20 Nov 2023 21:46:29 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-32f8441dfb5so3793526f8f.0; 
 Mon, 20 Nov 2023 13:46:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700516788; x=1701121588; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ifrjBfgOSiyuCFRkxJCsnT3OdDkva6hhJuoAwARmBUY=;
 b=eGVxsGy8PKPU3YmMohPBPkIMgraS0dU+oLNGvp9BHy8uc9Nc9hYDibOFnPdDb4NkqX
 YcwMFBaaEk1Z6hetJ8xfHnx2X9e5vMNIFmYZG2L7r/qNTeBbVH4D7ErNBjEy6j958W4T
 nQw3d+7owdsg9ft0pkVOaZGNwSzPdDiwg1zv/+UpVv7NnAttiv0KsVFn2e9R9VZaKn3T
 iWuCSNwyoNf/ZvQ/Ki6o1YhBmdUn/ekXkaEI1EkZdudJJ5RzFUzSyMjVhJmUOlUF81fa
 TceEw+/PW3lOs2ny7KIy4gUqCte2oLnslumDW8B1Vz81IXOM7kA73U51okGpAXy/GSia
 5ehg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700516788; x=1701121588;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ifrjBfgOSiyuCFRkxJCsnT3OdDkva6hhJuoAwARmBUY=;
 b=bCDHfh0P4XVdkqPnySzO+MlNKr3m3hJqh4XQWk9tMTMekuxa4YhACaMbWbclthY4Ai
 wACSavILzZJR/krZfuo4V35N9K3NHTs0P7a1ACTD5URMUJtYti3Qu1o3+Z16JCcsUlye
 Cyfq5ACuymcJqixAOZjb9tYYkA7sNc7IPmM5be004JN/kpa5eNNRW6HP/B6RnhWkIBEI
 qeeUu+GUaaTAJ0HgwFeeFGxgtyVSSnxjGtPOfMKiXJm0yQRomoCFKbL/jCcy4pV10PgN
 cEuX5qWSGdYti1YLFOf6hbb1R/TLGoUNnrpFgfxccOOWNMJot4RDjlc0HXMhWbvfEVdl
 Ustw==
X-Gm-Message-State: AOJu0YzsZPamokA/tDDH6vdU0IaYjyqWpHIV5RTp44o6mZ57+iuHu8jH
 t+njhagHOs3o/HjbRk839AE=
X-Google-Smtp-Source: AGHT+IHp3LoF2DOrCwbBP5ZAP28MyKKAznq0CT/uy4NViD6EoST7Z+71CXBfeYQKBX9yVV00pAiniQ==
X-Received: by 2002:adf:e9cb:0:b0:32d:9d3a:d8c0 with SMTP id
 l11-20020adfe9cb000000b0032d9d3ad8c0mr5215561wrn.60.1700516787764; 
 Mon, 20 Nov 2023 13:46:27 -0800 (PST)
Received: from zotac.lan.
 (dynamic-2a02-3100-9030-5a00-2223-08ff-fe18-0310.310.pool.telefonica.de.
 [2a02:3100:9030:5a00:2223:8ff:fe18:310])
 by smtp.gmail.com with ESMTPSA id
 i13-20020a5d584d000000b00332cb0937f4sm2667052wrf.33.2023.11.20.13.46.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Nov 2023 13:46:27 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH v4 00/20] remove I2C_CLASS_DDC support
Date: Mon, 20 Nov 2023 22:46:03 +0100
Message-ID: <20231120214624.9378-1-hkallweit1@gmail.com>
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
v4:
- more ack and review tags

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
