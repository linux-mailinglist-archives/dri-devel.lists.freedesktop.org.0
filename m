Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E2879C8A9
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 09:50:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7F7210E3A8;
	Tue, 12 Sep 2023 07:50:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com
 [209.85.128.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33A1510E3A8
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Sep 2023 07:50:44 +0000 (UTC)
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-591ba8bd094so50003007b3.3
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Sep 2023 00:50:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694505043; x=1695109843;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RA+GxIpXP8cITPYqZGKmspSNybpN4+ElppCVJJUtNRE=;
 b=UrEx325alrzVlHEm3QGXdYvIBOMfOwm8PcBSmWp9p+DHHIdl+do89L9nSC5Ks2qHCf
 4LG4qYEpaMvFy5kt60uQr3Gy0fiOLhpOM8wYbj6wngMlG23xAM66LPv5IxqtqNpfImqu
 KhcYo60Rrwt88Yjp+/jOSMx+BZkXaLEhj5b2wa4rWCUrmvIRHGo4NcYPiWVSkXi7Kekk
 9wacdaCr/eOdTnFLA66uiCcwCKO+U0lxlNYxvOW9hM5eVkTE/TshqehfBn+TaYNs/1Jd
 TJKJC9iJ6ROcxgjGxnSCBMZDjmYjJ7B1JE9Mye362oyIGNUHAgYUus16SSaH6YfN48yt
 hPtA==
X-Gm-Message-State: AOJu0YyR21l9HCo8ixEvjRdxgO5MRzrrtJi4xngC51zgqwm8AsiJ7A8y
 JbCvnGKDZ3OioDkIly3one6tTUr01eHqSQ==
X-Google-Smtp-Source: AGHT+IGgatmauPSLEXSnsuaWxVuC58gw5BbEtn11SYX16in7bezjSVwyBVl+nMJrw+/r/WfUESE2MA==
X-Received: by 2002:a81:a1c5:0:b0:595:2de4:c991 with SMTP id
 y188-20020a81a1c5000000b005952de4c991mr12684633ywg.29.1694505043140; 
 Tue, 12 Sep 2023 00:50:43 -0700 (PDT)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com.
 [209.85.219.180]) by smtp.gmail.com with ESMTPSA id
 t7-20020a0dd107000000b00595394ba94asm2440040ywd.55.2023.09.12.00.50.42
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Sep 2023 00:50:42 -0700 (PDT)
Received: by mail-yb1-f180.google.com with SMTP id
 3f1490d57ef6-d78328bc2abso4989967276.2
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Sep 2023 00:50:42 -0700 (PDT)
X-Received: by 2002:a25:512:0:b0:ba8:2e05:3e9c with SMTP id
 18-20020a250512000000b00ba82e053e9cmr11393965ybf.24.1694505042631; Tue, 12
 Sep 2023 00:50:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230911205338.2385278-1-arnd@kernel.org>
 <CAMuHMdWizKkuLEcv8sFFOWPib-0e1onCRuQEZm6OhV592VWUKQ@mail.gmail.com>
 <aa935abe-2ccf-4889-a717-4efecc13d48b@app.fastmail.com>
In-Reply-To: <aa935abe-2ccf-4889-a717-4efecc13d48b@app.fastmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 12 Sep 2023 09:50:31 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUAu27grxoGmtDAZVL_ZHd7vvPcZq-FJ_zYXKKQVg_idg@mail.gmail.com>
Message-ID: <CAMuHMdUAu27grxoGmtDAZVL_ZHd7vvPcZq-FJ_zYXKKQVg_idg@mail.gmail.com>
Subject: Re: [PATCH] drm: fix up fbdev Kconfig defaults
To: Arnd Bergmann <arnd@arndb.de>
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
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <mripard@kernel.org>, Arthur Grillo <arthurgrillo@riseup.net>,
 dri-devel@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Arnd,

