Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D0B25AA64
	for <lists+dri-devel@lfdr.de>; Wed,  2 Sep 2020 13:34:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E2E86E4AD;
	Wed,  2 Sep 2020 11:34:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1A546E4AD
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Sep 2020 11:34:52 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id e11so5454238ljn.6
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Sep 2020 04:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=chc0axp8W3a2n8MUocCRYfc2lo8DObUoCIyWYMUkMko=;
 b=r9cRfuZ7ukJXNHC48eXWKitebVhOeVnLwW046x8ui8G1GjYqT9/gVdItflGhWjgGjS
 VfRD1i8iSlPoo/S112jX7Ca9dXmZtvUOQo+eTh0BC2Wwfpm0h1Qe+AqtTuzIzuLCJWvM
 ktEMDhiAomtwmK47OWE0DPWKFzJ4ca4m2hoHuwcZQXbCdZJUGmRiRQN8/T/bzEjcZzwJ
 pJWJhuIKYD8YLzapoajOudJYWsU6fWgNTx9jnjvCU0kQ7+wzlTc36XMG/tS7pHZuZgHI
 DgoTIMXWXCphRTznEpqvcociOIYn7RdSopipLQi7Jx5oIy9FZzp5yXYH7T9nI3yAcnRZ
 Nz0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=chc0axp8W3a2n8MUocCRYfc2lo8DObUoCIyWYMUkMko=;
 b=KRfXo31KZMJmmemYhsz38aW5JiTxJkJFbGfi0EoBjprpg3V2uXygAydfVCv0QlK56H
 UX6gr/TNzuWsX6elaERQ+cy4qPXSxjJOoflGO7ui1+7OsAgr2lcVppdIncO0XLKcCd6S
 GNz7/h0uHh53eK2usID8vlx+vGR4Jfmc/Y7lUDju7Pk0UZy6e7oxGkEZir+uNXFEPN1b
 YAo0YKYhVM5IMbHkpXBjAVbIKukB1RgUK2fv6WVZO9OBkXXTgLCORgA49jdtzN7/6sDD
 ke9mShaADn+e2cdPIDCTxO7R4lIRGVaMNx4947MC1tqkdO6K2t0VA3ZPV4qLvxnIUWci
 cGJA==
X-Gm-Message-State: AOAM532o1SgJQBwCAqgLSrMIO82Iwo68vSZhkiOoMKHbabChS3eoHjQs
 p++Pp0TKwRbYRPrCOfrmZVk=
X-Google-Smtp-Source: ABdhPJzwtH59pDiF0fTfTuUX+9nY24/WxwWnBmGUBhhjoMs2+XUmvE75dQMlJwnwqKQOCwEwY8Y5qg==
X-Received: by 2002:a2e:9e98:: with SMTP id f24mr2988639ljk.204.1599046491163; 
 Wed, 02 Sep 2020 04:34:51 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id a192sm1029847lfd.51.2020.09.02.04.34.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Sep 2020 04:34:50 -0700 (PDT)
Date: Wed, 2 Sep 2020 14:34:47 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] drm/doc: Document that modifiers are always required
 for fb
Message-ID: <20200902143447.46bc5c00@eldfell>
In-Reply-To: <CAKMK7uHyX3_P_yK8=r9+XmeQcP3HcyMGNJNiJWAdHsRCQdCC+w@mail.gmail.com>
References: <20200902102440.3621733-1-daniel.vetter@ffwll.ch>
 <20200902140238.51089b99@eldfell>
 <CAKMK7uHyX3_P_yK8=r9+XmeQcP3HcyMGNJNiJWAdHsRCQdCC+w@mail.gmail.com>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Marek =?UTF-8?B?T2zFocOhaw==?= <maraeo@gmail.com>,
 Juston Li <juston.li@intel.com>, Daniel Stone <daniels@collabora.com>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0689349717=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0689349717==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/cH7vscO=.qtaR_r4p415I5F"; protocol="application/pgp-signature"

--Sig_/cH7vscO=.qtaR_r4p415I5F
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 2 Sep 2020 13:15:49 +0200
Daniel Vetter <daniel.vetter@ffwll.ch> wrote:

