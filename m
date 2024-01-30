Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1F6842004
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jan 2024 10:48:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A57C10E466;
	Tue, 30 Jan 2024 09:48:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C4AC112EA3
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jan 2024 09:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1706608105;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=fzKqsStcb36iopomlKgRGs7SQG0sReHnAQLYp7HEgu0=;
 b=GaMkHCkutXjW0L4/XyIxRz73MLclQ9Ia3j5M6z+wdTwSCEYHwYtDikGSv2r4x81YUBlihy
 QNgViGuhWALFT+qoow9WmzoaLW6sGAyeHKwWZOXHki0Imxc1Be5O6lJMrdpERSf/Ek21hg
 BCU+bC9oV4o447lijAoa0537XEiQazA=
Message-ID: <7eec45a95808afe94ac65a8518df853356ecf117.camel@crapouillou.net>
Subject: Re: [Linaro-mm-sig] Re: [PATCH v5 1/6] dma-buf: Add
 dma_buf_{begin,end}_access()
From: Paul Cercueil <paul@crapouillou.net>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, 
 Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Jonathan Corbet
 <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>, Jonathan Cameron
 <jic23@kernel.org>, Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 linux-usb@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, Christoph
 Hellwig <hch@lst.de>
Date: Tue, 30 Jan 2024 10:48:23 +0100
In-Reply-To: <a2346244-e22b-4ff6-b6cd-1da7138725ae@amd.com>
References: <442f69f31ece6d441f3dc41c3dfeb4dcf52c00b8.camel@crapouillou.net>
 <0b6b8738-9ea3-44fa-a624-9297bd55778f@amd.com>
 <e4620acdf24628d904cedcb0030d78b14559f337.camel@crapouillou.net>
 <85a89505-edeb-4619-86c1-157f7abdd190@amd.com>
 <0fe2755fb320027234c086bcc88fd107855234c5.camel@crapouillou.net>
 <577501f9-9d1c-4f8d-9882-7c71090e5ef3@amd.com>
 <7928c0866ac5b2bfaaa56ad3422bedc9061e0f7b.camel@crapouillou.net>
 <2ac7562c-d221-409a-bfee-1b3cfcc0f1c6@amd.com>
 <ZbKiCPhRvWaz4Icn@phenom.ffwll.local>
 <c97e38ee-b860-4990-87f1-3e59d7d9c999@amd.com>
 <Zbi6zQYtnfOZu5Wh@phenom.ffwll.local>
 <a2346244-e22b-4ff6-b6cd-1da7138725ae@amd.com>
