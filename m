Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C070A2DAA40
	for <lists+dri-devel@lfdr.de>; Tue, 15 Dec 2020 10:42:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9712489B8F;
	Tue, 15 Dec 2020 09:42:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3993389B8F
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 09:42:47 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id a109so18721235otc.1
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 01:42:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nrfZzU8i2XI5TReL11FPZCA/DbKh6MmkKEx+RvfbNo0=;
 b=dLTcIZbmqXjw8OiNhLJT1Ued66pU3oyhulfg+tGUp4w/1OLIaRLdvkLDV73Dh6gWu/
 6nRHfpqmnVVihgRe5iyrDWu3KY3QX72LyXXg7naKkSCK6vf0EYcpPipqwbpul7mILvbw
 6RfB7mRva/KJopM6kHFoYfm2Zt10K8sGCjrsk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nrfZzU8i2XI5TReL11FPZCA/DbKh6MmkKEx+RvfbNo0=;
 b=KVnG0q7waA8hRC6E9Fzq14fvTfanOP2GIKXl/Q8V/ECzUw/4JRBCq+7NG5PDEpiXXT
 A1e9dqsuwxRavivdXheP1DVSfNO3hs2zouEsRu30HOU80bt3ksuWfkVrhHPtoazCwxE0
 FZKFjOtHPZJXK5Ac1nddpkIr86wj65O7ILQpT+iHjXSrbrUjeCc+UYpzTbQAs/jaXlu2
 bCo6fLGH/+aWAfKwnf2/beqFKwdtLcFalq3rjHj6ByuMVs19USrzkT8ucRT53WYopnkg
 HyopDzrIYpMGTQQpmvPzHYA+xFmfVqSMcMCxcMsg9r6QTZiovA0BYRViZqcZjAl8xIJN
 r0QA==
X-Gm-Message-State: AOAM530vRb741DFbjWUA0tnlIbgjhLoxVZvBoCQV7a0dQKG4G4pK++Jm
 HvtmLtppVQzawigY2U8xOpMvoJthGYW9ph42Dx7EmA==
X-Google-Smtp-Source: ABdhPJzqz52kCcy3Sd/fp9IWZ2qXtHhaK/T3eI017Kprgk6vEXCoVAsTgaMPPVLtQ2gCS/U3TYMOqnT0/0cx+e7+SLU=
X-Received: by 2002:a9d:23ca:: with SMTP id t68mr22774532otb.281.1608025366091; 
 Tue, 15 Dec 2020 01:42:46 -0800 (PST)
MIME-Version: 1.0
References: <20201105175031.00e0b081@canb.auug.org.au>
 <20201116104444.044486ea@canb.auug.org.au>
 <20201215065045.66421c34@canb.auug.org.au>
 <20201215134702.37a12a03@canb.auug.org.au>
In-Reply-To: <20201215134702.37a12a03@canb.auug.org.au>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 15 Dec 2020 10:42:34 +0100
Message-ID: <CAKMK7uECzCHd-q5T4P8F02jppLP+kuMWc9Nznp-65kgKBGPSEg@mail.gmail.com>
Subject: Re: linux-next: build warnings after merge of the drm tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
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
Cc: Dave Airlie <airlied@linux.ie>, Thomas Zimmermann <tzimmermann@suse.de>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 15, 2020 at 3:47 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> On Tue, 15 Dec 2020 06:50:45 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > On Mon, 16 Nov 2020 10:44:44 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > >
> > > On Thu, 5 Nov 2020 17:50:31 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > > >
> > > > After merging the drm tree, today's linux-next build (htmldocs) produced
> > > > these warnings:
> > > >
> > > > include/linux/dma-buf-map.h:106: warning: Excess function parameter 'vaddr' description in 'DMA_BUF_MAP_INIT_VADDR'
> > > > include/linux/dma-buf-map.h:106: warning: Function parameter or member 'vaddr_' not described in 'DMA_BUF_MAP_INIT_VADDR'
> > > > include/linux/dma-buf-map.h:106: warning: Excess function parameter 'vaddr' description in 'DMA_BUF_MAP_INIT_VADDR'
> > > >
> > > > Introduced by commit
> > > >
> > > >   20e76f1a7059 ("dma-buf: Use struct dma_buf_map in dma_buf_vunmap() interfaces")
> > >
> > > I am still getting these warnings.
> >
> > I am still getting these warnings.
>
> These warnings are now from Linus' tree.

We had a stuck pull request which should have been included in the
main merge pull. This should be fixed now in drm-next. Well in a few
minutes when the compile testing is done.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
