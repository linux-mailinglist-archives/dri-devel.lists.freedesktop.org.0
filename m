Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3AA882D205
	for <lists+dri-devel@lfdr.de>; Sun, 14 Jan 2024 21:00:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3CCC10E1BC;
	Sun, 14 Jan 2024 20:00:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 616F310E1BC
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Jan 2024 20:00:19 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a28cc85e6b5so958679766b.1
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Jan 2024 12:00:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705262418; x=1705867218; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CKAoT//lfLk6SjlnkLN+BWJ10tifSyl6cjyoqrMbL/c=;
 b=DdAAeaincZabXHHACoE8zoshz/kSQ0NWb+azlvl10knPBh7AtbVlMAJsp8GlkG1JX+
 d2zo4ROTZe3X72hVmLPJ1oo5pdPpsGqWNSHZ9idVCP4ptV93IG8HXilncXFm+FH4sB1W
 99iWa3avSv40Vs/UYhFO5UECF5qRvaZLLfCGvpLqbPLAiNXpA2SuZhsfJLTyOR3yp9Gk
 q2p2AFXwbqWTTKLScm1wqu7OGqhrr5nahAlqVjRD9rlDYwYxWJbqhxYaEiQp01Ayc/kQ
 YZc+cq10ifY1ijPAyiM/bo0SwiGx4xvPVB1YOyKjlC/FrgzL8Ozu4pc/zvg+67DrW7zZ
 SK7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705262418; x=1705867218;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CKAoT//lfLk6SjlnkLN+BWJ10tifSyl6cjyoqrMbL/c=;
 b=copz43rnF25U9t22hxT8nI0e7qVlz+do76HU6a6aMd2W11j2+ToOhiltFRo7PQE5bn
 J/9YGDEBWSdWP7a++nG17c5qp7N3q79mP4wV9BIAsz6nZBHjfXWjZmBZ2GCImHpNjMdv
 pEQqwPnhGHhOy7fs9ETNkYDxLEwrZWG7zDlKt/Kqh0swzHw34g/j2/77lJJGlGDQZryY
 Esqsc/mTp7dkGF0+ySktLoP3lJegWPTjfHWIuKHXsQmyXP/npBy3xZmKbKw6rFuo0spQ
 6JGdx+8FIJgJ6S9ld7h77efIATJelXMl+emCfV/Pr7QmjEKP5oqKVVB8tjjVNzEiQ7cU
 0c9w==
X-Gm-Message-State: AOJu0Yyrr3UvV27GSwDj4DXLGVCpUWIKXA+9/G2m0uGcX3dxv2MfwgFI
 ybnDhH4T/RzCPiGphT+72CItkap+/gEvhFa6tjM=
X-Google-Smtp-Source: AGHT+IGUFy51ZiCUav7y8oFEaLpmISNk60Bt7V0vlMlr6NzmGrJ6jtiWFv5aOUvA6iXLpt8BdYhtm5WZ8aG39PxFf8Q=
X-Received: by 2002:a17:906:ee8d:b0:a2a:ef4e:e352 with SMTP id
 wt13-20020a170906ee8d00b00a2aef4ee352mr1740238ejb.108.1705262417480; Sun, 14
 Jan 2024 12:00:17 -0800 (PST)
MIME-Version: 1.0
References: <CAPM=9twKBmO2Svky-zeP+KS8qWHFj9zrgeBqW9y__tUwcAYZhw@mail.gmail.com>
 <CAHk-=wgPJttFz8yrdpPTN-ypMmDXHOKw9yi1nZSEq+7+tGftZA@mail.gmail.com>
In-Reply-To: <CAHk-=wgPJttFz8yrdpPTN-ypMmDXHOKw9yi1nZSEq+7+tGftZA@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Mon, 15 Jan 2024 06:00:05 +1000
Message-ID: <CAPM=9tyiH_+jMZT9hYWaQN8=nByZvJd-0bkv6sRxAsWJm_eZGQ@mail.gmail.com>
Subject: Re: [git pull] drm for 6.8
To: Linus Torvalds <torvalds@linux-foundation.org>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 13 Jan 2024 at 05:33, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Wed, 10 Jan 2024 at 11:49, Dave Airlie <airlied@gmail.com> wrote:
> >
> > Let me know if there are any issues,
>
> Your testing is seriously lacking.
>
> This doesn't even build. The reason seems to be that commit
> b49e894c3fd8 ("drm/i915: Replace custom intel runtime_pm tracker with
> ref_tracker library") changed the 'intel_wakeref_t' type from a
> 'depot_stack_handle_t' to 'unsigned long', and as a result did this:
>
> -       drm_dbg(&i915->drm, "async_put_wakeref %u\n",
> +       drm_dbg(&i915->drm, "async_put_wakeref %lu\n",
>                 power_domains->async_put_wakeref);
>
> meanwhile, the Xe driver has this:
>
>   drivers/gpu/drm/xe/compat-i915-headers/intel_wakeref.h:
>         typedef bool intel_wakeref_t;
>
> which has never been valid, but now the build fails with

This was a bad cross of trees, the fix was in a pull request in my
inbox about an hour after I sent the PR, it just wasn't marked urgent
and it passes all my usual test builds.

It turns out there is a Kconfig bug without EXPERT that was masking
this in my builds, hope to get that fix in soon.


>
>   drivers/gpu/drm/i915/display/intel_display_power.c: In function
> =E2=80=98print_async_put_domains_state=E2=80=99:
>   drivers/gpu/drm/i915/display/intel_display_power.c:408:29: error:
> format =E2=80=98%lu=E2=80=99 expects argument of type =E2=80=98long unsig=
ned int=E2=80=99, but
> argument 5 has type =E2=80=98int=E2=80=99 [-Werror=3Dformat=3D]
>
> because the drm header files have this disgusting thing where a
> *header* file includes a *C* file:
>
>   In file included from ./include/drm/drm_mm.h:51,
>                  from drivers/gpu/drm/xe/xe_bo_types.h:11,
>                  from drivers/gpu/drm/xe/xe_bo.h:11,
>                  from
> ./drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h:11,
>                  from ./drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h=
:15,
>                  from drivers/gpu/drm/i915/display/intel_display_power.c:=
8:
>
> nasty.


>
> I made it build by fixing that broken Xe compat header file, but this
> is definitely *NOT* how things should have worked. How did this ever
> get to me without any kind of build testing?
>
> And why the %^!@$% does a header file include a C file? That's wrong
> regardless of this bug.

Huh? display_power.c includes i915_drv.h includes i915_gem_object.h
include xe_bo.h include xe_bo_types.h include drm_mm.h?

I'm not seeing the c in h, you reading that backtrace correctly?

It was built test in a few scenarios by different people and in CI,
but it does appear the Kconfig screwup was masking people from seeing
the actual bug. We had a report a few days ago and a fix was posted,
just not marked as urgent and since I never saw the build fails here I
didn't escalate it.

Dave.
