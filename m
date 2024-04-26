Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B088B3DC5
	for <lists+dri-devel@lfdr.de>; Fri, 26 Apr 2024 19:22:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F28E10EB34;
	Fri, 26 Apr 2024 17:22:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Gim4wSNZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9695910EB34
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Apr 2024 17:22:38 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-518a56cdbcfso3865421e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Apr 2024 10:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1714152157; x=1714756957;
 darn=lists.freedesktop.org; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=k71hSoN15yH9F3aB+h2wTv9pphh17yQUdnB0/yDtnY0=;
 b=Gim4wSNZ5RPV8PH3xvk0cQLUcpw8IfhA2U/2fWcmOLG0GtaLEk8JMMKCG2kYo94qT4
 m2DPoaqHASTZ8CB8JJ6PZa3JR537fLVzl13On2P4S5aajZqpObhS884Zn/MtG6IIcuQg
 bZeGR3tMLV4WtjmdHjyEGPN/gc37mWiNnsDDOCSbvc3cg/vtu665fplplC4hG1THB819
 f5aj3uM0RHv0pDCFucFRKzn1T4UylEICGQeVVw+VM9pNg7L9A2kQVIzD5xo4QoFkP5zs
 LhKW2BrPC93kBbOuClWlAseFLgtTgMcaP+zJa5OkHPY8SRYL23Z+BIugNHAGn6XAg7Ck
 kmQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714152157; x=1714756957;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=k71hSoN15yH9F3aB+h2wTv9pphh17yQUdnB0/yDtnY0=;
 b=cNQwG8N1lVR9uvc/5PJjS+DIWEjW81MDph4yB+Zp7xAv7lCT9GA6I4MjP6p6ODhXwk
 Y3BHw5ChkZALMzo71fMHwr30wEdLTpT2JrTBM5Uidy78ASC8H9Gos9AEKfhqD0Mz2aPV
 XUvUBRuPRWV23RfXcr7QOF6LeGevN+qTq7j14r298GgSplWnl6uE6ShNLiLJciiFACna
 IdWdmWaUcDufYK3hnO1d2bjmpKc2BGuNMutO2Pkzr1YK3gXUC3gXfjPsE0mR/bMKcjU6
 C0KeIKbn9pduRnSpAm12m3icVcM9SHnaaDDqosMIEtJhsgn+nXxS5QpbCbP64l3y2Kmk
 3VXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTabtg3ZSGwPTQUStRMp+naFS0XwObmyY8bRycezfI1crfH6i+Qd582WTW+SG6uoqMn6jbw2LmfynDujtZvvyLNpEKw+8v/uGGXzQjsiIy
X-Gm-Message-State: AOJu0Yxf+NSW7OTVaJiTHEGbJNz7GJklXgzKV9rMrtak47ZWjRvZ0Zmj
 m4E4cTu5OjAMrR00SkFDjQgYs3atbV0ldKrx7h1USTIAf4/4RV7A60NMD2+pqJM=
X-Google-Smtp-Source: AGHT+IGGmltkw3FmOHr203oPQ7PadAy3RzH/8PcaNuMZJezQtl+Y6hzfXyYMaq2zC3qzqc9g35yFQw==
X-Received: by 2002:ac2:48b5:0:b0:519:60da:56fa with SMTP id
 u21-20020ac248b5000000b0051960da56famr2471353lfg.42.1714152156558; 
 Fri, 26 Apr 2024 10:22:36 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 ot15-20020a170906cccf00b00a5239720044sm10763363ejb.8.2024.04.26.10.22.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Apr 2024 10:22:36 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Subject: [PATCH v4 00/16] Add audio support for the MediaTek Genio 350-evk
 board
