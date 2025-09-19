Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDDBCB8A3C2
	for <lists+dri-devel@lfdr.de>; Fri, 19 Sep 2025 17:19:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13F2910E244;
	Fri, 19 Sep 2025 15:19:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Elf1cdJQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30FB210E244
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 15:19:21 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-45f2acb5f42so17942855e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 08:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758295160; x=1758899960; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PmIZQg/p+wsk73O/7IQ/2J8qTtcW5vWlRDzFnnbt5FE=;
 b=Elf1cdJQpTBBubQn1OvFZhcRZHJwNlFYSKcW+pyQIP/5rGfjB+601P5+M+ReYYlztQ
 nzAWAfo82WvgqvCxRD4DC6hHG+0NapCQ8rJXBpq3WfL/JFitHitaDxuM7QeQJJ/Frq5s
 1HRppVsXYH2XlHROL4sH6Poybf7LIkk1O+t4gf9szew2OnV0rcRY9gBL3xGfAfLYsl/7
 g0DEtMgTmMbbanwZf1VuLIpP0fzDiN5b7s3uavcTCYhBq17D8DYWaz18nF0Y1OT/KNFn
 HAM89YUttxXkVhS7dQ54lQE87G+W8r+NyZrqW1dMVYgG4xoSVOqo3ZqbWntKq8xXN6DM
 JeTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758295160; x=1758899960;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PmIZQg/p+wsk73O/7IQ/2J8qTtcW5vWlRDzFnnbt5FE=;
 b=ajVVipRuSgiGQ1w49FIJlMUgEuSjDTo2GprfKYuwGMC2k2E7hnAWW9Lakh1umlluAO
 yq+1Iyh+UxgfeYeXIevQBH8YZUouSP/3ZLB52yp9AF3+1TF6vp0lg8bsMWVrJnrOb6e/
 qEB528+dDfcpFR8tg69m30Vo14jHAIbsR4FBRE6jY3QBq+o/ZwWZRJ48Qo8PLLjgcRdl
 eJbq11w9+nPlo8YmVg34RcHj34BVAwXtZLIOLoAdVkLZeG1gwHtn9O61OJ1M3YKLI59G
 VuXQJ2Pk9zDIfnn9rfbzMBl6iAptppob2I3fmc2WwVYmL+f8uzVi/C9bQYN6oFtO2IRD
 M9gQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVcjmNR8FKRbrn0bsYJOVWlW2RWwnwoIYC853e05u+1TfnkzJ7Ld+8iMmnGc16F24x0lF4QECFj0sY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxAiEs/nt+ek5ExcpuMgUUmJ85glN3mJ1ezWtUpWieRt8/TzLad
 pfI8cYmrzX7lqcxRVCwIDkh+eQnL2O85+8LUwNN9XmAHue4sJ97Nz0B+s677EtDApQ+s6vv7VnP
 2z/d+p8mqKv3+qd4KUJeGlbiap4/O6dZb7g==
X-Gm-Gg: ASbGncvT27IXjUVlP5cEO5Ipi5UrNg9Ov1WVXG7aGuI+jUbpPGyUO4xcqYVknpS7mwA
 Gf5+nnUoj2tEDkFmrip/GSAU7Uwtj/4I7KnRl05b8sRfCETutU8d3ceq2htXmo7ksaGt3Q3+gSY
 Lus0eFVf12ibnieHKMTvvdqReYq/2AovgmAWGC+nAKLCsOsvdsTYAimIkEW4Otc1gN8U3lN6qSN
 xnaMtUy
X-Google-Smtp-Source: AGHT+IEgDPEnhQPRnnEH3yzuZMEraGTWgDOPI/yCagFTF5k+zG5oUinI/JMOdDHldD4AWPJfCuYA6PY7j0z7U7Vj7PU=
X-Received: by 2002:a05:600c:8b4c:b0:45f:29eb:2148 with SMTP id
 5b1f17b1804b1-467a7f111camr42527475e9.7.1758295159374; Fri, 19 Sep 2025
 08:19:19 -0700 (PDT)
MIME-Version: 1.0
References: <20250912064253.26346-1-clamor95@gmail.com>
 <20250912064253.26346-2-clamor95@gmail.com>
 <bdd942ef-1ede-4f9f-ab90-ea7ac8995b92@linaro.org>
 <CAPVz0n1Ac=opNj=qAM5Rp0fpDo-6khCdmhoCwkztGLosKV31tw@mail.gmail.com>
In-Reply-To: <CAPVz0n1Ac=opNj=qAM5Rp0fpDo-6khCdmhoCwkztGLosKV31tw@mail.gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 19 Sep 2025 18:19:07 +0300
X-Gm-Features: AS18NWBYrUfprQab9kLOINFBMV1nhqiBixHyzPLKGA0f4GLaKH_9AlhIHvotelk
Message-ID: <CAPVz0n26P7Bb6MvaJ2S1-HN-0Oya2Z6SMCUXYjxxctFowuq-eg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: display: panel: document Sharp
 LQ079L1SX01 panel
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, 
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

