Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC517527AA
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 17:48:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D82410E700;
	Thu, 13 Jul 2023 15:48:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E37610E700
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 15:47:58 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 66270619DD;
 Thu, 13 Jul 2023 15:47:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41753C433C7;
 Thu, 13 Jul 2023 15:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689263277;
 bh=LO0iKhdNurylf5X40VnewLrFY6WuYlXABBgU473NB4Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dNhUEsABaEU36GiK/4RtCUp+drIji2nGwN3U0CI2zjEiqN0zxXbZBOGnHErI13NIX
 GI+2MBuM4s2ypNcxhfAPc6nrRsQ26uc2nB2mfpSRT5/8QeQEUl8B7yV/yRGJJALEZt
 gwsFWlAdF0Ar4EmnW1wdwwg6+8Pkmn9T4sekby9NbX3ka6arJ10AgMbjr6B97rooU8
 XlFTJjGWFvRpqt0crQVx+8fnCjXdj9LYgaL0zAr9XhiBFpH3gwdf3S3OLc7TUhFPwS
 H5BF0PSYWNEytcwAja66o2BMj74DiFR+K0rVjnbeJW0oKlYWzECne3t+9/nle162+t
 sSNLuOUjSJfiA==
Date: Thu, 13 Jul 2023 17:47:54 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 00/17] drm: rename various struct members "dev" -> "drm"
Message-ID: <vnn7b2vk76j4ooccelibkbkblduz5uvjryzfi5vmseljxl3dhq@5ckosntec72j>
References: <20230713082408.2266984-1-u.kleine-koenig@pengutronix.de>
 <874jm8go61.fsf@intel.com>
 <20230713103940.aeqgcbmcoqepvbax@pengutronix.de>
 <2ypl3btshoovedyyq7jaohjgmwr7egnhazuxuffbxudlljktml@syv5u27skpqr>
 <20230713141023.52dkz5ezicwev74w@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="3x7qzp3vvid2t2ch"
Content-Disposition: inline
In-Reply-To: <20230713141023.52dkz5ezicwev74w@pengutronix.de>
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
Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Sui Jingfeng <suijingfeng@loongson.cn>, kernel@pengutronix.de,
 Jani Nikula <jani.nikula@intel.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 "Russell King \(Oracle\)" <linux@armlinux.org.uk>,
 Julia Lawall <julia.lawall@inria.fr>, Luben Tuikov <luben.tuikov@amd.com>,
 Sean Paul <seanpaul@chromium.org>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--3x7qzp3vvid2t2ch
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 13, 2023 at 04:10:23PM +0200, Uwe Kleine-K=F6nig wrote:
> On Thu, Jul 13, 2023 at 01:17:43PM +0200, Maxime Ripard wrote:
> > On Thu, Jul 13, 2023 at 12:39:40PM +0200, Uwe Kleine-K=F6nig wrote:
> > > On Thu, Jul 13, 2023 at 12:23:50PM +0300, Jani Nikula wrote:
> > > > On Thu, 13 Jul 2023, Uwe Kleine-K=F6nig <u.kleine-koenig@pengutroni=
x.de> wrote:
> > > > > after most feedback for my series "drm/crtc: Rename struct drm_cr=
tc::dev
> > > > > to drm_dev"[1] was positive in principle, here comes a new series.
> > > >=20
> > > > I find it obnoxious to send a new series within 24 hours of the fir=
st,
> > > > while the discussion is still in progress, and it's a misrepresenta=
tion
> > > > of the in-progress dicussion to say most of the feedback was positi=
ve.
> > > >=20
> > > > This is not the way to reach consensus.
> > >=20
> > > Let me tell you I didn't had any obnoxious intentions when sending th=
is
> > > new series. I honestly still think that the feedback was mostly posit=
ive
> > > to the idea to get rid of struct drm_device *dev. Most discussion was
> > > about splitting the series and the right name to use instead of "dev".
> >=20
> > And then you have a former and current maintainers that tell you that
> > they'd prefer not to merge it at all.
>=20
> I went back to the previous thread rereading the replies I got yesterday
> (i.e. the ones I was aware when I started to respin the series). By then
> following people stated their opinion:

Let's focus on the roles then:

>  - Paul Kocialkowski
>    Is happy with the status quo
>    naming: drm_dev > { drmdev, drm }

drm-misc driver maintainer

>  - Thomas Zimmermann
>    All data structures should be converted
>    naming: drm > *

drm-misc maintainer (actually opposed to it)

>  - Javier Martinez Canillas
>    Generally in favour (also via irc)
>    Wants a single patch
>    naming: drm > drm_dev > dev

drm-misc driver maintainer

>  - Russell King
>    Sent a "Reviewed-by, Thanks"

DRM driver maintainer, hasn't contributed in a while to DRM, I think?

>  - Christan K=F6nig
>    Wants a single patch
>    naming: don't care

dmabuf, amdgpu, radeon DRM maintainer, pretty much against?

>  - Maxime Ripard
>    Wants a single patch

drm-misc maintainer

>  - Sui Jingfeng
>    no union
>    naming: { drm, ddev } > drm_dev > dev

drm-misc driver maintainer

>  - Luben Tuikov
>    Wants a single patch
>    naming: drm_dev > { drm, dev }

drm/scheduler maintainer

>  - Jani Nikula
>    unnecessary change.(is this a "no" or a "don't care"?)
>    naming: drm > *

Intel DRM maintainer

>  - Sean Paul
>    doesn't like this change

former drm-misc maintainer

So, on the record, we have 1 drm-misc maintainer, 1 intel GPU
maintainer, 1 amdgpu/radeon/dma-buf maintainer and one former drm-misc
maintainer pretty much against, or at best skeptical. And you don't have
similar or higher maintainers to match any of them. If there's a
consensus, I'm afraid it doesn't really go your way.

So if you want to get this through, I'd suggest to at least try to
convince them or continue the discussion. And before you reach that
point, sending more versions is only going to frustrate both ends of the
discussion.

Maxime

--3x7qzp3vvid2t2ch
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZLAcqgAKCRDj7w1vZxhR
xf6CAP9bkFS+X0LP1ra2nwQ0GR8pZNGU1L5yqUWVBuNK8zxpVgEAzVs9iTi86CvR
N48GVTF5MddlplTQ0Wcrd++cwobulg0=
=fRfG
-----END PGP SIGNATURE-----

--3x7qzp3vvid2t2ch--
