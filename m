Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB0F2EEADF
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jan 2021 02:25:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C49BF6E5BD;
	Fri,  8 Jan 2021 01:25:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C093F6E5BD;
 Fri,  8 Jan 2021 01:25:45 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4DBlm56rYNz9sRR;
 Fri,  8 Jan 2021 12:25:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1610069143;
 bh=ABTHMIc4R0Kwf7yGnAmGvgl/NcOc9dGiP5Xyj02DzsE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ot8h6L6ULexS+HiSagRc+G5duAqtlnHlVFwjn5velbqwKZTNx0ECFENAd53d9MewK
 vKoD4B86XkSCEPNwb2eC0ED8jgaTH8apqdkBBr6MnOXvHD7fZ+MJ/SjUyQtniM55vm
 I3ad7aNjkfHT4Agf/TG0aFQJGHYHPXhoWLFd3lZM5dreuPpqU2U51VYVRNYjUTqNX7
 yWJqiuUF+xqc+a8dh+czAWUpew5AFXin5lksI5OI0z0r8fRQDflkqBbMlvALi54cyM
 /ei3kH6CZXZtwOEmiIo4LFwRcSClWpuIJxZjp6fbZK7eWTGC4dN403eEa8zK0oz4VV
 Zj9r67lvZIMYg==
Date: Fri, 8 Jan 2021 12:25:40 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>
Subject: Re: linux-next: build failure after merge of the drm tree
Message-ID: <20210108122540.657501b2@canb.auug.org.au>
In-Reply-To: <20210108115518.2b3fdf58@canb.auug.org.au>
References: <20210108115518.2b3fdf58@canb.auug.org.au>
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
Cc: Dave Airlie <airlied@linux.ie>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: multipart/mixed; boundary="===============0099112359=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0099112359==
Content-Type: multipart/signed; boundary="Sig_/S/gy4U=EE40dCLQCVBFtyDN";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/S/gy4U=EE40dCLQCVBFtyDN
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 8 Jan 2021 11:55:18 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Hi all,
>=20
> After merging the drm tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
>=20
> error: the following would cause module name conflict:
>   drivers/video/fbdev/omap2/omapfb/displays/panel-dsi-cm.ko
>   drivers/gpu/drm/panel/panel-dsi-cm.ko
>=20
> Maybe caused by commit
>=20
>   cf64148abcfd ("drm/panel: Move OMAP's DSI command mode panel driver")
>=20
> I have used the drm tree from next-20210107 for today.

This has affected the drm-misc tree as well (since it merged in the drm
tree).

I have used the drm-misc tree from next-20210107 for today.
--=20
Cheers,
Stephen Rothwell

--Sig_/S/gy4U=EE40dCLQCVBFtyDN
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/3tJUACgkQAVBC80lX
0GxC3gf/cT3tsaL/DIHXdAi/gnaxWdmBLyRBRvGTGqsqCI7pl2OFZg50HPMB3MYJ
UsA0ZXF70tiSJmxcrmMzTqEWQB/3ybcYe3w7ozTzcFlYcaskRI9Trnq+JTYBfHwD
yGY6Qb/t3zHpQqE/7TV/V2YGXXIRG7FI8IrSEFKWXJyyRf224mSyIrFC+iF9HBFH
J3dJRURZEL7n0IrTzqiFcwUuUesiLVhH8WhUzZrG8pp5mwBtBSeRnl9Rm1Mv6DSz
6TCvc7jZmQLQMCRwN6D4uanfjyDKrkDfXYWQGqtr/gCygm59OGq8sEopAQbWLOSd
l/1yb7ce0PqDbsig+g2IIGg06sf+nQ==
=DWQs
-----END PGP SIGNATURE-----

--Sig_/S/gy4U=EE40dCLQCVBFtyDN--

--===============0099112359==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0099112359==--
