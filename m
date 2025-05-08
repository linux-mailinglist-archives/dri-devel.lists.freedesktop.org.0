Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37813AB0613
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 00:51:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59B3F10E218;
	Thu,  8 May 2025 22:51:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="hnMgmQSV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BFD610E218
 for <dri-devel@lists.freedesktop.org>; Thu,  8 May 2025 22:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746744689;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ojRDnaHeKK44/BIZPFihn6ZwKdGyzL0S5kzxmPKIbyw=;
 b=hnMgmQSV3iHHnQAatkSNDUNFToeoBqfj5f/d4/8twdQlAgxBCUpG97crcCixfywuHH3X8E
 l6R7P2iew+j1dfqpBprZ/6XaAcQsoymOk5sKlL81brFEqGhA1d2OaYgUrUaH7o4jDDYWPu
 tbAjpnT/zdVwlx9mdVCXtUz2wTwk5MU=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-571-2DoOe0VxMI2fmsPxmCrseg-1; Thu, 08 May 2025 18:51:27 -0400
X-MC-Unique: 2DoOe0VxMI2fmsPxmCrseg-1
X-Mimecast-MFC-AGG-ID: 2DoOe0VxMI2fmsPxmCrseg_1746744687
Received: by mail-yw1-f200.google.com with SMTP id
 00721157ae682-707d49f9c3bso22762157b3.0
 for <dri-devel@lists.freedesktop.org>; Thu, 08 May 2025 15:51:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746744687; x=1747349487;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ojRDnaHeKK44/BIZPFihn6ZwKdGyzL0S5kzxmPKIbyw=;
 b=PMPaDS6dg19HulvUXc6tnuZSPH9laVd2JziC1f+eqioRi9wXNCRq9Eo/McHecrHh7R
 rQbnyAsOt5pxgH+LHzQgHNp5+dhAH8phN7G+5g81b98VmwYkDZtT0Dt3vsoEMxscv8xI
 gWAN+nCqZ6jhEEezfJ3BK3GnrNZ7JNbufyPeKm/se/yfUxjMUaPlZ3bCKzvXAK9ZcZ2q
 aTicO/m/j9moqtLPEWa5F21qW4ytmhfhlRhiP3AKD1tEAe5R7mHkFXsw53BlI/sSrEFu
 0JcrUDIr6VSWizGvR8OK+xb6e8osPj94F2KC+nnB8p/VzXFyZ3sLhBxcoAvUcpLzIB3f
 ygfg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUciQBFx89I7AQvawoPw7y8oHPa9K5oKD0o0kRyQ++Iu61ZKUDPys1oMqVl4IwGTA1LOUaZ5Tfcn+Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzph/axHIV8XRi0vkBhhoWNEgRHcqZVpEhIO70/8xa50+1bMlvG
 rX0sg1HpZu50nVYdE/JTA3ooM8QUAc0fCTh/5b+7I8Tx+dtDHUqpI/xsnkFZQRhVYMNuWqyAiS9
 PVvchEOFxiQ/hmKkzKu2W8XMW/J3qqv8UPBnbrfRTEx4JQIWrNF2VD1IooJoBeLeer4y4axIln/
 9E6ZADQQwYq6igBeYu9EB+LKMUQxLYlSwIAkMOrgKK
X-Gm-Gg: ASbGncsdWB8z4L04CwaCyBQOptUYC5kddf/wjFR526dirS/1yXMtAPYzRtNI7Y2s+8W
 TvNqVsQjkg71VsllNyoD+UxyNVpE5KCqY5ZI4VRQ0UhoQ64kIdgWrWKNrgSjCvtdmQJY=
X-Received: by 2002:a05:690c:7404:b0:6fe:aa66:5d75 with SMTP id
 00721157ae682-70a3fa258eamr18646357b3.10.1746744686989; 
 Thu, 08 May 2025 15:51:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFUuFVIKR3q/D/tgkn3xMBCQmzHTBvIRISdRKEDIiY/JrtAUcS1SUjjH56VknswD6aUvV2KimwUdeTOh8a8WsQ=
