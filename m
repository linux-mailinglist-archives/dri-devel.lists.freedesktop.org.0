Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0273C871A78
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 11:17:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25DC31129CC;
	Tue,  5 Mar 2024 10:17:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=crapouillou.net header.i=@crapouillou.net header.b="gyHfXlzf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DF4E1129CC
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Mar 2024 10:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1709633814;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ScnhOlxqOqXKHeNtlmJscUOvM1RwyxtzC8+4oNY2t0M=;
 b=gyHfXlzfeV7oeX4Z0Gh6LxaNFE6QK96VFIzjigpmrrVZ7WqArbmszHgF9puU2wdmZD1ILM
 rYQBH3lbQw2dkIp7FMjvP1eioLsm5BRg6Zb/Zy0/Euz0MPS+CyWMCBgXiP71CGnzQA5tcg
 TxWouUfeF0fkyGktmza3jbeFN/872Kg=
Message-ID: <8d996c3d8238abf00882090caaa349bb5d3c26d3.camel@crapouillou.net>
Subject: Re: [PATCH v7 0/6] iio: new DMABUF based API
From: Paul Cercueil <paul@crapouillou.net>
To: Jonathan Cameron <Jonathan.Cameron@Huawei.com>, Nuno =?ISO-8859-1?Q?S=E1?=
 <noname.nuno@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Nuno Sa <nuno.sa@analog.com>, Vinod
 Koul <vkoul@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Sumit Semwal
 <sumit.semwal@linaro.org>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Jonathan Corbet <corbet@lwn.net>, Daniel Vetter
 <daniel@ffwll.ch>, Michael Hennerich <Michael.Hennerich@analog.com>, 
 linux-doc@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-iio@vger.kernel.org,  linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org,  linaro-mm-sig@lists.linaro.org
Date: Tue, 05 Mar 2024 11:16:52 +0100
In-Reply-To: <20240305100742.00006a4c@Huawei.com>
References: <20240223-iio-dmabuf-v7-0-78cfaad117b9@analog.com>
 <20240303174245.37efc0b0@jic23-huawei>
 <43787ce68f731b9267ee558c4c38d634acffe8b9.camel@gmail.com>
 <20240305100742.00006a4c@Huawei.com>
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

Hi Jonathan,

Le mardi 05 mars 2024 =C3=A0 10:07 +0000, Jonathan Cameron a =C3=A9crit=C2=
=A0:
> On Mon, 04 Mar 2024 08:59:47 +0100
> Nuno S=C3=A1 <noname.nuno@gmail.com> wrote:
>=20
> > On Sun, 2024-03-03 at 17:42 +0000, Jonathan Cameron wrote:
> > > On Fri, 23 Feb 2024 13:13:58 +0100
> > > Nuno Sa <nuno.sa@analog.com> wrote:
> > > =C2=A0=20
> > > > Hi Jonathan, likely you're wondering why I'm sending v7. Well,
> > > > to be
> > > > honest, we're hoping to get this merged this for the 6.9 merge
> > > > window.
> > > > Main reason is because the USB part is already in (so it would
> > > > be nice
> > > > to get the whole thing in). Moreover, the changes asked in v6
> > > > were simple
> > > > (even though I'm not quite sure in one of them) and Paul has no
> > > > access to
> > > > it's laptop so he can't send v7 himself. So he kind of
> > > > said/asked for me to
> > > > do it.=C2=A0=20
> > >=20
> > > So, we are cutting this very fine. If Linus hints strongly at an
> > > rc8 maybe we
> > > can sneak this in. However, I need an Ack from Vinod for the dma
> > > engine
> > > changes first.
> > >=20
> > > Also I'd love a final 'looks ok' comment from DMABUF folk (Ack
> > > even better!)
> > >=20
> > > Seems that the other side got resolved in the USB gadget, but
> > > last we heard
> > > form
> > > Daniel and Christian looks to have been back on v5. I'd like them
> > > to confirm
> > > they are fine with the changes made as a result.=20
> > > =C2=A0=20
> >=20
> > I can ask Christian or Daniel for some acks but my feeling (I still
> > need, at
> > some point, to get really familiar with all of this) is that this
> > should be
> > pretty similar to the USB series (from a DMABUF point of view) as
> > they are both
> > importers.
> >=20
> > > I've been happy with the IIO parts for a few versions now but my
> > > ability to
> > > review
> > > the DMABUF and DMA engine bits is limited.
> > >=20
> > > A realistic path to get this in is rc8 is happening, is all Acks
> > > in place by
> > > Wednesday,
> > > I get apply it and hits Linux-next Thursday, Pull request to Greg
> > > on Saturday
> > > and Greg
> > > is feeling particularly generous to take one on the day he
> > > normally closes his
> > > trees.
> > > =C2=A0=20
> >=20
> > Well, it looks like we still have a shot. I'll try to see if Vinod
> > is fine with
> > the DMAENGINE stuff.
> >=20
>=20
> Sadly, looks like rc7 was at the end of a quiet week, so almost
> certain to not
> be an rc8 in the end. Let's aim to get this in at the start of the
> next cycle
> so we can build on it from there.

And it looks like I'll need a V8 for the few things noted by Christian.

Having it in 6.9 would have been great but having it eventually merged
is all that matters - so I'm fine to have it queued for 6.10 instead.

Cheers,
-Paul
