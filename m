Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7342F75EA45
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 05:50:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C0CD10E271;
	Mon, 24 Jul 2023 03:50:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD8BC10E271
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jul 2023 03:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1690170646;
 bh=1WvpFcCXiC55XJ1Msdg3rG8+IKnB5aPwn0slLurwDG0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=cR1czoN1qw0zw7GVzSRHAFzu2GDyIJ/1vWKaMQTVf+8DNWeCMmt57Wgrh8v2mcVl5
 2Bi/zmqtNx1BToTVbZSPeSbegR9Lg2fk945e4LV27AfxtiIthrBNLclwwufR83g6OT
 wgsSjXTMuaKpqLW/92gkR62RYwXSxRG/auG8tQS1LyxnILdE64bThiyiNhUq1kSKn4
 01rcObNegjCu+SD1q7o3fVEeUiJOHINxq2bl4nKqwNDL2+iUhwB5toay3kQ0Ohz1Nm
 YnNs+ZjcphVP67Peeyirs6UDXxK6TEe6POmoTYHe4LypIW1180QW/lYXkhQzvlFiR1
 p8HLnGRvfus8g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4R8R5d11Tyz4wyY;
 Mon, 24 Jul 2023 13:50:45 +1000 (AEST)
Date: Mon, 24 Jul 2023 13:50:42 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>
Subject: Re: linux-next: build warning after merge of the drm tree
Message-ID: <20230724135042.663447e1@canb.auug.org.au>
In-Reply-To: <20230712091714.760c00c8@canb.auug.org.au>
References: <20230330142818.7efb6d05@canb.auug.org.au>
 <CAJs_Fx67+VQwveGE3i7Nyp+5R2+Z5mEeDJ9ZMTZEY_gnYtc5Sw@mail.gmail.com>
 <20230712091714.760c00c8@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/22Dy8D9SSj0NkaQKQw6rT+z";
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
Cc: Rob Clark <robdclark@chromium.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Gustavo Padovan <gustavo.padovan@collabora.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/22Dy8D9SSj0NkaQKQw6rT+z
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 12 Jul 2023 09:17:14 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> On Thu, 30 Mar 2023 07:28:26 -0700 Rob Clark <robdclark@chromium.org> wro=
te:
> >
> > On Wed, Mar 29, 2023 at 8:28=E2=80=AFPM Stephen Rothwell <sfr@canb.auug=
.org.au> wrote: =20
> > >
> > > After merging the drm tree, today's linux-next build (htmldocs) produ=
ced
> > > this warning:
> > >
> > > include/uapi/linux/sync_file.h:77: warning: Function parameter or mem=
ber 'num_fences' not described in 'sync_file_info'
> > >   =20
> >=20
> > thanks, should be fixed by:
> >=20
> > https://patchwork.freedesktop.org/series/115871/
> >  =20
> > > Revealed by commit
> > >
> > >   d71c11cc79d2 ("dma-buf/sync_file: Surface sync-file uABI")
> > >
> > > Introduced by commit
> > >
> > >   2d75c88fefb2 ("staging/android: refactor SYNC IOCTLs")
> > >
> > > in 2016. =20
>=20
> I am still getting this warning (presumably now from Linus' tree).

I am still getting this warning despite the patch from Rob being
available since March 30.
--=20
Cheers,
Stephen Rothwell

--Sig_/22Dy8D9SSj0NkaQKQw6rT+z
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmS99RIACgkQAVBC80lX
0GwIigf/b3WOVdQXdt7NdigUv+jhB+G6q/H0CVE5JL6V3nRZdnQUuEwjknmeqSOw
PTgIk63cMafuPIUCNyWcmTyVlesR5swlx20OAR4so+JdndSxkKAaIaJI/K5AllP/
sDwhsedJngbDQkOJBnDE+L3jOSVEdOm9yXQ//zA9dlJr3jFHl77VBNcUIa+g7efP
mQEbaBRko/EQ6ZA7FOJZAeKtaVp2aH+jUf6iWiV9ivj+iNh0TbSEW49UtGTdHOsq
1HemmSOc6e33fuElX9roIZP5Huhii75PzSROsgaHMcJjd//O70bV6gEOp1q9TR/m
z2iui1Ud6QEW0dy3SZXthY8+8TXwJg==
=inDK
-----END PGP SIGNATURE-----

--Sig_/22Dy8D9SSj0NkaQKQw6rT+z--
