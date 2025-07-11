Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04132B02463
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 21:18:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1372210E3C3;
	Fri, 11 Jul 2025 19:18:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="gsyCSkVF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95E1210E3C3
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 19:18:20 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-60c4521ae2cso4460014a12.0
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 12:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1752261499; x=1752866299;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=OGIcMUli3ztNAnPUcFhR5bM9fuY+7pKG/dEA+I+ib0I=;
 b=gsyCSkVFrm8jxmpUuUTpt1Zmf2KbDzohHNqkNuovb9wfw9lbB475P/Tc16o5JWfwxn
 1L2NU8q/QoDAu9H0DF9WmftNYAOUNWp8uz+hxl5p08n4GvFrGKd/m3hVekF9kboWzzKh
 8NuLDCG2e3i4e4TxdL65G6axtld55+coFLoNM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752261499; x=1752866299;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OGIcMUli3ztNAnPUcFhR5bM9fuY+7pKG/dEA+I+ib0I=;
 b=XtG9Fn5KS95uYsG7wy3wHi35zRNhBf3rsuESE35zDM84mw2EU7KRg3p8TQgmZIP8GF
 4eL0Y01qI3cCSG2px87ibHy4iyoWh0lsk56CvjNK9OB4Y8OaUAtGC88Tx3/rCnPevJRf
 gEbLgwVzrhaPFm97CuUIqoVP8GQfv2XmsokBVwaEu0zqhplgrD1VmZbeuXr++7J0mTf8
 hcFjSMAOvmKGd9JfrF80PQ233ANtEuFXUqs6Ewx8RhDgKpN8M9wxMEsbmwRDnP9IQVUa
 ftEAWLLHR+/np4P9NV2TpQHvj6oqzmS4tN/jF4Ekft02EZQY7z156+NtofodAUxB/bq5
 jxOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXC0+JJeDyES8AFgZVwSkPzmnj+6GAsCqy/PSm6nDFTSq37Ct2Yh+L51z4igJf2geXu+R5nRHKd5Z4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwDYIGIc3mCK2mb+J1c7W5aWUjC7M6GH5691t7h2Zy5Z5gOKk4X
 dpoE6fZ4K0noNWToUpxyXeQE/7IetPkMzUARy0Gzl+F7Wsp+DFpT0kwj29iFVcvJXbEqsmR16tZ
 PCDFG0jeI6w==
X-Gm-Gg: ASbGncsElytAO9KIJQlpkrrbwcNASDxE0umnqrHIqqyQ/bBI+I2n8UKtMkdO7+nXISn
 sY7qDwOIOiX8VCGP7fob5X8tStpnguNb5APr9vcAyOLaE3ntdrQbs497xIxUq9MSlCMrM7XY77P
 SA4grKnQTs7h6+6ywZXag8yZa2Mxxme87P8e3NxLMMfvTAPuyh1Wl2LS5Vw1p6M7ZKMorAlK4IC
 D8IM337oFokinxd0ckiUQCt4gJt0+FZqePV2Aqf69bZ27MYLw1+POjZcMn8XfCK9RkaJTpZ/gGL
 zW3AGE88vzGSCCHDKJTfH2r+BMc6r8Ak6UkT0F937eN3vs3FTBh7vvYBVrufntEbxGeHXu7dLHy
 bVbRj8ImV+N8Fp/ioEgFrCmWRN8PpGD2pXSYQz2me2/GK2/mcjotX+rpiCSBEFT4AH6EpvEje
