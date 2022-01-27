Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ABEE249DE9D
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 11:00:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97CF210EF6D;
	Thu, 27 Jan 2022 10:00:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9ED210EF6D
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 10:00:19 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id e8so3818369wrc.0
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 02:00:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=dj+Wxdz6jJyNZo3oThjdxQEE66JUp4dziKqN/pwvYhw=;
 b=YpQltIzwqQUIZLwJV9b7TpxpNtLjJFOUUFaDuIY26pQRByLg/xUO0XcNO1hXuzgrtv
 aXl2Ea2ymMN7sHKA1BKyX7TuvIs+MfmbCx1sApsh3bpKknTlQ9SWaixDSnqHtxqdTSri
 E4CRr7QEGLltTYA32aqiK2eD9wBeb86J4/dhY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=dj+Wxdz6jJyNZo3oThjdxQEE66JUp4dziKqN/pwvYhw=;
 b=6eEM6J/5G3XgsfNZKSYp6rrwDsk3LQfAsYfaMHjjgfFElYtsv+vuQET7O8tPzWrWHh
 ubuXrO9fKYXKS7pZuR3ouXRrqqhbXrM7nK+1nxWj/AFxAYCURK8F8CU26Knx/QYU5D3v
 DIsybUA/EcpD5TG2Wex/6WNktCTTOQyDG6mnDvG7TtHkj+GehpdOEWB+u2spGCYC70Ec
 Hf8hqSU3FTZZQgEPPdS6A1aT1NcwUbAYVqiCoCv1rwwExzwNFj3lFdhRZmd2bR3diCbU
 mJfkrnY7obFyJQ8vu3SSeLrBXriSKrV3lo23rDZfFlVEOj8waOm+25J7PjjX66DrJ3i/
 VFtQ==
X-Gm-Message-State: AOAM532FnisoboIzoVVItuM6oES4Hp1cZrL+vmVQ+WhQfo2IS+f0xffY
 pAETZmvbdBsCkyya2k5WxsA68w==
X-Google-Smtp-Source: ABdhPJyZcMRUfkbUyRjJW3Arq9MAqFzUEFnjmUGAvJqKbxi8qGWFKt2XXxgNxptn90NiYH0fbc4aFA==
X-Received: by 2002:a5d:55c3:: with SMTP id i3mr2307961wrw.537.1643277618288; 
 Thu, 27 Jan 2022 02:00:18 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id i2sm1843836wmq.23.2022.01.27.02.00.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 02:00:17 -0800 (PST)
Date: Thu, 27 Jan 2022 11:00:14 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [Intel-gfx] [PATCH 02/19] dma-buf-map: Add helper to initialize
 second map
Message-ID: <YfJtLkdkh4yde20f@phenom.ffwll.local>
Mail-Followup-To: Lucas De Marchi <lucas.demarchi@intel.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
References: <20220126203702.1784589-1-lucas.demarchi@intel.com>
 <20220126203702.1784589-3-lucas.demarchi@intel.com>
 <f0dbdcc0-13b5-c484-0bf3-a1f8c3e48954@amd.com>
 <20220127075728.ygwgorhnrwaocdqv@ldmartin-desk2>
 <3066c6a7-fc73-d34d-d209-a3ff6818dfb6@amd.com>
 <YfJedaoeJjE3grum@phenom.ffwll.local>
 <20220127093332.wnkd2qy4tvwg5i5l@ldmartin-desk2>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220127093332.wnkd2qy4tvwg5i5l@ldmartin-desk2>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 27, 2022 at 01:33:32AM -0800, Lucas De Marchi wrote:
