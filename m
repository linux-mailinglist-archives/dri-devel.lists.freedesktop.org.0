Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2556725E34E
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 23:31:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E267C6ECDA;
	Fri,  4 Sep 2020 21:31:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87AA06ECDA
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Sep 2020 21:31:26 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id c15so8621855wrs.11
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Sep 2020 14:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=lWsIwGs4zwf7QsRg59AIdeA858uxoHmiYKmGxLCL+jc=;
 b=GglQyMIzcy1VPhXaMWU6sAazP11ZlGD+g1QkZErVQWsYcmle+PPc32oWvxEAfkyFTd
 Ev/w1OcjerBUY0wPe1XLn+bdaF/xi6AMmdhe5vefEex1oo837qgSi2Hf561OlFMgqOCq
 44GZLjptKmZENqtHfEMaze/MDnKS7U7Fb7wc2oIn/WHR795UAnOJsko8SH/WcoNvYf8R
 wa8fsjD/8w2CDkS+0cjmUIFkDe+GS43tqw0McxBbyeMkqH6eaHQEOGs56qYWpNEhYqFA
 J63Q8YgnHb4+KS/Ks8AKhs0cMjDj/rlW8mnuD+W//Uz7f7O8/2k8Wj8S1h6S010ZDB1H
 YVtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=lWsIwGs4zwf7QsRg59AIdeA858uxoHmiYKmGxLCL+jc=;
 b=f5EjWGm8DJfb1lIBZYwqxe73MQUHfmQvRHYiz2nFve+VOc6gI4BK9J6CrYcyqchS5A
 1VvD+7hf7Uhfb9zhZaolfvMbL0taC36YVedfAMjs5PerQTTG3Aq0ceJBzwTmvuJnsQ66
 r8fobRogexaZVbn/1RXf1V3R37WvhgCKORoMgEv2xfPw37hhd4RduNESHziaLh0tTA1c
 gTWyJ8XXGa8dbmdpmlK/2/WhNSzBsnSu/LWCKDqULcqoNFo7N+lj0KA9MTqS9/Fagj24
 tdJmo12g0Ksa30owGf8s9DPYydqfVwH26f3ji8ROyYjuiEvLOmErKEdcBDtOakKfkae5
 Yyyg==
X-Gm-Message-State: AOAM533PUrozNNOuwppHA2JLRp2TljGUKO6JHavHauPti6rPm3dNcldu
 VCdv9XxBelu1XPWo6J0FVVo=
X-Google-Smtp-Source: ABdhPJyqdhi45rsVT/UWBQjiHBIO8qTSndTo8Zfrs7+fjXtA1RBnU2WKYmSGeZpinN9WxcdA8lo7GA==
X-Received: by 2002:a05:6000:1ce:: with SMTP id
 t14mr8840909wrx.195.1599255085099; 
 Fri, 04 Sep 2020 14:31:25 -0700 (PDT)
Received: from smtp.gmail.com (a95-92-181-29.cpe.netcabo.pt. [95.92.181.29])
 by smtp.gmail.com with ESMTPSA id z203sm14989819wmc.31.2020.09.04.14.31.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2020 14:31:24 -0700 (PDT)
Date: Fri, 4 Sep 2020 18:31:18 -0300
From: Melissa Wen <melissa.srw@gmail.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Subject: Re: [PATCH v6 2/3] drm/vkms: Compute CRC without change input data
Message-ID: <20200904213118.7bpdhokijilb6np3@smtp.gmail.com>
References: <20200830142000.146706-1-rodrigosiqueiramelo@gmail.com>
 <20200830142000.146706-3-rodrigosiqueiramelo@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200830142000.146706-3-rodrigosiqueiramelo@gmail.com>
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

On 08/30, Rodrigo Siqueira wrote:
> The compute_crc() function is responsible for calculating the
> framebuffer CRC value; due to the XRGB format, this function has to
> ignore the alpha channel during the CRC computation. Therefore,
> compute_crc() set zero to the alpha channel directly in the input
> framebuffer, which is not a problem since this function receives a copy
> of the original buffer. However, if we want to use this function in a
> context without a buffer copy, it will change the initial value. This
> patch makes compute_crc() calculate the CRC value without modifying the
> input framebuffer.
Hi Rodrigo,

This commit message no longer reflects the current state of crc
computation on vkms, since the alpha channel is no longer ignored (not
zeroed) there. I think the point here is to improve readability, which I
agree, is it? If so, update this msg.
> 
> Change in V5 (Melissa):
> - Rebase and drop bitmap for alpha
> Change in V4 (Emil):
> - Move bitmap_clear operation and comments to get_pixel function
> 
> Signed-off-by: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
> ---
>  drivers/gpu/drm/vkms/vkms_composer.c | 34 ++++++++++++++++++----------
>  1 file changed, 22 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
> index f67d1baf1942..c5b32fe5870f 100644
> --- a/drivers/gpu/drm/vkms/vkms_composer.c
> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> @@ -9,31 +9,41 @@
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
Please, update the commit msg.
The code improvement look good to me. So:

Reviewed-by: Melissa Wen <melissa.srw@gmail.com>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
