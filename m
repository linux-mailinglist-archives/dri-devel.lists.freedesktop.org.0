Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 725CEA71C94
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 17:59:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0F5110E759;
	Wed, 26 Mar 2025 16:59:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Y7f56Ycc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F2B210E759
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 16:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1743008355;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Rjq3Hj5xFP6rZJxR2TTuDzPzPwL1lh4vdjniXd5m5RU=;
 b=Y7f56Ycc08Fe9/5A4Q7ezIyougvo1AZzrRktF9n9raDsNeD9yRxbijz/uzZPDTh9PrWfsv
 JHEaiemywwM8roK2idteDZqwawg3OZ6lKmsQUfDHAvcCY22KzjCZ+PLYsBkPx8doitf1lQ
 zJzbSlvweUcsP596gBJXnGX12lgO234=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-658-pj9G-1_nMgW-rw4gk-zsvw-1; Wed, 26 Mar 2025 12:59:14 -0400
X-MC-Unique: pj9G-1_nMgW-rw4gk-zsvw-1
X-Mimecast-MFC-AGG-ID: pj9G-1_nMgW-rw4gk-zsvw_1743008354
Received: by mail-yw1-f199.google.com with SMTP id
 00721157ae682-6fda1dcbdf1so796287b3.1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 09:59:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743008353; x=1743613153;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Rjq3Hj5xFP6rZJxR2TTuDzPzPwL1lh4vdjniXd5m5RU=;
 b=kRSCTw5Ws7gVCTGnG3oLm834yjjZ+dJ4tUxAEjyK7//v4X+kn/fMkKXdpBHVnZsB30
 vh49H+QR8jxxwFZjyE+t7TRomEKENZWJQlQ4pltyCjzSrWYKEzZTn7nIY4XLhSZfUplp
 OS0Ip/aRmPKWJQOi5dSzxayOCodob2qWzj9jx3/V/S0jZ5KPMtImB3T40296AxcYomAr
 FiPPsHUqwA/GGWe7dRvlaHPIp4hXt8aIAzSsodIDTddD11uZOyaA1v09Pm5RvUs1GUSX
 wOa3RDolw85oAzNBq7XhdRso7LnsQnKnHvcvl4Mw4cYI8qH/5xtmQCCjHE9n3/JdqbDi
 IJzQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXOJq/JV0peVBWgZFIe4pjPmHF4Xn+izrFN0uFmr9jmUSXe9K8FxFYA8JgxpgBBTkQTw7TpsXY+qqw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwIAVzFzf5iyeOPkIyNBakJRTFashPDrASCKEJcTTc0HecN9C2r
 rIp3Frz07AqFJ0vtivwBsgJaycpR2VxADSjGE6D0VV4my3DD+16EUGgXJaN2pbtbTeg/CzpQkNo
 yfvZ4cYrmUtL3LJwCs2Nvq6fZTGkjbfdN1yiPkZBbBh/0TSkAvT1pdykmQ/LBS7UdNYHMzwJYPy
 k+nzvKwLVhv2ddJMupCm52oBOb2kizmfM4NlcZpkr+
X-Gm-Gg: ASbGncs22jrimOB7lM1Xw8sf/Beuzp92niul1xq5wyLIVBJqSlIeMEEsssx38uxKz+8
 z1sn/E6EKCrZD0B+ND94V7KceG3igmkC01OMx8CCrV1uCpx1Dyd10x0xQcTUt2EMGjGfu4J0=
X-Received: by 2002:a05:690c:6f89:b0:6f7:56f7:239a with SMTP id
 00721157ae682-70224ef8d01mr3527407b3.5.1743008353555; 
 Wed, 26 Mar 2025 09:59:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGNhD/VnPuq2cwb513UQKU5kZaK7hnPtV7L199yzf7UrIkBMXew7fdhv6yxmsNW85m9Jnnw+W0intfImlVxg+M=
X-Received: by 2002:a05:690c:6f89:b0:6f7:56f7:239a with SMTP id
 00721157ae682-70224ef8d01mr3527067b3.5.1743008353151; Wed, 26 Mar 2025
 09:59:13 -0700 (PDT)
MIME-Version: 1.0
References: <20250325-b4-panel-refcounting-v1-0-4e2bf5d19c5d@redhat.com>
 <20250325-b4-panel-refcounting-v1-4-4e2bf5d19c5d@redhat.com>
 <20250326-deft-vegan-stoat-ff14ff@houat>
