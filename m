Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4DF42A4375
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 11:56:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF5B66E88A;
	Tue,  3 Nov 2020 10:56:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CCE36E88A
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Nov 2020 10:56:17 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id c9so10728079wml.5
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Nov 2020 02:56:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=x2IZoxmGs6RmE9Qy4DH631jc/PtwMLgKQ2+u2bQhUdk=;
 b=j9m+csrJvvgCzrQEpIR6YSPeZ1cdTlBan/GwKLr8Aa4dxGUl/Ba8EjJLwmsU8Ac9QC
 o7xN/JkUPa2XQLlbFhdzHEZGJm6cnNweMOF8w6XQKeyhSmWmlnKkvVgwwndiLSJ20Z9Q
 XZRCOHq5y19mm27T67KWdZQvLh6t8fpe6ZhHE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=x2IZoxmGs6RmE9Qy4DH631jc/PtwMLgKQ2+u2bQhUdk=;
 b=PygTwEluNWVOttAOalSN8IpjxBN1jk+oKAccIP9VDsx17WRtOcXehb1/LmT7wIaTO9
 HoiL9pApYqzzqbb+azRgFZxXCO81dQY7+9Rh513giGrRIwZc9GKnnameGt3taBEanVLp
 5bu34MQavwhq3EI1bb4ZoETV3RIYZfTx8ejzc200V4oHcufirO4dsfFV885TYCsjhqSo
 cmSFxDaEiIAtUTPj1tL+6UNZOsT0W+BJC3A533IEwo9AOMq2DTVJsZ1fnyzT7xxqkizI
 Xdi1T9o6zqOV5kPsmS57Arj/epTRuYlIava7edx/0pSALjLG8ydZbzW02kjYeXPJ8W9A
 D4/Q==
X-Gm-Message-State: AOAM532c+tUTtR/1hd8+ffZWkbLqMnqKBDycwRWKUtEEvY1Z8s8Dykdl
 6sCAlT2aZyHZYcxJ30HxCMvPuA==
X-Google-Smtp-Source: ABdhPJxo2kdVHY3tKztdlgwYlNQYLf+gFjcEayGCjcH93hhzOispv2cAnIBGzFlrRHW5k1/f1sOOUA==
X-Received: by 2002:a1c:a982:: with SMTP id s124mr3111539wme.65.1604400976071; 
 Tue, 03 Nov 2020 02:56:16 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id c185sm2510311wma.44.2020.11.03.02.56.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Nov 2020 02:56:15 -0800 (PST)
Date: Tue, 3 Nov 2020 11:56:13 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 2/3] drm/tiny/gm12u320: Retrieve USB device from
 struct drm_device.dev
Message-ID: <20201103105613.GE401619@phenom.ffwll.local>
References: <20201103103656.17768-1-tzimmermann@suse.de>
 <20201103103656.17768-3-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201103103656.17768-3-tzimmermann@suse.de>
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
Cc: airlied@linux.ie, hdegoede@redhat.com, dri-devel@lists.freedesktop.org,
 sean@poorly.run
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 03, 2020 at 11:36:55AM +0100, Thomas Zimmermann wrote:
> Drop the driver's udev field in favor of struct drm_device.dev. No
> functional changes made.
> 
> v2:
> 	* upcast dev with drm_dev_get_usb_device()
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

