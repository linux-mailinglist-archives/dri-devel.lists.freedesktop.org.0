Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A1A9B9929
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2024 21:07:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFFB410E0C1;
	Fri,  1 Nov 2024 20:07:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nSp7NtGk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DEBF10EA0C
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Nov 2024 20:07:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 936C55C5C69;
 Fri,  1 Nov 2024 20:06:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1738EC4CECD;
 Fri,  1 Nov 2024 20:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730491656;
 bh=4gAT0HFny/uubV2wFiEE++QBBhOmMgPZGZyxNpwgaFk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nSp7NtGknZUTHxyNdjiHayaQzDcnoV9I7Rgyca29npV1RbPnNYvUBoYcyEI/z4/4B
 vUrncQg83m/Bnpgk/+GoD0+04QzbTbLyr38LR3FLkr7HwqncfuKxOtnwz75G2gQEE9
 VuRAWCjCK7JEJ0iI44nEy5pTRd2GmPaw3gMsg5c6jgk53XeUAnKe0DE1mP0tdwEx8p
 sfhveAa6HQDruGbLdL8AKOkXMAb2YQgH+GIKJTOh2DfNkFNSaV6ey4qeaeHpfulxDC
 LiZKNtHlU1h0TWPEjTo+pHeO0m2MxvnIUQSr3PELF0GhKJimHTpVapbkrI3Kw6Qh+8
 YiIxsgBQV4Kwg==
Date: Fri, 1 Nov 2024 21:07:29 +0100
From: Alejandro Colomar <alx@kernel.org>
To: Ian Rogers <irogers@google.com>
Cc: "G . Branden Robinson" <g.branden.robinson@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-man@vger.kernel.org
Subject: Re: [PATCH v2 1/3] proc_pid_fdinfo.5: Reduce indent for most of the
 page
Message-ID: <20241101200729.6wgyksuwdtsms3eu@devuan>
References: <20241015211719.1152862-1-irogers@google.com>
 <20241101132437.ahn7xdgvmqamatce@devuan>
 <CAP-5=fXo5XjxUXshm9eRX-hCcC5VWOv0C5LBZ3Z0_wQb+rdnsw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="vmpttclijleburvy"
Content-Disposition: inline
In-Reply-To: <CAP-5=fXo5XjxUXshm9eRX-hCcC5VWOv0C5LBZ3Z0_wQb+rdnsw@mail.gmail.com>
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


--vmpttclijleburvy
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 1/3] proc_pid_fdinfo.5: Reduce indent for most of the
 page
MIME-Version: 1.0

Hi Ian,

On Fri, Nov 01, 2024 at 11:19:18AM -0700, Ian Rogers wrote:
> On Fri, Nov 1, 2024 at 6:24=E2=80=AFAM Alejandro Colomar <alx@kernel.org>=
 wrote:
> >
> > On Tue, Oct 15, 2024 at 02:17:17PM -0700, Ian Rogers wrote:
> > > When /proc/pid/fdinfo was part of proc.5 man page the indentation made
> > > sense. As a standalone man page the indentation doesn't need to be so
> > > far over to the right. Remove the initial tagged pragraph and move the
> > > styling to the initial summary description.
> > >
> > > Suggested-by: G. Branden Robinson <g.branden.robinson@gmail.com>
> > > Signed-off-by: Ian Rogers <irogers@google.com>
> > > ---
> > >  man/man5/proc_pid_fdinfo.5 | 66 ++++++++++++++++++------------------=
--
> > >  1 file changed, 32 insertions(+), 34 deletions(-)
> > >
> > > diff --git a/man/man5/proc_pid_fdinfo.5 b/man/man5/proc_pid_fdinfo.5
> > > index 1e23bbe02..8678caf4a 100644
> > > --- a/man/man5/proc_pid_fdinfo.5
> > > +++ b/man/man5/proc_pid_fdinfo.5
> > > @@ -6,20 +6,19 @@
> > >  .\"
> > >  .TH proc_pid_fdinfo 5 (date) "Linux man-pages (unreleased)"
> > >  .SH NAME
> > > -/proc/pid/fdinfo/ \- information about file descriptors
> > > +.IR /proc/ pid /fdinfo " \- information about file descriptors"
> >
> > I wouldn't add formatting here for now.  That's something I prefer to be
> > cautious about, and if we do it, we should do it in a separate commit.
>=20
> I'll move it to a separate patch. Is the caution due to a lack of test
> infrastructure? That could be something to get resolved, perhaps
> through Google summer-of-code and the like.

