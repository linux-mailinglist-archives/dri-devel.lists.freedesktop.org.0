Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D539D376854
	for <lists+dri-devel@lfdr.de>; Fri,  7 May 2021 17:53:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B36B6E288;
	Fri,  7 May 2021 15:53:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 827406E288
 for <dri-devel@lists.freedesktop.org>; Fri,  7 May 2021 15:53:54 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id m9so9780611wrx.3
 for <dri-devel@lists.freedesktop.org>; Fri, 07 May 2021 08:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=+4MhKiSAOaBSZ2e0f0C2//SWOf3tWAfCHwzMX/Loq+w=;
 b=dDC2ioa2p/PZMfhFE5RAjzJ/Z8CbnKiBAnKP5ZsR0acBSds+HRP1yH5rT3wrYFDV/I
 WadI+EeardjX9muzbLT8HAadUI8AWPemeh7hV6KhPbEK6Q6lflc1HDyEUhe3nXl/HAJx
 3yu35zTHp6SFgGvo42ByLYBvoO+wrbxxRtjVI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=+4MhKiSAOaBSZ2e0f0C2//SWOf3tWAfCHwzMX/Loq+w=;
 b=LeWQRvYY0X0jHEXqsF/aPZHXsaDvkRwS6tHYWg4bXAvBwSSGOtOJEgwWfXSwILsQ3I
 j+1A1JUZ9c88yvELmTupcMHz6h5FT2T8An3eNd0aQFHDP2VKm+5KAUBUzmrgH9rGfTQp
 S8UsbELmm8qPQpjiQq4bBSHMr7zSDtbsylgbN3hrsjO19Q/Q3UnqzMSoETj3Pxe0NCWB
 ulyyEV1G17uMnvHsVF1SW7zoawO0UVTTjhDU9vm+X04f3kUR/5ZAjm9dQtKLZrdHgVrR
 R0A12zQVPkrOLUvzgzb8KsfMCEJZSEGHlUmvhq+uGPPZnMRsXTGf6pkJ3RdpWtTddMPo
 xs3A==
X-Gm-Message-State: AOAM533jk87BMZbg8nEv5rOoDllSepjp+j32BfCap3TTx4QxerEaY/0I
 +Yy68exV8wM/50isqmPz5vA4QQ==
X-Google-Smtp-Source: ABdhPJzKCAJlfwDJjk5ry2+hiC8NsolPvCLFCMBs9dPYdX3bt1HsmTI6/Mti8w3xLs2d6fn0jOXVdg==
X-Received: by 2002:adf:df04:: with SMTP id y4mr13161189wrl.358.1620402833158; 
 Fri, 07 May 2021 08:53:53 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id g13sm8645777wrd.41.2021.05.07.08.53.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 May 2021 08:53:52 -0700 (PDT)
Date: Fri, 7 May 2021 17:53:50 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PULL] topic/iomem-mmap-vs-gup
Message-ID: <YJVijmznt1xnsCxc@phenom.ffwll.local>
Mail-Followup-To: Linus Torvalds <torvalds@linux-foundation.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Linux-MM <linux-mm@kvack.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 linux-samsung-soc@vger.kernel.org
References: <YJBHiRiCGzojk25U@phenom.ffwll.local>
 <CAHk-=wiwgOPQ+4Eaf0GD5P_GveE6vUHsKxAT=pMsjk1v_kh4ig@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wiwgOPQ+4Eaf0GD5P_GveE6vUHsKxAT=pMsjk1v_kh4ig@mail.gmail.com>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
Cc: linux-samsung-soc@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux-MM <linux-mm@kvack.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 06, 2021 at 03:30:45PM -0700, Linus Torvalds wrote:
> [ You had a really odd Reply-to on this one ]
> 
> On Mon, May 3, 2021 at 12:15 PM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> >
> > Anyway here's a small pull for you to ponder, now that the big ones are
> > all through.
> 
> Well, _now_ I'm all caught up. Knock wood. Anyway, time to look at it:
> 
> > Follow-up to my pull from last merge window: kvm and vfio lost their
> > very unsafe use of follow_pfn, this appropriately marks up the very
> > last user for some userptr-as-buffer use-cases in media. There was
> > some resistance to outright removing it, maybe we can do this in a few
> > releases.
> 
> Hmm. So this looks mostly ok to me, although I think the change to the
> nommu case is pretty ridiculous.
> 
> On nommu, unsafe_follow_pfn() should just be a wrapper around
> follow_pfn(). There's no races when you can't remap anything. No?
> 
> Do the two media cases even work on nommu?

So personally I think the entire thing should just be thrown out, it's all
levels of scary and we have zero-copy buffer sharing done properly with
dma-buf since years in v4l.

Iirc I've had that in some early versions of all this, but got nacked by
some, supported by others from media as something that needs to go away.
This here is now the next best thing as a fishing expedition to figure out
whether there's actually anyone left who cares or not.

That's also why the nommu case has the same checks, even though it's all
fine there.

Hopefully the answer is "no users" and then we could remove this in a year
or two.

> Finally - did you intend fo this to be a real pull request? Because
> the email read to me like "think about this and tell me what you
> think" rather than "please pull"..
> 
> And I have now fulfilled that "think about and tell me" part ;)

Ah yes I rushed this a bit between appreciating some local fires here at
work and left out the instructions :-)

Please pull or tell me whether you want the outright removal (like
Christoph Hellwig also wants).

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
