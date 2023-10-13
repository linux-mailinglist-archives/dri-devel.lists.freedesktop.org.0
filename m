Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BEA17C8D20
	for <lists+dri-devel@lfdr.de>; Fri, 13 Oct 2023 20:39:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EAC510E62B;
	Fri, 13 Oct 2023 18:39:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C617F10E62B
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Oct 2023 18:39:25 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id
 5614622812f47-3af957bd7e9so1464392b6e.3
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Oct 2023 11:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697222365; x=1697827165; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=B+4iJr3L/oL+sIJn3dRrv8W005oNdqoHpRNAcI3ngyc=;
 b=L/l3KCM80iqPbndsQOa88rf1lj4GI0H7jPS7wtHjoL9QB7+Esta97EegXsC3xCh9AG
 WXtp8hQ84XaFaiVEecy3y66GkUKBRtXvf686cmwzExdm6TnczPanaBIKEKZffguU/HNW
 ynz4nPCt+kAZ2726R34KstD5ZfP0+gwZeskRQ7F/7LA7NzwEQLIKf21CWeiQq9Jvzo1q
 ZyH5NswLM+kRCfJfMkF36uK3zCPN2WANfFgG1wLtXyAhFBFD+rbc3ryOouLuWwaWGexK
 h6Yd9/ZNWjYL7FSwk/olWNfZ0JnXYPluFLWTJLWbN0EDrjV7hzhIAoW7fCir1dSrYcKv
 A8HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697222365; x=1697827165;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=B+4iJr3L/oL+sIJn3dRrv8W005oNdqoHpRNAcI3ngyc=;
 b=QvAYxHRkbKYw8BacyK1+zHcq8teBLrFSX1/8buOoCSDJbHDe6UaZdD7OwLcpx+I54f
 gapeZ405dJ9eUQhPlStfOmhvRKBUuOZ/NolnT7vEtChApx3+SCcUg4Bo6I9VrHqJr+Sh
 J/OlA0+mQk3bKXYLIxwEqRDOabtSOB0sYW+5Vk6UeObN7ui+q27c4tQPsnVPwE8zqV3+
 F+1OBp3DxWDjSUEWHx/VUkTHdrti4gaI8uFjicpZ5EVzeJJYYGYnZRcALHcN/+W1UUqk
 /6f02JQEI+olFT+S0dOOUYX5iaBe/4tZ1R3GQgTisbpamKs+cNUTk+yfHGcBq1GOdc2G
 rIrA==
X-Gm-Message-State: AOJu0YzTKRGTjv4C3oc1flmtBtzuG8i23rLDW+NtrAH1Sx89Vb/ipHPr
 7e7cMQf35PK6n5rAzB8/gVg=
X-Google-Smtp-Source: AGHT+IHJC9V7h7MhayXpUhwpuDTdyl0xVlDREHaqLEmdq1p11Ep4ugULWD3Vjs8KZWefYghyrkmQyQ==
X-Received: by 2002:aca:1b13:0:b0:3ae:2b43:dd4a with SMTP id
 b19-20020aca1b13000000b003ae2b43dd4amr28374791oib.45.1697222364849; 
 Fri, 13 Oct 2023 11:39:24 -0700 (PDT)
Received: from localhost.localdomain ([75.28.21.198])
 by smtp.gmail.com with ESMTPSA id
 bx19-20020a0568081b1300b003afe584ed4fsm842159oib.42.2023.10.13.11.39.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Oct 2023 11:39:24 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Subject: [PATCH 0/5] Add Support for RK3566 Powkiddy RGB30
Date: Fri, 13 Oct 2023 13:39:13 -0500
Message-Id: <20231013183918.225666-1-macroalpha82@gmail.com>
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
Cc: megous@megous.com, devicetree@vger.kernel.org, conor+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, kernel@puri.sm, sam@ravnborg.org,
 neil.armstrong@linaro.org, agx@sigxcpu.org,
 Chris Morgan <macromorgan@hotmail.com>, sebastian.reichel@collabora.com,
 dri-devel@lists.freedesktop.org, jagan@edgeble.ai, robh+dt@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

Add support for the Powkiddy RGB30 handheld gaming console.

Chris Morgan (5):
  dt-bindings: vendor-prefixes: document Powkiddy
  dt-bindings: panel: Add Powkiddy RGB30 panel compatible
  drm/panel: st7703: Add Powkiddy RGB30 Panel Support
  dt-bindings: arm64: rockchip: add Powkiddy RGB30
  arm64: dts: rockchip: add support for Powkiddy RGB30

 .../devicetree/bindings/arm/rockchip.yaml     |   5 +
 .../display/panel/rocktech,jh057n00900.yaml   |   2 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../dts/rockchip/rk3566-powkiddy-rgb30.dts    | 152 ++++++++++++++++++
 drivers/gpu/drm/panel/panel-sitronix-st7703.c |  89 ++++++++++
 6 files changed, 251 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rgb30.dts

-- 
2.34.1

