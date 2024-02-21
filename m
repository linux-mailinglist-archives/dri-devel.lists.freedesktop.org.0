Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA5085E2D9
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 17:17:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B57010E7F4;
	Wed, 21 Feb 2024 16:17:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="map8Vqc7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com
 [209.85.166.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BB3D10E7F4
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 16:17:03 +0000 (UTC)
Received: by mail-io1-f42.google.com with SMTP id
 ca18e2360f4ac-7baa8097064so442470539f.3
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 08:17:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1708532222; x=1709137022;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KVAwH35/MlacXlWKifCgH1KdwHWqIayMmoX/ai0O0Uo=;
 b=map8Vqc77xd7fj7RW7tbmTiw3qa8XlVK3SnJRBnQkHgnHvyNY92kfSmnQbrsCuciHW
 VHfrmX/l6YxsmWJoxpLanyNcQLhxUSiYrSwlOfwUQ4ghUoZG+mMk74/U/+2pL5adTjED
 pdbP+eOfjlCspD/k20kWl/DgBzDJrWK+oO8p2TBwPA7CyiqtmlVjulyjbrVyF/AUOOWU
 cZQAkJYMrx6WH8cCHb6SRIBeQ/JR433pRrKdM8mG5igV65JGriB63wNV7S9UKnb90KNa
 Jvp0Y/3kVOiy2Fiw3OyIQ7MTTAJ2L0MgeLXyWt5UZmbHf7rruweoSNKZr6Znujt98E/X
 IbIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708532222; x=1709137022;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KVAwH35/MlacXlWKifCgH1KdwHWqIayMmoX/ai0O0Uo=;
 b=R4BfQzuXHy8kXVwnub468aMlBT+Iwylkbxmpv0TIJLTv/+4CNWYLpguQkHfe0kGjm8
 RvQSFX91R1PuJmuXxnG0MCEHB68ox9+J54RmhmAaU5duCmKKMc/MMIXs+Hw1of+U+/DV
 TxJ6XkQdFSW9uqeciqDesDZnFmFGr68MTYHBRHS2LItHxvOhj/WGtV7jTde9pgPcUi1Q
 k4/IPx8odQisjQLHeITsOCZSP5+9Fhp3TypE2rcCXKsuSFZe3w7h1E3Yx3JRRXSbPGHy
 YpfKTt1xPG176AzDIkUq6294WqAQ2B5SIV7JGmqQ3YW7MQ69F2/TnPIoYsJ+mbdWFOhH
 5lGA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUg3Co6pc6TuEubgOKhL87ci1jjIyyUXqaFiyefdrX1vopDtahWfNDSU2BAp5KQntwSjzdZKvKP33GiRjkuipxwxIusVTwKIZ0yoVQgXhrx
X-Gm-Message-State: AOJu0YzxJCEcku1Hc6/p5EUYWk92isUe1XZPHxFQ16TES3psJChTzRt6
 R56N19vhLZETTfYD01EOymO8uOXkj8cPUxEIwbuxTSZa/Zx04gHkJ5ar/XXPi2AP2vtcIoSAveE
 ITkqA4MqAFDnl1OF13g+vpyXknUt6Q298/cyJ
X-Google-Smtp-Source: AGHT+IGKtzqWfqGsQxp2PAZXjjjL1F5fGxrtKTKiLrxLV9Vn49jWwfGTnaRMgOOBP2ZDNbAnqBAuR5kT7Bu5a0qC/eo=
X-Received: by 2002:a5e:d504:0:b0:7c7:5ebf:d021 with SMTP id
 e4-20020a5ed504000000b007c75ebfd021mr6663294iom.8.1708532222178; Wed, 21 Feb
 2024 08:17:02 -0800 (PST)
MIME-Version: 1.0
References: <20240212131323.2162161-1-panikiel@google.com>
 <20240212131323.2162161-8-panikiel@google.com>
 <20240215-supervise-concerned-55a18554a120@spud>
In-Reply-To: <20240215-supervise-concerned-55a18554a120@spud>
From: =?UTF-8?Q?Pawe=C5=82_Anikiel?= <panikiel@google.com>
Date: Wed, 21 Feb 2024 17:16:51 +0100
Message-ID: <CAM5zL5pL5qduQvs1FPf5pg1z5BBLjKk4Ads0E1vF=j=wSx-ddQ@mail.gmail.com>
Subject: Re: [PATCH 7/9] media: dt-bindings: Add Chameleon v3 framebuffer
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

On Thu, Feb 15, 2024 at 6:29=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Mon, Feb 12, 2024 at 01:13:21PM +0000, Pawe=C5=82 Anikiel wrote:
> > The Chameleon v3 uses the framebuffer IP core to take the video signal
> > from different sources and directly write frames into memory.
> >
> > Signed-off-by: Pawe=C5=82 Anikiel <panikiel@google.com>
> > ---
> >  .../bindings/media/google,chv3-fb.yaml        | 77 +++++++++++++++++++
> >  1 file changed, 77 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/google,chv3=
-fb.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/media/google,chv3-fb.yam=
l b/Documentation/devicetree/bindings/media/google,chv3-fb.yaml
> > new file mode 100644
> > index 000000000000..ba6643cc7232
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/google,chv3-fb.yaml
> > @@ -0,0 +1,77 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/media/google,chv3-fb.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Google Chameleon v3 video framebuffer
> > +
> > +maintainers:
> > +  - Pawe=C5=82 Anikiel <panikiel@google.com>
> > +
> > +properties:
> > +  compatible:
> > +    const: google,chv3-fb
> > +
> > +  reg:
> > +    items:
> > +      - description: core registers
> > +      - description: irq registers
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  google,legacy-format:
> > +    type: boolean
> > +    description: The incoming video stream is in 32-bit padded mode.
> > +
> > +  google,no-endpoint:
> > +    type: boolean
> > +    description:
> > +      The framebuffer isn't connected to a controllable endpoint.
> > +      The video interface still works, but EDID control is unavailable
> > +      and DV timing information only reports the active video width/he=
ight.
>
> Why does this need a dedicated property? Is it not sufficient to check
> that there are no endpoints in the devicetree?

Yes, I think it is sufficient. I removed the property and added a
check in the driver in v2.
