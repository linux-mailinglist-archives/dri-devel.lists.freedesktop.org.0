Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A581719165
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jun 2023 05:36:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0580E10E206;
	Thu,  1 Jun 2023 03:35:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [IPv6:2607:f8b0:4864:20::836])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDD7F10E206
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Jun 2023 03:35:53 +0000 (UTC)
Received: by mail-qt1-x836.google.com with SMTP id
 d75a77b69052e-3f8177f9a7bso2555221cf.2
 for <dri-devel@lists.freedesktop.org>; Wed, 31 May 2023 20:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1685590552; x=1688182552;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=DN6ry/gK3iJ7PWJWFzkXSYSFH546XSZSeAmA0LgbWHM=;
 b=y9fYjChhBLUijbEcblNc8OVgWMTijYp6GRIVOGLwwPXF1XGBlS84CdyL4uj2/KQSom
 YgNiTpGzt1HJ/T7VTIruS+XVaL7u9AJh1X2N3mq17Q9gALpIN2SPmUJAVLRXy14Gn40x
 BQUlYSDF09cBb5jKH5G/Ylt09L3Uq5PCP7aApCPwFvo14B2gRQOgJLQLTPUj/MSutokR
 Y7x2NZznSw4eBrXRTHOoTeum/H75PLbkmA1etsDe64fY1BWNEhctq3AM/kqryUmHNZaC
 iZWwH/klirgOQrnbj81l/ANyMUyAZDpBS6XllBZWLikcqVhvC5foYk6pn+H+SqJXMo0r
 8Fxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685590552; x=1688182552;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DN6ry/gK3iJ7PWJWFzkXSYSFH546XSZSeAmA0LgbWHM=;
 b=iS7Gu21JVl0AyxmO4+DkBe1fZq3NL0vPytny3sbkqQcQBucdAqWi7/H251F89rgE3P
 txBm6rllT43vrNtL+LuLf7JpsK+okH5kGrxMbdqcF1WUs+zAA1W0UDZ8zURPURgGcRSH
 xyAeh/H2LWdfpLOPUytcXhj2r7FjBoFVst68K8e1LTCggqU9jDJV1Kqqki9aP8x2UkVR
 2j57z04BskbttN7f6wIkwVOUAExS3t+JorwE6Y+h5X6XJc5mgu5dw7vZdmjbJ9kaQTFR
 MYWyK7t3BWPRaB+oF5qREUdA9EcJIFvR8APXFQB38vYrD9H+tG7triMVpkuzWmTqyQ3y
 QgtA==
X-Gm-Message-State: AC+VfDy11HT1SeyPhrdUsbF/3HJFEIrvqwje3IzpaHpIwzsd4WvKlTPd
 3Z4VGyNHWmeLBkMtFCI2+9uHE2e6vX6dsg0Q3M/nYw==
X-Google-Smtp-Source: ACHHUZ5aXf59VtQZGxwWjxlhWSpGvaBgFkSeMQuGNzzyU6fzPZOyWE+Wwjr5fyakfdsYasnbqL0+ym8Y0e+OBZjjr1o=
X-Received: by 2002:ac8:5fc5:0:b0:3e4:d1c0:36a9 with SMTP id
 k5-20020ac85fc5000000b003e4d1c036a9mr9772628qta.48.1685590552621; Wed, 31 May
 2023 20:35:52 -0700 (PDT)
MIME-Version: 1.0
References: <1adda828-cf35-fb2c-6db5-f9ca91b5b62a@linaro.org>
 <20230525093151.2338370-1-yangcong5@huaqin.corp-partner.google.com>
 <20230525093151.2338370-2-yangcong5@huaqin.corp-partner.google.com>
In-Reply-To: <20230525093151.2338370-2-yangcong5@huaqin.corp-partner.google.com>
From: cong yang <yangcong5@huaqin.corp-partner.google.com>
Date: Thu, 1 Jun 2023 11:35:41 +0800
Message-ID: <CAHwB_N+zh0HBt+2ejs8DSiXf_FSjZS_bLsJoxZ61QZeSr3e6SA@mail.gmail.com>
Subject: Re: [v4 1/4] dt-bindings: display: panel: Add compatible for Starry
 himax83102-j02
