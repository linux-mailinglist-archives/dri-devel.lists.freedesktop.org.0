Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 378A93BDAE8
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jul 2021 18:07:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 087956E516;
	Tue,  6 Jul 2021 16:07:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95C646E516
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jul 2021 16:07:29 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id b2so25125283oiy.6
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Jul 2021 09:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7/d4XeaSNsVFlRZLAg8ZLZgaOUGNlKetyWckEAHUwuk=;
 b=f8dtLu2S3sJkSa9ZSHeuZep5p+/9fucE28hhiRStm3/kTJF5pTTLjufnGsshWPsReU
 sFoXOfLWKXyR0MqHTYAI1P/1tSDs/Z+hXT0+kZeRKZQRFpopyYIqJp1KFyNWIf1sbbbh
 MoJw7B3g6qMCsyWaOODx7tdFuro/50BL7StMI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7/d4XeaSNsVFlRZLAg8ZLZgaOUGNlKetyWckEAHUwuk=;
 b=jKGQtPJmEyOjfak60vO8ug2hYaTJhkli9r/f5pDql5rwMySdJmulKWQLDdM28W3RPY
 ht3W3B6lOD3zk0Xi6SxTielVUVZXagBgsrmWS6PWUao1Oozna6iExJ95W4NouG4DXScw
 cWXnhExjXMU9Q/Z+3mzNztnu7Cy9ZeL2KNNWgLzxtYNe4aepmsE9EO12a8ewgLduHd1J
 sH1dz4qx09Y0G83ffLIddbEOtTQEEyf7p3euuKQ4CsY/mEVhfUE5aB5lL0UYDXGQqOON
 BCDSjYqJyj1WS1PPZ7bZBueHayWSPj+GuPznc09rz9LA6rFQOvtO+TlpXfuvd8+M1ksj
 G/HA==
X-Gm-Message-State: AOAM531em7gZPWx+76/ZlISos2nHbt7CuzbZJGn+K0+I4BI6ofn6zEZC
 c5tAyw4F6B8lNRCW+Nxo4RoV0T2WijlgzSOi4wfOlA==
X-Google-Smtp-Source: ABdhPJyni2s1akvYMUuRqmzUdWsnoOqSRFuCqyMWJzwLyK6OBSwh9Okh9BIirnjonQbsC2vx54cSUlgVRGLUS1EfrOA=
X-Received: by 2002:aca:5793:: with SMTP id l141mr1008420oib.14.1625587648875; 
 Tue, 06 Jul 2021 09:07:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210705130314.11519-1-ogabbay@kernel.org>
 <YOQXBWpo3whVjOyh@phenom.ffwll.local>
 <CAFCwf10_rTYL2Fy6tCRVAUCf4-6_TtcWCv5gEEkGnQ0KxqMUBg@mail.gmail.com>
 <CAKMK7uEAJZUHNLreBB839BZOfnTGNU4rCx-0k55+67Nbxtdx3A@mail.gmail.com>
 <20210706142357.GN4604@ziepe.ca>
 <CAKMK7uELNzwUe+hhVWRg=Pk5Wt_vOOX922H48Kd6dTyO2PeBbg@mail.gmail.com>
 <20210706152542.GP4604@ziepe.ca>
 <CAKMK7uH7Ar6+uAOU_Sj-mf89V9WCru+66CV5bO9h-WAAv7Mgdg@mail.gmail.com>
In-Reply-To: <CAKMK7uH7Ar6+uAOU_Sj-mf89V9WCru+66CV5bO9h-WAAv7Mgdg@mail.gmail.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Tue, 6 Jul 2021 18:07:17 +0200
Message-ID: <CAKMK7uGvO0h7iZ3vKGe8GouESkr79y1gP1JXbfV82sRiaT-d1A@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] Add p2p via dmabuf to habanalabs
To: Jason Gunthorpe <jgg@ziepe.ca>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Gal Pressman <galpress@amazon.com>, sleybo@amazon.com,
 linux-rdma <linux-rdma@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Oded Gabbay <ogabbay@kernel.org>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Doug Ledford <dledford@redhat.com>, Christoph Hellwig <hch@lst.de>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Leon Romanovsky <leonro@nvidia.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 6, 2021 at 5:49 PM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> On Tue, Jul 6, 2021 at 5:25 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> > I'm not sure about this all or nothing approach. AFAIK DRM has the
> > worst problems with out of tree drivers right now.
>
> Well I guess someone could stand up a drivers/totally-not-gpu and just
> let the flood in. Even duplicated drivers and everything included,
> because the vendor drivers are better. Worth a shot, we've practically
> started this already, I'm just not going to help with the cleanup.

tbh I think at this point someone should just do that. Ideally with
some boundary like please don't use dma-fence or dma-buf and stuff
like that so drivers/gpu doesn't ever have to deal with the fallout.
But way too many people think that somehow you magically get the other
90% of an open accel stack if you're just friendly enough and merge
the kernel driver, so we really should just that experiment in
upstream and watch it pan out in reality.

Minimally it would be some great entertainment :-)

Also on your claim that drivers/gpu is a non-upstream disaster: I've
also learned that that for drivers/rdma there's the upstream driver,
and then there's the out-of-tree hackjob the vendor actually supports.
So seems to be about the same level of screwed up, if you ask the
vendor they tell you the upstream driver isn't a thing they care about
and it's just done for a bit of goodwill. Except if you have enormous
amounts of volume, then suddenly it's an option ... Minus the fw issue
for nvidia, upstream does support all the gpus you can buy right now
and that can run on linux with some vendor driver (aka excluding apple
M1 and ofc upcoming products from most vendors).

drivers/accel otoh is mostly out-of-tree, because aside from Greg
mergin habanalabs no one is bold enough anymore to just merge them
all. There's lots of those going around that would be ready for
picking. And they've been continously submitted to upstream over the
years, even before the entire habanalabs thing.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
