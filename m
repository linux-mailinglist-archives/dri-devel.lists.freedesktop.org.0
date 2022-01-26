Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4B949C75E
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 11:23:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1609510E7FF;
	Wed, 26 Jan 2022 10:23:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B74E10E6DB;
 Wed, 26 Jan 2022 10:23:24 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id a18so68084455edj.7;
 Wed, 26 Jan 2022 02:23:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ii7o+rApOV9c1TS9mkx6aDYIwS5s1Dz6MCJYhhLsikE=;
 b=Ln8amVerCzYz68x4zhhZMfq3Pzh+9Uxd/aMxebrg76kqFnhS5Y1yQlqRX7BB8j7qfD
 nvKLtBp9Hj8dvf8Pezk6nVo62kXsDWJLhU6xzCclmoOwNgmxquPDs7YXmBxUJPVNoxyt
 cRgDI87fT6C5xCT4r3lORmqRw5CbUFi4CbRkUoLbAbVEDUFE2iCal5gdJ5KOKNCtE1qv
 gxnyrSXzSHn+q88EOMlxmOvElZxknK+WwUDFYJctt8D1L54oVVbkfipcnaJJo9X65zJd
 GfdCnIfQerYPKrPpRhM697M24JcQoWzb9/lMfD8P0a70ZwrDzPtb58tUzSLpfCUHhyBF
 eBSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ii7o+rApOV9c1TS9mkx6aDYIwS5s1Dz6MCJYhhLsikE=;
 b=pqj1dy0l6Bb8PDvIBvlzoaqO7jysJ3ePSbt+HoRpczg94mXbtXYAiABWiABQ2DSM/T
 azny9qm1uSiz8enfU33JilWFAjIdugyB+T+iXPjmkHwvlAmsd6a2+6DcHcFD4dq//5dE
 tktg0kHIW4h6yXVvuYcb6Ynf4cm6K1sj4unkfLJ7Vh4twImZ4xnxxn3rnwhwKKUt/KZW
 JqbONr9EwsOs5BdrwapMaLMuTaVAwdzLi8FZne7XCuT3taIz7zhnc1Eweh6Ec3rDt4e/
 cmvJwnJL4/f4AzueshrrV30SGspq4jDr+hpCJd8FyahXSJr3OllI02UY1VOVhVyo7Pzj
 L6Zw==
X-Gm-Message-State: AOAM533LItqc2xsruzPG5739uCyEK3LiBjpLoohpiLb4PyirtDjQUWSl
 C1r9HdWFnnimXclGZdOzFvs1XqUdM2efGUM3VpA=
X-Google-Smtp-Source: ABdhPJzNoLjMutkiG1rIcRLBMJYXNKAEcChNIpwB1oqibQS0oJJv8RdEKOE0ei2A5eNUb+1fDDzSSnET34BlxoFSA5s=
X-Received: by 2002:a05:6402:40cd:: with SMTP id
 z13mr1007577edb.158.1643192602670; 
 Wed, 26 Jan 2022 02:23:22 -0800 (PST)
MIME-Version: 1.0
References: <20220126093951.1470898-1-lucas.demarchi@intel.com>
In-Reply-To: <20220126093951.1470898-1-lucas.demarchi@intel.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 26 Jan 2022 12:22:46 +0200
Message-ID: <CAHp75VcheiM7gNW+zP2Ve8qOj40158aOM0OkhUjyODd+V3sYjQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/11] lib/string_helpers: Add a few string helpers
To: Lucas De Marchi <lucas.demarchi@intel.com>
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
Cc: Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>, Vishal Kulkarni <vishal@chelsio.com>,
 Francis Laniel <laniel_francis@privacyrequired.com>,
 Kentaro Takeda <takedakn@nttdata.co.jp>, amd-gfx@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 Petr Mladek <pmladek@suse.com>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Leo Li <sunpeng.li@amd.com>, intel-gfx <intel-gfx@lists.freedesktop.org>,
 Raju Rangoju <rajur@chelsio.com>, Julia Lawall <julia.lawall@lip6.fr>,
 Rahul Lakkireddy <rahul.lakkireddy@chelsio.com>,
 Steven Rostedt <rostedt@goodmis.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 linux-security-module <linux-security-module@vger.kernel.org>,
 netdev <netdev@vger.kernel.org>, Alex Deucher <alexander.deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 26, 2022 at 11:39 AM Lucas De Marchi
