Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 874ED81BAC6
	for <lists+dri-devel@lfdr.de>; Thu, 21 Dec 2023 16:29:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08FD710E345;
	Thu, 21 Dec 2023 15:29:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 319 seconds by postgrey-1.36 at gabe;
 Thu, 21 Dec 2023 15:29:55 UTC
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de
 [85.215.255.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DB6F10E345
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Dec 2023 15:29:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1703172232; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=UwUq/YQX2zRCRkfeyBlXslp0UWcH60extncrAjK6TFBnwi3nkGDhK7z7n4fs/T+/S2
 A9hP3ZMOlc3HyO43nWI4FkajiLPRoVqdu3Bgv+Tq/2v0oqNYh3D7xhVqJs2Gwt9jXTLS
 uLYEJeL1Mxgnhf+KDAzWJaZB+hZq03wsgE0/ZB+qKnC44dZLziJANpDQIfHm8OXLr5cv
 5sDVOFwmSO/tzMtzwJq1ATYGsYVocIV5FIPunxob5oKfBA6O/pRA956O070QgybZESL4
 2xgJfnImKuLUm5n+liNHrbhrydrnlCIVKut35ON2oCGgm7i2CIibdxLLj4msQj9c02GB
 R0lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1703172232;
 s=strato-dkim-0002; d=strato.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=IlLQWtO5L6QKmPmiq2x6VX4CBIJlI6GOZ++GNJegOGk=;
 b=pxpT2VbelrAIZDkXj9IZhQXR9SfF3KLzBbr6KVGO6OCrcKuByoIek76R7a9HocWSRY
 4jU7M2owiVka7Db3TV1j8YGA55CIydyCi9g3ZbIiaivJmAcmG6uzXdy0ea6KAA124um+
 aeJBNpe8KGJ0JilGgs332uGi6bFOQn2CYD6KI0k162NCKyICkskKKfvglcqduswjI+U+
 7qRI36HuUoiUspzYHqdZKuPz2IcXNhQgT1vUWkCabCnE1uKkKAhbRDblwQsR9cdzabjh
 PO5uZOLxdRWtK9qqRquggg8UKmwjCFJY+3iAH9dPSQ0lygp9gVfQrGTTBhj6Iv5qP5iM
 7szg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1703172232;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=IlLQWtO5L6QKmPmiq2x6VX4CBIJlI6GOZ++GNJegOGk=;
 b=UA7Q0CO0/L9rhAgeD5fPYyWE1i6CylAFokMLXBp/QAHRWSlzucUgdV0Js+Kj9kHU1j
 KEHc7Vow77+V4YZQAqaNDN1oaMXGS4Bcu8WaSQK98VHeR/pNELscmY1tQG5jW0DOEXdU
 9cbFsDGfhg/JHMr/5C7I6lBjLK8Lh/gdZXAWPbukVgsd9c56f7CXW4Z7DIKORqELfXkC
 83x+KzwuBM+bC6Y9rMhrXSYqaVJDqLrro0PCf1gUlRy48qJvDH4YXy0lg+KPdyIJdDCU
 aq2LH9NLj26sB6QJrYzXuN89rrGBsL9D2gWkDXqyjN5lJt2d61gK9eJ15LpdGZXNk6yn
 toBA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1703172232;
 s=strato-dkim-0003; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=IlLQWtO5L6QKmPmiq2x6VX4CBIJlI6GOZ++GNJegOGk=;
 b=SZJRLTbwvTIaw2c1/vOtdG1/jR1e72SIo6ZjDY5ScOp5xW1MMGbn1zATNGB9p9WqS8
 oNccSextnPwLlTzlxTAw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBp5hRw/qviAxtjc3yiuvr5qbMskH1rzDt9Ntflha3riRgdpClD1qY="
Received: from smtpclient.apple by smtp.strato.de (RZmta 49.10.0 AUTH)
 with ESMTPSA id wfeb35zBLFNoFFz
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1
 with 256 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Thu, 21 Dec 2023 16:23:50 +0100 (CET)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.300.61.1.2\))
