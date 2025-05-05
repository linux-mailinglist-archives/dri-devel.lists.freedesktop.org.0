Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13377AA9CDD
	for <lists+dri-devel@lfdr.de>; Mon,  5 May 2025 21:55:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 872EB10E2AF;
	Mon,  5 May 2025 19:55:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="WVNXOdad";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C9E410E2AF
 for <dri-devel@lists.freedesktop.org>; Mon,  5 May 2025 19:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746474925;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LBKtBovMcMCHZw2F5Nui/RJk5y6N+HwnbrN+FsMW2qw=;
 b=WVNXOdadt6zq7/y8b8Qc1phgyQJzwer6GH6zC21CQ4qSWBRrD7Ke2vE8uPZZaEQlzJzl2o
 iG60ou2GKjRPQM1Dbb7lX2GFvFcG7cgKrKsmuhURFKS01TknjZqYCWvhi2tsxHTP2j406M
 Ygl6EdcJAnzwgIknVsxnEwbHYhn3tQ8=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-563-kFkArkW6PpaQxU8iKM0H1A-1; Mon, 05 May 2025 15:55:24 -0400
X-MC-Unique: kFkArkW6PpaQxU8iKM0H1A-1
X-Mimecast-MFC-AGG-ID: kFkArkW6PpaQxU8iKM0H1A_1746474924
Received: by mail-yw1-f198.google.com with SMTP id
 00721157ae682-708b2494592so79207937b3.2
 for <dri-devel@lists.freedesktop.org>; Mon, 05 May 2025 12:55:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746474924; x=1747079724;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LBKtBovMcMCHZw2F5Nui/RJk5y6N+HwnbrN+FsMW2qw=;
 b=ONzmN6G92YqSBuIlUvy3E6bH5qYvEo3x3NiHveH96P6X9WqeUWi5JWOBhVr80/IYMB
 6GjIjC4W23kJbuIcYhkKQ5Ke7zGMPu0zHlgIBGZOeBCk7XUTYlpDAz2CI68S57hbzUT2
 66HpS/h3mSfhheCGLDhZhxpI0UsqJ1z3Hw6PMLn3M8BpcoQWGWm5Ex9UuAcDEbKDy1pV
 TbG8syi/+J59RBPi7lFS/qOz57RqiRdbdSfLkong2uo6WwWuMT99j19QOtArFZ5gOIOJ
 51qL7IEQ4LI0+TtH24LDHKhGeVEzZIrQkcCht2P2o0VI81NWuYApSrwkm5zGNq6vv2C3
 ZC0w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUEzB7Bz3e+Qc8u3rgNmp0YdqlWzq5jU/K6I1y+m5Q1KKh7QA7ZTLj+o7tbsQ4x0GUcvwtyEiYyOiY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyjSbxSmA9Fk5z6dTVG9cgJnpVYxHfXpX3CrXsIPMIMCh7zGsNi
 Fe8I7QjeEejzD6Ye2vWH5NDpKGTN76z8mYchjpSC4y4qU2+cFiASHv+qmIM3+9DhgePYx/JOl5i
 B3+1yzB7ojKkMYX4SD1I1gU/EyRoXiC8LUJBi10l0FfxK/OMacOU2mTIP4XI37ve80HfXYGrRAi
 MApqz/J4w0e/fPh+D6ShiE3o+U/Co+Rd3EhO2qcNG9
X-Gm-Gg: ASbGnctVF/D1CsUjQEmyqIbYIudFkhNmHkSbeo+paZMS9q4vJsY2wcQmEiTF7duEBhE
 RQRwAXWduOr6il5S8uzmenDBvHCHfoUJ0VP6i9WXtQ1vRrVY4b2ruc89yXv1pqOOo10U=
