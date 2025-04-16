Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AFECA8B085
	for <lists+dri-devel@lfdr.de>; Wed, 16 Apr 2025 08:40:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68AB810E83C;
	Wed, 16 Apr 2025 06:40:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AX61dhHd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7385210E83C
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 06:40:55 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-39129fc51f8so5548199f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 23:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744785653; x=1745390453; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aEmFT6yWrmKehIQNMRlgRGvQtqeeYxSOMZxf9NCxgf8=;
 b=AX61dhHd6am6+e0gex4NJh1O8qIHaLnA/81nfTPj/euNIoQ3myqjSQjaSIKPCd4fmg
 yp9GEOtYwNDSMqa/vGCgmecRRGRpD474Hl006qlaznptp2R+SFhYSIjGAYNU2S3SHeI8
 sG6/aRlLcuc9JoZsb7rjke9RkBA8FX94hiePP8nU3qkq8F7Nb8O3m4s+JTq+rJ9T4yTG
 QVsvkoR0iq1uHFYBC0TX3olhf1Ob+7pTpDIM3Q70FhMigJL0vxKVUTcNroyrJCYnkLHd
 nO1Q7cOaeoxwsGYJnThKYFQfJm6/tehfs1csbSz+WdYQ6V0ih4rjgSRtbD5E7+Wkr7O2
 LqYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744785653; x=1745390453;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aEmFT6yWrmKehIQNMRlgRGvQtqeeYxSOMZxf9NCxgf8=;
 b=OUiG2YoF1HrFvsegWifIrqd+guswcQ3JbOnCTECd5uoi2sNaC9SVHB55vL7iM/F7iB
 ii+IatZaY+qu1cGbZmu6EhSlbMa5B1sZEGgArrk8KS4gYXbZD7ok6/vD9qhuKgtGQ9ZE
 hB/44zDOOjDWAFdOOxVodlT9Haph2JkY4jP40X/SiXriiVaF3zWH/ndxjJkpmUEIz/9X
 4MxQg/Sv+8IQOtJdH+wSM9FY2FFzV3M/HAHFWP0ZEUPqFANMHRVChU4wRmVLFHQ0pTem
 8lucN5AM0YoCtWxUZ36A0FIbOWXFpAwq56IOfADlAApqTmgD24i3HvvQ/k1izrQdYYen
 FPHQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUl8CcQ+ZWJIeThV180f/JqYegLlaEttljrAXe7GB5gOhUCCQdkamu30mCy7fpVmNrvOGgiml1iKx4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzTxEnFKX75gjoWqPue6rCKZiVky9aBe2/3pXctlJZ4guXHcmgu
 c+AR+BqICVxE/7BBHNkpbNBot5G8Yt8BPB1y6BdZ7VUFvXwcFz6IWuqbVfo6pdx29ON6sHOMWnT
 Op2tjPabqlkjNbVwtHzF/eRNiBp8=
X-Gm-Gg: ASbGncsFp3bhj3i13Xk4Ef4rStY3lGecUBcrzalWLGBQvUEZe/PCv06+pIW23b8bNPK
 qmVABhYHhul6kURDb0Z8SjYNDo+gHFWNorc1v5YXEo3riSpqlvZsRgbqK5VStt7xM+YRr6fSTva
 IRU/VDfFkGimi7K1UJip4f7H4=
X-Google-Smtp-Source: AGHT+IG0GGjuLd2A2XpZtlHWtwnocPmbMlMmUK/NP5KwDhbBkAedNMcbby0dBOXrWK5djTbre5W/xlcioRBEZZNuSR4=
X-Received: by 2002:a05:6000:400d:b0:39c:13f5:dba0 with SMTP id
 ffacd0b85a97d-39ee5b16172mr618349f8f.13.1744785652710; Tue, 15 Apr 2025
 23:40:52 -0700 (PDT)
MIME-Version: 1.0
References: <20250413112401.12543-1-clamor95@gmail.com>
 <20250413112401.12543-2-clamor95@gmail.com>
 <20250415215521.GA885658-robh@kernel.org>
