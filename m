Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E010AA22BF3
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2025 11:50:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6F2A10E09A;
	Thu, 30 Jan 2025 10:50:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="CDDKwYPa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 242F610E923
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2025 10:50:32 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4364a37a1d7so6188475e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2025 02:50:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1738234230; x=1738839030; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WlIOJ9U3QA9sHWVQXA2SUvaDy201Q+tlYK7jAEa09Tg=;
 b=CDDKwYPa95Ul5Br34Bul0jYooGhubJWqSkunl6+un1mtJVka/bpEU6ibBh223wF7Xh
 1jQYRCs1fY4KT5MiPv9V0KKARVjezlS0B+VTiPS0rwCkHgFCni3DuBKk92UrFsHdH6d2
 MZZejrpC82sKGgyaYIsdGVFJRilCKEUK8z0Jw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738234230; x=1738839030;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WlIOJ9U3QA9sHWVQXA2SUvaDy201Q+tlYK7jAEa09Tg=;
 b=oc0sb3Oj9NDbbN26sWJuIHzCtLznFjFKWGa8fmvvdFYk2Q0XUzEMKZ8sVjpi55B4/z
 eDbCu7l6ixTMKK20kjzL3eUFiUnQtXRNnzmb+4JDatWeWUR+oj2oqeRlk7fe2cXpoWIK
 25el53H2EeoIaRm4B47UVtf33EScKYsPf2lsffiXPblHxRGyG/1fKGhP6wVNxkfQ10SM
 7wAg/ZWnMG2Z/g7xIAmQAcncBGrTyBGtAI1qE9+CtNwnnlne+up76wG1qsRZukUwHXNb
 abMLUQZ5Zsxp8oqV0zEB1CN65EDwYk2WCKyXoEQ9z7HXamD4kdAKms5HBkLFhZeSIClK
 dWjQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjQ2EZ6FPyf+09WtFVV580sFIPp/zC8uDSYTv9t99MgpHH07VafPvvSREPNEnUOYeiAmKCUnqIasU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwGO/Hjm3QDmS4iTVDeRlvcTN2fVoHklTq9+E9TChcrzAokTUwC
 rUZnfQej8PVmRuGwmJjVwAPW2mJWRp0foJnCkcIrDrFVGdikFWJVkTEnq/8WAV0=
X-Gm-Gg: ASbGncvYEzFJ89orvQueoGgsyXC7YUkaGSaSeFXLhQaPAfJQjZsVSNJkQChlvIGbbsE
 f5tH76I5YuBZPFW/MWm/+RFEXc8hWBu+5hYEjWJbE5ZUAXSFBqyu3DovzO21QGFqvGbB/yfUM03
 cl5vOUG6P1kBZskz82GlLgYZMxxLmqRqQuv7gOVu7/2Il6DSzJ4+j8+WTsJJ3CNHa6Q6rwVTVst
 xknQW+pupaP+N64sIsWLDwVAubP5M2Tnwa1qNQNRf6l7K/NtN9s7BylVCK+gTW/YTCSUYmsTvgM
 aRjMedXgrBox1rjJh0q1S5RPwOc=
X-Google-Smtp-Source: AGHT+IHMw0cYgOTvVvK6HIRKMLy20cgFzE3d4vlaCtti/GNUtg6PxQxKz8d7r2TT9CWFYzLA0t+WOA==
X-Received: by 2002:a05:600c:4e0c:b0:434:a386:6cf with SMTP id
 5b1f17b1804b1-438dc3a8faemr61859005e9.2.1738234230580; 
 Thu, 30 Jan 2025 02:50:30 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438dcc81d74sm54599715e9.37.2025.01.30.02.50.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jan 2025 02:50:29 -0800 (PST)
Date: Thu, 30 Jan 2025 11:50:27 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Yonatan Maman <ymaman@nvidia.com>, kherbst@redhat.com,
 lyude@redhat.com, dakr@redhat.com, airlied@gmail.com,
 simona@ffwll.ch, leon@kernel.org, jglisse@redhat.com,
 akpm@linux-foundation.org, GalShalom@nvidia.com,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-mm@kvack.org, linux-tegra@vger.kernel.org
