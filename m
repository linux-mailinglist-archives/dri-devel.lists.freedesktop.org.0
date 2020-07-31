Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4EE234315
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jul 2020 11:28:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D142C6EA4A;
	Fri, 31 Jul 2020 09:28:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B16E16EA4A
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jul 2020 09:28:16 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id 88so27329849wrh.3
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jul 2020 02:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=z+0/zjHSuK4YpkaJOtgZNG0mGoncCgYB5r2C7+VJ3D4=;
 b=R4eDvdiyjZiAS2M0ScI5ZgcMF2tJ0yokw3apO8UqhsoNlAdBSFkzqPNOIw8Dvrr2Yc
 wkKkHQFTK73G30dhhTnlZmx5u0RV5cVW6DSgBvmw6PTYQLyxf2dGVEyPKsehu4QW0ifI
 QQkcZ0RtsuPJQ70TR3ADt+mbAAgIDlzU2ytSY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=z+0/zjHSuK4YpkaJOtgZNG0mGoncCgYB5r2C7+VJ3D4=;
 b=i0wi2wDuc6/YOTNz3RGQNIk6IROHO7D/UyUgIznhdV7MJkF+zAKse4LfuBnVIb/IvW
 NEIPOrNLIcFkmLM0KsXc4VGf3POOZQigYWHsVp5IzNkKM4DObyqGfnccwJBS66OLXndU
 W695HKghAO/IFMpdcbiUyw6lpfT2NvkE2e70ptipPZOQZZZBBlkFt7fjA6805/TSHFD6
 tN1ecr68Gdk3dVJL/JKgrKGMsxfELZsDIEuclDdeoDLxY/0tf37bOsRJ3oZT4tCQxbpK
 /eoJ31BZ4LKDjY5/VQiEKUnE0MCcUqSQ9G0lF72Fe4MEyhFXbUNFOcjS4bCRmw7F2eoy
 /nrQ==
X-Gm-Message-State: AOAM532ZAMKkG/yNE7fYFEoui5e09oQGPpyP/hOxkSqX4xibijUEMTbr
 RuJBcU7mtq9+I84LFpr6V3ihAA==
X-Google-Smtp-Source: ABdhPJwT64W6SQNoeOQa1Euw8GGqxxmHPhkx0/MtFqznd2l1BYwFVsr8TCLtYQNzfpRxEdkGA4k+IA==
X-Received: by 2002:a5d:4907:: with SMTP id x7mr2890544wrq.166.1596187695348; 
 Fri, 31 Jul 2020 02:28:15 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z8sm11660814wmf.42.2020.07.31.02.28.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jul 2020 02:28:14 -0700 (PDT)
Date: Fri, 31 Jul 2020 11:28:12 +0200
From: daniel@ffwll.ch
To: 
Subject: Re: [PATCH] drm/vkms: fix xrgb on compute crc
Message-ID: <20200731092812.GY6419@phenom.ffwll.local>
Mail-Followup-To: Melissa Wen <melissa.srw@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 David Airlie <airlied@linux.ie>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, twoerner@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-usp@googlegroups.com
References: <20200730202524.5upzuh4irboru7my@smtp.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200730202524.5upzuh4irboru7my@smtp.gmail.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 David Airlie <airlied@linux.ie>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kernel-usp@googlegroups.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 30, 2020 at 05:25:24PM -0300, Melissa Wen wrote:
> The previous memset operation was not correctly zeroing the alpha
> channel to compute the crc, and as a result, the IGT subtest
> kms_cursor_crc/pipe-A-cursor-alpha-transparent fails.
> 
> Fixes: db7f419c06d7c ("drm/vkms: Compute CRC with Cursor Plane")
> 
> Signed-off-by: Melissa Wen <melissa.srw@gmail.com>

Applied to drm-misc-next, thanks for your patch.

> ---
>  drivers/gpu/drm/vkms/vkms_composer.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
> index 4af2f19480f4..b8b060354667 100644
> --- a/drivers/gpu/drm/vkms/vkms_composer.c
> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> @@ -33,7 +33,7 @@ static uint32_t compute_crc(void *vaddr_out, struct vkms_composer *composer)
>  				     + (i * composer->pitch)
>  				     + (j * composer->cpp);
>  			/* XRGB format ignores Alpha channel */
> -			memset(vaddr_out + src_offset + 24, 0,  8);
> +			bitmap_clear(vaddr_out + src_offset, 24, 8);

Yeah that's a pretty good "oops" oversight on review, nice catch!

Cheers, Daniel
>  			crc = crc32_le(crc, vaddr_out + src_offset,
>  				       sizeof(u32));
>  		}
> -- 
> 2.27.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
