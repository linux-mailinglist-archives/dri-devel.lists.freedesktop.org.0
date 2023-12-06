Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 887AB807AF4
	for <lists+dri-devel@lfdr.de>; Wed,  6 Dec 2023 23:01:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB17210E7CD;
	Wed,  6 Dec 2023 22:01:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [81.169.146.166])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50A1810E7CD
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Dec 2023 22:01:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1701900084; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=kA12wCOYTodd3qjSmbDCXMQ9dhlNhczgPpXVnPUdQ4yl0ehCbZCtwEBAmrz2Bn6BbH
 Mj5O14hKvTvjxy9ooRpwg93QDYHi3lKAouiZ/GGte6BeUpDuHottyZJho8p+pWdWbgXo
 Y9XaSESlkpGsOOQa5dlQ4VfRI7JJRWOHttnfYk91F5jFInBttSIiTXLTlgNvHHyqPVyT
 gFMJsNiSHF7dbaVVRwiO3fYfxI8NCU08Hvt1tprHKvgPKww5ZKbaUr+F2s6ZrDAHAOAs
 xayDfxt/z6hH+cacDzc0V3qkYKYaHcimxEku6Z6vV+P2AwAfMLMy9af/Jd9tVJT8YoZb
 n0hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1701900084;
 s=strato-dkim-0002; d=strato.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=NAtEJdO7lY/9iAHJWpoLPNdskQfnm8RnMytr6D+2PsI=;
 b=O8qjNEInAzHaQZRbXu/8xsb2Daatfa9Cmt7by8Q03i/WqbKcr2XTqMlCb7/L/a9FNm
 YSmxje7Ld6Q5LaEHGgMt65FYZyWDUZoo6fYqhKfthUOaP3PvF78rJPooMne9Zd3DkXRL
 +8vOQ77dlp4ZCNALT4YaF/Xj0TrVXsggrI60FFtfgEWAQw6EF+c8G8OKftO0eGcgIDby
 7w5vFCndL+r1dRBTHcxkRZvJR8SoLowwHT70m++ULxeiotkhxdsCEFkq7blQ23ucnL4g
 LFr4mc0xDKYzVkps8LTmlUxl/J18rte687ewHyLsecw/sN/erYOsMwjIGpZ1bGKLTA7G
 m7WA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1701900084;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=NAtEJdO7lY/9iAHJWpoLPNdskQfnm8RnMytr6D+2PsI=;
 b=dkHcvgmVBk0SBHEzJC7VAoy1rwH05b0Bn8Mt3aM69NgJtRaWX6kJA5fDwmZXiiZktN
 r2cmuvSgFiryTdHDcM4nCgtuB4+2XebEFKJ4qcX/Hf3hPeMZwIvqhO7hCbcjkSWO8fBA
 pwZfjyseLlSaIu0Nu+yOSKomY3P6PUz19te709ghrdHPuJ2isd4JUy0QUuCV6T+N9kuN
 pqUxMmvJqMABDo6aDXlYeXeLeOwMBQ0/EN1wBiNSPRErhNSsQoOlc4nHvzm55HLRsKL6
 HvBqCbZbnUfdGGRyyrMQGkCYcru22+IcpVTNQql+sHBeCRwYVV8B434DrCHmjRfMSMUA
 H7Tw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1701900084;
 s=strato-dkim-0003; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=NAtEJdO7lY/9iAHJWpoLPNdskQfnm8RnMytr6D+2PsI=;
 b=DXlKxEdk5n4QCnjHYbhv+UIzcP4K4fDltBlFXqZkrdlJqDjy0GD+U+RFL0hVOKnABe
 YbfAzQ7/cDtWL+/7x7Dg==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj5Apz9PSN6LgsXcGeqHQ="
