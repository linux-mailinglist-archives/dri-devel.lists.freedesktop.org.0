Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79879A5DF7F
	for <lists+dri-devel@lfdr.de>; Wed, 12 Mar 2025 15:54:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B27CF10E798;
	Wed, 12 Mar 2025 14:54:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="dCguoh11";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A06C10E798
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Mar 2025 14:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741791267;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/MootNe9HiMrbmLHCetJz32g+2hQTSNnrycMtXjfFck=;
 b=dCguoh113aXU4VHYP8JgINnmrbmgZtBac+SLU6Hr1sxM+OCvg5dbPutS6ip2B6m3zAsIUo
 XfWlep7xjUIbHhHzRHf5/lB7d56BPkYTrePPr9VQQr3CXAbzSGa3hqet7651wyrDmbEXmH
 upLZqAdsRQHeXoLE/k/9eCBTvAnJCas=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-218-X4N3xSWlM5i195V5_K6GEA-1; Wed, 12 Mar 2025 10:54:25 -0400
X-MC-Unique: X4N3xSWlM5i195V5_K6GEA-1
X-Mimecast-MFC-AGG-ID: X4N3xSWlM5i195V5_K6GEA_1741791263
Received: by mail-yw1-f200.google.com with SMTP id
 00721157ae682-6fec6c91630so62155197b3.2
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Mar 2025 07:54:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741791263; x=1742396063;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/MootNe9HiMrbmLHCetJz32g+2hQTSNnrycMtXjfFck=;
 b=UvuNo/oBOQGnmhh4Fm+TkTi2ZjQUuKGxcNH//6q3kWRHLVHOSHpYyQhZvW22ud3fzx
 PK+6joGAIgFdHlHgvlbIhdEfq/tuXelJEBmxo1zrFPF6ivIyI/O0aoYdWhEk8dDF5HvF
 0Yu2ryY5Rux9ATjaozGd+cJKrXdVh1yasfjvHN0RyhYOCGhDe9lE/eNJhTlwtXta4kUM
 DwIjCzDhRDZy/q6PfI1uS2doa588Tz89y8Dgd3H9XwXDJCsWBpXxFc4pjH3y+HWNrPMP
 GV/7JHOcb3kOvulPiQwm7urBAcZDv2owBp1K8VFjYIgpfg6za7gWP/b3jVnBvv+IpOmv
 41+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/ypNb3ecAd+RF6HPG7Dg2Iihlj/rC0honHOtJLXsaOxL++0RKwbZNGMsnkb/W5pIsIrIQ46CW8yA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz8tE+m+N+FmFXkhjShIEDLAB9xN61ZF193w6KckvTAaVS9OfpB
 O8SRZQJKdgzdUYIgrGImoZfMy1gZKt/NO4J0uTrbBAwLGR3ZJ4SFLzc5LbRRWDUlBqMnwZ3l/ra
 gfcgbWvkd3P0y+HTm8RenT4rFV31QnYGErUAN/XROgJ8F9HctGVC0TvbHae+Nb308DOyyV+P7OD
 E/ru/m0IMtWM9jAXYEDHt5oQp2DxTyQB+kijbIEduf
X-Gm-Gg: ASbGncvxOP0cCRWo/GIMzgPy3WZpavKL6p5GMTXrRP0j68TeGJstjO09N+uTMa4x8Pu
 zCxuAxkPmCkm6L/KtLB28et2jD6bpWygAxArcWk25Qq2kD5HqZQd47Q0C5FPov8Ajltm8W9E=
X-Received: by 2002:a05:690c:4c09:b0:6f9:4bb6:eb46 with SMTP id
 00721157ae682-6febf3dff5fmr322824777b3.31.1741791263404; 
 Wed, 12 Mar 2025 07:54:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHab0QOS22RFRiG/lN5Bp3kHsGmnhmErmB9NtCUqKXOW/HOwvqHp8AEXHyIMEYOT7+3dTNKm0knzf7Z56GyPZ8=
