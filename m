Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B890C458E5
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 10:15:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BD7210E35B;
	Mon, 10 Nov 2025 09:15:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FkPwdY+k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A82810E35B
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 09:15:25 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-586883eb9fbso2723166e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 01:15:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762766123; x=1763370923; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JZ9/LjENMEgkqGr3qDNK6DAWAvXersuPBKAH6ygTJP0=;
 b=FkPwdY+kzjbpBq1QbByD/H85oL88APQlO6hWY+UqN72qZAqGQfPtDwwKox/nMek74s
 gk9aFsKRXy9ljXV6Ye8iWGhlWNcuBIQcuMHdFHa8KzSTGkxY6ppRV6uPW3D3zJsUAid+
 tXYLB3rYJzqo4FStWZgGaHHICvKsWcZKvOmHIRcavfgVqNh++UvgvrYWhd7FQTiC1BJ7
 2oJth3OjS/nBhftCIR4PR66j6/0PuLK/O46j2iBkDqs3L/PKI40ZLIFGWJlSpxOhZ5rM
 TdYaJIapfE3mMrQn3H/vuo/EuZbzW3+HDdMi/GUmwsFs7FwSOlvwxWprF6JD4k7OR6UT
 A89w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762766123; x=1763370923;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JZ9/LjENMEgkqGr3qDNK6DAWAvXersuPBKAH6ygTJP0=;
 b=S1G+uLEosOiqMdGIPNLMegP87CqcFQW6aoBdEVfHqhevIbSE3eOEShPeP3USZSkU3A
 cdl5lf5KhdC61AMzdDIGFLcxXVDCWhxOmPJKY3kwLyAsix1lDpuoq+R8tIGRoQhHbHoI
 fI8X7/B6zliuMTJlL7r9I6ldI95LDPU2JoEQs7z7h8uMaQUqPQxO1VFHXCGnmF1OOa/3
 /RDJArP1rOBsGe6gRxClbKf/n4W1r/2vKNxus5FkuKPVdhLNDeUbK8gPXb13jSkbSEaX
 tCPn8rjDTbjw2LlSI0wkWaHWkDiyLHZyNupcRvwgq7u5O+1kIqM8zrWIowCu89hbGcIo
 SZow==
X-Gm-Message-State: AOJu0YwWrbbX+V+rXR7vxj1x7JZ5WQd9DIVsqIL2gQXPy/biH6fM78/v
 pYqTHeEL6nnE2MbOZR85Udw2CW1MBnsQsjmQQKWN9wluNGAKmC4rsLeF
X-Gm-Gg: ASbGncvudWkFYUzkuBmzNh2QO2Om+oZyYBnvloiVBg6Svnzyf7KC9eAzyaItROrC1zz
 PeDHg8gzeG78eSedIfrvnWLTaSuulO/2h8b7tyTjhwYmoo95XWYLgPsodthqoygZQddjUBzpBLZ
 0LRPhz9caMiX2I/mR+NUlZ7kTQrNnNQJH72hl/T2cs/rjLI8R3C9TeeOLiwVFQBWjCKrIFdq3t7
 HL2X9nilmtR2gTAAXQ+5q1K0mYHQywEl/aWvfd9Cf83TGBmsR904ZKZmsXDmEgl92VdWN7bxEWm
 fBiSpLh98/cXLg4w7h7B4LY5NtpEFL8jUiyU0/IC4pG2U/mWGrZelblvKbvFgfVjRS/uT1FpZhw
 9mWLX1HVWIzKLpF4/bMc+dgvoataREJWkxGywlLxSBuTBZYj8f1hxLOU5WWgLCye/+uMJ4WzbG/
 4=
X-Google-Smtp-Source: AGHT+IHKflfppJ9fE4B/jxYw4Ee0cwdoj93J+qONHoGq9+fPDTkw7v1R2iIj+5ReVkBMNZS93KUhOA==
X-Received: by 2002:a05:6512:308b:b0:591:c346:1106 with SMTP id
 2adb3069b0e04-5945f1594a0mr2128941e87.9.1762766123168; 
 Mon, 10 Nov 2025 01:15:23 -0800 (PST)
Received: from xeon ([188.163.112.74]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5944a0b76f4sm3852006e87.73.2025.11.10.01.15.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Nov 2025 01:15:22 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Douglas Anderson <dianders@chromium.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v3 0/7 RESEND] Add support for panels found in various Tegra
 devices
Date: Mon, 10 Nov 2025 11:14:30 +0200
Message-ID: <20251110091440.5251-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Add support for panels found in various Tegra30 and Tegra114 devices,
including panels in Tegra Note 7, Surface RT, Surface 2 and Ideapad
Yoga 11 T30.

---
Changes in v2:
- dropped gpu/drm: panel-edp: add AUO B116XAN02.0 panel entry (picked into drm-misc-next)
- expanded commit descriptions
- return accum_err on prepare
- switched to devm_regulator_bulk_get_const

Changes in v3:
- lg,ld070wx3.yaml > lg,ld070wx3-sl01.yaml
---

Anton Bambura (1):
  gpu/drm: panel: add Samsung LTL106HL02 MIPI DSI panel driver

Svyatoslav Ryhel (6):
  dt-bindings: display: panel: properly document LG LD070WX3 panel
  gpu/drm: panel: add support for LG LD070WX3-SL01 MIPI DSI panel
  ARM: tn7: adjust panel node
  dt-bindings: display: panel: document Samsung LTL106AL01 simple panel
  gpu/drm: panel: simple-panel: add Samsung LTL106AL01 LVDS panel
    support
  dt-bindings: display: panel: document Samsung LTL106HL02 MIPI DSI
    panel

 .../display/panel/lg,ld070wx3-sl01.yaml       |  60 ++++++
 .../display/panel/panel-simple-dsi.yaml       |   4 +-
 .../bindings/display/panel/panel-simple.yaml  |   2 +
 arch/arm/boot/dts/nvidia/tegra114-tn7.dts     |  13 +-
 drivers/gpu/drm/panel/Kconfig                 |  26 +++
 drivers/gpu/drm/panel/Makefile                |   2 +
 drivers/gpu/drm/panel/panel-lg-ld070wx3.c     | 184 ++++++++++++++++++
 .../gpu/drm/panel/panel-samsung-ltl106hl02.c  | 179 +++++++++++++++++
 drivers/gpu/drm/panel/panel-simple.c          |  65 ++++---
 9 files changed, 496 insertions(+), 39 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/lg,ld070wx3-sl01.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-lg-ld070wx3.c
 create mode 100644 drivers/gpu/drm/panel/panel-samsung-ltl106hl02.c

-- 
2.48.1

