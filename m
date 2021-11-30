Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FBD9463096
	for <lists+dri-devel@lfdr.de>; Tue, 30 Nov 2021 11:04:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC5E56E4DE;
	Tue, 30 Nov 2021 10:04:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F38F6E4DE
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 10:04:14 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id l16so43126242wrp.11
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 02:04:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=qUpNgekNyximD/ZZ+bMBBXr7Phi7gZIz8V61NNp8tgo=;
 b=WP+g2YVtpy01qQBy/NPVv9xOI7b1EZNRxMy3jJSstwPLuYVnnmHghlwmStLQSFfMIK
 fVeLT57iP/v8dnvwGfqjG5wvUCIY2ye1GQCMT9MdE/cm7os16q70cILYP2HxYJgYR4Ib
 Hz4skL4sUJ5caFNZszd4K9VxAlFJlZXelN0Z5nZl/rr9P6Yr/FXuBa8oGpvTU9HwUMbT
 ekLvGGq+YWNjMoZX7cZNKgRaQa8bVhRtKYk8G7WOmT0IQ6aRr6CLUwvUw28ILZv+iArX
 2Zw6mpy7Vi+8Dyi3lMc0yNAQMSza9U69lt6qaPDE2mXI8KrpinBR98gEHpQC3Nkfkdw3
 289g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=qUpNgekNyximD/ZZ+bMBBXr7Phi7gZIz8V61NNp8tgo=;
 b=ZdQaCdPrVZHZuDnM70HIrp3Y/1uwqISUVjl5cxwLUTnNpS34kGAYHwbC5ViELsDQPL
 WZDbGjvcEu4YaKb/oCzoKXmwD0TorpldlbEZ3ZxCjqzomnp5/OakXIRK+oOkQlpdZtqX
 tafu9/0s5vc3BJ2+D1VQb78CNYgLwoTbHdt3hCZKDFOLOtxEO7iXSKakHMUfNE3zN7yT
 SxPfBJjJYjN+gGIF2sB66/+kgpDQtI+hbcHrBVaI3R61JdE0+NMV1ihdsXjaDvk2r8YQ
 rOG0JdTLL2tff7py71e6MsdEkrwa0LNWK5f76pyXACB/xD/GHKBTZpTWHVpRowDTMeGU
 g0Ag==
X-Gm-Message-State: AOAM531UuguBvlD0EJ0fyGWhzynngwbXx8+Sz6seyx6OA2tBYg1Xgdb3
 2rlOlPHvuWXhOh3LgA+M4Qk=
X-Google-Smtp-Source: ABdhPJzjbutJNOXAkWEmsKAebjDMvAKuEKhm44HQjrL4eZzObzxv9CY3HntAXQzyNBd4YRRZW/dLrg==
X-Received: by 2002:a05:6000:1a85:: with SMTP id
 f5mr39025117wry.361.1638266652608; 
 Tue, 30 Nov 2021 02:04:12 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:fa20:e17b:e063:b6d3?
 ([2a02:908:1252:fb60:fa20:e17b:e063:b6d3])
 by smtp.gmail.com with ESMTPSA id q4sm15615725wrs.56.2021.11.30.02.04.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Nov 2021 02:04:12 -0800 (PST)
Subject: Re: [Linaro-mm-sig] [PATCH] dma-resv: some doc polish for iterators
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20211130091609.1335915-1-daniel.vetter@ffwll.ch>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <02d35f5a-ad89-b78d-a31f-51ea1579b9cd@gmail.com>
Date: Tue, 30 Nov 2021 11:04:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211130091609.1335915-1-daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
Cc: linaro-mm-sig@lists.linaro.org, Daniel Vetter <daniel.vetter@intel.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 30.11.21 um 10:16 schrieb Daniel Vetter:
> Hammer it a bit more in that iterators can be restarted and when that
> matters, plus suggest to prefer the locked version whenver.
>
> Also delete the two leftover kerneldoc for static functions plus
> sprinkle some more links while at it.
>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org
> ---
>   drivers/dma-buf/dma-resv.c | 26 ++++++++++++--------------
>   include/linux/dma-resv.h   | 13 ++++++++++++-
>   2 files changed, 24 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
> index 9eb2baa387d4..1453b664c405 100644
> --- a/drivers/dma-buf/dma-resv.c
> +++ b/drivers/dma-buf/dma-resv.c
> @@ -323,12 +323,6 @@ void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *fence)
>   }
>   EXPORT_SYMBOL(dma_resv_add_excl_fence);
>   
> -/**
> - * dma_resv_iter_restart_unlocked - restart the unlocked iterator
> - * @cursor: The dma_resv_iter object to restart
> - *
> - * Restart the unlocked iteration by initializing the cursor object.
> - */

Maybe instead of completely removing the documentation add a single line 
of what this is supposed to do and not to do.

