Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D4C5F3B94
	for <lists+dri-devel@lfdr.de>; Tue,  4 Oct 2022 05:06:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F0E810E415;
	Tue,  4 Oct 2022 03:06:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CC7B10E412
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Oct 2022 03:06:05 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4MhMzG5dmtz4wgr;
 Tue,  4 Oct 2022 14:06:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1664852764;
 bh=KaoAdFRv76b7rRGW35lgp7SYKID3xoN5gkoVTMtSlRc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=LdhbgaLGFGjeJ9Paa6YlOKqyBJA7D/wyBWT0hd5TqpL9mE6SzbKU2RQPZ9izmMJ77
 R2kNrwnBbXVaW5z669jBZqbqS2ylhn6C3HroymogBFqiAWtu9EMN/oJ2Hv25fiVGQF
 VCF/GHqflkMJw7S6f7e5v6Mw1xT+DLSoSeUuN11QJ4bwObdWNftsAsQE6crioJgRSb
 Fr5IrYYHRfGSEjV961+uHB1NMzlrIR191UIrR+SOOrxb0CxLLnMgRVb1GIeNw6YyQ4
 F5v7V7ba/YzkauELSP1XGhrwl67SB42S5r89+xGZPvhiUkbRR1/KrdWwbDoMNDKNmc
 LHJTB+kGkP7Nw==
Date: Tue, 4 Oct 2022 14:05:58 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: David Airlie <airlied@redhat.com>
Subject: Re: linux-next: build failure after merge of the drm tree
Message-ID: <20221004140558.64f59f2c@canb.auug.org.au>
In-Reply-To: <CAMwc25oshRcJBoCT70B+b42bh5sPqgyoHuBx6K6ZLrwBMHnJzw@mail.gmail.com>
References: <20220930105434.111407-1-broonie@kernel.org>
 <20221004132047.435d42db@canb.auug.org.au>
 <CAMwc25oshRcJBoCT70B+b42bh5sPqgyoHuBx6K6ZLrwBMHnJzw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/zn3cNZXJ4akLAJ9548KNlKz";
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, broonie@kernel.org,
 Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/zn3cNZXJ4akLAJ9548KNlKz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Dave,

On Tue, 4 Oct 2022 12:24:37 +1000 David Airlie <airlied@redhat.com> wrote:
>
> On Tue, Oct 4, 2022 at 12:21 PM Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
> >
> > On Fri, 30 Sep 2022 11:54:34 +0100 broonie@kernel.org wrote: =20
> > >
> > > After merging the drm tree, today's linux-next build (x86_64
> > > allmodconfig) failed like this:
> > >
> > > /tmp/next/build/drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stre=
am.c: In function 'dc_stream_remove_writeback':
> > > /tmp/next/build/drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stre=
am.c:527:55: error: array subscript [0, 0] is outside array bounds of 'stru=
ct dc_writeback_info[1]' [-Werror=3Darray-bounds]
> > >   527 |     stream->writeback_info[j] =3D stream->writeback_info[i];
> > >       |                                 ~~~~~~~~~~~~~~~~~~~~~~^~~
> > > cc1: all warnings being treated as errors
> > >
> > > Caused by
> > >
> > >     5d8c3e836fc224 ("drm/amd/display: fix array-bounds error in dc_st=
ream_remove_writeback()")
> > >
> > > I have reverted that commit for today. =20
> >
> > I am still getting this failure.  The full error is:
> >
> > drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stream.c: In function =
'dc_stream_remove_writeback':
> > drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stream.c:527:83: error=
: array subscript [0, 0] is outside array bounds of 'struct dc_writeback_in=
fo[1]' [-Werror=3Darray-bounds]
> >   527 |                                 stream->writeback_info[j] =3D s=
tream->writeback_info[i];
> >       |                                                             ~~~=
~~~~~~~~~~~~~~~~~~~^~~
> > In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dc.h:126=
9,
> >                  from drivers/gpu/drm/amd/amdgpu/../display/dc/inc/core=
_types.h:29,
> >                  from drivers/gpu/drm/amd/amdgpu/../display/dc/basics/d=
c_common.h:29,
> >                  from drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_=
stream.c:27:
> > drivers/gpu/drm/amd/amdgpu/../display/dc/dc_stream.h:241:34: note: whil=
e referencing 'writeback_info'
> >   241 |         struct dc_writeback_info writeback_info[MAX_DWB_PIPES];
> >       |                                  ^~~~~~~~~~~~~~ =20
>=20
> I'm not seeing it here, what gcc is this with?

I am using an x86_64 cross compiler hosted on ppc64le - gcc v11.2.0 (on
Debian).

--=20
Cheers,
Stephen Rothwell

--Sig_/zn3cNZXJ4akLAJ9548KNlKz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmM7oxYACgkQAVBC80lX
0GxCgwgAirX4hMjmK8WlBWOZCmyEx6ZfWt3FpSnRNI5RuL5GOSP/n7YCwjV7W4D/
i9qtIOBy/d7DUc1wGOm0zzmVFxA7gTTVbDzVIR/HM8Ua+Z0VLsaX4HtNpqnRQKiH
7YCTkzet6ZS5IuryLx+TGtdPdNvx+3U6b/alD1451o1D+gQAfiSMHBqEx0JFTvBE
RMAAvce1RvIoKE2QMcjllgdUQOkHda2r0J2VChv6anK2WeLcfbGD0YFgvQP7B4P/
5A09YflWT4c5/aToSwPpRD2wxpgRand7UB9D/1ces+R0aF1zH1Bi0HfNIezgcm8M
qI1v4Xquw6YyBXKXfObTIj2bRyG/Rg==
=jndg
-----END PGP SIGNATURE-----

--Sig_/zn3cNZXJ4akLAJ9548KNlKz--
