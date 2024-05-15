Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EBAB8C6EC0
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 00:45:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CE0A10E074;
	Wed, 15 May 2024 22:45:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="O9KY6+sc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B603910E074
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 22:45:23 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-a59a352bbd9so319702366b.1
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 15:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715813122; x=1716417922; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=a7lJcqe1kAwWaUrSqQrIwPbz3u27O8i6pHbRPj7VwJE=;
 b=O9KY6+sc4Od0A6OTZKGIcjeVT/41E6YgS+Y4PIMdkPIALCni76DKpEyzoyubekPJVg
 BtDUi1iC4alNu9gUQCVK67k8QtVD/km18aFVaOOSkr1pJCwXFz9+JMNz01++dOfZ8apx
 PWKr3avHxTn/j9/YFLYXwKeTnfnrbuxhTVxajo1kXbxIJaFLr+KOzX+B40Juu2ACB91g
 C6HWWnR38M/W1/sxPZNN0LYeTObT76APzK4Cd6I7YvD9sHRESbw/rhEvwbgaS2a5rTsH
 26z+1OIiOyhZuGy77ZP/hMp8r9N8fdT6zqEaBvoMK7b8DEcf3xmtbTAYqErqAm6+Lp+W
 veUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715813122; x=1716417922;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=a7lJcqe1kAwWaUrSqQrIwPbz3u27O8i6pHbRPj7VwJE=;
 b=vZHR3VvVOWm2GjcplVo4fs/hMfTMSXmaiNjvoXyoqp7kHUsJvdLvvJgErrAuRjfF0o
 D2EnT92WWHgxgB8sBixLmKwymIq4Krlx1iJW3ZR9I0FpnDlzYaU0sl53Gn9IDaTQ2gtC
 M8DzX0bkKgxv3PUyNDEJLzygjXTSqVabd/bMUwi+JPz8WYxYvAP9K6O1CmLdzXpA2g0s
 U6cgpH6AhH4njeGtzWFuJ1MoJmOrbnZti9LF1QLB/jNESNLknV4x7rXqMYZlKBiP9GgM
 Krad1KjfrNEjaHkehwlYos0VmcCT3AFcscsnNmpoQ8pHzjhboL8+1q9AChew5OMV4HC/
 pQTA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVupsvNMW/QfuUEaPFoBA81WnbNc0XKwUvodz1SmS9jEBcbHi/D/prn6ptVYU5ZdUXnqTXH+BeJrd7oGGHonV7LblaJ2lJwC6IiOsktzgQn
X-Gm-Message-State: AOJu0YyuFUvKAI0gTac6J5xhPlGXRWZLFmjhMVOFdCTWD+WhwrsyglrY
 VVG/gfsUt1C0fYSONikmUo456kIXfj8MNEHaZRZWUanFDKj9KrSfHotakI/HE2QBxzJb7CUpU94
 1opNNpp2Tr2eme6J9hbVi/kWJGA4=
X-Google-Smtp-Source: AGHT+IEnZtZ4SIfj9sglEMTaE3csfFcwbLewzJHmHxd5wagZk24j1xIRqljEdAzdOdGSa0hRMsUs6IixlaN9ZeX+DQw=
X-Received: by 2002:a17:906:e0c5:b0:a59:a979:2b03 with SMTP id
 a640c23a62f3a-a5a2d292b12mr1486105166b.23.1715813121682; Wed, 15 May 2024
 15:45:21 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tw-53PCvveRcdLUUQ+mjq2X2er5zp6n1KeE8Nu8x=VP2g@mail.gmail.com>
 <CAHk-=whxT8D_0j=bjtrvj-O=VEOjn6GW8GK4j2V+BiDUntZKAQ@mail.gmail.com>
In-Reply-To: <CAHk-=whxT8D_0j=bjtrvj-O=VEOjn6GW8GK4j2V+BiDUntZKAQ@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 16 May 2024 08:45:10 +1000
Message-ID: <CAPM=9tyOtH24Mw_2X+bgV9iChOQV3LtmRCoR5x6KXhSUD6FjUg@mail.gmail.com>
Subject: Re: [git pull] drm for 6.10-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Jani Nikula <jani.nikula@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
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

On Thu, 16 May 2024 at 06:43, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Tue, 14 May 2024 at 23:21, Dave Airlie <airlied@gmail.com> wrote:
> >
> > This is the main pull request for the drm subsystems for 6.10.
>
> .. and now that I look more at this pull request, I find other things wrong.
>
> Why is the DRM code asking if I want to enable -Werror? I have Werror
> enabled *already*.
>
> I hate stupid config questions. They only confuse users.
>
> If the global WERROR config is enabled, then the DRM config certainly
> shouldn't ask whether you want even more -Werror. It does nothing but
> annoy people.
>
> And no, we are not going to have subsystems that can *weaken* the
> existing CONFIG_WERROR. Happily, that doesn't seem to be what the DRM
> code wants to do, it just wants to add -Werror, but as mentioned, its'
> crazy to do that when we already have it globally enabled.
>
> Now, it might make more sense to ask if you want -Wextra. A lot of
> those warnings are bogus.

The help says:

          The drm subsystem enables more warnings than the kernel default, so
          this config option is disabled by default.

It's also

depends on DRM && EXPERT

so we aren't throwing it at random users.

should we rename it CONFIG_DRM_WERROR_MORE or something?

Dave.
