Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74FB59DEE67
	for <lists+dri-devel@lfdr.de>; Sat, 30 Nov 2024 02:52:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D01AE10E0C8;
	Sat, 30 Nov 2024 01:52:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="FuHd5GTO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C618D10E0C8
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Nov 2024 01:52:37 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-2ffd6882dcbso19215711fa.0
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2024 17:52:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732931556; x=1733536356; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0idVwC/Y8BowBuwoiQH15R6OW71zBvrSnYfglmGNHWM=;
 b=FuHd5GTODLK+VqVzJuEXws9/KT225U52+7s8ilIRBaYlQjWVvgzWbGwVgfB/eszKG7
 MpC/bxRm6naCzoq/ROqr9yg/A4p5HjRPwM9Gw8JrDiM+OFcQOwQZrm8CMWcfvofhsjvJ
 y4mAUhvpnb21TjQwdQxpd7cAnmqaY/C3eEqoe0Def+5EuTYnBf5Nk2R7xC5RwH07de68
 spcosHX0tTuo7NOVa1YJLHxIoTwsnU30kaXCya6Aw3Y17CBYBtx86WIAZjaa05bfu4iJ
 t6zQRG8P2aio/Wu1/O5XZtM5ivO42+akrB2ztD9I60UZLmR+DK7msjWm2HiiTyEvhzPl
 4CLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732931556; x=1733536356;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0idVwC/Y8BowBuwoiQH15R6OW71zBvrSnYfglmGNHWM=;
 b=AEbssCznUKDvDvPGTciuMeqRANZwBQ2Hb2fkoXZvReA9ah2oRapegC7+ML6XVepQmE
 JEEH5RQo/riREuzzy00eq3ukD0dmHbxCPQqgEu6WoT0yxovi2GXb5gnaEOH3jrtTyvS6
 2TzZgTWslX+nP666oTE5422u9MbwXAP9eN8T9VjJfuH6quvLlij13gGzJAT7/pLyuAjF
 jMM+AXI+QgwdNATxjARE2H5LSE3Dts1ZV3FEj+kMk8SszBHJnepSErxlYrcWJZxrYCrw
 1wfnG5TruU9Q3hh//BgvGYqb7WlSIBswaM1fib+CXzZjb+IyrLA0nqngG4vH2lzuDaGg
 J98w==
X-Gm-Message-State: AOJu0YxZqM0Lqcbj+zVn4Pw/hXiCQC63X07csOTabclM1FLIU8K94Lu4
 SFDMrxkMwjiT1GNBbHtkdZCEVBfWNsln8et30li9rFh9KImJgWhlbr3sh2axcpo=
X-Gm-Gg: ASbGnctT0b9TWRYwqA2bJh4D5zQ9Jq7Zb/pyapq+1o75H3ZL4MEVzp/DzJbht0pRXGT
 0SgnlDPNZ1h+tXLc5DI2xwpKmWSlgTWPzwWcLT8DBzKEfUEHAx3mAR8u9P7162d7+TyMAkbJC9U
 eHoqgnfEGFLIGHXwbfBnfgnTvu4rOydm969Gq0fDzE3WFcP1FeTPay9tWIlmRsUKFrwIYeWCAvg
 DXbhXM9pRAdSxYjgdxAuRnGY4MDyL5alNjqmWOzkYQtr64Cveyex6EcRw==
X-Google-Smtp-Source: AGHT+IEOzhXxDvsEIpRrEowV0sChYjq+QMeob7GWZCSiPE7ZrboRJzT4FPXckQ+mbro5wEegC/OfhQ==
X-Received: by 2002:a05:6512:3983:b0:53d:ed98:4a02 with SMTP id
 2adb3069b0e04-53df0104907mr5269165e87.43.1732931555747; 
 Fri, 29 Nov 2024 17:52:35 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53df6443172sm636408e87.84.2024.11.29.17.52.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Nov 2024 17:52:34 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v5 00/10] drm/display: hdmi: add
 drm_hdmi_connector_mode_valid()
Date: Sat, 30 Nov 2024 03:52:25 +0200
Message-Id: <20241130-hdmi-mode-valid-v5-0-742644ec3b1f@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANlvSmcC/3XNwWrDMAzG8VcpPs/FlpXE6anvMXbQYrkRtHFxh
 tkoefe5vazF7Pj/QD/d1MpZeFWH3U1lLrJKWmp0bzs1zbScWEuorcAAWmO9nsNF9CUF1oXOEjQ
 RT4jgO2MnVa+umaN8P8T3j9qzrF8p/zweFHtf/7eK1Ub3jCMxemPjcDzLQjntUz6pO1bgD6hCC
 0AFqMfBxwAmUt8A7hkYW8BVoHPoJ3C9N0ML4BMA0AJYAYjMSN7R5zC+ANu2/QImxQRYcgEAAA=
 =
