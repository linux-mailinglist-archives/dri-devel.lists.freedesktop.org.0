Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C5463756F
	for <lists+dri-devel@lfdr.de>; Thu, 24 Nov 2022 10:43:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D695510E6B8;
	Thu, 24 Nov 2022 09:43:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FF9210E080
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Nov 2022 09:43:31 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id vp12so1613132ejc.8
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Nov 2022 01:43:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2RPW8A8622IBfO1EX5iRm8HxiUyxrUE7FK5Jnq+yG/M=;
 b=otDsLaoj6m8sjFQenn/qaHPEk1row/8usasDE1e9/mvhHyyjyZEdx9XgDl6enKOHbJ
 PLCkcrz+c4/IWc5w1MwZ7weH5EBbibB381Mc7rUd4zvCUguLSb4eipvJhuWCHCpFQjBg
 6MkyzCGj4taZ98hndmuRbKBeTwQ194I4ZeIm+NcA03AuvtXUFsitoKsEruswn+57zM8J
 LZNvPI+k2NJ78HS2IyS8CeKNuAiuLHseG3snx5mVjtgKuAsktsFfdbA4Ne/n1D03gL2e
 a9Ki40VRxMD1AvXOX/70LW1KD/OgrnPJPqZEtQrcSj7YxmHnP9X0mjtY8hqMGOOvoYpi
 o0OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2RPW8A8622IBfO1EX5iRm8HxiUyxrUE7FK5Jnq+yG/M=;
 b=OsSjs3egPkknfRMSzhh6pXSoPG/D9e2FGEaASRbI/CWGfyPCW2uNZ7wrwN077qnHnV
 jZ81MTr3zitGZwXtqgf7h9zKraUlYxrJCq6AkvErli6AV4sl4AO2TRpBPRLm+45ol60f
 RrN2H6DEHCy2wG+92mp0dn5rEwtBOUPWWfV8dT0a1Ahr7wkm4aRKhSsf+/wZZ+9S1/7d
 1UizKifnbSoa38vTEER3HQ4cKAELs1Wla/6qvM+R8myfVzVmwcc08j1ITCrB8mzcpd+6
 Nl+kzmckeoBxusuopTM7CNN1BurVnqr5Q7SIkhDVCMraQFpOO3OTh6Z/XbJ6hjptfA4w
 Hopw==
X-Gm-Message-State: ANoB5pm5+5bx4FWK4OIOeRVVgIVrpYLlB1RAFfkFdGJgqN5ZdifHkXZn
 BOj10aNT4hQgS0bfeKFlQanYkj3IWgE=
X-Google-Smtp-Source: AA0mqf6Rch2fQrPwnw9noSmJ5cc6rZAo9kXxOVzWmvs3GZ5yxKzJEnZh47tcO3zkLZ8JM8YTUyrsTw==
X-Received: by 2002:a17:906:3c4d:b0:78d:f2d8:4623 with SMTP id
 i13-20020a1709063c4d00b0078df2d84623mr28003859ejg.274.1669283009642; 
 Thu, 24 Nov 2022 01:43:29 -0800 (PST)
Received: from [192.168.178.21] (p5b0ea229.dip0.t-ipconnect.de. [91.14.162.41])
 by smtp.gmail.com with ESMTPSA id
 11-20020a170906300b00b00781e7d364ebsm230155ejz.144.2022.11.24.01.43.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Nov 2022 01:43:28 -0800 (PST)
Message-ID: <63972059-1c23-ceb9-841c-1cfee29a1c77@gmail.com>
Date: Thu, 24 Nov 2022 10:43:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [Linaro-mm-sig] Re: [PATCH] dma-buf: A collection of typo and
 documentation fixes
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "T.J. Mercier" <tjmercier@google.com>, Sumit Semwal
 <sumit.semwal@linaro.org>, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
References: <20221123193519.3948105-1-tjmercier@google.com>
 <260a86f0-057e-e235-ac38-abeb922d0dc1@amd.com>
 <Y38z6A5IF/BlXVPp@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <Y38z6A5IF/BlXVPp@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Am 24.11.22 um 10:05 schrieb Daniel Vetter:
> On Thu, Nov 24, 2022 at 08:03:09AM +0100, Christian König wrote:
>> Am 23.11.22 um 20:35 schrieb T.J. Mercier:
>>> I've been collecting these typo fixes for a while and it feels like
>>> time to send them in.
>>>
>>> Signed-off-by: T.J. Mercier <tjmercier@google.com>
>> Acked-by: Christian König <christian.koenig@amd.com>
> Will you also push this? I think tj doesn't have commit rights yet, and I
> somehow can't see the patch locally (I guess it's stuck in moderation).

I was just about to complain that this doesn't apply cleanly to 
drm-misc-next.

Trivial problem, one of the typos was just removed by Dimitry a few 
weeks ago.

I've fixed that up locally and pushed the result, but nevertheless 
please make sure that DMA-buf patches are based on the drm branches.

Thanks,
Christian.

