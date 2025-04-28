Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64917A9FC0E
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 23:15:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4917510EA62;
	Mon, 28 Apr 2025 21:15:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="RcZLLnih";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B24B610EA62
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 21:15:32 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id
 d2e1a72fcca58-736c062b1f5so4491156b3a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 14:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1745874929; x=1746479729;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hanN27KZoqo0z82RNW8lpqnAS/vBC+tork2hH91F48I=;
 b=RcZLLnihAliPejRQdPQYjdX5lX6VtzSpf6x3alQ1ta/SxpPbc18tlSxQQHvKT6JAdb
 crBzJPlQWiVjGcDBLqPdp2PaxtXJ2a8lOBHd90YXm0p5oyGK9V/RAta1cp7ka8Rq9LOj
 UL//akiFNKWmmHI36RaRi9fAVrwdGRwSW24NY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745874929; x=1746479729;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hanN27KZoqo0z82RNW8lpqnAS/vBC+tork2hH91F48I=;
 b=Qg9nuBODh3/pj12uAMpwoY5c+hitQR1un8zJVV5yHRGPpMvUBkoQ1HX6zfaMR7pwo4
 i9U6M/dZUFWvYZxgCsZkjoNoWbVuzVHtKaEYfLLfMe3AClGRrDwJ0aGX3T/Q/CYYtoOE
 xd9ifAl4Yj6ND3hQKYWmQruaYbjcXwUobR9j+ZlS1q39bdcSdQ1L5ri4HvASXYg/NiIu
 zi0oHM99S/3l/KA87TUoJXpcnZAfGtylFdd2D1PI/qlOFC5NPKWXBo7Y4rwUuDneeciY
 FlvRKm/EDxeA3YKO69lvDo0O+ceMAXDr0r5VYpJGSqrujEaS7gHYC/POIlsiJ9VVpuLY
 aFYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVKFIlvaprOVb2DgpL+yz0Xt5z7Eqi5JDBLm0hqBn2xgXI5kx6hNszunUmLl6hV6ioUgGBiAeTjnjw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxJjCTMmfQzAvAmtpve+tUYJfmnKuhqc/oIFM+AZv9OWckW6s0M
 95L3ZYsURy20DjaXHzvh1G1kKsifZwWGPC9l7W08Ch6SLLRHmGK0Ap0JVbsBINBOxVVQUBfOPJo
 =
X-Gm-Gg: ASbGncsUVf4ikQ0AcmJVv66cHYKoa1LVC1KRrsjQYmG9EmyBOZeR7Uor6qwSvGN6Zei
 HneE8Kbv7lMiatbtJcKWbjP2g0AS/hWTnTHQQnvpp1SsrpHSGsIkwTLHWYVHW4THfclv4fVgKha
 GIMutuW7RIBcjuTIr+4VDCWJgkcDC7lXyozdJLUNpmnn1C+5RbYpib/LlVVqgdMBRFV4vsuZfda
 O4or3HkP4WTR+P5yWu/apER8iBfObd4it5GNaa0Irod1tpmruKTxlQezsRzgUVDHzaFkDi2SxvG
 U++bFoAmktb5jgICmg7tyJKr9iJfOsL1GCkzQZlDviAMotLFOMBVgjrDRes2yIhu2XSLrWPBDGC
 gfRHx
X-Google-Smtp-Source: AGHT+IHNn5+1w4qZ7VAqZ7s7J8G2J0lzC/nuGOc/UKmuJ0FqH4yyfTJNkYlPS/q5wZ6FAsNP85YD7w==
X-Received: by 2002:a05:6a00:884:b0:736:b9f5:47c6 with SMTP id
 d2e1a72fcca58-740271e26d2mr1776007b3a.16.1745874928452; 
 Mon, 28 Apr 2025 14:15:28 -0700 (PDT)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com.
 [209.85.216.43]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73e25912efbsm8504474b3a.23.2025.04.28.14.15.26
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Apr 2025 14:15:26 -0700 (PDT)
Received: by mail-pj1-f43.google.com with SMTP id
 98e67ed59e1d1-306b6ae4fb2so4817273a91.3
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 14:15:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXR1z+0oAQMsMhEhjAt4mS8O8JbZvj1cibanwThCKTjXGjRc2KdettFLNi7SE9NV+mrdloaJniASCc=@lists.freedesktop.org
X-Received: by 2002:a17:90b:3a44:b0:309:f67c:aa8a with SMTP id
 98e67ed59e1d1-30a21546738mr1846179a91.5.1745874925916; Mon, 28 Apr 2025
 14:15:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250424105432.255309-1-j-choudhary@ti.com>
 <3f44ec0b-216c-4534-a6de-7b17929cb9e1@ti.com>