Received: from smtpclient.apple by smtp.strato.de (RZmta 49.10.0 DYNA|AUTH)
 with ESMTPSA id wfeb35zB6M1N9SG
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1
 with 256 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Wed, 6 Dec 2023 23:01:23 +0100 (CET)
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_E961A04A-8C0E-4B35-8D8E-24BEC5263E89"
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.200.91.1.1\))
Subject: Re: [PATCH RFC 01/10] dt-bindings: gpu: Add PowerVR Series5 SGX GPUs
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <8328bec9-a963-4f8a-ae03-a531749a30db@ti.com>
Date: Wed, 6 Dec 2023 23:01:12 +0100
Message-Id: <3ACD52E4-4B11-46F6-A6D5-C758ABAC6522@goldelico.com>
References: <20231204182245.33683-1-afd@ti.com>
 <20231204182245.33683-2-afd@ti.com>
 <CFF198DA-5C42-425E-86F4-759629489ECB@goldelico.com>
 <cb590a13-e0ff-49d9-8583-be613ad50dc5@ti.com>
 <FE0DBA5E-95A5-4C27-9F69-D1D8BDF56EC3@goldelico.com>
 <20231206-wolverine-paprika-0674ca01e1f2@spud>
 <8328bec9-a963-4f8a-ae03-a531749a30db@ti.com>
To: Andrew Davis <afd@ti.com>
X-Mailer: Apple Mail (2.3774.200.91.1.1)
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
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tony Lindgren <tony@atomide.com>, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Donald Robson <donald.robson@imgtec.com>, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 =?utf-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
 Maxime Ripard <mripard@kernel.org>, Matt Coster <matt.coster@imgtec.com>,
 Rob Herring <robh+dt@kernel.org>, linux-omap@vger.kernel.org,
 Adam Ford <aford173@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Tero Kristo <kristo@kernel.org>, linux-kernel@vger.kernel.org,
 Conor Dooley <conor@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--Apple-Mail=_E961A04A-8C0E-4B35-8D8E-24BEC5263E89
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