X-Received: by 2002:a05:690c:7404:b0:6fe:aa66:5d75 with SMTP id
 00721157ae682-70a3fa258eamr18646167b3.10.1746744686595; Thu, 08 May 2025
 15:51:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250331-b4-panel-refcounting-v4-0-dad50c60c6c9@redhat.com>
 <20250331-b4-panel-refcounting-v4-2-dad50c60c6c9@redhat.com>
 <87y0vkw8ll.fsf@intel.com>
 <20250429-benign-sidewinder-of-defense-6dd4d8@houat>
 <87o6wfwcef.fsf@intel.com> <20250505-slim-bizarre-marten-a674ac@houat>
 <CAN9Xe3RLazpAXdxxJmyF2QAShDtMSgdoxMdo6ecdYd7aZiP9kA@mail.gmail.com>
 <874ixvtbxy.fsf@intel.com>
In-Reply-To: <874ixvtbxy.fsf@intel.com>
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 8 May 2025 17:48:07 -0400
X-Gm-Features: AX0GCFvyDT3AgQ9Jb3SsimJmQ_l1ECIxZ89XUxHX72xHqh7GrQQ8ZG3HyhsRuEU
Message-ID: <CAN9Xe3TaoGziuFi-MW44J3G70UBRh7KHgExrph+ROnqdVncQzw@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] drm/panel: Add refcount support
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: cHu8SwaA3aPHwWVnLHLAPQuPKnQIC1cfzuV4iLPmAhc_1746744687
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000008ee65f0634a7b0ec"
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

--0000000000008ee65f0634a7b0ec
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 8, 2025 at 10:27=E2=80=AFAM Jani Nikula <jani.nikula@linux.inte=
l.com>
wrote:

> On Mon, 05 May 2025, Anusha Srivatsa <asrivats@redhat.com> wrote:
> > On Mon, May 5, 2025 at 2:54=E2=80=AFAM Maxime Ripard <mripard@kernel.or=
g> wrote:
> >
> >> Hi Jani,
> >>
> >> On Tue, Apr 29, 2025 at 12:22:00PM +0300, Jani Nikula wrote:
> >> > On Tue, 29 Apr 2025, Maxime Ripard <mripard@kernel.org> wrote:
> >> > > Hi Jani,
> >> > >
> >> > > On Mon, Apr 28, 2025 at 07:31:50PM +0300, Jani Nikula wrote:
> >> > >> On Mon, 31 Mar 2025, Anusha Srivatsa <asrivats@redhat.com> wrote:
> >> > >> > Allocate panel via reference counting. Add _get() and _put()
> helper
> >> > >> > functions to ensure panel allocations are refcounted. Avoid use
> >> after
> >> > >> > free by ensuring panel pointer is valid and can be usable till
> the
> >> last
> >> > >> > reference is put.
> >> > >> >
> >> > >> > Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> >> > >> > Reviewed-by: Maxime Ripard <mripard@kernel.org>
> >> > >> > Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
> >> > >> >
> >> > >> > ---
> >> > >> > v4: Add refcounting documentation in this patch (Maxime)
> >> > >> >
> >> > >> > v3: Add include in this patch (Luca)
> >> > >> >
> >> > >> > v2: Export drm_panel_put/get() (Maxime)
> >> > >> > - Change commit log with better workding (Luca, Maxime)
> >> > >> > - Change drm_panel_put() to return void (Luca)
> >> > >> > - Code Cleanups - add return in documentation, replace bridge t=
o
> >> > >> > panel (Luca)
> >> > >> > ---
> >> > >> >  drivers/gpu/drm/drm_panel.c | 64
> >> ++++++++++++++++++++++++++++++++++++++++++++-
> >> > >> >  include/drm/drm_panel.h     | 19 ++++++++++++++
> >> > >> >  2 files changed, 82 insertions(+), 1 deletion(-)
> >> > >> >
> >> > >> > diff --git a/drivers/gpu/drm/drm_panel.c
> >> b/drivers/gpu/drm/drm_panel.c
> >> > >> > index
> >>
> bdeab5710ee324dc1742fbc77582250960556308..7b17531d85a4dc3031709919564d2e4=
d8332f748
> >> 100644
> >> > >> > --- a/drivers/gpu/drm/drm_panel.c
> >> > >> > +++ b/drivers/gpu/drm/drm_panel.c
> >> > >> > @@ -355,24 +355,86 @@ struct drm_panel *of_drm_find_panel(const
> >> struct device_node *np)
> >> > >> >  }
> >> > >> >  EXPORT_SYMBOL(of_drm_find_panel);
> >> > >> >
> >> > >> > +static void __drm_panel_free(struct kref *kref)
> >> > >> > +{
> >> > >> > +        struct drm_panel *panel =3D container_of(kref, struct
> >> drm_panel, refcount);
> >> > >> > +
> >> > >> > +        kfree(panel->container);
> >> > >> > +}
> >> > >> > +
> >> > >> > +/**
> >> > >> > + * drm_panel_get - Acquire a panel reference
> >> > >> > + * @panel: DRM panel
> >> > >> > + *
> >> > >> > + * This function increments the panel's refcount.
> >> > >> > + * Returns:
> >> > >> > + * Pointer to @panel
> >> > >> > + */
> >> > >> > +struct drm_panel *drm_panel_get(struct drm_panel *panel)
> >> > >> > +{
> >> > >> > +        if (!panel)
> >> > >> > +                return panel;
> >> > >> > +
> >> > >> > +        kref_get(&panel->refcount);
> >> > >> > +
> >> > >> > +        return panel;
> >> > >> > +}
> >> > >> > +EXPORT_SYMBOL(drm_panel_get);
> >> > >> > +
> >> > >> > +/**
> >> > >> > + * drm_panel_put - Release a panel reference
> >> > >> > + * @panel: DRM panel
> >> > >> > + *
> >> > >> > + * This function decrements the panel's reference count and
> frees
> >> the
> >> > >> > + * object if the reference count drops to zero.
> >> > >> > + */
> >> > >> > +void drm_panel_put(struct drm_panel *panel)
> >> > >> > +{
> >> > >> > +        if (panel)
> >> > >> > +                kref_put(&panel->refcount, __drm_panel_free);
> >> > >> > +}
> >> > >> > +EXPORT_SYMBOL(drm_panel_put);
> >> > >> > +
> >> > >> > +/**
> >> > >> > + * drm_panel_put_void - wrapper to drm_panel_put() taking a vo=
id
> >> pointer
> >> > >> > + *
> >> > >> > + * @data: pointer to @struct drm_panel, cast to a void pointer
> >> > >> > + *
> >> > >> > + * Wrapper of drm_panel_put() to be used when a function takin=
g
> a
> >> void
> >> > >> > + * pointer is needed, for example as a devm action.
> >> > >> > + */
> >> > >> > +static void drm_panel_put_void(void *data)
> >> > >> > +{
> >> > >> > +        struct drm_panel *panel =3D (struct drm_panel *)data;
> >> > >> > +
> >> > >> > +        drm_panel_put(panel);
> >> > >> > +}
> >> > >> > +
> >> > >> >  void *__devm_drm_panel_alloc(struct device *dev, size_t size,
> >> size_t offset,
> >> > >> >                               const struct drm_panel_funcs
> *funcs,
> >> > >> >                               int connector_type)
> >> > >> >  {
> >> > >> >          void *container;
> >> > >> >          struct drm_panel *panel;
> >> > >> > +        int err;
> >> > >> >
> >> > >> >          if (!funcs) {
> >> > >> >                  dev_warn(dev, "Missing funcs pointer\n");
> >> > >> >                  return ERR_PTR(-EINVAL);
> >> > >> >          }
> >> > >> >
> >> > >> > -        container =3D devm_kzalloc(dev, size, GFP_KERNEL);
> >> > >> > +        container =3D kzalloc(size, GFP_KERNEL);
> >> > >> >          if (!container)
> >> > >> >                  return ERR_PTR(-ENOMEM);
> >> > >> >
> >> > >> >          panel =3D container + offset;
> >> > >> > +        panel->container =3D container;
> >> > >> >          panel->funcs =3D funcs;
> >> > >> > +        kref_init(&panel->refcount);
> >> > >>
> >> > >> Hi Anusha, this should be done in drm_panel_init() instead.
> >> > >>
> >> > >> There are many users of drm_panel that don't use
> >> devm_drm_panel_alloc()
> >> > >> but allocate separately, and call drm_panel_init() only.
> >> > >
> >> > > That wouldn't really work, because then drivers would have allocat=
ed
> >> the
> >> > > panel with devm_kzalloc and thus the structure would be freed when
> the
> >> > > device is removed, no matter the reference counting state.
> >> > >
> >> > >> They'll all have refcount set to 0 instead of 1 like kref_init()
> does.
> >> > >>
> >> > >> This means all subsequent get/put pairs on such panels will lead =
to
> >> > >> __drm_panel_free() being called! But through a lucky coincidence,
> that
> >> > >> will be a nop because panel->container is also not initialized...
> >> > >>
> >> > >> I'm sorry to say, the drm refcounting interface is quite broken f=
or
> >> such
> >> > >> use cases.
> >> > >
> >> > > The plan is to convert all panel drivers to that function, and
> Anusha
> >> > > already sent series to do. It still needs a bit of work, but it
> should
> >> > > land soon-ish.
> >> > >
> >> > > For the transitional period though, it's not clear to me what you
> think
> >> > > is broken at the moment, and / or what should be fixed.
> >> > >
> >> > > Would you prefer an explicit check on container not being 0, with =
a
> >> > > comment?
> >> >
> >> > I'm looking at what it would take to add drm_panel support to i915 s=
o
> >> > that you could have drm_panel_followers on it. There are gaps of
> course,
> >> > but initially it would mean allocating and freeing drm_panel
> ourselves,
> >> > not via devm_drm_panel_alloc() nor devm_kzalloc(), because none of t=
he
> >> > other stuff is allocated that way. drm_panel would just sit as a
> >> > sub-struct inside struct intel_panel, which is a sub-struct of struc=
t
> >> > intel_connector, which has its own allocation...
> >>
> >> I'm not entirely sure why you would need to allocate it from i915? The
> >> drm_panel structure is only meant to be allocated by panel drivers, an=
d
> >> afaik no panel interface controller is allocating it.
>
> I'm looking into a use case involving drm_panel_follower, which requires
> a drm_panel. I don't really need any of the other stuff in drm_panel.
>
> And basically you'd have one drm_panel per connector that is connected
> to a panel, within the same driver.
>
> >> > But basically in its current state, the refcounting would not be
> >> > reliable for that use case. I guess with panel->container being NULL
> >> > nothing happens, but the idea that the refcount drops back to 0 afte=
r
> a
> >> > get/put is a bit scary.
> >> >
> >> > Anyway, I think there should be no harm in moving the kref init to
> >> > drm_panel_init(), right?
> >>
> >> I mean, there is because the plan so far was to remove drm_panel_init(=
)
> :)
>
> The problem with that is that it forces a certain type of allocation of
> drm_panel. devm_drm_panel_alloc() allows embedding drm_panel inside
> another struct, but that's inflexible for our use case, where we'd
> probably like to embed it inside something that's already allocated as
> part of something else.
>
> Jani,
will intel_connector_init() be one of the code points where this will be
inflexible?

