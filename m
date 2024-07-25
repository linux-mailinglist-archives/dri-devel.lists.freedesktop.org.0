Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A0F193C227
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2024 14:34:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39EF310E10D;
	Thu, 25 Jul 2024 12:34:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="anaHdJXR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D75AF10E10D
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2024 12:34:51 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-52efbdc9ebaso15720e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2024 05:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1721910890; x=1722515690; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=fEVZPRTtm5YNGn071qORi51dsIPZhK/Fira9IC1Og6s=;
 b=anaHdJXR/l+KgSBXbG47vFSaX6Jqgg+pN5lmnGlUYhgrmiRGh0T/gk6wo/KzjK1L0e
 hfSgRqpGGg5x6FOFwNx5Pr3mX92KhfJRev7SIcMOOMVU/s+8AIyauApxkQGDsC0fhuLB
 XGof2piLYcOcEpI2JPVOuDbLWXz/Ep/kfIkaY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721910890; x=1722515690;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fEVZPRTtm5YNGn071qORi51dsIPZhK/Fira9IC1Og6s=;
 b=gaLLLgVj6t+NzmUVEyBFozYn5UehjV58Aw2RrDrE7H3Uu/ClVGfrPnQhZnRHiXazaN
 E+v9qc+miB2kbZdnoDKn7SBn3jlDde70OqkgDDO43juNnl9us2hHiWNTsZg7Rczh28hl
 35mx1CsWtgGtUpXcLpBruxONOmKM8eFitesp7feJBUcFVJ+PyNV0ExFMOXpHB+jCHo73
 0a7/mHk1lGDiVj3pEiH/voTM23cwd+xmedNdGUzhSuz26Vm0PcgkIKw0CPMUJH8rywCm
 z0uirlM4OzPHFVhw0z4zlk65NR8fh5Rgj6nZs+JSDdocsGTaa49Ai+8ngWxyRN6yQIl7
 wwhA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPWDuZyG7jnrwXzvTRV8pckgZjpNrwsH/r1q+zxhKUgLAePRKlJKvojKTSgL2B9ayJkxdQwnTYxGQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyUzvApWmwD0Lliz3nUo5qyshhBxIMY6YEEt35AJwm07DyKUntU
 4re+CtJBtw0d+9v2gye9QsqY44KR+zCvf3Y7Hc7KyJJCFHuhXowZDVqNnHzwaYg=
X-Google-Smtp-Source: AGHT+IGfCvgVj/kfOeRuIsHAg4CUybE/NqUQzQad78L9yQjya0zbdbGA2oioN1GpFZZMbm7pqrG6mg==
X-Received: by 2002:a05:6512:131f:b0:52e:ccf5:7c40 with SMTP id
 2adb3069b0e04-52fd53425d3mr953624e87.9.1721910889860; 
 Thu, 25 Jul 2024 05:34:49 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7aca51eea0sm70219066b.0.2024.07.25.05.34.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jul 2024 05:34:49 -0700 (PDT)
Date: Thu, 25 Jul 2024 14:34:47 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 5/8] drm/vmwgfx: partially revert "Adapt validation code
 for reference-free lookups"
Message-ID: <ZqJGZz3Z0zZ1vREY@phenom.ffwll.local>
References: <20240723121750.2086-1-christian.koenig@amd.com>
 <20240723121750.2086-5-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240723121750.2086-5-christian.koenig@amd.com>
X-Operating-System: Linux phenom 6.9.7-amd64 
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

On Tue, Jul 23, 2024 at 02:17:47PM +0200, Christian König wrote:
> This reverts commit 64ad2abfe9a628ce79859d072704bd1ef7682044.
> 
> To me it looks like this functionality was never actually used. At least
> I can't find any protection in vmw_bo_free().

Just to double-check I've done the audit of all callers, and they all look
like they're holding a full reference indeed. The somewhat annoying case
was vmw_sw_context->cur_query_bo because it seems to not be refcounted
itself.  But that's either dev_priv->pinned_bo or
dev_priv->dummy_query_bo, both of which are refcounted, so we're good.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> Cc: Zack Rusin <zack.rusin@broadcom.com>
> Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_validation.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_validation.c b/drivers/gpu/drm/vmwgfx/vmwgfx_validation.c
> index e7625b3f71e0..e11837e484aa 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_validation.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_validation.c
> @@ -262,7 +262,8 @@ int vmw_validation_add_bo(struct vmw_validation_context *ctx,
>  				bo_node->hash.key);
>  		}
>  		val_buf = &bo_node->base;
> -		val_buf->bo = ttm_bo_get_unless_zero(&vbo->tbo);
> +		vmw_bo_reference(vbo);
> +		val_buf->bo = &vbo->tbo;
>  		if (!val_buf->bo)
>  			return -ESRCH;
>  		val_buf->num_shared = 0;
> @@ -656,7 +657,7 @@ void vmw_validation_unref_lists(struct vmw_validation_context *ctx)
>  	struct vmw_validation_res_node *val;
>  
>  	list_for_each_entry(entry, &ctx->bo_list, base.head) {
> -		ttm_bo_put(entry->base.bo);
> +		drm_gem_object_put(&entry->base.bo->base);
>  		entry->base.bo = NULL;
>  	}
>  
> -- 
> 2.34.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
