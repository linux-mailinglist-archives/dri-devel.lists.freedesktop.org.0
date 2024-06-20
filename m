Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B807F910A5A
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 17:46:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCBEB10EA72;
	Thu, 20 Jun 2024 15:46:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="Ex2LFyf+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f99.google.com (mail-wr1-f99.google.com
 [209.85.221.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79A8B10EA72
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 15:46:39 +0000 (UTC)
Received: by mail-wr1-f99.google.com with SMTP id
 ffacd0b85a97d-3629c517da9so1123461f8f.2
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 08:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1718898397; x=1719503197;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fGvSt3PVAS7R9sc2kvDRJZa8xpDab+w0kC7hnmuCL+A=;
 b=Ex2LFyf+zEuSHzAG3vAVK2AFN3GSjg06Nf4VvB4LoQg1pyYqanCz9NbIW9hcd6j2Ic
 AXKCHrTzFguAqxI8UhjZWzUo89J/cSkqNEV3/86ad2TcQehl6HWTJ9aLH8KRkh0xkOgI
 6nk8l9l0ywid1yed+0k9npIMAjVtH3a8gji9eeIWhRBcg0qI10kxh89H4JRlbySFy8oA
 AdE597Ef9+GFgpDXSbP5+8rpGicbb8o3KVCj/m/HRQ63p7LEB+l1xZybR78k4vZG03gY
 gLi7II1vy8mAdsP8AwQTIOxovB8mcIrXQTMr4IWMFSN4yywhCRnI2g+m3ejpPqaPSDxa
 NJyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718898397; x=1719503197;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fGvSt3PVAS7R9sc2kvDRJZa8xpDab+w0kC7hnmuCL+A=;
 b=EWnLhY61+Zcn61ULm1sJq82cT+0cGS+l/W+TsuvitIoCjT+ltQ6xw5Rfm3Tf0t9jBi
 /d13kh9bSC3X5zJub+OY3I2QYPYh6dU2sySdyWYaODH4gczEhGPnUF3XPvjP+5GM1d4X
 Ao9ptK6LXmoT+bDNiNkyLm+agk1aPLDWB3v0R9eIttjEuwUM1Mwzi7Kd/GpzwtXX3q+w
 siRINn+EhrihUIU45FG6ON6wzvC2csfMf9/DmVteJXtob0xBLfLtljFlbuvMuGhnsfit
 F/4C2d1TMpqYlG76Gk92cW9zb/B94Xnab79YXIRIkwggJtoTbEjXzdE8+uDvlIovpaDk
 erdg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXguKn8qlGvQT2MYKBAxBbHiJt8FcugpCsZQrxuNvWt03o1fLsC2x/cjvUu+wW4eCpKcGIjYEHttkTEu2nK2epzk6mwKtZubxHKZ00f/gW4
X-Gm-Message-State: AOJu0YzweC3Py0S0dLqY2hNsHYuLaYzSXRhh0hWO8Q12AQ7MPoFQQpOX
 shqO72Z8jdL29dU/RB0Iuh7JuqSoh00NsMJe6guZDa3sWK98xIyGjFNegEQbgnJiDJ+3dBfmJS6
 n8rZ+u/zXG73Y9OamlFc8wiyYeRt7B6ZU
X-Google-Smtp-Source: AGHT+IFzpCy2t/hUXQ8iksCRTN7W27oIwLfsD54dJvA+UelDcUjVVCy5dKV3/+09+Yd+x7+ESbzZ7lZIUO3D
X-Received: by 2002:adf:e411:0:b0:35f:c82:e7b5 with SMTP id
 ffacd0b85a97d-36317c7eb64mr4353287f8f.42.1718898397531; 
 Thu, 20 Jun 2024 08:46:37 -0700 (PDT)
Received: from raspberrypi.com ([188.39.149.98])
 by smtp-relay.gmail.com with ESMTPS id
 5b1f17b1804b1-4247d0b507bsm3189385e9.9.2024.06.20.08.46.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jun 2024 08:46:37 -0700 (PDT)
X-Relaying-Domain: raspberrypi.com
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH 00/31] Preparatory patches for BCM2712 (Pi5) support
Date: Thu, 20 Jun 2024 16:46:01 +0100
Message-Id: <20240620154632.4125308-1-dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi

