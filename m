Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16EA361FA5
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2019 15:40:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFE2989C9B;
	Mon,  8 Jul 2019 13:39:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66FFC89A0F
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2019 13:39:58 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id x25so9208286ljh.2
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jul 2019 06:39:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=rFJ1YohAhChRBvN+rq4ZayJk8ZQVc91gQHNoz8T+GmI=;
 b=BEx7neLKt++V+1bJaBBrqX/W3jyqTLmjhUzewCTf5+8sdQxFbqTbKsRcPKFrOHWEUg
 t8L8cw0AGmiDxSMa9oY9hHHzUtvbWo1jIurLwTqRYZPehrQqXV0wD5ChSLB2USe1G3R8
 YUEYZlSE+lty86dO7PdxsQf2liaI1Hn/TTMXcZsv6+yPlBqKEW8t73h/WmM3WkJM++DV
 2BXF7ndumaVQ9sNnc1RJOjfi9BE3Lls1Z1WSln2iZgcIX6hNWqo1bCJJaV32kRBmLghg
 GN3pcEniaXLPKSbFPqbUtV8vFSrbpiwZUc6Mwvi7JDtz6zfN6sCml2zsyOuSsEcfX5vx
 fbhw==
X-Gm-Message-State: APjAAAUgb3K4SydW/F05yyMxve4a86PuSWHEY6utLnDqsrYUvyjfgJwA
 wUs3mNaWtl1pS9BhT1c8W6s=
X-Google-Smtp-Source: APXvYqwF4o3SZRjPILjE2EMx4peMIcjS5/ZJ7ngkaQyollrgOkYZ9gOrxdd75DermQFoCAU43w6YYg==
X-Received: by 2002:a2e:970d:: with SMTP id r13mr10383942lji.126.1562593196852; 
 Mon, 08 Jul 2019 06:39:56 -0700 (PDT)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id o17sm1824019ljg.71.2019.07.08.06.39.55
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 08 Jul 2019 06:39:56 -0700 (PDT)
Date: Mon, 8 Jul 2019 16:39:45 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 1/2] drm/vram: store dumb bo dimensions.
Message-ID: <20190708163945.1d3757b3@eldfell.localdomain>
In-Reply-To: <20190626162754.GV12905@phenom.ffwll.local>
References: <20190626065551.12956-1-kraxel@redhat.com>
 <20190626065551.12956-2-kraxel@redhat.com>
 <20190626144013.GB12510@ravnborg.org>
 <20190626162754.GV12905@phenom.ffwll.local>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version;
 bh=rFJ1YohAhChRBvN+rq4ZayJk8ZQVc91gQHNoz8T+GmI=;
 b=vMTQ7eJqZY5o5Dz5n2a+hG0SllLMSGixSn+JrbUtFO36GlZJ3mWkO6BM44RBISJ4dJ
 +Ntg5oRBCKceJcE5Az7Ook81sWZHD2TgMPEAeUgFc6MvOtJ8UhysuMNhOfmYXXkwdsvh
 oy979nzsd9GKHXp7bDlie9f5ANQlQar1kfxr6Eu0h1vgM+KsufAPMZWkTpgKjauleQry
 P1FSwZSjJkoOS1x8VaDGrkAzba6Zyf4nPakOuqirkN+LpAHrT1lRcDZGhLnmmewkf5of
 O2S4JCATvMS+rAkjy3YgLgavBE2IK9OuUBDbGT9/oLM7mdJymHvapns0v6t/QNj+HNep
 +zEw==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
 tzimmermann@suse.de, Sam Ravnborg <sam@ravnborg.org>
Content-Type: multipart/mixed; boundary="===============1669419026=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1669419026==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/wnlJH/ehfcclRFy4H4Y+==g"; protocol="application/pgp-signature"

--Sig_/wnlJH/ehfcclRFy4H4Y+==g
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 26 Jun 2019 18:27:54 +0200
Daniel Vetter <daniel@ffwll.ch> wrote:

