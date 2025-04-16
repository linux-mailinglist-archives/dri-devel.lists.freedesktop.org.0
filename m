Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ADEFA8B598
	for <lists+dri-devel@lfdr.de>; Wed, 16 Apr 2025 11:38:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B847910E8B3;
	Wed, 16 Apr 2025 09:38:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="hDLIYBnm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF47910E8B3
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 09:38:07 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-43cfecdd8b2so53288205e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 02:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1744796286; x=1745401086; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=bKiuW7fqLtKMzNZwknZ1q0ktAhIGPRJdFPZfswrIKzU=;
 b=hDLIYBnmrNhPoopQa/Lh9VpTbLItpGws6ivZtQNA7dWkHNiUR4uOhJit4XiXPsexCi
 am/xxacX9+EeLBbvUhqfx1g+DPz3FscckObsGG7JpAtg628VBj/lWvQgFJ6FJMrxkDXT
 va6HUronSbytFB4HmddTDcBQAfOjoYuvu6Kh0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744796286; x=1745401086;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bKiuW7fqLtKMzNZwknZ1q0ktAhIGPRJdFPZfswrIKzU=;
 b=Fb/5D1lddYmDsdJ+UHpHccwbuYHpUxuXkHoB+bb03F658QYsXHMEqWinyYg3Rl4ik4
 VoGUmVKCFZ9CZLUfkEvdes8gWbSz4hxjZuF6SOGmohP9IXqNcJ88GlhQgC2dL6yCn/a+
 tvSZAyALmUloItjk7yTmwEVRPZWYQZTC29vqK8tYwya6+LayzTa4UuR9QMCOJtsrr5bD
 kY2miIB6fNdrZ9l2vgJSqo+PZn9H9YiZIhXOXk1m7cD/ypVNfnmd0UJJWloWKHOhaH/4
 LYaeq1jmKRJgLCehhuMAeMOiP1ybEvrbDc8ST2Gkj5YzLh6bHjzUIdvrSAPKkhnCbsBI
 6NvA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZplaX0E+Wumeamn8PK6xteyRjoH5qkiXJJhLJtqT5z7KU93BO/Fng8aRtXAG1fgSJuxspfsvc/2I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzq9b/QSWKTn+wpU1zu+WJFtItjBZuEIZYmdZH3Q+gNuWOVMjFk
 PSnq/srxUDJL88DH1zpIcBFP1YxlhV+PeEpcEWFyC7N9fEQKiZI4OPEZIW+2ZN0=
X-Gm-Gg: ASbGncvSINVx70Y/GfFlrPDIvZgitLknOcIntk+kkvUb7CYLidK5iT0IpCJXBFUQCz6
 ie6sg+ilEVAj0xXYTcrm1q//R9q8HRoM/H6vEtGBwlvJDKyOhMk0U1lESNfKU+r+I2GnPE90aEZ
 lDyhIhwmSDrS6bDhGQYcEP3W8XODlkcM7C0T3rMXCIjwmiI6ssCiU7D84OtgqdlH1iLYpIdEGkQ
 cZvw3TTbOkMFLYzbnSzLdBp8Eq+RgG1Wn/1LxWqKdb5Nqgud1czkm2SEX2STxVcYrMemM43dqiJ
 HZ7PBA7DYYaBO4W0uAK0UTBphBInWac9AboXnVdJ9AIXdWYOf/nZ
X-Google-Smtp-Source: AGHT+IGT29vjOpDw3vMAwVsrePPX+jcDC9ydgKM0NqiYaNb30P8su4lbmICy/WocBWwpqAePRHM6Wg==
X-Received: by 2002:a05:600c:1912:b0:43c:fee3:2bce with SMTP id
 5b1f17b1804b1-4405d6ab5f5mr10180325e9.26.1744796286017; 
 Wed, 16 Apr 2025 02:38:06 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4405b4f25bbsm15824925e9.17.2025.04.16.02.38.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Apr 2025 02:38:05 -0700 (PDT)
Date: Wed, 16 Apr 2025 11:38:03 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: simona@ffwll.ch, airlied@gmail.com, asrivats@redhat.com,
 andyshrk@163.com, christian.koenig@amd.com,
 boris.brezillon@collabora.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, dri-devel@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v3] drm/gem: Internally test import_attach for imported
 objects
Message-ID: <Z_96e7Lv-sEDUS6U@phenom.ffwll.local>
References: <20250416065820.26076-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250416065820.26076-1-tzimmermann@suse.de>
X-Operating-System: Linux phenom 6.12.17-amd64 
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

On Wed, Apr 16, 2025 at 08:57:45AM +0200, Thomas Zimmermann wrote:
> Test struct drm_gem_object.import_attach to detect imported objects.
> 
> During object clenanup, the dma_buf field might be NULL. Testing it in
> an object's free callback then incorrectly does a cleanup as for native
> objects. Happens for calls to drm_mode_destroy_dumb_ioctl() that
> clears the dma_buf field in drm_gem_object_exported_dma_buf_free().
> 
> v3:
> - only test for import_attach (Boris)
> v2:
> - use import_attach.dmabuf instead of dma_buf (Christian)
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: b57aa47d39e9 ("drm/gem: Test for imported GEM buffers with helper")
> Reported-by: Andy Yan <andyshrk@163.com>
> Closes: https://lore.kernel.org/dri-devel/38d09d34.4354.196379aa560.Coremail.andyshrk@163.com/
> Tested-by: Andy Yan <andyshrk@163.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Anusha Srivatsa <asrivats@redhat.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org

Reviewed-by: Simona Vetter <simona.vetter@ffwll.ch>

> ---
>  include/drm/drm_gem.h | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> index 9b71f7a9f3f8..a3133a08267c 100644
> --- a/include/drm/drm_gem.h
> +++ b/include/drm/drm_gem.h
> @@ -588,8 +588,7 @@ static inline bool drm_gem_object_is_shared_for_memory_stats(struct drm_gem_obje
>   */
>  static inline bool drm_gem_is_imported(const struct drm_gem_object *obj)
>  {
> -	/* The dma-buf's priv field points to the original GEM object. */
> -	return obj->dma_buf && (obj->dma_buf->priv != obj);
> +	return !!obj->import_attach;
>  }
>  
>  #ifdef CONFIG_LOCKDEP
> -- 
> 2.49.0
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
