Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D74D9A23185
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2025 17:09:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FDFE10E9A9;
	Thu, 30 Jan 2025 16:09:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="dpSKOgC6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8490710E9A9
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2025 16:09:49 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4361dc6322fso7243745e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2025 08:09:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1738253388; x=1738858188; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DHjECDXWr9DtzEWz0JXb8DxrPMtRT+1WnFwQ9T4qTYY=;
 b=dpSKOgC6QI62i9gw4CbPr9/y+tMNWBEX/lKXC/rApPeCgZ4Q6Ihx6ummAr5Sp5i6KZ
 lKYHLYnHQzw7CT7lctoqypYW0YNzl4Yh8jQzhtgTP9NPtSfF+7n43skylIn81Kn7vUdg
 mEqiOgjW6gALIiQEoa2wHzpfB8zFH7q/z35J0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738253388; x=1738858188;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DHjECDXWr9DtzEWz0JXb8DxrPMtRT+1WnFwQ9T4qTYY=;
 b=Y4jnY4dlqoBiWjr/CCWBeSvG9M6hpxxdsg62NdEDLYa73MKVE2hdy6UFuxwARWADZv
 bhAlKv466aGHx3swm3oHVqleWqWO4/ImnM0QPcCY9gAQMfSJJ2kYUnXnsQncaPj9Q6T1
 53vvvJaIDs3B7UclCNR1FOKCU2JRrQsEM5t//aAPXahYPV8OWilAAfsG+lQC3V6UeGc1
 1Z7pB7cdsC6ksvKlYLz01wqX4hN/CafuKWYaI6CgP70bL3pGo6MOznjNHMdUxe6HGzaW
 bYa0MBaU9XqXdFVi1oN6nOtBJYgY8Rat1n7wLi9AW/x6ArkuYrIl7HSxuFV0/oEbvC4R
 kalQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWb+5f2U9buyUrFS4TsNlwp+ZEAnHnSSl49yX0ehSOLfDHQfeUXXJ4WEEy/fPwl7URg8Rs0iPg3z1M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzll7bOqp1SBPrWesLQf2ateBmY4xJr0av3qRSDLEuJcVk5jbh4
 AirD2BS1zwEDMdyd4Qxk2BQhtuBUfXSeIJHSAXjxec+tMUYrE5ygxh/KeB0HFEU=
X-Gm-Gg: ASbGncsdXoHe5sQr6NGFte3pmLU2t30otSDJBDfFgkUeLBXpGTp7Z6L9uWIxjdAKtA8
 XfDePChAA3a16P3QntjIcDB77BO0UNPeKPxj2Rra+mOgoOMF+FN98thzYjUSDFUPm0vTGFb6/QC
 ieinMJiohG0RM37mvSC2FvCl23/qmLunf314DZc55/eP09bTJh2EhhRSeqz0spvoM663wB3kPrT
 TNb28aywh1L4eRUqXWhfDRFF1nc/pHpkMo23VQaNjeP7OaSHorh6x+pk4e3u0FCv8lp+qt+DVNd
 dHXxTbi2yOF/ccC9eTxgPub81zQ=
X-Google-Smtp-Source: AGHT+IHzkAlG33CPN/kMrEln846pAhOyRPiLkWV/nev8K+POyx7veXX/IQAiWwM1YsBE7oYiCeZW/A==
X-Received: by 2002:a05:600c:1e0d:b0:436:f960:3427 with SMTP id
 5b1f17b1804b1-438dc40ffbbmr65699075e9.22.1738253387756; 
 Thu, 30 Jan 2025 08:09:47 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438dcc2ef08sm64120395e9.22.2025.01.30.08.09.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jan 2025 08:09:46 -0800 (PST)
Date: Thu, 30 Jan 2025 17:09:44 +0100
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
Message-ID: <Z5ukSNjvmQcXsZTm@phenom.ffwll.local>
Mail-Followup-To: Jason Gunthorpe <jgg@ziepe.ca>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Yonatan Maman <ymaman@nvidia.com>, kherbst@redhat.com,
 lyude@redhat.com, dakr@redhat.com, airlied@gmail.com,
 simona@ffwll.ch, leon@kernel.org, jglisse@redhat.com,
 akpm@linux-foundation.org, GalShalom@nvidia.com,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-mm@kvack.org, linux-tegra@vger.kernel.org
