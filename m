Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A748C0BAD
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2024 08:48:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2E5610E415;
	Thu,  9 May 2024 06:48:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="pYRcus9t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7C3210E415
 for <dri-devel@lists.freedesktop.org>; Thu,  9 May 2024 06:48:51 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-56e6affdd21so2333a12.3
 for <dri-devel@lists.freedesktop.org>; Wed, 08 May 2024 23:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1715237330; x=1715842130;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=tKq4hwVfPdaycsB8dzxPI8WbJC5g/z/RtOOnld2fAao=;
 b=pYRcus9tpxIgro+uuGO+Xwklb5FgTjfiRkWWHE/1ZAZsrll1F9cM8agdJlaWmslBhF
 m0abGNAf8NMIYXQz2f9q8ihhEBkLBW9IQ55f9SYhLrVz97UY3yDMNHHl1qn1l8797MpC
 KDiHzZWoL9frSjUuDmiDt0WulfYKuG7JLRP2CVxpsoKrYAo0xAA+WrZ0T2BlchIk3vc2
 k/OtjrGEMuNfGqhhYVby2fbgN4nAA4Lv0oTWogsxNcRlypLFZQVI6VeybO5o79/sjmmz
 ixHP8044RK6YqAKRRmm4uqqdqiL6E5Zcsjlz/dmGKDNr9sPEIVyp9TMr2PeNtbTKEovR
 a9Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715237330; x=1715842130;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tKq4hwVfPdaycsB8dzxPI8WbJC5g/z/RtOOnld2fAao=;
 b=eacRt/qCptkNWIMct2nHcDxE+nwR+EEJxoLZ5xGDl1xBR+zc2CzkJnUJYkaVLSMAeL
 GBhgX6QIK39x63F4IULCY1+oCgVgwGD84WwmsLhoISeS8wmq/gxIM4Ta32RTxhGm+YAf
 WOFesABIaeLSnaJ4tb8wmQyPkn0KHbJ6Ja47WpSejohnd30hLojJzvyGS+MV2B94paTH
 m153EyGVx7M730vhK0D9GdyXVgmXFhqVMZPralv6yFPlENmRgMxP1IhTmENXWOPQlxJf
 ZpIT2ilLUOV2qZKfAYlMASJ5VeBXOAIdRQZJp/3MgPxT43TDHnu69B4TzHatKjpceo/r
 f9Uw==
X-Gm-Message-State: AOJu0YwnZhSYi3yuApCh9nuSVER6rxAFk6Vq26ew60sQEWBlTnP8HjkK
 kM4BBSYheT1AeVP9m3kz2DI8ilbJXlUSumEkC7M6Jqv170ODb0se2JEYVrItsXkVo02aUcw1Pe6
 H9+arTxyWVnn7pPIA6r8IfP9RKs8vTnJzv3adsg==
X-Google-Smtp-Source: AGHT+IE/HopidQZX5LfwQ1RKEGFH89Z31UAlcOVS1L+YO7ZbwnAvkGf507Rj4u9Avobd34XOUr2zj/X+HSbxqbGcIXM=
X-Received: by 2002:a50:a6db:0:b0:570:5b70:3407 with SMTP id
 4fb4d7f45d1cf-5731d9b5f4cmr3876817a12.10.1715237329863; Wed, 08 May 2024
 23:48:49 -0700 (PDT)
MIME-Version: 1.0
References: <20240509064336.9803-1-lvzhaoxiong@huaqin.corp-partner.google.com>
In-Reply-To: <20240509064336.9803-1-lvzhaoxiong@huaqin.corp-partner.google.com>
From: zhaoxiong lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Date: Thu, 9 May 2024 14:48:38 +0800
Message-ID: <CA+6=WdQm+z+7Sk9wL-rD42mU1ek=Z2ydHRN-RZdYTFiFh_UXJw@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] dt-bindings: input: i2c-hid: Introduce Ilitek
 ili2900
To: dmitry.torokhov@gmail.com, robh@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, jikos@kernel.org, 
 benjamin.tissoires@redhat.co, dianders@google.com, hsinyi@google.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Content-Type: multipart/alternative; boundary="000000000000c09ee50617ffcf93"
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

--000000000000c09ee50617ffcf93
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

hi all
Sorry, there is a problem with this patch, please ignore this email.


On Thu, May 9, 2024 at 2:43=E2=80=AFPM Zhaoxiong Lv <
lvzhaoxiong@huaqin.corp-partner.google.com> wrote:

> From: lvzhaoxiong <lvzhaoxiong@huaqin.corp-partner.google.com>
>
> The ili2900 touch screen chip same as ilitek ili9882t controller
> has a reset gpio.
>
> Signed-off-by: lvzhaoxiong <lvzhaoxiong@huaqin.corp-partner.google.com>
> ---
>  Documentation/devicetree/bindings/input/ilitek,ili9882t.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/input/ilitek,ili9882t.yaml
> b/Documentation/devicetree/bindings/input/ilitek,ili9882t.yaml
> index c5d9e0e919f9..5063ea2c8375 100644
> --- a/Documentation/devicetree/bindings/input/ilitek,ili9882t.yaml
> +++ b/Documentation/devicetree/bindings/input/ilitek,ili9882t.yaml
> @@ -19,6 +19,7 @@ allOf:
>  properties:
>    compatible:
>      const: ilitek,ili9882t
> +    const: ilitek,ili2900
>
>    reg:
>      const: 0x41
> --
> 2.17.1
>
>

--000000000000c09ee50617ffcf93
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">hi all <br>Sorry, there is a problem with this patch, plea=
se ignore this email.<br><div><br></div></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, May 9, 2024 at 2:43=E2=80=
=AFPM Zhaoxiong Lv &lt;<a href=3D"mailto:lvzhaoxiong@huaqin.corp-partner.go=
ogle.com">lvzhaoxiong@huaqin.corp-partner.google.com</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">From: lvzhaoxiong &lt;<=
a href=3D"mailto:lvzhaoxiong@huaqin.corp-partner.google.com" target=3D"_bla=
nk">lvzhaoxiong@huaqin.corp-partner.google.com</a>&gt;<br>
<br>
The ili2900 touch screen chip same as ilitek ili9882t controller<br>
has a reset gpio.<br>
<br>
Signed-off-by: lvzhaoxiong &lt;<a href=3D"mailto:lvzhaoxiong@huaqin.corp-pa=
rtner.google.com" target=3D"_blank">lvzhaoxiong@huaqin.corp-partner.google.=
com</a>&gt;<br>
---<br>
=C2=A0Documentation/devicetree/bindings/input/ilitek,ili9882t.yaml | 1 +<br=
>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/Documentation/devicetree/bindings/input/ilitek,ili9882t.yaml b=
/Documentation/devicetree/bindings/input/ilitek,ili9882t.yaml<br>
index c5d9e0e919f9..5063ea2c8375 100644<br>
--- a/Documentation/devicetree/bindings/input/ilitek,ili9882t.yaml<br>
+++ b/Documentation/devicetree/bindings/input/ilitek,ili9882t.yaml<br>
@@ -19,6 +19,7 @@ allOf:<br>
=C2=A0properties:<br>
=C2=A0 =C2=A0compatible:<br>
=C2=A0 =C2=A0 =C2=A0const: ilitek,ili9882t<br>
+=C2=A0 =C2=A0 const: ilitek,ili2900<br>
<br>
=C2=A0 =C2=A0reg:<br>
=C2=A0 =C2=A0 =C2=A0const: 0x41<br>
-- <br>
2.17.1<br>
<br>
</blockquote></div>

--000000000000c09ee50617ffcf93--
