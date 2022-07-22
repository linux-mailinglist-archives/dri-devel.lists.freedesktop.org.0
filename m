Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B60057EA3A
	for <lists+dri-devel@lfdr.de>; Sat, 23 Jul 2022 01:23:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D68828DEAB;
	Fri, 22 Jul 2022 23:23:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x936.google.com (mail-ua1-x936.google.com
 [IPv6:2607:f8b0:4864:20::936])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DC3F8D03C;
 Fri, 22 Jul 2022 23:23:33 +0000 (UTC)
Received: by mail-ua1-x936.google.com with SMTP id p8so2229634uam.12;
 Fri, 22 Jul 2022 16:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=H6150pqoWoOOw/lAJbUkZ59K/WEGjR9gsX2GFab7M58=;
 b=eK9PNazH/F/4ye1M4tVZ9ecg73SDf/W4qANoYbKJikLfkkjpOsHbLx/TsDZYGJXTGp
 wNPfVpmVCdzKFYTl1r7qdJciLMLSs8B1VKTDEgKW+6VjXxIsxcxI/v7bGRRkPnrsFgMx
 4TVqNl93oOq6WAxDExnfagVuMkI1KzT0HjVNz08d5aL5Us4CMI4snuBzGxZIec3URA44
 ss9uZiedIOP00HSNCSDtVjHNS/IVcsbDt2gEBofckpPxwlBDxmGuckcPTAojwOazUMZq
 f47pxIy8Sjc4K0b6d7d7OlwCmIjFpTbcK8I0RI3a1/So9M0SgZa621FngXX2+sRvKaDw
 Kx5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H6150pqoWoOOw/lAJbUkZ59K/WEGjR9gsX2GFab7M58=;
 b=XujLDjV4QeoW23EXr/otgMxUZ7NWkHlGPy5QWZ4kC790sFfzezAx/DgyaOy3Tf+pN5
 ldN7nUp/R2P/arqQ85emy3OLnZqnuKHRTFiR0uqIkOg/TTV/3IH0PQ80Mz+x/gYFyHaf
 Btr+GfbKsVprDgBSUNbE9cdtCc8qzhEaSOigxfvcfJpUNhJPL/ycn+2ik+sb3Lr6y6CO
 E63pCRprPLMNMUEjppxmDUGPaiPeAEItodjofjOhIDF4Ap26TbDFjwP93fEhRxVxzkAs
 mux/p9E7lXAID/Yd1gusHf76F75nLEFjMduVtXQ6XKPBVmVEu4BlcLPzppq8UU3ohaMo
 qUOQ==
X-Gm-Message-State: AJIora8MspuVkJyHyXYdc9482GL2yjsx/jS3Bh0IBhEIseKczhlwhwVu
 7oKBjEC56plxkhcXfehI0acbejBOmS2DXBlNpaQ=
X-Google-Smtp-Source: AGRyM1vzndmwuPlK5HRqj8b1Fq+uP7vvBVOkD444MrDZCrjjmtELUGYvTarxuRNb0/BJpVQYCnvdqiyEHPp4Qu6UOzo=
X-Received: by 2002:ab0:3f0c:0:b0:383:f357:9c02 with SMTP id
 bt12-20020ab03f0c000000b00383f3579c02mr895717uab.19.1658532212987; Fri, 22
 Jul 2022 16:23:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220720153233.144129-1-jim.cromie@gmail.com>
 <20220720153233.144129-13-jim.cromie@gmail.com>
 <9e34b45f-c091-223b-58ac-107cfbebd92c@akamai.com>
In-Reply-To: <9e34b45f-c091-223b-58ac-107cfbebd92c@akamai.com>
From: jim.cromie@gmail.com
Date: Fri, 22 Jul 2022 17:23:06 -0600
Message-ID: <CAJfuBxwiMtmH6n4OPDOStfKKiWQ_+EFDxG=xLNPUfET-96gA=g@mail.gmail.com>
Subject: Re: [PATCH v4 12/41] dyndbg: add DECLARE_DYNDBG_CLASSMAP
To: Jason Baron <jbaron@akamai.com>
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
Cc: gregkh@linuxfoundation.org, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, seanpaul@chromium.org,
 dri-devel@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 intel-gvt-dev@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 22, 2022 at 2:23 PM Jason Baron <jbaron@akamai.com> wrote:
>
>
>
> On 7/20/22 11:32, Jim Cromie wrote:
> > DECLARE_DYNDBG_CLASSMAP lets modules declare a set of classnames, this
> > opt-in authorizes dyndbg to allow enabling of prdbgs by their class:
> >
> >    :#> echo class DRM_UT_KMS +p > /proc/dynamic_debug/control
> >
> > This is just the setup; following commits deliver.
> >
> > The macro declares and initializes a static struct ddebug_class_map:
> >
> >  - maps approved class-names to class_ids used in module,
> >    by array order. forex: DRM_UT_*
> >  - class-name vals allow validation of "class FOO" queries
> >    using macro is opt-in
> >  - enum class_map_type - determines interface, behavior
> >
> > Each module has its own .class_id space, and only known class-names
> > will be authorized for a manipulation.  Only DRM stuff should know this:
> >
> >   :#> echo class DRM_UT_CORE +p > control     # across all modules
> >
> > pr_debugs (with default class_id) are still controllable as before.
> >
> > DECLARE_DYNDBG_CLASSMAP(_var, _maptype, _base, classes...) is::
> >
> >  _var: name of the static struct var. user passes to module_param_cb()
> >        if they want a sysfs node. (ive only done it this way).
> >
> >  _maptype: this is hard-coded to DD_CLASS_TYPE_DISJOINT for now.
> >
> >  _base: usually 0, it allows splitting 31 classes into subranges, so
> >       that multiple classes / sysfs-nodes can share the module's
> >       class-id space.
> >
> >  classes: list of class_name strings, these are mapped to class-ids
> >         starting at _base.  This class-names list must have a
> >         corresponding ENUM, with SYMBOLS that match the literals,
> >         and 1st enum val = _base.
> >
> > enum class_map_type has 4 values, on 2 factors::
> >
> >  - classes are disjoint/independent vs relative/x<y/verbosity.
> >    disjoint is basis, verbosity by overlay.
> >
> >  - input NUMBERS vs [+-]CLASS_NAMES
> >    uints, ideally hex.  vs  +DRM_UT_CORE,-DRM_UT_KMS
> >
>
> Could the naming here directly reflect the 2 factors? At least for me
> I think it's more readable. So something like:
>

yeah, those were 1st-pass names.
your names are more regular

> DD_CLASS_TYPE_DISJOINT_NUM
> DD_CLASS_TYPE_DISJOINT_NAME
> DD_CLASS_TYPE_LEVEL_NUM
> DD_CLASS_TYPE_LEVEL_NAME

s/_NAME/_NAMES/  - the plural suggests list,comma-separated

s/(DISJOINT)_NUM/$1_BITS/  - strongly signals expected input form

LEVEL - while VERBOSE spoke to me, LEVEL has legacy: include/linux/kern_levels.h
LEVELS - pluralize ?
NUM - Im not crazy about, but it stands well in opposition to _BITS
