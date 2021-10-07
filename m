Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81EC0424E3C
	for <lists+dri-devel@lfdr.de>; Thu,  7 Oct 2021 09:45:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE69D6F395;
	Thu,  7 Oct 2021 07:45:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC86C6F395
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Oct 2021 07:45:33 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id j5so21176481lfg.8
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Oct 2021 00:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=jdiSk8DLYR4sxjmOVjd7IX+ZE5O3wS8cDFvfn6S0xJY=;
 b=arIplawoF/Bfim1D5SHCpyu8vfikA8GsRzZoUTR7pYxY9Mxw9yyET9qcuQ3kBP3RGj
 m3OOSs74IDTQxQ6uFwMMDzPt97b7Arssz6dXs7K9KCCcrNJtEaohlcSLPDT7Gpzz6hkH
 J9cP9qJavnNucjyeMeEILLYXdh4CjVElpitGCdYC8FKS25u4cBnnYPPz4uCAkXmTy0kh
 2OpCsRR9fznAxT9WTVo6mGg1qtkx+nxR1TQlPiVc1VIV2990Y8bbX0dVK+hXeNK2VpU6
 E156lH8SwHIba1hAHVT/DRM1AevyDinikXM1xDaPHoUlAaRmABzb98QsIG191Ne4tB83
 SsNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=jdiSk8DLYR4sxjmOVjd7IX+ZE5O3wS8cDFvfn6S0xJY=;
 b=wvB9JiuCbl8PelBeVZbnabxq5QApWrxnnPJzE1Ee76gNLJlOosa73efwn2T1f+S7DV
 oxVeYwSnreZ/vxO5cICrn2SnSgcmQhjQ9ThuaGlG+asIkXRTnQUuLLivc5/ewQLItESh
 lXjKQ6n/MBcKSfvqLPlZBPxsktl76x+joQ3H/sFlyRD010CfE8YJH3RAVv0uGNX6cR7Q
 YTm5X33hKEJ5jXbl98rQU+XLRMzeUQanUJCJQlsJflCnzVo3OBcSQ2/lZVgMP6s2jScE
 4/EIfUp1sAJciewRoMBYU2nUuMTqCib8lyjbMAyxiKqkDsabNGkF+GhVYNQnuY8cyais
 PKcA==
X-Gm-Message-State: AOAM531gw8OGOm5ArGdSlmAr3tAbc2u9tb7TReslsVk2VBNa+4ioja/S
 RJzbVOrBe2M0MdlduwpkEFI=
X-Google-Smtp-Source: ABdhPJx/hTiT9F/2U4Io44cAoJH1MjS9NtdJAQuPK7dJc5JPasXm02Y1LCrMhQhOv33bcTYHUvuB1g==
X-Received: by 2002:ac2:488e:: with SMTP id x14mr2768805lfc.683.1633592732047; 
 Thu, 07 Oct 2021 00:45:32 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id l18sm1460376lje.140.2021.10.07.00.45.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 00:45:31 -0700 (PDT)
Date: Thu, 7 Oct 2021 10:45:21 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Simon Ser <contact@emersion.fr>, dri-devel
 <dri-devel@lists.freedesktop.org>, Hans de Goede <hdegoede@redhat.com>,
 Dennis Filder <d.filder@web.de>
Subject: Re: [PATCH RFC] drm: introduce DRM_MODE_FB_PERSIST
Message-ID: <20211007104521.24b75b95@eldfell>
In-Reply-To: <CAKMK7uGsFDGR7TFR1A5utrtyOL19Vc2=MEXO3XLbEOexJcuj0A@mail.gmail.com>
References: <20211006151921.312714-1-contact@emersion.fr>
 <CAKMK7uGsFDGR7TFR1A5utrtyOL19Vc2=MEXO3XLbEOexJcuj0A@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/YkWzFQHux_rbFIh7Dq2dMdr";
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/YkWzFQHux_rbFIh7Dq2dMdr
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 6 Oct 2021 21:24:44 +0200
Daniel Vetter <daniel@ffwll.ch> wrote:

> On Wed, Oct 6, 2021 at 5:19 PM Simon Ser <contact@emersion.fr> wrote:
> > This new ADDFB2 flag allows callers to mark a framebuffer as
> > "persistent", and no longer have RMFB semantics when the DRM
> > file is closed.
> >
> > [1]: https://lore.kernel.org/dri-devel/YTJypepF1Hpc2YYT@reader/
> >
> > Signed-off-by: Simon Ser <contact@emersion.fr>
> > Cc: Hans de Goede <hdegoede@redhat.com>
> > Cc: Dennis Filder <d.filder@web.de>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: Pekka Paalanen <ppaalanen@gmail.com>
> > ---
> >
> > I'm not sure this is enough, but posting this to get initial
> > feedback and allow to start e.g. Plymouth experiments. I'll
> > follow up with an IGT test soon.
> >
> >  drivers/gpu/drm/drm_framebuffer.c |  6 ++++--
> >  include/uapi/drm/drm_mode.h       | 15 +++++++++++++++
> >  2 files changed, 19 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_fr=
amebuffer.c
> > index 07f5abc875e9..9b398838e1f4 100644
> > --- a/drivers/gpu/drm/drm_framebuffer.c
> > +++ b/drivers/gpu/drm/drm_framebuffer.c
> > @@ -292,7 +292,8 @@ drm_internal_framebuffer_create(struct drm_device *=
dev,
> >         struct drm_framebuffer *fb;
> >         int ret;
> >
> > -       if (r->flags & ~(DRM_MODE_FB_INTERLACED | DRM_MODE_FB_MODIFIERS=
)) {
> > +       if (r->flags & ~(DRM_MODE_FB_INTERLACED | DRM_MODE_FB_MODIFIERS=
 |
> > +                        DRM_MODE_FB_PERSIST)) {
> >                 DRM_DEBUG_KMS("bad framebuffer flags 0x%08x\n", r->flag=
s);
> >                 return ERR_PTR(-EINVAL);
> >         }
> > @@ -789,7 +790,8 @@ void drm_fb_release(struct drm_file *priv)
> >          * at it any more.
> >          */
> >         list_for_each_entry_safe(fb, tfb, &priv->fbs, filp_head) {
> > -               if (drm_framebuffer_read_refcount(fb) > 1) {
> > +               if (drm_framebuffer_read_refcount(fb) > 1 &&
> > +                   !(fb->flags & DRM_MODE_FB_PERSIST)) {
> >                         list_move_tail(&fb->filp_head, &arg.fbs);
> >                 } else {
> >                         list_del_init(&fb->filp_head);
> > diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> > index e1e351682872..c7a7089ec31e 100644
> > --- a/include/uapi/drm/drm_mode.h
> > +++ b/include/uapi/drm/drm_mode.h
> > @@ -662,6 +662,21 @@ struct drm_mode_fb_cmd {
> >
> >  #define DRM_MODE_FB_INTERLACED (1<<0) /* for interlaced framebuffers */
> >  #define DRM_MODE_FB_MODIFIERS  (1<<1) /* enables ->modifer[] */
> > +/**
> > + * DRM_MODE_FB_PERSIST
> > + *
> > + * DRM framebuffers are normally implicitly removed when their owner c=
loses the
> > + * DRM FD. Passing this flag will make the framebuffer persistent: it =
will not
> > + * be implicitly removed. This is useful to implement flicker-free tra=
nsitions
> > + * between two processes.
> > + *
> > + * This flag doesn't change the behavior of &DRM_IOCTL_MODE_RMFB.
> > + *
> > + * User-space should ensure the framebuffer doesn't expose any sensiti=
ve user
> > + * information: persistent framebuffers can be read back by the next D=
RM
> > + * master. =20
>=20
> Should probably explain here that the persistent fb stays around for
> as long as it's still in use by a plane, but will disappear
> automatically when it's no longer in active use.

Yes, I think that is an important detail.

> Also I guess there was some discussion I've missed on why we exclude
> rmfb from this (unlike the CLOSEFB thing robclark proposed ages ago).

What does that mean? Was the CLOSEFB proposal saying that doing an RMFB
on a persistent FB does not actually RM the FB? If so, what effect did
it have, did it only invalidate the userspace FB ID?

That is an interesting thought. Userspace would not need to
deliberately "leak" the FB ID, it could still RMFB it which feels more
clean to me.

What if persistence was a flag on RMFB instead? If userspace forgets to
call RMFB at all, then closing the device removes the FB and avoids
information leaks. Only by doing special RMFB would allow the FB to
remain after closing the device. That should also encourage userspace
to track their FBs better.

> The nice thing about closefb is that you can give it persistent
> semantics retroactively, so don't need to re-wrap an gem_bo and do a
> page flip when you quit.

When you quit, you are going to need to draw once more anyway to get
rid of any potentially sensitive information for sure, so the re-wrap
does not seem much extra to me. OTOH, I guess userspace code would be a
little simpler if it does not need to re-wrap (assuming the code
already keeps FB IDs around and does not re-ADDFB on every flip -
weston does this caching).

I think my order of favourites is:
 1. RMFB flag
 2. ioctl to set an existing FB as persistent
 3. ADDFB flag

They all seem workable to me.


Thanks,
pq

> -Daniel
>=20
> > + */
> > +#define DRM_MODE_FB_PERSIST (1 << 2)
> >
> >  struct drm_mode_fb_cmd2 {
> >         __u32 fb_id;
> > --
> > 2.33.0
> >
> > =20
>=20
>=20


--Sig_/YkWzFQHux_rbFIh7Dq2dMdr
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmFepZEACgkQI1/ltBGq
qqfckRAAhO3c2rxRWqCSRj7J0OxSedRQfIhpsEqHteNt8hwf+R6troScabGB9ei/
dA3nLhfMb2f+DnlopN279ZoDUV5+j5b4UmK3odphAXd88NCIdJPerS4LCKYnOGTo
swJ1WhTOm+lFLG0dQ8iJba8pbpkHMtvcYwJJuZVT/igqdIOBPtmH3VaY/5+LGuqK
xbPJw9KspaTJLBmqzwiqbJ1Qc89v2I9fLknTlxBm4rTmx1CtIfxScztxQ4luyeO4
xhGvA4MikC4ooOsS3mkUmA1u3FcA1GiuLM/mCLXzV2cDU4aJufONs0DaFiDbcVK8
CyB8RJdQ60x6QBDqX6pxhagDfazRf1NpZgbXbZVFPcwdqAK9exk7y+4VTppJdOUF
C8rPazGlLy62vZUjTZNlJciWPS1PGgwrN1vq7MIpCIGoUWMuyvSR+/GZNCYVzhZH
/uzS92DJOl+lO1ajc8VNCADXVt3Mdz1rryLXPVPWPobYKd0dUKyj+gH8SzhLfJNB
uOF0yCkND3bU90uCv9wmWsPYuO3/6+gAnM+DEgo6U13buRtpr8ND++Fx16cd5iCK
RMdqUGiHWmVqCqc1UaY+KXuqfxgOjWvc/YqmVsYYNga89fIliwOyao+1qBnFgkE7
2zfrpKLplsL9tJyy8Cmi0zl+b+54wOZFjU5Y6Uq4/6TZBJ9c0hE=
=QDNh
-----END PGP SIGNATURE-----

--Sig_/YkWzFQHux_rbFIh7Dq2dMdr--
