Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E5465430A
	for <lists+dri-devel@lfdr.de>; Thu, 22 Dec 2022 15:30:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAB2810E4FB;
	Thu, 22 Dec 2022 14:30:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6E9310E4FB
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Dec 2022 14:30:10 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id c17so3115470edj.13
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Dec 2022 06:30:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Sr8iGvYv8Y+FUygmw8CozO+P35yD6ZFMgxS2kANtCbQ=;
 b=VaczJC3DYayhT39mpuYMMNQmAe6pOd8vIUqq19xXuzH+xCl2aEgwN3IsaSTR1hH9Uk
 uhePN9hjMzX2lQmaG5d/c05laMe4ShHPUzQGyeoa+ifSKElXnlrR7QVH1dHdGsEq4Dd7
 j+2E9Nv5SN8HhYJ/3tCDbTmsiDzyETXjVCKKQ4CliNHJvrDaZRuVM2E5oFHZjHBq7ll3
 rsTJIybJ3he9K3Hknr7Q3zVnh3000wSsLfVK4dAce7Eh+5sIc1uyQ1wXS2u08Cd+vcdM
 uE7H5gbSfx73XuMy3cHOBtr37+FwZSQr5cPPCCtXwG8592mjHRMdiKKJtAASJxH7GfEe
 HY9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Sr8iGvYv8Y+FUygmw8CozO+P35yD6ZFMgxS2kANtCbQ=;
 b=Kly9Oa99jyC/iOpmgLJolLOL3rUSIOoHxUmR3ICQuXUlSdm755gUwaOl9qe8XyhhJU
 S92ZjB0J2YRj2RSf9v/OMzpLCTdW8wY/A0VCFhW05ZQ6tQX0kRnQcwV3E29QyaBlBwMU
 b7B9lfnIHN0kkoeVc0us7irZoNvTg1WQL+F/vwf0rR4iDJCjP3uhB4hEGnzlrCVA45a/
 xnnzZEwG6qR6kkFiO0NZHomCiXfCpclRCUNagyeIDjywp9Zez2ioKjNHvLo0lv2pASyY
 krunEmXkAJSys1KIGGH960W1fpOGDDMRz4+bl0jQzozbSlrkQms9CY0xexMu3eBMkpTl
 1i+Q==
X-Gm-Message-State: AFqh2kpxQKq4G3TMlizNC+q66xv4LNBxGSkLuJXef8GFdbNUgqtnK4iY
 kF97um66fzGZa6ZzjSUMXfQ=
X-Google-Smtp-Source: AMrXdXurqoOFkI2ZF/Yr2+mXCk6PmZYuuFqlaFxmwRRIisoHNe/8QJlN0NWxlPobXkNO6fFrIoIZpw==
X-Received: by 2002:a05:6402:33a:b0:47b:2524:5cf6 with SMTP id
 q26-20020a056402033a00b0047b25245cf6mr5189089edw.40.1671719408575; 
 Thu, 22 Dec 2022 06:30:08 -0800 (PST)
Received: from [192.168.2.1] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id
 h13-20020a0564020e0d00b0046b00a9eeb5sm427095edh.49.2022.12.22.06.30.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Dec 2022 06:30:08 -0800 (PST)
Message-ID: <e7b78a73-0e89-d9e9-2ecc-a8a380635f64@gmail.com>
Date: Thu, 22 Dec 2022 15:30:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
From: Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH v6 10/17] ARM: dts: rockchip: rk3288: fix lvds node
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

With the conversion of rockchip,lvds.yaml a port@1 node
is required, so add a node with label lvds_out.
Also restyle.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---

Changed V6:
  Restyle

Changed V5:
  Rename title
---
 arch/arm/boot/dts/rk3288.dtsi | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/rk3288.dtsi b/arch/arm/boot/dts/rk3288.dtsi
index fbb174729..9def3988e 100644
--- a/arch/arm/boot/dts/rk3288.dtsi
+++ b/arch/arm/boot/dts/rk3288.dtsi
@@ -1167,7 +1167,6 @@

 			lvds_in: port@0 {
 				reg = <0>;
-
 				#address-cells = <1>;
 				#size-cells = <0>;

@@ -1175,11 +1174,16 @@
 					reg = <0>;
 					remote-endpoint = <&vopb_out_lvds>;
 				};
+
 				lvds_in_vopl: endpoint@1 {
 					reg = <1>;
 					remote-endpoint = <&vopl_out_lvds>;
 				};
 			};
+
+			lvds_out: port@1 {
+				reg = <1>;
+			};
 		};
 	};

--
2.20.1

