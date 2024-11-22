Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF9AA9D5B83
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2024 10:13:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AEA810E16E;
	Fri, 22 Nov 2024 09:13:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="myAOie3/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7586910E16E
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 09:13:11 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-53da24e9673so1984587e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 01:13:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732266789; x=1732871589; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yPJBOfYSV90IcFVSxfOZG/ZLElTJvS62cOj1dS8TNSc=;
 b=myAOie3/nShIgxBxnJiiHuuAaU0kUFUvwKA18mX1w3N1O71n7GQEJRvwfDyAH8K5dn
 Ypd/JrHCu+5NOjJrk2c2HImk3mCgEW9KbM6MR3MBvO7tvVsVY0j+ILE4duGpiUgFGit5
 DTqSDxixKxw8UlLYkNT4QV4NYVSTqsMnQfH+S4ol169/QxqwbJSBocndsj47vOAAiVir
 W0rJKbp9gBlTs1p2Eg8KpzUjTper5/VKAGvxU9W5kZisHd7lO/w+gtnMMebKjEh5iIMw
 ey9afLXbTF0P98BolCoQegjqMXSVaSGxeCNGGhlWvarjiSVuZ+XzfIdYUjk+lwsBhL/T
 gYcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732266789; x=1732871589;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yPJBOfYSV90IcFVSxfOZG/ZLElTJvS62cOj1dS8TNSc=;
 b=CLv3VYnihHJ2sglinXTiYA5dibn0CpxBmf8aKLSbEhKFysM6UK8vc2g3fg7MULfRbt
 hCdfF7HrwPh099TrxTtWQ1082ZiiUqJZl36gVmPonc4qPqMyTafI9adkLuPKAo+m23ik
 aY7HUH+1KlgQywEzljfT7x1lJySQhqWYmLzbZCq9dbQjHjpwoqmdlnDiB9/xB/m1QdYt
 HhrJsq2iKbmEUZ0aFzp5K/lQAI5d4m5QzVNH6f3evNa+pknvH3yS4RY0I/O6J0TGM+Oh
 9R5GpemJffTe1oeOs4aLRBUvEwnrK+0ifYiBLR49uLZnStBRZ2rJDD8xNto+2DyXz5yq
 SeKQ==
X-Gm-Message-State: AOJu0YxHZbhMMvBzH6LfVJzIVn2pm3Sc08Jnp50HCOgmtwoVEw7TqrA0
 674O/xJF8mdSzzRyBJ8XDAuVcQ75pWk2lKvyCWexZPUg8XXUxLDvJHEKOon0RnA=
X-Gm-Gg: ASbGncvwSQwXxhIJJYRe40xRVizE3n8GuyMY+hBMrJKDGDceVBGRE1sMkDXLzUAywt6
 JJbL8oPEZnlLxg/wrKiNs+JgrQKpYgAmlcZBShTat5pEw1vZtYLJoDJuCBI0XFvk3m+U5QnPOWg
 icw3FXx4dONRjec3uiBnSKVFoqGuUbMBOVQlLPcCigxg3KosNzHUCYEbxUBbbdIYQ0Ed4XYkY3d
 J+uGWOLc96349grUwuB9HVzPp6p3BHMr/qtIv5uiY54z7IK316S2IDMAw==
X-Google-Smtp-Source: AGHT+IGEb5tRInMFtVE9GZficnUTiVO1xCATodroM7GK3ZevvdEIuIB/MI+jMs/pCyFMTD+eeIO8JQ==
X-Received: by 2002:a05:6512:10ca:b0:53d:a9b9:fdc0 with SMTP id
 2adb3069b0e04-53dd389d8a1mr1112818e87.31.1732266789361; 
 Fri, 22 Nov 2024 01:13:09 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53dd2451386sm299530e87.77.2024.11.22.01.13.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Nov 2024 01:13:08 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v4 00/10] drm/display: hdmi: add
 drm_hdmi_connector_mode_valid()
Date: Fri, 22 Nov 2024 11:12:56 +0200
Message-Id: <20241122-hdmi-mode-valid-v4-0-2fee4a83ab79@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABhLQGcC/3XNTQrCMBCG4auUrI3kr2l05T3ERUim7UDbSCJBK
 b27aTcqxeX7wTwzkwQRIZFzNZMIGROGqYQ6VMT1duqAoi9NBBOKM25o70ekY/BAsx3QU2vBKSV
 Mzbgj5eoeocXnJl5vpXtMjxBf24PM1/W/lTllVIM6WVCG8ba5DDjZGI4hdmTFsvgARdgDogBWq
 8a0XrDW6h0gv4HTHpAFqKUyTkhtWPMLLMvyBlx47n8xAQAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3023;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=dAGoBfBZPrQ28ollGsFDqICLzpx3eGynrKY+liYfcfc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnQEsh97cY2ewxrd1QdOkVWNxJCVibvExTdRJp9
 9bHLnJ6vOeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ0BLIQAKCRCLPIo+Aiko
 1aIBB/9UOalIiiDyCESbhN5VK1zX78Q2v5Cu6GR9StRIoyHvHhPD2SZblaTT0rK2OUduQIaCzil
 e43PDFRCRm4oTpATivZAvHM+yi203AUBJiwIOMAe3JA+lhIvMk3+ifawcrw9Cl72SEbVds3dBNt
 BIFRNdKbfHdX7wqjMVc2sNYXaGiXlxNEvRrur+Q56Z5uoO+XYx/CdGPi1clyXilpj3fMjPiIs5o
 dtyVnROt60CnOjUDof0ueLHTqnMk2Ydx3ZhtWbgLtC5avyxhU0xLPgjLAqQDjkW3BXf65sD++Ux
 wdtO/dYUJ6BFYYLwt4PattfJC/Uz53ohOyAbm08X1xxiSoWn
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
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c             |  32 +--
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 269 +++++++++++++++++----
 drivers/gpu/drm/tests/drm_kunit_edid.h             | 102 ++++++++
 drivers/gpu/drm/vc4/vc4_hdmi.c                     |   5 +-
 include/drm/display/drm_hdmi_state_helper.h        |   4 +
 9 files changed, 371 insertions(+), 94 deletions(-)
---
base-commit: d80b5c5b9be6b2e1cdeaaeaa8259523b63cae292
change-id: 20241018-hdmi-mode-valid-aaec4428501c

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

