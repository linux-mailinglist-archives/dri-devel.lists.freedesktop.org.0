Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A0877DCE3B
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 14:52:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01E8010E129;
	Tue, 31 Oct 2023 13:52:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A39310E129
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Oct 2023 13:52:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9676C60F0C;
 Tue, 31 Oct 2023 13:52:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7C26C433C8;
 Tue, 31 Oct 2023 13:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1698760355;
 bh=g4fayFF0H43TgvcTCYi02wLX2Gr05h+rt0FdaIAqyIk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=axDXum61Q5bKSMWXWnV9GKcg5Q/M2cZ4uQHyAAykqtEIXzJDl/n9OZBFXjMvPppo4
 rGK8jUo+T9hs1xGgX/chjr06pSPobL2iM0HWH+n2iftpqpoe9xRwQoffY/1LvDKEQE
 CTzIWHdqPxgnegYbF40s22bgt+KaYK+KrXA+shCCsugKaBdg/zcvwLiTgXE/1HmoHH
 sn0jagA3QGkSIyHwopV71IIP/RlgWGGM33KulHbcB6L6reiW+VlaNA/gCCWtHBkwqL
 3/u1alCMxTykaYaRVRhIurXCpLqo4bpqqonDite42kCeP7b9jlCwJN3s7HqkawvS5a
 9x0YQdvNOGX4A==
Date: Tue, 31 Oct 2023 14:52:32 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] drm/ssd130x: Fix possible uninitialized usage of
 crtc_state variable
Message-ID: <gyf7vluuecx6nfqbm5x7xg2elxeb2zbipszeyjoklu2r7liroc@ntlwe3zkrgqb>
References: <20231020225338.1686974-1-javierm@redhat.com>
 <b048247c-75e9-488e-a4f3-b227a38bca5e@redhat.com>
 <87v8aso1ha.fsf@minerva.mail-host-address-is-not-set>
 <CAMuHMdVLf=H7QWaUXrN17ABw9eE1MjBdzFEM0AhMNj8_ULSz+Q@mail.gmail.com>
 <87lebjksoj.fsf@minerva.mail-host-address-is-not-set>
 <CAMuHMdXdYm6Opyhgte7CaScs_jdPNUqrQTbPCMSQXqkKpKTd8w@mail.gmail.com>
 <87il6nkp6e.fsf@minerva.mail-host-address-is-not-set>
 <2eh6i4ttpepnpehw47zucgrs3rvzugxiay7eqy65phktcm2m4r@zwzyn5rn55yl>
 <CAMuHMdXHq6yE14YqA+GNj=V79Z1rYTK=8Dx5WWw3RczrzMy21A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="tte2azzi3g6reuun"
Content-Disposition: inline
In-Reply-To: <CAMuHMdXHq6yE14YqA+GNj=V79Z1rYTK=8Dx5WWw3RczrzMy21A@mail.gmail.com>
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
Cc: Jocelyn Falempe <jfalempe@redhat.com>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Dan Carpenter <dan.carpenter@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--tte2azzi3g6reuun
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 31, 2023 at 02:00:06PM +0100, Geert Uytterhoeven wrote:
> Hi Maxime,
>=20
> On Tue, Oct 31, 2023 at 12:53=E2=80=AFPM Maxime Ripard <mripard@kernel.or=
g> wrote:
> > On Tue, Oct 31, 2023 at 12:27:05PM +0100, Javier Martinez Canillas wrot=
e:
> > > Geert Uytterhoeven <geert@linux-m68k.org> writes:
> > > >> >> Pushed to drm-misc (drm-misc-next). Thanks!
> > > >> >
> > > >> > Looks like you introduced an unintended
> > > >> >
> > > >> >     (cherry picked from commit 9e4db199e66d427c50458f4d72734cc4f=
0b92948)
> > > >> >
> > > >> > ?
> > > >>
> > > >> No, that's intended. It's added by the `dim cherry-pick` command, =
since I
> > > >> had to cherry-pick to drm-misc-next-fixes the commit that was alre=
ady in
> > > >> the drm-misc-next branch.
> > > >>
> > > >> You will find that message in many drm commits, i.e:
> > > >>
> > > >> $ git log --oneline --grep=3D"(cherry picked from commit" drivers/=
gpu/drm/ | wc -l
> > > >> 1708
> > > >
> > > > Ah, so that's why it's (way too) common to have merge conflicts bet=
ween
> > > > the fixes and non-fixes drm branches :-(
>=20
> > That's also not as bad as Geert put it: merging two branches with the
> > exact same commit applied won't create conflict. If the two commits
> > aren't exactly the same then we can indeed create conflicts, but that
> > would have been the case anyway with or without the "double-commits"
>=20
> Oh it is, as soon as one branch receives more commits that make changes
> to the same location.  Which is fairly common, too, to the point
> that I am surprised when merging a drm for-next branch does not trigger
> a conflict...
>=20
> Cfr. the conflict I had to resolve this morning between commit
> 64ffd2f1d00c6235 ("drm/amd: Disable ASPM for VI w/ all Intel systems")
> already upstream, and commits e5f52a84bf0a8170 ("drm/amd: Disable ASPM
> for VI w/ all Intel systems") and follow-up 2757a848cb0f1848
> ("drm/amd: Explicitly disable ASPM when dynamic switching disabled")
> in drm/drm-next.

I probably don't get what you're saying, sorry, but those two commits
would have conflicted anyway when merging the two branches, with or
without the cherry-pick.

Maxime

--tte2azzi3g6reuun
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZUEGoAAKCRDj7w1vZxhR
xXQMAQCApHoSIwBvbu9hs/AUWWlu/V0eNuLdDTWiMUAOqIgZVwD/QA4D/xcilfQD
g/zor+pG8ZvLijw6s4a4XgoARf9AeQU=
=FGIO
-----END PGP SIGNATURE-----

--tte2azzi3g6reuun--
