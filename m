Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9FF786C2F
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 11:42:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DF7210E511;
	Thu, 24 Aug 2023 09:42:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F225010E515
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 09:42:21 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-51bece5d935so8319083a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 02:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692870140; x=1693474940;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wjGIWwx9sMqqDG4N0HeXS9byjWgyDyOJOPKv8Cpifs8=;
 b=sePIHjLQiTnleOV5GoSLYhUfJFrfCxpJXhIB9zbk67whQZHbpN8qokQ5usK23OMfQT
 araDscwvMtKVxYqkgH2unppqRTai0xCKgCKUmuRdRb29nYgeu2mkNFqxSTxGwVauoBxq
 zaScxgfi0YtXTYDWIiHmP+BcwSpDy5ME7rEJBAw+RO9LUhQHmhnM0uhQ7pPkax0g+Xmy
 LkmXjPlv6JOPXVCnp50OUkmELNyNfqX1Xcge1cl6BwODCsOOJV8NWq34FnMKbjf/j55O
 6uUtqUYwalEfw3vLB0/aWt5+nUZQeOHnGmJzJmH0TFDsMBdezCEPsNXDImldpCPm7YPe
 IQ2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692870140; x=1693474940;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wjGIWwx9sMqqDG4N0HeXS9byjWgyDyOJOPKv8Cpifs8=;
 b=QK7C+YulIWTzKtXs0M935to/NM4NsTx0pk5bwG2nqApFspihpwvQMnhLarvYQ+Xqz9
 ovnRgpEnURXDBdeTlp3XlAufwG2bDJbumu7DrpSCOIm9tzeIolaUXAnzc0yg8i4AYOFZ
 CCKPoJvv/zQcFWcyGNJAtkEHJalquDRUSWh9MsGFwU17i9ciCgHqHKE0adGNKZiFxWGr
 NCGhNy/zTsE+hKZ+JSEkWfT1Y0T2iPxYt6biaVuXoXiG+mrJjyOx2VA8MTDIhkuDLj4T
 9BTgOVNIR3qTNbhqxi1cB/1kuOI5/sUcQm+ZtxTFRhDBMRLiKcl6rlWmu2jfRifULffk
 NkxQ==
X-Gm-Message-State: AOJu0YxDIkwro7wudnvEw93owKVCAMZQxhSzT4q4dkJLCkjyAs6Q7PEY
 RGfnSqXXN6K5UmVr7Ezgh58=
X-Google-Smtp-Source: AGHT+IHHj0Z4GE4VEpBXOqxHymqAxmvG7gD4sWN1EVfNANnc4VAKwXJAvMT1o/1+L1vUGkYCIDbXCg==
X-Received: by 2002:aa7:c54f:0:b0:523:47cf:5034 with SMTP id
 s15-20020aa7c54f000000b0052347cf5034mr10061173edr.34.1692870140139; 
 Thu, 24 Aug 2023 02:42:20 -0700 (PDT)
Received: from [192.168.178.25] ([134.19.100.78])
 by smtp.gmail.com with ESMTPSA id
 i15-20020a50fc0f000000b0051e1660a34esm10229017edr.51.2023.08.24.02.42.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Aug 2023 02:42:19 -0700 (PDT)
Message-ID: <d085c6e4-36d2-cd69-bb43-3c8d46da5239@gmail.com>
Date: Thu, 24 Aug 2023 11:42:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [Linaro-mm-sig] [PATCH 10/20] drm/scheduler/sched_main: Provide
 short description of missing param 'result'
Content-Language: en-US
To: Lee Jones <lee@kernel.org>
References: <20230824073710.2677348-1-lee@kernel.org>
 <20230824073710.2677348-11-lee@kernel.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20230824073710.2677348-11-lee@kernel.org>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>, linaro-mm-sig@lists.linaro.org,
 Luben Tuikov <luben.tuikov@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 24.08.23 um 09:36 schrieb Lee Jones:
> Fixes the following W=1 kernel build warning(s):
>
>   drivers/gpu/drm/scheduler/sched_main.c:266: warning: Function parameter or member 'result' not described in 'drm_sched_job_done'
>
> Signed-off-by: Lee Jones <lee@kernel.org>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
> Cc: Luben Tuikov <luben.tuikov@amd.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org
> ---
>   drivers/gpu/drm/scheduler/sched_main.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 506371c427451..1ef558cda60ce 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -259,6 +259,7 @@ drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
>   /**
>    * drm_sched_job_done - complete a job
>    * @s_job: pointer to the job which is done
> + * @result: fence error to forward and set
>    *
>    * Finish the job's fence and wake up the worker thread.
>    */

