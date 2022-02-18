Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 575A44BB605
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 10:59:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2997510EEC0;
	Fri, 18 Feb 2022 09:59:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C167010EEB0
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Feb 2022 09:59:32 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id m185so6870406iof.10
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Feb 2022 01:59:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7O1v2qVHfrO8PlZlp65qxq56cQUinZYatDoYBCnsJo0=;
 b=US2wEflZclbrZRBy2d9aLhNQ5IT9O1T8X5bCH2KhikqN/oLs2/Dbe+0oIQ/laSJb0b
 GfDtEA7P9/Xci6bWeBGxfztzlsaRsJWpdmo90LbL4gux+50zf/O52ebR74Ty9pFQW3dB
 P3Lc1CTBRx99xggatLZw9IjG0XVTabxkwCIuQTQ9KdZyYen4y/LwfFLYYUoqVTA0IRH0
 Jf9YFdvPtKT8ipGL80FFC1RD9Q+9vDvzgKzmvKn8n/iPGrQFcCIdgwjH2wtF1jHh8cb8
 09Z2p1lX8oa2kjLuti5fpcnlodgpS0rEgCwJ5mzhaKYKjjMyJOu+HEkoh9UAYsStrMwg
 RDAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7O1v2qVHfrO8PlZlp65qxq56cQUinZYatDoYBCnsJo0=;
 b=r+vpiSuWNpcf763GeZaP0K+i5tjaPZJlMHfKeDskpIF9XsOUj4l1pFZfiTjahr6jF+
 twf6nwSf0Cz8FuiqeVTrxP/71015+c2kRPf5FOOgWyBgp/DgqKgTEYqxA5ROGci/KZga
 OYTPjZeOt8/RR2dq5+VjyLtGZ1G2oN2lyiKlLUQB/wetyQs882sJyM6VN804+sG5IZDT
 pugCir2dBvWVqhMHErloExS/pqgLVRNfpfb4UiMyFe0dxILfsEUiImvMup6RSllcDsD5
 /bLAToJoRvVszvifJkCQerHuly2yc78ziG1Nc3yv5sjf3+Y4GeBBRY7x5QdGAnvmp/XH
 TmYw==
X-Gm-Message-State: AOAM531OHFLBFfNnYp0GH3H39Qsvr0bQum3kM7B5OdcLy8MhwEPIcZ87
 lZlfXGdu1pV6BqutpkrAb4YCujxypf5jykxBxFw=
X-Google-Smtp-Source: ABdhPJwJd5ZvZ8AFWmzJi7s/gPga3rqI8O5Yd3dew7dOi4ggbUz4b1PXGwJGJhNy/tZEfj2MkXbNGnG5L1EAuhZlEAw=
X-Received: by 2002:a05:6602:1409:b0:5e7:487:133c with SMTP id
 t9-20020a056602140900b005e70487133cmr4993222iov.196.1645178371778; Fri, 18
 Feb 2022 01:59:31 -0800 (PST)
MIME-Version: 1.0
References: <20220218094417.1631559-1-rexnie3@gmail.com>
In-Reply-To: <20220218094417.1631559-1-rexnie3@gmail.com>
From: Rex Nie <rexnie3@gmail.com>
Date: Fri, 18 Feb 2022 17:59:21 +0800
Message-ID: <CAG+K-_+txzJ2F9LONj_i3icqXFmn9byhUjJtu7N-xeY-5UKizQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/panel-edp: Add eDP innolux panel support
To: linux-arm-kernel@lists.infradead.org
Content-Type: multipart/alternative; boundary="000000000000712c6d05d847f085"
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
Cc: devicetree@vger.kernel.org,
 Daocai Nie <niedaocai@huaqin.corp-partner.google.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000712c6d05d847f085
Content-Type: text/plain; charset="UTF-8"

Add hsinyi@chromium.org to cc list

On Fri, 18 Feb 2022 at 17:44, Rex Nie <rexnie3@gmail.com> wrote:

> From: Daocai Nie <niedaocai@huaqin.corp-partner.google.com>
>
> Add support for the 14" innolux,n140hca-eac eDP panel.
>
> Signed-off-by: Daocai Nie <niedaocai@huaqin.corp-partner.google.com>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>
> diff --git a/drivers/gpu/drm/panel/panel-edp.c
> b/drivers/gpu/drm/panel/panel-edp.c
> index f7bfcf63d48e..f5f9c9cb26ba 100644
> --- a/drivers/gpu/drm/panel/panel-edp.c
> +++ b/drivers/gpu/drm/panel/panel-edp.c
> @@ -1330,6 +1330,29 @@ static const struct panel_desc innolux_n125hce_gn1
> = {
>         },
>  };
>
> +static const struct display_timing innolux_n140hca_eac_timing = {
> +       .pixelclock = { 72600000, 76420000, 80240000 },
> +       .hactive = { 1920, 1920, 1920 },
> +       .hfront_porch = { 80, 80, 80 },
> +       .hback_porch = { 190, 190, 190 },
> +       .hsync_len = { 60, 60, 60 },
> +       .vactive = { 1080, 1080, 1080 },
> +       .vfront_porch = { 6, 6, 6 },
> +       .vback_porch = { 38, 38, 38 },
> +       .vsync_len = { 8, 8, 8 },
> +       .flags = DISPLAY_FLAGS_VSYNC_LOW | DISPLAY_FLAGS_HSYNC_LOW,
> +};
> +
> +static const struct panel_desc innolux_n140hca_eac = {
> +       .timings = &innolux_n140hca_eac_timing,
> +       .num_timings = 1,
> +       .bpc = 6,
> +       .size = {
> +               .width = 309,
> +               .height = 174,
> +       },
> +};
> +
>  static const struct drm_display_mode innolux_p120zdg_bf1_mode = {
>         .clock = 206016,
>         .hdisplay = 2160,
> @@ -1750,6 +1773,9 @@ static const struct of_device_id platform_of_match[]
> = {
>         }, {
>                 .compatible = "innolux,n125hce-gn1",
>                 .data = &innolux_n125hce_gn1,
> +       }, {
> +               .compatible = "innolux,n140hca-eac",
> +               .data = &innolux_n140hca_eac,
>         }, {
>                 .compatible = "innolux,p120zdg-bf1",
>                 .data = &innolux_p120zdg_bf1,
> --
> 2.25.1
>
>

--000000000000712c6d05d847f085
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Add=C2=A0<span style=3D"background-color:transparent;font-=
size:1em;font-family:Roboto,sans-serif;color:rgb(32,33,36)"><a href=3D"mail=
to:hsinyi@chromium.org">hsinyi@chromium.org</a> to cc list</span></div><br>=
<div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, 18=
 Feb 2022 at 17:44, Rex Nie &lt;<a href=3D"mailto:rexnie3@gmail.com">rexnie=
3@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">From: Daocai Nie &lt;<a href=3D"mailto:niedaocai@huaqin.corp-par=
tner.google.com" target=3D"_blank">niedaocai@huaqin.corp-partner.google.com=
</a>&gt;<br>
<br>
Add support for the 14&quot; innolux,n140hca-eac eDP panel.<br>
<br>
Signed-off-by: Daocai Nie &lt;<a href=3D"mailto:niedaocai@huaqin.corp-partn=
er.google.com" target=3D"_blank">niedaocai@huaqin.corp-partner.google.com</=
a>&gt;<br>
---<br>
=C2=A0drivers/gpu/drm/panel/panel-edp.c | 26 ++++++++++++++++++++++++++<br>
=C2=A01 file changed, 26 insertions(+)<br>
<br>
diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/pane=
l-edp.c<br>
index f7bfcf63d48e..f5f9c9cb26ba 100644<br>
--- a/drivers/gpu/drm/panel/panel-edp.c<br>
+++ b/drivers/gpu/drm/panel/panel-edp.c<br>
@@ -1330,6 +1330,29 @@ static const struct panel_desc innolux_n125hce_gn1 =
=3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
=C2=A0};<br>
<br>
+static const struct display_timing innolux_n140hca_eac_timing =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.pixelclock =3D { 72600000, 76420000, 80240000 =
},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.hactive =3D { 1920, 1920, 1920 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.hfront_porch =3D { 80, 80, 80 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.hback_porch =3D { 190, 190, 190 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.hsync_len =3D { 60, 60, 60 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.vactive =3D { 1080, 1080, 1080 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.vfront_porch =3D { 6, 6, 6 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.vback_porch =3D { 38, 38, 38 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.vsync_len =3D { 8, 8, 8 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.flags =3D DISPLAY_FLAGS_VSYNC_LOW | DISPLAY_FL=
AGS_HSYNC_LOW,<br>
+};<br>
+<br>
+static const struct panel_desc innolux_n140hca_eac =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.timings =3D &amp;innolux_n140hca_eac_timing,<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.num_timings =3D 1,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.bpc =3D 6,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.size =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.width =3D 309,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.height =3D 174,<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
+};<br>
+<br>
=C2=A0static const struct drm_display_mode innolux_p120zdg_bf1_mode =3D {<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .clock =3D 206016,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .hdisplay =3D 2160,<br>
@@ -1750,6 +1773,9 @@ static const struct of_device_id platform_of_match[] =
=3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }, {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .compatible =3D &qu=
ot;innolux,n125hce-gn1&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .data =3D &amp;inno=
lux_n125hce_gn1,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}, {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.compatible =3D &qu=
ot;innolux,n140hca-eac&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.data =3D &amp;inno=
lux_n140hca_eac,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }, {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .compatible =3D &qu=
ot;innolux,p120zdg-bf1&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .data =3D &amp;inno=
lux_p120zdg_bf1,<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div>

--000000000000712c6d05d847f085--
