Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8C1A36ED5E
	for <lists+dri-devel@lfdr.de>; Thu, 29 Apr 2021 17:26:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA6386E283;
	Thu, 29 Apr 2021 15:26:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49A546EF2E
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Apr 2021 15:26:23 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id w3so100527625ejc.4
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Apr 2021 08:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Pf/h3mnOYat+nNcpGwM91u4ZkeyrExIWmARWxp9oEto=;
 b=xoPSHv+bK5e6yG7rx82qEwX6XBGOGZXBWb4NxawZO+PRU4oPU9SSSoLSdyhZmhh3xY
 gvMjL//iQpuLSMerhfoWFDfjn4JBxl3L5PTR+kZCpxxXlBRlK0dNTnzHsTJ0rqJuiaSV
 NV59b3Za9Wu9kDpO82ylpTZaG8WCOfi7rF8ZC8ZqI4Sre5/LKX7Gmt5DqrwGpcnIihNq
 92PPWzbsUwAi04mGaEegkUmdaz4MubKB5ix1l0Kl+vTNF0Zcn/KMrtnRNB4B2EI592lq
 1k66eLnLQ9llaQfvNA72pw3IUMlnqoE06Pg85B22vy4LAwXfsDpvXyOLs8bJAF6QY5x0
 6H1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Pf/h3mnOYat+nNcpGwM91u4ZkeyrExIWmARWxp9oEto=;
 b=lAwRdH5WiwIRkbioXvj7v9LU1jtTr2TLeFWEHocRctKfcmjdopOeCSUXxDX6oh5oMI
 K1eJ/PcJdNDRpolIP+XTNrnJcHu/p6iNqZAiIiEajnvqT9RNbXYBBIzCi4q1jL826WwH
 h64zyp+FpXFVY0p4RdB2d4eFLxCIqwTt0jAmD4rxbvzBGuYzs8OPr2hRrEXwI7bYn5Xj
 /h/Zh+jpRDbPPBiQmUPPya+TUG065qyhlWl2Qp25LE+7+VRp99WK29eCWSSaGPL6Jyv1
 5pBkLDs1MJFjX6f8zwlBmtIBUd1hRZV7AYjaLuqdXjGppQ8TuExypCLmopnl48u2dQza
 44lw==
X-Gm-Message-State: AOAM533moV90VjDm/DShgCpy/q6TeK1wetJ3kplJaemphxOPsSGDIsIu
 K4YJ0YNJr1p9O7pvqnlItF8K6o8arzBucvB8dWEtcw==
X-Google-Smtp-Source: ABdhPJx4o80yIyAuDbPbCaYRas6U932ZHMTBpMbG29sOE205mK5DC82Gz9kTifq0vuV9DEL6s4ig3MgiP49c6h//GUg=
X-Received: by 2002:a17:906:dc90:: with SMTP id
 cs16mr411619ejc.210.1619709980644; 
 Thu, 29 Apr 2021 08:26:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210423223131.879208-1-jason@jlekstrand.net>
 <20210423223131.879208-16-jason@jlekstrand.net>
 <YIqook/gsI/w9OXf@phenom.ffwll.local>
In-Reply-To: <YIqook/gsI/w9OXf@phenom.ffwll.local>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Thu, 29 Apr 2021 10:26:08 -0500
Message-ID: <CAOFGe97zKtvD8y_v_cZM8FYHmP1AkuP6im6XeSPYFpSe4af4Rg@mail.gmail.com>
Subject: Re: [PATCH 15/21] drm/i915/gt: Drop i915_address_space::file
To: Daniel Vetter <daniel@ffwll.ch>
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
Cc: Intel GFX <intel-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 29, 2021 at 7:37 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Fri, Apr 23, 2021 at 05:31:25PM -0500, Jason Ekstrand wrote:
> > There's a big comment saying how useful it is but no one is using this
> > for anything.
> >
> > Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
>
> I was trying to find anything before all your deletions, but alas nothing.
> I did spent a bit of time on this, and discovered that the debugfs use was
> nuked in
>
> db80a1294c23 ("drm/i915/gem: Remove per-client stats from debugfs/i915_gem_objects")
>
> After going through quite a few iterations, e.g.
>
> 5b5efdf79abf ("drm/i915: Make debugfs/per_file_stats scale better")
> f6e8aa387171 ("drm/i915: Report the number of closed vma held by each context in debugfs")
>
> The above removed the need for vm->file because stats debugfs file
> filtered using stats->vm instead of stats->file.
>
> History goes on until the original introduction of this (again for
> debugfs) in
>
> 2bfa996e031b ("drm/i915: Store owning file on the i915_address_space")

