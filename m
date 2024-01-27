Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B9983EC50
	for <lists+dri-devel@lfdr.de>; Sat, 27 Jan 2024 10:31:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40F6A10EB2D;
	Sat, 27 Jan 2024 09:31:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mecka.net (mecka.net [159.69.159.214])
 by gabe.freedesktop.org (Postfix) with ESMTP id CFD9910EB2D
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Jan 2024 09:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mecka.net; s=2016.11;
 t=1706347870; bh=ZKfXwd9FW0rWdUEIALu0OP8KvDADbdtz+p95WviJSc4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=E5zqKQbgtz/Vq1FfeGeVWFW44FAQes1TM4fjycxZbs1PXj/kVBhPZtt8C/MCLa5XM
 dai1JImK0gvTG3CT70igLp2rBfb57qbRrPLdvZba717th93qWGahfDoSPH4YxzXy3o
 KFLVR2c/ArebjwwBnqxAOeAtAR7PvYD0LYY6uiOcH8I94rBblNT04Edw8a4onAr+Ui
 fYBHN55OgbOXxjVOCIvNjCAajRO1CrZrvjnBCMu+xHqEC4DExZ/uHvnMUiudhwP5m+
 S/9hkxTVl5vu66m9D3t65iwe/mRLoQov1gFs/bJPNdYvl2v6JKRQOKRP4DWuu9e4WG
 z4X7wSbggV/gw==
Received: from mecka.net (unknown [185.147.11.134])
 by mecka.net (Postfix) with ESMTPSA id A981E3BF3AE;
 Sat, 27 Jan 2024 10:31:09 +0100 (CET)
Date: Sat, 27 Jan 2024 10:31:08 +0100
From: Manuel Traut <manut@mecka.net>
To: Jonas Karlman <jonas@kwiboo.se>
Subject: Re: [PATCH v3 4/4] arm64: dts: rockchip: Add devicetree for Pine64
 PineTab2
Message-ID: <ZbTNXL6s_wQugVC5@mecka.net>
References: <20240102-pinetab2-v3-0-cb1aa69f8c30@mecka.net>
 <20240102-pinetab2-v3-4-cb1aa69f8c30@mecka.net>
 <775vjfucu2g2s6zzeutj7f7tapx3q2geccpxvv4ppcms4hxbq7@cbrdmlu2ryzp>
 <903e9d0c-a00c-4214-9f0e-dd676b13b428@kwiboo.se>
 <ZZVjzwgANJMdHnuo@mecka.net>
 <6efe305c-4ab4-43c1-ab6d-64bdf1d81a2f@kwiboo.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6efe305c-4ab4-43c1-ab6d-64bdf1d81a2f@kwiboo.se>
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
Cc: Diederik de Haas <didi.debian@cknow.org>, Danct12 <danct12@riseup.net>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 David Airlie <airlied@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-rockchip@lists.infradead.org, Jessica Zhang <quic_jesszhan@quicinc.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Yao <markyao0591@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Segfault <awarnecke002@hotmail.com>, Sandy Huang <hjc@rock-chips.com>,
 =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>, Daniel Vetter <daniel@ffwll.ch>,
 Arnaud Ferraris <aferraris@debian.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jonas,

On Wed, Jan 03, 2024 at 03:19:25PM +0100, Jonas Karlman wrote:
> Hi Manuel,
> 
> On 2024-01-03 14:40, Manuel Traut wrote:
> > Hi Jonas and Ondřej,
> > 
> >>>> +&sfc {
> >>>> +	pinctrl-names = "default";
> >>>> +	pinctrl-0 = <&fspi_dual_io_pins>;
> >>>> +	status = "okay";
> >>>> +	#address-cells = <1>;
> >>>> +	#size-cells = <0>;
> >>>> +
> >>>> +	flash@0 {
> >>>> +		compatible = "jedec,spi-nor";
> >>>> +		reg = <0>;
> >>>> +		spi-max-frequency = <24000000>;
> >>>
> >>> That's a bit on the low side. The flash chip should work for all commands up to
> >>> 80MHz https://megous.com/dl/tmp/b428ad9b85ac4633.png and SGM3157YC6 switch
> >>> for the FSPI-CLK should have high enough bandwidth, too.
> >>
> >> I agree that this is a little bit on the low side, it was a safe rate
> >> that I used for U-Boot. U-Boot required an exact rate of the supported
> >> sfc clk rates: 24, 50, 75, 100, 125 or 150 MHz.
> >>
> >> Please also note that the SPI NOR flash chip used in PineTab2 is not a
> >> GigaDevice GD25LQ128E, it should be a SiliconKaiser SK25LP128, same as
> >> found in the Pine64 PinePhone Pro.
> > 
> > The schematics for v2.0 reference a GD25LQ128EWIGR. I never checked the jedec
> > id. How did you retrieve this information, or is it maybe a difference in v0.1
> > and 2.0?
> 
> This was when working on mainline U-Boot for the PineTab2 (and other
> rk356x devices). See [1] for a pending U-Boot patch that is waiting on a
> proper mainline linux devicetree for the PT2.
> 
> The JEDEC ID is reported as 0x257018 on my v2.0 production unit, and
> does not match the JEDEC ID for GD25LQ128E (0xc86018) referenced in
> the schematics.
> 
> I found that the JEDEC ID 0x257018 was referenced in prior patches
> related to the SK25LP128 SPI NOR flash chip used in Pine64 PinePhone Pro.
> 
> I have only ever tested the 24 MHz rate, but I am expecting that e.g.
> 100 MHz also should work. Will not be able to test on my PT2 until at
> earliest next week.
> 
> [1] https://github.com/Kwiboo/u-boot-rockchip/commit/66562d6eaf2c11a9f97fcdba379d3ceda8aa70ef

I found the time to verify that 100 MHz is also working.
Will include this in v4

Thanks for your help
Manuel
