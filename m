Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB6FA1C7F8
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jan 2025 14:29:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31BBF10E064;
	Sun, 26 Jan 2025 13:29:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="DtndhEUk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7590610E064
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jan 2025 13:29:12 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-53e389d8dc7so3998986e87.0
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jan 2025 05:29:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737898151; x=1738502951; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YkJItks+ZgT1LhyyEvEmk+bb+UNoPEpZkEDKWpawiPM=;
 b=DtndhEUkb4HA0MFxQC08c9Cir2QXMb/ylz5yN6GdTqlMNuBVZUJMOGQ/C3W6z4Y9V/
 vRi35m4Quf4jTYSQ1sdDFKnXQW8pI4v3G83xxSMtNb+w8X8vZ2EHqr5kxflvqJ9ezBMN
 xFHe7mJz0g+Ps7usTSHOphsDxawj6LyPSWYoazLP2vsrSzBYu93QBlJ3NBiR5O441YhZ
 bowpvybbnP1P1QHGLLYs0rmrNd4hgjU2zsqS18XNg30n3a3O+NsEUtvpdczvRDHvpka2
 8zxB+EWkntELm3ZEC9G2J01gEcgiLJYD4AFmJYj7nyHi4YTq8UwxSFCgkQEkSt9xCf8f
 lO4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737898151; x=1738502951;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YkJItks+ZgT1LhyyEvEmk+bb+UNoPEpZkEDKWpawiPM=;
 b=Zakxar7rbD+Q2KDxwUahVePCO5hDgKxa7mpusnU6NI3pAu/E42F0MwgKfldIoHB7+M
 IyPxM3/mNXS1jtgMY2IwiPb/3Gy3F0eV6La+NmHcR54zZ/7l1ENEXC37BtD9JfXBUXzM
 4aiAJPx767EQ2OtCoxKwNWWwdX8S5uGXWw98urGeUrmbSspGbcLZYjsym/6OkUp+8ezj
 G4ITB2t2sTEr11r3r5sXwfauhwruO94kyG5JaVSponj7eOZ81gYLwz0NoUwFkZ+hRDA1
 mod1z8fLm440st/ST4gEWKkdamkCaYFGOfdXJjdR4uZyB1tcPhfqfj38iq/2igZ/FLOR
 VXbQ==
X-Gm-Message-State: AOJu0YyThxXGfoTaH3srp2q7kgc0JkYmZCvqaL5LTpQXH1g1+KkFD5fd
 nlVTJKPgCb0P7hVyxRqBhqeY9YcqWxGEE3g7in5rqj+lwD1lSlcUQHS5+lbM9/c=
X-Gm-Gg: ASbGncuqSlZP7IClVNr9nu6hEi6YGPbH1RTtbPRnRwWd1OmsIJZ3rXz+BZcwpytACqg
 q/FWH+8BmcEKBuDV2IC2WM86t6n/VVsH6utnf9H/U91s3XfOwKURAVjdbgT8zj6o141uZJxbITE
 v5o/JRUAi0fhTgaW8veBy0voJjbGP0Z91eFIQQBdk8sX0rZa518fLbLfC/BbMTgVipyd0H49+9g
 qddMnQpndiA8Hrm/cswf76qKXmSQtPACjVa88fyKdpia9kdibr6e6Y+uLUdrkbblYoORwLJlva1
 pNkK8PXWHy3/
X-Google-Smtp-Source: AGHT+IHlbXzcc+JUoM6aoVZRGbxFidmwEYc3Opz4ujGY4LpAr2bYwbP/ai/9HhFqQjL/1Tvm4G6HtQ==
X-Received: by 2002:a05:6512:1247:b0:542:2e04:edb3 with SMTP id
 2adb3069b0e04-5439c27df0cmr14237028e87.49.1737898150596; 
 Sun, 26 Jan 2025 05:29:10 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-543cbbd4cf8sm770488e87.201.2025.01.26.05.29.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jan 2025 05:29:09 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v3 00/10] drm/display: generic HDMI CEC helpers
