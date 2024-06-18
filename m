Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07DA090C4C7
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 10:15:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A50010E5C4;
	Tue, 18 Jun 2024 08:15:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JAGeX5Ob";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8E3E10E5C4
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 08:15:46 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-1f862f7c7edso33271645ad.3
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 01:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718698546; x=1719303346; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UUmVLEnpoTJ592gaH7I2FytN3HjeWdDhuLXYQB8jM6w=;
 b=JAGeX5ObB5alVNZ3D69Dh3lAdfSslHUrunSY6dvVm7I+aS6FRvXhLJEoj6gKvbfCaJ
 pZqxEQEPMfXgItsCBSlwqjdGI/DBDjkJJkE6GXVn0R5exA+jlY79/m1De1WhAQy8Z9Ok
 3/Kj588k+7ozewbtka9hHZqqlbiCiSxrA32RTWj2aqJoPticXVALWIc+UcR35R9HhKZo
 hsbGONRHtDc3btsObBwTWVb2lTsxj/yDqXpSe+qwVwnDvFnmX8Acq2bmeolxpl8NhbNl
 m2zHUh+KEjawtnWDKjVAMGcXk2/WVhmZ1AnG0s4AxX0eG9yN70QHbKbH44AoN4BTDXd2
 hhHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718698546; x=1719303346;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UUmVLEnpoTJ592gaH7I2FytN3HjeWdDhuLXYQB8jM6w=;
 b=KAFlJiZbeaRYtnyWQrEmobQK9+Mj84IyJJqDvJyEezcjIJVLNybVtuTBfcvbkOtv1S
 Bic37aTIhjOWj15MCcV5iVfmQNaIFXTjfrRvGYlMJcFNDbulwBRhcuOfMcgd6yrp9TkE
 HG65fcHE3/vd6VRUDkFsgbtcHfFcK9i11gsR2qo/FdTtJzMro+Of9IcBTpJlkD6Tt7Rf
 vsx4+h2tR6QdzfpOVtScqCXN2H9W6VS8TgxpbWfOL2F5pZJUSpNPbHsuSsWR1/Yy0SQl
 9fWR2SgOLyG/GXIXx4Cz/9rn7/8Yk0mhHexXjgyMFAkbJl4xpgpyY5WTPEV7dV2TvPRa
 tR1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZufDpBylvwDMawqB0qLxRb69+tfUZmrs2U4WXlhkz0xUw5xGPpKUl008E6LhLK5KMWzdIu6ohsj+e16PhDH8lhlBQ5czauFtvn9S1o1fO
X-Gm-Message-State: AOJu0YyD8kek85SQ+wiQ8UugBQD2CpmOBKwWlu+aQyIrmjpeQ86xoDk4
 R2R+DpHAT4WNq94fxnvPYludzG8+xtprhgwIGv6afMKQq4kCsg4L
X-Google-Smtp-Source: AGHT+IHU5BFzsTam1WGUVnBcn0r/eEWH4R0hCk6n1ZhlJxSfFD4FOM/OQyWU7LH2CuWdWgIaHT5xfQ==
X-Received: by 2002:a17:902:cec1:b0:1f6:8235:dba7 with SMTP id
 d9443c01a7336-1f862a0cdedmr127524065ad.69.1718698545805; 
 Tue, 18 Jun 2024 01:15:45 -0700 (PDT)
Received: from noel.flets-west.jp ([2405:6586:4480:a10:167:9818:d778:5c14])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f855f1a1ebsm91883575ad.238.2024.06.18.01.15.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jun 2024 01:15:45 -0700 (PDT)
From: Hironori KIKUCHI <kikuchan98@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Hironori KIKUCHI <kikuchan98@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: [PATCH v1 0/3] drm/panel: st7701: Add Anbernic RG28XX panel support
Date: Tue, 18 Jun 2024 17:15:11 +0900
Message-ID: <20240618081515.1215552-1-kikuchan98@gmail.com>
X-Mailer: git-send-email 2.45.2
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

Add support for the Anbernic RG28XX display panel, as used in the RG28XX
handheld gaming device from Anbernic.

The panel is connected via an RGB parallel interface for image transmission
and an SPI interface for configuration.

Since the current panel driver for the ST7701 variants only supports MIPI
DSI as an interface for configuration, add support for SPI as well.

Hironori KIKUCHI (3):
  dt-bindings: display: st7701: Add Anbernic RG28XX panel
  drm/panel: st7701: Add support for SPI for configuration
  drm/panel: st7701: Add Anbernic RG28XX panel support

 .../display/panel/sitronix,st7701.yaml        |  36 +-
 drivers/gpu/drm/panel/Kconfig                 |   2 +
 drivers/gpu/drm/panel/panel-sitronix-st7701.c | 362 ++++++++++++++++--
 3 files changed, 357 insertions(+), 43 deletions(-)

-- 
2.45.2

