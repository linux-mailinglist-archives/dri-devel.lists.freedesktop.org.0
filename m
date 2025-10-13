Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B0E0BD1215
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 03:53:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E43210E1D1;
	Mon, 13 Oct 2025 01:53:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nhYAoRxW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
 [209.85.208.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 427FA10E32B
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 01:53:32 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id
 4fb4d7f45d1cf-637e74e9104so4968115a12.1
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Oct 2025 18:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760320411; x=1760925211; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=jib6qtZ7uovkQhx/qSCYqbTejviWgQQiEea0Nhubv1E=;
 b=nhYAoRxWA1+RPNLkrZfz9WmOUM0w8bBzVOGNJhocyUYiXUtbq21ljo1LdYCTVd+Mid
 QZZ5+1MHqgDNohAPWmlgJv70yt57p+df61UZWC1a66k4FUrv6zdMjRzJeuq96/Jjmc/f
 eMxJIoGI3+Fh/+a9bFb3Y8vlDBkOqW8403nfCCuLxGouoxs1DCV+TnruUEky4H8Qc05o
 5+wzwnkx9PkqrDjtohUsWvqFH+eFfD1qRhS5abEco8EkYj1LugbNwE+WrozYXu70vdUw
 eTYi6nQecoR7R2L18/0f8pf0kmmsy8zIsqbxXGbboEH0yT1tLlF/UIEdsYS8oIV0GyMN
 REjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760320411; x=1760925211;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jib6qtZ7uovkQhx/qSCYqbTejviWgQQiEea0Nhubv1E=;
 b=gdp9c3CFcyAEVA6AWDMRggvv6BPNXuwJALY+ZAiTOCyrvgctJvbYy2sthq8HtBVbVQ
 Vpe/rQtd9JPC7pXcp8Qj7sV9sJQVrvKSZydIDS/E2pPqV3clsqZbZhR1KP4/H2cRJfCb
 WJqDh3vLfkSWxASZNDqiTUraCitHMEttGMn0zOqGDyqZQ+ccDrVJg2CstniKRBD/C1/z
 PbUmklk+o7AJ5GxkpHJZf5xK6gvddok5Oo+qb7ctgA4eDAPuASPZryD+Yocdp3lXxEHs
 5AxkU1J2WafPvt4ALaJGvhwMnESf2Pjm3dHlU+TwO9RWH8xLQ4p5QlrTENk0uVgPJDE1
 jspA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUQVhRxzymegAVWzlSuXEQPHrqGus6lJz66Gb8haDEEu6SfGDMRExr/Mr0j8txo3ZucFH7F+tp9kQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwBSm45Op+pRirqjH15if/leiLdU1A29PKKiepoLav9b912bzI4
 swPVus+DjZhoGQ84OWDwyKINo28ifpxXUey7ia/yvmZ+nzx5xaqUlqLDUfGASfXjlX24ajc2/Vi
 5xARcYnOFAm4kAj8ZestjD020tze5xpk=
X-Gm-Gg: ASbGncvafnkit1IMltrjCUzlEoCeUE1geda42d3kczmy3kHtROL/qh7a1ul25Gs8cJz
 fSqLtsYK9oZ+xfpAqrig++Um7Xr3ZKl0JCjXHq3jvnT0LLQ3f8a8MJ0rpAScypK3RidWUQZ5qYw
 01b45kQPuVdfEeU5ZCJ3k2PHeEzWcF0Onp5P3fNlpT+6/PHd6+t5Yx5ADB/bqlTj2lHnCM3Y4Zl
 WPOQxC6oKSxfW1k2oV3OLrGkQ==
X-Google-Smtp-Source: AGHT+IHNL1BUTxL2xPvRlvw72ZaxFIL6RT4owwNyRO7JLM5S/Xgryvv1liecPpjG1QLNARe02zsa23/lQ3BBsnrQvyc=
X-Received: by 2002:a05:6402:13d1:b0:626:4774:2420 with SMTP id
 4fb4d7f45d1cf-639d5c320c0mr17570498a12.20.1760320410533; Sun, 12 Oct 2025
 18:53:30 -0700 (PDT)
MIME-Version: 1.0
References: <20251001135914.13754-1-caojunjie650@gmail.com>
 <20251001135914.13754-4-caojunjie650@gmail.com>
 <lfdhib6a7ct36nmj3of2setjft7ydrf6sfgtx7qued7qd56nhc@2xol3grm5re7>
In-Reply-To: <lfdhib6a7ct36nmj3of2setjft7ydrf6sfgtx7qued7qd56nhc@2xol3grm5re7>
From: =?UTF-8?B?5pu55L+K5p2w?= <caojunjie650@gmail.com>
Date: Mon, 13 Oct 2025 09:53:18 +0800
X-Gm-Features: AS18NWCXgZGcIsMOlZRhCMOrt21hgF7Nu9A3rD70J3JwS3-UfBSVjAvvGwnrsc8
Message-ID: <CAK6c68gLfH63Ywv_sP3YkHngihc4vscpdFrehj6uRfwEL=ZAfQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/panel: Add Novatek NT36532 panel driver
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
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
Content-Type: multipart/alternative; boundary="000000000000c2c4b706410088f4"
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

--000000000000c2c4b706410088f4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

>Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2025=E5=B9=
=B410=E6=9C=882=E6=97=A5=E5=91=A8=E5=9B=9B 10:05=E5=86=99=E9=81=93=EF=BC=9A
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

--000000000000c2c4b706410088f4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">&gt;Dmitry Baryshkov &lt;<a href=3D"mailto:dmitry.baryshko=
v@oss.qualcomm.com">dmitry.baryshkov@oss.qualcomm.com</a>&gt; =E4=BA=8E2025=
=E5=B9=B410=E6=9C=882=E6=97=A5=E5=91=A8=E5=9B=9B 10:05=E5=86=99=E9=81=93=EF=
=BC=9A<br>&gt;On Wed, Oct 01, 2025 at 09:59:14PM +0800, Junjie Cao wrote:<b=
r>&gt;&gt; Add a driver for panels using the Novatek NT36532 Display Driver=
 IC,<br>&gt;&gt; including support for the CSOT PPC100HB1-1, found in the O=
nePlus Pad 2<br>&gt;&gt; tablets.<br>&gt;&gt;<br>&gt;&gt; Signed-off-by: Ju=
njie Cao &lt;<a href=3D"mailto:caojunjie650@gmail.com">caojunjie650@gmail.c=
om</a>&gt;<br>&gt;&gt; ---<br>&gt;&gt; =C2=A0MAINTAINERS =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 7 +<br>&gt;&gt; =C2=A0drivers/gpu/drm/=
panel/Kconfig =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=
=A010 +<br>&gt;&gt; =C2=A0drivers/gpu/drm/panel/Makefile =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 1 +<br>&gt;&gt; =C2=A0driver=
s/gpu/drm/panel/panel-novatek-nt36532.c | 437 ++++++++++++++++++<br>&gt;&gt=
; =C2=A04 files changed, 455 insertions(+)<br>&gt;&gt; =C2=A0create mode 10=
0644 drivers/gpu/drm/panel/panel-novatek-nt36532.c<br>&gt;&gt;<br>&gt;&gt; =
+<br>&gt;&gt; +static const struct panel_info csot_panel_info =3D {<br>&gt;=
&gt; + =C2=A0 =C2=A0 .width_mm =3D 250,<br>&gt;&gt; + =C2=A0 =C2=A0 .height=
_mm =3D 177,<br>&gt;&gt; + =C2=A0 =C2=A0 .lanes =3D 4,<br>&gt;&gt; + =C2=A0=
 =C2=A0 .format =3D MIPI_DSI_FMT_RGB888,<br>&gt;&gt; + =C2=A0 =C2=A0 .mode_=
flags =3D MIPI_DSI_MODE_VIDEO | MIPI_DSI_CLOCK_NON_CONTINUOUS |<br>&gt;&gt;=
 + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MIPI_DSI_=
MODE_LPM,<br>&gt;&gt; + =C2=A0 =C2=A0 .display_mode =3D csot_display_mode,<=
br>&gt;&gt; + =C2=A0 =C2=A0 .dsc_slice_per_pkt =3D 2,<br>&gt;<br>&gt;As thi=
s is not a part of the standard, what if the DSI host doesn&#39;t<br>&gt;su=
pport this feature?<br>&gt;<br><br>Without it, parameters will not be calcu=
lated correctly, garbled then.<br><br>&gt;&gt; + =C2=A0 =C2=A0 .dsc_cfg =3D=
 &amp;csot_dsc_cfg,<br>&gt;&gt; + =C2=A0 =C2=A0 .init_sequence =3D csot_ini=
t_sequence,<br>&gt;&gt; + =C2=A0 =C2=A0 .is_dual_dsi =3D true,<br>&gt;&gt; =
+};<br>&gt;&gt; +<br>&gt;<br>&gt;-- <br>&gt;With best wishes<br>&gt;Dmitry =
<br><br>Regards,<br>Junjie</div>

--000000000000c2c4b706410088f4--
