Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA80850F1D2
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 09:09:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4C3A10F862;
	Tue, 26 Apr 2022 07:09:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80A4010E6C9
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 07:09:23 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id y32so30280671lfa.6
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 00:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=PfuP5vk7vMYC6BBpqwvi9SwNDhieK6pny4Otz4RU0Lo=;
 b=QRhnU28kirsUggqKO7Culr6PyHHziAow5e5QiXbXESMmU18YLm2T5VQRSz1v4UEP3Q
 TybW6Aab5TWuRPlSy/I8LXLs1FdSJI/nhuYBEceVObbhoMp4xnG/V+NG/Lo6TRxIJDRn
 lGefQONpLnFXJQrYjQQfF63jRCCVLPol5sasL4mU3ioFM5xceKhl4+SQ0f3PvdphUq9u
 wnl8vLgXADRe7ua61YK+YfJO7+e0BgLnmcLS7e86TC2Y6SnNS2kSZpOg6TulMlQDwPmO
 JkJrzd+M85E/YzOjNvxtf/CuEqxwb300PWdwr6IiKZWhzPC/0nu+pwoNIZdj8Mipw+mD
 bXoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=PfuP5vk7vMYC6BBpqwvi9SwNDhieK6pny4Otz4RU0Lo=;
 b=HK4Rur4I4w/iruC6o6mqu/aXcKSfMACl6ywmuemVr/2bNhQlA4s3d/uNMH9p5KWZMt
 Mr+6lo5t6uElbRQcO2CJnZ/Uy6fztGdNVcDfUX5IOA+A7vJcmVSL3sbgMBk9dNshEjf1
 4aUxE35YdCidDfOQao82AeHhSL8vhpSzx5qxPqlW6TaDh9+uNNorN6eB3fr8NeZ72oel
 FBk9B23GXamtaJ986NI44oBWug7VutU4NwfkVz3J36fqsxyntYZWU7V9xGsYc77UX+HU
 SA8jEYqFWJlbawb+6AYaL9yHehg05sxDmiLbXnqg2GCtr6UDoD9jg5rR5bqTDpinqYah
 FItg==
X-Gm-Message-State: AOAM533+vn3RpmzVYJZsybxuinN3jbKs5tdOP87az/1aDIpy8Hs3VRyd
 aIi3cpWyetSwhuTmcd8WSxE=
X-Google-Smtp-Source: ABdhPJwWxv7bTCcrbXpRj0ogIq6F312HN0mPeszaGU4gUjCfxGBKQ2Bk+zwoI0cYkIk7XPgcXTaJ6A==
X-Received: by 2002:a05:6512:32b9:b0:471:fbc4:a685 with SMTP id
 q25-20020a05651232b900b00471fbc4a685mr10423408lfe.140.1650956961591; 
 Tue, 26 Apr 2022 00:09:21 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 m12-20020a19434c000000b0047213b907afsm195354lfj.177.2022.04.26.00.09.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 00:09:21 -0700 (PDT)
Date: Tue, 26 Apr 2022 10:09:11 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Igor Torrente <igormtorrente@gmail.com>
Subject: Re: [PATCH v5 5/9] drm: vkms: Add fb information to
 `vkms_writeback_job`
Message-ID: <20220426100911.673c985e@eldfell>
In-Reply-To: <e246264d-c072-e36d-efd3-20a9a6491e20@gmail.com>
References: <20220404204515.42144-1-igormtorrente@gmail.com>
 <20220404204515.42144-6-igormtorrente@gmail.com>
 <20220420142305.3945f409@eldfell>
 <12fa5189-efab-11c9-3d08-6c5367748b1c@gmail.com>
 <20220425105602.151885fd@eldfell>
 <e246264d-c072-e36d-efd3-20a9a6491e20@gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/JEXyzVde8/HYGOLdw_t/RuN";
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
Cc: hamohammed.sa@gmail.com, tzimmermann@suse.de, rodrigosiqueiramelo@gmail.com,
 airlied@linux.ie, leandro.ribeiro@collabora.com, melissa.srw@gmail.com,
 dri-devel@lists.freedesktop.org, tales.aparecida@gmail.com,
 ~lkcamp/patches@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/JEXyzVde8/HYGOLdw_t/RuN
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 25 Apr 2022 21:56:12 -0300
Igor Torrente <igormtorrente@gmail.com> wrote:

> Hi Pekka,
>=20
> On 4/25/22 04:56, Pekka Paalanen wrote:
> > On Sat, 23 Apr 2022 12:12:51 -0300
> > Igor Torrente <igormtorrente@gmail.com> wrote:
> >  =20
> >> Hi Pekka,
> >>
> >> On 4/20/22 08:23, Pekka Paalanen wrote: =20
> >>> On Mon,  4 Apr 2022 17:45:11 -0300
> >>> Igor Torrente <igormtorrente@gmail.com> wrote:
> >>>     =20
> >>>> This commit is the groundwork to introduce new formats to the planes=
 and