<lucas.demarchi@intel.com> wrote:
>
> Add some helpers under lib/string_helpers.h so they can be used
> throughout the kernel. When I started doing this there were 2 other
> previous attempts I know of, not counting the iterations each of them
> had:
>
> 1) https://lore.kernel.org/all/20191023131308.9420-1-jani.nikula@intel.co=
m/
> 2) https://lore.kernel.org/all/20210215142137.64476-1-andriy.shevchenko@l=
inux.intel.com/#t
>
> Now there is also the v1 of this same patch series:
> https://lore.kernel.org/all/20220119072450.2890107-1-lucas.demarchi@intel=
.com/
>
> Going through the comments I tried to find some common ground and
> justification for what is in here, addressing some of the concerns
> raised.
>
> a. This version should be a drop-in replacement for what is currently in
>    the tree, with no change in behavior or binary size. For binary
>    size what I checked was that the linked objects in the end have the
>    same size (gcc 11). From comments in the previous attempts this seems
>    also the case for earlier compiler versions
>
> b. I didn't change the function name to choice_* as suggested by Andrew
>    Morton in 20191023155619.43e0013f0c8c673a5c508c1e@linux-foundation.org
>    because other people argumented in favor of shorter names for these
>    simple helpers - if they are long and people simply not use due to
>    that, we failed. However as pointed out in v1 of this patchseries,
>    onoff(), yesno(), enabledisable(), enableddisabled() have some
>    issues: the last 2 are hard to read and for the first 2 it would not
>    be hard to have the symbol to clash with variable names.
>    From comments in v1, most people were in favor (or at least not
>    opposed) to using str_on_off(), str_yes_no(), str_enable_disable()
>    and str_enabled_disabled().
>
> c. Use string_helper.h for these helpers - pulling string.h in the
>    compilations units was one of the concerns and I think re-using this
>    already existing header is better than creating a new string-choice.h
>
> d. One alternative to all of this suggested by Christian K=C3=B6nig
>    (43456ba7-c372-84cc-4949-dcb817188e21@amd.com) would be to add a
>    printk format. But besides the comment, he also seemed to like
>    the common function. This brought the argument from others that the
>    simple yesno()/enabledisable() already used in the code (or new
>    renamed version) is easier to remember and use than e.g. %py[DOY]

I do not see any impediments to this series to be pulled.
Thanks for the work you've done!

