Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D477549FAC
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 22:45:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B1F610F968;
	Mon, 13 Jun 2022 20:45:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com
 [IPv6:2607:f8b0:4864:20::b2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D451910F968
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 20:45:06 +0000 (UTC)
Received: by mail-yb1-xb2f.google.com with SMTP id w2so11819259ybi.7
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 13:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=m5JCegGAYMi5Q9W2JQGuLDIcqo00Awy4QAwQXlwcWcE=;
 b=Y8PgXmY2/nGutxvyX2dVqsPiD/5+ONTAVCrb5dCOijLp6hOh6guiH0qrM/AiFzGG+L
 2zF2AhQ2OrJIp07OjeQZkImtrzevfAiZn6aQPFYk7tefYh8Atc6pUh3dMEF2rocc9zmP
 Dg3xzw03JF6KBjd+jSOcSvmgwkw8LZeAS0/XQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=m5JCegGAYMi5Q9W2JQGuLDIcqo00Awy4QAwQXlwcWcE=;
 b=4jQneSQKyPiT7/dnrmPNb2cxJrPsL4yWfk+4hNjsPd8b9/WRE19+W+h1mEclp2LXt7
 KkSle9FMXDz7p47cru/BmYVhDwg+Niuu50gPV1mNhZgaNm6Y7JDYqMZV2XxRKJhOWi3J
 Wn/NCy/HY9b6are6cq4wVwMx91WzK0gDAQT56L2T0vTFIOBrVIGohrrUB46wH3eGA/Ev
 M2T4+BjD5pI8PGnx/q1OBywznIlnCnXruHZdEcaFjkylOAQoo2+L1ArN6IsWJxK8fWGM
 944ofhmPTACGpkterF7KtRbBRmDp52OP7OM1a1jwG4mHQ538dldVSfou+xRqPARyc8pN
 rTcQ==
X-Gm-Message-State: AJIora9KpYGBB6c/j9EIOP02nIpfJKC4+rF4goOqmNUR5V2WgA6N6XJg
 GPZtqDQtMlrcd9fZGdQt7gykLpzE+VzxkkFb2+FE/w==
X-Google-Smtp-Source: AGRyM1t6Ihkfl/eHvd+ILi0J6eEA0HkYOgT9briyKqKgLuf0D40FSPRp8M7otpMGiIZHBU56xkDHGbRCug93NReu0Yk=
X-Received: by 2002:a25:ce83:0:b0:664:6360:41ae with SMTP id
 x125-20020a25ce83000000b00664636041aemr1514280ybe.336.1655153105879; Mon, 13
 Jun 2022 13:45:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220609181106.3695103-1-pmalani@chromium.org>
 <20220609181106.3695103-4-pmalani@chromium.org>
 <20220613203804.3d23gxidkw657ggq@notapiano>
In-Reply-To: <20220613203804.3d23gxidkw657ggq@notapiano>
From: Prashant Malani <pmalani@chromium.org>
Date: Mon, 13 Jun 2022 13:44:54 -0700
Message-ID: <CACeCKafwT2HbYqG=u+NwXtvD4R+EK_f7DCWn88WoHriP4iOMdw@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] dt-bindings: usb: Add Type-C switch binding
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
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
Cc: heikki.krogerus@linux.intel.com, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Tzung-Bi Shih <tzungbi@google.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonas Karlman <jonas@kwiboo.se>, swboyd@chromium.org,
 Pin-Yen Lin <treapking@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Maxime Ripard <maxime@cerno.tech>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Robert Foss <robert.foss@linaro.org>,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi N=C3=ADcolas,

On Mon, Jun 13, 2022 at 1:38 PM N=C3=ADcolas F. R. A. Prado
<nfraprado@collabora.com> wrote:
>
> Hi Prashant,
>
> thanks for the patch. Please see sugestions below.
>
> On Thu, Jun 09, 2022 at 06:09:42PM +0000, Prashant Malani wrote:
> > Introduce a binding which represents a component that can control the
> > routing of USB Type-C data lines as well as address data line
> > orientation (based on CC lines' orientation).
> >
> > Signed-off-by: Prashant Malani <pmalani@chromium.org>
> > ---
> >
> > Changes since v1:
> > - Removed "items" from compatible.
> > - Fixed indentation in example.
> >
> >  .../devicetree/bindings/usb/typec-switch.yaml | 74 +++++++++++++++++++
> >  1 file changed, 74 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/usb/typec-switch.=
yaml
> >
> > diff --git a/Documentation/devicetree/bindings/usb/typec-switch.yaml b/=
Documentation/devicetree/bindings/usb/typec-switch.yaml
> > new file mode 100644
> > index 000000000000..78b0190c8543
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/usb/typec-switch.yaml
> > @@ -0,0 +1,74 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/usb/typec-switch.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: USB Type-C Switch
> > +
> > +maintainers:
> > +  - Prashant Malani <pmalani@chromium.org>
> > +
> > +description:
> > +  A USB Type-C switch represents a component which routes USB Type-C d=
ata
> > +  lines to various protocol host controllers (e.g USB, VESA DisplayPor=
t,
> > +  Thunderbolt etc.) depending on which mode the Type-C port, port part=
ner
> > +  and cable are operating in. It can also modify lane routing based on
> > +  the orientation of a connected Type-C peripheral.
> > +
> > +properties:
> > +  compatible:
> > +    const: typec-switch
> > +
> > +  mode-switch:
> > +    type: boolean
> > +    description: Specify that this switch can handle alternate mode sw=
itching.
> > +
> > +  orientation-switch:
> > +    type: boolean
> > +    description: Specify that this switch can handle orientation switc=
hing.
> > +
> > +  ports:
> > +    $ref: /schemas/graph.yaml#/properties/ports
> > +    description: OF graph binding modelling data lines to the Type-C s=
witch.
> > +
> > +    properties:
> > +      port@0:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: Link between the switch and a Type-C connector.
>
> Since you have a single port, you can omit the ports node.

I've kept "ports", since it should be possible to add additional ports
which connect the switch to some other entity (and kept separate from
port@0), if the individual driver desires this.
port@0 should only contain the end-point from the Type-C connector.

>
> > +
> > +    required:
> > +      - port@0
> > +
> > +required:
> > +  - compatible
> > +  - ports
> > +
> > +anyOf:
> > +  - required:
> > +      - mode-switch
> > +  - required:
> > +      - orientation-switch
> > +
> > +additionalProperties: true
> > +
> > +examples:
> > +  - |
> > +    drm-bridge {
> > +        usb-switch {
> > +            compatible =3D "typec-switch";
> > +            mode-switch;
> > +            orientation-switch;
> > +            ports {
> > +                #address-cells =3D <1>;
> > +                #size-cells =3D <0>;
> > +
> > +                port@0 {
> > +                    reg =3D <0>;
> > +                    anx_ep: endpoint {
> > +                        remote-endpoint =3D <&typec_controller>;
> > +                    };
> > +                };
> > +            };
>
> So instead of ports you would have just
>
>                port {
>                    anx_ep: endpoint {
>                        remote-endpoint =3D <&typec_controller>;
>                    };
>                };
>
> And the same simplification on patch 4, for the anx7625 dt-binding.
>
> Thanks,
> N=C3=ADcolas
>
> > +        };
> > +    };
> > --
> > 2.36.1.476.g0c4daa206d-goog
> >
