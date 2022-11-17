Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BAD262EA5A
	for <lists+dri-devel@lfdr.de>; Fri, 18 Nov 2022 01:33:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E96D10E6CC;
	Fri, 18 Nov 2022 00:33:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22ACA10E590
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 08:47:53 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id z18so1521375edb.9
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 00:47:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:message-id:date:from:content-transfer-encoding:mime-version
 :subject:from:to:cc:subject:date:message-id:reply-to;
 bh=5sycVuNTi+/lWP5w5Y+7Py7HL44YtQg/RIL/+2UUkSY=;
 b=LerjEkGDet8twDf7kawTGEK6yjpahMcCxhAgmIj+Uhp5Y2ToZA2vL105irqZLSsKfU
 c+LQ37p+1ejyh2oDDCwlx+71iys9g+yYbxQOSVTdRIPpMZKMebD3L6vbY7xvoYTj2ysA
 dA+1tq50hVlm9jtGhn6ygV7yQvatY5f62oJr0EllmSAhG1qR9mcE7PHFmrOHZLF2HrTe
 NXS/KTJ2K6dBfbV5Zar4Nm8GSb5Ol6M2VVfam7vqizfUetbz5uvxzdbINt9a3yc7z/yl
 RJqyEWRb93Q8tblau3bK9Yl/7ROUCkYlh+IeZDpHfHy3HSWP8vcLEJ/nu4cLNNs3gNDH
 K6HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:message-id:date:from:content-transfer-encoding:mime-version
 :subject:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5sycVuNTi+/lWP5w5Y+7Py7HL44YtQg/RIL/+2UUkSY=;
 b=UspWwLqM4Yf8Bv4Hh9XiTICXgE2OztCOy0vL0MxK4mfxh3Fpf3CxtH6BLGBDXHSbnl
 VYniufxUShPAx0gvM2DXEWmhOHupOREJmrGJNeIU+0RzvUbiQL+xOQFj5eVSNf3k5tPV
 9BNlmkb0qCcuN2l4bTgnfBZYDQ1rHmGfWyc9KTCKV+6fUq/gulmPWX5hw6ssAeroLCBg
 8+VRlhAQRmKp35x5i6QMaP1Ko3oY0GimvwiLxgYELyqmYlCsAPwW9rh7nyEFnnqi14eK
 31papbWPPiCZLaCCaMAheFDBzO6kV0LjP9vgCGSBmGYVAHbxPE2+0m8PabjMfEKV2kuP
 APeQ==
X-Gm-Message-State: ANoB5pkg5kCBLKR0/k7mo/NQwu1wgDfS7OhFpBrLYuqujDmWYkGl88kB
 WTHV2Ooupr1gDZmXmyL/lWff2w==
X-Google-Smtp-Source: AA0mqf7JP9+5lVRU9EXpUjP4FKM/FMDReRATO9BwVt89A/oOf+IKkEbT+OEv6hzjSAn10BUJHykrPQ==
X-Received: by 2002:a05:6402:3895:b0:468:15f1:54b5 with SMTP id
 fd21-20020a056402389500b0046815f154b5mr1306318edb.8.1668674871621; 
 Thu, 17 Nov 2022 00:47:51 -0800 (PST)
Received: from [127.0.1.1] ([2a0e:41a:894f:0:7a60:27eb:954c:5ab1])
 by smtp.gmail.com with ESMTPSA id
 s22-20020a1709067b9600b0077205dd15basm77332ejo.66.2022.11.17.00.47.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Nov 2022 00:47:51 -0800 (PST)
Subject: [PATCH 0/3] Fix SPICC and ILI9486 drivers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-b4-tracking: H4sIACr1dWMC/w3LSQqAMAwAwK9IzhZMXVA/I11SDZQqDYpQ/Ls9zmEKCGUmgbUpkOlh4TNVYNuAO0
 zaSbGvBt1pjYiTkqUb300u3jjyMsyTMuTHIYTeWY1QnzVCymaT3FFnumP8vh/jeo0xaAAAAA==
From: Carlo Caione <ccaione@baylibre.com>
Date: Thu, 17 Nov 2022 09:47:38 +0100
Message-Id: <20221116-s905x_spi_ili9486-v1-0-630401cb62d5@baylibre.com>
To: Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
 Mark Brown <broonie@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>, David Airlie <airlied@gmail.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.10.1
X-Mailman-Approved-At: Fri, 18 Nov 2022 00:32:52 +0000
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
Cc: Carlo Caione <ccaione@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-spi@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patchset is trying to fix problems seen on S905X boards when interfacing
with an ILI9486 equipped SPI panel.

The color corruption and the performance issues are actually due to two
different problems in the SPICC driver and in the ILI9486 tiny DRM driver.

We try to fix both in the same patcheset to be able to correctly use the SPI
panel again.

To: Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
To: David Airlie <airlied@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
To: Mark Brown <broonie@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-spi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-amlogic@lists.infradead.org
Signed-off-by: Carlo Caione <ccaione@baylibre.com>

---
Carlo Caione (3):
      drm/tiny: rpi-lcd-35: Enable driver module autoloading
      drm/tiny: ili9486: Do not assume 8-bit only SPI controllers
      spi: meson-spicc: Lower CS between bursts

 drivers/gpu/drm/tiny/ili9486.c | 14 ++++++++++----
 drivers/spi/spi-meson-spicc.c  |  6 ++++++
 2 files changed, 16 insertions(+), 4 deletions(-)
---
base-commit: 15f3bff12cf6a888ec2ad39652828c60e6836b3d
change-id: 20221116-s905x_spi_ili9486-aed54ff3cb21

Best regards,
-- 
Carlo Caione

