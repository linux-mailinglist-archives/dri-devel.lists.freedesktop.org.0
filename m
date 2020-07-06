Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF40A21676A
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jul 2020 09:27:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48C736E5AE;
	Tue,  7 Jul 2020 07:27:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4114C6E119;
 Mon,  6 Jul 2020 16:17:13 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id m26so22910924lfo.13;
 Mon, 06 Jul 2020 09:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=cABH94MOiXKXL8yndza/T2t3RrdaGl2zE7lGDIUzINk=;
 b=XoX2opiqdygN1vAvWssde0XpffK6rJt5JrYJ/HT8UsI0BBIkJ/6tlc2N31e/aKXGKl
 b6/VSFm+G5gXny0oFTjCkOjt9kltUyky4pntmw+g9Px4JW1J+lMccrZbN5OFNKhnAxQY
 4A3M/+eY0gf9oRgSQBfTmUvQWedzhRVb5iQpYsoBK2p7Y2G73oWXAW5LcwAckACRrnqO
 H0Cy7RNBPFhQ0BzS2VD5LIjlOfRAdPWtU7XqFOjO4edKI+UyWVCIEtPxmkIp0XaQSAKu
 bkHN1rN9SQ1MtsMLXdy6kwwA/Y0uBZcNMetiBsVuuMp7k3ELo+WLoD2oqb+KS2/XFFqm
 1oBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cABH94MOiXKXL8yndza/T2t3RrdaGl2zE7lGDIUzINk=;
 b=p3N0wRZFk7d/uYXC4NR5IvlzNfHJxRRcujiUeNL1Q+A7oeiG32OGle96m/efxE8uhL
 /neDUaV6GG18NlXhO5FixCBcmMMM+6v7KKbZGaZGLxMCmNgVDRJt0U1yKl+6jpw9f54u
 iVfreGHkvR3vrCWoom8A/+6F44VmOmuct2nYUmU2BjQ3Ppzov3OFjdprLMXsPzc8C8wp
 J53VQ8UklyYPCMQUuxenunwa1hqdPQCCbjCx4JYuQW9kD8zZ/6xpqdvsHg9iALC4oNzo
 FbXhWTA+xGrR5ABVUPzQhth5uut/IoN/y8btU356t6osIQjL2mzB03wUd1iJZXDtdNZy
 6cdQ==
X-Gm-Message-State: AOAM530hpNPUCDREGHSSUP3X0Y5jPt4pxOMkzI6B4a33K/z2f1T5XXX+
 mIuy9xoanCqD43ZhZ6dRR00=
X-Google-Smtp-Source: ABdhPJx8N1eTfVqPegV35ULkhQu6i8hHvX5pJQlkm5nWLu5hOwbzF5nfIHd9GRJ+VoW+qF2BwPvIJA==
X-Received: by 2002:a19:701:: with SMTP id 1mr30150295lfh.138.1594052231604;
 Mon, 06 Jul 2020 09:17:11 -0700 (PDT)
Received: from [192.168.1.108] ([5.20.204.163])
 by smtp.gmail.com with ESMTPSA id e16sm7942488ljn.12.2020.07.06.09.17.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jul 2020 09:17:10 -0700 (PDT)
Subject: Re: [PATCH] drm/lima: Expose job_hang_limit module parameter
To: Qiang Yu <yuq825@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 lima@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <CAKGbVbtYusvURFcUyQtgUycNJPAQyDGDaLXW8qw-x49DqfKmQA@mail.gmail.com>
 <20200619075900.3030696-1-andrey.lebedev@gmail.com>
From: Andrey Lebedev <andrey.lebedev@gmail.com>
Message-ID: <bd4370f5-6fb4-d32f-5ca4-02e56526f47d@gmail.com>
Date: Mon, 6 Jul 2020 19:17:09 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200619075900.3030696-1-andrey.lebedev@gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 07 Jul 2020 07:26:57 +0000
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
Cc: andrey@lebedev.lt
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello guys,

