Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EDC357555A
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jul 2022 20:50:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BEC410FA38;
	Thu, 14 Jul 2022 18:50:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17ABC10F968;
 Thu, 14 Jul 2022 18:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TYlDZx+WMQ2Fx8iFZoO5UknB1+81QzVI4tZ54OqH58k=; b=puEtYIWdypVwBhbKu3pmAC9UMH
 J/iCviKOp0aaqjxynhgpcOaw2BE5Gq67py4LCB97G7SCUrAWS6BalCEjgOAd3vIJdoYj6JWgy8oIm
 12LYo133KAx+b2kNo+h7iB+jbNfgItc4tteyFGlRAzdWkYLYQfle5DG1shcU4Vd9+oFdW2ZJMqLPb
 YEtXtbQSHe5GaItlTnF1/T+8E7SP13xg2j3i1WO1TAk5pw5mC4LFZJx33xY9jvivxscqGWnMZNj1B
 BRZuzYL9GAv+2La57OKHgwpVSOscSHZeA469rC9yVCiASqGhNQnn/2LMS5+aoTBZmsWU+aaRDBfLb
 V2DoMRMw==;
Received: from [165.90.126.25] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1oC3uc-00Gjga-IF; Thu, 14 Jul 2022 20:50:10 +0200
Date: Thu, 14 Jul 2022 17:49:19 -0100
From: Melissa Wen <mwen@igalia.com>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH] drm/amd/display: Add missing hard-float compile flags
 for PPC64 builds
Message-ID: <20220714184919.rmsexizgfdkfboiq@mail.igalia.com>
References: <20220618232737.2036722-1-linux@roeck-us.net>
 <584fc348-7a60-26a2-af61-9edc4f4830e4@amd.com>
 <CADnq5_NkVWqcxwLMBeskqpcSEYCEjUAK0hqvA_PAo7ACHKL2cA@mail.gmail.com>
 <6a026c9a-c4ee-deba-e028-4c0f478c1911@roeck-us.net>
 <CADnq5_OrxMMkazXEPHeZXp_bV890=r21DRx2QsqLXUFj4t8aYg@mail.gmail.com>
 <20220713230917.GE32544@roeck-us.net>
 <CADnq5_PAg8xg2J3WUfjxK_-WFaLOK7cQd6bqWDnfVqE6fpXq2Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="kcyojzyxobcaybeg"
Content-Disposition: inline
In-Reply-To: <CADnq5_PAg8xg2J3WUfjxK_-WFaLOK7cQd6bqWDnfVqE6fpXq2Q@mail.gmail.com>
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
Cc: Leo Li <sunpeng.li@amd.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Rodrigo Siqueira Jordao <Rodrigo.Siqueira@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Guenter Roeck <linux@roeck-us.net>, Daniel Axtens <dja@axtens.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--kcyojzyxobcaybeg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

O 07/13, Alex Deucher wrote:
> On Wed, Jul 13, 2022 at 7:09 PM Guenter Roeck <linux@roeck-us.net> wrote:
> >
> > On Wed, Jul 13, 2022 at 05:20:40PM -0400, Alex Deucher wrote:
> > > >
> > > > The problem is not the FPU operations, but the fact that soft-float
> > > > and hard-float compiled code is linked together. The soft-float and
> > > > hard-float ABIs on powerpc are not compatible, so one ends up with
> > > > an object file which is partially soft-float and partially hard-flo=
at
> > > > compiled and thus uses different ABIs. That can only create chaos,
> > > > so the linker complains about it.
> > >
> > > I get that, I just don't see why only DCN 3.1.x files have this
> > > problem.  The DCN 2.x files should as well.
> > >
> >
> > Seen in drivers/gpu/drm/amd/display/dc/clk_mgr/Makefile:
> >
> > # prevent build errors regarding soft-float vs hard-float FP ABI tags
> > # this code is currently unused on ppc64, as it applies to Renoir APUs =
only
> > ifdef CONFIG_PPC64
> > CFLAGS_$(AMDDALPATH)/dc/clk_mgr/dcn21/rn_clk_mgr.o :=3D $(call cc-optio=
n,-mno-gnu-attribute)
> > endif
> >
> > Does that explain it ?
>=20
> I would expect to see it in dcn20_resource.c and dcn30_clk_mgr.c for
> example.  They follow the same pattern as the dcn 3.1.x files.  They
> call functions that use FP, but maybe there is some FP code still in
> those functions that we missed somehow.