Autocrypt: addr=paul@crapouillou.net; prefer-encrypt=mutual;
 keydata=mQENBF0KhcEBCADkfmrzdTOp/gFOMQX0QwKE2WgeCJiHPWkpEuPH81/HB2dpjPZNW03ZMLQfECbbaEkdbN4YnPfXgcc1uBe5mwOAPV1MBlaZcEt4M67iYQwSNrP7maPS3IaQJ18ES8JJ5Uf5UzFZaUawgH+oipYGW+v31cX6L3k+dGsPRM0Pyo0sQt52fsopNPZ9iag0iY7dGNuKenaEqkYNjwEgTtNz8dt6s3hMpHIKZFL3OhAGi88wF/21isv0zkF4J0wlf9gYUTEEY3Eulx80PTVqGIcHZzfavlWIdzhe+rxHTDGVwseR2Y1WjgFGQ2F+vXetAB8NEeygXee+i9nY5qt9c07m8mzjABEBAAG0JFBhdWwgQ2VyY3VlaWwgPHBhdWxAY3JhcG91aWxsb3UubmV0PokBTgQTAQoAOBYhBNdHYd8OeCBwpMuVxnPua9InSr1BBQJdCoXBAhsDBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEHPua9InSr1BgvIH/0kLyrI3V0f33a6D3BJwc1grbygPVYGuC5l5eMnAI+rDmLR19E2yvibRpgUc87NmPEQPpbbtAZt8On/2WZoE5OIPdlId/AHNpdgAtGXo0ZX4LGeVPjxjdkbrKVHxbcdcnY+zzaFglpbVSvp76pxqgVg8PgxkAAeeJV+ET4t0823Gz2HzCL/6JZhvKAEtHVulOWoBh368SYdolp1TSfORWmHzvQiCCCA+j0cMkYVGzIQzEQhX7Urf9N/nhU5/SGLFEi9DcBfXoGzhyQyLXflhJtKm3XGB1K/pPulbKaPcKAl6rIDWPuFpHkSbmZ9r4KFlBwgAhlGy6nqP7O3u7q23hRW5AQ0EXQqFwQEIAMo+MgvYHsyjX3Ja4Oolg1Txzm8woj30ch2nACFCqaO0R/1kLj2VVeLrDyQUOlXx9PD6IQI4M8wy8m0sR4wV2p/g/paw7k65cjzYYLh+FdLNyO7IW
 YXndJO+wDPi3aK/YKUYepqlP+QsmaHNYNdXEQDRKqNfJg8t0f5rfzp9ryxd1tCnbV+tG8VHQWiZXNqN7062DygSNXFUfQ0vZ3J2D4oAcIAEXTymRQ2+hr3Hf7I61KMHWeSkCvCG2decTYsHlw5Erix/jYWqVOtX0roOOLqWkqpQQJWtU+biWrAksmFmCp5fXIg1Nlg39v21xCXBGxJkxyTYuhdWyu1yDQ+LSIUAEQEAAYkBNgQYAQoAIBYhBNdHYd8OeCBwpMuVxnPua9InSr1BBQJdCoXBAhsMAAoJEHPua9InSr1B4wsH/Az767YCT0FSsMNt1jkkdLCBi7nY0GTW+PLP1a4zvVqFMo/vD6uz1ZflVTUAEvcTi3VHYZrlgjcxmcGu239oruqUS8Qy/xgZBp9KF0NTWQSl1iBfVbIU5VV1vHS6r77W5x0qXgfvAUWOH4gmN3MnF01SH2zMcLiaUGF+mcwl15rHbjnT3Nu2399aSE6cep86igfCAyFUOXjYEGlJy+c6UyT+DUylpjQg0nl8MlZ/7Whg2fAU9+FALIbQYQzGlT4c71SibR9T741jnegHhlmV4WXXUD6roFt54t0MSAFSVxzG8mLcSjR2cLUJ3NIPXixYUSEn3tQhfZj07xIIjWxAYZo=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
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

Hi Christian,

(Your email software is configured for HTML btw)

