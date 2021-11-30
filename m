Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA63463457
	for <lists+dri-devel@lfdr.de>; Tue, 30 Nov 2021 13:32:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20D0C6E96F;
	Tue, 30 Nov 2021 12:32:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DE5E6E91E
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 12:32:46 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id l25so85839743eda.11
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 04:32:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=d1Bn56NVWcvPf46Qrzjbzii821X2nvEc2fZCcd4IdUs=;
 b=JqwJ/5aIUKtANy36PP4QBvvaXySnaIqe2pZot+4pWo0saNTu1KCsL1sQCTZ5OUYEQU
 +a90+v5WZBxRA42BRECjDm2HUpE6XsO9/CelHgQQ4Zor21Mw5RWCV7/nEwAeHaHqD/A3
 DdhDUBA5Tv8BH7aEbcofx9rXY8NIoQ1tRatjw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=d1Bn56NVWcvPf46Qrzjbzii821X2nvEc2fZCcd4IdUs=;
 b=mrCD8Nm8+Pfcygz/J5xSxOMCz6UXa0iznMXHT2l1fFjO9T1BzX5hE1j4Xzas9goin3
 2EskaclbEzumGM18NpA3l3452LT3htPyTZa3RxMJZpjoQ4u8slm2teUVCmOdwrkgJLLH
 21CTP9b022+OsyX+zY7WtYy0NP17Z5ydCbREXNb/t49p3andv2OreHpfVrSi6EinuvfY
 +dJGSVRQCKz2UOQcEox8D9Kf4Zh+e8gya7j0eSLUTajcSkqCpvx1pSDJ82Ez3nwImx44
 z2R9chtCgAV8tlNozCPXj9911xYfn1pHwni3lynBwCbNDgU7GruHsZIN6D3YGBO9YFVR
 WEGQ==
X-Gm-Message-State: AOAM5336lU1O+auQMNJnPJfof8RtGddS9tKzTaYEV3NWKvfxo3/96JdV
 lWH/AF/V7gUoF0peldjSqSNQVg==
X-Google-Smtp-Source: ABdhPJz5iF1qgSvyAyxGbOpVLyReEM5ZHyZeJfy6LZfs6T8ZBcNxCjhKk6F2zLtpziOgRJrcx0veFQ==
X-Received: by 2002:a17:906:4787:: with SMTP id
 cw7mr72199096ejc.311.1638275565133; 
 Tue, 30 Nov 2021 04:32:45 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id sd28sm10007710ejc.37.2021.11.30.04.32.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 04:32:44 -0800 (PST)
Date: Tue, 30 Nov 2021 13:32:42 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [Linaro-mm-sig] [PATCH] dma-resv: some doc polish for iterators
Message-ID: <YaYZ6ku36GgDoioN@phenom.ffwll.local>
References: <20211130091609.1335915-1-daniel.vetter@ffwll.ch>
 <02d35f5a-ad89-b78d-a31f-51ea1579b9cd@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <02d35f5a-ad89-b78d-a31f-51ea1579b9cd@gmail.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 linaro-mm-sig@lists.linaro.org, Daniel Vetter <daniel.vetter@intel.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 30, 2021 at 11:04:11AM +0100, Christian König wrote:
> Am 30.11.21 um 10:16 schrieb Daniel Vetter:
> > Hammer it a bit more in that iterators can be restarted and when that
> > matters, plus suggest to prefer the locked version whenver.
> > 
> > Also delete the two leftover kerneldoc for static functions plus
> > sprinkle some more links while at it.
> > 
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > Cc: "Christian König" <christian.koenig@amd.com>
> > Cc: linux-media@vger.kernel.org
> > Cc: linaro-mm-sig@lists.linaro.org
> > ---
> >   drivers/dma-buf/dma-resv.c | 26 ++++++++++++--------------
> >   include/linux/dma-resv.h   | 13 ++++++++++++-
> >   2 files changed, 24 insertions(+), 15 deletions(-)
> > 
> > diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
> > index 9eb2baa387d4..1453b664c405 100644
> > --- a/drivers/dma-buf/dma-resv.c
> > +++ b/drivers/dma-buf/dma-resv.c
> > @@ -323,12 +323,6 @@ void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *fence)
> >   }
> >   EXPORT_SYMBOL(dma_resv_add_excl_fence);
> > -/**
> > - * dma_resv_iter_restart_unlocked - restart the unlocked iterator
> > - * @cursor: The dma_resv_iter object to restart
> > - *
> > - * Restart the unlocked iteration by initializing the cursor object.
> > - */
> 
> Maybe instead of completely removing the documentation add a single line of
> what this is supposed to do and not to do.
> 
> E.g. "/* Restart the iterator by initializing all the necessary fields, but
> not the relation to the dma_resv object. */

I figured the names are selfexplanatory enough, but makes sense to keep a
bit more detail.
-Daniel

