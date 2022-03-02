Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70D344CA065
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 10:16:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B04D910F25A;
	Wed,  2 Mar 2022 09:16:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D163D10F25A
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Mar 2022 09:16:20 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4K7pQ76Gz8z4xNm;
 Wed,  2 Mar 2022 20:16:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1646212578;
 bh=aGoT8tshFpkjG1ZCt6zo4hirWMyOJq+WNLxlnD4AFgQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=iwE3SFvPpGIrDYNzH7NP11wr8ioIWnc8HwL4qg2W4bCs6g93Dl6uPTmUZI6iHXR7z
 fjsI2fOOLu+YN4MXIX0b0B6ovgn4jYhEjdetjYdll3HnbHqhuBwDP+qHlzpdq097wT
 w+J7Yfiwe3YQzO1oEsRxGXIW4NQFAe86BBExtRp6wDnzERQ1xJ7/ib+5ZbN97ejDDO
 9yIOXBquASVwJwuZRQpSw1J4sgp5CL86C1nnLY3baYPubhSi5HpH2Plq87czmXtdH0
 NItrkmXNIAqVcB6oJh+D+PpSxCl5xxpFA5HI2k3C2WX7JE6eeDMrPteDewx/Xu94Lo
 pXLWVx6xvJ5iQ==
Date: Wed, 2 Mar 2022 20:16:10 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kees Cook <keescook@chromium.org>
Subject: Re: linux-next: build failure after merge of the kspp tree
Message-ID: <20220302201610.56ccfbc3@canb.auug.org.au>
In-Reply-To: <202202281453.C8B840C7@keescook>
References: <20220301092730.10de23c5@canb.auug.org.au>
 <202202281453.C8B840C7@keescook>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/HV8gb_Ej27Pg0hw4vHkT4.K";
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Robert Foss <robert.foss@linaro.org>, Hermes Wu <Hermes.Wu@ite.com.tw>,
 Mark Brown <broonie@kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Allen Chen <allen.chen@ite.com.tw>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/HV8gb_Ej27Pg0hw4vHkT4.K
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Kees,

