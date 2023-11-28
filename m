Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A67D07FC41C
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 20:16:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 846E510E179;
	Tue, 28 Nov 2023 19:16:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com
 [209.85.128.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 884D310E179
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 19:16:32 +0000 (UTC)
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-5cd81e76164so51206797b3.1
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 11:16:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701198991; x=1701803791;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f1rEKxL95Ib6FRaTkxx55nHqJypwTeMmzYLzyUcaTGA=;
 b=PEl7Q1Lu0+TVKWew+s+bSD6TpEJPoioRRBtOr//ipiinFt87NGPaXuJ8lXDyyXWhuH
 S8DkI1am/Jk8l1UhIPYMFGZAz90W6Oe22OYlZKU7m/ojeT0QZdUc0A+6kt7grIjrRJo6
 f9a4FJ+oh1v6D1WvdkPfKfRsZAOBs14T0RzLEW84eZDhIYms85spKyN13bktf36bd7+L
 diG76YQhifJ3HMtQI+nOX4kUVHpcWdfF8fPswMdDk5im3kOQbs2lrI3tXN+qimVmd/Mq
 Dxu5/n+8CHXVxLStKUcZ4kCDCOd95yqselfQd0pgAnY39oFAvfLlLXbJEwII7YRu3Fza
 alRA==
X-Gm-Message-State: AOJu0YxARor1VG4+9orMx0W30JR/CmJJn7wTSiQZoGSGhZUXpJ1oMkDp
 Wv7CFUXr/Ce/Pbmz6xV5DdJbROAUNNBK2Q==
X-Google-Smtp-Source: AGHT+IFeYbh0Hs1YDynTf6tx+a1QHqBKsUyh0AdsDzsJ5Q5xK6yOz7hzJ2rfUX6/89lrmJ0RiXVb4A==
X-Received: by 2002:a05:690c:3348:b0:5ce:a72e:a30a with SMTP id
 fk8-20020a05690c334800b005cea72ea30amr15242016ywb.24.1701198991507; 
 Tue, 28 Nov 2023 11:16:31 -0800 (PST)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com.
 [209.85.219.182]) by smtp.gmail.com with ESMTPSA id
 n8-20020a817208000000b005c5a24e9ad5sm4082857ywc.51.2023.11.28.11.16.30
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Nov 2023 11:16:30 -0800 (PST)
Received: by mail-yb1-f182.google.com with SMTP id
 3f1490d57ef6-da3b4b7c6bdso5644923276.2
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 11:16:30 -0800 (PST)
X-Received: by 2002:a25:d611:0:b0:da0:4a6d:bac with SMTP id
 n17-20020a25d611000000b00da04a6d0bacmr16127449ybg.0.1701198990141; Tue, 28
 Nov 2023 11:16:30 -0800 (PST)
MIME-Version: 1.0
References: <b9360c2044a1001b9a5bcb5914611711d040d4fe.1701196029.git.geert+renesas@glider.be>
 <87o7fdbszs.fsf@minerva.mail-host-address-is-not-set>
In-Reply-To: <87o7fdbszs.fsf@minerva.mail-host-address-is-not-set>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 28 Nov 2023 20:16:18 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUhuO++ZSxh+_TX_6DHHxjPYY20jTppbNZ4FnuBvxxinQ@mail.gmail.com>
Message-ID: <CAMuHMdUhuO++ZSxh+_TX_6DHHxjPYY20jTppbNZ4FnuBvxxinQ@mail.gmail.com>
Subject: Re: [PATCH] drm/imagination: DRM_POWERVR should depend on ARCH_K3
To: Javier Martinez Canillas <javierm@redhat.com>
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
Cc: Nishanth Menon <nm@ti.com>, Sarah Walker <sarah.walker@imgtec.com>,
 Tero Kristo <kristo@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Matt Coster <matt.coster@imgtec.com>, Donald Robson <donald.robson@imgtec.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-kernel@lists.infradead.org,
 Vignesh Raghavendra <vigneshr@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Javier,

On Tue, Nov 28, 2023 at 8:03=E2=80=AFPM Javier Martinez Canillas
<javierm@redhat.com> wrote:
> Geert Uytterhoeven <geert+renesas@glider.be> writes:
> > The Imagination Technologies PowerVR Series 6 GPU is currently only
> > supported on Texas Instruments K3 AM62x SoCs.  Hence add a dependency o=
n
> > ARCH_K3, to prevent asking the user about this driver when configuring =
a
> > kernel without Texas Instruments K3 Multicore SoC support.
> >
> > Fixes: 4babef0708656c54 ("drm/imagination: Add skeleton PowerVR driver"=
)
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
>
> Indeed. Although I wonder what is the supposed policy since for example
> the DRM_PANFROST symbol only depends on ARM || ARM64 and others such as

I think ARM Mali is sufficiently ubiquitous on ARM/ARM64 systems to
have just an ARM/ARM64 dependency...

> DRM_ETNAVIV don't even have an SoC or architecture dependency.

Vivante GPUs are found in DTS files on at least 4 architectures.
Might be worthwhile to add some dependencies, though...

> In any case, I agree with you that restricting to only K3 makes sense.

I am looking forward to adding || SOC_AM33XX || ARCH_RENESAS || ...,
eventually ;-)

> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Thanks!

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
