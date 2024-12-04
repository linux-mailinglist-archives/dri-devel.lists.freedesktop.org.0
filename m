Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B184C9E3F1A
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2024 17:05:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36BE210E50C;
	Wed,  4 Dec 2024 16:04:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="OEdPDLnP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7320A10ED60
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2024 16:04:56 +0000 (UTC)
Received: from [192.168.88.20] (91-157-155-49.elisa-laajakaista.fi
 [91.157.155.49])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id A99536D6;
 Wed,  4 Dec 2024 17:04:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1733328267;
 bh=C3PVXGm45ULNAqZE4h9VZWoMGKJEU0y/gIV6rWMrPF0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=OEdPDLnPd6N+fxDyZ2Q7P1hZWZ7/63Zy5NrZ8TinHpQDrzvN8ar2Mnxrk2oZvWnpk
 tdaHeBvj6mHbvHB2dtEnasjKJpxJbzqtuwjy6Az+R01wGakkh55wIrSw3QrVGI+eh9
 u7JypWdpJ1mQoBOxmLAtR74XBTP7LJ5mThS5LC0M=
Message-ID: <b9a07779-34c3-496f-ac04-d7f6e1e61d82@ideasonboard.com>
Date: Wed, 4 Dec 2024 18:04:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/9] arm64: dts: renesas: r8a779h0: Add display support
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, LUU HOAI <hoai.luu.ub@renesas.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Sam Ravnborg <sam@ravnborg.org>,
 Biju Das <biju.das.jz@bp.renesas.com>, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
References: <20241203-rcar-gh-dsi-v1-0-738ae1a95d2a@ideasonboard.com>
 <20241203-rcar-gh-dsi-v1-8-738ae1a95d2a@ideasonboard.com>
 <20241203093703.GL10736@pendragon.ideasonboard.com>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <20241203093703.GL10736@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 03/12/2024 11:37, Laurent Pinchart wrote:
> Hi Tomi,
> 
> Thank you for the patch.
> 
> On Tue, Dec 03, 2024 at 10:01:42AM +0200, Tomi Valkeinen wrote:
>> From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>>
>> Add the device nodes for supporting DU and DSI.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>> ---
>>   arch/arm64/boot/dts/renesas/r8a779h0.dtsi | 77 +++++++++++++++++++++++++++++++
>>   1 file changed, 77 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
>> index 12d8be3fd579..82df6ee98afb 100644
>> --- a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
>> +++ b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
>> @@ -1828,6 +1828,54 @@ csi41isp1: endpoint {
>>   			};
>>   		};
>>   
>> +		fcpvd0: fcp@fea10000 {
>> +			compatible = "renesas,fcpv";
>> +			reg = <0 0xfea10000 0 0x200>;
>> +			clocks = <&cpg CPG_MOD 508>;
>> +			power-domains = <&sysc R8A779H0_PD_C4>;
>> +			resets = <&cpg 508>;
>> +		};
>> +
>> +		vspd0: vsp@fea20000 {
>> +			compatible = "renesas,vsp2";
>> +			reg = <0 0xfea20000 0 0x8000>;
>> +			interrupts = <GIC_SPI 546 IRQ_TYPE_LEVEL_HIGH>;
> 
> The documentation lists this interrupt as being LevelSensitive and
> Negative. I wouldn't expect the VSP to work at all with a wrong polarity
> in DT, so the level may get inverted somewhere.

Indeed... It's the same for V4H. And it also has IRQ_TYPE_LEVEL_HIGH in 
the dts. I tried changing it to LOW on V4H, but:

genirq: Setting trigger mode 8 for irq 91 failed
vsp1 fea20000.vsp: failed to request IRQ

I didn't dig further yet.

>> +			clocks = <&cpg CPG_MOD 830>;
>> +			power-domains = <&sysc R8A779H0_PD_C4>;
>> +			resets = <&cpg 830>;
>> +			renesas,fcp = <&fcpvd0>;
>> +		};
>> +
>> +		du: display@feb00000 {
>> +			compatible = "renesas,du-r8a779h0";
>> +			reg = <0 0xfeb00000 0 0x40000>;
>> +			interrupts = <GIC_SPI 523 IRQ_TYPE_LEVEL_HIGH>;
>> +			clocks = <&cpg CPG_MOD 411>;
>> +			clock-names = "du.0";
>> +			power-domains = <&sysc R8A779H0_PD_C4>;
>> +			resets = <&cpg 411>;
>> +			reset-names = "du.0";
>> +			renesas,vsps = <&vspd0 0>;
>> +
>> +			status = "disabled";
>> +
>> +			ports {
>> +				#address-cells = <1>;
>> +				#size-cells = <0>;
>> +
>> +				port@0 {
>> +					reg = <0>;
>> +					du_out_dsi0: endpoint {
>> +						remote-endpoint = <&dsi0_in>;
>> +					};
>> +				};
>> +
>> +				port@1 {
>> +					reg = <1>;
>> +				};
> 
> On V4M the DU has a single channel, so there should be a single port.

Yep, I'll drop.

  Tomi

> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> 
>> +			};
>> +		};
>> +
>>   		isp0: isp@fed00000 {
>>   			compatible = "renesas,r8a779h0-isp",
>>   				     "renesas,rcar-gen4-isp";
>> @@ -1996,6 +2044,35 @@ isp1vin15: endpoint {
>>   			};
>>   		};
>>   
>> +		dsi0: dsi-encoder@fed80000 {
>> +			compatible = "renesas,r8a779h0-dsi-csi2-tx";
>> +			reg = <0 0xfed80000 0 0x10000>;
>> +			clocks = <&cpg CPG_MOD 415>,
>> +				 <&cpg CPG_CORE R8A779H0_CLK_DSIEXT>,
>> +				 <&cpg CPG_CORE R8A779H0_CLK_DSIREF>;
>> +			clock-names = "fck", "dsi", "pll";
>> +			power-domains = <&sysc R8A779H0_PD_C4>;
>> +			resets = <&cpg 415>;
>> +
>> +			status = "disabled";
>> +
>> +			ports {
>> +				#address-cells = <1>;
>> +				#size-cells = <0>;
>> +
>> +				port@0 {
>> +					reg = <0>;
>> +					dsi0_in: endpoint {
>> +						remote-endpoint = <&du_out_dsi0>;
>> +					};
>> +				};
>> +
>> +				port@1 {
>> +					reg = <1>;
>> +				};
>> +			};
>> +		};
>> +
>>   		prr: chipid@fff00044 {
>>   			compatible = "renesas,prr";
>>   			reg = <0 0xfff00044 0 4>;
> 

