Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24845B0389F
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 10:04:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD83910E13A;
	Mon, 14 Jul 2025 08:04:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="msMnJgLT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58E0D10E13A
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 08:04:35 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-54d98aa5981so5323445e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 01:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752480273; x=1753085073; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+jvirFkItcWcQ+NiJlTgNoSlron06gUKLNrK7S9V3Tw=;
 b=msMnJgLTkn+5Etpeu+3NmNSPPIkqymLFJxOGtqlnNLSkKcmZ2zSLdzM/I+koZa2fiI
 25e/h/h5j/pKH1R+n6VEFPj/Ge6pzyokVhjDv5qha6pp+h7yJwDuzqzwaK2BJ63zoodx
 HjpzqzTUxasWq50mGlGbNfEFrG+pQ4paMo/Hk9BV17M2h3i/2pjsCAYU/yX1CK+05mz7
 RdWg6l2sLujzg0XAESR4WHWaLg/X6gzC7sKcfNjBR8emqMxcxJ+tkYFD4jHJyIPBuLGo
 1bOCUfBo2mumWP7fM2KSWmTSv5IqPeNNfasAgSneA2BYR+GcxiQ0CKA84QXVPBDK0MMJ
 4ERQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752480273; x=1753085073;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+jvirFkItcWcQ+NiJlTgNoSlron06gUKLNrK7S9V3Tw=;
 b=uzdH30G2phGFQK11IlvP5x3lRMgjknefA6nb4nvY/ytb+2sTxEFuTCitXIUfT1hvY+
 4+TLfOyJ5xur8bd+XNUmeCwPje/QWPQAYKHSpLO/mzZPYGgfGdeMHuv51HIg4bBnr3i2
 08zvCnsRbBqwoEU3F3aXCd78B0WlyyCtg4xABCGWA9qnwpDpvvqeD5fk0CdRuaOeNbGt
 D3SSIkQOYgwW9hvyvE3cKW+hYulrpueJDcc7+FJB4LOuGl/yBEFWQ1lhEOBmfvt3KJ2U
 pMzMpMyeaDTt/iPfcF4rJXsQWTyyk6NP8VNDZzA7q7bBNTmW28nnL1YPpi/vnxhUZSIx
 cEzQ==
X-Gm-Message-State: AOJu0YwbOTJVMtbNj/rjK8dLcfNCKDxxKnXsXbMhQc9anZLGh2GZDoq0
 8lOXqZgLB1w+fxRGMNXtQBF+HXdlqrRXyw9xrAzrLPRkDAgiOY4ZoXbf
X-Gm-Gg: ASbGncv+Mzp8sVV8p/CnhPh3jHVpeyGnrn3e2oTsg4tTdSJ/qa/oxVn8CSb35cuiL8V
 S19LpUi34sSRX88bN31YmJMZ+6gctmvaockIpI/sGiLiG2wHfZQ7qjNbabvcqabI+gJIyUX0Awi
 HfnPWL+MxyrynD4J6eeyFdNBEVuc3fVJH9fKgUbBdeCTxb8+5h660PDX91xeuJLblgDh8+oWCEh
 MSOy+WgbH74aFd/5oY9nCP+BTjHtk6Phclu7pq2zTK+Bp14lOkMX/DF0Spe4A0lanQKdDs03Cuz
 6u9KZljg0SwRCbe1VDGkReU6u7Z6Vt3P4yqlUR7m2skAqv76QMswdLMPfMWrAig54p7LavnAxtb
 roDV2nT9QR++Uelrq2t5pb3YRVuP5EcXndyIR2K111XSx4aTzDHqGkWVEaWUg3wiS7KQ=
X-Google-Smtp-Source: AGHT+IFcBts1WbEvyYA0Vx6+vmS1wQaKS3YnZf+cJJKWFxShxfMHga546vRO1hnguq1nUdSfEspuLw==
X-Received: by 2002:a05:6512:1111:b0:553:ad81:4de1 with SMTP id
 2adb3069b0e04-55a045fa335mr4273393e87.24.1752480272972; 
 Mon, 14 Jul 2025 01:04:32 -0700 (PDT)
