Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA15807AB8
	for <lists+dri-devel@lfdr.de>; Wed,  6 Dec 2023 22:44:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A757010E7AD;
	Wed,  6 Dec 2023 21:44:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de
 [81.169.146.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3307C10E7AD
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Dec 2023 21:44:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1701899020; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=mY1EpRkbVxlRgu9zZqHTd56JQXX9iAG0liqyRMYLdkaydBQIAEF+HVAjGzOHFsdIkY
 FjdLWovG0YfpdGUR9t06JYqh2t7uaJIa1aNKskN+SuLiYCfR6AU/5oxFFRxDh99RdrGf
 kw9f3dnjfOu2P8K6wOfOgM7xsIiJcEq81itq937GrKaS3sPV7Y+rTj07m90mZd6jIPnd
 Biys3oyEIl2pAJMOo7WpcwhFpA2sDd7Sy795ediSzpIQT9ogsljLqJBrwS/WJv3DRdZX
 4+npj0RDrhbcT+VWWSGu+YOrmbQfavB8SgCKANur2A5vyqjMhseF3uSuU/KwS0lDWFz2
 ib5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1701899020;
 s=strato-dkim-0002; d=strato.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=Cg5evnYKreV1OBQkmtI5cwBccAfdbjnTgIyjumKDKfE=;
 b=AZr6aD1ByyWDi3MQrUorQAEtTS1R4s/SpWLgq4vID8Laycwuh0kfWkRDKnIWKdplnp
 sPaVlJznl0y7VUjP4yPr8bZ47RrsD2lDDrTbM4WUw+MDEXwwJIKQ7THcZPK4YWglpZCq
 GPgocmzuuMenswYwOzcoP7DHapmJX6BW79fLHjYdu9WKdDHaxT1TiZdSjEV9iADL/01u
 e/Pgc/AFXVZV/Yx2C1ZAiVhiQoAfr7q9UdWSqSGY8WqY4X3p/G5WwZBq5dS+r2NyjaU1
 fUTeSoCovFn/NkWuVvZKgHHjbUHoxfbIgsGxcJZxc1uumMi5IdVWmH4uKdzE3swVHsah
 aDaA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1701899020;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=Cg5evnYKreV1OBQkmtI5cwBccAfdbjnTgIyjumKDKfE=;
 b=bthvfYeErmbD8OtUEa3s8nII3I7vuFW1ga5BliPGl0vZJ2taLjD5CESTt8Vzu31agl
 3R3RBZqjPD8OprQITw0pCoBl/Gg6HX70tI2BB/w+QBGusGTdSwnc62RVnD9kSq/tLFIg
 cbnEzCUFscxF1IuXjrlsLF9OZhYIpnVezJ5hL2JXMB4KYYoCibTrjwo/PKkWSeq+Fx2y
 HQs6FN/+3yPNCfmRWOfMqVA1cqD7YWN2yQ/Gea8FU4/RiFHDXKpmaA+QNvKhNbXn4CL9
 yR5859IGQ6i0TNoL3lR/ie8OFvnvQDNOz/LkXIiawAuqD7arPW5crqXUVVVP7I5pu3rg
 iWlw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1701899020;
 s=strato-dkim-0003; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=Cg5evnYKreV1OBQkmtI5cwBccAfdbjnTgIyjumKDKfE=;
 b=YhrSAsLmlIf0+R9YsctQrUq2bg0/06nzIhHC0zOU7zJRtQmejw2pdeAUDnBnA31jck
 VGDiLbHrJifX5Sc2EkCw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj5Apz9PSN6LgsXcGeqHQ="
Received: from smtpclient.apple by smtp.strato.de (RZmta 49.10.0 DYNA|AUTH)
 with ESMTPSA id wfeb35zB6Lhc9Px
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1
 with 256 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Wed, 6 Dec 2023 22:43:38 +0100 (CET)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.200.91.1.1\))
