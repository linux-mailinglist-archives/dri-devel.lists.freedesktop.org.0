Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D2C5B628D
	for <lists+dri-devel@lfdr.de>; Mon, 12 Sep 2022 23:11:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82FB910E2FB;
	Mon, 12 Sep 2022 21:11:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe2d.google.com (mail-vs1-xe2d.google.com
 [IPv6:2607:f8b0:4864:20::e2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A5DC10E2ED;
 Mon, 12 Sep 2022 21:11:33 +0000 (UTC)
Received: by mail-vs1-xe2d.google.com with SMTP id o123so10362591vsc.3;
 Mon, 12 Sep 2022 14:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=0y5HDghcAY9sylQGFFzoaSf/fyhWZ2sBWfqcl39LrAY=;
 b=mxC/08asEEoQwpJK7YyrNORboVPuR1mQ9pckLYXNFM9ItzfU4KAedKMQxXi+Ppdh4t
 v0Z7Zxg+FPrE4QWEkn3h2vRE2QSxRJ0KA9uGF3tCoeY4rRltXbSYzIcixWkksNF9t9wO
 o/Lldc8HyGnQ/TfoPY4NVvRvTjwUSJv6LYnbbdm+CZDBg4SxDRWhnzoAZXExfNnWqjl3
 VKk+DmQ57LYXuxE3Gn8Z8PZhuSKCPAh7obwz8x90stW22FYdXekkH/8340+EcuAMqBB/
 E9dZa3mrQQROKHo+3gvj0DQYDL1uQDqK1BDwYySeYl6pZ3WO1qwYVKsgOpXdoDHSQRvt
 YMOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=0y5HDghcAY9sylQGFFzoaSf/fyhWZ2sBWfqcl39LrAY=;
 b=5tG8gRpe1xsUUz83YQPLca1A9vGOblFIIXgcH9QQzoky3ftZwfHRtEnkaPkkiZLcpX
 8jHgjITVQUv7TQu/oIiOJdXyUYoahfTnk77m23uY6XZw1XkUYo+mtlX6FAq05eubFTzf
 eyV4ew7D/NwNZuqbNgqIrklFF/AO6MMHrq2Bp6iL2wJUI21FzruBD9uGRH08PNY1/ysR
 c38pu6ecVM6BN7aaXfi4g6FZO1JFpX5I/HFbTUWNL22hsQTFzkkLCR2JVVmAWidt955X
 jX3tF+r/a6sNIbGmFOIS7ka3F7SNpUhytY8XC0c6pZYTni/z/A2b6LpNwE2rMOfPnkDt
 a/ow==
X-Gm-Message-State: ACgBeo3h0nKRcx5ospDVV8PlXrFbHw7b1OdxlFe0H74P7H5/zmUmJw78
 lqBZOYn5xRDWhyijaSttHyAcL1l/O4ZWThZOhck=
X-Google-Smtp-Source: AA6agR5pilGGCrxIlDXL0vtrXfNYU1+8LLhhj8vm590FXQ+SqLj90vzQQRbHzbzkwJG/WG/xxQzVbLbSR7rfddViAoo=
X-Received: by 2002:a05:6102:3a4c:b0:398:3098:a301 with SMTP id
 c12-20020a0561023a4c00b003983098a301mr7548545vsu.74.1663017092101; Mon, 12
 Sep 2022 14:11:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220912052852.1123868-1-jim.cromie@gmail.com>
 <20220912052852.1123868-3-jim.cromie@gmail.com> <87pmg06g2x.fsf@intel.com>
In-Reply-To: <87pmg06g2x.fsf@intel.com>
From: jim.cromie@gmail.com
Date: Mon, 12 Sep 2022 15:11:05 -0600
Message-ID: <CAJfuBxy5E0xPFH=bxaaXy2Q8LojBrqgr+su8wGq7rsv3m7_d_g@mail.gmail.com>
Subject: Re: [PATCH v7 2/9] drm: POC drm on dyndbg - use in core, 2 helpers,
 3 drivers.
To: Jani Nikula <jani.nikula@linux.intel.com>
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
Cc: Greg KH <gregkh@linuxfoundation.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 Jason Baron <jbaron@akamai.com>, Sean Paul <seanpaul@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Joe Perches <joe@perches.com>,
 intel-gvt-dev@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 12, 2022 at 4:29 AM Jani Nikula <jani.nikula@linux.intel.com> wrote:
>
> On Sun, 11 Sep 2022, Jim Cromie <jim.cromie@gmail.com> wrote:
> > Use DECLARE_DYNDBG_CLASSMAP across DRM:
> >
> >  - in .c files, since macro defines/initializes a record
> >
> >  - in drivers, $mod_{drv,drm,param}.c
> >    ie where param setup is done, since a classmap is param related
> >
> >  - in drm/drm_print.c
> >    since existing __drm_debug param is defined there,
> >    and we ifdef it, and provide an elaborated alternative.
> >
> >  - in drm_*_helper modules:
> >    dp/drm_dp - 1st item in makefile target
> >    drivers/gpu/drm/drm_crtc_helper.c - random pick iirc.
> >
> > Since these modules all use identical CLASSMAP declarations (ie: names
> > and .class_id's) they will all respond together to "class DRM_UT_*"
> > query-commands:


>
> The commit message could start off by saying each module needs to define
> DECLARE_DYNDBG_CLASSMAP(drm_debug_classes, ...). That is, IIUC.
>

Yes, I see your point.
All the explanations missing here are in preceding commits,
now in GregKHs  driver-core/driver-core-next tree,
so I didnt resend them.


> Where's DECLARE_DYNDBG_CLASSMAP defined? linux-next? What's it do? What
> if multiple modules with that are actually builtin?

The commit that adds the macro is at
https://lore.kernel.org/lkml/20220904214134.408619-15-jim.cromie@gmail.com/

there are many combos of builtin, Ive done at least several:
with caveat that >98% of testing is on virtme (thanks for that tool)

- test_dynamic_debug as module, and builtin.
it has multiple macro uses, showing 1 kind of sharing

- drm as builtin, drivers as modules
that surely pulled in other drm-helpers as builtins

- all loadable modules mostly.


>
> The duplication and requirement that they're identical seems like an
> error prone combo.

I freely acknowledge(d) this is sub-optimal.
There might be a best place for a single declaration that is in-scope
across multiple modules, but I dont know the drm core/driver lifetime
well enough to just drop this into that place.

I may have complicated things by starting with a static struct holding
the classmap, that choice was driven by:

- static declaration into a section solved a problem where the class
definitions
were "registered" (term used in patchset, -v2-3?) too late to be available for
     modprobe i915 dyndbg='class DRM_UT_CORE +p'
but worked afterwards
(also true for builtins and boot-time $mod.dyndbg='class notworking +p')

Another subtlety - the "sharing" is due more to: drm_dbg(DRM_UT_*, "")
Im not sure precisely how this might matter.

I also had an "incompleteness" argument circling in my head - something like;
you cant simultaneously allow a drm-wanna-be module to declare "DRM_UT_CORE"
but disallow "DRM_UT_ILL_CONSIDERED".   I kind-of stopped there.

Theres also an issue where multiple declarations in a module must
avoid range overlap.
I had no idea how to put that into a BUILD_BUG_ON.
Its done manually, with commentary, in test-dynamic-debug.

Maybe both issues can be improved somewhat by changing the macro
to expect real ENUM symbols, (and stringify _VA_ARGS_ to init the classnames),
not the quoted "DRM_UT_*"s it gets now.  That would also obsolete the _base,
since its the value of DRM_UT_CORE (the 1st enum val).
But that still leaves the enum vals enumerated, with possibility of
omission or mixup,
which unlike a spelling error wouldnt get caught, and would be wrong.

I fiddled with the 1st part of that for a while, I lack the macro-fu,
and punted.

Im happy to try an alternative approach, particularly with elaborated
suggestions.


>
> Finally, the choice of placement in e.g. i915_params.c seems completely
> arbitrary, and makes you wonder "what here requires this, nothing?".

acknowledged - I put it there because the access to it is via a parameter,
namely one that already affects it from a distance:
   /sys/module/drm/parameters/debug - ie drm.dbg

And its not even i915's parameter.

>
> BR,
> Jani.
>

thanks,

>
> >
> > Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
