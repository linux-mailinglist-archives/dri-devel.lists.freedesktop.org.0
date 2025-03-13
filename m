Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0781A602B3
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 21:35:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84CE610E933;
	Thu, 13 Mar 2025 20:35:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="eE3FR9Gw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64E8110E933
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 20:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741898101;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OlIA+po2Td7TrIbVehFFyG13RLL5np7a238Td85feSw=;
 b=eE3FR9GwSCR7dNeOMwRxd+rtPgi6iqvRsp0CMHjTA/n+AMH5Lh7bTKIBwvDtKa2rYExs/o
 Dceu6GBA7ja8jPIjf/P+4IwYOSoTSTarsjyBSsnchH7HNcol/vfBc6JatFdqdxRyeG0tpC
 cftZZqVQKIfXFhoGaiGnOvQgtlKYVOA=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-644-vbSWqdskOfm5aCQsOWFhdg-1; Thu, 13 Mar 2025 16:34:57 -0400
X-MC-Unique: vbSWqdskOfm5aCQsOWFhdg-1
X-Mimecast-MFC-AGG-ID: vbSWqdskOfm5aCQsOWFhdg_1741898097
Received: by mail-yw1-f199.google.com with SMTP id
 00721157ae682-6fd541f4b43so18456487b3.0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 13:34:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741898097; x=1742502897;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OlIA+po2Td7TrIbVehFFyG13RLL5np7a238Td85feSw=;
 b=w5hiNj/RBjwtnCNE+NGL7NCHkLZhYIrzdv6HpK4P0sPfg5MrmiXr+auMW6uzQzVeIG
 x8WmkdGLbvtp47jrON1vALd5zlPRrKU5X90KWehaFwZ1s5dP7DfTFfJdElb0KUNEfnkn
 bYQ/fqUk/hWLJJDDtSSqIGkPD4lEW3NBBChNsKnoyd3/nDJQUh948lH1Vywav4P4XglT
 bFnf4fS0uKRX3QZZ4Wo7d1wS/9qukcYDKStPgcYNyu8iu4ZVo5KcrC1X94ZaoiuiJAkS
 IoY7hVd8SjGUFvYcDbFJWQZx/6/y1PdlAbiVf4dWMkcpivo+/KrW9eGBy40rWqvtkAeE
 3SHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXyIdiwXiHIbc3x36MdsUl33JjJLfgt6ZNJeWwN9n7VMrI+Jp2T6pQFqBskinnAd6QuarhwEKe2XxE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy3PE0R2gPMXnUWyi25BgDEFJsKO0tYxEqEAaDdTezaY6EAYxgV
 23Fl+e3eChFQQsepprlUkMy7c2JqDiMUIV2h7r6pKV/dPzGLaJaSWqfQ8pX4QADAfcmcxCMxqzD
 dX/ONFCz+61qciGTA7A2IiXUlFIAYXEBTQb3LuzEQAyFfYdvlQAw8JzxYHR7f6xsBaaYVbHHgrw
 kywG2Ilyd01FFNSI6pPE1ojFZdYb6olu/OfjX1WBu7
X-Gm-Gg: ASbGncv+S8ATv+ucB4D9724REQV1KWb1NygM82/mHmG9umrXXwjoLB3Rk22LGEomkzu
 Aqic1CKr03fGQTjnx4utjFGfCp+vJ25Uoa+3FJwv/s7tfZUpIonppWB7nX+n9u85Nu8pTR+g=
X-Received: by 2002:a05:690c:670e:b0:6f9:447d:d1a2 with SMTP id
 00721157ae682-6ff4209d7f9mr14266627b3.29.1741898096988; 
 Thu, 13 Mar 2025 13:34:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEgzyqX03fkIv0C6lu9zLNRc8lEX7eAEhKiCfHi2tdwbxez8qoqeB3QWdepwDpJZSicp2Wmuznlil0bGL4g25s=
X-Received: by 2002:a05:690c:670e:b0:6f9:447d:d1a2 with SMTP id
 00721157ae682-6ff4209d7f9mr14266327b3.29.1741898096655; Thu, 13 Mar 2025
 13:34:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250312-drm-panel-v1-0-e99cd69f6136@redhat.com>
 <20250312-drm-panel-v1-1-e99cd69f6136@redhat.com>
 <20250313110944.1c1f7e4e@booty>