That change might be controversial.  We'd first need to check that all
software that reads the NAME section would behave well for this.

Also, many other pages might need to be changed accordingly for
consistency.

For testing infrastructure I think we're good.  The makefile already
does a lot of testing.

>=20
> > >  .SH DESCRIPTION
> > > -.TP
> > > -.IR /proc/ pid /fdinfo/ " (since Linux 2.6.22)"
> > > -This is a subdirectory containing one entry for each file which the
> > > -process has open, named by its file descriptor.
> > > -The files in this directory are readable only by the owner of the pr=
ocess.
> > > -The contents of each file can be read to obtain information
> > > -about the corresponding file descriptor.
> > > -The content depends on the type of file referred to by the
> > > -corresponding file descriptor.
> > > -.IP
> > > +Since Linux 2.6.22,
> >
> > You could move this information to a HISTORY section.
>=20
> Sure, tbh I'm not sure anybody cares about this information and it
> could be as well to delete it. Sorry people running 17 year old
> kernels. For now I'll try to leave it unchanged.

I would like to keep it in HISTORY.  You never know when it'll be useful
and it's just one line or a few; it won't hurt.

>=20
> > > +this subdirectory contains one entry for each file that process
> > > +.I pid
> > > +has open, named by its file descriptor.  The files in this directory
> >
> > Please don't reflow existing text.  Please read about semantic newlines
> > in man-pages(7):
> >
> > $ MANWIDTH=3D72 man man-pages | sed -n '/Use semantic newlines/,/^$/p'
> >    Use semantic newlines
> >      In  the  source of a manual page, new sentences should be started
> >      on new lines, long sentences should be split into lines at clause
> >      breaks (commas, semicolons, colons, and so on), and long  clauses
> >      should be split at phrase boundaries.  This convention, sometimes
> >      known  as  "semantic newlines", makes it easier to see the effect
> >      of patches, which often operate at the level of  individual  sen=
=E2=80=90
> >      tences, clauses, or phrases.
>=20
> I'll update for v3 but I'm reminded of `git diff --word-diff=3Dcolor` so
> perhaps this recommendation is outdated.

No, this isn't outdated, since that reduces the quality of the diff.
Also, I review a lot of patches in the mail client, without running
git(1).  And it's not just for reviewing diffs, but also for writing
them.  Semantic newlines reduce the amount of work for producing the
diffs.  And lastly, the source code reads much better if it's logically
divided in phrases.

>=20
> Thanks,
> Ian

--=20
<https://www.alejandro-colomar.es/>

--vmpttclijleburvy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE6jqH8KTroDDkXfJAnowa+77/2zIFAmclNQAACgkQnowa+77/
2zLQjA//UmIZXrXU6535kY+aK/mDc00ttn4ZEHEus8oEyTBWz3H66RobCLhJ6DFJ
xI5J/BbrMfh9sLMWjH3qcZIIU+X3Sf4HRRtVoroYv52YoxaXdEvhZWUWxTs3E9HY
0khMstgT7sq7O6xPP5+agLepDOkXvrcFU14lJgVlX6XCE0r/rphKUvbAq0F++Bni
K5Xm3lh2Zrr502R0/hQqhWiaLENnuFMHCeju2OXp+CsHadU2H+PbNwG4GQv6yC16
iNx8beNUCcmTAdEujbT8HJgptXls7HkmaMnFD6WhoumJOZiNTdObQDNvPIwRTRvY
BjGKbYmyqsj2Eh9fg+8corHD18vC8bDZdfmKh6PvGo1Jg/KYfqBuQfhaC1U8STg+
G1H5MDf61j4dzdM72ZzR72f/TQLXhkAZBDinJ9xeBJdIAd8EewJd4XD9+LkXxEPE
Lqa2lAnfbGWtt1shO5gZFW/U9FOYL9C8KM0ZI8giLPn06YtbEYncdzJfIJw4ZD93
UlnllwfyFEA2iUx8+R3I0SXXvWAQu9VYUAeipfhyIwk3TWgb1h5zrCuqmBifsVf9
pbEUDw2K0mBuDJ07KRSdUivVWsqUP6Fxodlv+HWv4LYA3RDhXFgnizEeO8sgFntm
MpplL9VbBayCOqjmDSUWMIe2bo8vJ44AJP4MzbGNT5wyIdcLz7U=
=rohc
-----END PGP SIGNATURE-----

--vmpttclijleburvy--
