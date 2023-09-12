Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9FD79CA94
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 10:51:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E10310E3C3;
	Tue, 12 Sep 2023 08:51:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com
 [209.85.128.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6C5410E3C3
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Sep 2023 08:51:06 +0000 (UTC)
Received: by mail-yw1-f174.google.com with SMTP id
 00721157ae682-5921a962adfso52530107b3.1
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Sep 2023 01:51:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694508665; x=1695113465;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ozjJz+HbGpK2W+4R2eDfrxms+YTfRjnfcjO2Noa2OiY=;
 b=pdfNPfRYNZpJqx71ljiDrvajowXUj6lvo9lM9YS5CpLwUveJ2yr5arxMrQ5f0rQNU2
 VZl3vpCXZ4AD5u3X75wiFnHiYMXi+kzuf4+CuFevgbTbh6EHnOqYgnAuMRExa5LCuaru
 iuP4wRx1o1s0m2HjhyB/adO1uLkDqmOK0m6QfTAqV7Yt8ERosKExTP8llFuZIWbY+uux
 jJegYtKIE53yR+DeW/R3GcvYHnKFCMTro0oClDDfr28ry6IRptVjpwib8jcxC7lbcOH9
 JSm061b+PxE2aVKqUxgWHPCrhhXfEyX1uuOntTiNi4TE+hPuR0qV+3alheI+c/fbt/j1
 Bflg==
X-Gm-Message-State: AOJu0YwCAetbOwSDmD2dos4gZXnpVK+TYrEWVcTq2WD1l2vwnRzXcmss
 QHgCSKMPEgehx8agxD44XjmCY4sGVYdJkQ==
X-Google-Smtp-Source: AGHT+IGQ88OVFf6/sCpSChpP42oREYZ6PXfq6IL8rhkDt6vAb5Qa1h+ImKop2jvnWYainAvYSDtynw==
X-Received: by 2002:a81:9109:0:b0:56f:fffc:56ff with SMTP id
 i9-20020a819109000000b0056ffffc56ffmr12270375ywg.42.1694508665605; 
 Tue, 12 Sep 2023 01:51:05 -0700 (PDT)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com.
 [209.85.128.182]) by smtp.gmail.com with ESMTPSA id
 s9-20020a817709000000b0059ae483b89dsm2455980ywc.50.2023.09.12.01.51.05
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Sep 2023 01:51:05 -0700 (PDT)
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-5924093a9b2so52547247b3.2
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Sep 2023 01:51:05 -0700 (PDT)
X-Received: by 2002:a5b:709:0:b0:d80:68d1:b826 with SMTP id
 g9-20020a5b0709000000b00d8068d1b826mr7289924ybq.6.1694508664873; Tue, 12 Sep
 2023 01:51:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230911205338.2385278-1-arnd@kernel.org>
 <CAMuHMdWizKkuLEcv8sFFOWPib-0e1onCRuQEZm6OhV592VWUKQ@mail.gmail.com>
 <637afb25-8ee2-4188-9385-27ee6a97ec59@suse.de>
 <CAMuHMdW63WjidvAovqRz70bMgbLt4cSkOP1xSh7sEcqdwR3tOw@mail.gmail.com>
 <bf4a1cbd-c24e-4def-a523-1a707a1ca5a1@suse.de>
In-Reply-To: <bf4a1cbd-c24e-4def-a523-1a707a1ca5a1@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 12 Sep 2023 10:50:53 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX2zBmLiXs488RKsVPvj=0rx4tSYj6G9cEhchyEMhZuDg@mail.gmail.com>
Message-ID: <CAMuHMdX2zBmLiXs488RKsVPvj=0rx4tSYj6G9cEhchyEMhZuDg@mail.gmail.com>
Subject: Re: [PATCH] drm: fix up fbdev Kconfig defaults
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
Cc: Arnd Bergmann <arnd@kernel.org>, linux-fbdev@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Helge Deller <deller@gmx.de>, Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <mripard@kernel.org>, Arthur Grillo <arthurgrillo@riseup.net>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On Tue, Sep 12, 2023 at 10:38=E2=80=AFAM Thomas Zimmermann <tzimmermann@sus=
e.de> wrote:
> Am 12.09.23 um 10:18 schrieb Geert Uytterhoeven:
> > On Tue, Sep 12, 2023 at 10:11=E2=80=AFAM Thomas Zimmermann <tzimmermann=
@suse.de> wrote:
> >> Am 12.09.23 um 09:14 schrieb Geert Uytterhoeven:
> >> [...]
> >>>> --- a/drivers/gpu/drm/Kconfig
> >>>> +++ b/drivers/gpu/drm/Kconfig
> >>>> @@ -135,7 +135,7 @@ config DRM_FBDEV_EMULATION
> >>>>           bool "Enable legacy fbdev support for your modesetting dri=
ver"
> >>>>           depends on DRM
> >>>>           select FRAMEBUFFER_CONSOLE_DETECT_PRIMARY if FRAMEBUFFER_C=
ONSOLE
> >>>> -       default y
> >>>> +       default FB
> >>>
> >>> While this is true for existing configs, it is no longer true in gene=
ral,
> >>> as DRM_FBDEV_EMULATION is no longer related to FB.
> >>
> >> Would it make sense to make FRAMEBUFFER_CONSOLE an independent option
> >> and have FBDEV_EMULATION depend on it? Something like this:
> >>
> >> FRAMEBUFFER_CONSOLE
> >>          depends on DRM || FB
> >>          select FB_CORE
> >>
> >> FBDEV_EMULATION
> >>          depends on DRM
> >>          depends on FRAMEBUFFER_CONSOLE
> >>          default y
> >
> > Oops, now you can no longer have FBDEV_EMULATION without
> > FRAMEBUFFER_CONSOLE, which is useful to be able to enable
> > FB_DEVICE...
>
> And if it depends on FB_CORE instead of FRAMEBUFFER_CONSOLE? I'm aware
> that this would require more Kconfig changes than outlined here.
>
>
> >
> > And what's the point (if DRM is enabled) of having FB_CORE with
> > FBDEV_EMULATION disabled?
> >
> >> So if any graphics subsystems are enabled, FRAMEBUFFER_CONSOLE is
> >> select-able. But for DRM, FBDEV_EMULATION disables the console. That
> >
> > Huh?
> >
> > /me looks at his morning coffee, and confirms the cup is empty...
>
> Decaf maybe?
>
> But there's really no need to get snarky. My though is that

Sorry, I was surprised by "FBDEV_EMULATION disables the console",
which is not what the Kconfig snippet you suggested does?

> FRAMEBUFFER_CONSOLE configures an end-user feature. The user sits there
> an thinks "I want a console". FBDEV_EMULATION controls a driver
> functionality. It's not useful by itself, but enables the enduser
> feature. The features would be FRAMEBUFFER_CONSOLE and FRAMEBUFFER_DEVICE=
.

The latter is currently called FB_DEVICE.

If you want to have this controlled by user-visible features, then
either FRAMEBUFFER_CONSOLE and FRAMEBUFFER_DEVICE should
"select FBDEV_EMULATION if DRM", right?

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
