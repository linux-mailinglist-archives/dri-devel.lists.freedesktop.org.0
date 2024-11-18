Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 590F99D1297
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2024 15:04:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6301810E4DF;
	Mon, 18 Nov 2024 14:03:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ToHHmwDm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5A7710E4DE;
 Mon, 18 Nov 2024 14:03:56 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4315eac969aso24105875e9.1; 
 Mon, 18 Nov 2024 06:03:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731938635; x=1732543435; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QLVSAd65F3kzay2k04s+ucIRrq7MVSoMKuKcfsAr9cM=;
 b=ToHHmwDmeiZatutChkppAwkz4y/lXJWvXg54cHdMsGBO+loLXtWMRwe2VV2diKurba
 Y7NSwAhjdPOE3c0Tm7XJouxBN4D7LgStglbdP1C/FWbKk6ywiXgP+FBhzVGQgYJWpa+V
 PEHfFfh+doSYfkICMYdfIr/3ffO08bSNFtlJA/Vq6lQOLE1jwuQMOl/J4BlwjuEHSq59
 1haZfsK6Ng8w4U/HkB3PFMQ51PHTKNEvC34gCTq1iqDLPAR0J1y4HSlrY5vASMgo6I/b
 OHnR6l0W4yUbSVt/T8AKRslhpZw+z3g/Zc5HthJ/K+mlWm0JgFP83qved26CuIIOhDId
 heiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731938635; x=1732543435;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QLVSAd65F3kzay2k04s+ucIRrq7MVSoMKuKcfsAr9cM=;
 b=u0ZMG0usVHunqrUILsv76pqY6KOp7+Cezipu9bcJBkgi/6uC8tR1iLpawlKQbHA75m
 bXyPMIAj9L67yoZvMSlYrhoKEavUbw7W11vuTKUg3D9ixzNIjhUAbiHCXJwHhAIoXLQy
 6m48dLFN89sO/IO24GfRgDwcIJx4U7E2dKYLHjHHcIPCvpYZY3ogfsfC5Me7g9IBY7ge
 WhIjFuEeFKOdwOQQwR4yf5v9rnE1p/Jv0DKvk9c+XoJcsSFrVkQcBiewJI420+nPpw+I
 AUWN+xLwWNOsXimiJzHlaPeVSdT34qZEJtZpq7FQY9EkxKHdPdP6qre3wLs0/3WQI2NE
 ZwuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXKAmwWAoH2WWtH7+tvsP4cjMC0r4YEO+8LJrOSXDRHLWlfpvaCAl+k+m+lsLKRte+aHpbg8jjk@lists.freedesktop.org,
 AJvYcCXaSPxei6p1fq1V3REI+oa2gWcC2aYRjRUVL9DyB1oLYgphRru0EuiT4F3sHwHNRyxl1X8gdt3FqBDW@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxKi37gmH1yNPP+ov8P3rzvMCO0g2XZyosSNemJ0j+lAsvNKHJJ
 R966gsrkG/tIiwGpR/fv8UZe4T+a2+pUrf3ol+2gttw3bV2cekIJ
X-Google-Smtp-Source: AGHT+IFkFPdP9yQ1V5FQYfHddHd9JrLiZeWtNn85QWbNgeXn8nBR/CKz6fZvYiBn4bxzcERLpMOZ6w==
X-Received: by 2002:a05:600c:a4c:b0:42c:b991:98bc with SMTP id
 5b1f17b1804b1-432d95ad53cmr137284915e9.0.1731938634613; 
 Mon, 18 Nov 2024 06:03:54 -0800 (PST)
Received: from [192.168.178.25] ([185.254.126.212])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432dab80a10sm155478505e9.26.2024.11.18.06.03.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Nov 2024 06:03:53 -0800 (PST)
Message-ID: <93826dcc-82de-4fb5-8574-7e6cb8355da4@gmail.com>
Date: Mon, 18 Nov 2024 15:03:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/5] Documentation/gpu: Clarify drm memory stats
 definition
To: Yunxiang Li <Yunxiang.Li@amd.com>, amd-gfx@lists.freedesktop.org,
 christian.koenig@amd.com, tvrtko.ursulin@igalia.com