Date: Fri, 26 Apr 2024 19:22:29 +0200
Message-Id: <20240226-audio-i350-v4-0-082b22186d4c@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANbiK2YC/3XOTYoCMRAF4KtI1hPNv62ruccgUkmq7QJNS6JBk
 b676V4OunwF33v1YgUzYWH71YtlrFRoTC2YnxULA6QTcootMyWUEUo5DvdIIydtBTcoZQTRdWg
 ta8BDQe4zpDDMBC6YTwlum+rWHc9BbhZ7DGeEdL/O4pqxp8cy/3doeaByG/Nz+abK+fpxuEre1
 nuQAUE6t+1/PTzP5DOuw3hhc1NV37VqWgujo+l0RBE/aP1d66al816F3dYEa//paZremeg4HVU
 BAAA=
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lee Jones <lee@kernel.org>, Flora Fu <flora.fu@mediatek.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 Alexandre Mergnat <amergnat@baylibre.com>, 
 Nicolas Belin <nbelin@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5460; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=mQ0BYdLeInE8BFr/mP/QEGIogjhZGjK/zMNc0uGi9AI=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmK+LaBBB9GBTBfqJRRntnZS0wN4RhMFnbwrVXpvKv
 4RbT6smJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZivi2gAKCRArRkmdfjHURTukD/
 9ZA1bVQD8tdglKELx0M3xSVDXl47/YL1/2elfF64Arp1qCSdF7Van1DdKyb3ieKkVPCU4olo/xBUqW
 cftyKa0PRqNKM9ATv4y2tKV50HdA9f4nhKUm6nExjNyiUZlUsdN67DcbfZxYcVcm/Fyt6fPTGL7vrj
 E/oYmOV2e2QwUvijE0K/Q17zfOspVPBZd+ycv2EJ0EDEjTSTj+OqfKP37I6jYAs0kRDwPL9aZtZa1m
 /4A6ZYehxVx25/BhdcOW3gM++4YY48FTdGOaxlbSR69YCWSXVbV7kR4xEHDSKUdKon9naiL8m2Cws6
 CCoo8oyKbrMXXcT4DPf+MpRfxLFaot8PN9esfQ1r/oSHzr3u1jMxvSNMfEfqoeyKkKOPZv1lq0x+Cz
 2kk52JFdh0zGunuPMOL+UHtV/vPLnEllWTo4NOvJ6H4A3JJIzqnSFKqt9e8hfaaMNc4e456wCuvHUg
 6Ubn7mVX4HcY26XWXYy7bzSV0PuZoYU8M602dUTQ3ZEzBVZn7ZA7SnQMMuobZYHkypU4dDZKuBXziU
 pgNAvdID5d3vSjY092Kv4aSPqhEejO/Rn4itpLT4p9La231ZP7bC88JWHSruGQQi3vgL+sdLzi26OD
 NT5imPmWAdw29ibUw5PPTWZxp+ANduIBrQjZIpE828wRyylw9vvzYGMkmTxg==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
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

This serie aim to add the following audio support for the Genio 350-evk:
- Playback
  - 2ch Headset Jack (Earphone)
  - 1ch Line-out Jack (Speaker)
  - 8ch HDMI Tx
- Capture
  - 1ch DMIC (On-board Digital Microphone)
  - 1ch AMIC (On-board Analogic Microphone)
  - 1ch Headset Jack (External Analogic Microphone)

Of course, HDMI playback need the MT8365 display patches [1] and a DTS
change documented in "mediatek,mt8365-mt6357.yaml".

Applied patch:
- mfd: mt6397-core: register mt6357 sound codec

Test passed:
- mixer-test log: [3]
- pcm-test log: [4]

[1]: https://lore.kernel.org/all/20231023-display-support-v1-0-5c860ed5c33b@baylibre.com/
[2]: https://lore.kernel.org/all/20240313110147.1267793-1-angelogioacchino.delregno@collabora.com/
[3]: https://pastebin.com/pc43AVrT
[4]: https://pastebin.com/cCtGhDpg
[5]: https://gitlab.baylibre.com/baylibre/mediatek/bsp/linux/-/commits/sound/for-next/add-i350-audio-support

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
Changes in v4:
- Rebase to "next-20240422" branch.
- Re-pass dt_binding_check, functionnal tests, mixer test and pcm test.
- Remove copyright changes.
- Move mt6357 audio codec documention from mt6357.yaml
  to mediatek,mt6357.yaml
- Fix broken indentation in mt8365-evk.dts
- Remove empty node.
- Add more dai link name according to the HW capability.
- Remove spurious property (mediatek,topckgen)
  from mediatek,mt8365-afe.yaml
- Rename "afe" to "audio-controller" in the documentation.
- Link to v3: https://lore.kernel.org/r/20240226-audio-i350-v3-0-16bb2c974c55@baylibre.com

Changes in v3:
- Re-order documentation commit to fix dt_binding_check error.
- Remove $ref and add "mediatek," prefix to vaud28-supply property.
- Link to v2: https://lore.kernel.org/r/20240226-audio-i350-v2-0-3043d483de0d@baylibre.com

