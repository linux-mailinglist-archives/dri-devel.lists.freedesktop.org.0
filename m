Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A89A296D90D
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2024 14:45:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47A9310E88F;
	Thu,  5 Sep 2024 12:45:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TZVpXyKG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com
 [209.85.219.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CD8310E88F
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2024 12:45:11 +0000 (UTC)
Received: by mail-qv1-f41.google.com with SMTP id
 6a1803df08f44-6c351809a80so3589766d6.1
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Sep 2024 05:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725540310; x=1726145110; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UNifTobjkTTnvVcDkJgjw0tLma/dAblGN8/he/0rCkU=;
 b=TZVpXyKGuuvY/mbGEwN1hct1T6N57L+qm1Duklwp1FnWDqtjEuCV0GZI1rVqfY/Qn+
 uuA5+Ifj7dA1GER0VMl/k8UPIp7NSuy4cb3c8QMK+QDgD8eJouqvA/PoM86n2R+6hzjq
 R5lWI0W/QGm/XDtcWrEnqqLiIoTSKc1nUOIyTNQfOyiYdGAKscfGpBTpF4fY9ucgz3P+
 HDCZs51OWpMdn5KiZ8J/ru7+vmhZl8kJDDjE/uvDFpV0cLo4+wk0cLRct9ZX0QN7KzFk
 ZeARIU9T17vLogImdGkpKXQT0O5T3jBa4Ml3w6qBmAV+G9SvGHCKSQEnEH9pC4Oxk13t
 RuYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725540310; x=1726145110;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UNifTobjkTTnvVcDkJgjw0tLma/dAblGN8/he/0rCkU=;
 b=rVNMlkDSUpKgUhqoHunTG1nT2fQUDBHc+Qth9YkTYkcq8NM3lTOtnWgxuzHmqldFUP
 4dnm424KL6my3iCVrqnYRuM12Uzr5DVZyh24xxVRr0q55R28PaFPczfw3YWHuys/GQDA
 f7v50NCbBvFay0h+s9FdGyU9/2b84iY2f7ywbrhXQtxQNMRjGTGf+9roSV+S652rTgNS
 M6meHCkBaHE2soaf2IewII9CPhwMtg5OILAy4GR2hmu5JdcDGmmBTyPnT+484TI2awov
 uHas9Pg9BhXtacdgedw6wbGr45bXp2VHWsa4Ul3CY0+e4qxL4KD64hrQv5XkC2tByMuD
 nEwg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXgORhqzoUCZf4iECjAZCAoq3/Zu0k5hG3cqDJ4lvmm8uDR/O5Zygh/J7nSb7Y1KD3VxC+Kxnixebs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwUPZNXyObUq8Gu5toidSZwYzDLMTupNBQ7oTp7p8eE2RK55NMF
 IxJLEAo6BTvoKHSs4axr/X95KbWaJiV5/Wjr7qi3G6GV5D3j2RjX
X-Google-Smtp-Source: AGHT+IG7p0WnjbRxn0Qrk5yGfK//kB9E2+iJMfmbxwBj0xq25RtCAzhdKzlyComxlKzYmhWaK1nu0A==
X-Received: by 2002:a05:6214:3110:b0:6c5:13f0:2408 with SMTP id
 6a1803df08f44-6c513f02bf9mr78599026d6.14.1725540310219; 
 Thu, 05 Sep 2024 05:45:10 -0700 (PDT)
Received: from localhost.localdomain (140.sub-174-193-1.myvzw.com.
 [174.193.1.140]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6c52041a00csm7161116d6.114.2024.09.05.05.45.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2024 05:45:09 -0700 (PDT)
From: Alex Lanzano <lanzano.alex@gmail.com>
To: Alex Lanzano <lanzano.alex@gmail.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Mehdi Djait <mehdi.djait@bootlin.com>
Cc: christophe.jaillet@wanadoo.fr, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pwm@vger.kernel.org
Subject: [PATCH v6 0/2] Add driver for Sharp Memory LCD
Date: Thu,  5 Sep 2024 08:43:58 -0400
Message-ID: <20240905124432.834831-1-lanzano.alex@gmail.com>
X-Mailer: git-send-email 2.46.0
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
 drivers/gpu/drm/tiny/sharp-memory.c           | 682 ++++++++++++++++++
 5 files changed, 801 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/sharp,ls010b7dh04.yaml
 create mode 100644 drivers/gpu/drm/tiny/sharp-memory.c

-- 
2.46.0

