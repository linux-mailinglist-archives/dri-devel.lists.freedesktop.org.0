Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59ADA37AA63
	for <lists+dri-devel@lfdr.de>; Tue, 11 May 2021 17:14:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 257466EA5B;
	Tue, 11 May 2021 15:13:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19D756EA59
 for <dri-devel@lists.freedesktop.org>; Tue, 11 May 2021 15:13:58 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id b17so23335710ede.0
 for <dri-devel@lists.freedesktop.org>; Tue, 11 May 2021 08:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=47IMmsVPu4iAMpkkKngyoJdTSJvZ62kL9vHez5asz58=;
 b=lHPwKjpfFGCzkb+kFlEddo9W8ljl1q8AEx5CyfM7vjminOGhAB+yJe+KTcNrTISXHc
 QAFiKV7C9TO/22InYvykvJFTeBNo/mtdXW18S0GxROOz31RZJsYknQE85dtipGvbxVsz
 USItBn8D1MDULxEBPSlM28H/UOdevWUgW7kbo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=47IMmsVPu4iAMpkkKngyoJdTSJvZ62kL9vHez5asz58=;
 b=VW/MOWsYexaG2J1hYFilAVVstc89CClpniL2x/4u9E9Vo82GjONLMKHk6x56zXJh08
 tLE3HpwISxnOUlOKzRMic4iLnywULX4NXIMIOsI+jXHheOsBtoMFM555WiCVDynK0E3k
 9RHgiStIt3PEMY2doV9eGfA1AHAhHA1XhZy1yt6ob3T+UUmtTN54pMC8Ktd+lyv8TSTx
 nrGYIyaO6zj93Y9yh4GJDJmOISA8JZxyh2hS1ML+gb52GKbUeN7jM8XhxeHTjDBk9bDp
 TmywF4xaqdcawfIQ8FmVWWCZ8bITgXedEwDZuuzW7nPT3VwSsbA7tbaNQheHapDz8Et+
 znDQ==
X-Gm-Message-State: AOAM531kIxs39mIWWXFigssY3xRh/zuorX8wZjOSN5GfWAJePAx3ysuT
 bfAiESQS7wF917Gdebwz3i7jaQ==
X-Google-Smtp-Source: ABdhPJxMEC/mgDAlDrKjQuvkAjKxJ5Ot0U4bf8M9d68lukUgVjo1FSmvOx9scNl7sna1zyFdWZKKhw==
X-Received: by 2002:aa7:db95:: with SMTP id u21mr36877803edt.152.1620746036712; 
 Tue, 11 May 2021 08:13:56 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id b17sm14578466edr.80.2021.05.11.08.13.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 May 2021 08:13:56 -0700 (PDT)
Date: Tue, 11 May 2021 17:13:54 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Matthew Brost <matthew.brost@intel.com>
Subject: Re: [Intel-gfx] [RFC PATCH 5/5] drm/i915: Update execbuf IOCTL to
 accept N BBs
Message-ID: <YJqfMl8vgftwnoR1@phenom.ffwll.local>
References: <20210506173049.72503-1-matthew.brost@intel.com>
 <20210506173049.72503-6-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210506173049.72503-6-matthew.brost@intel.com>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
Cc: jason.ekstrand@intel.com, daniel.vetter@intel.com,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 carl.zhang@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 06, 2021 at 10:30:49AM -0700, Matthew Brost wrote:
> Add I915_EXEC_NUMBER_BB_* to drm_i915_gem_execbuffer2.flags which allows
> submitting N BBs per IOCTL.
> 
> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: Tony Ye <tony.ye@intel.com>
> CC: Carl Zhang <carl.zhang@intel.com>
> Cc: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Jason Ekstrand <jason@jlekstrand.net>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

I dropped my big question on the previous patch already, I'll check this
out again when it's all squashed into the parallel extension patch so we
have everything in one commit.
-Daniel

> ---
>  include/uapi/drm/i915_drm.h | 21 ++++++++++++++++++++-
>  1 file changed, 20 insertions(+), 1 deletion(-)
> 
> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
> index 0175b12b33b8..d3072cad4a7e 100644
> --- a/include/uapi/drm/i915_drm.h
> +++ b/include/uapi/drm/i915_drm.h
> @@ -1291,7 +1291,26 @@ struct drm_i915_gem_execbuffer2 {
>   */
>  #define I915_EXEC_USE_EXTENSIONS	(1 << 21)
>  
> -#define __I915_EXEC_UNKNOWN_FLAGS (-(I915_EXEC_USE_EXTENSIONS << 1))
> +/*
> + * Number of BB in execbuf2 IOCTL - 1, used to submit more than BB in a single
> + * execbuf2 IOCTL.
> + *
> + * Return -EINVAL if more than 1 BB (value 0) is specified if
> + * I915_CONTEXT_ENGINES_EXT_PARALLEL_SUBMIT hasn't been called on the gem
> + * context first. Also returns -EINVAL if gem context has been setup with
> + * I915_PARALLEL_NO_PREEMPT_MID_BATCH and the number BBs not equal to the total
> + * number hardware contexts in the gem context.
> + */
> +#define I915_EXEC_NUMBER_BB_LSB		(22)
> +#define I915_EXEC_NUMBER_BB_MASK	(0x3f << I915_EXEC_NUMBER_BB_LSB)
> +#define I915_EXEC_NUMBER_BB_MSB		(27)
> +#define i915_execbuffer2_set_number_bb(eb2, num_bb) \
> +	(eb2).flags = ((eb2).flags & ~I915_EXEC_NUMBER_BB_MASK) | \
> +	(((num_bb - 1) << I915_EXEC_NUMBER_BB_LSB) & I915_EXEC_NUMBER_BB_MASK)
> +#define i915_execbuffer2_get_number_bb(eb2) \
> +	((((eb2).flags & I915_EXEC_NUMBER_BB_MASK) >> I915_EXEC_NUMBER_BB_LSB) + 1)
> +
> +#define __I915_EXEC_UNKNOWN_FLAGS (-(1 << (I915_EXEC_NUMBER_BB_MSB + 1)))
>  
>  #define I915_EXEC_CONTEXT_ID_MASK	(0xffffffff)
>  #define i915_execbuffer2_set_context_id(eb2, context) \
> -- 
> 2.28.0
> 
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
