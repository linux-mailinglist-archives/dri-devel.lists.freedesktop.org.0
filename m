Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD014846B2
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jan 2022 18:09:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A40F10E209;
	Tue,  4 Jan 2022 17:09:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAF3610E209
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jan 2022 17:09:44 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id l16so15433679plg.10
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jan 2022 09:09:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=v+sdvu70C0xmlTgzjTDbY24EG0MXij5hjChqtwUwrTE=;
 b=D0ZRrzUwVLXrsRFqggla5SDwyIEXmpdKZMKeKZE0lFDV46OBeyw4nivbVEXPyR7Aqk
 xzZXhPwuA0sgvakMC93oo1lNepQ1jFM5Qa+mdlEvvclkuFhZz7vlWepY87AIwRLRmC1+
 N4Oy3b5RRNdJ3k4c+VCTt6muEjIwyfe2mYXCvHLbDgBzvON68btwaKTJyjXF40CbP9No
 Z3MmDM8klu6u9rqvrtk/b7Z/QKXaMR9vbdTsCuhNYBLtgiMLWntatpxjGEQgGQ//Rsq6
 vji59h4nU+EtbcJCDSluVcSp6PCV5cxQtjgIP0U7S0iILWvbwcsl075w6j/SDFJ1cMXB
 Cwhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=v+sdvu70C0xmlTgzjTDbY24EG0MXij5hjChqtwUwrTE=;
 b=zpOuAz8PHVhZZpSbZN4Noi717iwE/V1tytSYTTWc9X4dRpKvY7bDvDissTAcJ00HXi
 QUohhot1y3n4x/jy9hkeeJs+py1OINpM7d4w3E8dPcM9wxfO9rjiaqqihanJFBIA4MIA
 qet0QrBoSBXYr0THInjojSeIRcWE+HaJHM4S2Qq42qdHNiwGxUy4p+dGPxoVmZVtUy9D
 XfCXVlfJvkRhT/GEWvI8zLf0LzfkMmg+icvKHxUxVSHAE3x7jJOLZvpToN75oPFu+1J3
 MomFF+xAgY8qcJqxUjZNqWtRNt70zVP82Rhny6ZUWcFICFcDsuraICELJw628bIvti1L
 zjEg==
X-Gm-Message-State: AOAM530W1KJxDcStLzZe/SSu50gbqp9EPc1k7nMJnpzTRpPggK0Qqw2j
 smTXDg/8kj5MxWsYCQcOoUVvKL8foY/cek5RQ8zGLA==
X-Google-Smtp-Source: ABdhPJzCnlENHJ5TZQp74nev5/hU1MtDxyd/KsXaOuRaJ3IXJz6/1SYEKOPP5gwrWa2feM4DJ47kJdIXaEfFub8557E=
X-Received: by 2002:a17:90b:4b0f:: with SMTP id
 lx15mr62251454pjb.232.1641316184113; 
 Tue, 04 Jan 2022 09:09:44 -0800 (PST)
MIME-Version: 1.0
References: <20211110220050.2854-1-jirivanek1@gmail.com>
 <CAG3jFyvB-Dzd9YDJ7FrAC5avobL7Wfk-91E-DVeYWwfNcQLiLg@mail.gmail.com>
 <CAGWqDJ5ZKJ0skLnhfhC0cbzNnSo7HLY7Cqr2ZhOcb_YiHNsA1A@mail.gmail.com>
 <CAG3jFyt1nvtkDC2r3wc+3ky_VxtZ7s4Rto_+kMg6J_x1=QpO-Q@mail.gmail.com>
 <CAGWqDJ6eUqm+NiA5dAR_GNGtjjBiYQom3gyGn49i1PhwxfVGvg@mail.gmail.com>
