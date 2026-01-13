Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81BC9D1862C
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 12:14:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD16910E27E;
	Tue, 13 Jan 2026 11:14:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KxLMwpZ8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 864F810E27E
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 11:14:13 +0000 (UTC)
Received: by mail-dl1-f49.google.com with SMTP id
 a92af1059eb24-11dd2370722so3984019c88.1
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 03:14:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768302853; x=1768907653; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3Sop77tdlghLGqlW2lD54uYlYaNgTrSImbZcSm1W050=;
 b=KxLMwpZ8CSsUbjL5BdwIg+7DyuipdZjk/jGO7F60Dv0zgo0bbnyB9Ue5dl9HK2JTpa
 9q326FyeeeH8fPWGGNpwdGqLT6FnNeCIgfAQm7JIM+oTFQ7/pT0OW6jy7ZYDHSm8KZ8y
 d5my1Rzw2W0+CeBsVWVrZ08fXsISGgM4J6HMS845h0mDmrUmPQMMFUX5L7GOdgDSC3dg
 NAWJazmOoJ/3URHvEf0DJpwbIuNq2MwFHb6uKCH/kAfQQ8A+I6VPZzzmLjnN2p7Sn0mz
 hiEDH39r4AZviZr+RQfTIO0GPj1jLdINPXYlB7uvOlTV49sqZFYPncNEFTGnITTMxv+s
 W/JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768302853; x=1768907653;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3Sop77tdlghLGqlW2lD54uYlYaNgTrSImbZcSm1W050=;
 b=Dk51SUuY34ya8i6+7Hb19Roh7riInFD+5ydRKhKBEelDzPPbvCeq0XZf6eCY2n57rK
 pxA0ZxcefL3CfB1qykh7Eiw6Uiq/TT2+GWADNxh7PlxrXxePt4gtK3lK93Iw6ASQ7RRw
 1fsOCeLnWmDoxT+YoW4pVfy4MZfRcNA7P33CYXmff+tztW7zFpEprwz3UADF0tIuzEMH
 IOLjwQN4ll+Pq+DD/pNhuab8dUzqdDUiW7rwjFVJm/efVPsVtlQsRpuC57gvLtmAr+mV
 xfyg9piy8IChZBpBbQVtilKEV49UjFMEbj1R7mvQkqltjM02kKZQIyQGN3TOLlFpyVAx
 3/Dg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX3T45th27pFt3B8g7Bn+7RbTB9lJV4CzoRThQdDnLzTzOCC5s9Bu2zPxKUiRskdBpPDOGExfbAU8I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yya9IBvxmKx5hZJkbAVzkI0wbQURS5/PuXMvUAu61S2ukUtyS4z
 8SgMpEiySR2UOuuDYMMDDrgp6uaw+XNnAm77qY+7e0NQtQqJIHd02tPYvbj7Mg==
X-Gm-Gg: AY/fxX5kRuZsFpH5BrGJVoVG6sEo2PGAuXpjuyZuzIBZGgp2WrV9ATfzuvNDDukZH8L
 E9CWHzIHWVQrci6WGDtqQmYLAdBD1X0CZVBGK0NjqcTsy9YgLW+mhkbee/GoyyEvGeRxEHvvDsF
 TZ6rlgTAFy5fCP40FcSWifdZaDccqXxT4zXFd/6ENKC34UnjkwSCEG+ZkOfmAUrrn0ZQUBiTrlD
 b+5WjdwQXBXOKaT+covt/ys9exJk8KOyISawJMKXmJTqSYMA5lJCrEFHKP/zbG9Nj3OI5Glktw3
 oh3t3VxS7bYTpZ1OZH0VcibOB7jos6qq++sdMac4Y56zhAzdhVyNRRrRi4fynf4xh/KdKpb3mDb
 0V6x9k5ENEoIHoJJGlyQlErE8+QauMSNa4WUGSMi9VULesqYuKFxIHYQ65lr+1fu/vSO2NYn8Zl
 p2GROc0erU/kuXw6w7hPCtd3QpF332/DJtF3Uf/pVIa9Y8Twt1y3c8Zxofq/RgSvpmckheo3yhg
 zRzMo+0O88//9VOtBug0Q==
