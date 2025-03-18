Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE397A67534
	for <lists+dri-devel@lfdr.de>; Tue, 18 Mar 2025 14:35:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45EFD10E215;
	Tue, 18 Mar 2025 13:35:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="NyIjFolp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4421310E132
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Mar 2025 13:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742304897;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=euEKv/eou5pmCU0gKOPYIbZaTjZh6SN4/dLSobF/On8=;
 b=NyIjFolpYRMw/U7jlMn2Q8Q3XBha6aF2le++fABYLy0TELOT3rD9B0mww5ngXi9lgwFjOp
 nLa0dHaOY8ncMx9KWWIbyiZDIU8VeSuiWhqMnGCKPstiOzeaYeqafSNrzdldgzSZSYPDst
 FIrd3Ip7+6l5H0VRoLHVF/xOvwKbYT8=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-668-ICusXayJNJu4nY2TeDysfA-1; Tue, 18 Mar 2025 09:34:53 -0400
X-MC-Unique: ICusXayJNJu4nY2TeDysfA-1
X-Mimecast-MFC-AGG-ID: ICusXayJNJu4nY2TeDysfA_1742304893
Received: by mail-yw1-f197.google.com with SMTP id
 00721157ae682-6f27dd44f86so76378837b3.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Mar 2025 06:34:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742304893; x=1742909693;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=euEKv/eou5pmCU0gKOPYIbZaTjZh6SN4/dLSobF/On8=;
 b=dznxuvKihvg9iagbfAd6EtQ7rqto4HmRkcyaPG752wmRQfXsEX7yTX8xryiuxSKvw1
 G+n7F+LWqGgSU4LRNGTAqqN4Gv+SSk9PV78SQ+00emFS1iN3rld+CPdC00GM8q2mxt8y
 2rVm4n/B3Twq8tZbVj8x3hKGL3sw85uLWEro/sdukFzZDNE96uvWLd3/HnNZByhIqNWn
 rAXCYdxCN7Fp2a2q2Nncye2euheNNbY2QzOM0dOPayJx2JBD2eNs9J6BYF3wOY7p5CEc
 Yfk/XdnuB8BP+0sq9xyxkyaU7YfIUBAINwBSf91gRtJ5bmtikIVYCHc5NaQ3mRDTKzTQ
 0g0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrXdB/XsaLbnwEDwC5Ca6QZD7PV5IVWCHbNkctVKUmKxXdlUiCXwlcxdp6GZYgjKhJocsm1u+LBXw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yybz0wikiWZFmNg9aYx4iwzl1Am33uHWN6TowXzgKZnamNjjAT+
 kTqMpQ8zxO+NrhkiMOrqm+JdCObVxGUuI3WTHJZPGOh7CT3H/r4JalyitVhgyWGWaAHyzgdcMsD
 q+ezYpyZoTMZc15KAD2TSKQ8qkUAX+6E5cuiKhv8P/h1AT4BeLk0qFwJSVxI5xSj9XiVjSGRzyh
 Xt/6GLbmPKKwAJMhPYFE80XK58Yr89li7I4b+Q7QMR
X-Gm-Gg: ASbGncvmLY5TayrlijxFiOMnBRrSBwjF9VDOWjMdOqAwruG9nLoT9q3xnKFqDZ7vujT
 lxCnBysHCJqbS72ZVlov7paTuKdL0C+1xJj8/sAAsIDB2DvO0iGoeerBSP773BX3COBeLtUA=
X-Received: by 2002:a05:690c:6386:b0:6f9:aeee:8f1b with SMTP id
 00721157ae682-6ff460d5940mr210101817b3.31.1742304893228; 
 Tue, 18 Mar 2025 06:34:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEyNzoX2y+qYafiowDZNPnNQF0aHwo1JK1aVTw4HFKRKOnT0VIz6WX5bVzXhQ75Jgg9xDfNa0lx/xB9+DvW++c=
X-Received: by 2002:a05:690c:6386:b0:6f9:aeee:8f1b with SMTP id
 00721157ae682-6ff460d5940mr210101607b3.31.1742304892997; Tue, 18 Mar 2025
 06:34:52 -0700 (PDT)
