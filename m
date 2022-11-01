Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A66A61525A
	for <lists+dri-devel@lfdr.de>; Tue,  1 Nov 2022 20:33:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDA5D10E0C6;
	Tue,  1 Nov 2022 19:33:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84FD710E0C6;
 Tue,  1 Nov 2022 19:33:36 +0000 (UTC)
Received: by mail-qk1-x72e.google.com with SMTP id o28so7651999qkl.4;
 Tue, 01 Nov 2022 12:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/N7/nBRu5knHczCwW4PesOnn2cFxEdudjVNf9zsR3/4=;
 b=EQX41jpp/GDBqcQDZ2g80zm5T0vq/IUF0fd2ak+O0O8F2vNA16MrmIETO2ml4mXR72
 GimsYmYwPvowCQHh4IblO6GbFgxk9whVAXmqpAhV3v3w2zUye5FyjqtgGzRo6f0i9w43
 vmtcTa4IRGHxGlYB3+7xb0qtVVyFJ6KkbPLZ7lPiuI5sY6aY+zO8i0+xUx7PGkb6gxmt
 wwrazEMFk2czPYNM16oWZyrD6FC4iJy8cQST9JJJVa5nHDnqrDIIlGRDIrV6eHtL6+7x
 z9uphe7Pe9hOd0YM5xZaKnAtzXWdJu6oSOUwVAULzZs8/M4iQUgsQGC+6xoN5Zw+d/47
 4DWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/N7/nBRu5knHczCwW4PesOnn2cFxEdudjVNf9zsR3/4=;
 b=ne1Y8D960Gs2up9CpFBzEdJRnPgB29M9mFx32KJGcF4que1yxJMerNrIuf0uHtZRyH
 K51qPvobYnQdL+1cBxtuCP80uNBmF+Ea4p4rGwYmllVO+MRdsWN45686YVPHbOCDfBHq
 w0ppEpdWMI4R1pphZpAwS5S7LXICoWeN5GZBMHLdpbsc8A8ZH1vhfUKRoLFzUDsWUg8g
 JTPVrWWHxTpBn03HasNCuxu/gsi9qAQHLqo8tePgLIFyNXHqpp4N6BfD5MhLgGCPN8qv
 mRiLojkViJIr/3XG24lLQ4/ZnZ2mYK0drs6mKrEV6sAc7ezd/ps3G/Nipof/mbBCQkJM
 JvnA==
X-Gm-Message-State: ACrzQf2d0U07fl9nfFxUJRu3qIobSnlEJWL7BZbdty3zB0RSAlDwcX5V
 abA4FP7iDHtO+YXYqOqg6sTTvNpOTgsTIG4Rcms=
X-Google-Smtp-Source: AMsMyM651WYdYfSzAVss5USmmrdCwBt41YhXNKpIHGGjdLEKt1X+t80TFi/8/fL9ch/ldDetU8A9GR2nUzlOLIqHPoY=
X-Received: by 2002:a37:5a46:0:b0:6f9:ffc5:a9cb with SMTP id
 o67-20020a375a46000000b006f9ffc5a9cbmr14719586qkb.638.1667331215500; Tue, 01
 Nov 2022 12:33:35 -0700 (PDT)
MIME-Version: 1.0
References: <Y1+sWH3AfmLPEOv8@jlahtine-mobl.ger.corp.intel.com>
In-Reply-To: <Y1+sWH3AfmLPEOv8@jlahtine-mobl.ger.corp.intel.com>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 2 Nov 2022 05:33:23 +1000
Message-ID: <CAPM=9tzvdhHTG1oi4fCcK+2Q_f8ZtuXnvjDrYBO8M-a5SWW5AA@mail.gmail.com>
Subject: Re: [PULL] drm-intel-gt-next
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dim-tools@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 31 Oct 2022 at 21:07, Joonas Lahtinen
<joonas.lahtinen@linux.intel.com> wrote:
>
> Hi Dave & Daniel,
>
> Here goes first drm-intel-gt-next pull req towards 6.2.
>
> We have a fix for #6222 (kernel memory corruption issue) and fix for
> display regression after resume. A missing W/A for Gen12 iGPUs and
> extension of compute pre-emption timeout to 7.5 seconds to account for
> compute corner cases. Improvements to GuC compute error capture,
> scheduling hysteresis and SLPC. Fixes to EHL MOCS tables. Better docs
> for I915_PARAM_HUC_STATUS and pre-emption control policy. Extending the
> grace period for full GPU reset timeout to 60 seconds to better capture
> logs or recover, as opposed to just giving up on whole device in 5 seconds.
>
> We're starting to add HWMON metrics for recent devices. More MTL
> enabling, DG2 workarounds, DG2 HuC support, OA for DG2 is enabled. Small
> bar enabling, PS64 support added for DG2 page tables. ptrace support for
> local memory objects, local-memory migration for display surfaces.
>
> Note that there is drm/drm-next backmerge and then MEI subsystem patches
> around GSC/PXP which are intertwined with i915 change so merged here as
> agreed with Tomas and Greg.
>
> Additionally the usual amount of refactoring, cleanups, debugging
> improvements and static checker fixes.

Fails to build with clang here.
  CC [M]  drivers/gpu/drm/i915/i915_hwmon.o
/home/airlied/devel/kernel/dim/src/drivers/gpu/drm/i915/i915_hwmon.c:115:16:
error: result of comparison of constant 18446744073709551615 with
expression of type 'typeof (_Generic((field_msk), char: (unsigned
char)0, unsigned char: (unsigned char)0, signed char: (unsigned
char)0, unsigned short: (unsigned short)0, short: (unsigned short)0,
unsigned int: (unsigned int)0, int: (unsigned int)0, unsigned long:
(unsigned long)0, long: (unsigned long)0, unsigned long long:
(unsigned long long)0, long long: (unsigned long long)0, default:
(field_msk)))' (aka 'unsigned int') is always false
[-Werror,-Wtautological-constant-out-of-range-compare]
        bits_to_set = FIELD_PREP(field_msk, nval);
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/airlied/devel/kernel/dim/src/include/linux/bitfield.h:114:3:
note: expanded from macro 'FIELD_PREP'
                __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/airlied/devel/kernel/dim/src/include/linux/bitfield.h:71:53:
note: expanded from macro '__BF_FIELD_CHECK'
                BUILD_BUG_ON_MSG(__bf_cast_unsigned(_mask, _mask) >     \
                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
/home/airlied/devel/kernel/dim/src/include/linux/build_bug.h:39:58:
note: expanded from macro 'BUILD_BUG_ON_MSG'
#define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                    ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~
/home/airlied/devel/kernel/dim/src/include/linux/compiler_types.h:357:22:
note: expanded from macro 'compiletime_assert'
        _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
        ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/airlied/devel/kernel/dim/src/include/linux/compiler_types.h:345:23:
note: expanded from macro '_compiletime_assert'
        __compiletime_assert(condition, msg, prefix, suffix)
        ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/airlied/devel/kernel/dim/src/include/linux/compiler_types.h:337:9:
note: expanded from macro '__compiletime_assert'
                if (!(condition))                                       \
                      ^~~~~~~~~
1 error generated.

clang -v
clang version 14.0.5 (Fedora 14.0.5-1.fc36)

Dave.
