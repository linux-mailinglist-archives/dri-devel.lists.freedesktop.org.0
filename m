Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 206BAAB4A39
	for <lists+dri-devel@lfdr.de>; Tue, 13 May 2025 05:44:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 916D310E1D1;
	Tue, 13 May 2025 03:44:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="KzHsvxEz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66B2A10E1D1
 for <dri-devel@lists.freedesktop.org>; Tue, 13 May 2025 03:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1747107848;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=u4XIpRD2dIptodrTQNNgI9ffJfZO/OcK8nzApSR6EN4=;
 b=KzHsvxEztikEOQSjEKLcgIExnFk7ZNkExgvJ3SMZRDGE9aX6Z65tUii8BwTpWdFK+DlIW/
 O0jUphXVNZh8GltPYh8qiZPGRGdGEQLY2fW+uIEtcw8pdRu/yo795SiOPzaq2XZMApRlvs
 Nv4hECN3xhS0SZi9IfecsIwDPxSeEYE=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-609-8ZFkRrB_Op-FqjH9bmKZFw-1; Mon, 12 May 2025 23:44:05 -0400
X-MC-Unique: 8ZFkRrB_Op-FqjH9bmKZFw-1
X-Mimecast-MFC-AGG-ID: 8ZFkRrB_Op-FqjH9bmKZFw_1747107844
Received: by mail-yw1-f197.google.com with SMTP id
 00721157ae682-708ad18b8daso77604907b3.1
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 20:44:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747107844; x=1747712644;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=u4XIpRD2dIptodrTQNNgI9ffJfZO/OcK8nzApSR6EN4=;
 b=siDZhimHRdvA9r1c8MdLY9PJ8DJJFeldgUgpkvBiELumb3n6XNj3l/G00wziU6GM6L
 QL2uCDPnBY/vyZvnEyoRuTv3lOFe1ZqTSbK6bzLmZNVcrdtgcmksLGGEAWnK84Ew2GXT
 r09yI71qg3cOhiNP1ktE5t3LEmc9dEAaFhYdj2KcZ0vj6enYOr3UYjcdtCP7t9DiLDTE
 3tKfxefjdIq3ME2MfN8/vjELB4x1w2iWTbCjTQtpevhjYH0UesHDAr9BD+6PdUxRxeir
 ZhrLyJr2snMoG7FU8bo4WNz2M6J3okDJbWXvdapdSYV9bwb1Tr88oNFwY3WvZxQLmohl
 Yr5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+pTOA3D6GcXkjqlz5b2j02mPUck8edvoVP3cpy3NcKvIeBcGGNFgz5cADR0Mre8WhN/N8sEVCZ4w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwPIdjqfc7CpXWcMRFgZlvX2fdwYIKYPvoUI3gGsECZNpETKCU4
 4/UF2yeXisQw7DyF2hDIw+4koDz6Rtp6UMcUit0+VVhsD4hE28X7eo9xa1x4L0tUFPigoG1+T88
 ZMpQe+QCDOMmZr9hlMGlmmKVb+I0blCnKOnFQ+lVmaMwdB+wZmgt81rhFwKgxwquankAWOLSaFr
 Ceqs6xmyFp+ymKSCA+Eeph+xrvqT581a8U0MWrE3V5
X-Gm-Gg: ASbGncsU1luX5+2F6s6XrVW1hhrSS++yMYk3so9OgOJgtIrmNVjivfZufRxxGfM/Cxq
 7Yg4lWX0dHzKAhDiDrX6M7lhBR3PEN56fjvcRNAnHJzjnvsJtTuvL4fiZ+Sfly4gAInc=
X-Received: by 2002:a05:690c:4484:b0:702:72e5:793f with SMTP id
 00721157ae682-70a3fb107cfmr215736827b3.23.1747107844279; 
 Mon, 12 May 2025 20:44:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGBwjso49hXew9XYDPml84H1n2Bb+6xJm87J30fAJoLoIE0MLAVZtc9lavi4w/g28f4Nlf+x+I5BDw1mNjTwJw=
