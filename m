Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1160D78CA96
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 19:18:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 515E110E457;
	Tue, 29 Aug 2023 17:18:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C819810E450
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 17:17:45 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-99c1c66876aso600360066b.2
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 10:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693329464; x=1693934264;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+TRUGa9PL5nV/dnusn+UwSq4N+QNad+BtpjMEE4na6E=;
 b=OZFbsoxBYbtJUhBBQxapgnMGaORPO11QLmwTffX0UwxhOO9s9i5coEpHA085+055+k
 x2iktQWtW72gYg3DJirC4o0W9QCuzVCpCgg1Gq9TYwIcuteNM07twA6BYqfOYdEpO9Io
 alnN55qzVOZz3qYGtXBRHU8IXdI9kiNllXn0qe8Y0YmWO55RgH6+pi4F+ol+JqpXg43t
 LKv+EOx4qMMSIL6Xux72JFIbrawAGnf7QkvbIwIxHzzB57j5vsQdqpoYujPoP79jWn5/
 5gq/p4lZFDf/SOPeI1jh1UaDWIfFIPHyi7l56l85xK4fnVcmf0s7N1wZqxOpeqdKWFO4
 ra7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693329464; x=1693934264;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+TRUGa9PL5nV/dnusn+UwSq4N+QNad+BtpjMEE4na6E=;
 b=aKRQMqxGzYB58ovnR6UwSqsLdrxsbPcuGh0p+PDJkdc5OQVuqpN6csAHxVmwADWvvY
 RYYcysD8F+1yRMsBIMtbBAnk9aXP4ghwXhs0T5FOjc+1nyHL5Ey+VoDP6+wlmWQwmdso
 CbrBAnilfhXwlkY2fcqOFGiP5Dju8U7Bf7ohvV691eZ6nYbomjeo/fqqozBuYKTnx8ol
 Wsge+oAzxLCWh+jJzI5wJhERi9iqMaOqT6/0LBkySlGQrM6WAQtcnN0Fk+kUHpy5Cnta
 awx+pAQ6kAYBZhzIRi+5FZ1oh965IXBFWO3OeMZz1+eukfZ8ZHRSIHkomLPp0salc/1e
 lB7Q==
X-Gm-Message-State: AOJu0Yzo4MLZ3FdOzBKQXa0jkKCuVnTiUX/wavNR6+Vmo8WrpAAWWyWN
 2MbiWGZXITMFsF2dJ2jzrg==
X-Google-Smtp-Source: AGHT+IHSs6leoLR21rpe27haxf2M/3AjrTL1AjjD92jIJAICN7I5rW7t/aMEMKebF0K+otgr7qN1Ig==
X-Received: by 2002:a17:906:5346:b0:9a2:1ce5:1243 with SMTP id
 j6-20020a170906534600b009a21ce51243mr12595166ejo.60.1693329464222; 
 Tue, 29 Aug 2023 10:17:44 -0700 (PDT)
Received: from U4.lan ([2001:9e8:b958:3410:8e0c:ed68:cd6c:7cb8])
 by smtp.gmail.com with ESMTPSA id
 a21-20020a1709062b1500b00993cc1242d4sm6115834ejg.151.2023.08.29.10.17.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Aug 2023 10:17:43 -0700 (PDT)
From: Alex Bee <knaerzche@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Lee Jones <lee@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>
Subject: [PATCH 20/31] ARM: dts: rockchip: Add extra CPU voltages for RK3126
Date: Tue, 29 Aug 2023 19:16:36 +0200
Message-ID: <20230829171647.187787-21-knaerzche@gmail.com>
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

While RK3126's CPU cores can operate at the same frequencies as RK3128, but
it needs higher voltages.
The values have been taken from vendor's downstream kernel.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
 arch/arm/boot/dts/rockchip/rk3126.dtsi | 27 ++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm/boot/dts/rockchip/rk3126.dtsi b/arch/arm/boot/dts/rockchip/rk3126.dtsi
index 7345bd95d29d..09c40f3d69a8 100644
--- a/arch/arm/boot/dts/rockchip/rk3126.dtsi
+++ b/arch/arm/boot/dts/rockchip/rk3126.dtsi
@@ -7,3 +7,30 @@
 / {
 	compatible = "rockchip,rk3126";
 };
+
+&cpu_opp_table {
+	opp-216000000 {
+		opp-microvolt = <1000000 1000000 1425000>;
+	};
+	opp-408000000 {
+		opp-microvolt = <1150000 1150000 1425000>;
+	};
+	opp-600000000 {
+		opp-microvolt = <1150000 1150000 1425000>;
+	};
+	opp-696000000 {
+		opp-microvolt = <1150000 1150000 1425000>;
+	};
+	opp-816000000 {
+		opp-microvolt = <1200000 1200000 1425000>;
+	};
+	opp-816000000 {
+		opp-microvolt = <1200000 1200000 1425000>;
+	};
+	opp-1008000000 {
+		opp-microvolt = <1350000 1350000 1425000>;
+	};
+	opp-1200000000 {
+		opp-microvolt = <1425000 1425000 1425000>;
+	};
+};
-- 
2.42.0

