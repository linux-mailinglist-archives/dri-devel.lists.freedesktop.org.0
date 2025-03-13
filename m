Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 898ECA602E2
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 21:42:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5099010E932;
	Thu, 13 Mar 2025 20:42:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="HbNnqNqx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0399F10E932
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 20:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741898558;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lsvoIGNZaXnqVHh5mhRSyKlXDt0V9QKRv3YBWasFtJk=;
 b=HbNnqNqxUC2eOOAbV8+/a0GiZ/+SgEjx/8WFvh2B3vhuWG+S+HvhReNQhxEPF9dk4D8ak1
 SnI9alAsFdUu2DU1m1Ov3CTBBPgZGu1SXWTe+H479eQ8NjHyVWESwl/ttK85I8NTxUeH2G
 zjjHm0BF62WWEIIOGBGZmA0dBAJBo+8=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-328-ClcL6EnuP_essq4Ac9D3sQ-1; Thu, 13 Mar 2025 16:42:34 -0400
X-MC-Unique: ClcL6EnuP_essq4Ac9D3sQ-1
X-Mimecast-MFC-AGG-ID: ClcL6EnuP_essq4Ac9D3sQ_1741898554
Received: by mail-yw1-f200.google.com with SMTP id
 00721157ae682-6fecdb96e52so20039227b3.2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 13:42:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741898554; x=1742503354;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lsvoIGNZaXnqVHh5mhRSyKlXDt0V9QKRv3YBWasFtJk=;
 b=PdydBb0iceaBzbigaTuT9mrAjc62qx9NDZC4352qRg/+mB/odpmwIq93kVC2sHltzO
 2VMwAvlxaSYR/KCIBnHdx4FZ7Nu3E/fk8MGIrHCikgCMiI7NGEX1F+wQJ4hlongeGhhi
 21VQWwvHq6Q3p1QPkfSud6JL1BrnDtma8m10BscRgK2trq1+Nhr8IdnqkERwGHZQs2JW
 /ZwZnIIBdhFAqnIl8xmuNzoR4MqJx4m8rizK1iO7FiElD+zM+B/iy5ZXAlwcP2VybW2A
 pLIIdOve5lYQT40gKy8+ORThpaIV38m03BfsTuW9t9pUP1AQUd0xETcrMfShfe58FNkj
 +zdQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCULTrAcLiHrYgr+Ws2nXTOjnImCMaA85RnMG8Ev3qL9DQXjLwRvX1U4yywMS59w+iBWKpML1Xxeo0c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxN3M3VyTKNu15NVloV3yVWK2G8Zp1HDqVMLnx8L12MIz0yiJ+t
 djF4Dj9kK7Vd/hquDNwvNjOsJodSV1Qm1Y6AFi/f1csZY4MPOvxrHJKd2OMFuB95dvxIAPNsG+s
 61KU2RU1jQNGATcxoDWI564EaybqbEiDhcpH15BhTLyLR/PSoQzLRJUkSy671TY962NySYa8e3V
 Cl1ULm8xNlOiYbssYs+mddsNaEqqW0Ip8Ihq87CeES
X-Gm-Gg: ASbGncuVi+tfL9TBD0PWYF8FqFKWHHaVdJWzd0yCV+x0n6FOlS3Pia6WRYwhT9dkJkz
 SVWw7Wtj7T4e3Wj8YtRGklX8hNZ07weo/4kvf7ow0dN5iPiqClfNZew+IDU4usF0fBhN9YcA=
X-Received: by 2002:a05:690c:67c7:b0:6fb:1f78:d9ee with SMTP id
 00721157ae682-6ff42004ed4mr14564657b3.15.1741898554424; 
 Thu, 13 Mar 2025 13:42:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFMFY0I37FgHmx6HDXiO/2NIZjSxNkAQO06X7cUXSOKp+0aTyfM3HcCx4S1OHzoFj04aZIeSLTRroCvn8qt1ws=
X-Received: by 2002:a05:690c:67c7:b0:6fb:1f78:d9ee with SMTP id
 00721157ae682-6ff42004ed4mr14564477b3.15.1741898554167; Thu, 13 Mar 2025
 13:42:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250312-drm-panel-v1-0-e99cd69f6136@redhat.com>
 <20250312-drm-panel-v1-1-e99cd69f6136@redhat.com>
 <20250313-feathered-peach-okapi-b32f9d@houat>
