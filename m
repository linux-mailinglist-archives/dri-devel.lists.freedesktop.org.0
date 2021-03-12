Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ADAC3395DB
	for <lists+dri-devel@lfdr.de>; Fri, 12 Mar 2021 19:08:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B3E56E079;
	Fri, 12 Mar 2021 18:08:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ECFA6E079
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Mar 2021 18:08:49 +0000 (UTC)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id B00C81C0B7C; Fri, 12 Mar 2021 19:08:42 +0100 (CET)
Date: Fri, 12 Mar 2021 19:08:42 +0100
From: Pavel Machek <pavel@ucw.cz>
To: Peiyong Lin <lpy@google.com>
Subject: Re: [PATCH v5] Add power/gpu_frequency tracepoint.
Message-ID: <20210312180841.GA29093@amd>
References: <20201202123420.g3ivr5le4imcrdsa@DESKTOP-E1NTVVP.localdomain>
 <20201221201019.2897731-1-lpy@google.com>
 <CA+0soAnXOknfWBbuHiq4VG8byoQ89u8NdYBtq-n-JMURPUOhUw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+0soAnXOknfWBbuHiq4VG8byoQ89u8NdYBtq-n-JMURPUOhUw@mail.gmail.com>
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
Cc: Sidath Senanayake <sidaths@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Prahlad Kilambi <prahladk@google.com>, Ingo Molnar <mingo@redhat.com>,
 Steven Rostedt <rostedt@goodmis.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, nd@arm.com, zzyiwei@android.com,
 android-kernel@google.com
Content-Type: multipart/mixed; boundary="===============1014670508=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1014670508==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9jxsPFA5p3P2qPhR"
Content-Disposition: inline


--9jxsPFA5p3P2qPhR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2021-03-10 13:56:29, Peiyong Lin wrote:
> On Mon, Dec 21, 2020 at 12:10 PM Peiyong Lin <lpy@google.com> wrote:
> >
> > Historically there is no common trace event for GPU frequency, in
> > downstream Android each different hardware vendor implements their own
> > way to expose GPU frequency, for example as a debugfs node.  This patch
> > standardize it as a common trace event in upstream linux kernel to help
> > the ecosystem have a common implementation across hardware vendors.
> > Toolings in the Linux ecosystem will benefit from this especially in the
> > downstream Android, where this information is critical to graphics
> > developers.
=2E..
> >  /* This part must be outside protection */
> > --
> > 2.29.2.684.gfbc64c5ab5-goog
> >
>=20
> Hi there,
>=20
> Could you please take a look at this patch?

Please trim email quotes when replying.

Also, you might want to state _name_ of person who should apply this,
so there's no ambiguity. You cc-ed many people...
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--9jxsPFA5p3P2qPhR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmBLrikACgkQMOfwapXb+vKmUgCfYJkfoLcgo9O2CieH/qJZ1Y6i
CuEAnRsSitZAj6RBtdRepNCJESxo1r2p
=l4Xr
-----END PGP SIGNATURE-----

--9jxsPFA5p3P2qPhR--

--===============1014670508==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1014670508==--
