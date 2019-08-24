Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F27699BB88
	for <lists+dri-devel@lfdr.de>; Sat, 24 Aug 2019 05:53:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13A286E081;
	Sat, 24 Aug 2019 03:53:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6E1D6E081
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Aug 2019 03:53:13 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 46FkrN3RRnz9sDB;
 Sat, 24 Aug 2019 13:53:08 +1000 (AEST)
Date: Sat, 24 Aug 2019 13:53:00 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alexandre Courbot <acourbot@chromium.org>
Subject: Re: next/master build: 218 builds: 4 failed, 214 passed, 10 errors,
 786 warnings (next-20190823)
Message-ID: <20190824135300.23a5fcb4@canb.auug.org.au>
In-Reply-To: <5d607e27.1c69fb81.eb9af.1e5c@mx.google.com>
References: <5d607e27.1c69fb81.eb9af.1e5c@mx.google.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=canb.auug.org.au; s=201702; t=1566618790;
 bh=FEIZf4rOzlkEzQCJVORZlo0oASAXUKoy7ZB+pkJCCPo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=tgdR+wySLNG+AtDiEEFSJLA8wCUXbeJ/JCqr32eucKkzg03bav2GEEeqaiypbcvWF
 25O0I0sc5H2PAJd0GoJTP7eIT75+/FxXblHtLFW7+/hj6hntjyoSj9OGRanh8/2p8r
 1XlbfxlBQkzUqWXhiiTUPIc4PcyeD3rNWZynjBnHF/BSTE8lbxBojEVFi5yfRmP+JL
 A36TYIBpNoxQXOaIsYcwvSp5akhJgwKUuZjOYR3F2N0fp+ANydsPhp/vIlFTF7KRGz
 pXsf7kXj6rO7a6n2pY5XdxOMbox35Xo3ksACSXSYsSHfsw0kgJ072Gs63O3X22814P
 DwnBmuYxp2QiQ==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Dave Airlie <airlied@linux.ie>, linux-next@vger.kernel.org,
 DRI <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0939178778=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0939178778==
Content-Type: multipart/signed; boundary="Sig_/ZGFilMq2=J+G.Tj1sllVQex";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/ZGFilMq2=J+G.Tj1sllVQex
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 23 Aug 2019 17:00:39 -0700 (PDT) "kernelci.org bot" <bot@kernelci.o=
rg> wrote:
>
>     2    drivers/gpu/drm/mediatek/mtk_drm_drv.c:291:8: error: implicit de=
claration of function 'dma_set_max_seg_size'; did you mean 'drm_rect_adjust=
_size'? [-Werror=3Dimplicit-function-declaration]
>     2    drivers/gpu/drm/mediatek/mtk_drm_drv.c:291:52: error: implicit d=
eclaration of function 'DMA_BIT_MASK'; did you mean 'BIT_MASK'? [-Werror=3D=
implicit-function-declaration]
>     1    drivers/gpu/drm/mediatek/mtk_drm_drv.c:291:8: error: this functi=
on declaration is not a prototype [-Werror,-Wstrict-prototypes]
>     1    drivers/gpu/drm/mediatek/mtk_drm_drv.c:291:8: error: implicit de=
claration of function 'dma_set_max_seg_size' [-Werror,-Wimplicit-function-d=
eclaration]
>     1    drivers/gpu/drm/mediatek/mtk_drm_drv.c:291:52: error: this funct=
ion declaration is not a prototype [-Werror,-Wstrict-prototypes]
>     1    drivers/gpu/drm/mediatek/mtk_drm_drv.c:291:52: error: implicit d=
eclaration of function 'DMA_BIT_MASK' [-Werror,-Wimplicit-function-declarat=
ion]

Caused by commit

  070955558e82 ("drm/mediatek: set DMA max segment size")

(from the drm-fixes tree) which should have included linux/dma-mapping.h

--=20
Cheers,
Stephen Rothwell

--Sig_/ZGFilMq2=J+G.Tj1sllVQex
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1gtJwACgkQAVBC80lX
0Gzqqwf/b3WboB44becOBeXRfwMN/2ci/IvSzKiFvSDQRMryn+yIU+e/Ug8m1cWC
So/4wb0BXEbPbxfU5CT6mtbM+U9dLdfExwx0+qZXTRMaxRNMjXk4CmByl/E8HcXZ
IVRi8ZM4SscrGPK8A05REFAJ1E9eKialgX9HtR8ydAmefNEsx9jpv3KdXnWNKa2L
3uLks1mxQYrcWg22a3hRMLz4KMAythq0vJydLy1576706cRMvTAeazQKaBhSVGRe
Wwb4vXPNxKqwPKhF+SZ0ZFW7XJhpX7qP4NQ7AOKRaxAGgpTVE13VSeqlvCJV8nf5
mFKJMCHjw/sDNVSjFQI2ao9D8jKyrA==
=74YK
-----END PGP SIGNATURE-----

--Sig_/ZGFilMq2=J+G.Tj1sllVQex--

--===============0939178778==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0939178778==--
