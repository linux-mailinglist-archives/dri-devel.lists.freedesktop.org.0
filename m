Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11EA4A65A01
	for <lists+dri-devel@lfdr.de>; Mon, 17 Mar 2025 18:13:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CCCE10E044;
	Mon, 17 Mar 2025 17:13:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="SESqYGwp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B49C10E044
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 17:13:30 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-43cf05f0c3eso17393585e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 10:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1742231609; x=1742836409;
 darn=lists.freedesktop.org; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=af2T+qqFETVFhIunkgGHt3W8f1G68St4IjKGS7VLtuA=;
 b=SESqYGwpJUvSNHONWlTnV4tSNnXk6q0cYNNblZLtKQuLz74BhTiiEozo00upIOQ0EP
 o4bedjI7QPH9ZJ/MtNYZxnxF49NdKe1kfcf5+ouE1Tx8QDSfNbziyY7nu/dX3y4LFBXj
 KgvjO0VtZfovIwy1vlyZD3YrzvlrRJaECn39/iZGPNCquOyFCphX97m66XIGPsHml4A5
 cy/tziFUxI9k49KKl+caS6hq6yVgHuP2yx8FeenEYa+tPbVjW4V2dSTBu+/EOwLReFjB
 EyqNeIVkYNnHOsEdXoBpDwqdbOHpwMPSbgvDZXvvHHG6ljrosi6+2KpxcvAJ1rUAc2uO
 IZgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742231609; x=1742836409;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=af2T+qqFETVFhIunkgGHt3W8f1G68St4IjKGS7VLtuA=;
 b=BWTt/C4hsx9GDSNqgD7eN5zLCqpfO2dNL00yz/QTrwytD6NrcOc0uqAFVb5Y7bodn0
 eHTi3L5lQqwWvylM8Vr0GeffQRNRboJOLmb4D0hiAgiB8LY1PiTHeE67y276z7PcQ0kM
 gpnKQhtjMu9fCsK9Ze1+8XrX8wb1/D56Dr1hEcQtBPp3ZfMFkQN1WgBTv0sTANoZF/dc
 Y2hnv7Xqguj9dwlXuOMWlBxqh9Q7+ROkRgSiJvjno3Mpsba/eXVtDH7kI1wUd/I5J5fx
 JP/NWxKFyiuqqB0eP98z0tgg9nmrtGkMx7M561Y5E4S06xGaf7LQGXYXao8kWk4E6PXF
 XNzw==
X-Gm-Message-State: AOJu0Yx3a5q0v5Q/YWJt3a7TtOOZ7wKFZsu43US7jwmYyYAgG2L+fRk2
 VdBWYBbE8LnTIbSK3wHUd5h+VK675+JwwLPsYPP/Ktd4IraZEA2X2WxfpPVSfR8=
X-Gm-Gg: ASbGncsniZpnLa2WPZUc9Vh9bUCnGARHWyx//vQQUwWXY6FVer0swx9/PBDKP3feYw7
 Dnaa0VnBAjE0bFcemc3NDRF+f0noCq0yA9KSurL0wGwmmI5E6P1TxMPhxGjRw9c5J+Vmf+JSME4
 bYdrHeR6gfJTln+ZYGpVUoabLCZdYKmt/8kdpaiXSsbC2hbFAJ7DZgFIjqhS8HNRD8BZSvGShUe
 Vu3xb31xjW+1eNHAViIoYCkfBIAIOzfAX0uaCnu2gxgAP/vY7mjc527DUDtBPom2aj4iGY9J5hK
 OdKZyRV+HDyIfHpQxnm16I5QvwvvtCZz9g==
X-Google-Smtp-Source: AGHT+IFdezCTwV9D+zOpoxc2EiaNyS0kLnwCmYcKwtf9X+v1Hkb6NAmZ4F0XRIdGnVLakH5Iz/jHWw==
X-Received: by 2002:a05:600c:150a:b0:43d:2313:7b4a with SMTP id
 5b1f17b1804b1-43d23137bd4mr111445655e9.3.1742231609415; 
 Mon, 17 Mar 2025 10:13:29 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d1fdda15dsm112003365e9.3.2025.03.17.10.13.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Mar 2025 10:13:27 -0700 (PDT)
From: David Turner <david.turner@raspberrypi.com>
Subject: [PATCH v4 0/3] drm/vc4: hdmi: Add jack detection to HDMI audio driver
Date: Mon, 17 Mar 2025 17:12:21 +0000
Message-Id: <20250317-vc4_hotplug-v4-0-2af625629186@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPVX2GcC/23MQQrCMBCF4auUWRuJTWqCq95DisR0bAe0CZMaL
 KV3N3bt8n/wvhUSMmGCS7UCY6ZEYSqhDxX40U0DCupLQy3rRqpTLbLXtzHM8fkehHKo0VilrXZ
 QHpHxQZ9du3alR0pz4GXHs/qt/52shBS9aayxZ2N6tC27FO/IvEQ6+vCCbtu2L0p89wWsAAAA
X-Change-ID: 20250312-vc4_hotplug-3ae4e783484a
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 David Turner <david.turner@raspberrypi.com>, 
 Stefan Wahren <wahrenst@gmx.net>
X-Mailer: b4 0.14.2
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

This series enables jack detection for HDMI audio on vc4 devices.  This
means that userspace audio applications can detect when HDMI devices are
connected or disconnected, for example to play/pause or switch to
another audio device.

Changes in v4:
- Split the update of the comment on
  drm_atomic_helper_connector_hdmi_hotplug() into a separate patch
- Update the wording of the comment
- Add Reviewed-by tags
- Link to v3:
  https://lore.kernel.org/r/20250312-vc4_hotplug-v3-0-d75878677de8@raspberrypi.com

Changes in V3:
- Update comment on drm_atomic_helper_connector_hdmi_hotplug() to
  clarify that it must be called for disconnets too

Changes in V2:
- split initial patch into fix and jack detection feature as
  suggested by Dmitry

Signed-off-by: David Turner <david.turner@raspberrypi.com>
---
David Turner (2):
      drm/display: Update comment on hdmi hotplug helper
      drm/vc4: hdmi: Add jack detection to HDMI audio driver

Stefan Wahren (1):
      drm/vc4: hdmi: Call HDMI hotplug helper on disconnect

 drivers/gpu/drm/display/drm_hdmi_state_helper.c |  2 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c                  | 22 ++++++++++++++++++++--
 drivers/gpu/drm/vc4/vc4_hdmi.h                  |  7 +++++++
 3 files changed, 28 insertions(+), 3 deletions(-)
---
base-commit: eff0347e7c228335e9ff64aaf02c66957803af6a
change-id: 20250312-vc4_hotplug-3ae4e783484a

Best regards,
-- 
David Turner <david.turner@raspberrypi.com>

