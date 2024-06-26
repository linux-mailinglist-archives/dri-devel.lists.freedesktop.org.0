Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7559183DD
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 16:22:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60A4310E8D9;
	Wed, 26 Jun 2024 14:22:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="zuFq3Q+B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01C5F10E8D4
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 14:22:32 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-2ebec2f11b7so75346561fa.2
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 07:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1719411750; x=1720016550;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=W7iH3JSmiJaSnX32RaYcorOWmDrnkufENWf0l16tdfQ=;
 b=zuFq3Q+BPMNz9PRkZMKpLrfEnHHo/4R2SPlzmkqGhwJV42EU3txyVt/EgvaOHBQl5Y
 7BpG2ejIX4hHVHLfGpfVrHVFNclQk+M09SgR0zKHk8jn67z0oj4g+gVHyeTYDfTC6TRC
 Sth5Vmw4eSwIucj6+8s6H+wtex1ndsRlRg1pXQvtp64F1pXlZgexLzJ9AF4bCknt3Tgt
 n3A1b0I6OiKrnD0raSUCc54+i3FhGBdp1TQkKTieAVy68Ipqf3wQghZL0mbuSKsOdAMu
 F4hZcM0DC4EjIEqqn803P/TiSbkVSHb+WUOm3arDkkQ+A0fj2ZqUQnhnvHA92kqxM9rD
 mUmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719411750; x=1720016550;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=W7iH3JSmiJaSnX32RaYcorOWmDrnkufENWf0l16tdfQ=;
 b=smkG9d1byAP50FZ7z5miKADbHlF6WehSnyRtjEEdTMG+VpaoO6Nh21U6h9gI0FEmgx
 CEApfM+OZy8ZadVxIsyeg63nSHswOdHMiOS6dhJyJcNBckYbUjAskRuV3pybBamAzBFT
 HpO8kdEcLn5Ep9S6pPiGzvCZT15ZThisveac4gKR/NVGVptd4EeTzXjZg0DL5opqf2x2
 jzZDGUjOkWw5kyY4g7nG4jJ8/EE79lPkAgqAJWYFostCY06WuDToPB722mx6HDuU2wNp
 LyLTbdIiw0E7WXS2ezyWwu98Oqw4lfkxCjTbyiyUkNjGq/0l38OZrSPxkczQueJIkOiu
 Pk2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXf+VqKFyTwDhCiiWiKaZrRn68JlCj/N6Z7nHKTgUUU3rqNwyEx2VjwKLpaB5qhaBqAK0oSMv5n8m3b4k1okEk3VNROEDikvi3lpoEPDb+2
X-Gm-Message-State: AOJu0Yynv1grWmV/IdgAOVPLgBYJmNazZWNZM0gpBJW6p1twBJGI1/Dp
 bmGY6+Y4rSSMRkyFPFobzFVfJ4BXTDUVUdhmuBERvEky/DktgB0VG43aGy2KMoM=
X-Google-Smtp-Source: AGHT+IHetDfsyqoRDtAkMQd5EyaDyXrcIZOcAmh59cPqxsnGl3jMLCu9/rXhsZFogKqN/Bv732PNYg==
X-Received: by 2002:a2e:8416:0:b0:2ea:8308:841e with SMTP id
 38308e7fff4ca-2ec5b345df8mr57301091fa.24.1719411750430; 
 Wed, 26 Jun 2024 07:22:30 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:7be7:aef1:af9e:fff6])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-424c823c28asm27141105e9.5.2024.06.26.07.22.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jun 2024 07:22:30 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2 0/3] drm: panel: add support lincolntech LCD197 panel
Date: Wed, 26 Jun 2024 16:22:06 +0200
Message-ID: <20240626142212.1341556-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
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

This patchset adds support for the Lincolntech LCD197 1080x1920 DSI panel.

Changes since v1 [1]:
 * Rebased on drm-misc-next
 * Drop vendor prefix change (lincolntech recently added)
 * Use mipi_dsi_dcs_*multi()
 * Drop the shutdown callback
 * Insert mipi_dsi_usleep_range() for _multi usage as suggested.
 * Downcase hexadecimal values

[1]: https://lore.kernel.org/lkml/20240625142552.1000988-1-jbrunet@baylibre.com

Jerome Brunet (3):
  dt-bindings: panel-simple-dsi: add lincoln LCD197 panel bindings
  drm/mipi-dsi: add mipi_dsi_usleep_range helper
  drm/panel: add lincolntech lcd197 support

 .../display/panel/panel-simple-dsi.yaml       |   2 +
 drivers/gpu/drm/panel/Kconfig                 |  11 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../gpu/drm/panel/panel-lincolntech-lcd197.c  | 262 ++++++++++++++++++
 include/drm/drm_mipi_dsi.h                    |   7 +
 5 files changed, 283 insertions(+)
 create mode 100644 drivers/gpu/drm/panel/panel-lincolntech-lcd197.c

-- 
2.43.0

