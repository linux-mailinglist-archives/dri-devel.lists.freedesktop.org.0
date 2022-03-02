Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7B54CA3ED
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 12:38:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B08110E771;
	Wed,  2 Mar 2022 11:38:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B27310E771
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Mar 2022 11:38:21 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4K7sZ03Cqlz4xRC;
 Wed,  2 Mar 2022 22:38:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1646221097;
 bh=nURFT4BwINNuaZBIGhlpDRAhChHsiLBhqSzamPvBvFY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=NKtT73kEVkxHnkZeG7lAbaEGxz8HzOBYNbZLz5aPS08t9R6t0vpOlOHloKo+p2WPG
 dslXTCEigXwW9BQd+BIi/I7xN4N7GQYmBmV0UvqyH3zEG6pWt2Ww3thQeTZ4VU40CD
 HwoYgfY3/k7cprSsA3aI8WHELdkXXcZikYDh9aGan8+xtSeQtmLjan1Pi0q5cfYvmS
 sUR7EOJtClg2GVmIEcz5wSDH5svD3RxVuoUyKKZmXseNKIJ365OoEJrMYTutsZOhT3
 9MUJWnkPPochZ9/TtVYaAQUMtWe5Xmknf8ESMcS8UgaocWOAY/5/go8c0GDiDK278Q
 gn+kVNVKfdGqw==
Date: Wed, 2 Mar 2022 22:38:15 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: linux-next: build warning after merge of the drm tree
Message-ID: <20220302223815.5e754608@canb.auug.org.au>
In-Reply-To: <9925b272-b52d-be3c-bac9-e56cea421199@redhat.com>
References: <20220202150201.290c7d3d@canb.auug.org.au>
 <20220202150320.3e9bdd62@canb.auug.org.au>
 <f50d5044-7192-bdb3-7ca9-7217ed311787@redhat.com>
 <20220302123417.2c84200b@canb.auug.org.au>
 <9925b272-b52d-be3c-bac9-e56cea421199@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/53y/7Qan=BK7CnutoMfuzyc";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Cc: Dave Airlie <airlied@linux.ie>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Rajat Jain <rajatja@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/53y/7Qan=BK7CnutoMfuzyc
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Hans,

On Wed, 2 Mar 2022 11:32:37 +0100 Hans de Goede <hdegoede@redhat.com> wrote:
>
> On 3/2/22 02:34, Stephen Rothwell wrote:
> > Hi all,
> >=20
> > On Wed, 2 Feb 2022 09:38:37 +0100 Hans de Goede <hdegoede@redhat.com> w=
rote: =20
> >>
> >> On 2/2/22 05:03, Stephen Rothwell wrote: =20
> >>>
> >>> On Wed, 2 Feb 2022 15:02:01 +1100 Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:   =20
> >>>>
> >>>> After merging the drm tree, today's linux-next build (htmldocs) prod=
uced
> >>>> this warning:
> >>>>
> >>>> drivers/gpu/drm/drm_privacy_screen.c:X: warning: Function parameter =
or member 'data' not described in 'drm_privacy_screen_register'   =20
> >>>
> >>> Actually:
> >>>
> >>> drivers/gpu/drm/drm_privacy_screen.c:392: warning: Function parameter=
 or member 'data' not described in 'drm_privacy_screen_register'   =20
> >>
> >> Thank you for reporting this, I will prepare a patch fixing this. =20
> >=20
> > I am still seeing this warning. =20
>=20
> Weird, this should be fixed by:
>=20
> https://cgit.freedesktop.org/drm-misc/commit/?id=3Dccbeca4ca04302d1296020=
93c8d611065e3f7958
>=20
> Which was added to the "drm-misc-next-2022-02-23" drm-misc tag/pull-req 7=
 days ago,
> which was merged into drm-next 6 days ago ?
>=20
> I just reverted that did a make htmldocs and got the warning, then re-app=
lied and
> the warning was gone...

As I said in my other reply, the drm tree has had build problems until
today and so it has been only partly included in linux-next.  I can
confirm that the warning is gone in today's tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/53y/7Qan=BK7CnutoMfuzyc
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmIfVycACgkQAVBC80lX
0GwJeAf9EIcnkMX/Lw+MJdJSCmYIW+MI/ue4ttLHaFIkTgNERrtrorqDSlezWoFD
g4/ipek3XK/jPX3SLK0qmKFv88/bOmLOu41N9jEQhx8NjTNCmJLrg1LrwXlDvRnH
QR6s0dBk190WVgGxLOH7ra9M2x5Xg/Y1Oyo7IcFe5q4FRzNrbTs7BRBIf99wTeFV
lkjcZwTmcQrzgPKEIya6xl/V9LWMyaFnvv8XejyQoQ+0+ar5bmzX/Nu+Pq4UqrUz
j28dTRUtDBP8M3N8hM5LFSwQI0x7hpsxWyoOPOo0xlSihM576eI2ujFZ4crUYyBj
vKe2vKPYOs54LZQy1epRumuQy1v+vg==
=9VyO
-----END PGP SIGNATURE-----

--Sig_/53y/7Qan=BK7CnutoMfuzyc--
