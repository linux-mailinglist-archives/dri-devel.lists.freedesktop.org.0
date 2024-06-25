Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D40916AF6
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2024 16:50:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7D0110E692;
	Tue, 25 Jun 2024 14:50:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="rYMA+YvG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5BB210E692
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 14:50:33 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-a6265d3ba8fso629061666b.0
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 07:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1719327032; x=1719931832;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lX3TM1Fki2eEB6hMLemhPlhYp9SkoeIi5lujOC+FPr0=;
 b=rYMA+YvGvX4t92QIbgD96Ie2tE7M3BnqqGKZI9GnttKIRYa2CBVMFwxCrc1BsUG8Re
 WJwuIEnyHH9nkXFQrRTQWX2odilwZCu+5XF9VmLCkqGL/Y6ToI0pgvD8EJg4pnEflNHS
 Cgila0K4+ppPeMrPtoK8qzeinHjJWYHHMDqLGJb72BE55yIPbbWA2rMomcjbJjno4o5n
 BjZQBwJ2qoQ0pTme5tGtz1eZU+dAx709GOGrTTIxUSRdltrrJTkIpu+gEVE6pz4WqMVT
 KlRbXtW4pH/J94R5L1Ws53qArqk2hYHMWsey/cgYCwSqqJJbb1+ZGO+HWhDunZixU83b
 dZlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719327032; x=1719931832;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lX3TM1Fki2eEB6hMLemhPlhYp9SkoeIi5lujOC+FPr0=;
 b=UhyehYG6OXkfPsLKInBIDp0Xo0+Sm/IGhxCMHTJy6rMRPav5JlUIwKpV6u/4vitwxr
 lsoycGF1gj0c/qDFCDm5pgaJ+jVByAug949n7uJeWGM+kRj996T9NOL0rVtkneuCCvsY
 cWb6GtX6WI0CHvnN239aoflU4m2Aefzt5V3qxghtDqVxXQnO/VQQYRp6TmwR23Z6nzWr
 ZO1PlCRDCBdgkXTwpj9yKDHj4CavCD4W10gHBFgiMsF9BsKzwh5vAdwGFr5GNBKjNCFC
 jFB5Gei3vZjRdZUKZzr/Hz2SPKVGz7HVfle1Iv6C1jvPSBZNJhLLfYluZ/1XPx7z4nTF
 8H/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUv2QFcypGBFakzuIfA2Xz98X3U/pOKwp1j6aeq0CUaOr6UgtvTGKwsciS1eRAmy/zJNd3BdhJTO0upU/0BlAB2k6g7FjonGFboHcOauj7o
X-Gm-Message-State: AOJu0YxbzeANIjfG2SeJupyTUBoA5usYnlwR+myi6tdasA4xzXsIuZeL
 QU7cLLiOnOwfebemX4JFC8UP3NQlRmQrxHoUme4tUn85xSIAg6G0QNs+RGq2+y0=
X-Google-Smtp-Source: AGHT+IFUUy+Ij+z9priiZtm1Z/MbuNV3/WMHqNwFfXw0FhxS9uRT69YZDNrxaFymHUjd4zBdIJFR/Q==
X-Received: by 2002:a17:907:8dcb:b0:a6f:718f:39b6 with SMTP id
 a640c23a62f3a-a7242c9c190mr463024766b.25.1719327032066; 
 Tue, 25 Jun 2024 07:50:32 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:b30c:4c5e:f49e:ab33])
 by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-a724162f037sm355945066b.194.2024.06.25.07.50.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jun 2024 07:50:31 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org
Subject: [PATCH 0/2] arm64: dts: amlogic: add power domain to hdmitx
Date: Tue, 25 Jun 2024 16:50:13 +0200
Message-ID: <20240625145017.1003346-1-jbrunet@baylibre.com>
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

This patchset add the bindings for the power domain of the HDMI Tx
on Amlogic SoC.

This is a 1st step in cleaning HDMI Tx and its direct usage of HHI
register space. Eventually, this will help remove component usage from
the Amlogic display drivers.

Jerome Brunet (2):
  dt-bindings: display: meson-dw-hdmi: add missing power-domain
  arm64: dts: amlogic: add power domain to hdmitx

 .../devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml   | 5 +++++
 arch/arm64/boot/dts/amlogic/meson-g12.dtsi                   | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi                  | 1 +
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi                   | 1 +
 arch/arm64/boot/dts/amlogic/meson-sm1.dtsi                   | 4 ++++
 5 files changed, 15 insertions(+)

-- 
2.43.0

