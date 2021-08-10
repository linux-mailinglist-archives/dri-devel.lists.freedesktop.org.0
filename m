Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DEC03E5B92
	for <lists+dri-devel@lfdr.de>; Tue, 10 Aug 2021 15:27:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78D2889F85;
	Tue, 10 Aug 2021 13:27:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 376 seconds by postgrey-1.36 at gabe;
 Tue, 10 Aug 2021 13:27:29 UTC
Received: from gimli.rothwell.id.au (gimli.rothwell.id.au
 [IPv6:2404:9400:2:0:216:3eff:fee1:997a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6824489F85
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Aug 2021 13:27:29 +0000 (UTC)
Received: from authenticated.rothwell.id.au (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.rothwell.id.au (Postfix) with ESMTPSA id 4GkYVp6LwdzyRg;
 Tue, 10 Aug 2021 23:21:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rothwell.id.au;
 s=201702; t=1628601668;
 bh=qUt8AMxpYWBbwO7fzlLqiZ0lC38ig6U7rUvX/67+P8c=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=NlB/KFynSODKeaUVYEAcS/9C28waxIOYgJJ3wf+8FJ0fZevPEulH6lJO63OxIFUM7
 fL+MN3nBCsBMpNhWw/FLskxpWYpPOteTNo9bAye5uAPYr3D+c8qGYtBLJ1D3K7Lkw6
 PAJdlOBqRQAtDPxG6rEWWXQ6uGx2jJ877eWo+KyX23yuyMdtlF/hASVaABxe+2mYun
 UHjmdWMCPO0fmXax7TyEEQjHYkafmp0EcMhJH1lZLXynREQymX7Ks+3YHwqMTerQRb
 J667gsCi+dtvf2Ms4r4Zws167j5Yhu2C0yqF41E9bxpFt6xy+vsksslSChtHx5svDi
 71h6fXbwQTJUA==
Date: Tue, 10 Aug 2021 23:21:04 +1000
From: Stephen Rothwell <sfr@rothwell.id.au>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Dave Airlie <airlied@linux.ie>,
 DRI <dri-devel@lists.freedesktop.org>, Matthew Auld
 <matthew.auld@intel.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warnings after merge of the drm tree
Message-ID: <20210810232104.1e83c6d1@elm.ozlabs.ibm.com>
In-Reply-To: <CAKMK7uHyUbc5StULAgawYZUtZqyYxfud5CMh3MaGJ5KS0FeXRQ@mail.gmail.com>
References: <20210603193242.1ce99344@canb.auug.org.au>
 <20210708122048.534c1c4d@canb.auug.org.au>
 <20210810192636.625220ae@canb.auug.org.au>
 <YRJRju/zo5YiF1EB@phenom.ffwll.local>
 <20210810203859.128649fc@canb.auug.org.au>
 <YRJaD51xR8rQ2ga+@phenom.ffwll.local>
 <20210810210129.03b3fba5@canb.auug.org.au>
 <CAKMK7uHyUbc5StULAgawYZUtZqyYxfud5CMh3MaGJ5KS0FeXRQ@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/=ZiQ42b8FFCxMbJrockpNad";
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/=ZiQ42b8FFCxMbJrockpNad
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

On Tue, 10 Aug 2021 14:39:17 +0200 Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Tue, Aug 10, 2021 at 1:01 PM Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
> > Hi Daniel,
> >
> > On Tue, 10 Aug 2021 12:50:55 +0200 Daniel Vetter <daniel@ffwll.ch> wrot=
e: =20
> > >
> > > Uh that's not good, I missed that. I'll look into it. =20
> >
> > Thanks. =20
>=20
> Doc build is taking absolutely forever here, but I think I have the
> right patch for you. t-b/ack would be great if you can give it a spin,
> I cc'ed you.

Tested-by Stephen Rothwell <sfr@canb.auug.org.au>

Thanks.  And, yes, the doc build takes quite some time :-(

--=20
Cheers,
Stephen Rothwell

--Sig_/=ZiQ42b8FFCxMbJrockpNad
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmESfUAACgkQAVBC80lX
0GxtpAf9EDkg3lTYzraKk7n8KqjKW4a4GAIV95ZkeptmKsUeBMaD0W6+YubSC6nO
pj3JG8s2UGhq/ruhI1h+rHSe+bXpZ+5+Re55nTa3fpuXQabeb6tnvhtUxEaaZ2gx
zMBQC1Dvd4eBKbd9JzpSSCQk7ncdHv9Vk/5v1ucBrQjUNVXDPMR/aT5FOSCFUbLb
Zy9ukkSIO2pfRSuHoOSfyjFXDAlIjObVE+0p1mKOMqaLuoXS5er5gCVgQEVdkQRX
cROMWrEHF64CU+qk6pzny+hPY6QO9rYLmMmlk9PT8WACbwMOsjZReuwp3I6M3HxX
DNp1LdPSGuUmbVlx0QzW6KT6RXsyUw==
=nUq9
-----END PGP SIGNATURE-----

--Sig_/=ZiQ42b8FFCxMbJrockpNad--
