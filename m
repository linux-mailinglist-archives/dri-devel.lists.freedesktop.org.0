Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B61A614B7
	for <lists+dri-devel@lfdr.de>; Fri, 14 Mar 2025 16:22:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E05910E97A;
	Fri, 14 Mar 2025 15:21:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="eN5hV6cb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC20810E97A
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 15:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741965713;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1wclPpb6TJlM90mljb9qo7qOvVYPkzUbKrUG0F/cNlo=;
 b=eN5hV6cbHL/1Sib5zqsmqTnOg0A7hW94EX6GB1l1iZbRn8arreaBZrpczzzA2+SayLZSZL
 wisITxnEO8oVEBLobHfBBB6zWC2QufyirlidcPsX71ZGgYnzAytuAvNFoBpANbbi+YspUo
 7+jgb0V26iXer6l6daXw9ieeLgFsz8A=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-556-Kduo0SvuNjK6YFaDNQFd6w-1; Fri, 14 Mar 2025 11:21:51 -0400
X-MC-Unique: Kduo0SvuNjK6YFaDNQFd6w-1
X-Mimecast-MFC-AGG-ID: Kduo0SvuNjK6YFaDNQFd6w_1741965711
Received: by mail-yw1-f200.google.com with SMTP id
 00721157ae682-6fd010df0f4so35707167b3.3
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 08:21:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741965711; x=1742570511;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1wclPpb6TJlM90mljb9qo7qOvVYPkzUbKrUG0F/cNlo=;
 b=htNcM/Poc4zCB6HXin5XhOHYZx3uEAgcR1FXvTw0kKk1yqHgT52iY6vhQOCFPWjPcp
 4GLPrdY/xvhyLRyP2/RqbpIv0pNkD3hZV2HB2gVMnDaJ8qgxrOtoECmBmD/QLBmDm+4O
 l91Y1UKgVDJ08koeO0AAsBDlmeG6cE+4nE+46NCm91Be8x/pLmSKr3AKVpugOYu4Vo//
 JVU4cMnyFbPxelXE18rt+vLBKhONfhDllr5IUBXFQFtUSe3LugTxgO22xyKytz0Ysaya
 ss5J2HOvDmMFki5+QQAc7+L0cCdoIQZHR5KvlaK8A0yzTrwv3qiUIATWSIeoYCNzDtJf
 9vvw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVU+ySqpx5UYPMfD9IXB6wScrBXXPgu7sywcnys4EEe8fVWBaBt79Ico8tCWbXsgnOpyf1jcG+3PLM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxUGg3Vl0XDrMLL/UBYd5EEZOaFrqg/EWwZPVxWd0mtWiHBd+81
 PlnGHCz53fJ/l0JQ0WuiMkAb2m6z35paPhCtPamadvRXbsSEo+fosLP5zv5Kkzr3jFw5yKzmBsh
 PNMWRwCo2U8CfHE8MqYqW2D68eQNsuRRbyZLHr5uWUxiAhsYZYk1MN1UewrSlquGT98dGLrJxRb
 XHucuwTVSDj47NVvfRxzYcHD2znHWufPhzOQiXoO82
X-Gm-Gg: ASbGncuz3Zq01IuJ97NbzihQyMzxM6trpQ/ceL8fluaCZ6lEsBEyAY5ISHAFibdLbT3
 33mBQlY0i0NPtjHV3Ces/+Ta1Gdtt4YIPjMfUnUcLFiRKahqCSlww5chyQsasGWznEYMaK5E=
X-Received: by 2002:a05:690c:3388:b0:6f9:78c0:3a5f with SMTP id
 00721157ae682-6ff45ef4dfdmr37799527b3.19.1741965710668; 
 Fri, 14 Mar 2025 08:21:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFxlzfmesRYpftv8/u9O5nth3/U3MSHrA2c/eNMyBqJn3t04K/2428pzfRsu62bK3mCnBn1dqKlYHZaxbllR4Y=
