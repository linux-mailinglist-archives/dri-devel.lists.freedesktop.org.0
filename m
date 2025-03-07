Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C2AA56537
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 11:28:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6052410EB2D;
	Fri,  7 Mar 2025 10:28:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="V6Kmow79";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFB2110EB2D
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Mar 2025 10:28:42 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-43bcbdf79cdso10136975e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Mar 2025 02:28:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1741343320; x=1741948120; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KLOoQkl6hkv1bWsp3aSpxVd+aCFLRfs2J3JgKPuyRtU=;
 b=V6Kmow796k2F5XLgOSjybMG/QZYLFa/1liQAffMUYTKBmb6lgZ/okalVm7mZBdermX
 W/JwYFE/3x0JYjCkh7388rs3PZmil0jWFllu0G2x20fw0B/WwqkN8x+Zln0TPpLLQkc6
 /7MdaEsU7GFl/03+hlQke6g7lYwsN1EHyrN1Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741343320; x=1741948120;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KLOoQkl6hkv1bWsp3aSpxVd+aCFLRfs2J3JgKPuyRtU=;
 b=rTPIqd6iROkodmIXmQra4JVGfZ4evw5js0Em1rdfx0UwUpA+f+RvVL2BJ1ejU4K9Fc
 Hyp1Ma2R+ecq0Xwc5jjSu++dwlBv5E5YCKRKA52CmIEwDJzjyIp1BiKzm3dUz9npvSaa
 QwBXeC6geHgyUEcES6QXPgry818esBMDo9BtxAl5YGlIA48OffcNDWKwmg+Vjb2jCT3y
 uzfjhb/s4SMpVqa7LtlPiNRNW6WwFaVc8lLtfVfxA7cBvCvBJ86hQMMjFQcRnwrZ4RIe
 BUUXPzj1Ph9gb59Qkwb9VmzRj4WX8MIsdtZwn09TW7TkWRtEMALNAlJA3ZVebkgfNOEG
 O4+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWsaA5qThJZ3lrLmTVo0WCWIYUmS6JNB9MPS9QbkU6A5k+EPDdXiqY430f80ixa1ivqZG8dyWEVFNs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyZvqP7bG2sjnqUBk4Qq0UhsG4DAJIw77mZj8a34tYfrpvRQ3+z
 U2DmFfC+foWYhA01ApfqxPkJL/JJ8JWmMNs/sweA/t4w3j1b9Jp4JkK6KdW4jGan68Ru1+e1CH4
 /
X-Gm-Gg: ASbGncs4uojNMyg9bHaednV461q6x2NPOTJmfyL2tRPh3dm+lpbr6NofU0hnYgvQX85
 kcWjGIa1KU3nwsdis6h5g9IF0uZdwrFZY8MoMaIU2teNURofR1aOwboluvYK3vE2zHIc3MmhlUv
 1V/d7NOT0GIwGTPTAkIbHQGLA1td9rxi7kYUYw61f0TWnoT5qJcwTutLYfpT32qHKmyPsBzM6B9
 NJcip4CntlBCgigjdRhfQPwDWEcpn2MfjEbYBM91BRDRkqPPVps5t1xB0Dssj+GLm/K8prbMKMc
 ZSnNkXhnBQ/WJD1uylHfK/r1axnB7lWANsexsekCVUkRH+YI0+7sCmkE
X-Google-Smtp-Source: AGHT+IEXqPg4ntpIBJrKqJUmhFhVvUeMVHQTUghTZcJWrf+11xUWOEGUbhcEz08DJwh4IgeUGuaIlA==
X-Received: by 2002:a5d:64c5:0:b0:38f:4b15:32f1 with SMTP id
 ffacd0b85a97d-39132de3ef7mr1902737f8f.54.1741343320431; 
 Fri, 07 Mar 2025 02:28:40 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43bdd93cc2esm46469755e9.30.2025.03.07.02.28.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Mar 2025 02:28:39 -0800 (PST)
