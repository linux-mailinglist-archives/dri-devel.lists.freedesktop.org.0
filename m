Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DEFE1BC648
	for <lists+dri-devel@lfdr.de>; Tue, 28 Apr 2020 19:16:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 067266E85D;
	Tue, 28 Apr 2020 17:16:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6128E6E85D
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Apr 2020 17:16:39 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id s10so17000716edy.9
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Apr 2020 10:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KCSxdiRR1nX46JdG0MlnA9izji90BXpiXpZuZPc3y4E=;
 b=ZDmHNf2CH1sySXgLxE0g7nvxpBrZ8xHGeK3AxB1ubq1e2AwTicMFa3TT/Ovz8TJr18
 RhHjq+5K3plgpPiq2u+2LddF3/Fr0nn4N3CmR0q4Jv87PgOQZPEks8qL5gp8ZxYWvk91
 iW47mTeZhOyaMLb9myDvbluILBwVCeP93CYc+ZWbDRxCArcOz9S/4AtsRPOf89HmS/AR
 ER2dj73BaTHru+EoTY0V/CNR/M1RgK3ll392zoq1PLOxGdsKyiZlM/VgHI+VER/AyeOi
 6c1sUUTaZ+boN6NaGnUB3edxmvLcLcWzzFllFc28xZf8i1oRPwd8HM7pmdCGocHS03mN
 HYvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KCSxdiRR1nX46JdG0MlnA9izji90BXpiXpZuZPc3y4E=;
 b=ORgAj5+STDhObfvLcGwaVpVSCvuwKCPL+EqBSTqizHa3qZcuwCdeuPXltL+caInu8U
 3HjqVyVdKqwovWphrLwxaymFzAYPdnI07cOZvYJJkbUP4vzyBm9VIaFX5pF1t41vD/dC
 ma6rV/MOqD4X9TuVbbw4OcAP5xe5nWkbteXaCKe8dlFNnfmgpLrkx/aMyJ72xi3soJ03
 0DFv1RfXFfeqLtT+mB6txEdpaf4TqRt9Qp6/OYMDsuQO4BGkvn7+sdAI7D2SOfmFH1d8
 lQ5plNgCEPMRs7wqZ7u1uDmbcGlw90eRUNphmnutwcnUsBfgy0s010QGc6ZGYIedcC6x
 T/qQ==
X-Gm-Message-State: AGi0PuZ/av6lnS3wKkMnsxIZCrzfyXfMg3d/ogerEcpezvcgEZ5JmCqv
 ivwo59vokytJCf5xU5WU93Prc7ZEUIxJuy9Nf8Y=
X-Google-Smtp-Source: APiQypLQz+4GX9gjFI1mn5WTeBQul/3qM+heKYXJG5M7zUW16m8v4+kN9rNA2Z4PYLiorTrFv/rnbR98P0y9pKpYPqo=
X-Received: by 2002:aa7:c40c:: with SMTP id j12mr22859364edq.169.1588094198021; 
 Tue, 28 Apr 2020 10:16:38 -0700 (PDT)
MIME-Version: 1.0
References: <1587895282-2808-1-git-send-email-michalorzel.eng@gmail.com>
 <20200428151538.GV3456981@phenom.ffwll.local>
In-Reply-To: <20200428151538.GV3456981@phenom.ffwll.local>
From: =?UTF-8?B?TWljaGHFgiBPcnplxYI=?= <michalorzel.eng@gmail.com>
Date: Tue, 28 Apr 2020 19:16:26 +0200
Message-ID: <CAAf4t2FH1X=5upmF4U9KZgRQQnUv-byaGLVFoOuHKWK7pU7YQQ@mail.gmail.com>
Subject: Re: [PATCH] drm: Replace drm_modeset_lock/unlock_all with
 DRM_MODESET_LOCK_ALL_* helpers
To: Michal Orzel <michalorzel.eng@gmail.com>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@linux.ie, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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
Content-Type: multipart/mixed; boundary="===============1142869218=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1142869218==
Content-Type: multipart/alternative; boundary="0000000000008b018f05a45cfe8f"

