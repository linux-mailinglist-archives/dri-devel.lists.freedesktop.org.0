Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85C46992298
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2024 03:30:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C8DB10E03B;
	Mon,  7 Oct 2024 01:30:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QGcMi7a/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com
 [209.85.222.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 397F810E03B
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2024 01:30:45 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id
 af79cd13be357-7ae6f89502bso310818985a.3
 for <dri-devel@lists.freedesktop.org>; Sun, 06 Oct 2024 18:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728264644; x=1728869444; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=M4BL7q8zanMLPZgq1AZ71CIoIOsuiwDVh+BCfFx3B8I=;
 b=QGcMi7a/IfFM0teW7HcEPhwmvBYXP5Ss2APuRJq923vSshnLvZQmX/VM13bfiJAwtD
 lbo7dzYM2wCLJ1gmPKjBhyYrYtJrqHIYKhWgPwWFaNWiupY9MzPl4xE88+lslZLUOFx+
 1TtIe2RaOFV7m+fyHBHV6lvl4KTjUmTfhPp593av3nON9FloEihDW2TGD1JlUI12ozv9
 ibdOK6j5EcBspSzEfVuzBJIoqJXRX9LrOnlAZ4bGISL7ClSdMzSiXql8ldqIQIvSIfRd
 dBreQNXFk+UG0G//4u6OEhAPspMl8E/jEgGJ9vDS26w2+sLI4/+B+vz07t+1tk6IJKiU
 FtSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728264644; x=1728869444;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=M4BL7q8zanMLPZgq1AZ71CIoIOsuiwDVh+BCfFx3B8I=;
 b=BG+7lDGAnXhV4t9TH69d0iPuPExlfyR/O+CdjDzxjSDFj7MXTtkzMdCIGSV+BulZJ5
 hlpIdCQTfdqsmWa0idz8XHX5viOwU9Z8oXVD/8cY7vJwsz1zFGZ0gH8pVHbkQ9jBevsK
 ludL+e6J/jPN2ZrbaJ/Gd1eMNip6agw8fvvUti94ctcmXYnaJOOZk6rLlna5nSqgUwQx
 yGonCPVdSus7N2SbdGuQaxJuVsQw4YUXcl/iC0IIolWg3GpqbdQl5DLpfcgs7NPtyhKv
 2ZBrsVHKu3t4vM1pLPENZV+MSXvvkawnIyQcuJKBJLaEdA356NflUxCBtqigsVEbd3h6
 cIeQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXDjn0Fo6CAlBvKqjhpnzhAj29XxBgYLgiUs3W5NYVe70Ja75X/sAUPX+f1baS7aspkiMfOxzDWxQE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzro6Xa0mFesOqdTljfJgNDUF+z0VTYsbSeF/83x2+swP++pEHc
 OXl/ffxKOCBJKAHuBnmq5XKgBHY8QFp5JeaIF9RpnC0oUG/OwX6r
X-Google-Smtp-Source: AGHT+IEUwTDUTwHQPPMnXkL2oBBF20EQpAtzbYg+OHDr2onQw1DYJTSZ7x3HJKuUZql/yUpw2OUU6A==
X-Received: by 2002:a05:620a:31a5:b0:7a9:c610:99fd with SMTP id
 af79cd13be357-7ae6f4a696cmr1503155585a.56.1728264644003; 
 Sun, 06 Oct 2024 18:30:44 -0700 (PDT)
Received: from localhost.localdomain (ool-1826d901.dyn.optonline.net.
 [24.38.217.1]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7ae757627fdsm207326985a.100.2024.10.06.18.30.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Oct 2024 18:30:43 -0700 (PDT)
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
Subject: [PATCH v9 0/2] Add driver for Sharp Memory LCD
Date: Sun,  6 Oct 2024 21:30:04 -0400
Message-ID: <20241007013036.3104877-1-lanzano.alex@gmail.com>
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
Changes in v9:
- Move pwm and software VCOM generation to probe/remove functions instead of crtc enable/disable functions.
  pwd_disable will suffice on driver removal.
- Change comment format to match Linux Kernel style.

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
 drivers/gpu/drm/tiny/sharp-memory.c           | 666 ++++++++++++++++++
 5 files changed, 785 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/sharp,ls010b7dh04.yaml
 create mode 100644 drivers/gpu/drm/tiny/sharp-memory.c

-- 
2.46.2

