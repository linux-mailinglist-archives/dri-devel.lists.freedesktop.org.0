Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36CDA5F2195
	for <lists+dri-devel@lfdr.de>; Sun,  2 Oct 2022 08:46:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3153F10E061;
	Sun,  2 Oct 2022 06:45:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E147210E061
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Oct 2022 06:45:44 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id kg6so1193383ejc.9
 for <dri-devel@lists.freedesktop.org>; Sat, 01 Oct 2022 23:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=8DoxyrrNurSSCa9HyAR/BM9iY3WZi9m5+lPpxJ0Uuwo=;
 b=PODqI7EtFcGiZpzJBCGkv4ktWLDnRU9EOapB6eH3P9+9XM5qNC7Gyoku5e5dYaCD2k
 5lPV1udTtxuYEW3Ye2pn7Gs3ljboJN3ezbSriC7kNh3YWMNL5jZZ+UhsX97qVqmjXXhk
 SCvB0/xkHPFxkHg+UK1Icwm5mHCknJ219+W+A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=8DoxyrrNurSSCa9HyAR/BM9iY3WZi9m5+lPpxJ0Uuwo=;
 b=GPb1vdwOACLyZOiQw8QTxyJGR7WWBzEz7+hOy18DfFP4hO51k+yys3KKicoMEJ5nPw
 j1bVpAQqBTVGYCIakDS/6bd0qjaB0lMwyJy56IaC6iON2yBpgUK/1e5oxxb4JLLaxMUk
 /+CoXdAlK2pT4sNEfiIa+I+QRQ7GgjcX1u7OVO+earKxKomi6jeBCqQVlESA/AujZ8yf
 smFw8GGRg0+kWCh+zw/aZ8k5rd0Eyu1mEA7/jDyX5/wn+la5otDjmOe7baCedCeska5M
 nvbuCuYs3VfkM5zBJ4WPssoVfYZI63XN4ryf08oq9jsGfd7jXeXF4sqHOCQ2GBF8gDja
 DMig==
X-Gm-Message-State: ACrzQf0R8/7b8XNJatwqRIACiAZMV0J9rpXsHrTWlB/ZVzMrSqIQFcQZ
 xX2h0fwQipZrTbdRb+TC6chUOQ==
X-Google-Smtp-Source: AMsMyM4/ckulTLgZqHNHnMxdJWtdBMFlK4rffsHgscSLjCkKU2bBfQg8KGjFilHHLfjxdWmKDWM1aQ==
X-Received: by 2002:a17:906:5d16:b0:783:78d5:e47a with SMTP id
 g22-20020a1709065d1600b0078378d5e47amr11572855ejt.453.1664693143152; 
 Sat, 01 Oct 2022 23:45:43 -0700 (PDT)
Received: from panicking.. ([109.52.206.103]) by smtp.gmail.com with ESMTPSA id
 26-20020a170906329a00b0077f5e96129fsm3569894ejw.158.2022.10.01.23.45.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Oct 2022 23:45:42 -0700 (PDT)
From: Michael Trimarchi <michael@amarulasolutions.com>
To: Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [RFC PATCH 0/4] Add RGB ttl connection on rockchip phy
Date: Sun,  2 Oct 2022 08:45:36 +0200
Message-Id: <20221002064540.2500257-1-michael@amarulasolutions.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kishon Vijay Abraham I <kishon@ti.com>, linux-rockchip@lists.infradead.org,
 Vinod Koul <vkoul@kernel.org>, linux-phy@lists.infradead.org,
 linux-amarula@amarulasolutions.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The rockchip phy can be convigured in ttl mode. The phy is shared
between lvds, dsi, ttl. The configuration that now I'm able to support
has the display output on some set of pins on standard vop output
and a set of pins using the ttl phy. The solution is not clean as I
would like to have because some register that are used to enable
the TTL, are in the same register area of the dsi controller.
In order to test I must add the following

dsi_dphy: phy@ff2e0000 {

	reg = <0x0 0xff2e0000 0x0 0x10000>,
		<0x0 0xff450000 0x0 0x10000>;
	...
}

The problem here is the second region I have added is the same of
dsi logic. Only one register is needed by the the phy driver

Michael Trimarchi (4):
  phy: add PHY_MODE_TTL
  phy: rockchip: Add inno_is_valid_phy_mode
  phy: rockchip: Implement TTY phy mode
  drm/rockchip: rgb: Add dphy connection to rgb output

 drivers/gpu/drm/rockchip/rockchip_rgb.c       | 18 +++++
 .../phy/rockchip/phy-rockchip-inno-dsidphy.c  | 72 +++++++++++++++++++
 include/linux/phy/phy.h                       |  3 +-
 3 files changed, 92 insertions(+), 1 deletion(-)

-- 
2.34.1