In-Reply-To: <20250326-deft-vegan-stoat-ff14ff@houat>
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Wed, 26 Mar 2025 12:59:02 -0400
X-Gm-Features: AQ5f1JqpoRPe7w04zh2RRwaIAt9nW8dgoI7pNGjvtEUUnwu5T8O2URUdLhbAVIc
Message-ID: <CAN9Xe3SWMz3M7ENbxJhh+_Z-qkbwRr3fP6OCLdfQowszN_V=HQ@mail.gmail.com>
Subject: Re: [PATCH 4/5] drm/panel: deprecate old-style panel allocation
To: Maxime Ripard <mripard@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: WZsSI99iGy8MTzmbjDjJQ2A5Qbs7lxLmIzYMQe87bb4_1743008354
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000bb0300063141c18b"
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

--000000000000bb0300063141c18b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 26, 2025 at 11:32=E2=80=AFAM Maxime Ripard <mripard@kernel.org>=
 wrote:

> On Tue, Mar 25, 2025 at 01:24:11PM -0400, Anusha Srivatsa wrote:
> > Start moving to the new refcounted allocations using
> > the new API devm_drm_panel_alloc(). Deprecate any other
> > allocation.
> >
> > Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
> > ---
> >  drivers/gpu/drm/drm_panel.c | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
> > index
> 11a0415bc61f59190ef5eb378d1583c493265e6a..5793011f4938a2d4fb9d84a700817bd=
a317af305
> 100644
> > --- a/drivers/gpu/drm/drm_panel.c
> > +++ b/drivers/gpu/drm/drm_panel.c
> > @@ -74,8 +74,10 @@ EXPORT_SYMBOL(drm_panel_init);
> >   * drm_panel_add - add a panel to the global registry
> >   * @panel: panel to add
> >   *
> > - * Add a panel to the global registry so that it can be looked up by
> display
> > - * drivers.
> > + * Add a panel to the global registry so that it can be looked
> > + * up by display drivers. The panel to be added must have been
> > + * allocated by devm_drm_panel_alloc(). Old-style allocation by
> > + * kzalloc(), devm_kzalloc() and similar is deprecated.
>
> It's not that it's deprecated, it's that it's unsafe. Since you already
> said that the allocation must be done through devm_drm_panel_alloc(),
> there's not much use to mention the old style stuff, I'd just drop the
> last sentence.
>
>
Alrighty.

Thanks,
Anusha

> Maxime
>

--000000000000bb0300063141c18b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 26,=
 2025 at 11:32=E2=80=AFAM Maxime Ripard &lt;<a href=3D"mailto:mripard@kerne=
l.org">mripard@kernel.org</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">On Tue, Mar 25, 2025 at 01:24:11PM -0400, Anusha S=
rivatsa wrote:<br>
&gt; Start moving to the new refcounted allocations using<br>
&gt; the new API devm_drm_panel_alloc(). Deprecate any other<br>
&gt; allocation.<br>
&gt; <br>
&gt; Signed-off-by: Anusha Srivatsa &lt;<a href=3D"mailto:asrivats@redhat.c=
om" target=3D"_blank">asrivats@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 drivers/gpu/drm/drm_panel.c | 6 ++++--<br>
&gt;=C2=A0 1 file changed, 4 insertions(+), 2 deletions(-)<br>
&gt; <br>
&gt; diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c=
<br>
&gt; index 11a0415bc61f59190ef5eb378d1583c493265e6a..5793011f4938a2d4fb9d84=
a700817bda317af305 100644<br>
&gt; --- a/drivers/gpu/drm/drm_panel.c<br>
&gt; +++ b/drivers/gpu/drm/drm_panel.c<br>
&gt; @@ -74,8 +74,10 @@ EXPORT_SYMBOL(drm_panel_init);<br>
&gt;=C2=A0 =C2=A0* drm_panel_add - add a panel to the global registry<br>
&gt;=C2=A0 =C2=A0* @panel: panel to add<br>
&gt;=C2=A0 =C2=A0*<br>
&gt; - * Add a panel to the global registry so that it can be looked up by =
display<br>
&gt; - * drivers.<br>
&gt; + * Add a panel to the global registry so that it can be looked<br>
&gt; + * up by display drivers. The panel to be added must have been<br>
&gt; + * allocated by devm_drm_panel_alloc(). Old-style allocation by<br>
&gt; + * kzalloc(), devm_kzalloc() and similar is deprecated.<br>
<br>
It&#39;s not that it&#39;s deprecated, it&#39;s that it&#39;s unsafe. Since=
 you already<br>
said that the allocation must be done through devm_drm_panel_alloc(),<br>
there&#39;s not much use to mention the old style stuff, I&#39;d just drop =
the<br>
last sentence.<br>
<br></blockquote><div><br></div><div>Alrighty.</div><div><br></div><div>Tha=
nks,</div><div>Anusha <br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">
Maxime<br>
</blockquote></div></div>

--000000000000bb0300063141c18b--

