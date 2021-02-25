Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F64324D2F
	for <lists+dri-devel@lfdr.de>; Thu, 25 Feb 2021 10:53:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1197D6EC74;
	Thu, 25 Feb 2021 09:53:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 784FB6EC74;
 Thu, 25 Feb 2021 09:53:24 +0000 (UTC)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id 2708A1C0B8B; Thu, 25 Feb 2021 10:53:23 +0100 (CET)
Date: Thu, 25 Feb 2021 10:53:22 +0100
From: Pavel Machek <pavel@ucw.cz>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: udldrm does not recover from powersave? Re: udldrmfb: causes WARN in
 i915 on X60 (x86-32)
Message-ID: <20210225095322.GA5089@amd>
References: <20210224200912.GA27905@duo.ucw.cz>
 <452585d5-9d18-f5a8-9d6b-6d39aa037480@suse.de>
MIME-Version: 1.0
In-Reply-To: <452585d5-9d18-f5a8-9d6b-6d39aa037480@suse.de>
User-Agent: Mutt/1.5.23 (2014-03-12)
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
Content-Type: multipart/mixed; boundary="===============0752273195=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0752273195==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tKW2IUtsqtDRztdT"
Content-Disposition: inline


--tKW2IUtsqtDRztdT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> >This is in -next, but I get same behaviour on 5.11; and no, udl does
>=20
> Thanks for reporting. We are in the process of fixing the issue. The late=
st
> patch is at [1].
>

Thank you, that fixes the DMA issue, and I can use the udl.

=2E..for a while. Then screensaver blanks laptop screen, udl screen
blanks too. Upon hitting a key, internal screen shows up, udl does
not.

I try rerunning xrandr ... --auto, but could not recover it.

Any ideas?

Best regards,
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--tKW2IUtsqtDRztdT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmA3c5IACgkQMOfwapXb+vIK+wCfcBgCyVwqlwT9BhlQBINozkZu
6EMAn2cKNi7+6HsERfcaiq/3RwULgi5f
=/Y0f
-----END PGP SIGNATURE-----

--tKW2IUtsqtDRztdT--

--===============0752273195==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0752273195==--
