Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD86B43E3
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2019 00:19:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3102B6EA97;
	Mon, 16 Sep 2019 22:18:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EBA76EA97
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Sep 2019 22:18:57 +0000 (UTC)
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1i9zKf-0005rw-6I; Mon, 16 Sep 2019 22:18:53 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 4D5582741A12; Mon, 16 Sep 2019 23:18:52 +0100 (BST)
Date: Mon, 16 Sep 2019 23:18:52 +0100
From: Mark Brown <broonie@kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: linux-next: manual merge of the drm tree with the kbuild tree
Message-ID: <20190916221852.GN4352@sirena.co.uk>
References: <20190915214748.GJ4352@sirena.co.uk>
 <CAKwvOdkZ9_qp9V=H6tjpLyscct+g-aPqn-dPj8R+CGF4Rt_-Rw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAKwvOdkZ9_qp9V=H6tjpLyscct+g-aPqn-dPj8R+CGF4Rt_-Rw@mail.gmail.com>
X-Cookie: Man and wife make one fool.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LoptWHwpijT7MWtOlC9PckiSoFJqym7PhES1gwSMA20=; b=g3aCrtWnX6AbTSRElvNW1u7R3
 OIVCWt57T7dH5LwPrSvYhxiLG/qFGQgE1W9EE1PUPw38kVaHTiWGLXTaC345rRsY8xRQFeNT+XTo/
 53CXypLZpGGF696TwSO5wx+syljydzYvAz5pA8FPyWdNNVSRqb079bUMjCHH2V3h0tcAo=;
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
Cc: Xinpeng Liu <danielliu861@gmail.com>, Leo Li <sunpeng.li@amd.com>,
 Dave Airlie <airlied@linux.ie>, Roman Li <Roman.Li@amd.com>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Sedat Dilek <sedat.dilek@gmail.com>,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>,
 Alex Deucher <alexander.deucher@amd.com>, Jun Lei <Jun.Lei@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Content-Type: multipart/mixed; boundary="===============1745117381=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1745117381==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xhJxprRH8Q4al5cy"
Content-Disposition: inline


--xhJxprRH8Q4al5cy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 16, 2019 at 02:06:46PM -0700, Nick Desaulniers wrote:
> On Sun, Sep 15, 2019 at 2:47 PM Mark Brown <broonie@kernel.org> wrote:

> >   0f0727d971f6fdf ("drm/amd/display: readd -msse2 to prevent Clang from=
 emitting libcalls to undefined SW FP routines")

> ^ this patch is now broken due to the SHA above it.

Right, all the sites that didn't conflict are broken.  Like I say I
think there needs to be some coordination with the Kbuild changes here.

> b/drivers/gpu/drm/amd/display/dc/dcn20/Makefile
> index 2b399cfa72e6..ddb8d5649e79 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn20/Makefile
> +++ b/drivers/gpu/drm/amd/display/dc/dcn20/Makefile
> @@ -19,7 +19,7 @@ endif
>  CFLAGS_$(AMDDALPATH)/dc/dcn20/dcn20_resource.o :=3D -mhard-float -msse
> $(cc_stack_align)

I can't do anything with patches without signoffs so I'm not going to
apply this as a workaround.

> > + ifdef CONFIG_DRM_AMD_DC_DCN2_1
> >  -CFLAGS_display_mode_vba_21.o :=3D $(dml_ccflags)
> >  -CFLAGS_display_rq_dlg_calc_21.o :=3D $(dml_ccflags)
> >  -endif
>=20
> ^ this endif should not be removed.

There's an endif left there?  Someone sent a patch, I'm going to apply
that.

--xhJxprRH8Q4al5cy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2ACksACgkQJNaLcl1U
h9DgwAf/Xz3C2AwblpHXUfgFr/B5z7uRUFylQhXku4Hsp+7VOtSdSeK7ww8Iff7G
aWROHIYOXKHunNlrmT95MPOEgfcPHNfPf4HGQCRP2lpT2pzQ7esSx7E8UUnnI+7A
fTTutRidlQWwM1BpBJZOOXlN4dOzmyrJ/vsx/H3fpEtaYKTD+veCDdIXpF4i8aN+
nw+LIaWQSYMgLidrok4kTQcGXZokWMYpz+5CNXtxjfV9j9UpSI1/6WucGMps9ER1
3CFlE7xaH5R7DKJD9DBEzVNMbcX6QaCFoyLG4Qhxyn92pQXIfqhekI7IQ2iyilTr
j1cEYeM1KP40iCJRtqjwnEP6OSmIUg==
=icNP
-----END PGP SIGNATURE-----

--xhJxprRH8Q4al5cy--

--===============1745117381==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1745117381==--
