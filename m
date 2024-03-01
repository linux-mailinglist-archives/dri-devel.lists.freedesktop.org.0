Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2975486DF81
	for <lists+dri-devel@lfdr.de>; Fri,  1 Mar 2024 11:44:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BAC010EC83;
	Fri,  1 Mar 2024 10:44:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="MPJrHvWj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79B7F10EC83;
 Fri,  1 Mar 2024 10:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1709289841;
 bh=MUAaVbY8hAyvVomzkTkUV8mACB46mqqy2aCXtcMPy5k=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=MPJrHvWj27FyYmFtlNzCAC9IF1vERym2/2E4qPc/ctFzuw/IF9LDbsFJBVYKgtMBh
 EidQ6WxQrMcY67kP7Oq2pUSHSzgh+avv+jTPbzbUMYeML6jyMtcWj9e/Ub54kD3j+8
 Zgvde3WCYXV7+qFpCJfJYneuLc/X/XjrJO4VIqAu6AmUL0ZWO9/DOc3Y2Ifx9kyqeg
 yRFlHrjqXoqBHxxODj6cSWmmnT8Db5HR7q9tJJHOI5QgSLiMXAu+59KvuAK9mSsW5q
 hBi3uA9cQ1ZAdEgNpa+QcKFIYrUx1HcbaiH/gDutgOcbJZvUUDaKdtdUTmZ7Rh9lAk
 Uu5h/zAnI2Ziw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4TmPpS1gQQz4wc6;
 Fri,  1 Mar 2024 21:44:00 +1100 (AEDT)
Date: Fri, 1 Mar 2024 21:43:58 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: David Gow <davidgow@google.com>
Cc: Shuah Khan <skhan@linuxfoundation.org>, Brendan Higgins
 <brendanhiggins@google.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Intel
 Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, Matthew Auld <matthew.auld@intel.com>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the kunit-next tree
Message-ID: <20240301214358.7fdecd66@canb.auug.org.au>
In-Reply-To: <CABVgOSmAmkOcY8hFnpPSgz5WZXFkez_BDGhKjBepbWFpKykfUg@mail.gmail.com>
References: <20240229152653.09ecf771@canb.auug.org.au>
 <be2e812c-3898-4be8-8a9d-e221acb837c3@linuxfoundation.org>
 <CABVgOSmAmkOcY8hFnpPSgz5WZXFkez_BDGhKjBepbWFpKykfUg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+X+ZUG0wlkgfO96g6gv/m6o";
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

--Sig_/+X+ZUG0wlkgfO96g6gv/m6o
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 1 Mar 2024 15:15:02 +0800 David Gow <davidgow@google.com> wrote:
>
> On Thu, 29 Feb 2024 at 23:07, Shuah Khan <skhan@linuxfoundation.org> wrot=
e:
> >
> > I can carry the fix through kselftest kunit if it works
> > for all. =20
>=20
> I'm happy for this to go in with the KUnit changes if that's the best
> way to keep all of the printk formatting fixes together.

I am pretty sure that the proper fix has been applied to the drm-fixes
tree today (in the merge of the drm-misc-fixes tree).

--=20
Cheers,
Stephen Rothwell

--Sig_/+X+ZUG0wlkgfO96g6gv/m6o
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmXhsW4ACgkQAVBC80lX
0Gz+Bwf/X7n+m/wDZxSYLCDkltJK1RqNF4UBMU+iiqKNsABv/hmcAecGfGZlCunX
9ASSYnaS1Mor0rsVyFmPxZwaGGcTIFhjc4NU97YDUh83F5U/CX5Sr8d4o3eHDWws
y/4xmpH/1eEmvqdUJWu4xb9srmcZg1obZCQ6ZtlwMfgvTt03sTBDmp8PZk2rpKOy
hnSJ1PSatQX+ABzWA5wWhDHtId3NYgZ5eLwyeCWx8DAQ+sTREXNvToHz18+ZEA9c
EIemv6cZivH8WiauOLqmh8ED1MKApeQUenHf46aLzxBGK6EwNFZXaxIMrHDC07nN
l41OgA40LcOAR0Kve6FwmRoeSXwKyQ==
=jdxI
-----END PGP SIGNATURE-----

--Sig_/+X+ZUG0wlkgfO96g6gv/m6o--