X-Received: by 2002:a05:690c:4c09:b0:6f9:4bb6:eb46 with SMTP id
 00721157ae682-6febf3dff5fmr322824137b3.31.1741791262726; Wed, 12 Mar 2025
 07:54:22 -0700 (PDT)
MIME-Version: 1.0
References: <20250310-mipi-synaptic-1-v2-1-20ee4397c670@redhat.com>
 <CAD=FV=WW1ak-_MEBVks==Yr1tUdfFZ3K16_gcdJQ9rwE4ZduNg@mail.gmail.com>
In-Reply-To: <CAD=FV=WW1ak-_MEBVks==Yr1tUdfFZ3K16_gcdJQ9rwE4ZduNg@mail.gmail.com>
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Wed, 12 Mar 2025 09:51:53 -0400
X-Gm-Features: AQ5f1JqIdq4zX9mDz3iOxxVycSu7Jzk9DWqITeOMPwCVMFCJx_ZaOIbTWIW50SQ
Message-ID: <CAN9Xe3RYgnELGymau=EoZQy54sM-WfnR-6dr-wmNaBr4ZLnROg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/panel/synaptics-r63353: Use _multi variants
To: Doug Anderson <dianders@chromium.org>
Cc: Michael Trimarchi <michael@amarulasolutions.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Tejas Vipin <tejasvipin76@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: kfIhvoZkb-pGwM7eDoCrYGEC-kucC1k1N9ZPIlgbsJM_1741791263
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000007cf67906302661ed"
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

--0000000000007cf67906302661ed
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 11, 2025 at 11:52=E2=80=AFAM Doug Anderson <dianders@chromium.o=
rg>
wrote:

> Hi,
>
> On Mon, Mar 10, 2025 at 1:58=E2=80=AFPM Anusha Srivatsa <asrivats@redhat.=
com>
> wrote:
> >
> > @@ -70,6 +70,7 @@ static int r63353_panel_power_on(struct r63353_panel
> *rpanel)
> >  {
> >         struct mipi_dsi_device *dsi =3D rpanel->dsi;
> >         struct device *dev =3D &dsi->dev;
> > +       struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D dsi };
> >         int ret;
> >
> >         ret =3D regulator_enable(rpanel->avdd);
> > @@ -78,7 +79,7 @@ static int r63353_panel_power_on(struct r63353_panel
> *rpanel)
> >                 return ret;
> >         }
> >
> > -       usleep_range(15000, 25000);
> > +       mipi_dsi_usleep_range(&dsi_ctx, 15000, 25000);
>
> No. None of the conversions in this function are correct.
> mipi_dsi_usleep_range() is only for use when you're in the middle of a
> bunch of other "multi" calls and want the sleep to be conditional upon
> there being no error. Here there is no chance of an error because no
> _multi() are used. Go back to the normal usleep_range().
>
>
OK. Then the approach to prefer mipi_dsi_usleep_range() over the previously
used usleep_range() everywhere is out the window. Sounds good. Is replacing
msleep() with mipi_dsi_msleep() preferable?

> @@ -106,53 +107,46 @@ static int r63353_panel_power_off(struct
> r63353_panel *rpanel)
> >  static int r63353_panel_activate(struct r63353_panel *rpanel)
> >  {
> >         struct mipi_dsi_device *dsi =3D rpanel->dsi;
> > -       struct device *dev =3D &dsi->dev;
> > -       int i, ret;
> > +       struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D dsi };
> > +       int i;
> >
> > -       ret =3D mipi_dsi_dcs_soft_reset(dsi);
> > -       if (ret < 0) {
> > -               dev_err(dev, "Failed to do Software Reset (%d)\n", ret)=
;
> > +       mipi_dsi_dcs_soft_reset_multi(&dsi_ctx);
> > +       if (dsi_ctx.accum_err)
> >                 goto fail;
> > -       }
>
> This isn't how the _multi() functions are intended to be used. The
> whole idea is _not_ to have scattered "if" statements everywhere and
> to just deal with errors at the appropriate places. You just trust
> that the _multi() functions are no-ops if an error is set and so it
> doesn't hurt to keep calling them. In this case you'd just have a pile
> of _multi() functions with no "if" checks and then at the very end of
> the function you check for the error. If the error is set then you set
> the reset GPIO and return the error.
>
>
Perfect. Thanks.

