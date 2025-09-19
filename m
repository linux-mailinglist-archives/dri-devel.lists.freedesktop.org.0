Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE01B8A0E7
	for <lists+dri-devel@lfdr.de>; Fri, 19 Sep 2025 16:45:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FECB10EA22;
	Fri, 19 Sep 2025 14:45:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UC7PMMPB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com
 [209.85.219.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02E5010EA22
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 14:45:25 +0000 (UTC)
Received: by mail-yb1-f174.google.com with SMTP id
 3f1490d57ef6-ea5ca8dbd37so1452532276.2
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 07:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758293125; x=1758897925; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3WjyTwxOlL5TBVN6HVHH54w6s0HUnwkgruRLNDXu+EU=;
 b=UC7PMMPBGO9rW77boD76c5PNlyOm0/35I1dL/CXlWzw+91jIGfMMuP80cVyilbRBLN
 GVA3h7jy4vhxwZZWdK+d/ae9CstFc00LATFWozWlRV6EzdZYaxesaVc6UAk8MLcTmmPq
 vjjQkANBYB/phb8OnjP/hiVlzYbM4RqgP1zfUp6LhvmgTncs1LjFz5Zf6quzvvNFXj41
 S+YsiH0YguA7TyiErsqbTCY+Z8T2l48ojZo7s8oYbS8QxBZyfWRnfDEpZZY/T/MmaDhI
 urk4IaXB04k5d04iplItOrGp42W+NqTWERYs7ITCLJx5IMiCuOt4j32pWuWLNqg36q2F
 5yAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758293125; x=1758897925;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3WjyTwxOlL5TBVN6HVHH54w6s0HUnwkgruRLNDXu+EU=;
 b=n7ouyM99DR5TmuClLObajmX44DOUPjPhjx7d8oiLB7pseiNPC1pKXejs/0K+SkmsPa
 upthpgpbBfd0PtLGYIevHbfOrkrct5jQeLI0ppANh/WtEVQUnya/yiE9tzFc3hCr0oK7
 jZ367c81tEuhLp5Yyz3fEbApHZRlMrKOFha2lSlREniVrCWWD8KbZnUjH+Y4vPU3xOAW
 K2rXLnMJW2ZIcqlS3f/AJHnuph1GpGxw33HjfrCRZOl4BoL3eFE0a1kWRXpwYoA2LfuY
 H92mzQD+NX4XjFhOY5iXEx0Q6k4UxfkqeQbpaIaaJkEf/9Fis7f0zFSq2GTHSTlb6C6y
 cv2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVfkhqhc+PVpDTi3C+uijp53leTwMnlJY+ayeUyf9UqjSikIpqAOWE56cUowIkaQlw0t1vH7kLc8hU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzwDqZQfSNtz00F1LLGh5F24Zn4c72UH9SvjeHgKcvU8hcPwwIh
 ezjKHfBnaomdbAjwe9si9HKWbhrFIAV8aPRQxW2hSWIj5Qw5b9YUngcWM1A/mp7KRav1bLk0SkS
 DuXts4L+6oytk4DVrF+RzEHMGQq58y+A=
X-Gm-Gg: ASbGncszeY+7+i4juo1O7ji5tFRr/jVfTHIfHgV059cPI1Gck+qTe+O0cf5I+kzLLSM
 gcYLsSWEJ5aOGxfcxsq5OmTfRBl5UBWh6GMfN9zlAchGGue7VQ3BrdxbqUXJFv5qr/BSdAX4kXk
 KAR+FMK+wjnazcAAwfK88eY6IvTha0TwzTbOiBYYbX0NQJMIqqs/PzfVhEGeQK26Hr2lRsNG+xn
 oWiQvsd
X-Google-Smtp-Source: AGHT+IGJw1+yEfFNFqRcYjWUnG/h8+qC9oVnvpeOX94lxBtVsN40UmgyUvz0yHEx0P3xwOLztHIl2uP+N3Us1ggwwRI=
X-Received: by 2002:a05:6902:1b87:b0:ea3:e63f:7b42 with SMTP id
 3f1490d57ef6-ea8a79e880cmr3533510276.33.1758293124321; Fri, 19 Sep 2025
 07:45:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250912064253.26346-1-clamor95@gmail.com>
 <20250912064253.26346-2-clamor95@gmail.com>
 <bdd942ef-1ede-4f9f-ab90-ea7ac8995b92@linaro.org>
In-Reply-To: <bdd942ef-1ede-4f9f-ab90-ea7ac8995b92@linaro.org>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 19 Sep 2025 17:45:11 +0300
X-Gm-Features: AS18NWCaPEoqBynvU0_LqnkYzZ1JgNAvdrHR_FyFiEbwwYX_CdM3v2DxCZzUGeU
Message-ID: <CAPVz0n1Ac=opNj=qAM5Rp0fpDo-6khCdmhoCwkztGLosKV31tw@mail.gmail.com>
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

=D0=BF=D1=82, 19 =D0=B2=D0=B5=D1=80. 2025=E2=80=AF=D1=80. =D0=BE 17:36 Neil=
 Armstrong <neil.armstrong@linaro.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Hi,
>
> On 12/09/2025 08:42, Svyatoslav Ryhel wrote:
> > Document Sharp LQ079L1SX01 panel found in Xiaomi Mi Pad.
>
> The patch doesn't apply on drm-misc-next, please rebase.
>

Sure, but I have synced with drm-misc-next right now and it applied cleanly=
.

I am on top of 048deed5faf0 (drm/drm-misc-next) drm/panel: Add support
for KD116N3730A12

Top commit is correct on my side?

> Neil
>
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >   .../display/panel/sharp,lq079l1sx01.yaml      | 99 ++++++++++++++++++=
+
> >   1 file changed, 99 insertions(+)
> >   create mode 100644 Documentation/devicetree/bindings/display/panel/sh=
arp,lq079l1sx01.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/display/panel/sharp,lq07=
9l1sx01.yaml b/Documentation/devicetree/bindings/display/panel/sharp,lq079l=
1sx01.yaml
> > new file mode 100644
> > index 000000000000..08a35ebbbb3c
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/panel/sharp,lq079l1sx01=
.yaml
> > @@ -0,0 +1,99 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/panel/sharp,lq079l1sx01.yam=
l#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Sharp Microelectronics 7.9" WQXGA TFT LCD panel
> > +
> > +maintainers:
> > +  - Svyatoslav Ryhel <clamor95@gmail.com>
> > +
> > +description: >
> > +  This panel requires a dual-channel DSI host to operate and it suppor=
ts
> > +  only left-right split mode, where each channel drives the left or ri=
ght
> > +  half of the screen and only video mode.
> > +
> > +  Each of the DSI channels controls a separate DSI peripheral.
> > +  The peripheral driven by the first link (DSI-LINK1), left one, is
> > +  considered the primary peripheral and controls the device.
> > +
> > +allOf:
> > +  - $ref: panel-common-dual.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    const: sharp,lq079l1sx01
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  avdd-supply:
> > +    description: regulator that supplies the analog voltage
> > +
> > +  vddio-supply:
> > +    description: regulator that supplies the I/O voltage
> > +
> > +  vsp-supply:
> > +    description: positive boost supply regulator
> > +
> > +  vsn-supply:
> > +    description: negative boost supply regulator
> > +
> > +  reset-gpios:
> > +    maxItems: 1
> > +
> > +  backlight: true
> > +  ports: true
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - avdd-supply
> > +  - vddio-supply
> > +  - ports
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
> > +        panel@0 {
> > +            compatible =3D "sharp,lq079l1sx01";
> > +            reg =3D <0>;
> > +
> > +            reset-gpios =3D <&gpio 59 GPIO_ACTIVE_LOW>;
> > +
> > +            avdd-supply =3D <&avdd_lcd>;
> > +            vddio-supply =3D <&vdd_lcd_io>;
> > +            vsp-supply =3D <&vsp_5v5_lcd>;
> > +            vsn-supply =3D <&vsn_5v5_lcd>;
> > +
> > +            backlight =3D <&backlight>;
> > +
> > +            ports {
> > +                #address-cells =3D <1>;
> > +                #size-cells =3D <0>;
> > +
> > +                port@0 {
> > +                    reg =3D <0>;
> > +                    panel_in0: endpoint {
> > +                        remote-endpoint =3D <&dsi0_out>;
> > +                    };
> > +                };
> > +
> > +                port@1 {
> > +                    reg =3D <1>;
> > +                    panel_in1: endpoint {
> > +                        remote-endpoint =3D <&dsi1_out>;
> > +                    };
> > +                };
> > +            };
> > +        };
> > +    };
> > +...
>
