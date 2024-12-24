Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F3CC9FC2D1
	for <lists+dri-devel@lfdr.de>; Wed, 25 Dec 2024 00:11:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0202C10E2AE;
	Tue, 24 Dec 2024 23:11:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="fIy4K9cS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3435F10E2AE
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2024 23:11:19 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-5401e6efffcso6535564e87.3
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2024 15:11:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735081817; x=1735686617; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nV0wFpUNGU7cVHKUVJlDMUxCPVZYqdNcjZupw9ebfRg=;
 b=fIy4K9cSzUifM79CLG1lJqhJQR3irAyKTzp1IfyzIVA4qhIFvj/U+oYEVXtOxVz3xO
 HXWFxZJs1GAlzu9605vCf9LVhqM+Y744TkuoeZKub1u5NZw5/fPMKMK2zJmpoUoT6eBq
 U/I0cuhFmo30nst6rwH3v7IlRkyHc4Hn14QuLJAD0htY9i7CbzOuayO76fk1d9waNdmG
 oM6rp9LJpU4t8jdOMCHcNrWtz1XzutoUI6MR1QnyQfVzmIaJx6MnR8WxV9QrXHbh2RXP
 fOR3NEM+RODlyAMVqZH3aEuxpUmHPYwaY5zO6EhQ2CXLwP5dvNhfQDmWvKxo5kEx9lXc
 KPMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735081817; x=1735686617;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nV0wFpUNGU7cVHKUVJlDMUxCPVZYqdNcjZupw9ebfRg=;
 b=Qx9kssQXvAM00nXa81iE2CioI1Yzkd+9OIseuXoVu/HSjqQJ8UAPuyQFh5PSrufbbX
 xfGCELCWimRtZlID/hWZ3YHraaPcih/ydriiXfDbTItlcw3PDwK7C3w+JKuBFxTRafIq
 vWNoMZMJBrw8pW0ntbWyK1rGcvEKCVIaLrwZ4taZG9I+FKHz1Lz6c1l2mjABmVgSbRem
 8b9ZIkH0SpF8nPbFhtP9C1Gntrzg1R2s8QA7nhlRNXQp/AkhInNELgZJzrhZBNEdwP2c
 tjMXh2KbDbst6xJVEv+6cepTtt87poxVquGhhTkPfdFnutFM9H8O3p7qRTwRYvsqpRW7
 1EGw==
X-Gm-Message-State: AOJu0YznX66WRdDsWDlkDN1E+LPGDHDuQYX1NS8zrPMKLRs/ZFtKF2G9
 hHvfoH4/I4VQIWXEgYg7/5ORCC3MNkfVBeEosxOrYo2o2HjuIhgLXxvLRkqNAj4=
X-Gm-Gg: ASbGncvdHsjhyWJgWWnBI4ic2+oFHAhg+fKWLPdF8m1jIOsXkbj637ij/gdqBKM/4dF
 4/hr6ixEFK3PgNN7n3A8vQqIFVo2PxgTJ5dv7ikekAx3kh0xwVoASJd2eYWnQuYUfKpS9tFvwVt
 1wvJYozyM8SYlE/l6gjQCwURJcDJMs2UqoYGEQzNUtVu2yuRGOXiVvtcXN3dlE/I/Gw8NL5Ra2d
 XSu54uF3xzQyxcqLn5EOY54X09Tq3nYKcgrr4N79u1TwwchTv4RGFXVGSxuyVTM
X-Google-Smtp-Source: AGHT+IHrYXPa/nqp5joPr499Si0LtM1pS1ImBO3+7nQ/lYOL6op8Hkev8UfZ9USk9BHdovLZ5XzB8g==
X-Received: by 2002:a05:6512:2809:b0:542:2871:535c with SMTP id
 2adb3069b0e04-54229539f85mr5520006e87.22.1735081817087; 
 Tue, 24 Dec 2024 15:10:17 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-542235f5f74sm1721283e87.43.2024.12.24.15.10.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Dec 2024 15:10:15 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH RFC/RFT 0/9] drm/display: generic HDMI CEC helpers