> Am 06.12.2023 um 17:15 schrieb Andrew Davis <afd@ti.com>:
>=20
> On 12/6/23 10:02 AM, Conor Dooley wrote:
>> On Tue, Dec 05, 2023 at 07:04:05PM +0100, H. Nikolaus Schaller wrote:
>>>> Am 05.12.2023 um 18:33 schrieb Andrew Davis <afd@ti.com>:
>>>>=20
>>>> On 12/5/23 2:17 AM, H. Nikolaus Schaller wrote:
>>>>>> +          - enum:
>>>>>> +              - ti,omap3430-gpu # Rev 121
>>>>>> +              - ti,omap3630-gpu # Rev 125
>>>>> Is the "Rev 121" and "Rev 125" a property of the SoC integration =
(clock/reset/power
>>>>> hookup etc.) or of the integrated SGX core?
>>>>=20
>>>> The Rev is a property of the SGX core, not the SoC integration.
>>>=20
>>> Then, it should belong there and not be a comment of the =
ti,omap*-gpu record.
>>> In this way it does not seem to be a proper hardware description.
>>>=20
>>> BTW: there are examples where the revision is part of the compatible =
string, even
>>> if the (Linux) driver makes no use of it:
>>>=20
>>> drivers/net/ethernet/xilinx/xilinx_emaclite.c
>> AFAICT these Xilinx devices that put the revisions in the compatible =
are
>> a different case - they're "soft" IP intended for use in the fabric =
of
>> an FPGA, and assigning a device specific compatible there does not =
make
>> sense.
>> In this case it appears that the revision is completely known once =
you
>> see "ti,omap3630-gpu", so encoding the extra "121" into the =
compatible
>> string is not required.
>>>=20
>>>> But it seems that
>>>> compatible string is being used to define both (as we see being =
debated in the other
>>>> thread on this series).
>>>>=20
>>>>> In my understanding the Revs are different variants of the SGX =
core (errata
>>>>> fixes, instruction set, pipeline size etc.). And therefore the =
current driver code
>>>>> has to be configured by some macros to handle such cases.
>>>>> So the Rev should IMHO be part of the next line:
>>>>>> +          - const: img,powervr-sgx530
>>>>> +          - enum:
>>>>> +              - img,powervr-sgx530-121
>>>>> +              - img,powervr-sgx530-125
>>>>> We have a similar definition in the openpvrsgx code.
>>>>> Example: compatible =3D "ti,omap3-sgx530-121", "img,sgx530-121", =
"img,sgx530";
>>>>> (I don't mind about the powervr- prefix).
>>>>> This would allow a generic and universal sgx driver (loaded =
through just matching
>>>>> "img,sgx530") to handle the errata and revision specifics at =
runtime based on the
>>>>> compatible entry ("img,sgx530-121") and know about SoC integration =
("ti,omap3-sgx530-121").
>> The "raw" sgx530 compatible does not seem helpful if the sgx530-121 =
or
>> sgx530-125 compatibles are also required to be present for the driver =
to
>> actually function. The revision specific compatibles I would not =
object
>> to, but everything in here has different revisions anyway - does the
>> same revision actually appear in multiple devices? If it doesn't then =
I
>> don't see any value in the suffixed compatibles either.
>=20
> Everything here has different revisions because any device that uses
> the same revision can also use the same base compatible string. For
> instance AM335x SoCs use the SGX530 revision 125, same as OMAP3630,
> so I simply reuse that compatible in their DT as you can see in
> patch [5/10]. I didn't see the need for a new compatible string
> for identical (i.e. "compatible") IP and integration.

Ok, this is a point. As long as there is no SoC which can come with =
different
SGX revisions the SoC compatible is enough for everything.

I never looked it that way.

>=20
> The first device to use that IP/revision combo gets the named
> compatible, all others re-use the same compatible where possible.

Hm. If we take this rule, we can even completely leave out all

+          - const: img,powervr-sgx530
+          - const: img,powervr-sgx540
+          - const: img,powervr-sgx544

and just have a list of allsgx compatible SoC:

+      - items:
+          - enum:
+              - ti,am62-gpu	# IMG AXE GPU model/revision is fully =
discoverable
+              - ti,omap3430-gpu # sgx530 Rev 121
+              - ti,omap3630-gpu # sgx530 Rev 125
+              - ingenic,jz4780-gpu # sgx540 Rev 130
+              - ti,omap4430-gpu # sgx540 Rev 120
+              - allwinner,sun6i-a31-gpu # sgx544 MP2 Rev 115
+              - ti,omap4470-gpu # sgx544 MP1 Rev 112
+              - ti,omap5432-gpu # sgx544 MP2 Rev 105
+              - ti,am5728-gpu # sgx544 MP2 Rev 116
+              - ti,am6548-gpu # sgx544 MP1 Rev 117
+              - more to come

>=20
> Andrew
>=20
>>>>> And user-space can be made to load the right firmware variant =
based on "img,sgx530-121"
>>>>> I don't know if there is some register which allows to discover =
the revision long
>>>>> before the SGX subsystem is initialized and the firmware is up and =
running.
>>>>> What I know is that it is possible to read out the revision after =
starting the firmware
>>>>> but it may just echo the version number of the firmware binary =
provided from user-space.
>>>>=20
>>>> We should be able to read out the revision (register =
EUR_CR_CORE_REVISION), the problem is
>>>> today the driver is built for a given revision at compile time.
>>>=20
>>> Yes, that is something we had planned to get rid of for a long time =
by using different compatible
>>> strings and some variant specific struct like many others drivers =
are doing it.
>>> But it was a to big task so nobody did start with it.
>>>=20
>>>> That is a software issue,
>>>> not something that we need to encode in DT. While the core ID =
(SGX5xx) can be also detected
>>>> (EUR_CR_CORE_ID), the location of that register changes, and so it =
does need encoded in
>>>> DT compatible.
>>>=20
>>> Ok, I didn't know about such registers as there is not much public =
information available.
>>> Fair enough, there are some error reports about in different forums.
>>>=20
>>> On the other hand we then must read out this register in more or =
less early initialization
>>> stages. Even if we know this information to be static and it could =
be as simple as a list
>>> of compatible strings in the driver.
>>>=20
>>>> The string "ti,omap3430-gpu" tells us the revision if we cannot =
detect it (as in the current
>>>> driver), and the SoC integration is generic anyway (just a reg and =
interrupt).
>>>=20
>>> It of course tells, but may need a translation table that needs to =
be maintained in a
>>> different format. Basically the same what the comments show in a =
non-machine readable
>>> format.
>>>=20
>>> I just wonder why the specific version can or should not become =
simply part of the DTS
>>> and needs this indirection.
>>>=20
>>> Basically it is a matter of openness for future (driver) development =
and why it needs
>>> careful decisions.
>>>=20
>>> So in other words: I would prefer to see the comments about versions =
encoded in the device
>>> tree binary to make it machine readable.
>> It's already machine readable if it is invariant on an SoC given the
>> patch had SoC-specific compatibles.
>=20


--Apple-Mail=_E961A04A-8C0E-4B35-8D8E-24BEC5263E89
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; =
charset=3Dus-ascii"></head><body style=3D"overflow-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;"><br =
id=3D"lineBreakAtBeginningOfMessage"><div><br><blockquote =
type=3D"cite"><div>Am 06.12.2023 um 17:15 schrieb Andrew Davis =
&lt;afd@ti.com&gt;:</div><br =
class=3D"Apple-interchange-newline"><div><div>On 12/6/23 10:02 AM, Conor =
Dooley wrote:<br><blockquote type=3D"cite">On Tue, Dec 05, 2023 at =
07:04:05PM +0100, H. Nikolaus Schaller wrote:<br><blockquote =
type=3D"cite"><blockquote type=3D"cite">Am 05.12.2023 um 18:33 schrieb =
Andrew Davis &lt;afd@ti.com&gt;:<br><br>On 12/5/23 2:17 AM, H. Nikolaus =
Schaller wrote:<br><blockquote type=3D"cite"><blockquote type=3D"cite">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- enum:<br>+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;- ti,omap3430-gpu # Rev 121<br>+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;- ti,omap3630-gpu # Rev 125<br></blockquote>Is the "Rev 121" and =
"Rev 125" a property of the SoC integration (clock/reset/power<br>hookup =
etc.) or of the integrated SGX core?<br></blockquote><br>The Rev is a =
property of the SGX core, not the SoC =
integration.<br></blockquote><br>Then, it should belong there and not be =
a comment of the ti,omap*-gpu record.<br>In this way it does not seem to =
be a proper hardware description.<br><br>BTW: there are examples where =
the revision is part of the compatible string, even<br>if the (Linux) =
driver makes no use of =
it:<br><br>drivers/net/ethernet/xilinx/xilinx_emaclite.c<br></blockquote>A=
FAICT these Xilinx devices that put the revisions in the compatible =
are<br>a different case - they're "soft" IP intended for use in the =
fabric of<br>an FPGA, and assigning a device specific compatible there =
does not make<br>sense.<br>In this case it appears that the revision is =
completely known once you<br>see "ti,omap3630-gpu", so encoding the =
extra "121" into the compatible<br>string is not =
required.<br><blockquote type=3D"cite"><br><blockquote type=3D"cite">But =
it seems that<br>compatible string is being used to define both (as we =
see being debated in the other<br>thread on this =
series).<br><br><blockquote type=3D"cite">In my understanding the Revs =
are different variants of the SGX core (errata<br>fixes, instruction =
set, pipeline size etc.). And therefore the current driver code<br>has =
to be configured by some macros to handle such cases.<br>So the Rev =
should IMHO be part of the next line:<br><blockquote type=3D"cite">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- const: =
img,powervr-sgx530<br></blockquote>+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- enum:<br>+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;- img,powervr-sgx530-121<br>+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;- img,powervr-sgx530-125<br>We have a similar definition in the =
openpvrsgx code.<br>Example: compatible =3D "ti,omap3-sgx530-121", =
"img,sgx530-121", "img,sgx530";<br>(I don't mind about the powervr- =
prefix).<br>This would allow a generic and universal sgx driver (loaded =
through just matching<br>"img,sgx530") to handle the errata and revision =
specifics at runtime based on the<br>compatible entry ("img,sgx530-121") =
and know about SoC integration =
("ti,omap3-sgx530-121").<br></blockquote></blockquote></blockquote>The =
"raw" sgx530 compatible does not seem helpful if the sgx530-121 =
or<br>sgx530-125 compatibles are also required to be present for the =
driver to<br>actually function. The revision specific compatibles I =
would not object<br>to, but everything in here has different revisions =
anyway - does the<br>same revision actually appear in multiple devices? =
If it doesn't then I<br>don't see any value in the suffixed compatibles =
either.<br></blockquote><br>Everything here has different revisions =
because any device that uses<br>the same revision can also use the same =
base compatible string. For<br>instance AM335x SoCs use the SGX530 =
revision 125, same as OMAP3630,<br>so I simply reuse that compatible in =
their DT as you can see in<br>patch [5/10]. I didn't see the need for a =
new compatible string<br>for identical (i.e. "compatible") IP and =
integration.<br></div></div></blockquote><div><br></div>Ok, this is a =
point. As long as there is no SoC which can come with =
different</div><div>SGX revisions the SoC compatible is enough for =
everything.</div><div><br></div><div>I never looked it that =
way.</div><div><br><blockquote type=3D"cite"><div><div><br>The first =
device to use that IP/revision combo gets the named<br>compatible, all =
others re-use the same compatible where =
possible.<br></div></div></blockquote><div><br></div>Hm. If we take this =
rule, we can even completely leave out all</div><div><span =
style=3D"font-family: Menlo-Regular; font-size: =
11px;"><br></span></div><div><span style=3D"font-family: Menlo-Regular; =
font-size: 11px;">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- const: =
img,powervr-sgx530</span><br style=3D"font-family: Menlo-Regular; =
font-size: 11px;"><span style=3D"font-family: Menlo-Regular; font-size: =
11px;">+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- const: =
img,powervr-sgx540</span></div><div><span style=3D"font-family: =
Menlo-Regular; font-size: 11px;">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- const: =
img,powervr-sgx544</span><br style=3D"font-family: Menlo-Regular; =
font-size: 11px;"><br></div><div>and just have a list of allsgx =
compatible SoC:</div><div><span style=3D"font-family: Menlo-Regular; =
font-size: 11px;"><br></span></div><div><span style=3D"font-family: =
Menlo-Regular; font-size: 11px;">+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- =
items:</span><br style=3D"font-family: Menlo-Regular; font-size: =
11px;"><span style=3D"font-family: Menlo-Regular; font-size: 11px;">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- enum:</span><br =
style=3D"font-family: Menlo-Regular; font-size: 11px;"><span =
style=3D"font-family: Menlo-Regular; font-size: 11px;">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;- ti,am62-gpu<span class=3D"Apple-tab-span" style=3D"white-space:pre">=
	</span>#&nbsp;</span><span style=3D"font-family: Menlo-Regular; =
font-size: 11px;">IMG AXE GPU model/revision is fully =
discoverable</span><br style=3D"font-family: Menlo-Regular; font-size: =
11px;"><span style=3D"font-family: Menlo-Regular; font-size: 11px;">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;- ti,omap3430-gpu # sgx530 Rev 121</span><br style=3D"font-family: =
Menlo-Regular; font-size: 11px;"><span style=3D"font-family: =
Menlo-Regular; font-size: 11px;">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;- ti,omap3630-gpu # sgx530 Rev 125</span><br style=3D"font-family: =
Menlo-Regular; font-size: 11px;"><span style=3D"font-family: =
Menlo-Regular; font-size: 11px;">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;- ingenic,jz4780-gpu # sgx540 Rev 130</span><br style=3D"font-family: =
Menlo-Regular; font-size: 11px;"><span style=3D"font-family: =
Menlo-Regular; font-size: 11px;">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;- ti,omap4430-gpu # sgx540 Rev 120</span><br style=3D"font-family: =
Menlo-Regular; font-size: 11px;"><span style=3D"font-family: =
Menlo-Regular; font-size: 11px;">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;- allwinner,sun6i-a31-gpu # sgx544 MP2 Rev 115</span><br =
style=3D"font-family: Menlo-Regular; font-size: 11px;"><span =
style=3D"font-family: Menlo-Regular; font-size: 11px;">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;- ti,omap4470-gpu #&nbsp;</span><span style=3D"font-family: =
Menlo-Regular; font-size: 11px;">sgx544</span><span style=3D"font-family: =
Menlo-Regular; font-size: 11px;">&nbsp;</span><span style=3D"font-family: =
Menlo-Regular; font-size: 11px;">MP1 Rev 112</span></div><div><span =
style=3D"font-family: Menlo-Regular; font-size: 11px;">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;- ti,omap5432-gpu #&nbsp;</span><span style=3D"font-family: =
Menlo-Regular; font-size: 11px;">sgx544</span><span style=3D"font-family: =
Menlo-Regular; font-size: 11px;">&nbsp;</span><span style=3D"font-family: =
Menlo-Regular; font-size: 11px;">MP2 Rev 105</span></div><div><span =
style=3D"font-family: Menlo-Regular; font-size: 11px;">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;- ti,am5728-gpu #&nbsp;</span><span style=3D"font-family: =
Menlo-Regular; font-size: 11px;">sgx544</span><span style=3D"font-family: =
Menlo-Regular; font-size: 11px;">&nbsp;</span><span style=3D"font-family: =
Menlo-Regular; font-size: 11px;">MP2 Rev 116</span></div><div><span =
style=3D"font-family: Menlo-Regular; font-size: 11px;">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;- ti,am6548-gpu #&nbsp;</span><span style=3D"font-family: =
Menlo-Regular; font-size: 11px;">sgx544</span><span style=3D"font-family: =
Menlo-Regular; font-size: 11px;">&nbsp;</span><span style=3D"font-family: =
Menlo-Regular; font-size: 11px;">MP1 Rev 117</span></div><div><font =
face=3D"Menlo-Regular"><span style=3D"font-size: 11px;">+ &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;- more to =
come</span></font></div><div><br></div><div><blockquote =
type=3D"cite"><div><div><br>Andrew<br><br><blockquote =
type=3D"cite"><blockquote type=3D"cite"><blockquote =
type=3D"cite"><blockquote type=3D"cite">And user-space can be made to =
load the right firmware variant based on "img,sgx530-121"<br>I don't =
know if there is some register which allows to discover the revision =
long<br>before the SGX subsystem is initialized and the firmware is up =
and running.<br>What I know is that it is possible to read out the =
revision after starting the firmware<br>but it may just echo the version =
number of the firmware binary provided from =
user-space.<br></blockquote><br>We should be able to read out the =
revision (register EUR_CR_CORE_REVISION), the problem is<br>today the =
driver is built for a given revision at compile =
time.<br></blockquote><br>Yes, that is something we had planned to get =
rid of for a long time by using different compatible<br>strings and some =
variant specific struct like many others drivers are doing it.<br>But it =
was a to big task so nobody did start with it.<br><br><blockquote =
type=3D"cite">That is a software issue,<br>not something that we need to =
encode in DT. While the core ID (SGX5xx) can be also =
detected<br>(EUR_CR_CORE_ID), the location of that register changes, and =
so it does need encoded in<br>DT compatible.<br></blockquote><br>Ok, I =
didn't know about such registers as there is not much public information =
available.<br>Fair enough, there are some error reports about in =
different forums.<br><br>On the other hand we then must read out this =
register in more or less early initialization<br>stages. Even if we know =
this information to be static and it could be as simple as a list<br>of =
compatible strings in the driver.<br><br><blockquote type=3D"cite">The =
string "ti,omap3430-gpu" tells us the revision if we cannot detect it =
(as in the current<br>driver), and the SoC integration is generic anyway =
(just a reg and interrupt).<br></blockquote><br>It of course tells, but =
may need a translation table that needs to be maintained in =
a<br>different format. Basically the same what the comments show in a =
non-machine readable<br>format.<br><br>I just wonder why the specific =
version can or should not become simply part of the DTS<br>and needs =
this indirection.<br><br>Basically it is a matter of openness for future =
(driver) development and why it needs<br>careful decisions.<br><br>So in =
other words: I would prefer to see the comments about versions encoded =
in the device<br>tree binary to make it machine =
readable.<br></blockquote>It's already machine readable if it is =
invariant on an SoC given the<br>patch had SoC-specific =
compatibles.<br></blockquote><br></div></div></blockquote></div><br></body=
></html>=

--Apple-Mail=_E961A04A-8C0E-4B35-8D8E-24BEC5263E89--
