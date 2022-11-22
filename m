Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B384634399
	for <lists+dri-devel@lfdr.de>; Tue, 22 Nov 2022 19:27:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9339F10E192;
	Tue, 22 Nov 2022 18:27:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B80710E192
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Nov 2022 18:27:01 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id f7so21820639edc.6
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Nov 2022 10:27:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YuLHzdnVezmbIpehx2h6/dnqYAu8v7KYMyvH9VaugYw=;
 b=NTmJC5lXXDteO1TzcKFiDAE31oHTlG2RVx8+4ouCu6VQpBiKSqzmPJVHgZZPDWyYM6
 t8VlohS/Vl+ltOKCphTGumZH5BN97tmZJrmEqAo8XwD/iY2GICsL+PDs7jQTW3/RzGNe
 cDngWYnxHhno1/NSakx58Y2rfBECXaGV4fbZ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YuLHzdnVezmbIpehx2h6/dnqYAu8v7KYMyvH9VaugYw=;
 b=i1UjDzn5u7k4j6Vq6XM0i/yW/a1uED/RZ8tqtb4a9pog/fWGHU05t59/1nnImnaz/8
 UY476NuOKnhsx2GURuLa7iSVYIMQEDf2skiHhwdUm1ZLQXjHI+Qj3y497/WwMVMp66rO
 XLhbz6iBhVRSWKlfOwuSq0YViS4I1tqUWniUZczd5mtvVlbmVx1YLUvDk/loY9qAz9dU
 pfDPLHmEfYO+04kwBS/Y301qCu9Fayz9GyZR4P8Zi3lQSSEyCFGvQ0O+XLhTKgpazzIk
 xfec+H0NQW7XO8r72ISdPhyoks6awASIenIlYnL+jqUBAT7MpVo93Zdo7prB5gynh4Fh
 c9MA==
X-Gm-Message-State: ANoB5plwUHImBrA/rAisedGdPdCYdsa0ZSRBR/0OFVducepLBCDjo0nM
 QrfZgxfsmaiyA4gqKBM4CpjjCK1qhEDWM6EUhpd+vg==
X-Google-Smtp-Source: AA0mqf7uKugj4+VjnLOmVFqxL1s4AavX/tb4mgqzPy0yRNKjQpkiLy6jrFkvnCfcaczhmidwseHJJXO71t3tQNMli/Q=
X-Received: by 2002:a05:6402:28a9:b0:461:f5ce:a478 with SMTP id
 eg41-20020a05640228a900b00461f5cea478mr22062611edb.304.1669141619619; Tue, 22
 Nov 2022 10:26:59 -0800 (PST)
MIME-Version: 1.0
References: <caf4d6b82843788db97555a58bc9e33915e5b50a.camel@ndufresne.ca>
 <b422be59-4b4b-2d0d-8e8c-b19f27c6832e@gmail.com>
 <4fa4e5d3b1f46e46139bad069cbf5e795e63afa8.camel@pengutronix.de>
 <cc091a11-d012-d998-b7e2-8b3d616867a7@gmail.com>
 <0abc6efddb8dfc1888de15a1bedaaac6688fd078.camel@pengutronix.de>
 <1e2a6750-9849-e9ee-69d6-e4bfdcfb64f3@gmail.com>
 <CAAFQd5B+VHs62M5Wf2L-xOw=_PoaXT+akAySkeZc75HeA3d0jQ@mail.gmail.com>
 <b2dec9b3-03a7-e7ac-306e-1da024af8982@amd.com>
 <346d6ad023ef8697aafd93ac1b100890f3637e44.camel@ndufresne.ca>
 <CAF6AEGuqgWi0T=B9cb+Uy7aoWBPGQmZ3JbwFcK_45GbkY2nHPg@mail.gmail.com>
 <Y3zeYnufgXJHQAbN@phenom.ffwll.local>
 <ae9ba9ba-3ad3-af23-be66-1540862bf571@amd.com>
In-Reply-To: <ae9ba9ba-3ad3-af23-be66-1540862bf571@amd.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 22 Nov 2022 19:26:47 +0100
Message-ID: <CAKMK7uFdvMoonvmgKDeMTksRfN8r797AYm2JJAWBEazgK8BFvA@mail.gmail.com>
Subject: Re: Try to address the DMA-buf coherency problem
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: linux-media@vger.kernel.org, ppaalanen@gmail.com,
 Tomasz Figa <tfiga@chromium.org>, linaro-mm-sig@lists.linaro.org,
 dri-devel@lists.freedesktop.org, Nicolas Dufresne <nicolas@ndufresne.ca>,
 sumit.semwal@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 22 Nov 2022 at 18:34, Christian K=C3=B6nig <christian.koenig@amd.co=
