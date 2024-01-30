Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 139AA84218A
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jan 2024 11:39:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8067510F85E;
	Tue, 30 Jan 2024 10:39:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C915F10F85E
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jan 2024 10:39:32 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-a30e898db99so88509366b.0
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jan 2024 02:39:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1706611111; x=1707215911; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=q0DpHsp78524WTcdq3ZlObN34BwE3mZw0kMPMavoOX4=;
 b=AyksSxdvmI4FyrS+vgzOOAiko1uR6PbkHVd+bC/bggGNc6mWrHm1Ps8ueg9U3GgvtG
 Pq5JqEayOLQPABabGvMfFRVgzGxp328bh9/QkPSTpeBUNU0med1UwB+axoj2A2qNmMmT
 c6OLzBas2gIayafixkdU0b9055Rlfgh4zAZ60=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706611111; x=1707215911;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=q0DpHsp78524WTcdq3ZlObN34BwE3mZw0kMPMavoOX4=;
 b=UV71ZNdn33xQ06sQqOOSY7rroqZXrBmFyNNWn5xaHLRNY2MfAnEsAkn5AAWaJCkjKa
 x531xuEC304joDJxqGFlEy8JEOTYkfL0tLbQnXldVK9t3ZSa/Oc4NdG2LxDjIsrY0vPq
 yGTyKx+zBc9+xidN1OPvPHg2KGY57uhOLgGD5Fi9JaK0jm7nTaztdsll2f9o8ww70oLm
 Za/Ijwr8U0u6HNJOc6syiaBlX87hepQKFJGvg7hFhdFn7q2HkXLWwm2mcUWnvTS+H9TV
 lor9i4ixMmMdoks8+NnewBl1IUPLyyEgp6Nm0WM2X1aAS9i9r9vKJ28KJiOPVHN2DKwY
 t5DQ==
X-Forwarded-Encrypted: i=0;
 AJvYcCVpkCZ3CxKS4yeliA+2J2/BL1brTI59/SuyhobeaHWbisFVORIRZ8szA5depRsCWFbQsNusfNkW4Im9W1hNqSWcJFybMkYHXDx4h69VEpFK
X-Gm-Message-State: AOJu0YxisPolIYbIVvFJNHsBkqHJU9gP3bWWGkqePbol1OOjghM6dF0U
 PaarrEJ2x1L/gLMaMmx/CYOVYfRJB3eliuD6I8txPhjdn9ygTmc98e+hGgpxQLE=
X-Google-Smtp-Source: AGHT+IGOdGiExTeKnmBCfXOvsiugsDOp4x/n9iwmfZrcr5SM95YNybe4aCyt7LzfW61YerkaMsSHkg==
X-Received: by 2002:a17:906:c0c6:b0:a34:4c5e:40db with SMTP id
 bn6-20020a170906c0c600b00a344c5e40dbmr6071192ejb.4.1706611111218; 
 Tue, 30 Jan 2024 02:38:31 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 cx1-20020a170907168100b00a354d25da36sm3704061ejd.83.2024.01.30.02.38.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jan 2024 02:38:30 -0800 (PST)
Date: Tue, 30 Jan 2024 11:38:28 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [Linaro-mm-sig] Re: [PATCH v5 1/6] dma-buf: Add
 dma_buf_{begin,end}_access()
Message-ID: <ZbjRpDemivdBJaSN@phenom.ffwll.local>
Mail-Followup-To: Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, 
 Paul Cercueil <paul@crapouillou.net>,
 Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Jonathan Cameron <jic23@kernel.org>,
 Nuno =?iso-8859-1?Q?S=E1?= <noname.nuno@gmail.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 linux-usb@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Christoph Hellwig <hch@lst.de>
