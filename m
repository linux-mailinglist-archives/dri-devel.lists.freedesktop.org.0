Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E84801D6022
	for <lists+dri-devel@lfdr.de>; Sat, 16 May 2020 11:59:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 289426E10E;
	Sat, 16 May 2020 09:59:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p02-ob.smtp.rzone.de (mo6-p02-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5302::6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB56F6EBF3
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 07:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1589527160;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=/LlQLnJSjr1dPjlAnAK+u/lQG0tGroGOnAwr3HRIIDg=;
 b=ImXPM6p58hj5fez+XLXj3HpuRr8N7veiYjsKl8e2UZFB3vqZHyKMWtiXRwJyMV7GDd
 cWauAIzgL/FxofJUMJq5Io7x4KsHqSz6BBMGu5Mu0RDbRZ2Q1RoSHSTtys7nW0GCeVt1
 40WYOpkAEm32n2YDlbWj5/qU7mycwz0M0JVtRxqTNEq9LkZdLSLGifGA8jE7+xWtSxG5
 zfJU24N3Vhz/o6iC1TtdDEBJUBl992bjJcbyrWYBpWB2IMx1r252Wy5ejDrp9RiAno17
 ct9sO2tbK5C2KSY1YJTK97/WpHQpUzhNWokBbyOtakW3n3njN53WJpqEeNxzsLHxzRY4
 67sw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7wpz8NMGH/vtwDOvBTU="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box by smtp.strato.de (RZmta 46.6.2 DYNA|AUTH)
 with ESMTPSA id R0acebw4F7IYYRg
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256
 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Fri, 15 May 2020 09:18:34 +0200 (CEST)
Subject: Re: [PATCH v7 01/12] dt-bindings: add img,
 pvrsgx.yaml for Imagination GPUs
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <08B861A8-D4C2-48A6-9B05-B8CA43312834@goldelico.com>
Date: Fri, 15 May 2020 09:18:33 +0200
Message-Id: <D1D14684-2532-46A4-ADA0-2F88F4D2228E@goldelico.com>
References: <cover.1587760454.git.hns@goldelico.com>
 <3a451e360fed84bc40287678b4d6be13821cfbc0.1587760454.git.hns@goldelico.com>
 <NMCE9Q.LWG45P20NBVJ@crapouillou.net>
 <28138EC0-0FA5-4F97-B528-3442BF087C7A@goldelico.com>
 <TEAR9Q.6HI5DFRO5U0I3@crapouillou.net>
 <3D8B59D6-83E3-4FE6-9C99-E2E5616A8139@goldelico.com>
 <8EER9Q.C206SXNSICP7@crapouillou.net>
 <08B861A8-D4C2-48A6-9B05-B8CA43312834@goldelico.com>
To: Paul Cercueil <paul@crapouillou.net>, Paul Burton <paulburton@kernel.org>
X-Mailer: Apple Mail (2.3124)
X-Mailman-Approved-At: Sat, 16 May 2020 09:58:59 +0000
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
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 linux-mips@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Tony Lindgren <tony@atomide.com>,
 Chen-Yu Tsai <wens@csie.org>, Kukjin Kim <kgene@kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 =?iso-8859-1?Q?Beno=EEt_Cousson?= <bcousson@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, linux-omap <linux-omap@vger.kernel.org>,
 arm-soc <linux-arm-kernel@lists.infradead.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Philipp Rossak <embed3d@gmail.com>,
 OpenPVRSGX Linux Driver Group <openpvrsgx-devgroup@letux.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Ralf Baechle <ralf@linux-mips.org>, kernel@pyra-handheld.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Paul & Paul,

> Am 03.05.2020 um 18:41 schrieb H. Nikolaus Schaller <hns@goldelico.com>:
> =

> Hi Paul and Paul,
> =

>> Am 03.05.2020 um 16:18 schrieb Paul Cercueil <paul@crapouillou.net>:
>> =

>> =

>> =

>> Le dim. 3 mai 2020 =E0 15:31, H. Nikolaus Schaller <hns@goldelico.com> a=
 =E9crit :
>>> Hi Paul,
>>>> Am 03.05.2020 um 14:52 schrieb Paul Cercueil <paul@crapouillou.net>:
>>>>>> It's possible to forbid the presence of the 'clocks' property on som=
e implementations, and require it on others.
>>>>> To be precise we have to specify the exact number of clocks (between =
0 and 4) for every architecture.
>>>>> This also contradicts my dream to get rid of the architecture specifi=
c components in the long run. My dream (because I can't tell how it can be =
done) is that we can one day develop something which just needs compatible =
=3D img,530 or imp,540 or img,544. Then we can't make the number clocks dep=
end on the implementation any more.
>>>> As we said before, the number of clocks is a property of the GPU and *=
not* its integration into the SoC.
>>> Well, it is a not very well documented property of the GPU. We have no =
data sheet of the standalone GPU. Only several SoC data sheets which give s=
ome indications.
>> =

>> Maybe we can nicely ask them?
> =

> There is some (old) answer here:
> =

> https://github.com/MIPS/CI20_linux/blob/ci20-v3.18/arch/mips/boot/dts/jz4=
780.dtsi#L63
> =

>> I expect Paul Burton to have some contacts at ImgTec. Asking for a doc w=
ould be too much, but maybe they can help a bit with the DT bindings.
> =

> Good idea! It is definitively worth to try. Therefore I have moved him fr=
om CC: to To:

Do we already have an idea if we can get into contact and get help from Img=
Tec for this topic or if we have to live with what we have?

BR and thanks,
Nikolaus

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