Anusha

> I mean devm_drm_panel_alloc() is great, but please don't make its use
> mandatory!
>
> > Jani,
> > the series that converts all drivers to use the new API:
> > https://patchwork.freedesktop.org/series/147082/
> > https://patchwork.freedesktop.org/series/147157/
> > https://patchwork.freedesktop.org/series/147246/
> >
> > not landed yet but these are WIP. Still trying to understand your point
> > though... not sure what is broken.
>
> Nothing upstream is broken per se, but if you allocated drm_panel
> directly yourself, initialized it with drm_panel_init(), its refcount
> would initially be 0, not 1, and each subsequent get/put on it would
> call __drm_panel_free().
>
> Even that doesn't break stuff, because by luck panel->container is also
> NULL in this case.
>
>
> BR,
> Jani.
>
> --
> Jani Nikula, Intel
>
>

--0000000000008ee65f0634a7b0ec
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, May 8, =
2025 at 10:27=E2=80=AFAM Jani Nikula &lt;<a href=3D"mailto:jani.nikula@linu=
x.intel.com">jani.nikula@linux.intel.com</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">On Mon, 05 May 2025, Anusha Srivats=
a &lt;<a href=3D"mailto:asrivats@redhat.com" target=3D"_blank">asrivats@red=
hat.com</a>&gt; wrote:<br>
&gt; On Mon, May 5, 2025 at 2:54=E2=80=AFAM Maxime Ripard &lt;<a href=3D"ma=
ilto:mripard@kernel.org" target=3D"_blank">mripard@kernel.org</a>&gt; wrote=
:<br>
&gt;<br>
&gt;&gt; Hi Jani,<br>
&gt;&gt;<br>
&gt;&gt; On Tue, Apr 29, 2025 at 12:22:00PM +0300, Jani Nikula wrote:<br>
&gt;&gt; &gt; On Tue, 29 Apr 2025, Maxime Ripard &lt;<a href=3D"mailto:mrip=
ard@kernel.org" target=3D"_blank">mripard@kernel.org</a>&gt; wrote:<br>
&gt;&gt; &gt; &gt; Hi Jani,<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; On Mon, Apr 28, 2025 at 07:31:50PM +0300, Jani Nikula wr=
ote:<br>
&gt;&gt; &gt; &gt;&gt; On Mon, 31 Mar 2025, Anusha Srivatsa &lt;<a href=3D"=
mailto:asrivats@redhat.com" target=3D"_blank">asrivats@redhat.com</a>&gt; w=
rote:<br>
&gt;&gt; &gt; &gt;&gt; &gt; Allocate panel via reference counting. Add _get=
() and _put() helper<br>
&gt;&gt; &gt; &gt;&gt; &gt; functions to ensure panel allocations are refco=
unted. Avoid use<br>
&gt;&gt; after<br>
&gt;&gt; &gt; &gt;&gt; &gt; free by ensuring panel pointer is valid and can=
 be usable till the<br>