> 
> >   static void dma_resv_iter_restart_unlocked(struct dma_resv_iter *cursor)
> >   {
> >   	cursor->seq = read_seqcount_begin(&cursor->obj->seq);
> > @@ -344,14 +338,6 @@ static void dma_resv_iter_restart_unlocked(struct dma_resv_iter *cursor)
> >   	cursor->is_restarted = true;
> >   }
> > -/**
> > - * dma_resv_iter_walk_unlocked - walk over fences in a dma_resv obj
> > - * @cursor: cursor to record the current position
> > - *
> > - * Return all the fences in the dma_resv object which are not yet signaled.
> > - * The returned fence has an extra local reference so will stay alive.
> > - * If a concurrent modify is detected the whole iteration is started over again.
> > - */
> 
> Same here, something /* Walk to the next not signaled fence and grab a
> reference to it */.
> 
> Apart from that feel free add Reviewed-by: Christian König
> <christian.koenig@amd.com>
> 
> Regards,
> Christian.
> 
> >   static void dma_resv_iter_walk_unlocked(struct dma_resv_iter *cursor)
> >   {
> >   	struct dma_resv *obj = cursor->obj;
> > @@ -387,6 +373,12 @@ static void dma_resv_iter_walk_unlocked(struct dma_resv_iter *cursor)
> >    * dma_resv_iter_first_unlocked - first fence in an unlocked dma_resv obj.
> >    * @cursor: the cursor with the current position
> >    *
> > + * Subsequent fences are iterated with dma_resv_iter_next_unlocked().
> > + *
> > + * Beware that the iterator can be restarted.  Code which accumulates statistics
> > + * or similar needs to check for this with dma_resv_iter_is_restarted(). For
> > + * this reason prefer the locked dma_resv_iter_first() whenver possible.
> > + *
> >    * Returns the first fence from an unlocked dma_resv obj.
> >    */
> >   struct dma_fence *dma_resv_iter_first_unlocked(struct dma_resv_iter *cursor)
> > @@ -406,6 +398,10 @@ EXPORT_SYMBOL(dma_resv_iter_first_unlocked);
> >    * dma_resv_iter_next_unlocked - next fence in an unlocked dma_resv obj.
> >    * @cursor: the cursor with the current position
> >    *
> > + * Beware that the iterator can be restarted.  Code which accumulates statistics
> > + * or similar needs to check for this with dma_resv_iter_is_restarted(). For
> > + * this reason prefer the locked dma_resv_iter_next() whenver possible.
> > + *
> >    * Returns the next fence from an unlocked dma_resv obj.
> >    */
> >   struct dma_fence *dma_resv_iter_next_unlocked(struct dma_resv_iter *cursor)
> > @@ -431,6 +427,8 @@ EXPORT_SYMBOL(dma_resv_iter_next_unlocked);
> >    * dma_resv_iter_first - first fence from a locked dma_resv object
> >    * @cursor: cursor to record the current position
> >    *
> > + * Subsequent fences are iterated with dma_resv_iter_next_unlocked().
> > + *
> >    * Return the first fence in the dma_resv object while holding the
> >    * &dma_resv.lock.
> >    */
> > diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
> > index dbd235ab447f..ebe908592ac3 100644
> > --- a/include/linux/dma-resv.h
> > +++ b/include/linux/dma-resv.h
> > @@ -153,6 +153,13 @@ struct dma_resv {
> >    * struct dma_resv_iter - current position into the dma_resv fences
> >    *
> >    * Don't touch this directly in the driver, use the accessor function instead.
> > + *
> > + * IMPORTANT
> > + *
> > + * When using the lockless iterators like dma_resv_iter_next_unlocked() or
> > + * dma_resv_for_each_fence_unlocked() beware that the iterator can be restarted.
> > + * Code which accumulates statistics or similar needs to check for this with
> > + * dma_resv_iter_is_restarted().
> >    */
> >   struct dma_resv_iter {
> >   	/** @obj: The dma_resv object we iterate over */
> > @@ -243,7 +250,11 @@ static inline bool dma_resv_iter_is_restarted(struct dma_resv_iter *cursor)
> >    * &dma_resv.lock and using RCU instead. The cursor needs to be initialized
> >    * with dma_resv_iter_begin() and cleaned up with dma_resv_iter_end(). Inside
> >    * the iterator a reference to the dma_fence is held and the RCU lock dropped.
> > - * When the dma_resv is modified the iteration starts over again.
> > + *
> > + * Beware that the iterator can be restarted when the struct dma_resv for
> > + * @cursor is modified. Code which accumulates statistics or similar needs to
> > + * check for this with dma_resv_iter_is_restarted(). For this reason prefer the
> > + * lock iterator dma_resv_for_each_fence() whenever possible.
> >    */
> >   #define dma_resv_for_each_fence_unlocked(cursor, fence)			\
> >   	for (fence = dma_resv_iter_first_unlocked(cursor);		\
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
