Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 344C155A423
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jun 2022 00:02:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 983CF10E45F;
	Fri, 24 Jun 2022 22:02:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C0AD10E45F
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 22:02:30 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id o16so4832765wra.4
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 15:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=bViPZBAMgiXFQeC0Ts9kGgYh0djVJEBJnUFAscIdXfs=;
 b=Rz8Nx4ymy75hrX0gaCBI4344J1bwBh+sOZ0axM97pDdxTgAZCwKsYA02NUuNgyuZeG
 qKht7O/JTqYnIz91prEg2+GBQqCdj3NY1VKMJIlEooRATP79woE+w3eDaKmVVDTxzbVf
 iIVM0EFWFYWW3QEvxzfR51JtkpYZKX/LIyVms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=bViPZBAMgiXFQeC0Ts9kGgYh0djVJEBJnUFAscIdXfs=;
 b=esaqTfx0wrSdF+aDYkdUOHP2NSZvHTRk3YUGifmvPkcebRXfVvOb9OnNojz9fmDOXp
 NDt3/jnXnZwXueNQJ+VctDbgft/43t2XkZy380TpPnM511ZEvGCDDtq+Qwbj8PhAA5tS
 AOG3N2yVhCOCEsT+dDp9FsFo7O4m9XFY1UGWR6AFZRO0TK34sePifZuY8DbepFEjk1Jv
 Eb8HnxGXxeovqrV7Bd6C2K0vhmq837PfDQtXrXN+7hXNiB4GSoU/DTBesWJQQ4PtaGDT
 MIZsy11FyaPe9qoIh6L/oGZgt8TI3FnnuEVcrQLQKQYADhKFOu64HGvMbt4fvebaf9Ns
 fiVg==
X-Gm-Message-State: AJIora8cGhaYT3xMMLA3UqX+2rOKu8Ibq0KdGM+QqHXg4P61hEepvoDp
 QLUuFpIWZCHqN0LarEp8UWIwUg==
X-Google-Smtp-Source: AGRyM1s5n8eWyRmaa3id4LPoBE/bT384zG7zulVFh2/9XfPhNQr+6xueKkF3HpAXx+5+DdHBdYLKHQ==
X-Received: by 2002:adf:e502:0:b0:21b:8de6:7f14 with SMTP id
 j2-20020adfe502000000b0021b8de67f14mr1062488wrm.3.1656108148577; 
 Fri, 24 Jun 2022 15:02:28 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 v17-20020a5d43d1000000b0021b95bcaf7fsm3328710wrr.59.2022.06.24.15.02.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jun 2022 15:02:27 -0700 (PDT)
Date: Sat, 25 Jun 2022 00:02:25 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [Linaro-mm-sig] Re: DMA-buf and uncached system memory
Message-ID: <YrY0cQY1BTL5H7Xp@phenom.ffwll.local>
Mail-Followup-To: Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, 
 Daniel Stone <daniel@fooishbar.org>,
 Pekka Paalanen <ppaalanen@gmail.com>,
 "Sharma, Shashank" <Shashank.Sharma@amd.com>,
 lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Nicolas Dufresne <nicolas@ndufresne.ca>,
 linaro-mm-sig@lists.linaro.org,
 Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media <linux-media@vger.kernel.org>
References: <4b69f9f542d6efde2190b73c87096e87fa24d8ef.camel@pengutronix.de>
 <adc626ec-ff5a-5c06-44ce-09111be450cd@amd.com>
 <fbb228cd78e9bebd7e7921c19e0c4c09d0891f23.camel@pengutronix.de>
 <e691bccc-171d-f674-2817-13a945970f4a@amd.com>
 <95cca943bbfda6af07339fb8d2dc7f4da3aa0280.camel@pengutronix.de>
 <05814ddb-4f3e-99d8-025a-c31db7b2c46b@amd.com>
 <708e27755317a7650ca08ba2e4c14691ac0d6ba2.camel@pengutronix.de>
 <6287f5f8-d9af-e03d-a2c8-ea8ddcbdc0d8@amd.com>
 <CAPj87rOykZv7bjNhHPT4StrsPz8Y_DWqab4Ryq=Qqh77LS2e=Q@mail.gmail.com>
 <578953dd-6298-2bfe-a8fb-52004b84fd17@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <578953dd-6298-2bfe-a8fb-52004b84fd17@amd.com>
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
Cc: "Sharma, Shashank" <Shashank.Sharma@amd.com>,
 lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Nicolas Dufresne <nicolas@ndufresne.ca>, linaro-mm-sig@lists.linaro.org,
 Pekka Paalanen <ppaalanen@gmail.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 23, 2022 at 01:32:18PM +0200, Christian König wrote:
> Am 23.06.22 um 13:27 schrieb Daniel Stone:
> > Hi Christian,
> > 
> > On Thu, 23 Jun 2022 at 12:11, Christian König <christian.koenig@amd.com> wrote:
> > > > In fact DMA-buf sharing works fine on most of those SoCs because
> > > > everyone just assumes that all the accelerators don't snoop, so the
> > > > memory shared via DMA-buf is mostly CPU uncached. It only falls apart
> > > > for uses like the UVC cameras, where the shared buffer ends up being
> > > > CPU cached.
> > > Well then the existing DMA-buf framework is not what you want to use for
> > > this.
> > > 
> > > > Non-coherent without explicit domain transfer points is just not going
> > > > to work. So why can't we solve the issue for DMA-buf in the same way as
> > > > the DMA API already solved it years ago: by adding the equivalent of
> > > > the dma_sync calls that do cache maintenance when necessary? On x86 (or
> > > > any system where things are mostly coherent) you could still no-op them
> > > > for the common case and only trigger cache cleaning if the importer
> > > > explicitly says that is going to do a non-snooping access.
> > > Because DMA-buf is a framework for buffer sharing between cache coherent
> > > devices which don't signal transitions.
> > > 
> > > We intentionally didn't implemented any of the dma_sync_* functions
> > > because that would break the intended use case.
> > > 
> > > You can of course use DMA-buf in an incoherent environment, but then you
> > > can't expect that this works all the time.
> > > 
> > > This is documented behavior and so far we have bluntly rejected any of
> > > the complains that it doesn't work on most ARM SoCs and I don't really
> > > see a way to do this differently.
> > For some strange reason, 'let's do buffer sharing but make sure it
> > doesn't work on Arm' wasn't exactly the intention of the groups who
> > came together under the Linaro umbrella to create dmabuf.
> > 
> > If it's really your belief that dmabuf requires universal snooping, I
> > recommend you send the patch to update the documentation, as well as
> > to remove DRIVER_PRIME from, realistically, most non-PCIE drivers.
> 
> Well, to be honest I think that would indeed be necessary.
> 
> What we have created are essentially two different worlds, one for PCI
> devices and one for the rest.
> 
> This was indeed not the intention, but it's a fact that basically all
> DMA-buf based PCI drivers assume coherent access.

dma-buf does not require universal snooping.

It does defacto require that all device access is coherent with all other
device access, and consistent with the exporters notion of how cpu
coherency is achieved. Not that coherent does not mean snooping, as long
as all devices do unsnooped access and the exporter either does wc/uc or
flushes caches that's perfectly fine, and how all the arm soc dma-buf
sharing works.

We did originally have the wording in there that you have to map/unamp
around every device access, but that got dropped because no one was doing
that anyway.

Now where this totally breaks down is how we make this work, because the
idea was that dma_buf_attach validates this all. Where this means all the
hilarious reasons buffer sharing might not work:
- wrong coherency mode (cpu cached or not)
- not contiguous (we do check that, but only once we get the sg from
  dma_buf_attachment_map, which strictly speaking is a bit too late but
  most drivers do attach&map as one step so not that bad in practice)
- whether the dma api will throw in bounce buffers or not
- random shit like "oh this is in the wrong memory bank", which I think
  never landed in upstream

p2p connectivity is about the only one that gets this right, yay. And the
only reason we can even get it right is because all the information is
exposed to drivers fully.

The issue is that the device dma api refuses to share this information
because it would "leak". Which sucks, because we have defacto build every
single cross-device use-case of dma-buf on the assumption we can check
this (up to gl/vk specs), but oh well.

So in practice this gets sorted out by endless piles of hacks to make
individual use-cases work.

Oh and: This is definitely not limited to arm socs. x86 socs with intel
at least have exactly all the same issues, and they get solved by adding
various shitty hacks to the involved drivers (like i915+amdgpu). Luckily
the intel camera driver isn't in upstream yet, since that would break a
bunch of the hacks since suddently there will be now 2 cpu cache
incoherent devices in an x86 system.

Ideally someone fixes this, but I'm not hopeful.

I recommend pouring more drinks.

What is definitely not correct is claiming that dma-buf wasn't meant for
this. We discussed cache coherency issues endless in budapest 12 or so
years ago, I was there. It's just that the reality of the current
implementation is falling short, and every time someone tries to fix it we
get shouted down by dma api maintainers for looking behind their current.

tldr; You have to magically know to not use cpu cached allocators on these
machines.

Aside: This is also why vgem alloates wc memory on x86. It's the least
common denominator that works. arm unfortunately doesn't allow you to
allocate wc memory, so there stuff is simply somewhat broken.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
