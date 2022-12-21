Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED521654DC1
	for <lists+dri-devel@lfdr.de>; Fri, 23 Dec 2022 09:45:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B913610E61A;
	Fri, 23 Dec 2022 08:45:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com
 [IPv6:2607:f8b0:4864:20::1129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF51B10E064
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Dec 2022 09:40:40 +0000 (UTC)
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-3cbdd6c00adso203918047b3.11
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Dec 2022 01:40:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=MkGXZpaLxnQjAQaP1clV8fbaGNLYKnppFzo4q8w4AMA=;
 b=bO0PFEnxxioODT4PhHN58vHugv4/uoMj2Profvhjp7IKTfoTiedn/sIvshnS9W8nby
 t361dHSxNc+hEw3F20Agfups1gm0ENr5Hoyw82gMPBFAfDixEdsQ0jRuT57UYwO0SqyN
 vi8wPNk+s/CQKc7OLMLJDtrpptroivRDbN9MgoAYsI/5slLR8aLmqViUFh3j54k1Udzl
 iz50QDaf07GMGe9ha0HJx9qtwR1uAKWqTikoB5CEYf2/bGvN63pL0oCURdmhdvuCGpGg
 7TV9UKfuGnweu/HBUhhuSIckolcGqpK1wrkAEuI67y1USjS6ag/P8KSWhCGQxE5l/1uw
 /ckw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MkGXZpaLxnQjAQaP1clV8fbaGNLYKnppFzo4q8w4AMA=;
 b=6M15YNegPf3ABABKL/7e/mB84QBbFZg9S+hk91oS5VtlBdChUd9jxQEGBqC4NkL97i
 1FbwOnW52sw+jlGu68KwASWT1lAytfBIJWMW/bUaE4vohkd8E3a3NgycGLK7238XFFLX
 95dYIFAUlb10xp6AQ+Cw/HC62mn+eiE0qILJnlNvDCPgSvv9nfm5AYCh5j6nqpm+3bFQ
 KNIxvrhYtYq728BN9SkGEOtkoXwMEfClF6OUYjGnPuPsjSMNGQNK3QrXC79z/4Da3cUt
 5VlBl2Kyib443i3uz0pAzdNuv9N4fRKa6n2Dfl8vzRjyUqSDPhFpXu0F0Yn8fLcnc76E
 jFPA==
X-Gm-Message-State: AFqh2krimha/TcVdnabT3yC1wU90+tys34qVUsozl8R8Is9ZR+qCZie/
 JzmsN859CEvQXxaMFVED6hGHqrSXTDZdK6UvX8X3YnqQ72eETfI1
X-Google-Smtp-Source: AMrXdXslaPsSYcdznYqCWFUlO3RCVXCPEbPljoyNUT8PSVSyVoSM88cyfUO8hRfwi4IGTZ5MnqmjoP+aJ298+wypdhY=
X-Received: by 2002:a81:58c:0:b0:3d2:d9e7:a68d with SMTP id
 134-20020a81058c000000b003d2d9e7a68dmr71783ywf.224.1671615639995; Wed, 21 Dec
 2022 01:40:39 -0800 (PST)
MIME-Version: 1.0
References: <20221221070216.17850-1-lujianhua000@gmail.com>
 <d37e0f2d-eaa5-4eaa-72bb-ead349235d6d@linaro.org>
In-Reply-To: <d37e0f2d-eaa5-4eaa-72bb-ead349235d6d@linaro.org>
From: jianhua lu <lujianhua000@gmail.com>
Date: Wed, 21 Dec 2022 17:40:28 +0800
Message-ID: <CAEo_cxGK_m_VM1k0EWerfS2b2DF5ucvftQj68h3kBZz2=L=YGQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: leds: backlight: add binding for Kinetic
 KTZ8866 backlight
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000006c498505f05358b9"
X-Mailman-Approved-At: Fri, 23 Dec 2022 08:44:25 +0000
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
Cc: devicetree@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 Pavel Machek <pavel@ucw.cz>, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--0000000000006c498505f05358b9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for review, I will resend this path.

Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> =E4=BA=8E 2022=E5=B9=
=B412=E6=9C=8821=E6=97=A5=E5=91=A8=E4=B8=89
16:13=E5=86=99=E9=81=93=EF=BC=9A

> On 21/12/2022 08:02, Jianhua Lu wrote:
> > Add device tree bindings for the Kinetic KTZ8866 backlight driver.
>
> 1. Your patches are not properly threaded which makes it difficult to
> review and handle them. Resend with proper threads.
>
> 2. Subject: drop second, redundant "binding for".
>
> >
> > Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
> > ---
> >  .../leds/backlight/kinetic,ktz8866.yaml       | 37 +++++++++++++++++++
> >  1 file changed, 37 insertions(+)
> >  create mode 100644
> Documentation/devicetree/bindings/leds/backlight/kinetic,ktz8866.yaml
> >
> > diff --git
> a/Documentation/devicetree/bindings/leds/backlight/kinetic,ktz8866.yaml
> b/Documentation/devicetree/bindings/leds/backlight/kinetic,ktz8866.yaml
> > new file mode 100644
> > index 000000000000..7286c3fc7f5d
> > --- /dev/null
> > +++
> b/Documentation/devicetree/bindings/leds/backlight/kinetic,ktz8866.yaml
> > @@ -0,0 +1,37 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/leds/backlight/kinetic,ktz8866.yaml=
#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Kinetic Technologies KTZ8866 backlight
> > +
> > +maintainers:
> > +  - Jianhua Lu <lujianhua000@gmail.com>
> > +
> > +description: |
> > +  The Kinetic Technologies KTZ8866 is a high efficiency 6-sinks led
> backlight
> > +  with dual lcd bias power.
> > +  https://www.kinet-ic.com/ktz8866/
> > +
> > +allOf:
> > +  - $ref: common.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      const: kinetic,ktz8866
>
> Does not look like you tested the bindings. Please run `make
> dt_binding_check` (see
> Documentation/devicetree/bindings/writing-schema.rst for instructions).
>
> > +
> > +required:
> > +  - compatible
> > +
> > +additionalProperties: false
>
> This should be rather unevaluatedProperties: false, otherwise you do not
> allow any other properties, except compatible. Was this the intention?
>
> Best regards,
> Krzysztof
>
>

--0000000000006c498505f05358b9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Thanks for review, I will resend this path.</div><br><div=
 class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Krzysztof Kozl=
owski &lt;<a href=3D"mailto:krzysztof.kozlowski@linaro.org">krzysztof.kozlo=
wski@linaro.org</a>&gt; =E4=BA=8E 2022=E5=B9=B412=E6=9C=8821=E6=97=A5=E5=91=
=A8=E4=B8=89 16:13=E5=86=99=E9=81=93=EF=BC=9A<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex">On 21/12/2022 08:02, Jianhua Lu wrote:<br>
&gt; Add device tree bindings for the Kinetic KTZ8866 backlight driver.<br>
<br>
1. Your patches are not properly threaded which makes it difficult to<br>
review and handle them. Resend with proper threads.<br>
<br>
2. Subject: drop second, redundant &quot;binding for&quot;.<br>
<br>
&gt; <br>
&gt; Signed-off-by: Jianhua Lu &lt;<a href=3D"mailto:lujianhua000@gmail.com=
" target=3D"_blank" rel=3D"noreferrer">lujianhua000@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../leds/backlight/kinetic,ktz8866.yaml=C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 37 +++++++++++++++++++<br>
&gt;=C2=A0 1 file changed, 37 insertions(+)<br>
&gt;=C2=A0 create mode 100644 Documentation/devicetree/bindings/leds/backli=
ght/kinetic,ktz8866.yaml<br>
&gt; <br>
&gt; diff --git a/Documentation/devicetree/bindings/leds/backlight/kinetic,=
ktz8866.yaml b/Documentation/devicetree/bindings/leds/backlight/kinetic,ktz=
8866.yaml<br>
&gt; new file mode 100644<br>
&gt; index 000000000000..7286c3fc7f5d<br>
&gt; --- /dev/null<br>
&gt; +++ b/Documentation/devicetree/bindings/leds/backlight/kinetic,ktz8866=
.yaml<br>
&gt; @@ -0,0 +1,37 @@<br>
&gt; +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)<br>
&gt; +%YAML 1.2<br>
&gt; +---<br>
&gt; +$id: <a href=3D"http://devicetree.org/schemas/leds/backlight/kinetic,=
ktz8866.yaml#" rel=3D"noreferrer noreferrer" target=3D"_blank">http://devic=
etree.org/schemas/leds/backlight/kinetic,ktz8866.yaml#</a><br>
&gt; +$schema: <a href=3D"http://devicetree.org/meta-schemas/core.yaml#" re=
l=3D"noreferrer noreferrer" target=3D"_blank">http://devicetree.org/meta-sc=
hemas/core.yaml#</a><br>
&gt; +<br>
&gt; +title: Kinetic Technologies KTZ8866 backlight<br>
&gt; +<br>
&gt; +maintainers:<br>
&gt; +=C2=A0 - Jianhua Lu &lt;<a href=3D"mailto:lujianhua000@gmail.com" tar=
get=3D"_blank" rel=3D"noreferrer">lujianhua000@gmail.com</a>&gt;<br>
&gt; +<br>
&gt; +description: |<br>
&gt; +=C2=A0 The Kinetic Technologies KTZ8866 is a high efficiency 6-sinks =
led backlight<br>
&gt; +=C2=A0 with dual lcd bias power.<br>
&gt; +=C2=A0 <a href=3D"https://www.kinet-ic.com/ktz8866/" rel=3D"noreferre=
r noreferrer" target=3D"_blank">https://www.kinet-ic.com/ktz8866/</a><br>
&gt; +<br>
&gt; +allOf:<br>
&gt; +=C2=A0 - $ref: common.yaml#<br>
&gt; +<br>
&gt; +properties:<br>
&gt; +=C2=A0 compatible:<br>
&gt; +=C2=A0 =C2=A0 items:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 const: kinetic,ktz8866<br>
<br>
Does not look like you tested the bindings. Please run `make<br>
dt_binding_check` (see<br>
Documentation/devicetree/bindings/writing-schema.rst for instructions).<br>
<br>
&gt; +<br>
&gt; +required:<br>
&gt; +=C2=A0 - compatible<br>
&gt; +<br>
&gt; +additionalProperties: false<br>
<br>
This should be rather unevaluatedProperties: false, otherwise you do not<br=
>
allow any other properties, except compatible. Was this the intention?<br>
<br>
Best regards,<br>
Krzysztof<br>
<br>
</blockquote></div>

--0000000000006c498505f05358b9--
