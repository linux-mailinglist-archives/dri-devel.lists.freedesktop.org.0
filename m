Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B3054BAA1
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jun 2022 21:37:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BBFC112C43;
	Tue, 14 Jun 2022 19:37:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C519112C46
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 19:37:24 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id
 t3-20020a17090a510300b001ea87ef9a3dso9995112pjh.4
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 12:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=erLQaoKxuSkbFQJCjbArAz2RxzePc18ZCmvI1Acodfc=;
 b=gwIcxv2ZkrWiyyqqxUQ7BYU2iMzh2Uu7SS53hpOqXO+sktoOoE+UkDlBhB8ZJwsSUB
 mkBhtWeYa2JVH/gboOnzRM4Q0vII1mtJB4WecYIkN2OiabC2GFxNm4XwnizW10A/7z5i
 jKgh688hQYwK43Eqf4vfvqcdJ74D4OUggEpk8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=erLQaoKxuSkbFQJCjbArAz2RxzePc18ZCmvI1Acodfc=;
 b=5T+Y2ca1ZvIieknstseJgvlTNuHCVrTK4EI2TAAO8LtzsLHatboKW5XdgbXhdYux8J
 4+2We8opvh74NjO45DY7cZho/NoZCQR0KwCO4PyjK6gxj+HcP6k0U4wpOpMJ9O88RoXq
 ObAopUNDPU9OvUcCQco4ortBe2H4ctDUW2FWj6FjCzbzboiZXSvsAXYl6mymvFB5KB5S
 S40mgaLHi7JYT3SC/CovLI8dthriHzJGQcGY/riZMR9AOBTEJ5+71E/FhLU3HQLXJn1c
 gj2laRfGj3cEauIo/+HBaraivXPXEX5GHAoSZ+fe5wo3dMkk9Or5MBaRC+zYIW9yTIts
 pS2w==
X-Gm-Message-State: AJIora8Gv9IMqWrB+X7Sc+f/PMvce8lSAUyIBWfuqkeIqoiNMRMjqOuU
 Eee4+kLtS+j5KtwNIVpDhyXBDA==
X-Google-Smtp-Source: AGRyM1ukACZsX6LKO6byQRo8pQtL1aqEYoysh1VxyBeJSKBmpasYdaf/LeSYWsTIrWoKhqaEP7m2Mw==
X-Received: by 2002:a17:902:ef8f:b0:163:d61b:ec98 with SMTP id
 iz15-20020a170902ef8f00b00163d61bec98mr5759584plb.111.1655235444069; 
 Tue, 14 Jun 2022 12:37:24 -0700 (PDT)
Received: from pmalani.c.googlers.com.com
 (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
 by smtp.gmail.com with ESMTPSA id
 l21-20020a17090a409500b001df3a251cc2sm10014426pjg.4.2022.06.14.12.37.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jun 2022 12:37:23 -0700 (PDT)
From: Prashant Malani <pmalani@chromium.org>
To: linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v3 0/7] usb: typec: Introduce typec-switch binding
Date: Tue, 14 Jun 2022 19:34:34 +0000
Message-Id: <20220614193558.1163205-1-pmalani@chromium.org>
X-Mailer: git-send-email 2.36.1.476.g0c4daa206d-goog
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
Cc: heikki.krogerus@linux.intel.com,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>, Jonas Karlman <jonas@kwiboo.se>,
 swboyd@chromium.org, Pin-Yen Lin <treapking@chromium.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Ripard <maxime@cerno.tech>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Xin Ji <xji@analogixsemi.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Robert Foss <robert.foss@linaro.org>, Prashant Malani <pmalani@chromium.org>,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series introduces a binding for Type-C data lane switches. These
control the routing and operating modes of USB Type-C data lanes based
on the PD messaging from the Type-C port driver regarding connected
peripherals.

The first patch introduces a change to the Type-C mux class mode-switch
matching code, while the second adds a config guard to a Type-C header.
The next couple of patches introduce the new "typec-switch" binding as
well as one user of it (the ANX7625 drm bridge).

The remaining patches add functionality to the anx7625 driver to
register the mode-switches, as well as program its crosspoint
switch depending on which Type-C port has a DisplayPort (DP) peripheral
connected to it.

v2: https://lore.kernel.org/linux-usb/20220609181106.3695103-1-pmalani@chromium.org/

Changes since v2:
- Addressed review comments in typec_mux.h
- Changed error print to only print when a device is actually listed in
  DT.
- Moved num_typec_switches check to beginning of function.
- Picked up Reviewed-by and Tested-by tags from v2.

Pin-Yen Lin (1):
  drm/bridge: anx7625: Add typec_mux_set callback function

Prashant Malani (6):
  usb: typec: mux: Allow muxes to specify mode-switch
  usb: typec: mux: Add CONFIG guards for functions
  dt-bindings: usb: Add Type-C switch binding
  dt-bindings: drm/bridge: anx7625: Add mode-switch support
  drm/bridge: anx7625: Register number of Type C switches
  drm/bridge: anx7625: Register Type-C mode switches

 .../display/bridge/analogix,anx7625.yaml      |  63 ++++++++
 .../devicetree/bindings/usb/typec-switch.yaml |  74 +++++++++
 drivers/gpu/drm/bridge/analogix/anx7625.c     | 148 ++++++++++++++++++
 drivers/gpu/drm/bridge/analogix/anx7625.h     |  20 +++
 drivers/usb/typec/mux.c                       |   8 +-
 include/linux/usb/typec_mux.h                 |  44 +++++-
 6 files changed, 349 insertions(+), 8 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/typec-switch.yaml

-- 
2.36.1.476.g0c4daa206d-goog

