Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 212D7BC7660
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 07:06:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C60B010E1DF;
	Thu,  9 Oct 2025 05:06:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DabzUlvf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6410210E1DF
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Oct 2025 05:06:33 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-46e2e363118so4119845e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Oct 2025 22:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759986392; x=1760591192; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CdHEjQxG+FatWNW5/zKqLPCIUyKLAYeWhQuCe1gPWoU=;
 b=DabzUlvfkkmmtOaL5EjdwxVcew+pEmW1aiSn4fHTn4YqNvaS83EKZjCTpgpBM4DkS2
 Z48hpbr+noDHzY/aP7+EXgTfNst5XmV4RXCbF5seAN/HIMOvo0S5oujdgr7c/M/g3CmE
 cKesp041czBQk696SIPmfuMObyMhJLa4+BdPYOF7+MpIRw7ePPwsiB1kOxzkWZiVdAfa
 v2FgmLCmv+Gp9433swjNO7KDKOa2VmQ8HyKQIcTmzJM57Er52gm4/U23xiLW+PPYOeRx
 WP8tjlyAlG1qtTPUvP5a8IZGVBmqRCChs+D5iDYu0RTCC1aaZa2r2Wxti1nvcmsL+7hT
 CEXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759986392; x=1760591192;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CdHEjQxG+FatWNW5/zKqLPCIUyKLAYeWhQuCe1gPWoU=;
 b=VrcLswo8PeZTvJlwJJ1IYdIogh86a/a1YXHIDehJAxvI7x+d6ZOm4EkyeLZ73QdUIU
 mjwyR26gIP1BAV+IcGPTnStlR8fJuopqfZGI4II/jRcfTfEnbZqSFOqB5NM9dpWOd3Rl
 aznx+R6FF+rc2cxK/8aqHw66VPoUjy/P3VavKkwqkip62jc2szTP5d/qER+sjWVBdf8/
 ViwUEQMiO1y02qmneOJUWRe4Ql9JO51NpnxRIRZE/v68A+W4SmLOSxll3CWtoT6KB4OJ
 Y4KxQKuk4Msar3GxgtJKnN8njFb2z8trCCIaGQVySfTuhJgj5ni0mtZEaNssEHHSQc+q
 rTEg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWlBdUCWag6yIZ+K7jBABgh+Y6rzZD6RWEAHmL2yxURHn0SV8RgIY/UR1b+IJ+hXcraouwtKReIKMU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz3mi1ThVA6rhXOJgve5bSicXzXpEe9GUIy9K3UxwtzZAg4KKjq
 yOkfUvU0onZmMOUe/8MjL/tmUKP3NRV5Krlp6ZdZBJ3eHjzWmEGeCEev5oY2LSt2Ikr1GDaNhfm
 5NOyxkLxqB9O96In9ESNdTOQaSHa4ZaY=
X-Gm-Gg: ASbGncvkWpOKWIH5C2CFs7adamY1OZnkz+1vqedGc0UuCVxexe0BC1i6CaD19Y9+4Ws
 DPNcm8sVf9MIexreMLVT6nwTZXn/Hy1KQ937AjQ6CvBaWTWsrzWwDrspBP6hUDovPS9bRO9zOD8
 B9UxJEZwRzQAF2TGjfaBCFBrRIo8pxzZ16if8TXw7z/GImlx6CC3ttKngwsq+pJ9TapIHjl0+I3
 x/MwGL9D/HH7NZxSICGpZpvcs8Zzi2H
X-Google-Smtp-Source: AGHT+IHqYRmivewqb9zg+yu8zGgOx+vqqkeXoxUzMI4NUKSxwIhgIh4uZTenWgZghGln5muMkEwQ0EmS5xQOqziJeM4=
X-Received: by 2002:a05:6000:603:b0:3ea:4e8b:c96a with SMTP id
 ffacd0b85a97d-4266e8e64e4mr3654211f8f.57.1759986391521; Wed, 08 Oct 2025
 22:06:31 -0700 (PDT)
MIME-Version: 1.0
References: <20251008082800.67718-1-clamor95@gmail.com>
 <20251008082800.67718-2-clamor95@gmail.com>
 <20251008-safely-reach-9274474a2ec8@spud>
In-Reply-To: <20251008-safely-reach-9274474a2ec8@spud>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 9 Oct 2025 08:06:20 +0300
X-Gm-Features: AS18NWC-fQyHK-rMvVxkxqV6S0I7hbIVFXE8xA55zUXu7V0ibTLESXEQf_mVWkM
Message-ID: <CAPVz0n2pbAS3Qjm9WQGvcuJhkNnyjGCyJtVi=VMuUgPoQNE+wA@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] dt-bindings: display: panel: properly document LG
 LD070WX3 panel
