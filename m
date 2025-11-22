Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1469C7CE46
	for <lists+dri-devel@lfdr.de>; Sat, 22 Nov 2025 12:28:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B474A10E00E;
	Sat, 22 Nov 2025 11:28:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=szczodrzynski.pl header.i=@szczodrzynski.pl header.b="mDhTUOtY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from s2.avantea.pl (s2.avantea.pl [46.242.128.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACE1710E00E
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Nov 2025 11:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=szczodrzynski.pl; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To
 :From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sTIigErOKl7e8JhN8I1UwZxYBcS4CkN23s/oTFvf/Dg=; b=mDhTUOtYYD2PoSPm7+k+UOXoPV
 lnjPFdJ7GPLaTgHd8oAnqdH61tFnFJMo+j0p8AqaYPNEXbKYIO1unFo8zP+6acOwKlUllA18AC2Gf
 A3LNGIxH9m8Z+WUNDrZ3DS6+SYiCWrsgVk1z9kV5eM3iGuat8DQW8BMsuaLsm7kq3ON6SmhBakq6e
 u6Ao6E7/shC+Jc/XKZDjYYbNwiSjQTtFo2mV3LsOIZTi7N9X62HQag+UoeORzEpcXhgJ9MJBNELOu
 wbZoMRNuqZw/P2W7G/FO8V+Ys7F8+LgqjnwhflrMZheLZyW2OvPvLLCQU0sMMfMRpCQrxHRxr2v7a
 +u5r/pXA==;
Received: from d100-78.icpnet.pl ([77.65.100.78] helo=[192.168.0.120])
 by s2.avantea.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.98.1) (envelope-from <kuba@szczodrzynski.pl>)
 id 1vMlml-00000007s2Y-1bfI; Sat, 22 Nov 2025 12:28:11 +0100
Message-ID: <72fba214-010d-498e-957f-f1d042f18edc@szczodrzynski.pl>
Date: Sat, 22 Nov 2025 12:27:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] phy: allwinner: phy-sun6i-mipi-dphy: Support LVDS
 in combo D-PHY
To: Parthiban <parthiban@linumiz.com>, Maxime Ripard <mripard@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, paulk@sys-base.io
References: <20251116134609.447043-1-kuba@szczodrzynski.pl>
 <20251116134724.447131-1-kuba@szczodrzynski.pl>
 <6d421d06-c534-40f3-8732-8f80a29b6821@linumiz.com>
Content-Language: pl
From: =?UTF-8?Q?Kuba_Szczodrzy=C5=84ski?= <kuba@szczodrzynski.pl>
Autocrypt: addr=kuba@szczodrzynski.pl; keydata=
 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
In-Reply-To: <6d421d06-c534-40f3-8732-8f80a29b6821@linumiz.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authenticated-Id: kuba@szczodrzynski.pl
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

W dniu 2025-11-20 o 07:24:53, Parthiban pisze:

> Dear Kuba,
>
> Thanks for your efforts.
>
> On 11/16/25 2:47 PM, Kuba Szczodrzyński wrote:
>> Some Allwinner chips (notably the D1s/T113 and the A100) have a "combo
>> MIPI DSI D-PHY" which is required when using single-link LVDS0.
>>
>> In this mode, the DSI peripheral is not used and the PHY is not
>> configured for DSI. Instead, the COMBO_PHY_REGx registers are set to
>> enable LVDS operation.
>>
>> Enable the PHY driver to work in LVDS mode on chips with a combo D-PHY.
>>
>> Also change the SUN50I_COMBO_PHY_REG1 macro names to reflect the correct
>> register name.
>>
>> Signed-off-by: Kuba Szczodrzyński <kuba@szczodrzynski.pl>
>> ---
>>   drivers/phy/allwinner/phy-sun6i-mipi-dphy.c | 70 ++++++++++++++++++++-
>>   1 file changed, 68 insertions(+), 2 deletions(-)
> I tried integrating your changes in A133 display pipeline and I couldn't get the LVDS working.
> Am still narrowing down what is missing in your patch. Driver registration is success and I
> can see /dev/fb0 as well. But nothing on the display itself.
>
> But with below changes from my patch,
>
> diff --git a/drivers/phy/allwinner/phy-sun6i-mipi-dphy.c b/drivers/phy/allwinner/phy-sun6i-mipi-dphy.c
> index 36eab95271b2..d164b2ea5dfd 100644
> --- a/drivers/phy/allwinner/phy-sun6i-mipi-dphy.c
> +++ b/drivers/phy/allwinner/phy-sun6i-mipi-dphy.c
> @@ -314,13 +314,11 @@ static void sun50i_a100_mipi_dphy_tx_power_on(struct sun6i_dphy *dphy)
>          /* Disable sigma-delta modulation. */
>          regmap_write(dphy->regs, SUN50I_DPHY_PLL_REG2, 0);
>   
> -       regmap_update_bits(dphy->regs, SUN6I_DPHY_ANA4_REG,
> -                          SUN6I_DPHY_ANA4_REG_EN_MIPI,
> -                          SUN6I_DPHY_ANA4_REG_EN_MIPI);
> -
>          regmap_update_bits(dphy->regs, SUN50I_COMBO_PHY_REG0,
> +                          SUN50I_COMBO_PHY_REG0_EN_LVDS |
>                             SUN50I_COMBO_PHY_REG0_EN_MIPI |
>                             SUN50I_COMBO_PHY_REG0_EN_COMBOLDO,
> +                          SUN50I_COMBO_PHY_REG0_EN_LVDS |
>                             SUN50I_COMBO_PHY_REG0_EN_MIPI |
>                             SUN50I_COMBO_PHY_REG0_EN_COMBOLDO);
>   
> @@ -528,6 +526,22 @@ static int sun6i_dphy_exit(struct phy *phy)
>          return 0;
>   }
>
> LVDS works fine.
>
> Could you please share the diff of your dts / dtsi?

Hi,
Here's the DTS overlay I used to enable an LVDS panel on T113. You'll need to adapt the panel specification to your particular display.
I did not need to change the phy driver, so this extra requirement might be specific to A133.

/dts-v1/;
/plugin/;

&{/} {
	panel {
		compatible = "panel-lvds";
		data-mapping = "jeida-18";
		ddc-i2c-bus = <&i2c2>;

		port {
			panel_input: endpoint {
				remote-endpoint = <&tcon_lcd0_out_lvds>;
			};
		};
	};
};

&tcon_lcd0 {
	pinctrl-names = "default";
	pinctrl-0 = <&lcd_lvds0_pins>;
};

&tcon_lcd0_out {
	reg = <1>;
	#address-cells = <1>;
	#size-cells = <0>;

	tcon_lcd0_out_lvds: endpoint@0 {
		reg = <0>;
		remote-endpoint = <&panel_input>;
	};
};

Regards
Kuba

>
> Thanks,
> Parthiban
