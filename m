Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04003A5E0AF
	for <lists+dri-devel@lfdr.de>; Wed, 12 Mar 2025 16:41:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA8E110E315;
	Wed, 12 Mar 2025 15:41:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="UC2zMfGa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ACE010E315
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Mar 2025 15:41:22 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-43cf034d4abso35302765e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Mar 2025 08:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1741794080; x=1742398880;
 darn=lists.freedesktop.org; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OfUT6kCFSXIkCrrgruX0eG+NMoJfpuEuW5DgyO4JO2I=;
 b=UC2zMfGaVgqEZfTl/L7TpcjShRVu2IrA6LlWgETd8NeJVFLOjgjTt0C0P90kk8Wh/5
 4HcDsSM0rk7Cv+eF5OLAbOr0SaGD52iXFz657o4rCWr8qWGrL6LGEKJ1wYzl+6afqC5Z
 r4qxArg06Ppicnr/BVjKMrSjF9BGybDksZHdsJdGFToMLNFBv1B9Lc4bjtJCeBxCdpJx
 lDqM4VrczVLsN6rp8wZYQ3rsn/BpFtNVUjr8iuj8GLpoMzBAkK2GLsWDpkDxb38+5n2P
 ZaMnfgVIWZPuydkdfudQWVTESPP9a6xAklsVUzm4fl6VFhxJ2vsM0eF6FFPPEe4rDAep
 2/Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741794080; x=1742398880;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OfUT6kCFSXIkCrrgruX0eG+NMoJfpuEuW5DgyO4JO2I=;
 b=EDr9LpB9b8uskrCBk+5gZDgDVAeEEfu5NylEe2aHJ/MJ8h4/+3WDep8aKFzKcezAKb
 aVi3jAaZjVHZWhTqjZjN0jM/v7Ua3FESk9ftMzcjgKAFMLrYB8b7xbp0vfLNMTKZ1LBj
 HImz0Xr2FT3lWbwu6fkjNvMxiOpICfZ95HfgatMTpyGqcRenw8U5MQgmmhmEFPsZQUbm
 pCJCeK0FutyRsv+um9b8i63xoiizAmBaelbfxXDwIV5VDg6kvt71KeyLQ7RmkvLletge
 NP8WoEKzA6zR28TPJ9npUQHuPrKtRMhLW+ZESDyAUdwvpKnY6bXGFuu51AuuL3SBE+S5
 Jhrg==
X-Gm-Message-State: AOJu0YzVaytZxHzUdrVMbxvnOqY1mWXy+0TWIUkX4zY9SCmygWnx+5Pt
 dY27YYmThfg/HnE5t1ZCeukLOTyqcocaq9VFE3SlFdNZ/cz4GKhImYACPpuvTjY=
X-Gm-Gg: ASbGncsvhZmF1ZCTCZ32ZAZSgqbaZJpgBayk63zW6yl9EREDvDMhWyZEqIp/5UpBu/f
 tvMjBj05iceE8SEuv5AJZcOoK/CQB4JRFcBfRjQ2Un4Q73na9ibYjJYjKMZfiQEztDH2OLitZBe
 qd7909BEdFRVvdVMmXJMVQpSD5m1Ns5VYKsgy7o/xmO1BJXcY+oUZeuUP+1ucZGfBsnWfjVZwEA
 lsOCVAbCn7v3kAj+GsXxoLl8hx2pCJuNeGkarLFamt+S+ItTcKVlQW8n7CgiHntKW34tSVJjWHW
 dsA+GEfyDhzFhMBImWlq3KHAv81cMW6Qgg==
X-Google-Smtp-Source: AGHT+IENCzZL+aT1XOXTb96mtylvqWlPttqLP4HGjDO8fHEAP0SFs7XnK2I1EcdWPZg6cleMtlKkqg==
X-Received: by 2002:a05:600c:3143:b0:43c:ec0a:ddfd with SMTP id
 5b1f17b1804b1-43d01bd2182mr84819235e9.6.1741794080259; 
 Wed, 12 Mar 2025 08:41:20 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d0a78bdbfsm24374915e9.25.2025.03.12.08.41.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Mar 2025 08:41:19 -0700 (PDT)
From: David Turner <david.turner@raspberrypi.com>
Subject: [PATCH v3 0/2] drm/vc4: hdmi: Add jack detection to HDMI audio driver
Date: Wed, 12 Mar 2025 15:40:54 +0000
Message-Id: <20250312-vc4_hotplug-v3-0-d75878677de8@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAar0WcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHUUlJIzE
 vPSU3UzU4B8JSMDI1MDY0Mj3bJkk/iM/JKCnNJ0XePEVJNUcwtjEwuTRCWgjoKi1LTMCrBp0bG
 1tQDa1TmoXQAAAA==
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

Changes in V3:
- Update comment on drm_atomic_helper_connector_hdmi_hotplug() to
  clarify that it must be called for disconnets too

Changes in V2:
- split initial patch into fix and jack detection feature as
  suggested by Dmitry

Signed-off-by: David Turner <david.turner@raspberrypi.com>
---
David Turner (1):
      drm/vc4: hdmi: Add jack detection to HDMI audio driver

Stefan Wahren (1):
      drm/vc4: hdmi: Call HDMI hotplug helper on disconnect

 drivers/gpu/drm/display/drm_hdmi_state_helper.c |  3 ++-
 drivers/gpu/drm/vc4/vc4_hdmi.c                  | 22 ++++++++++++++++++++--
 drivers/gpu/drm/vc4/vc4_hdmi.h                  |  7 +++++++
 3 files changed, 29 insertions(+), 3 deletions(-)
---
base-commit: eff0347e7c228335e9ff64aaf02c66957803af6a
change-id: 20250312-vc4_hotplug-3ae4e783484a

Best regards,
-- 
David Turner <david.turner@raspberrypi.com>