References: <e4620acdf24628d904cedcb0030d78b14559f337.camel@crapouillou.net>
 <85a89505-edeb-4619-86c1-157f7abdd190@amd.com>
 <0fe2755fb320027234c086bcc88fd107855234c5.camel@crapouillou.net>
 <577501f9-9d1c-4f8d-9882-7c71090e5ef3@amd.com>
 <7928c0866ac5b2bfaaa56ad3422bedc9061e0f7b.camel@crapouillou.net>
 <2ac7562c-d221-409a-bfee-1b3cfcc0f1c6@amd.com>
 <ZbKiCPhRvWaz4Icn@phenom.ffwll.local>
 <c97e38ee-b860-4990-87f1-3e59d7d9c999@amd.com>
 <Zbi6zQYtnfOZu5Wh@phenom.ffwll.local>
 <a2346244-e22b-4ff6-b6cd-1da7138725ae@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a2346244-e22b-4ff6-b6cd-1da7138725ae@amd.com>
X-Operating-System: Linux phenom 6.6.11-amd64 
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
Cc: linaro-mm-sig@lists.linaro.org,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 linux-usb@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Christoph Hellwig <hch@lst.de>, Paul Cercueil <paul@crapouillou.net>,
 Nuno =?iso-8859-1?Q?S=E1?= <noname.nuno@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Jonathan Cameron <jic23@kernel.org>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 30, 2024 at 10:23:03AM +0100, Christian König wrote:
> Am 30.01.24 um 10:01 schrieb Daniel Vetter:
> > On Fri, Jan 26, 2024 at 05:42:50PM +0100, Christian König wrote:
> > > [SNIP]
> > > Well I think we should have some solution, but I'm not sure if it should be
> > > part of DMA-buf.
> > > 
> > > Essentially a DMA-buf exports the buffers as he uses it and the importer (or
> > > the DMA-buf subsystem) is then the one who says ok I can use this or I can't
> > > use this or I need to call extra functions to use this or whatever.
> > > 
> > > It's not the job of the exporter to provide the coherency for the importer,
> > > cause otherwise we would have a lot of code in the exporter which can only
> > > be tested when you have the right importer around. And I strongly think that
> > > this is a no-go for having a reliable solution.
> > The trouble is, that if you have other memory than stuff allocated by the
> > dma-api or mapped using the dma-api, then by necessity the exporter has to
> > deal with this.
> 
> Yes, I was thinking about that as well.
> 
> > Which is the exact same reason we also force the exporters to deal with
> > the cpu cache flushing - you're argument that it's not great to replicate
> > this everywhere holds there equally.
> 
> And I'm not really happy with that either.
> 
> > The other thing is that right now the exporter is the only one who
> > actually knows what kind of dma coherency rules apply for a certain piece
> > of memory. E.g. on i915-gem even if it's dma_map_sg mapped the underlying
> > i915-gem buffer might be non-coherent, and i915-gem makes it all work by
> > doing the appropriate amount of clflush.
> 
> Yeah, exactly that's the reason why I think that this stuff doesn't belong
> into exporters/drivers.
> 
> Looking at what kind of hacks and workarounds we have in both amdgpu as well
> as i915 it's pretty clear that we need to improve this design somehow.

Yeah it's been a well-known issue, and we've very slowly improved things.

> > Similar funky things happen in other cases.
> > 
> > So unless we add an interface which allows importers to figure out how
> > much flushing is needed, currently the exporter is the only one who knows
> > (because it can inspect the struct device at dma_buf_attach time).
> > 
> > We could flip this around, but it would be a rather serious depature from
> > the dma-buf design approach thus far.
> 
> Well clients already give the DMA-direction to exporters when creating the
> mapping and get an appropriate sg_table in return.
> 
> All we need to do is getting the information what flushing is needed into
> the object returned here so that the DMA API can work with it.

So the problem is that we can provide this information from exporters that
do device specific stuff. But we cannot get this information from
exporters which just use the dma-api, whether it's dma_alloc or
dma_map_sg, because the core design principle of the dma-api is to hide
the coherency rules for device dma.

