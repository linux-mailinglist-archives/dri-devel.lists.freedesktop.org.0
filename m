Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC7CBD188B
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 07:56:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 516CB10E092;
	Mon, 13 Oct 2025 05:56:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MVhrXgIK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F08310E092
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 05:56:14 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-b50645ecfbbso775444466b.1
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Oct 2025 22:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760334973; x=1760939773; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JZ9/LjENMEgkqGr3qDNK6DAWAvXersuPBKAH6ygTJP0=;
 b=MVhrXgIKh3yMYGYhr8a0OrHl4rNhT8yju+hZSqyJu8kEbY/ml9JqO0PxVvE/RuEhru
 t586Ja7kWUbFA7vHR846sxFpq8Su6X8s/WGPzmwQwLJE7m9+4EjpQPgM9f/M2r4J2f1L
 avVOHmRow7Ujnr+Y6MwDlz//R4EpVakamgw5ju5w6hSPkZqhcTnP5HkIpLu/aNb0iX18
 dBDKMEV7V0lXzxhBy6Ug8w3sStuukjo2e6kk83s/MmIXyfgIFyk2DRCsU+0NrZcDSF+U
 C+p4iB6hHw5G1u+vZ7cmIpHygRxzyEhIEEgxm/EU3xWJU9ykwHzZy2ybkHAiy83Rlfkg
 IH6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760334973; x=1760939773;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JZ9/LjENMEgkqGr3qDNK6DAWAvXersuPBKAH6ygTJP0=;
 b=B0hjT5sxQisvhfHrAgildgAsrIQmaFKYAhSfWhIaK+UqIgEQKvR6AQkfsxxRx+i8Hb
 a/lUQ6BHr7N/Fob5fWUmSRNCSGF9K8m4j9u9c1WdgtrQjkC8vtgQA99ODe+LbN7aBqJX
 37+uX0OSOZ2nuEaNSaXjlAx9zYjbLc6U0JjU/7YPvdMWBgaFnagGOdpj1m0snyOvdBbc
 K+JZul3UoKu4NUOi5kbGQriyfQsTsK5QCecctteJSkr/dxqbIuOqk2015F5Bui6yNQFJ
 vLQcwzIbAiq/v6kkYQ/Ol4wljoXf3fQakDgMfkxjYgf4VZr07hSFhTpymeZJoujLn8gI
 7reA==
X-Gm-Message-State: AOJu0YxAnY/wi86rVy2sP0MHI/tPCavMkyiU/JHt8fGHMUrx6zJ6WLZ4
 fnwMMlBLS0a/S+oNmditF8QKpH6MQ/yPjA08UwftkNVLQ0OMVWXAT/1r
X-Gm-Gg: ASbGncuXrBGSYkyDIY4FxC3r935NgtkDF2cNNiJ6WSYQmXxNOZiJNJoboGX0dL8pQkn
 uIaikKT6l3+mVtkRM0wJ/FcyEmNUoyHFuoF8AM9SCKZTKVGPGxZDEkI2WQ9jANK7GsDYMwz1Vpq
 eVRsGtIgzGZxteIHk6TVqyXKKxay+ELVndkB4qOsVyDpS35+w7+W8yYQ3FWNElqyCu51PZtegFv
 cxEzlMVgCnlZ+ssXYrOhgEYbBgDlmaeh55k/oAvvrK8qvU1PgiN8tRJYPbpvb4RdytM1Y9GwpoY
 Ghd0P37SiVdVjjlRGGbvRdRjrVBk66TtQTmsv/uZz9vFiSF1Gxy1OaxlXNWziD9L7hOkqFQbgkr
 1G/w/dzL5JXlhI9vFwm7A+N5qm1FB5Utm
X-Google-Smtp-Source: AGHT+IEoPPn3y805fRrMXlesV3g+CUW+Q9IgTH2jMMITzvjih1OKeTWGE2CbYjx7Ff9blH+VqEhVUQ==
X-Received: by 2002:a17:907:db15:b0:b3d:b251:cded with SMTP id
 a640c23a62f3a-b50aa393ba1mr2306986866b.16.1760334972693; 
 Sun, 12 Oct 2025 22:56:12 -0700 (PDT)
Received: from xeon.. ([188.163.112.70]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b55d63c9a3csm860912566b.23.2025.10.12.22.56.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Oct 2025 22:56:12 -0700 (PDT)
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
Subject: [PATCH v3 0/7] Add support for panels found in various Tegra devices
Date: Mon, 13 Oct 2025 08:55:35 +0300
Message-ID: <20251013055543.43185-1-clamor95@gmail.com>
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

