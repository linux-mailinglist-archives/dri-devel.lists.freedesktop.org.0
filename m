Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0372324DBE
	for <lists+dri-devel@lfdr.de>; Thu, 25 Feb 2021 11:15:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A19BD6E116;
	Thu, 25 Feb 2021 10:15:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 012326E116;
 Thu, 25 Feb 2021 10:15:08 +0000 (UTC)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id A82021C0B81; Thu, 25 Feb 2021 11:15:06 +0100 (CET)
Date: Thu, 25 Feb 2021 11:15:06 +0100
From: Pavel Machek <pavel@ucw.cz>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: udldrm does not recover from powersave? Re: udldrmfb: causes
 WARN in i915 on X60 (x86-32)
Message-ID: <20210225101506.GA17499@duo.ucw.cz>
References: <20210224200912.GA27905@duo.ucw.cz>
 <452585d5-9d18-f5a8-9d6b-6d39aa037480@suse.de>
 <20210225095322.GA5089@amd>
 <4fb31ea5-ef20-4752-4782-8d9f1afdf51d@suse.de>
MIME-Version: 1.0
In-Reply-To: <4fb31ea5-ef20-4752-4782-8d9f1afdf51d@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: intel-gfx@lists.freedesktop.org, kernel list <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, rodrigo.vivi@intel.com, airlied@redhat.com,
 sean@poorly.run
Content-Type: multipart/mixed; boundary="===============1816237058=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1816237058==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lrZ03NoBR/3+SXJZ"
Content-Disposition: inline


--lrZ03NoBR/3+SXJZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > Thank you, that fixes the DMA issue, and I can use the udl.
> >=20
> > ...for a while. Then screensaver blanks laptop screen, udl screen
> > blanks too. Upon hitting a key, internal screen shows up, udl does
> > not.
> >=20
> > I try rerunning xrandr ... --auto, but could not recover it.
> >=20
> > Any ideas?
>=20
> Did it work before the regression?

I don't know. I'm trying to get it to work, I basically did not use it befo=
re.

> For testing, could you please remove the fix and then do
>=20
>   git revert 6eb0233ec2d0
>=20
> This would restore the old version. Please report back on the results.

I doubt this is related, but I can try.

Best regards,
									Pavel
--=20
http://www.livejournal.com/~pavelmachek

--lrZ03NoBR/3+SXJZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYDd4qgAKCRAw5/Bqldv6
8s4MAJwMEpPvM8Uj3RqK+M5x8Kvx5bKlKwCePvQAZYLSesysWma9mbGP3nNG4jU=
=qjfI
-----END PGP SIGNATURE-----

--lrZ03NoBR/3+SXJZ--

--===============1816237058==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1816237058==--
