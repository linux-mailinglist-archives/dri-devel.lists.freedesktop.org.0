Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98AE7858851
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 23:02:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A85A10ECC1;
	Fri, 16 Feb 2024 22:02:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com
 [209.85.128.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E90F810EC9E;
 Fri, 16 Feb 2024 22:02:48 +0000 (UTC)
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-6079d44b02bso11640577b3.3; 
 Fri, 16 Feb 2024 14:02:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708120966; x=1708725766;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a7HjMGwvhTO/ss1wr9XtzwDXQAKU7wR5BAJ9MiGPTGg=;
 b=jiAn+akGw1BOPUTi4+yMOuFt1MTzyRtWFve6QU//LjfVuAQAhuscd/aapW+luN+S2j
 KT7cbd5bC6nvUJK3UuKdGGKBnF/x4p7qCm/wbKdU7DgldtAtJC5yS8PHh82gIrSNQRF2
 8kBl8X6FTISYTH6jZR/i9k5B0OsRbwik6zGicUiCWcrB6vhTQoDoG/9XK3PCOoi+UgUW
 nrhRi+uySV3jhxoDIC268+CPXjT2RQe12/5g53E2Kjv17Z1YMGZc6BYurRe6Yy4nEjxq
 NLeHy1rLpJ1Zq+xaefp9NqBm3eQK0E6NTBc07oU17gxfhOJ/AiqdYpPPiVSqWvpie+jJ
 hprg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWV//QyB+ikuuGs52ZQ5Xbt0iqDa2JVbGZYzoJxPW8mdxt0gUuFhCaiRbhOs/U5HbRQ1i5AynugbI0C8Uv/m/MAbxV7Aay7h2S8pBcPFazknI0zhCL7iXknNpBVGCDhgO5FGSlJtpFTrsSjxUXlwF9u0ETnCtbpMOxuomxBkXfr9+HVlPXOm5dqEx+eNLyzwa6d
X-Gm-Message-State: AOJu0YzI9VNxzRq6rpm5oQrBaXgVE5E6uQS5VBM8Wx4c2D6+IEc9dK52
 PGNpOlxgVmDa2noxmBQDHOTYfskqNeQnsRK8VGBtazbESOEIdOuDQfyjiu0I6pU=
X-Google-Smtp-Source: AGHT+IFOy7rnsydZeQLe00Syhm5d2Ck3BxjJkRQ9CpAz+0YlW7TZsAhVJqT3pY4e9PRAFKOZDhU2lg==
X-Received: by 2002:a05:690c:d1a:b0:607:6634:cfcc with SMTP id
 cn26-20020a05690c0d1a00b006076634cfccmr6808864ywb.51.1708120965592; 
 Fri, 16 Feb 2024 14:02:45 -0800 (PST)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com.
 [209.85.219.169]) by smtp.gmail.com with ESMTPSA id
 v38-20020a81b726000000b0060485f86449sm521389ywh.69.2024.02.16.14.02.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Feb 2024 14:02:45 -0800 (PST)
Received: by mail-yb1-f169.google.com with SMTP id
 3f1490d57ef6-d9b9adaf291so1123700276.1; 
 Fri, 16 Feb 2024 14:02:44 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCV0xG1BBq+LfrVbqsUSTwbjvGwrKMc5xI0aFSn0uVPrJCC8x7hNdulr+IzgZ/ZfazOSd9061rNQcRNJR5FLAZO9kIab2Q2yCJ5IqpjsPZJGR2a5iqRCole7MDNEWBC3LCQ1m83WkDc2B/OcU5kbhGgHF0cnbjv/Hz1wslrLQotmJyeuYWOLpax/kSNQAsEhAWJo
X-Received: by 2002:a25:ad95:0:b0:dcb:b572:4aaa with SMTP id
 z21-20020a25ad95000000b00dcbb5724aaamr6440629ybi.38.1708120964518; Fri, 16
 Feb 2024 14:02:44 -0800 (PST)
MIME-Version: 1.0
References: <b4ffqzigtfh6cgzdpwuk6jlrv3dnk4hu6etiizgvibysqgtl2p@42n2gdfdd5eu>
 <723b78e0-5462-23f-a7d4-c8b9b614c0@linux-m68k.org>
 <ff7yoxjo64ykf5x3rvjiwvqyalddronfgzlz3kzs4f7r2nlxjd@lua6wp6wcp3p>
 <CAMuHMdUUGX+TSrW8KhWagocXv5UcBkxSW8xdyzUesHBrzFtZPw@mail.gmail.com>
In-Reply-To: <CAMuHMdUUGX+TSrW8KhWagocXv5UcBkxSW8xdyzUesHBrzFtZPw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 16 Feb 2024 23:02:32 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUkadgYyerfOM=FRrUbYXhMAx4Q7xo-MOLvjwB635PJ2Q@mail.gmail.com>
Message-ID: <CAMuHMdUkadgYyerfOM=FRrUbYXhMAx4Q7xo-MOLvjwB635PJ2Q@mail.gmail.com>
Subject: Re: Re: [PULL] drm-misc-fixes
To: Maxime Ripard <mripard@redhat.com>, Dave Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Oded Gabbay <ogabbay@kernel.org>, Lucas De Marchi <lucas.demarchi@intel.com>, 
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 dim-tools@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>, 
 Arnd Bergmann <arnd@arndb.de>
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

Hi Maxime, Dave,

On Thu, Feb 15, 2024 at 5:45=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
> On Thu, Feb 15, 2024 at 5:09=E2=80=AFPM Maxime Ripard <mripard@redhat.com=
> wrote:
>  On Thu, Feb 15, 2024 at 01:41:24PM +0100, Geert Uytterhoeven wrote:
> > > On Thu, 15 Feb 2024, Maxime Ripard wrote:
> > > > Matthew Auld (1):
> > > >      drm/tests/drm_buddy: add alloc_contiguous test
> > >
> > > Please drop this one.
> > >
> > > noreply@ellerman.id.au reported a build failure on m68k (and presumab=
ly
> > > other 32-bit platforms) in next-20240215:
> > >
> > > ERROR: modpost: "__umoddi3" [drivers/gpu/drm/tests/drm_buddy_test.ko]=
 undefined!
> > > ERROR: modpost: "__moddi3" [drivers/gpu/drm/tests/drm_buddy_test.ko] =
undefined!
> > >
> > > Reverting commit a64056bb5a3215bd ("drm/tests/drm_buddy: add
> > > alloc_contiguous test") fixes the issue.
> >
> > From a quick cross-compile test with arm(32), it seems to work there
> > interestingly:
> >
> > ./tools/testing/kunit/kunit.py run \
> >         --kunitconfig=3Ddrivers/gpu/drm//tests \
> >         --cross_compile arm-linux-gnu- --arch arm
>
> shmobile_defconfig + CONFIG_DRM_KUNIT_TEST=3Dy + CONFIG_KUNIT=3Dy:
>
> arm-linux-gnueabihf-ld: drivers/gpu/drm/tests/drm_buddy_test.o: in
> function `drm_test_buddy_alloc_contiguous':
> drm_buddy_test.c:(.text+0xe0): undefined reference to `__aeabi_uldivmod'
>
> > But I agree, with should wait for a fix or a revert before merging this=
.
>
> Great, thanks!

Unfortunately the breakage still made it upstream.

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
