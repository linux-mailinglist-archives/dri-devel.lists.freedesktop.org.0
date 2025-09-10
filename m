Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49DE9B51655
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 14:01:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5B6B10E8FC;
	Wed, 10 Sep 2025 12:01:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vinarskis.com header.i=@vinarskis.com header.b="Vq7egJMy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-106111.protonmail.ch (mail-106111.protonmail.ch
 [79.135.106.111])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81CD410E8F9
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 12:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vinarskis.com;
 s=protonmail; t=1757505683; x=1757764883;
 bh=6Zua8HZFQSMU7UHKMIvAOiAzH8T9S1RtjgX2NSNgKC0=;
 h=From:Subject:Date:Message-Id:To:Cc:From:To:Cc:Date:Subject:
 Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=Vq7egJMyLWieTgV2yprw2WHZaaJBLKZDszFKw/2b3ogNcc7vQvZ5wGlVKwZ3cA7dR
 b4hRcPILf0jmD7newWaGvzOjp+tkkVaiLxiZRvb0yNClj/ixBOecu6NKRtxSgFMoEQ
 OE0c2qwO8QaOj1DbvMvSiK+n2XG2lxOoK49/fntzkwo9OStrBFYBhS8L8T8EkPNTdl
 xKHxjF6D/YL1COSwCkQa3xvsoY2hHCQxLC47eWJNvxi+XZiSdhI5T44Po5WsPhY+Qo
 pMNGZRlEy3v0NyXTCt36RTIj0UUD5jNbhcDSopvOzEBdxYD9SLWatF2uMDQQ9ARvuV
 8iLqTmwuXpy1w==
X-Pm-Submission-Id: 4cMK68619cz2ScCs
From: Aleksandrs Vinarskis <alex@vinarskis.com>
Subject: [PATCH v5 0/4] leds: privacy-led support for devicetree
Date: Wed, 10 Sep 2025 14:01:07 +0200
Message-Id: <20250910-leds-v5-0-bb90a0f897d5@vinarskis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAINowWgC/23Q32rCMBQG8FcpuV7Kyd9GEfE9xi6y5LQGtd0SL
 Rviu+9YOyjiTeAL5/ddfFdWMCcsbF1dWcYxlTT0FMxbxcLe9x3yFCkzCdLACiQ/Yiw8WBFc0/g
 YHTA6/crYpp+p5v2D8j6V85B/p9ZR3H+fCkbBgWuvBAppZGM/d2PqfS6HVOownNi9ZJRLaGYoC
 WJ0rbWtsdG7V1AtoZuhImhWWsegAax9CfUCCpihJijaoCRo56RSz/D2GCDj94XmOz9WYCcsxU/
 zravNf6MA3YCsG3q54LRv6XYHzD0e6yF3W+q6/QF6JJJYkgEAAA==
X-Change-ID: 20250902-leds-c61c877add80
To: Hans de Goede <hansg@kernel.org>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Jingoo Han <jingoohan1@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Jean-Jacques Hiblot <jjhiblot@traphandler.com>, 
 Jacopo Mondi <jacopo@jmondi.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Daniel Thompson <danielt@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 threeway@gmail.com, Andy Shevchenko <andy.shevchenko@gmail.com>, 
 Aleksandrs Vinarskis <alex@vinarskis.com>, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3394; i=alex@vinarskis.com;
 h=from:subject:message-id; bh=pJ6tiNTrjS4YxOdr4O7jX1Q9jdumfA7pm9EcJFYC3WI=;
 b=owGbwMvMwCX2dl3hIv4AZgHG02pJDBkHM/odMqxfSO9Z1qCefF78+YdT56dFuWimHO/fO0X19
 RHnFyvCO0pZGMS4GGTFFFm6/3xN61o0dy3DdY1vMHNYmUCGMHBxCsBEbjxm+J9yItE/7W3Uah2J
 XT43dHQDD77PO5V65hO/6YW+K4HBbukM/zTr7BcZe0VNdKneIvCIpVLP/Ii2QFuc8fWdW0SZFE9
 rsAAA
X-Developer-Key: i=alex@vinarskis.com; a=openpgp;
 fpr=8E21FAE2D2967BB123303E8C684FD4BA28133815
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
Changes in v5:
- Fix last occurance of `privacy-led` to `privacy`
- Link to v4: https://lore.kernel.org/r/20250910-leds-v4-0-1fc320488233@vinarskis.com

Changes in v4:
- Rename `privacy-led` to `privacy`, depend on x86/ACPI change
- Simplify example in dt-binding for led-consumer.yaml
- This series now depends on: https://lore.kernel.org/all/20250910104702.7470-1-hansg@kernel.org/
- Link to v3: https://lore.kernel.org/r/20250908-leds-v3-0-5944dc400668@vinarskis.com

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
 .../devicetree/bindings/leds/leds-consumer.yaml    | 67 ++++++++++++++++++++++
 .../bindings/leds/leds-group-multicolor.yaml       |  5 +-
 .../bindings/media/video-interface-devices.yaml    |  8 +++
 .../dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts     |  8 +--
 drivers/leds/led-class.c                           | 17 +++++-
 6 files changed, 96 insertions(+), 15 deletions(-)
---
base-commit: 3db46a82d467bd23d9ebc473d872a865785299d8
change-id: 20250902-leds-c61c877add80
prerequisite-message-id: <20250910104702.7470-1-hansg@kernel.org>
prerequisite-patch-id: 429eb224c966424b458a7179e10e1f3172408eb8

Best regards,
-- 
Aleksandrs Vinarskis <alex@vinarskis.com>

