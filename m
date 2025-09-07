Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B44B4850C
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 09:25:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9B7710E1CF;
	Mon,  8 Sep 2025 07:25:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vinarskis.com header.i=@vinarskis.com header.b="K8LcTonE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-244102.protonmail.ch (mail-244102.protonmail.ch
 [109.224.244.102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CA2310E1E8
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Sep 2025 23:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vinarskis.com;
 s=protonmail; t=1757287096; x=1757546296;
 bh=E8FRq9d04k6YYbAmL36bn60thwFzL/SsLK8ZOEggcFE=;
 h=From:Subject:Date:Message-Id:To:Cc:From:To:Cc:Date:Subject:
 Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=K8LcTonEyRrDL6rilzK5+auaZbIX+ZvrF/aZpkI22wFAWucu5YVFFTJpgfeF1sUE0
 jvD5ipo7+6negfyQKk7BrMNgWctMtq0icu8wAo3h9xFm4Kf58z6gEP84lX4qLp+az5
 lMQ6yVtkJl+QucVcAcvDnQneJW182pz072iMv6eFmPEixhFmq/UUbekFN6PNOCQDPT
 X0G2K6j/rzSgDX+qXPbi4HW66W6ZukDqNMf57xfXQZFTcXF7d/xo0R2eFPjoRfWYTu
 07ZZfKq62KXnEjBH9Vq64IpFvBBPv1/j6b3RBqvtcXQ4mpmgaQxivmnhcXyAe9+xiX
 dq98rf6EbziKQ==
X-Pm-Submission-Id: 4cKmGZ61Bxz1DF4H
From: Aleksandrs Vinarskis <alex@vinarskis.com>
Subject: [PATCH v3 0/4] leds: privacy-led support for devicetree
Date: Mon, 08 Sep 2025 01:18:02 +0200
Message-Id: <20250908-leds-v3-0-5944dc400668@vinarskis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKoSvmgC/12MQQ7CIBBFr9LMWgxQoejKexgXCFM7UVvDGKJpe
 ndp48J0+X7+eyMwJkKGQzVCwkxMQ1+g3lQQOt9fUVAsDFpqI/dSiztGFsGq4JrGx+gklOszYUv
 vJXM6F+6IX0P6LNWs5nUVyEpIsfO1QqWNbuzlmKn3iW/E2zA8YI5k/S+an6iLiNG11rbGRu/W4
 jRNX3fY3brVAAAA
X-Change-ID: 20250902-leds-c61c877add80
To: Hans de Goede <hansg@kernel.org>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Jean-Jacques Hiblot <jjhiblot@traphandler.com>, 
 Jacopo Mondi <jacopo@jmondi.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>, 
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Andy Shevchenko <andy.shevchenko@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2779; i=alex@vinarskis.com;
 h=from:subject:message-id; bh=k8iX8f1s+IR8AvU1agIi/j65Y7bAoHiH3WV53x45EE4=;
 b=owGbwMvMwCX2dl3hIv4AZgHG02pJDBn7hDboOuU/Y7Bm/5y71XeXBfdSc5V2Vi/Ow+FbL5qZv
 e48qqneUcrCIMbFICumyNL952ta16K5axmua3yDmcPKBDKEgYtTACaytoXhn96TVc9UZy/TC2La
 fNx82s47pzXi7plIH1RhO+Nycu+K52cYGeYbHT5ebGvptf1JsyOfAGNretiVtbK30qpnTL35MX6
 eKw8A
X-Developer-Key: i=alex@vinarskis.com; a=openpgp;
 fpr=8E21FAE2D2967BB123303E8C684FD4BA28133815
X-Mailman-Approved-At: Mon, 08 Sep 2025 07:25:13 +0000
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

Re-spin of RFC patch from ~2.5 years ago [1]. v4l2 controls for privacy
LEDs has landed, but the DT part was left out. Introduce missing
dt-bindings, and commonize 'leds' parameter. Finally, add a patch to
enable privacy-led on Lenovo Thinkpad x13s.

With recent inflow of arm64-power laptops (Snapdragon X1E/X1P) which
mostly use MIPI cameras, this feature becomes more desired. Original
rebased patch is still working as expected (with respective DT changes)
on Dell XPS 9345.

Changelog to original series:
- Pick RFC patch, pick R-by, drop RFC-related commit message part
- Add new DT binding to describe generic LED consumer properties
- Rebase and test on X1E laptop

[1] https://lore.kernel.org/all/20230120114524.408368-6-hdegoede@redhat.com/

Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
---
Changes in v3:
- Drop unnecessary 'dev->of_node' check by Andy
- Keep 'panic-indicator;' in DT by Konrad
- Fix property/property-name order by Konrad
- Add missing 'led-names' enum definition for video devices by Rob
- Add oneOf to 'leds' to avoid conflict with nodes of same name by Rob
- Link to v2: https://lore.kernel.org/r/20250905-leds-v2-0-ed8f66f56da8@vinarskis.com

Changes in v2:
- Fixed mailing issue
- Fixed wrong R-by, add my missing sign-off
- Elaborated cover letter/commits descriptions to better describe why
  this is needed, and why trigger-source could not be used instead
- dt-bindings: expanded schema description, fixed s/phandle/phandle-array/,
  expanded the example
- dt-bindings: added patch to commonize 'leds' from other schemas
- leds: dropped wrapper, dropped exporting of private functions
- dts: added patch to utilize privacy-led on Lenovo Thinkpad x13s
- Link to v1: https://lore.kernel.org/all/010201990a1f5ad8-fc97fc84-9ef9-4a03-bf1c-2d54423c6497-000000@eu-west-1.amazonses.com/

---
Aleksandrs Vinarskis (3):
      dt-bindings: leds: add generic LED consumer documentation
      dt-bindings: leds: commonize leds property
      arm64: dts: qcom: sc8280xp-x13s: enable camera privacy indicator

Hans de Goede (1):
      leds: led-class: Add devicetree support to led_get()

 .../bindings/leds/backlight/led-backlight.yaml     |  6 +-
 .../devicetree/bindings/leds/leds-consumer.yaml    | 89 ++++++++++++++++++++++
 .../bindings/leds/leds-group-multicolor.yaml       |  5 +-
 .../bindings/media/video-interface-devices.yaml    |  8 ++
 .../dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts     |  8 +-
 drivers/leds/led-class.c                           | 17 ++++-
 6 files changed, 118 insertions(+), 15 deletions(-)
---
base-commit: 3db46a82d467bd23d9ebc473d872a865785299d8
change-id: 20250902-leds-c61c877add80

Best regards,
-- 
Aleksandrs Vinarskis <alex@vinarskis.com>