In-Reply-To: <20250415215521.GA885658-robh@kernel.org>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 16 Apr 2025 09:40:41 +0300
X-Gm-Features: ATxdqUFN7UzyJuMMMzD1rwSyh7qBfatQVvF-TSiE9ixKB6cKNshecrhpPqTjrCQ
Message-ID: <CAPVz0n0qTUqt+JEy0R4-=jJLgVRcNwwe0k2jTd=hcLxSoAFG_g@mail.gmail.com>
Subject: Re: [PATCH v1 1/4] dt-bindings: display: panel: Document Renesas
 R61307 based DSI panel
To: Rob Herring <robh@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

=D1=81=D1=80, 16 =D0=BA=D0=B2=D1=96=D1=82. 2025=E2=80=AF=D1=80. =D0=BE 00:5=
5 Rob Herring <robh@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Sun, Apr 13, 2025 at 02:23:58PM +0300, Svyatoslav Ryhel wrote:
> > R61307 is liquid crystal driver for high-definition amorphous silicon
> > (a-Si) panels and is ideal for tablets and smartphones.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  .../display/panel/renesas,r61307.yaml         | 93 +++++++++++++++++++
> >  1 file changed, 93 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/panel/ren=
esas,r61307.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/display/panel/renesas,r6=
1307.yaml b/Documentation/devicetree/bindings/display/panel/renesas,r61307.=
yaml
> > new file mode 100644
> > index 000000000000..a98d2d2e02d2
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/panel/renesas,r61307.ya=
ml
> > @@ -0,0 +1,93 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/panel/renesas,r61307.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Renesas R61307 based DSI Display Panel
> > +
> > +maintainers:
> > +  - Svyatoslav Ryhel <clamor95@gmail.com>
> > +
> > +description:
> > +  The Renesas R61307 is a generic DSI Panel IC used to control LCD pan=
els.
> > +
> > +allOf:
> > +  - $ref: panel-common.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +        # KOE/HITACHI TX13D100VM0EAA 5.0" XGA TFT LCD panel
> > +      - hit,tx13d100vm0eaa
> > +      - koe,tx13d100vm0eaa
>
> Usuually when the display IC is known, there's a fallback compatible for
> it. Then 'renesas' vendor prefix on the properties makes more sense.
>

Acknowledged, thank you.

> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  vcc-supply:
> > +    description: Regulator for main power supply.
> > +
> > +  iovcc-supply:
> > +    description: Regulator for 1.8V IO power supply.
> > +
> > +  backlight: true
> > +
> > +  renesas,gamma:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      0 - disabled
> > +      1-3 - gamma setting A presets
> > +    enum: [0, 1, 2, 3]
> > +
> > +  renesas,inversion:
> > +    type: boolean
> > +    description: switch between line and column inversion. The line
> > +      inversion is set by default.
>
> The property name is odd since there's always some sort of
> inversion. Perhaps renesas,column-inversion?
>

Acknowledged, thank you.

> > +
> > +  renesas,contrast:
> > +    type: boolean
> > +    description: digital contrast adjustment
>
> I would have expected contrast to be more than boolean. Is this
> something any a-Si panel would support or somehow Renesas specific?
>

ATM there is only one known set of commands regards digital contrast
adjustment and it application is optional, hence bool. However, panel
which my device uses refuses to work properly without this
configuration applied. Since there is no specific programming guide
regards this IC I cannot say for sure if this is panel specific or a
Renesas IC feature. When/if there will be any additional data
available this property can by adjusted or dropped.

> > +
> > +  reset-gpios: true
> > +  port: true
> > +
> > +required:
> > +  - compatible
> > +  - port
> > +  - backlight
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/gpio/gpio.h>
> > +
> > +    dsi {
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <0>;
> > +
> > +        panel@1 {
> > +            compatible =3D "koe,tx13d100vm0eaa";
> > +            reg =3D <1>;
> > +
> > +            reset-gpios =3D <&gpio 176 GPIO_ACTIVE_LOW>;
> > +
> > +            renesas,gamma =3D <3>;
> > +            renesas,inversion;
> > +            renesas,contrast;
> > +
> > +            vcc-supply =3D <&vcc_3v0_lcd>;
> > +            iovcc-supply =3D <&iovcc_1v8_lcd>;
> > +
> > +            backlight =3D <&backlight>;
> > +
> > +            port {
> > +                panel_in: endpoint {
> > +                    remote-endpoint =3D <&dsi_out>;
> > +                };
> > +            };
> > +        };
> > +    };
> > +
> > +...
> > --
> > 2.43.0
> >