I've added the following to the commit message:

    It was added in 2bfa996e031b ("drm/i915: Store owning file on the
    i915_address_space") and used for debugfs at the time as well as telling
    the difference between the global GTT and a PPGTT.  In f6e8aa387171
    ("drm/i915: Report the number of closed vma held by each context in
    debugfs") we removed one use of it by switching to a context walk and
    comparing with the VM in the context.  Finally, VM stats for debugfs
    were entirely nuked in db80a1294c23 ("drm/i915/gem: Remove per-client
    stats from debugfs/i915_gem_objects")


> > ---
> >  drivers/gpu/drm/i915/gem/i915_gem_context.c |  9 ---------
> >  drivers/gpu/drm/i915/gt/intel_gtt.h         | 10 ----------
> >  drivers/gpu/drm/i915/selftests/mock_gtt.c   |  1 -
> >  3 files changed, 20 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > index 7929d5a8be449..db9153e0f85a7 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > @@ -921,17 +921,10 @@ static int gem_context_register(struct i915_gem_context *ctx,
> >                               u32 *id)
> >  {
> >       struct drm_i915_private *i915 = ctx->i915;
> > -     struct i915_address_space *vm;
> >       int ret;
> >
> >       ctx->file_priv = fpriv;
> >
> > -     mutex_lock(&ctx->mutex);
> > -     vm = i915_gem_context_vm(ctx);
> > -     if (vm)
> > -             WRITE_ONCE(vm->file, fpriv); /* XXX */
> > -     mutex_unlock(&ctx->mutex);
> > -
> >       ctx->pid = get_task_pid(current, PIDTYPE_PID);
> >       snprintf(ctx->name, sizeof(ctx->name), "%s[%d]",
> >                current->comm, pid_nr(ctx->pid));
> > @@ -1030,8 +1023,6 @@ int i915_gem_vm_create_ioctl(struct drm_device *dev, void *data,
> >       if (IS_ERR(ppgtt))
> >               return PTR_ERR(ppgtt);
> >
> > -     ppgtt->vm.file = file_priv;
> > -
> >       if (args->extensions) {
> >               err = i915_user_extensions(u64_to_user_ptr(args->extensions),
> >                                          NULL, 0,
> > diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.h b/drivers/gpu/drm/i915/gt/intel_gtt.h
> > index e67e34e179131..4c46068e63c9d 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_gtt.h
> > +++ b/drivers/gpu/drm/i915/gt/intel_gtt.h
> > @@ -217,16 +217,6 @@ struct i915_address_space {
>
> Pls also delete the drm_i915_file_private pre-dcl in this file.

Done!

> With this added and the history adequately covered in the commit message:
>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Thanks

--Jason


>
> >       struct intel_gt *gt;
> >       struct drm_i915_private *i915;
> >       struct device *dma;
> > -     /*
> > -      * Every address space belongs to a struct file - except for the global
> > -      * GTT that is owned by the driver (and so @file is set to NULL). In
> > -      * principle, no information should leak from one context to another
> > -      * (or between files/processes etc) unless explicitly shared by the
> > -      * owner. Tracking the owner is important in order to free up per-file
> > -      * objects along with the file, to aide resource tracking, and to
> > -      * assign blame.
> > -      */
> > -     struct drm_i915_file_private *file;
> >       u64 total;              /* size addr space maps (ex. 2GB for ggtt) */
> >       u64 reserved;           /* size addr space reserved */
> >
> > diff --git a/drivers/gpu/drm/i915/selftests/mock_gtt.c b/drivers/gpu/drm/i915/selftests/mock_gtt.c
> > index 5c7ae40bba634..cc047ec594f93 100644
> > --- a/drivers/gpu/drm/i915/selftests/mock_gtt.c
> > +++ b/drivers/gpu/drm/i915/selftests/mock_gtt.c
> > @@ -73,7 +73,6 @@ struct i915_ppgtt *mock_ppgtt(struct drm_i915_private *i915, const char *name)
> >       ppgtt->vm.gt = &i915->gt;
> >       ppgtt->vm.i915 = i915;
> >       ppgtt->vm.total = round_down(U64_MAX, PAGE_SIZE);
> > -     ppgtt->vm.file = ERR_PTR(-ENODEV);
> >       ppgtt->vm.dma = i915->drm.dev;
> >
> >       i915_address_space_init(&ppgtt->vm, VM_CLASS_PPGTT);
> > --
> > 2.31.1
> >
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
