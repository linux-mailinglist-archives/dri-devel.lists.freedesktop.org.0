Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9BB286C6D1
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 11:25:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D17110E156;
	Thu, 29 Feb 2024 10:25:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="gMlO1ZLq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com
 [209.85.166.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7337A10E156
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 10:25:53 +0000 (UTC)
Received: by mail-io1-f42.google.com with SMTP id
 ca18e2360f4ac-7c7b8fb8ba6so41796139f.2
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 02:25:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1709202352; x=1709807152;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tpcZnx5dbRty5Sf0Le7nOZDViI6+9gd83COGv8VYuWo=;
 b=gMlO1ZLqCkjqMV7MbqYOJB6yuZgns9cXvpyT9XmEA/HQnpZ85jH8PVG297DR3e5wHk
 aAJMwhs/fLaNTed2yHIiVZVVXGNAScOFetxNW3jvIJjbdTOXvgTo02gzx/P/icWY49ug
 YuHbIOtoDbPfHVJiR/MbrtrhHaUTh7WPYf4wZ+71Ozy+ZfQeOOptkyHxmGPOZM7g1XIq
 03c1yuIOQeYwOsP0oXTa79qMfrMN3M6jRcLQSZE5+CdJc68R2ydbHZY34d9r+VcWHV/c
 2xzlzf8k0HPcQm1rvDkvZOLnq2eAjybSUQNvv+GmJuIQ5h3uwzRqi3HZo2my35ZxkOeK
 40YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709202352; x=1709807152;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tpcZnx5dbRty5Sf0Le7nOZDViI6+9gd83COGv8VYuWo=;
 b=NAMiZTdQrDTJtjZaINK6TTe5y/VB1CiAG31xwjr8t2QirnHs06cW8sOlmF9l44mjiO
 EEJPshkzOSS3kUikZNcZy3rMEnshZzFv0jUOzZ8Mf2nldnroga194s/w+vo1jLGbG7Bk
 05aaHAqSyPhLGoHgcrTU0VIL68gh4Zy0q42eEa+jBaBEcDXTdXslLLawSexjGUHudti0
 UYLzMGzoDQlunspuElsCVmQ2u/yGo5nZmyCEl0q8Jm/Qc/bkP5CDBTPoyC8fek9dteTd
 Sfcf3SU57q8eg495dqvVr4WFyaKj/52gn+q9fpdb0PwLU9gdDKtRZhtChmV+bN6lAEXh
 prAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVY5xC49QXNPjsnMdrM2kpMnjAIlxqZY7wFayglhUpFeNqPPhwWbkLQJjf8iMRFJ9QaXI3rdWlRDe9iwCnnUPpBQ5agfn0GNdBnSDYocK23
X-Gm-Message-State: AOJu0YweyDdDUyiuV1VuxuUkhIiIHmvXWrC1Nwas44VEqQXzTzY9wOcl
 VhFNmMO9ApCxbJixcTPHiHepVQaR8Kms/EIXNHBMc8J+e4q6qSNvKT/YsY14q7mx5+XGBr5vQ63
 3Y3UyDVwOGL3v6TRwpYN4s6gaCKEA7GvLRNte
X-Google-Smtp-Source: AGHT+IEx8H6lKJkRxdMCbvdpYLSnZ6ffccNVSyjgjJzl2J1MbCWOGEG+M7RNHteijmJmzVzUaew6fbebLQdqsrIqgjI=
X-Received: by 2002:a05:6602:641d:b0:7c7:cd3b:9e69 with SMTP id
 gn29-20020a056602641d00b007c7cd3b9e69mr2515469iob.3.1709202351983; Thu, 29
 Feb 2024 02:25:51 -0800 (PST)
MIME-Version: 1.0
References: <20240221160215.484151-1-panikiel@google.com>
 <20240221160215.484151-9-panikiel@google.com>
 <13aeb2ff-72f4-49d9-b65e-ddc31569a936@linaro.org>
 <CAM5zL5q0oKoTMR0jSwYVAChCOJ9iKYPRFiU1vH4qDqhHALKz4w@mail.gmail.com>
 <20240227142911.GB3863852-robh@kernel.org>
 <CAM5zL5pXu5sbzCHY_BrCJ7eZj-p9n0tCo6CmuTqUpvniTrqWJg@mail.gmail.com>
 <324f7b6e-c72c-40aa-afe6-779345c2eade@linaro.org>
 <CAM5zL5oJSHxJK4QWsr2X23g-cN6G54VhGfuwHhMJ9rNu6+gZ=w@mail.gmail.com>
 <20240228180950.GA392372-robh@kernel.org>
In-Reply-To: <20240228180950.GA392372-robh@kernel.org>
From: =?UTF-8?Q?Pawe=C5=82_Anikiel?= <panikiel@google.com>
Date: Thu, 29 Feb 2024 11:25:41 +0100
Message-ID: <CAM5zL5qen2Zcg3yecH3jXJ3hiLq88p81n9hmUXQ5E0CXV6w61w@mail.gmail.com>
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

On Wed, Feb 28, 2024 at 7:10=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
>
> On Wed, Feb 28, 2024 at 02:09:33PM +0100, Pawe=C5=82 Anikiel wrote:
> > On Wed, Feb 28, 2024 at 1:18=E2=80=AFPM Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> > >
> > > On 28/02/2024 12:05, Pawe=C5=82 Anikiel wrote:
> > > > On Tue, Feb 27, 2024 at 3:29=E2=80=AFPM Rob Herring <robh@kernel.or=
g> wrote:
> > > >>
> > > >> On Mon, Feb 26, 2024 at 11:59:42AM +0100, Pawe=C5=82 Anikiel wrote=
:
> > > >>> On Mon, Feb 26, 2024 at 10:13=E2=80=AFAM Krzysztof Kozlowski
> > > >>> <krzysztof.kozlowski@linaro.org> wrote:
> > > >>>>
> > > >>>> On 21/02/2024 17:02, Pawe=C5=82 Anikiel wrote:
> > > >>>>> The Intel Displayport RX IP is a part of the DisplayPort Intel =
FPGA IP
> > > >>>>> Core. It implements a DisplayPort 1.4 receiver capable of HBR3 =
video
> > > >>>>> capture and Multi-Stream Transport. The user guide can be found=
 here:
> > > >>>>>
> > > >>>>> https://www.intel.com/programmable/technical-pdfs/683273.pdf
> > > >>>>>
> > > >>>>> Signed-off-by: Pawe=C5=82 Anikiel <panikiel@google.com>
> > > >>>>> ---
> > > >>>>>  .../devicetree/bindings/media/intel,dprx.yaml | 160 ++++++++++=
++++++++
> > > >>>>>  1 file changed, 160 insertions(+)
> > > >>>>>  create mode 100644 Documentation/devicetree/bindings/media/int=
el,dprx.yaml
> > > >>>>>
> > > >>>>> diff --git a/Documentation/devicetree/bindings/media/intel,dprx=
.yaml b/Documentation/devicetree/bindings/media/intel,dprx.yaml
> > > >>>>> new file mode 100644
> > > >>>>> index 000000000000..31025f2d5dcd
> > > >>>>> --- /dev/null
> > > >>>>> +++ b/Documentation/devicetree/bindings/media/intel,dprx.yaml
> > > >>>>> @@ -0,0 +1,160 @@
> > > >>>>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > > >>>>> +%YAML 1.2
> > > >>>>> +---
> > > >>>>> +$id: http://devicetree.org/schemas/media/intel,dprx.yaml#
> > > >>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > >>>>> +
> > > >>>>> +title: Intel DisplayPort RX IP
> > > >>>>> +
> > > >>>>> +maintainers:
> > > >>>>> +  - Pawe=C5=82 Anikiel <panikiel@google.com>
> > > >>>>> +
> > > >>>>> +description: |
> > > >>>>> +  The Intel Displayport RX IP is a part of the DisplayPort Int=
el FPGA IP
> > > >>>>> +  Core. It implements a DisplayPort 1.4 receiver capable of HB=
R3 video
> > > >>>>> +  capture and Multi-Stream Transport.
> > > >>>>> +
> > > >>>>> +  The IP features a large number of configuration parameters, =
found at:
> > > >>>>> +  https://www.intel.com/content/www/us/en/docs/programmable/68=
3273/23-3-20-0-1/sink-parameters.html
> > > >>>>> +
> > > >>>>> +  The following parameters have to be enabled:
> > > >>>>> +    - Support DisplayPort sink
> > > >>>>> +    - Enable GPU control
> > > >>>>> +  The following parameters' values have to be set in the devic=
etree:
> > > >>>>> +    - RX maximum link rate
> > > >>>>> +    - Maximum lane count
> > > >>>>> +    - Support MST
> > > >>>>> +    - Max stream count (only if Support MST is enabled)
> > > >>>>> +
> > > >>>>> +properties:
> > > >>>>> +  compatible:
> > > >>>>> +    const: intel,dprx-20.0.1
> > > >>>>> +
> > > >>>>> +  reg:
> > > >>>>> +    maxItems: 1
> > > >>>>> +
> > > >>>>> +  interrupts:
> > > >>>>> +    maxItems: 1
> > > >>>>> +
> > > >>>>> +  intel,max-link-rate:
> > > >>>>> +    $ref: /schemas/types.yaml#/definitions/uint32
> > > >>>>> +    description: Max link rate configuration parameter
> > > >>>>
> > > >>>> Please do not duplicate property name in description. It's usele=
ss.
> > > >>>> Instead explain what is this responsible for.
> > > >>>>
> > > >>>> Why max-link-rate would differ for the same dprx-20.0.1? And why
> > > >>>> standard properties cannot be used?
> > > >>>>
> > > >>>> Same for all questions below.
> > > >>>
> > > >>> These four properties are the IP configuration parameters mention=
ed in
> > > >>> the device description. When generating the IP core you can set t=
hese
> > > >>> parameters, which could make them differ for the same dprx-20.0.1=
.
> > > >>> They are documented in the user guide, for which I also put a lin=
k in
> > > >>> the description. Is that enough? Or should I also document these
> > > >>> parameters here?
> > > >>
> > > >> Use the standard properties: link-frequencies and data-lanes. Thos=
e go
> > > >> under the port(s) because they are inheritly per logical link.
> > > >
> > > > The DP receiver has one input interface (a deserialized DP stream),
> > > > and up to four output interfaces (the decoded video streams). The "=
max
> > > > link rate" and "max lane count" parameters only describe the input
> > > > interface to the receiver. However, the port(s) I am using here are
> > > > for the output streams. They are not affected by those parameters, =
so
> > > > I don't think these properties should go under the output port(s).
> > > >
> > > > The receiver doesn't have an input port in the DT, because there is=
n't
> > > > any controllable entity on the other side - the deserializer doesn'=
t
> > > > have any software interface. Since these standard properties
> > > > (link-frequencies and data-lanes) are only defined in
> > > > video-interfaces.yaml (which IIUC describes a graph endpoint), I ca=
n't
> > > > use them directly in the device node.
> > >
> > > DT describes the hardware, so where does the input come? From somethi=
ng,
> > > right? Regardless if you have a driver or not. There is dp-connector
> > > binding, if this is physical port.
> >
> > Yes, it is a physical port. I agree adding a DT node for the physical
> > DP input connector would let us add link-frequencies to the input port
> > of the receiver.
> >
> > However, dp-connector seems to be a binding for an output port - it's
> > under schemas/display/connector, and DP_PWR can be a power supply only
> > for an output port (looking at the dp-pwr-supply property). Also, the
> > driver for this binding is a DRM bridge driver (display-connector.c)
> > which would not be compatible with a v4l2 (sub)device.
>
> So then we should add 'dp-input-connector' because they are different.
> When we haven't defined connectors, properties of the connector have
> been shoved in whatever node is associated with a connector like you
> have done. That works for a while, but then becomes unmanageable. DP on
> USB-C connectors for example.
>
> OTOH, maybe your use here is niche enough to not be worth the trouble.
> Depends if we see the need for video input connectors in general.

My use case is a dedicated hardware that runs DP tests of an external
DUT. I can't think of another scenario where we'd need an input DP
port. IMO this is pretty niche, but I'll leave the decision to you
