Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC11886EA8C
	for <lists+dri-devel@lfdr.de>; Fri,  1 Mar 2024 21:46:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58D5510E85D;
	Fri,  1 Mar 2024 20:46:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="rqDE+W0y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB83F10E85D;
 Fri,  1 Mar 2024 20:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1709326007;
 bh=oYSwxPgbH9v7ByGcfeqI5W61AWHOgbsQ3RsGAe8lHX0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=rqDE+W0yqzv2hRf6tR84f1c15tKHinaREl5sg+P4bDg4xrd1+E1xxKKYMkSB9sWQs
 A6zVR8jwGTbnCv1akO6QYwhgjuYsLp3K4hx0R65LJeBfwPH3jAMZ/4LcW8LALJbylW
 LE6dE63RjPTvLgmA2OX23doHrqg89c5Lh8v0oCNFpVIyQhCfV5nS0BVWXmCidNvjRg
 sSL+6dOtjdnMAwwvX58Rx1Pws+QeS//wCEKzyTF7C+3uQI1X21I+BMmVlj/Zyv1Jkz
 /upG4H85L4DPsNajPxYuMkvPaa5si/26gGvSv3FNuagOOR1stxbnYp580ZCr2360OT
 3PpBt9kupq4QQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Tmg9x68TRz4wc4;
 Sat,  2 Mar 2024 07:46:45 +1100 (AEDT)
Date: Sat, 2 Mar 2024 07:46:43 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: David Gow <davidgow@google.com>, Brendan Higgins
 <brendanhiggins@google.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Intel
 Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, Matthew Auld <matthew.auld@intel.com>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Dave Airlie <airlied@redhat.com>
Subject: Re: linux-next: build failure after merge of the kunit-next tree
Message-ID: <20240302074643.6e1086ff@canb.auug.org.au>
In-Reply-To: <86d87830-100f-4f29-bb7f-9a612b90866a@linuxfoundation.org>
References: <20240229152653.09ecf771@canb.auug.org.au>
 <be2e812c-3898-4be8-8a9d-e221acb837c3@linuxfoundation.org>
 <CABVgOSmAmkOcY8hFnpPSgz5WZXFkez_BDGhKjBepbWFpKykfUg@mail.gmail.com>
 <20240301214358.7fdecd66@canb.auug.org.au>
 <86d87830-100f-4f29-bb7f-9a612b90866a@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/hJtFnmksjMZBb0tNYJ8Tqwn";
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

--Sig_/hJtFnmksjMZBb0tNYJ8Tqwn
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Shuah,

On Fri, 1 Mar 2024 09:05:57 -0700 Shuah Khan <skhan@linuxfoundation.org> wr=
ote:
>
> On 3/1/24 03:43, Stephen Rothwell wrote:
> > Hi all,
> >=20
> > On Fri, 1 Mar 2024 15:15:02 +0800 David Gow <davidgow@google.com> wrote=
: =20
> >>
> >> On Thu, 29 Feb 2024 at 23:07, Shuah Khan <skhan@linuxfoundation.org> w=
rote: =20
> >>>
> >>> I can carry the fix through kselftest kunit if it works
> >>> for all. =20
> >>
> >> I'm happy for this to go in with the KUnit changes if that's the best
> >> way to keep all of the printk formatting fixes together.

Unfortunately you can't fix this in the kunit-next tree without pulling
in Linus' tree (or the drm-fixes tree) - which seems excessive.
 =20
> > I am pretty sure that the proper fix has been applied to the
> > drm-fixes tree today (in the merge of the drm-misc-fixes tree).
> >  =20
>=20
> What's the commit id for this fix? I Would like to include the details
> in my pull request to Linus.

My mistake, I misread the merge commit.  It has not been fixed in the
drm-misc-fixes tree or the drm-fixes tree (or Linus' tree since the
drm-fixes tree has been merged there) :-(

The problem in this case is not with the format string types, but with
a missing argument i.e. there is another argument required by the
format string.  It really should be fixed in the drm-misc-fixes tree
and sent to Linus post haste.

At least the change in the kunit-next tree will stop this happening in
the future.

--=20
Cheers,
Stephen Rothwell

--Sig_/hJtFnmksjMZBb0tNYJ8Tqwn
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmXiPrQACgkQAVBC80lX
0GxuJggAoL1GOk0uMpTgsgmCng4cTme2aI6B+7oHb45TTfcoKZxWTXGVhfRdELwU
jeg7AOe+qPKPgiSf8NtHTCLxISVCurIjDUr8l0xZpfvgRyt6uleC3WU3Tb8Fre88
luxtLQUGMFAEhVboYUsnNy/TyLQs2/qYdhv7nLcL7bfdd2uC0HEl8ErNpf0yqL2u
u2PC+3DYXwjXmgT7pbaSwmz7yY2nHuCZIUE2Bn0iDFQ8ObIAfJjeMG1NFKEF3TBn
7WWY8Z63JvsaIuK7k1uJzEPk1NmspzltnJHvaIMHpIYptrROK6iOqpXWqDmuxJ3+
XQI9vRpFLX3Xhm/lucKpII9/y8R7Lw==
=yARD
-----END PGP SIGNATURE-----

--Sig_/hJtFnmksjMZBb0tNYJ8Tqwn--
