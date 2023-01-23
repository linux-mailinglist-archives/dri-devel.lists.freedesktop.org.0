Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 641B067804C
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 16:46:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF2A110E4D7;
	Mon, 23 Jan 2023 15:46:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08E9210E4D7
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 15:46:12 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id s66so10701380oib.7
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 07:46:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VjT+KuUSRPoSSIx/ak1Yf8ilLHFBmPSpHObnSxuVDlk=;
 b=JkI3xCrdDTYGwjodwTGGhTGHwyPZCXe9UxkxyJ+qOV+Rxb/hr3pndUmtXFZAMlsObM
 +LBmtttWAsEfuB0V8CgqlCjAPnUTup4USr/X20JZFkU7uEZV1ADIWFIIWeRGBZHZIfdu
 95cLe0PQ9fdZuK99Yu0MDVkh3BMB9ul2l5wIOd9hSiFACONeFDDE8yyB0E2aTFz46NtS
 MOpYvu297eKpfvmEdiIHBN3UgFczNsqvPnSHEsF3E622rqrkQ9ATRqeL5FOio1T4JynI
 X9rWkhPW56RW0/jywW5icpKwcWTfkGF/ecuBxJoj6yAXXFbIFFSMEIhnm7PYpaqQdWra
 fqyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VjT+KuUSRPoSSIx/ak1Yf8ilLHFBmPSpHObnSxuVDlk=;
 b=zDZ/VRUAdYsjSg02ziXgDcIO6aJstJPBqvdr30NNtdcY6ouvxXzmWmZmxElSd9F8D5
 f3xvZTDWVX9DnZcwg3YJ1DvUDciPnCaRaOjCYTLFK+GhLi5VVrOq0LPhjsUVD8sWLwjE
 0LNt/aXNDnmvWv5Nya+QVZSZMCLNBUZ22zYcS30+BMqFqDtreDRRnDKqhfW5kEHCcnpz
 B5uXGGkv5KMy20uqGYheNXnYJif1a5S5kyh9mHX0GJHRVAdKFssI9T0ugq0erfqMxsPo
 rPNXU7O+hVs1E6yC1IZK9vurUTbZR9JBKf1SMw/Xiit5X5QcfVmbaWBpsDUqMwTGpikq
 GNxA==
X-Gm-Message-State: AFqh2kpQUYcqul7wB6DLGLnbbcEi8xy2CQ5PaD/+zVAwk8wsiZhXyhFa
 6MKBBfouGvMwxOUudp8j9eF2kTVFSd4=
X-Google-Smtp-Source: AMrXdXttBP2RmIY/4xw4OecWvT/GDZd3INZ+UJThZtbK5vEoxoW8KXfllMWRlNxkI6euPvlYpZ+tpA==
X-Received: by 2002:aca:d956:0:b0:35a:33d:5651 with SMTP id
 q83-20020acad956000000b0035a033d5651mr10895196oig.14.1674488771053; 
 Mon, 23 Jan 2023 07:46:11 -0800 (PST)
Received: from localhost.localdomain ([76.244.6.13])
 by smtp.gmail.com with ESMTPSA id
 w13-20020a056808140d00b0035e7ed5daa1sm10040132oiv.26.2023.01.23.07.46.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 07:46:10 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V12 0/4] drm/panel: Add Magnachip D53E6EA8966 Panel Controller
Date: Mon, 23 Jan 2023 09:45:59 -0600
Message-Id: <20230123154603.1315112-1-macroalpha82@gmail.com>
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

Changes since V11:
 - Added a "Co-developed-by" tag for Maya to capture her contributions
   correctly.

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

