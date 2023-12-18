Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ECF9817A35
	for <lists+dri-devel@lfdr.de>; Mon, 18 Dec 2023 19:57:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33C9110E369;
	Mon, 18 Dec 2023 18:57:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de
 [81.169.146.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1AB210E1E5
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Dec 2023 18:55:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1702896901; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=C+GcctB2GqhE5bop8Aj9RGm+kcjJWxVV/3heaXkTv9vhTX7eyAZlOcaqHGA2PXXyyC
 lncH83/+HUJhRoraNL5YjtAQ8VBop+EUAqtfc2t67jwP3g0W914C4oK3X7V+5WO09hta
 LQ4GLgh5QUS2ZhiRMpIHKX2KLiT9ykHpUUMikDC5Meqe2ApH+Eg73YlJW/vPsLdjLfsf
 Gop5pGEWaRtX/tTXiRTC1HlrUE5g3saGPjWEDOIxYTf53qWf5Q7gkLEgx6dUD9XwSVs7
 J561q2I2vony5qF9aUCiRO4YKqTKK+ZuL/Gs3BzVFR2dCPGfggC8HNtqW5kPtrp1JMy6
 c6lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1702896901;
 s=strato-dkim-0002; d=strato.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=U0UapUlvZAiZ2vADG8RSbN1Y4V7bjNd3k9xavKTkZ5s=;
 b=SqXimfrdqSbDrbIcTsW9GvZlZ4BKJ8VOGJXQ9zoEtMDpW2sYYZYxERuqMSj7GZyHtM
 wq8lhT9DPu3BP3WeEdSBxnWfakbXMv4aSHL5mOvaHT4Fxdo+pAhx68u6HMT3p1BhCj1g
 dq48iPBC1YQb2OlRfk+4yRqIbUJQQFlcf5bro+3jRWu04J2ADoWeGJqnkkkUa0Vk3SzV
 3x23HKoW6FK4/p1k6VUfof+DiyBR9TQk/jZjNR5CKOZnNh/iHMMem+UglLcGwWoniP7m
 /shsqGAdI4YsbUtAEWiB4Muo2s/5WC3ZZRh5udrpvJTLx4nTvSHcdYd5bDX/v+0MpQNW
 d1Jw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1702896901;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=U0UapUlvZAiZ2vADG8RSbN1Y4V7bjNd3k9xavKTkZ5s=;
 b=tkTaI0OhlJnGUpdWsmYDXz3rc4fbPUDshnl007mxxpaFyOcDPo4Jjm8icZ07wJ1duH
 331yCr6XMhsFtR7JeCGIu8PNznLr3nUVBLprXLQpsJkq6IsSGeQ1LLGcX9OA3KqQMxTo
 QPMhDPvsB8QctNdfPlELTimAW/GriyrBhT86vhk1VPk9HLM0IrnMpd1o63J5byOiK9iM
 B3tI2jAMJFnwHmFp6eN9cGXuLDmAp3lO1B5bo3huqZLsizXqPxje8zyvhvxGgwdRjpDb
 8pPbfMda7f34XKf6r3Kv4emZyi4Bv+Ac1i+TXvIUeLv4i+vYDndrd61Jl4i8DbsCaMCW
 UQcQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1702896901;
 s=strato-dkim-0003; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=U0UapUlvZAiZ2vADG8RSbN1Y4V7bjNd3k9xavKTkZ5s=;
 b=fEGF1X4Qn4cXKR2AN33frlccmWNT6IjflrJ4mcAVngWY8hfloycKBf45tTF+K8JX8a
 skRkNOcU6ku1DV0LdhCQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj5Apz9PSN6LgsXcGZiDY="
Received: from smtpclient.apple by smtp.strato.de (RZmta 49.10.0 DYNA|AUTH)
 with ESMTPSA id wfeb35zBIAswzma
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1
 with 256 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Mon, 18 Dec 2023 11:54:58 +0100 (CET)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.300.61.1.2\))
Subject: Re: [PATCH RFC 01/10] dt-bindings: gpu: Add PowerVR Series5 SGX GPUs
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <22cny5aumc5wafsrjd3j55zcjbjf2viip64kfbjiqis2grtd6t@wg5dxeuzil6l>
Date: Mon, 18 Dec 2023 11:54:47 +0100
Content-Transfer-Encoding: quoted-printable
Message-Id: <3E03E913-48E1-49EC-A6C9-EAC1612E65E7@goldelico.com>
References: <20231204182245.33683-1-afd@ti.com>
 <20231204182245.33683-2-afd@ti.com>
 <23livt5mcc64bb6lkeec2uxp5cyn4wfekwaj6wzrjnrkndvwgj@6tveqglqpr4v>
 <B3A1B8A7-0363-4ECB-AFBF-576FECA569FA@goldelico.com>
 <vawv2mwhonuyvgmp7uox4rfgdcjwg5fa7hmbcfgl3wiase6e4p@tyavpclppfvu>
 <6BC60156-89E2-4734-BD00-B49A9A6C1D7A@goldelico.com>
 <6gpehpoz54f5lxhmvirqbfwmq7dpgiroy27cljpvu66wtn7aqy@lgrh7wysyxnp>
 <D8AB6CC4-DCA5-40DD-A311-94A16FF59254@goldelico.com>
 <oobcl2kfsuph27er7rflfqvt3lu6athufomxv5chf3uctx4emh@x6rzjtlskhbf>
 <F58855EC-D87D-4747-A363-0E7AA5DB1AEC@goldelico.com>
 <22cny5aumc5wafsrjd3j55zcjbjf2viip64kfbjiqis2grtd6t@wg5dxeuzil6l>
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



