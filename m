Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5AB63F03EC
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 14:46:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C61C16E58E;
	Wed, 18 Aug 2021 12:46:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D40B16E58A
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 12:46:44 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id v4so3278555wro.12
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 05:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=uP7fJxLQ5TTQ8aYHYwLJ/kNb8CkLiwmQWgbmcKMOm0w=;
 b=PS2hT9t/9lt08j1dPeij1H4maeOQEorQjjXGvVlj3rdRK5EGB3LBdL6ZFc5ihgsxu6
 Raz3EniFUixp+J6NugUiY1vx8r7+9nC42cxjcI6WOR8VaONMTiKSM8toXdb/UC7G9576
 ozvIPU2VygZBZ9UvUWtEYcANJ4iW6Vtt9Cpmc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=uP7fJxLQ5TTQ8aYHYwLJ/kNb8CkLiwmQWgbmcKMOm0w=;
 b=FD0Y/hsXZpMzU1pGq9somZssWkL2lvPof7dpXexXIQ2DXddgFKrErAueTWN/nN2owj
 5bFn54uiahMig2vjGUlsE8oAmGt8RbjieHNQrw0ijnOJBbUZ/p4yMGvkn94rKOwqjX35
 6RpQpL6/GBQ5IjCQ0it86gGV5bt2M8Tv3sNnK2l/sG3EqEXaQcQK+bctbJrA7usgpSPx
 T1w7wLWAvmzRe9qVZaQWYnAZNl7dtMCw2vNm0T9eideTYP2b9SFwaxCVAeCzdDZPDjZn
 dfyOHPhB39/BPJVTGzZjstwoB0wam/3MRdkwWIoG27MBAkv3S9Iwg8HRQKESzU5AiTKz
 bjmQ==
X-Gm-Message-State: AOAM531dlTG4UEdzj8WXxyhS0nStECOHwl0ak/kHkjegYOx/uzDlZfhz
 DdXtrSt9tKGZGjmw55rGYdw+qg==
X-Google-Smtp-Source: ABdhPJy9q41WJDBnQ045sdEUQOBByE6IbQCS+2X6AUgaQtPFfyt/n6ZzI0Dt7LogN6spZ356e/F0gg==
X-Received: by 2002:adf:e38a:: with SMTP id e10mr10315579wrm.213.1629290802572; 
 Wed, 18 Aug 2021 05:46:42 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id o7sm4916803wmc.46.2021.08.18.05.46.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 05:46:42 -0700 (PDT)
Date: Wed, 18 Aug 2021 14:46:40 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: "Sa, Nuno" <Nuno.Sa@analog.com>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 Rob Clark <rob@ti.com>
Subject: Re: [Linaro-mm-sig] [PATCH] dma-buf: return -EINVAL if dmabuf object
 is NULL
Message-ID: <YR0BMCMFcwXLjNAe@phenom.ffwll.local>
References: <20210818115810.274084-1-nuno.sa@analog.com>
 <9a63b45f-6fec-6269-ae16-8604b08514de@amd.com>
 <SJ0PR03MB6359C318092E0CB99D28D85099FF9@SJ0PR03MB6359.namprd03.prod.outlook.com>
 <ed0bf7fd-de49-f94a-3eda-0c1fac50153a@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ed0bf7fd-de49-f94a-3eda-0c1fac50153a@amd.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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

On Wed, Aug 18, 2021 at 02:31:34PM +0200, Christian König wrote:
> Am 18.08.21 um 14:17 schrieb Sa, Nuno:
> > > From: Christian König <christian.koenig@amd.com>
> > > Sent: Wednesday, August 18, 2021 2:10 PM
> > > To: Sa, Nuno <Nuno.Sa@analog.com>; linaro-mm-sig@lists.linaro.org;
> > > dri-devel@lists.freedesktop.org; linux-media@vger.kernel.org
> > > Cc: Rob Clark <rob@ti.com>; Sumit Semwal
> > > <sumit.semwal@linaro.org>
> > > Subject: Re: [PATCH] dma-buf: return -EINVAL if dmabuf object is
> > > NULL
> > > 
> > > [External]
> > > 
> > > To be honest I think the if(WARN_ON(!dmabuf)) return -EINVAL
> > > handling
> > > here is misleading in the first place.
> > > 
> > > Returning -EINVAL on a hard coding error is not good practice and
> > > should
> > > probably be removed from the DMA-buf subsystem in general.
> > Would you say to just return 0 then? I don't think that having the
> > dereference is also good..
> 
> No, just run into the dereference.
> 
> Passing NULL as the core object you are working on is a hard coding error
> and not something we should bubble up as recoverable error.
> 
> > I used -EINVAL to be coherent with the rest of the code.
> 
> I rather suggest to remove the check elsewhere as well.

It's a lot more complicated, and WARN_ON + bail out is rather
well-established code-pattern. There's been plenty of discussions in the
past that a BUG_ON is harmful since it makes debugging a major pain, e.g.

https://lore.kernel.org/lkml/CA+55aFwyNTLuZgOWMTRuabWobF27ygskuxvFd-P0n-3UNT=0Og@mail.gmail.com/

There's also a checkpatch check for this.

commit 9d3e3c705eb395528fd8f17208c87581b134da48
Author: Joe Perches <joe@perches.com>
Date:   Wed Sep 9 15:37:27 2015 -0700

    checkpatch: add warning on BUG/BUG_ON use

Anyone who is paranoid about security crashes their machine on any WARNING
anyway (like syzkaller does).

My rule of thumb is that if the WARN_ON + bail-out code is just an if
(WARN_ON()) return; then it's fine, if it's more then BUG_ON is the better
choice perhaps.

I think the worst choice is just removing all these checks, because a few
code reorgs later you might not Oops immediately afterwards anymore, and
then we'll merge potentially very busted new code. Which is no good.
-Daniel



> 
> Christian.
> 
> > 
> > - Nuno Sá
> > 
> > > Christian.
> > > 
> > > Am 18.08.21 um 13:58 schrieb Nuno Sá:
> > > > On top of warning about a NULL object, we also want to return with a
> > > > proper error code (as done in 'dma_buf_begin_cpu_access()').
> > > Otherwise,
> > > > we will get a NULL pointer dereference.
> > > > 
> > > > Fixes: fc13020e086b ("dma-buf: add support for kernel cpu access")
> > > > Signed-off-by: Nuno Sá <nuno.sa@analog.com>
> > > > ---
> > > >    drivers/dma-buf/dma-buf.c | 3 ++-
> > > >    1 file changed, 2 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-
> > > buf.c
> > > > index 63d32261b63f..8ec7876dd523 100644
> > > > --- a/drivers/dma-buf/dma-buf.c
> > > > +++ b/drivers/dma-buf/dma-buf.c
> > > > @@ -1231,7 +1231,8 @@ int dma_buf_end_cpu_access(struct
> > > dma_buf *dmabuf,
> > > >    {
> > > >    	int ret = 0;
> > > > 
> > > > -	WARN_ON(!dmabuf);
> > > > +	if (WARN_ON(!dmabuf))
> > > > +		return -EINVAL;
> > > > 
> > > >    	might_lock(&dmabuf->resv->lock.base);
> > > > 
> 
> _______________________________________________
> Linaro-mm-sig mailing list
> Linaro-mm-sig@lists.linaro.org
> https://lists.linaro.org/mailman/listinfo/linaro-mm-sig

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
