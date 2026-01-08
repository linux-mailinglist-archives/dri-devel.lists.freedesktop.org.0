Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA49D01F71
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 10:55:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C52C910E6D1;
	Thu,  8 Jan 2026 09:55:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MbMaDptW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com
 [209.85.221.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77C4010E6D1
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jan 2026 09:55:50 +0000 (UTC)
Received: by mail-vk1-f172.google.com with SMTP id
 71dfb90a1353d-55b22d3b2a6so1304499e0c.1
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jan 2026 01:55:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767866149; x=1768470949; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mNWaW5uyJY39Ee5wA6GOpA1sGvgkAjuELUOx96wJt9s=;
 b=MbMaDptWxk99D+I54xHLDTy4z3gq7GKjyY8o0KWZTKoDMpGSYQXr9nmWyRLttIPqW6
 R2EqkAEXzmStTEzQEeVCYoTEvKai7swQl5uT168o/lmD/baFqXJ+tu9sj5Zb999gXKo/
 iy3bdcHrkF+iOnLDfO4jzcROgBR+QbmoCm67lgRmoZITqTBIKX4me0Guoq7mwMcS2Ob6
 fYAclytpaKONMwsWdn8yAnbOVuzDiYUGahnHwNOziVamRyYmjCXPGguinO/1I5RnG2tr
 aDNC1vAJdMGi7bfVixwmxtxeBw8qYe12zcECL94WEBOTWrI/LeVguwBpaku5n8sGnTg/
 OSsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767866149; x=1768470949;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mNWaW5uyJY39Ee5wA6GOpA1sGvgkAjuELUOx96wJt9s=;
 b=JRiZuJZjSRl0+TBDRXslzYRQh5qlnx2q5/8NQBXcDMy17sCQ6sJYQRxSfQLhdFk3Oq
 1U6d2mrrRv3tNRfYxJj6G1Pu/9RKg7ZJZKIcf5izTD/p/BwAhyOVsV1zyp4JCKr3lR7o
 wO7mIVlHK3HqiU/PaWU4kwFeZqZ0J4od1CBwTQ8kVDGNZS3/I81xU/j/8qFg3I0LyBRQ
 12vJVUKV25//mRSdOyP+J4msq2nOYdx/fJzJwC9Y8KMaZheCuQsWmbsh6jZ+H6dtcb1I
 duAtSRoc6+LZa9Tori8Y6HA3qHkFN1PppI098j0c4Wq6odxEEUODpxMBZbuq14AxSV/F
 BWVg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+l8BJcuC75AWUL1a6ECISuoF01rxEc9NfaA7qUABy4sb0ANodLRQ4a4bI1q478CVQhzPwJLNYPhE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyomF3qBofybDglh1cAMuLFe/w2s+qkCE/2e0pRCvg5RG1gz7IY
 IbnGMVRUhbqvqyT1/KRS385Pit0CLWld9ZjjbZIKp7tpyQM4owAdGbbyNL84BA==
X-Gm-Gg: AY/fxX5EVgiqrZZQmz/tfJEqBqd7gBteIhqK94lgTiDreH16wIuUIwzp1nPOSLs33zm
 YL6aIKlJa+ThYAhCR6mXNdoVOFEPOCpusSdqmndRJ4DU5hD7zkn/R7/Ztxm+x6qSuyGOm5dVOx3
 KO1jw8SxHS0ivtPU8ioOe9I6LOBkAWvrKvlfIyD2pv7KOX68Ppx08BlbNeWRKuFbfBfBbaqMJto
 kDX8/jRpDACGpB/MpHkIz68jU3n+EWoBrJtI9TUTS9ph90I+AHmyFBpOHIXIm2RQBYG211Mywnd
 xxsvVICZGOsmWtJxmgdl2XzfGy2TneaRRWHzIs8YHaN5aCM/2UNuHoYabsrvydvRbwdhwEnL1Ap
 Z1tyGXhSbYSnzkN4rHqI06VfuwWtZudOQ3D1MNz9txzUVu4W/8dcRdtq65fAd9NvnEdbNYFXZkP
 +kuyalmrhEAX0KxmCk7+Bcyhi1oth9barUgAXSjAxOLmxqiJn8UTZif87QAaEEDiU3MiDf29SCX
 no4vT2iOtrlh9i9nzCZ5w==
X-Google-Smtp-Source: AGHT+IHWNlnOIQoHRnNghuP/KuzB06upezljxGJd8aibyns6gUrJ5zRj9QVDAk4WOeIpJQ1oogEYew==
X-Received: by 2002:a17:90b:314a:b0:343:3898:e7c9 with SMTP id
 98e67ed59e1d1-34f5f831c74mr8109800a91.2.1767859745886; 
 Thu, 08 Jan 2026 00:09:05 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com
 (25.118.81.34.bc.googleusercontent.com. [34.81.118.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-819bafe991dsm6900582b3a.16.2026.01.08.00.09.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jan 2026 00:09:05 -0800 (PST)
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
 linux-sound@vger.kernel.org, krzysztof.kozlowski@oss.qualcomm.com,
 Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH v2 0/6] dt-bindings: goldfish: Convert to DT schema
Date: Thu,  8 Jan 2026 08:08:30 +0000
Message-ID: <20260108080836.3777829-1-visitorckw@gmail.com>
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
Changes in v2:
- Add references to generic subsystem schemas (serial, input,
  power-supply) where applicable.
- Update property validation to use 'unevaluatedProperties: false' for
  schemas referencing generic bindings.

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

