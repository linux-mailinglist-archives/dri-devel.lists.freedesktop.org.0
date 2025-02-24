Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B545A41D85
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 12:50:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1959B10E342;
	Mon, 24 Feb 2025 11:50:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LltrUJxt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7A7B10E2BF
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 11:48:36 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-546202d633dso4316290e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 03:48:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740397715; x=1741002515; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=atnb8vT8PjjHld1I8ZHaKAb/081GPPRide+V3/o4HbQ=;
 b=LltrUJxtxI5P/wtHk1rvDZFH8B0mpk0M6gorcoIktOEcTxT2Ic3goN8NYNUeRN1Xt7
 2iP80FiSZ/7M5QbBT6/DszTbkrpBEXUfJgpABOn+A/NorY/x6wxOQUM3AKIRMOVFY0Py
 OyxGGO2EQoqoPMyaH1gM25ItmSVb9XK/PY20BHrub2a0cUvMSUYudU4L2d8H5lgjCArL
 VVCwjL6H3XRty1uo6ZzFhMAZMJy4v6ACulq1XAhEMfAaWoiha5OQ5/P9WN78v5McVXNS
 2CPzKlUhKbz5rJ9bEFJaULtRhvCyYfNYEHt2BY8ANcC44YZuzsNtAwo4Yl/w9YTBI4qj
 5Q/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740397715; x=1741002515;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=atnb8vT8PjjHld1I8ZHaKAb/081GPPRide+V3/o4HbQ=;
 b=t/iSH8Ou3F2TndRFb9mMUQ1xu7Yab0PKYwf1NUHGvOyJwjD/xVgs6ZRpAvtRLFnd7m
 56XLHKUyaw/fqnKLr1BecMIWj98qXARE2dZsYBG7oFU3vsuSB9YDGxD0uFRo46Dv5CiO
 Q3i1UIhkYJ4uB8Judv64OjyyifpvlS6ZJaGORpMIxCbSP28UW8p1szqdf9XxHA+wBkap
 /Qx6BZqD/XIla+RaFb2mqpYcGH7RfC2WYmU+MKu7iMYXHuvF0ih4tTsN2i/5tPbTHTd6
 QUwpmLCsSUbTD7iyjQSYbLjYnuqFMDEvvHvIXC9T1kQWD6IOJhObpw4TbM1EU9XWBae9
 wk8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXE4ClaMjoraONtlAijkqSvjlXbNZ2ctjiYTEhP1Yr+ajlCXP6XhiH+LlnDElXiXBTkOv+AV0GPLIo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyzhdihAaqQqpI8iKxztz86/a04cK/DhhPp3Rg556BOTaMoPs1z
 Bunn+CREIxAzCb92OaTbI6hZClWiifjeQ0N8MCYCE/vrl9yqSsbk
X-Gm-Gg: ASbGnctAcNQix+nj2fwL/a5i+yZrPxPkAZC9sfiZu/l++xIUB52C77Harv0CI64ofE+
 4zYn6fUAMqdXUszNFz/qpQta/IQuwYC9sa90ERCdA7/i5kCKQgFxd8YziHCamAaWGcaIhVfJULg
 wMiAI7ZP+NsKDp8VLksaOWI0r5/8BaP+2cti9G04S9/EKqbyND2oqKs8/VWX7vvBNR/FfPzIQAf
 +B5KvG7P/T9hUJSPjh/0cRJMSY8p/rLocBQxJZPnkjbwyPqFTVDyhk1O4I8dadTielfjcs38ebJ
 mhumWBgJHC1wtFCq
X-Google-Smtp-Source: AGHT+IGtaNoSRQNpqZE6mcTQCEU9FuEKP+HpNqYhMZ4Fh8GwXbsRAlQ2tLnm7O+tpwCdNz943QPcdg==
X-Received: by 2002:a05:6512:e86:b0:545:60b:f38d with SMTP id
 2adb3069b0e04-54838ee3406mr4784026e87.8.1740397714664; 
 Mon, 24 Feb 2025 03:48:34 -0800 (PST)
Received: from xeon.. ([188.163.112.51]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54526338bf9sm3167862e87.85.2025.02.24.03.48.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2025 03:48:34 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Pavel Machek <pavel@ucw.cz>,
 Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>, Svyatoslav Ryhel <clamor95@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-leds@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: [PATCH v3 0/2] mfd: lm3533: convert to use OF
Date: Mon, 24 Feb 2025 13:48:12 +0200
Message-ID: <20250224114815.146053-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Add schema and add support for lm3533 mfd to use device tree bindings.

---
Changes on switching from v2 to v3:
- wrapped lines in schema and commit messages arround 80 chars
- removed |
- switched to MFD binding style
- completed binding example
- restored MFD

Changes on switching from v1 to v2:
- added unit seffix where it is suitable
- added vendor prefixes where it is suitable
- light sensor mover out of pattern properties
- added references to common schemas
- added detailed descriptions of properties
- removed platform data use
- devices bind and configure themself entirely
  using device tree
---

Svyatoslav Ryhel (2):
  dt-bindings: mfd: Document TI LM3533 MFD
  mfd: lm3533: convert to use OF

 .../devicetree/bindings/mfd/ti,lm3533.yaml    | 231 ++++++++++++++++++
 drivers/iio/light/lm3533-als.c                |  40 ++-
 drivers/leds/leds-lm3533.c                    |  46 ++--
 drivers/mfd/lm3533-core.c                     | 159 ++++--------
 drivers/video/backlight/lm3533_bl.c           |  71 ++++--
 include/linux/mfd/lm3533.h                    |  35 +--
 6 files changed, 395 insertions(+), 187 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/ti,lm3533.yaml

-- 
2.43.0

