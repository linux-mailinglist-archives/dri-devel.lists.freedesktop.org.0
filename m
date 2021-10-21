Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B59B04360E0
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 13:56:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CF976EC3F;
	Thu, 21 Oct 2021 11:56:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECD2F6EC3F
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 11:56:41 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id m22so789860wrb.0
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 04:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=tipS7N5yav3Dx/jlzgATLo8VVL5iNZFGHeuQOZQGv/w=;
 b=SS2t/buSb67O1NYxGKAuEEauT/4qXAuPRCCPc2mLKXGhTOh5sdbUxGjtwXz2B/Jnko
 rzjHEEpo8DtBXp5IFDWf11UMGJ1IG0dHjJk7NZE/+7SzW4GlFHIvETuIAS8QvPaWKw4A
 dLowZAMZzRmcH1cj1e+nmSo5IACB1PVUQ4Uuo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=tipS7N5yav3Dx/jlzgATLo8VVL5iNZFGHeuQOZQGv/w=;
 b=NlLI3MScLRJEINUdYw66amNS3nXv37uNFkUFacpW03T97Gh4Pw3p2M5P/3b4RfqDVW
 /byOvlfO5iF8fTS/ymncS3njs+bWv5DcwLJ+M3MiBDhRhOEuUd1D4AqDd0dmFKbmPgij
 MXF8DqZn64REfKxQ7KpXPLpZsFLtVwJyu6NdjkbIva6c0w99huTXeYPnIJqHYQA3es2d
 UKPODQU9XGWyV4/6qASnOfpGAdO30uRwf4fHVdqDSwSUlL16DMZDxgeNvlWpy3BgC2SF
 EuKiBSP5mVko2FKikelR37BeN4O/VjmKjA8A1x2ZRO45+HyDq+WSsyjKN873V/eTE/C1
 KDPg==
X-Gm-Message-State: AOAM532hHmWsLnIifYCGqSkRbBkx9L1XEHNPGhTN4I/UJy+8yyurRrdL
 QLNqHECqdp+BLQHfht2u3s/ABQ==
X-Google-Smtp-Source: ABdhPJxTe+eIT1EvfxsMNYYe2uTeC7S6FzgyKJkCobRUTkR97f3vIDkIBHu+9iZrHICYIGZwyjlZkw==
X-Received: by 2002:a5d:6e91:: with SMTP id k17mr6726709wrz.260.1634817400401; 
 Thu, 21 Oct 2021 04:56:40 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id p25sm7600883wma.2.2021.10.21.04.56.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 04:56:40 -0700 (PDT)
Date: Thu, 21 Oct 2021 13:56:38 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Gurchetan Singh <gurchetansingh@chromium.org>
Cc: dri-devel@lists.freedesktop.org, kaleshsingh@google.com,
 daniel@ffwll.ch, rostedt@goodmis.org
Subject: Re: [RFC PATCH 1/8] tracing/gpu: modify gpu_mem_total
Message-ID: <YXFVdkeGHvOoTpZ0@phenom.ffwll.local>
References: <20211021031027.537-1-gurchetansingh@chromium.org>
 <20211021031027.537-2-gurchetansingh@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211021031027.537-2-gurchetansingh@chromium.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 20, 2021 at 08:10:20PM -0700, Gurchetan Singh wrote:
> The existing gpu_mem_total tracepoint [1] is not currently used by
> any in-tree consumers, we should add some.
> 
> In addition, there's a desire to report imported memory via the
> counters too [2].
> 
> To do this, we'll have to redefine the event to:
> 
> a) Change 'pid' to 'ctx_id'
> 
> The reason is  DRM subsystem is created with GEM objects, DRM devices
> and DRM files in mind.  A GEM object is associated with DRM device,
> and it may be shared between one or more DRM files.
> 
> Per-instance (or "context") counters make more sense than per-process
> counters for DRM.  For GPUs that per process counters (kgsl), this
> change is backwards compatible.
> 
> b) add an "import_mem_total" field
> 
> We're just appending a field, so no problem here.  Change "size" to
> "mem_total" as well (name changes are backwards compatible).
> 
> [1] https://lore.kernel.org/r/20200302234840.57188-1-zzyiwei@google.com/
> [2] https://www.spinics.net/lists/kernel/msg4062769.html
> 
> Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>

