Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE64817DA0B
	for <lists+dri-devel@lfdr.de>; Mon,  9 Mar 2020 08:50:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9AFF6E291;
	Mon,  9 Mar 2020 07:49:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADC8F6E270;
 Mon,  9 Mar 2020 07:49:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 8A072AD48;
 Mon,  9 Mar 2020 07:49:50 +0000 (UTC)
Subject: Re: [PATCH][next] drm: Replace zero-length array with flexible-array
 member
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Dave Airlie <airlied@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Hans de Goede <hdegoede@redhat.com>,
 Eric Anholt <eric@anholt.net>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Thomas Hellstrom <thellstrom@vmware.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>
References: <20200225140347.GA22864@embeddedor> <87a756sqdc.fsf@intel.com>
 <138ff691-94b3-1ce5-e7fa-e6d7c436bf8e@embeddedor.com>
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
Message-ID: <67c46a2b-8127-a4b7-c825-8cba6f28db8c@suse.de>
Date: Mon, 9 Mar 2020 08:49:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <138ff691-94b3-1ce5-e7fa-e6d7c436bf8e@embeddedor.com>
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
Cc: linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, spice-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, freedreno@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1436189536=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1436189536==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Ul1CrpBm5H0rrZlYhdIfEA75XDUYdEO4y"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Ul1CrpBm5H0rrZlYhdIfEA75XDUYdEO4y
Content-Type: multipart/mixed; boundary="0DgKy29qpwpTjPxx9ZHosYzYcoKck294a";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Dave Airlie <airlied@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Hans de Goede <hdegoede@redhat.com>,
 Eric Anholt <eric@anholt.net>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Thomas Hellstrom <thellstrom@vmware.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, spice-devel@lists.freedesktop.org
Message-ID: <67c46a2b-8127-a4b7-c825-8cba6f28db8c@suse.de>
Subject: Re: [PATCH][next] drm: Replace zero-length array with flexible-array
 member
References: <20200225140347.GA22864@embeddedor> <87a756sqdc.fsf@intel.com>
 <138ff691-94b3-1ce5-e7fa-e6d7c436bf8e@embeddedor.com>
In-Reply-To: <138ff691-94b3-1ce5-e7fa-e6d7c436bf8e@embeddedor.com>

--0DgKy29qpwpTjPxx9ZHosYzYcoKck294a
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Gustavo

Am 03.03.20 um 19:20 schrieb Gustavo A. R. Silva:
>=20
>=20
> On 2/25/20 08:17, Jani Nikula wrote:
>> On Tue, 25 Feb 2020, "Gustavo A. R. Silva" <gustavo@embeddedor.com> wr=
ote:
>>> The current codebase makes use of the zero-length array language
>>> extension to the C90 standard, but the preferred mechanism to declare=

>>> variable-length types such as these ones is a flexible array member[1=
][2],
>>> introduced in C99:
>>>
>>> struct foo {
>>>         int stuff;
>>>         struct boo array[];
>>> };
>>>
>>> By making use of the mechanism above, we will get a compiler warning
>>> in case the flexible array does not occur last in the structure, whic=
h
>>> will help us prevent some kind of undefined behavior bugs from being
>>> inadvertently introduced[3] to the codebase from now on.
>>>
>>> Also, notice that, dynamic memory allocations won't be affected by
>>> this change:
>>>
>>> "Flexible array members have incomplete type, and so the sizeof opera=
tor
>>> may not be applied. As a quirk of the original implementation of
>>> zero-length arrays, sizeof evaluates to zero."[1]
>>>
>>> This issue was found with the help of Coccinelle.
>>>
>>> [1] https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
>>> [2] https://github.com/KSPP/linux/issues/21
>>> [3] commit 76497732932f ("cxgb3/l2t: Fix undefined behaviour")
>>>
>>> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
>>> ---
>>>  drivers/gpu/drm/etnaviv/etnaviv_gem.h         | 2 +-
>>>  drivers/gpu/drm/gma500/intel_bios.h           | 2 +-
>>>  drivers/gpu/drm/i915/display/intel_vbt_defs.h | 4 ++--
>>>  drivers/gpu/drm/i915/gt/intel_lrc.c           | 2 +-
>>>  drivers/gpu/drm/i915/i915_gpu_error.h         | 2 +-
>>
>> Please split out the i915 changes to a separate patch.
>>
>=20
> Sure thing. I can do that.

I think each driver deserves it's own patch. Makes backporting easier.

Best regards
Thomas

>=20
>>>  drivers/gpu/drm/msm/msm_gem.h                 | 2 +-
>>>  drivers/gpu/drm/qxl/qxl_cmd.c                 | 2 +-
>>>  drivers/gpu/drm/vboxvideo/vboxvideo.h         | 2 +-
>>>  drivers/gpu/drm/vc4/vc4_drv.h                 | 2 +-
>>>  drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c    | 2 +-
>>>  drivers/gpu/drm/vmwgfx/vmwgfx_surface.c       | 2 +-
>>>  include/drm/bridge/mhl.h                      | 4 ++--
>>>  include/drm/drm_displayid.h                   | 2 +-
>>>  include/uapi/drm/i915_drm.h                   | 4 ++--
>>
>> Not sure it's worth touching uapi headers. They're full of both [0] an=
d
>> []. Again, please at least split it to a separate patch to be decided
>> separately.
>>
>=20
> Yeah, it's worth it; the purpose of these patches is to replace [0] wit=
h [] across
> the whole tree.
>=20
> Thanks
> --
> Gustavo
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--0DgKy29qpwpTjPxx9ZHosYzYcoKck294a--

--Ul1CrpBm5H0rrZlYhdIfEA75XDUYdEO4y
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl5l9RkACgkQaA3BHVML
eiNGUQgAgjKSCBND55SWYJrmDfa3irwlGfO6EKxH9F6r/W+oYNLwfa7Re8zDiRjN
oMHZLY2a2iKckXvawizS65l/0mqLfNQ11BfXFGBr6RAgxWt7Ac2pw1wP9FaVQ3HN
PSksqH6ASJUhgDm9hfZSRu9fZDLV1AGIWdTE/pHRcJ8inzEV543+SffD2ddPFjwV
m+hBDC678jVfSux+/aBkp40Mv9VryJTVN4TyQNRuUtmciIWSoVvoiJxk5d+0Ykcn
McM6bm+GmCvvUmjlLa7LNv8Fv9zr17XF3Q2Nv2v8Gn+sYDXY2S8RU8BXlV05XZVE
xLoQ88iIqzrGQjmARyUf0W4vvek8XQ==
=9S1h
-----END PGP SIGNATURE-----

--Ul1CrpBm5H0rrZlYhdIfEA75XDUYdEO4y--

--===============1436189536==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1436189536==--
