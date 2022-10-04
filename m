Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9060F5F3B58
	for <lists+dri-devel@lfdr.de>; Tue,  4 Oct 2022 04:21:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05BF910E559;
	Tue,  4 Oct 2022 02:20:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25A5B10E559
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Oct 2022 02:20:54 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4MhLz46Mq9z4xDn;
 Tue,  4 Oct 2022 13:20:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1664850050;
 bh=V8QacDBhC5wIE+xliBe7paC2IAqaDLg7qOpUOCQUQzE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=L7aLRMh3EHi8Q1p4TudsSRaO9jEr7Jdbwjhw4iydClBznvULuCAMQQRgkP7zqbC05
 rwTmA+fOoALftvgwUMxkEHnzKJk5JrNWa/FPBFMVOHBJFN34NQjQuf5hfzFyDVtXT5
 xQIg9jH4UT8QSCL6tljhV44jvjr8F23J3mYOI9jYo4I3RVg+G6WYPxI/fVkn+5mAh8
 gFsaatYUFFasGk514c/X2rFDyAEz2xnA0SmnfaeVRacBshAWVb8GKqFcHCLVk5X8lT
 hX1klSvWuo3loa8uRY4McxrOP/TFrlG+hClE7oGBEJcO/GH7pgzhwcWI+ly3rD1tG9
 6KhSER5igDpDg==
Date: Tue, 4 Oct 2022 13:20:47 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>
Subject: Re: linux-next: build failure after merge of the drm tree
Message-ID: <20221004132047.435d42db@canb.auug.org.au>
In-Reply-To: <20220930105434.111407-1-broonie@kernel.org>
References: <20220930105434.111407-1-broonie@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/xVxdK89fd+s.RJjjuJPREX/";
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

--Sig_/xVxdK89fd+s.RJjjuJPREX/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi broonie@kernel.org,

On Fri, 30 Sep 2022 11:54:34 +0100 broonie@kernel.org wrote:
>
> After merging the drm tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>=20
> /tmp/next/build/drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stream.c=
: In function 'dc_stream_remove_writeback':
> /tmp/next/build/drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stream.c=
:527:55: error: array subscript [0, 0] is outside array bounds of 'struct d=
c_writeback_info[1]' [-Werror=3Darray-bounds]
>   527 |     stream->writeback_info[j] =3D stream->writeback_info[i];
>       |                                 ~~~~~~~~~~~~~~~~~~~~~~^~~
> cc1: all warnings being treated as errors
>=20
> Caused by
>=20
>     5d8c3e836fc224 ("drm/amd/display: fix array-bounds error in dc_stream=
_remove_writeback()")
>=20
> I have reverted that commit for today.

I am still getting this failure.  The full error is:

drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stream.c: In function 'dc_=
stream_remove_writeback':
drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stream.c:527:83: error: ar=
ray subscript [0, 0] is outside array bounds of 'struct dc_writeback_info[1=
]' [-Werror=3Darray-bounds]
  527 |                                 stream->writeback_info[j] =3D strea=
m->writeback_info[i];
      |                                                             ~~~~~~~=
~~~~~~~~~~~~~~~^~~
In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dc.h:1269,
                 from drivers/gpu/drm/amd/amdgpu/../display/dc/inc/core_typ=
es.h:29,
                 from drivers/gpu/drm/amd/amdgpu/../display/dc/basics/dc_co=
mmon.h:29,
                 from drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stre=
am.c:27:
drivers/gpu/drm/amd/amdgpu/../display/dc/dc_stream.h:241:34: note: while re=
ferencing 'writeback_info'
  241 |         struct dc_writeback_info writeback_info[MAX_DWB_PIPES];
      |                                  ^~~~~~~~~~~~~~

I have reverted that commit again today.
--=20
Cheers,
Stephen Rothwell

--Sig_/xVxdK89fd+s.RJjjuJPREX/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmM7mH8ACgkQAVBC80lX
0GzC3Qf9Gez8iYaASsQ2ZBFUAIKXmJbMs9tWotAhykatDhTi24tP3bbsqCnVH9Lx
3k8XhGA4en3BTq+MZ6aSaP5pRY4DXEMVs2nb6MULGWYN+iVoWTmX4BwCKlRJRYyg
1ULZr98MJDpLJxFYXvsyLwPHDuwfoMLgMkFLoQtDEe+O5VqBvshOEiu0yik0fnic
et0RxL3meXUC3OIpGRLqvQR9jwL7POMUh3lMUlpkdZh7UFhlHaMqcmo3ST94FznB
iXmx/TX0tc59FWCBJhJ9gtTjqDG5v/s71qZApXoMVJtRd+WKPSZnSQC6Vtmh2rpq
DjYgdSgNp6SiX2rV9kEnAPb3SlzZDw==
=gUKu
-----END PGP SIGNATURE-----

--Sig_/xVxdK89fd+s.RJjjuJPREX/--
