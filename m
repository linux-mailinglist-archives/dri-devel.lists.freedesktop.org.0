Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBBBC654322
	for <lists+dri-devel@lfdr.de>; Thu, 22 Dec 2022 15:32:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED6FD10E514;
	Thu, 22 Dec 2022 14:32:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FD2910E514
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Dec 2022 14:32:55 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id vv4so5366979ejc.2
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Dec 2022 06:32:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=/yrUavxSC0YydN0TKXWkrYFUw9v5M/WABkWirfDs3Xc=;
 b=RGUKyx4pjlE81gC/a8eQInZ7qvs0UWhPxxdmRGaK+mifofPPgpx0WGBmdJobxAYIQ/
 PLO7GXJm8O+8yrTMjYgOMMNxJqJBtqWig5wRtDIS7/Gqi+Xlt2YjmI3Nmc2vM8aM4VpN
 b557b6VzkA8hT5kh9QqYhSC753IFQitWiJAqz/EwafSjK16nRN2qkwR7HcK57eY1c7lh
 rfqxKk//PpVWOQQrzL1F05oUAWVWO9z+nOZ+9zZ5p94GX0OOiFSF0Gu848vCUNDoKcBx
 PtssmvKdqBb8C0pGGBFqtCazZKizoOQLlFdfSWPS9rpLQgkMPtinfdFpuYBP/4gXFqwY
 HENg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/yrUavxSC0YydN0TKXWkrYFUw9v5M/WABkWirfDs3Xc=;
 b=EfFlBWupiwXzshD9EO4u5TdsSz/xWzXFak2ki3gFe6AIB8Mjqgi/6fwBP2cZ3dhKAW
 5lwD2+W/PAbdie7zeBh6s0rv2OMCb0PTNs1TuB2n1pS6vKIh+lksZYVA/AxBtEEorffs
 jWRwH8NkrPpz/it4/Lxf9RD1cAWUv/b9EqX4u7hSfNchXYfpjPbjXRbH/qURVjcmSkh8
 MEwL9J1Q+hDENrSlqWjSZcwx4gbEXWN7xS5pm97IkmpIGyHS2gDV4Fdz7bP/op5UirdC
 M5jeeMc8q+XbBiEnCEf/HR6+wwc0wXyrc9Ay+GQhTVENKXgSaja8cU7nAHDkm4FefVJa
 Twlw==
X-Gm-Message-State: AFqh2kqzW0/Gc9hUSixuda/+0lBIdZ01daDG/BviGPD36OeuoL8m6zuF
 ad95z/yafphy3aloZ8GOCNc=
X-Google-Smtp-Source: AMrXdXtqZ8JJqmp8AaMY3noPII7c2qvGh6kRZJ79yXNnz5AOds68D7oxejOaYC7RFzTdVnkiwPRxLQ==
X-Received: by 2002:a17:906:c0ce:b0:7ad:d7a4:4346 with SMTP id
 bn14-20020a170906c0ce00b007add7a44346mr5969104ejb.66.1671719573988; 
 Thu, 22 Dec 2022 06:32:53 -0800 (PST)
Received: from [192.168.2.1] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id
 ku22-20020a170907789600b007c10d47e748sm313265ejc.36.2022.12.22.06.32.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Dec 2022 06:32:53 -0800 (PST)
Message-ID: <f6008819-db9b-0944-3f5b-5522b7cd8a8d@gmail.com>
Date: Thu, 22 Dec 2022 15:32:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
From: Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH v6 15/17] arm64: dts: rockchip: rk3399: fix dp node
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

Use generic node name for rk3399.dtsi dp node.
With the conversion of rockchip,analogix-dp.yaml a port@1 node
is required, so add a node with label edp_out.
Also restyle.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3399.dtsi | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
index 2250533cf..e02483b72 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
@@ -2037,7 +2037,7 @@
 		};
 	};

-	edp: edp@ff970000 {
+	edp: dp@ff970000 {
 		compatible = "rockchip,rk3399-edp";
 		reg = <0x0 0xff970000 0x0 0x8000>;
 		interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH 0>;
@@ -2054,6 +2054,7 @@
 		ports {
 			#address-cells = <1>;
 			#size-cells = <0>;
+
 			edp_in: port@0 {
 				reg = <0>;
 				#address-cells = <1>;
@@ -2069,6 +2070,10 @@
 					remote-endpoint = <&vopl_out_edp>;
 				};
 			};
+
+			edp_out: port@1 {
+				reg = <1>;
+			};
 		};
 	};

--
2.20.1

