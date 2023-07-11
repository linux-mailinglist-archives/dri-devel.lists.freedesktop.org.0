Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5484B74F3A6
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 17:36:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4B3210E3C7;
	Tue, 11 Jul 2023 15:36:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8155D10E3C7
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 15:36:46 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3fb4146e8ceso61541695e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 08:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1689089804; x=1691681804; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8ZhsmjYq3QjlwNHWIt4GGjxBOJJNeRrC5x7e3BBvxJY=;
 b=F96F2sEJ06nYUYyN/zyNQaw/pCUKMgCuLABXL817tYt88ibRnJPBMiY09enxC3XWrn
 I/kPoyrW30PE3dKPsAzlOyrqYHz+JyQLFs81bRb8ENp7xq6PoFEiJADIAXoeBEGy8xUy
 o3olorhn/tOdh9Ms3JmoJFZ+5u9h0dMpSnlmGvmQUkyZs7EWCl0Gjohro230l963goXx
 W/kVZwDkMoleduYSUTxenbIng1+0xGKEItEh4HSY2PjqqYVqtwfqmGNWFSuZG0+WxiOX
 slmX5CscYscYP0xaSVYLz3G9cvdF48sU3F/vW/fhbSWDfhAKSz2uGBkcTNzz6RvCUZPG
 SKQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689089804; x=1691681804;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8ZhsmjYq3QjlwNHWIt4GGjxBOJJNeRrC5x7e3BBvxJY=;
 b=CD351kXx31wsFKquYIPRUGFlvxGpZJklYKf39ATJspYuQpHxjIh9WT9lwSuvSUBQhc
 lUyeaHELp6JDyu+Yoqrtq71lKwwu2BiH6Ynz6EataJj041uPzzbWLMztK1QYrwAE6Vyu
 +IrmkVVDNb9YiCGWY8f6Cimd14aLjTVIP0RQxIN4oq1x1aYYrKQYeVb8DByHzO29Bojf
 Q8h5SWDc/ch+vMDSTxl8mq2q3IrD27DiHahs6kOW7CJyMCaPrJoOy8P2K1u/CyxYCmDO
 DeIV9tI8eyipjpulOhjvwZP12I/i3bReq3y2m/dwPEylST+sfXvYkCq64CGF9SKvHBYG
 mVdg==
X-Gm-Message-State: ABy/qLZrWtdt0PfGtO8uzkY5MyEcKu5R5fsbltRMP339pSwsP9ogtm/H
 u5Z55NYlf1R8yuPnkPaRxTvzuA==
X-Google-Smtp-Source: APBJJlGZ9q49T7kmNKB1c37rwITt5wN6ld5+e/7kQyfM4bvBhWm7eitmkW7SIN6+Kw+F/jP/uPTfqQ==
X-Received: by 2002:a7b:c019:0:b0:3f7:f584:579b with SMTP id
 c25-20020a7bc019000000b003f7f584579bmr13703893wmb.9.1689089804070; 
 Tue, 11 Jul 2023 08:36:44 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 v6-20020a05600c444600b003fbb1ce274fsm23458249wmn.0.2023.07.11.08.36.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jul 2023 08:36:43 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Subject: [PATCH 0/3] Add startek-kd070fhfid015 display support
Date: Tue, 11 Jul 2023 17:36:26 +0200
Message-Id: <20230711-startek_display-v1-0-163917bed385@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPp2rWQC/x2N0QqDMAwAf0XyvILt0Dl/ZYyR2qhhpUrixob47
 wt7vIPjdlASJoW+2kHozcpLMfCnCoYZy0SOkzGEOpzri/dON5SNno/Eumb8umvTpdA2YxsRwaq
 ISi4KlmG2rrxyNrkKjfz5b2734/gBYFObAHYAAAA=
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1608; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=zxoNkkhxg+qIZpTjwjGcbJbbjcuZjCmWKqPfmbpNbvo=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkrXcK9p5lesXkclNpI2GO8vx9IXvx9+574xhKLYKi
 wSF834OJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZK13CgAKCRArRkmdfjHURSg/EA
 Crxlkf0UGRqKF5KavZ7sr4JCyLFmB/5GQogqNk3v1vhrz35svHdt13bVypxZmp+YRh/JN4IG7dGEpE
 +kkYjBrJ35C7lyQjZDrMM2ZQWkA3bH3ugOz8r2fPGaf3AjoPZbT6D7U85m1BG9cq3LJ5tPSlMY/1PE
 E8UY1ZSiHRy8CFoFyaaFdA0+d78z7dfkDhHvsIu0O57coedYThVQxi+f39jZXse2P4xEiqj3DsWWK8
 GesIGWeCKs2agEQzNDmup33oHhkbgAxAuZMb6XwnqKUXceLytNRE7/hpaF1M0HRXuwrxCzpf6XXQLr
 Y9erzL+UMvkksoL9FZvF1ONohW0oXXH4/FMs7RvfEGB9yh17x/0EevYyOi7ZKnnGFhaAsQcxL1Gim5
 rCg9P0rCLLFrAehiP3rjACy6G4Hm7GQTkhmMW+IrDOumZ0cO39q5g8jfk9jglUQjIYX0AzUOT5rci7
 gEYLqD4oaWo+8ZRoE72G6Vf6SEnLx+JSZAkikVC13hZAXyAaBZ3VSYv6jiK4mJ2co+tfROudLoCr1J
 OIXqYsdLjNcTsEYT8MYrvGM7SjIHe54i7hLjX/f6YJaFBACtnEIRXrqGNfZjfebbB3QnC2nzq8Lz0s
 Ft4dhdH9i+G+RKLj5+2tP6AgB9zZWlD1It9wKr7or2xNvAo4RmMzrYxvSGRg==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
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
Cc: devicetree@vger.kernel.org, Alexandre Mergnat <amergnat@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Guillaume La Roque <glaroque@baylibre.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add the support of the Startek KD070FHFID015 panel.
It's a 7-inch TFT LCD display with a resolution of 1024 x 600 pixels.

This serie come from a bigger one [1]. Then I addressed the previous
comments for the related commits here.

Changes in v1:
- Fix typos in the driver.
- Merge 2 regulators in one bulk variable in the driver.
- Remove backlight enable/disable from the driver because it's already
  managed by the backlight core.
- Move hardcoded values from function to the generic structure in the
  driver.
- Remove unnecessary function (stk_panel_del).
- Replace some functions by macro to increase the readability.
- Link to parent serie: [1]

[1]: https://lore.kernel.org/all/20230220-display-v1-0-45cbc68e188b@baylibre.com/

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
Alexandre Mergnat (2):
      dt-bindings: display: panel: add startek kd070fhfid015 support
      arm64: defconfig: enable STARTEK KD070FHFID015 panel

Guillaume La Roque (1):
      drm/panel: Support for startek-kd070fhfid015 MIPI-DSI panel

 .../display/panel/startek,kd070fhfid015.yaml       |  51 +++
 arch/arm64/configs/defconfig                       |   1 +
 drivers/gpu/drm/panel/Kconfig                      |  11 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 .../gpu/drm/panel/panel-startek-kd070fhfid015.c    | 434 +++++++++++++++++++++
 5 files changed, 498 insertions(+)
---
base-commit: 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5
change-id: 20230711-startek_display-958d265f6baa

Best regards,
-- 
Alexandre Mergnat <amergnat@baylibre.com>