Subject: Re: [RFC 1/5] mm/hmm: HMM API to enable P2P DMA for device private
 pages
Message-ID: <Z5tZc0OQukfZEr3H@phenom.ffwll.local>
Mail-Followup-To: Jason Gunthorpe <jgg@ziepe.ca>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Yonatan Maman <ymaman@nvidia.com>, kherbst@redhat.com,
 lyude@redhat.com, dakr@redhat.com, airlied@gmail.com,
 simona@ffwll.ch, leon@kernel.org, jglisse@redhat.com,
 akpm@linux-foundation.org, GalShalom@nvidia.com,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-mm@kvack.org, linux-tegra@vger.kernel.org
References: <20241201103659.420677-1-ymaman@nvidia.com>
 <20241201103659.420677-2-ymaman@nvidia.com>
 <7282ac68c47886caa2bc2a2813d41a04adf938e1.camel@linux.intel.com>
 <20250128132034.GA1524382@ziepe.ca>
 <de293a7e9b4c44eab8792b31a4605cc9e93b2bf5.camel@linux.intel.com>
 <20250128151610.GC1524382@ziepe.ca>
 <b78d32e13811ef1fa57b0535749c811f2afb4dcd.camel@linux.intel.com>
 <20250128172123.GD1524382@ziepe.ca>
 <Z5ovcnX2zVoqdomA@phenom.ffwll.local>
 <20250129134757.GA2120662@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250129134757.GA2120662@ziepe.ca>
X-Operating-System: Linux phenom 6.12.11-amd64 
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 29, 2025 at 09:47:57AM -0400, Jason Gunthorpe wrote:
> On Wed, Jan 29, 2025 at 02:38:58PM +0100, Simona Vetter wrote:
> 
> > > The pgmap->owner doesn't *have* to fixed, certainly during early boot before
> > > you hand out any page references it can be changed. I wouldn't be
> > > surprised if this is useful to some requirements to build up the
> > > private interconnect topology?
> > 
> > The trouble I'm seeing is device probe and the fundemantal issue that you
> > never know when you're done. And so if we entirely rely on pgmap->owner to
> > figure out the driver private interconnect topology, that's going to be
> > messy. That's why I'm also leaning towards both comparing owners and
> > having an additional check whether the interconnect is actually there or
> > not yet.
> 
> Hoenstely, I'd rather invest more effort into being able to update
> owner for those special corner cases than to slow down the fast path
> in hmm_range_fault..

I'm not sure how you want to make the owner mutable.

The only design that I think is solid is to evict all device private
memory, unregister the dev_pagemap and register a new one with the updated
owner. I think any other approach boils down to the same issue, except we
pretend it's easier and just ignore all the race conditions.

And I've looked at the lifetime fun of unregistering a dev_pagemap for
device hotunplug and pretty firmly concluded it's unfixable and that I
should run away to do something else :-P

An optional callback is a lot less scary to me here (or redoing
hmm_range_fault or whacking the migration helpers a few times) looks a lot
less scary than making pgmap->owner mutable in some fashion.

Cheers, Sima

> The notion is that owner should represent a contiguous region of
> connectivity. IMHO you can always create this, but I suppose there
> could be corner cases where you need to split/merge owners.
> 
> But again, this isn't set in stone, if someone has a better way to
> match the private interconnects without going to driver callbacks then
> try that too.
> 
> I think driver callbacks inside hmm_range_fault should be the last resort..
> 
> > You can fake that by doing these checks after hmm_range_fault returned,
> > and if you get a bunch of unsuitable pages, toss it back to
> > hmm_range_fault asking for an unconditional migration to system memory for
> > those. But that's kinda not great and I think goes at least against the
> > spirit of how you want to handle pci p2p in step 2 below?
> 
> Right, hmm_range_fault should return pages that can be used and you
> should not call it twice.
> 
> Jason

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
