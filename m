Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA4A4A506D
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jan 2022 21:45:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE82110E3E2;
	Mon, 31 Jan 2022 20:45:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9425910E3E2
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jan 2022 20:45:25 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 l12-20020a7bc34c000000b003467c58cbdfso262334wmj.2
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jan 2022 12:45:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=DKliILyWleLP9p6shtxyrGCmReRwzPxlgvxOVNe4ILs=;
 b=gavOKU41Z2PgjXghhDKB6UqqvbETpsoZY8DzgYsai61Oje1kwNbcUyMjgQfQPpUvEA
 dPOuj2PvzV9Vd0jX4yM6gwcBu0l9k7D+0HeCITC6dSzZQWXnQOgYQdWqHw5TxXZ6kaTn
 L7t5iv5qdPdUB3UZ+k2DW8MXpNTobKwl5lrRM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=DKliILyWleLP9p6shtxyrGCmReRwzPxlgvxOVNe4ILs=;
 b=hc0eCAUI4C5O8/9hsCEQ55WSTcdquH5uWPfGxwBcr/DzxV47jrUjHyFLjICUYEoalA
 pAYeVq20P11AehUDopgAOYTh2vH6O+AM814hzX3wtSXXDNCWYRhIeVFhPf36Xldveu3C
 NLdVw1IlIR/4QJlWMSR42z3nEGdwKZGL+qDnIUSiPrfMRzZBMQAg4B+Evu0jJ5egjOSS
 RSb1W1KXOE7/YttUxCeQY9VDVaWq03mzJ0xNshrSTwDruXOEVyXpgqk0v6pJSsb0lnxf
 LvtjjKrDCJ8vuAHd/x2aCA5+q+erRejLM5tHscyu0ImRBvlN1Fv0exYSXdkpiAgs2VaU
 hzZg==
X-Gm-Message-State: AOAM531c1Ppc+ePQnVaa4cHYikL5pdTKtg1EbU8yNN3aG++3xVgS+c6Y
 zAf7xFyQOeBxii9D1ozxLA1W7KfZpFGknw==
X-Google-Smtp-Source: ABdhPJy+gjcccs2gMucor32Ho4o6IXkTQwR34+nwPWJWpa8rWE5wCt7agozeVKWOLxOAROAhOEWsFw==
X-Received: by 2002:a05:600c:282:: with SMTP id 2mr2716817wmk.24.1643661924148; 
 Mon, 31 Jan 2022 12:45:24 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id o6sm14678588wrc.65.2022.01.31.12.45.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 12:45:23 -0800 (PST)
Date: Mon, 31 Jan 2022 21:45:00 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] dma-resv: some doc polish for iterators
Message-ID: <YfhKTK62lpAG+Y1O@phenom.ffwll.local>
References: <20211130091609.1335915-1-daniel.vetter@ffwll.ch>
 <20211130152756.1388106-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211130152756.1388106-1-daniel.vetter@ffwll.ch>
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
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, Daniel Vetter <daniel.vetter@intel.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 30, 2021 at 04:27:55PM +0100, Daniel Vetter wrote:
> Hammer it a bit more in that iterators can be restarted and when that
> matters, plus suggest to prefer the locked version whenver.
> 
> Also delete the two leftover kerneldoc for static functions plus
> sprinkle some more links while at it.
> 
> v2: Keep some comments (Christian)
> 
> Reviewed-by: Christian König <christian.koenig@amd.com>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org

Soooooo behind on random stuff, just noticed I never merged this. Done
that now.
-Daniel