X-Received: by 2002:a05:690c:881:b0:706:cafa:3ec6 with SMTP id
 00721157ae682-70919c12145mr7091097b3.6.1746474923694; 
 Mon, 05 May 2025 12:55:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHr4CV9166Ui9q80oPCztSTG4BeetxkPZj4kDnQ76X46gDccjhn6H7gVQQrZdD6uVBP7hzoTk3HIDKr8mmOiMU=
X-Received: by 2002:a05:690c:881:b0:706:cafa:3ec6 with SMTP id
 00721157ae682-70919c12145mr7090727b3.6.1746474923289; Mon, 05 May 2025
 12:55:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250331-b4-panel-refcounting-v4-0-dad50c60c6c9@redhat.com>
 <20250331-b4-panel-refcounting-v4-2-dad50c60c6c9@redhat.com>
 <87y0vkw8ll.fsf@intel.com>
 <20250429-benign-sidewinder-of-defense-6dd4d8@houat>
 <87o6wfwcef.fsf@intel.com> <20250505-slim-bizarre-marten-a674ac@houat>
In-Reply-To: <20250505-slim-bizarre-marten-a674ac@houat>
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Mon, 5 May 2025 14:52:07 -0400
X-Gm-Features: ATxdqUHsoNLqWH2T9QbOvAavQNjmD5707eJCaw1cnJd5mRTt9zYr2lWpR4TTCb8
Message-ID: <CAN9Xe3RLazpAXdxxJmyF2QAShDtMSgdoxMdo6ecdYd7aZiP9kA@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] drm/panel: Add refcount support
To: Maxime Ripard <mripard@kernel.org>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: sYfYfu_1Go6tNmyhcT_JZxxay0t1cUPc2bsw6mu2FXs_1746474924
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000698622063468e12c"
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

--000000000000698622063468e12c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 5, 2025 at 2:54=E2=80=AFAM Maxime Ripard <mripard@kernel.org> w=
rote:

> Hi Jani,
>
> On Tue, Apr 29, 2025 at 12:22:00PM +0300, Jani Nikula wrote:
> > On Tue, 29 Apr 2025, Maxime Ripard <mripard@kernel.org> wrote:
> > > Hi Jani,
> > >
> > > On Mon, Apr 28, 2025 at 07:31:50PM +0300, Jani Nikula wrote:
> > >> On Mon, 31 Mar 2025, Anusha Srivatsa <asrivats@redhat.com> wrote:
> > >> > Allocate panel via reference counting. Add _get() and _put() helpe=
r
> > >> > functions to ensure panel allocations are refcounted. Avoid use
> after
> > >> > free by ensuring panel pointer is valid and can be usable till the
> last
> > >> > reference is put.
> > >> >
> > >> > Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > >> > Reviewed-by: Maxime Ripard <mripard@kernel.org>
> > >> > Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
> > >> >
> > >> > ---
> > >> > v4: Add refcounting documentation in this patch (Maxime)
> > >> >
> > >> > v3: Add include in this patch (Luca)
> > >> >
> > >> > v2: Export drm_panel_put/get() (Maxime)
> > >> > - Change commit log with better workding (Luca, Maxime)
> > >> > - Change drm_panel_put() to return void (Luca)
> > >> > - Code Cleanups - add return in documentation, replace bridge to
> > >> > panel (Luca)
> > >> > ---
> > >> >  drivers/gpu/drm/drm_panel.c | 64
> ++++++++++++++++++++++++++++++++++++++++++++-
> > >> >  include/drm/drm_panel.h     | 19 ++++++++++++++
> > >> >  2 files changed, 82 insertions(+), 1 deletion(-)
> > >> >
> > >> > diff --git a/drivers/gpu/drm/drm_panel.c
> b/drivers/gpu/drm/drm_panel.c
> > >> > index
> bdeab5710ee324dc1742fbc77582250960556308..7b17531d85a4dc3031709919564d2e4=
d8332f748
> 100644
> > >> > --- a/drivers/gpu/drm/drm_panel.c
> > >> > +++ b/drivers/gpu/drm/drm_panel.c
> > >> > @@ -355,24 +355,86 @@ struct drm_panel *of_drm_find_panel(const
> struct device_node *np)
> > >> >  }
> > >> >  EXPORT_SYMBOL(of_drm_find_panel);
> > >> >
> > >> > +static void __drm_panel_free(struct kref *kref)
> > >> > +{
> > >> > +        struct drm_panel *panel =3D container_of(kref, struct
> drm_panel, refcount);
> > >> > +
> > >> > +        kfree(panel->container);
> > >> > +}
> > >> > +
> > >> > +/**
> > >> > + * drm_panel_get - Acquire a panel reference
> > >> > + * @panel: DRM panel
> > >> > + *
> > >> > + * This function increments the panel's refcount.
> > >> > + * Returns:
> > >> > + * Pointer to @panel
> > >> > + */
> > >> > +struct drm_panel *drm_panel_get(struct drm_panel *panel)
> > >> > +{
> > >> > +        if (!panel)
> > >> > +                return panel;
> > >> > +
> > >> > +        kref_get(&panel->refcount);
> > >> > +
> > >> > +        return panel;
> > >> > +}
> > >> > +EXPORT_SYMBOL(drm_panel_get);
> > >> > +
> > >> > +/**
> > >> > + * drm_panel_put - Release a panel reference
> > >> > + * @panel: DRM panel
> > >> > + *
> > >> > + * This function decrements the panel's reference count and frees
> the
> > >> > + * object if the reference count drops to zero.
> > >> > + */
> > >> > +void drm_panel_put(struct drm_panel *panel)
> > >> > +{
> > >> > +        if (panel)
> > >> > +                kref_put(&panel->refcount, __drm_panel_free);
> > >> > +}
> > >> > +EXPORT_SYMBOL(drm_panel_put);
> > >> > +
> > >> > +/**
> > >> > + * drm_panel_put_void - wrapper to drm_panel_put() taking a void
> pointer
> > >> > + *
> > >> > + * @data: pointer to @struct drm_panel, cast to a void pointer
> > >> > + *
> > >> > + * Wrapper of drm_panel_put() to be used when a function taking a
> void
> > >> > + * pointer is needed, for example as a devm action.
> > >> > + */
> > >> > +static void drm_panel_put_void(void *data)
> > >> > +{
> > >> > +        struct drm_panel *panel =3D (struct drm_panel *)data;
> > >> > +
> > >> > +        drm_panel_put(panel);
> > >> > +}
> > >> > +
> > >> >  void *__devm_drm_panel_alloc(struct device *dev, size_t size,
> size_t offset,
> > >> >                               const struct drm_panel_funcs *funcs,
> > >> >                               int connector_type)
> > >> >  {
> > >> >          void *container;
> > >> >          struct drm_panel *panel;
> > >> > +        int err;
> > >> >
> > >> >          if (!funcs) {
> > >> >                  dev_warn(dev, "Missing funcs pointer\n");
> > >> >                  return ERR_PTR(-EINVAL);
> > >> >          }
> > >> >
> > >> > -        container =3D devm_kzalloc(dev, size, GFP_KERNEL);
> > >> > +        container =3D kzalloc(size, GFP_KERNEL);
> > >> >          if (!container)
> > >> >                  return ERR_PTR(-ENOMEM);
> > >> >
> > >> >          panel =3D container + offset;
> > >> > +        panel->container =3D container;
> > >> >          panel->funcs =3D funcs;
> > >> > +        kref_init(&panel->refcount);
> > >>
> > >> Hi Anusha, this should be done in drm_panel_init() instead.
> > >>
> > >> There are many users of drm_panel that don't use
> devm_drm_panel_alloc()
> > >> but allocate separately, and call drm_panel_init() only.
> > >
> > > That wouldn't really work, because then drivers would have allocated
> the
> > > panel with devm_kzalloc and thus the structure would be freed when th=
e
> > > device is removed, no matter the reference counting state.
> > >
> > >> They'll all have refcount set to 0 instead of 1 like kref_init() doe=
s.
> > >>
> > >> This means all subsequent get/put pairs on such panels will lead to
> > >> __drm_panel_free() being called! But through a lucky coincidence, th=
at
> > >> will be a nop because panel->container is also not initialized...
> > >>
> > >> I'm sorry to say, the drm refcounting interface is quite broken for
> such
> > >> use cases.
> > >
> > > The plan is to convert all panel drivers to that function, and Anusha
> > > already sent series to do. It still needs a bit of work, but it shoul=
d
> > > land soon-ish.
> > >
> > > For the transitional period though, it's not clear to me what you thi=
nk
> > > is broken at the moment, and / or what should be fixed.
> > >
> > > Would you prefer an explicit check on container not being 0, with a
> > > comment?
> >
> > I'm looking at what it would take to add drm_panel support to i915 so
> > that you could have drm_panel_followers on it. There are gaps of course=
,
> > but initially it would mean allocating and freeing drm_panel ourselves,
> > not via devm_drm_panel_alloc() nor devm_kzalloc(), because none of the
> > other stuff is allocated that way. drm_panel would just sit as a
> > sub-struct inside struct intel_panel, which is a sub-struct of struct
> > intel_connector, which has its own allocation...
>
> I'm not entirely sure why you would need to allocate it from i915? The
> drm_panel structure is only meant to be allocated by panel drivers, and
> afaik no panel interface controller is allocating it.
>
> > But basically in its current state, the refcounting would not be
> > reliable for that use case. I guess with panel->container being NULL
> > nothing happens, but the idea that the refcount drops back to 0 after a
> > get/put is a bit scary.
> >
> > Anyway, I think there should be no harm in moving the kref init to
> > drm_panel_init(), right?
>
> I mean, there is because the plan so far was to remove drm_panel_init() :=
)
>
>
Jani,
the series that converts all drivers to use the new API:
https://patchwork.freedesktop.org/series/147082/
https://patchwork.freedesktop.org/series/147157/
https://patchwork.freedesktop.org/series/147246/

