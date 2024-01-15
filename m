Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5086682D55C
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jan 2024 09:56:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3E768928D;
	Mon, 15 Jan 2024 08:56:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de
 [85.215.255.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BABF08928D
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jan 2024 08:55:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1705308912; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=qjzfTZXIn8ULyATbJ8kYws4bzV++on2FpfW1SqbtHT2ZnlgpuuvjMFc9zWdYkSUb1P
 pflMhVIuUbCfLuoxbfOdW/zf8sM4TwYDjmW3ythMRZUO8lnVMlOM+QZSMHstRbG8VtiX
 5pwr2BiVJ8tdtG3poAmvrV+xsIuYkRT1GgmC8BDbXpdWsN0ctXi7pD4TNEpj/lq2pZtL
 k5pdszBql0UT/kPieggXIZvTKJN+RftG6PAfZYMvuyDyo1qhrOsV6EbbV3/PajMnlMUp
 1YUs2dJHnFqWnbil9Jo1DCF5ZxyOlev+0ttwdR9LtJTWIkOeqAavF9AGa1aW9v9FJ8+r
 UYYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1705308912;
 s=strato-dkim-0002; d=strato.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=yHFJRaGiqBFJv2kzsrvLiyk/a/j3+Epn1Hl4IwAPpOQ=;
 b=FczWUnwFJvS7KFS7oNsI/m5tBh2F7SkhYobWhH96170UEzMMHAY7/a2uyfmRbvRKow
 XxzFEyTyBSOpP3cF9pfgWkeza1nyq9zf9oi94YsTKyXshRdfn0d2e1F+xcLv8awnUM+t
 23KGqjcyo8asdDAHzV7uXyl/kvjTh+b7fZuuWlVKtZu1rjuGlDcrRzDinWOIgoWMA5Wj
 BjA/4lR6aUUN4OyCAwPXkzDxTN3a2Q2m2k5Q1wNMeAa9JuH9RN0wdEAwdz/qZhjKuvPI
 3BU/3b5PpiRq+EPUwQ3qjVOGVG+kh3rXnC5BHkVFSwaAoihtAP+/XoV4p90kDDcSAdoh
 GEiA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1705308912;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=yHFJRaGiqBFJv2kzsrvLiyk/a/j3+Epn1Hl4IwAPpOQ=;
 b=eSo9RdXWhAdoaMENfvhNPTzvKpEwOCUl0YycnoU2xzRMAOQMB9qGX0yeiCQFmhzBUq
 wtqDF7H9q9nFpN3AhXoAtzXmn353mljOaUrGVy5EQHo30O7NtvmPjMuX37RJgZbC6sND
 fRtz6wn5n3MdFHaakYwZD88U4bjAkBC5emYMKMDFoqqzbgcrbDVGevUornxZP935h3Cu
 tv41U+52zsH5KQm3PgvBNVFAjwQ7rqiUTmOaI152R9JDBW8y9aOthnrXVhPSOrkEfVnn
 LjPFWcJGYSWQ9UEoWZWcV1FktKs5lSlXM1XvdZO0b1hLY5YrsGsr5UvkO108hZlxyai4
 634A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1705308912;
 s=strato-dkim-0003; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=yHFJRaGiqBFJv2kzsrvLiyk/a/j3+Epn1Hl4IwAPpOQ=;
 b=pFlSZHjwt8Te0l07++VZwoZT0mvrVr31djwxtUJKVo9l8cKGGgl9Ds9Oo6Q5eOqrsf
 5kYGQb7B3DxK7iUUj3Bw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj5Apz9PSN6LgsXcGZhzY="
Received: from smtpclient.apple by smtp.strato.de (RZmta 49.10.2 DYNA|AUTH)
 with ESMTPSA id dbe64400F8tBUDl
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1
 with 256 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Mon, 15 Jan 2024 09:55:11 +0100 (CET)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.300.61.1.2\))
