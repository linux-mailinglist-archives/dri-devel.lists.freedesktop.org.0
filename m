Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 781C158A725
	for <lists+dri-devel@lfdr.de>; Fri,  5 Aug 2022 09:32:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E45B1B2244;
	Fri,  5 Aug 2022 07:27:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com
 [IPv6:2001:4860:4864:20::2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C449B3AE9
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Aug 2022 07:16:03 +0000 (UTC)
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-10ee900cce0so2090185fac.5
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Aug 2022 00:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=ovB7MatHQY+pIQ6dwZXhcfMbfKrhGH7HsUp3BhCPYZs=;
 b=qVOpVBEOmg7dUHYCEttkdQxoHX3jk72+88CGsASJC+uhZA64nRG4z6ZHZ5Kbfi1T9Z
 vPJ9Y9TbUzLt42oNt1I62tsb7em8a3LrXKNjnwqFR7qisZ6fIvTrvNLOW8edCXWPtFG0
 BBtHOs7Xlit2WilSp8yKE7m4Rwb3C6cqjuN/M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=ovB7MatHQY+pIQ6dwZXhcfMbfKrhGH7HsUp3BhCPYZs=;
 b=G0tqP9jRVo3eT92YuK0kVsYsutTkMmye1yuBGxzUQQuUzQ2fTPlbJd0v1BVQif86h4
 ro8kzyaIOsjrzLwrLwRBOwjsEIGneiLRR2vIrpdzZL4vIRkc4x8JfrrUtRaETTjfU9+U
 7OzhEQf/sNPGr5Vza+diaYhvbS4sFVLOUmHViF5xbslIFfmJ6IyjwsZ9ug/4DDHvhQMp
 jzC33f+UtuU9PDpjuMXuuh/3AU2eUqrOXF9iy6fCUNKb8LOyQh/YOLZBBmbliHhEMI6T
 lTURJn3BmfLNv2EcsbyORrFZlEU008vba2HPH9tkbYYsFQY9a7dMaVZ15j+zyvPwqMkv
 l7Jg==
X-Gm-Message-State: ACgBeo1Di1GwdQAYRH2wCuGpZ6AD5lyRt9yve8iY/Vy9JCwHdInpmZnn
 FmT+gwRZf6A5qbgIcwuwQXK/yam/oHLQiWcxnvveti2n3AZtAjqL
X-Google-Smtp-Source: AA6agR6TlcK4O9Loy4N+XAyU0aCHMZQLaZ08WkrwmfvifelJvU6aOq/VPJ6s3NlNJrT0DTuUgTWqoeKsaoGe0C5Abww=
X-Received: by 2002:a05:6870:6015:b0:fe:340e:e854 with SMTP id
 t21-20020a056870601500b000fe340ee854mr2599350oaa.52.1659683762889; Fri, 05
 Aug 2022 00:16:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220711095721.1935377-1-sunil@amarulasolutions.com>
 <20220711095721.1935377-2-sunil@amarulasolutions.com>
In-Reply-To: <20220711095721.1935377-2-sunil@amarulasolutions.com>
From: Suniel Mahesh <sunil@amarulasolutions.com>
Date: Fri, 5 Aug 2022 12:45:52 +0530
Message-ID: <CAM+7aWucM7gPBUUmStkO1EebH6gr7y9+Y2ec-6pmsy5B-BSSqg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: arm: sunxi: Add binding for
 RenewWorldOutReach R16-Vista-E board
To: Mark Brown <broonie@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Maxime Ripard <maxime.ripard@free-electrons.com>, 
 Christopher Vollo <chris@renewoutreach.org>,
 Michael Trimarchi <michael@amarulasolutions.com>, 
 Jagan Teki <jagan@amarulasolutions.com>
Content-Type: multipart/alternative; boundary="000000000000206d8f05e5793d7e"
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, linux-amarula@amarulasolutions.com,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000206d8f05e5793d7e
Content-Type: text/plain; charset="UTF-8"

Hi all,

Can you guys please review and comment for any changes.

Regards
Suniel

On Mon, Jul 11, 2022 at 3:27 PM Suniel Mahesh <sunil@amarulasolutions.com>
wrote:

> Add a binding for the RenewWorldOutReach R16-Vista-E board based on
> allwinner R16.
>
> Signed-off-by: Suniel Mahesh <sunil@amarulasolutions.com>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> Signed-off-by: Christopher Vollo <chris@renewoutreach.org>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
> Changes for v3:
> - As suggested by Samuel Holland:
> - vendor prefix documented
> - primary author of the commit should be the first signer
>
> Changes for v2:
> - Add missing compatible string
> - insert missing signatures of contributors
> ---
>  Documentation/devicetree/bindings/arm/sunxi.yaml       | 6 ++++++
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  2 files changed, 8 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml
> b/Documentation/devicetree/bindings/arm/sunxi.yaml
> index 95278a6a9a8e..52b8c9aba6f3 100644
> --- a/Documentation/devicetree/bindings/arm/sunxi.yaml
> +++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
> @@ -787,6 +787,12 @@ properties:
>            - const: allwinner,r7-tv-dongle
>            - const: allwinner,sun5i-a10s
>
> +      - description: RenewWorldOutreach R16-Vista-E
> +        items:
> +          - const: renewworldoutreach,r16-vista-e
> +          - const: allwinner,sun8i-r16
> +          - const: allwinner,sun8i-a33
> +
>        - description: RerVision H3-DVK
>          items:
>            - const: rervision,h3-dvk
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> index 6bb20b4554d7..f5cd0acb1036 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -1030,6 +1030,8 @@ patternProperties:
>      description: reMarkable AS
>    "^renesas,.*":
>      description: Renesas Electronics Corporation
> +  "^renewworldoutreach,.*":
> +    description: RENEW WORLD OUTREACH
>    "^rex,.*":
>      description: iMX6 Rex Project
>    "^rervision,.*":
> --
> 2.25.1
>
>

--000000000000206d8f05e5793d7e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Hi all,</div><div><br></div><div>Can=
 you guys please review and comment for any changes.</div><div><br></div><d=
iv>Regards</div><div>Suniel</div></div><br><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">On Mon, Jul 11, 2022 at 3:27 PM Suniel Mah=
esh &lt;<a href=3D"mailto:sunil@amarulasolutions.com">sunil@amarulasolution=
s.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">Add a binding for the RenewWorldOutReach R16-Vista-E board based on<br=
>
allwinner R16.<br>
<br>
Signed-off-by: Suniel Mahesh &lt;<a href=3D"mailto:sunil@amarulasolutions.c=
om" target=3D"_blank">sunil@amarulasolutions.com</a>&gt;<br>
Signed-off-by: Jagan Teki &lt;<a href=3D"mailto:jagan@amarulasolutions.com"=
 target=3D"_blank">jagan@amarulasolutions.com</a>&gt;<br>
Signed-off-by: Christopher Vollo &lt;<a href=3D"mailto:chris@renewoutreach.=
org" target=3D"_blank">chris@renewoutreach.org</a>&gt;<br>
Acked-by: Rob Herring &lt;<a href=3D"mailto:robh@kernel.org" target=3D"_bla=
nk">robh@kernel.org</a>&gt;<br>
---<br>
Changes for v3:<br>
- As suggested by Samuel Holland:<br>
- vendor prefix documented<br>
- primary author of the commit should be the first signer<br>
<br>
Changes for v2:<br>
- Add missing compatible string<br>
- insert missing signatures of contributors<br>
---<br>
=C2=A0Documentation/devicetree/bindings/arm/sunxi.yaml=C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 6 ++++++<br>
=C2=A0Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++<br>
=C2=A02 files changed, 8 insertions(+)<br>
<br>
diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentati=
on/devicetree/bindings/arm/sunxi.yaml<br>
index 95278a6a9a8e..52b8c9aba6f3 100644<br>
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml<br>
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml<br>
@@ -787,6 +787,12 @@ properties:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- const: allwinner,r7-tv-dongle<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- const: allwinner,sun5i-a10s<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 - description: RenewWorldOutreach R16-Vista-E<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 items:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - const: renewworldoutreach,r16-vista-e=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - const: allwinner,sun8i-r16<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - const: allwinner,sun8i-a33<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0- description: RerVision H3-DVK<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0items:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- const: rervision,h3-dvk<br>
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Docum=
entation/devicetree/bindings/vendor-prefixes.yaml<br>
index 6bb20b4554d7..f5cd0acb1036 100644<br>
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml<br>
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml<br>
@@ -1030,6 +1030,8 @@ patternProperties:<br>
=C2=A0 =C2=A0 =C2=A0description: reMarkable AS<br>
=C2=A0 =C2=A0&quot;^renesas,.*&quot;:<br>
=C2=A0 =C2=A0 =C2=A0description: Renesas Electronics Corporation<br>
+=C2=A0 &quot;^renewworldoutreach,.*&quot;:<br>
+=C2=A0 =C2=A0 description: RENEW WORLD OUTREACH<br>
=C2=A0 =C2=A0&quot;^rex,.*&quot;:<br>
=C2=A0 =C2=A0 =C2=A0description: iMX6 Rex Project<br>
=C2=A0 =C2=A0&quot;^rervision,.*&quot;:<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div></div>

--000000000000206d8f05e5793d7e--