m> wrote:
> Am 22.11.22 um 15:36 schrieb Daniel Vetter:
> > On Fri, Nov 18, 2022 at 11:32:19AM -0800, Rob Clark wrote:
> >> On Thu, Nov 17, 2022 at 7:38 AM Nicolas Dufresne <nicolas@ndufresne.ca=
> wrote:
> >>> Le jeudi 17 novembre 2022 =C3=A0 13:10 +0100, Christian K=C3=B6nig a =
=C3=A9crit :
> >>>>>> DMA-Buf let's the exporter setup the DMA addresses the importer us=
es to
> >>>>>> be able to directly decided where a certain operation should go. E=
.g. we
> >>>>>> have cases where for example a P2P write doesn't even go to memory=
, but
> >>>>>> rather a doorbell BAR to trigger another operation. Throwing in CP=
U
> >>>>>> round trips for explicit ownership transfer completely breaks that
> >>>>>> concept.
> >>>>> It sounds like we should have a dma_dev_is_coherent_with_dev() whic=
h
> >>>>> accepts two (or an array?) of devices and tells the caller whether =
the
> >>>>> devices need explicit ownership transfer.
> >>>> No, exactly that's the concept I'm pushing back on very hard here.
> >>>>
> >>>> In other words explicit ownership transfer is not something we would
> >>>> want as requirement in the framework, cause otherwise we break tons =
of
> >>>> use cases which require concurrent access to the underlying buffer.
> >>> I'm not pushing for this solution, but really felt the need to correc=
t you here.
> >>> I have quite some experience with ownership transfer mechanism, as th=
is is how
> >>> GStreamer framework works since 2000. Concurrent access is a really c=
ommon use
> >>> cases and it is quite well defined in that context. The bracketing sy=
stem (in
> >>> this case called map() unmap(), with flag stating the usage intention=
 like reads
> >>> and write) is combined the the refcount. The basic rules are simple:
> >> This is all CPU oriented, I think Christian is talking about the case
> >> where ownership transfer happens without CPU involvement, such as via
> >> GPU waiting on a fence
> > Yeah for pure device2device handover the rule pretty much has to be tha=
t
> > any coherency management that needs to be done must be done from the
> > device side (flushing device side caches and stuff like that) only. But
> > under the assumption that _all_ cpu side management has been done alrea=
dy
> > before the first device access started.
> >
> > And then the map/unmap respectively begin/end_cpu_access can be used wh=
at
> > it was meant for with cpu side invalidation/flushing and stuff like tha=
t,
> > while having pretty clear handover/ownership rules and hopefully not do=
ing
> > no unecessary flushes. And all that while allowing device acces to be
> > pipelined. Worst case the exporter has to insert some pipelined cache
> > flushes as a dma_fence pipelined work of its own between the device acc=
ess
> > when moving from one device to the other. That last part sucks a bit ri=
ght
> > now, because we don't have any dma_buf_attachment method which does thi=
s
> > syncing without recreating the mapping, but in reality this is solved b=
y
> > caching mappings in the exporter (well dma-buf layer) nowadays.
> >
> > True concurrent access like vk/compute expects is still a model that
> > dma-buf needs to support on top, but that's a special case and pretty m=
uch
> > needs hw that supports such concurrent access without explicit handover
> > and fencing.
> >
> > Aside from some historical accidents and still a few warts, I do think
> > dma-buf does support both of these models.
>
> We should have come up with dma-heaps earlier and make it clear that
> exporting a DMA-buf from a device gives you something device specific
> which might or might not work with others.

Yeah, but engineering practicalities were pretty clear that no one
would rewrite the entire Xorg stack and all the drivers just to make
that happen for prime.

> Apart from that I agree, DMA-buf should be capable of handling this.
> Question left is what documentation is missing to make it clear how
> things are supposed to work?

Given the historical baggage of existing use-case, I think the only
way out is that we look at concrete examples from real world users
that break, and figure out how to fix them. Without breaking any of
the existing mess.

One idea might be that we have a per-platform
dma_buf_legacy_coherency_mode(), which tells you what mode (cpu cache
snooping or uncached memory) you need to use to make sure that all
devices agree. On x86 the rule might be that it's cpu cache snooping
by default, but if you have an integrated gpu then everyone needs to
use uncached. That sucks, but at least we could keep the existing mess
going and clean it up. Everyone else would be uncached, except maybe
arm64 servers with pcie connectors. Essentially least common
denominator to make this work. Note that uncached actually means
device access doesn't snoop, the cpu side you can handle with either
uc/wc mappings or explicit flushing.

Then once we have that we could implement the coherency negotiation
protocol on top as an explicit opt-in, so that you can still use
coherent buffers across two pcie gpus even if you also have an
integrated gpu.

Doing only the new protocol without some means to keep the existing
pile of carefully hacked up assumptions would break things, and we
can't do that. Also I have no idea whether that global legacy device
coherency mode would work. Also we might more than just
snooped/unsnoop, since depending upon architecture you might want to
only snoop one transaction (reads vs writes) instead of both of them:
If writes snoop then cpu reads would never need to invalidate caches
beforehand, but writes would still need to flush (and would give you
faster reads on the device side since those can still bypass
snooping). Some igpu platforms work like that, but I'm not sure
whether there's any other device that would care enough about these
for this to matter. Yes it's a hw mis-design (well I don't like it
personally), they fixed it :-)

Cheers, Daniel
--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
