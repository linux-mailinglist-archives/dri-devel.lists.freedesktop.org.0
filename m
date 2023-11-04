Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB9B7E0E22
	for <lists+dri-devel@lfdr.de>; Sat,  4 Nov 2023 07:55:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ACED10E07B;
	Sat,  4 Nov 2023 06:55:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF43A10E07B
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Nov 2023 06:55:48 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id
 5614622812f47-3b2e308a751so1401752b6e.0
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Nov 2023 23:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1699080948; x=1699685748;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=HUt8c3Q0YM1gmNU4Bjf7e9YsisAYEOL/VJbEt38hPE0=;
 b=OkpAfB7ppFCz/5tAEI3LuXFfV8N1cVVqXG2pN0gpls5jEatgPNrAOGefkUgEbSzLhE
 WPr5DEpaQhG838TcuwUUY/v6lEWlWStoJ+3glht50tbAN41sppes5yyKvjHoSQeS6VXn
 b92ETcqSo1QvfE7ycfvro491dcGTwsDhYJQpv1gzZvHiirVLtkdS9OugBzTxIBrGv3KN
 SaXY+iRdilzdGChkC6eZ5mgpJ+84EhSg+PzTFB11VgWuatTCZ14j8osHO1eJDPwpboCt
 +i0HZcRTUp5IJhojTsQjHybegLEwbFk9z5gnvDKRZq42oOvfCxOU4LqHDt5a5X/ruqOj
 ux2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699080948; x=1699685748;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HUt8c3Q0YM1gmNU4Bjf7e9YsisAYEOL/VJbEt38hPE0=;
 b=dCXeChmreVJ2BxeIgNDkQB+USetrouQIPjxVU2HahdrcBwcOkqI1weLRobSOQzZkOg
 dIajoPPTgQkYWJB86TpLE4+hQANuCLxcRQn3sy477ttpt7YCoLNJc6WAJo/kKvvNqaeF
 NkZBs3RjpLWSK8RqLPEkeZFF3Wf+7c3mdfpj+vyiwxJWoE5ppdcQAMnE4T8HPfFtXsuo
 LWp3FsjGK5IYthHP9kvR4CS1r+9T5WogocZs3lSzURhMRghoCX68ERmuyDhYOtumCQzo
 fjpXhCy31RxOWO1A2i0egcF3tVAxGyf8GP25gh2Lv+M6D/EKUVqkQG/LpVr04kY4KR8R
 KHCg==
X-Gm-Message-State: AOJu0Ywc+6WiGWo/1lj6kYrX2K8lVZ7JLFCmABnb+JqtFG3ICvK8QRbN
 BO3mC+2EEPbE4PJQFRJCKz/ID/kMvBk89Uzcf3pkbw==
X-Google-Smtp-Source: AGHT+IEAU/WYykVll6bSgyVoXc1z3L7P7CY0G1BgWf8XhW5W0kD4+5WmDLqo3Q4af8x0aeYkBBJYLJcy2O3HL8CgND8=
X-Received: by 2002:a05:6808:308b:b0:3b2:e45a:746d with SMTP id
 bl11-20020a056808308b00b003b2e45a746dmr2426539oib.20.1699080947861; Fri, 03
 Nov 2023 23:55:47 -0700 (PDT)
MIME-Version: 1.0
References: <20231102130844.13432-1-xiazhengqiao@huaqin.corp-partner.google.com>
 <6b80dfa4-66d2-40fc-bf3b-88a8ada09b50@quicinc.com>
In-Reply-To: <6b80dfa4-66d2-40fc-bf3b-88a8ada09b50@quicinc.com>
From: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
Date: Sat, 4 Nov 2023 14:55:34 +0800
Message-ID: <CADYyEwQzDoN83y2NGL6QvgaUSthzONoaHZ6HSKYpuY1EuZe-cQ@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: starry-2081101qfh032011-53g: Fine tune the
 panel power sequence
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Content-Type: multipart/alternative; boundary="000000000000579fe606094e1c68"
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
Cc: neil.armstrong@linaro.org, sam@ravnborg.org, linux-kernel@vger.kernel.org,
 mripard@kernel.org, dri-devel@lists.freedesktop.org,
 xuxinxiong@huaqin.corp-partner.google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000579fe606094e1c68
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi  Jessica ,

