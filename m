Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68BEE900298
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2024 13:49:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 698B210EBFE;
	Fri,  7 Jun 2024 11:49:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="GOFKOQPG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com
 [209.85.219.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5850110EBFE
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2024 11:49:02 +0000 (UTC)
Received: by mail-yb1-f171.google.com with SMTP id
 3f1490d57ef6-df771b6cf71so2256322276.2
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jun 2024 04:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717760941; x=1718365741; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aaxauWMNivX2Xh96RfVBzt0WPh7okmPnKiLgSACVt0o=;
 b=GOFKOQPGx8b1ZFuIzXdFAX2kN5Bgpzdlu9E2JeS7OPyRcAfb1pBhUTbT0hcFrtqvx4
 Oxc7ntB2v44F9+/Z6naxjUWeVZDMlfgSgKOD39RI5Zc8wHhpq2trb27Wnj1ZFO9iCtnQ
 s+OJvP/SrPDQOmyUVRlJW8aaH0JEpRarulbAfZWcsxhnn1YwnivLNWdWqo4mTpqpjT3h
 wwBHNb64d+r/rA8qJ0DArMIRk6gspN40iuUBk1bw9Idq6vPvO4cb1fjC1eO2LxI5HW1b
 zuPuBrSiYOsCXe5L3jS4OE7LNgq3cdQyFTCb5nHVstzBHjeGDW7SapK4SMR2LA/XYhOY
 8Z7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717760941; x=1718365741;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aaxauWMNivX2Xh96RfVBzt0WPh7okmPnKiLgSACVt0o=;
 b=V4255J2t/it+tMdjtSLMGr4yEuohnKLoogvPisdx0dN9vu95djnt2cn/bgIkyJpwCf
 49jEjpLDwGh4Ae1ynYly6FBMJ2kbfWRiQwdo2XwvcoQeCZG3JvJV1kpL9+uOiN96cjvp
 z6apX63qL+IyqOAb0ARa2xEZyXHuYZs/fSWgftnCIenIgDutMF1NFaLfKFDySq5aKRLW
 zEDbSKNpJcyYrfKhgHD5yigjVtZGcBeE6TAsdczKGP2Mu7xwlvYnHUpgvS6sKMUhceNB
 VzvAsYABpqWUVFliARgZx0EL0kf4KPEF0G+UWLu7aYA+PLSvujN7vt6eZphF5Jz1d2R/
 ZB4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMqUBK2N/iibdhSwMYIgI+CqLQWGcTO4sz6hTqLbAwutNSKB4nkOduBNsuK8SkByjhq3NteFIPeLq3O/kSiS+N7gZVaW4ndoFmih4UVaUs
X-Gm-Message-State: AOJu0Ywg5TanlaTSdaIqw7VRRo0jzmsavvopB1UU6SC1f4DtZxHmb3nO
 niOzz5kX9OoW66rLnGaDvptn6oVXUaJKOneDgN6jgCSNm4gtYNcI3OaJuggoEwwIAbCUlytETOF
 R+869PSniNLwg1UtHOSQweW4Nj8tS2nVOm0aThA==
X-Google-Smtp-Source: AGHT+IEvLOEOxMW8QOmpMJOUqm62o8XRyN7BdmXOZVOMDNpN7DmrTQqwPsmrngbZSGqsWg4DDlh5AFn7ma7MoM98/qc=
X-Received: by 2002:a25:d648:0:b0:dfa:7ac9:fad1 with SMTP id
 3f1490d57ef6-dfaf663d8a9mr2327430276.24.1717760941376; Fri, 07 Jun 2024
 04:49:01 -0700 (PDT)
MIME-Version: 1.0
References: <20240601084528.22502-1-lvzhaoxiong@huaqin.corp-partner.google.com>
 <20240601084528.22502-2-lvzhaoxiong@huaqin.corp-partner.google.com>
 <oo6gggt2kpufvbwg6emoblg4opj2izdfjad4hzojbe7ddp57rp@a5vf23zrk22o>
 <CA+6=WdTPJxtGUt6pSanmwdYKz2wqCFv73K=BPb+9oDHrQcW=Sw@mail.gmail.com>
In-Reply-To: <CA+6=WdTPJxtGUt6pSanmwdYKz2wqCFv73K=BPb+9oDHrQcW=Sw@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 7 Jun 2024 14:48:50 +0300
Message-ID: <CAA8EJpqOZ2zXQo5F01Q208Bk-KM-awfhNtuq4iM8=FEkLqfkpA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: display: panel: Add KD101NE3-40TI
 support
To: zhaoxiong lv <lvzhaoxiong@huaqin.corp-partner.google.com>
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

On Fri, 7 Jun 2024 at 14:38, zhaoxiong lv
<lvzhaoxiong@huaqin.corp-partner.google.com> wrote:
>
> hi Dmitry Baryshkov
>
> Because this is a separate mipi dsi driver, I did not put it in
> panel-sample-dsi.yaml.

Driver and bindings are two separate things. Bindings describe the
hardware. If there is no other reason to have a separate bindings
document, please use panel-simple-dsi.yaml.

Also please don't top-post in public mailing lists.

>
>
> On Sun, Jun 2, 2024 at 12:28=E2=80=AFAM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > On Sat, Jun 01, 2024 at 04:45:25PM +0800, Zhaoxiong Lv wrote:
> > > Create a new dt-scheam for the kd101ne3-40ti.
> > > The bias IC of this kindisplay-kd101ne3 panel is placed
> > > on the panel side, so when the panel is powered on,
> > > there is no need to control AVDD and AVEE in the driver.
> > >
> > > Signed-off-by: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.c=
om>
> > > ---
> > >
> > > Chage since V2:
> > >
> > > -  Drop some properties that have already been defined in panel-commo=
n.
> > > -  The header file 'dt-bindings/gpio/gpio.h' is not used, delete it
> > >
> > > V1: https://lore.kernel.org/all/20240418081548.12160-2-lvzhaoxiong@hu=
aqin.corp-partner.google.com/
> > >
> > > ---
> > >  .../panel/kingdisplay,kd101ne3-40ti.yaml      | 59 +++++++++++++++++=
++
> > >  1 file changed, 59 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/display/panel/k=
ingdisplay,kd101ne3-40ti.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/display/panel/kingdisp=
lay,kd101ne3-40ti.yaml b/Documentation/devicetree/bindings/display/panel/ki=
ngdisplay,kd101ne3-40ti.yaml
> > > new file mode 100644
> > > index 000000000000..b0cf12bb727d
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/display/panel/kingdisplay,kd1=
01ne3-40ti.yaml
> > > @@ -0,0 +1,59 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/display/panel/kingdisplay,kd101ne=
3-40ti.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Kingdisplay KD101NE3-40TI based MIPI-DSI panels
> > > +
> > > +maintainers:
> > > +  - Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
> >
> > Any reason for using a separate bindings instead of extending
> > panel-simple-dsi.yaml ?
> >
> > > +
> > > +allOf:
> > > +  - $ref: panel-common.yaml#
> > > +
> > > +properties:
> > > +  compatible:
> > > +    items:
> > > +      - enum:
> > > +          - kingdisplay,kd101ne3-40ti
> > > +
> > > +  reg:
> > > +    description: the virtual channel number of a DSI peripheral
> > > +
> > > +  pp3300-supply:
> > > +    description: core voltage supply
> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +  - pp3300-supply
> > > +  - enable-gpios
> > > +  - backlight
> > > +  - port
> > > +
> > > +unevaluatedProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    dsi {
> > > +        #address-cells =3D <1>;
> > > +        #size-cells =3D <0>;
> > > +        panel: panel@0 {
> > > +            compatible =3D "kingdisplay,kd101ne3-40ti";
> > > +            reg =3D <0>;
> > > +            enable-gpios =3D <&pio 98 0>;
> > > +            pinctrl-names =3D "default";
> > > +            pinctrl-0 =3D <&panel_pins_default>;
> > > +            pp3300-supply =3D <&en_pp6000_mipi_disp>;
> > > +            backlight =3D <&backlight_lcd0>;
> > > +            rotation =3D <90>;
> > > +            port {
> > > +                panel_in: endpoint {
> > > +                    remote-endpoint =3D <&dsi_out>;
> > > +                };
> > > +            };
> > > +        };
> > > +    };
> > > +
> > > +...
> > > --
> > > 2.17.1
> > >
> >
> > --
> > With best wishes
> > Dmitry



--=20
With best wishes
Dmitry
