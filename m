Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05473280244
	for <lists+dri-devel@lfdr.de>; Thu,  1 Oct 2020 17:13:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C33DD6E21A;
	Thu,  1 Oct 2020 15:13:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27A0F6E8AF
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Oct 2020 15:13:37 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id n61so5727146ota.10
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Oct 2020 08:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gyqBR8rgovZvV1br57kzCLeVLh2BC1/nJFNuCWvX/Hg=;
 b=HWt7G37MzABEhEJzmhYn37I7HQ3nrxFri1BtglWKxVHv8+/mx3PgqLVDr8TJioVn6Z
 VBrO8lu+BrDDf++bBGjpolziIxr53jSkmw6Dl7y+ZEpC6tjtW8qYmqqcqaVVJlKnzxOQ
 dbBNgP25HQUrv/PQjs8tElcIUqDde1j02SHy8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gyqBR8rgovZvV1br57kzCLeVLh2BC1/nJFNuCWvX/Hg=;
 b=cQXgbsgAXqrsEcwNlF8LANESU+ZCfoA+PpgkjCOhdsJxW8XMcyN5TXb6fl6gXRNyNq
 ule5qA6duWbWFOw3b7f3BscczTtUjSBjhnyTocbcTtoJN5oZRoLcB8PhPj0zw/GZGIqW
 J+LwQfKxOpw7leTeJrxMjQ22k4Dl9uKeQBwlzbcH9fTYQujzdlWHoxnWj6EDOw4NLfd/
 nwKc5k4iFyL/OhymGjMuzZWj1KCOJJTDr5lxW/ZNvh3m9hMpE+QoOABD3l5GWRpxsFXO
 YV9m78dOWKi5iJascPkAsNFwjf83N7pZp7THzw8wdkETX+0nxVnCDbOxjZguWukgoz+w
 PlmA==
X-Gm-Message-State: AOAM531MZFEvlkZasGAyjWlf7QekSSJznQ332xY34aHAnmt7kKczcoXU
 29bc7kAr6u3J5AxnVpmUfZYx74czldDWGkz/mLvMcQ==
X-Google-Smtp-Source: ABdhPJwnkX4j2N+uVgeHBKZEsf4a1EiVhC8hXdATqgJLW5d3fzqdEPJfxlIxYzf9TYqPMnVDwuLs9HodRVSnVkw5BC0=
X-Received: by 2002:a9d:4b99:: with SMTP id k25mr5484928otf.281.1601565217247; 
 Thu, 01 Oct 2020 08:13:37 -0700 (PDT)
MIME-Version: 1.0
References: <20201001203917.43d46a3d@canb.auug.org.au>
 <20201001135350.GA14869@lst.de>
 <CAKMK7uFfBLsZ=wetii4bc+BTiKObD5DJ7B-kDO4am6AhBY+AhQ@mail.gmail.com>
 <87h7rem1aj.fsf@intel.com>
In-Reply-To: <87h7rem1aj.fsf@intel.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Thu, 1 Oct 2020 17:13:26 +0200
Message-ID: <CAKMK7uFOuFEOjrLGpB+oejs=J9kEvrRb6K9Ng6nBt+WS4gwKtQ@mail.gmail.com>
Subject: Re: linux-next: manual merge of the akpm tree with the drm-intel tree
To: Jani Nikula <jani.nikula@linux.intel.com>
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
 DRI <dri-devel@lists.freedesktop.org>, Chris Wilson <chris@chris-wilson.co.uk>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 1, 2020 at 5:08 PM Jani Nikula <jani.nikula@linux.intel.com> wrote:
>
> On Thu, 01 Oct 2020, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> > On Thu, Oct 1, 2020 at 3:53 PM Christoph Hellwig <hch@lst.de> wrote:
> >>
> >> On Thu, Oct 01, 2020 at 08:39:17PM +1000, Stephen Rothwell wrote:
> >> > Hi all,
> >> >
> >> > Today's linux-next merge of the akpm tree got a conflict in:
> >> >
> >> >   drivers/gpu/drm/i915/gem/i915_gem_pages.c
> >> >
> >> > between commit:
> >> >
> >> >   4caf017ee937 ("drm/i915/gem: Avoid implicit vmap for highmem on x86-32")
> >> >   ba2ebf605d5f ("drm/i915/gem: Prevent using pgprot_writecombine() if PAT is not supported")
> >
> > Uh these patches shouldn't be in linux-next because they're for 5.11,
> > not the 5.10 merge window that will open soon. Joonas?
>
> I don't know anything else, but both are tagged Cc: stable.

Uh right I got confused, they're on -fixes now. Well -next-fixes,
which seems like the wrong one for a cc: stable, I guess this should
go into 5.9 even. Apologies for my confusion.
-Daniel

>
> BR,
> Jani.
>
> >
> >> > from the drm-intel tree and patch:
> >> >
> >> >   "drm/i915: use vmap in i915_gem_object_map"
> >> >
> >> > from the akpm tree.
> >> >
> >> > I fixed it up (I just dropped the changes in the former commits) and
> >>
> >> Sigh.  The solution is a bit more complicated, but I just redid my
> >> patches to not depend on the above ones.  I can revert back to the old
> >> version, though.  Andrew, let me know what works for you.
> >
> > Imo ignore, rebasing onto linux-next without those intel patches was
> > the right thing for the 5.10 merge window.
> > -Daniel
>
> --
> Jani Nikula, Intel Open Source Graphics Center



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
