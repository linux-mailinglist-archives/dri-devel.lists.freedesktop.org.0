Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4AD1AEB2D
	for <lists+dri-devel@lfdr.de>; Sat, 18 Apr 2020 11:26:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBBF06E194;
	Sat, 18 Apr 2020 09:26:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p02-ob.smtp.rzone.de (mo6-p02-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5302::10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66F6E6EBCA
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 12:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1587125772;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=rWgceOhSWa758bgT+X6qKMY760KerwI9IfGOuR55b2U=;
 b=pK7wvGzf/osUaiVE66w53oLQpH9o1LEVYPIJ9V2f5e3/REJTCN2nfDVezOLLGSIPA3
 /jPFCdb/v9bfblMKT/1553NvZTJroFLV2S/5E1rzQGairs5+9wEgWr+kOYrS81RYKSwS
 aTxw6wZTciEvmFO9Ued8zRcAg8kUtSQ7zldNeZL8PWvnhvimdu/bxPv9snvb29zYZA/Q
 bRZzizX29ohZl2SBOvcfm3XPy+M4ccKqWMIXzyAs2aM+kPNgBPavXiH5fNgp80DAUXfk
 oY4p9tqavuJPILwvYJerToLiThV1bHO0buzJSrADWykoX3j5Zmoxi81xTa2X4wl+I7Jq
 LB3Q==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7wpz8NMGH/PgwDWjbQ=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box by smtp.strato.de (RZmta 46.5.0 DYNA|AUTH)
 with ESMTPSA id g06d2dw3HCFa1c0
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256
 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Fri, 17 Apr 2020 14:15:36 +0200 (CEST)
Subject: Re: [PATCH v6 08/12] arm: dts: s5pv210: Add G3D node
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <BN6PR04MB0660640B15550F75C8CCD4DEA3DB0@BN6PR04MB0660.namprd04.prod.outlook.com>
Date: Fri, 17 Apr 2020 14:15:36 +0200
Message-Id: <D44C023E-C8B3-4974-B800-1DBEC7B4F82C@goldelico.com>
References: <cover.1586939718.git.hns@goldelico.com>
 <b6733f80546bf3e6b3799f716b9c8e0f407de03d.1586939718.git.hns@goldelico.com>
 <CAJKOXPcb9KWNAem-CAx_zCS+sZoEHYc0J8x0nk1xjY9hD4-M4w@mail.gmail.com>
 <AB9B8741-CFF7-414D-9489-D381B539538D@goldelico.com>
 <BN6PR04MB0660640B15550F75C8CCD4DEA3DB0@BN6PR04MB0660.namprd04.prod.outlook.com>
To: Jonathan Bakker <xc-racer2@live.ca>
X-Mailer: Apple Mail (2.3124)
X-Mailman-Approved-At: Sat, 18 Apr 2020 09:26:15 +0000
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
 James Hogan <jhogan@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 linux-omap@vger.kernel.org, Paul Burton <paulburton@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Tony Lindgren <tony@atomide.com>,
 Chen-Yu Tsai <wens@csie.org>, Kukjin Kim <kgene@kernel.org>,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 letux-kernel@openphoenux.org, linux-arm-kernel@lists.infradead.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Philipp Rossak <embed3d@gmail.com>, openpvrsgx-devgroup@letux.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Ralf Baechle <ralf@linux-mips.org>,
 =?utf-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
 kernel@pyra-handheld.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jonathan,

> Am 15.04.2020 um 20:17 schrieb Jonathan Bakker <xc-racer2@live.ca>:
> 
> Hi Nikolaus,
> 
> On 2020-04-15 5:50 a.m., H. Nikolaus Schaller wrote:
>> 
>>> Am 15.04.2020 um 13:49 schrieb Krzysztof Kozlowski <krzk@kernel.org>:
>>> 
>>> On Wed, 15 Apr 2020 at 10:36, H. Nikolaus Schaller <hns@goldelico.com> wrote:
>>>> 
>>>> From: Jonathan Bakker <xc-racer2@live.ca>
>>>> 
>>>> to add support for SGX540 GPU.
>>> 
>>> Do not continue the subject in commit msg like it is one sentence.
>>> These are two separate sentences, so commit msg starts with capital
>>> letter and it is sentence by itself.
>>> 
> 
> Sorry, that's my fault, I should know better.

Mine as well...

> 
> Nikolaus took this from my testing tree and I apparently didn't have it in
> as good as state as I should have.
> 
>>>> Signed-off-by: Jonathan Bakker <xc-racer2@live.ca>
>>>> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
>>>> ---
>>>> arch/arm/boot/dts/s5pv210.dtsi | 15 +++++++++++++++
>>>> 1 file changed, 15 insertions(+)
>>>> 
>>>> diff --git a/arch/arm/boot/dts/s5pv210.dtsi b/arch/arm/boot/dts/s5pv210.dtsi
>>>> index 2ad642f51fd9..e7fc709c0cca 100644
>>>> --- a/arch/arm/boot/dts/s5pv210.dtsi
>>>> +++ b/arch/arm/boot/dts/s5pv210.dtsi
>>>> @@ -512,6 +512,21 @@ vic3: interrupt-controller@f2300000 {
>>>>                       #interrupt-cells = <1>;
>>>>               };
>>>> 
>>>> +               g3d: g3d@f3000000 {
>>>> +                       compatible = "samsung,s5pv210-sgx540-120";
>>>> +                       reg = <0xf3000000 0x10000>;
>>>> +                       interrupt-parent = <&vic2>;
>>>> +                       interrupts = <10>;
>>>> +                       clock-names = "sclk";
>>>> +                       clocks = <&clocks CLK_G3D>;
>>> 
>>> Not part of bindings, please remove or add to the bindings.
>> 
>> Well, the bindings should describe what is common for all SoC
>> and they are quite different in what they need in addition.
>> 
>> Thererfore we have no "additionalProperties: false" in the
>> bindings [PATCH v6 01/12].
>> 
>>> 
>>>> +
>>>> +                       power-domains = <&pd S5PV210_PD_G3D>;
>>> 
>>> Ditto
>> 
>> In this case it might be possible to add the clock/power-domains
>> etc. to a wrapper node compatible to "simple-pm-bus" or similar
>> and make the gpu a child of it.
>> 
>> @Jontahan: can you please give it a try?
>> 
>> 
> 
> The power-domains comes from a (so far) non-upstreamed power domain driver
> for s5pv210 that I've been playing around with.  It's not necessary for proper
> operation as it's on by default.
> 
> Looking at simple-pm-bus, I don't really understand its purpose.  Is it a way of separating
> out a power domain from a main device's node?  Or is it designed for when you have multiple
> devices under the same power domain?
> 
> Nikolaus, I can regenerate a proper patch for you if you want that's not based on my testing tree.

Yes, please.

> 
>>> 
>>>> +
>>>> +                       assigned-clocks = <&clocks MOUT_G3D>, <&clocks DOUT_G3D>;
>>>> +                       assigned-clock-rates = <0>, <66700000>;
>>>> +                       assigned-clock-parents = <&clocks MOUT_MPLL>;
>>> 
>>> Probably this should have status disabled because you do not set
>>> regulator supply.
> 
> I don't believe there is a regulator on s5pv210, if there is, then it is a
> fixed regulator with no control on both s5pv210 devices that I have.
> 
> The vendor driver did use the regulator framework for its power domain
> implementation, but that definitely shouldn't be upstreamed.

Ok, this means there is no need for regulators in the bindings.

BR,
Nikolaus

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
