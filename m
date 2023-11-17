Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6957EF26C
	for <lists+dri-devel@lfdr.de>; Fri, 17 Nov 2023 13:13:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 889BB10E751;
	Fri, 17 Nov 2023 12:13:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13AF710E751
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Nov 2023 12:13:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 6C179B82055;
 Fri, 17 Nov 2023 12:13:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CDC0C433C7;
 Fri, 17 Nov 2023 12:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1700223188;
 bh=PVXHem/9yhgEemapb6B+aU1ZOidWzlM1JlH8PA2bqEE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VKALuHhVL8MKsgOhi01VmYVe/xoNy8nZtQtRLH2k8SoSOoBe81U+nfouDXcz5cEPE
 ECf9wHc3olWF3PS5/kWMsUO78iifpi0sUDlOUisryGLzgWSYN0vWBtiRAZ9o6rZN5s
 Tv2DPBjfIU1PRjTorc/6G4Tsl2oMa+Xk9sC76G4UxrSKmRRdQiIlrIZJ4JCcXFe5Gg
 vCpjDF07AUrjAD4cx1Y/JxR/TRJS9MrOrrmmOz2FZA+dpZoJTYqsqQ294SEs+3gvzH
 Y9UOLOWWjjt/9g3YZoaTgtrUmWnsU7lwZkEpJoeu2k0ziX8PjaEREkrKhQNP0N/MAi
 dl6ahXRiBRh8g==
Date: Fri, 17 Nov 2023 13:13:05 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: Re: [PATCH 8/8] drm/bridge: it66121: Allow link this driver as a lib
Message-ID: <krfqbhcbap7uxdv7l7w7jnjjwkiwejp27qoaityqxjp2gbuuhg@ff46mbse7l4d>
References: <20231114150130.497915-1-sui.jingfeng@linux.dev>
 <20231114150130.497915-9-sui.jingfeng@linux.dev>
 <CAA8EJprQq3aDhzE+yKGZ2-nsuHWcptzMvApsyOi9D63PgeiZ3w@mail.gmail.com>
 <1b59d647-c345-4260-b07b-22abb70ae17a@linux.dev>
 <CAA8EJppY2+ymX0kLY+cuR=SV1Po2J24r=NQecmb3ZhSE9NHG7Q@mail.gmail.com>
 <7b85d057-3d66-435a-a657-dd69067b6bef@linux.dev>
 <b9eacd91-8d6f-4265-931e-bc31cadd54d4@linux.dev>
 <CAA8EJpo1KhzTpaSqjbOuQvNKw4WGaqrtNBtNfdNLn28eZVgwhw@mail.gmail.com>
 <cf27d25a-3e51-4292-af63-37e5bc585d88@linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="car2seveobmjidpx"
Content-Disposition: inline
In-Reply-To: <cf27d25a-3e51-4292-af63-37e5bc585d88@linux.dev>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Sui Jingfeng <suijingfeng@loongson.cn>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Phong LE <ple@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--car2seveobmjidpx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 17, 2023 at 12:24:22PM +0800, Sui Jingfeng wrote:
> Hi,
>=20
> On 2023/11/16 23:23, Dmitry Baryshkov wrote:
> > > > > Then you will need some way (fwnode?) to
> > > > > discover the bridge chain. And at the last point you will get int=
o the
> > > > > device data and/or properties business.
> > > > >=20
> > > > No, leave that chance to a more better programmer and forgive me pl=
ease,
> > > > too difficult, I'm afraid of not able to solve. Thanks a lot for the
> > > > trust!
> >  From my point of view: no.
>
> I respect the fact that the community prefer generic mechanisms.
> If our approach is not what the community want, can I switch back
> to my previous solution?

By your previous solution, you mean rolling your own bridge driver? If
so, then no, it's not acceptable either.

> I can reduce the duplication of our localized it66121 driver to a
> minimal, rewrite it until it meets the community's requirement. I know
> our device looks weird and our approach is not elegant.

I'm glad we agree then :)

> But at the very least, we could not mess the community's design up by
> localize. Otherwise, I don't know what is the better approach to solve
> such a problem.

I think there's a gap between what we want from you and what you want
=66rom us.

What we really care about is maintenance. In other words, it's mostly
about two things:

  - Once you and/or your company have moved on to other things, how easy
    it will be for us to keep that driver in good shape, and how much it
    will hold back any future development.

  - If we want to do a big rework, how much your driver will stand in
    the way.

That's pretty much all that we care about, and we will very much prefer
not to merge a driver in the first place than to have to maintain it for
10y while it stands in our way and we don't have any real documentation
or help.

So by making it "not weird" or "elegant" or whatever we can call it, you
effectively remove any concern we might have about merging your driver,
and there's only an upside (more hardware support and company
involvement is good!). So you're making it easy for you too.

Maxime

--car2seveobmjidpx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZVdY0QAKCRDj7w1vZxhR
xeeaAQDqkMTWNdddur3We9/0s91HXhePgAckWeUF86wbBjvkBwEAzTrpCgaXe9sq
ieP3+9H2jCNCnMm0jgBpwJivRQrYZQs=
=gL95
-----END PGP SIGNATURE-----

--car2seveobmjidpx--
