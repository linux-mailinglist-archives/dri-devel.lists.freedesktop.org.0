Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 394E1D154E9
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 21:44:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F20210E42C;
	Mon, 12 Jan 2026 20:44:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cznMD4n8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
 [209.85.222.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBC8F10E42C
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 20:44:48 +0000 (UTC)
Received: by mail-qk1-f180.google.com with SMTP id
 af79cd13be357-8ba3ffd54dbso1017639185a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 12:44:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768250688; x=1768855488; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CUq04sqpfNThT7kS3bI999/FPk05t6O1xEOGrVfWKpU=;
 b=cznMD4n8XjNG85jjnL8WLGqoSyC8jvjMgyXpHv00IZyYkuPhEzrkBZancwuWH+TIyB
 dRGnJOC1rjnxfdvrEvdgmElrom+uaz1jSsU+ksYcWGDCImUVASNILX5/8/3rmJt1Yolx
 RmwOPWt5Fl+SGKtrID4qRTJBnXXKzXv60SYd7gVyTm+vkMKhlnreTrouJqj70+82hTLW
 YgcVwMtQ1Oxc+oCQKym0uWhHnzwYmCxxJUZ6GX5pkWjQTOXHKudeTY3bR5+6PhqBtsPQ
 WyYYSoGkZJSjbBj6Uv+AQmi/IQ4Bt9eiXveF5acDTU+q1m3xuflBx3RAqbqagWCPeQpA
 F89g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768250688; x=1768855488;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CUq04sqpfNThT7kS3bI999/FPk05t6O1xEOGrVfWKpU=;
 b=XXgkvFpA1su3OH4rVOCsm7PREj3epSC5ZY9CdwE0QeW+ImBJmjZq+6yi/O7edHcCw1
 9ZWfcwFR/3+PRV1efKI+Gk7g5ZHD4gS1rJwPrS//w4O3IohesTHCRyprOg2+Gd4rWstE
 mpE5A+bD1Xn3zufjLQy/GIptcbwFARwRUdgLHQsKuIAr3h6d2zLHr9AKYIumWjztkK9f
 gYIG7KckaCDA4WNnG7trlx1zb6EgjkU7/qevlQSTD8ah0MBdRrXmEO12WcmSNWCBk87o
 Vhh8o8wZkYsOwLMPW+Y8w20yEgg9RPWX9tF50twvUPCHKb3xPVDS1WN4xXAoTbrNlW7V
 ffkg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWE6vSFrmskrwR/DqMrWQupm77sBHZNbbIS7jh4sRTP3Vic00Z8RKTjchQXHtaR0PClW3IV2vHIrnE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyCsHN4Uwpphc5Uv+XeEML2I0G0vrqcR0OjvFEkRq3waQMKSwCj
 sNJsRU/Ud5WdjO/5nIWVLQwQyY0frx5DsVqmw/XWrMw7YVtwGOvH6oeF
X-Gm-Gg: AY/fxX5Qx4uO46ShXd5B4KJ+7qTHgJR/Bd/8m17v5yaqplNeIDN2HXiBQ5QBST3bHSe
 uOO3LDXZR2SaND/5UasgO9bKipxkwPuYbQcF5yvt8Mbpxl4t5W9TaJqN04JHIVo+xJ/WzHjGGkg
 GoAbXMX/2ETPIK5vnQcS37lxppWYueP8isCiulpc+c4fX/Qehwlv3d5H+1k/nNB/L9b4u3Kzcv+
 K98J72h6Ooiay/+ynQWdv3AAQsp3iCg1F9Ts3Q021k19O87tX+p7mjCN43sCNrzPweeqyHCRfjl
 MidCfVSuHiQnxdNUUd2HE4h36gOack0Nx+D0aIIA93Skb2ZZJN9Y5V73jRj6XelJ5x302TyeI9j
 ezRrVT6fd6rHlDRLltZXgCY4iJs8Hs3XW9PqpCwxJSxmmyUigQUDpPV3c0tX52D3LP02KE967uS
 9yFR6b8yVa98rK/VLWfJCuwnzLOnuSOihR0F988Jnq0LYSmjcW/RUP2qSE91GmqjRd6oS+d7m1T
 ygTtvH8S/UcwHhaoUFRRg==
X-Google-Smtp-Source: AGHT+IEj1k7cb2fd0Uhwg3rDL/Jbgy35/7F5lChJPW1hzU6BQQa/0pFpWI+28ikvSEYQSgMkRmokRA==
X-Received: by 2002:a05:6a20:7287:b0:35d:d477:a7f1 with SMTP id
 adf61e73a8af0-3898f99146bmr17183198637.43.1768243906956; 
 Mon, 12 Jan 2026 10:51:46 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com
 (25.118.81.34.bc.googleusercontent.com. [34.81.118.25])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c4cca06b16fsm18874197a12.31.2026.01.12.10.51.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jan 2026 10:51:46 -0800 (PST)
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
Subject: [PATCH v3 0/6] dt-bindings: goldfish: Convert to DT schema
Date: Mon, 12 Jan 2026 18:50:38 +0000
Message-ID: <20260112185044.1865605-1-visitorckw@gmail.com>
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
Changes in v3:
- Update 'interrupts' property in examples to use decimal values where
  appropriate, replacing hex values.

Changes in v2:
- Add references to generic subsystem schemas (serial, input,
  power-supply) where applicable.
- Update property validation to use 'unevaluatedProperties: false' for
  schemas referencing generic bindings.

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