Subject: Re: [PATCH RFC 01/10] dt-bindings: gpu: Add PowerVR Series5 SGX GPUs
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20231206-wolverine-paprika-0674ca01e1f2@spud>
Date: Wed, 6 Dec 2023 22:43:27 +0100
Content-Transfer-Encoding: quoted-printable
Message-Id: <07CB504D-F4B7-425A-A24C-D0DC079ED48E@goldelico.com>
References: <20231204182245.33683-1-afd@ti.com>
 <20231204182245.33683-2-afd@ti.com>
 <CFF198DA-5C42-425E-86F4-759629489ECB@goldelico.com>
 <cb590a13-e0ff-49d9-8583-be613ad50dc5@ti.com>
 <FE0DBA5E-95A5-4C27-9F69-D1D8BDF56EC3@goldelico.com>
 <20231206-wolverine-paprika-0674ca01e1f2@spud>
To: Conor Dooley <conor@kernel.org>
X-Mailer: Apple Mail (2.3774.200.91.1.1)
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
 Andrew Davis <afd@ti.com>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> Am 06.12.2023 um 17:02 schrieb Conor Dooley <conor@kernel.org>:
>=20
> On Tue, Dec 05, 2023 at 07:04:05PM +0100, H. Nikolaus Schaller wrote:
>>> Am 05.12.2023 um 18:33 schrieb Andrew Davis <afd@ti.com>:
>>>=20
>>> On 12/5/23 2:17 AM, H. Nikolaus Schaller wrote:
>>>>> +          - enum:
>>>>> +              - ti,omap3430-gpu # Rev 121
>>>>> +              - ti,omap3630-gpu # Rev 125
>>>> Is the "Rev 121" and "Rev 125" a property of the SoC integration =
(clock/reset/power
>>>> hookup etc.) or of the integrated SGX core?
>>>=20
>>> The Rev is a property of the SGX core, not the SoC integration.
>>=20
>> Then, it should belong there and not be a comment of the ti,omap*-gpu =
record.
>> In this way it does not seem to be a proper hardware description.
>>=20
>> BTW: there are examples where the revision is part of the compatible =
string, even
>> if the (Linux) driver makes no use of it:
>>=20
>> drivers/net/ethernet/xilinx/xilinx_emaclite.c
>=20
> AFAICT these Xilinx devices that put the revisions in the compatible =
are
> a different case - they're "soft" IP intended for use in the fabric of
> an FPGA, and assigning a device specific compatible there does not =
make
> sense.
>=20
> In this case it appears that the revision is completely known once you
> see "ti,omap3630-gpu", so encoding the extra "121" into the compatible
> string is not required.

Well, I would not put my hand in the fire for this assumption.

And I am a friend of explicitly stating what is instead ot encoding =
indirectly.

