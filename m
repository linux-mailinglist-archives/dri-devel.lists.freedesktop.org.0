Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC3CA71C81
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 17:57:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA83310E746;
	Wed, 26 Mar 2025 16:57:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="MyGKr7+y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4328810E746
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 16:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1743008265;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YSw6iWm3RNiws4CIIERbiN79fDw46bRwyJPDIMgSAUU=;
 b=MyGKr7+yWhq6yT/lPUOGKK6mWN63C1/7sBvZJlcqm2A8NPvx3EX8jR8M/SETn1ZmkaFtbv
 5CQTw+K3E7M3wTogiyqJMUeyu5vY75SSBL7UumAOdaZEW9lYvZGgnDA6toMmD+ZMULtdsi
 dRdXxfGxgVkofUvt/st/IirlidVGrfw=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-175-Vm7T6fD-OLeZi4Bk0SfQfA-1; Wed, 26 Mar 2025 12:57:43 -0400
X-MC-Unique: Vm7T6fD-OLeZi4Bk0SfQfA-1
X-Mimecast-MFC-AGG-ID: Vm7T6fD-OLeZi4Bk0SfQfA_1743008263
Received: by mail-yw1-f199.google.com with SMTP id
 00721157ae682-6f2a2ab50f6so893977b3.3
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 09:57:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743008263; x=1743613063;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YSw6iWm3RNiws4CIIERbiN79fDw46bRwyJPDIMgSAUU=;
 b=SW5AgNPgw59BCIM73fGAqXUrk/PcFOoPChmDMjBRlUkr+s7bp4YUZhfbm/dTjYlW0B
 7oANHMsDRXDaMb0r0Cxtv5fTZDrmWaFpL4vUQShyorVCDdUR6abclhkUkSgwJ2BsABk0
 1T1AHIWO4i5t3UDAzeFv/Bxs4JExq0VhCUYZ0efNFveyQOaBAYM+Ob9tC5UKvoBx/Ku3
 4gk8xh+230/tQpB6u6ZNljoze84BoLvpCrNcii0/3PVFePxVbgnLUa2zghs2dujEvsdb
 rnH4fkbMRs5PsLG1/aQb9QJdqXgZhkGsSoawA0HDgt/kfU66GouCwT1Virqs19FHNNcE
 dSOg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLkRj8ti1lLyiuFXzv4xCwlwkRGWF50dPSlAO28poZJDXARgaxpbscSMYf8Cv/XjCc5yzSiKbEclw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyhbCa0jcUED6q5Zcmpknuaxhll7tf10l4Oz3rYxkk/ZhA//apU
 s9djv7d3mPE/YM77K7LQQchnkEk3wwhfUtHgUnuknGGx1CK9s6acwkYsjI3gbKi3uRhYGkZq5sK
 P/xr0iOPHRpirsO/ZH2iTMDPE9HfJCElg9R7XGXclobKNtpuwmdtxc+QjvFzR9ymoj5Od2j8XiN
 BCqQXph9Ca1sKBoCFNTXIIi77R7gi5DrDcscROuoA0
X-Gm-Gg: ASbGncvtJmFXhNqq5ylXsBe90sUVZyFt0nNiQ4E1TQXlpdepYRFbpcZaTXt809M2I1Q
 yn93QYRnWQ2YvaekidD1vmLbi0X46gsXRULj15/RvqercTKwdnt9rQSsQxA5523LUz11z1+Y=
X-Received: by 2002:a05:690c:6304:b0:6f9:97f7:a5c4 with SMTP id
 00721157ae682-70225092a51mr2433337b3.29.1743008262615; 
 Wed, 26 Mar 2025 09:57:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFa+MyV/BVNyYV9ZrHzkEQDHI3PKB8D6I/hyN7i5XVt5YyDEYK3vWHHQS/kkOpIWTgEVqri/Su4NhA7rBiAjQU=
X-Received: by 2002:a05:690c:6304:b0:6f9:97f7:a5c4 with SMTP id
 00721157ae682-70225092a51mr2432877b3.29.1743008262199; Wed, 26 Mar 2025
 09:57:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250325-b4-panel-refcounting-v1-0-4e2bf5d19c5d@redhat.com>
 <20250325-b4-panel-refcounting-v1-1-4e2bf5d19c5d@redhat.com>
 <20250326102259.3bdbc22d@booty>
 <20250326-camouflaged-satisfied-quokka-8d5afc@houat>
In-Reply-To: <20250326-camouflaged-satisfied-quokka-8d5afc@houat>
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Wed, 26 Mar 2025 12:57:31 -0400
X-Gm-Features: AQ5f1Jr4dLslmanORv0OSWK3j1aYjX2MKpqHWXZHt1w4KI7LYtFWTyx31QgqT7M
Message-ID: <CAN9Xe3S-=YUWrvcxFTxOt_WMPDx7LManB-FYCvYPty5L5x9O6Q@mail.gmail.com>
Subject: Re: [PATCH 1/5] drm/panel: Add new helpers for refcounted panel
 allocatons
To: Maxime Ripard <mripard@kernel.org>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ONsbNGuHgM3pyuIDBYDhnAc-6emX0ku9Azwul3XCLrA_1743008263
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000004f380e063141bc8b"
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

--0000000000004f380e063141bc8b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 26, 2025 at 11:26=E2=80=AFAM Maxime Ripard <mripard@kernel.org>=
 wrote:

> On Wed, Mar 26, 2025 at 10:22:59AM +0100, Luca Ceresoli wrote:
> > Hello Anusha,
> >
> > On Tue, 25 Mar 2025 13:24:08 -0400
> > Anusha Srivatsa <asrivats@redhat.com> wrote:
> >
> > > Introduce reference counted allocations for panels to avoid
> > > use-after-free. The patch adds the macro devm_drm_bridge_alloc()
> > > to allocate a new refcounted panel. Followed the documentation for
> > > drmm_encoder_alloc() and devm_drm_dev_alloc and other similar
> > > implementations for this purpose.
> > >
> > > Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
> >
> > [...]
> >
> > > +void *__devm_drm_panel_alloc(struct device *dev, size_t size, size_t
> offset,
> > > +                        const struct drm_panel_funcs *funcs,
> > > +                        int connector_type);
> > > +
> > > +/**
> > > + * devm_drm_panel_alloc - Allocate and initialize an refcounted pane=
l
> >                                                      ^^
> > "a refcounted panel"
> >
> > > + * @dev: struct device of the panel device
> > > + * @type: the type of the struct which contains struct &drm_panel
> > > + * @member: the name of the &drm_panel within @type
> > > + * @funcs: callbacks for this panel
> > > + * @connector_type: connector type of the driver
> >
> > I'd say it's the connector type in the hardware, rather than of the
> > driver (the driver follows what is in the hardware. Maybe you can just
> > copy the description present in the drm_panel_init kdoc:
> >
> >  * @connector_type: the connector type (DRM_MODE_CONNECTOR_*)
> corresponding to
> >  *      the panel interface (must NOT be DRM_MODE_CONNECTOR_Unknown)
> >
> > Other than that it looks good!
>
> Heh, Unknown is fine, but you're right for the rest. I'd use the
> drm_panel_init doc for that field actually.
>
> Will make this change in the next iteration,
Thanks Luca and Maxime

Anusha

> Maxime
>

--0000000000004f380e063141bc8b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 26,=
 2025 at 11:26=E2=80=AFAM Maxime Ripard &lt;<a href=3D"mailto:mripard@kerne=
l.org">mripard@kernel.org</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">On Wed, Mar 26, 2025 at 10:22:59AM +0100, Luca Cer=
esoli wrote:<br>
&gt; Hello Anusha,<br>
&gt; <br>
&gt; On Tue, 25 Mar 2025 13:24:08 -0400<br>
&gt; Anusha Srivatsa &lt;<a href=3D"mailto:asrivats@redhat.com" target=3D"_=
blank">asrivats@redhat.com</a>&gt; wrote:<br>
&gt; <br>
&gt; &gt; Introduce reference counted allocations for panels to avoid<br>
&gt; &gt; use-after-free. The patch adds the macro devm_drm_bridge_alloc()<=
br>
&gt; &gt; to allocate a new refcounted panel. Followed the documentation fo=
r<br>
&gt; &gt; drmm_encoder_alloc() and devm_drm_dev_alloc and other similar<br>
&gt; &gt; implementations for this purpose.<br>
&gt; &gt; <br>
&gt; &gt; Signed-off-by: Anusha Srivatsa &lt;<a href=3D"mailto:asrivats@red=
hat.com" target=3D"_blank">asrivats@redhat.com</a>&gt;<br>
&gt; <br>
&gt; [...]<br>
&gt; <br>
&gt; &gt; +void *__devm_drm_panel_alloc(struct device *dev, size_t size, si=
ze_t offset,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 const struct drm_panel_funcs *funcs,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 int connector_type);<br>
&gt; &gt; +<br>
&gt; &gt; +/**<br>
&gt; &gt; + * devm_drm_panel_alloc - Allocate and initialize an refcounted =
panel<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^^<br>
&gt; &quot;a refcounted panel&quot;<br>
&gt; <br>
&gt; &gt; + * @dev: struct device of the panel device<br>
&gt; &gt; + * @type: the type of the struct which contains struct &amp;drm_=
panel<br>
&gt; &gt; + * @member: the name of the &amp;drm_panel within @type<br>
&gt; &gt; + * @funcs: callbacks for this panel<br>
&gt; &gt; + * @connector_type: connector type of the driver<br>
&gt; <br>
&gt; I&#39;d say it&#39;s the connector type in the hardware, rather than o=
f the<br>
&gt; driver (the driver follows what is in the hardware. Maybe you can just=
<br>
&gt; copy the description present in the drm_panel_init kdoc:<br>
&gt; <br>
&gt;=C2=A0 * @connector_type: the connector type (DRM_MODE_CONNECTOR_*) cor=
responding to<br>
&gt;=C2=A0 *=C2=A0 =C2=A0 =C2=A0 the panel interface (must NOT be DRM_MODE_=
CONNECTOR_Unknown)<br>
&gt; <br>
&gt; Other than that it looks good!<br>
<br>
Heh, Unknown is fine, but you&#39;re right for the rest. I&#39;d use the<br=
>
drm_panel_init doc for that field actually.<br>
<br></blockquote><div>Will make this change in the next iteration,</div><di=
v>Thanks Luca and Maxime</div><div><br></div><div>Anusha <br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">
Maxime<br>
</blockquote></div></div>

--0000000000004f380e063141bc8b--

