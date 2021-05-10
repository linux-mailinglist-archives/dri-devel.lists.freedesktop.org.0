Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 60C8F378E41
	for <lists+dri-devel@lfdr.de>; Mon, 10 May 2021 15:50:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89BAF6E440;
	Mon, 10 May 2021 13:50:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA98E6E440
 for <dri-devel@lists.freedesktop.org>; Mon, 10 May 2021 13:50:34 +0000 (UTC)
Received: by mail-qk1-x72d.google.com with SMTP id f29so3074453qka.0
 for <dri-devel@lists.freedesktop.org>; Mon, 10 May 2021 06:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=+2U891pcT5PFaAL7+dZJNGYBFLIb+qctBvykRURXgBY=;
 b=dACYFzmZp5FCubbaz661EkjXMEr4yIw8M3uTK3Kyf9WGXPYwdZw+Te0aQwLTIgwwC2
 IcIyUfISzla30F1Y5z5YNyfFMSuvpPToFEKyFwyWyzNO8J90FAq4FSLctkLmbUnqXieu
 lMQ7sIa6zzDWNW+3ZAA/Ywi2wnST8RvZfOXC1jXTR/nDU/u1OUAIwV5METsf0kVOPHrk
 PIuKStNqOQCBo7BK5+duLO5e2wBIi32E+Rgu2kNOG2SYryYXUN5IAmaJPspud5x7d6Vf
 5XGHOc/1cpdW83EDoXATbw25gMJUpTl30B68jCIFcCNIzm8fMivAz/aG2nH3kKyIFqz2
 KzIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+2U891pcT5PFaAL7+dZJNGYBFLIb+qctBvykRURXgBY=;
 b=i0zfNvoHIMn6ORahI4dRLmvhdkZhZZBdxv1pNJO0xaFfHeansnhfOA/x3paLbozW6g
 Ha4SB5DWb/XwbUJVvnCGknFM0Yw1lCLsOtBWLilP5nPgCmNuO5IL4qWwo1fagabWOLw5
 i0m3PXidZ+FDTVTU1fzMexeoLjjSyaGUTfCHCAnDAInYAP5dIE5xhDsek+/FB7hyazXG
 m++QuFpGOFjIgOWhCmzvdwL6O3m64H1Yeu3ow2aix0koQZ/hQf5q1W/5R3tT+e+ya1n0
 lw0aS4JqyyDjL/DFKeNRrJNJL14OdwSW7BIxH7bPRBrJV9X2gENfBfIgWc/MC6rlZI5q
 3lOQ==
X-Gm-Message-State: AOAM532C1DRnO3lP+FrmWl9dxIvHIaXjAAMC2mYL6yZe6XrQvIrPZmVf
 91sTTmvvjvTDKa9UnG1Wo2gTww==
X-Google-Smtp-Source: ABdhPJzBvEXIq3ZKj83MNPLUEszsweYjMFeVQA7SyU/yis3HOqTzVmEhu9DH0fP04ViEgC4gr5a3yA==
X-Received: by 2002:a05:620a:4543:: with SMTP id
 u3mr22610464qkp.118.1620654633736; 
 Mon, 10 May 2021 06:50:33 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-47-55-113-94.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [47.55.113.94])
 by smtp.gmail.com with ESMTPSA id e7sm11644631qth.27.2021.05.10.06.50.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 May 2021 06:50:32 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1lg6Ip-004ZFk-QY; Mon, 10 May 2021 10:50:31 -0300
Date: Mon, 10 May 2021 10:50:31 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PULL] topic/iomem-mmap-vs-gup
Message-ID: <20210510135031.GF2047089@ziepe.ca>
References: <YJBHiRiCGzojk25U@phenom.ffwll.local>
 <CAHk-=wiwgOPQ+4Eaf0GD5P_GveE6vUHsKxAT=pMsjk1v_kh4ig@mail.gmail.com>
 <YJVijmznt1xnsCxc@phenom.ffwll.local>
 <CAHk-=wgjO8-f1bUwQB=5HGzkvSS+aGACR9+H5CkkDhRgud+3MA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wgjO8-f1bUwQB=5HGzkvSS+aGACR9+H5CkkDhRgud+3MA@mail.gmail.com>
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
Cc: linux-samsung-soc@vger.kernel.org,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Tomasz Figa <tfiga@chromium.org>, Linux-MM <linux-mm@kvack.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, May 08, 2021 at 09:46:41AM -0700, Linus Torvalds wrote:

> I think follow_pfn() is ok for the actual "this is not a 'struct page'
> backed area", and disabling that case is wrong even going forward.

Every place we've audited using follow_pfn() has been shown to have
some use-after-free bugs like Daniel describes, and a failure to check
permissions bug too.

All the other follow_pfn() users were moved to follow_pte() to fix the
permissions check and this shifts the use-after-free bug away from
being inside an MM API and into the caller mis-using the API by, say,
extracting and using the PFN outside the pte lock.

eg look at how VFIO wrongly uses follow_pte():

static int follow_fault_pfn()
        ret = follow_pte(vma->vm_mm, vaddr, &ptep, &ptl);
                *pfn = pte_pfn(*ptep);
        pte_unmap_unlock(ptep, ptl);

        // no protection that pte_pfn() is still valid!
        use_pfn(*pfn)

v4l is the only user that still has the missing permissions check
security bug too - so there is no outcome that should keep
follow_pfn() in the tree.

At worst v4l should change to follow_pte() and use it wrongly like
VFIO. At best we should delete all the v4l stuff.

Daniel I suppose we missed this relation to follow_pte(), so I agree
that keeping a unsafe_follow_pfn() around is not good.

Regards,
Jason
