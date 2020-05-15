Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E391D4FD9
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 16:03:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22E0E6ECA6;
	Fri, 15 May 2020 14:03:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20BF66ECA6
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 14:03:11 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id g12so2792351wmh.3
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 07:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=hfKkBsIEgs0vkAeFdo392aLMF7GnommANe2U1KeK9uI=;
 b=b5d+I2ChU9zk48jsjVya/j0veq8tA45Z1eTGEqW25PFGpflpOB0ANQJMsC27YLELuK
 XicoRGOzRMF/LBcAPpJOO34Vk5ZNPtNo0SYXz1CceDLR+75jgKMSr5Gq2Y4tegRs0IP+
 Ups2PzNHV/VnPwJpVSpa0NFTYgmvPlT+Oi4U0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=hfKkBsIEgs0vkAeFdo392aLMF7GnommANe2U1KeK9uI=;
 b=bkCdZvTVrViVoeBQ2L/5cgRG2/4Mm6O4AhPT9oLsZweyOOzbF4lgybe62VPjc/d48X
 /UVtZWP30DMfIJmGHgAAC9tIjHb5LXCp0RXHtR8mrX38wI7FJmTScLOkDitACQXD7C3T
 VLJ2LEuYFd0uZQ9B44g2noROTBcpwQpvj8xRHK/TBOkwaSpx6vAejgkF7qztNMZwdUdq
 009LVvOZ8do0EmIRrUQIvfcL/RFqiH9Y9NlcMhjRPVsghJQjnQaHR2NoMQ6yvTQXUmo0
 UadEvTqm7e/WVT0XgOXCjWFA/GILu4dPWRDYGxgKKiefi3ksIEsTPN2IDPdnpS/r1S6j
 P2XQ==
X-Gm-Message-State: AOAM530hdEnkbb+cIzoXZXp4ZNIILU/92nCXRysUW8yUdCaFbAEI7NSU
 ZTU9gKeIY8e2DDej9jxJL4KhOA==
X-Google-Smtp-Source: ABdhPJzmhNqsxAdCi4n1OFQV3XDuSejh1CuLln2gJgFMW5yg1LElG7wBgKDi+Hw5Qcxt2Ktc6DQ43w==
X-Received: by 2002:a1c:dc05:: with SMTP id t5mr4402679wmg.112.1589551389616; 
 Fri, 15 May 2020 07:03:09 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id x16sm3814048wrq.23.2020.05.15.07.03.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2020 07:03:08 -0700 (PDT)
Date: Fri, 15 May 2020 16:03:06 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: David Stevens <stevensd@chromium.org>
Subject: Re: [PATCH v3 1/4] dma-buf: add support for virtio exported objects
Message-ID: <20200515140306.GF206103@phenom.ffwll.local>
Mail-Followup-To: David Stevens <stevensd@chromium.org>,
 Tomasz Figa <tfiga@chromium.org>, Gerd Hoffmann <kraxel@redhat.com>,
 David Airlie <airlied@linux.ie>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
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
References: <20200311112004.47138-1-stevensd@chromium.org>
 <20200311112004.47138-2-stevensd@chromium.org>
 <CAKMK7uHFgiHLe9oiFBr-VR-6rU9-hLTpBTEVNh0ezyj54u70jw@mail.gmail.com>
 <CAD=HUj6k-y1=64zY8ZFOQBZ7WSUWiQfvkiTpXXt10JB_CGqk1A@mail.gmail.com>
 <20200514123007.GP206103@phenom.ffwll.local>
 <CAD=HUj7452eFfn9i=JWm54Mke3Lew-7AWYeoKZLAjCSg7eLO6A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD=HUj7452eFfn9i=JWm54Mke3Lew-7AWYeoKZLAjCSg7eLO6A@mail.gmail.com>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
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
Cc: virtio-dev@lists.oasis-open.org,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, David Airlie <airlied@linux.ie>,
 Jason Wang <jasowang@redhat.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tomasz Figa <tfiga@chromium.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 "open list:VIRTIO CORE, NET..." <virtualization@lists.linux-foundation.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 15, 2020 at 02:07:06PM +0900, David Stevens wrote:
> On Thu, May 14, 2020 at 9:30 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> > On Thu, May 14, 2020 at 05:19:40PM +0900, David Stevens wrote:
> > > Sorry for the duplicate reply, didn't notice this until now.
> > >
> > > > Just storing
> > > > the uuid should be doable (assuming this doesn't change during the
> > > > lifetime of the buffer), so no need for a callback.
> > >
> > > Directly storing the uuid doesn't work that well because of
> > > synchronization issues. The uuid needs to be shared between multiple
> > > virtio devices with independent command streams, so to prevent races
> > > between importing and exporting, the exporting driver can't share the
> > > uuid with other drivers until it knows that the device has finished
> > > registering the uuid. That requires a round trip to and then back from
> > > the device. Using a callback allows the latency from that round trip
> > > registration to be hidden.
> >
> > Uh, that means you actually do something and there's locking involved.
> > Makes stuff more complicated, invariant attributes are a lot easier
> > generally. Registering that uuid just always doesn't work, and blocking
> > when you're exporting?
> 
> Registering the id at creation and blocking in gem export is feasible,
> but it doesn't work well for systems with a centralized buffer
> allocator that doesn't support batch allocations (e.g. gralloc). In
> such a system, the round trip latency would almost certainly be
> included in the buffer allocation time. At least on the system I'm
> working on, I suspect that would add 10s of milliseconds of startup
> latency to video pipelines (although I haven't benchmarked the
> difference). Doing the blocking as late as possible means most or all
> of the latency can be hidden behind other pipeline setup work.
> 
> In terms of complexity, I think the synchronization would be basically
> the same in either approach, just in different locations. All it would
> do is alleviate the need for a callback to fetch the UUID.

Hm ok. I guess if we go with the older patch, where this all is a lot more
just code in virtio, doing an extra function to allocate the uuid sounds
fine. Then synchronization is entirely up to the virtio subsystem and not
a dma-buf problem (and hence not mine). You can use dma_resv_lock or so,
but no need to. But with callbacks potentially going both ways things
always get a bit interesting wrt locking - this is what makes peer2peer
dma-buf so painful right now. Hence I'd like to avoid that if needed, at
least at the dma-buf level. virtio code I don't mind what you do there :-)

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
