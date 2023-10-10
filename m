Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0B17BFAF0
	for <lists+dri-devel@lfdr.de>; Tue, 10 Oct 2023 14:15:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFBDA10E1D1;
	Tue, 10 Oct 2023 12:15:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D7FD10E1D1
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Oct 2023 12:15:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 2FA1CB81B9D;
 Tue, 10 Oct 2023 12:15:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3335BC433C8;
 Tue, 10 Oct 2023 12:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1696940149;
 bh=DTiRuw0mREFsD1LxPgcJrByQ7NmKX6oBSmRhssaCWaA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tzt4hj+6G0UurBB8/Zfoz4oPSO8b/1Nah8mQQWVBUN16LYwxZUY91fQc90KF54j2O
 hvDbKykh48hJNN31QDcvijg+Ol5weh1srjd4f5znlDhZmhQKcmR2LOJU+ImbkYfjcq
 Y7ziLAoxKfTGcH8FUlqUma7EAcUb+nMgdnHRfnxmY95oydRVWvbz2j+VQ9/be+n458
 oUIrIzk1y0YHlG6wxCif4HFm5Cv9ZLig2YlKpXlCMrYEBHzpE7i7PjLtBJuGsZm8AH
 /Nhq2esOw5UgiLnyOZMOgcMi7KdySSiCN0dBAP5pCx0NnW+epd0jW7OU5GpJ+GcX+7
 DZd/IKToepvnA==
Date: Tue, 10 Oct 2023 14:15:47 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH v4 2/4] drm/panic: Add a drm panic handler
Message-ID: <5l4wotvmflkl42ms2wbw6mcz7bevk246abouj33fjn5wzfh72i@3vhxratfu3xi>
References: <3a359910-31ae-355f-2608-239e04689fde@redhat.com>
 <6iaqx7ef4hdd6bucsxtfy37nsizloraxbudez4ms7jlusbghr3@i5hliqpimdp2>
 <bd880231-f161-0773-63f7-ded6cb3fddc1@tronnes.org>
 <b4aadfb4-9393-d6b6-e876-a420afcf2b36@redhat.com>
 <wupxw7bs6yu4gtsbmuvdxhwpd4vkxvvl4aa6w7fumqekzvl7v7@akv2tifgsihl>
 <b764a8a7-db48-fd3b-6241-f3a07009e7dd@redhat.com>
 <xutxpbk476iogtgfbcxbebnud7t3oq6dlbhpniimna2uz2p2nb@hbrrwn4y3x6s>
 <cd54b5ab-5ac8-4569-991c-bf6e062e6400@suse.de>
 <63wdz6ns6wsu3avztqebmeo4aa4ltwmmmywlam3xe6fmftcf3p@5icc2cvy6xvh>
 <0a6c2a07-bf44-409a-8a09-827410f011a6@tronnes.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="teya27cm2q7tdhvy"
Content-Disposition: inline
In-Reply-To: <0a6c2a07-bf44-409a-8a09-827410f011a6@tronnes.org>
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
Cc: Jocelyn Falempe <jfalempe@redhat.com>, bluescreen_avenger@verizon.net,
 Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, gpiccoli@igalia.com, airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--teya27cm2q7tdhvy
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 10, 2023 at 01:29:52PM +0200, Noralf Tr=F8nnes wrote:
>=20
>=20
> On 10/10/23 11:25, Maxime Ripard wrote:
> >=20
> >=20
> > On Tue, Oct 10, 2023 at 10:55:09AM +0200, Thomas Zimmermann wrote:
> >>>> So if I understand correctly, drm_panic would pre-allocate a plane/c=
ommit,
> >>>> and use that when a panic occurs ?
> >>>
> >>> And have it checked already, yes. We would only wait for a panic to
> >>> happen to pull the trigger on the commit.
> >>>
> >>>> I have two concern about this approach:
> >>>> - How much memory would be allocated for this ? a whole framebuffer =
can be
> >>>> big for just this use case.
> >>
> >> As I outlined in my email at [1], there are a number of different scen=
arios.
> >> The question of atomic state and commits is entirely separate from the=
 DRM
> >> panic handler. We should not throw them together. Whatever is necessar=
y is
> >> get a scanout buffer, should happen on the driver side of
> >> get_scanout_buffer, not on the drm_panic side.
> >>
> >> [1] https://lore.kernel.org/dri-devel/39bd4c35-8a61-42ee-8675-ccea4f5d=
4ac6@suse.de/T/#m22f116e9438e00a5f0a9dc43987d4153424f8be1
> >>
> >>>
> >>> I'dd expect a whole framebuffer for the current
> >>> configuration/resolution. It would be typically 4MB for a full-HD sys=
tem
> >>> which isn't a lot really and I guess we can always add an option to
> >>> disable the mechanism if needed.
> >>>
> >>>> - I find it risky to completely reconfigure the hardware in a panic =
handler.
> >>>
> >>> I would expect to only change the format and base address of the
> >>> framebuffer. I guess it can fail, but it doesn't seem that different =
to
> >>> the async plane update we already have and works well.
> >>
> >> The one thing I don't understand is: Why should we use atomic commits =
in the
> >> first place? It doesn't make sense for firmware-based drivers.
> >=20
> > Because this is generic infrastructure that is valuable for any drivers
> > and not only firmware-based drivers?
> >=20
> >> In some drivers, even the simple ast, we hold locks during the regular
> >> commit. Trying to run the panic commit concurrently will likely give a
> >> deadlock.
> >=20
> > You're in the middle of a panic. Don't take any locks and you won't dea=
dlock.
> >=20
> >> In the end it's a per-driver decision, but in most cases, the driver c=
an
> >> easily switch to a default mode with some ad-hoc code.
> >=20
> > When was the last time a per-driver decision has been a good thing? I'm
> > sorry, but the get_scanout_buffer approach buffer won't work for any
> > driver out there.
> >=20
> > I'm fine with discussing alternatives if you don't like the ones I
> > suggested, but they must allow the panic handler infrastructure to work
> > with any driver we have, not just 4.
> >=20
>=20
> Why can't we use the model[1] suggested by Daniel using a draw_pixel
> callback giving drivers full control on how they can put a pixel on the
> display?

I share kind of the same general ideas/conclusions: "qthe idea is that
all the fb selection and lookup is handled in shared code (and with
proper locking, but only for atomic drivers)."

2016 is a bit old though and multiple developments happened since
(secure playback is a thing now, framebuffer compression too), so I
still think that their expectation that the framebuffer is accessible to
/ writable by the CPU no longer holds true.

> This will even work for the AMD debug interface.
> In the linear CPU accessible buffer case, we can provide a helper for
> that, maybe we can do helpers for other common cases as well.

Yeah, their idea of a panic_draw would work great for that.

> Adding to that we would need a panic_setup/enter and panic_teardown/exit
> callback.

What for?

Maxime

--teya27cm2q7tdhvy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZSVAcwAKCRDj7w1vZxhR
xbI0AP9uAqeVd0Ve1GW3S6XFTSHuYXMoKCtRf5b0okKBkfe0agD+Pbg1SEl1bICN
a2gG9XSm1p4TvRulWglY59WUMIXRWAE=
=dF4U
-----END PGP SIGNATURE-----

--teya27cm2q7tdhvy--
