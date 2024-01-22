Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ADB7837334
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 20:51:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DBF510E6CD;
	Mon, 22 Jan 2024 19:51:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.skole.hr (mx2.hosting.skole.hr [161.53.165.186])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1C7A10E78F
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jan 2024 19:51:40 +0000 (UTC)
Received: from mx2.hosting.skole.hr (localhost.localdomain [127.0.0.1])
 by mx.skole.hr (mx.skole.hr) with ESMTP id 1CDAC86C45;
 Mon, 22 Jan 2024 20:51:39 +0100 (CET)
From: =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Subject: [PATCH v4 0/3] Kinetic ExpressWire library and KTD2801 backlight
 driver
Date: Mon, 22 Jan 2024 20:50:56 +0100
Message-Id: <20240122-ktd2801-v4-0-33c986a3eb68@skole.hr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIACDHrmUC/13MTQ6CMBCG4auYrq2ZTlssrryHcQH9kQYDpiWNh
 nB3CwlCXH6Ted6RRBu8jeRyGEmwyUffd3mI44HopuoelnqTN0FAzgAEbQeDChgFx5XiupalAZK
 /X8E6/15Kt3vejY9DHz5LOLH5ujbkr5FyhgqujZI1FFhW19j2T3tqApkTCVcmgDG1MZwZSu04W
 jgX5R/jO4awMZ6Zs6jryjlXI9uxaZq+xZcJSAsBAAA=
To: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2764;
 i=duje.mihanovic@skole.hr; h=from:subject:message-id;
 bh=h3bREyOH1oCNdl7LgneqpfYf+pwYxlqZnL9DAyhGyas=;
 b=owEBbQKS/ZANAwAIAZoRnrBCLZbhAcsmYgBlrsckvqKcxfItPfeI8JR1dRfffkR6LOBPH6yu4
 y44ElntPp6JAjMEAAEIAB0WIQRT351NnD/hEPs2LXiaEZ6wQi2W4QUCZa7HJAAKCRCaEZ6wQi2W
 4SueD/4ibIhE/jpzZXN9RJq78NClxp7Rx9uEVxuyFbdEEnIJhnOn7GJUmpFzvAiaIZPQLsx4/1s
 hkzEQ/ypo+ZM8bjXRRmZBKPmuxLyVgTfM+AbvOd561LQBiukiN6te/xHxNlFpA6TEnHg8VSfvxV
 DXE6h2Y8qFZJfe8l/IENcSdW+KVq46NWa1zyXdNxwnet6EvnfQkFVqyR5pCJ22f6aja1Nm2xtxn
 OMCDWMzmmCfclcQhfOJ9nL/AM9sgny9MYoW7TYSmAviZVSuQqNIW6+EX4xRHOfyuhj7VRe1Xf6f
 ZyZ3NY67CwwshHkW1yEu3B2fQVd3zYCU/+op8WmtYHb/k43ykCJhzE1iq9+LD7rEKDsyMGsBkLU
 v4fE8Evxlz7XE3BBrLXdfDUn2Mki0rzs9SUDcQSf+R0Z2rU+pN/wjuSwX8WR3ibU5JfHwRMqtRP
 idFcoJeF5h81NKrEzd+xOVw0vQn4KS3fxTuarSFOSw+Bw94hW7mxA7HNIiC42vVGZ7s/gRbhdF0
 OnWzxPO33B+Pb4kitm+zV08jpT3RMcrx4dicRjaoZxvWEjTR4+fkFinuLWJjQySCuAN/J+FbNQT
 LAn+e60CTtpnIcbHSKw002PCmsv+6+8WarnTKRArFSRWxOXyeeysjRi23iPEasuffO3wgelIALJ
 6MaOgn20Vty+x6A==
X-Developer-Key: i=duje.mihanovic@skole.hr; a=openpgp;
 fpr=53DF9D4D9C3FE110FB362D789A119EB0422D96E1
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 Karel Balej <balejk@matfyz.cz>, linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

This series adds support for the Kinetic KTD2801 LED backlight driver
IC found in samsung,coreprimevelte.

Support is already upstream for the somewhat similar KTD2692 flash
driver, and this series since v3 also moves its ExpressWire code into a
separate library and converts the KTD2692 driver to use that library.

Signed-off-by: Duje Mihanović <duje.mihanovic@skole.hr>
---
Changes in v4:
- Drop 'extern' keywords in leds-expresswire.h
- Add 'expresswire_write_u8' to leds-expresswire.c and use it in the two
  drivers
- Move GPIOLIB dependency to LEDS_EXPRESSWIRE instead of letting clients
  handle it
- Drop time constant macros
- Drop delay.h include in ktd2692
- Drop bits.h and delay.h includes in ktd2801
- Link to v3: https://lore.kernel.org/r/20240120-ktd2801-v3-0-fe2cbafffb21@skole.hr

Changes in v3:
- Split ExpressWire code into library (and convert KTD2692 to use this
  library)
- Rewrite commit messages
- Add link to datasheet
- Drop of.h include in ktd2801
- Use _cansleep and usleep_range when powering off
- Clean up bitwise operation in update_status
- Link to v2: https://lore.kernel.org/r/20240118-ktd2801-v2-0-425cf32e0769@skole.hr

Changes in v2:
- Address maintainer comments:
  - Drop MODULE_ALIAS
  - Rename enable-gpios to ctrl-gpios
  - Rename ktd2801_backlight->desc to ktd2801_backlight->gpiod
  - Give time constants more descriptive names and note their origins in
    Samsung driver
  - Convert to GPIO_ACTIVE_HIGH
- Update trailers
- Link to v1: https://lore.kernel.org/r/20231005-ktd2801-v1-0-43cd85b0629a@skole.hr

---
Duje Mihanović (3):
      leds: ktd2692: move ExpressWire code to library
      dt-bindings: backlight: add Kinetic KTD2801 binding
      backlight: Add Kinetic KTD2801 backlight support

 .../bindings/leds/backlight/kinetic,ktd2801.yaml   |  46 ++++++++
 MAINTAINERS                                        |  13 +++
 drivers/leds/Kconfig                               |   4 +
 drivers/leds/Makefile                              |   3 +
 drivers/leds/flash/Kconfig                         |   2 +-
 drivers/leds/flash/leds-ktd2692.c                  | 116 +++++--------------
 drivers/leds/leds-expresswire.c                    |  68 +++++++++++
 drivers/video/backlight/Kconfig                    |   7 ++
 drivers/video/backlight/Makefile                   |   1 +
 drivers/video/backlight/ktd2801-backlight.c        | 128 +++++++++++++++++++++
 include/linux/leds-expresswire.h                   |  36 ++++++
 11 files changed, 334 insertions(+), 90 deletions(-)
---
base-commit: 0dd3ee31125508cd67f7e7172247f05b7fd1753a
change-id: 20231004-ktd2801-0f3883cb59d0

Best regards,
-- 
Duje Mihanović <duje.mihanovic@skole.hr>