With the static inline helper either moved to gm12u320.c code or into usb
code this here is 

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/tiny/gm12u320.c | 52 +++++++++++++++------------------
>  1 file changed, 24 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tiny/gm12u320.c b/drivers/gpu/drm/tiny/gm12u320.c
> index cc397671f689..414f08c0bab9 100644
> --- a/drivers/gpu/drm/tiny/gm12u320.c
> +++ b/drivers/gpu/drm/tiny/gm12u320.c
> @@ -23,6 +23,7 @@
>  #include <drm/drm_modeset_helper_vtables.h>
>  #include <drm/drm_probe_helper.h>
>  #include <drm/drm_simple_kms_helper.h>
> +#include <drm/drm_usb_helper.h>
>  
>  static bool eco_mode;
>  module_param(eco_mode, bool, 0644);
> @@ -45,7 +46,7 @@ MODULE_PARM_DESC(eco_mode, "Turn on Eco mode (less bright, more silent)");
>  #define GM12U320_BLOCK_COUNT		20
>  
>  #define GM12U320_ERR(fmt, ...) \
> -	DRM_DEV_ERROR(&gm12u320->udev->dev, fmt, ##__VA_ARGS__)
> +	DRM_DEV_ERROR(gm12u320->dev.dev, fmt, ##__VA_ARGS__)
>  
>  #define MISC_RCV_EPT			1
>  #define DATA_RCV_EPT			2
> @@ -85,7 +86,6 @@ struct gm12u320_device {
>  	struct drm_device	         dev;
>  	struct drm_simple_display_pipe   pipe;
>  	struct drm_connector	         conn;
> -	struct usb_device               *udev;
>  	unsigned char                   *cmd_buf;
>  	unsigned char                   *data_buf[GM12U320_BLOCK_COUNT];
>  	struct {
> @@ -191,6 +191,7 @@ static int gm12u320_misc_request(struct gm12u320_device *gm12u320,
>  				 u8 req_a, u8 req_b,
>  				 u8 arg_a, u8 arg_b, u8 arg_c, u8 arg_d)
>  {
> +	struct usb_device *udev = drm_dev_get_usb_device(&gm12u320->dev);
>  	int ret, len;
>  
>  	memcpy(gm12u320->cmd_buf, &cmd_misc, CMD_SIZE);
> @@ -202,8 +203,7 @@ static int gm12u320_misc_request(struct gm12u320_device *gm12u320,
>  	gm12u320->cmd_buf[25] = arg_d;
>  
>  	/* Send request */
> -	ret = usb_bulk_msg(gm12u320->udev,
> -			   usb_sndbulkpipe(gm12u320->udev, MISC_SND_EPT),
> +	ret = usb_bulk_msg(udev, usb_sndbulkpipe(udev, MISC_SND_EPT),
>  			   gm12u320->cmd_buf, CMD_SIZE, &len, CMD_TIMEOUT);
>  	if (ret || len != CMD_SIZE) {
>  		GM12U320_ERR("Misc. req. error %d\n", ret);
> @@ -211,8 +211,7 @@ static int gm12u320_misc_request(struct gm12u320_device *gm12u320,
>  	}
>  
>  	/* Read value */
> -	ret = usb_bulk_msg(gm12u320->udev,
> -			   usb_rcvbulkpipe(gm12u320->udev, MISC_RCV_EPT),
> +	ret = usb_bulk_msg(udev, usb_rcvbulkpipe(udev, MISC_RCV_EPT),
>  			   gm12u320->cmd_buf, MISC_VALUE_SIZE, &len,
>  			   DATA_TIMEOUT);
>  	if (ret || len != MISC_VALUE_SIZE) {
> @@ -222,8 +221,7 @@ static int gm12u320_misc_request(struct gm12u320_device *gm12u320,
>  	/* cmd_buf[0] now contains the read value, which we don't use */
>  
>  	/* Read status */
> -	ret = usb_bulk_msg(gm12u320->udev,
> -			   usb_rcvbulkpipe(gm12u320->udev, MISC_RCV_EPT),
> +	ret = usb_bulk_msg(udev, usb_rcvbulkpipe(udev, MISC_RCV_EPT),
>  			   gm12u320->cmd_buf, READ_STATUS_SIZE, &len,
>  			   CMD_TIMEOUT);
>  	if (ret || len != READ_STATUS_SIZE) {
> @@ -331,6 +329,7 @@ static void gm12u320_fb_update_work(struct work_struct *work)
>  	struct gm12u320_device *gm12u320 =
>  		container_of(to_delayed_work(work), struct gm12u320_device,
>  			     fb_update.work);
> +	struct usb_device *udev = drm_dev_get_usb_device(&gm12u320->dev);
>  	int block, block_size, len;
>  	int ret = 0;
>  
> @@ -350,43 +349,41 @@ static void gm12u320_fb_update_work(struct work_struct *work)
>  		gm12u320->cmd_buf[21] =
>  			block | (gm12u320->fb_update.frame << 7);
>  
> -		ret = usb_bulk_msg(gm12u320->udev,
> -			usb_sndbulkpipe(gm12u320->udev, DATA_SND_EPT),
> -			gm12u320->cmd_buf, CMD_SIZE, &len,
> -			CMD_TIMEOUT);
> +		ret = usb_bulk_msg(udev,
> +				   usb_sndbulkpipe(udev, DATA_SND_EPT),
> +				   gm12u320->cmd_buf, CMD_SIZE, &len,
> +				   CMD_TIMEOUT);
>  		if (ret || len != CMD_SIZE)
>  			goto err;
>  
>  		/* Send data block to device */
> -		ret = usb_bulk_msg(gm12u320->udev,
> -			usb_sndbulkpipe(gm12u320->udev, DATA_SND_EPT),
> -			gm12u320->data_buf[block], block_size,
> -			&len, DATA_TIMEOUT);
> +		ret = usb_bulk_msg(udev,
> +				   usb_sndbulkpipe(udev, DATA_SND_EPT),
> +				   gm12u320->data_buf[block], block_size,
> +				   &len, DATA_TIMEOUT);
>  		if (ret || len != block_size)
>  			goto err;
>  
>  		/* Read status */
> -		ret = usb_bulk_msg(gm12u320->udev,
> -			usb_rcvbulkpipe(gm12u320->udev, DATA_RCV_EPT),
> -			gm12u320->cmd_buf, READ_STATUS_SIZE, &len,
> -			CMD_TIMEOUT);
> +		ret = usb_bulk_msg(udev,
> +				   usb_rcvbulkpipe(udev, DATA_RCV_EPT),
> +				   gm12u320->cmd_buf, READ_STATUS_SIZE, &len,
> +				   CMD_TIMEOUT);
>  		if (ret || len != READ_STATUS_SIZE)
>  			goto err;
>  	}
>  
>  	/* Send draw command to device */
>  	memcpy(gm12u320->cmd_buf, cmd_draw, CMD_SIZE);
> -	ret = usb_bulk_msg(gm12u320->udev,
> -		usb_sndbulkpipe(gm12u320->udev, DATA_SND_EPT),
> -		gm12u320->cmd_buf, CMD_SIZE, &len, CMD_TIMEOUT);
> +	ret = usb_bulk_msg(udev, usb_sndbulkpipe(udev, DATA_SND_EPT),
> +			   gm12u320->cmd_buf, CMD_SIZE, &len, CMD_TIMEOUT);
>  	if (ret || len != CMD_SIZE)
>  		goto err;
>  
>  	/* Read status */
> -	ret = usb_bulk_msg(gm12u320->udev,
> -		usb_rcvbulkpipe(gm12u320->udev, DATA_RCV_EPT),
> -		gm12u320->cmd_buf, READ_STATUS_SIZE, &len,
> -		gm12u320->fb_update.draw_status_timeout);
> +	ret = usb_bulk_msg(udev, usb_rcvbulkpipe(udev, DATA_RCV_EPT),
> +			   gm12u320->cmd_buf, READ_STATUS_SIZE, &len,
> +			   gm12u320->fb_update.draw_status_timeout);
>  	if (ret || len != READ_STATUS_SIZE)
>  		goto err;
>  
> @@ -638,7 +635,6 @@ static int gm12u320_usb_probe(struct usb_interface *interface,
>  	if (IS_ERR(gm12u320))
>  		return PTR_ERR(gm12u320);
>  
> -	gm12u320->udev = interface_to_usbdev(interface);
>  	INIT_DELAYED_WORK(&gm12u320->fb_update.work, gm12u320_fb_update_work);
>  	mutex_init(&gm12u320->fb_update.lock);
>  
> -- 
> 2.29.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
