Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E014AA56382
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 10:19:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A3D710EA30;
	Fri,  7 Mar 2025 09:19:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VfwEj+TS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AC3610EA30
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Mar 2025 09:19:53 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-22355618fd9so29507275ad.3
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Mar 2025 01:19:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741339193; x=1741943993; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=WtFm3fAnjeubhbuWCpwfNvD+r/QsDLeKl5ss4JFiMbs=;
 b=VfwEj+TSVymOvrjID58BdjXAmDOhBUifldFO0yx+h9hmrRbZtYcAEe1mATx/CMWned
 ceOee9WTq2h79aHF9BqLMmErGbs83/lpIYp+8a+V0pacCmFuBC/OaNL8Seatszsiivsg
 AsTWt3bFQJl/fMkExo1Alnl89wcf0mlKlIx6MhbVO/fenVU5GEkRsdJItO32hS70CrPl
 z9DwPugHWElsnmia2VMZs8DHpu8QKnJbaokkZk8l5ZxoQjSu/xIeAz0GEzNi/iZCc8Ck
 DDGvgt71YnEusA74RBmfsVINtD8g7RJyYWf6wSxz/1R+8xZsDzhzpitFCi5/ZAmh9MRH
 R5aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741339193; x=1741943993;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WtFm3fAnjeubhbuWCpwfNvD+r/QsDLeKl5ss4JFiMbs=;
 b=jICowLUXbc4WsscWQ0XRXRbOo0QJbXn8jvipLknW+m0Hy4f4RbiXNWTmqpD6ypf+0o
 XwFzHzC2ZnoKP9x9gPkQDFKPSvE1k8fxIkrJ1d9+obH2DYMc7sEQoe20rx3AZUs6xeOi
 kZ3DIhhBsgJssTWUIWed+WN/JEoYKDow1eatwgZLpswh+a1rFTGZI4DZvA9OHtALUFeA
 5h6zOe4BCjtdYjUXWEGUrJe9Mk2/EIHJ98bqG573vghezSIlWKul/uiN6ONo23oI8NKB
 Ywtlo90+9ch34FZmAGjtzy4UsxPEW49G5ZAXZIHVZTzdJ1AZnoynX5L6JNqDgkYs/mZV
 A4tg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVLrgdhNvUiDMZQsBZ2fR3xM53ThIMwFg1AZNT6WkRDjs0X3inVjigSnVBA+ikD3kQNe4PeBFje1iI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyYU1QShUMStaLybt/FyMxEzxOxm+dvx2ua0xFwtAmw/EmEesx/
 hxms8qJMo6b0wMh8PEzHAiTYZnxrp0bmX8ZbFhewOjTwTI1fsIGf
X-Gm-Gg: ASbGncuUCXg/rTrKC6veQpD80umyNug+rTpBTWex7OSuoMMbkYCEkp65bwTwidLdgcT
 0HtGWR6Z/CvYLDUT4WjqrvNHoQ2UkJ0CaZ694eqibQ1J9GC0jAz358+UNpEmcb0mOJN9DszXjvg
 egghtxSMLU3pmJRV6UT6GNnkiOLAucI7Zm2zVatFetynWajgBUzD1g9pLCgALaUQkQc7mLnlkaw
 BJD+pLEY42adfrX3wQMqKrle6aBM9Xx6IbbPhpd+y/hFLWR6MWnDFVWpg4tXxXhnUOuaAMra435
 HyTcl6Bbxf/1J+KNNw/D5HF6sMCew7rxJWenR0+1ioJz3nTKuv/GSK1rq/AVJTPRi4t/0zy9
X-Google-Smtp-Source: AGHT+IE3b9zkIaLC0mzOF8WD1s1QYwmhsrk+TIJsgXANJenF5GXtHRIhAmThoWOF8+4okLgNhjrCPg==
X-Received: by 2002:a05:6a20:9381:b0:1ee:cdda:b8f8 with SMTP id
 adf61e73a8af0-1f544acb430mr5633011637.7.1741339192556; 
 Fri, 07 Mar 2025 01:19:52 -0800 (PST)
