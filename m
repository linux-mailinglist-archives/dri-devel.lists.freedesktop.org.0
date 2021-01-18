Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36CAF2F9B8D
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jan 2021 09:52:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1961D88E4B;
	Mon, 18 Jan 2021 08:52:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE82388E33
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jan 2021 08:52:53 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id u21so17401294lja.0
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jan 2021 00:52:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=xdr7Fy2YayjR2R9WT9QjipcKyuv++Wbng9qnY8CHlZg=;
 b=cX3UD0AhcSrLNSPuo8PMosWEflhiZIN0LcE4d+yONl5fD8hNKkCD/HpVP2VJ0zuy0A
 EtlMps72yt7/+rlAug9QteLq2LRdeBJJL2IPtLVyYfd1iqvbrvHcuAA2axCh6hq1K3t6
 o+57d/5gq9e2nO1bwCc8G/bYoMFAjnDg9L7JV7T0EuIEEU/pmdcIIe0MPUjXFgqo8c2I
 LB3n7RbaDlgYW3kmTSx9N+ejUPMgTPxAqSoEqzdB0ejuAuCGs0anyo0FWXcIkxkFB0Az
 a77FJZbH5SdmT5vwSQ0epNHQgy5ul4tyBnXR/NzQVqIe8qXJc/5W5taXj6skpoRnLEOi
 pg8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=xdr7Fy2YayjR2R9WT9QjipcKyuv++Wbng9qnY8CHlZg=;
 b=Pd5CJbsLLC4YnpQH1V7ISahpa8WCTLHii9mwJzc5zKJ8EF/fg6N7taUKy4MqkqRNxx
 F9tf30dsxABDg8pUz+F2LPd4C5S5P9eBdlWF20dO+24USU5yPUe3eywAowQLKDOJMzHx
 n0HX6YfUsLNXncGnCy20j3vUyrjL6QeiHMYBxTn9iByUpCerwR3JsSM6lRjOLhiJ+E1H
 Q+clR1rpIMtm7dEKT9oA8y+hQ/t4pqnXc6NbImXZIAkGMYwAkeFA1OFPGVqq8Z6iIhSv
 2lZ94NWqDJJIz9ADjOA2LJ6moT9ujPlUlZxOOdMV3UIQnhD1MQ4qNEmyp37MTABG+mh2
 tibQ==
X-Gm-Message-State: AOAM531uwMLGoTaoHpUbSNNhHvSOlt6I9JuGRfc7DL+6sLiC6+1NdoF1
 H/x1Pmq8xuYvKrAh6Lhw3kA=
X-Google-Smtp-Source: ABdhPJwl98iUB3NxgDcj3nDRdx/YHRyaiHN57lwQD9jx9Gl+nYLRgIgir7MDHxUjXluEZ1kHY+eXNw==
X-Received: by 2002:a2e:98e:: with SMTP id 136mr9951761ljj.16.1610959972121;
 Mon, 18 Jan 2021 00:52:52 -0800 (PST)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id m21sm1588409ljb.108.2021.01.18.00.52.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jan 2021 00:52:51 -0800 (PST)
Date: Mon, 18 Jan 2021 10:52:48 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v5 2/2] drm/doc: document the type plane property
Message-ID: <20210118105248.6f33d780@eldfell>
In-Reply-To: <20210115110626.12233-2-contact@emersion.fr>
References: <20210115110626.12233-1-contact@emersion.fr>
 <20210115110626.12233-2-contact@emersion.fr>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0313782221=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0313782221==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/UstC=BuNBBFCX5faV6yX.tU"; protocol="application/pgp-signature"

--Sig_/UstC=BuNBBFCX5faV6yX.tU
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 15 Jan 2021 12:06:26 +0100
Simon Ser <contact@emersion.fr> wrote:

> Add a new entry for "type" in the section for standard plane properties.
>=20
> v3: improve paragraph about mixing legacy IOCTLs with explicit usage,
> note that a driver may support cursors without cursor planes (Daniel)
>=20
> v4: fixing rebase gone wrong
>=20
> v5:
> - Fix typo (Daniel)
> - Mention CAP_ATOMIC instead of CAP_UNIVERSAL_PLANES when referring to
>   atomic test-only commits (Daniel)
> - Add newlines at end of sections (Daniel)
>=20
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Pekka Paalanen <ppaalanen@gmail.com>
> ---
>  drivers/gpu/drm/drm_plane.c | 58 ++++++++++++++++++++++++++++++++++---
>  1 file changed, 54 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
> index bf6e525bb116..5affcc7f065b 100644
> --- a/drivers/gpu/drm/drm_plane.c
> +++ b/drivers/gpu/drm/drm_plane.c
> @@ -50,10 +50,8 @@
>   * &struct drm_plane (possibly as part of a larger structure) and regist=
ers it
>   * with a call to drm_universal_plane_init().
>   *
> - * The type of a plane is exposed in the immutable "type" enumeration pr=
operty,
> - * which has one of the following values: "Overlay", "Primary", "Cursor"=
 (see
> - * enum drm_plane_type). A plane can be compatible with multiple CRTCs, =
see
> - * &drm_plane.possible_crtcs.
> + * Each plane has a type, see enum drm_plane_type. A plane can be compat=
ible
> + * with multiple CRTCs, see &drm_plane.possible_crtcs.

Hi,

this part is kernel dev doc, right?