MIME-Version: 1.0
References: <20250314-b4-mipi-synaptic-v1-1-a64ccb5e5c66@redhat.com>
 <CAD=FV=XUN7CcnjURs6xfVAFqvZ1WR86y8nQm=OMcrV_hYjq5RQ@mail.gmail.com>
 <CAN9Xe3TpwwBtfXD7oii3VR8-ijDN_WQe9JUTC5bE_7vFQVRN3w@mail.gmail.com>
 <78758343-b9f9-4920-977c-cab4b5f84679@linaro.org>
In-Reply-To: <78758343-b9f9-4920-977c-cab4b5f84679@linaro.org>
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Tue, 18 Mar 2025 09:34:42 -0400
X-Gm-Features: AQ5f1Jp4lIGQ_yJdEv0s_wYUmRgeH9Gs-hukaC0ai4PfwS0SlxlwvAXuZB6hHwI
Message-ID: <CAN9Xe3RwwCMykLV4JgX0-19jZREgsAjm9_xEc=a_M+Pi+CPSuA@mail.gmail.com>
Subject: Re: [PATCH] drm/panel/synaptics-r63353: Use _multi variants
To: neil.armstrong@linaro.org
Cc: Doug Anderson <dianders@chromium.org>,
 Michael Trimarchi <michael@amarulasolutions.com>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Tejas Vipin <tejasvipin76@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: otZ5hUZ7jAMWoinhrYLjzAbRub3ek8XBge9ndXGpVY8_1742304893
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000003ce91606309df855"
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

--0000000000003ce91606309df855
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 17, 2025 at 6:14=E2=80=AFAM Neil Armstrong <neil.armstrong@lina=
ro.org>
wrote:

> On 16/03/2025 18:40, Anusha Srivatsa wrote:
> >
> >
> > On Fri, Mar 14, 2025 at 10:20=E2=80=AFAM Doug Anderson <dianders@chromi=
um.org
> <mailto:dianders@chromium.org>> wrote:
> >
> >     Hi,
> >
> >     On Thu, Mar 13, 2025 at 9:47=E2=80=AFPM Anusha Srivatsa <asrivats@r=
edhat.com
> <mailto:asrivats@redhat.com>> wrote:
> >      >
> >      > @@ -181,24 +162,15 @@ static int r63353_panel_prepare(struct
> drm_panel *panel)
> >      >  static int r63353_panel_deactivate(struct r63353_panel *rpanel)
> >      >  {
> >      >         struct mipi_dsi_device *dsi =3D rpanel->dsi;
> >      > -       struct device *dev =3D &dsi->dev;
> >      > -       int ret;
> >      > +       struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D dsi=
 };
> >      >
> >      > -       ret =3D mipi_dsi_dcs_set_display_off(dsi);
> >      > -       if (ret < 0) {
> >      > -               dev_err(dev, "Failed to set display OFF (%d)\n",
> ret);
> >      > -               return ret;
> >      > -       }
> >      > +       mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
> >      >
> >      > -       usleep_range(5000, 10000);
> >      > +       mipi_dsi_usleep_range(&dsi_ctx, 5000, 10000);
> >      >
> >      > -       ret =3D mipi_dsi_dcs_enter_sleep_mode(dsi);
> >      > -       if (ret < 0) {
> >      > -               dev_err(dev, "Failed to enter sleep mode (%d)\n"=
,
> ret);
> >      > -               return ret;
> >      > -       }
> >      > +       mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
> >      >
> >      > -       return 0;
> >      > +       return dsi_ctx.accum_err;
> >
> >     nit: the one caller of r63353_panel_deactivate() doesn't actually
> look
> >     at the error code, so this could be a function that returns "void".
> >     That was true even before your patch, though. I wouldn't mind a
> >     followup patch that fixed this. ;-)
> >
> >
> > This is anyway not merged, Maybe better to fix right now instead of a
> follow up patch?
>
> If you can, yeah fix it now !
>
On it.

Anusha

> >
> >     In any case, the patch looks reasonable to me now.
> >
> >     Reviewed-by: Douglas Anderson <dianders@chromium.org <mailto:
> dianders@chromium.org>>
> >
> >
> > Thanks :)
> >
> > Anusha
>
>
> Thanks,
> Neil
> >
> >
> >     Happy for someone else to apply it if they want. If not, I'll snooz=
e
> >     this for ~a week to give others a chance to comment and then plan t=
o
> >     push to drm-misc-next.
> >
> >
> >
> >     -Doug
> >
>
>

