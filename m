Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 09AE51AD871
	for <lists+dri-devel@lfdr.de>; Fri, 17 Apr 2020 10:23:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 295A56E3B8;
	Fri, 17 Apr 2020 08:23:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3859F6E107;
 Fri, 17 Apr 2020 08:23:25 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id EF1C2ACCA;
 Fri, 17 Apr 2020 08:23:22 +0000 (UTC)
Subject: Re: [PULL] topic/phy-compliance
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Maxime Ripard <mripard@kernel.org>,
 Manasi Navare <manasi.d.navare@intel.com>
References: <efb3d0d9-2cf7-046b-3a9b-2548d086258e@linux.intel.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 mQENBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAG0J1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPokBVAQTAQgAPhYh
 BHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJbOdLgAhsDBQkDwmcABQsJCAcCBhUKCQgLAgQWAgMB
 Ah4BAheAAAoJEGgNwR1TC3ojR80H/jH+vYavwQ+TvO8ksXL9JQWc3IFSiGpuSVXLCdg62AmR
 irxW+qCwNncNQyb9rd30gzdectSkPWL3KSqEResBe24IbA5/jSkPweJasgXtfhuyoeCJ6PXo
 clQQGKIoFIAEv1s8l0ggPZswvCinegl1diyJXUXmdEJRTWYAtxn/atut1o6Giv6D2qmYbXN7
 mneMC5MzlLaJKUtoH7U/IjVw1sx2qtxAZGKVm4RZxPnMCp9E1MAr5t4dP5gJCIiqsdrVqI6i
 KupZstMxstPU//azmz7ZWWxT0JzgJqZSvPYx/SATeexTYBP47YFyri4jnsty2ErS91E6H8os
 Bv6pnSn7eAq5AQ0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRH
 UE9eosYbT6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgT
 RjP+qbU63Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+R
 dhgATnWWGKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zb
 ehDda8lvhFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r
 12+lqdsAEQEAAYkBPAQYAQgAJhYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJbOdLgAhsMBQkD
 wmcAAAoJEGgNwR1TC3ojpfcIAInwP5OlcEKokTnHCiDTz4Ony4GnHRP2fXATQZCKxmu4AJY2
 h9ifw9Nf2TjCZ6AMvC3thAN0rFDj55N9l4s1CpaDo4J+0fkrHuyNacnT206CeJV1E7NYntxU
 n+LSiRrOdywn6erjxRi9EYTVLCHcDhBEjKmFZfg4AM4GZMWX1lg0+eHbd5oL1as28WvvI/uI
 aMyV8RbyXot1r/8QLlWldU3NrTF5p7TMU2y3ZH2mf5suSKHAMtbE4jKJ8ZHFOo3GhLgjVrBW
 HE9JXO08xKkgD+w6v83+nomsEuf6C6LYrqY/tsZvyEX6zN8CtirPdPWu/VXNRYAl/lat7lSI
 3H26qrE=
Message-ID: <d9cd2267-c293-72ae-b02d-b0ebe87fd907@suse.de>
Date: Fri, 17 Apr 2020 10:23:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <efb3d0d9-2cf7-046b-3a9b-2548d086258e@linux.intel.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1742685823=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1742685823==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="BYQ8u6ilSl2cxkTyDagwTITlVnabQBY6T"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--BYQ8u6ilSl2cxkTyDagwTITlVnabQBY6T
Content-Type: multipart/mixed; boundary="BnSEdN5PS7Q6PGlU3t7mKsDRnupc4nNX8";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Maxime Ripard <mripard@kernel.org>,
 Manasi Navare <manasi.d.navare@intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Message-ID: <d9cd2267-c293-72ae-b02d-b0ebe87fd907@suse.de>
Subject: Re: [PULL] topic/phy-compliance
References: <efb3d0d9-2cf7-046b-3a9b-2548d086258e@linux.intel.com>
In-Reply-To: <efb3d0d9-2cf7-046b-3a9b-2548d086258e@linux.intel.com>

--BnSEdN5PS7Q6PGlU3t7mKsDRnupc4nNX8
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Merged into drm-misc-next

