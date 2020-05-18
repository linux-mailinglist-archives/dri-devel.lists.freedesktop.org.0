Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7B111D7697
	for <lists+dri-devel@lfdr.de>; Mon, 18 May 2020 13:17:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 872C66E0CF;
	Mon, 18 May 2020 11:17:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB64E6E0CF
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 11:17:14 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id d26so7680566otc.7
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 04:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=g503Ck8Hmnwm3Mle9RPu3pG4Ds3hYRoRksfGfnX5Wtc=;
 b=IboKzie54ObNPp3JiHhtIQ8kPbLLNHmAcRRYDKnk1oArIjZ+GMd10k4aYMJSRPb9zG
 17F0resl74uiihv4gxGIutzAXhic+K18i7W3hyGwgMfTt8nCdTFLiRiH/3M90+eJtdp8
 NOtY1+r+bXRxOoYA/CFBWd3Y29PGDF37HlePI4bTyWF2JDP4nX+bpXNsXdtCMybiKvJk
 3xL5+CrFHGwbOdHy5qb3FBbTBNIDGk7CJwhLUp4tig7HJTZMNmUt4I/ZmlrsqxCOu96c
 odlDwjvWGdMjf7bSEZvSr2V+hOQ8gJPE9TtlDbNnG+73EW9FbfvLzrsTUZwGJeNQoI66
 xWWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g503Ck8Hmnwm3Mle9RPu3pG4Ds3hYRoRksfGfnX5Wtc=;
 b=SLl9P8dm2+LCqCH7+8JwcCtIfd90XC1wrxt845KxF+KtKiaS5pd8S8iqQeHaQJj+zV
 b1ox/Gfe2L1SZq11gn6pTC6+av9aG9hJxir2L0cg9vVv19MleFlG6x+7u5EZly1zdQAH
 Adt1V3eb3TAqJ7Ev3G/a9y9O6k0u+kxP8Y3lhaiGUmBoRahjKtFXEgEmxjRfz/gIvh82
 6XE6jXtQRu+Q9OEweZUyKjCr064fHfacDYhKLFtT8qI69u4kepyETu0zLHp/A+nzWARH
 FDU6WdvRg2SnWUMaYdOMpSUcFIULHrdFy31uo3ziOGSWZWvzkGb/jkAv1fPproB62K44
 89Kw==
X-Gm-Message-State: AOAM530ExksHIM4NnlnbG2ASwD5YZr3N80icJ55T+qTLtFKrW+mpQj0m
 enyJTi+JVtdIZMhTB9Y7GXb4COGjw+Hw69Vg2pLC8Q==
X-Google-Smtp-Source: ABdhPJwl5rqs5VWO5Jkao2XeEWkRX+lCx01ip7F50tguMxrw+WswGeYLG9OGd+5XHn6jnx/Q1aQbMIwBn56Y/9LJcLA=
X-Received: by 2002:a9d:ec7:: with SMTP id 65mr11530376otj.164.1589800633898; 
 Mon, 18 May 2020 04:17:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200311112004.47138-1-stevensd@chromium.org>
 <20200311112004.47138-2-stevensd@chromium.org>
 <CAKMK7uHFgiHLe9oiFBr-VR-6rU9-hLTpBTEVNh0ezyj54u70jw@mail.gmail.com>
 <CAD=HUj6k-y1=64zY8ZFOQBZ7WSUWiQfvkiTpXXt10JB_CGqk1A@mail.gmail.com>
 <20200514123007.GP206103@phenom.ffwll.local>
 <CAD=HUj7452eFfn9i=JWm54Mke3Lew-7AWYeoKZLAjCSg7eLO6A@mail.gmail.com>
 <20200515140306.GF206103@phenom.ffwll.local>
In-Reply-To: <20200515140306.GF206103@phenom.ffwll.local>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Mon, 18 May 2020 16:47:02 +0530
Message-ID: <CAO_48GG85PhyoZ1yzXuwv8tT12V4dkDsXc8_RaMd--oinkpN2g@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] dma-buf: add support for virtio exported objects
To: David Stevens <stevensd@chromium.org>, Tomasz Figa <tfiga@chromium.org>, 
 Gerd Hoffmann <kraxel@redhat.com>, David Airlie <airlied@linux.ie>, 
 "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 "open list:VIRTIO CORE, NET..." <virtualization@lists.linux-foundation.org>, 
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>, 
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 virtio-dev@lists.oasis-open.org
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello David,

On Fri, 15 May 2020 at 19:33, Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Fri, May 15, 2020 at 02:07:06PM +0900, David Stevens wrote:
> > On Thu, May 14, 2020 at 9:30 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > On Thu, May 14, 2020 at 05:19:40PM +0900, David Stevens wrote:
> > > > Sorry for the duplicate reply, didn't notice this until now.
> > > >
> > > > > Just storing
> > > > > the uuid should be doable (assuming this doesn't change during the
> > > > > lifetime of the buffer), so no need for a callback.
> > > >
> > > > Directly storing the uuid doesn't work that well because of
> > > > synchronization issues. The uuid needs to be shared between multiple
> > > > virtio devices with independent command streams, so to prevent races
> > > > between importing and exporting, the exporting driver can't share the
> > > > uuid with other drivers until it knows that the device has finished
> > > > registering the uuid. That requires a round trip to and then back from
> > > > the device. Using a callback allows the latency from that round trip
> > > > registration to be hidden.
> > >
> > > Uh, that means you actually do something and there's locking involved.
> > > Makes stuff more complicated, invariant attributes are a lot easier
> > > generally. Registering that uuid just always doesn't work, and blocking
> > > when you're exporting?
> >
> > Registering the id at creation and blocking in gem export is feasible,
> > but it doesn't work well for systems with a centralized buffer
> > allocator that doesn't support batch allocations (e.g. gralloc). In
> > such a system, the round trip latency would almost certainly be
> > included in the buffer allocation time. At least on the system I'm
> > working on, I suspect that would add 10s of milliseconds of startup
> > latency to video pipelines (although I haven't benchmarked the
> > difference). Doing the blocking as late as possible means most or all
> > of the latency can be hidden behind other pipeline setup work.
> >
> > In terms of complexity, I think the synchronization would be basically
> > the same in either approach, just in different locations. All it would
> > do is alleviate the need for a callback to fetch the UUID.
>
I think I agree with Daniel there - this seems best suited for code
within virtio.

> Hm ok. I guess if we go with the older patch, where this all is a lot more
> just code in virtio, doing an extra function to allocate the uuid sounds
> fine. Then synchronization is entirely up to the virtio subsystem and not
> a dma-buf problem (and hence not mine). You can use dma_resv_lock or so,
> but no need to. But with callbacks potentially going both ways things
> always get a bit interesting wrt locking - this is what makes peer2peer
> dma-buf so painful right now. Hence I'd like to avoid that if needed, at
> least at the dma-buf level. virtio code I don't mind what you do there :-)
>
> Cheers, Daniel
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

Best,
Sumit.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