>   *
>   * Each CRTC must have a unique primary plane userspace can attach to en=
able
>   * the CRTC. In other words, userspace must be able to attach a different
> @@ -73,6 +71,58 @@
>   *
>   * DRM planes have a few standardized properties:
>   *
> + * type:
> + *     Immutable property describing the type of the plane.
> + *
> + *     For user-space which has enabled the &DRM_CLIENT_CAP_ATOMIC capab=
ility,
> + *     the plane type is just a hint and is mostly superseded by atomic
> + *     test-only commits. The type hint can still be used to come up more
> + *     easily with a plane configuration accepted by the driver.
> + *
> + *     The value of this property can be one of the following:
> + *
> + *     "Primary":
> + *         To light up a CRTC, attaching a primary plane is the most lik=
ely to
> + *         work if it covers the whole CRTC and doesn't have scaling or
> + *         cropping set up.
> + *
> + *         Drivers may support more features for the primary plane, user=
-space
> + *         can find out with test-only atomic commits.
> + *
> + *         Primary planes are implicitly used by the kernel in the legacy

s/Primary planes/Some primary planes/ perhaps? That would give the
justification for the below "user-space must not" sentence as there is
vagueness in what exactly happens with legacy.

Ok either way.

> + *         IOCTLs &DRM_IOCTL_MODE_SETCRTC and &DRM_IOCTL_MODE_PAGE_FLIP.
> + *         Therefore user-space must not mix explicit usage of any prima=
ry
> + *         plane (e.g. through an atomic commit) with these legacy IOCTL=
s.
> + *
> + *     "Cursor":
> + *         To enable this plane, using a framebuffer configured without =
scaling
> + *         or cropping and with the following properties is the most lik=
ely to
> + *         work:
> + *
> + *         - If the driver provides the capabilities &DRM_CAP_CURSOR_WID=
TH and
> + *           &DRM_CAP_CURSOR_HEIGHT, create the framebuffer with this si=
ze.
> + *           Otherwise, create a framebuffer with the size 64x64.
> + *         - If the driver doesn't support modifiers, create a framebuff=
er with
> + *           a linear layout. Otherwise, use the IN_FORMATS plane proper=
ty.
> + *
> + *         Drivers may support more features for the cursor plane, user-=
space
> + *         can find out with test-only atomic commits.
> + *
> + *         Cursor planes are implicitly used by the kernel in the legacy

s/Cursor planes/Some cursor planes/ like earlier?

> + *         IOCTLs &DRM_IOCTL_MODE_CURSOR and &DRM_IOCTL_MODE_CURSOR2.
> + *         Therefore user-space must not mix explicit usage of any cursor
> + *         plane (e.g. through an atomic commit) with these legacy IOCTL=
s.
> + *
> + *         Some drivers may support cursors even if no cursor plane is e=
xposed.
> + *         In this case, the legacy cursor IOCTLs can be used to configu=
re the
> + *         cursor.
> + *
> + *     "Overlay":
> + *         Neither primary nor cursor.
> + *
> + *         Overlay planes are the only planes exposed when the
> + *         &DRM_CLIENT_CAP_UNIVERSAL_PLANES capability is disabled.

This is a bit terse. Can we say anything more about overlay planes?
Even just "nothing is guaranteed, use test_only commits to find out
what works"?

> + *
>   * IN_FORMATS:
>   *     Blob property which contains the set of buffer format and modifier
>   *     pairs supported by this plane. The blob is a struct

In any case,
Reviewed-by: Pekka Paalanen <pekka.paalanen@collabora.com>


Thanks,
pq

--Sig_/UstC=BuNBBFCX5faV6yX.tU
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmAFTGAACgkQI1/ltBGq
qqc8OQ/9G83zIlKUvJKSy/Fww8s22uKBOq+44x2ETM3hreQmDomYLF9jHMN4qFND
9iT3KbxrPFnXZHBfGdwxx4vH75yVTVmsq8beoAJdXSPm0DFqHiDr3Zz53VvsOjRW
LpmrjSWWWOsaRD4WOU6ejAa858DpzjQ6exfFXASLXHaV7f9JA/hDoznyIRmBOz7T
Q3Kl/fpLu5xBJGGwL99eVgBRnJH6MwxA+JbxX5CENMvi3zG0RSoRFnmdtr5rgmIW
+nqVrkvtcTruqoOGJvv5vTEr61JDiTK5hUtaTQ5g/CuHTK0geRYTZZh2DqQO80xl
ys5mtNEdOAUgoWk/q1r228UZIZI6wUOgLyEhQTZ1hG11PuVtWyZqmmOj4gNQlVL5
JMfBCAY3UAcAmOob+mfylJ1MfJCCsm/hMoK0t+7Fvdb3vRSmwiOo+A4/eVQWYev3
bIly/erOHY0EXJ+E7LzfLbcDI9A8goTIWVAQIgBKUuphKAeaBEjitW7LKxwWE3+D
muoWxuiw44y5yOKN3v4s7gCWHbenFCSgM1y3D0VTuZ+bxXIQ/w+e6YRW8I9880tq
lHJYHj8VGHySoRtgeJFOp05wd6o6IxENql3FhwR+jF/Q7bmYlRkdo/FLKIaBh8kW
GX5mEvlTMiPo8sqKQnpi/eEus49jUVV1KNtQvQObh7PkCeeOzqg=
=DCBq
-----END PGP SIGNATURE-----

--Sig_/UstC=BuNBBFCX5faV6yX.tU--

--===============0313782221==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0313782221==--