Yay, that patch is just impressive. Lands a new gpu tracepoints, never
even showed up on the gpu subsystem discussion list.

Imo just delete this and start over with something proper, that's actually
used by drivers.
-Daniel

> ---
>  include/trace/events/gpu_mem.h | 61 ++++++++++++++++++++++++----------
>  1 file changed, 43 insertions(+), 18 deletions(-)
> 
> diff --git a/include/trace/events/gpu_mem.h b/include/trace/events/gpu_mem.h
> index 26d871f96e94..198b87f50356 100644
> --- a/include/trace/events/gpu_mem.h
> +++ b/include/trace/events/gpu_mem.h
> @@ -14,41 +14,66 @@
>  #include <linux/tracepoint.h>
>  
>  /*
> - * The gpu_memory_total event indicates that there's an update to either the
> - * global or process total gpu memory counters.
> + * The gpu_mem_total event indicates that there's an update to local or
> + * global gpu memory counters.
>   *
> - * This event should be emitted whenever the kernel device driver allocates,
> - * frees, imports, unimports memory in the GPU addressable space.
> + * This event should be emitted whenever a GPU device (ctx_id == 0):
>   *
> - * @gpu_id: This is the gpu id.
> + *   1) allocates memory.
> + *   2) frees memory.
> + *   3) imports memory from an external exporter.
>   *
> - * @pid: Put 0 for global total, while positive pid for process total.
> + * OR when a GPU device instance (ctx_id != 0):
>   *
> - * @size: Size of the allocation in bytes.
> + *   1) allocates or acquires a reference to memory from another instance.
> + *   2) frees or releases a reference to memory from another instance.
> + *   3) imports memory from another GPU device instance.
>   *
> + * When ctx_id == 0, both mem_total and import_mem_total total counters
> + * represent a global total.  When ctx_id == 0, these counters represent
> + * an instance specifical total.
> + *
> + * Note allocation does not necessarily mean backing the memory with pages.
> + *
> + * @gpu_id: unique ID of the GPU.
> + *
> + * @ctx_id: an ID for specific instance of the GPU device.
> + *
> + * @mem_total: - total size of memory known to a GPU device, including
> + *		 imports (ctx_id == 0)
> + *	       - total size of memory known to a GPU device instance
> + *		 (ctx_id != 0)
> + *
> + * @import_mem_total: - size of memory imported from outside GPU
> + *			device (ctx_id == 0)
> + *		      - size of memory imported into GPU device instance.
> + *			(ctx_id == 0)
>   */
>  TRACE_EVENT(gpu_mem_total,
>  
> -	TP_PROTO(uint32_t gpu_id, uint32_t pid, uint64_t size),
> +	TP_PROTO(u32 gpu_id, u32 ctx_id, u64 mem_total, u64 import_mem_total),
>  
> -	TP_ARGS(gpu_id, pid, size),
> +	TP_ARGS(gpu_id, ctx_id, mem_total, import_mem_total),
>  
>  	TP_STRUCT__entry(
> -		__field(uint32_t, gpu_id)
> -		__field(uint32_t, pid)
> -		__field(uint64_t, size)
> +		__field(u32, gpu_id)
> +		__field(u32, ctx_id)
> +		__field(u64, mem_total)
> +		__field(u64, import_mem_total)
>  	),
>  
>  	TP_fast_assign(
>  		__entry->gpu_id = gpu_id;
> -		__entry->pid = pid;
> -		__entry->size = size;
> +		__entry->ctx_id = ctx_id;
> +		__entry->mem_total = mem_total;
> +		__entry->import_mem_total = import_mem_total;
>  	),
>  
> -	TP_printk("gpu_id=%u pid=%u size=%llu",
> -		__entry->gpu_id,
> -		__entry->pid,
> -		__entry->size)
> +	TP_printk("gpu_id=%u, ctx_id=%u, mem total=%llu, mem import total=%llu",
> +		  __entry->gpu_id,
> +		  __entry->ctx_id,
> +		  __entry->mem_total,
> +		  __entry->import_mem_total)
>  );
>  
>  #endif /* _TRACE_GPU_MEM_H */
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