What is the status of this patch? Was this committed to any branch? Is 
it pending for merge to the mainline? Do I have to do anything in order 
to make it mergeable?

On 6/19/20 10:58 AM, Andrey Lebedev wrote:
> From: Andrey Lebedev <andrey@lebedev.lt>
> 
> Some pp or gp jobs can be successfully repeated even after they time outs.
> Introduce lima module parameter to specify number of times a job can hang
> before being dropped.
> 
> Signed-off-by: Andrey Lebedev <andrey@lebedev.lt>
> ---
> 
> Now all types are correct (uint).
> 
>   drivers/gpu/drm/lima/lima_drv.c   | 4 ++++
>   drivers/gpu/drm/lima/lima_drv.h   | 1 +
>   drivers/gpu/drm/lima/lima_sched.c | 5 +++--
>   3 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/lima/lima_drv.c b/drivers/gpu/drm/lima/lima_drv.c
> index a831565af813..ab460121fd52 100644
> --- a/drivers/gpu/drm/lima/lima_drv.c
> +++ b/drivers/gpu/drm/lima/lima_drv.c
> @@ -19,6 +19,7 @@
>   int lima_sched_timeout_ms;
>   uint lima_heap_init_nr_pages = 8;
>   uint lima_max_error_tasks;
> +uint lima_job_hang_limit;
>   
>   MODULE_PARM_DESC(sched_timeout_ms, "task run timeout in ms");
>   module_param_named(sched_timeout_ms, lima_sched_timeout_ms, int, 0444);
> @@ -29,6 +30,9 @@ module_param_named(heap_init_nr_pages, lima_heap_init_nr_pages, uint, 0444);
>   MODULE_PARM_DESC(max_error_tasks, "max number of error tasks to save");
>   module_param_named(max_error_tasks, lima_max_error_tasks, uint, 0644);
>   
> +MODULE_PARM_DESC(job_hang_limit, "number of times to allow a job to hang before dropping it (default 0)");
> +module_param_named(job_hang_limit, lima_job_hang_limit, uint, 0444);
> +
>   static int lima_ioctl_get_param(struct drm_device *dev, void *data, struct drm_file *file)
>   {
>   	struct drm_lima_get_param *args = data;
> diff --git a/drivers/gpu/drm/lima/lima_drv.h b/drivers/gpu/drm/lima/lima_drv.h
> index fdbd4077c768..c738d288547b 100644
> --- a/drivers/gpu/drm/lima/lima_drv.h
> +++ b/drivers/gpu/drm/lima/lima_drv.h
> @@ -11,6 +11,7 @@
>   extern int lima_sched_timeout_ms;
>   extern uint lima_heap_init_nr_pages;
>   extern uint lima_max_error_tasks;
> +extern uint lima_job_hang_limit;
>   
>   struct lima_vm;
>   struct lima_bo;
> diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
> index e6cefda00279..1602985dfa04 100644
> --- a/drivers/gpu/drm/lima/lima_sched.c
> +++ b/drivers/gpu/drm/lima/lima_sched.c
> @@ -503,8 +503,9 @@ int lima_sched_pipe_init(struct lima_sched_pipe *pipe, const char *name)
>   
>   	INIT_WORK(&pipe->recover_work, lima_sched_recover_work);
>   
> -	return drm_sched_init(&pipe->base, &lima_sched_ops, 1, 0,
> -			      msecs_to_jiffies(timeout), name);
> +	return drm_sched_init(&pipe->base, &lima_sched_ops, 1,
> +			      lima_job_hang_limit, msecs_to_jiffies(timeout),
> +			      name);
>   }
>   
>   void lima_sched_pipe_fini(struct lima_sched_pipe *pipe)
> 

-- 
Andrey Lebedev aka -.- . -.. -.. . .-.
Software engineer
Homepage: http://lebedev.lt/
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