X-Google-Smtp-Source: AGHT+IFDZv7qvFhhROPl5N9K7peOOsuOQ4CyM9RhLyedWdWjF2fUf/8J4j0bRoJff45OX+N60FkOeg==
X-Received: by 2002:a05:6a20:9193:b0:35d:3523:c90d with SMTP id
 adf61e73a8af0-3898f757a29mr19808618637.0.1768296379649; 
 Tue, 13 Jan 2026 01:26:19 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com
 (25.118.81.34.bc.googleusercontent.com. [34.81.118.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-34f5f8b0f67sm19483200a91.15.2026.01.13.01.26.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jan 2026 01:26:19 -0800 (PST)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, dmitry.torokhov@gmail.com,
 sre@kernel.org, gregkh@linuxfoundation.org, jirislaby@kernel.org,
 lgirdwood@gmail.com, broonie@kernel.org
Cc: jserv@ccns.ncku.edu.tw, eleanor15x@gmail.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-sound@vger.kernel.org, Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH v4 0/6] dt-bindings: goldfish: Convert to DT schema
Date: Tue, 13 Jan 2026 09:25:56 +0000
Message-ID: <20260113092602.3197681-1-visitorckw@gmail.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
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

Convert the Android Goldfish emulator platform bindings from text
format to DT schema.

Most of these bindings are currently located in
Documentation/devicetree/bindings/goldfish/. Move them to the
appropriate subsystem directories (serial, input, power, sound, misc)
to align with the kernel directory structure.

Update the examples to use generic node names (e.g., 'serial' instead
of 'goldfish_tty') and fix minor inconsistencies in the original
documentation to comply with current DT specifications.
---
Changes in v4:
- Update 'interrupts' property in examples to use decimal values where
  appropriate, replacing hex values.

Changes in v3:
- Update 'interrupts' property in examples to use decimal values where
  appropriate, replacing hex values.

Changes in v2:
- Add references to generic subsystem schemas (serial, input,
  power-supply) where applicable.
- Update property validation to use 'unevaluatedProperties: false' for
  schemas referencing generic bindings.

v3: https://lore.kernel.org/lkml/20260112185044.1865605-1-visitorckw@gmail.com/
v2: https://lore.kernel.org/lkml/20260108080836.3777829-1-visitorckw@gmail.com/
v1: https://lore.kernel.org/lkml/20251230181031.3191565-1-visitorckw@gmail.com/

Kuan-Wei Chiu (6):
  dt-bindings: serial: google,goldfish-tty: Convert to DT schema
  dt-bindings: misc: google,android-pipe: Convert to DT schema
  dt-bindings: input: google,goldfish-events-keypad: Convert to DT
    schema
  dt-bindings: power: supply: google,goldfish-battery: Convert to DT
    schema
  dt-bindings: sound: google,goldfish-audio: Convert to DT schema
  dt-bindings: display: google,goldfish-fb: Convert to DT schema

 .../bindings/display/google,goldfish-fb.txt   | 17 --------
 .../bindings/display/google,goldfish-fb.yaml  | 38 +++++++++++++++++
 .../devicetree/bindings/goldfish/audio.txt    | 17 --------
 .../devicetree/bindings/goldfish/battery.txt  | 17 --------
 .../devicetree/bindings/goldfish/events.txt   | 17 --------
 .../devicetree/bindings/goldfish/pipe.txt     | 17 --------
 .../devicetree/bindings/goldfish/tty.txt      | 17 --------
 .../input/google,goldfish-events-keypad.yaml  | 41 +++++++++++++++++++
 .../bindings/misc/google,android-pipe.yaml    | 38 +++++++++++++++++
 .../power/supply/google,goldfish-battery.yaml | 41 +++++++++++++++++++
 .../bindings/serial/google,goldfish-tty.yaml  | 41 +++++++++++++++++++
 .../bindings/sound/google,goldfish-audio.yaml | 38 +++++++++++++++++
 12 files changed, 237 insertions(+), 102 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/google,goldfish-fb.txt
 create mode 100644 Documentation/devicetree/bindings/display/google,goldfish-fb.yaml
 delete mode 100644 Documentation/devicetree/bindings/goldfish/audio.txt
 delete mode 100644 Documentation/devicetree/bindings/goldfish/battery.txt
 delete mode 100644 Documentation/devicetree/bindings/goldfish/events.txt
 delete mode 100644 Documentation/devicetree/bindings/goldfish/pipe.txt
 delete mode 100644 Documentation/devicetree/bindings/goldfish/tty.txt
 create mode 100644 Documentation/devicetree/bindings/input/google,goldfish-events-keypad.yaml
 create mode 100644 Documentation/devicetree/bindings/misc/google,android-pipe.yaml
 create mode 100644 Documentation/devicetree/bindings/power/supply/google,goldfish-battery.yaml
 create mode 100644 Documentation/devicetree/bindings/serial/google,goldfish-tty.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/google,goldfish-audio.yaml

-- 
2.52.0.457.g6b5491de43-goog