X-Change-ID: 20241018-hdmi-mode-valid-aaec4428501c
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3211;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=3VcAga3hvcMUfVcAzQwDqmHLVIM+9BjN897sk6QijEc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnSm/fvjfE0CWcAXr9KSR9cTNBZ3DlIiCtoE4lG
 DpPQzmfhVaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ0pv3wAKCRCLPIo+Aiko
 1RzUB/wKuFVuYYbaERg38SyUJLRDaSgm+9ilE3D1p5SZHbKeahca1eECRZpBzpaniztBSnOap7S
 MSK0Yi378KQfEPC9z94rCyPKien7YuxYQ5+z2YYUWpX9wt4Pa1pXVZw3T/2XBgzaLNEUln7VNba
 1i9PjTN+TqokVzguj2GlwmOZxc5nMYOR+VwTgwFPXq7Dwa76BvNgVBCIoU90ILFZLCHUbNhorYG
 f1v+uf60UGNOyqr2e/hTRVdZc8hXIVIvyYRpIMHshnVlN2grD9j3as8+mvJBxqPnhFyNOsmW9TH
 Cl4Af68b7Tlg7FUAswAYyfTd4Q7yG97X9zjgYQ7nzcl9Vj37
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

Several HDMI drivers have common code pice in the .mode_valid function
that validates RGB / 8bpc rate using the TMDS char rate callbacks.

Move this code piece to the common helper and remove the need to perform
this check manually. In case of DRM_BRIDGE_OP_HDMI bridges, they can
skip the check in favour of performing it in drm_bridge_connector.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v5:
- Fixed alignment after renaming the connector creation funciton
  (Maxime)
- Link to v4: https://lore.kernel.org/r/20241122-hdmi-mode-valid-v4-0-2fee4a83ab79@linaro.org

Changes in v4:
- Fixed build warning in VC4 driver by adding .mode_valid to
  vc4_hdmi_connector_helper_funcs (LKP)
- Reworked HDMI test helpers (Maxime)
- Expanded test descriptions and comments (Maxime)
- Added new EDID to test info.max_tmds_clock filtering (Maxime)
- Link to v3: https://lore.kernel.org/r/20241109-hdmi-mode-valid-v3-0-5348c2368076@linaro.org

Changes in v3:
- Moved drm_hdmi_connector_mode_valid() to drm_hdmi_state_helper.c
  (Maxime)
- Added commnt next to the preferred = list_first_entry() assignment
  (Maxime)
- Added comments to new tests, describing what is being tested (Maxime)
- Replaced sun4i_hdmi_connector_atomic_check() with
  drm_atomic_helper_connector_hdmi_check() (Maxime)
- Link to v2: https://lore.kernel.org/r/20241101-hdmi-mode-valid-v2-0-a6478fd20fa6@linaro.org

Changes in v2:
- Switched drm_hdmi_connector_mode_valid() to use common helper
  (ex-hdmi_clock_valid()) (Maxime)
- Added simple unit tests for drm_hdmi_connector_mode_valid().
- Link to v1: https://lore.kernel.org/r/20241018-hdmi-mode-valid-v1-0-6e49ae4801f7@linaro.org

---
Dmitry Baryshkov (10):
      drm/tests: hdmi: handle empty modes in find_preferred_mode()
      drm/tests: hdmi: rename connector creation function
      drm/tests: hdmi: return meaningful value from set_connector_edid()
      drm/display: hdmi: add generic mode_valid helper
      drm/sun4i: use drm_hdmi_connector_mode_valid()
      drm/vc4: use drm_hdmi_connector_mode_valid()
      drm/display: bridge_connector: use drm_bridge_connector_mode_valid()
      drm/bridge: lontium-lt9611: drop TMDS char rate check in mode_valid
      drm/bridge: dw-hdmi-qp: replace mode_valid with tmds_char_rate
      drm/sun4i: use drm_atomic_helper_connector_hdmi_check()

 drivers/gpu/drm/bridge/lontium-lt9611.c            |   4 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c       |  12 +-
 drivers/gpu/drm/display/drm_bridge_connector.c     |  16 +-
 drivers/gpu/drm/display/drm_hdmi_state_helper.c    |  21 ++
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c             |  32 +-
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 409 +++++++++++++++------
 drivers/gpu/drm/tests/drm_kunit_edid.h             | 102 +++++
 drivers/gpu/drm/vc4/vc4_hdmi.c                     |   5 +-
 include/drm/display/drm_hdmi_state_helper.h        |   4 +
 9 files changed, 441 insertions(+), 164 deletions(-)
---
base-commit: 44cff6c5b0b17a78bc0b30372bcd816cf6dd282a
change-id: 20241018-hdmi-mode-valid-aaec4428501c

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

