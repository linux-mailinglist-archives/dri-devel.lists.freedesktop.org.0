Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F018179BE
	for <lists+dri-devel@lfdr.de>; Mon, 18 Dec 2023 19:32:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06BC610E379;
	Mon, 18 Dec 2023 18:32:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de
 [81.169.146.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C8CF10E212
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Dec 2023 18:28:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1702891704; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=By+hnXUCIQX9JhxpuW3LvhfsF4xy8OTbFb9Bl98uZVJHx3C0UY+tHaT7keSQ1fLsY9
 z2FFtbw9CssCE1tjcAEstOuefSJwc4n4xvDKqj6HEOMWNth+8gqhIJTtemOdLWTrDcY6
 skRt4USt+2B3E+TABNGroGRxphZBuoJ4kydDsS69URhDZ9xeIq0NSkH5qfHOtaqzlGWk
 JMrCG7hSLXF+ZtHDxE51BJgFpraOPGGNrX/67kw0/KvuJutZyAuLBTY5ZeifRkLX7tfz
 /8/TU3fpgaxw1b0d2qQ3qX7XCIRukfktkL3GhecXE03arQcxg84JBJQqp3/nsS6SMIGM
 Uyuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1702891704;
 s=strato-dkim-0002; d=strato.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=orHvPqOVlDDdrnR1UyOTGhHdEAgLbgHBy0kaLQRXrCQ=;
 b=MUtcPD7fdh8cIOjV5VrESwk933SQkgi3oWE8/jv7kD1l9RQmemNiwkFAJhlheg273u
 OWWrMdufc7MJ+I3W5CevGY0m4Q0Rvc5ZRAqdeTbcbPeJOV/w0dI/eAMHYam+Lfzvk4oH
 zkPiGHhyiB8VeaOOHyXWseJVK3q+08MiLV0sG9J+vkxaofx4n3/6rT17xjXvwBzJd402
 MKWerN7crrAhsVstCUoJoZSiTD3VQ704ie0EGsYc1+JArZ5lAjicYY/E3BtegdarPA2v
 2wnlcuMp0r0leDhE7ycx41iMrsz368ft758/n1miR/dyp+Wc2Xan4tnyAzZmdUlNbR+D
 RCSA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1702891704;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=orHvPqOVlDDdrnR1UyOTGhHdEAgLbgHBy0kaLQRXrCQ=;
 b=r4xAR7lzhoKpovVJf5Xcj7DgCdA3rFJmG1cha1iS4IKIuBuySU7g1Le5gJTrR12U0r
 lkfa71lfPFXm10mjFrkjv3LkCno9gQXoRipNOjQX7tPvSRonyDKR4mKIac4GCI+nKCTT
 lJZkOfsjqfGBMz44ig3TU6NfI2h/EAyE8oBa3OaLAIgLw12A6YA6n1NS2b7KHDBQQNJG
 zsKbelPOzNksy7Ve9kzjdLHB2sFyFI0GxilPXJoQKP74dyETDQuFZd0bp858CxH4cTtk
 hdZ3yWo8ajLByJbb5pD7oiMkkIvySSMBfW5gpA/+uSqJWu+Xz/RGb0SQnLDOPyFxG3Wn
 eouQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1702891704;
 s=strato-dkim-0003; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=orHvPqOVlDDdrnR1UyOTGhHdEAgLbgHBy0kaLQRXrCQ=;
 b=7DiPUNuLe7isGNv1dpEl4PT5KX7du/Q5X4P298gTmzsTpJEF0P2dPgyImNprmR3TtD
 pcoxrTYs2utVi1SmvBBg==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBp5hRw/qviAxtjc36ma4ajubELutJ4QmCt0zJkq3gnHsXTZTgRLw=="
Received: from smtpclient.apple by smtp.strato.de (RZmta 49.10.0 AUTH)
 with ESMTPSA id wfeb35zBI9SLzBK
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1
 with 256 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Mon, 18 Dec 2023 10:28:21 +0100 (CET)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.300.61.1.2\))
Subject: Re: [PATCH RFC 01/10] dt-bindings: gpu: Add PowerVR Series5 SGX GPUs
From: H. Nikolaus Schaller <hns@goldelico.com>
In-Reply-To: <oobcl2kfsuph27er7rflfqvt3lu6athufomxv5chf3uctx4emh@x6rzjtlskhbf>
Date: Mon, 18 Dec 2023 10:28:09 +0100
Content-Transfer-Encoding: quoted-printable
Message-Id: <F58855EC-D87D-4747-A363-0E7AA5DB1AEC@goldelico.com>
References: <20231204182245.33683-1-afd@ti.com>
 <20231204182245.33683-2-afd@ti.com>
 <23livt5mcc64bb6lkeec2uxp5cyn4wfekwaj6wzrjnrkndvwgj@6tveqglqpr4v>
 <B3A1B8A7-0363-4ECB-AFBF-576FECA569FA@goldelico.com>
 <vawv2mwhonuyvgmp7uox4rfgdcjwg5fa7hmbcfgl3wiase6e4p@tyavpclppfvu>
 <6BC60156-89E2-4734-BD00-B49A9A6C1D7A@goldelico.com>
 <6gpehpoz54f5lxhmvirqbfwmq7dpgiroy27cljpvu66wtn7aqy@lgrh7wysyxnp>
 <D8AB6CC4-DCA5-40DD-A311-94A16FF59254@goldelico.com>
 <oobcl2kfsuph27er7rflfqvt3lu6athufomxv5chf3uctx4emh@x6rzjtlskhbf>
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

Hi Maxime,

> Am 15.12.2023 um 14:33 schrieb Maxime Ripard <mripard@kernel.org>:
>=20
>>>=20
>>> It's for a separate architecture, with a separate driver, maintained =
out
>>> of tree by a separate community, with a separate set of requirements =
as
>>> evidenced by the other thread. And that's all fine in itself, but
>>> there's very little reason to put these two bindings in the same =
file.
>>>=20
>>> We could also turn this around, why is it important that it's in the
>>> same file?
>>=20
>> Same vendor. And enough similarity in architectures, even a logical =
sequence
>> of development of versions (SGX =3D Version 5, Rogue =3D Version 6+) =
behind.
>> (SGX and Rogue seem to be just trade names for their architecture =
development).
>=20
> Again, none of that matters for *where* the binding is stored.

So what then speaks against extending the existing bindings file as =
proposed
here?

>=20
>> AFAIK bindings should describe hardware and not communities or =
drivers
>> or who is currently maintaining it. The latter can change, the first =
not.
>=20
> Bindings are supposed to describe hardware indeed. Nothing was ever =
said
> about where those bindings are supposed to be located.
>=20
> There's hundreds of other YAML bindings describing devices of the same
> vendors and different devices from the same generation.

Usually SoC seem to be split over multiple files by subsystem. Not by =
versions
or generations. If the subsystems are similar enough they share the same =
bindings
doc instead of having one for each generation duplicating a lot of code.

Here is a comparable example that combines multiple vendors and =
generations:

Documentation/devicetree/bindings/usb/generic-ehci.yaml

> If anything it'll make it easier for you. I'm really not sure why it =
is
> controversial and you're fighting this so hard.

Well, you made it controversial by proposing to split what IMHO belongs =
together.

I feel that the original patch is good enough for its purpose and =
follows
some design pattern that can be deduced from other binding docs.

BR,
Nikolaus

