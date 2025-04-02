Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44041A788CD
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 09:23:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA6E510E6C5;
	Wed,  2 Apr 2025 07:23:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="aJPY8VKc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF4BE10E082
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Apr 2025 06:12:41 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-30ddad694c1so43370351fa.2
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Apr 2025 23:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743574360; x=1744179160; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=shhHsX4Flyz0JwxNbhQY7INdDDpms3xK5mGyADEjcy4=;
 b=aJPY8VKcF2P2xWVbSPYLwNy/VKO54vQuJuaWeTkTb+UByfFSvegyz+cwPXV2F3Xr+i
 OjhFeXiDwsQnNILEicZjnDOIWUoAfx6XQdgfO65rZqyiu5uxnJz3yXexo4/SxW1LuHoU
 w+KWV51TUMmnCex2DnHZbEMBRC5A6keH2N22xzaFSLUzAsCHDWuPI19AXmklgwvVZOJL
 TdFA/R/OOcCbsHoe7rylcTs9sYyMhXoGa3BzQFlm+OFjs5/DwhxfuMFQALCS7L29eQSA
 /PR7KE7nV0FrCwiyMi+L44sDcQGmdxEin+7YWFN+qG+Q+mTtLfeDj/DCVm4zqaFy/C+w
 2hAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743574360; x=1744179160;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=shhHsX4Flyz0JwxNbhQY7INdDDpms3xK5mGyADEjcy4=;
 b=X4rsWq7exPmesXNDcCYiN54DmGf0id3NyOMlnCHdWpSEa6AT87zr8su9ZOyq7PV9Gp
 wmUAX6BwyzcKhwQ9hHKB/7UpA1R8sleuJvxFcw7zUnn1mqeckQ7h6MbF0u1OYEN+N8/a
 nv/RCpFnft3Sghnn2cE5HUqz6bvXpt+lYw5MD+F7sqxVfr3Ge8SEJ0xg7DK1UfihSBdS
 zgNbdDaNGC76o0kuGnT+Orb/36phiPsXEIpH0S0Vp/3yNLnPS8HfqTthWsl9h2dDmOZH
 Wx2mRWJj5Pvvt026LQDByZlpRebaPOYiV7f4cET6sFbBG1W8Z5Ol/lW9a+JyUUmxprne
 Rqow==
X-Gm-Message-State: AOJu0YzlxeebwISPFjF+c7PzvTjisilbkUA0ZJSLMaBe4zQb1htRmDii
 XRDegXyGfsT2uNevQ1bxpKLuHEEcju4FZoqsOsENeJHbkPz2+jsJ
X-Gm-Gg: ASbGnctUDeuW45GKFJhHE6I2GjCeYZUfebSCa0L1XoC7FaEZYTgoDq5EEdQPn6Gisw8
 fu554lmA2mazeT2sNGMUf38+HRBSfRPuZxNOINbL8mFXdP5rdnKMsNzJCklNC+hTIP5pLfo5BM8
 hD+UWxwNAWtxwZv1IDKN7sbWS4H34y84Dr3WtkImhXhJ5Fu/01wbsZNfHktm1Jl8xbYBDO3dDQG
 E+zPVgNBKq/7GOQq4BKLXu2a3RaTcgnU4/6LHqmVOIjbraLVHNtCTpl0wBw5IW2fcE9ZlplsAVq
 XM8HI9ToZ/+NdXuVTRJjxxuenrQgYrxWnADcpJgsIi9gxA+Y8BF+xGmJIPK/FLtdyp6nwUgKQiv
 2wv0lbPD3V0tb
X-Google-Smtp-Source: AGHT+IG08Enxq6EzqVSRMSso30yyhraUTKz3CUY8nXLcIXgmvLVqtcNk8VTRMQm2KJN2Y2PLoAvmPw==
X-Received: by 2002:a2e:87d8:0:b0:30d:e104:9ad1 with SMTP id
 38308e7fff4ca-30de1049debmr37766981fa.38.1743574359607; 
 Tue, 01 Apr 2025 23:12:39 -0700 (PDT)
