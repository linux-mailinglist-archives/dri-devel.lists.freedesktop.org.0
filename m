Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ACCE99FC08
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2024 01:06:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6A6010E05A;
	Tue, 15 Oct 2024 23:06:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TMWwgtnx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B5C310E05A
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2024 23:06:32 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id
 d75a77b69052e-460634ac984so25759421cf.3
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2024 16:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729033592; x=1729638392; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BfFZUPp0XV4kx5ltz6qNvKwXCzwJIgOrmeDZF/8jtLo=;
 b=TMWwgtnxfKZblWZ+30le/5rsmBD9dP+4tLFDQqUZtc6MLKXb2VngtOPf2SqA4oygFF
 AU8uWaBzN9MGY7VGtQLncexu+PG2BiFibkyI5qVsBeaFRrHQbt7CTPCYDSD5otDy34Sc
 bIu3u62vPIU91F8XiGgj31/VEZxxiB96s4a1+Z7C7lDiK70is8cwhpQpZ815ZCjJc+s/
 Va7hLqhKV3gEugRHpguIgOwMdYNZbP5p0KZBmUWrcmkPXzKJW9yl30twFdXjmk4cyA8q
 u/vrGg0GzCrXniwCjA6vWZNjv59ksASkOPi8VQg9KLwTl+jTHyGIKewbN4a23UWOVcxo
 iBLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729033592; x=1729638392;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BfFZUPp0XV4kx5ltz6qNvKwXCzwJIgOrmeDZF/8jtLo=;
 b=n9WoYJQ85XOpKT1EOZXcko5LzttXK2aIkGuERwxNnKtIlzyHSH8FEB8U/0U4KrWern
 llDB2+B1r3sSMFT+8hAMDljRlaR/mZNXGXShfWfjf+dpqS8DnncrKfsCoOoQ9vb5MZ6Y
 OVlpijn2Dk0ixEy/exeW/Es8hmSkYqTobIB90GrGDK0A/hbrLm0IjK43PBclMzYZCmcc
 ix8RjTSBnABl3nNyLtTNtnAThnV08kakOnwJrP4J2LwO8VxQ3qa/Qcmw5+7i+Clba1S0
 1AuPkwID7ganPM+MG1AlVMblooZ66KZ6F2EINdYdOcTQWrVbZGiqw8Qzg7wZpdFOiLqH
 pT1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2rt5TSUyth2op1So+AbfBXdvkOPCX5CeZ8w2xb2pcLnQXjxZliRBOe/rT8jWKcNR/0YjDQcC5Fgg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwUq7Lh4KYPk/RH5UdTXxwEAm5YxyheHvcN7eFO6PKCCzOcqVxM
 5MtYnpIjaySlVspT/bBxWjw04b461FmRmZ9z0ZsDyRsk9Jd9wBDt
X-Google-Smtp-Source: AGHT+IHQmnfERjVbgde4xoS7Xg3Nee7eeqn8iqFraPmTdAJTJEW9Gmg9baMjNSv4pjmJ+IhQhYfR1A==
X-Received: by 2002:a05:622a:1aa6:b0:458:34df:1e6a with SMTP id
 d75a77b69052e-4608a515378mr29032821cf.48.1729033591775; 
 Tue, 15 Oct 2024 16:06:31 -0700 (PDT)
Received: from localhost.localdomain (ool-1826d901.dyn.optonline.net.
 [24.38.217.1]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4607b0e407esm11224641cf.27.2024.10.15.16.06.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Oct 2024 16:06:30 -0700 (PDT)
From: Alex Lanzano <lanzano.alex@gmail.com>
To: u.kleine-koenig@baylibre.com, Alex Lanzano <lanzano.alex@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 David Lechner <david@lechnology.com>,
 Mehdi Djait <mehdi.djait@bootlin.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-kernel-mentees@lists.linuxfoundation.org, skhan@linuxfoundation.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org
Subject: [PATCH v11 0/2] Add driver for Sharp Memory LCD
Date: Tue, 15 Oct 2024 19:05:42 -0400
Message-ID: <20241015230617.3020230-1-lanzano.alex@gmail.com>
X-Mailer: git-send-email 2.47.0
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

This patch series add support for the monochrome Sharp Memory LCD
panels. This series is based off of the work done by Mehdi Djait.

References:
https://lore.kernel.org/dri-devel/71a9dbf4609dbba46026a31f60261830163a0b99.1701267411.git.mehdi.djait@bootlin.com/
https://www.sharpsde.com/fileadmin/products/Displays/2016_SDE_App_Note_for_Memory_LCD_programming_V1.3.pdf

Co-developed-by: Mehdi Djait <mehdi.djait@bootlin.com>
Signed-off-by: Mehdi Djait <mehdi.djait@bootlin.com>
Signed-off-by: Alex Lanzano <lanzano.alex@gmail.com>
---
Changes in v11:
- Replace drm_fbdev_dma_setup with new drm_client_setup interface

Changes in v10:
- Address comments from from Uwe
    - Replaced -EINVAL with PTR_ERR
    - Error check pwm_apply_might_sleep function
    - Remove redundant error message

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
 drivers/gpu/drm/tiny/Kconfig                  |  21 +
 drivers/gpu/drm/tiny/Makefile                 |   1 +
 drivers/gpu/drm/tiny/sharp-memory.c           | 671 ++++++++++++++++++
 5 files changed, 791 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/sharp,ls010b7dh04.yaml
 create mode 100644 drivers/gpu/drm/tiny/sharp-memory.c

-- 
2.47.0