Hi,

I'm a little late here, but I'm not able to reproduce the issue yet.
I have this setup:
- gcc 11.3.0
- binutils 2.38.50
- mainline kernel (torvalds) version: 5.19.0-rc6 (cross-compiling)
  -> make ARCH=3Dpowerpc CROSS_COMPILE=3Dpowerpc64-linux-gnu- allmodconfig
    =3D> DRM_AMD_DC [=3Dy] && HAS_IOMEM [=3Dy] && DRM [=3Dm] && DRM_AMDGPU =
[=3Dm] && (X86 || PPC64 [=3Dy]) && (!KCOV_INSTRUMENT_ALL [=3Dn] || !KCOV_EN=
ABLE_COMPARISONS [=3Dn])
  -> make -j16 ARCH=3Dpowerpc CROSS_COMPILE=3Dpowerpc64-linux-gnu-

Am I missing something?

So, as Alex mentioned the possibility of some non-isolated FPU code in
3.1, I reviewed dcn31 code and my best bet so far is that the issue
is here:

https://github.com/torvalds/linux/blob/master/drivers/gpu/drm/amd/display/d=
c/dcn31/dcn31_resource.c#L1721

Although dcn31_update_soc_for_wm_a() is only called inside
dml/dcn31/dcn31_fpu:
- dc->res_pool->funcs->update_soc_for_wm_a(dc, context);

it's declared in dcn31_resource and has FPU code. So, we should move it
to dml/dcn31/dcn31_fpu.

However, as I can't reproduce the issue, I don't know if it addresses
the problem reported here and also if everything will be clean after
moving it.=20

Guenter,

Can you provide more info about your setup: cross-compile or not, any
flags, branch, etc?

Best Regards,

Melissa

>=20
> Alex

--kcyojzyxobcaybeg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmLQZSIACgkQwqF3j0dL
ehy0EBAAuqy8y2vEfwK96pRSCkRaiIJysUL1pz3QvqTUxRi4SWqhSzgxH/QbOVvp
fSswoGmER38+EDnU4JsG/0QsX52NXolK5NUbFtOdDv0ZXu/AWWSStDepVSqaA1qx
hgdImJgMJP3hfah671LqDIQHHF1PSpFfS3bH379tsn/IncbHCYXFAX8BstQ3m5ai
46nb41H++F+uTpIL5qADSDhIQfg1+TZqxYcEkWG4BbR9oURlxS5+0Vx4fh2YYEO7
vEOxARtCR3+rKzz5OnSlw35uaNKf+GTM1IkVvaVUP33Ec0kicmW9feU74JMGmsgO
4ib8CLFxngfTma/WFybfyItM3dBcX2YutvZSy3L5AefCmN8gjJJUjuwC8viD0Apr
ZM1MUIoRiWUwR4fo9V2yc6qa1EWJqzAkBDugH3+5tlqaM+s6tKpMQUqejyZfsCoa
pz3qqh+2JALcDE9CSsy+0aOIT3wmNxUA+CWjmQNGWMGAbbkgFay9LeAwIJIz/Gc3
68bJuWa/gT8Vq2vBxToCE3ZcBIltvPF2u09UwKgLxx7j5ym/GVm/CYLGe9E8p/yv
sB2R/OHnaPG3bXyDEPeXGIe8aqmuwcUMJtrPPs1zL7JUm09nRYHa4d0a0NIlODOY
kCI20wnz/M/0Zt8+fF4tBO5C7ipy9Rgr59Z3zDz+oxSNm1RvKS8=
=T3zC
-----END PGP SIGNATURE-----

--kcyojzyxobcaybeg--
