Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 231BD5453C3
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jun 2022 20:11:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A11C12B5BB;
	Thu,  9 Jun 2022 18:11:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F05EE12B5C1
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jun 2022 18:11:37 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 hv24-20020a17090ae41800b001e33eebdb5dso2087279pjb.0
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jun 2022 11:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=B5EoYi45ZBUgcYzH5QmcJabRI+K9dAvb3lNExbNzDTc=;
 b=IRBv/Csm/7toLZfIoXEPX0E45ay4Enl4+enzXX7DKTkX5nUg1cRxZOi2qv4NePVtAg
 VoHy+EUE1WpiNMTX9FhRf/mrnjfYQPaESFmpZVcbJGR4OGpEFAlKDDengyMyRxJYaCqe
 7Zb9IVzTdblW1xpdWU5oA4UNZms7szwAcKGXQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=B5EoYi45ZBUgcYzH5QmcJabRI+K9dAvb3lNExbNzDTc=;
 b=m8y0u/P3s/u8vGsobL0yxoX9IjRghhId6LwjGm0IC49I08QK8hYgB8rUB+uq8FZQ9k
 3lDKNiPJViCCJtNrH24sq+prkrgvclhLSKcbma5VqBlaG3QILn1IKlQjNi/bUIBBdCpP
 YIPmSOUHaHrLoactvqVgPW8Nu5vgxFMGGfZEFbLQnnc1Que5d0dvnGIHZd+AwcN4cRc4
 juIsRWx5zJz7mTcERplr6gdLB5TERK54xUXab5QMQFiD5EMNYn6R3b2X3nwsb5CE3POv
 7LGFIWtk+8bxzJ4G89A/HJ39J6CpPOSFjZt7/t3heF2icZ21rxEq7+Eo3usij3G6OlrL
 UH4A==
X-Gm-Message-State: AOAM531NO0cvKDeeg3WNyRUBEgic9RHpV/jG4OkBHRJPJUZbJW0Zrqzc
 jqgy6i+4el5Ni9mviN/VuYDY4w==
X-Google-Smtp-Source: ABdhPJxbvQFA24STYjSmsFQeh34YR6aLuV8nQK5wlXXW3CPcVjhZjHvmK6qgZXTrZwPj8dZKeSjFjQ==
X-Received: by 2002:a17:902:7248:b0:167:95e2:f83c with SMTP id
 c8-20020a170902724800b0016795e2f83cmr14304302pll.74.1654798297569; 
 Thu, 09 Jun 2022 11:11:37 -0700 (PDT)
Received: from pmalani.c.googlers.com.com
 (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
 by smtp.gmail.com with ESMTPSA id
 r14-20020a63ec4e000000b003fb0354c43asm17728049pgj.32.2022.06.09.11.11.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 11:11:36 -0700 (PDT)
From: Prashant Malani <pmalani@chromium.org>
To: linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v2 0/7] usb: typec: Introduce typec-switch binding
Date: Thu,  9 Jun 2022 18:09:39 +0000
Message-Id: <20220609181106.3695103-1-pmalani@chromium.org>
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
Cc: heikki.krogerus@linux.intel.com, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Tzung-Bi Shih <tzungbi@google.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>, Jonas Karlman <jonas@kwiboo.se>,
 swboyd@chromium.org, Pin-Yen Lin <treapking@chromium.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Ripard <maxime@cerno.tech>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
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

v1: https://lore.kernel.org/linux-usb/20220607190131.1647511-1-pmalani@chromium.org/

Changes since v1:
- Fixed function signature error in "else case" of typec_mux.h
- typec-switch.yaml: Fixed indentation, compatible, and node names in examples.
- anx7625.yaml:
    + Introduced patternProperties for "switch" children (suggested by Krzysztof Kozlowski).
    + Added unevaluatedProperties descriptor (suggested by Krzysztof Kozlowski).
    + Added "address-cells" and "size-cells" properties to "switches".

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
 drivers/gpu/drm/bridge/analogix/anx7625.c     | 151 ++++++++++++++++++
 drivers/gpu/drm/bridge/analogix/anx7625.h     |  20 +++
 drivers/usb/typec/mux.c                       |   8 +-
 include/linux/usb/typec_mux.h                 |  38 +++++
 6 files changed, 352 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/typec-switch.yaml

-- 
2.36.1.476.g0c4daa206d-goog

