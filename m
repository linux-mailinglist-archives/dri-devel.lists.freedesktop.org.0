Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE72228010D
	for <lists+dri-devel@lfdr.de>; Thu,  1 Oct 2020 16:13:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 520826E8A3;
	Thu,  1 Oct 2020 14:13:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc41.google.com (mail-oo1-xc41.google.com
 [IPv6:2607:f8b0:4864:20::c41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C51F36E8A2
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Oct 2020 14:13:53 +0000 (UTC)
Received: by mail-oo1-xc41.google.com with SMTP id m25so1512208oou.0
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Oct 2020 07:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=us8thQANzunB8liJvtH1u9KjYvMWBCN/6ee+Pda/bWA=;
 b=HOsJWxDxB4xVjDfa1aZ5JJBMlRAfvVPFyyu2Rh+RQ2NPZaSZofBx1uadVQmfF+1xHE
 01o0lELbi++17LNc25VmGKUpiJmoJKu0Q67QKXYMG3vp5iZ34cn9XKsV4Vpfa3wk0h8a
 XkCxyWk1iGK/n7KrvdNWIv3phDHesCb4MRubs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=us8thQANzunB8liJvtH1u9KjYvMWBCN/6ee+Pda/bWA=;
 b=fAU8GP9k1PuY9dHk0CNZECRQZAp18PJRHwstzlZrpvc+W8+RDwJIU2txM7jArLXHdN
 kqIZv505S8WAaRTssjUjRG945UXeVuDNQQiNlB8CfdMLkONj2jWcrFPQCKUHBUiVzESx
 Z1eW//PTUGkgOeSwuEz4WnvwJCX1lgeW5tP/6cKrkhCLe5D2kOxPaCcFVDHEZjmdW3bP
 WdWY3t7X7Dy8LziT0XmCsUtT4BJyoMOpPH/s1yh8yvQtKkIU6g/N4WbAT8n7DzxnDM05
 KtZ6ptw8oaqFAb9dQDxtmq3dXzXafOAa5Np8w2nAv9Dq5odfyaj0/PDS2//CiETM5Pim
 Uy+Q==
X-Gm-Message-State: AOAM530EgMq960+AfwQ5BwAn2fQRcmWg7Vj9LWV/uxMtNhfasIzk+r9v
 h3LKnkysdkD9p/ytdt4gXXW36hECnrqqpPW8AD8cmQ==
X-Google-Smtp-Source: ABdhPJy+Qa1QnyOeGpgz2tEALV5zV/r+Mw/i+fe/ScEgQVuLKXLkdkccDTrTDmW6x67TiI0MqOdlBgeDXl3v04GVz3k=
X-Received: by 2002:a4a:344b:: with SMTP id n11mr5774966oof.89.1601561633049; 
 Thu, 01 Oct 2020 07:13:53 -0700 (PDT)
MIME-Version: 1.0
References: <20201001203917.43d46a3d@canb.auug.org.au>
 <20201001135350.GA14869@lst.de>
In-Reply-To: <20201001135350.GA14869@lst.de>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Thu, 1 Oct 2020 16:13:42 +0200
Message-ID: <CAKMK7uFfBLsZ=wetii4bc+BTiKObD5DJ7B-kDO4am6AhBY+AhQ@mail.gmail.com>
Subject: Re: linux-next: manual merge of the akpm tree with the drm-intel tree
To: Christoph Hellwig <hch@lst.de>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Dave Airlie <airlied@linux.ie>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 1, 2020 at 3:53 PM Christoph Hellwig <hch@lst.de> wrote:
>
> On Thu, Oct 01, 2020 at 08:39:17PM +1000, Stephen Rothwell wrote:
> > Hi all,
> >
> > Today's linux-next merge of the akpm tree got a conflict in:
> >
> >   drivers/gpu/drm/i915/gem/i915_gem_pages.c
> >
> > between commit:
> >
> >   4caf017ee937 ("drm/i915/gem: Avoid implicit vmap for highmem on x86-32")
> >   ba2ebf605d5f ("drm/i915/gem: Prevent using pgprot_writecombine() if PAT is not supported")

Uh these patches shouldn't be in linux-next because they're for 5.11,
not the 5.10 merge window that will open soon. Joonas?

> > from the drm-intel tree and patch:
> >
> >   "drm/i915: use vmap in i915_gem_object_map"
> >
> > from the akpm tree.
> >
> > I fixed it up (I just dropped the changes in the former commits) and
>
> Sigh.  The solution is a bit more complicated, but I just redid my
> patches to not depend on the above ones.  I can revert back to the old
> version, though.  Andrew, let me know what works for you.

Imo ignore, rebasing onto linux-next without those intel patches was
the right thing for the 5.10 merge window.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