&gt;&gt; last<br>
&gt;&gt; &gt; &gt;&gt; &gt; reference is put.<br>
&gt;&gt; &gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt; &gt;&gt; &gt; Reviewed-by: Luca Ceresoli &lt;<a href=3D"mailt=
o:luca.ceresoli@bootlin.com" target=3D"_blank">luca.ceresoli@bootlin.com</a=
>&gt;<br>
&gt;&gt; &gt; &gt;&gt; &gt; Reviewed-by: Maxime Ripard &lt;<a href=3D"mailt=
o:mripard@kernel.org" target=3D"_blank">mripard@kernel.org</a>&gt;<br>
&gt;&gt; &gt; &gt;&gt; &gt; Signed-off-by: Anusha Srivatsa &lt;<a href=3D"m=
ailto:asrivats@redhat.com" target=3D"_blank">asrivats@redhat.com</a>&gt;<br=
>
&gt;&gt; &gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt; &gt;&gt; &gt; ---<br>
&gt;&gt; &gt; &gt;&gt; &gt; v4: Add refcounting documentation in this patch=
 (Maxime)<br>
&gt;&gt; &gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt; &gt;&gt; &gt; v3: Add include in this patch (Luca)<br>
&gt;&gt; &gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt; &gt;&gt; &gt; v2: Export drm_panel_put/get() (Maxime)<br>
&gt;&gt; &gt; &gt;&gt; &gt; - Change commit log with better workding (Luca,=
 Maxime)<br>
