Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2459537511B
	for <lists+dri-devel@lfdr.de>; Thu,  6 May 2021 10:51:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7377489DA6;
	Thu,  6 May 2021 08:51:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 441DF89DA6
 for <dri-devel@lists.freedesktop.org>; Thu,  6 May 2021 08:51:06 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id o16so6082638ljp.3
 for <dri-devel@lists.freedesktop.org>; Thu, 06 May 2021 01:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=7IrIAdhQz0iHG+13pc20dYahjF2LkM8FkQElJx9UCDU=;
 b=KwcgZ+m/n6Ayumy5DvGhGKNn4U0RoLYaqYex7w3zL1iQfaitx4GAg/ml+82o39qesj
 B8HM48/s0pBxPzjKLj9GouS5nyaabos2xHnAov7G3SMshGiIwkFx8ETd7Jf7LxG3LjI5
 sbE1A6R8jQw27U8pF+k285yAtyT3ZUU2i8n/+/D6xCaebnvNuFmgMyDQNl6398z+pd4L
 +bzHSV5UlyObyMtttbI/dtVisAKHePM6Em/mv8aDoP3UTDX+EucbwUw9QfahcUMvRviZ
 /zlgzwG8vACzZnWTU4i/2ERrash8PI8hmT2TZc8WkRp9XbRpl3u0wbZZ9ge0FMarCOr2
 tXQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=7IrIAdhQz0iHG+13pc20dYahjF2LkM8FkQElJx9UCDU=;
 b=gvGW8noi9h9G3YK/N2HxJHRIOO9rtIi3seDFPOnXhD/tS86QJttIcYhX+Od2eqN7nQ
 jVp5K6VffjrZaDkcCxbzYVW4ofeK+r3oxGrptRB3VZiDc+glM6AEivpTRJgzgOj0rsc0
 vLHt2YR49gRCS2qtkH0sG8dnCtZMWA6IUG6UJ7FVl330l0g6RPj9fdn0+T1Mjz1M8z3y
 9W5Rwz7bQKd9KHjfwQb5XbMlurkGxTNBVN4xPY7jSj0NmgzF3XzChsAWIeqW6peEwOZX
 62U65qNcwv9Y9nBgh4CFXDSUkESfEKuFYnvdMeCjH+YSEBCVwJpQ2PHFsERLBrGxceX/
 4ANg==
X-Gm-Message-State: AOAM533q9wJ+VraKLmXfYjUPB0ExBSuk8ZbWa3G1VXecYnI+VAz1aNEx
 ce3DZc9mU+8XTHCxsMXcOfE=
X-Google-Smtp-Source: ABdhPJz16EXLaCA7xwE1r59sIl/zVl0++mKsgCXm6wJJUXfvA0Xs6f2Pu4Z/orVa2DMsTIHls8Dgwg==
X-Received: by 2002:a2e:97ca:: with SMTP id m10mr2454120ljj.205.1620291064396; 
 Thu, 06 May 2021 01:51:04 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id u13sm515184lfg.139.2021.05.06.01.51.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 May 2021 01:51:03 -0700 (PDT)
Date: Thu, 6 May 2021 11:50:53 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Leandro Ribeiro <leandro.ribeiro@collabora.com>
Subject: Re: [PATCH 1/2] drm/doc: document how userspace should find out
 CRTC index
Message-ID: <20210506115053.15741550@eldfell>
In-Reply-To: <20210428213651.55467-2-leandro.ribeiro@collabora.com>
References: <20210428213651.55467-1-leandro.ribeiro@collabora.com>
 <20210428213651.55467-2-leandro.ribeiro@collabora.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Af_RC_Kc19WgD6_Jfp_4Scl"; protocol="application/pgp-signature"
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
Cc: airlied@linux.ie, kernel@collabora.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/Af_RC_Kc19WgD6_Jfp_4Scl
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 28 Apr 2021 18:36:50 -0300
Leandro Ribeiro <leandro.ribeiro@collabora.com> wrote:

> In this patch we add a section to document what userspace should do to
> find out the CRTC index. This is important as there are multiple places
> in the documentation that need this, so it's better to just point to
> this section and avoid repetition.
>=20
> Signed-off-by: Leandro Ribeiro <leandro.ribeiro@collabora.com>
> ---
>  Documentation/gpu/drm-uapi.rst    | 14 ++++++++++++++
>  drivers/gpu/drm/drm_debugfs_crc.c |  9 +++++----
>  include/uapi/drm/drm.h            |  3 ++-
>  3 files changed, 21 insertions(+), 5 deletions(-)
>=20
> diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.=
rst
> index 04bdc7a91d53..1aa52a6ac567 100644
> --- a/Documentation/gpu/drm-uapi.rst
> +++ b/Documentation/gpu/drm-uapi.rst
> @@ -457,6 +457,20 @@ Userspace API Structures
>  .. kernel-doc:: include/uapi/drm/drm_mode.h
>     :doc: overview
>=20
> +.. _crtc_index:
> +
> +CRTC index
> +----------
> +
> +In some situations, it is important for userspace to find out the index =
of a