Anusha

> -Doug
>
>

--0000000000007cf67906302661ed
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 11,=
 2025 at 11:52=E2=80=AFAM Doug Anderson &lt;<a href=3D"mailto:dianders@chro=
mium.org">dianders@chromium.org</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">Hi,<br>
<br>
On Mon, Mar 10, 2025 at 1:58=E2=80=AFPM Anusha Srivatsa &lt;<a href=3D"mail=
to:asrivats@redhat.com" target=3D"_blank">asrivats@redhat.com</a>&gt; wrote=
:<br>
&gt;<br>
&gt; @@ -70,6 +70,7 @@ static int r63353_panel_power_on(struct r63353_panel=
 *rpanel)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct mipi_dsi_device *dsi =3D rpane=
l-&gt;dsi;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct device *dev =3D &amp;dsi-&gt;d=
ev;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct mipi_dsi_multi_context dsi_ctx =3D =
{ .dsi =3D dsi };<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D regulator_enable(rpanel-&gt;a=
vdd);<br>
&gt; @@ -78,7 +79,7 @@ static int r63353_panel_power_on(struct r63353_panel=
 *rpanel)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return re=
t;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0usleep_range(15000, 25000);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0mipi_dsi_usleep_range(&amp;dsi_ctx, 15000,=
 25000);<br>
<br>
No. None of the conversions in this function are correct.<br>
mipi_dsi_usleep_range() is only for use when you&#39;re in the middle of a<=
br>
bunch of other &quot;multi&quot; calls and want the sleep to be conditional=
 upon<br>
there being no error. Here there is no chance of an error because no<br>
_multi() are used. Go back to the normal usleep_range().<br>
<br></blockquote><div><br></div><div>OK. Then the approach to prefer mipi_d=
si_usleep_range() over the previously used usleep_range() everywhere is out=
 the window. Sounds good. Is replacing msleep() with mipi_dsi_msleep() pref=
erable?=C2=A0</div><div><br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
&gt; @@ -106,53 +107,46 @@ static int r63353_panel_power_off(struct r63353_=
panel *rpanel)<br>
&gt;=C2=A0 static int r63353_panel_activate(struct r63353_panel *rpanel)<br=
>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct mipi_dsi_device *dsi =3D rpane=
l-&gt;dsi;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0struct device *dev =3D &amp;dsi-&gt;dev;<b=
r>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0int i, ret;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct mipi_dsi_multi_context dsi_ctx =3D =
{ .dsi =3D dsi };<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int i;<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D mipi_dsi_dcs_soft_reset(dsi);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(dev, &=
quot;Failed to do Software Reset (%d)\n&quot;, ret);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0mipi_dsi_dcs_soft_reset_multi(&amp;dsi_ctx=
);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (dsi_ctx.accum_err)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto fail=
;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
This isn&#39;t how the _multi() functions are intended to be used. The<br>
whole idea is _not_ to have scattered &quot;if&quot; statements everywhere =
and<br>
to just deal with errors at the appropriate places. You just trust<br>
that the _multi() functions are no-ops if an error is set and so it<br>
doesn&#39;t hurt to keep calling them. In this case you&#39;d just have a p=
ile<br>
of _multi() functions with no &quot;if&quot; checks and then at the very en=
d of<br>
the function you check for the error. If the error is set then you set<br>
the reset GPIO and return the error.<br>
<br></blockquote><div><br></div><div>Perfect. Thanks.</div><div><br></div><=
div>Anusha</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
-Doug<br>
<br>
</blockquote></div></div>

--0000000000007cf67906302661ed--