> -Daniel
>
>>> ---
>>>    drivers/dma-buf/dma-buf.c | 14 +++++++-------
>>>    include/linux/dma-buf.h   |  6 +++---
>>>    2 files changed, 10 insertions(+), 10 deletions(-)
>>>
>>> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
>>> index dd0f83ee505b..614ccd208af4 100644
>>> --- a/drivers/dma-buf/dma-buf.c
>>> +++ b/drivers/dma-buf/dma-buf.c
>>> @@ -1141,7 +1141,7 @@ EXPORT_SYMBOL_NS_GPL(dma_buf_unmap_attachment, DMA_BUF);
>>>     *
>>>     * @dmabuf:	[in]	buffer which is moving
>>>     *
>>> - * Informs all attachmenst that they need to destroy and recreated all their
>>> + * Informs all attachments that they need to destroy and recreate all their
>>>     * mappings.
>>>     */
>>>    void dma_buf_move_notify(struct dma_buf *dmabuf)
>>> @@ -1159,11 +1159,11 @@ EXPORT_SYMBOL_NS_GPL(dma_buf_move_notify, DMA_BUF);
>>>    /**
>>>     * DOC: cpu access
>>>     *
>>> - * There are mutliple reasons for supporting CPU access to a dma buffer object:
>>> + * There are multiple reasons for supporting CPU access to a dma buffer object:
>>>     *
>>>     * - Fallback operations in the kernel, for example when a device is connected
>>>     *   over USB and the kernel needs to shuffle the data around first before
>>> - *   sending it away. Cache coherency is handled by braketing any transactions
>>> + *   sending it away. Cache coherency is handled by bracketing any transactions
>>>     *   with calls to dma_buf_begin_cpu_access() and dma_buf_end_cpu_access()
>>>     *   access.
>>>     *
>>> @@ -1190,7 +1190,7 @@ EXPORT_SYMBOL_NS_GPL(dma_buf_move_notify, DMA_BUF);
>>>     *   replace ION buffers mmap support was needed.
>>>     *
>>>     *   There is no special interfaces, userspace simply calls mmap on the dma-buf
>>> - *   fd. But like for CPU access there's a need to braket the actual access,
>>> + *   fd. But like for CPU access there's a need to bracket the actual access,
>>>     *   which is handled by the ioctl (DMA_BUF_IOCTL_SYNC). Note that
>>>     *   DMA_BUF_IOCTL_SYNC can fail with -EAGAIN or -EINTR, in which case it must
>>>     *   be restarted.
>>> @@ -1264,10 +1264,10 @@ static int __dma_buf_begin_cpu_access(struct dma_buf *dmabuf,
>>>     * preparations. Coherency is only guaranteed in the specified range for the
>>>     * specified access direction.
>>>     * @dmabuf:	[in]	buffer to prepare cpu access for.
>>> - * @direction:	[in]	length of range for cpu access.
>>> + * @direction:	[in]	direction of access.
>>>     *
>>>     * After the cpu access is complete the caller should call
>>> - * dma_buf_end_cpu_access(). Only when cpu access is braketed by both calls is
>>> + * dma_buf_end_cpu_access(). Only when cpu access is bracketed by both calls is
>>>     * it guaranteed to be coherent with other DMA access.
>>>     *
>>>     * This function will also wait for any DMA transactions tracked through
>>> @@ -1307,7 +1307,7 @@ EXPORT_SYMBOL_NS_GPL(dma_buf_begin_cpu_access, DMA_BUF);
>>>     * actions. Coherency is only guaranteed in the specified range for the
>>>     * specified access direction.
>>>     * @dmabuf:	[in]	buffer to complete cpu access for.
>>> - * @direction:	[in]	length of range for cpu access.
>>> + * @direction:	[in]	direction of access.
>>>     *
>>>     * This terminates CPU access started with dma_buf_begin_cpu_access().
>>>     *
>>> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
>>> index 71731796c8c3..1d61a4f6db35 100644
>>> --- a/include/linux/dma-buf.h
>>> +++ b/include/linux/dma-buf.h
>>> @@ -330,7 +330,7 @@ struct dma_buf {
>>>    	 * @lock:
>>>    	 *
>>>    	 * Used internally to serialize list manipulation, attach/detach and
>>> -	 * vmap/unmap. Note that in many cases this is superseeded by
>>> +	 * vmap/unmap. Note that in many cases this is superseded by
>>>    	 * dma_resv_lock() on @resv.
>>>    	 */
>>>    	struct mutex lock;
>>> @@ -365,7 +365,7 @@ struct dma_buf {
>>>    	 */
>>>    	const char *name;
>>> -	/** @name_lock: Spinlock to protect name acces for read access. */
>>> +	/** @name_lock: Spinlock to protect name access for read access. */
>>>    	spinlock_t name_lock;
>>>    	/**
>>> @@ -402,7 +402,7 @@ struct dma_buf {
>>>    	 *   anything the userspace API considers write access.
>>>    	 *
>>>    	 * - Drivers may just always add a write fence, since that only
>>> -	 *   causes unecessarily synchronization, but no correctness issues.
>>> +	 *   causes unnecessary synchronization, but no correctness issues.
>>>    	 *
>>>    	 * - Some drivers only expose a synchronous userspace API with no
>>>    	 *   pipelining across drivers. These do not set any fences for their

