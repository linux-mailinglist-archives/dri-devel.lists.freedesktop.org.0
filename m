Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2CDC856A1F
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 17:54:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03E0710E9F2;
	Thu, 15 Feb 2024 16:54:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com
 [209.85.219.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71B6F10E9F2
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Feb 2024 16:54:09 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id
 3f1490d57ef6-dc74435c428so965336276.2
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Feb 2024 08:54:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708016047; x=1708620847;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QpZ3DC22tFbBqcAPh32HZHLlqMy5ASZz7S0FXazTgLQ=;
 b=GsArN9Cm+lFUix5wIHk+plZZRD8ydPJ/LeOPgPu2LFPzfbY/qMhWS4v44XL8162udJ
 GcXgh0pDxBpYHfhIPQCQBqgGXW2R16b4i1tcmDKdh2+WOT3PJNudGiMQg2iD5EZy5dVT
 mzehnl9FhS/HClfFJFO+vnnYb7FhTbofCaQcuRXLmVpeZduFymx+QY1hd25qKIDEEyUm
 d+bJPLwJSrbsPp4RtBA4aV9TzPY2llOhTs1iCGaLCH3AVkWitGMvJ74A1FXnz4kY9kZt
 7D7X+fVA+n0nbCIcxVcuPr6ELQP4yqj33XDVudvjv+ksQsjAtTIyUfjDvjCoYZU7SQX+
 rkgw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZ/RdMQx1/DOx0gC4ox7kuMep/X6FKGJi0x7aFgVv2b6IHRujlto9IhnibyMLuUVqk8J3L1ZxLUW9MoMMr+Ve7L4NNLo64Mg7tXF0tUC7+
X-Gm-Message-State: AOJu0Yymtg/vquJxgc/+A8rAqbRt6OgBmDNEsiGE/0Q8R3OVH0tJ3gRX
 XlQJvrrwP7re2htAY2t80tBAMEafPDxT8OX6R2aVzi3A+kooRox89ojDZwsvLsPJyg==
X-Google-Smtp-Source: AGHT+IGYQBWT57U54SJQzmJmdJjwvcy28YBFxVOhryFx6Q5KLO2S3egz6FB3cooDPgS5BHzFM3B/VA==
X-Received: by 2002:a05:6902:1247:b0:dc6:ff12:1a21 with SMTP id
 t7-20020a056902124700b00dc6ff121a21mr2563068ybu.31.1708016045375; 
 Thu, 15 Feb 2024 08:54:05 -0800 (PST)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com.
 [209.85.128.170]) by smtp.gmail.com with ESMTPSA id
 i9-20020a25be89000000b00dcd9e3d3fd0sm246698ybk.19.2024.02.15.08.54.04
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Feb 2024 08:54:04 -0800 (PST)
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-607e37cd180so4716607b3.0
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Feb 2024 08:54:04 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWCS7+00krctt+MtFw7dVEQHZ0LXrN0GBfwKuw5TZXb34z6Q8j4UqLuUAX3SzN/UAkp4Dky6XGyAs0OUG8s/90RksEOBtCoRg00/Umg42va
X-Received: by 2002:a0d:e8c9:0:b0:604:4498:34a0 with SMTP id
 r192-20020a0de8c9000000b00604449834a0mr2240802ywe.22.1708016044638; Thu, 15
 Feb 2024 08:54:04 -0800 (PST)
MIME-Version: 1.0
References: <6be2558b8462fc08095c24c9257563ab5f3ae013.1708001398.git.geert+renesas@glider.be>
 <kycepdxukfsww3tnxoo5hoiuo3vcgpqqmynokzhtl4vodgm6zc@ih4uhw7gz4jh>
In-Reply-To: <kycepdxukfsww3tnxoo5hoiuo3vcgpqqmynokzhtl4vodgm6zc@ih4uhw7gz4jh>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 15 Feb 2024 17:53:53 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVf7ophCwKt-n_N-LBHV4+t14Gjb4d1O0T8FDk_9xMFtA@mail.gmail.com>
Message-ID: <CAMuHMdVf7ophCwKt-n_N-LBHV4+t14Gjb4d1O0T8FDk_9xMFtA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/imagination: DRM_POWERVR should depend on ARCH_K3
To: Maxime Ripard <mripard@kernel.org>
Cc: Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Sarah Walker <sarah.walker@imgtec.com>,
 Donald Robson <donald.robson@imgtec.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Javier Martinez Canillas <javierm@redhat.com>, Nishanth Menon <nm@ti.com>,
 Adam Ford <aford173@gmail.com>, Marek Vasut <marek.vasut@mailbox.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>
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

Hi Maxime,

On Thu, Feb 15, 2024 at 5:18=E2=80=AFPM Maxime Ripard <mripard@kernel.org> =
wrote:
> On Thu, Feb 15, 2024 at 01:50:09PM +0100, Geert Uytterhoeven wrote:
> > Using the Imagination Technologies PowerVR Series 6 GPU requires a
> > proprietary firmware image, which is currently only available for Texas
> > Instruments K3 AM62x SoCs.  Hence add a dependency on ARCH_K3, to
> > prevent asking the user about this driver when configuring a kernel
> > without Texas Instruments K3 Multicore SoC support.
>
> This wasn't making sense the first time you sent it, and now that commit
> log is just plain wrong. We have firmwares for the G6110, GX6250,
> GX6650, BXE-4-32, and BXS-4-64 models, which can be found on (at least)
> Renesas, Mediatek, Rockchip, TI and StarFive, so across three

I am so happy to be proven wrong!
Yeah, GX6650 is found on e.g. R-Car H3, and GX6250 on e.g. R-Car M3-W.

> architectures and 5 platforms. In two months.

That sounds like great progress, thanks a lot!

Where can I find these firmwares? Linux-firmware[1] seems to lack all
but the original K3 AM62x one.

Thanks again!

[1] https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware=
.git/

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
