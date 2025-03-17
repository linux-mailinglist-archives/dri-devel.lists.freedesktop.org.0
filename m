Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77048A6542F
	for <lists+dri-devel@lfdr.de>; Mon, 17 Mar 2025 15:48:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6E8C10E418;
	Mon, 17 Mar 2025 14:48:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="LO16u6KS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0804810E418
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 14:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742222881;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=y0Qj2pXtx1q7xCGEgrpWRUcRiyEi4izSbh9zLUQ2ntQ=;
 b=LO16u6KSlcyBsEaaiVoqCPXCyn1wDZgAkN+OW1iRDmDhRI2JNFDi0vFOGpR+malbVBvRJK
 kXKug3PyBjtzZTf2yDO6j7QvuRRIMWBeWkLVMEhqnJOTKDAZPOUCbqHlxOnqQu5qnajsh/
 b2V572hSUGMSL3zDqX8xHdOmCFUHFA8=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-218-HNasPmvBMtO-9l4FSAHASw-1; Mon, 17 Mar 2025 10:47:59 -0400
X-MC-Unique: HNasPmvBMtO-9l4FSAHASw-1
X-Mimecast-MFC-AGG-ID: HNasPmvBMtO-9l4FSAHASw_1742222879
Received: by mail-yw1-f198.google.com with SMTP id
 00721157ae682-6f2c7008c05so64939947b3.0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 07:47:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742222878; x=1742827678;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=y0Qj2pXtx1q7xCGEgrpWRUcRiyEi4izSbh9zLUQ2ntQ=;
 b=bEFGAdkaTlqy/DDAzJN7IoMR5HqNVcTKb30FbEwWvj7OATxqSt7IpXStzakHvfC5yy
 yFlvuh8e3L/scqOiItZW13SdcC233sFR+Y2lXTYefFGx4yKa2jR6BZZzydTFRqntfFdF
 ta36onVWUSH3t0CBL1PGBENXVHwSA/IwtzR7Yu+fadZEdHZ4RBuMatq1paqqPxsW1xAt
 G1ABYD0h7VWf/Z2cPI0StChEU3RoGtuQhz1hF9wH9o5hRCY7OLv1KV8coQjJWYPKK3j4
 91RRIcfWmYEb19nksNYtvSm35VEkOvAdOBOVrx9dXBh/fzHzqze+3PKN8FsXBv3Le+IN
 fJiA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVtBuVkXTrbF4fQzGWokqDSGXDZjNwtU0RpCdSElgFNM1Li04JyrzwVMKSQcya94C8AavfNj/gdCYw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzrKcuWUeIYSHpZWGiOTGNHBJv8LjiPwoK+IO82GHb98F1kM5/+
 75f10MCWBRvc5ntH7hSrgqiaG+AbqwLiJGOaR0VBzWG0QOYFPBPfggunYWGIYa5nh4n3lu5k5YF
 nSvpTz/KTcq6PCDG3jLBduRB99PsVjYcHVrzESreshx35D8A+5mPgG2wkd+JtYltmqOR51ruXXA
 Hx4Zh1ci4R/t3Fye/Hw/bf2E+E27gSVOjYkQPYcbc9
X-Gm-Gg: ASbGncuas+6ujPuvbeyPhe1z8exA9pnmdGSUBlXK2sbMd6mkbbbruFVbtT/OAlGBdgz
 zGE6QkA52XlfJeGJ9NeJQoW0eOfK7Nsnj1z/2kDoiIHGjGU7RZi0PIQDvut/j2hw4fQT535k=
X-Received: by 2002:a05:690c:6103:b0:6f9:7a3c:1fe with SMTP id
 00721157ae682-6ff460121b8mr157590197b3.23.1742222878784; 
 Mon, 17 Mar 2025 07:47:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGq2X2y/b4+ZOgxyRdU/JMWSL6Q7+e3Ud1ry0kzwHchfs7Imw0cmm4/xSFj3GZbF/PE1swSdq2hlI53BIit7Jo=
X-Received: by 2002:a05:690c:6103:b0:6f9:7a3c:1fe with SMTP id
 00721157ae682-6ff460121b8mr157590007b3.23.1742222878534; Mon, 17 Mar 2025
 07:47:58 -0700 (PDT)
MIME-Version: 1.0
References: <20250312-drm-panel-v1-0-e99cd69f6136@redhat.com>
 <20250312-drm-panel-v1-2-e99cd69f6136@redhat.com>
 <3c688493-02db-461d-b07c-34f2f4477f01@linaro.org>
In-Reply-To: <3c688493-02db-461d-b07c-34f2f4477f01@linaro.org>
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Mon, 17 Mar 2025 09:45:23 -0400
X-Gm-Features: AQ5f1Jr3lLU6gDKM8nisvnyaUI0DTyRFxgOL-GPJy7MdYQ3UZAa5tB4B7xpcVdU
Message-ID: <CAN9Xe3RzbPW5h0jHKCGW61-gmwr6PLq-ddfTUQDv4k-2Oc4A2g@mail.gmail.com>
Subject: Re: [PATCH RFC 2/2] drm/panel/panel-simple: Use the new allocation in
 place of devm_kzalloc()
