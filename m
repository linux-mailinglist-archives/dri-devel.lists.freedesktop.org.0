Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B7BDA32074
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 08:59:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A00F610E7DC;
	Wed, 12 Feb 2025 07:59:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VehM8RqI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2564810E7D7
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2025 07:59:17 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-5450f2959f7so2661058e87.2
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 23:59:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739347155; x=1739951955; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Wv0GhJL/R4in4Vn8Ofx8yxqMCUurvzPMIRxBdypJOK8=;
 b=VehM8RqIvVo0PWGOYpN2BuVIW+srPjb0niSNaOSqK7AH+VVHi2tf0ScC0w6HMDRQ18
 SuOmVIwvf+WcagO1oakC7LT5a175i6ST1AMFtIwqxLGdAwoOZf1w1vjbAIdQSSkfa/Ay
 nJjMxnuM8gcq9sQJz8Hf9ZOK/G6CFm4tOdCh1Cv2uR7g+d0DnAo0LfltArQV5etcnEp+
 OgIBwZqdOyOfaDLXjNmpgaJiH3jLGucs6BS5LvyskEhFvN9cr8lF/GyRRJvVpN/Figgz
 glc9BQbRppLH+OTi3ellVkfMNCdFBZL890Co6KrPDrvQwFD+ihjZX09vaAdln1Xpn38N
 zRTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739347155; x=1739951955;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Wv0GhJL/R4in4Vn8Ofx8yxqMCUurvzPMIRxBdypJOK8=;
 b=nEvjbsGtnF5DC4YmVVej/6Cz7zh8WVPGmV51cmUljopC+BLdsj4WLTRS4MNSuPLnSm
 sL8qMUpr75kTuFWVLcdRlQA+R8dj4NOg/aDI8Cd62mOWa7qGjF7GC1TRQJYM4OMrkDWv
 0CNE8iwCIvcChDgeBQFRg4vvAEpSikMtt+U+X92fs7Fz6lhc9y4u3FyHDfEWTOodQaII
 6OvSMELeN55xdvM8xIFBWyyNS3/NwybVroOiqJyWlY7xAKVpI6FVFlv6oOZNeszd4ev8
 ugEk/BqjeL7+9T5ob2XGm2IUTuLVfDeMoCJoLGUBx+XaoGHm/hV4/YviBRfRR/pE1sPX
 Xpzg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWr/8NABONI1HA2SCEzVkkVIkXSev9N2xnn054fmfOUg7tOyACC9d5BmVk533E5QvNxahPe8B4dAHY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyTOBVGtMpxldQ+vx1Dx9lhRRAJ3wrk1nTAoKBu0sscCqKMvZzr
 cFFBS7Yqh3ceOjweW+ojZWhl1yPH7PZhC9OH4kkqQ4Q1wz/1og7w
X-Gm-Gg: ASbGncssFvht1+aF69kGVZFDM2nW0QP3od0a0NxBdF3+kOxUeOlmge82wY7PHck4hDn
 zoB8+kVuuAJwx1f4p42AHYgqO8DCtp73FMzEA1lBXhSwMx3wbmb1/4E3xl91Y5ISYboQ57pq+ME
 mFo/0BpstBcG5+SVd/n8vPVTFFjQnCzue6m/KTXCUAXRwkKDprja+rQanRzCIx6f7inIR6i97pF
 Fm6ArJOGThf6H8G3U/GWmhaB5CaHHZxXYtg2NxQC8oFlEdM8exWpUyJM7SbPkD/FUUME4hwdHS5
 f3yTvJE=
X-Google-Smtp-Source: AGHT+IEWCPu+93+2rHmlSJUSCShTSZW5NXY2rvx6S35bgz3OSkiN9RIMowHcRkWsDjFpbQ96aMGwjw==
X-Received: by 2002:a05:6512:2251:b0:545:169b:9b51 with SMTP id
 2adb3069b0e04-54518123291mr684139e87.24.1739347154984; 
 Tue, 11 Feb 2025 23:59:14 -0800 (PST)
Received: from xeon.. ([188.163.112.51]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5441053eacfsm1797880e87.38.2025.02.11.23.59.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2025 23:59:14 -0800 (PST)
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
Subject: [PATCH v1 0/2] mfd: lm3533: convert to use OF
Date: Wed, 12 Feb 2025 09:58:40 +0200
Message-ID: <20250212075845.11338-1-clamor95@gmail.com>
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

Svyatoslav Ryhel (2):
  dt-bindings: mfd: Document TI LM3533 MFD
  mfd: lm3533: convert to use OF

 .../devicetree/bindings/mfd/ti,lm3533.yaml    | 221 ++++++++++++++++++
 drivers/iio/light/lm3533-als.c                |  58 ++++-
 drivers/leds/leds-lm3533.c                    |  69 +++++-
 drivers/mfd/lm3533-core.c                     |  79 +++++--
 drivers/video/backlight/lm3533_bl.c           |  72 +++++-
 include/dt-bindings/mfd/lm3533.h              |  19 ++
 include/linux/mfd/lm3533.h                    |   1 +
 7 files changed, 496 insertions(+), 23 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/ti,lm3533.yaml
 create mode 100644 include/dt-bindings/mfd/lm3533.h

-- 
2.43.0

