Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65AB219D1E4
	for <lists+dri-devel@lfdr.de>; Fri,  3 Apr 2020 10:12:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58A266EB25;
	Fri,  3 Apr 2020 08:12:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26ABF6EB25
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Apr 2020 08:12:27 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id e4so5358568oig.9
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Apr 2020 01:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3ymTJVtUxBUPQPt/DjBQudCk2SDBLtq2q0vAVeHEhjU=;
 b=MLIeXrP5vfs5pP0srG+5v4SHJhfyQO53bs//r28tSH5Z9+XMQzqZKd5isNZPnGtaVA
 3cZRtIeOcaLBJRSQYypEbgbwY7mwZoRbBLKquFYBAGV9toZtODL6tslmFISYdlp5rKTK
 DOJ5dJQ6DrOlklAY8LMbdgHc8DfcHyurH1bqY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3ymTJVtUxBUPQPt/DjBQudCk2SDBLtq2q0vAVeHEhjU=;
 b=ONpQebz9CfZBYcrgwHkaSmXkoQWB2XSmgpPxuJeXxDx/0n8vN3HI6UE2JHCR2ckbGc
 STPhzhoSeOsS5i4Uzn59DHmCCuv71WafMwEIqS50EqJivkC6IWdpi3nY2YOY/jUXJmh/
 AYIIfChiaRsuxA0v/FsiCpadz3RSbqHTn7LwBFKbgnuwiuAUPlsq8M3krpXlx7540GrM
 Hwv2cWHjUnOcgFrEgkWJIlauJNSD5jYN0Z64lwXWutKwWtI+4Qx+5ETnjvRNAncr+J+A
 ylspeVCuURb654sZcQVe80AaQzcrlmwEeYuSa4xXHCCJG+jqYOSbbvJz1rmNctzLiyhe
 I6Hw==
X-Gm-Message-State: AGi0Pua4GJIHpROAY2czsllSgFqfmGDBuMJCmHGoyA9X+lKG1Qw6xlp3
 mRScdFbPV6bJr1g5KAhWipfdYiyets77PibJvQi2Yg==
X-Google-Smtp-Source: APiQypLRxxLFI6qTSkiV0Pf6uGsAY0VtZxtzNnd9fFv8py//ecV5Oqx7DayfYPDR5/wP+uzeQY0CO8aRmlpOvO9fB58=
X-Received: by 2002:aca:aac1:: with SMTP id t184mr2170657oie.14.1585901546393; 
 Fri, 03 Apr 2020 01:12:26 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9twza_DeycOEhT+u6Erh0yFTAUe447J6bxWCLq5+QW8ZaA@mail.gmail.com>
 <20200402203317.GA34560@ubuntu-m2-xlarge-x86>
 <CAHk-=wjHEOHCf7kAOJOY9bOr9O0CRzxds+8YcXVVGbMZ+7kyXg@mail.gmail.com>
In-Reply-To: <CAHk-=wjHEOHCf7kAOJOY9bOr9O0CRzxds+8YcXVVGbMZ+7kyXg@mail.gmail.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Fri, 3 Apr 2020 10:12:15 +0200
Message-ID: <CAKMK7uH+vX=eh17-m9mL17QQ1uxjfDEcdj-tno-fAYA4Z1+Jag@mail.gmail.com>
Subject: Re: [git pull] drm for 5.7-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>
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
Cc: Nathan Chancellor <natechancellor@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 2, 2020 at 10:43 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Thu, Apr 2, 2020 at 1:33 PM Nathan Chancellor
> <natechancellor@gmail.com> wrote:
> >
> > This fixes it but I am not sure if it is proper or not (could be
> > problematic if CONFIG_PHYS_ADDR_T_64BIT is set but
> > CONFIG_ARCH_DMA_ADDR_T_64BIT is not, not sure if that is possible) so I
> > figured I'd report it and let you guys deal with it.
>
> Yeah, no, that patch can't be right.
>
> From your build failure, your configuration has dma_addr_t being a
> 'long long unsigned int', and map->offset being a resource_size_t is
> for just a 'unsigned int'. Casting 'unsigned int *' to 'unsigned long
> long *' is not valid.
>
> You'd have to do something like
>
>         dma_addr_t temp;
>
> and pass the address of *that* in, and then assign that to map->offset
> (and verify that it fits), I think.
>
> That's kind of what the old code did.
>
> Or alternatively, the 'offset' field should just be of type
> 'dma_addr_t' instead (see include/drm/drm_legacy.h). But I didn't
> check if something else wants it to be a resource_size_t.

This is all exclusive in legacy code back from the days when drm
drivers where shared with *bsd. None of that code ever learned that
there's maybe a difference between dma/phys/virtual address sizes, and
that's about the least of the problems it has.

Revert seems to be clean, I'd vote for that. And maybe we instead try
to push these horrors more under the CONFIG_DRM_LEGACY. I'll try to
remember to do that, afaics the only thing outside are the
drm_pci_alloc/free multi-layered wrappers in drm_pci.c.

Linus, can you pls push the revert yourself, to avoid build bot
breakage for longer than necessary?

Thanks, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