Cc: Alexander.Deucher@amd.com, dri-devel@lists.freedesktop.org
References: <20241116044452.5925-1-Yunxiang.Li@amd.com>
 <20241116044452.5925-4-Yunxiang.Li@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20241116044452.5925-4-Yunxiang.Li@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Am 16.11.24 um 05:44 schrieb Yunxiang Li:
> Define how to handle buffers with multiple possible placement so we
> don't get incompatible implementations. Callout the resident requirement
> for drm-purgeable- explicitly. Remove the requirement for there to be
> only drm-memory- or only drm-resident-, it's not what's implemented and
> having both is better for back-compat. Also re-order the paragraphs to
> flow better.
>
> Signed-off-by: Yunxiang Li <Yunxiang.Li@amd.com>
> CC: dri-devel@lists.freedesktop.org
> ---
>   Documentation/gpu/drm-usage-stats.rst | 36 ++++++++++++---------------
>   1 file changed, 16 insertions(+), 20 deletions(-)
>
> diff --git a/Documentation/gpu/drm-usage-stats.rst b/Documentation/gpu/drm-usage-stats.rst
> index ff964c707754a..973663f91a292 100644
> --- a/Documentation/gpu/drm-usage-stats.rst
> +++ b/Documentation/gpu/drm-usage-stats.rst
> @@ -140,13 +140,9 @@ both.
>   Memory
>   ^^^^^^
>   
> -- drm-memory-<region>: <uint> [KiB|MiB]
> -
> -Each possible memory type which can be used to store buffer objects by the
> -GPU in question shall be given a stable and unique name to be returned as the
> -string here.
> -
> -The region name "memory" is reserved to refer to normal system memory.
> +Each possible memory type which can be used to store buffer objects by the GPU
> +in question shall be given a stable and unique name to be used as the "<region>"
> +string. The region name "memory" is reserved to refer to normal system memory.

That looks like you squashed the "The region name..." sentence at the 
end. Is that really helpful and intended?

>   
>   Value shall reflect the amount of storage currently consumed by the buffer
>   objects belong to this client, in the respective memory region.
> @@ -154,31 +150,27 @@ objects belong to this client, in the respective memory region.
>   Default unit shall be bytes with optional unit specifiers of 'KiB' or 'MiB'
>   indicating kibi- or mebi-bytes.
>   
> -This key is deprecated and is an alias for drm-resident-<region>. Only one of
> -the two should be present in the output.
> +- drm-total-<region>: <uint> [KiB|MiB]
> +
> +The total size of all created buffers including shared and private memory. The

Maybe write "requested" instead of "created" since without a backing 
store it is questionable if the BO is really "created".

Apart from those two nit picks it looks good to me,
Christian.

> +backing store for the buffers does not have to be currently instantiated to
> +count under this category. To avoid double counting, if a buffer falls under
> +multiple regions, the implementation should pick only one of the regions, and do
> +so in a consistent manner.
>   
>   - drm-shared-<region>: <uint> [KiB|MiB]
>   
>   The total size of buffers that are shared with another file (e.g., have more
> -than a single handle).
> -
> -- drm-total-<region>: <uint> [KiB|MiB]
> -
> -The total size of all created buffers including shared and private memory. The
> -backing store for the buffers does not have to be currently instantiated to be
> -counted under this category.
> +than a single handle). Same caveat as drm-total- applies.
>   
>   - drm-resident-<region>: <uint> [KiB|MiB]
>   
>   The total size of buffers that are resident (have their backing store present or
>   instantiated) in the specified region.
>   
> -This is an alias for drm-memory-<region> and only one of the two should be
> -present in the output.
> -
>   - drm-purgeable-<region>: <uint> [KiB|MiB]
>   
> -The total size of buffers that are purgeable.
> +The total size of buffers that are resident and purgeable.
>   
>   For example drivers which implement a form of 'madvise' like functionality can
>   here count buffers which have instantiated backing store, but have been marked
> @@ -192,6 +184,10 @@ One practical example of this can be presence of unsignaled fences in an GEM
>   buffer reservation object. Therefore the active category is a subset of
>   resident.
>   
> +- drm-memory-<region>: <uint> [KiB|MiB]
> +
> +This key is deprecated and is an alias for drm-resident-<region> if present.
> +
>   Implementation Details
>   ======================
>   