Received: from visitorckw-System-Product-Name ([140.113.216.168])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73698243f21sm2854684b3a.52.2025.03.07.01.19.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Mar 2025 01:19:51 -0800 (PST)
Date: Fri, 7 Mar 2025 17:19:42 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: "H. Peter Anvin" <hpa@zytor.com>, longman@redhat.com, llong@redhat.com
Cc: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, jk@ozlabs.org,
 joel@jms.id.au, eajames@linux.ibm.com, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dmitry.torokhov@gmail.com, mchehab@kernel.org,
 awalls@md.metrocast.net, hverkuil@xs4all.nl,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 louis.peens@corigine.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 parthiban.veerasooran@microchip.com, arend.vanspriel@broadcom.com,
 johannes@sipsolutions.net, gregkh@linuxfoundation.org,
 jirislaby@kernel.org, yury.norov@gmail.com,
 akpm@linux-foundation.org, alistair@popple.id.au,
 linux@rasmusvillemoes.dk, Laurent.pinchart@ideasonboard.com,
 jonas@kwiboo.se, jernej.skrabec@gmail.com, kuba@kernel.org,
 linux-kernel@vger.kernel.org, linux-fsi@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
 oss-drivers@corigine.com, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
 brcm80211-dev-list.pdl@broadcom.com, linux-serial@vger.kernel.org,
 bpf@vger.kernel.org, jserv@ccns.ncku.edu.tw,
 Yu-Chun Lin <eleanor15x@gmail.com>
Subject: Re: [PATCH v3 00/16] Introduce and use generic parity16/32/64 helper
Message-ID: <Z8q6LlkQDG95Amgw@visitorckw-System-Product-Name>
References: <20250306162541.2633025-1-visitorckw@gmail.com>
 <F134DC06-54DE-4B8E-8AE0-3740275835C1@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <F134DC06-54DE-4B8E-8AE0-3740275835C1@zytor.com>
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

+Cc Waiman Long for bool cast to int discussion

Hi Peter,