To: neil.armstrong@linaro.org
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 8Z4xenbBAIbqWMVR_1LpuwN5eeMtCPHLKViWI1fojIs_1742222879
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000cb816706308adf5b"
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

--000000000000cb816706308adf5b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 17, 2025 at 6:12=E2=80=AFAM Neil Armstrong <neil.armstrong@lina=
ro.org>
wrote:

> On 13/03/2025 01:54, Anusha Srivatsa wrote:
> > Start using the new helper that does the refcounted
> > allocations.
> >
> > Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
> > ---
> >   drivers/gpu/drm/panel/panel-simple.c | 4 +---
> >   1 file changed, 1 insertion(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/panel/panel-simple.c
> b/drivers/gpu/drm/panel/panel-simple.c
> > index
> 232b03c1a259eb15e423b9d452d28e2ff95c70f8..d7530c3533af34f83ce8c6d6067e7f2=
93f2d4bf1
> 100644
> > --- a/drivers/gpu/drm/panel/panel-simple.c
> > +++ b/drivers/gpu/drm/panel/panel-simple.c
> > @@ -579,7 +579,7 @@ static int panel_simple_probe(struct device *dev,
> const struct panel_desc *desc)
> >       u32 bus_flags;
> >       int err;
> >
> > -     panel =3D devm_kzalloc(dev, sizeof(*panel), GFP_KERNEL);
> > +     panel =3D devm_drm_panel_alloc(dev, struct panel_simple, base,
> &panel_simple_funcs);
> >       if (!panel)
> >               return -ENOMEM;
> >
> > @@ -694,8 +694,6 @@ static int panel_simple_probe(struct device *dev,
> const struct panel_desc *desc)
> >       pm_runtime_set_autosuspend_delay(dev, 1000);
> >       pm_runtime_use_autosuspend(dev);
> >
> > -     drm_panel_init(&panel->base, dev, &panel_simple_funcs,
> connector_type);
>
> As pointed by the helpers review, you're loosing the connector_type info
> here.
>
> Yes Niels, Looking into this. The conector type has to be passed from her=
e
to the API...

Anusha

> > -
> >       err =3D drm_panel_of_backlight(&panel->base);
> >       if (err) {
> >               dev_err_probe(dev, err, "Could not find backlight\n");
> >
>
> Thanks !
> Neil
>
>

--000000000000cb816706308adf5b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 17,=
 2025 at 6:12=E2=80=AFAM Neil Armstrong &lt;<a href=3D"mailto:neil.armstron=
g@linaro.org">neil.armstrong@linaro.org</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">On 13/03/2025 01:54, Anusha Srivatsa=
 wrote:<br>
&gt; Start using the new helper that does the refcounted<br>
&gt; allocations.<br>
&gt; <br>
&gt; Signed-off-by: Anusha Srivatsa &lt;<a href=3D"mailto:asrivats@redhat.c=
om" target=3D"_blank">asrivats@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/panel/panel-simple.c | 4 +---<br>
&gt;=C2=A0 =C2=A01 file changed, 1 insertion(+), 3 deletions(-)<br>
&gt; <br>
&gt; diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/pa=
nel/panel-simple.c<br>
&gt; index 232b03c1a259eb15e423b9d452d28e2ff95c70f8..d7530c3533af34f83ce8c6=
d6067e7f293f2d4bf1 100644<br>
&gt; --- a/drivers/gpu/drm/panel/panel-simple.c<br>
&gt; +++ b/drivers/gpu/drm/panel/panel-simple.c<br>
&gt; @@ -579,7 +579,7 @@ static int panel_simple_probe(struct device *dev, =
const struct panel_desc *desc)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 bus_flags;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int err;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 =C2=A0panel =3D devm_kzalloc(dev, sizeof(*panel), GFP_K=
ERNEL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0panel =3D devm_drm_panel_alloc(dev, struct panel_=
simple, base, &amp;panel_simple_funcs);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!panel)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<=
br>
&gt;=C2=A0 =C2=A0<br>
&gt; @@ -694,8 +694,6 @@ static int panel_simple_probe(struct device *dev, =
const struct panel_desc *desc)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0pm_runtime_set_autosuspend_delay(dev, 1000);=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0pm_runtime_use_autosuspend(dev);<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 =C2=A0drm_panel_init(&amp;panel-&gt;base, dev, &amp;pan=
el_simple_funcs, connector_type);<br>
<br>
As pointed by the helpers review, you&#39;re loosing the connector_type inf=
o here.<br>
<br></blockquote><div>Yes Niels, Looking into this. The conector type has t=
o be passed from here to the API...=C2=A0</div><div><br></div><div>Anusha=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; -<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D drm_panel_of_backlight(&amp;panel-&g=
t;base);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (err) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err_probe(de=
v, err, &quot;Could not find backlight\n&quot;);<br>
&gt; <br>
<br>
Thanks !<br>
Neil<br>
<br>
</blockquote></div></div>

--000000000000cb816706308adf5b--