The idea is that you have the same ip on different socs, where on one the
soc needs cache flushing and on the other you dont (because different
architecture, or just the ip being connected to different interconnects),
you can use the exact same driver since the dma-api hides all this.

And at least every time it was discussed in the past, dma-api maintainers
insisted that we don't break this abstraction rule. Which means for most
exporters, we simply do not have this information available. This is also
why after epic long discussions it was decided that cache coherency was
the exporter's problem, so that from an importer pov there's no difference
between an sg list optained through dma_buf_map and an sg list obtained
from dma_map_sg or memory allocated with dma_alloc - in none of these
cases does the driver have to do its own cache management.

> Christoph Hellwig pretty much nailed it when he said that the problem with
> the sg_table is that it mixes input and output parameters of the DMA-API.

Hm my take away from these discussions was that sg as a data structure is
not a clean design, but I haven't ever seen Christoph (or anyone else from
the dma-api side) say that they're ok with leaking cache coherency
management to clients.

We couldn't even get the core arch primitives exported to drivers so that
dma-buf exporters could do the right cache management for their driver
specific allocators that entirely bypass the dma-api. I think what you're
suggesting would go way beyond that.

> I would extend that and say that we need a mapping object the DMA-API can
> work with so that it can know what needs to be done when devices request
> that data is made coherent between them or the CPU.

Personally I do think it makes sense as a design and iirc we discussed it
plenty in the early dma-buf discussions. I just don't think it's a
realistic design approach to upstream.

I think best we can hope for is a new set of device2device sync functions
in the dma_sg_sync_for* family of functions, so that on platforms where
syncing for cpu access requires cache flushes, but going from one device
to the next doesn't we could avoid some unecessary flushing. Currently
there's no way to do that and we have to pessimistically flush for cpu
coherency with the dma-api. Or suffer from device2device coherency issues
on funky platforms.

> > > That's why I think the approach of having DMA-buf callbacks is most likely
> > > the wrong thing to do.
> > > 
> > > What should happen instead is that the DMA subsystem provides functionality
> > > which to devices which don't support coherency through it's connection to
> > > say I want to access this data, please make sure to flush the appropriate
> > > catches. But that's just a very very rough design idea.
> > > 
> > > This will become more with CXL at the horizon I think.
> > Yeah CXL will make this all even more fun, but we are firmly there already
> > with devices deciding per-buffer (or sometimes even per-access with
> > intel's MOCS stuff) what coherency mode to use for a buffer.
> > 
> > Also arm soc generally have both coherent and non-coherent device
> > interconnects, and I think some devices can switch with runtime flags too
> > which mode they use for a specific transition.
> > 
> > CXL just extends this to pcie devices.
> > 
> > So the mess is here, how do we deal with it?
> 
> I would say we start with the DMA-API by getting away from sg_tables to
> something cleaner and state oriented.

Imo that's a tangential distraction. Definitely would be great to untangle
that data structure, but I don't think that gets us any closer to getting
the coherency information out of the dma-api abstraction that we'd like to
have.

That part has been an extremely firm "no" every time we asked.

> > My take is that the opt-in callback addition is far from great, but it's
> > in line with how we extended dma-buf the past decade plus too. So unless
> > someone's volunteering to pour some serious time into re-engineering this
> > all (including testing all the different device/driver<->device/driver
> > interactions) I think there's only really one other option: To not support
> > these cases at all. And I don't really like that, because it means people
> > will hack together something even worse in their drivers.
> > 
> > By adding it to dma-buf it'll stare us in our faces at least :-/
> 
> Yeah, it's the way of the least resistance. But with CXL at the horizon and
> more and more drivers using it I think it's predictable that this will
> sooner or later blow up.

I know, it's kinda been blowing up already.

My prediction is that the best we can get out of the dma-api is a new
device2device sync, while all the coherency details are still 100% hidden
behind the dma-api. And even that is probably going to take years.

Cheers, Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
