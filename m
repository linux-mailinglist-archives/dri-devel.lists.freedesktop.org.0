Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A029478CA97
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 19:18:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ED8B10E456;
	Tue, 29 Aug 2023 17:18:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 318C410E450
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 17:17:53 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2b962535808so71701191fa.0
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 10:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693329471; x=1693934271;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G4PHXGicMxBk+MJKalmg1iNAvJdEv1pEopykpBO9nUE=;
 b=EShIb7E+Z3Us6tkTRIUmptYNcn1c25vEpCspbQxGLoL+VKjAo/XzXV/t/I+jrto2Lx
 gVt5UeRIM1WKSIll76L1JN3B79kBVT0lfFGsZnECJ+uNIBuxz1f7TJblkBfZMrSiQIGT
 /0z+a+iJBak/4doNX0w1w3AVduVoXz63YzJV0i4k16xgEWkLoxvOSrJX0wFxYJv9WUY1
 Rjb/7WG9lvaXaAj6RvmuX6qBaDS2uP3leouUnNxofbkxuT0zXGRF2JJDC72nriYF029x
 j27ZDobOtTmUm6vnZjKJWnpQrz5BBImekLEhx/6psHKvowGH9bJ2vhLR1YW4bkq4R6lN
 XaHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693329471; x=1693934271;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=G4PHXGicMxBk+MJKalmg1iNAvJdEv1pEopykpBO9nUE=;
 b=Iu2jCARSsHFNwbwlzLe6k+Gp+/Q2Xb2sdLlixNx0tsf6eWtCcaNcNPVCG33TMay4na
 oUkFrWrqZrKdK38aMuPt0ASQ2t+qBkihXxDv0cUud5sNdorX9OpY1VyQL72Rsv4K65dH
 z+AMwMqG2q0vB277yfj3mNxBL7147FqQxN+9rjh7x6oAQzcVpb/Ak/96CZtrKmCkeXcq
 47U+jQ2qout5X4Hvihni+rHpCHUAtchkGcGsiAFAKUlBvDIOgMXY2JDMJ7z2Gs3uOeh7
 5BBy2fdHDve/gWM2S5jGmTcZ4RXf55UpI8+ujJnBos9y0LIFomiMflkbWqqzfrPOtwes
 L3/w==
X-Gm-Message-State: AOJu0YyZPLyaFazo+5chdaHf0RXm7zxl3V1Cx98aIXZhjgRve0e2bBsC
 VLwRsl7XWWPt7bhAXaIoXWeHBjoA5Q==
X-Google-Smtp-Source: AGHT+IEQB3R89Y565RxZaGfUe+xAj9rNo4DRqqtlbGvy1GBw6QhT8IIxT0/e3EW2cHJ2YckOECQ8ww==
X-Received: by 2002:a2e:9084:0:b0:2b9:f007:9910 with SMTP id
 l4-20020a2e9084000000b002b9f0079910mr20989559ljg.53.1693329471278; 
 Tue, 29 Aug 2023 10:17:51 -0700 (PDT)
Received: from U4.lan ([2001:9e8:b958:3410:8e0c:ed68:cd6c:7cb8])
 by smtp.gmail.com with ESMTPSA id
 a21-20020a1709062b1500b00993cc1242d4sm6115834ejg.151.2023.08.29.10.17.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Aug 2023 10:17:50 -0700 (PDT)
From: Alex Bee <knaerzche@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Lee Jones <lee@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>
Subject: [PATCH 27/31] ARM: dts: rockchip: Add dwc2 otg fifo siztes for RK312x
Date: Tue, 29 Aug 2023 19:16:43 +0200
Message-ID: <20230829171647.187787-28-knaerzche@gmail.com>
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

The driver currently won't probe correctly if those values are missing.
They have been taken from dowstream kernel and match those of other
Rockchip SoCs.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
 arch/arm/boot/dts/rockchip/rk312x.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/rockchip/rk312x.dtsi b/arch/arm/boot/dts/rockchip/rk312x.dtsi
index ce3f03c3532e..019aa92c0cfa 100644
--- a/arch/arm/boot/dts/rockchip/rk312x.dtsi
+++ b/arch/arm/boot/dts/rockchip/rk312x.dtsi
@@ -280,6 +280,9 @@ usb_otg: usb@10180000 {
 		clocks = <&cru HCLK_OTG>;
 		clock-names = "otg";
 		dr_mode = "otg";
+		g-np-tx-fifo-size = <16>;
+		g-rx-fifo-size = <280>;
+		g-tx-fifo-size = <256 128 128 64 32 16>;
 		phys = <&usb2phy_otg>;
 		phy-names = "usb2-phy";
 		status = "disabled";
-- 
2.42.0

