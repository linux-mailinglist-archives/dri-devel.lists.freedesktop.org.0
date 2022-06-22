Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C84D4555280
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 19:36:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7294E10E21E;
	Wed, 22 Jun 2022 17:36:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBFEC10E21E
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 17:36:20 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id 184so16697160pga.12
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 10:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EGSWfwuV6kDT1fwM+T4JAkD27EMrpSWAszwgosFVQVw=;
 b=grWObt6Okfs3RafY2b0NVKjFrBhkE6C1/0vcWncE04tJrdoQojz3GOVtF8Mi2x1HRW
 QkTbr6Qt7h5qJ8e/vypQSZl7HMB3jQbVCaxyGsro8g9N18Ao7HQs3SZy4ndhrH5S8Xx1
 mP0WgDsVLIt/JclEEcE6snj1DLR5W92U6w6Qg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EGSWfwuV6kDT1fwM+T4JAkD27EMrpSWAszwgosFVQVw=;
 b=fd5eo/hqo/fox6i9ITOTPTEujmBCVzBSKQp94ZuQH7CmR9/BJ0VMhDMZeYY3WMKmHO
 +mvRY3lPsovYs6d02j9hJRxsXDjTNnCekWZb+XfHqbgBbeugRMbjVhy+qqFE2J1bOz79
 x2SpMfeBYX56U0wUYmAumx8gtwVfoz59aA8CHxCqFlR4W7HDt8GI3gBYuIoPbwnhsHEO
 gYt7QJhXKzURkausg2YIqrDuorf7vvBKgTj5oOyhXw+7e/5hrTum1Mm8bb0kNtubj2iy
 W9GeZ8sf/xEBqSJT97imqT5kpyPTZMm1y63L2JZtzO9PXpxxzhp7Se2FQFao/wIqbzxE
 fHFg==
X-Gm-Message-State: AJIora8grvyaof8Fta8IVw5GXdt9hplbC9GCCL+kApL4MuaJ+PdCIN82
 thyToG+YBqVMqTAfDIoS4IkPkQ==
X-Google-Smtp-Source: AGRyM1sB1+bTIxsIF22HqeLedT3vzGfH5CbBlkgMvEj61XWLvZw7HZSjL+m1aKkDdcE5g72JbC97/A==
X-Received: by 2002:a63:4a4e:0:b0:401:baa6:d695 with SMTP id
 j14-20020a634a4e000000b00401baa6d695mr3975223pgl.259.1655919380268; 
 Wed, 22 Jun 2022 10:36:20 -0700 (PDT)
Received: from pmalani.c.googlers.com.com
 (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
 by smtp.gmail.com with ESMTPSA id
 l17-20020a17090b079100b001ece55aec38sm35470pjz.30.2022.06.22.10.36.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jun 2022 10:36:19 -0700 (PDT)
From: Prashant Malani <pmalani@chromium.org>
To: linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v5 0/9] usb: typec: Introduce typec-switch binding
Date: Wed, 22 Jun 2022 17:34:29 +0000
Message-Id: <20220622173605.1168416-1-pmalani@chromium.org>
X-Mailer: git-send-email 2.37.0.rc0.104.g0611611a94-goog
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
 Allen Chen <allen.chen@ite.com.tw>, swboyd@chromium.org,
 Pin-Yen Lin <treapking@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Maxime Ripard <maxime@cerno.tech>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Xin Ji <xji@analogixsemi.com>,
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

The first 2 patches introduce the new "typec-switch" binding as
well as one user of it (the ANX7625 drm bridge).

Patches 3-5 add functionality to the anx7625 driver to
register the mode-switches, as well as program its crosspoint
switch depending on which Type-C port has a DisplayPort (DP) peripheral
connected to it.

Patch 6-9 add similar bindings update and Type-C switch support to the
it6505 driver.

v4:
https://lore.kernel.org/linux-usb/20220615172129.1314056-8-pmalani@chromium.org/

Changes in v5:
- Rebased on usb-next, so removed Patch v4 1/7 and Patch v4 2/7 from
  this version (v5) since they are already in usb-next.
- Added newer Reviewed-by tags.
- Added new patches (6-9) in this version for a 2nd example (it6505)
  of a binding of the user.

Patch submission suggestions:
Option 1:
- Bindings patches 1/9 and 2/9 can go through the USB repo (since they are
  already reviewed from v4 [1]).
- Bindings patch 6/9 can go through the USB repo, and the remaining patches
  (3-5,7-9) can go through the DRM repo.
  <or>
- Patches 3-9 can all go through the DRM repo.

Option 2:
- All patches (1-9) go through the USB repo.

(My apologies if I've made this confusing, and I appreciate any
suggestions for better submission strategy).

[1]: https://lore.kernel.org/linux-usb/YrMxFeMc0tk%2FK1qL@kroah.com/

Pin-Yen Lin (5):
  drm/bridge: anx7625: Add typec_mux_set callback function
  dt/bindings: drm/bridge: it6505: Add mode-switch support
  drm/bridge: it6505: Register number of Type C switches
  drm/bridge: it6505: Register Type-C mode switches
  drm/bridge: it6505: Add typec_mux_set callback function

Prashant Malani (4):
  dt-bindings: usb: Add Type-C switch binding
  dt-bindings: drm/bridge: anx7625: Add mode-switch support
  drm/bridge: anx7625: Register number of Type C switches
  drm/bridge: anx7625: Register Type-C mode switches

 .../display/bridge/analogix,anx7625.yaml      |  64 +++++++
 .../bindings/display/bridge/ite,it6505.yaml   |  97 +++++++++-
 .../devicetree/bindings/usb/typec-switch.yaml |  74 ++++++++
 drivers/gpu/drm/bridge/analogix/anx7625.c     | 148 +++++++++++++++
 drivers/gpu/drm/bridge/analogix/anx7625.h     |  20 ++
 drivers/gpu/drm/bridge/ite-it6505.c           | 171 +++++++++++++++++-
 6 files changed, 569 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/typec-switch.yaml

-- 
2.37.0.rc0.104.g0611611a94-goog

