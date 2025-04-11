Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6728BA8549E
	for <lists+dri-devel@lfdr.de>; Fri, 11 Apr 2025 08:47:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B084D10EAFF;
	Fri, 11 Apr 2025 06:47:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com
 [209.85.221.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91EF610EAFF
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Apr 2025 06:47:48 +0000 (UTC)
Received: by mail-vk1-f169.google.com with SMTP id
 71dfb90a1353d-523ffbe0dbcso1776059e0c.0
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 23:47:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744354066; x=1744958866;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pGR7mWRmEzIrpJUi7UWHEZEg/9QQ43c6MiXTxlPQcq4=;
 b=DBaY/HJngOzzGd/Ic3e7dJIqKr1Hs2XXGxtBBgXJIIhCfdVhEz2bDEonWyT8JHSB6x
 9ZZFh0TSNluVp067GNoSI89ILKjyr7dqAVZv6ybt+tPrl0vEh20V+HELkRo3gh0jPVwo
 j3s+oF6TcJU1aehlhH9S5R3Mh49s2JbKFGScBljya/1JWyUMRmslgPelclUiPut87e1U
 PDiHXZZcAE1VhjCsSU6j6LXvcmlLRcy1SZ0t9rmKgLOq0nx+/WYPKMljugwCvs8WdoIs
 9Z+TbPcoT6EUEeckKNmfSVOvvQNd2YdEQ3WYNUrEw8oGtb/pzcCteEbwxhMJRoGBax+9
 NFzw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRMjWD6vw9OZYDQjVZ0m6as2nKgjBUOqzKnIlw5aC2IbuZWsHEndhmnv7Hmp3ipUp7OwUM31T6sjc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyVF+8wT1fJx8gvqTc+22dnhD+X9miPe7ojyYOQsQUy7RpFJvU7
 abCHYJvy/SwV93VeBRRkOcMZNzOPcMxmbNG58d9M/qhy6S+IyRQ/6FVWs6zAKkU=
X-Gm-Gg: ASbGncvS5YS0GeqevLo9HB8zXn4JnTiyRx3fe5SwVHF4eEomi9VZio4ls4ZKSG5xmdG
 8x8dYSx0RwHYlFm8h9kqsWTisN010eXag/71tM1hiU0hJd1b+ZcazmVX4kbXoO6ees6lYf5OkT2
 Gui5YKVkYioiezYwjW1JHCkuN+UcZXvvhnmcr9tosojcznfYLZCwWePvBVhgYxi1mMc4Af9cPCB
 TYA66NDb8FhzJ5MOxT8dI+pEGvWNFf4kLSyHCM/azIp70r/XqnuG6GhFU61Z0kF0jHg1nalyPHk
 QdUj1DtdA3c39iea1WX7rc49f75pm7aZPjwQdUrlTZTAFVXg5blt/a/wYGTeiwV2nrQHwB3vXlO
 otXly7y8=
X-Google-Smtp-Source: AGHT+IEA4iVQW+vSgpcxVJZXjCytSIAaVI6E/66rS9ptXXXBlYyln+MlvsuXKtiShp5Ucwc2rDMJ9g==
X-Received: by 2002:a05:6102:5708:b0:4bb:9b46:3f71 with SMTP id
 ada2fe7eead31-4c9e4ee6821mr763769137.8.1744354066415; 
 Thu, 10 Apr 2025 23:47:46 -0700 (PDT)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com.
 [209.85.221.173]) by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-4c9c98ee50dsm906885137.27.2025.04.10.23.47.45
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Apr 2025 23:47:45 -0700 (PDT)
Received: by mail-vk1-f173.google.com with SMTP id
 71dfb90a1353d-520847ad493so1511652e0c.1
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 23:47:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVNEo0s4AGwZbDjhvAqpV7+QO5wmV53lcm5Wp8yTplf7i7dm09NIzZiH+4VJOZElXfAyYZcH7tmx8g=@lists.freedesktop.org
X-Received: by 2002:a05:6102:26d3:b0:4c1:9b88:5c30 with SMTP id
 ada2fe7eead31-4c9e4fff1e7mr792684137.19.1744354065547; Thu, 10 Apr 2025
 23:47:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250408-st7571-v3-0-200693efec57@gmail.com>
 <20250408-st7571-v3-2-200693efec57@gmail.com>
 <87cydn9bkx.fsf@minerva.mail-host-address-is-not-set>
 <Z_Uin2dvmbantQU4@gmail.com>
 <87ecy1g8z8.fsf@minerva.mail-host-address-is-not-set>
 <Z_YWq4ry6Y-Jgvjq@gmail.com>
 <87bjt5fz51.fsf@minerva.mail-host-address-is-not-set>
 <Z_Z1UOan6Qu5d3VM@gmail.com>
 <87zfgpe7zg.fsf@minerva.mail-host-address-is-not-set>
