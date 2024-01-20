Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC052833678
	for <lists+dri-devel@lfdr.de>; Sat, 20 Jan 2024 22:28:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05C6D10E378;
	Sat, 20 Jan 2024 21:27:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.skole.hr (mx1.hosting.skole.hr [161.53.165.185])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D80610E378
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Jan 2024 21:27:31 +0000 (UTC)
Received: from mx1.hosting.skole.hr (localhost.localdomain [127.0.0.1])
 by mx.skole.hr (mx.skole.hr) with ESMTP id 6344D858F6;
 Sat, 20 Jan 2024 22:27:24 +0100 (CET)
From: =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Subject: [PATCH v3 0/3] Kinetic ExpressWire library and KTD2801 backlight
 driver
Date: Sat, 20 Jan 2024 22:26:42 +0100
Message-Id: <20240120-ktd2801-v3-0-fe2cbafffb21@skole.hr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAJI6rGUC/03MQQ6CMBCF4auQWVsznVIsrryHcQFtkQZDTUsaD
 eHuFhLU5ZvM/80QbXA2wrmYIdjkovNjHuJQgO6b8W6ZM3kDIQmOWLJhMqSQM+yEUkK3sjYI+fs
 ZbOdem3S95d27OPnw3uDE1+tuyK+RMsNKoY2SLVZUN5c4+Ic99gFWItGelci5+mW0ZiR1J8jiq
 ar/smVZPnZlwOrUAAAA
To: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2318;
 i=duje.mihanovic@skole.hr; h=from:subject:message-id;
 bh=wUqtxI1FSpcpCqfPkwEhcve6CkyStV415xdTZekKd5c=;
 b=owEBbQKS/ZANAwAIAZoRnrBCLZbhAcsmYgBlrDqXO1xcPWa+CH+urwK0NvcRf1j9ADUaEYL3q
 Z0+Lp2SODSJAjMEAAEIAB0WIQRT351NnD/hEPs2LXiaEZ6wQi2W4QUCZaw6lwAKCRCaEZ6wQi2W
 4WDxD/9C7pKu8/wuladiEQq90adnWZCAYzen10KGjYQBYJEXSHlFDm2pePOnghvI52wc31JdByK
 E62TJwaSmJnFzpHw0efPbFRQAjwjBOS1BS0em/wQ1qRy3b4VTdlvaH7VBW4CT0Z4OYd8Y/gWElU
 g6RuW7Z+JC6d2V6Cc0NvDOfHrttiKM84SRAgNN69fOe96HUKcJxazbvfjFKwNM0NeYQutlml7dB
 FviZZ7WIoIqT7c8T1CP7JiMuRYYGNSGLe9ZNMQkP+XlMv+XPQYrHmESunSUTND+rh9JLQnQ1pBK
 nyy/oyLLOk3g0YIbgAcX3MhVudzZzk8ql6bRgf0MJQbgBrqqeYfTKiteRpxf1FF/nSJyOVGgL+K
 xMWYuXIVKIB/vbhfKugHWCWhKlyFobQo+zFhyV79Sk9uD4djAtt5WwpjRwfxJUAzICzSz4zMc4X
 +ncqASI0zOBZI0hJpYIwComSqOIYAxf/L6jIx9MIINXVTnuAXAXV5x4onDy4AJHkxVZ3yGXYzg+
 O+PGGAibXT2VGwowdsnNKkOKKKvAfT2J9ckKPMp2E2WGGK1QQrKa+vtIXUHT3+oezLcx/JfH6qn
 F6ZaGsxGIgHENFtzr+lHWSubVBGyTF1zue/KM645It3AuM0TfNdoCHcizYZm7rsgqIj2h3Bn5Sc
 Syyfrd1xwQ4K9uw==
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

 .../bindings/leds/backlight/kinetic,ktd2801.yaml   |  46 +++++++
 MAINTAINERS                                        |  13 ++
 drivers/leds/Kconfig                               |   3 +
 drivers/leds/Makefile                              |   3 +
 drivers/leds/flash/Kconfig                         |   1 +
 drivers/leds/flash/leds-ktd2692.c                  |  91 ++++---------
 drivers/leds/leds-expresswire.c                    |  59 +++++++++
 drivers/video/backlight/Kconfig                    |   8 ++
 drivers/video/backlight/Makefile                   |   1 +
 drivers/video/backlight/ktd2801-backlight.c        | 143 +++++++++++++++++++++
 include/linux/leds-expresswire.h                   |  35 +++++
 11 files changed, 336 insertions(+), 67 deletions(-)
---
base-commit: 0dd3ee31125508cd67f7e7172247f05b7fd1753a
change-id: 20231004-ktd2801-0f3883cb59d0

Best regards,
-- 
Duje Mihanović <duje.mihanovic@skole.hr>


