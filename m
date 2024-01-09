Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 169FF8286E3
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jan 2024 14:14:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2608610E417;
	Tue,  9 Jan 2024 13:14:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54E7410E417
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jan 2024 13:14:11 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2cd4900e085so6538111fa.0
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jan 2024 05:14:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1704806049; x=1705410849; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=iBl04nEzlk7MUiFppfCCz6fsBkWnKtVtYPOjbQcAw1Q=;
 b=daHnU855ykGH09K1gDjTChTVs5aLP1Eu45uQOK6wOJjtlvYc1sPlu5WCnJy5FIc51E
 GDjJclVgKBq/I434NpcBAtDTA4zefVgqJ/vUAaZqD/Xa5TC7Innw3gqcDFA4A+8T6Ybp
 FCdWNseTcBRNMwrlstk0TSl6NmD/RzaCiVA0I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704806049; x=1705410849;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iBl04nEzlk7MUiFppfCCz6fsBkWnKtVtYPOjbQcAw1Q=;
 b=bZm9rBi0XpFED4gA82SUH/9MYyzfcMdQ2A5De9GhGT9ZjERRQjKdOCCdtxGEtY21gR
 wbERFxaOzzLYQjKxWfWqzcJlqXn3YWcKNZiaEthWyYM/Ts5RX0etwwtQUkxIljgFiPdK
 NA6VHXOVnuuTHFfgjWHbYgia7LEqrn8Jf8EHBtuUHMIPP15mcanUihI6q3Ki5sL+VZKR
 rUnYY64hR8ShESVHUfLaLvLNXXqIaTaYZSCzQ94v4EoAQRf6owHRI5v86YEEf+RzC/9u
 nnoa5zr/9ZPYOxSl7mToW8gwKf0E93k7LJ9s3/rDNksnDDaOQW0KOzMa1QIJ3bpdGUWX
 lihg==
X-Gm-Message-State: AOJu0YxuHgJMzs+Opa0wKucvGeCiIwkVG361g+cfRFtf6DxXuAUSwJ8o
 K1MHs9QIXrCZjS3FKoz6P7FbcH0cosjBUQ==
X-Google-Smtp-Source: AGHT+IEdGoCt0tOoGrLMD811XBBismui6B1HlrFAHbierItONFims6NpxuVTpupjH9cNtb0fV6HgDQ==
X-Received: by 2002:a2e:3213:0:b0:2cd:f45:f150 with SMTP id
 y19-20020a2e3213000000b002cd0f45f150mr4810312ljy.1.1704806049342; 
 Tue, 09 Jan 2024 05:14:09 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 f21-20020a056402195500b00558267aca09sm205696edz.57.2024.01.09.05.14.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jan 2024 05:14:08 -0800 (PST)
Date: Tue, 9 Jan 2024 14:14:06 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: Re: [PATCH] drm/shmem-helper: Fix comment describing dma-buf mappings
Message-ID: <ZZ1Gnvitssne-e5r@phenom.ffwll.local>
References: <20240109104305.604549-1-jacek.lawrynowicz@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240109104305.604549-1-jacek.lawrynowicz@linux.intel.com>
X-Operating-System: Linux phenom 6.5.0-4-amd64 
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
Cc: tzimmermann@suse.de, mripard@kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 09, 2024 at 11:43:05AM +0100, Jacek Lawrynowicz wrote:
> `shmem->map_wc was` set to `false` but the comment suggested WC was
> enabled for imported buffers.
> 
> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> ---
>  drivers/gpu/drm/drm_gem_shmem_helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
> index e435f986cd13..1532f1766170 100644
> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> @@ -75,7 +75,7 @@ __drm_gem_shmem_create(struct drm_device *dev, size_t size, bool private)
>  
>  	if (private) {
>  		drm_gem_private_object_init(dev, obj, size);
> -		shmem->map_wc = false; /* dma-buf mappings use always writecombine */
> +		shmem->map_wc = false; /* dma-buf mappings are never write-combined */

I think neither is correct, because for a dma_buf import it is up to the
importer to set up everything, including whether mappings should be
write-combined or not. And setting this to false ensures that helpers
don't muck around with the caching setting.

Also there's private buffer objects for other reasons, but the overlap
between drivers that have those and which use shmem helpers is zero.

So I think overall a better comment would be:

		/* This disables all shmem helper caching code and leaves
		 * all decision entirely to the buffer provider */

Maybe in a very old version where shmem helpers didn't correctly use the
dma_buf functions there was some justification for the original comment,
but that's been long ago fixed in a series of patches to make sure
dma_buf_vmap/mmap are used consistently and directly.

Care to respin with a wording of your choice for the comment? If you're
bored you could also try to dig through history a bit and collect some of
the commits that made this comment largely obsolete, since I don't think
any of the map_wc == true paths are even reachable anymore for private
objects ...

Cheers, Sima
>  	} else {
>  		ret = drm_gem_object_init(dev, obj, size);
>  	}
> -- 
> 2.43.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
