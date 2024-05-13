Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7337E8C3F14
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 12:39:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE31510E629;
	Mon, 13 May 2024 10:39:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="PtYJL3HZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com
 [209.85.166.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68B2510E629
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 10:39:15 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id
 ca18e2360f4ac-7d9e70f388fso202337039f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 03:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1715596754; x=1716201554;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=buebxfvhrKsxWwmHpN8HIqeIzqJ1dJvpRSV41poUdTw=;
 b=PtYJL3HZuFcPLNeeHOxLThGzfC6EkaeQCk7pe4mhv+vxBf1npoUI90PZt1og/naxhE
 ajlYZ1+uHGXucVCaEzJeibUVW/7729kiEg2mEEmfmydB7btGzv3+jiNLhPl10FBob2yQ
 yqcbWYT+H7uuCHxcJU364dFPogSLJDc+l0aVxtm1F41Q9U+iFe31nFWv3B7JoJSwE2xj
 zg0yIQc1tsiH53vN2D7fOVcslbUS/bwo5uavKgDLz2i2wYQPiPCxtDEYw6pfcMnyzml/
 xsNqSBQFxwGB1wX93iyojIUN/DpEfyCCtDrkAyoT+0kzldAVtxkjO75xpBXRTxMsUyLw
 SBgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715596754; x=1716201554;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=buebxfvhrKsxWwmHpN8HIqeIzqJ1dJvpRSV41poUdTw=;
 b=RPrvUwRI787IB3OCT6Y6FNY24/4rdyCnmd9mEvkmASHRSwTMHVZeGmdjs3iEPnpaix
 tbgJ93QN/qzF9Oq9BKOw9oWybVbjFDJOZiC8jwFFM6yskHU7UFvMPeWdJY4zV81zs1h7
 zBRKIiIBBrmg4Ievc4AHXJZvxSUVWYy3CZBGHtciXkGEiUoM606rxs1d75QHWyI2VlsU
 /ipZVsItMDqDfAaokGzZqzPuPSCS18e+5j5EswDZoxMgdJ1U+QijLCf/ZU0bO1ICIvf2
 DQ09WdORu4scuWHBXO7y9yKf0rHBw2R6iKvo21TS8TQDsLeNmb+TMdRDs3FPmH/0KIj3
 sM2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXhJ9wRyTk+wjl5FXEpcnrVjcqWYS5CfH2Ts/kBApGFd/QKXvd4fOhhyOATNQ/Vzpr4TlxKY+iGd+OOyZpffkPbuNPK6/As0oFn+ZXRik8S
X-Gm-Message-State: AOJu0Yx7reSs9jlV6+AJpczxM7i1Irvg57SpVs9Mhxw+/jtniDjChCL2
 Zf3bCGgg1BF7gFKpOYNzCjRCTO2wKf+BIFtFnZPEQROiCHaS7Qe5udiMHXPPMHo9JcJ7gJARN2E
 MdWqP9xOSLwNYHHgwRJarmJ/4dbncG4p+q0rq
X-Google-Smtp-Source: AGHT+IGpxlYX8+VKGkmtPuAIMGxA5UAZbcx0MnAYFeFpA91msfpdz6rwOjVALAC61BpdL+rxCAb37kOiJezzIguf1p0=
X-Received: by 2002:a5e:8e0b:0:b0:7de:e432:fd27 with SMTP id
 ca18e2360f4ac-7e1b5207a33mr1205090239f.13.1715596754196; Mon, 13 May 2024
 03:39:14 -0700 (PDT)
MIME-Version: 1.0
References: <20240507155413.266057-1-panikiel@google.com>
 <20240507155413.266057-10-panikiel@google.com>
 <20240510212442.GA758313-robh@kernel.org>
In-Reply-To: <20240510212442.GA758313-robh@kernel.org>
From: =?UTF-8?Q?Pawe=C5=82_Anikiel?= <panikiel@google.com>
Date: Mon, 13 May 2024 12:39:02 +0200
Message-ID: <CAM5zL5qx06f7v-fEXRT1=dZ2s=Vo5eske2GrcMubf2ZuPFJ7mA@mail.gmail.com>
Subject: Re: [PATCH v3 09/10] media: dt-bindings: Add Intel Displayport RX IP
To: Rob Herring <robh@kernel.org>
Cc: airlied@gmail.com, akpm@linux-foundation.org, conor+dt@kernel.org, 
 daniel@ffwll.ch, dinguyen@kernel.org, hverkuil-cisco@xs4all.nl, 
 krzysztof.kozlowski+dt@linaro.org, maarten.lankhorst@linux.intel.com, 
 mchehab@kernel.org, mripard@kernel.org, tzimmermann@suse.de, 
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 chromeos-krk-upstreaming@google.com
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

On Fri, May 10, 2024 at 11:24=E2=80=AFPM Rob Herring <robh@kernel.org> wrot=
e:
>
> On Tue, May 07, 2024 at 03:54:12PM +0000, Pawe=C5=82 Anikiel wrote:
> > Add dt binding for the Intel Displayport receiver FPGA IP.
> > It is a part of the DisplayPort Intel FPGA IP Core, and supports
> > DisplayPort 1.4, HBR3 video capture and Multi-Stream Transport.
> >
> > The user guide can be found here:
> > https://www.intel.com/programmable/technical-pdfs/683273.pdf
> >
> > Signed-off-by: Pawe=C5=82 Anikiel <panikiel@google.com>
> > ---
> >  .../devicetree/bindings/media/intel,dprx.yaml | 172 ++++++++++++++++++
> >  1 file changed, 172 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/intel,dprx.=
yaml
> >
> > diff --git a/Documentation/devicetree/bindings/media/intel,dprx.yaml b/=
Documentation/devicetree/bindings/media/intel,dprx.yaml
> > new file mode 100644
> > index 000000000000..01bed858f746
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/intel,dprx.yaml
> > @@ -0,0 +1,172 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/media/intel,dprx.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Intel DisplayPort RX IP
> > +
> > +maintainers:
> > +  - Pawe=C5=82 Anikiel <panikiel@google.com>
> > +
> > +description: |
> > +  The Intel Displayport RX IP is a part of the DisplayPort Intel FPGA =
IP
> > +  Core. It implements a DisplayPort 1.4 receiver capable of HBR3 video
> > +  capture and Multi-Stream Transport.
> > +
> > +  The IP features a large number of configuration parameters, found at=
:
> > +  https://www.intel.com/content/www/us/en/docs/programmable/683273/23-=
3-20-0-1/sink-parameters.html
> > +
> > +  The following parameters have to be enabled:
> > +    - Support DisplayPort sink
> > +    - Enable GPU control
> > +  The following parameters have to be set in the devicetree:
> > +    - RX maximum link rate (using link-frequencies)
> > +    - Maximum lane count (using data-lanes)
> > +    - Support MST (using multi-stream-support)
> > +    - Max stream count (inferred from the number of ports)
> > +
> > +properties:
> > +  compatible:
> > +    const: intel,dprx-20.0.1
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  ports:
> > +    $ref: /schemas/graph.yaml#/properties/ports
> > +
> > +    properties:
> > +      port@0:
> > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > +        description: MST virtual channel 0 or SST main link
> > +
> > +        properties:
> > +          endpoint:
> > +            $ref: /schemas/media/video-interfaces.yaml#
> > +
> > +            properties:
> > +              link-frequencies: true
> > +
> > +              data-lanes:
> > +                minItems: 1
> > +                maxItems: 4
> > +
> > +              multi-stream-support: true
> > +
> > +            required:
> > +              - data-lanes
> > +              - link-frequencies
> > +
> > +      port@1:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: MST virtual channel 0 or SST main link
>
> How can port@0 also be "MST virtual channel 0 or SST main link"?

Sorry, I made a mistake. port@0 should be something like "Input port".

>
> > +
> > +      port@2:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: MST virtual channel 1
> > +
> > +      port@3:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: MST virtual channel 2
> > +
> > +      port@4:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: MST virtual channel 3
> > +
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - ports
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +
> > +    dp-receiver@c0062000 {
> > +        compatible =3D "intel,dprx-20.0.1";
> > +        reg =3D <0xc0062000 0x800>;
> > +        interrupt-parent =3D <&dprx_mst_irq>;
> > +        interrupts =3D <0 IRQ_TYPE_EDGE_RISING>;
> > +
> > +        ports {
> > +            #address-cells =3D <1>;
> > +            #size-cells =3D <0>;
> > +
> > +            port@0 {
> > +                reg =3D <0>;
> > +                dprx_mst_in: endpoint {
> > +                    remote-endpoint =3D <&dp_input_mst_0>;
> > +                    data-lanes =3D <0 1 2 3>;
> > +                    link-frequencies =3D /bits/ 64 <1620000000 2700000=
000
> > +                                                  5400000000 810000000=
0>;
> > +                    multi-stream-support;
> > +                };
> > +            };
> > +
> > +            port@1 {
> > +                reg =3D <1>;
> > +                dprx_mst_0: endpoint {
> > +                    remote-endpoint =3D <&video_mst0_0>;
> > +                };
> > +            };
> > +
> > +            port@2 {
> > +                reg =3D <2>;
> > +                dprx_mst_1: endpoint {
> > +                    remote-endpoint =3D <&video_mst1_0>;
> > +                };
> > +            };
> > +
> > +            port@3 {
> > +                reg =3D <3>;
> > +                dprx_mst_2: endpoint {
> > +                    remote-endpoint =3D <&video_mst2_0>;
> > +                };
> > +            };
> > +
> > +            port@4 {
> > +                reg =3D <4>;
> > +                dprx_mst_3: endpoint {
> > +                    remote-endpoint =3D <&video_mst3_0>;
> > +                };
> > +            };
> > +        };
> > +    };
> > +
> > +  - |
> > +    dp-receiver@c0064000 {
> > +        compatible =3D "intel,dprx-20.0.1";
> > +        reg =3D <0xc0064000 0x800>;
> > +        interrupt-parent =3D <&dprx_sst_irq>;
> > +        interrupts =3D <0 IRQ_TYPE_EDGE_RISING>;
> > +
> > +        ports {
> > +            #address-cells =3D <1>;
> > +            #size-cells =3D <0>;
> > +
> > +            port@0 {
> > +                reg =3D <0>;
> > +                dprx_sst_in: endpoint {
> > +                    remote-endpoint =3D <&dp_input_sst_0>;
> > +                    data-lanes =3D <0 1 2 3>;
> > +                    link-frequencies =3D /bits/ 64 <1620000000 2700000=
000
> > +                                                  5400000000 810000000=
0>;
> > +                };
> > +            };
> > +
> > +            port@1 {
> > +                reg =3D <1>;
> > +                dprx_sst_0: endpoint {
> > +                    remote-endpoint =3D <&video_sst_0>;
> > +                };
> > +            };
> > +        };
> > +    };
> > --
> > 2.45.0.rc1.225.g2a3ae87e7f-goog
> >