>=20
>>=20
>>> But it seems that
>>> compatible string is being used to define both (as we see being =
debated in the other
>>> thread on this series).
>>>=20
>>>> In my understanding the Revs are different variants of the SGX core =
(errata
>>>> fixes, instruction set, pipeline size etc.). And therefore the =
current driver code
>>>> has to be configured by some macros to handle such cases.
>>>> So the Rev should IMHO be part of the next line:
>>>>> +          - const: img,powervr-sgx530
>>>> +          - enum:
>>>> +              - img,powervr-sgx530-121
>>>> +              - img,powervr-sgx530-125
>>>> We have a similar definition in the openpvrsgx code.
>>>> Example: compatible =3D "ti,omap3-sgx530-121", "img,sgx530-121", =
"img,sgx530";
>>>> (I don't mind about the powervr- prefix).
>>>> This would allow a generic and universal sgx driver (loaded through =
just matching
>>>> "img,sgx530") to handle the errata and revision specifics at =
runtime based on the
>>>> compatible entry ("img,sgx530-121") and know about SoC integration =
("ti,omap3-sgx530-121").
>=20
> The "raw" sgx530 compatible does not seem helpful if the sgx530-121 or
> sgx530-125 compatibles are also required to be present for the driver =
to
> actually function.

Indeed. This seems to be redundant (but may need some pattern =
processing).

> The revision specific compatibles I would not object
> to, but everything in here has different revisions anyway - does the
> same revision actually appear in multiple devices? If it doesn't then =
I
> don't see any value in the suffixed compatibles either.

Well, we don't know.

So far only a subset of SoC with the SGX GPU core variants has been =
considered
(mainly because lack of user space code and device owners).

Maybe someone with insider knowledge can give a hint if the SGX version =
numbers
were assigned uniquely for each SoC integration project.

>=20
>>>> And user-space can be made to load the right firmware variant based =
on "img,sgx530-121"
>>>> I don't know if there is some register which allows to discover the =
revision long
>>>> before the SGX subsystem is initialized and the firmware is up and =
running.
>>>> What I know is that it is possible to read out the revision after =
starting the firmware
>>>> but it may just echo the version number of the firmware binary =
provided from user-space.
>>>=20
>>> We should be able to read out the revision (register =
EUR_CR_CORE_REVISION), the problem is
>>> today the driver is built for a given revision at compile time.
>>=20
>> Yes, that is something we had planned to get rid of for a long time =
by using different compatible
>> strings and some variant specific struct like many others drivers are =
doing it.
>> But it was a to big task so nobody did start with it.
>>=20
>>> That is a software issue,
>>> not something that we need to encode in DT. While the core ID =
(SGX5xx) can be also detected
>>> (EUR_CR_CORE_ID), the location of that register changes, and so it =
does need encoded in
>>> DT compatible.
>>=20
>> Ok, I didn't know about such registers as there is not much public =
information available.
>> Fair enough, there are some error reports about in different forums.
>>=20
>> On the other hand we then must read out this register in more or less =
early initialization
>> stages. Even if we know this information to be static and it could be =
as simple as a list
>> of compatible strings in the driver.
>>=20
>>> The string "ti,omap3430-gpu" tells us the revision if we cannot =
detect it (as in the current
>>> driver), and the SoC integration is generic anyway (just a reg and =
interrupt).
>>=20
>> It of course tells, but may need a translation table that needs to be =
maintained in a
>> different format. Basically the same what the comments show in a =
non-machine readable
>> format.
>>=20
>> I just wonder why the specific version can or should not become =
simply part of the DTS
>> and needs this indirection.
>>=20
>> Basically it is a matter of openness for future (driver) development =
and why it needs
>> careful decisions.
>>=20
>> So in other words: I would prefer to see the comments about versions =
encoded in the device
>> tree binary to make it machine readable.
>=20
> It's already machine readable if it is invariant on an SoC given the
> patch had SoC-specific compatibles.

But needs a translation table to get to the revision number.

I have not yet brought into discussion that there are different =
firmwares for sgx530-121,
sgx530-125, sgx544-116 etc. And user-space code may also depend on to be =
able to chose
the right one if multiple firmware packages are installed. Currently =
this is not the case
but would be a major benfit for OS packages.

To automate this we need a mechanism to scan the device tree for a =
compatible string that
tells which firmware variant to load.

But why force this to depend on the SoC compatible if it only depends =
indirectly?

By the way, there is a tested and working driver using the scheme with =
the sub-versions:

=
https://github.com/openpvrsgx-devgroup/linux_openpvrsgx/blob/11cc7876ba39b=
6172d19ee0bf0a872c1d3d745e1/drivers/gpu/drm/pvrsgx/pvr-drv.c#L306

On the other hand As far as I see this will can of course be adapted to =
the newly
proposed scheme.

But it still seems a bit twisted to me. Maybe because we for example =
define LCD panel
compatibles not by the compatible of the device they are installed in.

BR,
Nikolaus=
