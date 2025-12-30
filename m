Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B38E4CEA6DD
	for <lists+dri-devel@lfdr.de>; Tue, 30 Dec 2025 19:10:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E140110E92E;
	Tue, 30 Dec 2025 18:10:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DhpaGo30";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 901C310E92E
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 18:10:48 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id
 d2e1a72fcca58-7b8eff36e3bso16284438b3a.2
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 10:10:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767118248; x=1767723048; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=U4o2F4BeHSek0PRiyhvtGksMp+wv7OaL4BHi8U8EOKo=;
 b=DhpaGo30aGOs4+7T5feWn6NLQRIM1m+WRjdKnDn8HOMuVLWy2hXzRrBocnGJCoIRGR
 Pe5y0e9UvZhMWiUQorf/c/lkD9Z8vXRyYe64vwJNs3Hvwg4aqeaQd1V/XHN4BKJGalIN
 SRiVhS02nL8bvf4/NwHni5VXXeHqJ49xL316HyEO6G3havyWPHSIm7b6jUXfPimXirHz
 KGq1a7gvu803mC/ynq4ykNwitii/1R5zCl6pqJxb8MGXcTrGMSRWapC8I98E4u+ftFxD
 fJK/uWmnAt+U4Ab+e6v+gG8UfqwfaXmURUbOdmSZzfXpQMMk5MDqqwM/OxCWAdVhOlCM
 2iTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767118248; x=1767723048;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U4o2F4BeHSek0PRiyhvtGksMp+wv7OaL4BHi8U8EOKo=;
 b=DLkBHwR7jeKptU2U21Ixd+Y5bJ8fMxb3IkzxQES1NODL1kLeXKuexiO7tp6TT0D0IZ
 d6YJBjhbeg7EG0pF+k0mL/wuvYTpkNWbFd5GUgnLKRWM1YMz539nljwWPHrBV09kcWKD
 AGbj1tqEknwEwjDcCLRakYeq5VtJ42Zm4rDFpOB6fZT6kIFk3hPG8X459vo46nOhvX3Y
 YWpB/ZE/pOLoIgUwMTWHWPxR4+5RitCFibGz0Epj8sF93N04MyYJsLc8tlsf9AHsGMtl
 OUtJ33O1xjJ8cdSxho7mrIpnM4Jj1H9u+6iuYD2w3DI0taKLu01jcp7I85uMbZ6Fjf5G
 JhNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWAq/ECu0dHgJ5jV3mO/wifNaI7f76xGBabhMnw/d+zFzv7VH4lYJH9gy59JeLQD3W3bw9doHy5X0k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz9Kid9c290HfznL5VN23tI2xW0Qn4/7r3tzTA3AecQ4kEomTfA
 SGPZd+xC54vZr1Bq0sPilcQDh0HZGrd3WUmS67ZM+Zjb7pzxvbxVWN5T/9XEUA==
X-Gm-Gg: AY/fxX6R43/HI7MRtY7bev88qOVPIV2GJNfbm7kg9kUhxNxcnD5f5xQlexrZVLQriH3
 EtZFoVhL1B0G/IsLNiPj6RqkWnnnaiVgBz1lnQL+IZhb2W1At7hu9WjAbKhwykCnFTW1Ed0GeSP
 2KVm3pIECnheHnTBcvUSRCMcPknsGZpXH6oS0PUq6GQ3H9p0qBAuwFItyibltoF6+xLV25xTBnC
 Zjtj5x0mSebfqHeDP8e6LNr74z3JQFJzNVlUZTyCSCIcoETJSPSgk6E7lQ2GLd1WgjNVb5Y5Vc0
 4iC64AuaOIBW2VwMDeM2Yw5pHlNvOdykoXhDeZRsl+iln9zf+z3L/0U05uuSmdN66SzgVcsXEMe
 4KOLw+//Cs/4PpfmjQwAPzMYl+/kIlLWtWo7gM4+6wxjArSKdIjMHooNzE2eqxt4hPJ0PPcFDQo
 Jg73wxLlacKEkM8NUecwGsMjOfSn75QQ0t4JCfmTBnL5iZJy5FCmF13bKIEUu5wF+1Y84fhaR4i
 0l1pHXuz5dmi5YahOQr5V8r1b+K2Oxm
X-Google-Smtp-Source: AGHT+IF7WV9lO2SRprnaSS6rXcXG+rahUOdxgA9XI3QZjssiw/UqNuh+1y3CwU7o6es14BggMVW//A==
X-Received: by 2002:a05:6a00:420e:b0:7e8:450c:61ae with SMTP id
 d2e1a72fcca58-7ff67063910mr30261999b3a.69.1767118248003; 
 Tue, 30 Dec 2025 10:10:48 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com
 (25.118.81.34.bc.googleusercontent.com. [34.81.118.25])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c1e7bc69728sm29598278a12.19.2025.12.30.10.10.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Dec 2025 10:10:47 -0800 (PST)
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
Subject: [PATCH 0/6] dt-bindings: goldfish: Convert to DT schema
Date: Tue, 30 Dec 2025 18:10:25 +0000
Message-ID: <20251230181031.3191565-1-visitorckw@gmail.com>
X-Mailer: git-send-email 2.52.0.358.g0dd7633a29-goog
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

Kuan-Wei Chiu (6):
  dt-bindings: serial: google,goldfish-tty: Convert to DT schema
  dt-bindings: misc: google,android-pipe: Convert to DT schema
  dt-bindings: input: google,goldfish-events-keypad: Convert to DT
    schema
  dt-bindings: power: supply: google,goldfish-battery: Convert to DT
    schema
  dt-bindings: sound: google,goldfish-audio: Convert to DT schema
  dt-bindings: display: google,goldfish-fb: Convert to DT schema

 .../bindings/display/google,goldfish-fb.txt   | 17 ---------
 .../bindings/display/google,goldfish-fb.yaml  | 38 +++++++++++++++++++
 .../devicetree/bindings/goldfish/audio.txt    | 17 ---------
 .../devicetree/bindings/goldfish/battery.txt  | 17 ---------
 .../devicetree/bindings/goldfish/events.txt   | 17 ---------
 .../devicetree/bindings/goldfish/pipe.txt     | 17 ---------
 .../devicetree/bindings/goldfish/tty.txt      | 17 ---------
 .../input/google,goldfish-events-keypad.yaml  | 38 +++++++++++++++++++
 .../bindings/misc/google,android-pipe.yaml    | 38 +++++++++++++++++++
 .../power/supply/google,goldfish-battery.yaml | 38 +++++++++++++++++++
 .../bindings/serial/google,goldfish-tty.yaml  | 38 +++++++++++++++++++
 .../bindings/sound/google,goldfish-audio.yaml | 38 +++++++++++++++++++
 12 files changed, 228 insertions(+), 102 deletions(-)
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
2.52.0.358.g0dd7633a29-goog

