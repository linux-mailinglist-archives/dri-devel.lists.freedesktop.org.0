Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D104BD129D
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 04:03:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 794D910E359;
	Mon, 13 Oct 2025 02:03:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DVS06Z8s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
 [209.85.208.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EC4D10E359
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 02:03:19 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id
 4fb4d7f45d1cf-631787faf35so7326894a12.3
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Oct 2025 19:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760320998; x=1760925798; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=KRyGGumsOuzMn92bol+9GZ9FJkBaMes+gr678Wccdos=;
 b=DVS06Z8sPhSknJ7Ovdlmuuz0GXyQHV0JdL9jCZG1h8/d3mH4W+xbEvV6nmcs3drG/K
 PrdMxrkf7m5Inxe+lICMJeT1NhwW6ux9KB+ykJnZ7kQgFwrAn6Jm0QgAWQaV4vHFwVPZ
 lB3jwZdSAvw25XcE70OGieEN77D6NAuTmyODJYcPG3sgkEDldCWD4sSi3kSaCIplWFI6
 RT3V+oiyiRiLO7fVM3n5XuxZlbOZL4ntYL6qhWYnRsWjftQIgkDXLmBfmsSdh/L2utVH
 KKVyq/uVFx/8dyuEKlKbjDVja0Mz9Vn3pprogtGerph2PExSSNhRExhyHfDJy/NL7QcJ
 yFzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760320998; x=1760925798;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KRyGGumsOuzMn92bol+9GZ9FJkBaMes+gr678Wccdos=;
 b=Dp1zDFRKnWEiqoR1zK+laMPYeE8BdZxTvUtrcPB/y9LkZFcfcXYLDIevIXsd4OO6YS
 Tx6Y+47ued65Tf9NUekuxArKsqDqNCYBoOBQ3WkIT+lXVtGgkRu3emVMKZE1DRUjfFzz
 RDf+yYev4ipAaU9Om6NwboJqfNo9rvONcQp7YG8SOOHp0PW647KLdCcFw0bxh+MmDUyh
 tiHmIeMHWuP+FPST4Qsydli7SDDv1dCNe11J487R8xussTiT9ZRytF8aqERzZdEmVt1e
 ZqvGIXSwptee1uUjopRjyG11cEke9CdZbyJxuCY2DAcz6CqjTl1wvMOukDRR7RLqfzAF
 kq2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUxKB7STE2t8Xhl6JDChBkDqtVdvvRWSl9pHYdkmujW2jYGqeuC4uw4OaCNshyaPOIkrGUOwJt9dNw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw6Ape56sshrjRuJSwgXo6LBpO/Y6PiQJZZwww8sdhjT6GkeIuk
 tXBvKiyPIsuKhFsZrTmp3W8fPLYxsW0P4K1oT4/a2AiU7oXuUh6WsOPjb1zrRml+Z2PMqLhTECQ
 0XkvuCvbdTrtiOzDQP61sOkbBSJTmI14=
X-Gm-Gg: ASbGncs7nD9PEvWL2aEwJeAIGf/cH2WJ/E6az5UBcKbe9g2GmFDQZlS7wnEZ/CH2LOM
 t3sqoCmCVFP/pOQe3BOmen6stGep7aqXsZB4ws7KIxw+njsV6B+7CCxPFyWqHhwFMRg/ANqtyRi
 W0MNuBK/GgHlL+hAQZ66ERIf2Xp1kkw2EreySMfxqDPr+JWuts06zs0IVXRinErxumNBmo/vx7b
 GLIcobWVFcpGnFx0Irl0J6in1spkMhr+EIK
X-Google-Smtp-Source: AGHT+IEgSCvJ7boyxijwwoBZks3M+S3lJzTkVNGQMzTajunDh/3wAlByR/J1St4J/IzP1kPURPe6fu1t0Sr6VYnNsh4=
X-Received: by 2002:a05:6402:26c9:b0:639:dab5:d605 with SMTP id
 4fb4d7f45d1cf-639dab5db04mr19182700a12.27.1760320997462; Sun, 12 Oct 2025
 19:03:17 -0700 (PDT)
MIME-Version: 1.0
References: <20251001135914.13754-1-caojunjie650@gmail.com>
 <20251001135914.13754-4-caojunjie650@gmail.com>
 <lfdhib6a7ct36nmj3of2setjft7ydrf6sfgtx7qued7qd56nhc@2xol3grm5re7>
In-Reply-To: <lfdhib6a7ct36nmj3of2setjft7ydrf6sfgtx7qued7qd56nhc@2xol3grm5re7>
From: =?UTF-8?B?5pu55L+K5p2w?= <caojunjie650@gmail.com>
Date: Mon, 13 Oct 2025 10:03:05 +0800
X-Gm-Features: AS18NWB30bJo0TXAdOkHdLUumYop32Gy1GGk8yM71mCMxc4ybVdrrSMZJlXO1vM
Message-ID: <CAK6c68hPsBv7NKHr7H=Vi8eHjcvvrppxg7Qdz=e9TWE8LJXeRQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/panel: Add Novatek NT36532 panel driver
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Antonino Maniscalco <antomani103@gmail.com>, 
 Jonathan Marek <jonathan@marek.ca>, Eugene Lepshy <fekz115@gmail.com>,
 Jun Nie <jun.nie@linaro.org>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org
Content-Type: multipart/alternative; boundary="000000000000be9614064100ab9e"
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

--000000000000be9614064100ab9e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2025=E5=B9=B4=
10=E6=9C=882=E6=97=A5=E5=91=A8=E5=9B=9B 10:05=E5=86=99=E9=81=93=EF=BC=9A
>On Wed, Oct 01, 2025 at 09:59:14PM +0800, Junjie Cao wrote:
>> Add a driver for panels using the Novatek NT36532 Display Driver IC,
>> including support for the CSOT PPC100HB1-1, found in the OnePlus Pad 2
>> tablets.
>>
>> Signed-off-by: Junjie Cao <caojunjie650@gmail.com>
>> ---
>>  MAINTAINERS                                   |   7 +
>>  drivers/gpu/drm/panel/Kconfig                 |  10 +
>>  drivers/gpu/drm/panel/Makefile                |   1 +
>>  drivers/gpu/drm/panel/panel-novatek-nt36532.c | 437 ++++++++++++++++++
>>  4 files changed, 455 insertions(+)
>>  create mode 100644 drivers/gpu/drm/panel/panel-novatek-nt36532.c
>>
>> +
>> +static const struct panel_info csot_panel_info =3D {
>> +     .width_mm =3D 250,
>> +     .height_mm =3D 177,
>> +     .lanes =3D 4,
>> +     .format =3D MIPI_DSI_FMT_RGB888,
>> +     .mode_flags =3D MIPI_DSI_MODE_VIDEO | MIPI_DSI_CLOCK_NON_CONTINUOU=
S |
>> +                   MIPI_DSI_MODE_LPM,
>> +     .display_mode =3D csot_display_mode,
>> +     .dsc_slice_per_pkt =3D 2,
>
>As this is not a part of the standard, what if the DSI host doesn't
>support this feature?
>

Without it, parameters will not be calculated correctly, garbled then.

>> +     .dsc_cfg =3D &csot_dsc_cfg,
>> +     .init_sequence =3D csot_init_sequence,
>> +     .is_dual_dsi =3D true,
>> +};
>> +
>
>--
>With best wishes
>Dmitry

Regards,
Junjie

Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2025=E5=B9=B4=
10=E6=9C=882=E6=97=A5=E5=91=A8=E5=9B=9B 10:05=E5=86=99=E9=81=93=EF=BC=9A

> On Wed, Oct 01, 2025 at 09:59:14PM +0800, Junjie Cao wrote:
> > Add a driver for panels using the Novatek NT36532 Display Driver IC,
> > including support for the CSOT PPC100HB1-1, found in the OnePlus Pad 2
> > tablets.
> >
> > Signed-off-by: Junjie Cao <caojunjie650@gmail.com>
> > ---
> >  MAINTAINERS                                   |   7 +
> >  drivers/gpu/drm/panel/Kconfig                 |  10 +
> >  drivers/gpu/drm/panel/Makefile                |   1 +
> >  drivers/gpu/drm/panel/panel-novatek-nt36532.c | 437 ++++++++++++++++++
> >  4 files changed, 455 insertions(+)
> >  create mode 100644 drivers/gpu/drm/panel/panel-novatek-nt36532.c
> >
> > +
> > +static const struct panel_info csot_panel_info =3D {
> > +     .width_mm =3D 250,
> > +     .height_mm =3D 177,
> > +     .lanes =3D 4,
> > +     .format =3D MIPI_DSI_FMT_RGB888,
> > +     .mode_flags =3D MIPI_DSI_MODE_VIDEO | MIPI_DSI_CLOCK_NON_CONTINUO=
US |
> > +                   MIPI_DSI_MODE_LPM,
> > +     .display_mode =3D csot_display_mode,
> > +     .dsc_slice_per_pkt =3D 2,
>
> As this is not a part of the standard, what if the DSI host doesn't
> support this feature?
>
> > +     .dsc_cfg =3D &csot_dsc_cfg,
> > +     .init_sequence =3D csot_init_sequence,
> > +     .is_dual_dsi =3D true,
> > +};
> > +
>
> --
> With best wishes
> Dmitry
>

--000000000000be9614064100ab9e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Dmitry Baryshkov &lt;<a href=3D"mailto:dmitry.baryshkov@os=
s.qualcomm.com" target=3D"_blank">dmitry.baryshkov@oss.qualcomm.com</a>&gt;=
 =E4=BA=8E2025=E5=B9=B410=E6=9C=882=E6=97=A5=E5=91=A8=E5=9B=9B 10:05=E5=86=
=99=E9=81=93=EF=BC=9A<span class=3D"gmail-im"><br>&gt;On Wed, Oct 01, 2025 =
at 09:59:14PM +0800, Junjie Cao wrote:<br>&gt;&gt; Add a driver for panels =
using the Novatek NT36532 Display Driver IC,<br>&gt;&gt; including support =
for the CSOT PPC100HB1-1, found in the OnePlus Pad 2<br>&gt;&gt; tablets.<b=
r>&gt;&gt;<br>&gt;&gt; Signed-off-by: Junjie Cao &lt;<a href=3D"mailto:caoj=
unjie650@gmail.com" target=3D"_blank">caojunjie650@gmail.com</a>&gt;<br>&gt=
;&gt; ---<br>&gt;&gt; =C2=A0MAINTAINERS =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | =C2=A0 7 +<br>&gt;&gt; =C2=A0drivers/gpu/drm/panel/Kconfig =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A010 +<br>&gt;&g=
t; =C2=A0drivers/gpu/drm/panel/Makefile =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| =C2=A0 1 +<br>&gt;&gt; =C2=A0drivers/gpu/drm/panel/pa=
nel-novatek-nt36532.c | 437 ++++++++++++++++++<br>&gt;&gt; =C2=A04 files ch=
anged, 455 insertions(+)<br>&gt;&gt; =C2=A0create mode 100644 drivers/gpu/d=
rm/panel/panel-novatek-nt36532.c<br>&gt;&gt;<br>&gt;&gt; +<br>&gt;&gt; +sta=
tic const struct panel_info csot_panel_info =3D {<br>&gt;&gt; + =C2=A0 =C2=
=A0 .width_mm =3D 250,<br>&gt;&gt; + =C2=A0 =C2=A0 .height_mm =3D 177,<br>&=
gt;&gt; + =C2=A0 =C2=A0 .lanes =3D 4,<br>&gt;&gt; + =C2=A0 =C2=A0 .format =
=3D MIPI_DSI_FMT_RGB888,<br>&gt;&gt; + =C2=A0 =C2=A0 .mode_flags =3D MIPI_D=
SI_MODE_VIDEO | MIPI_DSI_CLOCK_NON_CONTINUOUS |<br>&gt;&gt; + =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MIPI_DSI_MODE_LPM,<br>&gt=
;&gt; + =C2=A0 =C2=A0 .display_mode =3D csot_display_mode,<br>&gt;&gt; + =
=C2=A0 =C2=A0 .dsc_slice_per_pkt =3D 2,<br>&gt;<br>&gt;As this is not a par=
t of the standard, what if the DSI host doesn&#39;t<br>&gt;support this fea=
ture?<br>&gt;<br><br></span>Without it, parameters will not be calculated c=
orrectly, garbled then.<span class=3D"gmail-im"><br><br>&gt;&gt; + =C2=A0 =
=C2=A0 .dsc_cfg =3D &amp;csot_dsc_cfg,<br>&gt;&gt; + =C2=A0 =C2=A0 .init_se=
quence =3D csot_init_sequence,<br>&gt;&gt; + =C2=A0 =C2=A0 .is_dual_dsi =3D=
 true,<br>&gt;&gt; +};<br>&gt;&gt; +<br>&gt;<br>&gt;-- <br>&gt;With best wi=
shes<br>&gt;Dmitry <br><br></span>Regards,<br>Junjie</div><br><div class=3D=
"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">D=
mitry Baryshkov &lt;<a href=3D"mailto:dmitry.baryshkov@oss.qualcomm.com">dm=
itry.baryshkov@oss.qualcomm.com</a>&gt; =E4=BA=8E2025=E5=B9=B410=E6=9C=882=
=E6=97=A5=E5=91=A8=E5=9B=9B 10:05=E5=86=99=E9=81=93=EF=BC=9A<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">On Wed, Oct 01, 2025 at 09:59:=
14PM +0800, Junjie Cao wrote:<br>
&gt; Add a driver for panels using the Novatek NT36532 Display Driver IC,<b=
r>
&gt; including support for the CSOT PPC100HB1-1, found in the OnePlus Pad 2=
<br>
&gt; tablets.<br>
&gt; <br>
&gt; Signed-off-by: Junjie Cao &lt;<a href=3D"mailto:caojunjie650@gmail.com=
" target=3D"_blank">caojunjie650@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 MAINTAINERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A07 +<br>
&gt;=C2=A0 drivers/gpu/drm/panel/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 10 +<br>
&gt;=C2=A0 drivers/gpu/drm/panel/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 drivers/gpu/drm/panel/panel-novatek-nt36532.c | 437 ++++++++++++=
++++++<br>
&gt;=C2=A0 4 files changed, 455 insertions(+)<br>
&gt;=C2=A0 create mode 100644 drivers/gpu/drm/panel/panel-novatek-nt36532.c=
<br>
&gt; <br>
&gt; +<br>
&gt; +static const struct panel_info csot_panel_info =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.width_mm =3D 250,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.height_mm =3D 177,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.lanes =3D 4,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.format =3D MIPI_DSI_FMT_RGB888,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.mode_flags =3D MIPI_DSI_MODE_VIDEO | MIPI_DSI_CL=
OCK_NON_CONTINUOUS |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
MIPI_DSI_MODE_LPM,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.display_mode =3D csot_display_mode,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.dsc_slice_per_pkt =3D 2,<br>
<br>
As this is not a part of the standard, what if the DSI host doesn&#39;t<br>
support this feature?<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.dsc_cfg =3D &amp;csot_dsc_cfg,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.init_sequence =3D csot_init_sequence,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.is_dual_dsi =3D true,<br>
&gt; +};<br>
&gt; +<br>
<br>
-- <br>
With best wishes<br>
Dmitry<br>
</blockquote></div>

--000000000000be9614064100ab9e--
