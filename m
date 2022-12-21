Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18186653639
	for <lists+dri-devel@lfdr.de>; Wed, 21 Dec 2022 19:25:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24BD910E474;
	Wed, 21 Dec 2022 18:25:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF42310E47B
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Dec 2022 18:25:23 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id a16so23189683edb.9
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Dec 2022 10:25:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=bW6Hd9ovFsWCrzyECcvTbdEVVhvmMqsQBtWMpTHrRQw=;
 b=c6PLr84dzk55g4TInxedeMSL6DbBADfkbaE+qIPw3Qn+5j/qhJXOmQTG6hY/PcWH8g
 aDf37hQlbTXxU9q/kwcsm9XhbVdr6PkKPBho3MCvFt6nuKNekmSjx8t9XxODZFvuUK/1
 v01moJBqkKUha+/niV0yAX4n3hegzpLt3xRcCzlpONPs6QRfL7QilSk3U9Q7JsL0QQgI
 j0nk5iTi4emDiCAp3FxPXwq6zpfy+/nHAhnPn4Z7ujR1zKW0js/54wGdhh7RdpN7W9ma
 vWBzBfy1d24O388Zv6R7p804WcYvsE853PdgOReHLNwpHaExWEUqprsJZ86m0XDSTEda
 ePAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bW6Hd9ovFsWCrzyECcvTbdEVVhvmMqsQBtWMpTHrRQw=;
 b=BrmhxUswGoF6jgBVQIUTsKkCxqRkwkVrOwvBlR5+ZfOPaA0mgaRUpNUjU//L9AocYh
 1veRyDUy8UlelLO4ZlSgD7myc2Bl+mc/lamsZF6fZ7WvQcTNlVhEkicSqEXJFBVCgUcT
 f4fakTxei22Ih+qxapdcyXcKwDcjI/e+BcSyFgmIOU7RsrdF2Z1ozgypMCmJdCXOFOz7
 SxqXKpN7Dv8CVyjbhVZEVDLoU1rExG2fAwEn3YCwK/hezasGfBMi0kg40h4tbS8OzNEX
 RFxFh8Fc009cFlKWiWC7Kt6ecESafAXqU9vTp1OhqIZSTP5nSH9TKXevte+4DEjBoSRc
 qwoA==
X-Gm-Message-State: AFqh2kp7W6L2KTSA/RzJ/EXRzztmDVvcgySkd9zEPj6Mp9iHOZzCPQwf
 lTICSVqwWfHIL5oFcmAwKU0=
X-Google-Smtp-Source: AMrXdXvTC/4eIpPvqgKcBGiKaMezF5TmdklRaodynC+6Ax6UhTecCm8Kbwq4bFPQzwHpDW5kOEXcrA==
X-Received: by 2002:aa7:cd04:0:b0:46f:a70d:fef2 with SMTP id
 b4-20020aa7cd04000000b0046fa70dfef2mr2382224edw.35.1671647122248; 
 Wed, 21 Dec 2022 10:25:22 -0800 (PST)
Received: from [192.168.2.1] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id
 d30-20020a056402401e00b0046b25b93451sm7255607eda.85.2022.12.21.10.25.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Dec 2022 10:25:21 -0800 (PST)
Message-ID: <76fea2e4-f298-19d6-69b0-d99dcfb142ed@gmail.com>
Date: Wed, 21 Dec 2022 19:25:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
From: Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH v5 08/12] arm64: dts: rockchip: px30: fix lvds node
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

With the conversion of rockchip,lvds.yaml a port@1 node
is required, so add a node with label lvds_out.
Also add label lvds_in to port@0.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---

Changed V5:
  rename title
  add label lvds_in
---
 arch/arm64/boot/dts/rockchip/px30.dtsi | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/px30.dtsi b/arch/arm64/boot/dts/rockchip/px30.dtsi
index bfa358042..e34d81f29 100644
--- a/arch/arm64/boot/dts/rockchip/px30.dtsi
+++ b/arch/arm64/boot/dts/rockchip/px30.dtsi
@@ -453,7 +453,7 @@
 				#address-cells = <1>;
 				#size-cells = <0>;

-				port@0 {
+				lvds_in: port@0 {
 					reg = <0>;
 					#address-cells = <1>;
 					#size-cells = <0>;
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

