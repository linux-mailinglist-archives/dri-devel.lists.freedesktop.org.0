Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC41251C7A
	for <lists+dri-devel@lfdr.de>; Tue, 25 Aug 2020 17:43:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FF946E358;
	Tue, 25 Aug 2020 15:42:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D8466E358
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Aug 2020 15:42:58 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id x5so2920080wmi.2
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Aug 2020 08:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=QYGt1AUketUmIhWzMlfw1o2JhMefg6zcZtSy8rTzBOg=;
 b=YRVt4fLIXfvscIz3QIX4MM7DnnoBzT0NcifEaa2iPJClNPPpF+CVrbBohVMxN2Pmrd
 XYLgSL+bEdIAOhTouHyXvfvL5CuWW688nP4fsZdeCpn8oSE4NcbKV7T9x8KD153KsPkZ
 v9qiUgIEvlDnjrphU7Pu9jG2hKHK//UkEmHM7ioTFSX6GDGz4bQFVvpmcLxX69Rlt1o9
 ljOHuwlBeBLGX7c8YISWWDJQKC2k0uq/zUynjXg3tyTBZO8zkLtzj/MOVedQxPGChS2H
 ENzCvvWuUe4qCdHxV/47E+yGmM/l1kheFdGZK84sbe+GjZQb70o9CnEIbTsNA57nCYin
 Jzbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QYGt1AUketUmIhWzMlfw1o2JhMefg6zcZtSy8rTzBOg=;
 b=VaDMCoOJNA5Opf/ggwwLpnHF+m7jU0p1Pg+c2jtD6pjzFfjyXl8lBURZa4CmxoH8Kv
 4NHvXJRteOu6H12jSlRe/3Hnk0Yt7AaITFHc43fDQwdaDxRgKiXDqdOelXs/HnIOJLN3
 h4hg692zZk6GrQW15DzkOaYSyzsUJUCP3bszpF9ypy1wpwra3W75+TeZOTqC3ED7ltiz
 zc2O8XXArxJSNlNBVx1klJnQ38IlQcCQ20OJ2bNpGZcoxwBk0ewfKvpFJiLiQDJvtyvC
 j7nn953okFBt/XAPcKB2TTcbSJ2FpaTloubFdJumaI9/1fMrf4FYkLGi8nII0stcI7o/
 9JrA==
X-Gm-Message-State: AOAM532DruUEjdI9BOQAgpDKQrR0ev4pJHZFogCoiiN1K6N+sQLHgcEF
 zo2LoM9HA9P3onfMdfp5uYc=
X-Google-Smtp-Source: ABdhPJxXy2WztAij2FRgTlBTeCqHlFv5HC8lLbDRNpuWlpL0dUu0DzF7K3ZkMlgKyWk5gqVi2fD6dA==
X-Received: by 2002:a7b:c095:: with SMTP id r21mr2835661wmh.152.1598370176924; 
 Tue, 25 Aug 2020 08:42:56 -0700 (PDT)
Received: from smtp.gmail.com (a95-92-181-29.cpe.netcabo.pt. [95.92.181.29])
 by smtp.gmail.com with ESMTPSA id a85sm7203453wmd.26.2020.08.25.08.42.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2020 08:42:56 -0700 (PDT)
Date: Tue, 25 Aug 2020 12:42:46 -0300
From: Melissa Wen <melissa.srw@gmail.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Subject: Re: [PATCH v5 2/3] drm/vkms: Compute CRC without change input data
Message-ID: <20200825153653.k22gbd72rdxu5qtk@smtp.gmail.com>
References: <20200825023142.2561220-1-rodrigosiqueiramelo@gmail.com>
 <20200825023142.2561220-3-rodrigosiqueiramelo@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200825023142.2561220-3-rodrigosiqueiramelo@gmail.com>
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
Cc: daniels@collabora.com, Liviu Dudau <liviu.dudau@arm.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Leandro Ribeiro <leandro.ribeiro@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08/24, Rodrigo Siqueira wrote:
> The compute_crc() function is responsible for calculating the
> framebuffer CRC value; due to the XRGB format, this function has to
> ignore the alpha channel during the CRC computation. Therefore,
> compute_crc() set zero to the alpha channel directly in the input
> framebuffer, which is not a problem since this function receives a copy
> of the original buffer. However, if we want to use this function in a
> context without a buffer copy, it will change the initial value. This
> patch makes compute_crc() calculate the CRC value without modifying the
> input framebuffer.
> 
> Change in V4 (Emil):
> - Move bitmap_clear operation and comments to get_pixel function
> 
> Signed-off-by: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
> ---
>  drivers/gpu/drm/vkms/vkms_composer.c | 38 ++++++++++++++++++----------
>  1 file changed, 24 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
> index 4d8bc04bb6ee..387b0690a64a 100644
> --- a/drivers/gpu/drm/vkms/vkms_composer.c
> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> @@ -9,33 +9,43 @@
>  
>  #include "vkms_drv.h"
>  
> +static u32 get_pixel_from_buffer(int x, int y, const u8 *buffer,
> +				 const struct vkms_composer *composer)
> +{
> +	u32 pixel;
> +	int src_offset = composer->offset + (y * composer->pitch)
> +				      + (x * composer->cpp);
> +
> +	pixel = *(u32 *)&buffer[src_offset];
> +	/* XRGB format ignores Alpha channel */
> +	bitmap_clear((void *)&pixel, 0, 8);

I noticed a small problem in this bitmap_clear as I recently sent a
patch changing it.  The starting point for zeroing the alpha is not 0,
but 24. As in the removed line below:
-		bitmap_clear(vaddr_out + src_offset, 24, 8);

It affects the kms_cursor_crc/cursor-alpha-transparent subtest.

> +
> +	return pixel;
> +}
> +
>  /**
>   * compute_crc - Compute CRC value on output frame
>   *
> - * @vaddr_out: address to final framebuffer
> + * @vaddr: address to final framebuffer
>   * @composer: framebuffer's metadata
>   *
>   * returns CRC value computed using crc32 on the visible portion of
>   * the final framebuffer at vaddr_out
>   */
> -static uint32_t compute_crc(void *vaddr_out, struct vkms_composer *composer)
> +static uint32_t compute_crc(const u8 *vaddr,
> +			    const struct vkms_composer *composer)
>  {
> -	int i, j, src_offset;
> +	int x, y;
> +	u32 crc = 0, pixel = 0;
>  	int x_src = composer->src.x1 >> 16;
>  	int y_src = composer->src.y1 >> 16;
>  	int h_src = drm_rect_height(&composer->src) >> 16;
>  	int w_src = drm_rect_width(&composer->src) >> 16;
> -	u32 crc = 0;
> -
> -	for (i = y_src; i < y_src + h_src; ++i) {
> -		for (j = x_src; j < x_src + w_src; ++j) {
> -			src_offset = composer->offset
> -				     + (i * composer->pitch)
> -				     + (j * composer->cpp);
> -			/* XRGB format ignores Alpha channel */
> -			bitmap_clear(vaddr_out + src_offset, 24, 8);
> -			crc = crc32_le(crc, vaddr_out + src_offset,
> -				       sizeof(u32));
> +
> +	for (y = y_src; y < y_src + h_src; ++y) {
> +		for (x = x_src; x < x_src + w_src; ++x) {
> +			pixel = get_pixel_from_buffer(x, y, vaddr, composer);
> +			crc = crc32_le(crc, (void *)&pixel, sizeof(u32));
>  		}
>  	}
>  
> -- 
> 2.28.0
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