Received: from [192.168.1.198] (83-233-6-197.cust.bredband2.com.
 [83.233.6.197]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55943b6c08esm1864385e87.187.2025.07.14.01.04.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jul 2025 01:04:32 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Subject: [PATCH 0/5] drm/st7571-i2c: add support for grayscale xrgb8888
Date: Mon, 14 Jul 2025 10:03:58 +0200
Message-Id: <20250714-st7571-format-v1-0-a27e5112baff@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO+5dGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDUyMD3eISc1NzQ920/KLcxBJdo+RUs6TElGQTi2QzJaCegqLUtMwKsHn
 RsbW1ADFXzxNfAAAA
X-Change-ID: 20250520-st7571-format-2ce6badc48c6
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Javier Martinez Canillas <javierm@redhat.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1830;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=VdemDYxwoGsX5z5cbJgVzYaPxYf6yAhH1emKY5iBLU8=;
 b=owEBbQKS/ZANAwAIAYiATm9ZXVIyAcsmYgBodLnx1ndHdpvivwvOmVMDh32m4T1vX9zGJbsT3
 OaBA0sUi+GJAjMEAAEIAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaHS58QAKCRCIgE5vWV1S
 MqfSD/9zv7qQdM4bkNmZTisqcBxY9H1KH9Zl62FSQxsz3twUMx0vaRBsxH4WB6NIb6jSMoDFOjI
 z6i6SjjUTWQHxs4kLhqrtk+Li50bEkccKsQq6Xi4XJxhUmbdOxvQA7qwm0RY4ukCeF3D+rXyMzw
 arIdCosSnk6uogtT1R+2dJ1YqO5KCevA5tQs3QUasOQW4UoFjOenbI/u1XWqGaYoUyqWI+kGKur
 sC6/+ApGkFlUAEWkkK6/BB2yqVCyZqv4rOTCXuvBZsuZpP5BmnJnXH5DTs1/vViqSNrDozltr2s
 9hYYpUx4++/YlpADWAn+ItyneENoqHIUJpp2nsjaiw6tbyx+B4LFOLjfgCUYC7ONmkrDBUzx742
 hMzWiIOJPAHty4Vtm6SfSgtxJikv9Rs9/Lzxg8NrIHOAhtkG3aII7NPccTlZz6hjB7l9H+A1jxH
 Wcd8aATsZiSTprkjiLnQ+V2XrpMrsb7Q+3lMAS92lQtLnQ0HvRa2+kdKEFLwgkfwRAoxppFjZKC
 EHOFxNkRO7Rl1BqEToqGotCylW0yPjv+Atg3SzTYra6aXEfiBUp8QvX106OiPVpfUElzb1THAr4
 CGmmSWMCkqZCPFiHAPNuqTRvlBcl9d1zsk6lWPG6mdgaXFfrxwHZ4ThlBHtLeevcFIU9V35ON1x
 VW9agzrZ1lfvpLA==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
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

The goal with this series is to add support for 2bit grayscale with
the xrgb8888 pixel format for the st7571 display controller.

The first patch only corrects a comment of the pixel format.

The next two patches adds support for inverting pixels. This is
necessary as the connected display may or may not use the "right" (0 =>
black, 1 => white) pixel format expected by the supported formats
(R1/R2/XRGB8888).

The forth patch adds a helper function (drm_fb_xrgb8888_to_gray2) to
convert xrgb8888 to gray2.
drm_fb_xrgb8888_to_mono() has been changed splitted into two functions
where the common part is used by both drm_fb_xrgb8888_to_mono and
drm_fb_xrgb8888_to_gray2.

The last path adds support for gray2 in the st7571 driver.
Compare the mono [1] and the gray2 [2] variants of our penguin.

[1] https://www.marcusfolkesson.se/gray2.png
[2] https://www.marcusfolkesson.se/xrgb8888.png

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
Marcus Folkesson (5):
      drm/st7571-i2c: correct pixel data format description
      dt-bindings: display: sitronix,st7571: add optional inverted property
      drm/st7571-i2c: add support inverted pixel format
      drm/format-helper: introduce drm_fb_xrgb8888_to_gray2()
      drm/st7571-i2c: add support for 2bit grayscale for XRGB8888

 .../bindings/display/sitronix,st7571.yaml          |   5 +
 drivers/gpu/drm/drm_format_helper.c                | 148 +++++++++++++++------
 drivers/gpu/drm/sitronix/st7571-i2c.c              |  38 +++---
 include/drm/drm_format_helper.h                    |   4 +
 4 files changed, 135 insertions(+), 60 deletions(-)
---
base-commit: a6cfa4c8833944f8912c1fa7f95795753f6376ea
change-id: 20250520-st7571-format-2ce6badc48c6

Best regards,
-- 
Marcus Folkesson <marcus.folkesson@gmail.com>

