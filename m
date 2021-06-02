Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 53275398A08
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 14:50:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 884EB6EC95;
	Wed,  2 Jun 2021 12:50:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2081C6EC95
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jun 2021 12:50:50 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id a20so2237825wrc.0
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Jun 2021 05:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=xgJBOpfDBOjk0eNxnZ8CG62cvM0JEzgwCTKaL7c5DPA=;
 b=k2B17fzxXW+ucjE3E6UJGHFwDsDPFSzGwJLa7wJn1zCwazD9025EsBIenQcDUJbqZD
 u0gupnnttmq7CkuKShveAtL2oeETfUt4q67vl+XPd5Pf/o6ES+hOQ+daMAcu4DH/fYDS
 DxWD+5BSofWhY4yMpEITxl9EZMFxVvKfQ8DEk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=xgJBOpfDBOjk0eNxnZ8CG62cvM0JEzgwCTKaL7c5DPA=;
 b=dFk43fD96j+58wneOhU/gqpd+OAXsFNSmAq2njdG1DpWLZ9dDHYB9L4jNuhjNUmiwU
 K9L+bEwg7K9XxI+CUlaIItisEzIBwBT2P1OFHTnyHZrJ5GcKNFBrNXCBKMGxEtp3pYIx
 Xdtovet6cqU1RsLWzk/w/rAq5f38j1ZaDTj3MIBWFlR/GEQp+VvIQzfj02jkN+fl8WsC
 s+9tVRmU304P7eGbbKTysMNjOMdCUME+nScWtCess+v3sAe5KpUPJYVoQnXZ98ni0kj+
 UuiMvM/wkm9/pKh0hWHLU9d9dp8UUP+kL81+n1KvukACq527SUyOBCZxEMW7dU6Dn1Cw
 gpFQ==
X-Gm-Message-State: AOAM531YWUHRbbg7u2UMhNvB5GKfDAuXbw2B5/AnT4Eo1z6J4Wf0+S0z
 syNHVC73ojBc+6TvBgYqXhzjow==
X-Google-Smtp-Source: ABdhPJwKDY4F/2ljHFak9r2vrVS7SFKm5LLa1uJsv6HGd5kW+mJG1+GPBucuXvgzfKedLCEg0bpTSA==
X-Received: by 2002:adf:ed03:: with SMTP id a3mr10652636wro.166.1622638248832; 
 Wed, 02 Jun 2021 05:50:48 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id h9sm2560001wmb.35.2021.06.02.05.50.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 05:50:48 -0700 (PDT)
Date: Wed, 2 Jun 2021 14:50:46 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 1/7] dma-buf: fix inconsistent debug print
Message-ID: <YLd+pg9da6WSMhjc@phenom.ffwll.local>
References: <20210602111714.212426-1-christian.koenig@amd.com>
 <YLd6k+LIHLja07V9@phenom.ffwll.local>
 <c40b4c90-b595-9be0-29db-01b7bb5d24a6@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c40b4c90-b595-9be0-29db-01b7bb5d24a6@gmail.com>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
Cc: dri-devel@lists.freedesktop.org, jason@jlekstrand.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 02, 2021 at 02:36:58PM +0200, Christian König wrote:
> 
> 
> Am 02.06.21 um 14:33 schrieb Daniel Vetter:
> > On Wed, Jun 02, 2021 at 01:17:08PM +0200, Christian König wrote:
> > > The code tries to acquire the rcu protected fence list, but then ignores
> > > individual fences which have been modified while holding the rcu.
> > > 
> > > Stop that madness and just note cleanly that the list was concurrently modified.
> > > 
> > > Signed-off-by: Christian König <christian.koenig@amd.com>
> > Yeah it's debugfs, it's better not to be fancy here and if you race you
> > can just re-grab it all.
> > 
> > What's worse, we do grab the dma_resv_lock, which means no one should be
> > able to race with us. I think 100% right thing here is actually to drop
> > the rcu_read_lock too, and switch over to rcu_dereference_protected().
> > 
> > And also drop the seqcount check, that would be a bug. seqcount is only
> > to get a consistent snapshot of all fences on the read (i.e. protected by
> > rcu only) section. We hold the write lock with dma_resv_lock here.
> 
> Yes that what I had in mind as alternative as well.
> 
> Just wasn't 100% sure which way to go here.

I think for paranoia we could read the seqcount and do a WARN_ON if it
ever increments while we hold dma_resv_lock ourselves. But I think this
one here is the only one where this applies, and it's debugfs only, so
meh?
-Daniel

> Going to adjust that,
> Christian.
> 
> > 
> > Cheers, Daniel
> > 
> > > ---
> > >   drivers/dma-buf/dma-buf.c | 19 ++++++++-----------
> > >   1 file changed, 8 insertions(+), 11 deletions(-)
> > > 
> > > diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> > > index eadd1eaa2fb5..d3b4e370dbc1 100644
> > > --- a/drivers/dma-buf/dma-buf.c
> > > +++ b/drivers/dma-buf/dma-buf.c
> > > @@ -1383,22 +1383,17 @@ static int dma_buf_debug_show(struct seq_file *s, void *unused)
> > >   				buf_obj->name ?: "");
> > >   		robj = buf_obj->resv;
> > > -		while (true) {
> > > -			seq = read_seqcount_begin(&robj->seq);
> > > -			rcu_read_lock();
> > > -			fobj = rcu_dereference(robj->fence);
> > > -			shared_count = fobj ? fobj->shared_count : 0;
> > > -			fence = rcu_dereference(robj->fence_excl);
> > > -			if (!read_seqcount_retry(&robj->seq, seq))
> > > -				break;
> > > -			rcu_read_unlock();
> > > -		}
> > > -
> > > +		seq = read_seqcount_begin(&robj->seq);
> > > +		rcu_read_lock();
> > > +		fence = rcu_dereference(robj->fence_excl);
> > >   		if (fence)
> > >   			seq_printf(s, "\tExclusive fence: %s %s %ssignalled\n",
> > >   				   fence->ops->get_driver_name(fence),
> > >   				   fence->ops->get_timeline_name(fence),
> > >   				   dma_fence_is_signaled(fence) ? "" : "un");
> > > +
> > > +		fobj = rcu_dereference(robj->fence);
> > > +		shared_count = fobj ? fobj->shared_count : 0;
> > >   		for (i = 0; i < shared_count; i++) {
> > >   			fence = rcu_dereference(fobj->shared[i]);
> > >   			if (!dma_fence_get_rcu(fence))
> > > @@ -1410,6 +1405,8 @@ static int dma_buf_debug_show(struct seq_file *s, void *unused)
> > >   			dma_fence_put(fence);
> > >   		}
> > >   		rcu_read_unlock();
> > > +		if (read_seqcount_retry(&robj->seq, seq))
> > > +			seq_printf(s, "\tFences concurrently modified\n");
> > >   		seq_puts(s, "\tAttached Devices:\n");
> > >   		attach_count = 0;
> > > -- 
> > > 2.25.1
> > > 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
