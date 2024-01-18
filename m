Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB82831E91
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jan 2024 18:40:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2738410E8A9;
	Thu, 18 Jan 2024 17:40:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.skole.hr (mx2.hosting.skole.hr [161.53.165.186])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B38310E8A9
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jan 2024 17:40:22 +0000 (UTC)
Received: from mx2.hosting.skole.hr (localhost.localdomain [127.0.0.1])
 by mx.skole.hr (mx.skole.hr) with ESMTP id 344D3866EA;
 Thu, 18 Jan 2024 18:33:24 +0100 (CET)
From: =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Subject: [PATCH v2 0/2] Kinetic KTD2801 backlight driver
Date: Thu, 18 Jan 2024 18:32:37 +0100
Message-Id: <20240118-ktd2801-v2-0-425cf32e0769@skole.hr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIALVgqWUC/z3MQQrDIBCF4auEWdcyaiymq96jZJHopEpKDBqkJ
 Xj32kC7/B+Pb4dE0VOCa7NDpOyTD0sNcWrAuGF5EPO2NggUkiO2bN6s0MgZTlJraUbVWYT6XiN
 N/nVI976282kL8X3AmX/Xn6H+Rq4Ma6WxWo14Ed1wS3N40tlF6EspH+mznb2dAAAA
To: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1320;
 i=duje.mihanovic@skole.hr; h=from:subject:message-id;
 bh=zSojkb9oa18GUBW1ZjAD4v5bdWLOPJhL+eDSN4oBcHs=;
 b=owEBbQKS/ZANAwAIAZoRnrBCLZbhAcsmYgBlqWDBb2YGGpgsgix8UXpwxFe4Vyv+qY/SOJaLM
 g8Eq0fu96SJAjMEAAEIAB0WIQRT351NnD/hEPs2LXiaEZ6wQi2W4QUCZalgwQAKCRCaEZ6wQi2W
 4SPlEACZQl6p/zx4TzYIK7kXZhjzDR2FDa/QIbn50ad9nnDfWy6jkRd+lDv5gXm8ZVBjD01e3FK
 ECgsBBs9oft4nrZ35uY6iNTcNgyCwDL8fSbqZfuTye1yUP1yy06nPrUNmFULuyJ5HrcbGQN6We6
 m4uEfEr5Rn7vLGviVuwK/rj+9YZSWAI2Wd/rqNd39yx8/MGo4oz4VnC9JbQhZhBw7PMtDL7mWUV
 ptjS0gmRx5sJK7YiOWhj8IC95h5U97ShkeUMMaVkvgoPpUVjQPpdTWVIGZ1x1BlJIDdh3RYjhHE
 DpiTjcvNWGxRa99NdqXb7Cb47auZTC/Z5Bb8N7jPH5N4WektAg7H+M9yefS8tkP+N3fJC142eYq
 3IW0gwnZEghHWXxZZ6/My/wsElID+ykQbVY+YnNrmcfl0pjuogDjMOmlsRrvxWp79FetLSNG8CE
 zwOneEqUnD3SipnO4B8k85rIwGiIfE4IILfl6STltOpjnc27aRmE62HGgJ1iY2semAdicA/4gR6
 s39lseXtoRyHYp9b0n/y7WNj3sCDykDybv0yMr0vz8AytVMgTu9bKM1RSQ619r2nVOMQfRxKsh1
 Y7ZJFiUU9VozU84WtPsqHIEXHz6tU+bDIBNpqp0ok5Db4G8p7xf64JsdgPqzKu/x4Ylw5yDq70i
 lgpHmR+3Ow8kDqg==
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>,
 Karel Balej <balejk@matfyz.cz>, linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

This small series adds a driver for the Kinetic KTD2801 backlight IC.
The driver has been tested on the samsung,coreprimevelte for which
support is still out-of-tree.

Signed-off-by: Duje Mihanović <duje.mihanovic@skole.hr>
---
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
Duje Mihanović (2):
      dt-bindings: backlight: add Kinetic KTD2801 binding
      backlight: Add Kinetic KTD2801 driver

 .../bindings/leds/backlight/kinetic,ktd2801.yaml   |  46 +++++++
 MAINTAINERS                                        |   6 +
 drivers/video/backlight/Kconfig                    |   7 +
 drivers/video/backlight/Makefile                   |   1 +
 drivers/video/backlight/ktd2801-backlight.c        | 149 +++++++++++++++++++++
 5 files changed, 209 insertions(+)
---
base-commit: 0dd3ee31125508cd67f7e7172247f05b7fd1753a
change-id: 20231004-ktd2801-0f3883cb59d0

Best regards,
-- 
Duje Mihanović <duje.mihanovic@skole.hr>


