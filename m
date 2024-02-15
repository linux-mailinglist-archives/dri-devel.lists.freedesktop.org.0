Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F7E8569DD
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 17:46:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F90F10E9E3;
	Thu, 15 Feb 2024 16:46:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com
 [209.85.128.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E175610E9E3;
 Thu, 15 Feb 2024 16:46:03 +0000 (UTC)
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-60495209415so11256627b3.3; 
 Thu, 15 Feb 2024 08:46:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708015562; x=1708620362;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/aJPR1+qU/nSDxDAaQk+wL6tkp4mOhhqNfm962/6hfU=;
 b=U7rWYnK/jKaQjEmI8qhaqu/jDGxNr8Yr7lllOvSoZWvYmWLhQUlBorGvmZDKOLaPrO
 SRFq69s/nDRXjUNTPjsEYnhkp/S8IH5slMBton54N2XDW73iqSt1kyMZAl6pUlvwFSVd
 Ak1JcICMsy4TSJ/6hEvWPN9KnjXz+2P0ljisP65YuN5KskKD8/UXvL7X58JWCvcKa6hy
 kILU76CPJ2WAeCqqdPi0TlEplLZb0qT5PfPr/LnwCbUz140FeHxbdeLyJrkYqBTurZFa
 4exSeXV5JWSTHTP1N+Uoqagh+D2bNSm3MN9vNUPnefkxM1WCEirxsE3iWsQjBFIbZzxo
 zbdw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8BS7sRR+lgmwAMkbKkj92g7JtNmzyzSwPcw1Ne5t/1oWyR9BIp+2jJJUFXy+jIRf6kHwUOep7DynjNTwZS0NIOyeLFi31NSeWm02QhAH8yX64TMWhkA4IJO13o8u0hVfTPYtTfOul3EFFmf+M0n+ZtqGNwutOJbxATR8HsGowr4HEFRceqKFzJaxxCFg02SlB
X-Gm-Message-State: AOJu0YzjjNWIKg/CqKtAUelBzsuX2bTIlFMVQXFJ2ntHjhFBW8REVx7G
 rip/kjRIkF08tX8Ttuec/w97VJMNVju32LP8BSQNcDxY9GOPOz3pQ++4n7NHCFYCow==
X-Google-Smtp-Source: AGHT+IGgNJIk2JTQpMYo7w6YgeKr2jCrNs9ong9Dz7OrNGhYPcsBbm4bYfAcYSKkfLt+6SQajuskCg==
X-Received: by 2002:a81:6d43:0:b0:603:fdee:abd2 with SMTP id
 i64-20020a816d43000000b00603fdeeabd2mr2214343ywc.48.1708015562211; 
 Thu, 15 Feb 2024 08:46:02 -0800 (PST)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com.
 [209.85.128.178]) by smtp.gmail.com with ESMTPSA id
 o2-20020a0de502000000b0060410ee94a7sm305607ywe.143.2024.02.15.08.46.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Feb 2024 08:46:01 -0800 (PST)
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-607d9c4fa90so7111947b3.2; 
 Thu, 15 Feb 2024 08:46:01 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWNaSCRrhPLExnF4ay4o+fABjnM6c0xsdbipXUSgIh6JPYIDbsKJ9mqFdcZU7hG0BIeeW60JC5zmcfvx+T4NKB4aggE7U9Olgcb+SwFUo1qDBuUbjCyxfENDDJ05efPS8ELtKzWk+Xf9LTLv9OXm5pbePRZohwK7pXXJq32rsvSfJ6Qnb5n5Zc0Tuk0RT+OcGtm
X-Received: by 2002:a0d:d944:0:b0:5ff:5232:8aa1 with SMTP id
 b65-20020a0dd944000000b005ff52328aa1mr2492432ywe.21.1708015561677; Thu, 15
 Feb 2024 08:46:01 -0800 (PST)
MIME-Version: 1.0
References: <b4ffqzigtfh6cgzdpwuk6jlrv3dnk4hu6etiizgvibysqgtl2p@42n2gdfdd5eu>
 <723b78e0-5462-23f-a7d4-c8b9b614c0@linux-m68k.org>
 <ff7yoxjo64ykf5x3rvjiwvqyalddronfgzlz3kzs4f7r2nlxjd@lua6wp6wcp3p>
In-Reply-To: <ff7yoxjo64ykf5x3rvjiwvqyalddronfgzlz3kzs4f7r2nlxjd@lua6wp6wcp3p>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 15 Feb 2024 17:45:50 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUUGX+TSrW8KhWagocXv5UcBkxSW8xdyzUesHBrzFtZPw@mail.gmail.com>
Message-ID: <CAMuHMdUUGX+TSrW8KhWagocXv5UcBkxSW8xdyzUesHBrzFtZPw@mail.gmail.com>
Subject: Re: Re: [PULL] drm-misc-fixes
To: Maxime Ripard <mripard@redhat.com>
Cc: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Oded Gabbay <ogabbay@kernel.org>, Lucas De Marchi <lucas.demarchi@intel.com>, 
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 dim-tools@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>
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

On Thu, Feb 15, 2024 at 5:09=E2=80=AFPM Maxime Ripard <mripard@redhat.com> =
wrote:
 On Thu, Feb 15, 2024 at 01:41:24PM +0100, Geert Uytterhoeven wrote:
> > On Thu, 15 Feb 2024, Maxime Ripard wrote:
> > > Matthew Auld (1):
> > >      drm/tests/drm_buddy: add alloc_contiguous test
> >
> > Please drop this one.
> >
> > noreply@ellerman.id.au reported a build failure on m68k (and presumably
> > other 32-bit platforms) in next-20240215:
> >
> > ERROR: modpost: "__umoddi3" [drivers/gpu/drm/tests/drm_buddy_test.ko] u=
ndefined!
> > ERROR: modpost: "__moddi3" [drivers/gpu/drm/tests/drm_buddy_test.ko] un=
defined!
> >
> > Reverting commit a64056bb5a3215bd ("drm/tests/drm_buddy: add
> > alloc_contiguous test") fixes the issue.
>
> From a quick cross-compile test with arm(32), it seems to work there
> interestingly:
>
> ./tools/testing/kunit/kunit.py run \
>         --kunitconfig=3Ddrivers/gpu/drm//tests \
>         --cross_compile arm-linux-gnu- --arch arm

shmobile_defconfig + CONFIG_DRM_KUNIT_TEST=3Dy + CONFIG_KUNIT=3Dy:

arm-linux-gnueabihf-ld: drivers/gpu/drm/tests/drm_buddy_test.o: in
function `drm_test_buddy_alloc_contiguous':
drm_buddy_test.c:(.text+0xe0): undefined reference to `__aeabi_uldivmod'

> But I agree, with should wait for a fix or a revert before merging this.

Great, thanks!

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
