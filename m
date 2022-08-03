Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A051F5892F1
	for <lists+dri-devel@lfdr.de>; Wed,  3 Aug 2022 21:57:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 871E82B0BF;
	Wed,  3 Aug 2022 19:57:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa2b.google.com (mail-vk1-xa2b.google.com
 [IPv6:2607:f8b0:4864:20::a2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1D512B37C;
 Wed,  3 Aug 2022 19:56:50 +0000 (UTC)
Received: by mail-vk1-xa2b.google.com with SMTP id x184so6356666vka.11;
 Wed, 03 Aug 2022 12:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=Ppr4gfbD27yoQqv8VNVDUPFoLh95eonUi/IjSVwzFEk=;
 b=gF5xkdmXF9JeEkTjpEyBBGeeyjJl2Jan9HKkIyLaH93Tgm8DLCSCwyKOxlza84x0FR
 5ew8oAVrsKpYXjYIhrW3Ki/P+qsCLeKSAf8AgSnoOBu+FYtheiY0//7xrWSIALw3Q2/k
 AiXYDmuAZotX8ou3pALKKvrt+VkU6jwahqPbFs4TidWsnrmyzC5ht/Q+6dyFS6imaW09
 BxJNhXHc/EBsvOsrakLRqJowyoiPQfnXiK6d78z1YtdnR7KNIiw4FOCwEBW9azpx/MTQ
 EQVm/5GXm5ylNKBl8kr/904N8xomn6nZl9yjbTWugg9H1hfFPlYfedU2nStPxNutmDvP
 rjRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=Ppr4gfbD27yoQqv8VNVDUPFoLh95eonUi/IjSVwzFEk=;
 b=wc5cD9aza//IM/RddbxxbYNW8UIKfR2N9H7xq/6+BvuDiY7ke6SiIeYH8shn4Zbwe+
 26Vt9JlUzrJTmi4q/0gM544LsMjcSJDd0c6sbwCtXM3VT7LjezW1xV0WlQI5ARcbV7gS
 gB09Xv8r8Uo1IrSQTDIa7rvSg5d/J4GTuiBJu0nRexsnPB4Piiw57uT7e7FOHToZZuK3
 WQd1DUfyIF0Z+kTmNw1tgAIQnF7qcUmsDwxfcIDyFq5DYYGoJJpMhauT+peAC+nUjp8q
 LENlGw8ZMxWOnI1KYj220KuGcXYaeQzLLl1CbGQtnmPMYhpLR7QeTVpsLTC8kkmZm52p
 kIDA==
X-Gm-Message-State: AJIora+bU9DeSqNVJz0izHNXgNTjTee/gL6VTwAVjE4MiqeQpscRd1d0
 WLpUcZdCyGs/h3AJbqwj9BuPLEJ6+hZ0Pw8bzyB9kGE9tiM=
X-Google-Smtp-Source: AGRyM1sj7fdZ8SvTX5KudlF9zktykJexK+PKkDbDutjgClA2/rk07QNWCdtRNGCryAFlJhJG1e1Vty8jbNHrbJaeetg=
X-Received: by 2002:a1f:ac50:0:b0:375:f4d4:9ace with SMTP id
 v77-20020a1fac50000000b00375f4d49acemr10688181vke.36.1659556608908; Wed, 03
 Aug 2022 12:56:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220720153233.144129-1-jim.cromie@gmail.com>
In-Reply-To: <20220720153233.144129-1-jim.cromie@gmail.com>
From: jim.cromie@gmail.com
Date: Wed, 3 Aug 2022 13:56:22 -0600
Message-ID: <CAJfuBxxPRj-u5S45pPfAEaE46ji0--MTVxryEAUPe1+1c1jgEw@mail.gmail.com>
Subject: Re: [PATCH v4 00/41] DYNDBG: opt-in class'd debug for modules,
 use in drm.
To: dri-devel <dri-devel@lists.freedesktop.org>, 
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 intel-gvt-dev@lists.freedesktop.org, 
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Jason Baron <jbaron@akamai.com>, 
 Greg KH <gregkh@linuxfoundation.org>, Daniel Vetter <daniel.vetter@ffwll.ch>, 
 Sean Paul <seanpaul@chromium.org>, robdclark@gmail.com
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

On Wed, Jul 20, 2022 at 9:32 AM Jim Cromie <jim.cromie@gmail.com> wrote:
>

> Hi Jason, Greg, DRM-folk,
>
> This adds 'typed' "class FOO" support to dynamic-debug, where 'typed'
> means either DISJOINT (like drm debug categories), or VERBOSE (like
> nouveau debug-levels).  Use it in DRM modules: core, helpers, and in
> drivers i915, amdgpu, nouveau.
>

This revision fell over, on a conflict with something in drm-MUMBLE

Error: patch https://patchwork.freedesktop.org/api/1.0/series/106427/revisions/2/mbox/
not applied
Applying: dyndbg: fix static_branch manipulation
Applying: dyndbg: fix module.dyndbg handling
Applying: dyndbg: show both old and new in change-info
Applying: dyndbg: reverse module walk in cat control
Applying: dyndbg: reverse module.callsite walk in cat control
Applying: dyndbg: use ESCAPE_SPACE for cat control
Applying: dyndbg: let query-modname override actual module name
Applying: dyndbg: add test_dynamic_debug module
Applying: dyndbg: drop EXPORTed dynamic_debug_exec_queries

Jason,
those above are decent maintenance patches, particularly the drop export.
It would be nice to trim this unused api this cycle.

Applying: dyndbg: add class_id to pr_debug callsites
Applying: dyndbg: add __pr_debug_cls for testing
Applying: dyndbg: add DECLARE_DYNDBG_CLASSMAP
Applying: kernel/module: add __dyndbg_classes section
Applying: dyndbg: add ddebug_attach_module_classes
Applying: dyndbg: validate class FOO by checking with module
Applying: dyndbg: add drm.debug style bitmap support
Applying: dyndbg: test DECLARE_DYNDBG_CLASSMAP, sysfs nodes
Applying: doc-dyndbg: describe "class CLASS_NAME" query support
Applying: doc-dyndbg: edit dynamic-debug-howto for brevity, audience
Applying: drm_print: condense enum drm_debug_category
Applying: drm: POC drm on dyndbg - use in core, 2 helpers, 3 drivers.
Applying: drm_print: interpose drm_*dbg with forwarding macros
Applying: drm_print: wrap drm_*_dbg in dyndbg descriptor factory macro
Using index info to reconstruct a base tree...
M drivers/gpu/drm/Kconfig
M drivers/gpu/drm/Makefile
Falling back to patching base and 3-way merge...
Auto-merging drivers/gpu/drm/Makefile
Auto-merging drivers/gpu/drm/Kconfig
CONFLICT (content): Merge conflict in drivers/gpu/drm/Kconfig
error: Failed to merge in the changes.


Before I resend, I should sort out that possible conflict
which tree is patchwork applied upon ?

or was it just transient ? after 5.19 I rebased a copy onto drm-next/drm-next,
and there was nothing to fix - I will revisit presently..