In-Reply-To: <20250313-feathered-peach-okapi-b32f9d@houat>
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 13 Mar 2025 16:42:22 -0400
X-Gm-Features: AQ5f1JqJEkugtVmnopDskk69xfQpcdPR3aipI74foCkSITXvVO_-cQwgPCiZlwU
Message-ID: <CAN9Xe3SBZ8STJ6cJejT4L2ERW-6WpKragMYZTk9gYkeMepyJpw@mail.gmail.com>
Subject: Re: [PATCH RFC 1/2] drm/panel: Add new helpers for refcounted panel
 allocatons
To: Maxime Ripard <mripard@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: YAeOSgD2vi7dZs59ahNrSsFauY9y8tNYBSZoZVlnfjw_1741898554
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000008e654406303f5c67"
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

--0000000000008e654406303f5c67
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 13, 2025 at 10:42=E2=80=AFAM Maxime Ripard <mripard@kernel.org>=
 wrote:

> Hi Anusha,
>
> In addition to the feedback Luca already provided, I have a few comments
>
> On Wed, Mar 12, 2025 at 08:54:42PM -0400, Anusha Srivatsa wrote:
> > Introduce reference counted allocations for panels to avoid
> > use-after-free. The patch adds the macro devm_drm_bridge_alloc()
> > to allocate a new refcounted panel. Followed the documentation for
> > drmm_encoder_alloc() and devm_drm_dev_alloc and other similar
> > implementations for this purpose.
> >
> > Also adding drm_panel_get() and drm_panel_put() to suitably
> > increment and decrement the refcount
> >
> > Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
> > ---
> >  drivers/gpu/drm/drm_panel.c | 50 +++++++++++++++++++++++++++++++++++++=
+
> >  include/drm/drm_panel.h     | 58
> +++++++++++++++++++++++++++++++++++++++++++++
> >  2 files changed, 108 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
> > index
> c627e42a7ce70459f50eb5095fffc806ca45dabf..b55e380e4a2f7ffd940c207e841c197=
d85113907
> 100644
> > --- a/drivers/gpu/drm/drm_panel.c
> > +++ b/drivers/gpu/drm/drm_panel.c
> > @@ -79,6 +79,7 @@ EXPORT_SYMBOL(drm_panel_init);
> >   */
> >  void drm_panel_add(struct drm_panel *panel)
> >  {
> > +     drm_panel_get(panel);
> >       mutex_lock(&panel_lock);
> >       list_add_tail(&panel->list, &panel_list);
> >       mutex_unlock(&panel_lock);
> > @@ -96,6 +97,7 @@ void drm_panel_remove(struct drm_panel *panel)
> >       mutex_lock(&panel_lock);
> >       list_del_init(&panel->list);
> >       mutex_unlock(&panel_lock);
> > +     drm_panel_put(panel);
> >  }
> >  EXPORT_SYMBOL(drm_panel_remove);
>
> I think these two should be added as a separate patch, with some
> additional comment on why it's needed (because we store a pointer in the
> panel list).
>
Sounds good.

