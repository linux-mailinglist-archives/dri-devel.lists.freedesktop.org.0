Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE685AFCF4
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 08:59:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B149310E27F;
	Wed,  7 Sep 2022 06:59:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F263810E27F
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Sep 2022 06:58:56 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id z8so18279698edb.6
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Sep 2022 23:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date; bh=2gNmFVx2TEGLFSa4zBsixSZnh9eQ9z4yWeNaVxeeK4g=;
 b=W21X+LhexAUdAxr0oCHGTu0WjIq9/9ifNfTdMem+fhK3ovuwekY+R+r90ao/dkY7Sj
 P0zLYZpzxzk9eXKsS+UJ98ZBJThUTvpxzz3LE7umfDyr2DGmyZqnjfkUxeaFsbHZRg4R
 1csIwITrYbgJBed3YN+F5CraQ27nrZ+BOGAgU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date;
 bh=2gNmFVx2TEGLFSa4zBsixSZnh9eQ9z4yWeNaVxeeK4g=;
 b=1wm8HdWD+zWp1DLumwA6CqKBK5Ov2zQBy/4dWzyhpKGdG2byFmfmUBkx75rHdSkn2u
 QlmQGPts/PDYUs2vq21QVn6YCZiUNWqTJ3qzaiohg86HshjrHGCL25hqPPLdKzznH61j
 3R9lgti+q4W2jlhIbAGRCF8TlK8pwGkLk1tNcPGXVuFbo1ZZpWNYYlTX01dGsHMGBuSY
 TbwHnUMGp20SFm/wWPyDi5ws1ubZT0p37AGiWUzi1qEjkO/jroUUM2wpU5vaZE/1jfD5
 9pg2SGXluiLIZb3vZhUpqC3EEyppxJ/f22K6uk045WHmSAadwN1e3xVLaVdNgciZuIpA
 fMFg==
X-Gm-Message-State: ACgBeo2xgFZ7Sg+JP0loergOrlFSCaY7kog2SSW7ly/dJ5VsdVlTbiMD
 0YyQxwR/OQ1R/dKCuyKY7ZNecQ==
X-Google-Smtp-Source: AA6agR6Bvdxs9YoqSNE/Ldg1MqBjgM4kjkwuFObt3RQhUXcm4Ke86+QgppVIrbZOW1cascVYGteqjA==
X-Received: by 2002:aa7:dc13:0:b0:443:3f15:8440 with SMTP id
 b19-20020aa7dc13000000b004433f158440mr1808846edu.274.1662533935396; 
 Tue, 06 Sep 2022 23:58:55 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 t25-20020aa7db19000000b0044e7c20d7a9sm5849339eds.37.2022.09.06.23.58.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 23:58:54 -0700 (PDT)
Date: Wed, 7 Sep 2022 08:58:53 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH v2 02/11] drm/udl: Add reset_resume
Message-ID: <YxhBLVyRmeUcxPIj@phenom.ffwll.local>
Mail-Followup-To: Takashi Iwai <tiwai@suse.de>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20220906073951.2085-1-tiwai@suse.de>
 <20220906073951.2085-3-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220906073951.2085-3-tiwai@suse.de>
X-Operating-System: Linux phenom 5.18.0-4-amd64 
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
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 06, 2022 at 09:39:42AM +0200, Takashi Iwai wrote:
> From: Thomas Zimmermann <tzimmermann@suse.de>
> 
> Implement the reset_resume callback of struct usb_driver. Set the
> standard channel when called.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>  drivers/gpu/drm/udl/udl_drv.c  | 11 +++++++++++
>  drivers/gpu/drm/udl/udl_drv.h  |  1 +
>  drivers/gpu/drm/udl/udl_main.c |  2 +-
>  3 files changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/udl/udl_drv.c b/drivers/gpu/drm/udl/udl_drv.c
> index 5703277c6f52..0ba88e5472a9 100644
> --- a/drivers/gpu/drm/udl/udl_drv.c
> +++ b/drivers/gpu/drm/udl/udl_drv.c
> @@ -32,6 +32,16 @@ static int udl_usb_resume(struct usb_interface *interface)
>  	return drm_mode_config_helper_resume(dev);
>  }
>  
> +static int udl_usb_reset_resume(struct usb_interface *interface)
> +{
> +	struct drm_device *dev = usb_get_intfdata(interface);
> +	struct udl_device *udl = to_udl(dev);
> +
> +	udl_select_std_channel(udl);
> +
> +	return drm_mode_config_helper_resume(dev);

Bit a bikeshed, but in the driver load case it would be neat to put the
call to udl_select_std_channel right above the call to
drm_mode_config_reset. But that is _really_ a bikeshed :-)

Also thanks for sending me on a bit a wild goose chase trying to figure
out what this reset_resume hook actually does and why.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> +}
> +
>  /*
>   * FIXME: Dma-buf sharing requires DMA support by the importing device.
>   *        This function is a workaround to make USB devices work as well.
> @@ -140,6 +150,7 @@ static struct usb_driver udl_driver = {
>  	.disconnect = udl_usb_disconnect,
>  	.suspend = udl_usb_suspend,
>  	.resume = udl_usb_resume,
> +	.reset_resume = udl_usb_reset_resume,
>  	.id_table = id_table,
>  };
>  module_usb_driver(udl_driver);
> diff --git a/drivers/gpu/drm/udl/udl_drv.h b/drivers/gpu/drm/udl/udl_drv.h
> index 28aaf75d71cf..37c14b0ff1fc 100644
> --- a/drivers/gpu/drm/udl/udl_drv.h
> +++ b/drivers/gpu/drm/udl/udl_drv.h
> @@ -95,6 +95,7 @@ int udl_render_hline(struct drm_device *dev, int log_bpp, struct urb **urb_ptr,
>  		     u32 byte_offset, u32 device_byte_offset, u32 byte_width);
>  
>  int udl_drop_usb(struct drm_device *dev);
> +int udl_select_std_channel(struct udl_device *udl);
>  
>  #define CMD_WRITE_RAW8   "\xAF\x60" /**< 8 bit raw write command. */
>  #define CMD_WRITE_RL8    "\xAF\x61" /**< 8 bit run length command. */
> diff --git a/drivers/gpu/drm/udl/udl_main.c b/drivers/gpu/drm/udl/udl_main.c
> index fdafbf8f3c3c..7d1e6bbc165c 100644
> --- a/drivers/gpu/drm/udl/udl_main.c
> +++ b/drivers/gpu/drm/udl/udl_main.c
> @@ -92,7 +92,7 @@ static int udl_parse_vendor_descriptor(struct udl_device *udl)
>  /*
>   * Need to ensure a channel is selected before submitting URBs
>   */
> -static int udl_select_std_channel(struct udl_device *udl)
> +int udl_select_std_channel(struct udl_device *udl)
>  {
>  	static const u8 set_def_chn[] = {0x57, 0xCD, 0xDC, 0xA7,
>  					 0x1C, 0x88, 0x5E, 0x15,
> -- 
> 2.35.3
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