X-Received: by 2002:a05:690c:4484:b0:702:72e5:793f with SMTP id
 00721157ae682-70a3fb107cfmr215736737b3.23.1747107843921; Mon, 12 May 2025
 20:44:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250331-b4-panel-refcounting-v4-0-dad50c60c6c9@redhat.com>
 <20250331-b4-panel-refcounting-v4-2-dad50c60c6c9@redhat.com>
 <87y0vkw8ll.fsf@intel.com>
 <20250429-benign-sidewinder-of-defense-6dd4d8@houat>
 <87o6wfwcef.fsf@intel.com> <20250505-slim-bizarre-marten-a674ac@houat>
 <CAN9Xe3RLazpAXdxxJmyF2QAShDtMSgdoxMdo6ecdYd7aZiP9kA@mail.gmail.com>
 <874ixvtbxy.fsf@intel.com> <20250509-rapid-flounder-of-devotion-6b26bb@houat>
 <87r00yj6kv.fsf@intel.com>
In-Reply-To: <87r00yj6kv.fsf@intel.com>
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Mon, 12 May 2025 22:40:41 -0400
X-Gm-Features: AX0GCFvvibhTVxnIpAxzeNF0R55s8192ieFrHRDu-DkWhmVqbexJDHrMKzmIXlY
Message-ID: <CAN9Xe3R87TmEzeTEFnhxAZyqdRYNSnPLcGqWATpyt4CHeYdGkg@mail.gmail.com>
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
X-Mimecast-MFC-PROC-ID: ISZxjeKgTly4L20A0aMHvxBzzrzug-1tr5ziuDmH9Nw_1747107844
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000006beca30634fc3eb3"
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

--0000000000006beca30634fc3eb3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 9, 2025 at 8:45=E2=80=AFAM Jani Nikula <jani.nikula@linux.intel=
.com>
wrote:

> On Fri, 09 May 2025, Maxime Ripard <mripard@kernel.org> wrote:
> > On Thu, May 08, 2025 at 05:27:21PM +0300, Jani Nikula wrote:
> >> On Mon, 05 May 2025, Anusha Srivatsa <asrivats@redhat.com> wrote:
> >> > On Mon, May 5, 2025 at 2:54=E2=80=AFAM Maxime Ripard <mripard@kernel=
.org>
> wrote:
> >> >
> >> >> Hi Jani,
> >> >>
> >> >> On Tue, Apr 29, 2025 at 12:22:00PM +0300, Jani Nikula wrote:
> >> >> > On Tue, 29 Apr 2025, Maxime Ripard <mripard@kernel.org> wrote:
> >> >> > > Hi Jani,
> >> >> > >
> >> >> > > On Mon, Apr 28, 2025 at 07:31:50PM +0300, Jani Nikula wrote:
> >> >> > >> On Mon, 31 Mar 2025, Anusha Srivatsa <asrivats@redhat.com>
> wrote:
> >> >> > >> > Allocate panel via reference counting. Add _get() and _put()
> helper
> >> >> > >> > functions to ensure panel allocations are refcounted. Avoid
> use
> >> >> after
> >> >> > >> > free by ensuring panel pointer is valid and can be usable
> till the
> >> >> last
> >> >> > >> > reference is put.
> >> >> > >> >
> >> >> > >> > Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> >> >> > >> > Reviewed-by: Maxime Ripard <mripard@kernel.org>
> >> >> > >> > Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
> >> >> > >> >
> >> >> > >> > ---
> >> >> > >> > v4: Add refcounting documentation in this patch (Maxime)
> >> >> > >> >
> >> >> > >> > v3: Add include in this patch (Luca)
> >> >> > >> >
> >> >> > >> > v2: Export drm_panel_put/get() (Maxime)
> >> >> > >> > - Change commit log with better workding (Luca, Maxime)
> >> >> > >> > - Change drm_panel_put() to return void (Luca)
> >> >> > >> > - Code Cleanups - add return in documentation, replace bridg=
e
> to
> >> >> > >> > panel (Luca)
> >> >> > >> > ---
> >> >> > >> >  drivers/gpu/drm/drm_panel.c | 64
> >> >> ++++++++++++++++++++++++++++++++++++++++++++-
> >> >> > >> >  include/drm/drm_panel.h     | 19 ++++++++++++++
> >> >> > >> >  2 files changed, 82 insertions(+), 1 deletion(-)
> >> >> > >> >
> >> >> > >> > diff --git a/drivers/gpu/drm/drm_panel.c
> >> >> b/drivers/gpu/drm/drm_panel.c
> >> >> > >> > index
> >> >>
> bdeab5710ee324dc1742fbc77582250960556308..7b17531d85a4dc3031709919564d2e4=
d8332f748
> >> >> 100644
> >> >> > >> > --- a/drivers/gpu/drm/drm_panel.c
> >> >> > >> > +++ b/drivers/gpu/drm/drm_panel.c
> >> >> > >> > @@ -355,24 +355,86 @@ struct drm_panel
> *of_drm_find_panel(const
> >> >> struct device_node *np)
> >> >> > >> >  }
> >> >> > >> >  EXPORT_SYMBOL(of_drm_find_panel);
> >> >> > >> >
> >> >> > >> > +static void __drm_panel_free(struct kref *kref)
> >> >> > >> > +{
> >> >> > >> > +        struct drm_panel *panel =3D container_of(kref, stru=
ct
> >> >> drm_panel, refcount);
> >> >> > >> > +
> >> >> > >> > +        kfree(panel->container);
> >> >> > >> > +}
> >> >> > >> > +
> >> >> > >> > +/**
> >> >> > >> > + * drm_panel_get - Acquire a panel reference
> >> >> > >> > + * @panel: DRM panel
> >> >> > >> > + *
> >> >> > >> > + * This function increments the panel's refcount.
> >> >> > >> > + * Returns:
> >> >> > >> > + * Pointer to @panel
> >> >> > >> > + */
> >> >> > >> > +struct drm_panel *drm_panel_get(struct drm_panel *panel)
> >> >> > >> > +{
> >> >> > >> > +        if (!panel)
> >> >> > >> > +                return panel;
> >> >> > >> > +
> >> >> > >> > +        kref_get(&panel->refcount);
> >> >> > >> > +
> >> >> > >> > +        return panel;
> >> >> > >> > +}
> >> >> > >> > +EXPORT_SYMBOL(drm_panel_get);
> >> >> > >> > +
> >> >> > >> > +/**
> >> >> > >> > + * drm_panel_put - Release a panel reference
> >> >> > >> > + * @panel: DRM panel
> >> >> > >> > + *
> >> >> > >> > + * This function decrements the panel's reference count and
> frees
> >> >> the
> >> >> > >> > + * object if the reference count drops to zero.
> >> >> > >> > + */
> >> >> > >> > +void drm_panel_put(struct drm_panel *panel)
> >> >> > >> > +{
> >> >> > >> > +        if (panel)
> >> >> > >> > +                kref_put(&panel->refcount, __drm_panel_free=
);
> >> >> > >> > +}
> >> >> > >> > +EXPORT_SYMBOL(drm_panel_put);
> >> >> > >> > +
> >> >> > >> > +/**
> >> >> > >> > + * drm_panel_put_void - wrapper to drm_panel_put() taking a
> void
> >> >> pointer
> >> >> > >> > + *
> >> >> > >> > + * @data: pointer to @struct drm_panel, cast to a void
> pointer
> >> >> > >> > + *
> >> >> > >> > + * Wrapper of drm_panel_put() to be used when a function
> taking a
> >> >> void
> >> >> > >> > + * pointer is needed, for example as a devm action.
> >> >> > >> > + */
> >> >> > >> > +static void drm_panel_put_void(void *data)
> >> >> > >> > +{
> >> >> > >> > +        struct drm_panel *panel =3D (struct drm_panel *)dat=
a;
> >> >> > >> > +
> >> >> > >> > +        drm_panel_put(panel);
> >> >> > >> > +}
> >> >> > >> > +
> >> >> > >> >  void *__devm_drm_panel_alloc(struct device *dev, size_t siz=
e,
> >> >> size_t offset,
> >> >> > >> >                               const struct drm_panel_funcs
> *funcs,
> >> >> > >> >                               int connector_type)
> >> >> > >> >  {
> >> >> > >> >          void *container;
> >> >> > >> >          struct drm_panel *panel;
> >> >> > >> > +        int err;
> >> >> > >> >
> >> >> > >> >          if (!funcs) {
> >> >> > >> >                  dev_warn(dev, "Missing funcs pointer\n");
> >> >> > >> >                  return ERR_PTR(-EINVAL);
> >> >> > >> >          }
> >> >> > >> >
> >> >> > >> > -        container =3D devm_kzalloc(dev, size, GFP_KERNEL);
> >> >> > >> > +        container =3D kzalloc(size, GFP_KERNEL);
> >> >> > >> >          if (!container)
> >> >> > >> >                  return ERR_PTR(-ENOMEM);
> >> >> > >> >
> >> >> > >> >          panel =3D container + offset;
> >> >> > >> > +        panel->container =3D container;
> >> >> > >> >          panel->funcs =3D funcs;
> >> >> > >> > +        kref_init(&panel->refcount);
> >> >> > >>
> >> >> > >> Hi Anusha, this should be done in drm_panel_init() instead.
> >> >> > >>
> >> >> > >> There are many users of drm_panel that don't use
> >> >> devm_drm_panel_alloc()
> >> >> > >> but allocate separately, and call drm_panel_init() only.
> >> >> > >
> >> >> > > That wouldn't really work, because then drivers would have
> allocated
> >> >> the
> >> >> > > panel with devm_kzalloc and thus the structure would be freed
> when the
> >> >> > > device is removed, no matter the reference counting state.
> >> >> > >
> >> >> > >> They'll all have refcount set to 0 instead of 1 like
> kref_init() does.
> >> >> > >>
> >> >> > >> This means all subsequent get/put pairs on such panels will
> lead to
> >> >> > >> __drm_panel_free() being called! But through a lucky
> coincidence, that
> >> >> > >> will be a nop because panel->container is also not
> initialized...
> >> >> > >>
> >> >> > >> I'm sorry to say, the drm refcounting interface is quite broke=
n
> for
> >> >> such
> >> >> > >> use cases.
> >> >> > >
> >> >> > > The plan is to convert all panel drivers to that function, and
> Anusha
> >> >> > > already sent series to do. It still needs a bit of work, but it
> should
> >> >> > > land soon-ish.
> >> >> > >
> >> >> > > For the transitional period though, it's not clear to me what
> you think
> >> >> > > is broken at the moment, and / or what should be fixed.
> >> >> > >
> >> >> > > Would you prefer an explicit check on container not being 0,
> with a
> >> >> > > comment?
> >> >> >
> >> >> > I'm looking at what it would take to add drm_panel support to i91=
5
> so
> >> >> > that you could have drm_panel_followers on it. There are gaps of
> course,
> >> >> > but initially it would mean allocating and freeing drm_panel
> ourselves,
> >> >> > not via devm_drm_panel_alloc() nor devm_kzalloc(), because none o=
f
> the
> >> >> > other stuff is allocated that way. drm_panel would just sit as a
> >> >> > sub-struct inside struct intel_panel, which is a sub-struct of
> struct
> >> >> > intel_connector, which has its own allocation...
> >> >>
> >> >> I'm not entirely sure why you would need to allocate it from i915?
> The
> >> >> drm_panel structure is only meant to be allocated by panel drivers,
> and
> >> >> afaik no panel interface controller is allocating it.
> >>
> >> I'm looking into a use case involving drm_panel_follower, which requir=
es
> >> a drm_panel. I don't really need any of the other stuff in drm_panel.
> >>
> >> And basically you'd have one drm_panel per connector that is connected
> >> to a panel, within the same driver.
> >
> > That answers why you need a drm_panel pointer, but not really why the
> > i915 needs to allocate it itself. The whole point of panel drivers it t=
o
> > decouple panel drivers from the connector driver (and everything
> > upstream).
> >
> > drm_panel is always allocated by the panel driver itself. I don't reall=
y
> > see a good reason to change that.
> >
> > If you don't have a panel descriptor in the ACPI tables, then you can
> > always allocate a panel-edp driver or whatever from i915 and getting it=
s
> > drm_panel?
>
> The thing is, absolutely none of our hardware/firmware/software stack
> was designed in a way that would fit the drm_panel model. (Or, arguably,
> drm_panel wasn't designed in a way that would fit our stack, in the
> chronology of things.)
>
> It's all one PCI device. All in the same MMIO space. The VBT (Video BIOS
> Tables) contain all the information for the panels, as well as for
> absolutely everything else about our display hardware. It's not separate
> in any meaningful way.
>
> Having a separate panel driver would get in the way. Having panel-edp
> would get in the way. That's why there isn't a single x86 user for
> drm_panel, AFAICT.
>
> Yes, we only really need the drm_panel handle, to play ball with the
> things that were built around it, specifically drm_panel_follower.
>
> And we do need to allocate drm_panel ourselves. We're both the host and
> the panel driver at the same time, and there's no benefit in trying to
> articially change that. DRM infrastructure should provide frameworks
> that are usable for everyone, instead of trying to force everyone into
> the same model, whether it makes sense or not.
>
> The point was to actually make it easier and less prone to bugs and not
the other way around.
Trying to understand the changes needed to make this work for i915 usecase.