--0000000000008b018f05a45cfe8f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Patch resubmitted with intel-gfx mailing list added.

Thanks, Michal

wt., 28 kwi 2020 o 17:15 Daniel Vetter <daniel@ffwll.ch> napisa=C5=82(a):

> On Sun, Apr 26, 2020 at 12:01:22PM +0200, Michal Orzel wrote:
> > As suggested by the TODO list for the kernel DRM subsystem, replace
> > the deprecated functions that take/drop modeset locks with new helpers.
> >
> > Signed-off-by: Michal Orzel <michalorzel.eng@gmail.com>
>
> Hm can you pls resubmit with intel-gfx mailing list cc'ed? There's a CI
> bot there for checking stuff. Patch looks good, thanks a lot for doing
> this.
>
> Thanks, Daniel
> > ---
> >  drivers/gpu/drm/drm_mode_object.c | 10 ++++++----
> >  1 file changed, 6 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_mode_object.c
> b/drivers/gpu/drm/drm_mode_object.c
> > index 35c2719..901b078 100644
> > --- a/drivers/gpu/drm/drm_mode_object.c
> > +++ b/drivers/gpu/drm/drm_mode_object.c
> > @@ -402,12 +402,13 @@ int drm_mode_obj_get_properties_ioctl(struct
> drm_device *dev, void *data,
> >  {
> >       struct drm_mode_obj_get_properties *arg =3D data;
> >       struct drm_mode_object *obj;
> > +     struct drm_modeset_acquire_ctx ctx;
> >       int ret =3D 0;
> >
> >       if (!drm_core_check_feature(dev, DRIVER_MODESET))
> >               return -EOPNOTSUPP;
> >
> > -     drm_modeset_lock_all(dev);
> > +     DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
> >
> >       obj =3D drm_mode_object_find(dev, file_priv, arg->obj_id,
> arg->obj_type);
> >       if (!obj) {
> > @@ -427,7 +428,7 @@ int drm_mode_obj_get_properties_ioctl(struct
> drm_device *dev, void *data,
> >  out_unref:
> >       drm_mode_object_put(obj);
> >  out:
> > -     drm_modeset_unlock_all(dev);
> > +     DRM_MODESET_LOCK_ALL_END(ctx, ret);
> >       return ret;
> >  }
> >
> > @@ -449,12 +450,13 @@ static int set_property_legacy(struct
> drm_mode_object *obj,
> >  {
> >       struct drm_device *dev =3D prop->dev;
> >       struct drm_mode_object *ref;
> > +     struct drm_modeset_acquire_ctx ctx;
> >       int ret =3D -EINVAL;
> >
> >       if (!drm_property_change_valid_get(prop, prop_value, &ref))
> >               return -EINVAL;
> >
> > -     drm_modeset_lock_all(dev);
> > +     DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
> >       switch (obj->type) {
> >       case DRM_MODE_OBJECT_CONNECTOR:
> >               ret =3D drm_connector_set_obj_prop(obj, prop, prop_value)=
;
> > @@ -468,7 +470,7 @@ static int set_property_legacy(struct
> drm_mode_object *obj,
> >               break;
> >       }
> >       drm_property_change_valid_put(prop, ref);
> > -     drm_modeset_unlock_all(dev);
> > +     DRM_MODESET_LOCK_ALL_END(ctx, ret);
> >
> >       return ret;
> >  }
> > --
> > 2.7.4
> >
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
>

--0000000000008b018f05a45cfe8f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Patch resubmitted with intel-gfx mailing list added.<=
/div><div><br></div><div>Thanks, Michal<br></div></div><br><div class=3D"gm=
ail_quote"><div dir=3D"ltr" class=3D"gmail_attr">wt., 28 kwi 2020 o 17:15=
=C2=A0Daniel Vetter &lt;<a href=3D"mailto:daniel@ffwll.ch">daniel@ffwll.ch<=
/a>&gt; napisa=C5=82(a):<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On Sun, Apr 26, 2020 at 12:01:22PM +0200, Michal Orzel wrote:<br=
>
&gt; As suggested by the TODO list for the kernel DRM subsystem, replace<br=
>
&gt; the deprecated functions that take/drop modeset locks with new helpers=
.<br>
&gt; <br>
&gt; Signed-off-by: Michal Orzel &lt;<a href=3D"mailto:michalorzel.eng@gmai=
l.com" target=3D"_blank">michalorzel.eng@gmail.com</a>&gt;<br>
<br>
Hm can you pls resubmit with intel-gfx mailing list cc&#39;ed? There&#39;s =
a CI<br>
bot there for checking stuff. Patch looks good, thanks a lot for doing<br>
this.<br>
<br>
Thanks, Daniel<br>
&gt; ---<br>
&gt;=C2=A0 drivers/gpu/drm/drm_mode_object.c | 10 ++++++----<br>
&gt;=C2=A0 1 file changed, 6 insertions(+), 4 deletions(-)<br>
&gt; <br>
&gt; diff --git a/drivers/gpu/drm/drm_mode_object.c b/drivers/gpu/drm/drm_m=
ode_object.c<br>
&gt; index 35c2719..901b078 100644<br>
&gt; --- a/drivers/gpu/drm/drm_mode_object.c<br>
&gt; +++ b/drivers/gpu/drm/drm_mode_object.c<br>
&gt; @@ -402,12 +402,13 @@ int drm_mode_obj_get_properties_ioctl(struct drm=
_device *dev, void *data,<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_mode_obj_get_properties *arg =3D =
data;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_mode_object *obj;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_modeset_acquire_ctx ctx;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret =3D 0;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!drm_core_check_feature(dev, DRIVER_MODE=
SET))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EOPNOTSU=
PP;<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 =C2=A0drm_modeset_lock_all(dev);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0obj =3D drm_mode_object_find(dev, file_priv,=
 arg-&gt;obj_id, arg-&gt;obj_type);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!obj) {<br>
&gt; @@ -427,7 +428,7 @@ int drm_mode_obj_get_properties_ioctl(struct drm_d=
evice *dev, void *data,<br>
&gt;=C2=A0 out_unref:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0drm_mode_object_put(obj);<br>
&gt;=C2=A0 out:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0drm_modeset_unlock_all(dev);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0DRM_MODESET_LOCK_ALL_END(ctx, ret);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; @@ -449,12 +450,13 @@ static int set_property_legacy(struct drm_mode_o=
bject *obj,<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_device *dev =3D prop-&gt;dev;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_mode_object *ref;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_modeset_acquire_ctx ctx;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret =3D -EINVAL;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!drm_property_change_valid_get(prop, pro=
p_value, &amp;ref))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<=
br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 =C2=A0drm_modeset_lock_all(dev);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0switch (obj-&gt;type) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0case DRM_MODE_OBJECT_CONNECTOR:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D drm_conn=
ector_set_obj_prop(obj, prop, prop_value);<br>
&gt; @@ -468,7 +470,7 @@ static int set_property_legacy(struct drm_mode_obj=
ect *obj,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0drm_property_change_valid_put(prop, ref);<br=
>
&gt; -=C2=A0 =C2=A0 =C2=A0drm_modeset_unlock_all(dev);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0DRM_MODESET_LOCK_ALL_END(ctx, ret);<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt;=C2=A0 }<br>
&gt; -- <br>
&gt; 2.7.4<br>
&gt; <br>
<br>
-- <br>
Daniel Vetter<br>
Software Engineer, Intel Corporation<br>
<a href=3D"http://blog.ffwll.ch" rel=3D"noreferrer" target=3D"_blank">http:=
//blog.ffwll.ch</a><br>
</blockquote></div>

--0000000000008b018f05a45cfe8f--

--===============1142869218==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1142869218==--