To: Conor Dooley <conor@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Douglas Anderson <dianders@chromium.org>, Sam Ravnborg <sam@ravnborg.org>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
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

=D1=87=D1=82, 9 =D0=B6=D0=BE=D0=B2=D1=82. 2025=E2=80=AF=D1=80. =D0=BE 00:11=
 Conor Dooley <conor@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Wed, Oct 08, 2025 at 11:27:53AM +0300, Svyatoslav Ryhel wrote:
> > LG LD070WX3-SL01 was mistakenly documented as a simple DSI panel, which=
 it
> > clearly is not. Address this by adding the proper schema for this panel=
.
> >
> > There is only one user of this panel binding in the mainline Linux kern=
el,
> > which is the Nvidia tablet Tegra Note 7. Its panel is broken anyway sin=
ce
> > it cannot initialize properly if the bootloader does not leave a
> > pre-initialized panel. It also cannot suspend or re-initialize properly=
,
> > since no DSI configuration is set and it has a loose regulator which
> > relies on an always-on property rather than being hooked to the panel
> > where it belongs.
>
> I think this is a reasonable justification. For my own enlightenment,
> what happens if a new kernel uses the old simple-panel devicetree?
>

Since regulator framework provides dummy regulators and compatible
matches, driver should probe correctly. Panel should still work with
unpatched device tree until disabling unused regulators/power domains
kicks in.

> > Tegra Note 7 device tree is adjusted as a part of this series.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  .../bindings/display/panel/lg,ld070wx3.yaml   | 60 +++++++++++++++++++
> >  .../display/panel/panel-simple-dsi.yaml       |  2 -
> >  2 files changed, 60 insertions(+), 2 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/display/panel/lg,=
ld070wx3.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/display/panel/lg,ld070wx=
3.yaml b/Documentation/devicetree/bindings/display/panel/lg,ld070wx3.yaml
> > new file mode 100644
> > index 000000000000..0a82cf311452
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/panel/lg,ld070wx3.yaml
> > @@ -0,0 +1,60 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/panel/lg,ld070wx3.yaml#
>
> Could you make the filename match the compatible please?

Filename matches compatible, -XXNN after lg,ld070wx3 indicate
revision. I have found at least two more -sm01 and -sh01, but since I
was not able to get datasheet for them I cannot say for sure that they
fully compatible with this schema.

> With that,
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
>
> Cheers,
> Conor.
>
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: LG Corporation 7" WXGA TFT LCD panel
> > +
> > +maintainers:
> > +  - Svyatoslav Ryhel <clamor95@gmail.com>
> > +
> > +allOf:
> > +  - $ref: panel-common.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - const: lg,ld070wx3-sl01
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  vdd-supply: true
> > +  vcc-supply: true
> > +
> > +  backlight: true
> > +  port: true
> > +
> > +required:
> > +  - compatible
> > +  - vdd-supply
> > +  - vcc-supply
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
> > +            compatible =3D "lg,ld070wx3-sl01";
> > +            reg =3D <0>;
> > +
> > +            vdd-supply =3D <&vdd_3v3_lcd>;
> > +            vcc-supply =3D <&vcc_1v8_lcd>;
> > +
> > +            backlight =3D <&backlight>;
> > +
> > +            port {
> > +                endpoint {
> > +                    remote-endpoint =3D <&dsi0_out>;
> > +                };
> > +            };
> > +        };
> > +    };
> > +...
> > diff --git a/Documentation/devicetree/bindings/display/panel/panel-simp=
le-dsi.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple-=
dsi.yaml
> > index 9b92a05791cc..f9f1e76a810c 100644
> > --- a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.=
yaml
> > +++ b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.=
yaml
> > @@ -42,8 +42,6 @@ properties:
> >        - kingdisplay,kd097d04
> >          # LG ACX467AKM-7 4.95" 1080=C3=971920 LCD Panel
> >        - lg,acx467akm-7
> > -        # LG Corporation 7" WXGA TFT LCD panel
> > -      - lg,ld070wx3-sl01
> >          # LG Corporation 5" HD TFT LCD panel
> >        - lg,lh500wx1-sd03
> >          # Lincoln LCD197 5" 1080x1920 LCD panel
> > --
> > 2.48.1
> >
