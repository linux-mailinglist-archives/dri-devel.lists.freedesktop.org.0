Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA8FA736E1
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 17:34:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 797F210E059;
	Thu, 27 Mar 2025 16:34:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="XVdmm/yb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BC9910E059
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 16:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1743093291;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BhPNauex+3DjaVID8k7SRlvS1eIfHuN68AsyMUt3PP0=;
 b=XVdmm/yb13+q0mhJl+wjfdQ6V0+jbg1InHLhhUovbCO6nSK6zICJVzlF0GBiAPodpJgMLC
 LJwwOHVvKH1U5lcvwOtPIdROUhJh3t/QLJouV3dw3mUI9URYjpkrZhRmuIWOtCbX25bVfZ
 qRTc12Y1j7uyKUUbsH6ivfBp7PgHHrU=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-587-oAosdEdsNIi6GLyF0Tl24A-1; Thu, 27 Mar 2025 12:34:49 -0400
X-MC-Unique: oAosdEdsNIi6GLyF0Tl24A-1
X-Mimecast-MFC-AGG-ID: oAosdEdsNIi6GLyF0Tl24A_1743093289
Received: by mail-yw1-f198.google.com with SMTP id
 00721157ae682-6ff4d1b7490so16359127b3.0
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 09:34:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743093289; x=1743698089;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BhPNauex+3DjaVID8k7SRlvS1eIfHuN68AsyMUt3PP0=;
 b=Xzsnj53TEaXuKFuEzJZSNhZ+Pwts8wA4OMexmNU6OS8o8VU2KGJobCeeG08uCDH83b
 Me7gBjldPJnCrfnBedwRcYpZ39jDD1qfuyExLR9sXRbVSmTdt8sxDDWdePn1rqMb3R2M
 qAi4PURgZMndURcGKMfpc/dlfJT59Jyy4YPpINWEaHK5R2qCbnZivCmyerawscJVYPZd
 Ry6ArGs8IYvvXkVosYOEHotOaBALrX/rV9a/Y0LHRVG4jE+Jf/oNYTCx6hCyzmQNqhsG
 8i5vXxVHBcee4mQdtTRBWyFppAX1QK4IOi2XtY82cI7EGHmJUpwTQRSsO1XHQDwRL90U
 y/Mg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5bfk7EeQNP6zUDDl2exatt4xJIiFaxZy75jU20KLuqgDOmLbIQw6gaTxnhITF4zo/Vude9XXzzhQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyx8lBcrWQhi6cpKeVJHMwZpKJqK6vH20wVSvaDvHHXgzY6WXLa
 uMoVe0SzzUm04lLMr3F+WR7mUDBAGKWZkLFjakc6CHMcKUPoh58mWqJs9e1u5e4MvhQQH0GBf+b
 fmXYmXHFjYDXLtrTW/FLG+6eTGaAkIR9MX4dqRJV36cEZMHTu5jpPxSC3LLZRPtmoWjxi0er6G3
 Yzx7OEvcFlut7vCxO7q8UXTqYOqK/Jb9FQD6DU2420
X-Gm-Gg: ASbGncuIJw7R5tyZXN81N1jQArLWM1hC2zPdrZunZFoVM9kCu0Uz6rywNbbxNJ52r9N
 WM4U4VftrB4ndYJZl4gR6Y0gA8IBRJXRYNFaIrbvN3ck8Y19Zk8E6MHqbz5eEBdC7pb3qB5w=
X-Received: by 2002:a05:690c:6082:b0:700:a6a1:66ae with SMTP id
 00721157ae682-70224fedcccmr56645557b3.16.1743093288996; 
 Thu, 27 Mar 2025 09:34:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/iwIGB5OubWl8KhvLUAzOcpFLDkCySwOmWJ5J7r1enKfwBffvt48qVDCWAXPiTPgdV9Qced+ZdyE8cTkOMcw=
X-Received: by 2002:a05:690c:6082:b0:700:a6a1:66ae with SMTP id
 00721157ae682-70224fedcccmr56645127b3.16.1743093288559; Thu, 27 Mar 2025
 09:34:48 -0700 (PDT)
MIME-Version: 1.0
References: <20250327-b4-panel-refcounting-v2-0-b5f5ca551f95@redhat.com>
 <20250327-b4-panel-refcounting-v2-1-b5f5ca551f95@redhat.com>
 <20250327-noisy-versed-mosquito-df380a@houat>
In-Reply-To: <20250327-noisy-versed-mosquito-df380a@houat>
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 27 Mar 2025 11:33:15 -0400
X-Gm-Features: AQ5f1JptYm1T39ufHzv7IYSqRh34BjtCH5QV-bv6lEDX9FLNALF9YuDjb1x6HY0
Message-ID: <CAN9Xe3QCL=KwhS0KLfaOaDc_TthQg6Gt-pLf1oEEg=1EBLZE2w@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] drm/panel: Add new helpers for refcounted panel
 allocatons
