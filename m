Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C405065364A
	for <lists+dri-devel@lfdr.de>; Wed, 21 Dec 2022 19:27:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F81D10E479;
	Wed, 21 Dec 2022 18:27:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F1CB10E479
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Dec 2022 18:27:02 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id vv4so38885926ejc.2
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Dec 2022 10:27:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=3tzm+8PkCoG+IFqQnJKv6s/WFlDz1S9hgijTugMX/bI=;
 b=Disu3h00/Wb54++iZFoLClUFEFhCaaORJptiOD20dHdG+Js0vtzqGz5PPZRgBJG74N
 0Ts2oau97PHUS1qu59WdqWqqreC6Di+3wG2H1jMMyeNH1wJKJljeEOkHLxdnPx9tqMEe
 BjHn25wnkBHiTN90cipWgk3aWnQEmbs0CeOtMuwsQWiXgOJbN08MBoDCmvi3dfGyLAk1
 AdIj/z/3v0UyAfRnu2Q2ezFjjk1DMEjO4QcwPYtC+SDq5dxiVorL1SZSU/m4RttcAh1i
 KG9VK4gmPYfmXZnMXYrA/MADD6aOhpzGnk3FcYpe4xXeH3qlwllKZByIi3scGJYhuYcE
 kn5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3tzm+8PkCoG+IFqQnJKv6s/WFlDz1S9hgijTugMX/bI=;
 b=OHpWWlmBqSxCR7V3yhqbmFnKmrx0W7TwsJzHTKJfu6eyszXadl76BdINe5wosOJQGy
 TM3u4B+I8TZ+SuLYdaEnkBOlf1VW51X4ZIuncMMbn0Qlcy/XR1Nw3Sb7zroupGllASqa
 XeX71k2kEkeisWfjiE5sZsTp755ruDfeXLzCgVxHdSDJz1zJ1U2YKYVq3Dg5KONJavHd
 xfBDq4BV8CJ6lGtzr0NpR55rc6qpCjDQo0XaV7TbjlxqktRp8kXwsGOnaHY8wEfFx6rh
 rEIi2DTBz9CleUA3sszdyIZgVKdyTnBIkzUGzGCaHsZyxQ9BMyTsD5YheddvwwGRd445
 DxSA==
X-Gm-Message-State: AFqh2kopCtwhRRADzWgg+I8nkuqfVirA6nybCeilLVgd+OXtqeVoLYYj
 /ZRhvVJ5LvrKEKy5d52gtAg=
X-Google-Smtp-Source: AMrXdXt6ILaPZxXaZkt/4DH9vZSFIGy460+kqXNoi6CbgMozPJHOZ/xsGmRmC5XMPwiHIWeJDm0GKA==
X-Received: by 2002:a17:906:71c3:b0:7c0:dd80:e95e with SMTP id
 i3-20020a17090671c300b007c0dd80e95emr5789134ejk.51.1671647220873; 
 Wed, 21 Dec 2022 10:27:00 -0800 (PST)
Received: from [192.168.2.1] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id
 la15-20020a170907780f00b007a8de84ce36sm7262965ejc.206.2022.12.21.10.26.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Dec 2022 10:27:00 -0800 (PST)
Message-ID: <6b4669ba-4731-d3e3-3293-f5fc69ccf6cf@gmail.com>
Date: Wed, 21 Dec 2022 19:26:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
From: Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH v5 11/12] arm64: dts: rockchip: rename vbus-supply to
 phy-supply in rk3566-box-demo.dts
To: heiko@sntech.de
References: <7f883643-c796-029f-ba38-73532325632d@gmail.com>
Content-Language: en-US
In-Reply-To: <7f883643-c796-029f-ba38-73532325632d@gmail.com>
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
Cc: linux-arm-kernel@lists.infradead.org, neil.armstrong@linaro.org,
 jernej.skrabec@gmail.com, krzysztof.kozlowski+dt@linaro.org, jonas@kwiboo.se,
 gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 linux-usb@vger.kernel.org, hjc@rock-chips.com, robert.foss@linaro.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 andrzej.hajda@intel.com, robh+dt@kernel.org, Laurent.pinchart@ideasonboard.com,
 devicetree@vger.kernel.org, philippe.cornu@foss.st.com
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