In-Reply-To: <20250313110944.1c1f7e4e@booty>
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 13 Mar 2025 16:34:45 -0400
X-Gm-Features: AQ5f1JoOqgFLM7G1umCoBQD6sLzBBPVLPB3-JZ2VLfmQ3wQUJU_7jEWEsfnuYEU
Message-ID: <CAN9Xe3TeKTZtcMPtae7h33H=B-veGW93z8nMpHK+pEuNdh4=2A@mail.gmail.com>
Subject: Re: [PATCH RFC 1/2] drm/panel: Add new helpers for refcounted panel
 allocatons
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: aptNkvSk46L7WbsoVJUbHNl--AusVGmHgejDbVsC7D4_1741898097
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000004956d706303f4130"
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

--0000000000004956d706303f4130
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 13, 2025 at 6:10=E2=80=AFAM Luca Ceresoli <luca.ceresoli@bootli=
n.com>
wrote:

> Hello Anusha,
>
> On Wed, 12 Mar 2025 20:54:42 -0400
> Anusha Srivatsa <asrivats@redhat.com> wrote:
>
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
>
> I'm very happy to see the very first step of the panel rework mentioned
> by Maxime see the light! :-)
>
> This patch looks mostly good to me, and the similarity with my bridge
> refcounting work is by itself reassuring.
>
> I have a few notes, one is relevant and the others are minor details,
> see below.
>
> In the Subject line: s/allocatons/allocations/
>

good catch.

>
> [...]
>
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
>
> panel->connector_type here is uninitialized. You are passing
> panel->connector_type to drm_panel_init(), which will then copy it into
> panel->connector_type itself.
>
> So you mean I pass connector_type from the driver calling the helper, so
there is access to the connector type here?


> > +
> > +     /**
> > +      * @container_offset: Offset of this struct within the container
> > +      * struct embedding it. Used for refcounted panels to free the
> > +      * embeddeing struct when the refcount drops to zero.
> > +      */
> > +     size_t container_offset;
>
> While storing the offset obviously works, and that's what I had
> implemented in my latest bridge refcounting series, after some
> discussion with Maxime we agreed storing a container pointer instead of
> the offset is cleaner. I think it would be good here as well.
>
> See:
> https://lore.kernel.org/lkml/20250227-macho-convivial-tody-cea7dc@houat/
>

so just void *container instead of size_t container_offset.