Date: Fri, 7 Mar 2025 11:28:37 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: John Hubbard <jhubbard@nvidia.com>, Greg KH <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Dave Airlie <airlied@gmail.com>, Gary Guo <gary@garyguo.net>,
 Joel Fernandes <joel@joelfernandes.org>,
 Boqun Feng <boqun.feng@gmail.com>, Ben Skeggs <bskeggs@nvidia.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 paulmck@kernel.org
Subject: Re: [RFC PATCH 0/3] gpu: nova-core: add basic timer subdevice
 implementation
Message-ID: <Z8rKVZolu8n6lB1P@phenom.ffwll.local>
Mail-Followup-To: Jason Gunthorpe <jgg@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>,
 Greg KH <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Dave Airlie <airlied@gmail.com>, Gary Guo <gary@garyguo.net>,
 Joel Fernandes <joel@joelfernandes.org>,
 Boqun Feng <boqun.feng@gmail.com>, Ben Skeggs <bskeggs@nvidia.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 paulmck@kernel.org
References: <2025022644-fleshed-petite-a944@gregkh>
 <D82UB3V6NZ55.3OEPPW2W8MFZV@nvidia.com>
 <Z8GViQzZJVFPxfNd@phenom.ffwll.local>
 <20250228184013.GF39591@nvidia.com>
 <Z8cmBWB8rl97-zSG@phenom.ffwll.local>
 <20250304164201.GN133783@nvidia.com>
 <Z8f9mgD4LUJN_dWw@phenom.ffwll.local>
 <20250305151012.GW133783@nvidia.com>
 <Z8l8HgZOV7sDWqBh@phenom.ffwll.local>
 <20250306153236.GE354511@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250306153236.GE354511@nvidia.com>
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

On Thu, Mar 06, 2025 at 11:32:36AM -0400, Jason Gunthorpe wrote:
> On Thu, Mar 06, 2025 at 11:42:38AM +0100, Simona Vetter wrote:
> > > Further, I just remembered, (Danilo please notice!) there is another
> > > related issue here that DMA mappings *may not* outlive remove()
> > > either. netdev had a bug related to this recently and it was all
> > > agreed that it is not allowed. The kernel can crash in a couple of
> > > different ways if you try to do this.
> > > 
> > > https://lore.kernel.org/lkml/8067f204-1380-4d37-8ffd-007fc6f26738@kernel.org/T/#m0c7dda0fb5981240879c5ca489176987d688844c
> > 
> > Hm for the physical dma I thought disabling pci bust master should put a
> > stop to all this stuff?
> 
> Not in the general case. Many device classes (eg platform) don't have
> something like "PCI bus master". It is also not always possible to
> reset a device, even in PCI.
> 
> So the way things work today for module reload relies on the driver
> duing a full quiet down so that the next driver to attach can safely
> start up the device. Otherwise the next driver flips PCI bus master
> back on and immediately UAFs memory through rouge DMA.
> 
> Relying on PCI Bus master also exposes a weakness we battled with in
> kexec. When the new driver boots up it has to gain control of the
> device and stop the DMA before flipping "PCI Bus Master" off. Almost
> no drivers actually do this, and some HW can't even achieve it without
> PCI reset (which is not always available). Meaning you end up with a
> likely UAF flow if you rely on this technique.

Yeah this gets really hairy really fast. We might need some pragmatism
here of not being able to be better than C.

And the entire "load driver after previously the linux driver messed with
it already" is a very broad issue, from rebinding to module reload to
kexec. With some hw it's just not possible to do safely, and with a lot
more hw not reliably due to complexity. E.g. drm/i915/display can take
over the gpu if outputs are enabled and fully recover hw state into sw
state. But defacto that only works for configurations the fw/bootloader
leaves behind, and not in full generality. Plus we don't handle
misprogrammed hw at all.

