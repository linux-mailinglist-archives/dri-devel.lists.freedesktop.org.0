Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA6D7ECAC2
	for <lists+dri-devel@lfdr.de>; Wed, 15 Nov 2023 19:46:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F62D10E573;
	Wed, 15 Nov 2023 18:46:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F114A10E570;
 Wed, 15 Nov 2023 18:46:37 +0000 (UTC)
Received: by mail-pg1-x52c.google.com with SMTP id
 41be03b00d2f7-5bd5809f63aso4500495a12.3; 
 Wed, 15 Nov 2023 10:46:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700073997; x=1700678797; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8sSDNIWq3T8aAKN1hLohy6SLBDd43+i1nG6u0sZbg8s=;
 b=U+4AeA2GFNRfOSQy9Z1uCBPAKQGL97HuzUTagb+r6Sahtp+CXXvUQ06TKrqgaHshar
 7jqWRg7+fWFj6cNpGgnuninEQVzSQV5tpvhGXU6BOqaT1TFzt0NKceBFjQaD5IoVECo/
 OPhnqh8Z8raWI+RrrdfD5pY+kQE5Ip7D3no4f+9lA1xKUQ7b2XPBQluHlIhkfmujUwqD
 wd6Lx3qINIn4FbqKuRi6swhakvxx0WCFQpnsnGSOX8CflWCFs3wYv98FDIWvMzPhrXOE
 1oZPyOx4iuRcvgNRxhW26/QAZwd3yuVX/d3GvNUxkNZtwAZIZmSnpKUWQR7UHWN/xJUk
 jMmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700073997; x=1700678797;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8sSDNIWq3T8aAKN1hLohy6SLBDd43+i1nG6u0sZbg8s=;
 b=TLadC43l7kZzn6REZa/YT5AeDY6J1R8CARxLbXqwKB+eWW+gI654Y2mNJouGF3iIet
 YXgwHsLVPLzrHgiHEeFGQ06q/GSGUzuQXJ+fzOfCCuqw3UummQhAL+x/5nZaqsgEMZSn
 fkvWeC7xuydDCMj4MjvCUqJME4Z7xjA/C9/FUI+eo23AZgK7uFy8ytRfwDoQGZKb9+k5
 CkdxBUFnik0t7JW6ymhbq1hF+opgKbNuDkX9uXXnB3Chq22cdAetcY3KxknBseoIJ6OY
 UA7B5E0pkulapdywTJKbezKq6FEl0HgcY1QBTz+WDJYAME/SAor7h+wWt6B9jtjLBMs2
 cp6Q==
X-Gm-Message-State: AOJu0YzWW+zDz7TnLKIt6lOKRmuuOxRt80vpdXER4sHZfn1Xn9xH3Bwd
 tJjWPTpIn0azxD0LP34YybelOg8vpwIo7jSaRfU=
X-Google-Smtp-Source: AGHT+IHFnDS0ty5lZ7AZXHKJGh0LILzKT4toj9CA+5ywMZ+I8+6PBjIU88U9blL3supHCroe0ITQ+dv6xbtOrRuVFRE=
X-Received: by 2002:a17:90b:3b88:b0:27d:1051:83c4 with SMTP id
 pc8-20020a17090b3b8800b0027d105183c4mr11814224pjb.12.1700073997406; Wed, 15
 Nov 2023 10:46:37 -0800 (PST)
MIME-Version: 1.0
References: <20231115141928.429688-1-dipamt1729@gmail.com>
 <CAA8EJprqnUGQxmj4Y=qttVuj0zJxdD9B6neHa6sPseLLETpk5A@mail.gmail.com>