In-Reply-To: <87zfgpe7zg.fsf@minerva.mail-host-address-is-not-set>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 11 Apr 2025 08:47:33 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVF+QOm5JZf+1ztu=aEW_3+aFkpThzsLWMv3D=Anny_Tg@mail.gmail.com>
X-Gm-Features: ATxdqUF8Hu7Y_9qSny4hng_3kDPGLSDJJ_ESs8MJgeF-Dkf4QBXCDJVP__ItJPU
Message-ID: <CAMuHMdVF+QOm5JZf+1ztu=aEW_3+aFkpThzsLWMv3D=Anny_Tg@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] drm/st7571-i2c: add support for Sitronix ST7571
 LCD controller
To: Javier Martinez Canillas <javierm@redhat.com>
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmrmann@suse.de>
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

On Wed, 9 Apr 2025 at 16:16, Javier Martinez Canillas
<javierm@redhat.com> wrote:
> Marcus Folkesson <marcus.folkesson@gmail.com> writes:
> > On Wed, Apr 09, 2025 at 11:43:54AM +0200, Javier Martinez Canillas wrot=
e:
>
> [...]
>
> >>
> >> Likely you will need to define more stuff to be specific for each entr=
y, maybe
> >> you will need different primary plane update handlers too. Similar to =
how I had
> >> to do it the ssd130x driver to support all the Solomon OLED controller=
 families:
> >>
> >> https://elixir.bootlin.com/linux/v6.11/source/drivers/gpu/drm/solomon/=
ssd130x.c#L1439
> >
> > Thanks, that sounds like a good idea.
> >
> > I've now experimenting with XRGB8888, and, well, it works. I guess.
> > The thresholds levels in the all conversion steps for  XRGB8888 -> 8 bi=
t grayscale -> monochrome
> > makes my penguin look a bit boring.
> >
> > But I guess that is expected.
>
> Yeah, the XRGB8888 version is a boring indeed comparing with the C1 one..=
.

To see the nice monochrome penguin logo, fb-helper needs to gain
support for R1 first...

> The drm_fb_xrgb8888_to_mono() helper is very naive and just uses a very
> naive midpoint thresholding to choose if the pixel should be 1 or 0. So
> there is a lot of information lost there unfortunately.

In theory, it could use Floyd=E2=80=93Steinberg dithering, like I did for m=
odetest.
However, given the display receives partial updates from damage clips,
it will look ugly, and may flicker.

> But that's what I did for ssd130x, to at least have a working driver. The=
n
> support for R1 (for ssd130x family) and R4 (for the ssd132x family) could
> be added as follow-ups. I never did it but Geert has some patches for thi=
s.

[1] needs an update, and still more rework to make them acceptable.

> > Please compare
> > https://www.marcusfolkesson.se/xrgb8888.png
> > and
> > https://www.marcusfolkesson.se/c1.png

Yep, the latter is using the correct logo.

[1]  "[PATCH v2 0/8] drm: fb-helper/ssd130x: Add support for DRM_FORMAT_R1"
    https://lore.kernel.org/all/cover.1692888745.git.geert@linux-m68k.org/

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