&gt;&gt; &gt; &gt;&gt; &gt; - Change drm_panel_put() to return void (Luca)<=
br>
&gt;&gt; &gt; &gt;&gt; &gt; - Code Cleanups - add return in documentation, =
replace bridge to<br>
&gt;&gt; &gt; &gt;&gt; &gt; panel (Luca)<br>
&gt;&gt; &gt; &gt;&gt; &gt; ---<br>
&gt;&gt; &gt; &gt;&gt; &gt;=C2=A0 drivers/gpu/drm/drm_panel.c | 64<br>
&gt;&gt; ++++++++++++++++++++++++++++++++++++++++++++-<br>
&gt;&gt; &gt; &gt;&gt; &gt;=C2=A0 include/drm/drm_panel.h=C2=A0 =C2=A0 =C2=
=A0| 19 ++++++++++++++<br>
&gt;&gt; &gt; &gt;&gt; &gt;=C2=A0 2 files changed, 82 insertions(+), 1 dele=
tion(-)<br>
&gt;&gt; &gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt; &gt;&gt; &gt; diff --git a/drivers/gpu/drm/drm_panel.c<br>
&gt;&gt; b/drivers/gpu/drm/drm_panel.c<br>
&gt;&gt; &gt; &gt;&gt; &gt; index<br>
&gt;&gt; bdeab5710ee324dc1742fbc77582250960556308..7b17531d85a4dc3031709919=
564d2e4d8332f748<br>
&gt;&gt; 100644<br>
&gt;&gt; &gt; &gt;&gt; &gt; --- a/drivers/gpu/drm/drm_panel.c<br>
&gt;&gt; &gt; &gt;&gt; &gt; +++ b/drivers/gpu/drm/drm_panel.c<br>
&gt;&gt; &gt; &gt;&gt; &gt; @@ -355,24 +355,86 @@ struct drm_panel *of_drm_=
find_panel(const<br>
&gt;&gt; struct device_node *np)<br>
&gt;&gt; &gt; &gt;&gt; &gt;=C2=A0 }<br>
&gt;&gt; &gt; &gt;&gt; &gt;=C2=A0 EXPORT_SYMBOL(of_drm_find_panel);<br>
&gt;&gt; &gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt; &gt;&gt; &gt; +static void __drm_panel_free(struct kref *kref=
)<br>
&gt;&gt; &gt; &gt;&gt; &gt; +{<br>
&gt;&gt; &gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_panel *=
panel =3D container_of(kref, struct<br>
&gt;&gt; drm_panel, refcount);<br>
&gt;&gt; &gt; &gt;&gt; &gt; +<br>
&gt;&gt; &gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 kfree(panel-&gt;co=
ntainer);<br>
&gt;&gt; &gt; &gt;&gt; &gt; +}<br>
&gt;&gt; &gt; &gt;&gt; &gt; +<br>
&gt;&gt; &gt; &gt;&gt; &gt; +/**<br>
&gt;&gt; &gt; &gt;&gt; &gt; + * drm_panel_get - Acquire a panel reference<b=
r>
&gt;&gt; &gt; &gt;&gt; &gt; + * @panel: DRM panel<br>
&gt;&gt; &gt; &gt;&gt; &gt; + *<br>
&gt;&gt; &gt; &gt;&gt; &gt; + * This function increments the panel&#39;s re=
fcount.<br>
&gt;&gt; &gt; &gt;&gt; &gt; + * Returns:<br>
&gt;&gt; &gt; &gt;&gt; &gt; + * Pointer to @panel<br>
&gt;&gt; &gt; &gt;&gt; &gt; + */<br>
&gt;&gt; &gt; &gt;&gt; &gt; +struct drm_panel *drm_panel_get(struct drm_pan=
el *panel)<br>
&gt;&gt; &gt; &gt;&gt; &gt; +{<br>
&gt;&gt; &gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!panel)<br>
&gt;&gt; &gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return panel;<br>
&gt;&gt; &gt; &gt;&gt; &gt; +<br>
&gt;&gt; &gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 kref_get(&amp;pane=
l-&gt;refcount);<br>
&gt;&gt; &gt; &gt;&gt; &gt; +<br>
&gt;&gt; &gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return panel;<br>
&gt;&gt; &gt; &gt;&gt; &gt; +}<br>
&gt;&gt; &gt; &gt;&gt; &gt; +EXPORT_SYMBOL(drm_panel_get);<br>
&gt;&gt; &gt; &gt;&gt; &gt; +<br>
&gt;&gt; &gt; &gt;&gt; &gt; +/**<br>
&gt;&gt; &gt; &gt;&gt; &gt; + * drm_panel_put - Release a panel reference<b=
r>
&gt;&gt; &gt; &gt;&gt; &gt; + * @panel: DRM panel<br>
&gt;&gt; &gt; &gt;&gt; &gt; + *<br>
&gt;&gt; &gt; &gt;&gt; &gt; + * This function decrements the panel&#39;s re=
ference count and frees<br>
&gt;&gt; the<br>
&gt;&gt; &gt; &gt;&gt; &gt; + * object if the reference count drops to zero=
.<br>
&gt;&gt; &gt; &gt;&gt; &gt; + */<br>
&gt;&gt; &gt; &gt;&gt; &gt; +void drm_panel_put(struct drm_panel *panel)<br=
>
&gt;&gt; &gt; &gt;&gt; &gt; +{<br>
&gt;&gt; &gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (panel)<br>
&gt;&gt; &gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 kref_put(&amp;panel-&gt;refcount, __drm_panel_free);<br>
&gt;&gt; &gt; &gt;&gt; &gt; +}<br>
&gt;&gt; &gt; &gt;&gt; &gt; +EXPORT_SYMBOL(drm_panel_put);<br>
&gt;&gt; &gt; &gt;&gt; &gt; +<br>
&gt;&gt; &gt; &gt;&gt; &gt; +/**<br>
&gt;&gt; &gt; &gt;&gt; &gt; + * drm_panel_put_void - wrapper to drm_panel_p=
ut() taking a void<br>
&gt;&gt; pointer<br>
&gt;&gt; &gt; &gt;&gt; &gt; + *<br>
&gt;&gt; &gt; &gt;&gt; &gt; + * @data: pointer to @struct drm_panel, cast t=
o a void pointer<br>
&gt;&gt; &gt; &gt;&gt; &gt; + *<br>
&gt;&gt; &gt; &gt;&gt; &gt; + * Wrapper of drm_panel_put() to be used when =
a function taking a<br>
&gt;&gt; void<br>
&gt;&gt; &gt; &gt;&gt; &gt; + * pointer is needed, for example as a devm ac=
tion.<br>
&gt;&gt; &gt; &gt;&gt; &gt; + */<br>
&gt;&gt; &gt; &gt;&gt; &gt; +static void drm_panel_put_void(void *data)<br>
&gt;&gt; &gt; &gt;&gt; &gt; +{<br>
&gt;&gt; &gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_panel *=
panel =3D (struct drm_panel *)data;<br>
&gt;&gt; &gt; &gt;&gt; &gt; +<br>
&gt;&gt; &gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 drm_panel_put(pane=
l);<br>
&gt;&gt; &gt; &gt;&gt; &gt; +}<br>
&gt;&gt; &gt; &gt;&gt; &gt; +<br>
&gt;&gt; &gt; &gt;&gt; &gt;=C2=A0 void *__devm_drm_panel_alloc(struct devic=
e *dev, size_t size,<br>
&gt;&gt; size_t offset,<br>
&gt;&gt; &gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const struct=
 drm_panel_funcs *funcs,<br>
&gt;&gt; &gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int connecto=
r_type)<br>
&gt;&gt; &gt; &gt;&gt; &gt;=C2=A0 {<br>
&gt;&gt; &gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 void *contain=
er;<br>
&gt;&gt; &gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_pa=
nel *panel;<br>
&gt;&gt; &gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 int err;<br>
&gt;&gt; &gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!funcs) {=
<br>
&gt;&gt; &gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 dev_warn(dev, &quot;Missing funcs pointer\n&quot;);<br>
&gt;&gt; &gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 return ERR_PTR(-EINVAL);<br>
&gt;&gt; &gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; &gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 container =3D devm=
_kzalloc(dev, size, GFP_KERNEL);<br>
&gt;&gt; &gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 container =3D kzal=
loc(size, GFP_KERNEL);<br>
&gt;&gt; &gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!containe=
r)<br>
&gt;&gt; &gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 return ERR_PTR(-ENOMEM);<br>
&gt;&gt; &gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 panel =3D con=
tainer + offset;<br>
&gt;&gt; &gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 panel-&gt;containe=
r =3D container;<br>
&gt;&gt; &gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 panel-&gt;fun=
cs =3D funcs;<br>
&gt;&gt; &gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 kref_init(&amp;pan=
el-&gt;refcount);<br>
&gt;&gt; &gt; &gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt; Hi Anusha, this should be done in drm_panel_init() i=
nstead.<br>
&gt;&gt; &gt; &gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt; There are many users of drm_panel that don&#39;t use=
<br>
&gt;&gt; devm_drm_panel_alloc()<br>
&gt;&gt; &gt; &gt;&gt; but allocate separately, and call drm_panel_init() o=
nly.<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; That wouldn&#39;t really work, because then drivers woul=
d have allocated<br>
&gt;&gt; the<br>
&gt;&gt; &gt; &gt; panel with devm_kzalloc and thus the structure would be =
freed when the<br>
&gt;&gt; &gt; &gt; device is removed, no matter the reference counting stat=
e.<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt;&gt; They&#39;ll all have refcount set to 0 instead of 1 =
like kref_init() does.<br>
&gt;&gt; &gt; &gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt; This means all subsequent get/put pairs on such pane=
ls will lead to<br>
&gt;&gt; &gt; &gt;&gt; __drm_panel_free() being called! But through a lucky=
 coincidence, that<br>
