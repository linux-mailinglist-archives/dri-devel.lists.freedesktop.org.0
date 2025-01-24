Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D09A8A1BE1D
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2025 22:50:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4149D10E123;
	Fri, 24 Jan 2025 21:50:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="nYIIDzNT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63FC810E1FD
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 21:47:49 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-540218726d5so2765597e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 13:47:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737755268; x=1738360068; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=B5Tj33bfeSX/rTFkhgrXRtKcEMb6MiRIfWtM4lbRYlk=;
 b=nYIIDzNTkk4BwM45Y1T470JWxoSTo//OAJfByB0WJ3GFVG8gikJq1bmuX9TpAjllQR
 wNU+LqFDYH3yUxbx+798AlLeChcoJqQt+dWzS80V1H4ZjNEsI6hGSTbQPdZJgKv/9Xmu
 xt8UcO4RGEnSAK0/W9Yvp5MBjzJCipBjSrvTIdsfnT/K2qyeyEvOuvjpBA9VUPPlrI14
 luFatKJvEBv86nu0L++TuOIDUzxccqhiHQRLcww7GWsfIQcNwlm+m8aK9H8ncegluNGp
 3+ODlbEqkvg61NvUQf+8f1GkMvFIVNhb0esFP3ASZ7NRP9QJT5alCgDiAPXz9RP8U7uB
 HuyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737755268; x=1738360068;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=B5Tj33bfeSX/rTFkhgrXRtKcEMb6MiRIfWtM4lbRYlk=;
 b=Omi63P6PALMwUcvw1AYrLLf4IIrkU6nABBx+749wkcmp4PHIbjdfPnBsDNQ2b9QbD/
 a6rdIqjU3QpHC0+Vtv9gAPh9qHmupmhRVOu2ztoD46ABljihCKb0e2IsWOQ/ojrLcgZr
 IKMzAU2SSTZVJjVKY5bcCtBVIbUuG1s1B0C8wTSlQisDSFFzTg/8sf4jjTknC/OcG3uc
 GChagTiFWi/75fGaZ2EwrZEqhU6p9Zt9HHgmWT1Htw8ZqRyWhN/A5qhZw97ZDLzY/RRa
 FBWGeTzP2a4QIVCVbrTpz9iD2hnQgWiB+2odzo1uFHBUWcuWWR3dkBUJ/yvsUjuE49tg
 tW5w==
X-Gm-Message-State: AOJu0YzEjHZ5ISZPL3cGf5VYmX05thvM5qFPg98sh2IlJCoMQB+ewa7W
 AxDRWe2pt2r/WYaP6SD1CuwY4LX1e4QUC514CANp8S6qaxgUqsqoBoLg9jQHG20=
X-Gm-Gg: ASbGncv1+bLplv/Eq86IEwtFb2pgMCh7jowukXxH64zPnqd3CgMI6Rt4d9vo3elJujC
 LEnF0no52xLZa1GOe60JSjJkGvTqeejYdc26C91AvmsA/r7ROzM3nLzmCkxIAktI8zaCW/8X4jZ
 TW+f2K+aVVjamjADULDUvIoDa65NfBS13musZ8D9E4e30/+SsSFHaDRfV7sMMvXWLJXr8FI2pOC
 w69gagQbHQdtNUuWl/mK48uSnTbm0mF64hzLYkv/9j58lVHiygJzUfperZSEPPgQ4xlNtf7FyQB
 v5XsfZWnJKSr
X-Google-Smtp-Source: AGHT+IH4WpHtN/+DZacffRvpjppuUDgdBR372cJZn6NgO/JVsuy/BYBN+QPCxXqdx7bZE3Ow7XgAJA==
X-Received: by 2002:ac2:5239:0:b0:542:91ac:3919 with SMTP id
 2adb3069b0e04-5439c251224mr10290273e87.23.1737755267531; 
 Fri, 24 Jan 2025 13:47:47 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-543c8237491sm425014e87.104.2025.01.24.13.47.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 13:47:46 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v6 0/7] drm/msm: make use of the HDMI connector infrastructure
Date: Fri, 24 Jan 2025 23:47:40 +0200
Message-Id: <20250124-bridge-hdmi-connector-v6-0-1592632327f7@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHwKlGcC/3XQzWrDMAwH8FcpPs9DtvyVnfYeYwcnVhrDZhdnm
 I2Sd59TGO0IPv6F9JPQla1UIq3s5XRlhWpcY04tmKcTmxafzsRjaJlJkAoQLB9LDK26hM/Ip5w
 STV+5cEtotSJjRADWZi+F5vh9c9/eW17i2tp+bmuq2Kt/ouuIVXDgA4xmQK1BGnj9iMmX/JzLm
 e1klY/M0GNkYwQ6GMkjkT0yeGc0Qo/BxngRhFPBuJnwwKhHRvQY1RgtBMx2UGikPDD6zpjut6v
 erxnRtY+DFH7+x2zb9gvmorqw1wEAAA==
