Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7912E2958C
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2019 12:16:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BB986E0DC;
	Fri, 24 May 2019 10:16:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E8AC6E0DC
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2019 10:16:23 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 459Mhz2bNDz9s6w;
 Fri, 24 May 2019 20:16:17 +1000 (AEST)
Date: Fri, 24 May 2019 20:15:48 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: linux-next: build failure after merge of the drm-fixes tree
Message-ID: <20190524201548.2e8594a2@canb.auug.org.au>
In-Reply-To: <CAKMK7uGSfOev71DKF+ygRjU0rMWcrW3rL7-=Xhbwdm9STUWntQ@mail.gmail.com>
References: <20190524082926.6e1a7d8f@canb.auug.org.au>
 <CAKMK7uGSfOev71DKF+ygRjU0rMWcrW3rL7-=Xhbwdm9STUWntQ@mail.gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=canb.auug.org.au; s=201702; t=1558692980;
 bh=0rbLBe4DdXQuMQ0keJlprRSqPbxjvidcL65fCqgV3II=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=NIIGNOJk3RwLRRRKCgyIiwXb0cNwpe5QczHWAsRHYPgdA+O5KXtVkxEucoYJN05kI
 zz9xVO1WmQ+2cE65XbVhQrlb/aYHBZs+Xi9Xv23HwLyK8Oo50WRKjR4xBlvTNc6nAR
 N4zo+koEd+4V2p/oCIxaneet5aNtlqZw2L6dnahMp877VWZZ8YxbJYtGvMq/GCuIcB
 04y0wkAUEizF3VxxY4woUoV3lRXh/GXRYX3qDedd36dqfCLFddGDXBRJ48b8fovpRD
 DQ7DgYKpZOnrq+6/TC1NSKPtWyHOuCvWMlWrNB4U+r7PU3vFti/TbM2wNDPNxtsIHz
 MWQZzliC2nHag==
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
Cc: Dave Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: multipart/mixed; boundary="===============1891475267=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1891475267==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/rSQC7uUY/cTRnE+r_IeEC2W"; protocol="application/pgp-signature"

--Sig_/rSQC7uUY/cTRnE+r_IeEC2W
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

On Fri, 24 May 2019 10:09:28 +0200 Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Fri, May 24, 2019 at 12:29 AM Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
> >
> > After merging the drm-fixes tree, today's linux-next build (x86_64
> > allmodconfig) failed like this:
> >
> > drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c: In functio=
n 'load_dmcu_fw':
> > drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:667:7: erro=
r: implicit declaration of function 'ASICREV_IS_PICASSO'; did you mean 'ASI=
CREV_IS_VEGA12_P'? [-Werror=3Dimplicit-function-declaration]
> >    if (ASICREV_IS_PICASSO(adev->external_rev_id))
> >        ^~~~~~~~~~~~~~~~~~
> >        ASICREV_IS_VEGA12_P
> >
> > Caused by commit
> >
> >   55143dc23ca4 ("drm/amd/display: Don't load DMCU for Raven 1")
> >
> > I have reverted that commit for today. =20
>=20
> Seems to compile fine here, and Dave just sent out the pull so I guess
> works for him too. What's your .config?

See above "x86_64 allmodconfig"

Looking at it closely now, I can't see how that error comes about.

Ah, in the drm-fixes tree, the definition of  is protected by

  #if defined(CONFIG_DRM_AMD_DC_DCN1_01)

which gets removed in the amdgpu tree (merged later).  So I can only
presume that CONFIG_DRM_AMD_DC_DCN1_01 was not set for the build I did.

config DRM_AMD_DC
        bool "AMD DC - Enable new display engine"
        default y
        select DRM_AMD_DC_DCN1_0 if X86 && !(KCOV_INSTRUMENT_ALL && KCOV_EN=
ABLE_
COMPARISONS)KCOV_INSTRUMENT_ALL && KCOV_ENABLE_COMPARISONS
        select DRM_AMD_DC_DCN1_01 if X86 && !(KCOV_INSTRUMENT_ALL && KCOV_E=
NABLE_COMPARISONS)

So maybe KCOV_INSTRUMENT_ALL && KCOV_ENABLE_COMPARISONS are set for
allmodconfig.  I no longer have the actual .config file any more, sorry.
--=20
Cheers,
Stephen Rothwell

--Sig_/rSQC7uUY/cTRnE+r_IeEC2W
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlznxFQACgkQAVBC80lX
0Gypwgf/STyYQBgEHIh//OujCBOU8bO67LU4z2tVmUbYrxl9cEokB6gPMzl8RtLv
frnLT2kR5tQQ3qgB4uXALZixuW0cttJE/RSagDVnSMApTsORyTYAQyAhlKUg+QNx
w8AQe5BvPCEEWwwuhFJBNo0Fm+ETu1AzgeAyrfEZtPA5/PElaBz/kA+BTIP1ABeU
hxHFc+q/Zyu2eyVIxQRBrpg+A8SzyIC5iZDaASjz/K9M++HQvVROmel0mUeiVlam
yfyjAd7aONCgmZNtbf02QVomIb9tHTdTre3tMIjiGfwsDkEGFoCDvMGX7aAZtfl3
0obMRQylr3KYFRTQ78iR9tPibMfNVA==
=rRUW
-----END PGP SIGNATURE-----

--Sig_/rSQC7uUY/cTRnE+r_IeEC2W--

--===============1891475267==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1891475267==--