On Thu, Mar 06, 2025 at 07:14:13PM -0800, H. Peter Anvin wrote:
> On March 6, 2025 8:25:25 AM PST, Kuan-Wei Chiu <visitorckw@gmail.com> wrote:
> >Several parts of the kernel contain redundant implementations of parity
> >calculations for 16/32/64-bit values. Introduces generic
> >parity16/32/64() helpers in bitops.h, providing a standardized
> >and optimized implementation. 
> >
> >Subsequent patches refactor various kernel components to replace
> >open-coded parity calculations with the new helpers, reducing code
> >duplication and improving maintainability.
> >
> >Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
> >Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
> >Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> >---
> >In v3, I use parityXX() instead of the parity() macro since the
> >parity() macro may generate suboptimal code and requires special hacks
> >to make GCC happy. If anyone still prefers a single parity() macro,
> >please let me know.
> >
> >Additionally, I changed parityXX() << y users to !!parityXX() << y
> >because, unlike C++, C does not guarantee that true casts to int as 1.
> >
> >Changes in v3:
> >- Avoid using __builtin_parity.
> >- Change return type to bool.
> >- Drop parity() macro.
> >- Change parityXX() << y to !!parityXX() << y.
> >
> >
> >Changes in v2:
> >- Provide fallback functions for __builtin_parity() when the compiler
> >  decides not to inline it
> >- Use __builtin_parity() when no architecture-specific implementation
> >  is available
> >- Optimize for constant folding when val is a compile-time constant
> >- Add a generic parity() macro
> >- Drop the x86 bootflag conversion patch since it has been merged into
> >  the tip tree
> >
> >v1: https://lore.kernel.org/lkml/20250223164217.2139331-1-visitorckw@gmail.com/
> >v2: https://lore.kernel.org/lkml/20250301142409.2513835-1-visitorckw@gmail.com/
> >
> >Kuan-Wei Chiu (16):
> >  bitops: Change parity8() return type to bool
> >  bitops: Add parity16(), parity32(), and parity64() helpers
> >  media: media/test_drivers: Replace open-coded parity calculation with
> >    parity8()
> >  media: pci: cx18-av-vbi: Replace open-coded parity calculation with
> >    parity8()
> >  media: saa7115: Replace open-coded parity calculation with parity8()
> >  serial: max3100: Replace open-coded parity calculation with parity8()
> >  lib/bch: Replace open-coded parity calculation with parity32()
> >  Input: joystick - Replace open-coded parity calculation with
> >    parity32()
> >  net: ethernet: oa_tc6: Replace open-coded parity calculation with
> >    parity32()
> >  wifi: brcm80211: Replace open-coded parity calculation with parity32()
> >  drm/bridge: dw-hdmi: Replace open-coded parity calculation with
> >    parity32()
> >  mtd: ssfdc: Replace open-coded parity calculation with parity32()
> >  fsi: i2cr: Replace open-coded parity calculation with parity32()
> >  fsi: i2cr: Replace open-coded parity calculation with parity64()
> >  Input: joystick - Replace open-coded parity calculation with
> >    parity64()
> >  nfp: bpf: Replace open-coded parity calculation with parity64()
> >
> > drivers/fsi/fsi-master-i2cr.c                 | 18 ++-----
> > .../drm/bridge/synopsys/dw-hdmi-ahb-audio.c   |  8 +--
> > drivers/input/joystick/grip_mp.c              | 17 +-----
> > drivers/input/joystick/sidewinder.c           | 24 ++-------
> > drivers/media/i2c/saa7115.c                   | 12 +----
> > drivers/media/pci/cx18/cx18-av-vbi.c          | 12 +----
> > .../media/test-drivers/vivid/vivid-vbi-gen.c  |  8 +--
> > drivers/mtd/ssfdc.c                           | 20 ++-----
> > drivers/net/ethernet/netronome/nfp/nfp_asm.c  |  7 +--
> > drivers/net/ethernet/oa_tc6.c                 | 19 ++-----
> > .../broadcom/brcm80211/brcmsmac/dma.c         | 16 +-----
> > drivers/tty/serial/max3100.c                  |  3 +-
> > include/linux/bitops.h                        | 52 +++++++++++++++++--
> > lib/bch.c                                     | 14 +----
> > 14 files changed, 77 insertions(+), 153 deletions(-)
> >
> 
> !!x is used with a value that is not necessary booleanized already, and is exactly equivalent to (x ? true : false). It is totally redundant on a value known to be bool.
> 
I used to believe that casting a boolean variable to int would always
result in 0 or 1 until a few months ago when Waiman Long explicitly
pointed out during a review that C does not guarantee this.

So I revisited the C11 standard, which states that casting to _Bool
always results in 0 or 1 [1]. Another section specifies that bool,
true, and false are macros defined in <stdbool.h>, with true expanding
to 1 and false to 0. However, these macros can be #undef and redefined
to other values [2]. I'm not sure if this is sufficient to conclude
that casting bool to int will always result in 0 or 1, but if the
consensus is that it does, I'll remove the !! hack in the next version.

> If (int)true wasn't inherently 1, then !! wouldn't work either. 
> 
The C standard guarantees that the ! operator returns an int, either 0
or 1. So regardless of how true casts, using !! should work. Right?

> There was a time when some code would use as a temporary hack: 
> 
> typedef enum { false, true } bool;
> 
> ... when compiling on pre-C99 compilers; in that case a (bool) case wouldn't necessarily work as expected, whereas !! would. Furthermore, unlike (bool), !! works in the preprocessor.

I'm not entirely sure how !! works in the preprocessor. I always
thought it was handled by the compiler. Could you elaborate on this?

Regards,
Kuan-Wei

[1]: 6.3.1.2 Boolean type
1 When any scalar value is converted to _Bool, the result is 0 if the value compares equal
to 0; otherwise, the result is 1.59)

[2]: 7.18 Boolean type and values <stdbool.h>
1 The header <stdbool.h> defines four macros.
2 The macro
bool
expands to _Bool.
3 The remaining three macros are suitable for use in #if preprocessing directives. They
are
true
which expands to the integer constant 1,
false
which expands to the integer constant 0, and
_ _bool_true_false_are_defined
which expands to the integer constant 1.
4 Notwithstanding the provisions of 7.1.3, a program may undefine and perhaps then
redefine the macros bool, true, and false.
259)
