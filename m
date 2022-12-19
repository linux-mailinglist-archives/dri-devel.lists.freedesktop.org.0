Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A75651EFF
	for <lists+dri-devel@lfdr.de>; Tue, 20 Dec 2022 11:40:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C0AE10E37F;
	Tue, 20 Dec 2022 10:39:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F8CA10E1F9
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Dec 2022 09:02:50 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id t17so19909148eju.1
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Dec 2022 01:02:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:message-id:date:from:content-transfer-encoding:mime-version
 :subject:from:to:cc:subject:date:message-id:reply-to;
 bh=5Rp4mcTJSZ+/bNcPxaj4q2SCzytDdxI+ZDZbCvWyFwY=;
 b=09YmwOcYRbx0IIV+b93s54Yvmrx1RvOGfAmKImQ2A/9Y9uEMozIwEZ73kTiEL6gOsr
 R+5I9ZMMdtIE2EHTkvZ98ZKAXzAnmLhE5HLe2W6VOeTVJvzbB4g7THrCBetDAQxbwqA3
 VD+clHbGbFn/QUQH/BGEoqvx5KiWspJ10iW/0sEKFSl8Dggj8fA0CanPQwpvqG5Kv9bj
 UmCxq0JAjE9jSz4L2dgJmeJBHFvBpIjJQnmw4+PC24qDd4uDYVd/wkcNQ+tzbYQ+gmGd
 pjCduMu43mJoND3I8qx2KFffmtuHlZQx1RnjJThCAEpZxT1478sMVJGKf03ChT4d5USr
 ayaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:message-id:date:from:content-transfer-encoding:mime-version
 :subject:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5Rp4mcTJSZ+/bNcPxaj4q2SCzytDdxI+ZDZbCvWyFwY=;
 b=krcnAUPL2esfEMcHE8sBhSVwi8/7QSiqWzGjBIop/O+YWas7tS7mOeJLxZ97j3LF6J
 yRXhdIX4M8GVunKrsBQobguVSPdW70rtPAnPK7dK/Q+kWAVHQ2FScdCDPtEkPozRXNgz
 W0dGdZkYGTGvOxB95C2Z5yqP0D/c2+nhCZGPHGjK2U5cuQTN6DL5agRzGTegl8Oh8PNr
 oIovOeMrxa8B0ArgwYMQBKidpWxNFtV+30vgm8kPtnFPU4g/Ixv2mXWJEJhVGyca7++n
 E+pkPUmi3ev8DGnuW7t3Xup6FnwIEu/AqUzgA21z0NLsM9b2E27k3f2h4MGrcZpzYTuX
 RttQ==
X-Gm-Message-State: AFqh2kpD3AHNabuHv/OjIqSgQXqJidKsqkvftectaZNXRvvYHz65WKjr
 s3x1bq/i0VUkXwqgsjz7X3bJ0zrJU8xPCPy3yU0=
X-Google-Smtp-Source: AMrXdXv7I5y8yp20tcxCivFoH9Pn3z0juo2iGDbm9DR06XD8zFMsm1DX233OMYOQg7Tap8wcTTqw0g==
X-Received: by 2002:a17:906:cb9a:b0:7d3:8159:f35d with SMTP id
 mf26-20020a170906cb9a00b007d38159f35dmr14327985ejb.9.1671440568517; 
 Mon, 19 Dec 2022 01:02:48 -0800 (PST)
Received: from [127.0.1.1] ([2001:b07:5d39:f336:a0ba:cfa5:2107:c2c4])
 by smtp.gmail.com with ESMTPSA id
 u11-20020a170906b10b00b00781dbdb292asm4082721ejy.155.2022.12.19.01.02.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Dec 2022 01:02:48 -0800 (PST)
Subject: [PATCH v4 0/2] Make ILI9486 driver working with 16-bits SPI
 controllers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-b4-tracking: H4sIAKwooGMC/4XNTQrCMBAF4KtI1kbyT+vKe4hIMp3agdpKokUpvbuDSxG7Gt6D980sCmbCIvabWW
 ScqNA4cHDbjYAuDheU1HAWRhmjtQ6y1Mo/z+VGZ+qpdlWQERvv2tZCMlrwLsWCMuU4QMfL4dH3XHZU
 7mN+ff5Mms/xHzlpqWSwyikNKZjGH1J89ZQy7mC8ihODk1lFDCOqchDQQlNb9QOxq4hlxNcQkq8gtW
 i/kGVZ3hwls9dEAQAA
From: Carlo Caione <ccaione@baylibre.com>
Date: Mon, 19 Dec 2022 10:02:36 +0100
Message-Id: <20221116-s905x_spi_ili9486-v4-0-f86b4463b9e4@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Mark Brown <broonie@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
X-Mailer: b4 0.10.1
X-Mailman-Approved-At: Tue, 20 Dec 2022 10:39:50 +0000
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
Cc: linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Carlo Caione <ccaione@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patchset is trying to fix problems seen on S905X boards when interfacing
with an ILI9486 equipped SPI panel.

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
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-amlogic@lists.infradead.org
Signed-off-by: Carlo Caione <ccaione@baylibre.com>

---
Changes in v4:
- Removed NAK-ed patch from patchset
- Link to v3: https://lore.kernel.org/r/20221116-s905x_spi_ili9486-v3-0-59c6b58cbfe3@baylibre.com

Changes in v3:
- Added trailers
- Added new patch to use drm_aperture_remove_framebuffers()
- Link to v2: https://lore.kernel.org/r/20221116-s905x_spi_ili9486-v2-0-084c6e3cd930@baylibre.com

Changes in v2:
- Removed SPICC patch
- Reworked commit message
- Link to v1: https://lore.kernel.org/r/20221116-s905x_spi_ili9486-v1-0-630401cb62d5@baylibre.com

---
Carlo Caione (2):
      drm/tiny: ili9486: Enable driver module autoloading
      drm/tiny: ili9486: Do not assume 8-bit only SPI controllers

 drivers/gpu/drm/tiny/ili9486.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)
---
base-commit: 84e57d292203a45c96dbcb2e6be9dd80961d981a
change-id: 20221116-s905x_spi_ili9486-aed54ff3cb21

Best regards,
-- 
Carlo Caione