> >
> > @@ -355,6 +357,54 @@ struct drm_panel *of_drm_find_panel(const struct
> device_node *np)
> >  }
> >  EXPORT_SYMBOL(of_drm_find_panel);
> >
> > +/* Internal function (for refcounted panels) */
> > +void __drm_panel_free(struct kref *kref)
> > +{
> > +     struct drm_panel *panel =3D container_of(kref, struct drm_panel,
> refcount);
> > +     void *container =3D ((void *)panel) - panel->container_offset;
> > +
> > +     kfree(container);
> > +}
> > +EXPORT_SYMBOL(__drm_panel_free);
> > +
> > +static void drm_panel_put_void(void *data)
> > +{
> > +     struct drm_panel *panel =3D (struct drm_panel *)data;
> > +
> > +     drm_panel_put(panel);
> > +}
> > +
> > +void *__devm_drm_panel_alloc(struct device *dev, size_t size, size_t
> offset,
> > +                          const struct drm_panel_funcs *funcs)
> > +{
> > +     void *container;
> > +     struct drm_panel *panel;
> > +     int err;
> > +
> > +     if (!funcs) {
> > +             dev_warn(dev, "Missing funcs pointer\n");
> > +             return ERR_PTR(-EINVAL);
> > +     }
> > +
> > +     container =3D kzalloc(size, GFP_KERNEL);
> > +     if (!container)
> > +             return ERR_PTR(-ENOMEM);
> > +
> > +     panel =3D container + offset;
> > +     panel->container_offset =3D offset;
> > +     panel->funcs =3D funcs;
> > +     kref_init(&panel->refcount);
> > +
> > +     err =3D devm_add_action_or_reset(dev, drm_panel_put_void, panel);
> > +     if (err)
> > +             return ERR_PTR(err);
> > +
> > +     drm_panel_init(panel, dev, funcs, panel->connector_type);
> > +
> > +     return container;
> > +}
> > +EXPORT_SYMBOL(__devm_drm_panel_alloc);
>
> Similarly, here, I think we'd need to split that some more. Ideally, we
> should have a series of patches doing
>
> 1: Adding that allocation function you have right now, but using
>    devm_kzalloc
>
> 2: Adding the reference counting to drm_panel, with drm_panel_get /
>    drm_panel_put and the devm_action to put the reference in
>    __devm_drm_panel_alloc()
>
> 3: Adding X patches to add calls to drm_bridge_get/drm_bridge_put
>    everywhere it's needed, starting indeed by
>    drm_panel_add/drm_panel_put. We don't have to do all of them in that
>    series though. of_drm_find_panel though will probably merit a series
>    of its own, given we'd have to fix all its callers too.
>
> 4: Convert some panels to the new allocation function. You already did
>    that with panel_simple so there's nothing to change yet, but once we
>    agree on the API we should mass convert all the panels.
>
>
I want to get the API right before making mass conversion of drivers. Will
split this patch as you have suggested above. Will leave out fixing of
of_drm_find_panel() callers to a separate series as well.


Thanks!
Anusha

> Maxime
>

--0000000000008e654406303f5c67
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Mar 13,=
 2025 at 10:42=E2=80=AFAM Maxime Ripard &lt;<a href=3D"mailto:mripard@kerne=
