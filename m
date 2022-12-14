Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA79F64CF22
	for <lists+dri-devel@lfdr.de>; Wed, 14 Dec 2022 19:07:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E2FD10E023;
	Wed, 14 Dec 2022 18:06:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com
 [IPv6:2001:4860:4864:20::29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA16E10E023
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Dec 2022 18:06:21 +0000 (UTC)
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-1443a16b71cso17603006fac.13
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Dec 2022 10:06:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6X2LLKqRU7NygC02ZshMKSrC50Hw3Yg7p6YaX/VLqmc=;
 b=QnbyspQleD+BpGwAH5y1v18y5aHpUHeO9mZ1BbZLTw0VZP3zeQiy5LaiorWxPJkG8r
 B553/E/FJynjbWQNCUnAaTOJq4Jr/JTwoZhUdP3hwM2IaR3upbUNrjMDcFgV1C5igZBU
 u0HoaTpDjtSRbNz7z41LIoEp6mVQ24aQ2h2UMh09I/njyqO3WXg8AKub/II1y7dseazw
 7A/O+ljjA8VrXFd8XJheRwytGIoK0tPiLJQksE3fdDDNEG0OJuFyQt6BLvn1cUrJlZKv
 rzKrAvGJKNssnydMRTAvEOffo7M+FxZbjvJeK5NC+Oxb0NxQ7Nwy5W1BIAJ+Tw5hsvp3
 GQ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6X2LLKqRU7NygC02ZshMKSrC50Hw3Yg7p6YaX/VLqmc=;
 b=ezYZ7L2a3lu75YvGK2Y7J/G3vUiP10YROT4sq/6Hq0tbDwjFCjUQ658bfRgIM/sQGK
 BM58tFQpCkroW3cuJiD9yVmn9QX9ze3d2vyn3c9mC9SYMLtlT6cTJ0Khxqyc8/L9XtJo
 Lg5pn+OgmdAMItJtRjDnuTQyBZ4vvNe/85FhZUlovcH1HoLqFqzVB6b3LTY781Ys79Lj
 BRkpmnfzOhxoGr8OZq/XQ/igiO5PWYBsw1vkcuu/haM1eam9TXUHfRu40CTrDVbSlDoH
 a8WuUJ24C0D8HDajflcdPQfn1L4xmamj4/54ViqX9VbPlfYY+WflrivY/WTV+zgZHB8k
 BD2Q==
X-Gm-Message-State: ANoB5pkP6Fn/FoLqPZvaaX0Ju7VVztfwZs37NwGGkFK2GwCCorFIXnE7
 RwALyPloaoxyIIF8Uc7UkZi68LWcy+w=
X-Google-Smtp-Source: AA0mqf4PI+JomiJP+LxThCdP5Wsb3LQne6zy0iMmEsL9wkuaqaseXrKHqeIBx/JS46CZTxfPoc3pOw==
X-Received: by 2002:a05:6870:7c07:b0:144:1b8f:38a8 with SMTP id
 je7-20020a0568707c0700b001441b8f38a8mr15342931oab.22.1671041179959; 
 Wed, 14 Dec 2022 10:06:19 -0800 (PST)
Received: from localhost.localdomain
 (76-244-6-13.lightspeed.rcsntx.sbcglobal.net. [76.244.6.13])
 by smtp.gmail.com with ESMTPSA id
 y8-20020a056870b00800b0013b0b19100fsm3034008oae.32.2022.12.14.10.06.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Dec 2022 10:06:19 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V5 0/4] drm/panel: Add Magnachip D53E6EA8966 Panel Controller
Date: Wed, 14 Dec 2022 12:06:07 -0600
Message-Id: <20221214180611.109651-1-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
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
Cc: devicetree@vger.kernel.org, Chris Morgan <macromorgan@hotmail.com>,
 tzimmermann@suse.de, sam@ravnborg.org, robh+dt@kernel.org,
 thierry.reding@gmail.com, krzysztof.kozlowski+dt@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

Add the Magnachip D53E6EA8966 panel IC controller for display panels
such as the Samsung AMS495QA01 panel as found on the Anbernic RG503.
This panel uses DSI to receive video signals, but 3-wire SPI to receive
command signals.

Changes since V4:
 - Renamed driver from the panel model to the panel IC controller per
   DRM team.
 - Added a drm_of helper function of drm_of_get_dsi_bus() to handle
   finding and populating the DSI node when the DSI node is not the
   parent of the DSI controlled display.
 - Converted the documented commands to constants to make it more
   readable.
 - Reset GPIO is now required and documented as GPIO_ACTIVE_LOW.
 - Removed "prepared" logic from panel.

Changes since V3:
 - Updated documentation to add spi-peripheral-props.yaml per updates
   made for similar devices. Note that I removed a "Reviewed-by" tag
   from Rob Herring since this change probably needs to be confirmed.
 - Added binding for RG503, since this device is now accepted with this
   request: https://lore.kernel.org/linux-rockchip/166274831283.21181.6861718157177507544.b4-ty@sntech.de/

Changes since V2:
 - Added 50hz mode at request of userspace devs.
 - Renamed "dupa" to panel name. Good catch Maya.
 - Added Maya's Signed-off-by.
 - Removed check for max backlight, since it is already done by
   backlight_device_set_brightness.
 - Fixed minor formatting issues on devicetree binding documentation
   and added port to provided example.

Changes since V1:
 - Removed errant reference to backlight in documentation. This is an
   OLED panel.
 - Made elvss regulator optional. In my case its hard wired and not
   controllable.
 - Added "prepared" enum to track panel status to prevent unbalanced
   regulator enable/disable.


Chris Morgan (4):
  drm: of: Add drm_of_get_dsi_bus helper function
  dt-bindings: display: panel: Add Magnachip D53E6EA8966
  drm/panel: Add Magnachip D53E6EA8966 Panel Driver
  arm64: dts: rockchip: add display to RG503

 .../display/panel/magnachip,d53e6ea8966.yaml  |  62 +++
 .../dts/rockchip/rk3566-anbernic-rg503.dts    |  55 ++
 drivers/gpu/drm/drm_of.c                      |  62 +++
 drivers/gpu/drm/panel/Kconfig                 |  10 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../drm/panel/panel-magnachip-d53e6ea8966.c   | 515 ++++++++++++++++++
 include/drm/drm_of.h                          |  11 +
 7 files changed, 716 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/magnachip,d53e6ea8966.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-magnachip-d53e6ea8966.c

-- 
2.34.1