References: <7282ac68c47886caa2bc2a2813d41a04adf938e1.camel@linux.intel.com>
 <20250128132034.GA1524382@ziepe.ca>
 <de293a7e9b4c44eab8792b31a4605cc9e93b2bf5.camel@linux.intel.com>
 <20250128151610.GC1524382@ziepe.ca>
 <b78d32e13811ef1fa57b0535749c811f2afb4dcd.camel@linux.intel.com>
 <20250128172123.GD1524382@ziepe.ca>
 <Z5ovcnX2zVoqdomA@phenom.ffwll.local>
 <20250129134757.GA2120662@ziepe.ca>
 <Z5tZc0OQukfZEr3H@phenom.ffwll.local>
 <20250130132317.GG2120662@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250130132317.GG2120662@ziepe.ca>
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

On Thu, Jan 30, 2025 at 09:23:17AM -0400, Jason Gunthorpe wrote:
> On Thu, Jan 30, 2025 at 11:50:27AM +0100, Simona Vetter wrote:
> > On Wed, Jan 29, 2025 at 09:47:57AM -0400, Jason Gunthorpe wrote:
> > > On Wed, Jan 29, 2025 at 02:38:58PM +0100, Simona Vetter wrote:
> > > 
> > > > > The pgmap->owner doesn't *have* to fixed, certainly during early boot before
> > > > > you hand out any page references it can be changed. I wouldn't be
> > > > > surprised if this is useful to some requirements to build up the
> > > > > private interconnect topology?
> > > > 
> > > > The trouble I'm seeing is device probe and the fundemantal issue that you
> > > > never know when you're done. And so if we entirely rely on pgmap->owner to
> > > > figure out the driver private interconnect topology, that's going to be
> > > > messy. That's why I'm also leaning towards both comparing owners and
> > > > having an additional check whether the interconnect is actually there or
> > > > not yet.
> > > 
> > > Hoenstely, I'd rather invest more effort into being able to update
> > > owner for those special corner cases than to slow down the fast path
> > > in hmm_range_fault..
> > 
> > I'm not sure how you want to make the owner mutable.
> 
> You'd probably have to use a system where you never free them until
> all the page maps are destroyed.
> 
> You could also use an integer instead of a pointer to indicate the
> cluster of interconnect, I think there are many options..

Hm yeah I guess an integer allocater of the atomic_inc kind plus "surely
32bit is enough" could work. But I don't think it's needed, if we can
reliable just unregister the entire dev_pagemap and then just set up a new
one. Plus that avoids thinking about which barriers we might need where
exactly all over mm code that looks at the owner field.

> > And I've looked at the lifetime fun of unregistering a dev_pagemap for
> > device hotunplug and pretty firmly concluded it's unfixable and that I
> > should run away to do something else :-P
> 
> ? It is supposed to work, it blocks until all the pages are freed, but
> AFAIK ther is no fundamental life time issue. The driver is
> responsible to free all its usage.

Hm I looked at it again, and I guess with the fixes to make migration to
system memory work reliable in Matt Brost's latest series it should indeed
work reliable. The devm_ version still freaks me out because of how easily
people misuse these for things that are memory allocations.

> > An optional callback is a lot less scary to me here (or redoing
> > hmm_range_fault or whacking the migration helpers a few times) looks a lot
> > less scary than making pgmap->owner mutable in some fashion.
> 
> It extra for every single 4k page on every user :\
> 
> And what are you going to do better inside this callback?

Having more comfy illusions :-P

Slightly more seriously, I can grab some locks and make life easier,
whereas sprinkling locking or even barriers over pgmap->owner in core mm
is not going to fly. Plus more flexibility, e.g. when the interconnect
doesn't work for atomics or some other funny reason it only works for some
of the traffic, where you need to more dynamically decide where memory is
ok to sit. Or checking p2pdma connectivity and all that stuff.

But we can also do all that stuff by checking afterwards or migrating
memory around as needed. At least for drivers who cooperate and all set
the same owner, which I think is Thomas' current plan.

Also note that fundamentally you can't protect against the hotunplug or
driver unload case for hardware access. So some access will go to nowhere
when that happens, until we've torn down all the mappings and migrated
memory out.
-Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