That could be said about everything, so this sentence has no
information value. Instead, you could start by stating that CRTCs have
both an object ID and an index, and they are not the same thing. CRTC
index is used in cases where a densely packed identifier for a CRTC is
needed, e.g. in bit-for-crtc masks, where using the object ID would not
work.

> +CRTC. The CRTC index should not be confused with its object id.
> +
> +In order to do this, userspace should first query the resources object

Instead of saying what userspace must do, you could just explain where
it can be observed.

> +from the device that owns the CRTC (using the DRM_IOCTL_MODE_GETRESOURCES

So here you might start with: DRM_IOCTL_MODE_GETRESOURCES populates a
structure with an array of CRTC IDs. CRTC's index is its index in that
array.

> +ioctl). The resources object contains a pointer to an array of CRTC's, a=
nd also
> +the number of entries of the array. The index of the CRTC is the same as=
 its
> +position in this array.

Anyway, the idea here is right.

> +
>  .. kernel-doc:: include/uapi/drm/drm.h
>     :internal:
>=20
> diff --git a/drivers/gpu/drm/drm_debugfs_crc.c b/drivers/gpu/drm/drm_debu=
gfs_crc.c
> index 3dd70d813f69..9575188d97ee 100644
> --- a/drivers/gpu/drm/drm_debugfs_crc.c
> +++ b/drivers/gpu/drm/drm_debugfs_crc.c
> @@ -46,10 +46,11 @@
>   * it reached a given hardware component (a CRC sampling "source").
>   *
>   * Userspace can control generation of CRCs in a given CRTC by writing t=
o the
> - * file dri/0/crtc-N/crc/control in debugfs, with N being the index of t=
he CRTC.
> - * Accepted values are source names (which are driver-specific) and the =
"auto"
> - * keyword, which will let the driver select a default source of frame C=
RCs
> - * for this CRTC.
> + * file dri/0/crtc-N/crc/control in debugfs, with N being the index of t=
he
> + * CRTC. To learn how to find out the index of a certain CRTC, please see
> + * :ref:`crtc_index`. Accepted values are source names (which are

This a bit verbose: "To learn..." It could be more concise, like
making the words "the index" a hyperlink instead of adding a whole
sentence.

> + * driver-specific) and the "auto" keyword, which will let the driver se=
lect a
> + * default source of frame CRCs for this CRTC.
>   *
>   * Once frame CRC generation is enabled, userspace can capture them by r=
eading
>   * the dri/0/crtc-N/crc/data file. Each line in that file contains the f=
rame
> diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
> index 67b94bc3c885..6944f08ab1a6 100644
> --- a/include/uapi/drm/drm.h
> +++ b/include/uapi/drm/drm.h
> @@ -636,7 +636,8 @@ struct drm_gem_open {
>   * DRM_CAP_VBLANK_HIGH_CRTC
>   *
>   * If set to 1, the kernel supports specifying a CRTC index in the high =
bits of
> - * &drm_wait_vblank_request.type.
> + * &drm_wait_vblank_request.type. To learn how to find out the index of a
> + * certain CRTC, please see :ref:`crtc_index`.

The same here with "a CRTC index" turned into a hyperlink.


Thanks,
pq

>   *
>   * Starting kernel version 2.6.39, this capability is always set to 1.
>   */
> --
> 2.31.1
>=20
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel


--Sig_/Af_RC_Kc19WgD6_Jfp_4Scl
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmCTre0ACgkQI1/ltBGq
qqfGng/+JPGRHi3VHE42gfyR1t+MTSJrsQDaJSdp1kZ0VZlvhA3NB0WryEedXV30
aKBmBxXKeaZahtr/zXAVG4MMXOlpQMxBySIK5qijR9JXFNR8s9ziruBOPvyAKJCs
hG+Heqj5OZrWxso9P0u/9dOsRm1mwFfQVUk/7SGZQeigAWZ1NuXOWx4EhdMKaBLs
P8daFDqyUvQ83IPnU5zBGs+Q/37md6Xp8dI/Mk2Xro8XaCSToEAvn4QqBmzz1ggd
tFhs5NXOQKF8FjoHe35YvqlFdM3+jrGahrQt4s7Ua3IMTDmhsXBGEHNgi5yp3PlM
8LwCQqa7WDh48ylC1EaXoHC8sX1SsI77TDNxWgkt33js8FgBi4ksRDO0ikQbt3Vj
Rh5m0PfV9fC3ZRNzhRhlfutG4fLZMXGmVRZmyaO0yRnXuy+XyS7ir2Pbbjryu5mV
aV208duSDBcj/2uq/V1UmDArTJgbGdZfXbRbQtMEq1hmzPicySwdwWBBGooOGCLT
RLFZEQA68EePIBDSMn42T/RneFJRRGQMdeEcDUwvW99SlLxIe+yQIFixthylLz0p
oShUZhoQNDMi7Rs+xpHu5ddAGdqjSVjci8UBHciZcEZ+GHc85Ihb1O+6RfKPAVrF
289s11UZnTY4YmypVjugbT9+yPPiDQcmaPxWuBoonZsPgLsJKsY=
=Bth+
-----END PGP SIGNATURE-----

--Sig_/Af_RC_Kc19WgD6_Jfp_4Scl--
