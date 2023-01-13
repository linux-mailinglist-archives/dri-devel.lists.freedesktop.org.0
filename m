Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3248066A219
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 19:30:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FA6810EAA1;
	Fri, 13 Jan 2023 18:30:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe32.google.com (mail-vs1-xe32.google.com
 [IPv6:2607:f8b0:4864:20::e32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D2F610EA93;
 Fri, 13 Jan 2023 18:30:24 +0000 (UTC)
Received: by mail-vs1-xe32.google.com with SMTP id q125so11326695vsb.0;
 Fri, 13 Jan 2023 10:30:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=CXzwvPSlVj3I6D/88tyYLanpnLn/NDNCNzhBeAOiGYM=;
 b=I531NW5K7Qsn31FeCSrTjL5IBfAkbpXCnoHEFr59z0it+fWxQgQ2vRsLj0jxooBany
 mW3Zb1fi8SHgMf2OmV3QbrQU2eIha8LYe3KuOy2clkf15zGa0GcwbXAedwfHSL7A5pdP
 AQ/Lq6p7WFT6cUIKi6WQX0gyXrV+VV1ReisvGai0o15pGQZn34m9FjlZS/OjbM9/6Vth
 vzJFRvcVMUpFlKu2rmSOmAumQIfShzuPXMxHKwv4gYjRjGQf4TwdeddAz7pzNHF5JnBZ
 avR/hHNGYwz0T9RaqlvtqWN/p0PEK3XRxzTw7dr9chCOOIOG+CxBFk42EUQfmmwnJ7zF
 yA6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CXzwvPSlVj3I6D/88tyYLanpnLn/NDNCNzhBeAOiGYM=;
 b=jljcVQXiaYopbFQ4KTUr+5eajdBmh4CxXQ1zIMnQO9qit+p7655iafzch0J/4hSBmx
 WvNXaGMIcdwpY4Lq/QILkNETvaO4czhihQ8pWrwCze0QjFv3Py7jOjAw+wETCFgiZ/i+
 AUR+OjmeJnynjoms1hw1wLSST4k+95xYQ7bVITjk4+IbY1yvJu9VryaLGQtu+EYXkn1L
 l8rmvsPZN8xZq67F/U7wuAwAcrPO24ruVtvx71Dq2pPT3yYGO9xW0x+FM7kc27KspS54
 dV9cgq3uFAkL+1gCjW11Jt5/p6o2HNjARuE2OUfoTJ+vItf2+IDkzqz4CQIdwk6M5P7d
 6+2w==
X-Gm-Message-State: AFqh2kr7YT3Xe6RByDAdbQ4oyCGeWkcyPkZGfMIHnEctaSxKEJMYMbJj
 DbN6vC8tZpC+W+1DImhUxVNCU0Irv8Ypt0iqUAs=
X-Google-Smtp-Source: AMrXdXsHLZ8s1p6LZJ4XXpzy/6UHD2QthJavSExaGcngbBLrF89HjvbE6MXSPcEdIEPY0Fsy++ntWEVFZC4rdd6wqVM=
X-Received: by 2002:a05:6102:c8b:b0:3b2:ebc9:6307 with SMTP id
 f11-20020a0561020c8b00b003b2ebc96307mr12162616vst.73.1673634623018; Fri, 13
 Jan 2023 10:30:23 -0800 (PST)
MIME-Version: 1.0
References: <20221206003424.592078-1-jim.cromie@gmail.com>
 <Y79Btep8JnPKvuAp@phenom.ffwll.local>
In-Reply-To: <Y79Btep8JnPKvuAp@phenom.ffwll.local>
From: jim.cromie@gmail.com
Date: Fri, 13 Jan 2023 11:29:57 -0700
Message-ID: <CAJfuBxxZ0Kjc0G5Ngv7bmokkC4AJKZ07OMCKyLmHBGSsjG7qfA@mail.gmail.com>
Subject: Re: [RFC PATCH 00/17] DRM_USE_DYNAMIC_DEBUG regression
To: Jim Cromie <jim.cromie@gmail.com>, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 jani.nikula@intel.com, ville.syrjala@linux.intel.com, seanpaul@chromium.org, 
 robdclark@gmail.com, jbaron@akamai.com, gregkh@linuxfoundation.org
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
Cc: daniel.vetter@ffwll.ch
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 11, 2023 at 4:09 PM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Mon, Dec 05, 2022 at 05:34:07PM -0700, Jim Cromie wrote:
> > Hi everyone,
> >
> > DRM_USE_DYNAMIC_DEBUG=y has a regression on rc-*
> >
> > Regression is due to a chicken-egg problem loading modules; on
> > `modprobe i915`, drm is loaded 1st, and drm.debug is set.  When
> > drm_debug_enabled() tested __drm_debug at runtime, that just worked.
> >
> > But with DRM_USE_DYNAMIC_DEBUG=y, the runtime test is replaced with a
> > post-load enablement of drm_dbg/dyndbg callsites (static-keys), via
> > dyndbg's callback on __drm_debug.  Since all drm-drivers need drm.ko,
> > it is loaded 1st, then drm.debug=X is applied, then drivers load, but
> > too late for drm_dbgs to be enabled.
> >
> > STATUS
> >
> > For all-loadable drm,i915,amdgpu configs, it almost works, but
> > propagating drm.debug to dependent modules doesnt actually apply,
> > though the motions are there.  This is not the problem I want to chase
> > here.
> >
> > The more basic trouble is:
> >
> > For builtin drm + helpers, things are broken pretty early; at the
> > beginning of dynamic_debug_init().  As the ddebug_sanity() commit-msg
> > describes in some detail, the records added by _USE fail to reference
> > the struct ddebug_class_map created and exported by _DEFINE, but get
> > separate addresses to "other" data that segv's when used as the
> > expected pointer. FWIW, the pointer val starts with "revi".
>
> So I honestly have no idea here, linker stuff is way beyond where I have
> clue. So what's the way forward here?
>

Ive fixed this aspect.
Unsurprisingly, it wasnt the linker :-}

> The DEFINE/USE split does like the right thing to do at least from the
> "how it's used in drivers" pov. But if we're just running circles not
> quite getting there I dunno :-/
> -Daniel
>

Sending new rev next.
I think its getting close.
