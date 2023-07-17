Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24178755DE0
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 10:07:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DC4310E1F9;
	Mon, 17 Jul 2023 08:07:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com
 [209.85.222.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62CDC10E1F9
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 08:07:24 +0000 (UTC)
Received: by mail-ua1-f48.google.com with SMTP id
 a1e0cc1a2514c-78f208ebf29so1197693241.3
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 01:07:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689581242; x=1692173242;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VQUYYb5UoV28AOm1zKXHyuqRflG1e1czbgtprr+9WpA=;
 b=XsqLxXazkvvfvbW42CeH4Erjl0rF90Q0vAXyoEeRNcdr6M8O5SzLm7KYUcThh6jZ3z
 FaZKp6F+kjqF16WOxqXJGyF/JMJx4HxJC5pGHwrLUb8SvKo6rLRluW0Ql8oeGwIVvCrD
 U9TydiP9DsWMPVDv9LAjDFJbsJt+9DNPCK2yixvsAOBaVKUTbCEgcDu4ok4ZNTCYGEzW
 wE0HbfdNVu3OXgJQRTtshBxiK39a4ImhTIWaDrz+N9beH6aR1WCeELhUTbXi7FIgJmXS
 6mgr9mh86b0H++2xskUxbnZaHvx7PzVGK9sNo+gWV3TEnosRRIl8kCXpiIAFgcXOixVc
 QmSA==
X-Gm-Message-State: ABy/qLb/IpP1Py9/Q9DaOsR95GN47ACnBUS45h9FYbEccDXnltoMV0XS
 YMJ0iGSMXe7EtsYUiX+4txWSRR5wLUvZOg==
X-Google-Smtp-Source: APBJJlFWh/5kDC6Ym4VehIwWXthAcjTyPAYzrAwKchzfY35ogcOxf62gozFjVIUp0anKFHTWKauaMA==
X-Received: by 2002:a05:6102:524:b0:443:7a85:8fbd with SMTP id
 m4-20020a056102052400b004437a858fbdmr4299648vsa.32.1689581242214; 
 Mon, 17 Jul 2023 01:07:22 -0700 (PDT)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com.
 [209.85.221.178]) by smtp.gmail.com with ESMTPSA id
 x8-20020ab05ac8000000b0048b7c4e8277sm2003909uae.15.2023.07.17.01.07.22
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jul 2023 01:07:22 -0700 (PDT)
Received: by mail-vk1-f178.google.com with SMTP id
 71dfb90a1353d-4815756d742so1082195e0c.1
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 01:07:22 -0700 (PDT)
X-Received: by 2002:a1f:bd48:0:b0:47e:fd6:6d77 with SMTP id
 n69-20020a1fbd48000000b0047e0fd66d77mr4986101vkf.3.1689581241818; Mon, 17 Jul
 2023 01:07:21 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1689252746.git.geert@linux-m68k.org>
 <87zg3w7zlz.fsf@minerva.mail-host-address-is-not-set>
In-Reply-To: <87zg3w7zlz.fsf@minerva.mail-host-address-is-not-set>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 17 Jul 2023 10:07:10 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV_qNfytroBEfqDMe04POt27s9o=FevXht7N4YXRmBz8Q@mail.gmail.com>
Message-ID: <CAMuHMdV_qNfytroBEfqDMe04POt27s9o=FevXht7N4YXRmBz8Q@mail.gmail.com>
Subject: Re: [PATCH 0/8] drm: fb-helper/ssd130x: Add support for DRM_FORMAT_R1
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Javier,

On Sun, Jul 16, 2023 at 3:30=E2=80=AFPM Javier Martinez Canillas
<javierm@redhat.com> wrote:
> Geert Uytterhoeven <geert@linux-m68k.org> writes:
> > The native display format of ssd1306 OLED displays is monochrome
> > light-on-dark (R1).  This patch series adds support for the R1 buffer
> > format to both the ssd130x DRM driver and the FB helpers, so monochrome
> > applications (including fbdev emulation and the text console) can avoid
> > the overhead of back-and-forth conversions between R1 and XR24.
>
> I've tested your series on a ssd1306 I2C OLED panel and fbcon did work fo=
r
> me, but had some issues when trying to run your fbtest suite. Because the

Thanks, due to the limited userspace environment on my RV32 test system,
I didn't run fbtest myself.

> test005 gets killed with a SIGSEGV.
>
> $ ./fbtest -d
> fb_init()
> fb_open()
> fb_get_var()
> fb_get_fix()
> fb_map()
> fb_start =3D 0, fb_offset =3D 0, fb_len =3D 1000

   [...]

> Running test test005
> Caught signal 11. Exiting

Strange.

> Maybe more tests are missing the minimum num_colors requirement? Also, th=
e

On monochrome, test005 should make the left half of the screen black,
and the right half white.  It works on ARAnyM, and there don't seem
to be off-by-one errors in the call to fill_rect().
Can you please run this under gdb or valgrind?

> penguin in test004 is not displayed correctly. I was expecting that to be
> working correctly since you mentioned to be using the Linux logo on boot.

Linux has logos for displays using 2, 16, and 256 colors. Note that the
default logos are 80x80, which is larger than your display, so no logo
is drawn.
Fbtest has only the full color logo, so it will look bad on a monochrome
display.

> Another question, do you know if is possible to change the default format=
?

AFAIK DRM does not support that.

> I believe that fbset won't work because the DRM fbdev emulation layer doe=
s
> not implement mode settings but I thought that changing the mode using th=
e

Correct.

> atomic KMS API would work.
>
> $ modetest -M ssd130x -P 31@33:128x64@XR24 -a
> $ echo $?
> 0
>
> but after that I still get:
>
> $ fbset -i
>
> mode "128x64"
>     geometry 128 64 128 64 1
>     timings 0 0 0 0 0 0 0
>     rgba 1/0,1/0,1/0,0/0
> endmode
>
> Frame buffer device information:
>     Name        : ssd130xdrmfb
>     Address     : (nil)
>     Size        : 4096
>     Type        : PACKED PIXELS
>     Visual      : MONO10
>     XPanStep    : 1
>     YPanStep    : 1
>     YWrapStep   : 0
>     LineLength  : 16
>     Accelerator : No
>
> Maybe I'm doing something wrong or misunderstading about how should work?

Do you need the "-d" option (drop master after mode set) of modetest?
Still, that would only impact DRM.  The fbdev emulation on top of DRM has
already been initialized before, and is never reinitialized.


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
