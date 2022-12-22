Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0DB65431C
	for <lists+dri-devel@lfdr.de>; Thu, 22 Dec 2022 15:32:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB80B10E509;
	Thu, 22 Dec 2022 14:31:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB34C10E509
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Dec 2022 14:31:55 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id tz12so5286027ejc.9
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Dec 2022 06:31:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=lFvMuvMh7YEjHgfoyUurfQAp5Ldp3Bc2q4aAnoQCwkM=;
 b=UEIhkKWoFeB7/VD8t9PzUu7vtS7TIeFsilzBgAB+93Xv4bZU2aqtdrqCrWaiHn8/4k
 Gqh3MnUWes3mh8RfOzl03vepj6GNVlTp02NM6MqPWLBnNWGRJ9nYtO1Tpl1NexYFKloS
 nlqlVa7LeTwImrSwsFeLkQ6mKkMY0O+/IYfklKN3B7Tr7u4TRRrxseriD9tWFMJ6Jhu8
 kyOLooolnbzf5hlim0TLVJx3hUziFlKSLWEkAVBaWXLGSaqgjV06UIWBcnv66dqdP6M5
 WY+jyRVrmwHqCY+D8blj2xmpEW7w6ddmIj6vSvOO9kXz+3V+do9PePr6DQY3c/NToSRd
 XS9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lFvMuvMh7YEjHgfoyUurfQAp5Ldp3Bc2q4aAnoQCwkM=;
 b=EskaI4ym9xn+5Wmyu/RZTZW52bX6OTbdc0d3SCb9N51bAdcyJ3MC2rl7s1/EgRyNeq
 0NdDc55sB8d1rUcpUmh6LPhcaGGcAaP2VHIfmXm8+5CILy0TBiEovtr4iVHYfVc5DyJG
 4JOOZYPEEHyv0AQ2H79Ea/MBIeZ6MAvqOm8/SnKxxGdeQ6H8YPRC9sge/gphYrSaEtqf
 l/kyz+MIPkLAuM6XyO2kmU4C+iJ0vIwn0g0JHreWJ9pPJipEzZDT5wEQ50zkuiyc+4kg
 ct7I0gfLZITSJQd8XYOSjppurQj/8iB9oUt7Tj87mjph8k8No5t6+7kRzfLHPQITIdb7
 woiQ==
X-Gm-Message-State: AFqh2kpbzQ1fR4ohvVY6DUxQJlkyEWZO7WF2Nwe20Rm5aX+BLlY4pZKM
 DSH2/T/xjXx+uuzkwoCrYd0=
X-Google-Smtp-Source: AMrXdXuKo0y+jgpQ4XMYoeRlNa+3DJD1h+IM0SCflvH2n8L7F0YnfErTLmj2vVioQdYM4xGprfD/AA==
X-Received: by 2002:a17:906:b150:b0:7c1:2931:2263 with SMTP id
 bt16-20020a170906b15000b007c129312263mr4906531ejb.71.1671719514446; 
 Thu, 22 Dec 2022 06:31:54 -0800 (PST)
Received: from [192.168.2.1] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id
 k8-20020a17090632c800b007c0f2c4cdffsm312593ejk.44.2022.12.22.06.31.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Dec 2022 06:31:54 -0800 (PST)
Message-ID: <1ee3e676-aef4-f464-82b0-8fb39ba5c60d@gmail.com>
Date: Thu, 22 Dec 2022 15:31:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
From: Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH v6 13/17] arm64: dts: rockchip: px30: fix dsi node
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

