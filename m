Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE7F67BF74
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 22:59:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC5E210E087;
	Wed, 25 Jan 2023 21:59:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x92e.google.com (mail-ua1-x92e.google.com
 [IPv6:2607:f8b0:4864:20::92e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 209BF10E8BF
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jan 2023 21:59:54 +0000 (UTC)
Received: by mail-ua1-x92e.google.com with SMTP id r10so2130152ual.3
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jan 2023 13:59:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=criticallink.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=PQ5Mm5ygDFJ/dbpXHc8aAO+GKU6ptqcF+btQdWq/FjQ=;
 b=k3ppRTlBBGLRNaaLWoiXK9R56Ttogya6SSKR7o/k4rXxD/wEfQ1bgYq0B/GYeOWqfI
 YhLXDUAeggwXR9kIEXDsFjb3kYGAXc/cSnVMrC1bYHGTJ7mQAtOQmP45RVxmuiW6CJ0f
 bqVzigypl50W9XtpidbG37z5wF3FE7ljyQkX1jyFPkuK9EiUTn1yr7oRPWuo5FTF78w3
 d1kuUo222ArFeF0KoR2JDpYJaVXYQ7Pn3cnslgHDD/52BiMzot+3SlPDXTfG9dIMLKwi
 XkdGBT6760p0zsvUb7z/4dsuubRw6iXflzw6ZBO/WwmoGZCwhwVgoOeHfZCLZ+LaWB+g
 aHig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PQ5Mm5ygDFJ/dbpXHc8aAO+GKU6ptqcF+btQdWq/FjQ=;
 b=uwV5Ch+9pPBEcMjCYSZ9VBo6iLHz0/Lrs/4Kf9unhJMDL5jaHkUnPwkcwOscWl02K3
 +CzeGec/E37Rs09ILJQrJr3KFem/ooenD8Dq2Za97OQ/SjMN/lmKRA4569ODEklib/7d
 n6KeiYwOKAcrqquPvcNALaHHk/SLp/cnyZE6uT+aHHGxny34ezdpedfefx4L/Kn0MpIv
 0RjXio/7f0hXJlDMGr6/+kZ1qRFZGunLOM4/hZU3i/2ZR+Pj/bhodBSkBvAvxnxKbpgl
 LzbbzvLC0y5aZ7f/RF7VdlvbdeBWSVDQRIIRzUTWVFgQUbNfWA1Pc+1mB6ZLalkP3/8q
 hP0Q==
X-Gm-Message-State: AO0yUKVWD6SGRCvnuH2NknEWUZsjWYha38y73rMjxNRmGZEBR2MlHfcS
 QkX+i7x1AXIvV1j5ZSNw7Pd0hDN/G/0Kjy03B3LlEg==
X-Google-Smtp-Source: AK7set/0yJAWCwrxnr8GVGtPpFu9vcmoxfKwCikOjdfR+xtz3EDp3RRSro35y/qInifYZ4Io23kqMnHm9kaVY62GHSg=
X-Received: by 2002:ab0:230d:0:b0:654:fe4b:af9c with SMTP id
 a13-20020ab0230d000000b00654fe4baf9cmr913514uao.81.1674683992901; Wed, 25 Jan
 2023 13:59:52 -0800 (PST)
MIME-Version: 1.0
References: <20230125-tfp410_i2c-v1-0-66a4d4e390b7@criticallink.com>
 <20230125-tfp410_i2c-v1-1-66a4d4e390b7@criticallink.com>
 <Y9GeD/vXZ1RJ1MLZ@pendragon.ideasonboard.com>
In-Reply-To: <Y9GeD/vXZ1RJ1MLZ@pendragon.ideasonboard.com>
From: Jon Cormier <jcormier@criticallink.com>
Date: Wed, 25 Jan 2023 16:59:41 -0500
Message-ID: <CADL8D3YggahBhipLVO1_E+0+N8bQgzfwkwPUkFm3MxD_F-m-nQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: display: bridge: tfp410: Add tfp410 i2c
 example
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 dri-devel@lists.freedesktop.org, Jyri Sarha <jsarha@ti.com>,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Michael Williamson <michael.williamson@criticallink.com>,
 Bob Duke <bduke@criticallink.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 25, 2023 at 4:24 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Jonathan,
>
> Thank you for the patch.
>
> On Wed, Jan 25, 2023 at 04:09:09PM -0500, Jonathan Cormier wrote:
> > Add a i2c example with HDMI connector
> >
> > Signed-off-by: Jonathan Cormier <jcormier@criticallink.com>
> > ---
> >  .../bindings/display/bridge/ti,tfp410.yaml         | 42 ++++++++++++++++++++++
> >  1 file changed, 42 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/display/bridge/ti,tfp410.yaml b/Documentation/devicetree/bindings/display/bridge/ti,tfp410.yaml
> > index 4c5dd8ec2951..456214f14b47 100644
> > --- a/Documentation/devicetree/bindings/display/bridge/ti,tfp410.yaml
> > +++ b/Documentation/devicetree/bindings/display/bridge/ti,tfp410.yaml
> > @@ -116,4 +116,46 @@ examples:
> >          };
> >      };
> >
> > +  - |
> > +    i2c {
> > +      #address-cells = <1>;
> > +      #size-cells = <0>;
>
> Please use 4 spaces for indentation, as in the other example.
Will do, the whole file is 2 space indents. I didn't notice the
examples switch to 4 spaces.
>
> > +
> > +      hdmi_encoder: tfp410@38 {
> > +        compatible = "ti,tfp410";
> > +        reg = <0x38>;
> > +
> > +        ports {
> > +          address-cells = <1>;
> > +          size-cells = <0>;
> > +
> > +          port@0 {
> > +            reg = <0>;
> > +            tfp410_in: endpoint {
> > +              remote-endpoint = <&dpi1_out>;
> > +            };
> > +          };
> > +
> > +          port@1 {
> > +            reg = <1>;
> > +            tfp410_out: endpoint {
> > +              remote-endpoint = <&hdmi_connector_in>;
> > +            };
> > +          };
> > +        };
> > +      };
> > +    };
> > +
> > +    hdmi: hdmi_connector {
> > +      compatible = "hdmi-connector";
> > +      label = "hdmi";
> > +      type = "a";
> > +      ddc-i2c-bus = <&i2c1>;
> > +      port {
> > +        hdmi_connector_in: endpoint {
> > +          remote-endpoint = <&tfp410_out>;
> > +        };
> > +      };
> > +    };
> > +
>
> You can drop the hdmi connector, the example will still validate.
Okay
>
> >  ...
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Jonathan Cormier
Software Engineer

Voice:  315.425.4045 x222



http://www.CriticalLink.com
6712 Brooklawn Parkway, Syracuse, NY 13211
