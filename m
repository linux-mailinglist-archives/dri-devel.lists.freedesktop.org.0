Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C466BB05B17
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 15:17:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A88E10E37C;
	Tue, 15 Jul 2025 13:17:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="YsMTVYUv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F6B510E37C
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 13:16:59 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-3a4ef2c2ef3so4071293f8f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 06:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1752585418; x=1753190218; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=7oxcnIHUFGM9XgAtLrDfZFgv0IUYHjLuIAuAxAwmdIU=;
 b=YsMTVYUvCFIkwbi3RduC88+++028rc8fu8AeeqrwIicqozuDKKl0q6lF9v3EnsOBlB
 GpenHgGZeXidVRzppQbVNMs/EGKGhCXT1BX1686dyNWY+yRbE73AwmyzKnnXgyP1gUyL
 uWflSE1VHu4pgnSeMwHGlYhSxu2BX+7gknrd4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752585418; x=1753190218;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7oxcnIHUFGM9XgAtLrDfZFgv0IUYHjLuIAuAxAwmdIU=;
 b=Ju8K5HsrTmjDdCiXy/gwbPxtehwjGl/8yem6CBh40JAnkyvJ6imACVQbFoqmY5BDbN
 EbBMQXulxv+O6eTgXG6AX1Ef4nFv4vwOa3+Vv4QpEsDvj8HgBlPoBuZSgqYzyShHo0s5
 f2w0e36tqWwV5BVjB/qPKnFFgioVlYxsvD7hTzEL+2wwI2mBL7ccV3ODftZ/cZhnIoSF
 SSnpHOp0SjF/L6XpKeOo9BXwwEAJmg75OA8C6HWHuKCijPNfl5rB6Kxuta3G6+QjyYit
 yfaH95+ogD3F0rK/M744pRC+Seig7JXDPiE5UisaNjGJTIzrxCVcfOV/ug5xTsQdCu2U
 +3lw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVaRYhIiMcdNbp8ZdeVlB3/OFOm9oMMu1iKt+I+5tk/Mk/IDO56G7TeK6fcOxHJ3czZurM0fhvwASY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxTdFMHTJER7Si3xq1uhV5sKUr/Wozplaua3bnu0pGCPhr1oZrs
 6PPIXWYK5ulMws6CCpwxUzLBvnBtzdG7iAm5fUnuAwVFUWb2+bZb5JR/V2o86gy3BEs=
X-Gm-Gg: ASbGncvwF5oFWJkfengJImh5yYLficLTMVQMishplPiTdqImBYbg7oTBJpHfl+fXKEB
 DejeHd5Hh1kXlK+N2wIyukPh8W3PX6dXuH3OV/kl5xsXK03UqfDE3spKCkd4FHoOnjGiWWDNEpo
 LERxqBiUBFKW+IHbFWLZRTVVxtap75f4vg8qvR71oCgZ+Om7tswno2Wvl7/wJx28JeY3vrzSzOZ
 dS4QbXvgzY4w48AldYj4xM7ZwsjvzJGQCkxvvX7yubTYGBOvPXWPipPfcWBjqEfUE6p342vTnEv
 ZA4KEBYJTS7c1aLDbmnTpw1/xAahrh7EjBk5ShBQOwrYuNlLpbCWy/kVq9NPg9ypw+/7x6NqvRT
 xo8rFCpFA2iI29mU7Ov6phIhoUMTahyAwJw==
X-Google-Smtp-Source: AGHT+IF6/YjsEXq6Q2lwzXNbCW3+FTVujjcrP9eO/s3mZxOODp1c3RGVgSacc6YHmi98kBgi2QH/KA==
X-Received: by 2002:a05:6000:2f81:b0:3a3:7baf:f06a with SMTP id
 ffacd0b85a97d-3b5f2dfdd45mr13263647f8f.37.1752585418009; 
 Tue, 15 Jul 2025 06:16:58 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4561752340esm71577095e9.38.2025.07.15.06.16.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jul 2025 06:16:57 -0700 (PDT)
Date: Tue, 15 Jul 2025 15:16:55 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: thierry.reding@gmail.com, mperttunen@nvidia.com, airlied@gmail.com,
 simona@ffwll.ch, jonathanh@nvidia.com, linux-tegra@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] Revert "drm/tegra: Use dma_buf from GEM object instance"
Message-ID: <aHZUx4dJw1WtetyQ@phenom.ffwll.local>
References: <20250715084549.41473-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250715084549.41473-1-tzimmermann@suse.de>
X-Operating-System: Linux phenom 6.12.30-amd64 
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

On Tue, Jul 15, 2025 at 10:45:39AM +0200, Thomas Zimmermann wrote:
> This reverts commit 482c7e296edc0f594e8869a789a40be53c49bd6a.
> 
> The dma_buf field in struct drm_gem_object is not stable over the
> object instance's lifetime. The field becomes NULL when user space
> releases the final GEM handle on the buffer object. This resulted
> in a NULL-pointer deref.
> 
> Workarounds in commit 5307dce878d4 ("drm/gem: Acquire references on
> GEM handles for framebuffers") and commit f6bfc9afc751 ("drm/framebuffer:
> Acquire internal references on GEM handles") only solved the problem
> partially. They especially don't work for buffer objects without a DRM
> framebuffer associated.
> 
> Hence, this revert to going back to using .import_attach->dmabuf.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Simona Vetter <simona.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/tegra/gem.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
> index 41a285ec889f..8ede07fb7a21 100644
> --- a/drivers/gpu/drm/tegra/gem.c
> +++ b/drivers/gpu/drm/tegra/gem.c
> @@ -526,7 +526,7 @@ void tegra_bo_free_object(struct drm_gem_object *gem)
>  		if (drm_gem_is_imported(gem)) {
>  			dma_buf_unmap_attachment_unlocked(gem->import_attach, bo->sgt,
>  							  DMA_TO_DEVICE);
> -			dma_buf_detach(gem->dma_buf, gem->import_attach);
> +			dma_buf_detach(gem->import_attach->dmabuf, gem->import_attach);
>  		}
>  	}
>  
> -- 
> 2.50.0
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
