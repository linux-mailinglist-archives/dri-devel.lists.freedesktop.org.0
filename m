Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D95B900260
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2024 13:38:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FCB010E045;
	Fri,  7 Jun 2024 11:38:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="iVGJ3Yir";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
 [209.85.208.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C557910E045
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2024 11:38:46 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id
 4fb4d7f45d1cf-57a1fe639a5so2442550a12.1
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jun 2024 04:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1717760325; x=1718365125;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o8M78VWmRUtxavNJng3PwXKm0bXhbM1TSJ/3rMl6z+Q=;
 b=iVGJ3YirSrLHL7BTUGKiBYR6EYK3JFCmds3UWg0fsOWXDcok0RxozEFWOectsFRCso
 nzIZgssLEAvwKPTYU4DVims8MCRNy9bOFV/f8OS8yLMrzlTpUsAl9kUMLtZGX311yiCA
 iqToCVdLc3yFlWGYImscLapUlGjOzuh6/m//5Jin16TacGMjZh8LF2nY/KnELqHkZ24r
 ryn2WHMpgJbQfJaggMGL3qyC+pda7LW0j9aE4VvDKPOA75bccKYzomIu8JwV7ym4nJxs
 YgrEoK4zfSruZQKBJ+ju9OvdQC62Xg9PY5DOC4dj/ONVtaf/7lOL+MlJX7atf8mfn/bM
 gDrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717760325; x=1718365125;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=o8M78VWmRUtxavNJng3PwXKm0bXhbM1TSJ/3rMl6z+Q=;
 b=mVTUBjf9MjAkGjMucZmBliKEjHoUGT7hC5OA0a/cqVgENRWdxF7Bv2Ll3MELm11hJ5
 UC7Yp9Fx55I2tfeEsBqtRwfxSTGn/TDrfrmL43y6m01xtp1AJ/+mVbBwq9Bepdq7C9VQ
 8D8C5EZIERcyKYBx2ro64gnrg7HawyBk8xqOgso/MOcX7CW3Sehmf1/deKg93hmCVenE
 CQoNWkuTeRTyRzzqJmtvcYHGjdNlgTXrCrzq2H6C4dGBqhoDVu3gSMmRowmZGdmQlZ5Z
 LjUM8w0/Wnk4QuvXrPudD+TVCovEDorSZH6pC4SD0I7cMB5BZzNupuz562NF7xSAd4vw
 KzLA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgBy4Bp/KfuFqC+XFWbMZqfelHLZm12nRvgjEsdxZbMej0rCSq62lm8stvUUpOuWjvUhp6Yxumj3CavAl66FwqgB5y5qb2FfZTlv7AllaJ
X-Gm-Message-State: AOJu0YxIK+rvUdw4JToDOVO8VWcgxtj8+DCvk8LNnal11UDIJdTZIfX2
 XrhbVvC821HN3xD9aVT14GlRXPQci5qTjCNWKpDnL4uI8LnlFbnaKIBzMrhmb5tGsb5fBlZCzTi
 skYgqIXqfoRYfQoOotwhelRLypdcoILQNwlNfSg==
X-Google-Smtp-Source: AGHT+IHSz32XzeyC24xOqlXfd0HDZNyhYS94xu0F5/pKnlVGfUOTS+SKqxPkF7GX/GJxRk+DUQoCkwugHUJ9MNuXE8c=
X-Received: by 2002:a50:8a92:0:b0:57a:1d0f:47f7 with SMTP id
 4fb4d7f45d1cf-57c5091b0d8mr1210103a12.17.1717760324720; Fri, 07 Jun 2024
 04:38:44 -0700 (PDT)
MIME-Version: 1.0
References: <20240601084528.22502-1-lvzhaoxiong@huaqin.corp-partner.google.com>
 <20240601084528.22502-2-lvzhaoxiong@huaqin.corp-partner.google.com>
 <oo6gggt2kpufvbwg6emoblg4opj2izdfjad4hzojbe7ddp57rp@a5vf23zrk22o>
In-Reply-To: <oo6gggt2kpufvbwg6emoblg4opj2izdfjad4hzojbe7ddp57rp@a5vf23zrk22o>
From: zhaoxiong lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Date: Fri, 7 Jun 2024 19:38:33 +0800
Message-ID: <CA+6=WdTPJxtGUt6pSanmwdYKz2wqCFv73K=BPb+9oDHrQcW=Sw@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: display: panel: Add KD101NE3-40TI
 support
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dmitry.torokhov@gmail.com, robh@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, jikos@kernel.org, 
 benjamin.tissoires@redhat.co, dianders@google.com, hsinyi@google.com, 
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

hi Dmitry Baryshkov

Because this is a separate mipi dsi driver, I did not put it in
panel-sample-dsi.yaml.


On Sun, Jun 2, 2024 at 12:28=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Sat, Jun 01, 2024 at 04:45:25PM +0800, Zhaoxiong Lv wrote:
> > Create a new dt-scheam for the kd101ne3-40ti.
> > The bias IC of this kindisplay-kd101ne3 panel is placed
> > on the panel side, so when the panel is powered on,
> > there is no need to control AVDD and AVEE in the driver.
> >
> > Signed-off-by: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com=
>
> > ---
> >
> > Chage since V2:
> >
> > -  Drop some properties that have already been defined in panel-common.
> > -  The header file 'dt-bindings/gpio/gpio.h' is not used, delete it
> >
> > V1: https://lore.kernel.org/all/20240418081548.12160-2-lvzhaoxiong@huaq=
in.corp-partner.google.com/
> >
> > ---
> >  .../panel/kingdisplay,kd101ne3-40ti.yaml      | 59 +++++++++++++++++++
> >  1 file changed, 59 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/panel/kin=
gdisplay,kd101ne3-40ti.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/display/panel/kingdispla=
y,kd101ne3-40ti.yaml b/Documentation/devicetree/bindings/display/panel/king=
display,kd101ne3-40ti.yaml
> > new file mode 100644
> > index 000000000000..b0cf12bb727d
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/panel/kingdisplay,kd101=
ne3-40ti.yaml
> > @@ -0,0 +1,59 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/panel/kingdisplay,kd101ne3-=
40ti.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Kingdisplay KD101NE3-40TI based MIPI-DSI panels
> > +
> > +maintainers:
> > +  - Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
>
> Any reason for using a separate bindings instead of extending
> panel-simple-dsi.yaml ?
>
> > +
> > +allOf:
> > +  - $ref: panel-common.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - enum:
> > +          - kingdisplay,kd101ne3-40ti
> > +
> > +  reg:
> > +    description: the virtual channel number of a DSI peripheral
> > +
> > +  pp3300-supply:
> > +    description: core voltage supply
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - pp3300-supply
> > +  - enable-gpios
> > +  - backlight
> > +  - port
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    dsi {
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <0>;
> > +        panel: panel@0 {
> > +            compatible =3D "kingdisplay,kd101ne3-40ti";
> > +            reg =3D <0>;
> > +            enable-gpios =3D <&pio 98 0>;
> > +            pinctrl-names =3D "default";
> > +            pinctrl-0 =3D <&panel_pins_default>;
> > +            pp3300-supply =3D <&en_pp6000_mipi_disp>;
> > +            backlight =3D <&backlight_lcd0>;
> > +            rotation =3D <90>;
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
> > 2.17.1
> >
>
> --
> With best wishes
> Dmitry