Received: from [192.168.1.11] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30dd2aa9118sm19336801fa.14.2025.04.01.23.12.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Apr 2025 23:12:38 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Subject: [PATCH 0/3] Add support for Sitronix ST7571 LCD controller
Date: Wed, 02 Apr 2025 08:12:09 +0200
Message-Id: <20250402-st7571-v1-0-351d6b9eeb4a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADnV7GcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDEwND3eISc1NzQ11LYwujJMvktGQD4zQloOKCotS0zAqwQdGxtbUABH9
 MUlgAAAA=
X-Change-ID: 20250401-st7571-9382b9cfc03f
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1317;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=9eeOR4+3JgcxriKPV7Ry8TZTkJpSspY/e5izNWMiFoY=;
 b=owEBbQKS/ZANAwAIAYiATm9ZXVIyAcsmYgBn7NVCAPpygHz2LMVamGSNTxQMrwwwjg7GS0SGI
 3gNeOvWPr6JAjMEAAEIAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCZ+zVQgAKCRCIgE5vWV1S
 MqbyD/9yIWLNwspaYsuemQzDd5lGI/ist2Q+gD5h0oPeVW2fp26Em/G2gABUhdzRdw0XrcrBkHD
 uA+I0Ya4XdX80lrknS+8puTLOqouQPw7AoCMZLHGLpjNF4ng0WlEOyoZhijeSayMtAA6XrrtCrM
 mmMxaizrR3fAby6bnki5dhgLTkW5j+AnsNb4Z3wQgQS9IgEVv157a8A3uBMleLLG2RwGcAeN2um
 cpWnlih68CNHZG+P08BCxhWUWpRM8QJDTCAwJHHoIxLI5siSPAfMMzyvZYHT5QLqx6Z5L26x9Wv
 kb6S6Ka+DrU8kNS+jeWXgCzomRtWamro/hQUTM5AnSXjz8AijFk67SOEe4oPJzIHtoq0Lf9H7l0
 ZrgQdAHrxMbhSsBch0kgZYbSYsnuiNPtT4KQsUksV0nwuDgrqnQpcRdhhU4fbXy0+BLuMuwG4/T
 vz3Jg+SoVnsqaPqPqyfQsz6YFdBm0LAq9AihL/GLeGk5tgCXUUZZk9VTxMcTLiCkx5lDlOt/iBi
 ndANUXHV4bCMHuQfdrqcUySQ2OWZm8gKRrltHKXCwr8/3moxVGY30ECKedAZ1MyZbSaid0hXiYS
 1hSVXQFq6aYYZGb5LIBfPQLWUbPPEUFkfJQ7NOeAS64kLtXCQqbRHihp8xHGTeNRpAPEbL+/0+f
 WopOzGeqBNn8SoQ==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-Mailman-Approved-At: Wed, 02 Apr 2025 07:23:36 +0000
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

This series add support for the ST7571 LCD Controller.
It is a 4 gray scale dot matrix LCD controller that supports several
interfaces such as SPI, I2C and a 8bit parallell port.

This driver only supports the I2C interface, but all common parts could
easily be put into a common file to be used with other interfaces.
I only have I2C to test with.

The device is a little defiant, it tends to NAK some commands, but all
commands takes effect, hence the I2C_M_IGNORE_NAK flag.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
Marcus Folkesson (3):
      dt-bindings: st7571-i2c: Add Sitronix ST7571 panel bindings
      drm/st7571-i2c: add support for Sitronix ST7571 LCD controller
      MAINTAINERS: add antry for Sitronix ST7571 LCD controller

 .../bindings/display/sitronix,st7571-i2c.yaml      |  71 +++
 MAINTAINERS                                        |   7 +
 drivers/gpu/drm/tiny/Kconfig                       |  12 +
 drivers/gpu/drm/tiny/Makefile                      |   1 +
 drivers/gpu/drm/tiny/st7571-i2c.c                  | 563 +++++++++++++++++++++
 5 files changed, 654 insertions(+)
---
base-commit: 1e26c5e28ca5821a824e90dd359556f5e9e7b89f
change-id: 20250401-st7571-9382b9cfc03f

Best regards,
-- 
Marcus Folkesson <marcus.folkesson@gmail.com>