> > +/**
> > + * drm_panel_get - Acquire a panel reference
> > + * @panel: DRM panel
> > + *
> > + * This function increments the panel's refcount.
> > + *
> > + */
> > +static inline void drm_panel_get(struct drm_panel *panel)
> > +{
> > +
>
> Remove empty line.
>
will do.

>
> > +void *__devm_drm_panel_alloc(struct device *dev, size_t size, size_t
> offset,
> > +                          const struct drm_panel_funcs *funcs);
> > +
> > +/**
> > + * devm_drm_panel_alloc - Allocate and initialize an refcounted panel
>
> s/an/a/ -- same typo as in my bridge series so I'm fixing it in my
> series as well :)
>
> > + * @dev: struct device of the panel device
> > + * @type: the type of the struct which contains struct &drm_panel
> > + * @member: the name of the &drm_panel within @type
> > + * @funcs: callbacks for this panel
> > + *
> > + * The returned refcount is initialised to 1
>
> In my opinion it is important to clarify that the caller does not have
> to explicitly call drm_panel_put() on the returned pointer, because
> devm will do it. Without clarifying, a user might think they need to,
> and that would result in an extra put, which would be a bug.
>
> Adapting from [0], that would be:
>
>  * The returned refcount is initialized to 1. This reference will be
>  * automatically dropped via devm (by calling drm_panel_put()) when @dev
>  * is removed.
>
> [0]
> https://lore.kernel.org/lkml/20250206-hotplug-drm-bridge-v6-14-9d6f2c9c30=
58@bootlin.com/
>

WIll make this change.

Thanks for the feedback!

Anusha

> Luca
>
> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>

--0000000000004956d706303f4130
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Mar 13,=
 2025 at 6:10=E2=80=AFAM Luca Ceresoli &lt;<a href=3D"mailto:luca.ceresoli@=
bootlin.com">luca.ceresoli@bootlin.com</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">Hello Anusha,<br>
<br>
On Wed, 12 Mar 2025 20:54:42 -0400<br>
Anusha Srivatsa &lt;<a href=3D"mailto:asrivats@redhat.com" target=3D"_blank=
">asrivats@redhat.com</a>&gt; wrote:<br>
<br>
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
<br>
I&#39;m very happy to see the very first step of the panel rework mentioned=
<br>
by Maxime see the light! :-)<br>
<br>
This patch looks mostly good to me, and the similarity with my bridge<br>
refcounting work is by itself reassuring.<br>
<br>
I have a few notes, one is relevant and the others are minor details,<br>
see below.<br>
<br>
In the Subject line: s/allocatons/allocations/<br></blockquote><div><br></d=
iv><div>good catch. <br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">
<br>
[...]<br>
<br>
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
<br>
panel-&gt;connector_type here is uninitialized. You are passing<br>
panel-&gt;connector_type to drm_panel_init(), which will then copy it into<=
br>
panel-&gt;connector_type itself.<br>
<br></blockquote><div>So you mean I pass connector_type from the driver cal=
ling the helper, so there is access to the connector type here?</div><div>=
=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/**<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * @container_offset: Offset of this struct withi=
n the container<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * struct embedding it. Used for refcounted panel=
s to free the<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * embeddeing struct when the refcount drops to z=
ero.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0size_t container_offset;<br>
<br>
While storing the offset obviously works, and that&#39;s what I had<br>
implemented in my latest bridge refcounting series, after some<br>
discussion with Maxime we agreed storing a container pointer instead of<br>
the offset is cleaner. I think it would be good here as well.<br>
<br>
See: <a href=3D"https://lore.kernel.org/lkml/20250227-macho-convivial-tody-=
cea7dc@houat/" rel=3D"noreferrer" target=3D"_blank">https://lore.kernel.org=
/lkml/20250227-macho-convivial-tody-cea7dc@houat/</a><br></blockquote><div>=
<br></div><div>so just void *container instead of size_t container_offset.<=
/div><div>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>
&gt; +/**<br>
&gt; + * drm_panel_get - Acquire a panel reference<br>
&gt; + * @panel: DRM panel<br>
&gt; + *<br>
&gt; + * This function increments the panel&#39;s refcount.<br>
&gt; + *<br>
&gt; + */<br>
&gt; +static inline void drm_panel_get(struct drm_panel *panel)<br>
&gt; +{<br>
&gt; +<br>
<br>
Remove empty line.<br></blockquote><div>will do. <br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
<br>
&gt; +void *__devm_drm_panel_alloc(struct device *dev, size_t size, size_t =
offset,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 const struct drm_panel_funcs *funcs);<br>
&gt; +<br>
&gt; +/**<br>
&gt; + * devm_drm_panel_alloc - Allocate and initialize an refcounted panel=
<br>
<br>
s/an/a/ -- same typo as in my bridge series so I&#39;m fixing it in my<br>
series as well :)<br>
<br>
&gt; + * @dev: struct device of the panel device<br>
&gt; + * @type: the type of the struct which contains struct &amp;drm_panel=
<br>
&gt; + * @member: the name of the &amp;drm_panel within @type<br>
&gt; + * @funcs: callbacks for this panel<br>
&gt; + *<br>
&gt; + * The returned refcount is initialised to 1<br>
<br>
In my opinion it is important to clarify that the caller does not have<br>
to explicitly call drm_panel_put() on the returned pointer, because<br>
devm will do it. Without clarifying, a user might think they need to,<br>
and that would result in an extra put, which would be a bug.<br>
<br>
Adapting from [0], that would be:<br>
<br>
=C2=A0* The returned refcount is initialized to 1. This reference will be<b=
r>
=C2=A0* automatically dropped via devm (by calling drm_panel_put()) when @d=
ev<br>
=C2=A0* is removed.<br>
<br>
[0] <a href=3D"https://lore.kernel.org/lkml/20250206-hotplug-drm-bridge-v6-=
14-9d6f2c9c3058@bootlin.com/" rel=3D"noreferrer" target=3D"_blank">https://=
lore.kernel.org/lkml/20250206-hotplug-drm-bridge-v6-14-9d6f2c9c3058@bootlin=
.com/</a><br></blockquote><div><br></div><div>WIll make this change.</div><=
div><br></div><div>Thanks for the feedback!</div><div><br></div><div>Anusha=
 <br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Luca<br>
<br>
-- <br>
Luca Ceresoli, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
<br>
</blockquote></div></div>

--0000000000004956d706303f4130--

