Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0969E86AC84
	for <lists+dri-devel@lfdr.de>; Wed, 28 Feb 2024 12:05:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0499810E330;
	Wed, 28 Feb 2024 11:05:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="kHrjUiyN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com
 [209.85.166.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FA7D10E330
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 11:05:29 +0000 (UTC)
Received: by mail-io1-f47.google.com with SMTP id
 ca18e2360f4ac-7c7ee7fa1abso64833439f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 03:05:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1709118328; x=1709723128;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SIN5TJ61NQTJqN5mR5pFOd0k+x3pH5IedFrp+UzE1z4=;
 b=kHrjUiyNgIIR+cHt+eqbGWcT0IMaGt51TMjJ2V0/4lc9e9z8FyZ8V7D76ogmADeEqZ
 phK0qwqm93wPzAFxFRTG24rt6iQuZqjnYfKsMOMH+H3ODUGOJFzUpC4minQoycBsl4t6
 6xkPx350mNEFm5r1Moo9Z0hDhAOQvR9MOpCpTg0RoZlwT5L2HFj5s16KZObuCeqmFSUH
 yO/gbtzHZLYgd2DXhqRhNn9f+snuHHQt0CchnSm7/kURbm0n88kqm11Nm28wGMg/k9Lc
 KLaBBN7oKg2LhNwbIuSEhILyApsua0s1QwfzKYf+uWVPTSPILakh+lz+hKH0vwEjWYKP
 lalw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709118328; x=1709723128;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SIN5TJ61NQTJqN5mR5pFOd0k+x3pH5IedFrp+UzE1z4=;
 b=uclEMmUmSahrUJIEwt26vwMgvE8oN5p++eOO0K1rWT+5tJMk8ofLW81jOaDWXv0zDy
 s0uOOMgSoMp8U72MqSJOEaQSZE04QkuxZ+EkCwAR61/0a6Xt6BgIgOE1mwN79uKl2WzB
 hipS7rzUW2vESWYiI2P+flMPB7efLXAgm2c9h9KXzS/dJHLZBrO6BMHt/LQ++yDkDcck
 2ky6SOysHMpwyfMXdxx6EeQ0OIydfucg8rRkeH7Ljys5eOh/RSG3EdLlSGew1VBfpJYh
 ubl0YQtrEAfmMz3wnOvhWC6lGAX5sBmMPPR070U57NCRtnFWnh90kU/N3H4vvxiJDEkc
 60yg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxr04fkMHGCI+dL8LkgflqU4/y/IbgrJE0SsggPVZPw95lD/2AL3dqSNvRu/luebdDo8hmOFb4XhuIUuhIJVyuCXIBEj0EL7vvwm8wY+OH
X-Gm-Message-State: AOJu0YyYjsGI5LwIgkZZPOklIlfUEce/pQ5yuORqNaRLN36IUxY9lbGN
 +wB02zDz+7Rol6oni6Ymz+lUK37wY+jRaw0Kzd5ZW63RCkEm2vsIhqsNM+3qqRXm68sdJT2kNhZ
 BkiGzy2VuLRpRKlszeYiJxQfOyi4b4SKk7yyz
X-Google-Smtp-Source: AGHT+IEtOPOXXjbhjWRTvlgw2RoCh449T+tuUODnpg0QVWyKCQfa5m8qgfwgP0ycVI+iuXGb9VZY8QV966FEbQYeMtw=
X-Received: by 2002:a05:6602:5a:b0:7c4:9ce4:aa3e with SMTP id
 z26-20020a056602005a00b007c49ce4aa3emr13999951ioz.7.1709118328434; Wed, 28
 Feb 2024 03:05:28 -0800 (PST)
MIME-Version: 1.0
References: <20240221160215.484151-1-panikiel@google.com>
 <20240221160215.484151-9-panikiel@google.com>
 <13aeb2ff-72f4-49d9-b65e-ddc31569a936@linaro.org>
 <CAM5zL5q0oKoTMR0jSwYVAChCOJ9iKYPRFiU1vH4qDqhHALKz4w@mail.gmail.com>
 <20240227142911.GB3863852-robh@kernel.org>
In-Reply-To: <20240227142911.GB3863852-robh@kernel.org>
From: =?UTF-8?Q?Pawe=C5=82_Anikiel?= <panikiel@google.com>
Date: Wed, 28 Feb 2024 12:05:17 +0100
Message-ID: <CAM5zL5pXu5sbzCHY_BrCJ7eZj-p9n0tCo6CmuTqUpvniTrqWJg@mail.gmail.com>
Subject: Re: [PATCH v2 8/9] media: dt-bindings: Add Intel Displayport RX IP
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, airlied@gmail.com, 
 akpm@linux-foundation.org, conor+dt@kernel.org, daniel@ffwll.ch, 
 dinguyen@kernel.org, hverkuil-cisco@xs4all.nl, 
 krzysztof.kozlowski+dt@linaro.org, maarten.lankhorst@linux.intel.com, 
 mchehab@kernel.org, mripard@kernel.org, tzimmermann@suse.de, 
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 chromeos-krk-upstreaming@google.com, ribalda@chromium.org
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

On Tue, Feb 27, 2024 at 3:29=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
>
> On Mon, Feb 26, 2024 at 11:59:42AM +0100, Pawe=C5=82 Anikiel wrote:
> > On Mon, Feb 26, 2024 at 10:13=E2=80=AFAM Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> > >
> > > On 21/02/2024 17:02, Pawe=C5=82 Anikiel wrote:
> > > > The Intel Displayport RX IP is a part of the DisplayPort Intel FPGA=
 IP
> > > > Core. It implements a DisplayPort 1.4 receiver capable of HBR3 vide=
o
> > > > capture and Multi-Stream Transport. The user guide can be found her=
e:
> > > >
> > > > https://www.intel.com/programmable/technical-pdfs/683273.pdf
> > > >
> > > > Signed-off-by: Pawe=C5=82 Anikiel <panikiel@google.com>
> > > > ---
> > > >  .../devicetree/bindings/media/intel,dprx.yaml | 160 ++++++++++++++=
++++
> > > >  1 file changed, 160 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/media/intel,d=
prx.yaml
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/media/intel,dprx.yam=
l b/Documentation/devicetree/bindings/media/intel,dprx.yaml
> > > > new file mode 100644
> > > > index 000000000000..31025f2d5dcd
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/media/intel,dprx.yaml
> > > > @@ -0,0 +1,160 @@
> > > > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/media/intel,dprx.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: Intel DisplayPort RX IP
> > > > +
> > > > +maintainers:
> > > > +  - Pawe=C5=82 Anikiel <panikiel@google.com>
> > > > +
> > > > +description: |
> > > > +  The Intel Displayport RX IP is a part of the DisplayPort Intel F=
PGA IP
> > > > +  Core. It implements a DisplayPort 1.4 receiver capable of HBR3 v=
ideo
> > > > +  capture and Multi-Stream Transport.
> > > > +
> > > > +  The IP features a large number of configuration parameters, foun=
d at:
> > > > +  https://www.intel.com/content/www/us/en/docs/programmable/683273=
/23-3-20-0-1/sink-parameters.html
> > > > +
> > > > +  The following parameters have to be enabled:
> > > > +    - Support DisplayPort sink
> > > > +    - Enable GPU control
> > > > +  The following parameters' values have to be set in the devicetre=
e:
> > > > +    - RX maximum link rate
> > > > +    - Maximum lane count
> > > > +    - Support MST
> > > > +    - Max stream count (only if Support MST is enabled)
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    const: intel,dprx-20.0.1
> > > > +
> > > > +  reg:
> > > > +    maxItems: 1
> > > > +
> > > > +  interrupts:
> > > > +    maxItems: 1
> > > > +
> > > > +  intel,max-link-rate:
> > > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > > +    description: Max link rate configuration parameter
> > >
> > > Please do not duplicate property name in description. It's useless.
> > > Instead explain what is this responsible for.
> > >
> > > Why max-link-rate would differ for the same dprx-20.0.1? And why
> > > standard properties cannot be used?
> > >
> > > Same for all questions below.
> >
> > These four properties are the IP configuration parameters mentioned in
> > the device description. When generating the IP core you can set these
> > parameters, which could make them differ for the same dprx-20.0.1.
> > They are documented in the user guide, for which I also put a link in
> > the description. Is that enough? Or should I also document these
> > parameters here?
>
> Use the standard properties: link-frequencies and data-lanes. Those go
> under the port(s) because they are inheritly per logical link.

The DP receiver has one input interface (a deserialized DP stream),
and up to four output interfaces (the decoded video streams). The "max
link rate" and "max lane count" parameters only describe the input
interface to the receiver. However, the port(s) I am using here are
for the output streams. They are not affected by those parameters, so
I don't think these properties should go under the output port(s).

The receiver doesn't have an input port in the DT, because there isn't
any controllable entity on the other side - the deserializer doesn't
have any software interface. Since these standard properties
(link-frequencies and data-lanes) are only defined in
video-interfaces.yaml (which IIUC describes a graph endpoint), I can't
use them directly in the device node.

Do you see a way to use these standard properties here?
