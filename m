Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8A2D2021E
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 17:16:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59B5B10E585;
	Wed, 14 Jan 2026 16:16:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="AQHQEDGZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7746E10E585
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 16:16:42 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-b872cf905d3so637466b.2
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 08:16:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1768407401; x=1769012201;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tWjzrPidhfyZlS+0i9HgQ4Dnodyf3ucVLrFNdxloGQU=;
 b=AQHQEDGZP9XjdIwLuTGTF12iZ+i1sh/YV6N4gveTrUyBn395HNfdK6mz61Oo7AUjLV
 YRypLK4A9pci0Yx7XTsvKXb0WKJOeMLb6vuxEr820PcUCXavgzkGPHcjOFiVCmy3JlVT
 hl67BpVD1a9YWci0oCYfyvpa67mxg13Owlp/w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768407401; x=1769012201;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tWjzrPidhfyZlS+0i9HgQ4Dnodyf3ucVLrFNdxloGQU=;
 b=t7bn0yZ/M2rlWj1rjUzz/kCIx22qFJ8KJAK/6C93WcIDoculB6nXaCZKPJZgCWcpPI
 EbQ4b9yHKFDOq7ePR6wLPYru9tKoIkEJUCBQgheJslCbsH56B2uM0xmVcsBjJn8wE6OG
 FFOwMoDLi2csORACBF5o/Sh3xweHRxjsJHZdrLNeihEMASHvHNeciVfPyIdzyy+HjLNc
 nEZT4Put0oXMx3lW8UccBfOSXTQnEnqqjBeQGO8qcGzuQe8CN6oHA7IgnnPTcM6K2G1z
 aMU5ajjF5Sg8gwZi/28v96c1o57Wg1qIVeyi/y7YvK/E2eoIH+aTJ9uS15kZ190OgBgH
 /E2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXAjqfCsZ1JzhdY2NpS95kpEHeDMjrPR5dap2k4mH4su1J8u1Buwb6kz9Th6LkhbUAMSUzaANgGo5I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzaNLtYcZ8IC2IlfBlZSqe9nwUe25d56nVLlDm1+DZLLqIpwhOm
 7UEjSiWHwTdgNSA39143d+08yo2jTGFoUp1FdzvmslAJgYNrtTHm/OHUi/D+J/vbTy8=
X-Gm-Gg: AY/fxX6jESGframq8aH3ZbL7xcrWkdrqBE1ezRHQhMgq8SkYQHqDzMzazTUaV6mAt3b
 EvTWnfgIrvZo1RUhP+KryzEVoo53a6ie1ku8fUvBf+Em8VnMJlY4pTOiGCce/0tQkF3F7C/st7D
 yK46PwWXA9G6palEsId+CRJxRwaPPyCURZAo8iKjr5aBMwcIK1avtsZjOaMWdJwgv+VH1ewSLoa
 J99yE24jXi08hzmqEbk5RKjtsxNDQcC8rhGTMVEppNB5E0ekbG8R9EOYUsTXH03jA/cV0W/sYAu
 bP6u+NGNm8xbwReQGo5TTY5WszQOil4MdcZGRBdzJoS8D/28od2z7OOfQVpiGVXRwCst9V7t0aI
 JeUj/S6j9vtOXgcU//3NSrYZBQQg1FMe4rHkh6Mml0PsQGLDsFX4C66tCoAFh3jWpsGsErQSQg0
 A/R+QU8Gw64hGy/B+FpedN+EMOeAONmaR6SmGk5IErmYr6rMTuOcp2Hv2HMaPSNrBajM6SBLU4f
 bixkVG+Irz9U0o7CYJ9eYREdul0pGdreW/uvihd+QkbsNGuvs2/7wefjSsb/cIQDMW+tQ==
X-Received: by 2002:a17:907:d23:b0:b87:e58:e37d with SMTP id
 a640c23a62f3a-b8761283a13mr272159166b.48.1768407400930; 
 Wed, 14 Jan 2026 08:16:40 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com
 (93-47-52-235.ip111.fastwebnet.it. [93.47.52.235])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b876dd0e9ffsm152281566b.37.2026.01.14.08.16.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jan 2026 08:16:40 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Michael Walle <mwalle@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/4] drm/panel: ilitek-ili9806e: add Rocktech
 RK050HR345-CT106A support
Date: Wed, 14 Jan 2026 17:16:15 +0100
Message-ID: <20260114161636.1076706-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
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

This series extends the Ilitek ILI9806E panel driver to support the
Rocktech RK050HR345-CT106A model via SPI.

To achieve this, the current driver (previously restricted to DSI) is
refactored to support both DSI and SPI variants independently.

The series includes:
 - A refactoring of the existing driver and Kconfig to support
   multiple buses.
 - DT binding documentation for the Rocktech RK050HR345-CT106A.
 - The implementation of the SPI-based driver for the Rocktech panel.

Changes in v2:
- Introduce DRM_PANEL_ILITEK_ILI9806E_CORE hidden kconfig option.
- Split core and DSI logic.
- Restore vdd-supply as required for both DSI and SPI types in the
  dt-bindings.
- Dop useless settings in case of rocktech,rk050hr345-ct106a in the
  dt-bindings.

Dario Binacchi (4):
  drm/panel: ilitek-ili9806e: rename to specific DSI driver
  drm/panel: ilitek-ili9806e: split core and DSI logic
  dt-bindings: ili9806e: add Rocktech RK050HR345-CT106A display
  drm/panel: ilitek-ili9806e: add Rocktech RK050HR345-CT106A SPI panel

 .../display/panel/ilitek,ili9806e.yaml        |  38 ++-
 MAINTAINERS                                   |   3 +-
 drivers/gpu/drm/panel/Kconfig                 |  24 +-
 drivers/gpu/drm/panel/Makefile                |   4 +-
 .../drm/panel/panel-ilitek-ili9806e-core.c    | 134 ++++++++
 .../drm/panel/panel-ilitek-ili9806e-core.h    |  15 +
 ...ili9806e.c => panel-ilitek-ili9806e-dsi.c} | 153 +++------
 .../gpu/drm/panel/panel-ilitek-ili9806e-spi.c | 323 ++++++++++++++++++
 8 files changed, 576 insertions(+), 118 deletions(-)
 create mode 100644 drivers/gpu/drm/panel/panel-ilitek-ili9806e-core.c
 create mode 100644 drivers/gpu/drm/panel/panel-ilitek-ili9806e-core.h
 rename drivers/gpu/drm/panel/{panel-ilitek-ili9806e.c => panel-ilitek-ili9806e-dsi.c} (82%)
 create mode 100644 drivers/gpu/drm/panel/panel-ilitek-ili9806e-spi.c

-- 
2.43.0

base-commit: c537e12daeecaecdcd322c56a5f70659d2de7bde
branch: rk050hr345-ct106a