I get that embedding drm_panel within intel_panel which is embedded
within intel_connector, which also embeds drm_connector and so on can
get confusing to use. But Jani,
about drm_panel_follower , which is the panel that is following the
intel_panel? Is it the associated
touchscreen if any or some other device?

Anusha

>
> BR,
> Jani.
>
> --
> Jani Nikula, Intel
>
>

--0000000000006beca30634fc3eb3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, May 9, =
2025 at 8:45=E2=80=AFAM Jani Nikula &lt;<a href=3D"mailto:jani.nikula@linux=
.intel.com">jani.nikula@linux.intel.com</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">On Fri, 09 May 2025, Maxime Ripard &=
lt;<a href=3D"mailto:mripard@kernel.org" target=3D"_blank">mripard@kernel.o=
rg</a>&gt; wrote:<br>
&gt; On Thu, May 08, 2025 at 05:27:21PM +0300, Jani Nikula wrote:<br>
&gt;&gt; On Mon, 05 May 2025, Anusha Srivatsa &lt;<a href=3D"mailto:asrivat=
s@redhat.com" target=3D"_blank">asrivats@redhat.com</a>&gt; wrote:<br>
&gt;&gt; &gt; On Mon, May 5, 2025 at 2:54=E2=80=AFAM Maxime Ripard &lt;<a h=
ref=3D"mailto:mripard@kernel.org" target=3D"_blank">mripard@kernel.org</a>&=
gt; wrote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; Hi Jani,<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; On Tue, Apr 29, 2025 at 12:22:00PM +0300, Jani Nikula wro=
te:<br>
&gt;&gt; &gt;&gt; &gt; On Tue, 29 Apr 2025, Maxime Ripard &lt;<a href=3D"ma=
ilto:mripard@kernel.org" target=3D"_blank">mripard@kernel.org</a>&gt; wrote=
:<br>
&gt;&gt; &gt;&gt; &gt; &gt; Hi Jani,<br>
&gt;&gt; &gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt; On Mon, Apr 28, 2025 at 07:31:50PM +0300, Jani =
Nikula wrote:<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; On Mon, 31 Mar 2025, Anusha Srivatsa &lt;<a=
 href=3D"mailto:asrivats@redhat.com" target=3D"_blank">asrivats@redhat.com<=