In-Reply-To: <3f44ec0b-216c-4534-a6de-7b17929cb9e1@ti.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 28 Apr 2025 14:15:12 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WytPZCF-jcWFgXoAOoXOV61bw2_ftJbdbWZviHQqap5w@mail.gmail.com>
X-Gm-Features: ATxdqUFuySNI3rOAaMe62mEHPq2JIyed3obe4-5b7857UFDyYpkL2fq2SDRRguQ
Message-ID: <CAD=FV=WytPZCF-jcWFgXoAOoXOV61bw2_ftJbdbWZviHQqap5w@mail.gmail.com>
Subject: Re: [RFC PATCH] drm/bridge: ti-sn65dsi86: Enable HPD functionality
To: "Kumar, Udit" <u-kumar1@ti.com>
Cc: Jayesh Choudhary <j-choudhary@ti.com>, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, 
 rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, 
 dri-devel@lists.freedesktop.org, tomi.valkeinen@ideasonboard.com, 
 jonas@kwiboo.se, jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
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

Hi,

On Thu, Apr 24, 2025 at 6:32=E2=80=AFPM Kumar, Udit <u-kumar1@ti.com> wrote=
:
>
> Hello Jayesh,
>
> On 4/24/2025 4:24 PM, Jayesh Choudhary wrote:
> > For TI SoC J784S4, the display pipeline looks like:
> > TIDSS -> CDNS-DSI -> SN65DSI86 -> DisplayConnector -> DisplaySink
> > This requires HPD to detect connection form the connector.
> > By default, the HPD is disabled for eDP. So enable it conditionally
> > based on a new flag 'keep-hpd' as mentioned in the comments in the
> > driver.
> >
> > Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
> > ---
> >
> > Hello All,
> >
> > Sending this RFC patch to get some thoughts on hpd for sn65dsi86.
> >
> > Now that we have a usecase for hpd in sn65dsi86, I wanted to get
> > some comments on this approach to "NOT DISABLE" hpd in the bridge.
> > As the driver considers the eDP case, it disables hpd by default.
> > So I have added another property in the binding for keeping hpd
> > functionality (the name used is still debatable) and used it in
> > the driver.
> >
> > Is this approach okay?
> > Also should this have a "Fixes" tag?
>
> >
> >   .../bindings/display/bridge/ti,sn65dsi86.yaml      |  6 ++++++
> >   drivers/gpu/drm/bridge/ti-sn65dsi86.c              | 14 +++++++++----=
-
> >   2 files changed, 15 insertions(+), 5 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65ds=
i86.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.ya=
ml
> > index c93878b6d718..5948be612849 100644
> > --- a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yam=
l
> > +++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yam=
l
> > @@ -34,6 +34,12 @@ properties:
> >         Set if the HPD line on the bridge isn't hooked up to anything o=
r is
> >         otherwise unusable.
> >
> > +  keep-hpd:
> > +    type: boolean
> > +    description:
> > +      HPD is disabled in the bridge by default. Set it if HPD line mak=
es
> > +      sense and is used.
> > +
>
> Here are my suggestions
>
> 1) use interrupt in binding as optional instead of keep-hpd
>
> 2) use interrupt field (if present to enable of disable HPD functions in
> driver)

Officially we've already got a "no-hpd" specified in the device tree.
You're supposed to be specifying this if HPD isn't hooked up. It would
be best if we could use that property if possible. If we think that
using the lack of "no-hpd" will break someone then we should be
explicit about that.

I'd also note that unless you've figured out a way to turn off the
awful debouncing that ti-sn65dsi86 does on HPD that using HPD (at
least for initial panel power on) only really makes sense for when
we're using ti-sn65dsi86 in "DP" mode. For initial eDP panel poweron
it was almost always faster to just wait the maximum delay of the
panel than to wait for ti-sn65dsi86 to finally report that HPD was
asserted.

I could also note that it's possible to use the ti-sn65dsi86's "HPD"
detection even if the interrupt isn't hooked up, so I don't totally
agree with Udit's suggestion.

I guess the summary of my thoughts then: If you want to enable HPD for
eDP, please explain why in the commit message. Are you using this to
detect "panel interrupt"? Somehow using it for PSR? Using it during
panel power on? If using it for panel power on, have you confirmed
that this has a benefit compared to using the panel's maximum delay?

-Doug
