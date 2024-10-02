Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1B998CB8F
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2024 05:38:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE3FC10E33F;
	Wed,  2 Oct 2024 03:38:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="j8bkWcaL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
 [209.85.160.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10BB810E0E5
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Oct 2024 03:38:31 +0000 (UTC)
Received: by mail-qt1-f181.google.com with SMTP id
 d75a77b69052e-4585e25f42bso61871611cf.2
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Oct 2024 20:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727840310; x=1728445110; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=iUOKiBUXnpsFTZ5jMqyjR0K9mCXZ+ssrPBDzZNi8o+w=;
 b=j8bkWcaLpZPf0eO6OWETgn3a4dGUjEPpEnnhx0mhZqOOQ3WD9ZN8MaeNly8AYndEBr
 xqcZ3ufBzqNeTOb1gwAjYpbISRXJLIWpv2xPguzc74dkQoR+UhuukMPktRV9frl3xkhi
 /r8NG1pdK4h3tt7wAn77iZmJlDW+eds3LqnEu931ZRoQ7+HF4KhP811mzUTpoIIhuTfx
 NUVExD/wCdOEAieibJzJ1kvuwIo68I4eGzWAbMIAyZAlMXuU5XtpjssVlU7sgkFPrLS6
 vw8/cYDLjmcPyEGywLjoCfgnxvTpYk4nRhaXEXYJzgx6rNANS1cotug6SgHOUhGLpg0w
 zKxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727840310; x=1728445110;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iUOKiBUXnpsFTZ5jMqyjR0K9mCXZ+ssrPBDzZNi8o+w=;
 b=NRjp4UcljRY9hfIAKpURJUO1d1bhYU2YrdLkZSAShJo7ULzsYV9PCCPQQAoVM1Qzf5
 Gy0+uEF5bpa5wtEN9wGRSef4dVfG4HeQ0tl5Q1zRiPE+cSpTAgxO19oN1TJwOtjJ8V5M
 F66vsMCs+VSk++pNr0PkXmvaku/A4BLVsWDHHitMlITJA+ucuUBgo0iGaHqxQ2v+X3af
 NrtXAg1u784PcCGaxEejSnfZwkG8my6Zm1NXzRtegVHm57FLXBH9Qp2pu4/jeGkQCn8U
 WLNedkDdex5x7rD9bHaY15LSCInroTQR1lGaaYUeE3VeXaxtr9GtLPCsLYrLyHtWRD3G
 mpNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUlIw675VwUIg7Hf+XWoISpmzt7ydAviRt3QBHoyYedUYpTvT6gnsHG7SwmxoEb9h5dDwrw3PlsAUU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwTUu1ExJziD6lBwxO1JrLWfjQHoVVG2D2PAjKqVCC4xdDGcGhS
 Xc55rCMn0PsqbGY99sHzWVCKaLI0AHhhonnaQv6eWt503ySoY/u7
X-Google-Smtp-Source: AGHT+IFB3Rfsz3+Lfr4kTvzv/Vj1epWm/jyj0EIrItSKQRLruClkbfn6m+DM4X6WPN4Ew4cmQ35Y1A==
X-Received: by 2002:a05:6214:41a0:b0:6cb:3a7b:96b9 with SMTP id
 6a1803df08f44-6cb81a05676mr22602866d6.15.1727840309742; 
 Tue, 01 Oct 2024 20:38:29 -0700 (PDT)
Received: from localhost.localdomain (ool-1826d901.dyn.optonline.net.
 [24.38.217.1]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6cb3b62d9e6sm55640446d6.69.2024.10.01.20.38.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Oct 2024 20:38:28 -0700 (PDT)
From: Alex Lanzano <lanzano.alex@gmail.com>
To: u.kleine-koenig@baylibre.com, Alex Lanzano <lanzano.alex@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Mehdi Djait <mehdi.djait@bootlin.com>
Cc: skhan@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org
Subject: [PATCH v8 0/2] Add driver for Sharp Memory LCD
Date: Tue,  1 Oct 2024 23:37:35 -0400
Message-ID: <20241002033807.682177-1-lanzano.alex@gmail.com>
X-Mailer: git-send-email 2.46.2
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

This patch series add support for the monochrome Sharp Memory LCD
panels. This series is based off of the work done by Mehdi Djait.

References:
https://lore.kernel.org/dri-devel/71a9dbf4609dbba46026a31f60261830163a0b99.1701267411.git.mehdi.djait@bootlin.com/
https://www.sharpsde.com/fileadmin/products/Displays/2016_SDE_App_Note_for_Memory_LCD_programming_V1.3.pdf

Co-developed-by: Mehdi Djait <mehdi.djait@bootlin.com>
Signed-off-by: Mehdi Djait <mehdi.djait@bootlin.com>
Signed-off-by: Alex Lanzano <lanzano.alex@gmail.com>
---
Changes in v8:
- Addressed review comments from Uwe
    - Replace pwm_get_state with pwm_init_state
    - Use pwm_set_relative_duty_cycle instead of manually setting period and duty cycle

Changes in v7:
- Add Reviewed-by tag back to dt-binding patch

Changes in v6:
- Rebase off latest drm-misc-next
- Replace pwm_apply_state with pwm_apply_might_sleep

Changes in v5:
- Address minor style issues in sharp-memory.c

Changes in v4:
- Remove redundant dev_err

Changes in v3:
- Fix file path in MAINTAINERS file
- Address review comments
- Simplify mode selection based on match data instead of model

Changes in v2:
- Credited Mehdi Djait in commit messages
- Renamed sharp,sharp-memory.yaml to sharp,ls010b7dh04.yaml
- Using strings instead of int for vcom-mode in dt-binding
- Fixed indentation of binding example
- Removed binding header
- Removed extra whitespace in sharp-memory.c
- Fixed error handling in sharp-memory.c
- Added match data to of_device_id table to be in-sync with spi_device_id table
- Replaced redundant function with spi_get_device_match_data
- Sorted header files in sharp-memory.c
---

Alex Lanzano (2):
  dt-bindings: display: Add Sharp Memory LCD bindings
  drm/tiny: Add driver for Sharp Memory LCD

 .../bindings/display/sharp,ls010b7dh04.yaml   |  92 +++
 MAINTAINERS                                   |   6 +
 drivers/gpu/drm/tiny/Kconfig                  |  20 +
 drivers/gpu/drm/tiny/Makefile                 |   1 +
 drivers/gpu/drm/tiny/sharp-memory.c           | 681 ++++++++++++++++++
 5 files changed, 800 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/sharp,ls010b7dh04.yaml
 create mode 100644 drivers/gpu/drm/tiny/sharp-memory.c

-- 
2.46.2

