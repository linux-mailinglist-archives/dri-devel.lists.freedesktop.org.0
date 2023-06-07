Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 394A27257DE
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 10:35:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F52310E45E;
	Wed,  7 Jun 2023 08:35:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com
 [209.85.128.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 414D310E45E
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 08:35:15 +0000 (UTC)
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-5664b14966bso87853227b3.1
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jun 2023 01:35:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686126913; x=1688718913;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Tl7bhCDuACQlGnVS8msclVNyzt7m2ZyWzQXQ4o8Ijq4=;
 b=HBuh7ISBaJM71HhUh7Q8ocdE4YTFt8IRlYJcIw08smrSGTj0wKJR3xpvbpmHtabT6o
 Sl53ROWa/oSP+BtqR9BrrtJPuzUL8f0uHPqzvx3rOnvtmNfYUWIWtRZCLNhAILtZnr86
 xdAdiPzewYaS9Et4vL+wvx598Bo/kGw3VTqXq1xtPV4ls/0+xDcH/lfnbQBzEg1vLq4G
 BMG0fZawgc+xX3f8YgAPSH1mD0ltt+XYLmY20221fRKRxX+pRZ/kiBAYTBUbZtWhcpRb
 OcMzM7Sv+DF7GPpOXZjtQSEmMR1t05QBG45VBZOOuFlC7OKorGwf09h3yKPyxz6xtmPr
 9frg==
X-Gm-Message-State: AC+VfDwk/augr+gvBr1XXc8FWOiDZLAIkmNVve13h7M5HqTiXR2xheG7
 0DzOaNJ0dyOK+vqGZJBqtTqPQt7sOEMRKg==
X-Google-Smtp-Source: ACHHUZ5PMjp997fu50HTyec4GXdkmKVEZ1dvj0/2iiAqHBUZGEROKdQ2qzeccAfld/tbvK0jHqEbyA==
X-Received: by 2002:a81:c310:0:b0:561:8fef:13ce with SMTP id
 r16-20020a81c310000000b005618fef13cemr6166965ywk.37.1686126913067; 
 Wed, 07 Jun 2023 01:35:13 -0700 (PDT)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com.
 [209.85.128.177]) by smtp.gmail.com with ESMTPSA id
 k126-20020a816f84000000b00565cf40238csm4600500ywc.110.2023.06.07.01.35.12
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Jun 2023 01:35:12 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-565bdae581eso87632387b3.2
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jun 2023 01:35:12 -0700 (PDT)
X-Received: by 2002:a0d:eac5:0:b0:568:f2c:ee40 with SMTP id
 t188-20020a0deac5000000b005680f2cee40mr4715739ywe.3.1686126912094; Wed, 07
 Jun 2023 01:35:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230605144812.15241-1-tzimmermann@suse.de>
In-Reply-To: <20230605144812.15241-1-tzimmermann@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 7 Jun 2023 10:35:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUNAg5MYQVOnVhYeHKnciHci1Ly6v8DbdBp_P_9YEu=Zg@mail.gmail.com>
Message-ID: <CAMuHMdUNAg5MYQVOnVhYeHKnciHci1Ly6v8DbdBp_P_9YEu=Zg@mail.gmail.com>
Subject: Re: [PATCH 00/30] fbdev: Make userspace interfaces optional
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: daniel.thompson@linaro.org, linux-staging@lists.linux.dev,
 linux-sh@vger.kernel.org, jingoohan1@gmail.com, deller@gmx.de, lee@kernel.org,
 javierm@redhat.com, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-omap@vger.kernel.org, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

Thanks for your series!

Over the past few days, I have been giving this some thought, that's
why I am replying only now...

On Mon, Jun 5, 2023 at 4:48=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse.=
de> wrote:
> Add the new config option FB_DEVICE. If enabled, fbdev provides
> traditional userspace interfaces in devfs, sysfs and procfs, such
> as /dev/fb0 or /proc/fb.
>
> Modern Linux distrobutions have adopted DRM drivers for graphics
> output and use fbdev only for the kernel's framebuffer console.
> Userspace has also moved on, with no new fbdev code being written
> and existing support being removed.
>
> OTOH, fbdev provides userspace a way of accessing kernel or I/O
> memory, which might compromise the system's security. See the recent

True, in some form...
The amount of "kernel memory" that can be accessed is controlled by
the fbdev driver (or by the DRM fbdev emulation). Nothing unsafe here.
The I/O memory that can be accessed (if any) is controlled by the
fbdev driver, and the full capabilities (e.g. DMA to random addresses)
exported depend on the actual hardware.

> commit c8687694bb1f ("drm/fbdev-generic: prohibit potential
> out-of-bounds access") for an example. Disabling fbdev userspace

IMHO that's not a good example for the point you're trying to make,
but merely bad bounds checking in kernel copying code...

> interfaces is therefore a useful feature to limit unecessary
> exposure of fbdev code to processes of low privilegues.

This actually depends on the permissions on /dev/fb*...

BTW, I am wondering if it would be possible to write a DRM emulation
layer on top of (basic, e.g. no MMIO, just fb) fbdev?

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