X-Change-ID: 20240307-bridge-hdmi-connector-7e3754e661d0
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4253;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=OC7ZEYNSL8rOgIaV64XmiBZ3RC1b6WLbPxyd6j9an9I=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnlAp/7CaKNWmhSjBn79dG6Gmr8f30McLVpvImv
 0h4kXXLlrCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ5QKfwAKCRCLPIo+Aiko
 1fLxCACneLGuBUQqh1eJjGii+KDfOA5YnjAzmQ34U+W5QNzI06HVDAtrOEIVEuOe799FLd2hITp
 MiVPdBAgb6XguUzs9OzYEhtya9wZZta51COuNn6OOcDjxzpCXX3mt+iqGIwvtGhd3ftYT4TtwcC
 NdDnoF/gdv4/wilF45AnwzBEa9+TxK9OeQcCRcLe6ILRTfI+rOluAMBwd/dcdxID4jNxnlY2hz+
 mMfQdnnR/0GfOOaIDmu36ZXylsOwbRoyCjUxxwG/xGJN9WRYmL14p2+SMTZYR6uIGx3D9CASdcf
 KcNPjbTyxQnINjx6C6knaQsEfGbh6GZTd/WU+jtoR3XCvKzw
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

This patchset sits on top Maxime's HDMI connector patchset ([1]).

Currently this is an RFC exploring the interface between HDMI bridges
and HDMI connector code. This has been lightly verified on the Qualcomm
DB820c, which has native HDMI output. If this approach is considered to
be acceptable, I'll finish MSM HDMI bridge conversion (reworking the
Audio Infoframe code). Other bridges can follow the same approach (we
have lt9611 / lt9611uxc / adv7511 on Qualcomm hardware).

[1] https://patchwork.freedesktop.org/series/122421/

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v6:
- Moved HDMI timing engine programming to the end of the atomic_prepare
  (Abhinav)
- Rebased on top of drm-misc-next, incorporating changes to
  drm_bridge_connector
- Switched to the DRM HDMI Audio framework for the HDMI codec
  implementation
- Link to v5: https://lore.kernel.org/r/20240607-bridge-hdmi-connector-v5-0-ab384e6021af@linaro.org

Changes in v5:
- Made drm_bridge_funcs::hdmi_clear_infoframe() callback mandatory for
  DRM_BRIDGE_OP_HDMI bridges (Maxime)
- Added drm_atomic_helper_connector_hdmi_disable_audio_infoframe()
  instead of passing NULL frame to
  drm_atomic_helper_connector_hdmi_update_audio_infoframe() (Maxime)
- Disable Audio Infoframe in MSM HDMI driver on audio shutdown.
- Link to v4: https://lore.kernel.org/r/20240531-bridge-hdmi-connector-v4-0-5110f7943622@linaro.org

Changes in v4:
- Reworked drm_bridge_connector functions to remove ternary operators
  and to reduce indentation level (Maxime)
- Added hdmi_ prefix to all HDMI-related drm_bridge_funcs calls (Maxime)
- Made vendor and product mandatory to the HDMI bridges (Maxime)
- Documented that max_bpc can be 8, 10 or 12 (Maxime)
- Changed hdmi->pixclock to be set using tmds_char_rate instead of
  calculating that manually (Maxime)
- Changed mode_valid to use helper function instead of manually
  doing mode->clock * 1000
- Removed hdmi_mode in favour of connector->display_info.is_hdmi
- Link to v3: https://lore.kernel.org/r/20240530-bridge-hdmi-connector-v3-0-a1d184d68fe3@linaro.org

Changes in v3:
- Rebased on top of the merged HDMI connector patchset.
- Changed drm_bridge_connector to use drmm_connector_init() (Maxime)
- Added a check that write_infoframe callback is present if
  BRIDGE_OP_HDMI is set.
- Moved drm_atomic_helper_connector_hdmi_check() call from
  drm_bridge_connector to the HDMI bridge driver to remove dependency
  from drm_kms_helpers on the optional HDMI state helpers.
- Converted Audio InfoFrame handling code.
- Added support for HDMI Vendor Specific and SPD InfoFrames.
- Link to v2: https://lore.kernel.org/r/20240309-bridge-hdmi-connector-v2-0-1380bea3ee70@linaro.org

Changes in v2:
- Dropped drm_connector_hdmi_setup(). Instead added
  drm_connector_hdmi_init() to be used by drm_bridge_connector.
- Changed the drm_bridge_connector to act as a proxy for the HDMI
  connector  infrastructure. This removes most of the logic from
  the bridge drivers.
- Link to v1: https://lore.kernel.org/r/20240308-bridge-hdmi-connector-v1-0-90b693550260@linaro.org

---
Dmitry Baryshkov (7):
      drm/msm/hdmi: switch to atomic bridge callbacks
      drm/msm/hdmi: program HDMI timings during atomic_pre_enable
      drm/msm/hdmi: make use of the drm_connector_hdmi framework
      drm/msm/hdmi: get rid of hdmi_mode
      drm/msm/hdmi: update HDMI_GEN_PKT_CTRL_GENERIC0_UPDATE definition
      drm/msm/hdmi: also send the SPD and HDMI Vendor Specific InfoFrames
      drm/msm/hdmi: use DRM HDMI Audio framework

 drivers/gpu/drm/msm/Kconfig                    |   2 +
 drivers/gpu/drm/msm/hdmi/hdmi.c                | 120 +--------
 drivers/gpu/drm/msm/hdmi/hdmi.h                |  34 +--
 drivers/gpu/drm/msm/hdmi/hdmi_audio.c          | 131 +++++-----
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c         | 325 +++++++++++++++++++------
 drivers/gpu/drm/msm/registers/display/hdmi.xml |   2 +-
 6 files changed, 337 insertions(+), 277 deletions(-)
---
base-commit: 04db8124620ddca01d2fdc48d15471dd77efeff0
change-id: 20240307-bridge-hdmi-connector-7e3754e661d0

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