> Changes in v2:
>
>   - Use str_ prefix and separate other words with underscore: it's a
>     little bit longer, but should improve readability
>
>   - Patches we re-split due to the rename: first patch adds all the new
>     functions, then additional patches try to do one conversion at a
>     time. While doing so, there were some fixes for issues already
>     present along the way
>
>   - Style suggestions from v1 were adopted
>
> In v1 it was suggested to apply this in drm-misc. I will leave this to
> maintainers to decide: maybe it would be simpler to merge the first
> patches on drm-intel-next, wait for the back merge and merge the rest
> through drm-misc - my fear is a big conflict with other work going in
> drm-intel-next since the bulk of the rename is there.
>
> I tried to figure out acks and reviews from v1 and apply them to how the
> patches are now split.
>
> thanks
> Lucas De Marchi
>
> Lucas De Marchi (11):
>   lib/string_helpers: Consolidate string helpers implementation
>   drm/i915: Fix trailing semicolon
>   drm/i915: Use str_yes_no()
>   drm/i915: Use str_enable_disable()
>   drm/i915: Use str_enabled_disabled()
>   drm/i915: Use str_on_off()
>   drm/amd/display: Use str_yes_no()
>   drm/gem: Sort includes alphabetically
>   drm: Convert open-coded yes/no strings to yesno()
>   tomoyo: Use str_yes_no()
>   cxgb4: Use str_yes_no()
>
>  drivers/gpu/drm/amd/amdgpu/atom.c             |   4 +-
>  .../amd/display/amdgpu_dm/amdgpu_dm_debugfs.c |  14 +-
>  drivers/gpu/drm/dp/drm_dp.c                   |   3 +-
>  drivers/gpu/drm/drm_client_modeset.c          |   3 +-
>  drivers/gpu/drm/drm_gem.c                     |  23 +-
>  drivers/gpu/drm/i915/display/g4x_dp.c         |   6 +-
>  .../gpu/drm/i915/display/intel_backlight.c    |   3 +-
>  drivers/gpu/drm/i915/display/intel_ddi.c      |   4 +-
>  drivers/gpu/drm/i915/display/intel_display.c  |  46 ++--
>  .../drm/i915/display/intel_display_debugfs.c  |  74 +++---
>  .../drm/i915/display/intel_display_power.c    |   4 +-
>  .../drm/i915/display/intel_display_trace.h    |   9 +-
>  drivers/gpu/drm/i915/display/intel_dp.c       |  20 +-
>  drivers/gpu/drm/i915/display/intel_dpll.c     |   3 +-
>  drivers/gpu/drm/i915/display/intel_dpll_mgr.c |   7 +-
>  drivers/gpu/drm/i915/display/intel_dsi_vbt.c  |   7 +-
>  drivers/gpu/drm/i915/display/intel_fbc.c      |   4 +-
>  drivers/gpu/drm/i915/display/intel_fdi.c      |   8 +-
>  drivers/gpu/drm/i915/display/intel_hdmi.c     |   3 +-
>  drivers/gpu/drm/i915/display/intel_sprite.c   |   6 +-
>  drivers/gpu/drm/i915/display/vlv_dsi_pll.c    |   3 +-
>  .../gpu/drm/i915/gem/selftests/huge_pages.c   |   9 +-
>  .../drm/i915/gem/selftests/i915_gem_context.c |   7 +-
>  drivers/gpu/drm/i915/gt/intel_breadcrumbs.c   |   3 +-
>  drivers/gpu/drm/i915/gt/intel_engine_cs.c     |  11 +-
>  .../drm/i915/gt/intel_execlists_submission.c  |   7 +-
>  drivers/gpu/drm/i915/gt/intel_gt_pm.c         |   3 +-
>  drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c |  52 ++--
>  drivers/gpu/drm/i915/gt/intel_rc6.c           |   5 +-
>  drivers/gpu/drm/i915/gt/intel_reset.c         |   3 +-
>  drivers/gpu/drm/i915/gt/intel_rps.c           |  13 +-
>  drivers/gpu/drm/i915/gt/intel_sseu.c          |   9 +-
>  drivers/gpu/drm/i915/gt/intel_sseu_debugfs.c  |  10 +-
>  drivers/gpu/drm/i915/gt/selftest_timeline.c   |   3 +-
>  drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c     |   5 +-
>  drivers/gpu/drm/i915/gt/uc/intel_guc_log.c    |   5 +-
>  drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c     |   6 +-
>  drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c   |   4 +-
>  drivers/gpu/drm/i915/gt/uc/intel_uc.c         |  14 +-
>  drivers/gpu/drm/i915/gt/uc/intel_uc_debugfs.c |  20 +-
>  drivers/gpu/drm/i915/i915_debugfs.c           |  17 +-
>  drivers/gpu/drm/i915/i915_driver.c            |   4 +-
>  drivers/gpu/drm/i915/i915_gpu_error.c         |   9 +-
>  drivers/gpu/drm/i915/i915_params.c            |   5 +-
>  drivers/gpu/drm/i915/i915_utils.h             |  21 +-
>  drivers/gpu/drm/i915/intel_device_info.c      |   8 +-
>  drivers/gpu/drm/i915/intel_dram.c             |  10 +-
>  drivers/gpu/drm/i915/intel_pm.c               |  14 +-
>  drivers/gpu/drm/i915/pxp/intel_pxp_debugfs.c  |   4 +-
>  drivers/gpu/drm/i915/selftests/i915_active.c  |   3 +-
>  drivers/gpu/drm/i915/vlv_suspend.c            |   3 +-
>  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/aux.c |   5 +-
>  drivers/gpu/drm/radeon/atom.c                 |   3 +-
>  drivers/gpu/drm/v3d/v3d_debugfs.c             |  11 +-
>  drivers/gpu/drm/virtio/virtgpu_debugfs.c      |   4 +-
>  .../ethernet/chelsio/cxgb4/cxgb4_debugfs.c    | 249 ++++++++++--------
>  include/linux/string_helpers.h                |  20 ++
>  security/tomoyo/audit.c                       |   2 +-
>  security/tomoyo/common.c                      |  19 +-
>  security/tomoyo/common.h                      |   1 -
>  60 files changed, 482 insertions(+), 373 deletions(-)
>
> --
> 2.34.1
>


--=20
With Best Regards,
Andy Shevchenko