> On Wed, Jun 26, 2019 at 04:40:13PM +0200, Sam Ravnborg wrote:
> > Hi Gerd.
> >=20
> > On Wed, Jun 26, 2019 at 08:55:50AM +0200, Gerd Hoffmann wrote: =20
> > > Store width and height of the bo.  Needed in case userspace
> > > sets up a framebuffer with fb->width !=3D bo->width..
> > >=20
> > > Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> > > ---
> > >  include/drm/drm_gem_vram_helper.h     | 1 +
> > >  drivers/gpu/drm/drm_gem_vram_helper.c | 2 ++
> > >  2 files changed, 3 insertions(+)
> > >=20
> > > diff --git a/include/drm/drm_gem_vram_helper.h b/include/drm/drm_gem_=
vram_helper.h
> > > index 1a0ea18e7a74..3692dba167df 100644
> > > --- a/include/drm/drm_gem_vram_helper.h
> > > +++ b/include/drm/drm_gem_vram_helper.h
> > > @@ -39,6 +39,7 @@ struct drm_gem_vram_object {
> > >  	struct drm_gem_object gem;
> > >  	struct ttm_buffer_object bo;
> > >  	struct ttm_bo_kmap_obj kmap;
> > > +	unsigned int width, height;
> > > =20
> > >  	/* Supported placements are %TTM_PL_VRAM and %TTM_PL_SYSTEM */
> > >  	struct ttm_placement placement;
> > > diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/=
drm_gem_vram_helper.c
> > > index 4de782ca26b2..c02bf7694117 100644
> > > --- a/drivers/gpu/drm/drm_gem_vram_helper.c
> > > +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
> > > @@ -377,6 +377,8 @@ int drm_gem_vram_fill_create_dumb(struct drm_file=
 *file,
> > >  	gbo =3D drm_gem_vram_create(dev, bdev, size, pg_align, interruptibl=
e);
> > >  	if (IS_ERR(gbo))
> > >  		return PTR_ERR(gbo);
> > > +	gbo->width =3D args->width;
> > > +	gbo->height =3D args->height;
> > > =20
> > >  	ret =3D drm_gem_handle_create(file, &gbo->gem, &handle);
> > >  	if (ret) =20
> >=20
> > Be warned, I may have missed something in the bigger picture.
> >=20
> > Your patch will set width and height only for dumb bo's
> > But we have several users of drm_gem_vram_create() that will
> > not set the width and height.
> >=20
> > So only in some cases can we rely on them being set.
> > Should this be refactored so we always set width, height.
> > Or maybe say in a small comment that width,height are only
> > set for dumb bo's? =20
>=20
> Also for dumb bo allocated buffers if userspace gets the dimensions wrong
> between dumb_create and the addfb, something is wrong. Papering over that
> by remembering the right dimensions doesn't look like a good solution.

Hi,

just a note irrelevant to this particular driver:

I have deliberately allocated a too high dumb buffer in userspace and
created multiple smaller DRM FBs out of it with different offsets
(i * 128 * stride). This has been a very useful hack to see that a
GPU-less driver actually honours fences correctly, because if it
doesn't, the whole image will be off by the offset delta, which is
epileptically easy to see.

So I'm not getting the height wrong, I am deliberately overallocating
and aliasing.


Thanks,
pq

--Sig_/wnlJH/ehfcclRFy4H4Y+==g
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl0jR6IACgkQI1/ltBGq
qqeSQA/+J+YqrwtK1roO/I1eO3EqtoZ5Q0OMdQls7KQTtoG4X1z2oZpHtU52JvNG
xv96kK9Ci3VbIRRoO14+Qp9Rvc0k3V7QP4/l2T/+/NameNlWv5lI8MRS6rmFEP4M
0qUWWvasbP63KvRpl2k/Dr8Bg3JfeLYfisPYziV+AeUxOvEfYAAq5w5+kuYRndwB
i/DHLI0SXJsveIZRiwOwqWheMBQJDM2w3j8j+SrZ00en4M6oUgKzkIqVgLHlIm51
cmBGeVxyh+HbJ2gBBMGzOFccfKe31OgjrJv+d8FsX4KX+mojZfV9qm75I2eZp24V
GruUjf1/yifSvRXsD4CdA3AA9VCzMUrrpODO6LQvW7iRm9mHdEuWWkWZyDNTL1pr
d1eSrsX+TxQklLAmdziBw1eb6ryc87bRG5O1zfrAPItNeCULnf5VT5MjNL4Qhu5b
14i+DnOkGiiQKafMTmMVb9SwGMxR2MaBIVhQauu6RdC2C5hCZBFe96j612dDndUy
iJSBlb4xgGgDdeLD2OsyqhFEcQxg5RuvK5uRVPcy0irqs6rlyWcdcY+PLjsPj2Dt
JEbBxJgYLjsa2Dtsa5dMb7Z5wtNFXuEDbsKFWoAJhJ7vd1OxURYOkOlg/ubftzrC
7njt14ETHiyYQwY8zrWvJwixTYuLGVNzsymqPemUkXj3cc575L8=
=/yEE
-----END PGP SIGNATURE-----

--Sig_/wnlJH/ehfcclRFy4H4Y+==g--

--===============1669419026==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1669419026==--