X-Google-Smtp-Source: AGHT+IFWY4rffAXdYwFfuQHWKpuj2pn234r4XkCl9SjkaICc/iZCJeR6DIGEJdbQ4wVDt5XNulktBg==
X-Received: by 2002:a50:8e53:0:b0:607:6324:8da2 with SMTP id
 4fb4d7f45d1cf-611e84c0659mr3241212a12.24.1752261498652; 
 Fri, 11 Jul 2025 12:18:18 -0700 (PDT)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com.
 [209.85.208.49]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-611c95256d0sm2570492a12.24.2025.07.11.12.18.18
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Jul 2025 12:18:18 -0700 (PDT)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-611f74c1837so1513535a12.3
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 12:18:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXH0JUCjQOVKu4/Ndv4crQVc15eXsey9lvMp8yQcw65uVkGtZ/j+5jboxrr1TCnIci0dGLz8m8Di/Q=@lists.freedesktop.org
X-Received: by 2002:a05:6402:11c7:b0:60b:fb2c:b789 with SMTP id
 4fb4d7f45d1cf-611e84907ddmr3562736a12.21.1752261497669; Fri, 11 Jul 2025
 12:18:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250711151002.3228710-1-kuba@kernel.org>
 <CAHk-=wj1Y3LfREoHvT4baucVJ5jvy0cMydcPVQNXhprdhuE2AA@mail.gmail.com>
 <20250711114642.2664f28a@kernel.org>
 <CAHk-=wjb_8B85uKhr1xuQSei_85u=UzejphRGk2QFiByP+8Brw@mail.gmail.com>
In-Reply-To: <CAHk-=wjb_8B85uKhr1xuQSei_85u=UzejphRGk2QFiByP+8Brw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 11 Jul 2025 12:18:01 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiwVkGyDngsNR1Hv5ZUqvmc-x0NUD9aRTOcK3=8fTUO=Q@mail.gmail.com>
X-Gm-Features: Ac12FXyQ_YSMvJEi4nfPYDndHOPluuiAs0LoNS1cD3a_Bb9k_MZNqvkWl-g86Aw
Message-ID: <CAHk-=wiwVkGyDngsNR1Hv5ZUqvmc-x0NUD9aRTOcK3=8fTUO=Q@mail.gmail.com>
Subject: Re: [GIT PULL] Networking for v6.16-rc6 (follow up)
To: Jakub Kicinski <kuba@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>, 
 Dave Airlie <airlied@gmail.com>, davem@davemloft.net,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, pabeni@redhat.com, 
 dri-devel <dri-devel@lists.freedesktop.org>
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

On Fri, 11 Jul 2025 at 11:54, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Will do more testing.

Bah. What I thought was a "reliable hang" isn't actually that at all.
It ends up still being very random indeed.

That said, I do think it's related to this netlink issue, because the
symptoms end up being random delays.

I've seen it at boot before even logging in (I saw that twice in a row
after the latest networking pull, which is why I thought it was
reliable).

But the much more common situation is that some random gnome app ends
up hanging and then timing out.

Sometimes it's gnome-shell itself, so when I log in nothing happens,
and then after a 30s timeout gnome-shell times out and I get back the
login window.

That was what I *thought* was the common failure case, but it turns
out that I've now several times seen just random other applications
having that issue. This boot, for example, things "worked", except
starting gnome-terminal took a long time, and then I get a random
crash report for gsd-screensaver-proxy.

The backtrace for that was

  g_bus_get_sync ->
    initable_init ->
      g_data_input_stream_read_line ->
        g_buffered_input_stream_fill ->
          g_buffered_input_stream_real_fill ->
            g_input_stream_read ->
              g_socket_receive_with_timeout ->
                g_socket_condition_timed_wait ->
                  poll ->
                    __syscall_cancel

and I suspect these are all symptoms of the same thing.

My *guess* is that all of these things use a netlink socket, and
presumably it's the *other* end of the socket has filled up its
receive queue and is dropping packets as a result, and never
answering, so then - entirely randomly - depending on how overworked
things got, and which requests got dropped, some poor gnome process
never gets a reply and times out and the thing fails.

And sometimes the things that fail are not very critical (like some
gsd-screensaver-proxy) and I can log in happily. And sometimes they
are rather more critical and nothing works.

Anyway, because it's so damn random, it's neither bisectable nor easy
to know when something is "fixed".

I spent several hours yesterday chasing all the wrong things (because
I thought it was in drm), and often thought "Oh, that fixed it". Only
to then realize that nope, the problem still happens.

I will test the reverts. Several times.

             Linus
