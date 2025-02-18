Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30254A39D5B
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2025 14:27:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 803CE10E6CC;
	Tue, 18 Feb 2025 13:27:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ttat2ps0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E26B10E6C7
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 13:27:23 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-30762598511so52073831fa.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 05:27:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739885242; x=1740490042; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QaGZVVe+zRtQUgtJWBlyfhJRB0u+b0GzBi9QAf51pU4=;
 b=Ttat2ps01hFYdcROz2Ur0v9p6x3z/qgpdLpxQJ/wLkEHcWZA8fkbgCDU6bdaZ63e6R
 /1sPzVXbKDE6Jxz2nsy3+dd9rFOkF9CRHh0GJLoIRF+XH2vwo+cQ4z0ySnjH04+i9Qge
 WmMUrsBSNc4G4AQ+L1bUNx5G53niApUI1EqbqhSZs9zZQczU2dMG8Xrx//BDvsv2fX41
 2u0U9PqjMDO5A0uVpQ20FayiBasLtQrzzn+DGqq0cp837BN3TnICyPoNAc9QmeWmieFs
 Hgb13pJrrgL4dKco9BHO9TaEygn61LfGGterZ2OdUNOHxqbOU4qkdQP36guZqROQ6/rh
 yT8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739885242; x=1740490042;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QaGZVVe+zRtQUgtJWBlyfhJRB0u+b0GzBi9QAf51pU4=;
 b=OrOjrNKMIVsg0TSlXcbAe15z8wJ6EvtrLF9W++z4FIotyTBO+zr0voMwCwbvK2a7k3
 toNZHAR5Pw1TpIL+goA9BbsDLnmG1TikhwBpPaGwkjVc0qUqiQjFPS1D64iFnjWtvfAk
 jc3O2zjq9ywExJfCs+FZBLPIwEl+11HFTlZACgbMDoX2zMhnAbjol4oMnTi+r7f4Hlji
 v1aEqEpdeMrMjMiG4JhnBFhOPUYshkIwI6s9mYk97Alurwd1wGMLE0uzuAAoCtU2snFs
 5b2JWOJiHS1cF86+zVeTpjqafGtqKzGzy2/jXnf3P2Bry3Trf15dbd9nYP7YyK/wCn7H
 Y4Zw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWzA8N34LWYo1cUI+nkte5k1xAYHln2ZqYVHkrHwUmAmIU1zC+95ef0FSGr8qbzJtgbtXHOrJ4s1bY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YytcL4Wq92w+GxGjAWiIusMi/7gisL6vWNwKZStFHBjTBEFJqlQ
 /Ymh3I2Zttin83c95fsCIiFCdKC9dfDe/ZR/4MRcCYllaUDiTX+E
X-Gm-Gg: ASbGncuBPMT8HwA883rcRopvFK3gjvUCjMmzxtjun1P/hhgHKHnJlxxkRUfHVZNab5I
 SlfZhlB0/KqyTMMUM41rBHiOwt9rCByA7DRITM5mgUmKFHABBeqxTshwdlFAJXUY9J7wQ8LgLOY
 FbGNK23EFfd3j+285tnStr20Z33jLfDBUDe7HYFf8ItkuwzJRFf3X2xF74HRBD49D5qebUU1GOH
 3WdkmubL3oz0CrVrO96+LS5e5w7jNikk9YTrELtYZE75lMGPbWIskW20z32WiARIcUqUp3EbgLc
 SkQpIys=
X-Google-Smtp-Source: AGHT+IFAsjt/u/YX+5ECDH9HYJb3vXVacCon8EEMKyGHasErL4EtjMCNuy102qVBSFHqh8hGHlzVYA==
X-Received: by 2002:a2e:8093:0:b0:308:f39c:96b3 with SMTP id
 38308e7fff4ca-30927ad5236mr38589591fa.30.1739885241379; 
 Tue, 18 Feb 2025 05:27:21 -0800 (PST)
Received: from xeon.. ([188.163.112.51]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30917da0e64sm18300851fa.88.2025.02.18.05.27.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2025 05:27:20 -0800 (PST)
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
Subject: [PATCH v2 0/2] mfd: lm3533: convert to use OF
Date: Tue, 18 Feb 2025 15:26:58 +0200
Message-ID: <20250218132702.114669-1-clamor95@gmail.com>
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

Add schema and add support for lm3533 mfd to use device
tree bindings.

---
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
 drivers/leds/leds-lm3533.c                    |  45 ++--
 drivers/mfd/lm3533-core.c                     | 199 ++++++---------
 drivers/video/backlight/lm3533_bl.c           |  68 ++++--
 include/linux/mfd/lm3533.h                    |  35 +--
 6 files changed, 417 insertions(+), 201 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/ti,lm3533.yaml

-- 
2.43.0