not landed yet but these are WIP. Still trying to understand your point
though... not sure what is broken.


Anusha

> Maxime
>

--000000000000698622063468e12c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, May 5, =
2025 at 2:54=E2=80=AFAM Maxime Ripard &lt;<a href=3D"mailto:mripard@kernel.=
org">mripard@kernel.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">Hi Jani,<br>
<br>
On Tue, Apr 29, 2025 at 12:22:00PM +0300, Jani Nikula wrote:<br>
&gt; On Tue, 29 Apr 2025, Maxime Ripard &lt;<a href=3D"mailto:mripard@kerne=
l.org" target=3D"_blank">mripard@kernel.org</a>&gt; wrote:<br>
&gt; &gt; Hi Jani,<br>
&gt; &gt;<br>
&gt; &gt; On Mon, Apr 28, 2025 at 07:31:50PM +0300, Jani Nikula wrote:<br>
&gt; &gt;&gt; On Mon, 31 Mar 2025, Anusha Srivatsa &lt;<a href=3D"mailto:as=
rivats@redhat.com" target=3D"_blank">asrivats@redhat.com</a>&gt; wrote:<br>
&gt; &gt;&gt; &gt; Allocate panel via reference counting. Add _get() and _p=
ut() helper<br>
&gt; &gt;&gt; &gt; functions to ensure panel allocations are refcounted. Av=
oid use after<br>
&gt; &gt;&gt; &gt; free by ensuring panel pointer is valid and can be usabl=
e till the last<br>
&gt; &gt;&gt; &gt; reference is put.<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; Reviewed-by: Luca Ceresoli &lt;<a href=3D"mailto:luca.ce=
resoli@bootlin.com" target=3D"_blank">luca.ceresoli@bootlin.com</a>&gt;<br>
&gt; &gt;&gt; &gt; Reviewed-by: Maxime Ripard &lt;<a href=3D"mailto:mripard=
@kernel.org" target=3D"_blank">mripard@kernel.org</a>&gt;<br>
&gt; &gt;&gt; &gt; Signed-off-by: Anusha Srivatsa &lt;<a href=3D"mailto:asr=
ivats@redhat.com" target=3D"_blank">asrivats@redhat.com</a>&gt;<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; ---<br>
&gt; &gt;&gt; &gt; v4: Add refcounting documentation in this patch (Maxime)=
<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; v3: Add include in this patch (Luca)<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; v2: Export drm_panel_put/get() (Maxime)<br>
&gt; &gt;&gt; &gt; - Change commit log with better workding (Luca, Maxime)<=
br>
&gt; &gt;&gt; &gt; - Change drm_panel_put() to return void (Luca)<br>
&gt; &gt;&gt; &gt; - Code Cleanups - add return in documentation, replace b=
ridge to<br>
&gt; &gt;&gt; &gt; panel (Luca)<br>
&gt; &gt;&gt; &gt; ---<br>
&gt; &gt;&gt; &gt;=C2=A0 drivers/gpu/drm/drm_panel.c | 64 +++++++++++++++++=
+++++++++++++++++++++++++++-<br>
&gt; &gt;&gt; &gt;=C2=A0 include/drm/drm_panel.h=C2=A0 =C2=A0 =C2=A0| 19 ++=
++++++++++++<br>
&gt; &gt;&gt; &gt;=C2=A0 2 files changed, 82 insertions(+), 1 deletion(-)<b=
r>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/d=
rm/drm_panel.c<br>
&gt; &gt;&gt; &gt; index bdeab5710ee324dc1742fbc77582250960556308..7b17531d=
85a4dc3031709919564d2e4d8332f748 100644<br>
&gt; &gt;&gt; &gt; --- a/drivers/gpu/drm/drm_panel.c<br>
&gt; &gt;&gt; &gt; +++ b/drivers/gpu/drm/drm_panel.c<br>
&gt; &gt;&gt; &gt; @@ -355,24 +355,86 @@ struct drm_panel *of_drm_find_pane=
l(const struct device_node *np)<br>
&gt; &gt;&gt; &gt;=C2=A0 }<br>
&gt; &gt;&gt; &gt;=C2=A0 EXPORT_SYMBOL(of_drm_find_panel);<br>
&gt; &gt;&gt; &gt;=C2=A0 <br>
&gt; &gt;&gt; &gt; +static void __drm_panel_free(struct kref *kref)<br>
&gt; &gt;&gt; &gt; +{<br>
&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_panel *panel =3D=
 container_of(kref, struct drm_panel, refcount);<br>
&gt; &gt;&gt; &gt; +<br>
&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 kfree(panel-&gt;container);=
<br>
&gt; &gt;&gt; &gt; +}<br>
&gt; &gt;&gt; &gt; +<br>
&gt; &gt;&gt; &gt; +/**<br>
&gt; &gt;&gt; &gt; + * drm_panel_get - Acquire a panel reference<br>
&gt; &gt;&gt; &gt; + * @panel: DRM panel<br>
&gt; &gt;&gt; &gt; + *<br>
&gt; &gt;&gt; &gt; + * This function increments the panel&#39;s refcount.<b=
r>
&gt; &gt;&gt; &gt; + * Returns:<br>
&gt; &gt;&gt; &gt; + * Pointer to @panel<br>
&gt; &gt;&gt; &gt; + */<br>
&gt; &gt;&gt; &gt; +struct drm_panel *drm_panel_get(struct drm_panel *panel=
)<br>
&gt; &gt;&gt; &gt; +{<br>
&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!panel)<br>
&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 return panel;<br>
&gt; &gt;&gt; &gt; +<br>
&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 kref_get(&amp;panel-&gt;ref=
count);<br>
&gt; &gt;&gt; &gt; +<br>
&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return panel;<br>
&gt; &gt;&gt; &gt; +}<br>
&gt; &gt;&gt; &gt; +EXPORT_SYMBOL(drm_panel_get);<br>
&gt; &gt;&gt; &gt; +<br>
&gt; &gt;&gt; &gt; +/**<br>
&gt; &gt;&gt; &gt; + * drm_panel_put - Release a panel reference<br>
&gt; &gt;&gt; &gt; + * @panel: DRM panel<br>
&gt; &gt;&gt; &gt; + *<br>
&gt; &gt;&gt; &gt; + * This function decrements the panel&#39;s reference c=
ount and frees the<br>
&gt; &gt;&gt; &gt; + * object if the reference count drops to zero.<br>
&gt; &gt;&gt; &gt; + */<br>
&gt; &gt;&gt; &gt; +void drm_panel_put(struct drm_panel *panel)<br>
&gt; &gt;&gt; &gt; +{<br>
&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (panel)<br>
&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 kref_put(&amp;panel-&gt;refcount, __drm_panel_free);<br>
&gt; &gt;&gt; &gt; +}<br>
&gt; &gt;&gt; &gt; +EXPORT_SYMBOL(drm_panel_put);<br>
&gt; &gt;&gt; &gt; +<br>
&gt; &gt;&gt; &gt; +/**<br>
&gt; &gt;&gt; &gt; + * drm_panel_put_void - wrapper to drm_panel_put() taki=
ng a void pointer<br>
&gt; &gt;&gt; &gt; + *<br>
&gt; &gt;&gt; &gt; + * @data: pointer to @struct drm_panel, cast to a void =
pointer<br>
&gt; &gt;&gt; &gt; + *<br>
&gt; &gt;&gt; &gt; + * Wrapper of drm_panel_put() to be used when a functio=
n taking a void<br>
&gt; &gt;&gt; &gt; + * pointer is needed, for example as a devm action.<br>
&gt; &gt;&gt; &gt; + */<br>
&gt; &gt;&gt; &gt; +static void drm_panel_put_void(void *data)<br>
&gt; &gt;&gt; &gt; +{<br>
&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_panel *panel =3D=
 (struct drm_panel *)data;<br>
&gt; &gt;&gt; &gt; +<br>
&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 drm_panel_put(panel);<br>
&gt; &gt;&gt; &gt; +}<br>
&gt; &gt;&gt; &gt; +<br>
&gt; &gt;&gt; &gt;=C2=A0 void *__devm_drm_panel_alloc(struct device *dev, s=
ize_t size, size_t offset,<br>
&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const struct drm_pan=
el_funcs *funcs,<br>
&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int connector_type)<=
br>
&gt; &gt;&gt; &gt;=C2=A0 {<br>
&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 void *container;<br>
&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_panel *pane=
l;<br>
&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 int err;<br>
&gt; &gt;&gt; &gt;=C2=A0 <br>
&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!funcs) {<br>
&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 dev_warn(dev, &quot;Missing funcs pointer\n&quot;);<br>
&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 return ERR_PTR(-EINVAL);<br>
&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt;&gt; &gt;=C2=A0 <br>
&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 container =3D devm_kzalloc(=
dev, size, GFP_KERNEL);<br>
&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 container =3D kzalloc(size,=
 GFP_KERNEL);<br>
&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!container)<br>
&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 return ERR_PTR(-ENOMEM);<br>
&gt; &gt;&gt; &gt;=C2=A0 <br>
&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 panel =3D container + =
offset;<br>
&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 panel-&gt;container =3D con=
tainer;<br>
&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 panel-&gt;funcs =3D fu=
ncs;<br>
&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 kref_init(&amp;panel-&gt;re=
fcount);<br>
&gt; &gt;&gt; <br>
&gt; &gt;&gt; Hi Anusha, this should be done in drm_panel_init() instead.<b=
r>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; There are many users of drm_panel that don&#39;t use devm_drm=
_panel_alloc()<br>
&gt; &gt;&gt; but allocate separately, and call drm_panel_init() only.<br>
&gt; &gt;<br>
&gt; &gt; That wouldn&#39;t really work, because then drivers would have al=
located the<br>
&gt; &gt; panel with devm_kzalloc and thus the structure would be freed whe=
n the<br>
&gt; &gt; device is removed, no matter the reference counting state.<br>
&gt; &gt;<br>
&gt; &gt;&gt; They&#39;ll all have refcount set to 0 instead of 1 like kref=
_init() does.<br>
&gt; &gt;&gt; <br>
&gt; &gt;&gt; This means all subsequent get/put pairs on such panels will l=
ead to<br>
&gt; &gt;&gt; __drm_panel_free() being called! But through a lucky coincide=
nce, that<br>
&gt; &gt;&gt; will be a nop because panel-&gt;container is also not initial=
ized...<br>
&gt; &gt;&gt; <br>
&gt; &gt;&gt; I&#39;m sorry to say, the drm refcounting interface is quite =
broken for such<br>
&gt; &gt;&gt; use cases.<br>
&gt; &gt;<br>
&gt; &gt; The plan is to convert all panel drivers to that function, and An=
usha<br>
&gt; &gt; already sent series to do. It still needs a bit of work, but it s=
hould<br>
&gt; &gt; land soon-ish.<br>
&gt; &gt;<br>
&gt; &gt; For the transitional period though, it&#39;s not clear to me what=
 you think<br>