> > For the sw lifecycle stuff I honestly didn't know that was an issue, I
> > guess that needs to be adressed in the dma-api wrappers or rust can blow
> > up in funny ways. C drivers just walk all mappings and shoot them.
> 
> I wonder what people will come up with. DMA API is performance path,
> people are not going to accept pointless overheads there.
> 
> IMHO whatever path the DMA API takes the MMIO design should follow
> it.

I think this needs to be subsystem specific, since very often there's
already data structures to track all mappings, and so easy to add a bit of
glue to nuke them all forcefully. Or at least data structures to track all
pending requests, and so again we can enforce that we stall for them all
to finish.

We'll probably end up with rust bindings being a lot more opinionated
about how a driver should work, which has the risk of going too far into
the midlayer mistake antipattern. I guess we'll see how that all pans out.

> > The trouble is that for real hotunplug, you need all this anyway. Because
> > when you physically hotunplug the interrupts will be dead, the mmio will
> > be gone any momem (not just at the beginnning of an rcu revocable
> > section), so real hotunplug is worse than what we're trying to do here.
> 
> There are two kinds of real hotunplug, the friendly kind that we see
> in physical PCI where you actually plonk a button on the case and wait
> for the light to go off. Ie it is interactive and safe with the
> OS. Very similar to module reloading.
> 
> And the hostile kind, like in thunderbolt, where it just goes away and
> dies.
> 
> In the server world, other than nvme, we seem to focus on the friendly
> kind.

Yeah gpus tend to hang out in external enclosures sometimes, so I'm not
sure we can ignore the hostile kind.

> > So randomly interrupts not happening is something you need to cope with no
> > matter what.
> 
> Yes
>  
> > But for a driver unbind you _do_ have to worry about cleanly shutting down
> > the hardware. For the above reasons and also in general putting hardware
> > into a well-known (all off usually) state is better for then reloading a
> > new driver version and binding that. Except that there's no way to tell
> > whether your ->remove got called for unbinding or hotunplug.
> 
> IMHO it doesn't really matter, the driver has to support the most
> difficult scenario anyhow. The only practical difference is that the
> MMIO might return -1 to all reads and the interrupts are dead. If you
> want to detect a gone PCI device then just do a register read and
> check for -1, which some drivers like mlx5 are doing as part of their
> resiliency strategy.
> 
> > pci device was physically unplugged or not, and so for developer
> > convenience most pci drivers go with the "cleanly shut down everything"
> > approach, which is the wrong thing to do for actual hotunplug.
> 
> I wouldn't say it is wrong. It is still the correct thing to do, and
> following down the normal cleanup paths is a good way to ensure the
> special case doesn't have bugs. The primary difference is you want to
> understand the device is dead and stop waiting on it faster. Drivers
> need to consider these things anyhow if they want resiliency against
> device crashes, PCI link wobbles and so on that don't involve
> remove().

Might need to revisit that discussion, but Greg didn't like when we asked
for a pci helper to check whether the device is physically gone (at least
per the driver model). Hacking that in drivers is doable, but feels icky.

> Regardless, I think the point is clear that the driver author bears
> alot of responsibility to sequence this stuff correctly as part of
> their remove() implementation. The idea that Rust can magically make
> all this safe against UAF or lockups seems incorrect.

Agreed, it's not pure magic. I do think it can help a lot though, or at
least I'm hoping.

> > > Ah.. I guess rust would have to validate the function pointers and the
> > > THIS_MODULE are consistent at runtime time before handing them off to
> > > C to prevent this. Seems like a reasonable thing to put under some
> > > CONFIG_DEBUG, also seems a bit hard to implement perhaps..
> > 
> > We should know the .text section of a module, so checking whether a
> > pointer is within that shouldn't be too hard.
> 
> It is legal to pass a pointer to a function in a module that this
> module is linked to as well. We do that sometimes.. Eg a fops having a
> simple_xx pointer. So you'd need to do some graph analysis.

Hm right, indirect deps are fine too ...

Cheers, Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
