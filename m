Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB24D29F416
	for <lists+dri-devel@lfdr.de>; Thu, 29 Oct 2020 19:29:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC9F96E5BD;
	Thu, 29 Oct 2020 18:29:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F04136E8E5
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Oct 2020 18:29:19 +0000 (UTC)
Received: by mail-oi1-x243.google.com with SMTP id x203so3992227oia.10
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Oct 2020 11:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2YEGmPn010/vYMzaj6qRl5Hb5QiGFxgfF70S5pCjqaY=;
 b=ItU1Zh6quO/xvOa9yeUVcquY8rNqFT4c8e16+gHeYtcTTXV9yrudTazA4XqcAfWN85
 YUWJwwfawV67EBgdMj4rDHcK96x40SW8efsBxtvZdf8+7keGbx0vtS21caLbhPQW1LZY
 SxyTr2MM/VCSHR0KPPEgcb2Dh9U6nuF9kye4o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2YEGmPn010/vYMzaj6qRl5Hb5QiGFxgfF70S5pCjqaY=;
 b=bp0j29K37nEJomp87kZbIU63KdhT541cv+E9PSsj/u28OpendshVToN7guhnJn201t
 xuq6ruxQ8ZpA0ENn7mttQRRCMMMNnHzoylSsrQEjhJxnBwkCO0cpZtt5AJRqsxzNAVhW
 YY3dugOwW7pwHhAbKwNrx6wNbmHeTrTWfunkgW2maX1hb1YnArrWU5Bz7EAwXELJLlJS
 Jtzs7SBDrdNWAcr1ZMaYg8lp51TW9bGOn49sTrEBeL+O3s1kg5DJFwh4gZdCYGylu2IY
 ikjAoqeTkJGxxwPHLRtNH1na6H7u6EJPx+cUolx2J+g7QXsgVq7yuVVXZ1KnYKmv0Pay
 pA7A==
X-Gm-Message-State: AOAM530m26KBxczwukgLakEfBKpNhrKHiCGs+UwoX1C40GKhqAilD8dw
 NKS8B3rsMoH8v5HO9ItUyuARoGBcFPJsHqlcH+UvOw==
X-Google-Smtp-Source: ABdhPJwMiaK/OUQkOqAwQzOpjSCGtNHgDhNxU2kvsMq/i6XOi2Z1vePWduXqumwr62trT7Fxf0JQRzArR3ej7dhJukU=
X-Received: by 2002:aca:39d6:: with SMTP id g205mr395026oia.14.1603996159293; 
 Thu, 29 Oct 2020 11:29:19 -0700 (PDT)
MIME-Version: 1.0
References: <0-v1-44733fccd781+13d-rm_scatterlist_max_jgg@nvidia.com>
 <20201028194911.GY401619@phenom.ffwll.local>
 <20201029182040.GB2620339@nvidia.com>
In-Reply-To: <20201029182040.GB2620339@nvidia.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 29 Oct 2020 19:29:07 +0100
Message-ID: <CAKMK7uESaX+ZrSpT2Yay_0OPGjpJpEm1vDMaQVVeczh7jaWECQ@mail.gmail.com>
Subject: Re: [PATCH] drm: Remove SCATTERLIST_MAX_SEGMENT
To: Jason Gunthorpe <jgg@nvidia.com>
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>, "Ursulin,
 Tvrtko" <tvrtko.ursulin@intel.com>, David Airlie <airlied@linux.ie>,
 Roland Scheidegger <sroland@vmware.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Qian Cai <cai@lca.pw>, Christoph Hellwig <hch@lst.de>,
 Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 29, 2020 at 7:20 PM Jason Gunthorpe <jgg@nvidia.com> wrote:
>
> On Wed, Oct 28, 2020 at 08:49:11PM +0100, Daniel Vetter wrote:
> > On Wed, Oct 28, 2020 at 04:15:26PM -0300, Jason Gunthorpe wrote:
> > > Since commit 9a40401cfa13 ("lib/scatterlist: Do not limit max_segment to
> > > PAGE_ALIGNED values") the max_segment input to sg_alloc_table_from_pages()
> > > does not have to be any special value. The new algorithm will always
> > > create something less than what the user provides. Thus eliminate this
> > > confusing constant.
> > >
> > > - vmwgfx should use the HW capability, not mix in the OS page size for
> > >   calling dma_set_max_seg_size()
> > >
> > > - i915 uses i915_sg_segment_size() both for sg_alloc_table_from_pages
> > >   and for some open coded sgl construction. This doesn't change the value
> > >   since rounddown(size, UINT_MAX) == SCATTERLIST_MAX_SEGMENT
> > >
> > > - drm_prime_pages_to_sg uses it as a default if max_segment is zero,
> > >   UINT_MAX is fine to use directly.
> > >
> > > Cc: Gerd Hoffmann <kraxel@redhat.com>
> > > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > > Cc: Thomas Hellstrom <thellstrom@vmware.com>
> > > Cc: Qian Cai <cai@lca.pw>
> > > Cc: "Ursulin, Tvrtko" <tvrtko.ursulin@intel.com>
> > > Suggested-by: Christoph Hellwig <hch@lst.de>
> > > Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> >
> > lgtm. Do you want to push this through some other queue, or should I put
> > this into drm trees? Prefer 5.10 or 5.11?
>
> I think DRM tree is best

Ok, I'll try to remember and apply this to -next after -rc2. -rc1 is
supremely busted for us, I want to wait with pulling the merge window
into the -next pile until that's settled. Please ping if your patch
isn't in linux-next within a week in case I forget.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