In-Reply-To: <CAA8EJprqnUGQxmj4Y=qttVuj0zJxdD9B6neHa6sPseLLETpk5A@mail.gmail.com>
From: Dipam Turkar <dipamt1729@gmail.com>
Date: Thu, 16 Nov 2023 00:16:00 +0530
Message-ID: <CALHmwsoC5h7_w9OzpUS_-xM6x5WF5V-vFExLEf4y99b2eCcqGQ@mail.gmail.com>
Subject: Re: [PATCH v2] Remove custom dumb_map_offset implementation in msm
 driver
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000b517ab060a35521f"
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
Cc: freedreno@lists.freedesktop.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, marijn.suijten@somainline.org, sean@poorly.run
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000b517ab060a35521f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

They are not outdated, my bad. I went through the locks' code and saw that
they have been updated. But they are probably not necessary here as most of
the drivers do not use any form of locking in their implementations. The
generic implementations drm_gem_dumb_map_offset() and
drm_gem_ttm_dumb_map_offset() do not have any locking mechanisms either.

Thanks and regards
Dipam Turkar

On Wed, Nov 15, 2023 at 8:37=E2=80=AFPM Dmitry Baryshkov <
dmitry.baryshkov@linaro.org> wrote:

> On Wed, 15 Nov 2023 at 16:30, Dipam Turkar <dipamt1729@gmail.com> wrote:
> >
> > Make msm use drm_gem_create_map_offset() instead of its custom
> > implementation for associating GEM object with a fake offset. Since,
> > we already have this generic implementation, we don't need the custom
> > implementation and it is better to standardize the code for GEM based
> > drivers. This also removes the outdated locking leftovers.
>
> Why are they outdated?
>
> >
> > Signed-off-by: Dipam Turkar <dipamt1729@gmail.com>
> > ---
> >  drivers/gpu/drm/msm/msm_drv.c |  2 +-
> >  drivers/gpu/drm/msm/msm_gem.c | 21 ---------------------
> >  drivers/gpu/drm/msm/msm_gem.h |  2 --
> >  3 files changed, 1 insertion(+), 24 deletions(-)
> >
> > Changes in v2:
> > Modify commit message to include the absence of internal locking
> leftovers
> > around allocating a fake offset in msm_gem_mmap_offset() in the generic
> > implementation drm_gem_create_map_offset().
> >
> > diff --git a/drivers/gpu/drm/msm/msm_drv.c
> b/drivers/gpu/drm/msm/msm_drv.c
> > index a428951ee539..86a15992c717 100644
> > --- a/drivers/gpu/drm/msm/msm_drv.c
> > +++ b/drivers/gpu/drm/msm/msm_drv.c
> > @@ -1085,7 +1085,7 @@ static const struct drm_driver msm_driver =3D {
> >         .open               =3D msm_open,
> >         .postclose          =3D msm_postclose,
> >         .dumb_create        =3D msm_gem_dumb_create,
> > -       .dumb_map_offset    =3D msm_gem_dumb_map_offset,
> > +       .dumb_map_offset    =3D drm_gem_dumb_map_offset,
> >         .gem_prime_import_sg_table =3D msm_gem_prime_import_sg_table,
> >  #ifdef CONFIG_DEBUG_FS
> >         .debugfs_init       =3D msm_debugfs_init,
> > diff --git a/drivers/gpu/drm/msm/msm_gem.c
> b/drivers/gpu/drm/msm/msm_gem.c
> > index db1e748daa75..489694ef79cb 100644
> > --- a/drivers/gpu/drm/msm/msm_gem.c
> > +++ b/drivers/gpu/drm/msm/msm_gem.c
> > @@ -671,27 +671,6 @@ int msm_gem_dumb_create(struct drm_file *file,
> struct drm_device *dev,
> >                         MSM_BO_SCANOUT | MSM_BO_WC, &args->handle,
> "dumb");
> >  }
> >
> > -int msm_gem_dumb_map_offset(struct drm_file *file, struct drm_device
> *dev,
> > -               uint32_t handle, uint64_t *offset)
> > -{
> > -       struct drm_gem_object *obj;
> > -       int ret =3D 0;
> > -
> > -       /* GEM does all our handle to object mapping */
> > -       obj =3D drm_gem_object_lookup(file, handle);
> > -       if (obj =3D=3D NULL) {
> > -               ret =3D -ENOENT;
> > -               goto fail;
> > -       }
> > -
> > -       *offset =3D msm_gem_mmap_offset(obj);
> > -
> > -       drm_gem_object_put(obj);
> > -
> > -fail:
> > -       return ret;
> > -}
> > -
> >  static void *get_vaddr(struct drm_gem_object *obj, unsigned madv)
> >  {
> >         struct msm_gem_object *msm_obj =3D to_msm_bo(obj);
> > diff --git a/drivers/gpu/drm/msm/msm_gem.h
> b/drivers/gpu/drm/msm/msm_gem.h
> > index 8ddef5443140..dc74a0ef865d 100644
> > --- a/drivers/gpu/drm/msm/msm_gem.h
> > +++ b/drivers/gpu/drm/msm/msm_gem.h
> > @@ -139,8 +139,6 @@ struct page **msm_gem_pin_pages(struct
> drm_gem_object *obj);
> >  void msm_gem_unpin_pages(struct drm_gem_object *obj);
> >  int msm_gem_dumb_create(struct drm_file *file, struct drm_device *dev,
> >                 struct drm_mode_create_dumb *args);
> > -int msm_gem_dumb_map_offset(struct drm_file *file, struct drm_device
> *dev,
> > -               uint32_t handle, uint64_t *offset);
> >  void *msm_gem_get_vaddr_locked(struct drm_gem_object *obj);
> >  void *msm_gem_get_vaddr(struct drm_gem_object *obj);
> >  void *msm_gem_get_vaddr_active(struct drm_gem_object *obj);
> > --
> > 2.34.1
> >
>
>
> --
> With best wishes
> Dmitry
>

--000000000000b517ab060a35521f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>They are not outdated, my bad. I went through the loc=
ks&#39; code and=20
saw that they have been updated. But they are probably not necessary=20
here as most of the drivers do not use any form of locking in their=20
implementations. The generic implementations drm_gem_dumb_map_offset()=20
and drm_gem_ttm_dumb_map_offset() do not have any locking mechanisms=20
either.</div><div><br></div><div>Thanks and regards</div><font color=3D"#88=
8888"><div>Dipam Turkar</div></font></div><br><div class=3D"gmail_quote"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Wed, Nov 15, 2023 at 8:37=E2=80=AFPM=
 Dmitry Baryshkov &lt;<a href=3D"mailto:dmitry.baryshkov@linaro.org">dmitry=
.baryshkov@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">On Wed, 15 Nov 2023 at 16:30, Dipam Turkar &lt;<a href=
=3D"mailto:dipamt1729@gmail.com" target=3D"_blank">dipamt1729@gmail.com</a>=
&gt; wrote:<br>
&gt;<br>
&gt; Make msm use drm_gem_create_map_offset() instead of its custom<br>
&gt; implementation for associating GEM object with a fake offset. Since,<b=
r>
&gt; we already have this generic implementation, we don&#39;t need the cus=
tom<br>
&gt; implementation and it is better to standardize the code for GEM based<=
br>
&gt; drivers. This also removes the outdated locking leftovers.<br>
<br>
Why are they outdated?<br>
<br>
&gt;<br>
&gt; Signed-off-by: Dipam Turkar &lt;<a href=3D"mailto:dipamt1729@gmail.com=
" target=3D"_blank">dipamt1729@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 drivers/gpu/drm/msm/msm_drv.c |=C2=A0 2 +-<br>
&gt;=C2=A0 drivers/gpu/drm/msm/msm_gem.c | 21 ---------------------<br>
&gt;=C2=A0 drivers/gpu/drm/msm/msm_gem.h |=C2=A0 2 --<br>
&gt;=C2=A0 3 files changed, 1 insertion(+), 24 deletions(-)<br>
&gt;<br>
&gt; Changes in v2:<br>
&gt; Modify commit message to include the absence of internal locking lefto=
vers<br>
&gt; around allocating a fake offset in msm_gem_mmap_offset() in the generi=
c<br>
&gt; implementation drm_gem_create_map_offset().<br>
&gt;<br>
&gt; diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_d=
rv.c<br>
&gt; index a428951ee539..86a15992c717 100644<br>
&gt; --- a/drivers/gpu/drm/msm/msm_drv.c<br>
&gt; +++ b/drivers/gpu/drm/msm/msm_drv.c<br>
&gt; @@ -1085,7 +1085,7 @@ static const struct drm_driver msm_driver =3D {<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.open=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=3D msm_open,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.postclose=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =3D msm_postclose,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.dumb_create=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =3D msm_gem_dumb_create,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0.dumb_map_offset=C2=A0 =C2=A0 =3D msm_gem_=
dumb_map_offset,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.dumb_map_offset=C2=A0 =C2=A0 =3D drm_gem_=
dumb_map_offset,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.gem_prime_import_sg_table =3D msm_ge=
m_prime_import_sg_table,<br>
&gt;=C2=A0 #ifdef CONFIG_DEBUG_FS<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.debugfs_init=C2=A0 =C2=A0 =C2=A0 =C2=
=A0=3D msm_debugfs_init,<br>
&gt; diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_g=
em.c<br>
&gt; index db1e748daa75..489694ef79cb 100644<br>
&gt; --- a/drivers/gpu/drm/msm/msm_gem.c<br>
&gt; +++ b/drivers/gpu/drm/msm/msm_gem.c<br>
&gt; @@ -671,27 +671,6 @@ int msm_gem_dumb_create(struct drm_file *file, st=
ruct drm_device *dev,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0MSM_BO_SCANOUT | MSM_BO_WC, &amp;args-&gt;handle, &quot=
;dumb&quot;);<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt; -int msm_gem_dumb_map_offset(struct drm_file *file, struct drm_device =
*dev,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t handl=
e, uint64_t *offset)<br>
&gt; -{<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_gem_object *obj;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret =3D 0;<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0/* GEM does all our handle to object mappi=
ng */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0obj =3D drm_gem_object_lookup(file, handle=
);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (obj =3D=3D NULL) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D -ENOEN=
T;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto fail;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0*offset =3D msm_gem_mmap_offset(obj);<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0drm_gem_object_put(obj);<br>
&gt; -<br>
&gt; -fail:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; -}<br>
&gt; -<br>
&gt;=C2=A0 static void *get_vaddr(struct drm_gem_object *obj, unsigned madv=
)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct msm_gem_object *msm_obj =3D to=
_msm_bo(obj);<br>
&gt; diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_g=
em.h<br>
&gt; index 8ddef5443140..dc74a0ef865d 100644<br>
&gt; --- a/drivers/gpu/drm/msm/msm_gem.h<br>
&gt; +++ b/drivers/gpu/drm/msm/msm_gem.h<br>
&gt; @@ -139,8 +139,6 @@ struct page **msm_gem_pin_pages(struct drm_gem_obj=
ect *obj);<br>
&gt;=C2=A0 void msm_gem_unpin_pages(struct drm_gem_object *obj);<br>
&gt;=C2=A0 int msm_gem_dumb_create(struct drm_file *file, struct drm_device=
 *dev,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct dr=
m_mode_create_dumb *args);<br>
&gt; -int msm_gem_dumb_map_offset(struct drm_file *file, struct drm_device =
*dev,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t handl=
e, uint64_t *offset);<br>
&gt;=C2=A0 void *msm_gem_get_vaddr_locked(struct drm_gem_object *obj);<br>
&gt;=C2=A0 void *msm_gem_get_vaddr(struct drm_gem_object *obj);<br>
&gt;=C2=A0 void *msm_gem_get_vaddr_active(struct drm_gem_object *obj);<br>
&gt; --<br>
&gt; 2.34.1<br>
&gt;<br>
<br>
<br>
-- <br>
With best wishes<br>
Dmitry<br>
</blockquote></div>

--000000000000b517ab060a35521f--
