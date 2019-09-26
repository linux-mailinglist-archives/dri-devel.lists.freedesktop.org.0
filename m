Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E95C002C
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2019 09:41:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EDFF6EE8B;
	Fri, 27 Sep 2019 07:41:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12DC26ECF9;
 Thu, 26 Sep 2019 10:44:58 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 4D89AAFA7;
 Thu, 26 Sep 2019 10:44:56 +0000 (UTC)
Message-ID: <307b988d0c67fb1c42166eca12742bcfda09d92d.camel@suse.de>
Subject: Re: [PATCH 00/11] of: Fix DMA configuration for non-DT masters
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: Rob Herring <robh+dt@kernel.org>, Robin Murphy <robin.murphy@arm.com>
Date: Thu, 26 Sep 2019 12:44:53 +0200
In-Reply-To: <CAL_JsqKKYcHPnA80ZwLY=Sk3e5MqrimedUhWQ5+iuPZXQxYHdA@mail.gmail.com>
References: <20190924181244.7159-1-nsaenzjulienne@suse.de>
 <CAL_Jsq+v+svTyna7UzQdRVqfNc5Z_bgWzxNRXv7-Wqv3NwDu2g@mail.gmail.com>
 <d1a31a2ec8eb2f226b1fb41f6c24ffb47c3bf7c7.camel@suse.de>
 <e404c65b-5a66-6f91-5b38-8bf89a7697b2@arm.com>
 <43fb5fe1de317d65a4edf592f88ea150c6e3b8cc.camel@suse.de>
 <CAL_JsqLhx500cx3YLoC7HL1ux3bBpV+fEA2Qnk7D5RFGgiGzSw@mail.gmail.com>
 <aa4c8d62-7990-e385-2bb1-cec55148f0a8@arm.com>
 <CAL_JsqKKYcHPnA80ZwLY=Sk3e5MqrimedUhWQ5+iuPZXQxYHdA@mail.gmail.com>
User-Agent: Evolution 3.32.4 
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 27 Sep 2019 07:40:57 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: devicetree@vger.kernel.org, Matthias Brugger <mbrugger@suse.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, etnaviv@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
 Stefan Wahren <wahrenst@gmx.net>, james.quinlan@broadcom.com,
 linux-pci@vger.kernel.org, "open
 list:DMA GENERIC OFFLOAD ENGINE SUBSYSTEM" <dmaengine@vger.kernel.org>,
 xen-devel@lists.xenproject.org, Dan Williams <dan.j.williams@intel.com>,
 freedreno <freedreno@lists.freedesktop.org>,
 Frank Rowand <frowand.list@gmail.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: multipart/mixed; boundary="===============1818402638=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1818402638==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-spHfnjbbIi+e7UZn+wYh"


--=-spHfnjbbIi+e7UZn+wYh
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> > > > Robin, have you looked into supporting multiple dma-ranges? It's th=
e
> > > > next thing
> > > > we need for BCM STB's PCIe. I'll have a go at it myself if nothing =
is in
> > > > the
> > > > works already.
> > >=20
> > > Multiple dma-ranges as far as configuring inbound windows should work
> > > already other than the bug when there's any parent translation. But i=
f
> > > you mean supporting multiple DMA offsets and masks per device in the
> > > DMA API, there's nothing in the works yet.

Sorry, I meant supporting multiple DMA offsets[1]. I think I could still ma=
ke
it with a single DMA mask though.

> > There's also the in-between step of making of_dma_get_range() return a
> > size based on all the dma-ranges entries rather than only the first one
> > - otherwise, something like [1] can lead to pretty unworkable default
> > masks. We implemented that when doing acpi_dma_get_range(), it's just
> > that the OF counterpart never caught up.
>=20
> Right. I suppose we assume any holes in the ranges are addressable by
> the device but won't get used for other reasons (such as no memory
> there). However, to be correct, the range of the dma offset plus mask
> would need to be within the min start and max end addresses. IOW,
> while we need to round up (0xa_8000_0000 - 0x2c1c_0000) to the next
> power of 2, the 'correct' thing to do is round down.

IIUC I also have this issue on my list. The RPi4 PCIe block has an integrat=
ion
bug that only allows DMA to the lower 3GB. With dma-ranges of size 0xc000_0=
000
you get a 32bit DMA mask wich is not what you need. So far I faked it in th=
e
device-tree but I guess it be better to add an extra check in
of_dma_configure(), decrease the mask and print some kind of warning statin=
g
that DMA addressing is suboptimal.

Regards,
Nicolas

[1] https://lkml.org/lkml/2018/9/19/641


--=-spHfnjbbIi+e7UZn+wYh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl2MlqUACgkQlfZmHno8
x/6+gwgAlzKCB9vN8cCZUfRnnPT+EcYA2/s3oFjf1ar+/e5UsMfCNI5W7cJaKzg9
w0PGZ5VKk5N0wpkGIpUjOYQ9J5PFZwu5bqsce0zWywlRlYCexKvzpQfkplWi0JuI
cVAt9Sw5mle+ppW+x9T5UlBcHoCByuQDG9ga44Z7O4jrk/lIp7vK2fmSN3hIEcHV
gUPxojWighnxCu+5COgwa182Ncfo3tTLw39oV8uiLOzxXxVkprxdxQHakXPoyg1o
WH0OvR09u1lXZAQ1qKtOxHNgKcrNzpr69VBUL/WYvrSqKdg0EI8QRmkByk5cYgrC
ztco//83y3fCRh8dEph0BSrKU3/vFA==
=P2KB
-----END PGP SIGNATURE-----

--=-spHfnjbbIi+e7UZn+wYh--


--===============1818402638==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1818402638==--

