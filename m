Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3501ACF9228
	for <lists+dri-devel@lfdr.de>; Tue, 06 Jan 2026 16:45:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D3F510E0A0;
	Tue,  6 Jan 2026 15:45:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="T/oGjAM+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44C1F10E0A0
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jan 2026 15:45:05 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-64b9dfc146fso1886180a12.0
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Jan 2026 07:45:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1767714304; x=1768319104;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UaGEaTeet5VDnDbky4KTpjLHpw6d3GXYeQzFusAWapo=;
 b=T/oGjAM+AsiQR0HmmIePT2rBy5cyfrqhaQoCxIRUws7gGKvboLP7G2H/8oPUytp8+z
 vnOuPekn5A6MKI4/QkH6HMCoHAXFNwxR32C+FQGl0sznDNCQkWjXYb3wkNkkCs8eDjGk
 MKtiE4R3TOFQSHG2pxVM8uwJa/ARgmUxRiEOs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767714304; x=1768319104;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UaGEaTeet5VDnDbky4KTpjLHpw6d3GXYeQzFusAWapo=;
 b=Wv9ZfgHkY26f2YaM8+fNyPWp91joIJipEwBbSWRR3l7sKOGKX5qClqK+r9744H4HHR
 5sCTbj3gNk2t/rRlcAvCYcaPK3RxE/d2YTI1EQfkKXpk2/6r4WlmDTYx7Ax8lH5ZADdh
 T667WpWeh8cneqRL+FVbTV7okMJ2O5Z2pM6kHeIkNfo8lY0NzINamcbz6zhsxyAI4UYa
 pg9eqjQ69WVGfbydapWNwEQGTxSgO79pKoZv4hMK5smiz7ejSzhhBR49gICEDnVNeZMf
 s51Z+iqN24mDx6zgcE7Ro18XEmwZ9gr+oYxeamkOfqXbWoqxVeLbJ4yecHqgxO0CzRMq
 QbmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTNcn4aGaoFKBpqBNfQ6KBM4ZqOpUglqe0Uz6z7nmywOzkZmyFjCruhUP5wo+EeBRQiAMrxckcctI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxYmdbm3m/8Nk6F/MwSBzzzJSL2K2Ddoihg0nLa8HXGVkzkewm6
 OYW1pq1HiSiQ/mkF9U3bG2G9312OMtlWjpX2wIbw5Mt2IEVOeFjYgI8DJyXSnabs8U0=
X-Gm-Gg: AY/fxX62RtYPQeAv/nzPWPje9evezhcr82qczLK63txL6QaqqzjiFXBpiAiOw6ko5a3
 hEa7IIkGii/seW7PecL5tS3hjE8gTpNOlf0D6mci7IGZnLomnzGhrPE0CQfv9Mrw1DCUE4xIssz
 bZV8YDdQPz/J6AbriGM2PfWoXDH7MWepSRBq5tU+w+VKhI31iUDFY6ED4jvv5PK1ADnJlTHdZX+
 URpVRvHfra7yWYSM0ekrmOuJCCDUE//nC7dJMVBLXawIZkMFWNSS4tVcVEdjT7/7xyVyeMKxVx2
 VWFCqSWKmxFhVRWF2CmUMB5u+QvKvdy8CCiQbofpzvqEVyt+CHq84TJzdKhQeGDyTddo6h3V7G2
 3+QnlTq0Buiyu6ejSxAhT21elN7FJ25eFyL76TdxFU8XQLBIzoZ16K3oJmfdGidJACnf7tu8B/T
 T9E5iiA9SHjS4oeiFGR/T25MDsF1NxGo5l8W9+Vey09CKpGWQhfGdelHtlPVywAAsDv9pcS1N+D
 F3Kc/NMV0gN03nrZZgbAvy+vgyb8TwV63XZKtZSMF5NYonGV3+wAwc8+tAl7ced0uDoxHdXM2Qh
 /YXMmM7Fgj8=
X-Google-Smtp-Source: AGHT+IEhJj76/ixR7gbOhq5xfUe3t/bDrv2uRRYPD/P4N5pDYTo/+VYMZwWAdEUPIQ/gXZSeiPURWA==
X-Received: by 2002:a05:6402:294:b0:644:fc07:2d08 with SMTP id
 4fb4d7f45d1cf-6507bc3d3c6mr2408057a12.2.1767714303654; 
 Tue, 06 Jan 2026 07:45:03 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-95-248-31-95.retail.telecomitalia.it. [95.248.31.95])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6507be64efasm2349767a12.21.2026.01.06.07.45.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jan 2026 07:45:03 -0800 (PST)
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
Subject: [PATCH 0/3] drm/panel: ilitek-ili9806e: add Rocktech
 RK050HR345-CT106A support
Date: Tue,  6 Jan 2026 16:43:13 +0100
Message-ID: <20260106154446.2735701-1-dario.binacchi@amarulasolutions.com>
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
 1. A refactoring of the existing driver and Kconfig to support
    multiple buses.
 2. DT binding documentation for the Rocktech RK050HR345-CT106A.
 3. The implementation of the SPI-based driver for the Rocktech panel.


Dario Binacchi (3):
  drm/panel: ilitek-ili9806e: prepare for multiple bus support
  dt-bindings: ili9806e: add Rocktech RK050HR345-CT106A display
  drm/panel: ilitek-ili9806e: add Rocktech RK050HR345-CT106A SPI panel

 .../display/panel/ilitek,ili9806e.yaml        |  43 ++-
 MAINTAINERS                                   |   4 +-
 drivers/gpu/drm/panel/Kconfig                 |  23 +-
 drivers/gpu/drm/panel/Makefile                |   3 +-
 ...ili9806e.c => panel-ilitek-ili9806e-dsi.c} |   2 +-
 .../gpu/drm/panel/panel-ilitek-ili9806e-spi.c | 327 ++++++++++++++++++
 6 files changed, 394 insertions(+), 8 deletions(-)
 rename drivers/gpu/drm/panel/{panel-ilitek-ili9806e.c => panel-ilitek-ili9806e-dsi.c} (99%)
 create mode 100644 drivers/gpu/drm/panel/panel-ilitek-ili9806e-spi.c

-- 
2.43.0

base-commit: 7f98ab9da046865d57c102fd3ca9669a29845f67
branch: rk050hr345-ct106a
