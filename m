Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFCAF867266
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 11:59:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D55C910F060;
	Mon, 26 Feb 2024 10:59:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="tdv8HBzb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com
 [209.85.166.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1861E10F060
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 10:59:54 +0000 (UTC)
Received: by mail-io1-f54.google.com with SMTP id
 ca18e2360f4ac-7c40863de70so188169839f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 02:59:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1708945193; x=1709549993;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9HBNX3ZrqYqah+wR2ZXlErwOwwFl2gjzLKDMAIKzAXQ=;
 b=tdv8HBzb73esLq8WD9/ezUB6mV/Y0POocd3Xa+j+1AXKiU9rCAQZqtIZyXwbBbmgxD
 /Aaq+8yDHEn0r/TDf/FTxEwwxDEdorai5BjjEzsoN+B5OvT+0NfuXZuy6F+9UEwKtl3g
 VcH9hnjgIclT+kyLbGTt99/fNSJunkAmZYbr7YOIjlZUgzyPzoe9L9ydHPVRGC+PfC1t
 yYHan5sTHTBaUHXLiGTKSKRHwzqL0HfgvT3UfFgFT7f74ILwY+FHs966KbVvLwZimmN1
 R1TxrK/wPdC9w1UQLVfASbJpWYQdVBP2sO944jS6cndhsYJjYYu+D8IpJ7/NyJTCilwZ
 KfJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708945193; x=1709549993;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9HBNX3ZrqYqah+wR2ZXlErwOwwFl2gjzLKDMAIKzAXQ=;
 b=LoAkxQvgouElB/V4Hop3pYzzLONs20aym20EqfxL1cDvaVAeONCjfhBa61RXtp3sxT
 Qu++n/QtLDmczmyenDL8Ov4Lhs/qLMGFCr5TaF2eQv9CPnzUYK29fvjFcLBaagal4Pnx
 KnvhOheXcUJZBh8RXtcTtK6pshDSTeJBYisos6DjoFs3iLxRwo9y+n5v/ECai0xI0Z/O
 Rm1EuZvMtgoPlbNbUOtVSbQiEEsgkJMBNw50kuSOMEtTtbppQkSehWGUmJcQajnACKsB
 U4DX5jowojnzrc5JLzrkqFkMgZeeyAYDNLRFixHX0bJBOcCSYofWg7lUagFcoWQWSS55
 HXGQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU0x8xZ0onIc82dmldDJi8e2Zera85jQcQlexipQQ6Dpd0a4Ytrh+NssK8NQ4jpGBkdohEO/tCITiRxTAaJXH4mMT3tHloJGyr/WsQHxChv
X-Gm-Message-State: AOJu0Yz23AC2nejWg9kTEIMMxy8GMpLvqp1bXIZM62YVbUQx6M0nINX3
 aEUSvXeuXwQrd0xK6AJdpQvdTpSjnzG5ZirwOuIibeJDpq46IzHxD5io7yQZVCYJ31nYnKj9AJ1
 M9SQL5NyAdWinXUOd1eao4kzbllkPm1gVEgTt
X-Google-Smtp-Source: AGHT+IGPWqkD9tP0s2DR5YozsFzpUTq3DqbX3426VLgw1SJtB5jrdYmWVGilTio3nCJ+QrJqqp33UcQOcDrbUDfAfdM=
X-Received: by 2002:a05:6e02:348e:b0:363:c1ce:1a6 with SMTP id
 bp14-20020a056e02348e00b00363c1ce01a6mr8258336ilb.13.1708945193051; Mon, 26
 Feb 2024 02:59:53 -0800 (PST)
MIME-Version: 1.0
References: <20240221160215.484151-1-panikiel@google.com>
 <20240221160215.484151-9-panikiel@google.com>
 <13aeb2ff-72f4-49d9-b65e-ddc31569a936@linaro.org>
In-Reply-To: <13aeb2ff-72f4-49d9-b65e-ddc31569a936@linaro.org>
From: =?UTF-8?Q?Pawe=C5=82_Anikiel?= <panikiel@google.com>
Date: Mon, 26 Feb 2024 11:59:42 +0100
Message-ID: <CAM5zL5q0oKoTMR0jSwYVAChCOJ9iKYPRFiU1vH4qDqhHALKz4w@mail.gmail.com>
Subject: Re: [PATCH v2 8/9] media: dt-bindings: Add Intel Displayport RX IP
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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

On Mon, Feb 26, 2024 at 10:13=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 21/02/2024 17:02, Pawe=C5=82 Anikiel wrote:
> > The Intel Displayport RX IP is a part of the DisplayPort Intel FPGA IP
> > Core. It implements a DisplayPort 1.4 receiver capable of HBR3 video
> > capture and Multi-Stream Transport. The user guide can be found here:
> >
> > https://www.intel.com/programmable/technical-pdfs/683273.pdf
> >
> > Signed-off-by: Pawe=C5=82 Anikiel <panikiel@google.com>
> > ---
> >  .../devicetree/bindings/media/intel,dprx.yaml | 160 ++++++++++++++++++
> >  1 file changed, 160 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/intel,dprx.=
yaml
> >
> > diff --git a/Documentation/devicetree/bindings/media/intel,dprx.yaml b/=
Documentation/devicetree/bindings/media/intel,dprx.yaml
> > new file mode 100644
> > index 000000000000..31025f2d5dcd
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/intel,dprx.yaml
> > @@ -0,0 +1,160 @@
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
> > +  The following parameters' values have to be set in the devicetree:
> > +    - RX maximum link rate
> > +    - Maximum lane count
> > +    - Support MST
> > +    - Max stream count (only if Support MST is enabled)
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
> > +  intel,max-link-rate:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: Max link rate configuration parameter
>
> Please do not duplicate property name in description. It's useless.
> Instead explain what is this responsible for.
>
> Why max-link-rate would differ for the same dprx-20.0.1? And why
> standard properties cannot be used?
>
> Same for all questions below.

These four properties are the IP configuration parameters mentioned in
the device description. When generating the IP core you can set these
parameters, which could make them differ for the same dprx-20.0.1.
They are documented in the user guide, for which I also put a link in
the description. Is that enough? Or should I also document these
parameters here?

>
> > +
> > +  intel,max-lane-count:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: Max lane count configuration parameter
> > +
> > +  intel,multi-stream-support:
> > +    type: boolean
> > +    description: Multi-Stream Transport support configuration paramete=
r
> > +
> > +  intel,max-stream-count:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: Max stream count configuration parameter
> > +
> > +  port:
> > +    $ref: /schemas/graph.yaml#/properties/port
> > +    description: SST main link
>
> I don't understand why you have both port and ports. Shouldn't this be
> under ports?

I put both so that you can use the shorter port property when the
device only has one port (i.e. no MST support). It would work fine
without it. If you think that's unnecessary, I can remove it (and use
the ports property even if there is only one).
