Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F2E1AB912
	for <lists+dri-devel@lfdr.de>; Thu, 16 Apr 2020 09:00:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E6756EB02;
	Thu, 16 Apr 2020 06:59:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p03-ob.smtp.rzone.de (mo6-p03-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5303::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE7306E9D5
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 12:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1586955053;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=ZWPeQuNZym8qIi2cOZDzlHwaDAs+LcskJtN8sCgQ/rk=;
 b=sTRS09PMLwkcTTOoZt34YtLcY7QSS5fMS1pmBrTSeIZm0N2joUStJ7XI4Tahg7birX
 jyeeZhjBppAqosYeFBxlwoxAXRB75HoWCJZ2rjZQbbRO3RfHGwht7ZuztrInIt3kxlt2
 GIhz/nxRhlQTGNusNm+yMTYFuHlRiStp+C/Q/i1uXgPa1GUf5EWzH9HcQYXv6qjVrYlJ
 WUoOWqiJxKH/UrWV1iRc5x1yPaTE2jK7ddTpAxAEupZ9WgUQHnLjTtHsBI3cmDtUHRps
 H3cqwGJT4W0jHk2ivleyuVGz2zkQC9YNPdQXgkFAE8JLW6Xhkxyxg4eZmLecK9i9iqd9
 xazg==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7wpz8NMGH/PtwDConyM="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box by smtp.strato.de (RZmta 46.4.0 DYNA|AUTH)
 with ESMTPSA id 6028a2w3FCoV1xp
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256
 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Wed, 15 Apr 2020 14:50:31 +0200 (CEST)
Subject: Re: [PATCH v6 08/12] arm: dts: s5pv210: Add G3D node
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <CAJKOXPcb9KWNAem-CAx_zCS+sZoEHYc0J8x0nk1xjY9hD4-M4w@mail.gmail.com>
Date: Wed, 15 Apr 2020 14:50:31 +0200
Message-Id: <AB9B8741-CFF7-414D-9489-D381B539538D@goldelico.com>
References: <cover.1586939718.git.hns@goldelico.com>
 <b6733f80546bf3e6b3799f716b9c8e0f407de03d.1586939718.git.hns@goldelico.com>
 <CAJKOXPcb9KWNAem-CAx_zCS+sZoEHYc0J8x0nk1xjY9hD4-M4w@mail.gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Bakker <xc-racer2@live.ca>
X-Mailer: Apple Mail (2.3124)
X-Mailman-Approved-At: Thu, 16 Apr 2020 06:59:07 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, David Airlie <airlied@linux.ie>,
 James Hogan <jhogan@kernel.org>, Jonathan Bakker <xc-racer2@live.ca>,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 Paul Cercueil <paul@crapouillou.net>,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 linux-omap@vger.kernel.org, Paul Burton <paulburton@kernel.org>,
 Tony Lindgren <tony@atomide.com>, Chen-Yu Tsai <wens@csie.org>,
 Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org,
 =?utf-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, letux-kernel@openphoenux.org,
 linux-arm-kernel@lists.infradead.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Philipp Rossak <embed3d@gmail.com>, openpvrsgx-devgroup@letux.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Ralf Baechle <ralf@linux-mips.org>, kernel@pyra-handheld.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


> Am 15.04.2020 um 13:49 schrieb Krzysztof Kozlowski <krzk@kernel.org>:
> 
> On Wed, 15 Apr 2020 at 10:36, H. Nikolaus Schaller <hns@goldelico.com> wrote:
>> 
>> From: Jonathan Bakker <xc-racer2@live.ca>
>> 
>> to add support for SGX540 GPU.
> 
> Do not continue the subject in commit msg like it is one sentence.
> These are two separate sentences, so commit msg starts with capital
> letter and it is sentence by itself.
> 
>> Signed-off-by: Jonathan Bakker <xc-racer2@live.ca>
>> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
>> ---
>> arch/arm/boot/dts/s5pv210.dtsi | 15 +++++++++++++++
>> 1 file changed, 15 insertions(+)
>> 
>> diff --git a/arch/arm/boot/dts/s5pv210.dtsi b/arch/arm/boot/dts/s5pv210.dtsi
>> index 2ad642f51fd9..e7fc709c0cca 100644
>> --- a/arch/arm/boot/dts/s5pv210.dtsi
>> +++ b/arch/arm/boot/dts/s5pv210.dtsi
>> @@ -512,6 +512,21 @@ vic3: interrupt-controller@f2300000 {
>>                        #interrupt-cells = <1>;
>>                };
>> 
>> +               g3d: g3d@f3000000 {
>> +                       compatible = "samsung,s5pv210-sgx540-120";
>> +                       reg = <0xf3000000 0x10000>;
>> +                       interrupt-parent = <&vic2>;
>> +                       interrupts = <10>;
>> +                       clock-names = "sclk";
>> +                       clocks = <&clocks CLK_G3D>;
> 
> Not part of bindings, please remove or add to the bindings.

Well, the bindings should describe what is common for all SoC
and they are quite different in what they need in addition.

Thererfore we have no "additionalProperties: false" in the
bindings [PATCH v6 01/12].

> 
>> +
>> +                       power-domains = <&pd S5PV210_PD_G3D>;
> 
> Ditto

In this case it might be possible to add the clock/power-domains
etc. to a wrapper node compatible to "simple-pm-bus" or similar
and make the gpu a child of it.

@Jontahan: can you please give it a try?


> 
>> +
>> +                       assigned-clocks = <&clocks MOUT_G3D>, <&clocks DOUT_G3D>;
>> +                       assigned-clock-rates = <0>, <66700000>;
>> +                       assigned-clock-parents = <&clocks MOUT_MPLL>;
> 
> Probably this should have status disabled because you do not set
> regulator supply.
> 
> Best regards,
> Krzysztof

BR and thanks,
Nikolaus

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
