Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC8B4D1F74
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 18:51:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19D0310E1D8;
	Tue,  8 Mar 2022 17:51:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 774EF10E1D8
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 17:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646761881;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C2+981yqfOq4/ptXhLv4JOxgIbIO/XxZUFixkrLxsK8=;
 b=h5VXtX+bzLj2ZEGn4MSz6ws3iuKU7Y5PT1c1GB302w07rIvHbRImME1u883T2gd19tFFIP
 8GZ7f+mBNyuMYNSwqrjg782ZQXUP53mpHslu6iU2vCdz1x0SLr8nAiqhoC72TBK+P26HVi
 JepcHVXqOAdFmHrHxMttWbahOAAi/qg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-542-S9Y6MBAqMTS973s7eVAVBg-1; Tue, 08 Mar 2022 12:51:20 -0500
X-MC-Unique: S9Y6MBAqMTS973s7eVAVBg-1
Received: by mail-wr1-f71.google.com with SMTP id
 a5-20020adfdd05000000b001f023fe32ffso5699713wrm.18
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Mar 2022 09:51:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=C2+981yqfOq4/ptXhLv4JOxgIbIO/XxZUFixkrLxsK8=;
 b=Z1fEMWzN9TP3+8DQStvBwNQOZAuNt3/KWDmrSnPpYHnWbnegwl+UxTftaWRUDveRAL
 t/sKV8zAIK+ETJ4yKl0R/3QX3Ba3DSwCZcLkGbRinDkE/b487njZ8hf1lYm3Io+i2Vdq
 J5TZ/RzaQ2SrecoW4d1oTlJ3j31fkFW6yBPWh3SqQeKmK0S0mCDwZ6MIsqcWpcnvoHtj
 fQ9OkCzeTTRSOOaGDkJIXa2m6qEDu0BWfBsSqb0XP0+ZlwlQVYmxgLewJnWNATeUdzLg
 ugzAvv3I7wVErxs2d69WA8gSLRU9nE9fpN8vfn5ZHJRvr3LvUZ8jarLURiWlVdSYf5/t
 pqqQ==
X-Gm-Message-State: AOAM533B7IgDxE731HCA7mjQZcoqFrRWj96CK3UZh66pQuNW4G5lcR5t
 5ozHO4ve0ROgeC4HPKsUMxSmg15kvRSOKmWItAYqFJn5EYNVx549n/nVruqcMc+lzHIfLkSenvY
 isQrV7WgxOyD86wsMYfezf8w1eOH9
X-Received: by 2002:a05:6000:23c:b0:1f0:2413:c860 with SMTP id
 l28-20020a056000023c00b001f02413c860mr12964274wrz.693.1646761879003; 
 Tue, 08 Mar 2022 09:51:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw2f9Mbdq4rhVYfaVuuioGW2mCY9DgURJlu4EpxXKaSpvf4N/dDk6sSPqhI/pTZvNuf2VII/g==
X-Received: by 2002:a05:6000:23c:b0:1f0:2413:c860 with SMTP id
 l28-20020a056000023c00b001f02413c860mr12964256wrz.693.1646761878737; 
 Tue, 08 Mar 2022 09:51:18 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 l23-20020a05600c1d1700b00389a5735c59sm3289445wms.13.2022.03.08.09.51.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Mar 2022 09:51:18 -0800 (PST)
Message-ID: <4d489fba-917f-4212-0528-0295e86c4c4a@redhat.com>
Date: Tue, 8 Mar 2022 18:51:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 6/9] drm/fb-helper: Provide callback to create fbdev dumb
 buffers
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@linux.ie, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 deller@gmx.de
References: <20220303205839.28484-1-tzimmermann@suse.de>
 <20220303205839.28484-7-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220303205839.28484-7-tzimmermann@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/3/22 21:58, Thomas Zimmermann wrote:
> Provide struct drm_driver.dumb_create_fbdev, a callback hook for
> fbdev dumb buffers. Wire up fbdev and client helpers to use the new
> interface, if present.
> 
> This acknowledges the fact that fbdev buffers are different. The most
> significant difference to regular GEM BOs is in mmap semantics. Fbdev
> userspace treats the pages as video memory, which makes it impossible
> to ever move the mmap'ed buffer. Hence, drivers ussually have to pin
> the BO permanently or install an intermediate shadow buffer for mmap.
> 
> So far, fbdev memory came from dumb buffers and DRM drivers had no
> means of detecting this without reimplementing a good part of the fbdev
> code. With the new callback, drivers can perma-pin fbdev buffer objects
> if needed.
> 
> Several drivers also require damage handling, which fbdev implements
> with its deferred I/O helpers. The new callback allows a driver's memory
> manager to set up a suitable mmap.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/drm_client.c        | 14 +++++++----
>  drivers/gpu/drm/drm_crtc_internal.h |  3 +++
>  drivers/gpu/drm/drm_dumb_buffers.c  | 36 +++++++++++++++++++++++++----
>  drivers/gpu/drm/drm_fb_helper.c     | 26 +++++++++++++++++----
>  include/drm/drm_client.h            |  3 ++-
>  include/drm/drm_drv.h               | 17 ++++++++++++++
>  6 files changed, 84 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client.c
> index af3b7395bf69..c964064651d5 100644
> --- a/drivers/gpu/drm/drm_client.c
> +++ b/drivers/gpu/drm/drm_client.c
> @@ -247,7 +247,8 @@ static void drm_client_buffer_delete(struct drm_client_buffer *buffer)
>  }
>  
>  static struct drm_client_buffer *
> -drm_client_buffer_create(struct drm_client_dev *client, u32 width, u32 height, u32 format)
> +drm_client_buffer_create(struct drm_client_dev *client, u32 width, u32 height, u32 format,
> +			 bool fbdev)
>  {
>  	const struct drm_format_info *info = drm_format_info(format);
>  	struct drm_mode_create_dumb dumb_args = { };
> @@ -265,7 +266,10 @@ drm_client_buffer_create(struct drm_client_dev *client, u32 width, u32 height, u
>  	dumb_args.width = width;
>  	dumb_args.height = height;
>  	dumb_args.bpp = info->cpp[0] * 8;
> -	ret = drm_mode_create_dumb(dev, &dumb_args, client->file);
> +	if (fbdev)

Maybe if (defined(CONFIG_DRM_FBDEV_EMULATION) && fbdev) ?

> +		ret = drm_mode_create_dumb_fbdev(dev, &dumb_args, client->file);

And drm_mode_create_dumb_fbdev() could just be made a stub if
CONFIG_DRM_FBDEV_EMULATION isn't enabled.

I believe the only usage of the DRM client API currently is the fbdev
emulation layer anyways? But still makes sense I think to condtionally
compile that since drm_client.o is built in the drm.ko module and the
drm_fb_helper.o only included if fbdev emulation has been enabled.

> +	else
> +		ret = drm_mode_create_dumb(dev, &dumb_args, client->file);
>  	if (ret)
>  		goto err_delete;
>  
> @@ -402,6 +406,7 @@ static int drm_client_buffer_addfb(struct drm_client_buffer *buffer,
>   * @width: Framebuffer width
>   * @height: Framebuffer height
>   * @format: Buffer format
> + * @fbdev: True if the client provides an fbdev device, or false otherwise
>   *

An emulated fbdev device ?

Other than those small nit,

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