> >>>> writeback buffer. As part of it, a new buffer metadata field is adde=
d to
> >>>> `vkms_writeback_job`, this metadata is represented by the `vkms_comp=
oser`
> >>>> struct. =20
> >>>
> >>> Hi,
> >>>
> >>> should this be talking about vkms_frame_info struct instead? =20
> >>
> >> Yes it should. I will fix this. Thanks.
> >> =20
> >>>     =20
> >>>>
> >>>> Also adds two new function pointers (`{wb,plane}_format_transform_fu=
nc`)
> >>>> are defined to handle format conversion to/from internal format.
> >>>>
> >>>> These things will allow us, in the future, to have different composi=
ting
> >>>> and wb format types.
> >>>>
> >>>> V2: Change the code to get the drm_framebuffer reference and not cop=
y its
> >>>>       contents(Thomas Zimmermann).
> >>>> V3: Drop the refcount in the wb code(Thomas Zimmermann).
> >>>> V5: Add {wb,plane}_format_transform_func to vkms_writeback_job
> >>>>       and vkms_plane_state (Pekka Paalanen)
> >>>>
> >>>> Signed-off-by: Igor Torrente <igormtorrente@gmail.com>
> >>>> ---
> >>>>    drivers/gpu/drm/vkms/vkms_composer.c  |  4 ++--
> >>>>    drivers/gpu/drm/vkms/vkms_drv.h       | 31 +++++++++++++++++++++-=
-----
> >>>>    drivers/gpu/drm/vkms/vkms_plane.c     | 10 ++++-----
> >>>>    drivers/gpu/drm/vkms/vkms_writeback.c | 20 ++++++++++++++---
> >>>>    4 files changed, 49 insertions(+), 16 deletions(-)

...

> >>>> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/=
vkms_drv.h
> >>>> index 2e6342164bef..2704cfb6904b 100644
> >>>> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> >>>> +++ b/drivers/gpu/drm/vkms/vkms_drv.h

...

> >>>> +
> >>>> +struct vkms_writeback_job {
> >>>> +	struct dma_buf_map data[DRM_FORMAT_MAX_PLANES];
> >>>> +	struct vkms_frame_info frame_info; =20
> >>>
> >>> Which frame_info is this? Should the field be called wb_frame_info? =
=20
> >>
> >> Considering it's already in the writeback_job struct do you think this
> >> necessary? =20
> >=20
> > This struct has 'data' too, and that is not the wb buffer, right? =20
>=20
> AFAIU, no. Each plane has its own `iosys_map map[]`.
>=20
> >=20
> > Hmm, if it's not the wb buffer, then using DRM_FORMAT_MAX_PLANES is
> > odd... =20
>=20
> Yeah. I honestly don't have any clue why we have an array of `iosys_map`
> for each plane, why we only use the map[0] and why we only call
> `iosys_map_is_null` only to the `primary_composer`.
>=20
> Maybe @tzimmermann or @rodrigosiqueiramelo can shed some light on these
> questions.

Yeah, those questions would be really good to figure out.

FWIW, I can tell you this: "plane" has two different meanings in the
context of KMS:

https://gitlab.freedesktop.org/pq/color-and-hdr/-/blob/main/doc/glossary.md=
#plane

DRM_FORMAT_MAX_PLANES refers to the number of planes (or the number of
memory buffers) for a single image (single framebuffer). Most often
with RGB there is just one plane in one memory buffer. RGB buffer could
be accompanied with e.g. a compression data buffer, so two planes,
one buffer each. Different YUV formats have different numbers of planes
from N=3D1 to 3, and those plane may be stored in 1 to N memory buffers
(with dmabuf handles pointing to them).

The number of planes and the number of memory buffers are often
conflated in APIs by just passing the same memory buffer multiple times
when multiple planes are stored in the same buffer (with different
offset).

The number of planes is determined by the pixel format and the format
modifier. The number of memory buffers is more... vaguely defined and
may vary sometimes.

>=20
> >  =20
> >> In other words, what kind of misudertanding do you think can happen if
> >> this variable stay without the `wb_` prefix?
> >>
> >> I spent a few minutes trying to find a case, but nothing came to my
> >> mind. =20
> >=20
> > My question above is the confusion.
> >=20
> > If all these members are about the wb destination buffer only, then
> > where do the inputs come from and how are they reference-counted to
> > make sure they are available when needed? =20
>=20
> Ok. Got it.


Thanks,
pq

--Sig_/JEXyzVde8/HYGOLdw_t/RuN
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmJnmpcACgkQI1/ltBGq
qqc/CA/+KcavKmI+8Im5r8RRifq8evJlN2Yip9xyuLU93sYvljWB8/M4Xb0PGF31
iFXF2IAUlOIUEYSBkZ0H25GQIjIZCRvBjX6O6NtihM6vu3RscbVAHXQRzNTWViyq
KdDAPZv/Mck/VJhjT9RVZyTMqjlAH/sus5qn5lt1Qfx/l1fPVgiZoPZt4eWmMIEa
K8vLiTvqsE77iO5ENrcHg0/q8d7XNbrLusG9JUNCv2SDIwg7blVp6dULvadoHRQZ
xL9SRZBNK4GdrHeB75Gebt1rmJ/fb8fVxbGMBEbr4QBinQb1BOw32/hPM6iNGQ0k
UCLueJ/2dCr6ebOHYEuEUNqdQSQIyvG0DxfR0zReOILkfHdFHUS/mKcYrssJqF8t
Qp3ECGNQ+gpIUKqZtkkpR0oZGcOhHYsmJODzyzwVQcicC/Om4UCfBM8cwvxMHEG9
TsmMsd7Gk6vzDBDIyhfsMFbTE4RO6YLAZmzGVO7NrljqB3LirReZ34yhlJQhc7Fi
ENI29Nx4mpwb8u3yxPYMHqoahZtSXqqKQwxq+0+4AmEOpzn7wnGGePgYW7NOIzzJ
+mpJyCJT+nb39axsmPS02/ZxDrtgf/j89f8QGaHzarvmcTCcQzW53BMBJdCGV7P9
bRxjDycsP7YUUDlnkELkQfe+PsMDVXTT0HKc9I5OKmIo5xOuxi4=
=t+2b
-----END PGP SIGNATURE-----

--Sig_/JEXyzVde8/HYGOLdw_t/RuN--