&gt;&gt; &gt; &gt;&gt; will be a nop because panel-&gt;container is also no=
t initialized...<br>
&gt;&gt; &gt; &gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt; I&#39;m sorry to say, the drm refcounting interface =
is quite broken for<br>
&gt;&gt; such<br>
&gt;&gt; &gt; &gt;&gt; use cases.<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; The plan is to convert all panel drivers to that functio=
n, and Anusha<br>
&gt;&gt; &gt; &gt; already sent series to do. It still needs a bit of work,=
 but it should<br>
&gt;&gt; &gt; &gt; land soon-ish.<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; For the transitional period though, it&#39;s not clear t=
o me what you think<br>
&gt;&gt; &gt; &gt; is broken at the moment, and / or what should be fixed.<=
br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; Would you prefer an explicit check on container not bein=
g 0, with a<br>
&gt;&gt; &gt; &gt; comment?<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; I&#39;m looking at what it would take to add drm_panel suppor=
t to i915 so<br>
&gt;&gt; &gt; that you could have drm_panel_followers on it. There are gaps=
 of course,<br>
&gt;&gt; &gt; but initially it would mean allocating and freeing drm_panel =
ourselves,<br>
&gt;&gt; &gt; not via devm_drm_panel_alloc() nor devm_kzalloc(), because no=
ne of the<br>
&gt;&gt; &gt; other stuff is allocated that way. drm_panel would just sit a=
s a<br>
&gt;&gt; &gt; sub-struct inside struct intel_panel, which is a sub-struct o=
f struct<br>
&gt;&gt; &gt; intel_connector, which has its own allocation...<br>
&gt;&gt;<br>
&gt;&gt; I&#39;m not entirely sure why you would need to allocate it from i=
915? The<br>
&gt;&gt; drm_panel structure is only meant to be allocated by panel drivers=
, and<br>
&gt;&gt; afaik no panel interface controller is allocating it.<br>
<br>
I&#39;m looking into a use case involving drm_panel_follower, which require=
s<br>
a drm_panel. I don&#39;t really need any of the other stuff in drm_panel.<b=
r>
<br>
And basically you&#39;d have one drm_panel per connector that is connected<=
br>
to a panel, within the same driver.<br>
<br>
&gt;&gt; &gt; But basically in its current state, the refcounting would not=
 be<br>