/a>&gt; wrote:<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; Allocate panel via reference counting.=
 Add _get() and _put() helper<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; functions to ensure panel allocations =
are refcounted. Avoid use<br>
&gt;&gt; &gt;&gt; after<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; free by ensuring panel pointer is vali=
d and can be usable till the<br>
&gt;&gt; &gt;&gt; last<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; reference is put.<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; Reviewed-by: Luca Ceresoli &lt;<a href=
=3D"mailto:luca.ceresoli@bootlin.com" target=3D"_blank">luca.ceresoli@bootl=
in.com</a>&gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; Reviewed-by: Maxime Ripard &lt;<a href=
=3D"mailto:mripard@kernel.org" target=3D"_blank">mripard@kernel.org</a>&gt;=
<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; Signed-off-by: Anusha Srivatsa &lt;<a =
href=3D"mailto:asrivats@redhat.com" target=3D"_blank">asrivats@redhat.com</=
a>&gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; ---<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; v4: Add refcounting documentation in t=
his patch (Maxime)<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; v3: Add include in this patch (Luca)<b=
r>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; v2: Export drm_panel_put/get() (Maxime=
)<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; - Change commit log with better workdi=
ng (Luca, Maxime)<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; - Change drm_panel_put() to return voi=
d (Luca)<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; - Code Cleanups - add return in docume=
ntation, replace bridge to<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; panel (Luca)<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; ---<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt;=C2=A0 drivers/gpu/drm/drm_panel.c | 64=
<br>
&gt;&gt; &gt;&gt; ++++++++++++++++++++++++++++++++++++++++++++-<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt;=C2=A0 include/drm/drm_panel.h=C2=A0 =
=C2=A0 =C2=A0| 19 ++++++++++++++<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt;=C2=A0 2 files changed, 82 insertions(+=
), 1 deletion(-)<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; diff --git a/drivers/gpu/drm/drm_panel=
.c<br>
&gt;&gt; &gt;&gt; b/drivers/gpu/drm/drm_panel.c<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; index<br>
&gt;&gt; &gt;&gt; bdeab5710ee324dc1742fbc77582250960556308..7b17531d85a4dc3=
031709919564d2e4d8332f748<br>
&gt;&gt; &gt;&gt; 100644<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; --- a/drivers/gpu/drm/drm_panel.c<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; +++ b/drivers/gpu/drm/drm_panel.c<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; @@ -355,24 +355,86 @@ struct drm_panel=
 *of_drm_find_panel(const<br>
&gt;&gt; &gt;&gt; struct device_node *np)<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt;=C2=A0 }<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt;=C2=A0 EXPORT_SYMBOL(of_drm_find_panel)=
;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; +static void __drm_panel_free(struct k=
ref *kref)<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; +{<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct dr=
m_panel *panel =3D container_of(kref, struct<br>
&gt;&gt; &gt;&gt; drm_panel, refcount);<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; +<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 kfree(pan=
el-&gt;container);<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; +}<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; +<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; +/**<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; + * drm_panel_get - Acquire a panel re=
ference<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; + * @panel: DRM panel<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; + *<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; + * This function increments the panel=
&#39;s refcount.<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; + * Returns:<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; + * Pointer to @panel<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; + */<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; +struct drm_panel *drm_panel_get(struc=
t drm_panel *panel)<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; +{<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!pane=
l)<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 return panel;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; +<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 kref_get(=
&amp;panel-&gt;refcount);<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; +<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return pa=
nel;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; +}<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; +EXPORT_SYMBOL(drm_panel_get);<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; +<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; +/**<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; + * drm_panel_put - Release a panel re=
ference<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; + * @panel: DRM panel<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; + *<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; + * This function decrements the panel=
&#39;s reference count and frees<br>
&gt;&gt; &gt;&gt; the<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; + * object if the reference count drop=
s to zero.<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; + */<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; +void drm_panel_put(struct drm_panel *=
panel)<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; +{<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (panel=
)<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 kref_put(&amp;panel-&gt;refcount, __drm_panel_free);<b=
r>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; +}<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; +EXPORT_SYMBOL(drm_panel_put);<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; +<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; +/**<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; + * drm_panel_put_void - wrapper to dr=
m_panel_put() taking a void<br>
&gt;&gt; &gt;&gt; pointer<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; + *<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; + * @data: pointer to @struct drm_pane=
l, cast to a void pointer<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; + *<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; + * Wrapper of drm_panel_put() to be u=
sed when a function taking a<br>
&gt;&gt; &gt;&gt; void<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; + * pointer is needed, for example as =
a devm action.<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; + */<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; +static void drm_panel_put_void(void *=
data)<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; +{<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct dr=
m_panel *panel =3D (struct drm_panel *)data;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; +<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 drm_panel=
_put(panel);<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; +}<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; +<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt;=C2=A0 void *__devm_drm_panel_alloc(str=
uct device *dev, size_t size,<br>
&gt;&gt; &gt;&gt; size_t offset,<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0co=
nst struct drm_panel_funcs *funcs,<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0in=
t connector_type)<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt;=C2=A0 {<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 void=
 *container;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 stru=
ct drm_panel *panel;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 int err;<=
br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (=
!funcs) {<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 dev_warn(dev, &quot;Missing funcs pointer\n&quot;)=
;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 return ERR_PTR(-EINVAL);<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br=
>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 container=
 =3D devm_kzalloc(dev, size, GFP_KERNEL);<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 container=
 =3D kzalloc(size, GFP_KERNEL);<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (=
!container)<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 return ERR_PTR(-ENOMEM);<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pane=
l =3D container + offset;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 panel-&gt=
;container =3D container;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pane=
l-&gt;funcs =3D funcs;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 kref_init=
(&amp;panel-&gt;refcount);<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; Hi Anusha, this should be done in drm_panel=
_init() instead.<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; There are many users of drm_panel that don&=
#39;t use<br>
&gt;&gt; &gt;&gt; devm_drm_panel_alloc()<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; but allocate separately, and call drm_panel=
_init() only.<br>
&gt;&gt; &gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt; That wouldn&#39;t really work, because then dri=
vers would have allocated<br>
&gt;&gt; &gt;&gt; the<br>
&gt;&gt; &gt;&gt; &gt; &gt; panel with devm_kzalloc and thus the structure =
would be freed when the<br>
&gt;&gt; &gt;&gt; &gt; &gt; device is removed, no matter the reference coun=
ting state.<br>
&gt;&gt; &gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; They&#39;ll all have refcount set to 0 inst=
ead of 1 like kref_init() does.<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; This means all subsequent get/put pairs on =
such panels will lead to<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; __drm_panel_free() being called! But throug=
h a lucky coincidence, that<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; will be a nop because panel-&gt;container i=
s also not initialized...<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; I&#39;m sorry to say, the drm refcounting i=
nterface is quite broken for<br>
&gt;&gt; &gt;&gt; such<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; use cases.<br>
&gt;&gt; &gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt; The plan is to convert all panel drivers to tha=
t function, and Anusha<br>
&gt;&gt; &gt;&gt; &gt; &gt; already sent series to do. It still needs a bit=
 of work, but it should<br>
&gt;&gt; &gt;&gt; &gt; &gt; land soon-ish.<br>
&gt;&gt; &gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt; For the transitional period though, it&#39;s no=
t clear to me what you think<br>
&gt;&gt; &gt;&gt; &gt; &gt; is broken at the moment, and / or what should b=
e fixed.<br>
&gt;&gt; &gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt; Would you prefer an explicit check on container=
 not being 0, with a<br>
&gt;&gt; &gt;&gt; &gt; &gt; comment?<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; I&#39;m looking at what it would take to add drm_pan=
el support to i915 so<br>
&gt;&gt; &gt;&gt; &gt; that you could have drm_panel_followers on it. There=
 are gaps of course,<br>
&gt;&gt; &gt;&gt; &gt; but initially it would mean allocating and freeing d=
rm_panel ourselves,<br>
&gt;&gt; &gt;&gt; &gt; not via devm_drm_panel_alloc() nor devm_kzalloc(), b=
ecause none of the<br>
&gt;&gt; &gt;&gt; &gt; other stuff is allocated that way. drm_panel would j=
ust sit as a<br>
&gt;&gt; &gt;&gt; &gt; sub-struct inside struct intel_panel, which is a sub=
-struct of struct<br>
&gt;&gt; &gt;&gt; &gt; intel_connector, which has its own allocation...<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; I&#39;m not entirely sure why you would need to allocate =
it from i915? The<br>
&gt;&gt; &gt;&gt; drm_panel structure is only meant to be allocated by pane=
l drivers, and<br>
&gt;&gt; &gt;&gt; afaik no panel interface controller is allocating it.<br>
&gt;&gt; <br>
&gt;&gt; I&#39;m looking into a use case involving drm_panel_follower, whic=
h requires<br>
&gt;&gt; a drm_panel. I don&#39;t really need any of the other stuff in drm=
_panel.<br>
&gt;&gt; <br>
&gt;&gt; And basically you&#39;d have one drm_panel per connector that is c=
onnected<br>
&gt;&gt; to a panel, within the same driver.<br>
&gt;<br>
&gt; That answers why you need a drm_panel pointer, but not really why the<=
br>
&gt; i915 needs to allocate it itself. The whole point of panel drivers it =
to<br>
&gt; decouple panel drivers from the connector driver (and everything<br>
&gt; upstream).<br>
&gt;<br>
&gt; drm_panel is always allocated by the panel driver itself. I don&#39;t =
really<br>
&gt; see a good reason to change that.<br>
&gt;<br>
&gt; If you don&#39;t have a panel descriptor in the ACPI tables, then you =
can<br>
&gt; always allocate a panel-edp driver or whatever from i915 and getting i=
ts<br>
&gt; drm_panel?<br>
<br>
The thing is, absolutely none of our hardware/firmware/software stack<br>
was designed in a way that would fit the drm_panel model. (Or, arguably,<br=
>
drm_panel wasn&#39;t designed in a way that would fit our stack, in the<br>
chronology of things.)<br>
<br>
It&#39;s all one PCI device. All in the same MMIO space. The VBT (Video BIO=
S<br>
Tables) contain all the information for the panels, as well as for<br>
absolutely everything else about our display hardware. It&#39;s not separat=
e<br>
in any meaningful way.<br>
<br>
Having a separate panel driver would get in the way. Having panel-edp<br>
would get in the way. That&#39;s why there isn&#39;t a single x86 user for<=
br>
drm_panel, AFAICT.<br>
<br>
Yes, we only really need the drm_panel handle, to play ball with the<br>
things that were built around it, specifically drm_panel_follower.<br>
<br>
And we do need to allocate drm_panel ourselves. We&#39;re both the host and=
<br>
the panel driver at the same time, and there&#39;s no benefit in trying to<=
br>
articially change that. DRM infrastructure should provide frameworks<br>
that are usable for everyone, instead of trying to force everyone into<br>
the same model, whether it makes sense or not.<br>
<br></blockquote><div>The point was to actually make it easier and less pro=
ne to bugs and not the other way around.</div><div>Trying to understand the=
 changes needed to make this work for i915 usecase.</div><div><br></div><di=
v>I get that embedding drm_panel within intel_panel which is embedded</div>=
<div>within intel_connector, which also embeds drm_connector and so on can =
get=C2=A0confusing to=C2=A0use. But Jani,</div><div>about drm_panel_followe=
r , which is the panel that is following the intel_panel? Is it the associa=
ted</div><div>touchscreen if any or some other device?</div><div><br></div>=
<div>Anusha</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
BR,<br>
Jani.<br>
<br>
-- <br>
Jani Nikula, Intel<br>
<br>
</blockquote></div></div>

--0000000000006beca30634fc3eb3--