Changes in v2:
- Documentation fixed:
  - Remove spurious description.
  - Change property order to fit with dts coding style rules.
  - micbias property: use microvolt value instead of index.
  - mediatek,i2s-shared-clock property removed.
  - mediatek,dmic-iir-on property removed.
  - mediatek,dmic-irr-mode property removed.
  - Change dmic-two-wire-mode => dmic-mode to be aligned with another SoC
  - Remove the spurious 2nd reg of the afe.
- Manage IIR filter feature using audio controls.
- Fix audio controls to pass mixer-test and pcm-test.
- Refactor some const name according to feedbacks.
- Rework the codec to remove spurious driver data.
- Use the new common MTK probe functions for AFE PCM and sound card.
- Rework pinctrl probe in the soundcard driver.
- Remove spurious "const" variables in all files.
- Link to v1: https://lore.kernel.org/r/20240226-audio-i350-v1-0-4fa1cea1667f@baylibre.com

---
Alexandre Mergnat (14):
      ASoC: dt-bindings: mediatek,mt8365-afe: Add audio afe document
      ASoC: dt-bindings: mediatek,mt8365-mt6357: Add audio sound card document
      dt-bindings: mfd: mediatek: Add codec property for MT6357 PMIC
      ASoC: mediatek: mt8365: Add common header
      SoC: mediatek: mt8365: support audio clock control
      ASoC: mediatek: mt8365: Add I2S DAI support
      ASoC: mediatek: mt8365: Add ADDA DAI support
      ASoC: mediatek: mt8365: Add DMIC DAI support
      ASoC: mediatek: mt8365: Add PCM DAI support
      ASoC: mediatek: mt8365: Add platform driver
      ASoC: mediatek: Add MT8365 support
      arm64: defconfig: enable mt8365 sound
      arm64: dts: mediatek: add afe support for mt8365 SoC
      arm64: dts: mediatek: add audio support for mt8365-evk

Nicolas Belin (2):
      ASoc: mediatek: mt8365: Add a specific soundcard for EVK
      ASoC: codecs: add MT6357 support

 .../devicetree/bindings/mfd/mediatek,mt6357.yaml   |   34 +
 .../bindings/sound/mediatek,mt8365-afe.yaml        |  130 ++
 .../bindings/sound/mediatek,mt8365-mt6357.yaml     |  107 +
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts        |   89 +
 arch/arm64/boot/dts/mediatek/mt8365.dtsi           |   43 +-
 arch/arm64/configs/defconfig                       |    2 +
 sound/soc/codecs/Kconfig                           |    7 +
 sound/soc/codecs/Makefile                          |    2 +
 sound/soc/codecs/mt6357.c                          | 1898 ++++++++++++++++
 sound/soc/codecs/mt6357.h                          |  662 ++++++
 sound/soc/mediatek/Kconfig                         |   20 +
 sound/soc/mediatek/Makefile                        |    1 +
 sound/soc/mediatek/mt8365/Makefile                 |   15 +
 sound/soc/mediatek/mt8365/mt8365-afe-clk.c         |  443 ++++
 sound/soc/mediatek/mt8365/mt8365-afe-clk.h         |   49 +
 sound/soc/mediatek/mt8365/mt8365-afe-common.h      |  491 +++++
 sound/soc/mediatek/mt8365/mt8365-afe-pcm.c         | 2275 ++++++++++++++++++++
 sound/soc/mediatek/mt8365/mt8365-dai-adda.c        |  315 +++
 sound/soc/mediatek/mt8365/mt8365-dai-dmic.c        |  347 +++
 sound/soc/mediatek/mt8365/mt8365-dai-i2s.c         |  854 ++++++++
 sound/soc/mediatek/mt8365/mt8365-dai-pcm.c         |  293 +++
 sound/soc/mediatek/mt8365/mt8365-mt6357.c          |  348 +++
 sound/soc/mediatek/mt8365/mt8365-reg.h             |  991 +++++++++
 23 files changed, 9414 insertions(+), 2 deletions(-)
---
base-commit: f529a6d274b3b8c75899e949649d231298f30a32
change-id: 20240226-audio-i350-4e11da088e55

Best regards,
-- 
Alexandre Mergnat <amergnat@baylibre.com>

