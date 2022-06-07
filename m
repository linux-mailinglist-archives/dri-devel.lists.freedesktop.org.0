Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36AF6540F11
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jun 2022 21:01:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC22410EF6A;
	Tue,  7 Jun 2022 19:01:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F4DE10EF6A
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jun 2022 19:01:41 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 l20-20020a17090a409400b001dd2a9d555bso16262165pjg.0
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jun 2022 12:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XlC5WhPEtlChZIl+n5BBhBXh04p3vnO18/6gEyRk/7I=;
 b=aiEoUfInXs6muqWe9eAFyYvM/XQRsycTnGNXLPtV5k6vx6lf9JLcKGqq5Qnluowoaj
 z4Wl1unEUXEkk8niQrnFc5kvsyfgbdRvPcRZtypHElhb1b+AmCNk3ZVDHDXvgObfm7Uy
 eKNnzoJvWvkExKgTkl65s6gsf+sxZl7wd9uc4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XlC5WhPEtlChZIl+n5BBhBXh04p3vnO18/6gEyRk/7I=;
 b=HWlwL9cbhK3zvIwc7VQ5t32yS7hLIV9HFINZIJh5cSoLw7p94lXgid3zgNhvF7YVHU
 AbdGXjZ/yLszfeysXYw/4HA/C5fMEptSnbjp6fak9zQVd5rHrMoOIirf3hjzJKv5Gkmw
 D/LTXE51cjRx3gMZwG1sjhk3Nou+hxmkuIOLZFsLmA2EadzeoRYie3C3zub0BRKYaYnN
 bmB4xbjUmGyYYNkSvqT4Qhht0n5Vu+zQPuHO1VY6VrqYmlqkELmS8Gezo46VRYXZLOPu
 gNDDxJSnCz64emOKrupYfiB3ADSvVsDzJYqtuvNxbyaxX3wb3rqLFFnviNW8R9bmE1pc
 Zr+Q==
X-Gm-Message-State: AOAM532xU2fvCujUtl2ntuK+JphhVrgWi0UVkt6o/+njcc2hdxfQ5pbs
 jmnCRZF6oLP5354y9KTIOL4sgA==
X-Google-Smtp-Source: ABdhPJys+qHC9VhA3c9fwXaPhk0EIhEKcRgheZtI7KEsqbNQpujN5/HXjl1x4+YKKseCyyA6hK7pOg==
X-Received: by 2002:a17:90a:2c0c:b0:1ea:14c0:f0ca with SMTP id
 m12-20020a17090a2c0c00b001ea14c0f0camr2481026pjd.143.1654628501156; 
 Tue, 07 Jun 2022 12:01:41 -0700 (PDT)
Received: from pmalani.c.googlers.com.com
 (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
 by smtp.gmail.com with ESMTPSA id
 g29-20020aa79ddd000000b0050dc762819esm13236084pfq.120.2022.06.07.12.01.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 12:01:40 -0700 (PDT)
From: Prashant Malani <pmalani@chromium.org>
To: linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH 0/7] usb: typec: Introduce typec-switch binding
Date: Tue,  7 Jun 2022 19:00:17 +0000
Message-Id: <20220607190131.1647511-1-pmalani@chromium.org>
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
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
on the PD messaging from the Type-C port driver regarding connected peripherals.

The first patch introduces a change to the Type-C mux class mode-switch
matching code, while the second adds a config guard to a Type-C header.
The next couple of patches introduce the new "typec-switch" binding as
well as one user of it (the ANX7625 drm bridge).

The remaining patches add functionality to the anx7625 driver to
register the mode-switches, as well as program its crosspoint
switch depending on which Type-C port has a DisplayPort (DP) peripheral
connected to it.

Pin-Yen Lin (1):
  drm/bridge: anx7625: Add typec_mux_set callback function

Prashant Malani (6):
  usb: typec: mux: Allow muxes to specify mode-switch
  usb: typec: mux: Add CONFIG guards for functions
  dt-bindings: usb: Add Type-C switch binding
  dt-bindings: drm/bridge: anx7625: Add mode-switch support
  drm/bridge: anx7625: Register number of Type C switches
  drm/bridge: anx7625: Register Type-C mode switches

 .../display/bridge/analogix,anx7625.yaml      |  56 +++++++
 .../devicetree/bindings/usb/typec-switch.yaml |  76 +++++++++
 drivers/gpu/drm/bridge/analogix/anx7625.c     | 151 ++++++++++++++++++
 drivers/gpu/drm/bridge/analogix/anx7625.h     |  20 +++
 drivers/usb/typec/mux.c                       |   8 +-
 include/linux/usb/typec_mux.h                 |  38 +++++
 6 files changed, 347 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/typec-switch.yaml

-- 
2.36.1.255.ge46751e96f-goog