Subject: Re: [PATCH RFC 01/10] dt-bindings: gpu: Add PowerVR Series5 SGX GPUs
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <nzqeqwof44e3nxjz6lsxmxcfh235unbu343br45esxh6vinskp@xvjydpxhvsuk>
Date: Thu, 21 Dec 2023 16:23:39 +0100
Content-Transfer-Encoding: quoted-printable
Message-Id: <F2D7693E-7769-463A-97A8-BA952EB5320B@goldelico.com>
References: <23livt5mcc64bb6lkeec2uxp5cyn4wfekwaj6wzrjnrkndvwgj@6tveqglqpr4v>
 <B3A1B8A7-0363-4ECB-AFBF-576FECA569FA@goldelico.com>
 <vawv2mwhonuyvgmp7uox4rfgdcjwg5fa7hmbcfgl3wiase6e4p@tyavpclppfvu>
 <6BC60156-89E2-4734-BD00-B49A9A6C1D7A@goldelico.com>
 <6gpehpoz54f5lxhmvirqbfwmq7dpgiroy27cljpvu66wtn7aqy@lgrh7wysyxnp>
 <D8AB6CC4-DCA5-40DD-A311-94A16FF59254@goldelico.com>
 <oobcl2kfsuph27er7rflfqvt3lu6athufomxv5chf3uctx4emh@x6rzjtlskhbf>
 <F58855EC-D87D-4747-A363-0E7AA5DB1AEC@goldelico.com>
 <22cny5aumc5wafsrjd3j55zcjbjf2viip64kfbjiqis2grtd6t@wg5dxeuzil6l>
 <3E03E913-48E1-49EC-A6C9-EAC1612E65E7@goldelico.com>
 <nzqeqwof44e3nxjz6lsxmxcfh235unbu343br45esxh6vinskp@xvjydpxhvsuk>
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


> Am 21.12.2023 um 09:58 schrieb Maxime Ripard <mripard@kernel.org>:
>=20
> Cool, so what you're saying is that your plan is to support those GPUs
> upstream in the imagination driver?

Yes, I would like to see PowerVR Series 5 SGX supported upstream since =
there
are still so many devices in the wild which could use it. The most =
advanced
being the Pyra handheld gaming computer but there are omap4 based phones
or other omap3/amm335x based devices.

And the only reason the OpenPVRSGX group was founded (BTW not by me, I =
am just
maintaining the code and running a mailing list because it was rejected =
to host
it on vger.kernel.org), was to make that happen.

=46rom the GitHub description:
	This is about shaping existing GPL Linux kernel drivers for the =
PVR/SGX5
	architecture so that they can become accepted into =
drivers/staging

But nobody can currently tell if it can be integrated with the recently =
upstreamed
Rogue driver (I wouldn't call that *the* imagination driver) or if it =
better stays
a separate driver because the first would need touching closed =
user-space code
and GPU firmware.

And nobody knows who is capable and willing to work on it. It depends on =
access to
(confidential) documentation and available time to make such a big task =
a rewarding
project. And discussions like this one are not at all encouraging to =
even try.

>> Now, IMHO all the pros and cons are on the table and the question is
>> who makes a decision how to go.
>=20
> You haven't listed any pro so far, you're claiming that the one I =
raise
> are irrelevant.

I have listed some "pros" for "single file" but you apparently don't see
them as such. I can't change that. The main argument is that a single =
file is
simpler than two files duplicating parts, which are apparently the same
(integration of PVR architectures into SoC doesn't differ very much: =
shared
register block, DMA memory, clocks, resets etc.).
Yours is that two files duplicating such common things is "more =
convenient".
I just wonder for whom.

But it seems as if the IMHO second best solution has already been =
chosen.
So let it be.

>> Then the currently-out-of-tree driver for the sgx5 can be reworked in
>> less than half an hour without loosing functionality.
>=20
> Again, you're making it harder than it needs to be for no particular
> reason other than the potential file name clash that can be addressed.

What I want to avoid is a situation that upstream activities do not take =
the
existing and working out-of-tree SGX driver into account and make =
porting
(not even speaking of upstreaming) that driver more difficult than =
necessary
and force device tree files to contain redundant information nobody will =
need
and use. You can of course ignore experience and suggestions of people
who have worked on an SGX driver for a while. But that is the reason why =
I
participate in this discussion and raise my voice.

Now, I am looking forward to a v2 of this patch.

BR,
Nikolaus