This set is a number of minor fixes that we've had downstream for a while,
and then lays down the some infrastructure changes to facilitate adding support
of BCM2712. I'm just finalising those patches so they should follow on fairly
soon.

Thanks
  Dave

Dave Stevenson (8):
  drm/vc4: Force trigger of dlist update on margins change
  drm/vc4: Set AXI panic modes for the HVS
  drm/vc4: Limit max_bpc to 8 on Pi0-3
  drm/vc4: Don't write gamma luts on 2711
  drm/vc4: UV planes vertical scaling must always be enabled
  drm/vc4: Fix dlist debug not resetting the next entry pointer
  drm/vc4: Remove incorrect limit from hvs_dlist debugfs function
  drm/vc4: Move the buffer offset out of the vc4_plane_state

Dom Cobley (7):
  drm/vc4: vc4_plane: Keep fractional source coords inside state
  drm/vc4: Handle fractional coordinates using the phase field
  drm/vc4: hdmi: Avoid log spam for audio start failure
  drm/vc4_plane: Add support for YUV444 formats
  drm/vc4: hdmi: Increase audio MAI fifo dreq threshold
  drm/vc4: hdmi: Avoid hang with debug registers when suspended
  drm/vc4: hvs: Remove ABORT_ON_EMPTY flag

Maxime Ripard (15):
  drm/vc4: hdmi: Warn if writing to an unknown HDMI register
  drm/vc4: hvs: More logging for dlist generation
  drm/vc4: hvs: Print error if we fail an allocation
  drm/vc4: plane: Add more debugging for LBM allocation
  drm/vc4: plane: Use return variable in atomic_check
  drm/vc4: crtc: Move assigned_channel to a variable
  drm/vc4: Introduce generation number enum
  drm/vc4: Make v3d paths unavailable on any generation newer than vc4
  drm/vc4: hvs: Use switch statement to simplify
    vc4_hvs_get_fifo_from_output
  drm/vc4: hvs: Create hw_init function
  drm/vc4: hvs: Create cob_init function
  drm/vc4: hvs: Rename hvs_regs list
  drm/vc4: plane: Change ptr0_offset to an array
  drm/vc4: hvs: Rework LBM alignment
  drm/vc4: hvs: Change prototype of __vc4_hvs_alloc to pass registers

Tim Gover (1):
  drm/vc4: Enable SCALER_CONTROL early in HVS init

 drivers/gpu/drm/vc4/tests/vc4_mock.c       |  14 +-
 drivers/gpu/drm/vc4/vc4_bo.c               |  28 +-
 drivers/gpu/drm/vc4/vc4_crtc.c             |  35 ++-
 drivers/gpu/drm/vc4/vc4_drv.c              |  22 +-
 drivers/gpu/drm/vc4/vc4_drv.h              |  29 +-
 drivers/gpu/drm/vc4/vc4_gem.c              |  24 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c             |  30 +-
 drivers/gpu/drm/vc4/vc4_hdmi_regs.h        |   5 +-
 drivers/gpu/drm/vc4/vc4_hvs.c              | 343 +++++++++++++--------
 drivers/gpu/drm/vc4/vc4_irq.c              |  10 +-
 drivers/gpu/drm/vc4/vc4_kms.c              |  14 +-
 drivers/gpu/drm/vc4/vc4_perfmon.c          |  20 +-
 drivers/gpu/drm/vc4/vc4_plane.c            | 281 +++++++++++------
 drivers/gpu/drm/vc4/vc4_regs.h             |   1 +
 drivers/gpu/drm/vc4/vc4_render_cl.c        |   2 +-
 drivers/gpu/drm/vc4/vc4_v3d.c              |  10 +-
 drivers/gpu/drm/vc4/vc4_validate.c         |   8 +-
 drivers/gpu/drm/vc4/vc4_validate_shaders.c |   2 +-
 18 files changed, 540 insertions(+), 338 deletions(-)

-- 
2.34.1

