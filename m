Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 505BF97E559
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2024 06:35:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91C5C10E376;
	Mon, 23 Sep 2024 04:35:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="WwREBO8g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6625810E376
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 04:35:51 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-2f74e613a10so54071811fa.1
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Sep 2024 21:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727066149; x=1727670949; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=2JetWe2QTd8KWzvXFEGG8UYoUhkg88bJC3o+AzFZy+4=;
 b=WwREBO8gHOnC/thjutaMzoKiZ5MW55Vz4GvJl4nxRkT8WsSTFqQ61iIFqq3GAxG5T4
 mhsUEL4IGwrBvBsXaw3IsQqmC6+hrtAJ1IC8ITbxYEDelG+gLssjDa2tul59YEd5LvRl
 lorkyMpIv97J1U/TVpToESqqtr7VFQGhlexmQZp0mWraLZt3trvK2LMSTSU1NLmp9IBs
 tiR58qWBkHaLNONz1EXmWpZONvdKWsgWkzfZ2Nvy1XRsetHSsA6WCBs4Lii4MdVsLscD
 qlMH2I2NIMUH4sRl209046qZrR+YxlDl+yiXXiWJQQJaaPF9PPU2lXC66njABf/YS7JU
 Tw3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727066149; x=1727670949;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2JetWe2QTd8KWzvXFEGG8UYoUhkg88bJC3o+AzFZy+4=;
 b=bB+iKPLJv0mRV5jzIeRa8Yvsf0pQ/J08Lqa4xQsCFfErAyrNFk4WgpxIr3/qgY76Dj
 febUXrKZqGKlFluLibhvapV6latUd7gNCMqhhkfXGiQ3qDJ1ahQo3+pp5HVmgYBHyEjr
 0KSqE6stHkRHeXej093lNklctqa+0pPC12IUgvFZso2kfgif0rH73VlKMCTe0dc+JlNo
 hIwjHzjKt15CQAw9MtYO0u3EHpO+iJStzy4l9MXVSdUgzoIHjmnWQLXi1216/VASXjYE
 8IXssIAzHZxTfxVaobCT2sjgBsmnSneIaZohfvUQNBMOpjmA/0bJut027vXyTk6ZHhHq
 OHYw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBxF0bHgpap02iFWy0hu7nEjX2jn2XbPstWdeqFqbQ2rbL8L6MUACpRcyIT2brJKsbWFhTLELCU5c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzpmW+ym4F7vfODsSEWX5Qi1Hk2j+Lj/cjjDt/igmQFRc7DToME
 NigNsl5gy6nnSXloysNEiNHC9AHAcHvn1tHSBtle4f4IRIYenvEPpVkwWe10Pgo=
X-Google-Smtp-Source: AGHT+IFANWQ65KZ59WdgrDI2FuFpMbQnfiL3URTM3vOK97JEagYF4FdcVxplz+UK/NHUjDwB1sfURQ==
X-Received: by 2002:a05:651c:2222:b0:2f7:5049:160 with SMTP id
 38308e7fff4ca-2f7cb30cb37mr68942501fa.13.1727066149384; 
 Sun, 22 Sep 2024 21:35:49 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f79d2e1b38sm28430311fa.1.2024.09.22.21.35.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Sep 2024 21:35:48 -0700 (PDT)
Date: Mon, 23 Sep 2024 07:35:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: kraxel@redhat.com, daniel@ffwll.ch, airlied@gmail.com, 
 mripard@kernel.org, maarten.lankhorst@linux.intel.com, 
 dri-devel@lists.freedesktop.org, virtualization@lists.linux.dev
Subject: Re: [PATCH v2 02/10] drm/bochs: Use helpers for struct drm_edid
Message-ID: <2fuwrqk4aeuflsxjr73zj6nyvvmpmiupam4oemw7oxfia22ila@5hehupmjzkhh>
References: <20240902105546.792625-1-tzimmermann@suse.de>
 <20240902105546.792625-3-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240902105546.792625-3-tzimmermann@suse.de>
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

On Mon, Sep 02, 2024 at 12:53:40PM GMT, Thomas Zimmermann wrote:
> Implement a read function for struct drm_edid and read the EDID data
> with drm_edit_read_custom(). Update the connector data accordingly.
> 
> The EDID data comes from the emulator itself and the connector stores
> a copy in its EDID property. The drm_edid field in struct bochs_device
> is therefore not required. Remove it.
> 
> If qemu provides no EDID data, install default display modes as before.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Acked-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  drivers/gpu/drm/tiny/bochs.c | 48 +++++++++++++++++-------------------
>  1 file changed, 22 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tiny/bochs.c b/drivers/gpu/drm/tiny/bochs.c
> index 47a45a14306c..197fc00b373f 100644
> --- a/drivers/gpu/drm/tiny/bochs.c
> +++ b/drivers/gpu/drm/tiny/bochs.c
> @@ -85,7 +85,6 @@ struct bochs_device {
>  	u16 yres_virtual;
>  	u32 stride;
>  	u32 bpp;
> -	const struct drm_edid *drm_edid;
>  
>  	/* drm */
>  	struct drm_device *dev;
> @@ -172,12 +171,14 @@ static void bochs_hw_set_little_endian(struct bochs_device *bochs)
>  #define bochs_hw_set_native_endian(_b) bochs_hw_set_little_endian(_b)
>  #endif
>  
> -static int bochs_get_edid_block(void *data, u8 *buf,
> -				unsigned int block, size_t len)
> +static int bochs_get_edid_block(void *data, u8 *buf, unsigned int block, size_t len)
>  {
>  	struct bochs_device *bochs = data;
>  	size_t i, start = block * EDID_LENGTH;
>  
> +	if (!bochs->mmio)
> +		return -1;
> +
>  	if (start + len > 0x400 /* vga register offset */)
>  		return -1;
>  
> @@ -187,25 +188,20 @@ static int bochs_get_edid_block(void *data, u8 *buf,
>  	return 0;
>  }
>  
> -static int bochs_hw_load_edid(struct bochs_device *bochs)
> +static const struct drm_edid *bochs_hw_read_edid(struct drm_connector *connector)
>  {
> +	struct drm_device *dev = connector->dev;
> +	struct bochs_device *bochs = dev->dev_private;
>  	u8 header[8];
>  
> -	if (!bochs->mmio)
> -		return -1;
> -
>  	/* check header to detect whenever edid support is enabled in qemu */
>  	bochs_get_edid_block(bochs, header, 0, ARRAY_SIZE(header));
>  	if (drm_edid_header_is_valid(header) != 8)

I understand that you probably don't want to change the behaviour of the
driver, but maybe it's better to check drm_edid_read_custom return
value? Bochs, amdgpu and radeon are the only drivers that call
drm_edid_header_is_valid().

> -		return -1;
> +		return NULL;
>  

-- 
With best wishes
Dmitry