X-Received: by 2002:a05:690c:3388:b0:6f9:78c0:3a5f with SMTP id
 00721157ae682-6ff45ef4dfdmr37798957b3.19.1741965709894; Fri, 14 Mar 2025
 08:21:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250312-drm-panel-v1-0-e99cd69f6136@redhat.com>
 <20250312-drm-panel-v1-1-e99cd69f6136@redhat.com>
 <20250313110944.1c1f7e4e@booty>
 <CAN9Xe3TeKTZtcMPtae7h33H=B-veGW93z8nMpHK+pEuNdh4=2A@mail.gmail.com>
 <20250314132709.16a38692@booty>
In-Reply-To: <20250314132709.16a38692@booty>
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Fri, 14 Mar 2025 11:21:39 -0400
X-Gm-Features: AQ5f1Jrq-rv83kRH-VzKkcqA980HkC4-8837xI-u0qLOR8Itn7DHYTdQ_fpcMJ4
Message-ID: <CAN9Xe3QFRt3hfdNoSMwfE1w+nxhhdgUyJcfSEa0T_8sVu=z_ow@mail.gmail.com>
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
X-Mimecast-MFC-PROC-ID: 4Ddt0KaMB2OXrNSG3fawEfEI0eXs_FRj6D1gncFaLFE_1741965711
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000597fa306304eff74"
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

--000000000000597fa306304eff74
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 14, 2025 at 8:27=E2=80=AFAM Luca Ceresoli <luca.ceresoli@bootli=
n.com>
wrote:

> Hello Anusha,
>
> On Thu, 13 Mar 2025 16:34:45 -0400
> Anusha Srivatsa <asrivats@redhat.com> wrote:
>
> > > > +void *__devm_drm_panel_alloc(struct device *dev, size_t size,
> size_t
> > > offset,
> > > > +                          const struct drm_panel_funcs *funcs)
> > > > +{
> > > > +     void *container;
> > > > +     struct drm_panel *panel;
> > > > +     int err;
> > > > +
> > > > +     if (!funcs) {
> > > > +             dev_warn(dev, "Missing funcs pointer\n");
> > > > +             return ERR_PTR(-EINVAL);
> > > > +     }
> > > > +
> > > > +     container =3D kzalloc(size, GFP_KERNEL);
> > > > +     if (!container)
> > > > +             return ERR_PTR(-ENOMEM);
> > > > +
> > > > +     panel =3D container + offset;
> > > > +     panel->container_offset =3D offset;
> > > > +     panel->funcs =3D funcs;
> > > > +     kref_init(&panel->refcount);
> > > > +
> > > > +     err =3D devm_add_action_or_reset(dev, drm_panel_put_void, pan=
el);
> > > > +     if (err)
> > > > +             return ERR_PTR(err);
> > > > +
> > > > +     drm_panel_init(panel, dev, funcs, panel->connector_type);
> > >
> > > panel->connector_type here is uninitialized. You are passing
> > > panel->connector_type to drm_panel_init(), which will then copy it in=
to
> > > panel->connector_type itself.
> > >
> > > So you mean I pass connector_type from the driver calling the helper,
> so
> > there is access to the connector type here?
>
> I'm not a panel expert, but I think it makes sense that to create the
> panel you need to know the connection type, and that is what Maxime
> suggested.
>
> > > > +     /**
> > > > +      * @container_offset: Offset of this struct within the
> container
> > > > +      * struct embedding it. Used for refcounted panels to free th=
e
> > > > +      * embeddeing struct when the refcount drops to zero.
> > > > +      */
> > > > +     size_t container_offset;
> > >
> > > While storing the offset obviously works, and that's what I had
> > > implemented in my latest bridge refcounting series, after some
> > > discussion with Maxime we agreed storing a container pointer instead =
of
> > > the offset is cleaner. I think it would be good here as well.
> > >
> > > See:
> > >
> https://lore.kernel.org/lkml/20250227-macho-convivial-tody-cea7dc@houat/
> > >
> >
> > so just void *container instead of size_t container_offset.
>
> Exactly. You can have a look at the patch I sent earlier today:
>
> https://lore.kernel.org/lkml/20250314-drm-bridge-refcount-v7-2-152571f8c6=
94@bootlin.com/
>
>
This helps. Thanks

Anusha

> Luca
>
> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>

--000000000000597fa306304eff74
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Mar 14,=
 2025 at 8:27=E2=80=AFAM Luca Ceresoli &lt;<a href=3D"mailto:luca.ceresoli@=
bootlin.com">luca.ceresoli@bootlin.com</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">Hello Anusha,<br>
<br>
On Thu, 13 Mar 2025 16:34:45 -0400<br>
Anusha Srivatsa &lt;<a href=3D"mailto:asrivats@redhat.com" target=3D"_blank=
">asrivats@redhat.com</a>&gt; wrote:<br>
<br>
&gt; &gt; &gt; +void *__devm_drm_panel_alloc(struct device *dev, size_t siz=
e, size_t=C2=A0 <br>
&gt; &gt; offset,=C2=A0 <br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const struct drm_panel_funcs *funcs)<br>
&gt; &gt; &gt; +{<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0void *container;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0struct drm_panel *panel;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0int err;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0if (!funcs) {<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_warn(de=
v, &quot;Missing funcs pointer\n&quot;);<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ERR_=
PTR(-EINVAL);<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0container =3D kzalloc(size, GFP_KERNEL)=
;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0if (!container)<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ERR_=
PTR(-ENOMEM);<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0panel =3D container + offset;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0panel-&gt;container_offset =3D offset;<=
br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0panel-&gt;funcs =3D funcs;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0kref_init(&amp;panel-&gt;refcount);<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0err =3D devm_add_action_or_reset(dev, d=
rm_panel_put_void, panel);<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0if (err)<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ERR_=
PTR(err);<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0drm_panel_init(panel, dev, funcs, panel=
-&gt;connector_type);=C2=A0 <br>
&gt; &gt;<br>
&gt; &gt; panel-&gt;connector_type here is uninitialized. You are passing<b=
r>
&gt; &gt; panel-&gt;connector_type to drm_panel_init(), which will then cop=
y it into<br>
&gt; &gt; panel-&gt;connector_type itself.<br>
&gt; &gt;<br>
&gt; &gt; So you mean I pass connector_type from the driver calling the hel=
per, so=C2=A0 <br>
&gt; there is access to the connector type here?<br>
<br>
I&#39;m not a panel expert, but I think it makes sense that to create the<b=
r>
panel you need to know the connection type, and that is what Maxime<br>
suggested.<br>
<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0/**<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 * @container_offset: Offset of this st=
ruct within the container<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 * struct embedding it. Used for refcou=
nted panels to free the<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 * embeddeing struct when the refcount =
drops to zero.<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 */<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0size_t container_offset;=C2=A0 <br>
&gt; &gt;<br>
&gt; &gt; While storing the offset obviously works, and that&#39;s what I h=
ad<br>
&gt; &gt; implemented in my latest bridge refcounting series, after some<br=
>
&gt; &gt; discussion with Maxime we agreed storing a container pointer inst=
ead of<br>
&gt; &gt; the offset is cleaner. I think it would be good here as well.<br>
&gt; &gt;<br>
&gt; &gt; See:<br>
&gt; &gt; <a href=3D"https://lore.kernel.org/lkml/20250227-macho-convivial-=
tody-cea7dc@houat/" rel=3D"noreferrer" target=3D"_blank">https://lore.kerne=
l.org/lkml/20250227-macho-convivial-tody-cea7dc@houat/</a><br>
&gt; &gt;=C2=A0 <br>
&gt; <br>
&gt; so just void *container instead of size_t container_offset.<br>
<br>
Exactly. You can have a look at the patch I sent earlier today:<br>
<a href=3D"https://lore.kernel.org/lkml/20250314-drm-bridge-refcount-v7-2-1=
52571f8c694@bootlin.com/" rel=3D"noreferrer" target=3D"_blank">https://lore=
.kernel.org/lkml/20250314-drm-bridge-refcount-v7-2-152571f8c694@bootlin.com=
/</a><br>
<br></blockquote><div><br></div><div>This helps. Thanks</div><div><br></div=
><div>Anusha <br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Luca<br>
<br>
-- <br>
Luca Ceresoli, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
<br>
</blockquote></div></div>

--000000000000597fa306304eff74--

