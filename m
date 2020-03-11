Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8F7181A14
	for <lists+dri-devel@lfdr.de>; Wed, 11 Mar 2020 14:45:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9E266E426;
	Wed, 11 Mar 2020 13:45:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 029786E426
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 13:45:10 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8645020873
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 13:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1583934309;
 bh=Wn5k1ry5C0LknHTCb1r+lmW5qjLJi/Km5rBu6nKU/DM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=EjJtNO+WtNcMI5F516716ActFEGYsdUf25iBi06MWgwONNjnm2vaeOdknb+FuYyeB
 lB7PhRIXjsUGd0caawvgtVVLjrIo3tGE3bef+PQdU94eD4tx4HXauaK9d/yq9nXX5B
 zIEYQ2t6kXrFg+xZ5ip0Bh2VVEKhKS2VCa5uKJd0=
Received: by mail-ed1-f50.google.com with SMTP id z65so2972899ede.0
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 06:45:09 -0700 (PDT)
X-Gm-Message-State: ANhLgQ0iwiqUFhEKazTIdA5ZjkXRTz8AHpRaDRFskvnc+0F7fZHtuEN/
 z/7DGsYSRe5O4f9gSBo2btKMbQOeYHB2AKCilQ==
X-Google-Smtp-Source: ADFU+vuacDZ/28xyFG455HVvKqMjgCIYXWjiXBR/xorBP6OhEDiB0U7ExzCC3P3h5cZFGvnl8NoG3rnj/TmO9xYIObA=
X-Received: by 2002:a17:906:6bc9:: with SMTP id
 t9mr2535634ejs.206.1583934307922; 
 Wed, 11 Mar 2020 06:45:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200311071823.117899-1-jitao.shi@mediatek.com>
 <20200311071823.117899-3-jitao.shi@mediatek.com>
In-Reply-To: <20200311071823.117899-3-jitao.shi@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 11 Mar 2020 21:44:55 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9D+piEumzeX0Our8SO8RXaD5R_KerSCKgWA=Y=p5XEXQ@mail.gmail.com>
Message-ID: <CAAOTY_9D+piEumzeX0Our8SO8RXaD5R_KerSCKgWA=Y=p5XEXQ@mail.gmail.com>
Subject: Re: [PATCH v13 2/6] dt-bindings: display: mediatek: control dpi pins
 mode to avoid leakage
To: Jitao Shi <jitao.shi@mediatek.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 srv_heupstream@mediatek.com, David Airlie <airlied@linux.ie>,
 huijuan.xie@mediatek.com, stonea168@163.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, cawa.cheng@mediatek.com,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, yingjoe.chen@mediatek.com,
 eddie.huang@mediatek.com, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============1961402493=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1961402493==
Content-Type: multipart/alternative; boundary="000000000000c5815705a094712e"

--000000000000c5815705a094712e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Jitao Shi <jitao.shi@mediatek.com> =E6=96=BC 2020=E5=B9=B43=E6=9C=8811=E6=
=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=883:18=E5=AF=AB=E9=81=93=EF=BC=9A

> Add property "pinctrl-names" to swap pin mode between gpio and dpi mode.
> Set
> the dpi pins to gpio mode and output-low to avoid leakage current when dp=
i
> disabled.
>

Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>


