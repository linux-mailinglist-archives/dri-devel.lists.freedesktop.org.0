Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A3FB5BEC23
	for <lists+dri-devel@lfdr.de>; Tue, 20 Sep 2022 19:39:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14CE610E21C;
	Tue, 20 Sep 2022 17:38:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE3FE10E739
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Sep 2022 17:38:52 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id a14so3885223ljj.8
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Sep 2022 10:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=uBE+KECyTcaP34KF8rn40YHxJdGZROCQlT/llppPOdA=;
 b=Sk1QAlTA5r43nU9/eWWTtejNQXkepCXyzsAGFWknYIA+McXY/50Y8oecf/hEfHHoAX
 +EeTCqrW2j+pAOGMG1SWJSMK4BiLbL9XMVE4xI2E+LbVHK2HN8J6IjAoqwo+eUDW79Ll
 j/+F7vOaHjguVx4YOjv4e3iv/0ZNb9dD9REW98ZpMCOdaiIbTuFlJjdClXNxAEZ/eiTP
 Uesh77YbzNmhP5DrYaMJZc0dFmfXijpw91Wkc5OEWJMqsidv2eSKNcDiZidqZWpirkRL
 VwbmC+rsybmX+8B9wX/xbuiEHO03bPKgfo692n2/SkOZRLmHfR6yiaWLA08QAmzdrEe6
 h6Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=uBE+KECyTcaP34KF8rn40YHxJdGZROCQlT/llppPOdA=;
 b=65k/umoFz8CPB6mvdiMveGozjSZxH3mCu+mxPngBxRkvKV5F8uNZS6WhYG7GmPy9iM
 GHF7iIOsvte9JEmowa5c+q+EDlMYLfw6IuzfciGNqadPlmnFM0jqR0sbqPoG/qInqtt2
 pEW1X90IBporkJjI9bJc/Pp4HB1xr1JHc8RiScmTodPKYqy13xO014OTZrg4PkbTcL51
 1ERVRTTepdH2fHIHxIexc4jXj53H4rI3I1P6iVEyfPVocfrzNOzDGixlna6dvoZoOG9h
 KMssXmOla2ZJB0P/0UbL0Yor1mxMYzjqNaPsqi3sl+LIP0KP+bKAdEL0dskjiITho8h7
 18lQ==
X-Gm-Message-State: ACrzQf2vJ8Bj3Iwzi5p2CIS2AERWO/VvEw1iyRJvYi0txJlITXPNigCy
 VKgIwckUdwgIFC7/jnBpi1r5ctRlmJW/ZHxcZXU=
X-Google-Smtp-Source: AMsMyM5ry6LEqrNnxVUI9kJYPdc3sIxIryuU47tUy3HoCnDIrCTIF0sAGugR11WOEIzW6ebHrhBCOoMV/7RIVAV0bZk=
X-Received: by 2002:a05:651c:b1f:b0:26c:5144:49dd with SMTP id
 b31-20020a05651c0b1f00b0026c514449ddmr3262521ljr.428.1663695529960; Tue, 20
 Sep 2022 10:38:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220920170937.14486-1-macroalpha82@gmail.com>
 <20220920170937.14486-2-macroalpha82@gmail.com>
In-Reply-To: <20220920170937.14486-2-macroalpha82@gmail.com>
From: Maya Matuszczyk <maccraft123mc@gmail.com>
Date: Tue, 20 Sep 2022 19:38:13 +0200
Message-ID: <CAO_Mup+v0VnHhtJq089sp0F4M4pS=V9=GT1W5MfCQSiRYsfgDw@mail.gmail.com>
Subject: Re: [PATCH V2 1/2] dt-bindings: display: panel: Add Samsung
 AMS495QA01 bindings
To: Chris Morgan <macroalpha82@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 airlied@linux.ie, dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 thierry.reding@gmail.com, Chris Morgan <macromorgan@hotmail.com>,
 sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,
Thanks for the patch,
It's so nice seeing more pieces of RG503 being upstreamed.

wt., 20 wrz 2022 o 19:10 Chris Morgan <macroalpha82@gmail.com> napisa=C5=82=
(a):
>
> From: Chris Morgan <macromorgan@hotmail.com>
>
> Add documentation for the Samsung AMS495QA01 panel.
>
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> ---
>  .../display/panel/samsung,ams495qa01.yaml     | 46 +++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/samsu=
ng,ams495qa01.yaml
>
> diff --git a/Documentation/devicetree/bindings/display/panel/samsung,ams4=
95qa01.yaml b/Documentation/devicetree/bindings/display/panel/samsung,ams49=
5qa01.yaml
> new file mode 100644
> index 000000000000..08358cdad19c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/samsung,ams495qa01.=
yaml
> @@ -0,0 +1,46 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/samsung,ams495qa01.yaml=
#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Samsung AMS495QA01 4.95in 960x544 DSI/SPI panel
> +
> +maintainers:
> +  - Chris Morgan <macromorgan@hotmail.com>
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: samsung,ams495qa01
> +  reg: true
> +  reset-gpios: true
> +  elvdd-supply:
> +    description: regulator that supplies voltage to the panel display
Datasheet says about that pin:
"Power pin for module analog", maybe in description that could be
accounted for?

> +  enable-gpios: true
> +  port: true
> +  vdd-supply:
> +    description: regulator that supplies voltage to panel logic
Maybe change that to "panel's logic"?

> +
> +required:
> +  - compatible
> +  - reg
> +  - vdd-supply
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    spi {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +        panel@0 {
> +            compatible =3D "samsung,ams495qa01";
> +            reg =3D <0>;
> +            vdd-supply =3D <&vcc3v3_lcd0_n>;
> +        };
Where's the node of DSI controller the panel's attached to?

> +    };
> +
> +...
> --
> 2.25.1
>

Best Regards,
Maya Matuszczyk
