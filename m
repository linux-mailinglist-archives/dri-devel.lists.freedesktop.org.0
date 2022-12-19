Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 032646510CE
	for <lists+dri-devel@lfdr.de>; Mon, 19 Dec 2022 17:58:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2C6C10E2DB;
	Mon, 19 Dec 2022 16:57:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94B3510E2E3
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Dec 2022 16:57:27 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id d20so13843690edn.0
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Dec 2022 08:57:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=PhS7akt6/5GjmmwqRvvKx92tJjukY5PHM/MpxFGF9Zc=;
 b=O6tqEZsEXSBDdaMX34qiTVIG/tCQZf3MHEbs5did8QH3VP+2Jlcupm0+WKd90mIeiy
 Bk65T3wxesG04szD7+xUhDEaB6cQnlihEjONTv6S5QnHc+ctVfPYu7I2hJhJQ/3V2beQ
 PWCqYW5ZJYFoc5QxT5/8l9lRQcgdTT8oi0X/OSCLH8jFhP8lZjSCD6pdopivuC0sSvaa
 hQND66rxBh6Pzr7nA8ECL5hW53QBPaP25K7LmWnw1l0zdwhP+6aQNHHBdM/aEEKWZ9kL
 xJzCfBCN4X7O2LWbYIEFPRaZb/NaaMkZtQSjQ+2EaAbkt6FRNmgI+JLc9E8yTVjV4Dye
 x2pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PhS7akt6/5GjmmwqRvvKx92tJjukY5PHM/MpxFGF9Zc=;
 b=b37gtcivEHPnmF1OeeMMzOvN/kkbm5NL5AFlP06ZvEYrSOUEtddlNWk5twUKxSZsBF
 D1fVOUrqYwidEhwZNK8WWeKk/zjMqiXebg5W6CudGRC2wGAj92bpIt1738AkpIDibBoG
 Lur/ICm70in7a9vT0frfLOPgu2o67dYOw+ebsuijLxUnFrZ1eny8UNpBQ+3c9MKQ4+nG
 Vgowp6gtB/sz8lux4zKTE1gtsHSP1XHWIATvfkyKaHGzZ5vY8oit4UDZNaPKr0U5uBs1
 Qixu1hS26LJwM5tCE8BbMc6imXyYbmQQiW2ZIb/F8Lb2BAwv7ctoqUaw4WuTQcvkSnJc
 wBYw==
X-Gm-Message-State: ANoB5pmxvpfOVbCbkuJY3mkWCbQpXO77eXXj6AvT+0XjSn38uWCHWgXk
 faeuBLlWLwH0hFTAtb8cvJU=
X-Google-Smtp-Source: AA0mqf5amfEQflBYCgdGYyKTURYwp0xR5McAfORx30XNSIPPpUGv8Jy8egORwKoegqp/8goadXoj7g==
X-Received: by 2002:a05:6402:289c:b0:461:bf47:ba43 with SMTP id
 eg28-20020a056402289c00b00461bf47ba43mr50547191edb.28.1671469046095; 
 Mon, 19 Dec 2022 08:57:26 -0800 (PST)
Received: from [192.168.2.1] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id
 b23-20020a056402139700b0046c4553010fsm4633925edv.1.2022.12.19.08.57.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Dec 2022 08:57:25 -0800 (PST)
Message-ID: <cde111a8-2a0f-74bb-9a0a-653091fd3788@gmail.com>
Date: Mon, 19 Dec 2022 17:57:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
From: Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH v4 5/5] arm64: dts: rockchip: px30: add lvds_out node
To: heiko@sntech.de
References: <7f38e245-4fc0-1754-e75c-10c1e31bbd4d@gmail.com>
Content-Language: en-US
In-Reply-To: <7f38e245-4fc0-1754-e75c-10c1e31bbd4d@gmail.com>
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
Cc: kishon@kernel.org, devicetree@vger.kernel.org,
 krzysztof.kozlowski+dt@linaro.org, hjc@rock-chips.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, vkoul@kernel.org, robh+dt@kernel.org,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With the conversion of rockchip,lvds.yaml a port@1 node
is required, so add a node with label lvds_out.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 arch/arm64/boot/dts/rockchip/px30.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/px30.dtsi b/arch/arm64/boot/dts/rockchip/px30.dtsi
index bfa358042..eb414d0f8 100644
--- a/arch/arm64/boot/dts/rockchip/px30.dtsi
+++ b/arch/arm64/boot/dts/rockchip/px30.dtsi
@@ -468,6 +468,10 @@
 						remote-endpoint = <&vopl_out_lvds>;
 					};
 				};
+
+				lvds_out: port@1 {
+					reg = <1>;
+				};
 			};
 		};
 	};
--
2.20.1

