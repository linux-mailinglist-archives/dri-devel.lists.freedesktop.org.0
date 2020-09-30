Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F7D827F170
	for <lists+dri-devel@lfdr.de>; Wed, 30 Sep 2020 20:37:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 230266E7E6;
	Wed, 30 Sep 2020 18:37:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7919E6E372
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Sep 2020 18:37:36 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id m12so2854392otr.0
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Sep 2020 11:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GZokKNgMejCKfo0F2vRKE9nImzYNSzp/HUH90Pr6PJU=;
 b=Iz7k38YFYItPAO2RtiflnlRb5+BDWfPx9FQCvvU2f8SdCl7V1y7fJW6E60irWiBOlQ
 fH9GEK1n0pwT4bpaxG/cqFn7l9Zse+u3/d1Pt4ggVZd6tM3YSzezV3iBWBtU9IY/SgXQ
 GGeYqXdFFnSWXcgBytqYXCxu9xUWTpvQgSvlA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GZokKNgMejCKfo0F2vRKE9nImzYNSzp/HUH90Pr6PJU=;
 b=N3jw2ZgkQ/dltKxn9Yy34L7DueSnOiO3TVNAngRutUyU7iGcdQZoZ5AlZCv8XapClc
 3WDQO3XpvPy8PQlvkVp1yhMMDTlwVB7PQAnBZCn76zySFhM74YEgm5eGVwL7h5bhfHhq
 JpQuxBFpAau1dB/DFbA3RpDaIEg6v8nIoCFAliSnYDJg2A/sf8llWGz/XDABYFXh3JzL
 pJT/iMrzg4DQGgCQ7lDi2+YiMbiR6Qow7Djse+qEUfa2z51woTHyNAKgWZdlGpWbvUsX
 jQdg8xZcZV9UeMtDnXGStYOMVrEYbLrm741euaAVI8vI6i71JSPlK2cKXUMt2G1GMquH
 z/Kg==
X-Gm-Message-State: AOAM531wmngHNCXnl4iqCAwId8JwucBTzb2cXm+QMJU2tvKYSCBZpaPg
 kiRl0gsm2NckGliVBmiXINE+i26SVUXDyWIeNCiO0w==
X-Google-Smtp-Source: ABdhPJzmG8KuipdmIEStVjCt4k/yD8YpcM6mVrZ29T55c3684BNdLJdgOsz6wDtmq5u1TIJFW1qJF02gBOu8zFVEiX4=
X-Received: by 2002:a05:6830:14d9:: with SMTP id
 t25mr2508122otq.188.1601491055725; 
 Wed, 30 Sep 2020 11:37:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200924135853.875294-1-hch@lst.de>
 <20200925194349.d0ee9dbedb2ec48f0bfcd2ec@linux-foundation.org>
 <20200926062959.GA3427@lst.de>
 <160128801808.6464.1013594053120198786@jlahtine-mobl.ger.corp.intel.com>
 <20200928123741.GA4999@lst.de>
 <160138340987.15771.13645983702040612672@jlahtine-mobl.ger.corp.intel.com>
 <20200930144839.GA897@lst.de>
In-Reply-To: <20200930144839.GA897@lst.de>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 30 Sep 2020 20:37:24 +0200
Message-ID: <CAKMK7uE98o-ELvPZ0YVWjrVWgESVEEz5OSexA_qU64qemihyRg@mail.gmail.com>
Subject: Re: remove alloc_vm_area v2
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
Cc: David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>, Linux MM <linux-mm@kvack.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Stefano Stabellini <sstabellini@kernel.org>, X86 ML <x86@kernel.org>,
 Matthew Wilcox <willy@infradead.org>, Peter Zijlstra <peterz@infradead.org>,
 Matthew Auld <matthew.auld@intel.com>,
 "moderated list:DRM DRIVERS FOR XEN" <xen-devel@lists.xenproject.org>,
 Nitin Gupta <ngupta@vflare.org>, intel-gfx <intel-gfx@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Minchan Kim <minchan@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 30, 2020 at 4:48 PM Christoph Hellwig <hch@lst.de> wrote:
>
> On Tue, Sep 29, 2020 at 03:43:30PM +0300, Joonas Lahtinen wrote:
> > Hmm, those are both committed after our last -next pull request, so they
> > would normally only target next merge window. drm-next closes the merge
> > window around -rc5 already.
> >
> > But, in this specific case those are both Fixes: patches with Cc: stable,
> > so they should be pulled into drm-intel-next-fixes PR.
> >
> > Rodrigo, can you cherry-pick those patches to -next-fixes that you send
> > to Dave?
>
> They still haven't made it to linux-next.  I think for now I'll just
> rebase without them again and then you can handle the conflicts for
> 5.11.

Yeah after -rc6 drm is frozen for features, so anything that's stuck
in subordinate trees rolls over to the next merge cycle. To avoid
upsetting sfr from linux-next we keep those -next branches out of
linux-next until after -rc1 again. iow, rebasing onto linux-next and
smashing this into 5.10 sounds like the right approach (since everyone
else freezes a bunch later afaik).

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
