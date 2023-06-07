Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C19B725852
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 10:46:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D5CE10E482;
	Wed,  7 Jun 2023 08:45:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ex01.ufhost.com (ex01.ufhost.com [61.152.239.75])
 by gabe.freedesktop.org (Postfix) with ESMTP id A8D1C10E456
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 08:02:52 +0000 (UTC)
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
 by ex01.ufhost.com (Postfix) with ESMTP id E591624E307;
 Wed,  7 Jun 2023 16:02:35 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 7 Jun
 2023 16:02:35 +0800
Received: from [192.168.60.122] (180.164.60.184) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 7 Jun
 2023 16:02:35 +0800
Message-ID: <ab89b684-8b49-2088-b0d2-ca362fd9dfb4@starfivetech.com>
Date: Wed, 7 Jun 2023 16:02:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 1/9] dt-bindings: display: Add yamls for JH7110 display
 subsystem
Content-Language: en-US
References: <20230602074043.33872-1-keith.zhao@starfivetech.com>
 <20230602-uncommon-rejoicing-e73c0c475f9f@spud>
 <TY3P286MB26116576E3E502CAE53834599852A@TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM>
 <1991848.PYKUYFuaPT@diego> <20230606-geometry-blurb-1f0f07d4bf6a@spud>
 <ifgjvonhkzcwrklzch5efguor2x6az4m737dwte4uyow7ar5dr@z4glaxse6dou>
From: Keith Zhao <keith.zhao@starfivetech.com>
To: undisclosed-recipients:;
In-Reply-To: <ifgjvonhkzcwrklzch5efguor2x6az4m737dwte4uyow7ar5dr@z4glaxse6dou>
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [180.164.60.184]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 07 Jun 2023 08:45:25 +0000
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



On 2023/6/7 14:41, Maxime Ripard wrote:
> On Tue, Jun 06, 2023 at 11:37:53PM +0100, Conor Dooley wrote:
>> On Wed, Jun 07, 2023 at 12:22:33AM +0200, Heiko St=C3=BCbner wrote:
>> > Am Dienstag, 6. Juni 2023, 20:41:17 CEST schrieb Shengyu Qu:
>> > > > On Fri, Jun 02, 2023 at 03:40:35PM +0800, Keith Zhao wrote:
>> > > >> Add bindings for JH7110 display subsystem which
>> > > >> has a display controller verisilicon dc8200
>> > > >> and an HDMI interface.
>>=20
>> > > >> +description:
>> > > >> +  The StarFive SoC uses the HDMI signal transmiter based on in=
nosilicon IP
>> > > > Is innosilicon the same thing as verisilicon? Also
>> > > > s/transmiter/transmitter/, both here and in the title.
yes,innosilicon is the HDMI IP  and verisilicon is the DC-controller IP

>> > >=20
>> > > I think that is not the same, I remember Rockchip has used a HDMI=20
>> > > transmitter from
>> > >=20
>> > > Innosilicon, and there is a existing driver for that in mainline.
>> >=20
>> > Yep, I think Innosilicon is the company you turn to when you want to=
 save
>> > a bit of money ;-) . In the bigger SoCs Rockchip most of the time us=
es
>> > Designware hdmi blocks and looking at the history only the rk3036 ev=
er
>> > used an Innosilicon block.
>> >=20
I have done a HDMIcomparison of the rk3036 and the jh7110, and they are b=
oth based on ip Innosilicon.

the hardware of them .
Some parts of the hardware of the two are common, such as the logic of hd=
mi I2C to obtain edid, and the register definition is consistent.

Many registers are defined differently from the linux main line inno driv=
er, including registers that contain specific bits
and some registers in linux main line inno driver no longer used in my ne=
w inoo hdmi hardware.

>> > Looking at the history, 2016 really was a long time ago :-D.
>> >=20
>> > > So Keith, if that's true, I think it is better to seperate the HDM=
I=20
>> > > stuff and reuse existing driver.
>> >=20
>> > I'm not so sure about that - at least from a cursory glance :-) .
>> >=20
>> > The registers do look slightly different and I don't know how much
>> > the IP changed between the rk3036-version and the jh7110 version.
>> >=20
>> > At the very least, I know my rk3036 board isn't booting right now, s=
o
>> > I can't really provide help for generalizing the rockchip-driver.
>> >=20
>> > At the very least both the binding and driver could drop the "starfi=
ve-hdmi"
>> > and actually use the Innosilicon in the naming somewhere, so that it=
's
>> > clear for future developers :-)
>>=20
>> Seeing "based on" always makes me a little bit nervous to be honest wh=
en
>> it comes to using a compatible from the IP. Is it the IP? What version
>> is it? etc. Perhaps "starfive,jh7110-hdmi" & falling back to some sort
>> of "innosilicon,hdmi" would be more future/IP-silliness proof.
>> Driver can always be generic & bind against "innosilicon,hdmi" until
>> that becomes impossible.
>=20
> Given that Neil was saying that there's at least two
> generations/revisions/models of an HDMI controller from Innosilicon, I'=
m
> not sure that compatible is enough to reach that goal anyway.
>=20
> Maxime



I will change the  the binding  to meet innosilicon,hdmi .
for the drivers part , I will study the possibility of RK-HDMI reuse.

Thank you for your comments















