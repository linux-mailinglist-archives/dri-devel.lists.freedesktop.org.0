Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFCA01A2FC0
	for <lists+dri-devel@lfdr.de>; Thu,  9 Apr 2020 09:07:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2DD96EB4F;
	Thu,  9 Apr 2020 07:07:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E2BE6EB4F
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Apr 2020 07:07:38 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id z6so3040132wml.2
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Apr 2020 00:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=3fzlk+1a2b3q0EKRRkBiDFhrc/J/PvVywQ93uFwgEgk=;
 b=SFCS+RErUyseIyzdWmRg7SzDZMib4Xfg2GXUyA+nAt+SYSGs/E1Ed5M78k0qjfj4uG
 1h0es5fAaghIusxx0DGZw84ApN8oVuD8UmwsSjZvtRNYy6+JCL5FSe9W9tsQi+gKmBIs
 4g97B8u6ragxgWcFUotn0rOizq64hf2vkgLsA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=3fzlk+1a2b3q0EKRRkBiDFhrc/J/PvVywQ93uFwgEgk=;
 b=dtdgHSyhw00LlKFe7GwzAoSAq9s+4UPkD2Nz544CUYHa7j1o0M74dtDfFJELK7DZgs
 1l3DGaWDo8I7wPyB2UfcKIjqwCcuDg/+JQHzieBROSUg5FrdR0G8rJQuOeSodeSKc+Wv
 7e2nRf5JSDkrcP/MT3B6owO4LlYfCr7pZGJNGwt4GBRyhMD1B1EYbmmkpm521IUgQTe0
 rfPKZkbrJjbGzGeVRS0kCeP4pSboI0h4Npsk18TeQifiOQsa13U6CIfz6HukqjHnDhjt
 vtqR7a6EeO68LB60/BShFPmqfroPSSP+qlBTGE5XtJUU+jD+sZy14u/WhDRfgIyubaKx
 BtQA==
X-Gm-Message-State: AGi0PubDiZlWXEbh7OiC6pfU6Gr6JdwvkEAcb1EKewoUzEbT30PeKct/
 ADEwzHJK/xeA7PdVp9GtOmn1+w==
X-Google-Smtp-Source: APiQypJejUoX6TC2lyEVkPMafhE+khuYPp3is5HDsmNy2y6qcIUU0KFigHolaP5n7n03Cz1IWsvzbg==
X-Received: by 2002:a1c:dc8b:: with SMTP id t133mr8610965wmg.117.1586416056950; 
 Thu, 09 Apr 2020 00:07:36 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id h6sm2627936wmf.31.2020.04.09.00.07.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Apr 2020 00:07:36 -0700 (PDT)
Date: Thu, 9 Apr 2020 09:07:34 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH] drm/legacy: Fix type for drm_local_map.offset
Message-ID: <20200409070734.GP3456981@phenom.ffwll.local>
Mail-Followup-To: Linus Torvalds <torvalds@linux-foundation.org>,
 Nathan Chancellor <natechancellor@gmail.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
References: <20200402203317.GA34560@ubuntu-m2-xlarge-x86>
 <20200402215926.30714-1-chris@chris-wilson.co.uk>
 <20200403013420.GA11516@ubuntu-m2-xlarge-x86>
 <CAKMK7uE9pv23edViQBC=Jy5fQV=-NQTNdk1qi91Z8shpeuL7FA@mail.gmail.com>
 <CAHk-=whMhCTdx0fDRnNT4doKGYw1BBBei0KcXDZcmtVpk_GvEw@mail.gmail.com>
 <CAKMK7uE2t=z71dtJitmoKwrrZxgciEDRrNPMQ1FyiLO7s-VKag@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uE2t=z71dtJitmoKwrrZxgciEDRrNPMQ1FyiLO7s-VKag@mail.gmail.com>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 03, 2020 at 07:16:28PM +0200, Daniel Vetter wrote:
> On Fri, Apr 3, 2020 at 7:14 PM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > On Fri, Apr 3, 2020 at 1:29 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > >
> > > > Tested-by: Nathan Chancellor <natechancellor@gmail.com> # build
> > >
> > > This works too, missed it when replying to Linus
> > >
> > > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > >
> > > Linus I guess this one is better, but like I explained it really
> > > doesn't matter what we do with drm legacy code, it's a horror show
> > > that should be disabled on all modern distros anyway. We just keep it
> > > because of "never break old uapi".
> >
> > Ok, That patch from Chris looks fine to me too.
> >
> > dma_addr_t and resource_size_t aren't the same, but at least
> > dma_addr_t should always be the bigger one.
> >
> > And it does look like nothing else ever takes the address of this
> > field, so the ones that might want just the resource_size_t part will
> > at least have enough bits.
> >
> > So I think Chris' patch is the way to go. I'm assuming I'll get it
> > through the normal drm tree channels, this doesn't sound _so_ urgent
> > that I'd need to expedite that patch into my tree and apply it
> > directly.
> 
> Ok, sounds good.
> 
> Chris can you pls push this to drm-misc-next-fixes? That should be
> enough for the pull request train next week.

Ok I applied this now, seems to have fallen through a few cracks. Might
only make it after easter :-/
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
