Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC8578CA94
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 19:18:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 923EC10E452;
	Tue, 29 Aug 2023 17:18:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14A2310E450
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 17:17:55 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-99d937b83efso615002866b.3
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 10:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693329474; x=1693934274;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FWLxgtqau2yJo36SsneTQsDsVw22iqHp96edYBnf0k4=;
 b=DYqQwQyTYCKikxyb60b1L/cidyYBoJlyYx7DxCxp/DB+czy+oU22765aVqWMq9gChN
 hzGEHV6Ukz3+gA74rYbufEwC2om/X8PtXxXA3N4xznw7V3cK6OUceS64tiUtUh4lQPuZ
 qvxPqnf3hK4BA3whTsYfsEi6LxYF3o5Zmt46/Dv4v/PQEoWAF/mUpr/tVxZ7VVCfDarZ
 mLrYEkTYyOAS4e9Z4fXdLaY72iT9bCF1mJiIdDpUW5Iw6c1lmIe3+MiIWrm9ATp5bMj7
 ZuPqabLS7qMEYqkgArtWxlTFln3aqUH+fMUcDuldrO9akccaSGMeHmH6Nx3uouf7wLBI
 xCWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693329474; x=1693934274;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FWLxgtqau2yJo36SsneTQsDsVw22iqHp96edYBnf0k4=;
 b=YL/RzoTmorvMQLua+z4zRXG98XDq/6FcW5HPpOJWI5qTRTws8XmD4ksQ8ra4SKCxwl
 8ctrRIVzjuMQe4IMoT5KCSprrXvx6C0zdK1T1YOnq6T6i3Lna5SakNdRhRr+pVe0C1xa
 fAj7Bhg4upriHQDnkbzl8UEkhDx1PwOC1SJ+u6pX0QdM+RztVcOtMWPsD8AWfkme7k7Z
 lYWlaJNP9L9wBm/Ps6j14Jd+xIddtCAb3OsR83Nfrj4L5Pcys6m72nEFOuNbPG8UNLNc
 RWQEzc4QIbtn3RWvD75YNE0B6jW+pTpMOvuQ3r0RZDNcnevEVuH5bRQX/hDxhxSvSPLK
 0nwQ==
X-Gm-Message-State: AOJu0Yyu2nL8G6/Mh8nNB0VOUk+W7xEY7FHT/NpM1PoWM6z82u/VCgZ8
 HB97eIQFjtS9FSLNQ8l7ag==
X-Google-Smtp-Source: AGHT+IHXNp8WBS05GZKX2uNVCiNbXcRpufiupVelX14WxEIUnMHV/eQymrQIzu4L1T4F5np5oSoR4g==
X-Received: by 2002:a17:906:13:b0:9a2:19ea:88fc with SMTP id
 19-20020a170906001300b009a219ea88fcmr13209839eja.71.1693329474462; 
 Tue, 29 Aug 2023 10:17:54 -0700 (PDT)
Received: from U4.lan ([2001:9e8:b958:3410:8e0c:ed68:cd6c:7cb8])
 by smtp.gmail.com with ESMTPSA id
 a21-20020a1709062b1500b00993cc1242d4sm6115834ejg.151.2023.08.29.10.17.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Aug 2023 10:17:53 -0700 (PDT)
From: Alex Bee <knaerzche@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Lee Jones <lee@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>
Subject: [PATCH 30/31] ARM: dts: rockchip: Add sdmmc_det pinctrl for RK312x
Date: Tue, 29 Aug 2023 19:16:46 +0200
Message-ID: <20230829171647.187787-31-knaerzche@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230829171647.187787-1-knaerzche@gmail.com>
References: <20230829171647.187787-1-knaerzche@gmail.com>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Elaine Zhang <zhangqing@rock-chips.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Alex Bee <knaerzche@gmail.com>,
 linux-rockchip@lists.infradead.org, linux-phy@lists.infradead.org,
 Johan Jonker <jbx6244@gmail.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The pincontrol for sd card detection is currently missing.
Add it.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
 arch/arm/boot/dts/rockchip/rk312x.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/rockchip/rk312x.dtsi b/arch/arm/boot/dts/rockchip/rk312x.dtsi
index 19bd6448d122..5388264b54f6 100644
--- a/arch/arm/boot/dts/rockchip/rk312x.dtsi
+++ b/arch/arm/boot/dts/rockchip/rk312x.dtsi
@@ -969,6 +969,10 @@ sdmmc_cmd: sdmmc-cmd {
 				rockchip,pins = <1 RK_PB7 1 &pcfg_pull_default>;
 			};
 
+			sdmmc_det: sdmmc-det {
+				rockchip,pins = <1 RK_PC1 1 &pcfg_pull_default>;
+			};
+
 			sdmmc_wp: sdmmc-wp {
 				rockchip,pins = <1 RK_PA7 1 &pcfg_pull_default>;
 			};
-- 
2.42.0

