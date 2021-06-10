Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF27E3A2731
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 10:37:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 519806EC7E;
	Thu, 10 Jun 2021 08:36:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B17F36EC7E
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 08:36:57 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id k40so1918814lfv.7
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 01:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=9Hb98M86A2+uABWYjUNRbgvI5lIRQ0GGRiBIcGJo3+s=;
 b=Vo5gQ5nLJ+1VX+0fx7pcDUObUg9jn9PIMpuEHB1Q+C88kVyqSUDQQGAPslB+Cne+bl
 xu7lW2QSQ/x5hLgz3mc4SkmTndjQspaTL8KJ7I8F/SWV/HQjmuDN4OglftbWQd8drTqR
 fGCxtzm2mgdWkFcQ2O4LmYBtPod3ofqnFLlxs4euRsQ2a2TG+bwCvW5F1bxgb/YMGwBr
 t0fJkdU/nJNxUxdcCec5tystPXYb9+mPpvYdhDHqtpjUkXc87Whot80OeTRoLA3pghx+
 YYfsKJBtltIozr/5z/lykPYGZE6k1vLR5ymzyLVSLeJxRaZjOPv7TUVbqRYdoAsEUSI1
 d8IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=9Hb98M86A2+uABWYjUNRbgvI5lIRQ0GGRiBIcGJo3+s=;
 b=DzM9Ko4lWrlHL5kZ1ZCvtO/R74m8Z+0+F7FzFfRNnXd3GVibUQMXKASVtqqjlFK1UN
 UFbATCgxyPB0mKeYY9yNLFb/UzVs8WPt2y7THgGpzc97Gy0zgfd+4fjorW+yWW5OR9km
 lw/CEYnuu83KX8K5sLaOO5y6TLYzC3e6ddbTMr1p/87aQmdQSD4gRMzFf1MvINtQmpCa
 ytREU7R95Q5rBxB7BfarT+2fG4uBHlJmP5RtzKkzuecOAmVgCWMhDIlnxtesqLLyrpLX
 +WEIKOoHr9hQ2XP9/MlSGo0HNOrT4b2muA4Dha9ZXEvKppID9AU9kx4afXVdhUTGb2QC
 Qzuw==
X-Gm-Message-State: AOAM532pzjG41SeBe36tR9KTbsVp9wl2vOyutnz4XdYl0yoYNMsnWIln
 Xh2maEA43gePfvcWQuL944s=
X-Google-Smtp-Source: ABdhPJwwmBDOgQvJLDJozKs+nPSk9cV1wiarB3VMflgQZ8IvAlWC3B/vxrV0TDoavdxifHkpj0+upg==
X-Received: by 2002:a05:6512:224d:: with SMTP id
 i13mr1282080lfu.250.1623314216057; 
 Thu, 10 Jun 2021 01:36:56 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id h39sm251469lfv.140.2021.06.10.01.36.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jun 2021 01:36:55 -0700 (PDT)
Date: Thu, 10 Jun 2021 11:36:52 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Leandro Ribeiro <leandro.ribeiro@collabora.com>
Subject: Re: [PATCH v4 2/2] drm/doc: document drm_mode_get_plane
Message-ID: <20210610113652.48904e9c@eldfell>
In-Reply-To: <b26a33dd-39ac-48b4-7c9d-512d13ea9acd@collabora.com>
References: <20210609230039.73307-1-leandro.ribeiro@collabora.com>
 <20210609230039.73307-3-leandro.ribeiro@collabora.com>
 <b26a33dd-39ac-48b4-7c9d-512d13ea9acd@collabora.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/cAsU_dznKKygGz=5MtLYf9s"; protocol="application/pgp-signature"
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

--Sig_/cAsU_dznKKygGz=5MtLYf9s
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 9 Jun 2021 20:05:06 -0300
Leandro Ribeiro <leandro.ribeiro@collabora.com> wrote:

