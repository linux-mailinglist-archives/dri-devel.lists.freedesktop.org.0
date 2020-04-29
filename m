Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 706381BF195
	for <lists+dri-devel@lfdr.de>; Thu, 30 Apr 2020 09:33:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E83AB6EB80;
	Thu, 30 Apr 2020 07:33:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (outils.crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 837956EAA3
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Apr 2020 12:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1588163225; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UB85kJRWkAnE/ldP2rd2WB1otm7LsPHBG/QdCMbeTtw=;
 b=Y7SJJo7sZnaAuNIPATy0AiHIaWVsd2iyJrs83ZKmUFLR4e0sPDVaCrXhPJh3FdwWeKj5+B
 ymuqI/fKXp9dnLKIal7QsfsqkUT5AoaSpooZL4M9yoymur1N6pMByU7yw/6mHtmHFpYRn4
 m+cKuE3cU7bSMeleVwTgsV9u39AqbSE=
Date: Wed, 29 Apr 2020 14:26:46 +0200
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v7 08/12] arm: dts: s5pv210: Add node for SGX 540
To: Jonathan Bakker <xc-racer2@live.ca>
Message-Id: <MKUJ9Q.OQG3OJ6IYGUE3@crapouillou.net>
In-Reply-To: <BN6PR04MB0660044B5B1D45BE4CBCD2AAA3AC0@BN6PR04MB0660.namprd04.prod.outlook.com>
References: <cover.1587760454.git.hns@goldelico.com>
 <3fd18c747426e15fd1f3500b9c4adce2db9ddd0c.1587760454.git.hns@goldelico.com>
 <NYBE9Q.YH08US7A7DC3@crapouillou.net>
 <BN6PR04MB0660A180D2069848E5C03D7EA3AE0@BN6PR04MB0660.namprd04.prod.outlook.com>
 <20200427154617.GA1798@pi3>
 <BN6PR04MB06605F014024061C894AFBA4A3AC0@BN6PR04MB0660.namprd04.prod.outlook.com>
 <BN6PR04MB0660044B5B1D45BE4CBCD2AAA3AC0@BN6PR04MB0660.namprd04.prod.outlook.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 30 Apr 2020 07:31:56 +0000
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
 "H. Nikolaus Schaller" <hns@goldelico.com>, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-omap@vger.kernel.org, Paul Burton <paulburton@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Tony Lindgren <tony@atomide.com>,
 Chen-Yu Tsai <wens@csie.org>, Kukjin Kim <kgene@kernel.org>,
 James Hogan <jhogan@kernel.org>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, letux-kernel@openphoenux.org,
 linux-arm-kernel@lists.infradead.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Philipp Rossak <embed3d@gmail.com>, openpvrsgx-devgroup@letux.org,
 linux-kernel@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>,
 =?iso-8859-1?q?Beno=EEt?= Cousson <bcousson@baylibre.com>,
 kernel@pyra-handheld.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jonathan,

Le mar. 28 avril 2020 =E0 15:58, Jonathan Bakker <xc-racer2@live.ca> a =

=E9crit :
> Hi all,
> =

> On 2020-04-28 2:39 p.m., Jonathan Bakker wrote:
>>  Hi Krzysztof,
>> =

>>  On 2020-04-27 8:46 a.m., Krzysztof Kozlowski wrote:
>>>  On Sun, Apr 26, 2020 at 07:57:12AM -0700, Jonathan Bakker wrote:
>>>>  Hi Paul,
>>>> =

>>>>  On 2020-04-26 5:56 a.m., Paul Cercueil wrote:
>>>>> =

>>>>> =

>>>>>  Le ven. 24 avril 2020 =E0 22:34, H. Nikolaus Schaller =

>>>>> <hns@goldelico.com> a =E9crit :
>>>>>>  From: Jonathan Bakker <xc-racer2@live.ca>
>>>>>> =

>>>>>>  All s5pv210 devices have a PowerVR SGX 540 (revision 120) =

>>>>>> attached.
>>>>>> =

>>>>>>  There is no external regulator for it so it can be enabled by =

>>>>>> default.
>>>>>> =

>>>>>>  Signed-off-by: Jonathan Bakker <xc-racer2@live.ca>
>>>>>>  Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
>>>>>>  ---
>>>>>>   arch/arm/boot/dts/s5pv210.dtsi | 13 +++++++++++++
>>>>>>   1 file changed, 13 insertions(+)
>>>>>> =

>>>>>>  diff --git a/arch/arm/boot/dts/s5pv210.dtsi =

>>>>>> b/arch/arm/boot/dts/s5pv210.dtsi
>>>>>>  index 2ad642f51fd9..abbdda205c1b 100644
>>>>>>  --- a/arch/arm/boot/dts/s5pv210.dtsi
>>>>>>  +++ b/arch/arm/boot/dts/s5pv210.dtsi
>>>>>>  @@ -512,6 +512,19 @@ vic3: interrupt-controller@f2300000 {
>>>>>>               #interrupt-cells =3D <1>;
>>>>>>           };
>>>>>> =

>>>>>>  +        gpu: gpu@f3000000 {
>>>>>>  +            compatible =3D "samsung,s5pv210-sgx540-120";
>>> =

>>>  This should not pass the bindings check because you missed last
>>>  compatibles.
>>> =

>> =

>>  Thanks for pointing that out, I'll add it and make sure it passes =

>> the bindings check.
>> =

>>>>>>  +            reg =3D <0xf3000000 0x10000>;
>>>>>>  +            interrupt-parent =3D <&vic2>;
>>>>>>  +            interrupts =3D <10>;
>>>>>>  +            clock-names =3D "core";
>>>>>>  +            clocks =3D <&clocks CLK_G3D>;
>>>>>>  +
>>>>>>  +            assigned-clocks =3D <&clocks MOUT_G3D>, <&clocks =

>>>>>> DOUT_G3D>;
>>>>>>  +            assigned-clock-rates =3D <0>, <66700000>;
>>>>>>  +            assigned-clock-parents =3D <&clocks MOUT_MPLL>;
>>>>> =

>>>>>  What are these clocks for, and why are they reparented / =

>>>>> reclocked?
>>>>> =

>>>>>  Shouldn't they be passed to 'clocks' as well?
>>>>> =

>>>>>  -Paul
>>>>> =

>>>> =

>>>>  The G3D clock system can have multiple parents, and for stable =

>>>> operation
>>>>  it's recommended to use the MPLL clock as the parent (which in =

>>>> turn
>>>>  is actually a mux as well).  MOUT_G3D is simply the mux for =

>>>> CLK_G3D
>>>>  (SGX core clock), DOUT_G3D is the divider.  DOUT_G3D could =

>>>> equally be CLK_G3D
>>>>  (and probably should be, for readability) as CLK_G3D is simply =

>>>> the gate and
>>>>  DOUT_G3D is the divider for it.
>>> =

>>>  Good point, it should be CLK_G3D instead of DOUT.  Can you fix =

>>> this as
>>>  well?
>> =

>>  Yep, will do.  Nikolaus, I'll send you an updated patch to include.
>> =

> =

> How are assigned-clocks handled in the yaml DT schema?  When running =

> make dtbs_check,
> I end up with messages such as
> =

> arch/arm/boot/dts/s5pv210-aquila.dt.yaml: gpu@f3000000: =

> 'assigned-clock-parents', 'assigned-clock-rates', 'assigned-clocks' =

> do not match any of the regexes: 'pinctrl-[0-9]+'
> =

> Do they need to explicitly be listed as valid entries?

The assigned-* can also be moved inside the node of the clocks =

provider. I would say it makes more sense to have them there.

-Paul


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