l.org">mripard@kernel.org</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">Hi Anusha,<br>
<br>
In addition to the feedback Luca already provided, I have a few comments<br=
>
<br>
On Wed, Mar 12, 2025 at 08:54:42PM -0400, Anusha Srivatsa wrote:<br>
&gt; Introduce reference counted allocations for panels to avoid<br>
&gt; use-after-free. The patch adds the macro devm_drm_bridge_alloc()<br>
&gt; to allocate a new refcounted panel. Followed the documentation for<br>
&gt; drmm_encoder_alloc() and devm_drm_dev_alloc and other similar<br>
&gt; implementations for this purpose.<br>
&gt; <br>
&gt; Also adding drm_panel_get() and drm_panel_put() to suitably<br>
&gt; increment and decrement the refcount<br>
&gt; <br>
&gt; Signed-off-by: Anusha Srivatsa &lt;<a href=3D"mailto:asrivats@redhat.c=
om" target=3D"_blank">asrivats@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 drivers/gpu/drm/drm_panel.c | 50 +++++++++++++++++++++++++++++++=
+++++++<br>
&gt;=C2=A0 include/drm/drm_panel.h=C2=A0 =C2=A0 =C2=A0| 58 ++++++++++++++++=
+++++++++++++++++++++++++++++<br>
&gt;=C2=A0 2 files changed, 108 insertions(+)<br>
&gt; <br>
&gt; diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c=
<br>
&gt; index c627e42a7ce70459f50eb5095fffc806ca45dabf..b55e380e4a2f7ffd940c20=
7e841c197d85113907 100644<br>
&gt; --- a/drivers/gpu/drm/drm_panel.c<br>
&gt; +++ b/drivers/gpu/drm/drm_panel.c<br>
&gt; @@ -79,6 +79,7 @@ EXPORT_SYMBOL(drm_panel_init);<br>
&gt;=C2=A0 =C2=A0*/<br>
&gt;=C2=A0 void drm_panel_add(struct drm_panel *panel)<br>
&gt;=C2=A0 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0drm_panel_get(panel);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_lock(&amp;panel_lock);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0list_add_tail(&amp;panel-&gt;list, &amp;pane=
l_list);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_unlock(&amp;panel_lock);<br>
&gt; @@ -96,6 +97,7 @@ void drm_panel_remove(struct drm_panel *panel)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_lock(&amp;panel_lock);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0list_del_init(&amp;panel-&gt;list);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_unlock(&amp;panel_lock);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0drm_panel_put(panel);<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 EXPORT_SYMBOL(drm_panel_remove);<br>
<br>
I think these two should be added as a separate patch, with some<br>
additional comment on why it&#39;s needed (because we store a pointer in th=
e<br>
panel list).<br></blockquote><div>Sounds good. <br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
&gt;=C2=A0 <br>
&gt; @@ -355,6 +357,54 @@ struct drm_panel *of_drm_find_panel(const struct =
device_node *np)<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 EXPORT_SYMBOL(of_drm_find_panel);<br>
&gt;=C2=A0 <br>
&gt; +/* Internal function (for refcounted panels) */<br>
&gt; +void __drm_panel_free(struct kref *kref)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_panel *panel =3D container_of(kref, st=
ruct drm_panel, refcount);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0void *container =3D ((void *)panel) - panel-&gt;c=
ontainer_offset;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0kfree(container);<br>
&gt; +}<br>
&gt; +EXPORT_SYMBOL(__drm_panel_free);<br>
&gt; +<br>
&gt; +static void drm_panel_put_void(void *data)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_panel *panel =3D (struct drm_panel *)d=
ata;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0drm_panel_put(panel);<br>
&gt; +}<br>
&gt; +<br>
&gt; +void *__devm_drm_panel_alloc(struct device *dev, size_t size, size_t =
offset,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 const struct drm_panel_funcs *funcs)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0void *container;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_panel *panel;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int err;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!funcs) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_warn(dev, &quot;M=
issing funcs pointer\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ERR_PTR(-EINVA=
L);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0container =3D kzalloc(size, GFP_KERNEL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!container)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ERR_PTR(-ENOME=
M);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0panel =3D container + offset;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0panel-&gt;container_offset =3D offset;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0panel-&gt;funcs =3D funcs;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0kref_init(&amp;panel-&gt;refcount);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0err =3D devm_add_action_or_reset(dev, drm_panel_p=
ut_void, panel);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (err)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ERR_PTR(err);<=
br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0drm_panel_init(panel, dev, funcs, panel-&gt;conne=
ctor_type);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return container;<br>
&gt; +}<br>
&gt; +EXPORT_SYMBOL(__devm_drm_panel_alloc);<br>
<br>
Similarly, here, I think we&#39;d need to split that some more. Ideally, we=
<br>
should have a series of patches doing<br>
<br>
1: Adding that allocation function you have right now, but using<br>
=C2=A0 =C2=A0devm_kzalloc<br>
<br>
2: Adding the reference counting to drm_panel, with drm_panel_get /<br>
=C2=A0 =C2=A0drm_panel_put and the devm_action to put the reference in<br>
=C2=A0 =C2=A0__devm_drm_panel_alloc()<br>
<br>
3: Adding X patches to add calls to drm_bridge_get/drm_bridge_put<br>
=C2=A0 =C2=A0everywhere it&#39;s needed, starting indeed by<br>
=C2=A0 =C2=A0drm_panel_add/drm_panel_put. We don&#39;t have to do all of th=
em in that<br>
=C2=A0 =C2=A0series though. of_drm_find_panel though will probably merit a =
series<br>
=C2=A0 =C2=A0of its own, given we&#39;d have to fix all its callers too.<br=
>
<br>
4: Convert some panels to the new allocation function. You already did<br>
=C2=A0 =C2=A0that with panel_simple so there&#39;s nothing to change yet, b=
ut once we<br>
=C2=A0 =C2=A0agree on the API we should mass convert all the panels.<br>
<br></blockquote><div>=C2=A0</div><div>I want to get the API right before m=
aking mass conversion of drivers. Will split this patch as you have suggest=
ed above. Will leave out fixing of of_drm_find_panel() callers to a separat=
e series as well.</div><div><br></div><div><br></div><div>Thanks!</div><div=
>Anusha</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Maxime<br>
</blockquote></div></div>

--0000000000008e654406303f5c67--