&gt;&gt; &gt; reliable for that use case. I guess with panel-&gt;container =
being NULL<br>
&gt;&gt; &gt; nothing happens, but the idea that the refcount drops back to=
 0 after a<br>
&gt;&gt; &gt; get/put is a bit scary.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Anyway, I think there should be no harm in moving the kref in=
it to<br>
&gt;&gt; &gt; drm_panel_init(), right?<br>
&gt;&gt;<br>
&gt;&gt; I mean, there is because the plan so far was to remove drm_panel_i=
nit() :)<br>
<br>
The problem with that is that it forces a certain type of allocation of<br>
drm_panel. devm_drm_panel_alloc() allows embedding drm_panel inside<br>
another struct, but that&#39;s inflexible for our use case, where we&#39;d<=
br>
probably like to embed it inside something that&#39;s already allocated as<=
br>
part of something else.<br>
<br></blockquote><div>Jani,=C2=A0</div><div>will intel_connector_init() be =
one of the code points where this will be inflexible?</div><div><br></div><=
div>Anusha</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
I mean devm_drm_panel_alloc() is great, but please don&#39;t make its use<b=
r>
mandatory!<br>
<br></blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">&gt; Jan=
i,<br>
&gt; the series that converts all drivers to use the new API:<br>
&gt; <a href=3D"https://patchwork.freedesktop.org/series/147082/" rel=3D"no=
referrer" target=3D"_blank">https://patchwork.freedesktop.org/series/147082=
/</a><br>
&gt; <a href=3D"https://patchwork.freedesktop.org/series/147157/" rel=3D"no=
referrer" target=3D"_blank">https://patchwork.freedesktop.org/series/147157=
/</a><br>
&gt; <a href=3D"https://patchwork.freedesktop.org/series/147246/" rel=3D"no=
referrer" target=3D"_blank">https://patchwork.freedesktop.org/series/147246=
/</a><br>
&gt;<br>
&gt; not landed yet but these are WIP. Still trying to understand your poin=
t<br>
&gt; though... not sure what is broken.<br>
<br>
Nothing upstream is broken per se, but if you allocated drm_panel<br>
directly yourself, initialized it with drm_panel_init(), its refcount<br>
would initially be 0, not 1, and each subsequent get/put on it would<br>
call __drm_panel_free().<br>
<br>
Even that doesn&#39;t break stuff, because by luck panel-&gt;container is a=
lso<br>
NULL in this case.<br>
<br>
<br>
BR,<br>
Jani.<br>
<br>
-- <br>
Jani Nikula, Intel<br>
<br>
</blockquote></div></div>

--0000000000008ee65f0634a7b0ec--