=D0=BF=D1=82, 19 =D0=B2=D0=B5=D1=80. 2025=E2=80=AF=D1=80. =D0=BE 17:45 Svya=
toslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> =D0=BF=D1=82, 19 =D0=B2=D0=B5=D1=80. 2025=E2=80=AF=D1=80. =D0=BE 17:36 Ne=
il Armstrong <neil.armstrong@linaro.org> =D0=BF=D0=B8=D1=88=D0=B5:
> >
> > Hi,
> >
> > On 12/09/2025 08:42, Svyatoslav Ryhel wrote:
> > > Document Sharp LQ079L1SX01 panel found in Xiaomi Mi Pad.
> >
> > The patch doesn't apply on drm-misc-next, please rebase.
> >

Ok, I see where conflict is, I will send rebased version within an hour.

>
> Sure, but I have synced with drm-misc-next right now and it applied clean=
ly.
>
> I am on top of 048deed5faf0 (drm/drm-misc-next) drm/panel: Add support
> for KD116N3730A12
>
> Top commit is correct on my side?
>
> > Neil
> >
> > >
> > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > ---
> > >   .../display/panel/sharp,lq079l1sx01.yaml      | 99 ++++++++++++++++=
+++
> > >   1 file changed, 99 insertions(+)
> > >   create mode 100644 Documentation/devicetree/bindings/display/panel/=
sharp,lq079l1sx01.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/display/panel/sharp,lq=
079l1sx01.yaml b/Documentation/devicetree/bindings/display/panel/sharp,lq07=
9l1sx01.yaml
> > > new file mode 100644
> > > index 000000000000..08a35ebbbb3c
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/display/panel/sharp,lq079l1sx=
01.yaml
> > > @@ -0,0 +1,99 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/display/panel/sharp,lq079l1sx01.y=
aml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Sharp Microelectronics 7.9" WQXGA TFT LCD panel
> > > +
> > > +maintainers:
> > > +  - Svyatoslav Ryhel <clamor95@gmail.com>
> > > +
> > > +description: >
> > > +  This panel requires a dual-channel DSI host to operate and it supp=
orts
> > > +  only left-right split mode, where each channel drives the left or =
right
> > > +  half of the screen and only video mode.
> > > +
> > > +  Each of the DSI channels controls a separate DSI peripheral.
> > > +  The peripheral driven by the first link (DSI-LINK1), left one, is
> > > +  considered the primary peripheral and controls the device.
> > > +
> > > +allOf:
> > > +  - $ref: panel-common-dual.yaml#
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: sharp,lq079l1sx01
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  avdd-supply:
> > > +    description: regulator that supplies the analog voltage
> > > +
> > > +  vddio-supply:
> > > +    description: regulator that supplies the I/O voltage
> > > +
> > > +  vsp-supply:
> > > +    description: positive boost supply regulator
> > > +
> > > +  vsn-supply:
> > > +    description: negative boost supply regulator
> > > +
> > > +  reset-gpios:
> > > +    maxItems: 1
> > > +
> > > +  backlight: true
> > > +  ports: true
> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +  - avdd-supply
> > > +  - vddio-supply
> > > +  - ports
> > > +
> > > +additionalProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    #include <dt-bindings/gpio/gpio.h>
> > > +
> > > +    dsi {
> > > +        #address-cells =3D <1>;
> > > +        #size-cells =3D <0>;
> > > +
> > > +        panel@0 {
> > > +            compatible =3D "sharp,lq079l1sx01";
> > > +            reg =3D <0>;
> > > +
> > > +            reset-gpios =3D <&gpio 59 GPIO_ACTIVE_LOW>;
> > > +
> > > +            avdd-supply =3D <&avdd_lcd>;
> > > +            vddio-supply =3D <&vdd_lcd_io>;
> > > +            vsp-supply =3D <&vsp_5v5_lcd>;
> > > +            vsn-supply =3D <&vsn_5v5_lcd>;
> > > +
> > > +            backlight =3D <&backlight>;
> > > +
> > > +            ports {
> > > +                #address-cells =3D <1>;
> > > +                #size-cells =3D <0>;
> > > +
> > > +                port@0 {
> > > +                    reg =3D <0>;
> > > +                    panel_in0: endpoint {
> > > +                        remote-endpoint =3D <&dsi0_out>;
> > > +                    };
> > > +                };
> > > +
> > > +                port@1 {
> > > +                    reg =3D <1>;
> > > +                    panel_in1: endpoint {
> > > +                        remote-endpoint =3D <&dsi1_out>;
> > > +                    };
> > > +                };
> > > +            };
> > > +        };
> > > +    };
> > > +...
> >
