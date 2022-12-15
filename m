Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF34664E157
	for <lists+dri-devel@lfdr.de>; Thu, 15 Dec 2022 19:52:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1114D10E512;
	Thu, 15 Dec 2022 18:52:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com
 [IPv6:2607:f8b0:4864:20::c2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFF6310E4D3
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Dec 2022 18:52:18 +0000 (UTC)
Received: by mail-oo1-xc2e.google.com with SMTP id
 g15-20020a4a894f000000b0047f8e899623so30262ooi.5
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Dec 2022 10:52:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=obKXGKhdezaANc/b4vG1rAvVdxbFcZUhrsHZMR12SlM=;
 b=OrZUziRz0gZiHIfPRHjEhiLdKTiCM8uoEoqnlOAbUprHIymWJuMVa97AkwLIxIzrRO
 Nuy+tkNlFmsXxLsF8AYidwvQcpV4R9OkhaB0ejhR+uHxEnHKR495CRumwo6si7bVDwCD
 y1hjQN1shf1eP1Fl+grqgmpkhWZkSz0NaeAngJolwCNQ80qg+HGBihIDTe7wejTD5W1i
 p/12Nf2MCWaF59XQOqjJQ1qgEwB1JZdLFvBrwjNYAz1doBXCWxdouT1Ly/grIf6Ta6kc
 GTKw39aYzwLCdasuKzGDAOP7vtn5Apx7eV4mLljp29HzcI6fFNzx71j96mNVAn+jz4eF
 4bEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=obKXGKhdezaANc/b4vG1rAvVdxbFcZUhrsHZMR12SlM=;
 b=vactXVVcV2+eVDyhIpfJyKkmotKJuS6GK4kiELiYiAArF6kA+7Z6wzF7KOqCiqFhTb
 KK8yxgIPfTNo5SQyX2XkhRKHiTikHTNCQH6L0o4h2ozAQbqYGBZ+G2gpy3OPFU0noWZu
 B3p+JRRdhedNRAWveaUzU+Tg6ia7/C73WbnFZA5AuTTy5X68hm4yqgQ1UPeNkwCZfRvn
 hhFhHK0QwAU8EsBz+ufpQlxZ9IzXCn3KTH5CrdyNoLbnEVDRAKdxWgKgECs5I5dL96b1
 SNSfOH2iUKKi2tKob5JuBE41cSuYayNSsQe8le1fSarIZUAEVsYuyBX0Vx69lcCja7zS
 lUdw==
X-Gm-Message-State: ANoB5pnvEiUKR1WXMee/zxrcoqE5H3FviRzd19UB7pfQUV2bVSJ1CcH3
 OHbWbbGzpFG/keoGwZ5dKbe6GrsQ0Wc=
X-Google-Smtp-Source: AA0mqf5sdfafpVcxAYrRWb4N1scUZkG0vKA8pWjSrX5LXLjb3IwQLRuArYIrCqDJUKTZQa/GHjFrgQ==
X-Received: by 2002:a4a:d010:0:b0:4a3:9f7a:add0 with SMTP id
 h16-20020a4ad010000000b004a39f7aadd0mr12112492oor.5.1671130337766; 
 Thu, 15 Dec 2022 10:52:17 -0800 (PST)
Received: from localhost.localdomain ([76.244.6.13])
 by smtp.gmail.com with ESMTPSA id
 g11-20020a4ad84b000000b004a09df5a1dbsm72264oov.8.2022.12.15.10.52.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Dec 2022 10:52:17 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V6 0/4] drm/panel: Add Magnachip D53E6EA8966 Panel Controller
Date: Thu, 15 Dec 2022 12:52:07 -0600
Message-Id: <20221215185211.1560736-1-macroalpha82@gmail.com>
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
 thierry.reding@gmail.com, tzimmermann@suse.de, maccraft123mc@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

Add the Magnachip D53E6EA8966 panel IC controller for display panels
such as the Samsung AMS495QA01 panel as found on the Anbernic RG503.
This panel uses DSI to receive video signals, but 3-wire SPI to receive
command signals using DBI.

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
 drivers/gpu/drm/drm_of.c                      |  62 +++
 drivers/gpu/drm/panel/Kconfig                 |  11 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../drm/panel/panel-magnachip-d53e6ea8966.c   | 514 ++++++++++++++++++
 include/drm/drm_of.h                          |  11 +
 7 files changed, 711 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,ams495qa01.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-magnachip-d53e6ea8966.c

-- 
2.34.1

