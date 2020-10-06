Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 148E92844DB
	for <lists+dri-devel@lfdr.de>; Tue,  6 Oct 2020 06:31:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B35D76E30C;
	Tue,  6 Oct 2020 04:31:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B72E06E30C
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Oct 2020 04:31:04 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4C54KH0vNDz9sS8;
 Tue,  6 Oct 2020 15:30:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1601958661;
 bh=n5g/8VmjM6MX7tsHQua98aEInXP4LOcxwGMFE4CgV6c=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=eTJXuTfVcg6haKx7VjmfiW0OlAB5OlXPvB6lmst090D8iGoV+2TUCntxMVW7Rb2Kz
 s4NsQHQwHbYO0K7cs0YNk5A27WoZa7BKKzq42FX93XtgW7crDLe8JbptXv+mV83kvr
 uiwpZbvqDFxOfPPWEgletecAj8jIanhPVYbQQXBtiCGTJ3wci1hXm8YnPn2kz7lr3Q
 526nzB4/NnecA7IFu7SHKK/b0DFdFMFohI7aAr8F/ip52sp5IiG1vJS0E0XJQGxufL
 3ajD58RlkWlv5AaDDugh1lal47YFGfUGRlz96OjOR/yr716j1/c9LLcFsAEViiIMP+
 o7z2bvx+AuBLw==
Date: Tue, 6 Oct 2020 15:30:57 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH] Revert "gpu/drm: ingenic: Add option to mmap GEM
 buffers   cached"
Message-ID: <20201006153057.39baeedb@canb.auug.org.au>
In-Reply-To: <20201005230150.5637fa42@canb.auug.org.au>
References: <20200930165212.GA8833@lst.de>
 <20201004141758.1013317-1-paul@crapouillou.net>
 <20201004195921.GA556605@ravnborg.org>
 <ZE1PHQ.WGCBAFO9R38I3@crapouillou.net>
 <20201005230150.5637fa42@canb.auug.org.au>
MIME-Version: 1.0
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
Cc: od@zcrc.me, Dave Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, Christoph Hellwig <hch@lst.de>
Content-Type: multipart/mixed; boundary="===============1774107969=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1774107969==
Content-Type: multipart/signed; boundary="Sig_/o0ob=B9XXO9RERmdPqVSMfF";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/o0ob=B9XXO9RERmdPqVSMfF
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 5 Oct 2020 23:01:50 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> On Sun, 04 Oct 2020 22:11:23 +0200 Paul Cercueil <paul@crapouillou.net> w=
rote:
> >
> > Pushed to drm-misc-next with the changelog fix, thanks.
> >=20
> > Stephen:
> > Now it should build fine again. Could you remove the BROKEN flag? =20
>=20
> Thanks for letting me know, but the fix has not appeared in any drm
> tree included in linux-next yet ...
>=20
> If it doesn't show up by the time I will merge the drm tree tomorrow, I
> will apply this revert patch myself (instead of the patch marking the
> driver BROKEN).

Unfortunately, the revert patch does not apply to the drm tree merge,
so I have just marked the driver BROKEN again today.
--=20
Cheers,
Stephen Rothwell

--Sig_/o0ob=B9XXO9RERmdPqVSMfF
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl978wEACgkQAVBC80lX
0Gy3kgf8CLWGQCMOPLy2gQCli86MZWSpicvk4sSiGQTGkHYZcfUK6fQGhZkkhIqA
1B1V33q0Pp7/u9tp7XD2Wt62UeiWNA/GTk8crZMHbAp8Bf2qEcRo+2g7/liHq1WU
goX7M3iois0cb3+fir54o89QSwEIqi7tVZ1HwQUbR2HeJ9csbHaymx3TXdLy7zxU
hsriysf5Zk6YfjBzap1xMZSUjioBq1jUXhN/r/grXi/NpmgfT/0ysQAwu+7jUuG3
+AzzhTGciRHxavQur/+14dPgI09KjvHL4t2wxldnGC3TLyH2SZLfhPJNsWxVrclx
raN7plyI723XwVZXhAmWIyOEg/he6A==
=JUJe
-----END PGP SIGNATURE-----

--Sig_/o0ob=B9XXO9RERmdPqVSMfF--

--===============1774107969==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1774107969==--
