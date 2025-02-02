Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92452A24DB5
	for <lists+dri-devel@lfdr.de>; Sun,  2 Feb 2025 13:07:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8502810E164;
	Sun,  2 Feb 2025 12:07:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="YvatIhEh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBC0510E164
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Feb 2025 12:07:17 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-54024ecc33dso3559728e87.0
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Feb 2025 04:07:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738498036; x=1739102836; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Bpa6DswmTEpKbgEQQSdAsXNGWXb6aM2f9Q6VU1SY1iA=;
 b=YvatIhEhXQ2Adfn7C5OGQcBqORe/3Yc1Gmz2N/ees/+3BkVJupgcHrgb0RPTKCJlh+
 gQzWT8s3o9IHi/OGFR7c108Wssw0VrgauGVfZhJGowOWWO+0ZmmVV87kqjBLFLmybw9G
 7pds6LOQixIryZLiD0M26fwLsk+4J6uBv+7kaBhzLA4lQGeFIPVt5sdYBhuQtH9V9QRq
 Z592HjJWxEJhYFFCTvWvKGYD5Yi9TBLlx56s559LkKUlPiWwcmi0aZYj38AMaTgtCSsZ
 WjW1TMdY3phjClIPBTZxrt3LyBpCh1c5FsyjcW0tmAPNU53VLw0M0rekWQcW8gYbMNpV
 jT3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738498036; x=1739102836;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Bpa6DswmTEpKbgEQQSdAsXNGWXb6aM2f9Q6VU1SY1iA=;
 b=mddSrmb5icLy66edw5zLJ8TDcR5bXXS3+EHBpEQTj+IRnX9W3dNKELQCejTUnf4Ljd
 /gv9/VEqd1nMmS0QabLw8AQ6NmSlHVe8lxkySEiRIqLhFeyEWiasQJD+2Nw1Tq0HY52b
 0cYn7GiR/4e8Lap/kj1HlDhiGaARkkMuDsYNh0QzB9bFrZFsBVNGf7G1CFU+t2CxQjl6
 UZ1g/xPXr/bxHT3ZeK+7gzlNLf9rWYpXutYbFisSi3E9IgawOiCTQuQjyd4kMTrIfqwI
 GjaSDqpeewK79uR0yoW117QunPqlOUYSw/RnUcomSVEYPkCGNDGnMQcTaYs7BkoAk55p
 OthA==
X-Gm-Message-State: AOJu0YzLqrGOrrQEIIVHPtuo/M6CdvK7/NV1+Ncewqi/wBV9ldSOxuhG
 VmteObRY9LzN3SDo4G+4oba30soXXY/TYmRxURqqn6c0ERfnXEsgbdjgk+KBV2E=
X-Gm-Gg: ASbGncvfyN+SRB6CBRMOCWwnrpVM+npOD/arTWbK61+N22kgQxSXNiM4hwd5lWu+fbp
 hkPIyEhsgtjPzqIQm718RkqcqBwxGzGQPSLYZrQcDVeHXtEXiIUhPK+KhxRlq8nPkj/N3OOk/Mm
 FnTBkUIYjINHBEy5QoFnHJt0qjuYgPcWg8Hex6CNszVd4eCsM2gz1oyVsv9i+7Njv6ePzh5UAXg
 9sKOyst/B7Nz9/zvrV8oPaXsd66ybxO5vKh5+XB5ue1DWfMiS1Eeonm3eDAobpkZ2zD9gvrm7Pn
 z7+IJDH9i7FUtkPqKcB9oGQ=
X-Google-Smtp-Source: AGHT+IHXtU3IejP8YwnVJn9MYyIczDnB+CnKzsS3+Woi3ywvC0dnZKgoijsqo2DU1DRq6NjAJmdRgw==
X-Received: by 2002:a05:6512:1254:b0:542:63a8:393f with SMTP id
 2adb3069b0e04-543e4be9ba4mr4994463e87.14.1738498035561; 
 Sun, 02 Feb 2025 04:07:15 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-543ebe10678sm960695e87.101.2025.02.02.04.07.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Feb 2025 04:07:14 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v4 00/12] drm/display: generic HDMI CEC helpers
Date: Sun, 02 Feb 2025 14:07:07 +0200
Message-Id: <20250202-drm-hdmi-connector-cec-v4-0-a71620a54d50@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOtfn2cC/3XPy07DMBAF0F+JvGaKPXZeXfU/EAs/po2lOgY7R
 EVV/x0npQKEsvNYmjP3Xlmm5CmzfXVliWaffRzLoJ4qZgc9ngi8KzNDjkogSnApwOCCBxvHkew
 UE1iyIFXP0VKnWtOysvyW6OgvK/zyep8TvX8Uf7p/skA569XfV0WvuRDyRwZy3kEi7aA4MCMIc
 Ki5kp1WSpuDjeezNjHpnY1huWh0prIagp/21ZIy+GyfHw8Y6TKxJcngcwn9uTaexRrlu1y9VW4
 WwMF0XHbcNi2iOJz9qFPcxXRazRkfzlKDbzpYnJ43re2OUjWN/OfIXw42m44sTm1qg071deP0H
 +d2u30BoCtuQdcBAAA=