--0000000000003ce91606309df855
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 17,=
 2025 at 6:14=E2=80=AFAM Neil Armstrong &lt;<a href=3D"mailto:neil.armstron=
g@linaro.org">neil.armstrong@linaro.org</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">On 16/03/2025 18:40, Anusha Srivatsa=
 wrote:<br>
&gt; <br>
&gt; <br>
&gt; On Fri, Mar 14, 2025 at 10:20=E2=80=AFAM Doug Anderson &lt;<a href=3D"=
mailto:dianders@chromium.org" target=3D"_blank">dianders@chromium.org</a> &=
lt;mailto:<a href=3D"mailto:dianders@chromium.org" target=3D"_blank">diande=
rs@chromium.org</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Hi,<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On Thu, Mar 13, 2025 at 9:47=E2=80=AFPM Anusha Sriv=
atsa &lt;<a href=3D"mailto:asrivats@redhat.com" target=3D"_blank">asrivats@=
redhat.com</a> &lt;mailto:<a href=3D"mailto:asrivats@redhat.com" target=3D"=
_blank">asrivats@redhat.com</a>&gt;&gt; wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; @@ -181,24 +162,15 @@ static int r63353_panel=
_prepare(struct drm_panel *panel)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 static int r63353_panel_deactivate(stru=
ct r63353_panel *rpanel)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct mipi_=
dsi_device *dsi =3D rpanel-&gt;dsi;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0struct device *de=
v =3D &amp;dsi-&gt;dev;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct mipi_dsi_m=
ulti_context dsi_ctx =3D { .dsi =3D dsi };<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D mipi_dsi_=
dcs_set_display_off(dsi);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0) {=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0dev_err(dev, &quot;Failed to set display OFF (%d)\n&quot;, ret=
);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0return ret;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0mipi_dsi_dcs_set_=
display_off_multi(&amp;dsi_ctx);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0usleep_range(5000=
, 10000);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0mipi_dsi_usleep_r=
ange(&amp;dsi_ctx, 5000, 10000);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D mipi_dsi_=
dcs_enter_sleep_mode(dsi);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0) {=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0dev_err(dev, &quot;Failed to enter sleep mode (%d)\n&quot;, re=
t);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0return ret;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0mipi_dsi_dcs_ente=
r_sleep_mode_multi(&amp;dsi_ctx);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return dsi_ctx.ac=
cum_err;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0nit: the one caller of r63353_panel_deactivate() do=
esn&#39;t actually look<br>
&gt;=C2=A0 =C2=A0 =C2=A0at the error code, so this could be a function that=
 returns &quot;void&quot;.<br>
&gt;=C2=A0 =C2=A0 =C2=A0That was true even before your patch, though. I wou=
ldn&#39;t mind a<br>
&gt;=C2=A0 =C2=A0 =C2=A0followup patch that fixed this. ;-)<br>
&gt; <br>
&gt; <br>
&gt; This is anyway not merged, Maybe better to fix right now instead of a =
follow up patch?<br>
<br>
If you can, yeah fix it now !<br></blockquote><div>On it.</div><div><br></d=
iv><div>Anusha <br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0In any case, the patch looks reasonable to me now.<=
br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Reviewed-by: Douglas Anderson &lt;<a href=3D"mailto=
:dianders@chromium.org" target=3D"_blank">dianders@chromium.org</a> &lt;mai=
lto:<a href=3D"mailto:dianders@chromium.org" target=3D"_blank">dianders@chr=
omium.org</a>&gt;&gt;<br>
&gt; <br>
&gt; <br>
&gt; Thanks :)<br>
&gt; <br>
&gt; Anusha<br>
<br>
<br>
Thanks,<br>
Neil<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Happy for someone else to apply it if they want. If=
 not, I&#39;ll snooze<br>
&gt;=C2=A0 =C2=A0 =C2=A0this for ~a week to give others a chance to comment=
 and then plan to<br>
&gt;=C2=A0 =C2=A0 =C2=A0push to drm-misc-next. <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0-Doug<br>
&gt; <br>
<br>
</blockquote></div></div>

--0000000000003ce91606309df855--

