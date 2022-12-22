Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E32654330
	for <lists+dri-devel@lfdr.de>; Thu, 22 Dec 2022 15:34:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A242A10E517;
	Thu, 22 Dec 2022 14:33:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87E6B10E517
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Dec 2022 14:33:25 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id bj12so5250317ejb.13
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Dec 2022 06:33:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=3tzm+8PkCoG+IFqQnJKv6s/WFlDz1S9hgijTugMX/bI=;
 b=TzOXnr9K4kajX9bIK/WZB3FahhP1w6vqcHzSRLDI1wGi8vPRQotaTMBjFQ5acMX+Kn
 Wk07AvtQlG6j023kKCKliq4wIY4sbpLmTLDocADmSRQvP9EZqXgOOI8/BwcjFdWB2y7Q
 sbgCzDz4mJ47mzZq11IsTixO/Sk9UGdkjwz+Dy0EkV6rb+7po2/oOLbsRlk8kzMQ+Bev
 oDayfXtv7pIKMnlDlaulk/s0on6V7VZqu/EfalrF4copH2a2qXdLo4I0IbWnfne2uTe0
 Ht9dBlptgRTVZ+XraSWBxFmJrWrLSl0iibQLRyTXOZXxZrR/KarQY+T63ZWwO8BAZT5F
 qLWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3tzm+8PkCoG+IFqQnJKv6s/WFlDz1S9hgijTugMX/bI=;
 b=tW36IbYbX/A6n4t8DJpu7uBeXbac4sciN91xkNxcBEUgpbiqvY/YkKmWonvCsGCYdv
 QXIXPvGz0HWow4S6Hxc5sdj2PrWmZgDehknXJLshFtJXxntw+77xPHQGbz+oPvHstyzv
 b5Tp7a4ArxEk36HLOZMAmXAlZdM0y9yDOmYfHQBNUSvPWwxmeerP+vlBwGUI1hUlHWUy
 2TLH3uv2bwcN0S2k986/9NlWuutzsCKUyOECddX82Ihq0ivOt7CPW7nvz4R5MocfxQXx
 2blKF+V9pd91l+v2XXnfI03QnHXyvJRZGOu02wXQHgycv6v+dx3NbpCeDELdnS1Ru8yz
 1IFw==
X-Gm-Message-State: AFqh2kpEBCavbY9UNh6JPjDpTHl0vbGc1M6CkxuaSaD/opPNpxHXcHth
 fzwwznYPuOFVuXm7mmGscY4=
X-Google-Smtp-Source: AMrXdXvRhRHj2vwrTPeoGMfOkoJbnMKxdSD94gT8jMnTAO4Eim3FH5O3xsHrF4NAry/VlNnLCTxHpg==
X-Received: by 2002:a17:906:191a:b0:837:c2fc:a97c with SMTP id
 a26-20020a170906191a00b00837c2fca97cmr4736411eje.64.1671719604154; 
 Thu, 22 Dec 2022 06:33:24 -0800 (PST)
Received: from [192.168.2.1] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id
 b12-20020aa7dc0c000000b0046892e493dcsm429715edu.26.2022.12.22.06.33.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Dec 2022 06:33:23 -0800 (PST)
Message-ID: <1889d8ee-e119-4a52-33a1-b990a41a137c@gmail.com>
Date: Thu, 22 Dec 2022 15:33:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
From: Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH v6 16/17] arm64: dts: rockchip: rename vbus-supply to
 phy-supply in rk3566-box-demo.dts
To: heiko@sntech.de
References: <67771143-fd83-383d-41b2-68e8707134e8@gmail.com>
Content-Language: en-US
In-Reply-To: <67771143-fd83-383d-41b2-68e8707134e8@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: andrzej.hajda@intel.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Laurent.pinchart@ideasonboard.com,
 krzysztof.kozlowski+dt@linaro.org, linux-samsung-soc@vger.kernel.org,
 jernej.skrabec@gmail.com, linux-rockchip@lists.infradead.org,
 alim.akhtar@samsung.com, devicetree@vger.kernel.org, jonas@kwiboo.se,
 robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 neil.armstrong@linaro.org, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, sw0312.kim@samsung.com, hjc@rock-chips.com,
 robert.foss@linaro.org, kyungmin.park@samsung.com, philippe.cornu@foss.st.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

'vbus-supply' does not match any of the regexes in rk3566-box-demo.dts
in the usb2phy0_otg node, so rename vbus-supply to phy-supply.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3566-box-demo.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3566-box-demo.dts b/arch/arm64/boot/dts/rockchip/rk3566-box-demo.dts
index 4c7f9abd5..4dc9b7623 100644
--- a/arch/arm64/boot/dts/rockchip/rk3566-box-demo.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3566-box-demo.dts
@@ -464,7 +464,7 @@
 };

 &usb2phy0_otg {
-	vbus-supply = <&vcc5v0_usb2_otg>;
+	phy-supply = <&vcc5v0_usb2_otg>;
 	status = "okay";
 };

--
2.20.1

