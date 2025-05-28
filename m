Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A25ADAC7499
	for <lists+dri-devel@lfdr.de>; Thu, 29 May 2025 01:50:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B10A910E6D1;
	Wed, 28 May 2025 23:50:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="WlNsZsc+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B4BC10E6D1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 23:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1748476208;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=T6D3nP4jywCiF414zzqa6gkML3pBa6wKz05qV+pYe5E=;
 b=WlNsZsc+agM4BvfELwrIvn3cot3da3ZBL0DDxEdO6DWyxRyYvkMQnfhHdZ6X+vGsglH+Jk
 aqW3jYbk6ipAJLRZD3Ml2S3nAFOiLm7uiPPPREWbQotmgKHElCo6lbckzngmP1en9owFlx
 KuIUPVNbAd0ja6kr6+4uLh/AaIUCX6k=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-693-dHHcrngDOkucG8gpjR8hEw-1; Wed, 28 May 2025 19:50:07 -0400
X-MC-Unique: dHHcrngDOkucG8gpjR8hEw-1
X-Mimecast-MFC-AGG-ID: dHHcrngDOkucG8gpjR8hEw_1748476206
Received: by mail-yw1-f199.google.com with SMTP id
 00721157ae682-706bf40bd8bso4952127b3.1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 16:50:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748476206; x=1749081006;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=T6D3nP4jywCiF414zzqa6gkML3pBa6wKz05qV+pYe5E=;
 b=ue5Gkyd6PYRdC4dEL/XdtTIzLW44zLVS68c7T2xd4Cc+uRi8Xz8LJ1Xf0EEs1u7nBG
 hNLV5hqCNVBAoi83dAa1nPKZCEZVoJNO/GEBtezVZrrKIrMmaQ0AlYKvaQyq4iUySkfb
 xBCs6ABSqex29h4pnV2ekBQ8OxLZ/WXF82x+9XAFmERjt+soEh3VUoJ1zioyV2CdIJDg
 4PaE5753MeDTrL/Kj091IaTSe4omyLaoKnNoSjcselhgENrKy26zvDMtO//EEvDpY/jv
 p1r490VbpG1rjD/WtEPP3eye89ySTw6eRvCCIsFn/8krH7FL5i1w5Souxn6xknlYVasb
 IcXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWi+0COlHnaAQASdlvLt8idK6ee/ELf1KNccQYByIqrTdUSK1vLCcvHibbeMYiSSCWHx233c5J/Bgg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyNCIWUsrGtHhzciYSAmTkcE7JpQWVHnOB1tVJjWyWe3UcRU7cB
 P5i4dd4NqaJdlCJPPnarHlpLz0SrHPGFlRwI4aTz2Mze7ZB0/23LVKSYRBwSYjGJOl9pR0n3KBv
 zGPRanDodRIIvyXhG7MLiS+iKLLivMxNlE4LMgFcCZyHmgl/dmynyvYu12GxDXjQZ/lgEpVdssP
 8JXmDr/3goxEzy8x6sSxhUB+4empxlktDflJ/2JevcPvk+
X-Gm-Gg: ASbGncvdQl+qpQUJT/lMHWXJFx4i2JGqXASrXyDJMaTQvZ0wadgPJjMXR55Z9djKbxa
 wBiOAlElPzRoUvv8sEBXIWHgQNAgSgiZtnmT9gFGZr0kVhGMMcOf5BHuyjFXBwn6C98Y=
X-Received: by 2002:a05:690c:7405:b0:709:197d:5d3c with SMTP id
 00721157ae682-70e2d985c22mr263039367b3.11.1748476206385; 
 Wed, 28 May 2025 16:50:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGa9o++vp5p+GJEMbZq+oxyCFoGRMcllh5M+KTGZO5AjVtv4kuR2HILfWR6sK1VnpdcKNlos6leRa9FaUcKYiY=
X-Received: by 2002:a05:690c:7405:b0:709:197d:5d3c with SMTP id
 00721157ae682-70e2d985c22mr263038927b3.11.1748476206041; Wed, 28 May 2025
 16:50:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250516-drm-bridge-alloc-doc-test-v8-0-7e356fd58ba5@bootlin.com>
 <20250516-drm-bridge-alloc-doc-test-v8-2-7e356fd58ba5@bootlin.com>
 <20250522-hot-hopeful-smilodon-dfb5b6@houat> <20250526135141.5a84185c@booty>
