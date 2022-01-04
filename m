Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A11D48435C
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jan 2022 15:29:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 076DD10E56C;
	Tue,  4 Jan 2022 14:29:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com
 [IPv6:2607:f8b0:4864:20::834])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B507E10E56A
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jan 2022 14:29:35 +0000 (UTC)
Received: by mail-qt1-x834.google.com with SMTP id bp39so33944439qtb.6
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jan 2022 06:29:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vgHb4AtLPLVkkkmPXe+tK4xOn7AQcZoineNt4QX4NHc=;
 b=Scs3+C6IzoXC16cbUKj5e6qqGkznCupDJxYZlU7Fn4hp3FpypousrjuqBjtEa1MR/p
 Lnd9PnhurcNJPBYCCrdC3S4/3728O637Jm5MwWVnVUFI5tWrziMVrejnARJn+YoVTf+9
 pSgpUUR2En6qxmt4khCSHV7+rZ+emPDk+UWefdp119Ba/GH85CIYK9a898Sc1FxWoDOs
 E68bfrhHR99+DDcce5dnrF9w/jf/pMgbFli5XnTTWCqjeypIK/cYJQw5jtr4NYeT0qnB
 yqv+tqXrXiumyjkvAslj1bEvfebW4YrOtTiKeb3JSo558GLiS6RHF6i9AI5IkbKdW2uc
 hApg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vgHb4AtLPLVkkkmPXe+tK4xOn7AQcZoineNt4QX4NHc=;
 b=uOGRHR9kz6sp5aa2Wb4hdyqOn0/REnM1gBN7knzeXeacrf468v2iheFbjhcGV50xmO
 8LduARdPw4bHx5moaKPKzclJosM0Z4qBklVplNTxwJ2GNawRyuU5fcquVxyUD28EJVEI
 5Gy79veH5TOxY+EqNLzzCCDR4+uE/EXAPc2rvwcCZkv255KGrvta3vTO4BrH+qblSK3E
 O0V+jShE4Wcw0/R4NpTGb8dHCTob6Um235IA846L/gF3K4JAyeha3X2TDGF31YwUcLiN
 NW1Uu/8ajAgNuxSdJR8t1NHZ8fHaXuqeujG7E+yGlt6pF3gHyLGAl4hRj799cH2TzNyk
 jIKw==
X-Gm-Message-State: AOAM533GVZvgUhijXAj0vJsMYjInKKVaFuUh6r4KHDIfqlGCrn+P/cg5
 nkOECTHAqsiNcpBaLZdpttvCFKvERCYxDEiPdHI=
X-Google-Smtp-Source: ABdhPJx9Ibs1Jk2Z4kaDWxiMThyNBBzC0mHQLeXW6uLte8+CgltF0Q4IDUOwQPMcm0+p02YtkZkSDbwA2BZcSJQFrvk=
X-Received: by 2002:ac8:4e41:: with SMTP id e1mr44869994qtw.116.1641306574846; 
 Tue, 04 Jan 2022 06:29:34 -0800 (PST)
MIME-Version: 1.0
References: <20211110220050.2854-1-jirivanek1@gmail.com>
 <CAG3jFyvB-Dzd9YDJ7FrAC5avobL7Wfk-91E-DVeYWwfNcQLiLg@mail.gmail.com>
 <CAGWqDJ5ZKJ0skLnhfhC0cbzNnSo7HLY7Cqr2ZhOcb_YiHNsA1A@mail.gmail.com>
 <CAG3jFyt1nvtkDC2r3wc+3ky_VxtZ7s4Rto_+kMg6J_x1=QpO-Q@mail.gmail.com>
In-Reply-To: <CAG3jFyt1nvtkDC2r3wc+3ky_VxtZ7s4Rto_+kMg6J_x1=QpO-Q@mail.gmail.com>
From: =?UTF-8?B?SmnFmcOtIFZhbsSbaw==?= <jirivanek1@gmail.com>
Date: Tue, 4 Jan 2022 15:29:24 +0100
Message-ID: <CAECvnWLivbpHQc1Qu0NowXFhSHgQModwcwG0=zviqmGPxnjUHg@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge/tc358775: Fix for dual-link LVDS
To: Robert Foss <robert.foss@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000005c7ef905d4c277ad"
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
Cc: Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 open list <linux-kernel@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Zheng Bin <zhengbin13@huawei.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Vinay Simha B N <simhavcs@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--0000000000005c7ef905d4c277ad
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Actually, this patch is based on testing with a real HW with dual-link LVDS
display (full HD) and it also matches with a datasheet. Without this fix it
does not work at all.

=C3=BAt 4. 1. 2022 v 14:51 odes=C3=ADlatel Robert Foss <robert.foss@linaro.=
org>
napsal:

> Jiri: Are you able to test this patch?
>
> Vinay: Could you supply a R-b tag, if you feel that it is warranted?
>
> On Tue, 14 Dec 2021 at 09:13, Vinay Simha B N <simhavcs@gmail.com> wrote:
> >
> > Robert,
> > I do not have the hardware to test this feature. Sorry for the late
> response.
> >
> > On Thu, Nov 18, 2021 at 8:20 PM Robert Foss <robert.foss@linaro.org>
> wrote:
> >>
> >> + Zhen & Vinay
> >>
> >> This patch looks good in itself, but I would like to see a tested by
> >> tag. At the very least testing for regression in single-link LVDS but
> >> ideally some third party verification of this patch.
> >>
> >> On Wed, 10 Nov 2021 at 23:01, Jiri Vanek <jirivanek1@gmail.com> wrote:
> >> >
> >> > Fixed wrong register shift for single/dual link LVDS output.
> >> >
> >> > Signed-off-by: Jiri Vanek <jirivanek1@gmail.com>
> >> > ---
> >> >  drivers/gpu/drm/bridge/tc358775.c | 2 +-
> >> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >> >
> >> > diff --git a/drivers/gpu/drm/bridge/tc358775.c
> b/drivers/gpu/drm/bridge/tc358775.c
> >> > index 2272adcc5b4a..1d6ec1baeff2 100644
> >> > --- a/drivers/gpu/drm/bridge/tc358775.c
> >> > +++ b/drivers/gpu/drm/bridge/tc358775.c
> >> > @@ -241,7 +241,7 @@ static inline u32 TC358775_LVCFG_PCLKDIV(uint32_=
t
> val)
> >> >  }
> >> >
> >> >  #define TC358775_LVCFG_LVDLINK__MASK
>  0x00000002
> >> > -#define TC358775_LVCFG_LVDLINK__SHIFT                        0
> >> > +#define TC358775_LVCFG_LVDLINK__SHIFT                        1
> >> >  static inline u32 TC358775_LVCFG_LVDLINK(uint32_t val)
> >> >  {
> >> >         return ((val) << TC358775_LVCFG_LVDLINK__SHIFT) &
> >> > --
> >> > 2.30.2
> >> >
> >
> >
> >
> > --
> > regards,
> > vinaysimha
>

--0000000000005c7ef905d4c277ad
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Actually, this patch is based on testing =
with a real HW with dual-link LVDS display (full HD) and it also matches wi=
th a datasheet. Without this fix it does not work at all.<br></div><br><div=
 class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=C3=BAt 4. 1. =
2022 v=C2=A014:51 odes=C3=ADlatel Robert Foss &lt;<a href=3D"mailto:robert.=
foss@linaro.org">robert.foss@linaro.org</a>&gt; napsal:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">Jiri: Are you able to test this pat=
ch?<br>
<br>
Vinay: Could you supply a R-b tag, if you feel that it is warranted?<br>
<br>
On Tue, 14 Dec 2021 at 09:13, Vinay Simha B N &lt;<a href=3D"mailto:simhavc=
s@gmail.com" target=3D"_blank">simhavcs@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Robert,<br>
&gt; I do not have the hardware to test this feature. Sorry for the late re=
sponse.<br>
&gt;<br>
&gt; On Thu, Nov 18, 2021 at 8:20 PM Robert Foss &lt;<a href=3D"mailto:robe=
rt.foss@linaro.org" target=3D"_blank">robert.foss@linaro.org</a>&gt; wrote:=
<br>
&gt;&gt;<br>
&gt;&gt; + Zhen &amp; Vinay<br>
&gt;&gt;<br>
&gt;&gt; This patch looks good in itself, but I would like to see a tested =
by<br>
&gt;&gt; tag. At the very least testing for regression in single-link LVDS =
but<br>
&gt;&gt; ideally some third party verification of this patch.<br>
&gt;&gt;<br>
&gt;&gt; On Wed, 10 Nov 2021 at 23:01, Jiri Vanek &lt;<a href=3D"mailto:jir=
ivanek1@gmail.com" target=3D"_blank">jirivanek1@gmail.com</a>&gt; wrote:<br=
>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Fixed wrong register shift for single/dual link LVDS output.<=
br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Signed-off-by: Jiri Vanek &lt;<a href=3D"mailto:jirivanek1@gm=
ail.com" target=3D"_blank">jirivanek1@gmail.com</a>&gt;<br>
&gt;&gt; &gt; ---<br>
&gt;&gt; &gt;=C2=A0 drivers/gpu/drm/bridge/tc358775.c | 2 +-<br>
&gt;&gt; &gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; diff --git a/drivers/gpu/drm/bridge/tc358775.c b/drivers/gpu/=
drm/bridge/tc358775.c<br>
&gt;&gt; &gt; index 2272adcc5b4a..1d6ec1baeff2 100644<br>
&gt;&gt; &gt; --- a/drivers/gpu/drm/bridge/tc358775.c<br>
&gt;&gt; &gt; +++ b/drivers/gpu/drm/bridge/tc358775.c<br>
&gt;&gt; &gt; @@ -241,7 +241,7 @@ static inline u32 TC358775_LVCFG_PCLKDIV(=
uint32_t val)<br>
&gt;&gt; &gt;=C2=A0 }<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 #define TC358775_LVCFG_LVDLINK__MASK=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x=
00000002<br>
&gt;&gt; &gt; -#define TC358775_LVCFG_LVDLINK__SHIFT=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0<br>
&gt;&gt; &gt; +#define TC358775_LVCFG_LVDLINK__SHIFT=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1<br>
&gt;&gt; &gt;=C2=A0 static inline u32 TC358775_LVCFG_LVDLINK(uint32_t val)<=
br>
&gt;&gt; &gt;=C2=A0 {<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ((val) &lt;&lt; TC358=
775_LVCFG_LVDLINK__SHIFT) &amp;<br>
&gt;&gt; &gt; --<br>
&gt;&gt; &gt; 2.30.2<br>
&gt;&gt; &gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; regards,<br>
&gt; vinaysimha<br>
</blockquote></div></div>

--0000000000005c7ef905d4c277ad--
