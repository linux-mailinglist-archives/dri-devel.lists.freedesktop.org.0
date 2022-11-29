Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3AA63C66B
	for <lists+dri-devel@lfdr.de>; Tue, 29 Nov 2022 18:29:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 045B810E0FA;
	Tue, 29 Nov 2022 17:29:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADD8810E0BC
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 17:29:19 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id n205so15999770oib.1
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 09:29:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=f2fUUZn0aoFEsmYmJGpqswKr9XlltrM/1Tq7myxFbEo=;
 b=pMTFKCWeddhphuFu+2lium0VJo1My+WfoNoG1c3WaRjvANnb1qwB8gUo6mmUVxtgN4
 nmuTLphHOcxXRWY2rFQlQLk8oSQji9BxR3EQt+/LmDQyVvBahxyS8P/AsRkwAgD2xYTc
 QCmD8owzu5TI9PG0JAVaFFbbOpMoEFLqTZLCu9LqMgHxjWo24TrSFxGcw7s2Ze2tToZ0
 /F+K7zScalVtV7e3nVdqxhqJp+OETdKtyeBgnnd8yHdBrO6zGDJN8oyE4WRJW0QFIapN
 IB3KwNwZnVCFcEb4HB/ZdwHwiN+d6UwPcmDy1WlT27+PlXgmJM1c6/DKvKck026YMCer
 rLrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=f2fUUZn0aoFEsmYmJGpqswKr9XlltrM/1Tq7myxFbEo=;
 b=hj10WSvmneLXnIrZka/jSVuOsy0f3/cR5PE+hiM899KiPd6SR80T9MBKeDkZ7s8B0J
 hXWLwSCXQX6RWTSLs8945WkB5RuNlYLrGSJtBgiFoGI4OrHvuymBZpco1D95Kf2l53kH
 FVB2GEjmGsci4olJDRQyASIi7JKEGiLmNbmXRBlEpuQuEvwkZ2gpGKx2at+mFUgwJGxR
 9sq9JfYx4oenf8gD7YhDHbpA7BWkKPZOZYZWaJObejF2beJN+iIuvtSGnFqXXgND62Dm
 x/trWs0pzjn5jOc09rtcZpBjlfaZWt480Lgx17Y4y0zGkYyvV1sq0laf0n7DdGSk6RdN
 3s/A==
X-Gm-Message-State: ANoB5pkQv+3a9mEPIeoNdJEQ1NWhzY+sZEpJMnPLNq2JBGyfJu5kbvV0
 ClMDv5jgUTrAGE/J2axOpjY=
X-Google-Smtp-Source: AA0mqf74Qj2PRqoyEpMHvimi1mm2R46hlahU4dfBqeInpE4pUhmN0O/bAhzHiHGjLB2Vt8C2X9WomA==
X-Received: by 2002:a05:6808:7:b0:35b:758e:1cda with SMTP id
 u7-20020a056808000700b0035b758e1cdamr15320949oic.148.1669742958926; 
 Tue, 29 Nov 2022 09:29:18 -0800 (PST)
Received: from localhost.localdomain
 (76-244-6-13.lightspeed.rcsntx.sbcglobal.net. [76.244.6.13])
 by smtp.gmail.com with ESMTPSA id
 l26-20020a9d709a000000b00661b46cc26bsm6224546otj.9.2022.11.29.09.29.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Nov 2022 09:29:18 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Subject: [PATCH V4 0/3] drm/panel: Add Samsung AMS495QA01 Panel
Date: Tue, 29 Nov 2022 11:29:09 -0600
Message-Id: <20221129172912.9576-1-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Cc: devicetree@vger.kernel.org, sam@ravnborg.org,
 Chris Morgan <macromorgan@hotmail.com>, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, thierry.reding@gmail.com,
 krzysztof.kozlowski+dt@linaro.org, maccraft123mc@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

Add the Samsung AMS495QA01 panel as found on the Anbernic RG503. This
panel uses DSI to receive video signals, but 3-wire SPI to receive
command signals.

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

Chris Morgan (3):
  dt-bindings: display: panel: Add Samsung AMS495QA01
  drm/panel: Add Samsung AMS495QA01 MIPI-DSI LCD panel
  arm64: dts: rockchip: add display to RG503

 .../display/panel/samsung,ams495qa01.yaml     |  57 ++
 .../dts/rockchip/rk3566-anbernic-rg503.dts    |  61 ++
 drivers/gpu/drm/panel/Kconfig                 |  10 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../gpu/drm/panel/panel-samsung-ams495qa01.c  | 547 ++++++++++++++++++
 5 files changed, 676 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,ams495qa01.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-samsung-ams495qa01.c

-- 
2.25.1

