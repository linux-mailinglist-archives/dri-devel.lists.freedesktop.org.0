Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A615BBDA093
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 16:37:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E4DC10E626;
	Tue, 14 Oct 2025 14:37:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="XD7Il1jF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F25F810E626
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 14:37:05 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-42420c7de22so2511545f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 07:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1760452624; x=1761057424;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Cf42nKdih4C/az+WZNM+2wo5VErVCKmo/IFqhLG0QiI=;
 b=XD7Il1jFOQhb9/eJF7CGTmOtxUVCaIKkRxqOzzgWL3gkZNxMAiQ8xsMRSjMlS/DUBQ
 YLkYTL/mvVPjDJvA4FsmNwMGH1Kf8wJ22jB5u94StPocbvtKeh1HCyy0dDTZ0/j7LhhP
 Q2TolsVOzQ6S6/wu5UsHuwlhdeb8PiHQOtX3Yeo/8x9ojiUBJdRQPV5LBDcpzpYumxSo
 e4hwNZTnl3UERjCaI/8chv/s0X/cH74YqKTKNQL+5+vF+sAifGCV9YZBPtwphgWxU3vr
 0ioKYLO4Oex8DnYy3LRfhEUlZ23pCxcjyTp+KwpCD4oOBjsveVIlKYKRzP5zi457wfB9
 iTYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760452624; x=1761057424;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Cf42nKdih4C/az+WZNM+2wo5VErVCKmo/IFqhLG0QiI=;
 b=Iir8F9PmAmyrF8X4g2Fqh5DFfmJBHyLji6uxQDnj/0romb/mVrH8bQ1TA/rPa2sFOP
 Mn2VNM/qa0reb9WhGU8HF4Ri3iYsvWU4LzZKhWYNfr19TaZ9WdRrYAgq9CHbIipcdK+W
 sQ018/GYV7CD6Al+m87SqmnKHJ0LS8Md4xnz1RLRfnf9QQ75YIuwV91bRL8+qV1mLCa+
 l/8xheXTIKeySCCIa3u8SYRwB0XSf/MUIiqcCR1e+eaalyAjfCiz9zglbpdU4t8tWmUo
 Y2YjHYy4n5DqBt+y5mX9HQ5WRLAXAtVf8ENI0rkFZXq1/9nBbOKMMCTsTztxgCjzK7HQ
 1WpA==
X-Gm-Message-State: AOJu0YwfQRXKrw4TIEaY+7SbMI9yAm3p+gaM6graTYEX5QpUq6A1mxfC
 fHItsK/1vYsWLf62h0SbO5Rmv4Q8cWTo1asC6zgS+RrfOpCF+LDOzdbGBFyXR+5k0Uk=
X-Gm-Gg: ASbGncsbZK3Z2wBHMCYR/df8RJEjFiklvkmKLD/Qh3595y64sSGR+WdI3N/oDywFwN7
 XA3MJJ0gUXrrtFiOxQSo4AtdIqHxifSLylMi5QACJFVhQlqIt0CiCqZ/RRMKtuOqmHeADRO1t5N
 vpAhvnnIENTx5QIrewns46Kcq3tFNPc1BDNgiFfrIY4oH1JhK2gRqcR25hEVnEkDZv8PA4CGaP4
 b7Qg6XA4Pj5yOl0sRXStUtRnMcZQbqMV6iXDSRF0aVLjqSq0ED2grkJRwglHD6mjddciLJBY54p
 0YGq2rpXvU/UfmbNuXCiOXyQX+3AERWx/Uzac1Cdl4Ln5h38hNwiOEncfMZKmhxiUk40tjhqWEO
 zV6iUvpVMqjJyVcnneDB7E9Oe2oWv1LmdsEVuiDagpnX6B6+I6i1LpElA
X-Google-Smtp-Source: AGHT+IHmSKdBolOSQPRnk5mteVCHyJhZFNTsKQJQaSc97q7rl/bD05KyrRM354zP3VyYFN9kv2TqBQ==
X-Received: by 2002:a05:6000:2601:b0:3ec:b899:bc39 with SMTP id
 ffacd0b85a97d-4266e8e9004mr16943169f8f.58.1760452624287; 
 Tue, 14 Oct 2025 07:37:04 -0700 (PDT)
Received: from [192.168.0.101] ([90.242.12.242])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426ce57cc0esm24255483f8f.6.2025.10.14.07.37.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Oct 2025 07:37:03 -0700 (PDT)
Message-ID: <c32fa361-9331-4cc6-a155-33cc6339038b@ursulin.net>
Date: Tue, 14 Oct 2025 15:37:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/15] dma-buf: cleanup dma_fence_describe
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 phasta@mailbox.org, alexdeucher@gmail.com, simona.vetter@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20251013143502.1655-1-christian.koenig@amd.com>
 <20251013143502.1655-2-christian.koenig@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20251013143502.1655-2-christian.koenig@amd.com>
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


On 13/10/2025 14:48, Christian König wrote:
> The driver and timeline name are meaningless for signaled fences.
> 
> Drop them and also print the context number.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/dma-buf/dma-fence.c | 11 ++++++-----
>   1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> index 3f78c56b58dc..f0539c73ed57 100644
> --- a/drivers/dma-buf/dma-fence.c
> +++ b/drivers/dma-buf/dma-fence.c
> @@ -1001,17 +1001,18 @@ void dma_fence_describe(struct dma_fence *fence, struct seq_file *seq)
>   {
>   	const char __rcu *timeline;
>   	const char __rcu *driver;
> +	const char *signaled = "un";
>   
>   	rcu_read_lock();
>   
>   	timeline = dma_fence_timeline_name(fence);
>   	driver = dma_fence_driver_name(fence);
>   
> -	seq_printf(seq, "%s %s seq %llu %ssignalled\n",
> -		   rcu_dereference(driver),
> -		   rcu_dereference(timeline),
> -		   fence->seqno,
> -		   dma_fence_is_signaled(fence) ? "" : "un");
> +	if (dma_fence_is_signaled(fence))
> +		timeline = driver = signaled = "";

FWIW you could avoid calling dma_fence_timeline_name() and 
dma_fence_driver_name() since you added the signaled check.

May end up slightly nicer than to override strings returned from helpers 
with a chained assignment.

Or even store the signaled status in a local bool and branch off two 
seq_printfs based on it.

> +
> +	seq_printf(seq, "%llu %s %s seq %llu %ssignalled\n", fence->context,
> +		   timeline, driver, fence->seqno, signaled);

I was initially worried if this string ends up anywhere which could be 
considered ABI but it seems debugfs only so changing the formatting is fine.

How about making dma_fence_describe() conditional on CONFIG_DEBUG_FS to 
set this in stone? (And dma_resv_describe..)

And maybe unify the %llu:%llu context:fence as the tracepoints use?

Altogether something like:

rcu_read_lock();

signaled = dma_fence_is_signaled(fence);

if (signaled)
	seq_printf("%llu:%llu %s %s signalled",
		   fence->context,
		   fence->seqno,
		   dma_fence_timeline_name(fence),
		   dma_fence_timeline_name(fence);
else
	seq_print("%llu:%llu unsignalled",
		  fence->seqno, fence->context);

Maybe more readable but up to you.

Regards,

Tvrtko
>   	rcu_read_unlock();
>   }