>
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,dpi.txt  | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt
> index 58914cf681b8..260ae75ac640 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt
> @@ -17,6 +17,10 @@ Required properties:
>    Documentation/devicetree/bindings/graph.txt. This port should be
> connected
>    to the input port of an attached HDMI or LVDS encoder chip.
>
> +Optional properties:
> +- pinctrl-names: Contain "default" and "sleep".
> +  pinctrl-names see
> Documentation/devicetree/bindings/pinctrlpinctrl-bindings.txt
> +
>  Example:
>
>  dpi0: dpi@1401d000 {
> @@ -27,6 +31,9 @@ dpi0: dpi@1401d000 {
>                  <&mmsys CLK_MM_DPI_ENGINE>,
>                  <&apmixedsys CLK_APMIXED_TVDPLL>;
>         clock-names =3D "pixel", "engine", "pll";
> +       pinctrl-names =3D "default", "sleep";
> +       pinctrl-0 =3D <&dpi_pin_func>;
> +       pinctrl-1 =3D <&dpi_pin_idle>;
>
>         port {
>                 dpi0_out: endpoint {
> --
> 2.21.0
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>

--000000000000c5815705a094712e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=
=3D"gmail_quote"><div class=3D"gmail_attr" dir=3D"ltr">Jitao Shi &lt;<a hre=
f=3D"mailto:jitao.shi@mediatek.com">jitao.shi@mediatek.com</a>&gt; =E6=96=
=BC 2020=E5=B9=B43=E6=9C=8811=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=
=883:18=E5=AF=AB=E9=81=93=EF=BC=9A<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;padding-left:1ex;border-left-color:rgb=
(204,204,204);border-left-width:1px;border-left-style:solid">Add property &=
quot;pinctrl-names&quot; to swap pin mode between gpio and dpi mode. Set<br=
>
the dpi pins to gpio mode and output-low to avoid leakage current when dpi<=
br>
disabled.<br></blockquote><div><br></div><div><span style=3D"text-align:lef=
t;color:rgb(34,34,34);text-transform:none;text-indent:0px;letter-spacing:no=
rmal;font-family:Arial,Helvetica,sans-serif;font-size:13.33px;font-style:no=
rmal;font-variant:normal;font-weight:400;text-decoration:none;word-spacing:=
0px;display:inline;white-space:normal;float:none;background-color:rgb(255,2=
55,255)">Reviewed-by: Chun-Kuang Hu &lt;</span><a style=3D"text-align:left;=
color:rgb(17,85,204);text-transform:none;text-indent:0px;letter-spacing:nor=
mal;font-family:Arial,Helvetica,sans-serif;font-size:13.33px;font-style:nor=
mal;font-variant:normal;font-weight:400;text-decoration:underline;word-spac=
ing:0px;white-space:normal" href=3D"mailto:chunkuang.hu@kernel.org" target=
=3D"_blank">chunkuang.hu@kernel.org</a><span style=3D"text-align:left;color=
:rgb(34,34,34);text-transform:none;text-indent:0px;letter-spacing:normal;fo=
nt-family:Arial,Helvetica,sans-serif;font-size:13.33px;font-style:normal;fo=
nt-variant:normal;font-weight:400;text-decoration:none;word-spacing:0px;dis=
play:inline;white-space:normal;float:none;background-color:rgb(255,255,255)=
">&gt;</span><b></b><i></i><u></u><sub></sub><sup></sup><strike></strike><b=
r></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;padding-left:1ex;border-left-color:rgb(204,204,204);borde=
r-left-width:1px;border-left-style:solid">
<br>
Signed-off-by: Jitao Shi &lt;<a href=3D"mailto:jitao.shi@mediatek.com" targ=
et=3D"_blank">jitao.shi@mediatek.com</a>&gt;<br>
---<br>
=C2=A0.../devicetree/bindings/display/mediatek/mediatek,dpi.txt=C2=A0 | 7 +=
++++++<br>
=C2=A01 file changed, 7 insertions(+)<br>
<br>
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dp=
i.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt=
<br>
index 58914cf681b8..260ae75ac640 100644<br>
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt<b=
r>
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt<b=
r>
@@ -17,6 +17,10 @@ Required properties:<br>
=C2=A0 =C2=A0Documentation/devicetree/bindings/graph.txt. This port should =
be connected<br>
=C2=A0 =C2=A0to the input port of an attached HDMI or LVDS encoder chip.<br=
>
<br>
+Optional properties:<br>
+- pinctrl-names: Contain &quot;default&quot; and &quot;sleep&quot;.<br>
+=C2=A0 pinctrl-names see Documentation/devicetree/bindings/pinctrlpinctrl-=
bindings.txt<br>
+<br>
=C2=A0Example:<br>
<br>
=C2=A0dpi0: dpi@1401d000 {<br>
@@ -27,6 +31,9 @@ dpi0: dpi@1401d000 {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;&amp;mmsy=
s CLK_MM_DPI_ENGINE&gt;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;&amp;apmi=
xedsys CLK_APMIXED_TVDPLL&gt;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 clock-names =3D &quot;pixel&quot;, &quot;engine=
&quot;, &quot;pll&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pinctrl-names =3D &quot;default&quot;, &quot;sl=
eep&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pinctrl-0 =3D &lt;&amp;dpi_pin_func&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pinctrl-1 =3D &lt;&amp;dpi_pin_idle&gt;;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 port {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dpi0_out: endpoint =
{<br>
-- <br>
2.21.0<br>
_______________________________________________<br>
dri-devel mailing list<br>
<a href=3D"mailto:dri-devel@lists.freedesktop.org" target=3D"_blank">dri-de=
vel@lists.freedesktop.org</a><br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/dri-devel" target=
=3D"_blank" rel=3D"noreferrer">https://lists.freedesktop.org/mailman/listin=
fo/dri-devel</a><br>
</blockquote></div></div></div>

--000000000000c5815705a094712e--

--===============1961402493==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1961402493==--
