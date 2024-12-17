Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D9B9F4E80
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 15:54:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B06210E9B2;
	Tue, 17 Dec 2024 14:54:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com
 [209.85.221.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CA3C10E9B2
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 14:54:48 +0000 (UTC)
Received: by mail-vk1-f174.google.com with SMTP id
 71dfb90a1353d-5188e0c2b52so1504285e0c.1
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 06:54:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734447285; x=1735052085;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JdmJj7Bit7IiUWRERL1dUMIdyUMl4mYcreSSKLZ0A1g=;
 b=Y54QzacChjfS4D0vMhivhrdf/IqaZSnlhvk9/ol9QFefcXA0Meb9hJJTmGnT0AIgP3
 +ssSldV9kAJSRyn/VE1E/ULjr1gsUJEeFIOq00ZyuPplH0VMm2h88v728oL3+gOPjx56
 c3io8Ndw4shkbQtWKGE/WjgL+Q6o2qazRug9LorbKEQBJNnSQrAFdN9JTRV7woTN1mWv
 ZOljdn/oAT10pqOi4DfwgnFEz6n9lLTTBug1kxhWVRKGa3z+4vhvqZQDtoTmQuZ3GE7k
 5RtP0Eudb+SYxRMpqIebjrZg4NxKLFGg/55khd0uJc2fVnPOGptndTwsdFg2rCDIL+s5
 vxcQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXXloryKdwWFHY0ZdUwrQg5Wxwjuxv5mq1Z0tsfLnUK0OepqHOTNfyMZus6SVfJZ0lZpXE9DWIHxnM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzxWGSkxuBf1zTFrtNplU90g/SfmMqO0bCm72nQq1eFVbvHqGcd
 agciUDxl2giYo49kJtEO9cjH+3ECM1ZbcyIgPUgp2eh/AmkejEwEJhKTMxIq
X-Gm-Gg: ASbGncu1Ht03VbnDDYdTtqPkM5jOjUHJOUfoyCHnyGriTw5DMebCvKqMBmwJrm7Ual/
 DEL8d8YCKU7t5swGfDinq4VSDzOFYzAslpQj/+M2fFe0BEbOI0VbqajHtd3vDa9tgqwiJ6o5CBc
 MoGJ0iR5PeuuJn+z1YQuGSIiBfIzJ5LnWtDsmTpfU4ijswczvZsJuhkAe3bpY8BDfMl/ThE/e5a
 EBnuOA9NC8SN6gbhyqoGlKRL7zpgXQGN10FDAOg4AkiJMdo+vD5WusP3c3XfPDLHyj/j9O/igky
 dDqwikSN4+M5RH525YY=
X-Google-Smtp-Source: AGHT+IGD6umcQbHC/yk/fJ1rijOjYdqChGnNWW0JGLYkf8eCcI09nAMO/DIMjIwTsL70yXRgOEIlGA==
X-Received: by 2002:a05:6122:920:b0:518:7c13:d191 with SMTP id
 71dfb90a1353d-518ca2af698mr15537870e0c.8.1734447284702; 
 Tue, 17 Dec 2024 06:54:44 -0800 (PST)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com.
 [209.85.217.49]) by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-519e35e25dasm940601e0c.13.2024.12.17.06.54.43
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Dec 2024 06:54:43 -0800 (PST)
Received: by mail-vs1-f49.google.com with SMTP id
 ada2fe7eead31-4aff31b77e8so1715453137.1
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 06:54:43 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVPMIBGt+p1s7A6/cm4WkWcAPfn1+48KP8gP8xJIxMT1PG+DzuFpMG51d2POz4RWKMf/CTEqj8iqFY=@lists.freedesktop.org
X-Received: by 2002:a05:6102:5122:b0:4b1:ed1:569d with SMTP id
 ada2fe7eead31-4b25de51c53mr14854492137.27.1734447283528; Tue, 17 Dec 2024
 06:54:43 -0800 (PST)
MIME-Version: 1.0
References: <20241204160014.1171469-1-jfalempe@redhat.com>
 <CAMuHMdU925NiJDy4fOcQhA=jp8=79rZ3h5-TYxCjzkGwqQdKOg@mail.gmail.com>
 <301714d8-0723-4881-83e8-24523c121bfe@redhat.com>
In-Reply-To: <301714d8-0723-4881-83e8-24523c121bfe@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 17 Dec 2024 15:54:31 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXxwv2WgeAoO5w41cRpXgVBr0PhrgCP3A0X_nsFVM+6Gg@mail.gmail.com>
Message-ID: <CAMuHMdXxwv2WgeAoO5w41cRpXgVBr0PhrgCP3A0X_nsFVM+6Gg@mail.gmail.com>
Subject: Re: [PATCH v9 0/6] drm/log: Introduce a new boot logger to draw the
 kmsg on the screen
To: Jocelyn Falempe <jfalempe@redhat.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, John Ogness <john.ogness@linutronix.de>,
 Javier Martinez Canillas <javierm@redhat.com>, 
 "Guilherme G . Piccoli" <gpiccoli@igalia.com>, bluescreen_avenger@verizon.net, 
 Caleb Connolly <caleb.connolly@linaro.org>, Petr Mladek <pmladek@suse.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, 
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

Hi Jocelyn.

On Tue, Dec 17, 2024 at 3:46=E2=80=AFPM Jocelyn Falempe <jfalempe@redhat.co=
m> wrote:
> On 17/12/2024 15:19, Geert Uytterhoeven wrote:
> > On Wed, Dec 4, 2024 at 6:41=E2=80=AFPM Jocelyn Falempe <jfalempe@redhat=
.com> wrote:
> >> drm_log is a simple logger that uses the drm_client API to print the k=
msg boot log on the screen.
> >> This is not a full replacement to fbcon, as it will only print the kms=
g.
> >> It will never handle user input, or a terminal because this is better =
done in userspace.
> >>
> >> If you're curious on how it looks like, I've put a small demo here:
> >> https://people.redhat.com/jfalempe/drm_log/drm_log_draft_boot_v2.mp4
> >>
> >> Design decisions:
> >>    * It uses the drm_client API, so it should work on all drm drivers =
from the start.
> >>    * It doesn't scroll the message, that way it doesn't need to redraw=
 the whole screen for each new message.
> >>      It also means it doesn't have to keep drawn messages in memory, t=
o redraw them when scrolling.
> >>    * It uses the new non-blocking console API, so it should work well =
with PREEMPT_RT
> >
> > I gave this a try on Koelsch (R-Car M2-W), using rcar-du.
> > Unfortunately I don't see any kernel messages, and my monitor complains
> > about no signal. Does this require special support from the driver?
>
> It doesn't require a special support from the driver. But as it is the
> first drm client other than fbdev emulation, I'm not surprised it's
> broken on some driver.
> I know it works on virtio-gpu, nouveau, amdgpu, and even on a OnePlus 6
> (Qualcomm SDM845/freedreno), without requiring driver changes.
>
> Do you have a serial console on this device, to check if there is
> something in kmsg?

Nothing interesting to see. Compared to the fbdev client:

     rcar-du feb00000.display: [drm] Registered 2 planes with drm panic
     [drm] Initialized rcar-du 1.0.0 for feb00000.display on minor 0
     rcar-du feb00000.display: [drm] Device feb00000.display probed
    -Console: switching to colour frame buffer device 240x67
    -rcar-du feb00000.display: [drm] fb0: rcar-dudrmfb frame buffer device

I did verify (by adding my own debug prints) that the code does
get to the success case in drm_log_register().
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
