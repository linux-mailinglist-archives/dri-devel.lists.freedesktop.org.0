Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA531F1BD9
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jun 2020 17:17:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D8186E960;
	Mon,  8 Jun 2020 15:17:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B356B6E960
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jun 2020 15:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591629447;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hGKEH1dhLlDad944CTVO7vApiXCC7og9k/LEAwnlxtw=;
 b=A8+gs2el5RBoxqjjoc5bsJNPcn+wbSVtitbFs+5czDHk2bhCJA1o7BfrADa2YU3Z2qkzIu
 8aYUIX1ttaQe87sJARGk8hVLidyj983HAzxuMKB06k/L1i6csTJ92MgD3izOVteq6RBjwb
 H3pf4b1jJPvS6TLNLFflT5GgI5x9Re8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-36-puT0mV24NMmPsMnm542QGA-1; Mon, 08 Jun 2020 11:17:23 -0400
X-MC-Unique: puT0mV24NMmPsMnm542QGA-1
Received: by mail-wr1-f69.google.com with SMTP id m14so7285953wrj.12
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jun 2020 08:17:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hGKEH1dhLlDad944CTVO7vApiXCC7og9k/LEAwnlxtw=;
 b=aDEwLlP7G4imFz3Ps9R81wIkadoHhGE+mf7jCUdp1f4mNwF/AtZm41r/0tj9KOB3vi
 b3yz7nLM86fF384hGHiNU4EilNe3ClPeXolpdQFm02U+MGZywT9lJcXxXRfqW7ImM86T
 3u9Rkoi4ZQV8+1WaeqhEwQ9pCQgWEEu28HOTD5jcNmQW2i5Wfws9rfhYlPM7bb6gs4a5
 3IJLbKCE77COXMo7DchnGI2Lf6aWBcGfIYIdKzY8l1p3vCHls1ulFWb+mG+8x20TqSR1
 sVS8a1YNpIKKHV3HExsW62koH2oMUEOT82QCpZIWa+eYVsrNyTcgAa0KzvuObPEeeqGx
 jkow==
X-Gm-Message-State: AOAM531j3ydEYgZeyI7R3GQfK8BI4FKKbR5pYICNURiiIDbommXxnmBK
 Vr8iVtS3xyvQl9fWwab2xcozwBdToFkHT3qnoaENoi2OrGC6tvotpaRZ0za2ehVCtvvfkwey9yx
 8LcHzBT9lVUHLPM0yttczsYfq52Cv
X-Received: by 2002:adf:fdcc:: with SMTP id i12mr25340197wrs.313.1591629442391; 
 Mon, 08 Jun 2020 08:17:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzXf+wDGo8rFUPMEZIpkA8dnO+aIv3ypXkkQNVdstQgDrqG+2iMjbON1WrY0DIT27qSEK9x+g==
X-Received: by 2002:adf:fdcc:: with SMTP id i12mr25340181wrs.313.1591629442198; 
 Mon, 08 Jun 2020 08:17:22 -0700 (PDT)
Received: from redhat.com (bzq-109-64-41-91.red.bezeqint.net. [109.64.41.91])
 by smtp.gmail.com with ESMTPSA id
 h29sm24085wrc.78.2020.06.08.08.17.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 08:17:21 -0700 (PDT)
Date: Mon, 8 Jun 2020 11:17:18 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Stevens <stevensd@chromium.org>
Subject: Re: [PATCH v3 4/4] drm/virtio: Support virtgpu exported resources
Message-ID: <20200608111647-mutt-send-email-mst@kernel.org>
References: <20200311112004.47138-1-stevensd@chromium.org>
 <20200311112004.47138-5-stevensd@chromium.org>
 <20200513123326-mutt-send-email-mst@kernel.org>
 <CAD=HUj5qcMLw__LfJizR6nzCR9Qmu21Sjk3i0j_8+=rxt1Hk=w@mail.gmail.com>
 <20200608054234-mutt-send-email-mst@kernel.org>
 <CAD=HUj6kF2JFyC9c0CY5_f-cv6r97501Z2f8D9x0VhQpRen+bw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAD=HUj6kF2JFyC9c0CY5_f-cv6r97501Z2f8D9x0VhQpRen+bw@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
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
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>,
 virtio-dev@lists.oasis-open.org, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Jason Wang <jasowang@redhat.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 08, 2020 at 07:36:55PM +0900, David Stevens wrote:
> On Mon, Jun 8, 2020 at 6:43 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Fri, May 15, 2020 at 04:26:15PM +0900, David Stevens wrote:
> > > > > +     if (virtio_has_feature(vgdev->vdev, VIRTIO_GPU_F_RESOURCE_UUID)) {
> > > > > +             vgdev->has_resource_assign_uuid = true;
> > > > > +     }
> > > >
> > > >
> > > > Just a question: this relies on DMA bufs so I assume it is
> > > > not really assumed to work when DMA API is bypassed, right?
> > > > Rather than worry what does it mean, how about just
> > > > disabling  this feature without PLATFORM_DMA for now?
> > >
> > > By PLATFORM_DMA, do you mean CONFIG_DMA_SHARED_BUFFER?
> >
> > Sorry, no. I mean VIRTIO_F_IOMMU_PLATFORM which in the
> > future will be renamed to VIRTIO_F_PLATFORM_ACCESS.
> 
> Shouldn't things work independent of whether or not that feature is
> set? If a virtio driver properly uses the dma_buf APIs (which virtgpu
> seems to), then that should take care of any mapping/synchronization
> related to VIRTIO_F_IOMMU_PLATFORM. If anything, the case where
> VIRTIO_F_IOMMU_PLATFORM isn't set is easier, since then we know that
> the "the device has same access [sic] to memory addresses supplied to
> it as the driver has", according to the specification.
> 
> -David

I don't know much about drm so I can't tell, I was hoping Gerd can
explain.

-- 
MST

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