X-Change-ID: 20241223-drm-hdmi-connector-cec-34902ce847b7
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5632;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=+ddOHAChZI09nxOE28d6g8J7A1xlEBUGNnuTAJPfFjg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnn1/u5xbKjKTTQo+qDVQzXWDIOv2bTTvYcemOv
 Ek3NYpmmt2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ59f7gAKCRCLPIo+Aiko
 1fFRB/9n6b3hUN7ES8r9z2mHMYUW7j1Y2fjRe0DNi52YDlGZNCFEB/mmlbW4p4WCJKVOud11PgY
 enIwbzj7DiiL0AgPLFbmRlfsHqKEZNg2y44UUJi2Ljo1ped0ekb+zVDBbhM9u3OrMh5kxvXI+gl
 Fw1WXS1t15ZyLUR/cmEnrVBIMsZsI1pi1eHk2/ujOZDZTT765kQlJo38iG6ovZWhSK0f+W8h5cw
 ieJuaEUpC2jFvJTwcQFzGWsrGSr+JxEBD0sfzwpa2dDgHAhuOIK+c6jcU6j3gf23IAzvJbfxIUm
 n5pPbPmhmYr00naZLnfsp5Ch2G2TxcZgUKQVyTkBl1XgZj/W
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
---
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
Dmitry Baryshkov (12):
      drm/connector: add CEC-related fields
      drm/connector: unregister CEC data
      drm/display: move CEC_CORE selection to DRM_DISPLAY_HELPER
      drm/display: add CEC helpers code
      drm/display: hdmi-state-helper: handle CEC physical address
      drm/vc4: hdmi: switch to generic CEC helpers
      drm/display: bridge-connector: hook in CEC notifier support
      drm/bridge: move private data to the end of the struct
      drm/display: hdmi-cec-helper: add bridge-related functions
      drm/display: bridge-connector: handle CEC adapters
      drm/bridge: allow limiting I2S formats
      drm/bridge: adv7511: switch to the HDMI connector helpers

 drivers/gpu/drm/bridge/adv7511/Kconfig          |   5 +-
 drivers/gpu/drm/bridge/adv7511/adv7511.h        |  51 ++--
 drivers/gpu/drm/bridge/adv7511/adv7511_audio.c  |  77 +-----
 drivers/gpu/drm/bridge/adv7511/adv7511_cec.c    |  56 ++--
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c    | 342 ++++++++++--------------
 drivers/gpu/drm/bridge/adv7511/adv7533.c        |   4 -
 drivers/gpu/drm/bridge/lontium-lt9611.c         |   2 +-
 drivers/gpu/drm/display/Kconfig                 |   9 +-
 drivers/gpu/drm/display/Makefile                |   2 +
 drivers/gpu/drm/display/drm_bridge_connector.c  | 105 +++++++-
 drivers/gpu/drm/display/drm_hdmi_audio_helper.c |   2 +
 drivers/gpu/drm/display/drm_hdmi_cec_helper.c   | 247 +++++++++++++++++
 drivers/gpu/drm/display/drm_hdmi_state_helper.c |   7 +-
 drivers/gpu/drm/drm_bridge.c                    |  15 ++
 drivers/gpu/drm/drm_connector.c                 |  13 +
 drivers/gpu/drm/vc4/Kconfig                     |   1 +
 drivers/gpu/drm/vc4/vc4_hdmi.c                  | 140 ++++------
 drivers/gpu/drm/vc4/vc4_hdmi.h                  |   1 -
 include/drm/display/drm_hdmi_audio_helper.h     |   1 +
 include/drm/display/drm_hdmi_cec_helper.h       |  94 +++++++
 include/drm/drm_bridge.h                        |  79 ++++--
 include/drm/drm_connector.h                     |  46 ++++
 22 files changed, 863 insertions(+), 436 deletions(-)
---
base-commit: 7271a88629857dc285d4291055b8e7811f9d3603
change-id: 20241223-drm-hdmi-connector-cec-34902ce847b7
prerequisite-message-id: 20250113-hdmi-conn-edid-read-fix-v2-1-d2a0438a44ab@collabora.com
prerequisite-patch-id: 87a719632f0ca1a6f3c0a495eef515a463c3fa7d

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

