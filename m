Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 86BA4473E2B
	for <lists+dri-devel@lfdr.de>; Tue, 14 Dec 2021 09:22:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22BCF10E8BC;
	Tue, 14 Dec 2021 08:22:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 525A110E8A0
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Dec 2021 08:13:36 +0000 (UTC)
Received: by mail-yb1-xb36.google.com with SMTP id y68so44427826ybe.1
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Dec 2021 00:13:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CDx41UYpt97+HVi+8mtN6BWEpQOsc45zTa2Rnv7DH98=;
 b=KqyNb/elwR0xl9lcEbV8pIAPM4sV1vEe08ncMYwvi3UbpEWOB05TNzsDG7qrnuNhsh
 ZzlQ8VBaLjKBFfxd5A6nMCOwj71B+k7XPmxUXC4hQFMtBzjtORBrOlzqcuBAkaHXbdaP
 HpfmFBWNNXR+Z65ZEULMk/+I6SRV/TNVkvqnmiaoyUKCdGatmfcQs1CZ6haVymrde+I/
 5qyytYAAzV6c1vZ8fyjwTWt89deoaulvpYXRb/wKXXSfNxWYfF8HjvwO90fsWz7JEJ49
 hm+TXu1ZVvhrufLCGzfNWhop19MVEXSIBRq/Nkiu+fOv65klM7p4Tl6FPYqbJTtANzMU
 /rEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CDx41UYpt97+HVi+8mtN6BWEpQOsc45zTa2Rnv7DH98=;
 b=ELfBgKxOZP/OdI0XBFQsk7aWN8UIME0GtUBTaFNKCK6ZO9Nt9g1wfYeMXsMaF0OtbL
 QeM1M0ahZCgKp5clpvPb7CikiS8RcmBISiCmMgeXAsAhPeI9We4f/Qg+uF6Wjo4rDn/c
 21hDvqBPL9pjUCnVqhmeWsQoAcyl+TIX0xKedJe3e8jE7lE/sVTpr7uuXEuNPfRrRdsH
 0BjZegfYwK6dSEbfWBbdSyQmdDmiyNDmrXFrq2G8QS8QVZDqdqstlhw8mIWqEY4ribai
 DXoqNhUClNGGzrL9rWis8THvae0gf5DnIoLpKE41TW/U93QvTtdXiWFYyDdfKo93AQnx
 KbSg==
X-Gm-Message-State: AOAM530QF5fyyBUTwXQxnuetRWZEJxPPg8vqV7PKLcWHP7Ts6Q7WkYPH
 QOhgBPR2s2jcTte3s7fr5gnyf5BSGHTxzmXD+eY=
X-Google-Smtp-Source: ABdhPJxH71JicgfDKcnfvSvpLJyz+7oaMy7S+r3iqkteRPHMp/vQ01Io6Njnzx0pxVv4Szw0KllkNamq1XKReZ9hFvg=
X-Received: by 2002:a25:8242:: with SMTP id d2mr4147125ybn.617.1639469615349; 
 Tue, 14 Dec 2021 00:13:35 -0800 (PST)
MIME-Version: 1.0
References: <20211110220050.2854-1-jirivanek1@gmail.com>
 <CAG3jFyvB-Dzd9YDJ7FrAC5avobL7Wfk-91E-DVeYWwfNcQLiLg@mail.gmail.com>
In-Reply-To: <CAG3jFyvB-Dzd9YDJ7FrAC5avobL7Wfk-91E-DVeYWwfNcQLiLg@mail.gmail.com>
From: Vinay Simha B N <simhavcs@gmail.com>
Date: Tue, 14 Dec 2021 13:43:24 +0530
Message-ID: <CAGWqDJ5ZKJ0skLnhfhC0cbzNnSo7HLY7Cqr2ZhOcb_YiHNsA1A@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge/tc358775: Fix for dual-link LVDS
To: robert.foss@linaro.org
Content-Type: multipart/alternative; boundary="0000000000000b051f05d316c495"
X-Mailman-Approved-At: Tue, 14 Dec 2021 08:22:11 +0000
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

