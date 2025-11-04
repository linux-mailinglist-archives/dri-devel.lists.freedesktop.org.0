Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 718B2C30E68
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 13:10:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC89210E145;
	Tue,  4 Nov 2025 12:10:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cDJe6olw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com
 [209.85.218.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A898710E145
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 12:10:46 +0000 (UTC)
Received: by mail-ej1-f65.google.com with SMTP id
 a640c23a62f3a-b7260435287so2523066b.3
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Nov 2025 04:10:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762258245; x=1762863045; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KzUjjBieESWl/eKHRRME8VO1FyP4Xh2Gr78dnGWZR3M=;
 b=cDJe6olw5UAWPjVPAGnb36nxwNGo/q9J2xA8+7wdMyUEJWNbqNHww6Anz5ZftOno9Z
 8tIXb2PiCWiekkk7XMwn8evWZLvnaKtasJ9PvwFaE8ztoMvCZd9msWMSX/ncpCco1C4v
 SnZmuEPxhM/ZPTSIGkPF25J74c6USSLfSVT8EYbTGE6DHh7AageYoebdI4WFOLJbLAl1
 bZEeN7SNTj2kYof+YHanRcg7IbFKhO708AdveEUN9/8VevfaKc3ce2R2f2TUcJR+jf5y
 VxdtL/8VBkXty9FN4kL6Hu1JKOzHWwImsDDO6apv8EXxU7kunrJy1iw/PFQ8CT/d7/2U
 VxAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762258245; x=1762863045;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KzUjjBieESWl/eKHRRME8VO1FyP4Xh2Gr78dnGWZR3M=;
 b=QotX4mj3LJ9VghEh3VPE9tLcjvNmvgU3sPwDNUOncP5Kf1knhicue4Lm1OMwSWyKjO
 5/OlbJ/YzrX2FTCHZQwSZ9vzJf9m+kDh7/sqCW8Og1Yk2zcEjBoce7b29jR5AQCRB6o9
 AZgQJD/iHBQYGM/AirWIWvmklsz9MABsYL/oJkbA0gHiwBcCeNEScp0cYW5KwftGYqUY
 3vfdkK1nIgkBSTy1POqyhsTnUavq89l5UTvQ47cIyPPk4nNbgEmItfn0OhbVCe+Cj7wu
 uz8pBy/i/VGapEg0QDF8h/aMjwGjfI0pfdcbakKWKG+q1piR2MGmxmdur+j+dec3fM+j
 5AKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWiHXnoT4o8Y3N/yn64s6nJInNuS2zxbniGmjwiIv3Cx20BKqcvvHgyhBHFZ9lQ1rfK23S00OiEw8Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwXzwj9sUnJU7ApruyvhtpyjAIVWsGcd30eS+em1MJ46TXfgKHl
 LwOquDDIQaxP8k7Y7GHjFv1GmIWjdb4qEXOXnEop5pPQNwEojXU4+36eorJsmRVq9kD1niPZ4hP
 56O1ij1cHIB92TD6pLkcncKek6d7TWGM=
X-Gm-Gg: ASbGnctnLxvwx8hUSp26ee4mWicqONnPjwkT4enIj1Hsf9XNC2fA8p510ltkjWwUwxR
 KgcsiRJOOT1hzIpwkbStuTcEiHqVbBecY6LFBDuUfblI7zYXLhi5Ry1W48kTp7UcuQFr6BzG7SX
 juXlCGHkmzhkXVvse6YQ5eJreEFBm6QsXaGrIbqvPzVHLeTs6NtFaBqZvgxi2jrx+CLa6ScEMcl
 1KXCPa8c7XV/hf5QmObEzLAzCs/+EItcYIihMJNkeAloktDPmdoeAUIux7R
X-Google-Smtp-Source: AGHT+IFYNmK4p8ZzQreCCOl4PXO/MkzLrFaWoACxm/O8s2bicL/zOLsbm8jPi41+2YZ1Lhpc6tL1AcArgolgsFl++YU=
X-Received: by 2002:a17:907:3faa:b0:b72:5983:db09 with SMTP id
 a640c23a62f3a-b725983e06amr109317066b.32.1762258244771; Tue, 04 Nov 2025
 04:10:44 -0800 (PST)
MIME-Version: 1.0
References: <20251103110648.878325-1-caojunjie650@gmail.com>
 <20251103110648.878325-2-caojunjie650@gmail.com>
 <20251104-dancing-panda-of-patience-49bcc7@kuoka>
In-Reply-To: <20251104-dancing-panda-of-patience-49bcc7@kuoka>
From: Junjie Cao <caojunjie650@gmail.com>
Date: Tue, 4 Nov 2025 20:09:05 +0800
X-Gm-Features: AWmQ_bkkyexGfBD5XHzrBd-xICWXFb2FCbbahEGY3fitC4E7OLdD5Bwvl1yJFfQ
Message-ID: <CAK6c68iy0vwgKJTgXr=YptyENTWC1MJrsJWsbsyp9KQkAtOYVg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: leds: backlight: Add Awinic AW99706
 backlight
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Helge Deller <deller@gmx.de>, 
 dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-fbdev@vger.kernel.org, Pengyu Luo <mitltlatltl@gmail.com>
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

On Tue, Nov 4, 2025 at 3:30=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On Mon, Nov 03, 2025 at 07:06:47PM +0800, Junjie Cao wrote:
> > From: Pengyu Luo <mitltlatltl@gmail.com>
> >
> > Add Awinic AW99706 backlight binding documentation.
> >
> > Signed-off-by: Junjie Cao <caojunjie650@gmail.com>
>
> Messed DCO chain. This wasn't here, so you must have altered v1 to add
> some weird change.
>
> This is a blocker, please read carefully submitting patches and DCO.
>

Apologies for the DCO mess.

The tablet device is currently with Pengyu. He helped with testing and
tweaked the .c driver file (patch 2/2) after my change. The entire
series was then re-formatted on his machine, which caused his git
configuration to be incorrectly applied to the From: line of this
dt-binding patch (patch 1/2).

I am the actual author of this dt-binding file. I will correct the
authorship and DCO chain in v2.

> > ---
> > Changes in v2:
> > - use proper units for properties (Krzysztof)
> > - drop non-fixed properties (Krzysztof)
> > - add properties(max-brightness, default-brightness) (Krzysztof)
> > - Link to v1: https://lore.kernel.org/linux-leds/20251026123923.1531727=
-2-caojunjie650@gmail.com
>
> ...
>
> > +  awinic,dim-mode:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: >
> > +      Select dimming mode of the device.
> > +        0 =3D Bypass mode.
> > +        1 =3D DC mode.
> > +        2 =3D MIX mode(PWM at low brightness and DC at high brightness=
).
> > +        3 =3D MIX-26k mode(MIX mode with different PWM frequency).
> > +    enum: [ 0, 1, 2, 3 ]
> > +    default: 1
> > +
> > +  awinic,sw-freq-hz:
> > +    description: Boost switching frequency in Hz.
> > +    enum: [ 300000, 400000, 500000, 600000, 660000, 750000, 850000, 10=
00000, 1200000, 1330000, 1500000, 1700000 ]
>
> Please wrap code according to the preferred limit expressed in Kernel
> coding style (checkpatch is not a coding style description, but only a
> tool).
>

ACK.

> > +    default: 750000
> > +
> > +  awinic,sw-ilmt-microamp:
> > +    description: Switching current limitation in uA.
> > +    enum: [ 1500000, 2000000, 2500000, 3000000 ]
> > +    default: 3000000
> > +
> > +  awinic,iled-max-microamp:
> > +    description: Maximum LED current setting in uA.
> > +    minimum: 5000
> > +    maximum: 50000
> > +    multipleOf: 500
> > +    default: 20000
> > +
> > +  awinic,uvlo-thres-microvolt:
> > +    description: UVLO(Under Voltage Lock Out) in uV.
> > +    enum: [ 2200000, 5000000 ]
> > +    default: 2200000
> > +
> > +  awinic,ramp-ctl:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: >
> > +      Select ramp control and filter of the device.
> > +        0 =3D Fade in/fade out.
> > +        1 =3D Light filter.
> > +        2 =3D Medium filter.
> > +        3 =3D Heavy filter.
> > +    enum: [ 0, 1, 2, 3 ]
> > +    default: 2
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - enable-gpios
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/gpio/gpio.h>
> > +
> > +    i2c {
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <0>;
> > +
> > +        aw99706@76 {
>
> Node names should be generic. See also an explanation and list of
> examples (not exhaustive) in DT specification:
> https://devicetree-specification.readthedocs.io/en/latest/chapter2-device=
tree-basics.html#generic-names-recommendation
> If you cannot find a name matching your device, please check in kernel
> sources for similar cases or you can grow the spec (via pull request to
> DT spec repo).
>

I see. backlight@76, thanks for your detailed explanation.

Regards,
Junjie