> On 6/9/21 8:00 PM, Leandro Ribeiro wrote:
> > Add a small description and document struct fields of
> > drm_mode_get_plane.
> >=20
> > Signed-off-by: Leandro Ribeiro <leandro.ribeiro@collabora.com>
> > ---
> >  include/uapi/drm/drm_mode.h | 36 ++++++++++++++++++++++++++++++++++++
> >  1 file changed, 36 insertions(+)
> >=20
> > diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> > index a5e76aa06ad5..67bcd8e1931c 100644
> > --- a/include/uapi/drm/drm_mode.h
> > +++ b/include/uapi/drm/drm_mode.h
> > @@ -312,16 +312,52 @@ struct drm_mode_set_plane {
> >  	__u32 src_w;
> >  };
> >=20
> > +/**
> > + * struct drm_mode_get_plane - Get plane metadata.
> > + *
> > + * Userspace can perform a GETPLANE ioctl to retrieve information abou=
t a
> > + * plane.
> > + *
> > + * To retrieve the number of formats supported, set @count_format_type=
s to zero
> > + * and call the ioctl. @count_format_types will be updated with the va=
lue.
> > + *
> > + * To retrieve these formats, allocate an array with the memory needed=
 to store
> > + * @count_format_types formats. Point @format_type_ptr to this array a=
nd call
> > + * the ioctl again (with @count_format_types still set to the value re=
turned in
> > + * the first ioctl call).
> > + *
> > + * Between one ioctl and the other, the number of formats may change.
> > + * Userspace should retry the last ioctl until this number stabilizes.=
 The
> > + * kernel won't fill any array which doesn't have the expected length.
> > + */ =20
>=20
> Actually I don't know if this last paragraph applies. For connectors,
> for instance, I can see this happening because of hot-plugging. But for
> plane formats I have no idea. As in libdrm we have this algorithm, I've
> decided to describe it here.

Hi,

I think it's fine.

However, the sentence "The kernel won't fill any array which doesn't
have the expected length." seems to be inaccurate, reading the code of
drm_mode_getplane(). It looks like it is enough for the array to have
sufficient space, it does not need to be the exact size.

So the libdrm algorithm may be slightly too pedantic, but it shouldn't
hurt.

Otherwise looks really good.


Thanks,
pq


> >  struct drm_mode_get_plane {
> > +	/**
> > +	 * @plane_id: Object ID of the plane whose information should be
> > +	 * retrieved. Set by caller.
> > +	 */
> >  	__u32 plane_id;
> >=20
> > +	/** @crtc_id: Object ID of the current CRTC. */
> >  	__u32 crtc_id;
> > +	/** @fb_id: Object ID of the current fb. */
> >  	__u32 fb_id;
> >=20
> > +	/**
> > +	 * @possible_crtcs: Bitmask of CRTC's compatible with the plane. CRTC=
's
> > +	 * are created and they receive an index, which corresponds to their
> > +	 * position in the bitmask. Bit N corresponds to
> > +	 * :ref:`CRTC index<crtc_index>` N.
> > +	 */
> >  	__u32 possible_crtcs;
> > +	/** @gamma_size: Number of entries of the legacy gamma lookup table. =
*/
> >  	__u32 gamma_size;
> >=20
> > +	/** @count_format_types: Number of formats. */
> >  	__u32 count_format_types;
> > +	/**
> > +	 * @format_type_ptr: Pointer to ``__u32`` array of formats that are
> > +	 * supported by the plane. These formats do not require modifiers.
> > +	 */
> >  	__u64 format_type_ptr;
> >  };
> >=20
> > --
> > 2.31.1
> >=20
> >  =20


--Sig_/cAsU_dznKKygGz=5MtLYf9s
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmDBzyQACgkQI1/ltBGq
qqfTFA/+JqKRuCUVT0RpOfH/U9S9G4Mj5Gw0Afvl9418N4ExbjwHJPjAFmoo/Gs6
DnOEcK6RCIIO6g7gO28gsRzhGjYcH4DjWwWfIHNoKYOFryvRb2AA7FY050GISiuU
djLwbUzStWksOERqzefINkJiu/oXfIfKXxaZwHRHHRkc1DOC3MjPJ/6SoJwKzbjm
xEvggyfzDEYJcaydObudvvsOh+ib39C/lfCu0tYb2UgdYUHCjaZFPiUssPmb00U/
S3qn75HBKm1LEHTg2UFlIv1lvoRec4TvNhsNwuL8uHsLoHhH9AKFOh4SUjd+KoXF
kx60BMLL/RSv1yCDocK4KFP3SSujPl8mMqebBBCOlrSdS/gK8Q12ofidUwcGwzda
T5uiJLnYG/Ggv3TpN2Pc5+RxBFiglR38ogzn9AfkJHnShJj4n0lzTDxu9dIT67E4
Sxhlu6585Fpx3SFYz2vMtGkKqLlkzhsf+SgwSoibo3qYVwAqP7gThsdaaCWwEF/t
yjFseRNaBBlMmQ8SyDl9JRd9eJ7Mc+auYc3w7gSL+bbI0jwoZvNCmXCu3p6lYZZJ
L1LP4lAaxlxSxEQFKcw/EN39x7aLoSvlnVOWWmQpCzclHL+YiwXFcAYRfZPK9iQL
CM/dh0/RdvVbVTjR3nasg7OHwGi2ozZ1PP0byhvgxr6mHNn7O1E=
=wnig
-----END PGP SIGNATURE-----

--Sig_/cAsU_dznKKygGz=5MtLYf9s--