--0000000000000b051f05d316c495
Content-Type: text/plain; charset="UTF-8"

Robert,
I do not have the hardware to test this feature. Sorry for the late
response.

On Thu, Nov 18, 2021 at 8:20 PM Robert Foss <robert.foss@linaro.org> wrote:

> + Zhen & Vinay
>
> This patch looks good in itself, but I would like to see a tested by
> tag. At the very least testing for regression in single-link LVDS but
> ideally some third party verification of this patch.
>
> On Wed, 10 Nov 2021 at 23:01, Jiri Vanek <jirivanek1@gmail.com> wrote:
> >
> > Fixed wrong register shift for single/dual link LVDS output.
> >
> > Signed-off-by: Jiri Vanek <jirivanek1@gmail.com>
> > ---
> >  drivers/gpu/drm/bridge/tc358775.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/tc358775.c
> b/drivers/gpu/drm/bridge/tc358775.c
> > index 2272adcc5b4a..1d6ec1baeff2 100644
> > --- a/drivers/gpu/drm/bridge/tc358775.c
> > +++ b/drivers/gpu/drm/bridge/tc358775.c
> > @@ -241,7 +241,7 @@ static inline u32 TC358775_LVCFG_PCLKDIV(uint32_t
> val)
> >  }
> >
> >  #define TC358775_LVCFG_LVDLINK__MASK                         0x00000002
> > -#define TC358775_LVCFG_LVDLINK__SHIFT                        0
> > +#define TC358775_LVCFG_LVDLINK__SHIFT                        1
> >  static inline u32 TC358775_LVCFG_LVDLINK(uint32_t val)
> >  {
> >         return ((val) << TC358775_LVCFG_LVDLINK__SHIFT) &
> > --
> > 2.30.2
> >
>


-- 
regards,
vinaysimha

--0000000000000b051f05d316c495
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Robert,</div><div>I do not have the hardware to test =
this feature. Sorry for the late response.<br></div></div><br><div class=3D=
"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Nov 18, 2021 at=
 8:20 PM Robert Foss &lt;<a href=3D"mailto:robert.foss@linaro.org">robert.f=
oss@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">+ Zhen &amp; Vinay<br>
<br>
This patch looks good in itself, but I would like to see a tested by<br>
tag. At the very least testing for regression in single-link LVDS but<br>
ideally some third party verification of this patch.<br>
<br>
On Wed, 10 Nov 2021 at 23:01, Jiri Vanek &lt;<a href=3D"mailto:jirivanek1@g=
mail.com" target=3D"_blank">jirivanek1@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Fixed wrong register shift for single/dual link LVDS output.<br>
&gt;<br>
&gt; Signed-off-by: Jiri Vanek &lt;<a href=3D"mailto:jirivanek1@gmail.com" =
target=3D"_blank">jirivanek1@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 drivers/gpu/drm/bridge/tc358775.c | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/drivers/gpu/drm/bridge/tc358775.c b/drivers/gpu/drm/bridg=
e/tc358775.c<br>
&gt; index 2272adcc5b4a..1d6ec1baeff2 100644<br>
&gt; --- a/drivers/gpu/drm/bridge/tc358775.c<br>
&gt; +++ b/drivers/gpu/drm/bridge/tc358775.c<br>
&gt; @@ -241,7 +241,7 @@ static inline u32 TC358775_LVCFG_PCLKDIV(uint32_t =
val)<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt;=C2=A0 #define TC358775_LVCFG_LVDLINK__MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x00000002<br=
>
&gt; -#define TC358775_LVCFG_LVDLINK__SHIFT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0<br>
&gt; +#define TC358775_LVCFG_LVDLINK__SHIFT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1<br>
&gt;=C2=A0 static inline u32 TC358775_LVCFG_LVDLINK(uint32_t val)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ((val) &lt;&lt; TC358775_LVCFG=
_LVDLINK__SHIFT) &amp;<br>
&gt; --<br>
&gt; 2.30.2<br>
&gt;<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">regards,<br>vinaysimha</div>

--0000000000000b051f05d316c495--