&gt; &gt; is broken at the moment, and / or what should be fixed.<br>
&gt; &gt;<br>
&gt; &gt; Would you prefer an explicit check on container not being 0, with=
 a<br>
&gt; &gt; comment?<br>
&gt; <br>
&gt; I&#39;m looking at what it would take to add drm_panel support to i915=
 so<br>
&gt; that you could have drm_panel_followers on it. There are gaps of cours=
e,<br>
&gt; but initially it would mean allocating and freeing drm_panel ourselves=
,<br>
&gt; not via devm_drm_panel_alloc() nor devm_kzalloc(), because none of the=
<br>
&gt; other stuff is allocated that way. drm_panel would just sit as a<br>
&gt; sub-struct inside struct intel_panel, which is a sub-struct of struct<=
br>
&gt; intel_connector, which has its own allocation...<br>
<br>
I&#39;m not entirely sure why you would need to allocate it from i915? The<=
br>
drm_panel structure is only meant to be allocated by panel drivers, and<br>
afaik no panel interface controller is allocating it.<br>
<br>
&gt; But basically in its current state, the refcounting would not be<br>
&gt; reliable for that use case. I guess with panel-&gt;container being NUL=
L<br>
&gt; nothing happens, but the idea that the refcount drops back to 0 after =
a<br>
&gt; get/put is a bit scary.<br>
&gt; <br>
&gt; Anyway, I think there should be no harm in moving the kref init to<br>
&gt; drm_panel_init(), right?<br>
<br>
I mean, there is because the plan so far was to remove drm_panel_init() :)<=
br>
<br></blockquote><div><br></div><div>Jani,</div><div>the series that conver=
ts all drivers to use the new API:</div><div><a href=3D"https://patchwork.f=
reedesktop.org/series/147082/">https://patchwork.freedesktop.org/series/147=
082/</a></div><div><a href=3D"https://patchwork.freedesktop.org/series/1471=
57/">https://patchwork.freedesktop.org/series/147157/</a></div><div><a href=
=3D"https://patchwork.freedesktop.org/series/147246/">https://patchwork.fre=
edesktop.org/series/147246/</a></div><div><br></div><div>not landed yet but=
 these are WIP. Still trying to understand your point though... not sure wh=
at is broken.</div><div><br></div><div><br></div><div>Anusha</div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">
Maxime<br>
</blockquote></div></div>

--000000000000698622063468e12c--