> ---
>  drivers/dma-buf/dma-resv.c | 29 +++++++++++++++--------------
>  include/linux/dma-resv.h   | 13 ++++++++++++-
>  2 files changed, 27 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
> index 9eb2baa387d4..a62eb8fc33b9 100644
> --- a/drivers/dma-buf/dma-resv.c
> +++ b/drivers/dma-buf/dma-resv.c
> @@ -323,12 +323,8 @@ void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *fence)
>  }
>  EXPORT_SYMBOL(dma_resv_add_excl_fence);
>  
> -/**
> - * dma_resv_iter_restart_unlocked - restart the unlocked iterator
> - * @cursor: The dma_resv_iter object to restart
> - *
> - * Restart the unlocked iteration by initializing the cursor object.
> - */
> +/* Restart the iterator by initializing all the necessary fields, but not the
> + * relation to the dma_resv object. */
>  static void dma_resv_iter_restart_unlocked(struct dma_resv_iter *cursor)
>  {
>  	cursor->seq = read_seqcount_begin(&cursor->obj->seq);
> @@ -344,14 +340,7 @@ static void dma_resv_iter_restart_unlocked(struct dma_resv_iter *cursor)
>  	cursor->is_restarted = true;
>  }
>  
> -/**
> - * dma_resv_iter_walk_unlocked - walk over fences in a dma_resv obj
> - * @cursor: cursor to record the current position
> - *
> - * Return all the fences in the dma_resv object which are not yet signaled.
> - * The returned fence has an extra local reference so will stay alive.
> - * If a concurrent modify is detected the whole iteration is started over again.
> - */
> +/* Walk to the next not signaled fence and grab a reference to it */
>  static void dma_resv_iter_walk_unlocked(struct dma_resv_iter *cursor)
>  {
>  	struct dma_resv *obj = cursor->obj;
> @@ -387,6 +376,12 @@ static void dma_resv_iter_walk_unlocked(struct dma_resv_iter *cursor)
>   * dma_resv_iter_first_unlocked - first fence in an unlocked dma_resv obj.
>   * @cursor: the cursor with the current position
>   *
> + * Subsequent fences are iterated with dma_resv_iter_next_unlocked().
> + *
> + * Beware that the iterator can be restarted.  Code which accumulates statistics
> + * or similar needs to check for this with dma_resv_iter_is_restarted(). For
> + * this reason prefer the locked dma_resv_iter_first() whenver possible.
> + *
>   * Returns the first fence from an unlocked dma_resv obj.
>   */
>  struct dma_fence *dma_resv_iter_first_unlocked(struct dma_resv_iter *cursor)
> @@ -406,6 +401,10 @@ EXPORT_SYMBOL(dma_resv_iter_first_unlocked);
>   * dma_resv_iter_next_unlocked - next fence in an unlocked dma_resv obj.
>   * @cursor: the cursor with the current position
>   *
> + * Beware that the iterator can be restarted.  Code which accumulates statistics
> + * or similar needs to check for this with dma_resv_iter_is_restarted(). For
> + * this reason prefer the locked dma_resv_iter_next() whenver possible.
> + *
>   * Returns the next fence from an unlocked dma_resv obj.
>   */
>  struct dma_fence *dma_resv_iter_next_unlocked(struct dma_resv_iter *cursor)
> @@ -431,6 +430,8 @@ EXPORT_SYMBOL(dma_resv_iter_next_unlocked);
>   * dma_resv_iter_first - first fence from a locked dma_resv object
>   * @cursor: cursor to record the current position
>   *
> + * Subsequent fences are iterated with dma_resv_iter_next_unlocked().
> + *
>   * Return the first fence in the dma_resv object while holding the
>   * &dma_resv.lock.
>   */
> diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
> index dbd235ab447f..ebe908592ac3 100644
> --- a/include/linux/dma-resv.h
> +++ b/include/linux/dma-resv.h
> @@ -153,6 +153,13 @@ struct dma_resv {
>   * struct dma_resv_iter - current position into the dma_resv fences
>   *
>   * Don't touch this directly in the driver, use the accessor function instead.
> + *
> + * IMPORTANT
> + *
> + * When using the lockless iterators like dma_resv_iter_next_unlocked() or
> + * dma_resv_for_each_fence_unlocked() beware that the iterator can be restarted.
> + * Code which accumulates statistics or similar needs to check for this with
> + * dma_resv_iter_is_restarted().
>   */
>  struct dma_resv_iter {
>  	/** @obj: The dma_resv object we iterate over */
> @@ -243,7 +250,11 @@ static inline bool dma_resv_iter_is_restarted(struct dma_resv_iter *cursor)
>   * &dma_resv.lock and using RCU instead. The cursor needs to be initialized
>   * with dma_resv_iter_begin() and cleaned up with dma_resv_iter_end(). Inside
>   * the iterator a reference to the dma_fence is held and the RCU lock dropped.
> - * When the dma_resv is modified the iteration starts over again.
> + *
> + * Beware that the iterator can be restarted when the struct dma_resv for
> + * @cursor is modified. Code which accumulates statistics or similar needs to
> + * check for this with dma_resv_iter_is_restarted(). For this reason prefer the
> + * lock iterator dma_resv_for_each_fence() whenever possible.
>   */
>  #define dma_resv_for_each_fence_unlocked(cursor, fence)			\
>  	for (fence = dma_resv_iter_first_unlocked(cursor);		\
> -- 
> 2.33.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