Subject: Re: [PATCH RFC v2 04/11] ARM: dts: omap4: Add device tree entry for
 SGX GPU
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <vpcgccul53oibwoqb3barj3rjxoyskoldjyfvjdzmytic3tonm@wq4aqsenk7rp>
Date: Mon, 15 Jan 2024 09:55:00 +0100
Content-Transfer-Encoding: quoted-printable
Message-Id: <7BC64F03-A4DF-411F-9B6F-6BCA436D9B50@goldelico.com>
References: <20240108183302.255055-1-afd@ti.com>
 <20240108183302.255055-5-afd@ti.com>
 <122DC5ED-2AA7-46A0-845F-083922458385@goldelico.com>
 <vpcgccul53oibwoqb3barj3rjxoyskoldjyfvjdzmytic3tonm@wq4aqsenk7rp>
To: Maxime Ripard <mripard@kernel.org>
X-Mailer: Apple Mail (2.3774.300.61.1.2)
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
 Matt Coster <matt.coster@imgtec.com>, Rob Herring <robh+dt@kernel.org>,
 linux-omap@vger.kernel.org, Adam Ford <aford173@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Tero Kristo <kristo@kernel.org>,
 linux-kernel@vger.kernel.org, Andrew Davis <afd@ti.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

> Am 15.01.2024 um 09:25 schrieb Maxime Ripard <mripard@kernel.org>:
>=20
> Hi,
>=20
> On Fri, Jan 12, 2024 at 06:33:58PM +0100, H. Nikolaus Schaller wrote:
>>> Am 08.01.2024 um 19:32 schrieb Andrew Davis <afd@ti.com>:
>>>=20
>>> Add SGX GPU device entry to base OMAP4 dtsi file.
>>>=20
>>> Signed-off-by: Andrew Davis <afd@ti.com>
>>> ---
>>> arch/arm/boot/dts/ti/omap/omap4.dtsi | 9 +++++----
>>> 1 file changed, 5 insertions(+), 4 deletions(-)
>>>=20
>>> diff --git a/arch/arm/boot/dts/ti/omap/omap4.dtsi =
b/arch/arm/boot/dts/ti/omap/omap4.dtsi
>>> index 2bbff9032be3e..559b2bfe4ca7c 100644
>>> --- a/arch/arm/boot/dts/ti/omap/omap4.dtsi
>>> +++ b/arch/arm/boot/dts/ti/omap/omap4.dtsi
>>> @@ -501,10 +501,11 @@ sgx_module: target-module@56000000 {
>>> #size-cells =3D <1>;
>>> ranges =3D <0 0x56000000 0x2000000>;
>>>=20
>>> - /*
>>> - * Closed source PowerVR driver, no child device
>>> - * binding or driver in mainline
>>> - */
>>> + gpu@0 {
>>=20
>> I wonder why we don't add a "gpu:" label here.
>>=20
>> Almost all other subsystem nodes have one (e.g. emif:, aes:, dss:, =
dsi:, hdmi:, etc.),
>> obviously for convenience when using a .dtsi file.
>>=20
>> It would allow a board-specific DTS to easily add status =3D =
"disabled" to avoid driver
>> probing or disabling the GPU (e.g. if there is no display).
>=20
> There's no reason to disable it in the DT: the hardware block would
> still be there and it's rendering to memory so it still could be =
useful.

Well, if you know that the board does not have a dm3730 but a dm3725 =
without
GPU it is better to disable the GPU completely instead of loading the =
driver
and make it detect by some internal bits that it has no GPU on the SoC.

> If there's no display on the board and you really don't want the GPU
> driver, then you can disable the driver or block the module loading, =
but
> it should be a distro / package / user decision, not a DT / kernel one
> still.

The same holds for aes: dss: dsi: hdmi: etc. If they are not used by =
some
board file, they don't change a single bit of the DTB [1] which IMHO =
would
be of reasonable concern to question additional labels.

BR and thanks,
Nikolaus

[1] =
https://devicetree-specification.readthedocs.io/en/stable/source-language.=
html
"Labels are only used in the devicetree source format and are not =
encoded into the
DTB binary."

