Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E22E55EC57
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 20:19:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B8BE1121F7;
	Tue, 28 Jun 2022 18:19:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FC4D10FE11
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 18:19:18 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id ay16so27496925ejb.6
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 11:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fdTohnwzks/gTkxccnd1jT0zw1DHsha+QDW1u2kKkLo=;
 b=bKrEuHKVX/T9khnYufknsufyxTdopR33A0CkGLP1+q3G7YT8eyC5M/+VcqlWvSw90U
 k/kYpAnpRK+yaebdy05geSxHq8E26j946H36BU8KhOHpN3+cMC4kqSaIribgkmIvAPgB
 4kygFDC/FtHjHNQWenWZPEVhecXmtmNmthPnXmiZ+aChe9AOs4j8VFhOVAUN5U33V5ID
 jI/Gs3lX+aU0OzWtvinC9JX/ydSe6N1angKPoxFl3a1YNebY67Kz7XKczh3+gBZXd0pu
 TJTg2M8yP2rI6Ptq7Z+uHT/yx5WCqHw0Q5c3+hhqqCf2G2i55JlFlzinPEL4O8AZOZ0w
 Oq4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fdTohnwzks/gTkxccnd1jT0zw1DHsha+QDW1u2kKkLo=;
 b=UQT0zLU/q+KDBJeci9VFsDLDnWXN4bGMARTLe42YzhOU74MQp7PyYMylsjK3Dg5QH2
 9P2C3U3x14r0solCwx2jeG1DaCmpuKDYOVnw5bqDUq0vdVnbDtruHqVWIHTl7Pd+F2Ov
 boGrgaY2XQdgb5tf+yYfJNekf6OfEHUKURDCmZBt3YKj6zAHz0Cz4vFeHZpmJtikoVXN
 mDo725aRgWC9Z8TqPmdgHTzB5Qnel1PpxZGUE13rFJHzTtMro8RG3uaN1t19jSyY6q3R
 Yw89BDOnkwEIewCa5WX94lx/6XtiLSFWHZ1g4EFrpf9Oqo102elYhdnp7+w+V4ugc8Jk
 PSRQ==
X-Gm-Message-State: AJIora8hF+id5EJLTw+Q7wiyhlWvw2v19E+CjnON/AS95DQwlS6xt1NA
 XeBIUgi4iAReGdhxJA74Yo0=
X-Google-Smtp-Source: AGRyM1tgs9AjAF309iEPltATHnHr46WoxNMazKWNFtHavXP/MUJAmyJwOmaBx8NS1LDuvrmJIV48fw==
X-Received: by 2002:a17:906:8790:b0:722:e812:b26 with SMTP id
 za16-20020a170906879000b00722e8120b26mr20360040ejb.18.1656440356526; 
 Tue, 28 Jun 2022 11:19:16 -0700 (PDT)
Received: from linuxdev2.toradex.int (31-10-206-125.static.upc.ch.
 [31.10.206.125]) by smtp.gmail.com with ESMTPSA id
 r1-20020a17090638c100b007219c20dcd8sm6730824ejd.196.2022.06.28.11.19.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 11:19:15 -0700 (PDT)
From: Max Krummenacher <max.oss.09@gmail.com>
To: max.krummenacher@toradex.com
Subject: [PATCH v3 0/4] drm/panel: simple: add bus-format support for panel-dpi
Date: Tue, 28 Jun 2022 20:18:34 +0200
Message-Id: <20220628181838.2031-1-max.oss.09@gmail.com>
X-Mailer: git-send-email 2.20.1
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
Cc: Marek Vasut <marex@denx.de>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 Nikita Kiryanov <nikita@compulab.co.il>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Max Krummenacher <max.krummenacher@toradex.com>


Commit 4a1d0dbc8332 ("drm/panel: simple: add panel-dpi support") added
support for defining a panel from device tree provided data.

However support for setting the bus format is missing, so that with
the current implementation a 'panel-dpi' panel can only be used
if the driver of the display interface connected can cope with a
missing bus_format.

This patch series defines the new property bus-format and adds it to
the panel-dpi implementation.

Check initial discussions [1] and [2].
[1] https://lore.kernel.org/all/20220201110717.3585-1-cniedermaier@dh-electronics.com/
[2] https://lore.kernel.org/all/20220222084723.14310-1-max.krummenacher@toradex.com/


Changes in v3:
- New commit to allow for additional port node properties
- Changed the V4L number space as suggested by Rob Herring
- Set constraints for bus-format as suggested by Rob Herring, used
  the range reserved for RGB formats.
- Editorial changes as suggested by Rob Herring
- Moved the bus-format property under the port/endpoint node as
  suggested by Rob Herring

Changes in v2:
- Fix errors found by dt_binding_check
- New commit allowing bus-format property for derived startek yaml
- Fix errors found by dt_binding_check

Max Krummenacher (4):
  dt-bindings: display: panel-common: allow for additional port node
    properties
  dt-bindings: display: add new bus-format property for panel-dpi
  dt-bindings: display: startek,startek-kd050c: allow bus-format
    property
  drm/panel: simple: add bus-format support for panel-dpi

 .../bindings/display/panel/panel-common.yaml  |  2 +-
 .../bindings/display/panel/panel-dpi.yaml     | 26 +++++++++-
 .../display/panel/startek,startek-kd050c.yaml |  1 +
 drivers/gpu/drm/panel/panel-simple.c          | 49 +++++++++++++++++++
 .../dt-bindings/display/dt-media-bus-format.h | 23 +++++++++
 5 files changed, 99 insertions(+), 2 deletions(-)
 create mode 100644 include/dt-bindings/display/dt-media-bus-format.h

-- 
2.20.1