In-Reply-To: <20250526135141.5a84185c@booty>
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Wed, 28 May 2025 18:46:27 -0400
X-Gm-Features: AX0GCFugOzOsoPqaQV4LXCQwMlziRA1gEDBdCZ3EagHDMzbUCucdzzT-5OgK7dE
Message-ID: <CAN9Xe3Tc-n9e5Hu+CD6-_WgrsrexCk7GjH=khoGYsHNR3rqzAg@mail.gmail.com>
Subject: Re: [PATCH v8 2/3] dmr/bridge: add a .destroy func
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maxime Ripard <mripard@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, Dmitry Baryshkov <lumag@kernel.org>, 
 =?UTF-8?Q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>, 
 Hui Pu <Hui.Pu@gehealthcare.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: eV_U15oKXcdJG4u3_rh9oDHO1_EZHtbepyI5VxMVsMQ_1748476206
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000028dfc106363ad786"
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

--00000000000028dfc106363ad786
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Luca, while you are sending a new revision, the patch subject says dmr
instead of drm. Kindly make that change.

Thanks,
Anusha


On Mon, May 26, 2025 at 7:51=E2=80=AFAM Luca Ceresoli <luca.ceresoli@bootli=
n.com>
wrote:

> Hi Maxime,
>
> On Thu, 22 May 2025 17:43:37 +0200
> Maxime Ripard <mripard@kernel.org> wrote:
>
> > On Fri, May 16, 2025 at 06:48:38PM +0200, Luca Ceresoli wrote:
> > > Some users of DRM bridges may need to execute specific code just befo=
re
> > > deallocation.
> > >
> > > As of now the only known user would be KUnit tests.
> > >
> > > Suggested-by: Maxime Ripard <mripard@kernel.org>
> > > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > >
> > > ---
> > >
> > > This patch is new in v8. The .destroy callback had appeared in v5 as
> well
> > > [5], but as part of a larger patch and for different reason that do n=
ot
> > > apply anymore.
> > >
> > > [5]
> https://lore.kernel.org/all/20241231-hotplug-drm-bridge-v5-3-173065a1ece1=
@bootlin.com/#t
> > > ---
> > >  drivers/gpu/drm/drm_bridge.c |  2 ++
> > >  include/drm/drm_bridge.h     | 10 ++++++++++
> > >  2 files changed, 12 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/drm_bridge.c
> b/drivers/gpu/drm/drm_bridge.c
> > > index
> b4c89ec01998b849018ce031c7cd84614e65e710..6185cb29fe3162264f0912c09c205fb=
467975dee
> 100644
> > > --- a/drivers/gpu/drm/drm_bridge.c
> > > +++ b/drivers/gpu/drm/drm_bridge.c
> > > @@ -203,6 +203,8 @@ static void __drm_bridge_free(struct kref *kref)
> > >  {
> > >     struct drm_bridge *bridge =3D container_of(kref, struct drm_bridg=
e,
> refcount);
> > >
> > > +   if (bridge->funcs->destroy)
> > > +           bridge->funcs->destroy(bridge);
> > >     kfree(bridge->container);
> > >  }
> > >
> > > diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> > > index
> 4e418a29a9ff9d014d6ac0910a5d9bcf7118195e..3ccd493faa580845c2ed1166f398eca=
27b464261
> 100644
> > > --- a/include/drm/drm_bridge.h
> > > +++ b/include/drm/drm_bridge.h
> > > @@ -86,6 +86,16 @@ struct drm_bridge_funcs {
> > >      */
> > >     void (*detach)(struct drm_bridge *bridge);
> > >
> > > +   /**
> > > +    * @destroy:
> > > +    *
> > > +    * This callback is invoked when the bridge is about to be
> > > +    * deallocated.
> > > +    *
> > > +    * The @destroy callback is optional.
> > > +    */
> > > +   void (*destroy)(struct drm_bridge *bridge);
> > > +
> >
> > destroy is before detach in alphabetical order, but otherwise it looks
> > good to me.
>
> I saw the struct is not alpha-ordered right now, so I did not get it
> should be, and it looked like keeping .attach and .detach nearby would
> be good.
>
> > Once fixed,
> > Acked-by: Maxime Ripard <mripard@kernel.org>
>
> OK, will send new iteration with .destroy before .detach, thanks for
> the review.
>
> Luca
>
> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>

--00000000000028dfc106363ad786
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Luca, while you are sending a new revision, the patch=
 subject says dmr instead of drm. Kindly make that change.</div><div><br></=
div><div>Thanks,</div><div>Anusha<br></div><div><br></div><br><div class=3D=
"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">O=
n Mon, May 26, 2025 at 7:51=E2=80=AFAM Luca Ceresoli &lt;<a href=3D"mailto:=
luca.ceresoli@bootlin.com">luca.ceresoli@bootlin.com</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Maxime,<br>
<br>
On Thu, 22 May 2025 17:43:37 +0200<br>
Maxime Ripard &lt;<a href=3D"mailto:mripard@kernel.org" target=3D"_blank">m=
ripard@kernel.org</a>&gt; wrote:<br>
<br>
&gt; On Fri, May 16, 2025 at 06:48:38PM +0200, Luca Ceresoli wrote:<br>
&gt; &gt; Some users of DRM bridges may need to execute specific code just =
before<br>
&gt; &gt; deallocation.<br>
&gt; &gt; <br>
&gt; &gt; As of now the only known user would be KUnit tests.<br>
&gt; &gt; <br>
&gt; &gt; Suggested-by: Maxime Ripard &lt;<a href=3D"mailto:mripard@kernel.=
org" target=3D"_blank">mripard@kernel.org</a>&gt;<br>
&gt; &gt; Signed-off-by: Luca Ceresoli &lt;<a href=3D"mailto:luca.ceresoli@=
bootlin.com" target=3D"_blank">luca.ceresoli@bootlin.com</a>&gt;<br>
&gt; &gt; <br>
&gt; &gt; ---<br>
&gt; &gt; <br>
&gt; &gt; This patch is new in v8. The .destroy callback had appeared in v5=
 as well<br>
&gt; &gt; [5], but as part of a larger patch and for different reason that =
do not<br>
&gt; &gt; apply anymore.<br>
&gt; &gt; <br>
&gt; &gt; [5] <a href=3D"https://lore.kernel.org/all/20241231-hotplug-drm-b=
ridge-v5-3-173065a1ece1@bootlin.com/#t" rel=3D"noreferrer" target=3D"_blank=
">https://lore.kernel.org/all/20241231-hotplug-drm-bridge-v5-3-173065a1ece1=
@bootlin.com/#t</a><br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 drivers/gpu/drm/drm_bridge.c |=C2=A0 2 ++<br>
&gt; &gt;=C2=A0 include/drm/drm_bridge.h=C2=A0 =C2=A0 =C2=A0| 10 ++++++++++=
<br>
&gt; &gt;=C2=A0 2 files changed, 12 insertions(+)<br>
&gt; &gt; <br>
&gt; &gt; diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_b=
ridge.c<br>
&gt; &gt; index b4c89ec01998b849018ce031c7cd84614e65e710..6185cb29fe3162264=
f0912c09c205fb467975dee 100644<br>
&gt; &gt; --- a/drivers/gpu/drm/drm_bridge.c<br>
&gt; &gt; +++ b/drivers/gpu/drm/drm_bridge.c<br>
&gt; &gt; @@ -203,6 +203,8 @@ static void __drm_bridge_free(struct kref *kr=
ef)<br>
&gt; &gt;=C2=A0 {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0struct drm_bridge *bridge =3D container_of(kre=
f, struct drm_bridge, refcount);<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt; +=C2=A0 =C2=A0if (bridge-&gt;funcs-&gt;destroy)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bridge-&gt;funcs-&gt;de=
stroy(bridge);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0kfree(bridge-&gt;container);<br>
&gt; &gt;=C2=A0 }<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt; diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h<=
br>
&gt; &gt; index 4e418a29a9ff9d014d6ac0910a5d9bcf7118195e..3ccd493faa580845c=
2ed1166f398eca27b464261 100644<br>
&gt; &gt; --- a/include/drm/drm_bridge.h<br>
&gt; &gt; +++ b/include/drm/drm_bridge.h<br>
&gt; &gt; @@ -86,6 +86,16 @@ struct drm_bridge_funcs {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 */<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0void (*detach)(struct drm_bridge *bridge);<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt; +=C2=A0 =C2=A0/**<br>
&gt; &gt; +=C2=A0 =C2=A0 * @destroy:<br>
&gt; &gt; +=C2=A0 =C2=A0 *<br>
&gt; &gt; +=C2=A0 =C2=A0 * This callback is invoked when the bridge is abou=
t to be<br>
&gt; &gt; +=C2=A0 =C2=A0 * deallocated.<br>
&gt; &gt; +=C2=A0 =C2=A0 *<br>
&gt; &gt; +=C2=A0 =C2=A0 * The @destroy callback is optional.<br>
&gt; &gt; +=C2=A0 =C2=A0 */<br>
&gt; &gt; +=C2=A0 =C2=A0void (*destroy)(struct drm_bridge *bridge);<br>
&gt; &gt; +=C2=A0 <br>
&gt; <br>
&gt; destroy is before detach in alphabetical order, but otherwise it looks=
<br>
&gt; good to me.<br>
<br>
I saw the struct is not alpha-ordered right now, so I did not get it<br>
should be, and it looked like keeping .attach and .detach nearby would<br>
be good.<br>
<br>
&gt; Once fixed,<br>
&gt; Acked-by: Maxime Ripard &lt;<a href=3D"mailto:mripard@kernel.org" targ=
et=3D"_blank">mripard@kernel.org</a>&gt;<br>
<br>
OK, will send new iteration with .destroy before .detach, thanks for<br>
the review.<br>
<br>
Luca<br>
<br>
-- <br>
Luca Ceresoli, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
<br>
</blockquote></div></div>

--00000000000028dfc106363ad786--