> On Wed, Sep 2, 2020 at 1:02 PM Pekka Paalanen <ppaalanen@gmail.com> wrote:
> >
> > On Wed,  2 Sep 2020 12:24:40 +0200
> > Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> > =20
> > > Even for legacy userspace, since otherwise GETFB2 is broken and if you
> > > switch between modifier-less and modifier-aware compositors, smooth
> > > transitions break.
> > >
> > > Also it's just best practice to make sure modifiers are invariant for
> > > a given drm_fb, and that a modifier-aware kms drivers only has one
> > > place to store them, ignoring any old implicit bo flags or whatever
> > > else might float around.
> > >
> > > Motivated by some irc discussion with Bas about amdgpu modifier
> > > support.
> > >
> > > Fixes: 455e00f1412f ("drm: Add getfb2 ioctl")
> > > Cc: Daniel Stone <daniels@collabora.com>
> > > Cc: Juston Li <juston.li@intel.com>
> > > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > > Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> > > Cc: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
> > > Cc: Marek Ol=C5=A1=C3=A1k <maraeo@gmail.com>
> > > Cc: "Wentland, Harry" <harry.wentland@amd.com>
> > > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > > ---
> > >  include/drm/drm_mode_config.h | 13 +++++++++++++
> > >  1 file changed, 13 insertions(+)
> > >
> > > diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_con=
fig.h
> > > index a18f73eb3cf6..5ffbb4ed5b35 100644
> > > --- a/include/drm/drm_mode_config.h
> > > +++ b/include/drm/drm_mode_config.h
> > > @@ -58,6 +58,12 @@ struct drm_mode_config_funcs {
> > >        * actual modifier used if the request doesn't have it specifie=
d,
> > >        * ie. when (@mode_cmd->flags & DRM_MODE_FB_MODIFIERS) =3D=3D 0.
> > >        *
> > > +      * IMPORTANT: These implied modifiers for legacy userspace must=
 be
> > > +      * stored in struct &drm_framebuffer, including all relevant me=
tadata
> > > +      * like &drm_framebuffer.pitches and &drm_framebuffer.offsets i=
f the
> > > +      * modifier enables additional planes beyond the fourcc pixel f=
ormat
> > > +      * code. This is required by the GETFB2 ioctl.
> > > +      *
> > >        * If the parameters are deemed valid and the backing storage o=
bjects in
> > >        * the underlying memory manager all exist, then the driver all=
ocates
> > >        * a new &drm_framebuffer structure, subclassed to contain
> > > @@ -915,6 +921,13 @@ struct drm_mode_config {
> > >        * @allow_fb_modifiers:
> > >        *
> > >        * Whether the driver supports fb modifiers in the ADDFB2.1 ioc=
tl call.
> > > +      *
> > > +      * IMPORTANT:
> > > +      *
> > > +      * If this is set the driver must fill out the full implicit mo=
difier
> > > +      * information in their &drm_mode_config_funcs.fb_create hook f=
or legacy
> > > +      * userspace which does not set modifiers. Otherwise the GETFB2=
 ioctl is
> > > +      * broken for modifier aware userspace.
> > >        */
> > >       bool allow_fb_modifiers;
> > > =20
> >
> > Hi,
> >
> > are there any drivers that would infer this information at
> > modeset/pageflip/atomic ioctl time instead of AddFB/AddFB2 time? =20
>=20
> Currently no, the only driver that infers anything for legacy is i915.
> Proposed amdgpu modifier patches don't work like that, but I think Bas
> is working on adding the modifier inference at addfb time for legacy
> userspace.
>=20
> > Userspace may be creating the FB once per buffer and keep re-using
> > that over several render/display cycles. If a driver was changing the
> > "effective modifiers" dynamically, userspace could break. =20
>=20
> Yeah this is why I want to lock this all down, since effective
> modifiers that change for a drm_fb object which is supposed to have
> all invariant metadata just isn't great uapi.

Sounds good to me!

Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>


Thanks,
pq

--Sig_/cH7vscO=.qtaR_r4p415I5F
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl9Pg1cACgkQI1/ltBGq
qqeHmQ/+Oxk3tDRAqp283x2zXmJtnHm6WoxGROmP3pqI8autt66/0DpQXMqKRlkc
tAnCoj3hBu3aGHT0vB1G24sbNImFRvnLK6/qIH6ohECZCG8DEqvb+udat8hKJ7lb
VZP07c3ETT3fgiTqv3Stuny9QaSUIiPDvEGXxZqm5Al6MWjRGLxB7cC6/GIoiN0o
yqjrctiXDXHZ5M25peqpkuBBrOU7ra+q5ibUHMvrZPy8FZxaKc/qWnc0q9EAeN4R
UP1I6GkZlGIl+s66Mer/89xGFqaARYMwWcUC7q2Cz5bOkqIF2WWEPtNVAhIPifd4
rzniEj4lR6SVA9zEZkKcIbO8YxyNi7kpPMpKi3KqlvcPoZ9IEAjrQAvnckLJu+iG
5R6LZ6IzAK/GtVm9RtCDwjXcHd6p60DIDMYk/FnnLSPDr7MlilcuF8A3MoYYf3d3
o0VNfpurv81KXNhShO5M9QU4er/hYrWpxAYQlzDPHeV6MVPh4ZtTTdq7XQ+xxMt5
yaMEOep2VarsC/kXZDGgO3AgHPYpDCgidmdosi/TtWQo/aRUFU8JbBP6O0GZ+ZR+
JeCGpIqixxKXQmbB43TkTDzhMe/O4OAkpX6DRkgfon/kkWt5wMFGykOeOOs/2Jqx
aqNwS9/wgwkbodTZXEB42xIae+BfVcl0gaNwJBsTnRg6qXCugh8=
=Tpos
-----END PGP SIGNATURE-----

--Sig_/cH7vscO=.qtaR_r4p415I5F--

--===============0689349717==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0689349717==--
