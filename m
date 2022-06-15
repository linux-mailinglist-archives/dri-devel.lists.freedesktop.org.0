Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2817754CF9F
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jun 2022 19:21:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06B141126D4;
	Wed, 15 Jun 2022 17:21:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32D4A1126D4
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 17:21:37 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 y13-20020a17090a154d00b001eaaa3b9b8dso2667300pja.2
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 10:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Jat6dhLeZ479iY01jqnpJJmmx4iBaVyzdt75yCacVFk=;
 b=CTbzYX0mU8x2G9wYTMN9/+ShQbDWPSZUnKSQz3p2zDl0GSxC2zDIeyICJCqxABHmko
 ozexhom+4LY52Rh9URh2HyhEshSaEGxvQ34y2s1se4BY2i8/P4dJIiDiLZQtC1VyxwBN
 gtaeXosMTsknyWQbF3qa6DUok2hckCaeupNgQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Jat6dhLeZ479iY01jqnpJJmmx4iBaVyzdt75yCacVFk=;
 b=620oWLcoDpwycVAC4fPanj3mKVte+6fXl0dNYQa5sbsCMu8SPWeIq+aWEKOo+VZ9gY
 NvYGHuDJwvqjcx9SF8tUzESkkCKaeUbZbudXVqix99pmRQQjl6V3ytxwHOV8sOb9VQnf
 gVYwwtcttipG/iL4l80OXlh7poPLrzXhGMgMrd3WN8CYiTJLTc8efMEb7p1ThVzxJrxT
 fy5id7sdk65q0ARoY+3wa2MHZwAG+nMqhEptlzEuYwtNwzRpw1uYvJ+mTi6lRCctKUx7
 +V+Gqw2L4EMQMBPLMDI1DxEns8w8LL5bTYud0S9Occu7PgwgTl5Xoqvw68Wh7Am0Fmh1
 33Sg==
X-Gm-Message-State: AJIora8ti1g7OzEstxmloUbRswT3KSuJOkf37tnb5hgjZ+AKQCwWJJiS
 VxBANFds7y8I9J29wjuyKV95VA==
X-Google-Smtp-Source: AGRyM1v2ffJyyex2Z1SWcnGwQyabjiyjeoPNbV28pRh16ZNt3vcd1Ou9LkSTonhyJ2StUVemfyv4hg==
X-Received: by 2002:a17:902:9307:b0:166:41a8:abc0 with SMTP id
 bc7-20020a170902930700b0016641a8abc0mr638722plb.135.1655313696754; 
 Wed, 15 Jun 2022 10:21:36 -0700 (PDT)
Received: from pmalani.c.googlers.com.com
 (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
 by smtp.gmail.com with ESMTPSA id
 d10-20020aa7814a000000b005103abd2fdbsm10147433pfn.206.2022.06.15.10.21.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jun 2022 10:21:36 -0700 (PDT)
From: Prashant Malani <pmalani@chromium.org>
To: linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v4 0/7] usb: typec: Introduce typec-switch binding
Date: Wed, 15 Jun 2022 17:20:16 +0000
Message-Id: <20220615172129.1314056-1-pmalani@chromium.org>
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

v3: https://lore.kernel.org/linux-usb/20220614193558.1163205-1-pmalani@chromium.org/

Changes since v3:
- Some more modifications to the anx7625 binding patch (4/7).
- Picked up 1 more Reviewed-by tag.

Pin-Yen Lin (1):
  drm/bridge: anx7625: Add typec_mux_set callback function

Prashant Malani (6):
  usb: typec: mux: Allow muxes to specify mode-switch
  usb: typec: mux: Add CONFIG guards for functions
  dt-bindings: usb: Add Type-C switch binding
  dt-bindings: drm/bridge: anx7625: Add mode-switch support
  drm/bridge: anx7625: Register number of Type C switches
  drm/bridge: anx7625: Register Type-C mode switches

 .../display/bridge/analogix,anx7625.yaml      |  64 ++++++++
 .../devicetree/bindings/usb/typec-switch.yaml |  74 +++++++++
 drivers/gpu/drm/bridge/analogix/anx7625.c     | 148 ++++++++++++++++++
 drivers/gpu/drm/bridge/analogix/anx7625.h     |  20 +++
 drivers/usb/typec/mux.c                       |   8 +-
 include/linux/usb/typec_mux.h                 |  44 +++++-
 6 files changed, 350 insertions(+), 8 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/typec-switch.yaml

-- 
2.36.1.476.g0c4daa206d-goog