E.g. "/* Restart the iterator by initializing all the necessary fields, 
but not the relation to the dma_resv object. */

>   static void dma_resv_iter_restart_unlocked(struct dma_resv_iter *cursor)
>   {
>   	cursor->seq = read_seqcount_begin(&cursor->obj->seq);
> @@ -344,14 +338,6 @@ static void dma_resv_iter_restart_unlocked(struct dma_resv_iter *cursor)
>   	cursor->is_restarted = true;
>   }
>   
> -/**
> - * dma_resv_iter_walk_unlocked - walk over fences in a dma_resv obj
> - * @cursor: cursor to record the current position
> - *
> - * Return all the fences in the dma_resv object which are not yet signaled.
> - * The returned fence has an extra local reference so will stay alive.
> - * If a concurrent modify is detected the whole iteration is started over again.
> - */

Same here, something /* Walk to the next not signaled fence and grab a 
reference to it */.

Apart from that feel free add Reviewed-by: Christian König 
<christian.koenig@amd.com>

Regards,
Christian.

>   static void dma_resv_iter_walk_unlocked(struct dma_resv_iter *cursor)
>   {
>   	struct dma_resv *obj = cursor->obj;
> @@ -387,6 +373,12 @@ static void dma_resv_iter_walk_unlocked(struct dma_resv_iter *cursor)
>    * dma_resv_iter_first_unlocked - first fence in an unlocked dma_resv obj.
>    * @cursor: the cursor with the current position
>    *
> + * Subsequent fences are iterated with dma_resv_iter_next_unlocked().
> + *
> + * Beware that the iterator can be restarted.  Code which accumulates statistics
> + * or similar needs to check for this with dma_resv_iter_is_restarted(). For
> + * this reason prefer the locked dma_resv_iter_first() whenver possible.
> + *
>    * Returns the first fence from an unlocked dma_resv obj.
>    */
>   struct dma_fence *dma_resv_iter_first_unlocked(struct dma_resv_iter *cursor)
> @@ -406,6 +398,10 @@ EXPORT_SYMBOL(dma_resv_iter_first_unlocked);
>    * dma_resv_iter_next_unlocked - next fence in an unlocked dma_resv obj.
>    * @cursor: the cursor with the current position
>    *
> + * Beware that the iterator can be restarted.  Code which accumulates statistics
> + * or similar needs to check for this with dma_resv_iter_is_restarted(). For
> + * this reason prefer the locked dma_resv_iter_next() whenver possible.
> + *
>    * Returns the next fence from an unlocked dma_resv obj.
>    */
>   struct dma_fence *dma_resv_iter_next_unlocked(struct dma_resv_iter *cursor)
> @@ -431,6 +427,8 @@ EXPORT_SYMBOL(dma_resv_iter_next_unlocked);
>    * dma_resv_iter_first - first fence from a locked dma_resv object
>    * @cursor: cursor to record the current position
>    *
> + * Subsequent fences are iterated with dma_resv_iter_next_unlocked().
> + *
>    * Return the first fence in the dma_resv object while holding the
>    * &dma_resv.lock.
>    */
> diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
> index dbd235ab447f..ebe908592ac3 100644
> --- a/include/linux/dma-resv.h
> +++ b/include/linux/dma-resv.h
> @@ -153,6 +153,13 @@ struct dma_resv {
>    * struct dma_resv_iter - current position into the dma_resv fences
>    *
>    * Don't touch this directly in the driver, use the accessor function instead.
> + *
> + * IMPORTANT
> + *
> + * When using the lockless iterators like dma_resv_iter_next_unlocked() or
> + * dma_resv_for_each_fence_unlocked() beware that the iterator can be restarted.
> + * Code which accumulates statistics or similar needs to check for this with
> + * dma_resv_iter_is_restarted().
>    */
>   struct dma_resv_iter {
>   	/** @obj: The dma_resv object we iterate over */
> @@ -243,7 +250,11 @@ static inline bool dma_resv_iter_is_restarted(struct dma_resv_iter *cursor)
>    * &dma_resv.lock and using RCU instead. The cursor needs to be initialized
>    * with dma_resv_iter_begin() and cleaned up with dma_resv_iter_end(). Inside
>    * the iterator a reference to the dma_fence is held and the RCU lock dropped.
> - * When the dma_resv is modified the iteration starts over again.
> + *
> + * Beware that the iterator can be restarted when the struct dma_resv for
> + * @cursor is modified. Code which accumulates statistics or similar needs to
> + * check for this with dma_resv_iter_is_restarted(). For this reason prefer the
> + * lock iterator dma_resv_for_each_fence() whenever possible.
>    */
>   #define dma_resv_for_each_fence_unlocked(cursor, fence)			\
>   	for (fence = dma_resv_iter_first_unlocked(cursor);		\

