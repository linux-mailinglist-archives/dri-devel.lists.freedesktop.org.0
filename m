Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB11FBC3D2B
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 10:28:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 139E310E17A;
	Wed,  8 Oct 2025 08:28:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NB/PiGdK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4577210E17A
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Oct 2025 08:28:39 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-375ff2b3ba4so15303531fa.0
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Oct 2025 01:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759912117; x=1760516917; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WDL2+5qpXYINNhwEmiyG4VFEg02NXEqwf5yd4xv3H20=;
 b=NB/PiGdKBm3QWZKAMovxS18A3+LmgJXiaUWFWN6u2XsUWDEs+J9duBr76ndBULahTD
 08sgGLgwZHiZMjWKmB1CevcOEHGg5xYx7PSUqPRvpzZHjkr61S4VKJ7JKAj17WLuLYyU
 zLw8sMUvKuxh5g+W5iu04zhwOHumRyEeiI6ozF5uFizpUOUTjtFj8yPPrOzOh+W780Co
 szblzXrK4t33qH88QmZ72tW6haw3VZS6kBz9yg+EGlJvBm9v6zyF8pDpfIL751GChuOv
 gs6r6lOpKDL8EmxpJZ4kUvkf7UNRloLZT7JLzmayvIBHNqsAqPrmGOgB4gDgCsbYCImK
 aG6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759912117; x=1760516917;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WDL2+5qpXYINNhwEmiyG4VFEg02NXEqwf5yd4xv3H20=;
 b=XJwdsQCG1nIHHFtEpUXnbMz8oKpZpRaCRpA2nU3yAQSknimXv0hFxCTsN0VQBT6qEF
 CPYEoLTO64zWfD1Ztl+KKc8uUFs2pP6keePMLWGTeyWT6XiV53bbIpWYRL8uUi8MT639
 I/JGKSGLJ5DO/Pz4bGqAKw+O9Juo+h/jaDgma5dA/IvgYyugc4VZ/qsTUMMB+6loPnOU
 +XwqEFBc+YG1mAvsqfoDlosmGVfpw5DgETIcz0DbeFVB7CRqcxOtbhIjFWQwFtTCHU5B
 GkAEr2TK7MHeYBppp7FHGydE9wUGJjdGwhKdcFxdSYwA5vWcNcpX4VjR5zHdo/MqwVIa
 lrAg==
X-Gm-Message-State: AOJu0Yx204b1wyGoQKSsYmiYBEU07NlkiWUeO8/6Ful6tMgfVQMzqrrX
 BA6WyAApJxm1VfJ63GJnmO1qjG9XL4W3NtERRhAsdPiR6INe+OZLt6Ddx5pTIw==
X-Gm-Gg: ASbGncvL20u09uW1RPhbtqWDvJr4ZU6J1lhdodnWhJ3sD4FU2ea8hKceTVRNWtt6VcZ
 ZShovcV+cN4GURXAO8lKDNwaByECjg6ETkxfll2MLituQWgJ9/cbvZtsiaCtRoozaHNPhHZu2Na
 YeGwlYYzYROVoyxXnQ+9wV5aQynm57r/pOEMZnzBCOPn3DD/lK500o/yksGHpdb/7pN5TO9jQFx
 EIRLJBlYUx5+pRln8Jg0wNjS1A5M1nLtHOjNVmlSkAigPYynnMDe0EfDWqnkF60BqFXwGeAghSt
 f+d4e5RHAEH0IzDynBtdGiZhcddvEtRXABF4/guJuRLTvuVZJUyA6ROLhc3kL1mYJnQGfmQAgAC
 +d7JQDDFb72+kjYaTqQ7CHNHfko3tVVnAnv3Exg==
X-Google-Smtp-Source: AGHT+IFQxyHSbODYuzrHx4CLDnLSfhATzRQS4eJZQ4bwmDnpLeGrbfUB1YUBpZ6Ww46Qx9cA5lS5uQ==
X-Received: by 2002:a05:651c:2210:b0:35f:246:a751 with SMTP id
 38308e7fff4ca-37609cf7d65mr6119911fa.5.1759912117289; 
 Wed, 08 Oct 2025 01:28:37 -0700 (PDT)
Received: from xeon.. ([188.163.112.70]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-58b01124649sm6968733e87.15.2025.10.08.01.28.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Oct 2025 01:28:36 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
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
Subject: [PATCH v2 0/7] Add support for panels found in various Tegra devices
Date: Wed,  8 Oct 2025 11:27:52 +0300
Message-ID: <20251008082800.67718-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
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

 .../bindings/display/panel/lg,ld070wx3.yaml   |  60 ++++++
 .../display/panel/panel-simple-dsi.yaml       |   4 +-
 .../bindings/display/panel/panel-simple.yaml  |   2 +
 arch/arm/boot/dts/nvidia/tegra114-tn7.dts     |  13 +-
 drivers/gpu/drm/panel/Kconfig                 |  26 +++
 drivers/gpu/drm/panel/Makefile                |   2 +
 drivers/gpu/drm/panel/panel-lg-ld070wx3.c     | 184 ++++++++++++++++++
 .../gpu/drm/panel/panel-samsung-ltl106hl02.c  | 179 +++++++++++++++++
 drivers/gpu/drm/panel/panel-simple.c          |  65 ++++---
 9 files changed, 496 insertions(+), 39 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/lg,ld070wx3.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-lg-ld070wx3.c
 create mode 100644 drivers/gpu/drm/panel/panel-samsung-ltl106hl02.c

-- 
2.48.1

