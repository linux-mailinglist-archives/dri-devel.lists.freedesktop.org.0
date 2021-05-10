Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7C73791A2
	for <lists+dri-devel@lfdr.de>; Mon, 10 May 2021 16:55:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F59F89C96;
	Mon, 10 May 2021 14:55:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1262B89C96
 for <dri-devel@lists.freedesktop.org>; Mon, 10 May 2021 14:55:51 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id l6so16059906oii.1
 for <dri-devel@lists.freedesktop.org>; Mon, 10 May 2021 07:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AS9nf1QYyUIyVs6RoQO80MpiosKSnnivAT6Yx1y7KWk=;
 b=hmsr1/zRUNvK9mnHaZO5y60A+AHPfdNmIzBpb36meUCTFqPyF8BCSJoWzz+dwjMUBf
 sOjdtYrpYb+U2KZI8AgQCSNXM2B/sYEWnAXVW22VgufrTpS6Oub6U+k8pKNHLR9od9pY
 2JvWfGFLyMOvQgqNRMzpvCJTe8mmXm86mDSsk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AS9nf1QYyUIyVs6RoQO80MpiosKSnnivAT6Yx1y7KWk=;
 b=Wkuf0W8Agl79yj2gl8iarKinJGXhctxU/4sB0qbQrnGnFSvs1MzJkFF8pqXYHMg3Wi
 l4VaMbnGivRdTWJI72OAH7L1MMYhf/K/irX2fJVRtaPZcSybhXY/x+Qfslit7zoXRiIu
 13ap45WuH+0ZEdtGjkdh6QI29iSv0wyYYA5myxuIBRLAqyVR5wzqptpCl8Hap2NRuWSL
 XKs8z87dkc8d64I7uYj/rfOXMsi3q8P4VuNLPnACT5ghrIbHOFjP9mxJjZOhllv5Yq8o
 c9RPHfdK4YfHUAvsxEPC09wz/cHW59hSx4MEfH0wIl/b2538KVgsoLH20twVutCXtvwH
 ZYVA==
X-Gm-Message-State: AOAM531OVZS9GfqWfcrn4HlIQMaXf3+9kx0Nux3dyr7Be7jf9YpRFKI1
 hemRCHHPpXPgbGCwQW7cD9WjP+am7ohGcM50Uy3ltQ==
X-Google-Smtp-Source: ABdhPJwfEDQZPJA0WzNIzsQAkshxoJAbrMEAjUNsMGt80dwxzz47vaaAr7fiCJX7iaqPc8WdsMULsSopfEIfRAdTCGQ=
X-Received: by 2002:aca:df87:: with SMTP id
 w129mr18413978oig.128.1620658550366; 
 Mon, 10 May 2021 07:55:50 -0700 (PDT)
MIME-Version: 1.0
References: <YJBHiRiCGzojk25U@phenom.ffwll.local>
 <CAHk-=wiwgOPQ+4Eaf0GD5P_GveE6vUHsKxAT=pMsjk1v_kh4ig@mail.gmail.com>
 <YJVijmznt1xnsCxc@phenom.ffwll.local>
 <CAHk-=wgjO8-f1bUwQB=5HGzkvSS+aGACR9+H5CkkDhRgud+3MA@mail.gmail.com>
 <20210510135031.GF2047089@ziepe.ca>
In-Reply-To: <20210510135031.GF2047089@ziepe.ca>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Mon, 10 May 2021 16:55:39 +0200
Message-ID: <CAKMK7uFfN3p2fE1Xq47nOTtkPY2vm10GMvBaupQ9hgK0rS8sgQ@mail.gmail.com>
Subject: Re: [PULL] topic/iomem-mmap-vs-gup
To: Jason Gunthorpe <jgg@ziepe.ca>
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
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Tomasz Figa <tfiga@chromium.org>, Linux-MM <linux-mm@kvack.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 10, 2021 at 3:50 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
>
> On Sat, May 08, 2021 at 09:46:41AM -0700, Linus Torvalds wrote:
>
> > I think follow_pfn() is ok for the actual "this is not a 'struct page'
> > backed area", and disabling that case is wrong even going forward.
>
> Every place we've audited using follow_pfn() has been shown to have
> some use-after-free bugs like Daniel describes, and a failure to check
> permissions bug too.
>
> All the other follow_pfn() users were moved to follow_pte() to fix the
> permissions check and this shifts the use-after-free bug away from
> being inside an MM API and into the caller mis-using the API by, say,
> extracting and using the PFN outside the pte lock.
>
> eg look at how VFIO wrongly uses follow_pte():
>
> static int follow_fault_pfn()
>         ret = follow_pte(vma->vm_mm, vaddr, &ptep, &ptl);
>                 *pfn = pte_pfn(*ptep);
>         pte_unmap_unlock(ptep, ptl);
>
>         // no protection that pte_pfn() is still valid!
>         use_pfn(*pfn)
>
> v4l is the only user that still has the missing permissions check
> security bug too - so there is no outcome that should keep
> follow_pfn() in the tree.
>
> At worst v4l should change to follow_pte() and use it wrongly like
> VFIO. At best we should delete all the v4l stuff.

yeah vfio is still broken for the case I care about. I think there's
also some questions open still about whether kvm really uses
mmu_notifier in all cases correctly, but iirc the one exception was
s390, which didn't have pci mmap and that's how it gets away with that
specific problem.

> Daniel I suppose we missed this relation to follow_pte(), so I agree
> that keeping a unsafe_follow_pfn() around is not good.

tbh I never really got the additional issue with the missing write
checks. That users of follow_pfn (or well follow_pte + immediate lock
dropping like vfio) don't subscribe to the pte updates in general is
the bug I'm seeing. That v4l also glosses over the read/write access
stuff is kinda just the icing on the cake :-) It's pretty well broken
even if it would check that.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