Date: Wed, 25 Dec 2024 01:10:08 +0200
Message-Id: <20241225-drm-hdmi-connector-cec-v1-0-b80380c67221@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFA/a2cC/12OQQ6CMBBFr0JmbUMpINKtCQcg7gwLKIPMokVbJ
 CSEu1tQE+Nu/vzMm7eAQ0voQAYLWJzI0WB8iA4BqL42N2TU+gyCiyQSImat1axvNTE1GINqHCx
 TqFic5FwoPCVZk4E/vlvsaN7BVyiLc1gWF6jehcXH0z8aP21TO/Q0rWmUwYbX5FT4HZjBeYRfH
 RlsMjyN+S7TWGr9/s8pb3h3zESaZzHKKeJQresLGz6CJ+0AAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3540;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=W4lzolCe1YrJFUFFAu3LjgGemi/HQjuGu6rfZIhaXS8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnaz9VEXY/oU447yfv2RXIcGmM0/I7rdc4g7iLI
 Soa2bpi1EuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2s/VQAKCRCLPIo+Aiko
 1YR4B/9bLVrev3IUCqDK7MXgcU2G1PuF/ZZD4yqUu/uzZqeV6cofe3Rb9/dlml8J5TNjrzFayce
 IIb+pTr4TxBAOiWCjcq6McIxqoGXSMXV5XvOUalybPUC/kFNRuRUx6LS5YEuc/744I+WhfOJDMv
 TiX4OMzPP/A1OvpTO4CgJSd9t4Yhxq0tHinr6glSNczm75d863YtwK6DuE8woPsbFGvwGTV4kVq
 1qiR6O/l3NDmc2wX22JLOer+0GC0ltXjQVqXny71Mj20ZvAByRxBKmUjvKOi/L4XD9LJptw41Nv
 R1+jtOZKK0ZeQ4c+6qVJGCkV6QRvfODUeskTfHVJA0zXBiKO
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

Dependencies:
- https://lore.kernel.org/dri-devel/20241224-drm-bridge-hdmi-connector-v10-0-dc89577cd438@linaro.org/

Notes:
- the patchset was only compile-tested
- being an RFC some of the API functions and structures are left
  undocumented
- although the patchset provides drm_bridge / drm_bridge_connector API
  for working with CEC, there is no actual bridge that uses the API
  (yet)

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Dmitry Baryshkov (9):
      drm/connector: add CEC-related fields
      drm/display: add CEC helpers code
      drm/display: hdmi-state-helper: handle CEC physicall address
      drm/vc4: hdmi: switch to generic CEC helpers
      drm/vc4: hdmi: drop separate CEC unregistration
      drm/display: bridge-connector: hook in CEC notifier support
      drm/bridge: move private data to the end of the struct
      drm/display: hdmi-cec-helper: add bridge-related functions
      drm/display: bridge-connector: handle CEC adapters

 drivers/gpu/drm/bridge/lontium-lt9611.c         |   2 +-
 drivers/gpu/drm/display/Kconfig                 |   6 +
 drivers/gpu/drm/display/Makefile                |   2 +
 drivers/gpu/drm/display/drm_bridge_connector.c  | 106 +++++++++++++-
 drivers/gpu/drm/display/drm_hdmi_cec_helper.c   | 182 ++++++++++++++++++++++++
 drivers/gpu/drm/display/drm_hdmi_state_helper.c |   7 +-
 drivers/gpu/drm/drm_bridge.c                    |  16 +++
 drivers/gpu/drm/drm_connector.c                 |  23 +++
 drivers/gpu/drm/vc4/Kconfig                     |   1 +
 drivers/gpu/drm/vc4/vc4_hdmi.c                  | 117 +++++----------
 drivers/gpu/drm/vc4/vc4_hdmi.h                  |   1 -
 include/drm/display/drm_hdmi_cec_helper.h       |  48 +++++++
 include/drm/drm_bridge.h                        |  78 +++++++---
 include/drm/drm_connector.h                     |  43 ++++++
 14 files changed, 529 insertions(+), 103 deletions(-)
---
base-commit: f8a2397baf041a5cee408b082334bb09c7e161df
change-id: 20241223-drm-hdmi-connector-cec-34902ce847b7
prerequisite-change-id: 20240530-drm-bridge-hdmi-connector-9b0f6725973e:v10
prerequisite-patch-id: 85bbbb29d36e382708178f1c549d2664ccb0dae7
prerequisite-patch-id: 8a90cb7ff9333ff21685adde0f3a273d8893fd2c
prerequisite-patch-id: 7747636339e4f1a8e8dd55adae9705eeb25116f9
prerequisite-patch-id: c7a93faaf73aa313a873001cad7bbbfc467011b1
prerequisite-patch-id: 97484c77f487c2d6682de461a64c55d7d7e7bae5
prerequisite-patch-id: 7607ac869c1c6aae0b1cfc72603a8ca51b81568a
prerequisite-patch-id: 5c9929248e783a6f39d657abff715c9ba5f0e4f0
prerequisite-patch-id: 865e12812b0401d4b5643d9097808a39b5f8c5dc
prerequisite-patch-id: e4c9022b225196ba95520a0b2934005eb137237a
prerequisite-patch-id: 82f04a7066d66c16dac623d6888b9d7069cdef00

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

