Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C25AD672CA2
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 00:31:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED64C10E050;
	Wed, 18 Jan 2023 23:31:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39BAA10E050
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 23:31:45 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id i5so338742oih.11
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 15:31:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XH1y5rYKFViuRcNHtWtYtPcA4DgWz25CCTQfZyUbrnE=;
 b=YtIE4pR1tODUTIgOvw1JqbI8004hDZmscHvqRVxzq9kZ73DHZ2Iqhf74G373R2UoRg
 Ao19vel3ftF8PoHac3WfPeFHjue7PVHA33YljmzYQ9x3zKnkwulBltGdlY0//2y5HSGv
 U2j/VP7Q0k3UDh8lPtUFjVDB0EUd2F1aZ6h5QPmQk9Be7gUAf956Awpbpa7tl2VrExNZ
 PTD8UP7MWCqorIwserlHx+PG++PzEFGLznPtmui6PJ1vgHco3FpaF74lFcYO3Iqs4ogY
 sRgquV8m6PBiL0lT004DrnmQ58rMo4RGjGNkJG3jTAydmduzM3z3w0r0bxddP0v2aEzr
 tpwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XH1y5rYKFViuRcNHtWtYtPcA4DgWz25CCTQfZyUbrnE=;
 b=U91eFV5rWn/z3wlmG2qmAFdawa2iUifFRLJRxFuVPWihQjFC6q2w1xdcx3Gds7wUwr
 O0sCp7yE3KMfbCaIs9jbgo9kR0Pp1V6W+QiAqjIDHDzvJQnL0LanJZkUkIANwaZi8XW4
 oWKSnCsdli0fr9lCrsTsamiyrLvAwVhRZmS+XG0nYxtVtg+LYHvUJMITBhuVT7Bhr7iG
 WqYZureOOtCqOV4EA88VC2GRtkX6Xa6StPivydX2ZqTgYf6I0nGkXBt3UYJmaLsVjd22
 7RapJeEQtAmmRQWON3j5NA0UWQeQNkXUadUnRvL+K5Y2cpwoauHss3bW7unN2uxrRqYT
 dYYg==
X-Gm-Message-State: AFqh2kp3+fKL6v8YgJ+hChHOaYrJlVc8DweOX6X0ApYPDqIZjR3VfBPE
 n5QRHPdwZOz7XPUkxMLW17qRo/IIusA=
X-Google-Smtp-Source: AMrXdXvvelMHakqU4zG4NmZUORZePP0oEuYsi/sQ99//LN2eo/vCvuYpX+Z3uZeT11B6UXturv0iCg==
X-Received: by 2002:a05:6808:300e:b0:364:f962:afd1 with SMTP id
 ay14-20020a056808300e00b00364f962afd1mr4990268oib.56.1674084704012; 
 Wed, 18 Jan 2023 15:31:44 -0800 (PST)
Received: from localhost.localdomain ([76.244.6.13])
 by smtp.gmail.com with ESMTPSA id
 q10-20020acad90a000000b00354932bae03sm16966933oig.10.2023.01.18.15.31.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jan 2023 15:31:43 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V11 0/4] drm/panel: Add Magnachip D53E6EA8966 Panel Controller
Date: Wed, 18 Jan 2023 17:31:31 -0600
Message-Id: <20230118233135.1174859-1-macroalpha82@gmail.com>
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
 krzysztof.kozlowski+dt@linaro.org, sam@ravnborg.org,
 linux-rockchip@lists.infradead.org, robh+dt@kernel.org,
 thierry.reding@gmail.com, tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

Add the Magnachip D53E6EA8966 panel IC controller for display panels
such as the Samsung AMS495QA01 panel as found on the Anbernic RG503.
This panel uses DSI to receive video signals, but 3-wire SPI to receive
command signals using DBI.

Changes since V10:
 - Guarded definition in drm_of.h with an additional #if statement.
 - Narrowed focus of drm_of_get_dsi_bus() to only return dsi_host (no
   longer populates node on the mipi_dsi_device_info struct).

Changes since V9:
 - Set an ifdef to not add the drm_of_get_dsi_bus when MIPI_DSI is not
   part of the current kernel config.
 - Made "info" optional in the drm_of_get_dsi_bus() function.

Changes since V8:
 - Set "placeholder" drm_of_get_dsi_bus in drm_of.h to static inline
   to hopefully eliminate the reported errors once and for all. Tested
   with 4 different kernel configurations provided by Intel's kernel
   test robot and no new warnings or errors were introduced.
   Reported-by: kernel test robot <lkp@intel.com>

Changes since V7:
 - Removed Linus Walleij review note due to substantial changes.
 - Corrected documentation of drm_of_get_dsi_bus function.
 - Updated the drm_of_get_dsi_bus function to return pointer to
   mipi_dsi_host and use ERR_PTR macros.
 - Refactored drm_panel_funcs so that the prepare function calls
   panel specific function for init sequence and uses generic
   functions otherwise.
 - Renamed non-panel specific functions.
 - Changed backlight value to int instead of u32.
 - Corrected brightness function to use backlight_get_brightness().
 - Fix an error reported when CONFIG_OF is selected but
   CONFIG_DRM_MIPI_DSI is not. Add an if function to drm_of_get_dsi_bus
   function to return -EINVAL in this instance.
   Reported-by: kernel test robot <lkp@intel.com>

Changes since V6:
 - Fixed a trivial error with definition of drm_of_get_dsi_bus().
   Reported-by: kernel test robot <lkp@intel.com>

Changes since V5:
 - Reverted dt binding documentation name back to
   samsung,ams495qa01.yaml.
 - Removed no longer needed of_graph.h header file.
 - Added backlight as a dependency.

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
  dt-bindings: display: panel: Add Samsung AMS495QA01
  drm/panel: Add Magnachip D53E6EA8966 Panel Driver
  arm64: dts: rockchip: add display to RG503

 .../display/panel/samsung,ams495qa01.yaml     |  57 ++
 .../dts/rockchip/rk3566-anbernic-rg503.dts    |  55 ++
 drivers/gpu/drm/drm_of.c                      |  51 ++
 drivers/gpu/drm/panel/Kconfig                 |  11 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../drm/panel/panel-magnachip-d53e6ea8966.c   | 522 ++++++++++++++++++
 include/drm/drm_of.h                          |  12 +
 7 files changed, 709 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,ams495qa01.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-magnachip-d53e6ea8966.c

-- 
2.34.1

