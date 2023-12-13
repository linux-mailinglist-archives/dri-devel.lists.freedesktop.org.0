Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F238122BF
	for <lists+dri-devel@lfdr.de>; Thu, 14 Dec 2023 00:22:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA92810E86A;
	Wed, 13 Dec 2023 23:22:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x92e.google.com (mail-ua1-x92e.google.com
 [IPv6:2607:f8b0:4864:20::92e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C7A510E86A
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Dec 2023 23:22:08 +0000 (UTC)
Received: by mail-ua1-x92e.google.com with SMTP id
 a1e0cc1a2514c-7c500dcdd7dso1203154241.1
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Dec 2023 15:22:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702509727; x=1703114527; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5aYZjGaxZTeHu+LYtDvN8p6H+vdhqyvWMzPG0M4oJ0Q=;
 b=fpvqV2WG8fraVML7ciT4kIotFt4zgCm+Mc7Ql0FMRzOm8JOJM/X805ouPmPFo+mO9E
 Grvvks9ST4oP5JUS8JyfdKBMzmp4wKJSjh5RdPmB97IV7Wrc1XhjM6qJrcjNwp0UylA2
 Kg80JA2s7qxksKTGnSo3VYqPp5/GikHAiYOUx5bBLBNJ/KVBB7rNeU7/JX+Dy0rzFNo5
 XZ6FgHKPG1BgN97C0hhLNTViPDXhYL5/SevAvM2P+U8QS7p6mvnqLEAEf14wxADAhIp+
 eWPb5xirUDHMciziHv9vq+3y0p01KSfVtYfjKKMXhpmfevMT8Zi1uGDuD6Gt5h9+x0WF
 50NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702509727; x=1703114527;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5aYZjGaxZTeHu+LYtDvN8p6H+vdhqyvWMzPG0M4oJ0Q=;
 b=LC4x175bM4Hb4F0kwj5oeAKc1iXGnulcY3zMFpPWmu1WdZ3aI6YHM2QfX0fyblSGol
 3tVIzEZgnDW+j9J8T3E8x6evDm7u4Lb68g2CKOpBiaOBVzJzisDzBL+vzf+26LjaCSEe
 p0x9SaFZECCoyaiGU1Fn4x6HmTO2XWgF/0o/sMl1Gc0q1HtzjsjR9+6enjfiWa5C2cwq
 18M8pCGZgvYppkqlRy0+g/owKzH+g8c/oGRnZaQgxt2tk4E3Rx9jgJ7X60RgzhlWiquu
 h8owcGwyK9jULNmcd9ib3jUYNNccGa6j49wKZ7tF/iEap0JQI+Uaun/KIQRd0qxAvMN7
 7mAA==
X-Gm-Message-State: AOJu0Ywj1cgAJl0cNAaXnFEUUFUK82CFEgqNYKuRLaZCIvcVO0sYugi8
 ytaPrpb9EAIo593s12WYhpSPfALQa+nBxkJlkk8=
X-Google-Smtp-Source: AGHT+IF2oIpSTYUBVGgW8A7cLbUXQSRTqjGbV2qhVwnlrHQLZzJJqVrIx1ZlJ20YIpFWDk/qTgg1XvSt0E13N7/7rl0=
X-Received: by 2002:a05:6102:370e:b0:466:991:7bf with SMTP id
 s14-20020a056102370e00b00466099107bfmr3826666vst.13.1702509727217; Wed, 13
 Dec 2023 15:22:07 -0800 (PST)
MIME-Version: 1.0
References: <20231213224201.2191358-1-robh@kernel.org>
In-Reply-To: <20231213224201.2191358-1-robh@kernel.org>
From: Inki Dae <daeinki@gmail.com>
Date: Thu, 14 Dec 2023 08:21:55 +0900
Message-ID: <CAAQKjZNutk5GYUJ7u-X3fctMiNLJHYU60NVU8N-APzJh5MZ49A@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: display: samsung,
 exynos-mixer: Fix 'regs' typo
To: Rob Herring <robh@kernel.org>
Content-Type: multipart/alternative; boundary="0000000000008481be060c6c6fd3"
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-samsung-soc@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Alim Akhtar <alim.akhtar@samsung.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--0000000000008481be060c6c6fd3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2023=EB=85=84 12=EC=9B=94 14=EC=9D=BC (=EB=AA=A9) =EC=98=A4=EC=A0=84 7:43, =
Rob Herring <robh@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:

> The correct property name is 'reg' not 'regs'.
>

Thanks,
Inki Dae


> Fixes: 68e89bb36d58 ("dt-bindings: display: samsung,exynos-mixer: convert
> to dtschema")
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../bindings/display/samsung/samsung,exynos-mixer.yaml      | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git
> a/Documentation/devicetree/bindings/display/samsung/samsung,exynos-mixer.=
yaml
> b/Documentation/devicetree/bindings/display/samsung/samsung,exynos-mixer.=
yaml
> index 25d53fde92e1..597c9cc6a312 100644
> ---
> a/Documentation/devicetree/bindings/display/samsung/samsung,exynos-mixer.=
yaml
> +++
> b/Documentation/devicetree/bindings/display/samsung/samsung,exynos-mixer.=
yaml
> @@ -85,7 +85,7 @@ allOf:
>          clocks:
>            minItems: 6
>            maxItems: 6
> -        regs:
> +        reg:
>            minItems: 2
>            maxItems: 2
>
> @@ -99,7 +99,7 @@ allOf:
>          clocks:
>            minItems: 4
>            maxItems: 4
> -        regs:
> +        reg:
>            minItems: 2
>            maxItems: 2
>
> @@ -116,7 +116,7 @@ allOf:
>          clocks:
>            minItems: 3
>            maxItems: 3
> -        regs:
> +        reg:
>            minItems: 1
>            maxItems: 1
>
> --
> 2.43.0
>
>
>

--0000000000008481be060c6c6fd3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">2023=EB=85=84 12=EC=9B=94 14=EC=9D=BC (=EB=AA=A9) =EC=
=98=A4=EC=A0=84 7:43, Rob Herring &lt;<a href=3D"mailto:robh@kernel.org">ro=
bh@kernel.org</a>&gt;=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex">The correct property name is &#39;reg&#39; not &#3=
9;regs&#39;.<br></blockquote></div></div><div dir=3D"auto"><br></div><div d=
ir=3D"auto">Thanks,</div><div dir=3D"auto">Inki Dae</div><div dir=3D"auto">=
<br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex"><br>
Fixes: 68e89bb36d58 (&quot;dt-bindings: display: samsung,exynos-mixer: conv=
ert to dtschema&quot;)<br>
Signed-off-by: Rob Herring &lt;<a href=3D"mailto:robh@kernel.org" target=3D=
"_blank" rel=3D"noreferrer">robh@kernel.org</a>&gt;<br>
---<br>
=C2=A0.../bindings/display/samsung/samsung,exynos-mixer.yaml=C2=A0 =C2=A0 =
=C2=A0 | 6 +++---<br>
=C2=A01 file changed, 3 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/Documentation/devicetree/bindings/display/samsung/samsung,exyn=
os-mixer.yaml b/Documentation/devicetree/bindings/display/samsung/samsung,e=
xynos-mixer.yaml<br>
index 25d53fde92e1..597c9cc6a312 100644<br>
--- a/Documentation/devicetree/bindings/display/samsung/samsung,exynos-mixe=
r.yaml<br>
+++ b/Documentation/devicetree/bindings/display/samsung/samsung,exynos-mixe=
r.yaml<br>
@@ -85,7 +85,7 @@ allOf:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0clocks:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0minItems: 6<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0maxItems: 6<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 regs:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 reg:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0minItems: 2<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0maxItems: 2<br>
<br>
@@ -99,7 +99,7 @@ allOf:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0clocks:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0minItems: 4<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0maxItems: 4<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 regs:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 reg:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0minItems: 2<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0maxItems: 2<br>
<br>
@@ -116,7 +116,7 @@ allOf:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0clocks:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0minItems: 3<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0maxItems: 3<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 regs:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 reg:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0minItems: 1<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0maxItems: 1<br>
<br>
-- <br>
2.43.0<br>
<br>
<br>
</blockquote></div></div></div>

--0000000000008481be060c6c6fd3--