To: dianders@google.com, daniel@ffwll.ch, neil.armstrong@linaro.org, 
 sam@ravnborg.org, airlied@gmail.com, robh+dt@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, hsinyi@google.com, conor+dt@kernel.org
Content-Type: multipart/alternative; boundary="000000000000204b8205fd09221b"
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000204b8205fd09221b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,Doug:
  Can you help me merge the V4 seria patch.thanks.

On Thu, May 25, 2023 at 5:32=E2=80=AFPM Cong Yang <
yangcong5@huaqin.corp-partner.google.com> wrote:

> The STARRY himax83102-j02 is a 10.51" WUXGA TFT LCD panel,
> which fits in nicely with the existing panel-boe-tv101wum-nl6
> driver. Hence, we add a new compatible with panel specific config.
>
> Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml     | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git
> a/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml
> b/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml
> index aed55608ebf6..28a7beeb8f92 100644
> --- a/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.ya=
ml
> +++ b/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.ya=
ml
> @@ -32,6 +32,8 @@ properties:
>        - innolux,hj110iz-01a
>          # STARRY 2081101QFH032011-53G 10.1" WUXGA TFT LCD panel
>        - starry,2081101qfh032011-53g
> +        # STARRY himax83102-j02 10.51" WUXGA TFT LCD panel
> +      - starry,himax83102-j02
>
>    reg:
>      description: the virtual channel number of a DSI peripheral
> --
> 2.25.1
>
>

--000000000000204b8205fd09221b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,Doug:=C2=A0<div>=C2=A0=C2=A0Can you help me merge the V=
4 seria patch.thanks.</div></div><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">On Thu, May 25, 2023 at 5:32=E2=80=AFPM Cong Yan=
g &lt;<a href=3D"mailto:yangcong5@huaqin.corp-partner.google.com">yangcong5=
@huaqin.corp-partner.google.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">The STARRY himax83102-j02 is a 10.51&quot;=
 WUXGA TFT LCD panel,<br>
which fits in nicely with the existing panel-boe-tv101wum-nl6<br>
driver. Hence, we add a new compatible with panel specific config.<br>
<br>
Signed-off-by: Cong Yang &lt;<a href=3D"mailto:yangcong5@huaqin.corp-partne=
r.google.com" target=3D"_blank">yangcong5@huaqin.corp-partner.google.com</a=
>&gt;<br>
Reviewed-by: Douglas Anderson &lt;<a href=3D"mailto:dianders@chromium.org" =
target=3D"_blank">dianders@chromium.org</a>&gt;<br>
Acked-by: Conor Dooley &lt;<a href=3D"mailto:conor.dooley@microchip.com" ta=
rget=3D"_blank">conor.dooley@microchip.com</a>&gt;<br>
---<br>
=C2=A0.../devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml=C2=A0 =C2=
=A0 =C2=A0| 2 ++<br>
=C2=A01 file changed, 2 insertions(+)<br>
<br>
diff --git a/Documentation/devicetree/bindings/display/panel/boe,tv101wum-n=
l6.yaml b/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.=
yaml<br>
index aed55608ebf6..28a7beeb8f92 100644<br>
--- a/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml=
<br>
+++ b/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml=
<br>
@@ -32,6 +32,8 @@ properties:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0- innolux,hj110iz-01a<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# STARRY 2081101QFH032011-53G 10.1&quot; =
WUXGA TFT LCD panel<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0- starry,2081101qfh032011-53g<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # STARRY himax83102-j02 10.51&quot; WUXGA TFT =
LCD panel<br>
+=C2=A0 =C2=A0 =C2=A0 - starry,himax83102-j02<br>
<br>
=C2=A0 =C2=A0reg:<br>
=C2=A0 =C2=A0 =C2=A0description: the virtual channel number of a DSI periph=
eral<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div>

--000000000000204b8205fd09221b--
