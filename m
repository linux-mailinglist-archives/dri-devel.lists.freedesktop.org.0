Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F44565430B
	for <lists+dri-devel@lfdr.de>; Thu, 22 Dec 2022 15:30:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6961810E4FF;
	Thu, 22 Dec 2022 14:30:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49EB710E4FF
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Dec 2022 14:30:43 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id x22so5264941ejs.11
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Dec 2022 06:30:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=9pQhvyxS2+lxPQqiIeyKdGOnYGr9Eh6AUJtIVNTuj+A=;
 b=pra17mBr3JgRZv93t/vpFNPmD0aO+J9on1u8LfSQlR0gvmVU7fCiy6aUFxsMq6vsTw
 88osDMCGg4w9sYCHIY2iGRaYDHMJmDFgtRBmnAhzbeuay1wknN9zrOnqyK/S+hYEfPJE
 ufGsRbb6TMoDnIzM1EiGs+P3rUo4keriGyIoxZtVPJ+FTT9wvk/BsASkl8ne0hLBtesG
 fx5ygMW4pFrPfjoxdWuc9HzeTQ7HdH0E4rYv9y0ysaJnaezO5OwUnf46GvaOLDPH+FEf
 ASEjvCOYvV2eIck3hnoJR3W8dOEXhA2eKeZuGPxcvX+6peAsNRCahyRvlqJf5WhFkyeJ
 eKgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9pQhvyxS2+lxPQqiIeyKdGOnYGr9Eh6AUJtIVNTuj+A=;
 b=sEmhVMTwDlpBrsAYXwGPSJAir0J9Ref70pOkvLDJpxDv/EvZHSDfXBillgedTS6DqS
 GqCnlqxKEh/rinBqnBrZAYncBTJdXkLYL6FyDTXAazrd0UOfUNmpQIAwjUYYcYHfZopD
 Swv/Wd+3nQUMnQvXWVZgWXfKZYLNcMd32R5xe8tfON2smWONogofo1QU73DVaR7VD7s6
 0/nO7LGGqJFraefXfiZ8y4TcoWQoR4P1ruFEX5TD8RmQv3jmDR0hs//TCqlfNPUYDmte
 4/M/iiSPS0Wrea/MKGXj+AeIoKTQ7PrPZoZlFKM12tDMQzCUoU0r9dZEdWDo9Xkv9ZXP
 X4PA==
X-Gm-Message-State: AFqh2kp+3IrcJw47IDxEgRJJYBR2JVUCMTAn1ysXWsy85STspckZrfoB
 r9lyGJeqkMkoOJQvelqO7nk=
X-Google-Smtp-Source: AMrXdXtmL49MyBKUjTsMoWtqCRlV2PHafs92EJpPC3lRCxLlFg44CyiVrl1MfAnIoLBEhLRJvzfKQA==
X-Received: by 2002:a17:906:71cc:b0:7c0:ff72:e877 with SMTP id
 i12-20020a17090671cc00b007c0ff72e877mr5058112ejk.63.1671719440099; 
 Thu, 22 Dec 2022 06:30:40 -0800 (PST)
Received: from [192.168.2.1] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id
 ku2-20020a170907788200b007c0e23b5615sm317771ejc.34.2022.12.22.06.30.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Dec 2022 06:30:39 -0800 (PST)
Message-ID: <0a423eb4-0ab6-7ecb-d450-d93639160dbc@gmail.com>
Date: Thu, 22 Dec 2022 15:30:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
From: Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH v6 11/17] ARM: dts: rockchip: rk3288: fix dp node
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

With the conversion of rockchip,analogix-dp.yaml a port@1 node
is required, so add a node with label edp_out.
Also restyle.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 arch/arm/boot/dts/rk3288.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/rk3288.dtsi b/arch/arm/boot/dts/rk3288.dtsi
index 9def3988e..4d1bc6784 100644
--- a/arch/arm/boot/dts/rk3288.dtsi
+++ b/arch/arm/boot/dts/rk3288.dtsi
@@ -1203,19 +1203,26 @@
 		ports {
 			#address-cells = <1>;
 			#size-cells = <0>;
+
 			edp_in: port@0 {
 				reg = <0>;
 				#address-cells = <1>;
 				#size-cells = <0>;
+
 				edp_in_vopb: endpoint@0 {
 					reg = <0>;
 					remote-endpoint = <&vopb_out_edp>;
 				};
+
 				edp_in_vopl: endpoint@1 {
 					reg = <1>;
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