On Mon, 28 Feb 2022 15:02:48 -0800 Kees Cook <keescook@chromium.org> wrote:
>
> On Tue, Mar 01, 2022 at 09:27:30AM +1100, Stephen Rothwell wrote:
> >=20
> > After merging the kspp tree, today's linux-next build (x86_64
> > allmodconfig) failed like this:
> >=20
> > drivers/gpu/drm/drm_dp_helper.c: In function 'drm_dp_pcon_dsc_bpp_incr':
> > drivers/gpu/drm/drm_dp_helper.c:3130:28: error: array subscript 12 is o=
utside array bounds of 'const u8[12]' {aka 'const unsigned char[12]'} [-Wer=
ror=3Darray-bounds]
> >  3130 |         buf =3D pcon_dsc_dpcd[DP_PCON_DSC_BPP_INCR - DP_PCON_DS=
C_ENCODER];
> >       |               ~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
> > drivers/gpu/drm/drm_dp_helper.c:3126:39: note: while referencing 'pcon_=
dsc_dpcd'
> >  3126 | int drm_dp_pcon_dsc_bpp_incr(const u8 pcon_dsc_dpcd[DP_PCON_DSC=
_ENCODER_CAP_SIZE])
> >       |                              ~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~
> > drivers/gpu/drm/drm_dp_helper.c: In function 'drm_dp_get_adjust_request=
_post_cursor':
> > drivers/gpu/drm/drm_dp_helper.c:59:27: error: array subscript 10 is out=
side array bounds of 'const u8[6]' {aka 'const unsigned char[6]'} [-Werror=
=3Darray-bounds]
> >    59 |         return link_status[r - DP_LANE0_1_STATUS];
> >       |                ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~
> > drivers/gpu/drm/drm_dp_helper.c:147:51: note: while referencing 'link_s=
tatus'
> >   147 | u8 drm_dp_get_adjust_request_post_cursor(const u8 link_status[D=
P_LINK_STATUS_SIZE],
> >       |                                          ~~~~~~~~~^~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~
> > cc1: all warnings being treated as errors
> >=20
> > I can't see what in the kspp tree suddenly brought this on, so I have
> > used the kspp tree from next-20220228 for today.
> >=20
> > In case it matters: x86_64-linux-gnu-gcc (Debian 11.2.0-9) 11.2.0 =20
>=20
> This is fixed in drm-misc:
>=20
> https://cgit.freedesktop.org/drm/drm-misc/log/
> https://cgit.freedesktop.org/drm/drm-misc/commit/?id=3Dd4da1f27396fb1dde0=
79447a3612f4f512caed07
> https://cgit.freedesktop.org/drm/drm-misc/commit/?id=3Da2151490cc6c57b368=
d7974ffd447a8b36ade639
>=20
> but I had to drop the fix from the for-next/kspp because the patched
> file got moved in drm-misc.

Well, I moved the kspp tree to the end of the -next merges today, so it
would be after all the drm changes.  Unfortunately, it still fails:

drivers/gpu/drm/dp/drm_dp.c: In function 'drm_dp_pcon_dsc_bpp_incr':
drivers/gpu/drm/dp/drm_dp.c:3214:28: error: array subscript 12 is outside a=
rray bounds of 'const u8[12]' {aka 'const unsigned char[12]'} [-Werror=3Dar=
ray-bounds]
 3214 |         buf =3D pcon_dsc_dpcd[DP_PCON_DSC_BPP_INCR - DP_PCON_DSC_EN=
CODER];
      |               ~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
drivers/gpu/drm/dp/drm_dp.c:3210:39: note: while referencing 'pcon_dsc_dpcd'
 3210 | int drm_dp_pcon_dsc_bpp_incr(const u8 pcon_dsc_dpcd[DP_PCON_DSC_ENC=
ODER_CAP_SIZE])
      |                              ~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~
drivers/gpu/drm/dp/drm_dp.c: In function 'drm_dp_get_adjust_request_post_cu=
rsor':
drivers/gpu/drm/dp/drm_dp.c:60:27: error: array subscript 10 is outside arr=
ay bounds of 'const u8[6]' {aka 'const unsigned char[6]'} [-Werror=3Darray-=
bounds]
   60 |         return link_status[r - DP_LANE0_1_STATUS];
      |                ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/dp/drm_dp.c:211:51: note: while referencing 'link_status'
  211 | u8 drm_dp_get_adjust_request_post_cursor(const u8 link_status[DP_LI=
NK_STATUS_SIZE],
      |                                          ~~~~~~~~~^~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~

Presumably the above fixes have not hit the drm trees in linux-next yet
:-(

So, I used the version of your tree from next-20220228 again.  This
does not get the above, but does produce the error reported in
https://lore.kernel.org/lkml/20220225164231.904173-1-broonie@kernel.org/
(I was wondering why that went away today) for which I have applied the
patch in
https://lore.kernel.org/all/20220228081421.1504213-1-hsinyi@chromium.org/

--=20
Cheers,
Stephen Rothwell

--Sig_/HV8gb_Ej27Pg0hw4vHkT4.K
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmIfNdoACgkQAVBC80lX
0GzN8Af7BKAr1qtM53AVIlxR56jq4aCwYwnHXa2+34my9I4407msG/9xJubEeRQA
xJXeBGFjxws4b3lAMI9hODWM67Xh1Ek14e6D0WNIC5Ie431AtuXrRppVHHj2tzV0
qDd33W7HGrrHY8/MgxwYmcHv7KLcfUZ44Y2QWuY4QMCccffL2MDODeakS6lDlXk/
3uvl3R4TQAQgc4b0n+gDmfxuKEEYGY1/iKWWgxsmjGnQoYoWhfOzneZLtx64MDxC
qSopgJVsciQ2V/NyfRjSUlXhQ+9uXdYGZxPv/bv4GJHpD03PIj4FzLwUqOonUGk6
s0YSIUrM4hvCqizLz7akK3g4oj6BbA==
=pojc
-----END PGP SIGNATURE-----

--Sig_/HV8gb_Ej27Pg0hw4vHkT4.K--
