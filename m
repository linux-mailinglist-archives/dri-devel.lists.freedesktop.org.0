Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 548F165363F
	for <lists+dri-devel@lfdr.de>; Wed, 21 Dec 2022 19:26:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 311FE10E478;
	Wed, 21 Dec 2022 18:26:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A840010E478
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Dec 2022 18:25:57 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id e13so23195529edj.7
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Dec 2022 10:25:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=lFvMuvMh7YEjHgfoyUurfQAp5Ldp3Bc2q4aAnoQCwkM=;
 b=l5lzKT0fdH5xMuiwJ9jOC+ldxvWofgM4nJqXUSh9Mn2iBc3NIAz25S/j6oWg5wYrVQ
 gvzeeWJyu5B6+vkCkhdelPxBTxp5hgJ8ta+Kgdj3md9R4uhu1d9BXGhAWyxlsypsgZ4F
 okIDxpGxkMAItqZ+zJHnCnzdS5wkaAoZ88r4mZofuH7H7Z+XSm0DJHCLDTxazfKvoE60
 IW2dauxNPsn1xODZUsqMFq6DeoGjZLY+Hs6LTjhpfoqEP9lnRohQY1sDr6ZlTlKh47fn
 MlO9z82lQbbSmbdjQZNJr6ArAlRqkjvPRoVbeyKPStliXXPcPomcrG5MFyKqJ8XDY71c
 uzxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lFvMuvMh7YEjHgfoyUurfQAp5Ldp3Bc2q4aAnoQCwkM=;
 b=yo2vGeOiGwq7eHuO1xnWBVPqevHq5JkWevmUrsV9fHtVAav181KNoDw11xxbOtgV2X
 bNrjLgBwitmORuWqRnNu9ValyprV1h9/wGmSIgm7a6DJIEKOLyfqh0JlfbpE0vatdqgD
 2Ke94DX6PlYsQbOhuBdUCoQ0jlppNoSwzep/EATOGschNGqejTH08g2KaJZvFSQMjsom
 upTmeb129pfxGdkwuYdJShz39uI6A7JRKOwLSM7bKhp+r+gTfz4LC5ChsKIV+TXCKDEn
 aYA+b64CWG2ukkIguZhAlKcLjKjeLykcrhOaY7D7zma9PAVAx7R/YJyT+81iZKvoF5/p
 us4w==
X-Gm-Message-State: AFqh2kphfqWhOdke6TizynutkVISz7y9zBlOJvqWQD1P+YQYC10NkBT9
 hDlGxBCilkxmhboYpcptD6I=
X-Google-Smtp-Source: AMrXdXtP9bzGWAfUkrd0SHR1XBaiEQah3omk51EpOFcUJ01rSPS2LZ2fESX9jvaXgwv0/ICAM8oH5w==
X-Received: by 2002:aa7:cf94:0:b0:47b:16f5:61dc with SMTP id
 z20-20020aa7cf94000000b0047b16f561dcmr2421265edx.37.1671647156160; 
 Wed, 21 Dec 2022 10:25:56 -0800 (PST)
Received: from [192.168.2.1] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id
 q20-20020a056402041400b0046c2eee21a2sm7278561edv.11.2022.12.21.10.25.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Dec 2022 10:25:55 -0800 (PST)
Message-ID: <50eb43e0-c39b-5512-edc5-78dcaa70b255@gmail.com>
Date: Wed, 21 Dec 2022 19:25:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
From: Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH v5 09/12] arm64: dts: rockchip: px30: fix dsi node
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

With the conversion of rockchip,dw-mipi-dsi.yaml a port@1 node
is required, so add a node with label dsi_out.
Also add label dsi_in to port@0.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 arch/arm64/boot/dts/rockchip/px30.dtsi | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/px30.dtsi b/arch/arm64/boot/dts/rockchip/px30.dtsi
index e34d81f29..272b01154 100644
--- a/arch/arm64/boot/dts/rockchip/px30.dtsi
+++ b/arch/arm64/boot/dts/rockchip/px30.dtsi
@@ -1117,7 +1117,7 @@
 			#address-cells = <1>;
 			#size-cells = <0>;

-			port@0 {
+			dsi_in: port@0 {
 				reg = <0>;
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -1132,6 +1132,10 @@
 					remote-endpoint = <&vopl_out_dsi>;
 				};
 			};
+
+			dsi_out: port@1 {
+				reg = <1>;
+			};
 		};
 	};

--
2.20.1