In-Reply-To: <CAGWqDJ6eUqm+NiA5dAR_GNGtjjBiYQom3gyGn49i1PhwxfVGvg@mail.gmail.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Tue, 4 Jan 2022 18:09:32 +0100
Message-ID: <CAG3jFysoGe1QrHMuKrnK769sSd9qSWTSPWHbrBfJp4Hzngw5VA@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge/tc358775: Fix for dual-link LVDS
To: Vinay Simha B N <simhavcs@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000001e6ac305d4c4b48e"
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
Cc: Jiri Vanek <jirivanek1@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 open list <linux-kernel@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Zheng Bin <zhengbin13@huawei.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--0000000000001e6ac305d4c4b48e
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 4, 2022, 17:56 Vinay Simha B N <simhavcs@gmail.com> wrote:

> Robert,
> What is R-b tag?
>

It looks like this Reviewed-by: Name Lastname <email address>

Maybe have a quick look at this document.

https://www.kernel.org/doc/html/v4.17/process/submitting-patches.html


>
> On Tue, Jan 4, 2022 at 7:21 PM Robert Foss <robert.foss@linaro.org> wrote:
> >
> > Jiri: Are you able to test this patch?
> >
> > Vinay: Could you supply a R-b tag, if you feel that it is warranted?
> >
> > On Tue, 14 Dec 2021 at 09:13, Vinay Simha B N <simhavcs@gmail.com>
> wrote:
> > >
> > > Robert,
> > > I do not have the hardware to test this feature. Sorry for the late
> response.
> > >
> > > On Thu, Nov 18, 2021 at 8:20 PM Robert Foss <robert.foss@linaro.org>
> wrote:
> > >>
> > >> + Zhen & Vinay
> > >>
> > >> This patch looks good in itself, but I would like to see a tested by
> > >> tag. At the very least testing for regression in single-link LVDS but
> > >> ideally some third party verification of this patch.
> > >>
> > >> On Wed, 10 Nov 2021 at 23:01, Jiri Vanek <jirivanek1@gmail.com>
> wrote:
> > >> >
> > >> > Fixed wrong register shift for single/dual link LVDS output.
> > >> >
> > >> > Signed-off-by: Jiri Vanek <jirivanek1@gmail.com>
> > >> > ---
> > >> >  drivers/gpu/drm/bridge/tc358775.c | 2 +-
> > >> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >> >
> > >> > diff --git a/drivers/gpu/drm/bridge/tc358775.c
> b/drivers/gpu/drm/bridge/tc358775.c
> > >> > index 2272adcc5b4a..1d6ec1baeff2 100644
> > >> > --- a/drivers/gpu/drm/bridge/tc358775.c
> > >> > +++ b/drivers/gpu/drm/bridge/tc358775.c
> > >> > @@ -241,7 +241,7 @@ static inline u32
> TC358775_LVCFG_PCLKDIV(uint32_t val)
> > >> >  }
> > >> >
> > >> >  #define TC358775_LVCFG_LVDLINK__MASK
>  0x00000002
> > >> > -#define TC358775_LVCFG_LVDLINK__SHIFT                        0
> > >> > +#define TC358775_LVCFG_LVDLINK__SHIFT                        1
> > >> >  static inline u32 TC358775_LVCFG_LVDLINK(uint32_t val)
> > >> >  {
> > >> >         return ((val) << TC358775_LVCFG_LVDLINK__SHIFT) &
> > >> > --
> > >> > 2.30.2
> > >> >
> > >
> > >
> > >
> > > --
> > > regards,
> > > vinaysimha
>
>
>
> --
> regards,
> vinaysimha
>

--0000000000001e6ac305d4c4b48e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Tue, Jan 4, 2022, 17:56 Vinay Simha B N &lt;<a href=
=3D"mailto:simhavcs@gmail.com">simhavcs@gmail.com</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex">Robert,<br>
What is R-b tag?<br></blockquote></div></div><div dir=3D"auto"><br></div><d=
iv dir=3D"auto">It looks like this Reviewed-by: Name Lastname &lt;email add=
ress&gt;</div><div dir=3D"auto"><br></div><div dir=3D"auto">Maybe have a qu=
ick look at this document.</div><div dir=3D"auto"><br></div><div dir=3D"aut=
o"><a href=3D"https://www.kernel.org/doc/html/v4.17/process/submitting-patc=
hes.html">https://www.kernel.org/doc/html/v4.17/process/submitting-patches.=
html</a><br></div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=
=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
<br>
On Tue, Jan 4, 2022 at 7:21 PM Robert Foss &lt;<a href=3D"mailto:robert.fos=
s@linaro.org" target=3D"_blank" rel=3D"noreferrer">robert.foss@linaro.org</=
a>&gt; wrote:<br>
&gt;<br>
&gt; Jiri: Are you able to test this patch?<br>
&gt;<br>
&gt; Vinay: Could you supply a R-b tag, if you feel that it is warranted?<b=
r>
&gt;<br>
&gt; On Tue, 14 Dec 2021 at 09:13, Vinay Simha B N &lt;<a href=3D"mailto:si=
mhavcs@gmail.com" target=3D"_blank" rel=3D"noreferrer">simhavcs@gmail.com</=
a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; Robert,<br>
&gt; &gt; I do not have the hardware to test this feature. Sorry for the la=
te response.<br>
&gt; &gt;<br>
&gt; &gt; On Thu, Nov 18, 2021 at 8:20 PM Robert Foss &lt;<a href=3D"mailto=
:robert.foss@linaro.org" target=3D"_blank" rel=3D"noreferrer">robert.foss@l=
inaro.org</a>&gt; wrote:<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; + Zhen &amp; Vinay<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; This patch looks good in itself, but I would like to see a te=
sted by<br>
&gt; &gt;&gt; tag. At the very least testing for regression in single-link =
LVDS but<br>
&gt; &gt;&gt; ideally some third party verification of this patch.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; On Wed, 10 Nov 2021 at 23:01, Jiri Vanek &lt;<a href=3D"mailt=
o:jirivanek1@gmail.com" target=3D"_blank" rel=3D"noreferrer">jirivanek1@gma=
il.com</a>&gt; wrote:<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; Fixed wrong register shift for single/dual link LVDS out=
put.<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; Signed-off-by: Jiri Vanek &lt;<a href=3D"mailto:jirivane=
k1@gmail.com" target=3D"_blank" rel=3D"noreferrer">jirivanek1@gmail.com</a>=
&gt;<br>
&gt; &gt;&gt; &gt; ---<br>
&gt; &gt;&gt; &gt;=C2=A0 drivers/gpu/drm/bridge/tc358775.c | 2 +-<br>
&gt; &gt;&gt; &gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; diff --git a/drivers/gpu/drm/bridge/tc358775.c b/drivers=
/gpu/drm/bridge/tc358775.c<br>
&gt; &gt;&gt; &gt; index 2272adcc5b4a..1d6ec1baeff2 100644<br>
&gt; &gt;&gt; &gt; --- a/drivers/gpu/drm/bridge/tc358775.c<br>
&gt; &gt;&gt; &gt; +++ b/drivers/gpu/drm/bridge/tc358775.c<br>
&gt; &gt;&gt; &gt; @@ -241,7 +241,7 @@ static inline u32 TC358775_LVCFG_PCL=
KDIV(uint32_t val)<br>
&gt; &gt;&gt; &gt;=C2=A0 }<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;=C2=A0 #define TC358775_LVCFG_LVDLINK__MASK=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A00x00000002<br>
&gt; &gt;&gt; &gt; -#define TC358775_LVCFG_LVDLINK__SHIFT=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0<br>
&gt; &gt;&gt; &gt; +#define TC358775_LVCFG_LVDLINK__SHIFT=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1<br>
&gt; &gt;&gt; &gt;=C2=A0 static inline u32 TC358775_LVCFG_LVDLINK(uint32_t =
val)<br>
&gt; &gt;&gt; &gt;=C2=A0 {<br>
&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ((val) &lt;&lt; =
TC358775_LVCFG_LVDLINK__SHIFT) &amp;<br>
&gt; &gt;&gt; &gt; --<br>
&gt; &gt;&gt; &gt; 2.30.2<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; --<br>
&gt; &gt; regards,<br>
&gt; &gt; vinaysimha<br>
<br>
<br>
<br>
-- <br>
regards,<br>
vinaysimha<br>
</blockquote></div></div></div>

--0000000000001e6ac305d4c4b48e--
