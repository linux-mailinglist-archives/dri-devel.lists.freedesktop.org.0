Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 550802B8D63
	for <lists+dri-devel@lfdr.de>; Thu, 19 Nov 2020 09:32:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 073FA6E554;
	Thu, 19 Nov 2020 08:31:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50B0D6E428
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Nov 2020 13:58:39 +0000 (UTC)
Received: by mail-ej1-x644.google.com with SMTP id oq3so2878115ejb.7
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Nov 2020 05:58:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=MNzWsDtU39BR4iFEfSJQ9mnoYu92ToJLMEGgLWUUrPw=;
 b=YxD4BW5cjmQdz4D/NWPOTYFDoj79erTso5jj6MSUrfUHf5OPHU//Y+UjP6rHQ8VYEi
 vBjQQBNvcP9cw+uaMWj5PTsXnqGwi+kVyf/BQa0kDaY381yNAEK3VpqAAZ093jnk/LMK
 uTtUZiMYKd8Yzkuafi0CZD6v8UN+ngYxLTCukSBE1wNJ/fl4NlZ4t+DWlUI+C/vjax69
 nouAaB5P0vcCRk3Ub6qTmGOojyV8lhP+JClrNBmQxficjyoktGm12RqQIMnkW051Za3x
 r2gagmHv/V2uVmIY3M0N9T9Dl9MIz3112FQOwMO59615Oe+Zq9Y611rb0gojGj2SwgSl
 KrLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=MNzWsDtU39BR4iFEfSJQ9mnoYu92ToJLMEGgLWUUrPw=;
 b=AB1pFoio2yV6divT5F5eJE54T3kjmN8gFsQqA0faMoEnm1WmbsEOdFM/MpUcxkyZU4
 9N6exFKAlVLMEMnbfKbkk4L4Ix4xQ+xJ12oWovtDcPuoJZT3OF/K4vFR8L7knS5foPSl
 MZIsiOcExvBdBXR4ooEatAQ7vVbj92VzsxNMPTwWrf0HPY+wr1dNDQ2yab7q3PrNcJkQ
 S7Izjd81EibqalRH2zZkGBGC58Eputd9trVoRT4dsSyOIuP1L57CuL4PhBWDpjfemyao
 Vem9xMqyD7hHFe/P1BLe6mVQEhOouuPuZM9NMfKhKK0JkdxZFK1aXzlNYBcsqZ+7paVo
 UlMw==
X-Gm-Message-State: AOAM531E4XzMv4WeiWfO+7kd7tEAow71oUbUVPlyLKu2wqpQ5z9OVgrM
 SPw2L7vboDyNm+6aBi8Qk1A=
X-Google-Smtp-Source: ABdhPJyl5SpYNZp2HUHCYYO8l+T0uxxnjSi9rjNGR0CciOkx5xPSCoFR3ksws8b0r8sM04dsBaG9wA==
X-Received: by 2002:a17:906:374a:: with SMTP id
 e10mr14400381ejc.246.1605707918063; 
 Wed, 18 Nov 2020 05:58:38 -0800 (PST)
Received: from debian.home (81-204-249-205.fixed.kpn.net. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id cx6sm13721384edb.61.2020.11.18.05.58.37
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 18 Nov 2020 05:58:37 -0800 (PST)
From: Johan Jonker <jbx6244@gmail.com>
To: heiko@sntech.de
Subject: [PATCH v5 7/7] ARM: dts: rockchip: enable hdmi_sound and i2s0 for
 rk3066a-mk808
Date: Wed, 18 Nov 2020 14:58:22 +0100
Message-Id: <20201118135822.9582-8-jbx6244@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20201118135822.9582-1-jbx6244@gmail.com>
References: <20201118135822.9582-1-jbx6244@gmail.com>
X-Mailman-Approved-At: Thu, 19 Nov 2020 08:31:38 +0000
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
Cc: alsa-devel@alsa-project.org, linux-rockchip@lists.infradead.org,
 airlied@linux.ie, linux-kernel@vger.kernel.org, mturquette@baylibre.com,
 hjc@rock-chips.com, dri-devel@lists.freedesktop.org, lgirdwood@gmail.com,
 sboyd@kernel.org, robh+dt@kernel.org, broonie@kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Make some noise with mk808. Enable the hdmi_sound node and
add i2s0 as sound source for hdmi.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 arch/arm/boot/dts/rk3066a-mk808.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/rk3066a-mk808.dts b/arch/arm/boot/dts/rk3066a-mk808.dts
index eed9e60cf..5fe74c097 100644
--- a/arch/arm/boot/dts/rk3066a-mk808.dts
+++ b/arch/arm/boot/dts/rk3066a-mk808.dts
@@ -116,6 +116,14 @@
 	};
 };
 
+&hdmi_sound {
+	status = "okay";
+};
+
+&i2s0 {
+	status = "okay";
+};
+
 &mmc0 {
 	bus-width = <4>;
 	cap-mmc-highspeed;
-- 
2.11.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