Date: Sun, 26 Jan 2025 15:29:05 +0200
Message-Id: <20250126-drm-hdmi-connector-cec-v3-0-5b5b2d4956da@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKE4lmcC/3XOTW7CMBAF4KtEXndaexzyw4p7IBbJZCAj1TbYI
 aJCuXtNKIsu2PlZet+8u0ochZPaFncVeZYkwedgPwpFY+dPDDLkrFBjaRAtDNHBODgBCt4zTSE
 CMYEtW43ETVn3tcrlc+Sj3FZ4f3jmyJdr9qfnp+q7xBlxTqZt8VCdJPp6PcDzbVKP5igpH/lZF
 85mrf6N2bwbMxvQ0DfaNpqqGtHsvsV3MXyGeFrNGV/ORhuj3zqYnVZXNTVHW1aV/ecsy/ILSq0
 XED8BAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4474;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=ztUGFnDVtzToyOKdVsAlQB0DbdYOX2drWiMAmgnm9PM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnljijhc8i+4NkQp8Y5wkXqFq/hlg2upODpe3D5
 byP4B5DhBWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ5Y4owAKCRCLPIo+Aiko
 1ePJB/4tw91uBLShH5NUrNz+9yKQLlbGI1ivVMXdpoHUVsXpTr2FpxKU7MFCzMnAA8+VZ3HLTUc
 j/V3NUH30PbrGT2AzTvTlfjpdk/djx6n5pbaltlaWSSOvGhIVtBB0FMaWQ8hK6ZvAwRNmAIV7PF
 KlaS/tjIc0Um/k5OJHmUm2HBnVpzVBu68RwrSXbLv9vWyBK8Be3kM0HaxaAdYdt3gdXktuB4dss
 Y4BPOhUCmjPEiYZqMdiiko4Pz6blLNAoZBLbQ2UMVgqs45KQ3dYz4rg+vnyAhXnd+R8A3LZE7qX
 aFGKZXdVCt0kV4NNvIj6nd77IZNqenIjmLHJmDjehOV5bRP9
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
Dmitry Baryshkov (10):
      drm/connector: add CEC-related fields
      drm/display: add CEC helpers code
      drm/display: hdmi-state-helper: handle CEC physical address
      drm/vc4: hdmi: switch to generic CEC helpers
      drm/display: bridge-connector: hook in CEC notifier support
      drm/bridge: move private data to the end of the struct
      drm/display: hdmi-cec-helper: add bridge-related functions
      drm/display: bridge-connector: handle CEC adapters
      drm/bridge: allow limiting I2S formats
      drm/bridge: adv7511: switch to the HDMI connector helpers

 drivers/gpu/drm/bridge/adv7511/Kconfig          |   4 +
 drivers/gpu/drm/bridge/adv7511/adv7511.h        |  51 ++--
 drivers/gpu/drm/bridge/adv7511/adv7511_audio.c  |  77 +-----
 drivers/gpu/drm/bridge/adv7511/adv7511_cec.c    |  56 ++--
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c    | 342 ++++++++++--------------
 drivers/gpu/drm/bridge/adv7511/adv7533.c        |   4 -
 drivers/gpu/drm/bridge/lontium-lt9611.c         |   2 +-
 drivers/gpu/drm/display/Kconfig                 |   6 +
 drivers/gpu/drm/display/Makefile                |   2 +
 drivers/gpu/drm/display/drm_bridge_connector.c  | 105 +++++++-
 drivers/gpu/drm/display/drm_hdmi_audio_helper.c |   2 +
 drivers/gpu/drm/display/drm_hdmi_cec_helper.c   | 247 +++++++++++++++++
 drivers/gpu/drm/display/drm_hdmi_state_helper.c |   9 +-
 drivers/gpu/drm/drm_bridge.c                    |  15 ++
 drivers/gpu/drm/drm_connector.c                 |  13 +
 drivers/gpu/drm/vc4/Kconfig                     |   1 +
 drivers/gpu/drm/vc4/vc4_hdmi.c                  | 140 ++++------
 drivers/gpu/drm/vc4/vc4_hdmi.h                  |   1 -
 include/drm/display/drm_hdmi_audio_helper.h     |   1 +
 include/drm/display/drm_hdmi_cec_helper.h       |  69 +++++
 include/drm/drm_bridge.h                        |  77 ++++--
 include/drm/drm_connector.h                     |  44 +++
 22 files changed, 834 insertions(+), 434 deletions(-)
---
base-commit: 7c3127e4814c304c7d5a2fa796a42e75a9b8606f
change-id: 20241223-drm-hdmi-connector-cec-34902ce847b7

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