> On Thu, Jan 27, 2022 at 09:57:25AM +0100, Daniel Vetter wrote:
> > On Thu, Jan 27, 2022 at 09:02:54AM +0100, Christian König wrote:
> > > Am 27.01.22 um 08:57 schrieb Lucas De Marchi:
> > > > On Thu, Jan 27, 2022 at 08:27:11AM +0100, Christian König wrote:
> > > > > Am 26.01.22 um 21:36 schrieb Lucas De Marchi:
> > > > > > When dma_buf_map struct is passed around, it's useful to be able to
> > > > > > initialize a second map that takes care of reading/writing to an offset
> > > > > > of the original map.
> > > > > >
> > > > > > Add a helper that copies the struct and add the offset to the proper
> > > > > > address.
> > > > >
> > > > > Well what you propose here can lead to all kind of problems and is
> > > > > rather bad design as far as I can see.
> > > > >
> > > > > The struct dma_buf_map is only to be filled in by the exporter and
> > > > > should not be modified in this way by the importer.
> > > >
> > > > humn... not sure if I was  clear. There is no importer and exporter here.
> > > 
> > > Yeah, and exactly that's what I'm pointing out as problem here.
> > > 
> > > You are using the inter driver framework for something internal to the
> > > driver. That is an absolutely clear NAK!
> > > 
> > > We could discuss that, but you guys are just sending around patches to do
> > > this without any consensus that this is a good idea.
> > 
> > Uh I suggested this, also we're already using dma_buf_map all over the
> > place as a convenient abstraction. So imo that's all fine, it should allow
> > drivers to simplify some code where on igpu it's in normal kernel memory
> > and on dgpu it's behind some pci bar.
> > 
> > Maybe we should have a better name for that struct (and maybe also a
> > better place), but way back when we discussed that bikeshed I didn't come
> > up with anything better really.
> 
> I suggest iosys_map since it abstracts access to IO and system memory.
> 
> > 
> > > > There is a role delegation on filling out and reading a buffer when
> > > > that buffer represents a struct layout.
> > > >
> > > > struct bla {
> > > >     int a;
> > > >     int b;
> > > >     int c;
> > > >     struct foo foo;
> > > >     struct bar bar;
> > > >     int d;
> > > > }
> > > >
> > > >
> > > > This implementation allows you to have:
> > > >
> > > >     fill_foo(struct dma_buf_map *bla_map) { ... }
> > > >     fill_bar(struct dma_buf_map *bla_map) { ... }
> > > >
> > > > and the first thing these do is to make sure the map it's pointing to
> > > > is relative to the struct it's supposed to write/read. Otherwise you're
> > > > suggesting everything to be relative to struct bla, or to do the same
> > > > I'm doing it, but IMO more prone to error:
> > > >
> > > >     struct dma_buf_map map = *bla_map;
> > > >     dma_buf_map_incr(map, offsetof(...));
> > 
> > Wrt the issue at hand I think the above is perfectly fine code. The idea
> > with dma_buf_map is really that it's just a special pointer, so writing
> > the code exactly as pointer code feels best. Unfortunately you cannot make
> > them typesafe (because of C), so the code sometimes looks a bit ugly.
> > Otherwise we could do stuff like container_of and all that with
> > typechecking in the macros.
> 
> I had exactly this code above, but after writting quite a few patches
> using it, particularly with functions that have to write to 2 maps (see
> patch 6 for example), it felt much better to have something to
> initialize correctly from the start
> 
> 	struct dma_buf_map other_map = *bla_map;
> 	/* poor Lucas forgetting dma_buf_map_incr(map, offsetof(...)); */
> 
> is error prone and hard to debug since you will be reading/writting
> from/to another location rather than exploding
> 
> While with the construct below
> 
> 	other_map;
> 	...
> 	other_map = INITIALIZER()
> 
> I can rely on the compiler complaining about uninitialized var. And
> in most of the cases I can just have this single line in the beggining of the
> function when the offset is constant:
> 
> 	struct dma_buf_map other_map = INITIALIZER(bla_map, offsetof(..));

Hm yeah that's a good point that this allows us to rely on the compiler to
check for uninitialized variables.

Maybe include the above (with editing, but keeping the examples) in the
kerneldoc to explain why/how to use this? With that the concept at least
has my

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

I'll leave it up to you & Christian to find a prettier color choice for
the naming bikeshed.
-Daniel

> 
> Lucas De Marchi
> 
> > -Daniel
> > 
> > > > IMO this construct is worse because at a point in time in the function
> > > > the map was pointing to the wrong thing the function was supposed to
> > > > read/write.
> > > >
> > > > It's also useful when the function has double duty, updating a global
> > > > part of the struct and a table inside it (see example in patch 6)
> > > >
> > > > thanks
> > > > Lucas De Marchi
> > > 
> > 
> > -- 
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
