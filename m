Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6636F3FE741
	for <lists+dri-devel@lfdr.de>; Thu,  2 Sep 2021 03:44:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE0A06E408;
	Thu,  2 Sep 2021 01:44:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 598376E408
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Sep 2021 01:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1630547048;
 bh=NuRwbu7de8byElVZzBMKg3pNIEyi41fKQhrIZwjdqVk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=uyHBypnb12dseI+aFeaWaE+vjczLuqQy5MeZhpdnt2ExpcTDdaeirxgGKMtWlanL4
 T+/62rKzZbnLubrPd6lShqGvnIOhPelMtNEAUlIPo9v+9SvYiXx8t5P8o+2UIfAMu2
 ZbIGKV7jR2lFwXZwkd6f60BT2s7zrBOGD8i9w8ft7On6EbrygtrBaWUzKUltKLCx7+
 UnN0L6cSK6LVDMSwb2UAy3SstHZnvNLOA9kZpqyLp3tUdtr2creDIhDUd6xVibWy7R
 oPU4/AF19W/qxwT9oOwn6Amg2x8xUetVRoAFcskyuPZw9TlzzArAJoMnGAh+ZhKPgw
 BUeRO6BYPRQOQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4H0Nxy1KFvz9sCD;
 Thu,  2 Sep 2021 11:44:05 +1000 (AEST)
Date: Thu, 2 Sep 2021 11:44:05 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, ARM
 <linux-arm-kernel@lists.infradead.org>
Cc: Mark Brown <broonie@kernel.org>, Dave Airlie <airlied@linux.ie>, DRI
 <dri-devel@lists.freedesktop.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>, John Stultz
 <john.stultz@linaro.org>
Subject: Re: linux-next: manual merge of the drm tree with the qcom/for-next
 tree
Message-ID: <20210902114346.430e7ba2@elm.ozlabs.ibm.com>
In-Reply-To: <20210726163814.6483-1-broonie@kernel.org>
References: <20210726163814.6483-1-broonie@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Q5w3+hlLAetVcLJKtBO9Vme";
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

--Sig_/Q5w3+hlLAetVcLJKtBO9Vme
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 26 Jul 2021 17:38:14 +0100 Mark Brown <broonie@kernel.org> wrote:
>=20
> Today's linux-next merge of the drm tree got a conflict in:
>=20
>   drivers/firmware/Makefile
>=20
> between commit:
>=20
>   b42000e4b874 ("firmware: qcom_scm: Allow qcom_scm driver to be loadable=
 as a permenent module")
>=20
> from the qcom/for-next tree and commits:
>=20
>   8633ef82f101 ("drivers/firmware: consolidate EFI framebuffer setup for =
all arches")
>   d391c5827107 ("drivers/firmware: move x86 Generic System Framebuffers s=
upport")
>=20
> from the drm tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> diff --git a/drivers/firmware/Makefile b/drivers/firmware/Makefile
> index 3c2af2e98def..5ced0673d94b 100644
> --- a/drivers/firmware/Makefile
> +++ b/drivers/firmware/Makefile
> @@ -19,6 +19,8 @@ obj-$(CONFIG_RASPBERRYPI_FIRMWARE) +=3D raspberrypi.o
>  obj-$(CONFIG_FW_CFG_SYSFS)	+=3D qemu_fw_cfg.o
>  obj-$(CONFIG_QCOM_SCM)		+=3D qcom-scm.o
>  qcom-scm-objs +=3D qcom_scm.o qcom_scm-smc.o qcom_scm-legacy.o
> +obj-$(CONFIG_SYSFB)		+=3D sysfb.o
> +obj-$(CONFIG_SYSFB_SIMPLEFB)	+=3D sysfb_simplefb.o
>  obj-$(CONFIG_TI_SCI_PROTOCOL)	+=3D ti_sci.o
>  obj-$(CONFIG_TRUSTED_FOUNDATIONS) +=3D trusted_foundations.o
>  obj-$(CONFIG_TURRIS_MOX_RWTM)	+=3D turris-mox-rwtm.o

This is now a conflict between the arm-soc tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/Q5w3+hlLAetVcLJKtBO9Vme
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmEwLGUACgkQAVBC80lX
0GxsNAf9HtMmr/YzsLeSPdGg3EE57M4qQCg9drEy1J/d2jc0kz4XT+n/frtOWJeh
33CLNmuUsolbWf40TRAeBAf8dl+16LS82KSoNNqo1W1n0A5bk5glJKWp3vKsh8KJ
ottOVtMGeZK2SF6Xk2VO0dV2J+yzU/I/tQYcbjrmVlpUkX8XInkf7vsX+N4m4lc1
ZoiQzM5YE6ZdhbuMveMpFQYjqfDNDQbjX168WNqbhtPAsvdds+exbc3hlZ0A8pMq
AVt3gb/uk5b1XrOGlnlOqEoRlimUKzbDQamOVRHLPRkkbPvNGVx/WR6t2eAAyMEj
nvqf8fJfF32GHVUcrIbnIGPaLP6Z6g==
=zodR
-----END PGP SIGNATURE-----

--Sig_/Q5w3+hlLAetVcLJKtBO9Vme--
