Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB71A503FA
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 16:57:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E2D510E7DF;
	Wed,  5 Mar 2025 15:57:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lDXJJSJq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 309EA10E7ED
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Mar 2025 15:57:28 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-38dcac27bcbso703250f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Mar 2025 07:57:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741190246; x=1741795046; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XI41wk7TJF7vmtgJL7omJXUR4bG71r2Wzk7v83CVjD0=;
 b=lDXJJSJqiuNjTIeO0h0suscnt7HCYck2ncke8VI1JLp42eJHviFrZ9ZS2GoV61VZij
 FKKwmBwcf7L7TAo5mPFCV/JspfRZKdcdEelJBF8/C+vCci2fKlJSIeDgfYX2ABc4z6TY
 u+bgWbGqMkmttwqdEoMsiCf6WbQgYp9qLsdG3zF+tO6iC5mRs7U144LfpFK+qcdHEBn+
 K4kmiErGpjps7CRf2BoJm+YjOWr4TYjUeE+rRw2eufH7CL5sGeq2GvXyfXbuD07HIBtM
 kqrQdObuAXm3Alb/q/DqO+7WFBMjK3Ek+1+z515/30t4ZGSB149uTI3aK1su1P28VtVj
 q32A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741190246; x=1741795046;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XI41wk7TJF7vmtgJL7omJXUR4bG71r2Wzk7v83CVjD0=;
 b=SwKKrKQIQ29ut+jodrzo1CL1lO+0bNSgf4urk6N++J4YKYcpGAH2sutDvhTZo1s3JH
 UDpjo5NJZ25NU0hYhoMLVW9Q0A7OdfEQtrwjQ6I4VXgb45V/3jQfgVmm/pOiNJ5SKLWY
 /gLmsmVeYp1sS2RtcOnJ178Z23pipJM+cs55GmCOa3awtJ970nI9z8AOi8yWz61oFc+S
 oeq1zUGUwj0CSxwd8elldRbB5ZLDOesV7N04KgteWRir4OwbkSqCg664cevfWQrg3ogu
 GioeWpWKsszhE50GNSj3DCtyaj1o+y+Euht4bzNngfSFAUPvjZsWILRx+hUX77QjHxhF
 YHSQ==
X-Gm-Message-State: AOJu0YzYzMfXDe5tVRuq3EZNuhzYJX//SmKOX6kvkWuJla4gll0FgCI2
 51JgzOOdVqM7OOKvfVyKSXZPwIF0O7dX/yUHVdEizm7WVsHTWh2Y
X-Gm-Gg: ASbGnctWyaQ2e7+FnV8UQ77QqrIMSWLRCy2XOVNoVW0mxM7TxGAH7BLDL5C5sx7AxbR
 Fao/gR13P19z0KlNeGHX2SP42tyU3k/TFX27DkGBtQoZGSt4b4Puh5ZI0NY/nGKlZH6lSZ19ehp
 isK3YtXPWwfHATZpbWpW7yGv13bRA8Y925LOcJ2hf6dZ5yI/K8bZp0gGWfwjVZnaczAqYS+geMu
 /or1OAfutcp0riOT1SaBMOoH5BpGhrbtCbAMts2dJfgjj68kJy+6aS7rubZb6HdBHsmsy42Lxa0
 6WcwZPJTmShk4pjRVfnRqiyHBc5NrfE6ClwQDbq7vNFXqUWZ3K1D8xNmraZbvs/iUdkHKc9yCw=
 =
X-Google-Smtp-Source: AGHT+IG8pXdepBcJ1AR4MauBkYvzdHDIviuaQyGBb5FOBK8tpHOPFUi2Wq2zbnf73b21vVo0+XSzYA==
X-Received: by 2002:a5d:64cf:0:b0:385:faf5:ebb8 with SMTP id
 ffacd0b85a97d-3911e9df687mr3609690f8f.7.1741190244836; 
 Wed, 05 Mar 2025 07:57:24 -0800 (PST)
Received: from [10.254.108.83] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390e47a7b88sm21222369f8f.40.2025.03.05.07.57.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Mar 2025 07:57:24 -0800 (PST)
Message-ID: <f54b78d8-2f10-484f-a1a9-4659aac2b251@gmail.com>
Date: Wed, 5 Mar 2025 16:57:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/sched: drm_sched_job_cleanup(): correct false doc
To: Philipp Stanner <phasta@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250304141346.102683-2-phasta@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20250304141346.102683-2-phasta@kernel.org>
Content-Type: text/plain; charset=UTF-8
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

Am 04.03.25 um 15:13 schrieb Philipp Stanner:
> drm_sched_job_cleanup()'s documentation claims that calling
> drm_sched_job_arm() is a "point of no return", implying that afterwards
> a job cannot be cancelled anymore.
>
> This is not correct, as proven by the function's code itself, which
> takes a previous call to drm_sched_job_arm() into account. In truth, the
> decisive factors are whether fences have been shared (e.g., with other
> processes) and if the job has been submitted to an entity already.
>
> Correct the wrong docstring.
>
> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
> Changes in v2:
>   - Also adjust comment about arm inside function's body. (Tvrtko)
> ---
>  drivers/gpu/drm/scheduler/sched_main.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index c634993f1346..7e71e89cea89 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -1013,11 +1013,13 @@ EXPORT_SYMBOL(drm_sched_job_has_dependency);
>   * Cleans up the resources allocated with drm_sched_job_init().
>   *
>   * Drivers should call this from their error unwind code if @job is aborted
> - * before drm_sched_job_arm() is called.
> + * before it was submitted to an entity with drm_sched_entity_push_job().
>   *
> - * After that point of no return @job is committed to be executed by the
> - * scheduler, and this function should be called from the
> - * &drm_sched_backend_ops.free_job callback.
> + * Since calling drm_sched_job_arm() causes the job's fences to be initialized,
> + * it is up to the driver to ensure that fences that were exposed to external
> + * parties get signaled. drm_sched_job_cleanup() does not ensure this.
> + *
> + * This function must also be called in &struct drm_sched_backend_ops.free_job
>   */
>  void drm_sched_job_cleanup(struct drm_sched_job *job)
>  {
> @@ -1028,7 +1030,7 @@ void drm_sched_job_cleanup(struct drm_sched_job *job)
>  		/* drm_sched_job_arm() has been called */
>  		dma_fence_put(&job->s_fence->finished);
>  	} else {
> -		/* aborted job before committing to run it */
> +		/* aborted job before arming */
>  		drm_sched_fence_free(job->s_fence);
>  	}
>  