> Am 18.12.2023 um 11:14 schrieb Maxime Ripard <mripard@kernel.org>:
>=20
> On Mon, Dec 18, 2023 at 10:28:09AM +0100, H. Nikolaus Schaller wrote:
>> Hi Maxime,
>>=20
>>> Am 15.12.2023 um 14:33 schrieb Maxime Ripard <mripard@kernel.org>:
>>>=20
>>>>>=20
>>>>> It's for a separate architecture, with a separate driver, =
maintained out
>>>>> of tree by a separate community, with a separate set of =
requirements as
>>>>> evidenced by the other thread. And that's all fine in itself, but
>>>>> there's very little reason to put these two bindings in the same =
file.
>>>>>=20
>>>>> We could also turn this around, why is it important that it's in =
the
>>>>> same file?
>>>>=20
>>>> Same vendor. And enough similarity in architectures, even a logical =
sequence
>>>> of development of versions (SGX =3D Version 5, Rogue =3D Version =
6+) behind.
>>>> (SGX and Rogue seem to be just trade names for their architecture =
development).
>>>=20
>>> Again, none of that matters for *where* the binding is stored.
>>=20
>> So what then speaks against extending the existing bindings file as =
proposed
>> here?
>=20
> I mean, apart from everything you quoted, then sure, nothing speaks
> against it.
>=20
>>>> AFAIK bindings should describe hardware and not communities or =
drivers
>>>> or who is currently maintaining it. The latter can change, the =
first not.
>>>=20
>>> Bindings are supposed to describe hardware indeed. Nothing was ever =
said
>>> about where those bindings are supposed to be located.
>>>=20
>>> There's hundreds of other YAML bindings describing devices of the =
same
>>> vendors and different devices from the same generation.
>>=20
>> Usually SoC seem to be split over multiple files by subsystem. Not by =
versions
>> or generations. If the subsystems are similar enough they share the =
same bindings
>> doc instead of having one for each generation duplicating a lot of =
code.
>>=20
>> Here is a comparable example that combines multiple vendors and =
generations:
>>=20
>> Documentation/devicetree/bindings/usb/generic-ehci.yaml
>=20
> EHCI is a single interface for USB2.0 controllers. It's a standard =
API,
> and is made of a single driver that requires minor modifications to =
deal
> with multiple devices.
>=20
> We're very far from the same situation here.

How far are we really? And, it is the purpose of the driver to handle =
different cases.

That there are currently two drivers is just a matter of history and not =
a necessity.

>=20
>>> If anything it'll make it easier for you. I'm really not sure why it =
is
>>> controversial and you're fighting this so hard.
>>=20
>> Well, you made it controversial by proposing to split what IMHO =
belongs together.
>=20
> No, reviews aren't controversial.
> The controversy started when you chose
> to oppose it while you could have just rolled with it.

Well, you asked

"I think it would be best to have a separate file for this, img,sgx.yaml
maybe?"

and

"Because it's more convenient?"

I understood that as an invitation for discussing the pros and cons and =
working out the
most convenient solution. And that involves playing the devil's advocate =
which of course
is controversial by principle.

Now, IMHO all the pros and cons are on the table and the question is who =
makes a decision
how to go.

>=20
>> I feel that the original patch is good enough for its purpose and =
follows
>> some design pattern that can be deduced from other binding docs.
>=20
> [citation needed]

Joke: Documentation/devicetree/bindings/* - I am not aware of a formal =
analysis of course.

But see my example for ehci. It follows the pattern I mean. If clocks, =
regs, interrupts,
resets, and more properties are (almost) the same, then group them and =
just differentiate
by different compatible strings. If necessary use some - if: clauses.

It is the task of drivers to handle the details.

As my other (maybe more important) comment to this patch did indicate we =
IMHO can easily
live with something like

+      - items:
+          - enum:
+              - ti,am62-gpu # IMG AXE GPU model/revision is fully =
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

And leave it to drivers using a table to deduce the generation and
revision or read it out from the chip. And there can even be different
drivers handling only a subset of the potential compatibles.

Then the currently-out-of-tree driver for the sgx5 can be reworked in
less than half an hour without loosing functionality.

BR,
Nikolaus

