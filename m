Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8806A653631
	for <lists+dri-devel@lfdr.de>; Wed, 21 Dec 2022 19:24:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5165410E472;
	Wed, 21 Dec 2022 18:24:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 394BA10E472
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Dec 2022 18:24:17 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id ud5so38842416ejc.4
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Dec 2022 10:24:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=lvcQjc1tSN+WqGFd2a+LQfMGe/jMGY/EiDX8AEMXwKA=;
 b=hsnKVAvJjTm/vH8ROKf0lkdPYG/7tVxNV4QRv9Wt419AAMTXG1RyIoWqpPrYlboYDL
 G+En2avRFUjXEw+mY9ehTVjyl/g3QE3P9/dyWPehv6jMxGQkyrCt6gsy9LCvm5cVnfeh
 yBB7k+nj787nK+wQ5P/muiBYTzsPTxv9UED0q2iTJH5walJPoVSSxAk+Gw1BdkJ9J7YQ
 OqMEEBmjhCzvcUq5dk59x4cVFiDM6UY5KuzdYxMswSmHmhiPfoCsqlRdlUEbBnzIDzVu
 0BSlC0Fg1WC9lZxoUlmZC9T5pWQoFYIi75t9NDwVKWUulP6jOcnx79Im+mkAmI0LjvdM
 cVTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lvcQjc1tSN+WqGFd2a+LQfMGe/jMGY/EiDX8AEMXwKA=;
 b=ShEGuMwS6XN0ZY6qim/HIse7RZRVLVP54mZLk94odWzW9QOyIfyPbSvgk+03TiCNk+
 belwIvZMLQT1DUOqmw2RaCSLTq/ionKs6iBeINxJsxdSDVzuC2kNmmfFQhUCo6q0RO2/
 peO1MUGciLuglmEh5bYHkeEhgMUyqrTzU+uwiMBYlakQ4moKOM8XBDn36aozaJ2LUilS
 NMPYTG2VbonbgZm4+NeVsPmeD/z17l26CAyj+lpG/UQA6vkAmbXjxdFCsmU7siYyqPo1
 UyaIDmmChSTpbBfidMDJv18tdzNTQ0SqFJyH16X/ek7bWrwxfyfgnE8M6+YyszpkaVG6
 jWNw==
X-Gm-Message-State: AFqh2ko7aR9HRnOJmPUw+3UtpcuUm7JMZa4wy8dua/ctDv72M2dulqvc
 FelWsxZFVt2YskkDjJgCy1E=
X-Google-Smtp-Source: AMrXdXv1K172bwT5L/tl5YVDCw1ihZJT7aJ7HP+WwaYs4jknJoZSk8wkCqixuBvSgTEK+37mI9z2FQ==
X-Received: by 2002:a17:906:850c:b0:7c0:f4f8:582a with SMTP id
 i12-20020a170906850c00b007c0f4f8582amr2389986ejx.52.1671647056884; 
 Wed, 21 Dec 2022 10:24:16 -0800 (PST)
Received: from [192.168.2.1] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id
 bq15-20020a170906d0cf00b007933047f923sm7281632ejb.118.2022.12.21.10.24.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Dec 2022 10:24:16 -0800 (PST)
Message-ID: <b2c329bc-33fd-b65d-2e67-273eb0780e80@gmail.com>
Date: Wed, 21 Dec 2022 19:24:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
From: Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH v5 06/12] ARM: dts: rockchip: rk3288: fix dsi node
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

Use generic node name for rk3288.dtsi dsi node.
With the conversion of rockchip,dw-mipi-dsi.yaml a port@1 node
is required, so add a node with label mipi_out.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 arch/arm/boot/dts/rk3288.dtsi | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/rk3288.dtsi b/arch/arm/boot/dts/rk3288.dtsi
index 487b0e03d..c22f90e53 100644
--- a/arch/arm/boot/dts/rk3288.dtsi
+++ b/arch/arm/boot/dts/rk3288.dtsi
@@ -1114,7 +1114,7 @@
 		status = "disabled";
 	};

-	mipi_dsi: mipi@ff960000 {
+	mipi_dsi: dsi@ff960000 {
 		compatible = "rockchip,rk3288-mipi-dsi", "snps,dw-mipi-dsi";
 		reg = <0x0 0xff960000 0x0 0x4000>;
 		interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
@@ -1137,6 +1137,10 @@
 					remote-endpoint = <&vopl_out_mipi>;
 				};
 			};
+
+			mipi_out: port@1 {
+				reg = <1>;
+			};
 		};
 	};

--
2.20.1

