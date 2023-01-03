Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C8E65C6EE
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jan 2023 20:07:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62B2210E4BA;
	Tue,  3 Jan 2023 19:07:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com
 [IPv6:2001:4860:4864:20::2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F032110E4BA
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jan 2023 19:07:12 +0000 (UTC)
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-1441d7d40c6so37861701fac.8
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Jan 2023 11:07:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=USvKgiAPMhAy/9BXMiGdBIzgvIIPEyBr90rzPBia1lQ=;
 b=BogNOQMXGscV/PNfPtNIXQ+l4PnWaHfNKE/mkN9S01aQY33TCcu+rCsD2VJf1f+eaT
 g9Oes7chIW9wFsiteJVsY20YSdqrtiEzsibVxhu+OiqEsdebNQtPsx878WFL41115e9g
 UVBZ5rHq32tygcnioTYh068/FqMauETJHOmhvElIYwEcYDpVM4NyXklZ918Qecw6XtLB
 o4AIGRd2AoH+74KIsLb2Q7Q9d97hO0juN+7hF+eMpvt8CsTgix4Fo9rS7lEjWBozqW8m
 rPmecvoM1BxJcWl5cS+uzLtcVqJXTunAJS+4qxwuicNEm0hJZ4mVGqE40f1VFFr/unIe
 R6fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=USvKgiAPMhAy/9BXMiGdBIzgvIIPEyBr90rzPBia1lQ=;
 b=hZ+mswof+nnXQhC0unqWkqODkBaKP+ne2bJGNamI7KgOvGUkk0AE4kXVviYK8NnJwY
 lWfvgefitRL1ZczZa5sumcePwIXJ14vZBCKYaiXib1O+6WQdfugbJrRGOHR/JU73PE+U
 AcbkKR5l+HgVpqiWgyK0EGLIcwBzlNagEoBbruI+LqmnrdsGJ/K1oVu18SRemsX+Igqn
 iAe3KmkzbUAtYTjinL5iOUo/qhrGE++4Ez7TQwqI6b1KJO79PPGwQPrAN9HgqtGskQ3s
 jUgpKrqVifyTRz1Zdk4PLSyIEQRxee+B7fcCqS0Lg0aEOMrvAW3B0c7iIECO0UDiPJRi
 XGNw==
X-Gm-Message-State: AFqh2kp4JFpbBPxDWvNsJOKERafJrQJLaw/p6W91s398jnRv+7+yGQDf
 ovf3J53UtN19tGvHaJSnf8PR6slvRmo=
X-Google-Smtp-Source: AMrXdXtGNMtBwha02Tmu9U+Hj18evMBRiTxlYHZoPF3iuu+S6yMosoMfI7g0aa/7E+6zd4xLHpZHDQ==
X-Received: by 2002:a05:6870:f707:b0:14f:f223:faad with SMTP id
 ej7-20020a056870f70700b0014ff223faadmr15526419oab.15.1672772832000; 
 Tue, 03 Jan 2023 11:07:12 -0800 (PST)
Received: from localhost.localdomain ([76.244.6.13])
 by smtp.gmail.com with ESMTPSA id
 s24-20020a056870ea9800b0014c7958c55bsm14752207oap.42.2023.01.03.11.07.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jan 2023 11:07:11 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v7 0/4] drm/panel: Add Magnachip D53E6EA8966 Panel Controller
Date: Tue,  3 Jan 2023 13:07:03 -0600
Message-Id: <20230103190707.104595-1-macroalpha82@gmail.com>
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