To: Maxime Ripard <mripard@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rqlgoGTxCxdRFaMaoN0zQEqth9DjUKB0cMxrDVrQm4w_1743093289
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000467a990631558822"
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

--000000000000467a990631558822
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 27, 2025 at 11:58=E2=80=AFAM Maxime Ripard <mripard@kernel.org>=
 wrote:

> On Thu, Mar 27, 2025 at 10:55:39AM -0400, Anusha Srivatsa wrote:
> > Introduce reference counted allocations for panels to avoid
> > use-after-free. The patch adds the macro devm_drm_bridge_alloc()
> > to allocate a new refcounted panel. Followed the documentation for
> > drmm_encoder_alloc() and devm_drm_dev_alloc and other similar
> > implementations for this purpose.
> >
> > v2: Better documentation for connector_type field - follow drm_panel_in=
it
> > documentation. (Luca)
> > - Clarify the refcount initialisation in comments.(Maxime)
> > - Correct the documentation of the return type (Maxime)
> >
> > Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
> > ---
> >  drivers/gpu/drm/drm_panel.c | 25 +++++++++++++++++++++++++
> >  include/drm/drm_panel.h     | 23 +++++++++++++++++++++++
> >  2 files changed, 48 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
> > index
> c627e42a7ce70459f50eb5095fffc806ca45dabf..bdeab5710ee324dc1742fbc77582250=
960556308
> 100644
> > --- a/drivers/gpu/drm/drm_panel.c
> > +++ b/drivers/gpu/drm/drm_panel.c
> > @@ -355,6 +355,31 @@ struct drm_panel *of_drm_find_panel(const struct
> device_node *np)
> >  }
> >  EXPORT_SYMBOL(of_drm_find_panel);
> >
> > +void *__devm_drm_panel_alloc(struct device *dev, size_t size, size_t
> offset,
> > +                          const struct drm_panel_funcs *funcs,
> > +                          int connector_type)
> > +{
> > +     void *container;
> > +     struct drm_panel *panel;
> > +
> > +     if (!funcs) {
> > +             dev_warn(dev, "Missing funcs pointer\n");
> > +             return ERR_PTR(-EINVAL);
> > +     }
> > +
> > +     container =3D devm_kzalloc(dev, size, GFP_KERNEL);
> > +     if (!container)
> > +             return ERR_PTR(-ENOMEM);
> > +
> > +     panel =3D container + offset;
> > +     panel->funcs =3D funcs;
> > +
> > +     drm_panel_init(panel, dev, funcs, connector_type);
> > +
> > +     return container;
> > +}
> > +EXPORT_SYMBOL(__devm_drm_panel_alloc);
> > +
> >  /**
> >   * of_drm_get_panel_orientation - look up the orientation of the panel
> through
> >   * the "rotation" binding from a device tree node
> > diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
> > index
> a9c042c8dea1a82ef979c7a68204e0b55483fc28..53251c6b11d78149ede3dad41ffa6a8=
8f3c3c58b
> 100644
> > --- a/include/drm/drm_panel.h
> > +++ b/include/drm/drm_panel.h
> > @@ -28,6 +28,7 @@
> >  #include <linux/errno.h>
> >  #include <linux/list.h>
> >  #include <linux/mutex.h>
> > +#include <linux/kref.h>
> >
> >  struct backlight_device;
> >  struct dentry;
> > @@ -268,6 +269,28 @@ struct drm_panel {
> >       bool enabled;
> >  };
> >
> > +void *__devm_drm_panel_alloc(struct device *dev, size_t size, size_t
> offset,
> > +                          const struct drm_panel_funcs *funcs,
> > +                          int connector_type);
> > +
> > +/**
> > + * devm_drm_panel_alloc - Allocate and initialize an refcounted panel
> > + * @dev: struct device of the panel device
> > + * @type: the type of the struct which contains struct &drm_panel
> > + * @member: the name of the &drm_panel within @type
> > + * @funcs: callbacks for this panel
> > + * @connector_type: the connector type (DRM_MODE_CONNECTOR_*)
> corresponding to
> > + * the panel interface
> > + * Returns:
> > + * Pointer to container structure embedding the panel, ERR_PTR on
> failure.
> > + * The reference count is initialised to 1 and is automatically  given
> back
> > + * by devm action.
>
> Sorry, I noticed after the facts, but this can't be in the Returns
> section, it needs to be in the main one.
>
> Maxime, Not really following you. Are you suggesting this explanation
needs to be in the helper documentation
instead of in returns?

Anusha

> Maxime
>

--000000000000467a990631558822
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Mar 27,=
 2025 at 11:58=E2=80=AFAM Maxime Ripard &lt;<a href=3D"mailto:mripard@kerne=
l.org">mripard@kernel.org</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">On Thu, Mar 27, 2025 at 10:55:39AM -0400, Anusha S=
rivatsa wrote:<br>
&gt; Introduce reference counted allocations for panels to avoid<br>
&gt; use-after-free. The patch adds the macro devm_drm_bridge_alloc()<br>
&gt; to allocate a new refcounted panel. Followed the documentation for<br>
&gt; drmm_encoder_alloc() and devm_drm_dev_alloc and other similar<br>
&gt; implementations for this purpose.<br>
&gt; <br>
&gt; v2: Better documentation for connector_type field - follow drm_panel_i=
nit<br>
&gt; documentation. (Luca)<br>
&gt; - Clarify the refcount initialisation in comments.(Maxime)<br>
&gt; - Correct the documentation of the return type (Maxime)<br>
&gt; <br>
&gt; Signed-off-by: Anusha Srivatsa &lt;<a href=3D"mailto:asrivats@redhat.c=
om" target=3D"_blank">asrivats@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 drivers/gpu/drm/drm_panel.c | 25 +++++++++++++++++++++++++<br>
&gt;=C2=A0 include/drm/drm_panel.h=C2=A0 =C2=A0 =C2=A0| 23 ++++++++++++++++=
+++++++<br>
&gt;=C2=A0 2 files changed, 48 insertions(+)<br>
&gt; <br>
&gt; diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c=
<br>
&gt; index c627e42a7ce70459f50eb5095fffc806ca45dabf..bdeab5710ee324dc1742fb=
c77582250960556308 100644<br>
&gt; --- a/drivers/gpu/drm/drm_panel.c<br>
&gt; +++ b/drivers/gpu/drm/drm_panel.c<br>
&gt; @@ -355,6 +355,31 @@ struct drm_panel *of_drm_find_panel(const struct =
device_node *np)<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 EXPORT_SYMBOL(of_drm_find_panel);<br>
&gt;=C2=A0 <br>
&gt; +void *__devm_drm_panel_alloc(struct device *dev, size_t size, size_t =
offset,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 const struct drm_panel_funcs *funcs,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 int connector_type)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0void *container;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_panel *panel;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!funcs) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_warn(dev, &quot;M=
issing funcs pointer\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ERR_PTR(-EINVA=
L);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0container =3D devm_kzalloc(dev, size, GFP_KERNEL)=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!container)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ERR_PTR(-ENOME=
M);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0panel =3D container + offset;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0panel-&gt;funcs =3D funcs;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0drm_panel_init(panel, dev, funcs, connector_type)=
;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return container;<br>
&gt; +}<br>
&gt; +EXPORT_SYMBOL(__devm_drm_panel_alloc);<br>
&gt; +<br>
&gt;=C2=A0 /**<br>
&gt;=C2=A0 =C2=A0* of_drm_get_panel_orientation - look up the orientation o=
f the panel through<br>
&gt;=C2=A0 =C2=A0* the &quot;rotation&quot; binding from a device tree node=
<br>
&gt; diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h<br>
&gt; index a9c042c8dea1a82ef979c7a68204e0b55483fc28..53251c6b11d78149ede3da=
d41ffa6a88f3c3c58b 100644<br>
&gt; --- a/include/drm/drm_panel.h<br>
&gt; +++ b/include/drm/drm_panel.h<br>
&gt; @@ -28,6 +28,7 @@<br>
&gt;=C2=A0 #include &lt;linux/errno.h&gt;<br>
&gt;=C2=A0 #include &lt;linux/list.h&gt;<br>
&gt;=C2=A0 #include &lt;linux/mutex.h&gt;<br>
&gt; +#include &lt;linux/kref.h&gt;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 struct backlight_device;<br>
&gt;=C2=A0 struct dentry;<br>
&gt; @@ -268,6 +269,28 @@ struct drm_panel {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bool enabled;<br>
&gt;=C2=A0 };<br>
&gt;=C2=A0 <br>
&gt; +void *__devm_drm_panel_alloc(struct device *dev, size_t size, size_t =
offset,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 const struct drm_panel_funcs *funcs,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 int connector_type);<br>
&gt; +<br>
&gt; +/**<br>
&gt; + * devm_drm_panel_alloc - Allocate and initialize an refcounted panel=
<br>
&gt; + * @dev: struct device of the panel device<br>
&gt; + * @type: the type of the struct which contains struct &amp;drm_panel=
<br>
&gt; + * @member: the name of the &amp;drm_panel within @type<br>
&gt; + * @funcs: callbacks for this panel<br>
&gt; + * @connector_type: the connector type (DRM_MODE_CONNECTOR_*) corresp=
onding to<br>
&gt; + * the panel interface<br>
&gt; + * Returns:<br>
&gt; + * Pointer to container structure embedding the panel, ERR_PTR on fai=
lure.<br>
&gt; + * The reference count is initialised to 1 and is automatically=C2=A0=
 given back<br>
&gt; + * by devm action.<br>
<br>
Sorry, I noticed after the facts, but this can&#39;t be in the Returns<br>
section, it needs to be in the main one.<br>
<br></blockquote><div>Maxime, Not really following you. Are you suggesting =
this explanation needs to be in the helper documentation=C2=A0</div><div>in=
stead of in returns?</div><div><br></div><div>Anusha</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
Maxime<br>
</blockquote></div></div>

--000000000000467a990631558822--

