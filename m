Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A438822EB0
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jan 2024 14:40:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCC3B10E2AE;
	Wed,  3 Jan 2024 13:40:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mecka.net (mecka.net [159.69.159.214])
 by gabe.freedesktop.org (Postfix) with ESMTP id E52AC10E29B
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jan 2024 13:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mecka.net; s=2016.11;
 t=1704289233; bh=vv+J84aXLGq+PleY0UyhFYxaeGAaLPX+RfeAkhXQ200=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cpu0Ye8IMdGiDBxzyzZoReAEfROyEgoo9iUD2E/KCtoinzklkZ2EY2k8LlfjMkdO1
 khHcsTIaAOby6KzxVGlv35+5nM2QAdsEuaCXw6pDtBQNgblFEAnaRq29gNpf3heJzn
 Tbi4yLOOHPKyAJ5M++PCe/6zsgafjtf5Kg+uc4XOOKIMn/xdit+j56ptkieFCrLKfH
 twHm50FJdGRXndg5wYG7lRhubiwrcMHcIPrBcotnVbl6ufke16NNEE8v0SMhNsVT0i
 SSJuX8QV2UYgDdg+KFGXAAcon4Vfo7MZAtb95DKNqmcC6jJXnCc9nHjV/81MHLV/DG
 soQrY8N8pO/JQ==
Received: from mecka.net (unknown [185.147.11.134])
 by mecka.net (Postfix) with ESMTPSA id 6BF8E379D1E;
 Wed,  3 Jan 2024 14:40:32 +0100 (CET)
Date: Wed, 3 Jan 2024 14:40:31 +0100
From: Manuel Traut <manut@mecka.net>
To: Jonas Karlman <jonas@kwiboo.se>
Subject: Re: [PATCH v3 4/4] arm64: dts: rockchip: Add devicetree for Pine64
 PineTab2
Message-ID: <ZZVjzwgANJMdHnuo@mecka.net>
References: <20240102-pinetab2-v3-0-cb1aa69f8c30@mecka.net>
 <20240102-pinetab2-v3-4-cb1aa69f8c30@mecka.net>
 <775vjfucu2g2s6zzeutj7f7tapx3q2geccpxvv4ppcms4hxbq7@cbrdmlu2ryzp>
 <903e9d0c-a00c-4214-9f0e-dd676b13b428@kwiboo.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <903e9d0c-a00c-4214-9f0e-dd676b13b428@kwiboo.se>
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
 Sam Ravnborg <sam@ravnborg.org>, linux-rockchip@lists.infradead.org,
 Jessica Zhang <quic_jesszhan@quicinc.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Mark Yao <markyao0591@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Segfault <awarnecke002@hotmail.com>, Sandy Huang <hjc@rock-chips.com>,
 =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>,
 Arnaud Ferraris <aferraris@debian.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jonas and Ondřej,

> >> +&sfc {
> >> +	pinctrl-names = "default";
> >> +	pinctrl-0 = <&fspi_dual_io_pins>;
> >> +	status = "okay";
> >> +	#address-cells = <1>;
> >> +	#size-cells = <0>;
> >> +
> >> +	flash@0 {
> >> +		compatible = "jedec,spi-nor";
> >> +		reg = <0>;
> >> +		spi-max-frequency = <24000000>;
> > 
> > That's a bit on the low side. The flash chip should work for all commands up to
> > 80MHz https://megous.com/dl/tmp/b428ad9b85ac4633.png and SGM3157YC6 switch
> > for the FSPI-CLK should have high enough bandwidth, too.
> 
> I agree that this is a little bit on the low side, it was a safe rate
> that I used for U-Boot. U-Boot required an exact rate of the supported
> sfc clk rates: 24, 50, 75, 100, 125 or 150 MHz.
> 
> Please also note that the SPI NOR flash chip used in PineTab2 is not a
> GigaDevice GD25LQ128E, it should be a SiliconKaiser SK25LP128, same as
> found in the Pine64 PinePhone Pro.

The schematics for v2.0 reference a GD25LQ128EWIGR. I never checked the jedec
id. How did you retrieve this information, or is it maybe a difference in v0.1
and 2.0?

> >> +		spi-rx-bus-width = <2>;
> > 
> > GD25LQ128E supports quad I/O. Maybe try 4 if it will work.
> 
> The schematic only shows fspi D0 and D1 connected, and use the D2 line
> for eMMC_RSTn, so spi-rx-bus-width = <2> should be correct.

ack

Since it is only needed for bootloader updates and environment its maybe better
to stay on the safe side?

But I can test faster frequency if you want me to do..

Regards
Manuel
