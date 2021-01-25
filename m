Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E16E63029EF
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jan 2021 19:20:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73B206E153;
	Mon, 25 Jan 2021 18:19:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73BC16E103
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jan 2021 18:19:56 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id ke15so19387698ejc.12
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jan 2021 10:19:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cVoiO6f4ISQnJ/wiK8UYATClKFw0toYRQ5+JSnsHus8=;
 b=nwVC63Ay5TqpF27ACyXDRpcalvz9NDqW0sAWztKe87Uf98jCBGya80lNDnIfwuBG5m
 9yHdbjym515KEjmaAPREZvAnkyc3He6juTeMa7KM8mQLSnxst1G2O7tBB/fB/XmzRWmw
 W5MO5jadUZHx1L5a36TQiJ5aKLyuUrq9E4sAGw6m9BCdAklVE+Jaln2jbI6kGvdWsPyi
 IOyyvCrii1Ip+fVGOmAz8GLUe19gk58r8TbGQJa+hsPcVubP11N/iufxtp1qMNsH3VWp
 7WQt6xl6ip5sN5XhAh1dH2CBMxScpqAhFww0U7yNb8v5H4EUkq8NQZfyyrCBNbO2K/2k
 NPqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cVoiO6f4ISQnJ/wiK8UYATClKFw0toYRQ5+JSnsHus8=;
 b=sybeC9k48VcRdq4hj4YZe16lSVS20Zvu9bbfUnUyRkIZmKCH/OjgdvT7TbzclCw+ZK
 Ozj7tM2eaiIeeoc+tS/1JQvoAakJ+KKxM7tZQ0DZ3gwOvQN45ePKUsnqLrCGZJPH9b/T
 c+tRCaEwaKyU8/kZApow6ZW1FdmKKMOTO1gbdXGL8of9rLUG/11neI1BgHvG5L8Lx8dq
 ZXUMaMEdtB8nL5ILgN3dxfBWQlzUX11K4Cqoi5O+vm0NkKzTTolECNXI5JaUpbSZw6UA
 1dIStTZZyQg8gYYGOJ1ALdBan0TcCGembPGk8q0j+WD+AiW/Y+H9XhXCxNhSIcS+xxsJ
 19rQ==
X-Gm-Message-State: AOAM530NFPXHp/vWLu6aCJlMgA1h0h8Kl7qtIIt3Btupl48Jcer/dC2s
 yyLnwcxz0UwNpQ5g6eDFPH6Qmh0qDngDK5kqgb8=
X-Google-Smtp-Source: ABdhPJzE6kxNe2gAjHnQnScRFSfHkgKRIpj7eYWIhrkKOSRM6fePe6ACkT+9DFRUVa3DxcqcSyr0G2izNWvf10smUi8=
X-Received: by 2002:a17:906:5958:: with SMTP id
 g24mr1117838ejr.377.1611598795129; 
 Mon, 25 Jan 2021 10:19:55 -0800 (PST)
MIME-Version: 1.0
References: <20210124204748.25234-1-mario.kleiner.de@gmail.com>
 <YA614iI5kHJMATye@intel.com>
 <CAEsyxyhspu5BfgVxfDkXBC1PM-m0+=iV7hUOO0Y2m+6APTm=gg@mail.gmail.com>
 <YA7zEN70mvfRmKLK@intel.com>
In-Reply-To: <YA7zEN70mvfRmKLK@intel.com>
From: Mario Kleiner <mario.kleiner.de@gmail.com>
Date: Mon, 25 Jan 2021 19:19:44 +0100
Message-ID: <CAEsyxyhgFkZOsy9iBb6pRCoBV9idc5HsYqsOG9d-1CqJuEs4BA@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============0898909984=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0898909984==
Content-Type: multipart/alternative; boundary="000000000000b4471605b9bd95db"

--000000000000b4471605b9bd95db
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 25, 2021 at 5:34 PM Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linu=
x.intel.com>
wrote:

> On Mon, Jan 25, 2021 at 04:32:48PM +0100, Mario Kleiner wrote:
> > On Mon, Jan 25, 2021 at 1:13 PM Ville Syrj=C3=A4l=C3=A4 <
> ville.syrjala@linux.intel.com>
> > wrote:
> >
> > > On Sun, Jan 24, 2021 at 09:47:48PM +0100, Mario Kleiner wrote:
> > > > The check was introduced to make sure that only the
> > > > DRM_FORMAT_MOD_LINEAR modifier is accepted by tinydrm.
> > > >
> > > > However, if .format_mod_supported is not hooked up to
> > > > drm_simple_kms_format_mod_supported then the core will
> > > > simply validate modifiers against the format_modifiers
> > > > list passed into drm_simple_display_pipe_init() or
> > > > drm_universal_plane_init() and perform the same validation
> > > > as drm_simple_kms_format_mod_supported() would have done.
> > > >
> > > > Additionally, if a kms driver / plane does not support
> > > > modifiers, it will not reject fb updates with no modifiers/
> > > > DRM_FORMAT_MOD_INVALID. This is important, because some
> > > > simple drm drivers, e.g., pl111, pass NULL as format_modifiers
> > > > list, so modifier support is disabled for these drivers,
> > > > userspace would fall back to drmAddFB() without modifiers,
> > > > and ergo the current drm_simple_kms_format_mod_supported()
> > > > function would reject valid modifier-less fb's.
> > > >
> > > > So this should fix display on non-tinydrm drivers like
> > > > pl111, and probably also for non-atomic clients?
> > > >
> > > > The Mesa vc4 gallium driver mentions pl111 as one possible
> > > > display driver in render_only mode, so i assume this matters
> > > > for some SoC's?
> > > >
> > > > The background for the patch that introduced this was to
> > > > fix atomic modesetting in the X-Servers modesetting-ddx,
> > > > but with atomic modesetting and format modifiers disabled
> > > > in modesetting-ddx (and also current kernels when interacting
> > > > with modesetting-ddx), i assume this should fix some panels.
> > > >
> > > > Note that i don't have any of the hw required for testing
> > > > this, this is purely based on looking at the code, so this
> > > > patch is only compile-tested.
> > > >
> > > > For more reference, this fix was motivated by some discussions
> > > > around broken page-flipping on VideoCore6 / RaspberryPi 4
> > > > with current Raspbian OS, so the experts may want to weigh
> > > > in on that Mesa bug report as well, under the following link:
> > > >
> > > > https://gitlab.freedesktop.org/mesa/mesa/-/issues/3601
> > > >
> > > > Fixes: dff906c3f91c ("drm/tinydrm: Advertise that we can do only
> > > DRM_FORMAT_MOD_LINEAR.")
> > > > Signed-off-by: Mario Kleiner <mario.kleiner.de@gmail.com>
> > > > Cc: Eric Anholt <eric@anholt.net>
> > > > Cc: Noralf Tr=C3=B8nnes <noralf@tronnes.org>
> > > > Cc: Maxime Ripard <mripard@kernel.org>
> > > > ---
> > > >  drivers/gpu/drm/drm_simple_kms_helper.c | 8 --------
> > > >  1 file changed, 8 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/drm_simple_kms_helper.c
> > > b/drivers/gpu/drm/drm_simple_kms_helper.c
> > > > index 743e57c1b44f..5f3e30553172 100644
> > > > --- a/drivers/gpu/drm/drm_simple_kms_helper.c
> > > > +++ b/drivers/gpu/drm/drm_simple_kms_helper.c
> > > > @@ -229,13 +229,6 @@ static void
> drm_simple_kms_plane_cleanup_fb(struct
> > > drm_plane *plane,
> > > >       pipe->funcs->cleanup_fb(pipe, state);
> > > >  }
> > > >
> > > > -static bool drm_simple_kms_format_mod_supported(struct drm_plane
> *plane,
> > > > -                                             uint32_t format,
> > > > -                                             uint64_t modifier)
> > > > -{
> > > > -     return modifier =3D=3D DRM_FORMAT_MOD_LINEAR;
> > > > -}
> > > > -
> > > >  static const struct drm_plane_helper_funcs
> > > drm_simple_kms_plane_helper_funcs =3D {
> > > >       .prepare_fb =3D drm_simple_kms_plane_prepare_fb,
> > > >       .cleanup_fb =3D drm_simple_kms_plane_cleanup_fb,
> > > > @@ -250,7 +243,6 @@ static const struct drm_plane_funcs
> > > drm_simple_kms_plane_funcs =3D {
> > > >       .reset                  =3D drm_atomic_helper_plane_reset,
> > > >       .atomic_duplicate_state =3D
> drm_atomic_helper_plane_duplicate_state,
> > > >       .atomic_destroy_state   =3D
> drm_atomic_helper_plane_destroy_state,
> > > > -     .format_mod_supported   =3D drm_simple_kms_format_mod_support=
ed,
> > >
> > > This will now cause also this driver to report a totally borked
> > > IN_FORMATS blob.
> > >
> > > Would need this
> > > https://patchwork.freedesktop.org/series/83018/
> > >
> > >
> > The slight problem with that (see my comments in the linked Mesa bug
> > report), is that at least one common userspace driver - modesetting-ddx=
 -
> > treat a lack of an IN_FORMATS blob not as "don't use modifiers for
> > drm_framebuffers", but as "everything goes" -- Use every modifier and
> > tiling format that the graphics driver exposes also for scanout buffers=
.
> > I'm arguing in that bug report that modesetting-ddx shouldn't use atomi=
c
> or
> > modifiers at all, given how broken that driver is atm. in that area, so
> i'm
> > not sure if my argument here is valid. Just saying that doing the "ever=
y
> > modifier is valid for every format" in absence of  format_mod_supported=
()
> > would probably be less harmful to some existing userspace. Ofc. then
> > there's a reason why atomic gets rejected by the kernel for current
> > modesetting-ddx...
> >
> > I'm not sure if I'm arguing pro or contra your patch here btw. Just
> > pointing out one possible victim if it were applied.
>
> I have no idea how anything would get broken by it.
>
> Currently:
> - the broken IN_FORMAT blob says nothing is supported at all,
>   so if someone consults it they won't be able to find a working
>   pixel format
> - if they ignore the broken IN_FORMAT blob then it doesn't matter
>   if it's present or not.
>
>
Yes. What modesetting-ddx does iff xorg.conf Option "Debug"
"dmabuf_capable" is set, is it tries to get the list of display capable
modifiers. If the list is empty (due to broken IN_FORMAT blob, because
.format_mod_supported =3D=3D NULL for a kms driver in the current kernel), =
or
because the IN_FORMAT blob doesn't exist (if your patch is applied and
.format_mod_supported =3D=3D NULL) or if it can't query in the first place
(because use of atomic uapi is disabled or rejected by the kernel - as is
the case for current kernels on modesetting-ddx), then it will
unfortunately not decide not to use modifiers, but instead will consider
all dmabuf modifiers exposed by the render driver as scanout capable, also
tiled formats and pass those back to Mesa's DRI3/Present backend or
Vulkan/WSI-X11 where things can go sideways, at least as so far shown for
v3d / Broadcom VideoCore6 / RPi-4.

Anyway, yes it probably could only break a broken userspace driver more.
But that is what modesetting-ddx is atm. iff one decided to enable the
dmabuf_capable option, which is what Raspbian currently does, for an
underwhelming RPi4 out of the box visual experience.

Looking at your patch i'd suggest to also reset

config->allow_fb_modifiers =3D false;

if .format_mod_supported =3D=3D NULL, so clients that check for the
DRM_CAP_ADDFB2_MODIFIERS capability will more likely stay away from
modifiers. At least modesetting-ddx would fall back to drmModeAddFB instead
of drmModeAddFBWithModifiers, which would be better, but probably still
broken. It's complicated...

I guess the only way somehting might be affected is if they just use
> the presence of the IN_FORMATS blob as a hint for something but never
> actually look at the contents.
>

Or at DRM_CAP_ADDFB2_MODIFIERS query result, see above.


>
> >
> > but IIRC the bikeshed around that kinda suggested we should just
> > > implement .format_mod_support() always. Can't quite recall the
> > > details anymore.
> > >
> > >
> > I see. But if .format_mod_supported() is always implemented, then we'd
> need
> > to handle the case modifier =3D=3D DRM_FORMAT_MOD_INVALID in the core o=
r in
> > each format_mod_supported() implementation, because currently iff this =
is
> > hooked up, it gets always used, even if the user-space does not use
> > modifiers. The X-Servers modesetting-ddx, e.g., does not use atomic or
> > modifiers by default, and the linked Mesa bug report shows why - or at
> > least why it shouldn't atm. I think none of the X drivers does.
> >
> > The softer alternative solution instead of my patch would be to also
> accept
> > modifier =3D=3D DRM_FORMAT_MOD_INVALID as valid for simple kms drivers.
>
> DRM_FORMAT_MOD_INVALID is not a valid modifier.
> What kind of broken code is using it?
>
>
Oh sorry, i meant DRM_FORMAT_MOD_NONE (=3D=3D0) ie. what is in fb->modifier=
 if
userspace doesn't assign a modifier, e.g., drmModeAddFB().

But now after looking again, i just realized that DRM_FORMAT_MOD_NONE is
identical to DRM_FORMAT_MOD_LINEAR, ie. both are zero, so i guess my point
is moot.

That actually means this whole patch of mine is not needed and I was
hunting a ghost :/. It also means that simple drm drivers should probably
work with RPi if they revert that dmabuf_capable patch on Raspbian's
modesetting-ddx with no need for extra kernel fixes, so this is not wasted.

Thanks for helping me think!
-mario

--000000000000b4471605b9bd95db
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Mon, Jan 25, 2021 at 5:34 PM Ville Syr=
j=C3=A4l=C3=A4 &lt;<a href=3D"mailto:ville.syrjala@linux.intel.com">ville.s=
yrjala@linux.intel.com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">On Mon, Jan 25, 2021 at 04=
:32:48PM +0100, Mario Kleiner wrote:<br>
&gt; On Mon, Jan 25, 2021 at 1:13 PM Ville Syrj=C3=A4l=C3=A4 &lt;<a href=3D=
"mailto:ville.syrjala@linux.intel.com" target=3D"_blank">ville.syrjala@linu=
x.intel.com</a>&gt;<br>
&gt; wrote:<br>
&gt; <br>
&gt; &gt; On Sun, Jan 24, 2021 at 09:47:48PM +0100, Mario Kleiner wrote:<br=
>
&gt; &gt; &gt; The check was introduced to make sure that only the<br>
&gt; &gt; &gt; DRM_FORMAT_MOD_LINEAR modifier is accepted by tinydrm.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; However, if .format_mod_supported is not hooked up to<br>
&gt; &gt; &gt; drm_simple_kms_format_mod_supported then the core will<br>
&gt; &gt; &gt; simply validate modifiers against the format_modifiers<br>
&gt; &gt; &gt; list passed into drm_simple_display_pipe_init() or<br>
&gt; &gt; &gt; drm_universal_plane_init() and perform the same validation<b=
r>
&gt; &gt; &gt; as drm_simple_kms_format_mod_supported() would have done.<br=
>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Additionally, if a kms driver / plane does not support<br>
&gt; &gt; &gt; modifiers, it will not reject fb updates with no modifiers/<=
br>
&gt; &gt; &gt; DRM_FORMAT_MOD_INVALID. This is important, because some<br>
&gt; &gt; &gt; simple drm drivers, e.g., pl111, pass NULL as format_modifie=
rs<br>
&gt; &gt; &gt; list, so modifier support is disabled for these drivers,<br>
&gt; &gt; &gt; userspace would fall back to drmAddFB() without modifiers,<b=
r>
&gt; &gt; &gt; and ergo the current drm_simple_kms_format_mod_supported()<b=
r>
&gt; &gt; &gt; function would reject valid modifier-less fb&#39;s.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; So this should fix display on non-tinydrm drivers like<br>
&gt; &gt; &gt; pl111, and probably also for non-atomic clients?<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; The Mesa vc4 gallium driver mentions pl111 as one possible<b=
r>
&gt; &gt; &gt; display driver in render_only mode, so i assume this matters=
<br>
&gt; &gt; &gt; for some SoC&#39;s?<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; The background for the patch that introduced this was to<br>
&gt; &gt; &gt; fix atomic modesetting in the X-Servers modesetting-ddx,<br>
&gt; &gt; &gt; but with atomic modesetting and format modifiers disabled<br=
>
&gt; &gt; &gt; in modesetting-ddx (and also current kernels when interactin=
g<br>
&gt; &gt; &gt; with modesetting-ddx), i assume this should fix some panels.=
<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Note that i don&#39;t have any of the hw required for testin=
g<br>
&gt; &gt; &gt; this, this is purely based on looking at the code, so this<b=
r>
&gt; &gt; &gt; patch is only compile-tested.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; For more reference, this fix was motivated by some discussio=
ns<br>
&gt; &gt; &gt; around broken page-flipping on VideoCore6 / RaspberryPi 4<br=
>
&gt; &gt; &gt; with current Raspbian OS, so the experts may want to weigh<b=
r>
&gt; &gt; &gt; in on that Mesa bug report as well, under the following link=
:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; <a href=3D"https://gitlab.freedesktop.org/mesa/mesa/-/issues=
/3601" rel=3D"noreferrer" target=3D"_blank">https://gitlab.freedesktop.org/=
mesa/mesa/-/issues/3601</a><br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Fixes: dff906c3f91c (&quot;drm/tinydrm: Advertise that we ca=
n do only<br>
&gt; &gt; DRM_FORMAT_MOD_LINEAR.&quot;)<br>
&gt; &gt; &gt; Signed-off-by: Mario Kleiner &lt;<a href=3D"mailto:mario.kle=
iner.de@gmail.com" target=3D"_blank">mario.kleiner.de@gmail.com</a>&gt;<br>
&gt; &gt; &gt; Cc: Eric Anholt &lt;<a href=3D"mailto:eric@anholt.net" targe=
t=3D"_blank">eric@anholt.net</a>&gt;<br>
&gt; &gt; &gt; Cc: Noralf Tr=C3=B8nnes &lt;<a href=3D"mailto:noralf@tronnes=
.org" target=3D"_blank">noralf@tronnes.org</a>&gt;<br>
&gt; &gt; &gt; Cc: Maxime Ripard &lt;<a href=3D"mailto:mripard@kernel.org" =
target=3D"_blank">mripard@kernel.org</a>&gt;<br>
&gt; &gt; &gt; ---<br>
&gt; &gt; &gt;=C2=A0 drivers/gpu/drm/drm_simple_kms_helper.c | 8 --------<b=
r>
&gt; &gt; &gt;=C2=A0 1 file changed, 8 deletions(-)<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; diff --git a/drivers/gpu/drm/drm_simple_kms_helper.c<br>
&gt; &gt; b/drivers/gpu/drm/drm_simple_kms_helper.c<br>
&gt; &gt; &gt; index 743e57c1b44f..5f3e30553172 100644<br>
&gt; &gt; &gt; --- a/drivers/gpu/drm/drm_simple_kms_helper.c<br>
&gt; &gt; &gt; +++ b/drivers/gpu/drm/drm_simple_kms_helper.c<br>
&gt; &gt; &gt; @@ -229,13 +229,6 @@ static void drm_simple_kms_plane_cleanu=
p_fb(struct<br>
&gt; &gt; drm_plane *plane,<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0pipe-&gt;funcs-&gt;cleanup_fb(pipe=
, state);<br>
&gt; &gt; &gt;=C2=A0 }<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; -static bool drm_simple_kms_format_mod_supported(struct drm_=
plane *plane,<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t format,<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_t modifier)<br>
&gt; &gt; &gt; -{<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0return modifier =3D=3D DRM_FORMAT_MOD_L=
INEAR;<br>
&gt; &gt; &gt; -}<br>
&gt; &gt; &gt; -<br>
&gt; &gt; &gt;=C2=A0 static const struct drm_plane_helper_funcs<br>
&gt; &gt; drm_simple_kms_plane_helper_funcs =3D {<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0.prepare_fb =3D drm_simple_kms_pla=
ne_prepare_fb,<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0.cleanup_fb =3D drm_simple_kms_pla=
ne_cleanup_fb,<br>
&gt; &gt; &gt; @@ -250,7 +243,6 @@ static const struct drm_plane_funcs<br>
&gt; &gt; drm_simple_kms_plane_funcs =3D {<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0.reset=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D drm_atomic_helper_plane_reset,<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0.atomic_duplicate_state =3D drm_at=
omic_helper_plane_duplicate_state,<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0.atomic_destroy_state=C2=A0 =C2=A0=
=3D drm_atomic_helper_plane_destroy_state,<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0.format_mod_supported=C2=A0 =C2=A0=3D d=
rm_simple_kms_format_mod_supported,<br>
&gt; &gt;<br>
&gt; &gt; This will now cause also this driver to report a totally borked<b=
r>
&gt; &gt; IN_FORMATS blob.<br>
&gt; &gt;<br>
&gt; &gt; Would need this<br>
&gt; &gt; <a href=3D"https://patchwork.freedesktop.org/series/83018/" rel=
=3D"noreferrer" target=3D"_blank">https://patchwork.freedesktop.org/series/=
83018/</a><br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; The slight problem with that (see my comments in the linked Mesa bug<b=
r>
&gt; report), is that at least one common userspace driver - modesetting-dd=
x -<br>
&gt; treat a lack of an IN_FORMATS blob not as &quot;don&#39;t use modifier=
s for<br>
&gt; drm_framebuffers&quot;, but as &quot;everything goes&quot; -- Use ever=
y modifier and<br>
&gt; tiling format that the graphics driver exposes also for scanout buffer=
s.<br>
&gt; I&#39;m arguing in that bug report that modesetting-ddx shouldn&#39;t =
use atomic or<br>
&gt; modifiers at all, given how broken that driver is atm. in that area, s=
o i&#39;m<br>
&gt; not sure if my argument here is valid. Just saying that doing the &quo=
t;every<br>
&gt; modifier is valid for every format&quot; in absence of=C2=A0 format_mo=
d_supported()<br>
&gt; would probably be less harmful to some existing userspace. Ofc. then<b=
r>
&gt; there&#39;s a reason why atomic gets rejected by the kernel for curren=
t<br>
&gt; modesetting-ddx...<br>
&gt; <br>
&gt; I&#39;m not sure if I&#39;m arguing pro or contra your patch here btw.=
 Just<br>
&gt; pointing out one possible victim if it were applied.<br>
<br>
I have no idea how anything would get broken by it.<br>
<br>
Currently:<br>
- the broken IN_FORMAT blob says nothing is supported at all,<br>
=C2=A0 so if someone consults it they won&#39;t be able to find a working<b=
r>
=C2=A0 pixel format<br>
- if they ignore the broken IN_FORMAT blob then it doesn&#39;t matter<br>
=C2=A0 if it&#39;s present or not.<br>
<br></blockquote><div><br></div><div>Yes. What modesetting-ddx does iff xor=
g.conf Option &quot;Debug&quot; &quot;dmabuf_capable&quot; is set, is it tr=
ies to get the list of display capable modifiers. If the list is empty (due=
 to broken IN_FORMAT blob, because .format_mod_supported =3D=3D NULL for a =
kms driver in the current kernel), or because the IN_FORMAT blob doesn&#39;=
t exist (if your patch is applied and .format_mod_supported =3D=3D NULL) or=
 if it can&#39;t query in the first place (because use of atomic uapi is di=
sabled or rejected by the kernel - as is the case for current kernels on mo=
desetting-ddx), then it will unfortunately not decide not to use modifiers,=
 but instead will consider all dmabuf modifiers exposed by the render drive=
r as scanout capable, also tiled formats and pass those back to Mesa&#39;s =
DRI3/Present backend or Vulkan/WSI-X11 where things can go sideways, at lea=
st as so far shown for v3d / Broadcom VideoCore6 / RPi-4.<br></div></div><d=
iv class=3D"gmail_quote"><br></div><div class=3D"gmail_quote">Anyway, yes i=
t probably could only break a broken userspace driver more. But that is wha=
t modesetting-ddx is atm. iff one decided to enable the dmabuf_capable opti=
on, which is what Raspbian currently does, for an underwhelming RPi4 out of=
 the box visual experience.<br></div><div class=3D"gmail_quote"><br></div><=
div class=3D"gmail_quote">Looking at your patch i&#39;d suggest to also res=
et <pre class=3D"gmail-content"><span class=3D"gmail-p_add">config-&gt;allo=
w_fb_modifiers =3D false;</span></pre>if .format_mod_supported =3D=3D NULL,=
 so clients that check for the DRM_CAP_ADDFB2_MODIFIERS capability will mor=
e likely stay away from modifiers. At least modesetting-ddx would fall back=
 to drmModeAddFB instead of drmModeAddFBWithModifiers, which would be bette=
r, but probably still broken. It&#39;s complicated...<br></div><div class=
=3D"gmail_quote"><br></div><div class=3D"gmail_quote"><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">
I guess the only way somehting might be affected is if they just use<br>
the presence of the IN_FORMATS blob as a hint for something but never<br>
actually look at the contents.<br></blockquote><div><br></div><div>Or at DR=
M_CAP_ADDFB2_MODIFIERS query result, see above.<br></div><div>=C2=A0</div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; <br>
&gt; but IIRC the bikeshed around that kinda suggested we should just<br>
&gt; &gt; implement .format_mod_support() always. Can&#39;t quite recall th=
e<br>
&gt; &gt; details anymore.<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; I see. But if .format_mod_supported() is always implemented, then we&#=
39;d need<br>
&gt; to handle the case modifier =3D=3D DRM_FORMAT_MOD_INVALID in the core =
or in<br>
&gt; each format_mod_supported() implementation, because currently iff this=
 is<br>
&gt; hooked up, it gets always used, even if the user-space does not use<br=
>
&gt; modifiers. The X-Servers modesetting-ddx, e.g., does not use atomic or=
<br>
&gt; modifiers by default, and the linked Mesa bug report shows why - or at=
<br>
&gt; least why it shouldn&#39;t atm. I think none of the X drivers does.<br=
>
&gt; <br>
&gt; The softer alternative solution instead of my patch would be to also a=
ccept<br>
&gt; modifier =3D=3D DRM_FORMAT_MOD_INVALID as valid for simple kms drivers=
.<br>
<br>
DRM_FORMAT_MOD_INVALID is not a valid modifier.<br>
What kind of broken code is using it?<br>
<br></blockquote><div>=C2=A0</div><div>Oh sorry, i meant DRM_FORMAT_MOD_NON=
E (=3D=3D0) ie. what is in fb-&gt;modifier if userspace doesn&#39;t assign =
a modifier, e.g., drmModeAddFB().</div><div><br></div><div>But now after lo=
oking again, i just realized that DRM_FORMAT_MOD_NONE is identical to DRM_F=
ORMAT_MOD_LINEAR, ie. both are zero, so i guess my point is moot.</div><div=
><br></div><div>That actually means this whole patch of mine is not needed =
and I was hunting a ghost :/. It also means that simple drm drivers should =
probably work with RPi if they revert that dmabuf_capable patch on Raspbian=
&#39;s modesetting-ddx with no need for extra kernel fixes, so this is not =
wasted.<br></div></div><div class=3D"gmail_quote"><br></div><div class=3D"g=
mail_quote">Thanks for helping me think!<br></div><div class=3D"gmail_quote=
">-mario</div><div class=3D"gmail_quote"><br></div></div>

--000000000000b4471605b9bd95db--

--===============0898909984==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0898909984==--