Le mardi 30 janvier 2024 =C3=A0 10:23 +0100, Christian K=C3=B6nig a =C3=A9c=
rit=C2=A0:
> =C2=A0Am 30.01.24 um 10:01 schrieb Daniel Vetter:
> =C2=A0
> > =C2=A0
> > On Fri, Jan 26, 2024 at 05:42:50PM +0100, Christian K=C3=B6nig wrote:
> > =C2=A0
> > > [SNIP]=20
> > > Well I think we should have some solution, but I'm not sure if it
> > > should be
> > > part of DMA-buf.
> > >=20
> > > Essentially a DMA-buf exports the buffers as he uses it and the
> > > importer (or
> > > the DMA-buf subsystem) is then the one who says ok I can use this
> > > or I can't
> > > use this or I need to call extra functions to use this or
> > > whatever.
> > >=20
> > > It's not the job of the exporter to provide the coherency for the
> > > importer,
> > > cause otherwise we would have a lot of code in the exporter which
> > > can only
> > > be tested when you have the right importer around. And I strongly
> > > think that
> > > this is a no-go for having a reliable solution.
> > > =C2=A0
> > =C2=A0
> > The trouble is, that if you have other memory than stuff allocated
> > by the
> > dma-api or mapped using the dma-api, then by necessity the exporter
> > has to
> > deal with this.
> > =C2=A0
> =C2=A0
> =C2=A0Yes, I was thinking about that as well.
> =C2=A0
> =C2=A0
> > =C2=A0
> > Which is the exact same reason we also force the exporters to deal
> > with
> > the cpu cache flushing - you're argument that it's not great to
> > replicate
> > this everywhere holds there equally.
> > =C2=A0
> =C2=A0
> =C2=A0And I'm not really happy with that either.
> =C2=A0
> =C2=A0
> > =C2=A0
> > The other thing is that right now the exporter is the only one who
> > actually knows what kind of dma coherency rules apply for a certain
> > piece
> > of memory. E.g. on i915-gem even if it's dma_map_sg mapped the
> > underlying
> > i915-gem buffer might be non-coherent, and i915-gem makes it all
> > work by
> > doing the appropriate amount of clflush.
> > =C2=A0
> =C2=A0
> =C2=A0Yeah, exactly that's the reason why I think that this stuff doesn't
> belong into exporters/drivers.
> =C2=A0
> =C2=A0Looking at what kind of hacks and workarounds we have in both amdgp=
u
> as well as i915 it's pretty clear that we need to improve this design
> somehow.
> =C2=A0
> =C2=A0
> > =C2=A0
> > Similar funky things happen in other cases.
> >=20
> > So unless we add an interface which allows importers to figure out
> > how
> > much flushing is needed, currently the exporter is the only one who
> > knows
> > (because it can inspect the struct device at dma_buf_attach time).
> >=20
> > We could flip this around, but it would be a rather serious
> > depature from
> > the dma-buf design approach thus far.
> > =C2=A0
> =C2=A0
> =C2=A0Well clients already give the DMA-direction to exporters when
> creating the mapping and get an appropriate sg_table in return.
> =C2=A0
> =C2=A0All we need to do is getting the information what flushing is neede=
d
> into the object returned here so that the DMA API can work with it.
> =C2=A0
> =C2=A0Christoph Hellwig pretty much nailed it when he said that the
> problem with the sg_table is that it mixes input and output
> parameters of the DMA-API.
> =C2=A0
> =C2=A0I would extend that and say that we need a mapping object the DMA-
> API can work with so that it can know what needs to be done when
> devices request that data is made coherent between them or the CPU.
> =C2=A0
> =C2=A0
> > =C2=A0
> > > =C2=A0
> > > That's why I think the approach of having DMA-buf callbacks is
> > > most likely
> > > the wrong thing to do.
> > >=20
> > > What should happen instead is that the DMA subsystem provides
> > > functionality
> > > which to devices which don't support coherency through it's
> > > connection to
> > > say I want to access this data, please make sure to flush the
> > > appropriate
> > > catches. But that's just a very very rough design idea.
> > >=20
> > > This will become more with CXL at the horizon I think.
> > > =C2=A0
> > =C2=A0
> > Yeah CXL will make this all even more fun, but we are firmly there
> > already
> > with devices deciding per-buffer (or sometimes even per-access with
> > intel's MOCS stuff) what coherency mode to use for a buffer.
> >=20
> > Also arm soc generally have both coherent and non-coherent device
> > interconnects, and I think some devices can switch with runtime
> > flags too
> > which mode they use for a specific transition.
> >=20
> > CXL just extends this to pcie devices.
> >=20
> > So the mess is here, how do we deal with it?
> > =C2=A0
> =C2=A0
> =C2=A0I would say we start with the DMA-API by getting away from sg_table=
s
> to something cleaner and state oriented.=C2=A0

FYI I am already adding a 'dma_vec' object in my IIO DMABUF patchset,
which is just a dead simple

struct dma_vec {
  dma_addr_t addr;
  size_t len;
};

(The rationale for introducing it in the IIO DMABUF patchset was that
the "scatterlist" wouldn't allow me to change the transfer size.)

So I believe a new "sg_table"-like could just be an array of struct
dma_vec + flags.

Cheers,
-Paul

> > =C2=A0
> >=20
> > My take is that the opt-in callback addition is far from great, but
> > it's
> > in line with how we extended dma-buf the past decade plus too. So
> > unless
> > someone's volunteering to pour some serious time into re-
> > engineering this
> > all (including testing all the different device/driver<-
> > >device/driver
> > interactions) I think there's only really one other option: To not
> > support
> > these cases at all. And I don't really like that, because it means
> > people
> > will hack together something even worse in their drivers.
> >=20
> > By adding it to dma-buf it'll stare us in our faces at least :-/
> > =C2=A0
> =C2=A0
> =C2=A0Yeah, it's the way of the least resistance. But with CXL at the
> horizon and more and more drivers using it I think it's predictable
> that this will sooner or later blow up.
> =C2=A0
> =C2=A0Cheers,
> =C2=A0Christian.=20
> =C2=A0
> =C2=A0
> > =C2=A0
> >=20
> > Cheers, Sima
> >=20
> > =C2=A0
> > > =C2=A0
> > > Regards,
> > > Christian.
> > >=20
> > > =C2=A0
> > > > =C2=A0
> > > > Cheers, Sima
> > > > =C2=A0
> > > =C2=A0
> > > _______________________________________________
> > > Linaro-mm-sig mailing list -- linaro-mm-sig@lists.linaro.org
> > > To unsubscribe send an email to linaro-mm-sig-
> > > leave@lists.linaro.org
> > > =C2=A0
> > =C2=A0=C2=A0
> =C2=A0
> =C2=A0

