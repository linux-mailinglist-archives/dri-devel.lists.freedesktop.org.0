Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 574FF44D445
	for <lists+dri-devel@lfdr.de>; Thu, 11 Nov 2021 10:46:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6F7B6E99B;
	Thu, 11 Nov 2021 09:46:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 979E889F41
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Nov 2021 09:46:09 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id f18so12835202lfv.6
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Nov 2021 01:46:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=0q6p/cCy1L7rtbdao2N6XJU09vOh7583TxUgPjltnK0=;
 b=VVBulXe/meWXE52CaMuEgtKBmAlFTh5Ob9BWY9MmrKfwiU8yEb+1fcWs5VDypH9zpn
 byDzP+HOqT/FPMQpek2jA0Hr8k3Lyoon7/IctB0KhX4oYhw1GQQ9RcfZEQA5BapC/ufH
 Ocu02K70x4b08gOJDqIc7rPwve22RaBNeSrNPRC2EoV5mgFQbrPcVercf38hP++8xvCR
 ty0SzA34/5aL7vQANBmCjsdAsxrl1GTHyoVgP11LvugWiYm0FFfvG+mCaUZgpEZgYHra
 7CBx+PtnnsrHLt4qec9oBND+AXeay5/GMal96EhxBg4VqdJEdgdDd5FsuYtPMa9GuGNk
 ldAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=0q6p/cCy1L7rtbdao2N6XJU09vOh7583TxUgPjltnK0=;
 b=OsppNPHvjLGpcj2t4TdQHwbFI0j0E4TOxPbGksYpF47qkQxZA4B7M4ljzzEZTFhDFz
 nDkOPIcpVKAZ71HQOgN1WM5AyZ22Jdtffmf1RMJ93cJ4GPQvl3DaaRNArfu2a0eQAUza
 v9x3xPJQGWDmaJbTagSLxilyOQJO/Mdtfn6B4pL4TI0ZSBSn3muSjOmHGUYAsofOFpVP
 odQbSViP/77P/pdksH2M1CRo26tj82Oi0vPbbJ9gPiczSwmC9tcWfAVylwDMddGN4udt
 +46RVH3YUiZGIH8jyxhy6lGBTUR1sfiJj6aXeiueT48zrx05TsoWHx2RFDQD98ZmPuVy
 jpew==
X-Gm-Message-State: AOAM531kwPigAiIqXB1JnoSDx5f/tWvYhx7MeUS8Wu93ZYuCpHkj1a7B
 nAArZ/TNBlO5bmFC4Cg9GCs=
X-Google-Smtp-Source: ABdhPJy1hVz0pr6fk5+dFK2LQdhVIhiMUtF63t82eMQ5Kq0Xu3gVUbCBahzfH3HX1MHMwGbzqHxnPQ==
X-Received: by 2002:a05:6512:1096:: with SMTP id
 j22mr5298763lfg.237.1636623967897; 
 Thu, 11 Nov 2021 01:46:07 -0800 (PST)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id c4sm264930lfb.200.2021.11.11.01.46.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Nov 2021 01:46:07 -0800 (PST)
Date: Thu, 11 Nov 2021 11:46:04 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>, Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm: document DRM_IOCTL_MODE_GETFB2
Message-ID: <20211111114604.614e24ed@eldfell>
In-Reply-To: <YYo+UeTjGWU11+u6@phenom.ffwll.local>
References: <20211109085601.170275-1-contact@emersion.fr>
 <YYo+UeTjGWU11+u6@phenom.ffwll.local>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/QbfSqjE1rcRGjCJ+130fRs_";
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/QbfSqjE1rcRGjCJ+130fRs_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 9 Nov 2021 10:24:33 +0100
Daniel Vetter <daniel@ffwll.ch> wrote:

> On Tue, Nov 09, 2021 at 08:56:10AM +0000, Simon Ser wrote:
> > There are a few details specific to the GETFB2 IOCTL.
> >=20
> > It's not immediately clear how user-space should check for the
> > number of planes. Suggest using the pitches field.
> >=20
> > The modifier array is filled with zeroes, ie. DRM_FORMAT_MOD_LINEAR.
> > So explicitly tell user-space to not look at it unless the flag is
> > set.
> >=20
> > Signed-off-by: Simon Ser <contact@emersion.fr>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: Pekka Paalanen <ppaalanen@gmail.com>
> > ---
> >  include/uapi/drm/drm.h | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)

Hi Simon,

Regardless of your debate with danvet, this sounds fine to me, so

Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>