>Fixes: 6069b66cd962 ("drm/panel: support for STARRY 2081101QFH032011-53G
MIPI-DSI panel")

I'm not very familiar with this upstream process, Where should I add these?

Thanks


On Sat, Nov 4, 2023 at 2:40=E2=80=AFAM Jessica Zhang <quic_jesszhan@quicinc=
.com>
> wrote:
>
>
> On 11/2/2023 6:08 AM, xiazhengqiao wrote:
> > For "starry, 2081101qfh032011-53g" this panel, it is stipulated in the
> Hi Zhengqiao,
> Nit: Can you reword this to "For the "starry, 2081101qfh032011-53g"
> panel..."?
> > panel spec that MIPI needs to keep the LP11 state before the
> > lcm_reset pin is pulled high.
> Was this fixing some panel issue? If so, maybe we can add
> Fixes: 6069b66cd962 ("drm/panel: support for STARRY 2081101QFH032011-53G
> MIPI-DSI panel")
> Otherwise, with the commit msg fix, this looks good to me:
> Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> Thanks,
> Jessica Zhang
>
>
> >
> > Signed-off-by: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.co=
m
> >
>
> ---
> >   drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
> b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
> > index 4f370bc6dca8..4ed8c2e28d37 100644
> > --- a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
> > +++ b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
> > @@ -1765,6 +1765,7 @@ static const struct panel_desc
> starry_qfh032011_53g_desc =3D {
> >       .mode_flags =3D MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PU=
LSE
> |
> >                     MIPI_DSI_MODE_LPM,
> >       .init_cmds =3D starry_qfh032011_53g_init_cmd,
> > +     .lp11_before_reset =3D true,
> >   };
> >
> >   static const struct drm_display_mode
> starry_himax83102_j02_default_mode =3D {
> > --
> > 2.17.1
> >
>

--000000000000579fe606094e1c68
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi=C2=A0

Jessica ,<div><br><div>&gt;Fixes: 6069b66cd962 (&quot;drm/panel: support fo=
r STARRY 2081101QFH032011-53G MIPI-DSI panel&quot;)</div></div><div><br></d=
iv><div>I&#39;m not very familiar with this upstream process,=C2=A0Where sh=
ould I add these?<br></div><div><br></div><div>Thanks</div></div><div dir=
=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote"><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">On Sat, Nov 4, 2023 at 2:40=E2=80=
=AFAM Jessica Zhang &lt;<a href=3D"mailto:quic_jesszhan@quicinc.com" target=
=3D"_blank">quic_jesszhan@quicinc.com</a>&gt; wrote:<br><blockquote><br>On =
11/2/2023 6:08 AM, xiazhengqiao wrote:<br>&gt; For &quot;starry, 2081101qfh=
032011-53g&quot; this panel, it is stipulated in the<br>Hi Zhengqiao,<br>Ni=
t: Can you reword this to &quot;For the &quot;starry, 2081101qfh032011-53g&=
quot;<br>panel...&quot;?<br>&gt; panel spec that MIPI needs to keep the LP1=
1 state before the<br>&gt; lcm_reset pin is pulled high.<br>Was this fixing=
 some panel issue? If so, maybe we can add<br>Fixes: 6069b66cd962 (&quot;dr=
m/panel: support for STARRY 2081101QFH032011-53G<br>MIPI-DSI panel&quot;)<b=
r>Otherwise, with the commit msg fix, this looks good to me:<br>Reviewed-by=
: Jessica Zhang &lt;<a href=3D"mailto:quic_jesszhan@quicinc.com" target=3D"=
_blank">quic_jesszhan@quicinc.com</a>&gt;<br>Thanks,<br>Jessica Zhang</bloc=
kquote><br>&gt;<br>&gt; Signed-off-by: xiazhengqiao &lt;<a href=3D"mailto:x=
iazhengqiao@huaqin.corp-partner.google.com" target=3D"_blank">xiazhengqiao@=
huaqin.corp-partner.google.com</a>&gt;<br>  </blockquote><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
&gt; ---<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c | 1 +<br>
&gt;=C2=A0 =C2=A01 file changed, 1 insertion(+)<br>
&gt; <br>
&gt; diff --git a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c b/drivers/=
gpu/drm/panel/panel-boe-tv101wum-nl6.c<br>
&gt; index 4f370bc6dca8..4ed8c2e28d37 100644<br>
&gt; --- a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c<br>
&gt; +++ b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c<br>
&gt; @@ -1765,6 +1765,7 @@ static const struct panel_desc starry_qfh032011_=
53g_desc =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0.mode_flags =3D MIPI_DSI_MODE_VIDEO | MIPI_D=
SI_MODE_VIDEO_SYNC_PULSE |<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0MIPI_DSI_MODE_LPM,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0.init_cmds =3D starry_qfh032011_53g_init_cmd=
,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.lp11_before_reset =3D true,<br>
&gt;=C2=A0 =C2=A0};<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0static const struct drm_display_mode starry_himax83102_j02=
_default_mode =3D {<br>
&gt; -- <br>
&gt; 2.17.1<br>
&gt; <br>
</blockquote></div></div>

--000000000000579fe606094e1c68--
