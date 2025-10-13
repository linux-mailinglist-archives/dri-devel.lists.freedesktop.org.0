Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3998BBD2F23
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 14:20:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E88C610E11A;
	Mon, 13 Oct 2025 12:20:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="C8UgZi6J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACCF410E11A
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 12:20:18 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-46e34052bb7so50087715e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 05:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1760358017; x=1760962817;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nwPBtVzaWo36hivYjisnYZie4hF0IMzUbnAFNXBWzL4=;
 b=C8UgZi6JVD3tux3XNc2lo+xsqVJ29z2awE3pOEZBW5/FCurw3SHL9ONG3PTo5ovIsK
 1XKe2s7tiwmKhFuaRhsc1cQqusA40uHAcCoeaaDYKEUcxBehcsRorllvMwD1Sf1wBCkJ
 kfv7MAzOOkglGPAtvKuvrZf/XtuH1+6MRsHg0PORbNh4y+iDBfFo4g9ODubScsxBw4tc
 NHoFSlxdn8ugOt64WB98ejhQxcMiKvsCvSKmaybyp8aLwOb8QpluwrEcFoECeLE5dLmh
 bJ3Ygzt6wtFXdnwypwPCggwOLKxMVFYlVQxqHjCkZdcLTvf7OJtFsgXm0npJ/tW/oBsS
 x0mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760358017; x=1760962817;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nwPBtVzaWo36hivYjisnYZie4hF0IMzUbnAFNXBWzL4=;
 b=GdNI2B5urS9GmqBlbS+TsxvPZ4RfbQbo4RY7XH8hXgpP1LfXOe2cz5ovLLB5FP59hO
 y3EWbcjGmom+YJAaKGFFoLTxbgedwD+SEgsidIh+ruH45TMmO9GTH9alDyuy0WcldYwi
 FyvMPBdkVnlzYMXdxeQ35EAVyMoPBcQpb8P0ukcUQOMOVQ9FGgh5jp+Ol556Anhe79Z4
 LWJzAHmkfdks7HbWvwfiGoSJTgwLFkEV8Drldm7yibryWDKlXAYVk2w+GyDHiLd6PHYI
 NmoL+IBaVNfF/UxLMT+9U59/fs/sbPXxg+ZvfhpnW3U0ppZL4ZtMfwKyXWIG1uvS0i5E
 l6VQ==
X-Gm-Message-State: AOJu0Yz7yFsbz9npCUfX/zd3eUf04+in8wqL7VpsdtQ6+pq/lBRh2wNb
 yBKJQJPTGE4eWi/1Hce9r/k9T8aV2l3shYpkJM6leqsDkKgJ0HHePIrVnZBz/Gzsh4s=
X-Gm-Gg: ASbGncvOFYraPI2RWy8q8zxW5U/Jc8WuJ5DEe8lzxenZFIvFHN2RNWQHlK5UHCJ6f64
 vDis9Ng6dr3pc9gsnvHTZ0dzUk3Ev55z5UrRCyL6DPaC71RqMmyznRpLfIygDzTqleM3PN10v4Y
 YVwEKmagIFeTIU1N8Wsrw7YxEKQp2YM1dROVnrOQV/n1wdOveJrO8B91VrvzFcviKAefXlkTPAa
 2OZgtNPN1fAfJRNEzU7vQJtOymNRyVR/Z0WmhgvjNTgpX0cp1OOWryc8Vej7oF8ET0kMLfXgEO2
 zw+6Q4czW+tYtfIwOLoyVq5KOoZDhAdbIOX46C/aahR5PpgUKw6h7SPiGdGO6cNG6qjgqAxkdwW
 4gg4sRS4ua/fePLDpfYAxWLuwvMyY02lkFqtvA3OVlS9s48/mJRi5Hw==
X-Google-Smtp-Source: AGHT+IGX/AgrL3dHZjIFyO0yIQjVQ8JpLbWaakeo7HGCj7Fhm8sEdEMMwy8fhLNldeBaV5STGHOaFQ==
X-Received: by 2002:a05:600c:46cf:b0:46e:35a0:3587 with SMTP id
 5b1f17b1804b1-46fa9b02cebmr136926125e9.27.1760358016616; 
 Mon, 13 Oct 2025 05:20:16 -0700 (PDT)
Received: from [192.168.0.101] ([84.66.36.92])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46fb497aea6sm184960825e9.4.2025.10.13.05.20.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Oct 2025 05:20:16 -0700 (PDT)
Message-ID: <1490c292-c244-4dd9-80a6-3fecd0ffb422@ursulin.net>
Date: Mon, 13 Oct 2025 13:20:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sched: Mandate usage of drm_sched_job_cleanup()
To: Philipp Stanner <phasta@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250926123630.200920-2-phasta@kernel.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20250926123630.200920-2-phasta@kernel.org>
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


On 26/09/2025 13:36, Philipp Stanner wrote:
> drm_sched_job_cleanup()'s documentation so far uses relatively soft
> language, only "recommending" usage of the function. To avoid memory
> leaks and, potentiall, other bugs, however, the function has to be used.
> 
> Demand usage of the function explicitly.
> 
> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> ---
>   drivers/gpu/drm/scheduler/sched_main.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 46119aacb809..0a9df9e61963 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -1030,7 +1030,7 @@ EXPORT_SYMBOL(drm_sched_job_has_dependency);
>    *
>    * Cleans up the resources allocated with drm_sched_job_init().
>    *
> - * Drivers should call this from their error unwind code if @job is aborted
> + * Drivers need to call this from their error unwind code if @job is aborted

Should is indeed wrong. I think it could be better to go with "shall" or 
"must" though. Since those two are more standard language for this.

>    * before drm_sched_job_arm() is called.
>    *
>    * drm_sched_job_arm() is a point of no return since it initializes the fences
> @@ -1038,7 +1038,7 @@ EXPORT_SYMBOL(drm_sched_job_has_dependency);
>    * submit it with drm_sched_entity_push_job() and cannot simply abort it by
>    * calling drm_sched_job_cleanup().
>    *
> - * This function should be called in the &drm_sched_backend_ops.free_job callback.
> + * This function must be called in the &drm_sched_backend_ops.free_job callback.
>    */
>   void drm_sched_job_cleanup(struct drm_sched_job *job)
>   {

Hm, having read the thread so far the situation seems not so easy to 
untangle.

On one hand I see Matt's point that free_job callback is a bit 
misleadingly named and that there isn't anything really requiring 
drm_sched_job_cleanup() to be called exactly from there. Free_job 
semantics seem to be "job is done, *scheduler* is done with it".

Drm_sched_job_cleanup() already says it has to be called after the point 
of no return (arm) so it could be left at drivers discretion (de facto 
state today) to choose how and when to do it.

What I did not get is what is actually the perceived problem with 
letting this stay? (Ie. "should" indicating it is recommended, but not a 
must/shall.)

Regards,

Tvrtko