> >=20
> > diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
> > index 3b810b53ba8b..9809078b0f51 100644
> > --- a/include/uapi/drm/drm.h
> > +++ b/include/uapi/drm/drm.h
> > @@ -1096,6 +1096,22 @@ extern "C" {
> >  #define DRM_IOCTL_SYNCOBJ_TRANSFER	DRM_IOWR(0xCC, struct drm_syncobj_t=
ransfer)
> >  #define DRM_IOCTL_SYNCOBJ_TIMELINE_SIGNAL	DRM_IOWR(0xCD, struct drm_sy=
ncobj_timeline_array)
> > =20
> > +/**
> > + * DRM_IOCTL_MODE_GETFB2 - Get framebuffer metadata.
> > + *
> > + * This queries metadata about a framebuffer. User-space fills
> > + * &drm_mode_fb_cmd2.fb_id as the input, and the kernels fills the res=
t of the
> > + * struct as the output.
> > + *
> > + * If the client is not DRM master and doesn't have &CAP_SYS_ADMIN,
> > + * &drm_mode_fb_cmd2.handles will be zeroed. Planes are valid until on=
e has a
> > + * zero &drm_mode_fb_cmd2.pitches -- this can be used to compute the n=
umber of
> > + * planes. =20
>=20
> Maybe explain that when actually importing the buffer userspace should
> look for non-zeor handles instead, since some drivers/formats leave a
> silly pitch value behind. Or at least I think that can happen. Just for
> additional robustness?

Sounds like pitch is literally undefined sometimes as well. What else
would one call "silly" than undefined. Maybe implementation defined,
but that's not better.

>=20
> > + *
> > + * If the framebuffer has a format modifier, &DRM_MODE_FB_MODIFIERS wi=
ll be set
> > + * in &drm_mode_fb_cmd2.flags. Otherwise, &drm_mode_fb_cmd2.modifier h=
as
> > + * undefined contents. =20
>=20
> Uh is this true? We should always clear values to avoid accidental leaks
> and stuff.

This is userspace facing documentation, so saying "is undefined" is
perfectly fine. It just means "expect garbage here, so don't even
look", not that the kernel must literally leave that memory
uninitialized.


Thanks,
pq

>=20
> > + */ =20
>=20
> I think kerneldoc for drm_mode_fb_cmd2 would be neat too, so we can
> document how pitch is supposed to work and all that stuff.
>=20
> Anyway lgtm otherwise.
> -Daniel
>=20
> >  #define DRM_IOCTL_MODE_GETFB2		DRM_IOWR(0xCE, struct drm_mode_fb_cmd2)
> > =20
> >  /*
> > --=20
> > 2.33.1
> >=20
> >  =20
>=20


--Sig_/QbfSqjE1rcRGjCJ+130fRs_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmGM5lwACgkQI1/ltBGq
qqeawQ//VS1eacudVwFkcEDdA6ieutqwK5scuk5+ONLsh6oA0K+D1PGuSwppGwIX
37il01GVOAfTNwnvSYtqSazJHKLfYs7W93CcJPbsYkDwGNM+vAnGE+c2fqbkpDIX
C5GO5O+rg7zzBqtkBrZoUEWl9KI2vX9+gJ1Jhy+rlEsv/XFSlMXaQ3q96/DtZNpx
8kOxQh8Kvbkb2WUJJkMjT0Us/ThA5gYMqIhOaoqhOqK9iqLzdWi4pzBRWfwKm2Iu
aDvBsV8crreYTReoFdQg25CeJK3ieslkmK7ZH1+iMcggqMs/gCYvDr3bpqXG1Dt/
93cDHx+S29fQtdLS6pKRIF174HIoYaRbxGFPTcqoyZrZUU1VnnbYDftkuZQ2VjiC
/PkMzIJEj41nRVC2lgekqo0WiWR2AFGGWhjf17WhED6MTn3LnWEUYp4O6JPCQEls
N8mPFiC+Ptj1iwXrx5D1pxHB2R56EtIY3zZrbEEsGmVYdEityWtnXY34xJi/XKjv
yTxnMy/90xVVAkO0wYLcSEHmfQnlvkrHPMMZTHJfmpOFdn80XRg4Jo+J7aNBR5b+
/zDWqRkgiWwScp+W1a2eJ0GgKm+r5beiOq9TMpf1HRZAmA2JDTNPI5OBPiSS7Dhs
hQfvedk6C6C6pPDy3LlMW28bdc6gz8sbrOGVxEdeUJeEvkqydj4=
=Bclb
-----END PGP SIGNATURE-----

--Sig_/QbfSqjE1rcRGjCJ+130fRs_--