Am 08.04.20 um 14:49 schrieb Maarten Lankhorst:
> Hey,
>=20
> Here's a pull request to pull in the DP PHY Compliance series.
> It's based on top of drm/drm-next, and contains all patches for core, a=
md and i915. :)
>=20
> Cheers,
> Maarten
>=20
> topic/phy-compliance-2020-04-08:
> Topic pull request for topic/phy-compliance:
> - Standardize DP_PHY_TEST_PATTERN name.
> - Add support for setting/getting test pattern from sink.
> - Implement DP PHY compliance to i915.
> The following changes since commit 12ab316ced2c5f32ced0e6300a054db644b5=
444a:
>=20
>   Merge tag 'amd-drm-next-5.7-2020-04-01' of git://people.freedesktop.o=
rg/~agd5f/linux into drm-next (2020-04-08 09:34:27 +1000)
>=20
> are available in the Git repository at:
>=20
>   git://anongit.freedesktop.org/drm/drm-misc tags/topic/phy-compliance-=
2020-04-08
>=20
> for you to fetch changes up to 8cdf727119289db3a98835662eb28e1c5ad835f1=
:
>=20
>   drm/i915/dp: Program vswing, pre-emphasis, test-pattern (2020-04-08 1=
4:41:09 +0200)
>=20
> ----------------------------------------------------------------
> Topic pull request for topic/phy-compliance:
> - Standardize DP_PHY_TEST_PATTERN name.
> - Add support for setting/getting test pattern from sink.
> - Implement DP PHY compliance to i915.
>=20
> ----------------------------------------------------------------
> Animesh Manna (7):
>       drm/amd/display: Align macro name as per DP spec
>       drm/dp: get/set phy compliance pattern
>       drm/i915/dp: Made intel_dp_adjust_train() non-static
>       drm/i915/dp: Preparation for DP phy compliance auto test
>       drm/i915/dp: Add debugfs entry for DP phy compliance
>       drm/i915/dp: Register definition for DP compliance register
>       drm/i915/dp: Program vswing, pre-emphasis, test-pattern
>=20
>  drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c   |   2 +-
>  drivers/gpu/drm/drm_dp_helper.c                    |  94 +++++++++++
>  .../gpu/drm/i915/display/intel_display_debugfs.c   |  12 +-
>  drivers/gpu/drm/i915/display/intel_display_types.h |   1 +
>  drivers/gpu/drm/i915/display/intel_dp.c            | 171 +++++++++++++=
++++++++
>  drivers/gpu/drm/i915/display/intel_dp.h            |   1 +
>  .../gpu/drm/i915/display/intel_dp_link_training.c  |   9 +-
>  .../gpu/drm/i915/display/intel_dp_link_training.h  |   4 +
>  drivers/gpu/drm/i915/i915_reg.h                    |  18 +++
>  include/drm/drm_dp_helper.h                        |  33 +++-
>  10 files changed, 337 insertions(+), 8 deletions(-)
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--BnSEdN5PS7Q6PGlU3t7mKsDRnupc4nNX8--

--BYQ8u6ilSl2cxkTyDagwTITlVnabQBY6T
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl6ZZ3kACgkQaA3BHVML
eiMrpQf/VKrdQG9xD4McdSs89l20e3Tz1DapO5TjtynyNx32Eb4zoyhkwRjMPR7D
VoEjumTLjxZuwXzEuOJRbe+aHavfsxrNlNket/2d//Eoyj2svH9ZpWz1voEcN7/z
LgYQTWdfyDWQkRxVy1zLJsfJ8pD3Jk0w1Nb/9s29pvJclSIydmfZhRfWp/syOPTv
3h3UiTUVr8cV9p4blZEcByEgb77E0MLI9BBPrDGhtfhVPXNXiVZSffjA/LGaZDS+
/rVEsk0zIBPtjNBO1uuX/sMnbn36G7qWXtCIQkFAU8LgVrKWvH3wr7Lk4gsVDDMW
eYV9iPCwi5INu6BxPgZ8UCCJ8/A+oA==
=MDSZ
-----END PGP SIGNATURE-----

--BYQ8u6ilSl2cxkTyDagwTITlVnabQBY6T--

--===============1742685823==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1742685823==--
