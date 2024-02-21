Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89FCE85E364
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 17:31:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CB9310E775;
	Wed, 21 Feb 2024 16:31:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="XaW+PdWU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com
 [209.85.166.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1436910E775
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 16:31:09 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id
 ca18e2360f4ac-7bc32b0fdadso335832439f.2
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 08:31:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1708533068; x=1709137868;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NAe7/3QZg7F6kt4OXJPb9Y6Tm7Pxl+pIe4bnMQYzmYI=;
 b=XaW+PdWUnCioUjMvP7qJiHuioAWcdcuWYNKzqrNYrxdaGgRCi0DWtY2oWDduivgWT5
 65OBRL0NoOknEz1w2p6arga3Wb0f1Cr0msyJ0HzlMpUs/2WPdOonFGsmKv+3ZPGTDFAp
 pjG4fJ5L6PtaPsd5H3MSmURonux6lJYTMPGJoA5hTeDSp3JcII8uAC6XxOrQplM3es8/
 mtEU9o3lumYW4720gJYqRoZKhT3a4PK1K4+IzMmX7Eb+gCcsf32MmOxnNQmNUphbPE7u
 Q6fKi4Phj0tPhPnmw3USJm+qbtZKKZUWLq4TD7/tYhUoIDJdE3stFYnCKNmKP6lx8Saw
 J8Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708533068; x=1709137868;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NAe7/3QZg7F6kt4OXJPb9Y6Tm7Pxl+pIe4bnMQYzmYI=;
 b=g2plaaNNphImIfHR4MLjEL4rDfpb8KXaanvLq/+xfpF+VLGQOtvYoe9dx6RKZyN4kx
 Frc5EOyQVRYfVOz4j8OjOd3QYmqShK8MbELREo/UkrjE3hPGgcQhI7Txn+3hA1/i8OzQ
 XeIMFBAuwBHc1S/tjDOGSKzzuCbCOT5bvzbl5jQTXmhK/BOWdMroZCnW/3zOSfm7rNEh
 DBQXNBFAWSfBNRE05IEsX/AXN/jcTQ2jldoO9XdK41pf+vGgHwT8d/B6GI+S9DTDjn6J
 nq9NFPhnbO/OkaIXmhYd1+rQxFgrq9+QsWa7eQyFlhass+KfQWTdxjunSxyaeUmHV9Pt
 AxoA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCcLt+xQ3AbeLSFWM/uTF5Y6ln9hihUi4JkzVkPDoOPeQ55UxYen63lA33F8QsNGEKxp6MeJv/zTBrFfnxIWAdVqD2kL2gnztQAnTpFURh
X-Gm-Message-State: AOJu0YxJZjlfQacuROrojU4CuhyHR/ZhRmqBYUtVHRuBX4HW91nuQtyx
 jXDB8rKNHtk4Ei21SsW+OPu/OROfO0fynExAFfAOaZpQu4KRwpjWtdqMEHvunavdy4v0wenRICu
 7eC4JAGhS7GVFLSZyWjgqHFT2jC6xrpGb3NeE
X-Google-Smtp-Source: AGHT+IHA0I/TkMUo4dpT97MXiRqq1ZaBo3fcCy2GY6tK6iHF1Ly9jSiVekMtxHcZsLqU2Vr0uhsnEHV83fGJqZ4TBIA=
X-Received: by 2002:a05:6602:e17:b0:7c7:466b:f315 with SMTP id
 gp23-20020a0566020e1700b007c7466bf315mr9936019iob.3.1708533068049; Wed, 21
 Feb 2024 08:31:08 -0800 (PST)
MIME-Version: 1.0
References: <20240212131323.2162161-1-panikiel@google.com>
 <20240212131323.2162161-9-panikiel@google.com>
 <20240215-moodiness-concert-0050a16f644c@spud>
In-Reply-To: <20240215-moodiness-concert-0050a16f644c@spud>
From: =?UTF-8?Q?Pawe=C5=82_Anikiel?= <panikiel@google.com>
Date: Wed, 21 Feb 2024 17:30:57 +0100
Message-ID: <CAM5zL5psgAKmxW_nAL8J+Bvu27R8POmvhJYkM6524zXRZrbP0A@mail.gmail.com>
Subject: Re: [PATCH 8/9] media: dt-bindings: Add Intel Displayport RX IP
To: Conor Dooley <conor@kernel.org>
Cc: airlied@gmail.com, akpm@linux-foundation.org, conor+dt@kernel.org, 
 daniel@ffwll.ch, dinguyen@kernel.org, hverkuil-cisco@xs4all.nl, 
 krzysztof.kozlowski+dt@linaro.org, maarten.lankhorst@linux.intel.com, 
 mchehab@kernel.org, mripard@kernel.org, robh+dt@kernel.org, 
 tzimmermann@suse.de, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, chromeos-krk-upstreaming@google.com, 
 ribalda@chromium.org
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

On Thu, Feb 15, 2024 at 6:26=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:
>
> Yo,
>
> On Mon, Feb 12, 2024 at 01:13:22PM +0000, Pawe=C5=82 Anikiel wrote:
> > The Intel Displayport RX IP is a part of the DisplayPort Intel FPGA IP
> > Core. It implements a DisplayPort 1.4 receiver capable of HBR3 video
> > capture and Multi-Stream Transport. The user guide can be found here:
> >
> > https://www.intel.com/programmable/technical-pdfs/683273.pdf
> >
> > Signed-off-by: Pawe=C5=82 Anikiel <panikiel@google.com>
> > ---
> >  .../devicetree/bindings/media/intel,dprx.yaml | 125 ++++++++++++++++++
> >  1 file changed, 125 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/intel,dprx.=
yaml
> >
> > diff --git a/Documentation/devicetree/bindings/media/intel,dprx.yaml b/=
Documentation/devicetree/bindings/media/intel,dprx.yaml
> > new file mode 100644
> > index 000000000000..3ed37e0a4a94
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/intel,dprx.yaml
> > @@ -0,0 +1,125 @@
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
> > +properties:
> > +  compatible:
> > +    const: intel,dprx
>
> Please version this compatible, given that is it for an FPGA IP.
> I could not find an example of another intel IP that had versioning, but
> there's plenty of xilinx stuff you can get inspiration from.

The IP has had a few different revisions, so I decided to just use the
"IP version" which is 20.0.1 for the version this driver is targeting.

>
> > +  reg:
> > +    items:
> > +      - description: core registers
> > +      - description: irq registers
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  intel,has-mst:
>
> Mostly this looks fine, but this property drew my eye.
> Firstly, I'd probably call this "intel,multi-stream-support" rather than
> "intel,has-mst".

Sure,

>
> > +    type: boolean
> > +    description: The device supports Multi-Stream Transport
>
> Secondly, there are many many configuration parameters for this IP,
> but you have chosen to document just one.
> Are all other configuration parameters currently in their default
> states or ignored by the driver? If not, please at least document all
> configuration settings that you rely on - for example the max stream
> count or audio packet encoding.

I looked at all the parameters listed in the user guide, and most of
them don't affect the driver. I listed the ones which are required,
and added support for the remaining ones in v2.

>
> > +
> > +  port:
> > +    $ref: /schemas/graph.yaml#/properties/port
> > +    description: SST main link
> > +
> > +  ports:
> > +    $ref: /schemas/graph.yaml#/properties/ports
> > +
> > +    properties:
> > +      port@0:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: MST virtual channel 0 or SST main link
> > +
> > +      port@1:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: MST virtual channel 1
> > +
> > +      port@2:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: MST virtual channel 2
> > +
> > +      port@3:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: MST virtual channel 3
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +
> > +allOf:
> > +  - if:
> > +      required:
> > +        - intel,has-mst
> > +    then:
> > +      required:
> > +        - ports
> > +    else:
> > +      required:
> > +        - port
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    dprx@c0062000 {
>
> "dprx" isn't a class of device, please try to use a generic node name
> here.

I couldn't find anything in the DT spec or any other similar examples,
so I chose dp-receiver.