On Tue, Sep 12, 2023 at 9:40=E2=80=AFAM Arnd Bergmann <arnd@arndb.de> wrote=
:
> On Tue, Sep 12, 2023, at 09:14, Geert Uytterhoeven wrote:
> > On Mon, Sep 11, 2023 at 10:53=E2=80=AFPM Arnd Bergmann <arnd@kernel.org=
> wrote:
> >> --- a/drivers/gpu/drm/Kconfig
> >> +++ b/drivers/gpu/drm/Kconfig
> >> @@ -135,7 +135,7 @@ config DRM_FBDEV_EMULATION
> >>         bool "Enable legacy fbdev support for your modesetting driver"
> >>         depends on DRM
> >>         select FRAMEBUFFER_CONSOLE_DETECT_PRIMARY if FRAMEBUFFER_CONSO=
LE
> >> -       default y
> >> +       default FB
> >
> > While this is true for existing configs, it is no longer true in genera=
l,
> > as DRM_FBDEV_EMULATION is no longer related to FB.
>
> I think it still makes some sense though, as configs that have
> both DRM and FB enabled almost certainly want this enabled.

OK.

People who use DRM drivers only, and now realize they no longer need
CONFIG_FB, may need to enable CONFIG_DRM_FBDEV_EMULATION
manually when disabling CONFIG_FB, depending on their use case.

> >> diff --git a/drivers/video/console/Kconfig b/drivers/video/console/Kco=
nfig
> >> index b575cf54174af..83c2d7329ca58 100644
> >> --- a/drivers/video/console/Kconfig
> >> +++ b/drivers/video/console/Kconfig
> >> @@ -74,6 +74,7 @@ config DUMMY_CONSOLE_ROWS
> >>  config FRAMEBUFFER_CONSOLE
> >>         bool "Framebuffer Console support"
> >>         depends on FB_CORE && !UML
> >> +       default DRM_FBDEV_EMULATION
> >
> > Sounds good to me, although it looks a bit strange at first sight
> > (FRAMEBUFFER_CONSOLE defaults to n on a system with real fbdev, but
> > y on emulated fbdev?).
> > So this is the fix for commit a5ae331edb02b ("drm: Drop select
> > FRAMEBUFFER_CONSOLE for DRM_FBDEV_EMULATION").
>
> Correct, this should restore the console on configs that
> accidentally lost it. The real problem here is much older,
> the assymetry between framebuffer-only configs (with console
> default off) and DRM configs (with console selected
> unconditionally) started back in 2009 with commit 6fcefd56f5060
> ("drm/kms: fix kms helper license + Kconfig").
>
> I think that was a mistake, but there is little we can do
> to fix that now without breaking users.

Right...

>
> The only alternative I can think of would be to default-enable
> or force-enable FRAMEBUFFER_CONSOLE for any config that includes
> both VT_CONSOLE and FB_CORE. This would increase defconfig
> builds for systems that currently only want CONFIG_FB for
> either FB_DEVICE or LOGO but don't care about
> FRAMEBUFFER_CONSOLE. I have no idea who uses such a config,
> but I think Javier previously said this was an important
> use case.
>
> >> diff --git a/drivers/video/fbdev/core/Kconfig b/drivers/video/fbdev/co=
re/Kconfig
> >> index 114cb8aa6c8fd..804c2bec9b43c 100644
> >> --- a/drivers/video/fbdev/core/Kconfig
> >> +++ b/drivers/video/fbdev/core/Kconfig
> >> @@ -28,7 +28,7 @@ config FIRMWARE_EDID
> >>  config FB_DEVICE
> >>         bool "Provide legacy /dev/fb* device"
> >>         depends on FB_CORE
> >> -       default y
> >> +       default FB
> >
> > Changing this means possibly causing regressions on systems running
> > an fbdev userspace.
>
> How? FB_DEVICE is a new config that was just split out from
> CONFIG_FB in 6.6-rc1, so nobody should have any defconfig
> that disables CONFIG_FB but relies on the FB_DEVICE default yet.

Right, from the PoV of running "make oldconfig" that is true.

(I was incorrectly considering the defconfigs which I maintain,
 and where I already disabled CONFIG_FB after the FB/FB_CORE
 split in linux-next).

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

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
