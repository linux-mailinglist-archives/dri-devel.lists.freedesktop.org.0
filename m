Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E7759BA3F
	for <lists+dri-devel@lfdr.de>; Mon, 22 Aug 2022 09:28:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01EF4112760;
	Mon, 22 Aug 2022 07:28:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1FB9112420
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Aug 2022 07:28:11 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id d16so6749469wrr.3
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Aug 2022 00:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc; bh=ig8Sal00pMqONkuMTGhloswktHWuvDocUhsxgCHguRE=;
 b=Um3Z44QQEkrMvPiJehz/dygeie90EMvI4nNVfRGgWB2tXDwgrHVgkQP9ZjwEPFWNoo
 igMFpUld2+eq9wR4dYNP3D53FyRt4M5wB8DTXqES6GA/3M+qbhSP3xSXs7WJDlfRY+Q5
 JWQbHYXQjUWi6i6ygsTDwF0hmohT+/oL7hAW3OzDBu3mSuDfs0qGEr5YLwNl8/huwxR3
 IKoQxV0WPM73nXITBN+ZOcmtb4/UUlEXJC3MHcsUal/oTcy/GlU+L3zbwFDsO/PR9BYB
 0PA7BJXJcM0GwxE/QXs6njaYWBp5HuHt442dxW8Vk6atYrLRWi+FljRuT++kO0hheKzI
 ZKPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc;
 bh=ig8Sal00pMqONkuMTGhloswktHWuvDocUhsxgCHguRE=;
 b=Bn/PgnFOmhzoj6T75mwkd9zfBr3yiprrGX17bbQxa1JTaW4PZbxyU/7ehkVPJkhfti
 2iG0eGACkq/IFABDGCedmyAeLdABSnSKXBA7rUEC5FSLtPu58DsNubrbYluLSoMyJ/91
 gdegAIcRJj/G6Rp0sFc/t2JE4jvZRRGZFlkrW4Zd1Sr7Ons7mO5oW7GNzcOqpo2VHQbG
 0/wIb0s8U0ZEXEgFH574HsL5yJ9pDuodG/w+4YMB5GDcxMAIgKjBrlHmbNiy3fvVFfYD
 mTJhHTllnLOxhM+JRRCRFgpBjQ0u12SU0X7R4Q8byS1v3GjKiAJM8q80+bS6OWoOZhVj
 YYAw==
X-Gm-Message-State: ACgBeo2pS8QijEzQ6dTIAVp2yOWg1cp3VxZEEVBUJmvmd46LBQ6Ibmr2
 1POySU26SQT7Y/am9mUmHgWnqrH1sQikd/IKp1Fl25zv
X-Google-Smtp-Source: AA6agR76hRRs3fJupemF4VV+Yuen69Mar6v0LeHecJluUj5pOKschkucXjBbxPML5FXILHB76AyCWo3hstXUbD5KB0Q=
X-Received: by 2002:adf:f7ca:0:b0:225:2df0:d23 with SMTP id
 a10-20020adff7ca000000b002252df00d23mr10072705wrq.255.1661153289880; Mon, 22
 Aug 2022 00:28:09 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tzo4n7xKnU+2=gesdLqDJUQ7kBAVCQND6yu5_CTiKo7Cg@mail.gmail.com>
In-Reply-To: <CAPM=9tzo4n7xKnU+2=gesdLqDJUQ7kBAVCQND6yu5_CTiKo7Cg@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Mon, 22 Aug 2022 17:27:57 +1000
Message-ID: <CAPM=9twwdeybb_hwvtqbyic3CHYe3+s1LLnT0t_DJAVi9cno4g@mail.gmail.com>
Subject: Re: vm binding interfaces and parallel with mmap
To: dri-devel <dri-devel@lists.freedesktop.org>, 
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, 
 Jason Ekstrand <jason@jlekstrand.net>, Matthew Brost <matthew.brost@intel.com>,
 Ben Skeggs <skeggsb@gmail.com>, Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
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

On Mon, 22 Aug 2022 at 17:05, Dave Airlie <airlied@gmail.com> wrote:
>
> Hey,
>
> I've just been looking at the vm bind type interfaces and wanted to at
> least document how we think the unmapping API should work. I know I've
> talked on irc before about this, but wanted to solidify things a bit
> more around what is required vs what is a nice to have.
>
> My main concerns/thoughts are around the unbind interfaces and how
> close to munmap they should be.
>
> I think the mapping operation is mostly consistent
> MAP(bo handle, offset into bo, range, VM offset, VM flags)
> which puts the range inside to bo at the offset in the current VM
> (maybe take an optional vm_id).
>
> now the simplest unmap I can see if one that parallel munmap
> UNMAP(vmaddr, range);
>
> But it begs the question on then how much the kernel needs to deal
> with here, if we support random vmaddr,range then we really need to be
> able to do everything munmap does for CPU VMA, which means splitting
> ranges, joining ranges etc.
>
> like
> MAP(1, 0, 0x8000, 0xc0000)
> UNMAP(0xc1000, 0x1000)
> should that be possible?
>
> Do we have any API usage (across Vulkan/CL/CUDA/ROCm etc) that
> requires this sort of control, or should we be fine with only
> unmapping objects exactly like how they were mapped in the first
> place, and not have any splitting/joining?

I suppose it also asks the question around paralleling

fd = open()
ptr = mmap(fd,)
close(fd)
the mapping is still valid.

I suppose our equiv is
handle = bo_alloc()
gpu_addr = vm_bind(handle,)
gem_close(handle)
is the gpu_addr still valid does the VM hold a reference on the kernel
bo internally.

Dave.
>
> Dave.
