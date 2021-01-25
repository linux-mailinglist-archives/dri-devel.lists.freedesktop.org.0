Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE9683026EB
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jan 2021 16:33:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52D106E0F1;
	Mon, 25 Jan 2021 15:33:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E62146E0F1
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jan 2021 15:33:00 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id g3so18624976ejb.6
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jan 2021 07:33:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pFMiLcTGMkn5XShnGETZVdEyqh3X/2/4ndtWaw25yi0=;
 b=haF4Vn6yNFydcY5QjYaoTaqUG7fEvcJ85WhB0iBCVOqbH71FIPsNKMPNgIEMXX1W70
 FQlwHp6o3nouqDu2+fMHugzN56qNb6O/w4Sk5SQY5u5xPYnb14S8M2qiGijOgGyzc8OM
 Pb0j/ELvRDgIfsc+q+Aww9wKtZ9fzz66k9a6UuJOj3bdd74RaNZlomuURaC6UhpDSQBl
 RKxLVHNZK/G1Ab08z4IdxaHyEmgvVZvJSrtJpmPMuqV36zk0imNtr2bopZIUnLyisJvJ
 nzMpUU05A2FEAeziYvsQIARv+hSTfpeUwmI/OwBpHQQxhe+O30qY4SRElAH8HbcQuYyj
 ANow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pFMiLcTGMkn5XShnGETZVdEyqh3X/2/4ndtWaw25yi0=;
 b=tbHDNjIH+1gqRI2CgDjYQIzKtKEuWEu4KL9BaEDut90UAlDpn4CShATEELYG+Uzp1f
 FafQZJ7eeY3jQsIhKC9mQcmI84vIC3Vg5fsub038CfnIq1ANmIrWwPl6HkEw5EMyJMKf
 ysbw0qpcrmZSSmMItZpHQxmjI/RJaZI7FgJkBhkgBLZVSs2BmnrS2NRLQD9mAMzv6kGA
 Xi6ebWm+6fmJWHao5luTO2QukcXj/v63YofsL0GjabrJfhbzTUDaIB+XGRwDBrpEVgJF
 mUY1nzXp1hnA6KBWlxKt0sbGYt+CHqLZE2DpP+bBfwvii5Im5CokIGiJd0tpsheTsvDw
 MrjQ==
X-Gm-Message-State: AOAM530rAp2jbyq4dDankHTJ15QdDNdhZ/+pNfy+5p37qbkN5fXgPKG/
 OCc7bVQC1KxfFk1id/QXw/LnUWzBhhz/EOPTLdpJXJXJaYc=
X-Google-Smtp-Source: ABdhPJwoT5N1dL+z0mg69vM5x/q7d1XIhbiL1sGLMr/ugYRv6wZiCzn9kdoo37dVZVTGXCwgJopcJqI3K19IXBZ2ycU=
X-Received: by 2002:a17:906:5958:: with SMTP id
 g24mr697205ejr.377.1611588779573; 
 Mon, 25 Jan 2021 07:32:59 -0800 (PST)
MIME-Version: 1.0
References: <20210124204748.25234-1-mario.kleiner.de@gmail.com>
 <YA614iI5kHJMATye@intel.com>
In-Reply-To: <YA614iI5kHJMATye@intel.com>
From: Mario Kleiner <mario.kleiner.de@gmail.com>
Date: Mon, 25 Jan 2021 16:32:48 +0100
Message-ID: <CAEsyxyhspu5BfgVxfDkXBC1PM-m0+=iV7hUOO0Y2m+6APTm=gg@mail.gmail.com>
Subject: Re: [PATCH] drm/simple-kms: Drop drm_simple_kms_format_mod_supported.
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1044011980=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1044011980==
Content-Type: multipart/alternative; boundary="000000000000bb063a05b9bb402b"

--000000000000bb063a05b9bb402b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 25, 2021 at 1:13 PM Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linu=
x.intel.com>
wrote:

> On Sun, Jan 24, 2021 at 09:47:48PM +0100, Mario Kleiner wrote:
> > The check was introduced to make sure that only the
> > DRM_FORMAT_MOD_LINEAR modifier is accepted by tinydrm.
> >
> > However, if .format_mod_supported is not hooked up to
> > drm_simple_kms_format_mod_supported then the core will
> > simply validate modifiers against the format_modifiers
> > list passed into drm_simple_display_pipe_init() or
> > drm_universal_plane_init() and perform the same validation
> > as drm_simple_kms_format_mod_supported() would have done.
> >
> > Additionally, if a kms driver / plane does not support
> > modifiers, it will not reject fb updates with no modifiers/
> > DRM_FORMAT_MOD_INVALID. This is important, because some
> > simple drm drivers, e.g., pl111, pass NULL as format_modifiers
> > list, so modifier support is disabled for these drivers,
> > userspace would fall back to drmAddFB() without modifiers,
> > and ergo the current drm_simple_kms_format_mod_supported()
> > function would reject valid modifier-less fb's.
> >
> > So this should fix display on non-tinydrm drivers like
> > pl111, and probably also for non-atomic clients?
> >
> > The Mesa vc4 gallium driver mentions pl111 as one possible
> > display driver in render_only mode, so i assume this matters
> > for some SoC's?
> >
> > The background for the patch that introduced this was to
> > fix atomic modesetting in the X-Servers modesetting-ddx,
> > but with atomic modesetting and format modifiers disabled
> > in modesetting-ddx (and also current kernels when interacting
> > with modesetting-ddx), i assume this should fix some panels.
> >
> > Note that i don't have any of the hw required for testing
> > this, this is purely based on looking at the code, so this
> > patch is only compile-tested.
> >
> > For more reference, this fix was motivated by some discussions
> > around broken page-flipping on VideoCore6 / RaspberryPi 4
> > with current Raspbian OS, so the experts may want to weigh
> > in on that Mesa bug report as well, under the following link:
> >
> > https://gitlab.freedesktop.org/mesa/mesa/-/issues/3601
> >
> > Fixes: dff906c3f91c ("drm/tinydrm: Advertise that we can do only
> DRM_FORMAT_MOD_LINEAR.")
> > Signed-off-by: Mario Kleiner <mario.kleiner.de@gmail.com>
> > Cc: Eric Anholt <eric@anholt.net>
> > Cc: Noralf Tr=C3=B8nnes <noralf@tronnes.org>
> > Cc: Maxime Ripard <mripard@kernel.org>
> > ---
> >  drivers/gpu/drm/drm_simple_kms_helper.c | 8 --------
> >  1 file changed, 8 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_simple_kms_helper.c
> b/drivers/gpu/drm/drm_simple_kms_helper.c
> > index 743e57c1b44f..5f3e30553172 100644
> > --- a/drivers/gpu/drm/drm_simple_kms_helper.c
> > +++ b/drivers/gpu/drm/drm_simple_kms_helper.c
> > @@ -229,13 +229,6 @@ static void drm_simple_kms_plane_cleanup_fb(struct
> drm_plane *plane,
> >       pipe->funcs->cleanup_fb(pipe, state);
> >  }
> >
> > -static bool drm_simple_kms_format_mod_supported(struct drm_plane *plan=
e,
> > -                                             uint32_t format,
> > -                                             uint64_t modifier)
> > -{
> > -     return modifier =3D=3D DRM_FORMAT_MOD_LINEAR;
> > -}
> > -
> >  static const struct drm_plane_helper_funcs
> drm_simple_kms_plane_helper_funcs =3D {
> >       .prepare_fb =3D drm_simple_kms_plane_prepare_fb,
> >       .cleanup_fb =3D drm_simple_kms_plane_cleanup_fb,
> > @@ -250,7 +243,6 @@ static const struct drm_plane_funcs
> drm_simple_kms_plane_funcs =3D {
> >       .reset                  =3D drm_atomic_helper_plane_reset,
> >       .atomic_duplicate_state =3D drm_atomic_helper_plane_duplicate_sta=
te,
> >       .atomic_destroy_state   =3D drm_atomic_helper_plane_destroy_state=
,
> > -     .format_mod_supported   =3D drm_simple_kms_format_mod_supported,
>
> This will now cause also this driver to report a totally borked
> IN_FORMATS blob.
>
> Would need this
> https://patchwork.freedesktop.org/series/83018/
>
>
The slight problem with that (see my comments in the linked Mesa bug
report), is that at least one common userspace driver - modesetting-ddx -
treat a lack of an IN_FORMATS blob not as "don't use modifiers for
drm_framebuffers", but as "everything goes" -- Use every modifier and
tiling format that the graphics driver exposes also for scanout buffers.
I'm arguing in that bug report that modesetting-ddx shouldn't use atomic or
modifiers at all, given how broken that driver is atm. in that area, so i'm
not sure if my argument here is valid. Just saying that doing the "every
modifier is valid for every format" in absence of  format_mod_supported()
would probably be less harmful to some existing userspace. Ofc. then
there's a reason why atomic gets rejected by the kernel for current
modesetting-ddx...

I'm not sure if I'm arguing pro or contra your patch here btw. Just
pointing out one possible victim if it were applied.

but IIRC the bikeshed around that kinda suggested we should just
> implement .format_mod_support() always. Can't quite recall the
> details anymore.
>
>
I see. But if .format_mod_supported() is always implemented, then we'd need
to handle the case modifier =3D=3D DRM_FORMAT_MOD_INVALID in the core or in
each format_mod_supported() implementation, because currently iff this is
hooked up, it gets always used, even if the user-space does not use
modifiers. The X-Servers modesetting-ddx, e.g., does not use atomic or
modifiers by default, and the linked Mesa bug report shows why - or at
least why it shouldn't atm. I think none of the X drivers does.

The softer alternative solution instead of my patch would be to also accept
modifier =3D=3D DRM_FORMAT_MOD_INVALID as valid for simple kms drivers.
-mario

--000000000000bb063a05b9bb402b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Mon, Jan 25, 2021 at 1:13 PM Ville Syr=
j=C3=A4l=C3=A4 &lt;<a href=3D"mailto:ville.syrjala@linux.intel.com">ville.s=
yrjala@linux.intel.com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">On Sun, Jan 24, 2021 at 09=
:47:48PM +0100, Mario Kleiner wrote:<br>
&gt; The check was introduced to make sure that only the<br>
&gt; DRM_FORMAT_MOD_LINEAR modifier is accepted by tinydrm.<br>
&gt; <br>
&gt; However, if .format_mod_supported is not hooked up to<br>
&gt; drm_simple_kms_format_mod_supported then the core will<br>
&gt; simply validate modifiers against the format_modifiers<br>
&gt; list passed into drm_simple_display_pipe_init() or<br>
&gt; drm_universal_plane_init() and perform the same validation<br>
&gt; as drm_simple_kms_format_mod_supported() would have done.<br>
&gt; <br>
&gt; Additionally, if a kms driver / plane does not support<br>
&gt; modifiers, it will not reject fb updates with no modifiers/<br>
&gt; DRM_FORMAT_MOD_INVALID. This is important, because some<br>
&gt; simple drm drivers, e.g., pl111, pass NULL as format_modifiers<br>
&gt; list, so modifier support is disabled for these drivers,<br>
&gt; userspace would fall back to drmAddFB() without modifiers,<br>
&gt; and ergo the current drm_simple_kms_format_mod_supported()<br>
&gt; function would reject valid modifier-less fb&#39;s.<br>
&gt; <br>
&gt; So this should fix display on non-tinydrm drivers like<br>
&gt; pl111, and probably also for non-atomic clients?<br>
&gt; <br>
&gt; The Mesa vc4 gallium driver mentions pl111 as one possible<br>
&gt; display driver in render_only mode, so i assume this matters<br>
&gt; for some SoC&#39;s?<br>
&gt; <br>
&gt; The background for the patch that introduced this was to<br>
&gt; fix atomic modesetting in the X-Servers modesetting-ddx,<br>
&gt; but with atomic modesetting and format modifiers disabled<br>
&gt; in modesetting-ddx (and also current kernels when interacting<br>
&gt; with modesetting-ddx), i assume this should fix some panels.<br>
&gt; <br>
&gt; Note that i don&#39;t have any of the hw required for testing<br>
&gt; this, this is purely based on looking at the code, so this<br>
&gt; patch is only compile-tested.<br>
&gt; <br>
&gt; For more reference, this fix was motivated by some discussions<br>
&gt; around broken page-flipping on VideoCore6 / RaspberryPi 4<br>
&gt; with current Raspbian OS, so the experts may want to weigh<br>
&gt; in on that Mesa bug report as well, under the following link:<br>
&gt; <br>
&gt; <a href=3D"https://gitlab.freedesktop.org/mesa/mesa/-/issues/3601" rel=
=3D"noreferrer" target=3D"_blank">https://gitlab.freedesktop.org/mesa/mesa/=
-/issues/3601</a><br>
&gt; <br>
&gt; Fixes: dff906c3f91c (&quot;drm/tinydrm: Advertise that we can do only =
DRM_FORMAT_MOD_LINEAR.&quot;)<br>
&gt; Signed-off-by: Mario Kleiner &lt;<a href=3D"mailto:mario.kleiner.de@gm=
ail.com" target=3D"_blank">mario.kleiner.de@gmail.com</a>&gt;<br>
&gt; Cc: Eric Anholt &lt;<a href=3D"mailto:eric@anholt.net" target=3D"_blan=
k">eric@anholt.net</a>&gt;<br>
&gt; Cc: Noralf Tr=C3=B8nnes &lt;<a href=3D"mailto:noralf@tronnes.org" targ=
et=3D"_blank">noralf@tronnes.org</a>&gt;<br>
&gt; Cc: Maxime Ripard &lt;<a href=3D"mailto:mripard@kernel.org" target=3D"=
_blank">mripard@kernel.org</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 drivers/gpu/drm/drm_simple_kms_helper.c | 8 --------<br>
&gt;=C2=A0 1 file changed, 8 deletions(-)<br>
&gt; <br>
&gt; diff --git a/drivers/gpu/drm/drm_simple_kms_helper.c b/drivers/gpu/drm=
/drm_simple_kms_helper.c<br>
&gt; index 743e57c1b44f..5f3e30553172 100644<br>
&gt; --- a/drivers/gpu/drm/drm_simple_kms_helper.c<br>
&gt; +++ b/drivers/gpu/drm/drm_simple_kms_helper.c<br>
&gt; @@ -229,13 +229,6 @@ static void drm_simple_kms_plane_cleanup_fb(struc=
t drm_plane *plane,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0pipe-&gt;funcs-&gt;cleanup_fb(pipe, state);<=
br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; -static bool drm_simple_kms_format_mod_supported(struct drm_plane *pla=
ne,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0uint32_t format,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0uint64_t modifier)<br>
&gt; -{<br>
&gt; -=C2=A0 =C2=A0 =C2=A0return modifier =3D=3D DRM_FORMAT_MOD_LINEAR;<br>
&gt; -}<br>
&gt; -<br>
&gt;=C2=A0 static const struct drm_plane_helper_funcs drm_simple_kms_plane_=
helper_funcs =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0.prepare_fb =3D drm_simple_kms_plane_prepare=
_fb,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0.cleanup_fb =3D drm_simple_kms_plane_cleanup=
_fb,<br>
&gt; @@ -250,7 +243,6 @@ static const struct drm_plane_funcs drm_simple_kms=
_plane_funcs =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0.reset=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =3D drm_atomic_helper_plane_reset,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0.atomic_duplicate_state =3D drm_atomic_helpe=
r_plane_duplicate_state,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0.atomic_destroy_state=C2=A0 =C2=A0=3D drm_at=
omic_helper_plane_destroy_state,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0.format_mod_supported=C2=A0 =C2=A0=3D drm_simple_=
kms_format_mod_supported,<br>
<br>
This will now cause also this driver to report a totally borked<br>
IN_FORMATS blob.<br>
<br>
Would need this<br>
<a href=3D"https://patchwork.freedesktop.org/series/83018/" rel=3D"noreferr=
er" target=3D"_blank">https://patchwork.freedesktop.org/series/83018/</a><b=
r>
<br></blockquote><div><br></div><div>The slight problem with that (see my c=
omments in the linked Mesa bug report), is that at least one common userspa=
ce driver - modesetting-ddx - treat a lack of an IN_FORMATS blob not as &qu=
ot;don&#39;t use modifiers for drm_framebuffers&quot;, but as &quot;everyth=
ing goes&quot; -- Use every modifier and tiling format that the graphics dr=
iver exposes also for scanout buffers. I&#39;m arguing in that bug report t=
hat modesetting-ddx shouldn&#39;t use atomic or modifiers at all, given how=
 broken that driver is atm. in that area, so i&#39;m not sure if my argumen=
t here is valid. Just saying that doing the &quot;every modifier is valid f=
or every format&quot; in absence of=C2=A0 format_mod_supported() would prob=
ably be less harmful to some existing userspace. Ofc. then there&#39;s a re=
ason why atomic gets rejected by the kernel for current modesetting-ddx...<=
br></div><div><br></div><div>I&#39;m not sure if I&#39;m arguing pro or con=
tra your patch here btw. Just pointing out one possible victim if it were a=
pplied.<br></div><div><br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">
but IIRC the bikeshed around that kinda suggested we should just<br>
implement .format_mod_support() always. Can&#39;t quite recall the<br>
details anymore.<br>
<br></blockquote><div>=C2=A0</div><div>I see. But if .format_mod_supported(=
) is always implemented, then we&#39;d need to handle the case modifier =3D=
=3D DRM_FORMAT_MOD_INVALID in the core or in each format_mod_supported() im=
plementation, because currently iff this is hooked up, it gets always used,=
 even if the user-space does not use modifiers. The X-Servers modesetting-d=
dx, e.g., does not use atomic or modifiers by default, and the linked Mesa =
bug report shows why - or at least why it shouldn&#39;t atm. I think none o=
f the X drivers does.<br></div><div><br></div><div>The softer alternative s=
olution instead of my patch would be to also accept modifier =3D=3D DRM_FOR=
MAT_MOD_INVALID as valid for simple kms drivers.<br></div><div>-mario<br></=
div><div>=C2=A0</div></div></div>

--000000000000bb063a05b9bb402b--

--===============1044011980==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1044011980==--
