Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B300E2A437A
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 11:56:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D50D76EC1F;
	Tue,  3 Nov 2020 10:56:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23BF26EC1F
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Nov 2020 10:56:54 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id 205so4557088wma.4
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Nov 2020 02:56:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=dtrwGRb+UmbSHgKOz392czgr2UriVYsLydq55IWz0bE=;
 b=B1l92vzdaPakNBLc9cruisNYO3AjQ0gvTbW9Qu9strW45TH5zwyUP295cEHT8q/f4I
 +9Lu0WKT4z0osopF1aNv+I5QXtaaek/Lau8+mWfI8StI8fs1JzMUx984CTIOLRtB8SW7
 wg8dnE/N7d+3fcvWS/lu6zIQ0OPu0ioTT1JmM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dtrwGRb+UmbSHgKOz392czgr2UriVYsLydq55IWz0bE=;
 b=QVsEpUfrVZXnXv8z74tywa8Ty9Hqbe7BjxAokycLKDErYiaW846gA5ZgcOrQTp2BBO
 dj2wwPk3ey6ZiT7f0sSUL4eYJZcCurv+FRkiqv/yJtHlfM8JGLb7Lh5nDQuHaFQMH+Qq
 XeCLGM/5Bi2hj6PFFMSm/KrFo8o7a/Vs050a7rmny748twcJctTi+jhXbSJe9zSED7df
 URSY3UIFRRP6pDFQBPQyEzzn9/9MpX3GBB9g0xbvZK3O/xZVr/AB+KFJmxBX8NfBvXTU
 V3qRgbES0pfmbv4TEukRJY5z5chNycFkY1jwJIdoA/q5l5Dd2gzJmXFRIwwcAZfiBsPg
 YDFQ==
X-Gm-Message-State: AOAM533FKQcm8gYXVEmg3bB/J0HwZVsjNhg4MDGg9rN9iM5nqVLwa9Yx
 ezJKLa0JlkK0tXuyF0mppe7JGg==
X-Google-Smtp-Source: ABdhPJw7A78jMoNNEsQKD4VGAQuRJc/KkXAEcLXsahV3cm8cN/gIzZbTb2vB6YEl+AJDbQxXidn1TA==
X-Received: by 2002:a7b:c341:: with SMTP id l1mr3043688wmj.80.1604401012851;
 Tue, 03 Nov 2020 02:56:52 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u81sm2695935wmb.27.2020.11.03.02.56.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Nov 2020 02:56:52 -0800 (PST)
Date: Tue, 3 Nov 2020 11:56:50 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 3/3] drm/udl: Retrieve USB device from struct
 drm_device.dev
Message-ID: <20201103105650.GF401619@phenom.ffwll.local>
References: <20201103103656.17768-1-tzimmermann@suse.de>
 <20201103103656.17768-4-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201103103656.17768-4-tzimmermann@suse.de>
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

On Tue, Nov 03, 2020 at 11:36:56AM +0100, Thomas Zimmermann wrote:
> Drop the driver's udev field in favor of struct drm_device.dev. No
> functional changes made.
> 
> v2:
> 	* upcast dev with drm_dev_get_usb_device()

Again, witht that helper either moved to udl_drv.h or to usb code:

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/udl/udl_connector.c |  9 +++++----
>  drivers/gpu/drm/udl/udl_drv.c       |  3 ---
>  drivers/gpu/drm/udl/udl_drv.h       |  1 -
>  drivers/gpu/drm/udl/udl_main.c      | 25 ++++++++++++++-----------
>  4 files changed, 19 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/udl/udl_connector.c b/drivers/gpu/drm/udl/udl_connector.c
> index cdc1c42e1669..487e03e1727c 100644
> --- a/drivers/gpu/drm/udl/udl_connector.c
> +++ b/drivers/gpu/drm/udl/udl_connector.c
> @@ -10,6 +10,7 @@
>  #include <drm/drm_atomic_state_helper.h>
>  #include <drm/drm_crtc_helper.h>
>  #include <drm/drm_probe_helper.h>
> +#include <drm/drm_usb_helper.h>
>  
>  #include "udl_connector.h"
>  #include "udl_drv.h"
> @@ -20,6 +21,7 @@ static int udl_get_edid_block(void *data, u8 *buf, unsigned int block,
>  	int ret, i;
>  	u8 *read_buff;
>  	struct udl_device *udl = data;
> +	struct usb_device *udev = drm_dev_get_usb_device(&udl->drm);
>  
>  	read_buff = kmalloc(2, GFP_KERNEL);
>  	if (!read_buff)
> @@ -27,10 +29,9 @@ static int udl_get_edid_block(void *data, u8 *buf, unsigned int block,
>  
>  	for (i = 0; i < len; i++) {
>  		int bval = (i + block * EDID_LENGTH) << 8;
> -		ret = usb_control_msg(udl->udev,
> -				      usb_rcvctrlpipe(udl->udev, 0),
> -					  (0x02), (0x80 | (0x02 << 5)), bval,
> -					  0xA1, read_buff, 2, HZ);
> +		ret = usb_control_msg(udev, usb_rcvctrlpipe(udev, 0),
> +				      0x02, (0x80 | (0x02 << 5)), bval,
> +				      0xA1, read_buff, 2, HZ);
>  		if (ret < 1) {
>  			DRM_ERROR("Read EDID byte %d failed err %x\n", i, ret);
>  			kfree(read_buff);
> diff --git a/drivers/gpu/drm/udl/udl_drv.c b/drivers/gpu/drm/udl/udl_drv.c
> index 96d4317a2c1b..993469d152da 100644
> --- a/drivers/gpu/drm/udl/udl_drv.c
> +++ b/drivers/gpu/drm/udl/udl_drv.c
> @@ -53,7 +53,6 @@ static struct drm_driver driver = {
>  
>  static struct udl_device *udl_driver_create(struct usb_interface *interface)
>  {
> -	struct usb_device *udev = interface_to_usbdev(interface);
>  	struct udl_device *udl;
>  	int r;
>  
> @@ -62,8 +61,6 @@ static struct udl_device *udl_driver_create(struct usb_interface *interface)
>  	if (IS_ERR(udl))
>  		return udl;
>  
> -	udl->udev = udev;
> -
>  	r = udl_init(udl);
>  	if (r)
>  		return ERR_PTR(r);
> diff --git a/drivers/gpu/drm/udl/udl_drv.h b/drivers/gpu/drm/udl/udl_drv.h
> index b1461f30780b..889bfa21deb0 100644
> --- a/drivers/gpu/drm/udl/udl_drv.h
> +++ b/drivers/gpu/drm/udl/udl_drv.h
> @@ -50,7 +50,6 @@ struct urb_list {
>  struct udl_device {
>  	struct drm_device drm;
>  	struct device *dev;
> -	struct usb_device *udev;
>  
>  	struct drm_simple_display_pipe display_pipe;
>  
> diff --git a/drivers/gpu/drm/udl/udl_main.c b/drivers/gpu/drm/udl/udl_main.c
> index f5d27f2a5654..208505a39ace 100644
> --- a/drivers/gpu/drm/udl/udl_main.c
> +++ b/drivers/gpu/drm/udl/udl_main.c
> @@ -11,6 +11,7 @@
>  #include <drm/drm.h>
>  #include <drm/drm_print.h>
>  #include <drm/drm_probe_helper.h>
> +#include <drm/drm_usb_helper.h>
>  
>  #include "udl_drv.h"
>  
> @@ -26,10 +27,10 @@
>  #define GET_URB_TIMEOUT	HZ
>  #define FREE_URB_TIMEOUT (HZ*2)
>  
> -static int udl_parse_vendor_descriptor(struct drm_device *dev,
> -				       struct usb_device *usbdev)
> +static int udl_parse_vendor_descriptor(struct udl_device *udl)
>  {
> -	struct udl_device *udl = to_udl(dev);
> +	struct drm_device *dev = &udl->drm;
> +	struct usb_device *udev = drm_dev_get_usb_device(dev);
>  	char *desc;
>  	char *buf;
>  	char *desc_end;
> @@ -41,7 +42,7 @@ static int udl_parse_vendor_descriptor(struct drm_device *dev,
>  		return false;
>  	desc = buf;
>  
> -	total_len = usb_get_descriptor(usbdev, 0x5f, /* vendor specific */
> +	total_len = usb_get_descriptor(udev, 0x5f, /* vendor specific */
>  				    0, desc, MAX_VENDOR_DESCRIPTOR_SIZE);
>  	if (total_len > 5) {
>  		DRM_INFO("vendor descriptor length:%x data:%11ph\n",
> @@ -98,19 +99,20 @@ static int udl_parse_vendor_descriptor(struct drm_device *dev,
>   */
>  static int udl_select_std_channel(struct udl_device *udl)
>  {
> -	int ret;
>  	static const u8 set_def_chn[] = {0x57, 0xCD, 0xDC, 0xA7,
>  					 0x1C, 0x88, 0x5E, 0x15,
>  					 0x60, 0xFE, 0xC6, 0x97,
>  					 0x16, 0x3D, 0x47, 0xF2};
> +
>  	void *sendbuf;
> +	int ret;
> +	struct usb_device *udev = drm_dev_get_usb_device(&udl->drm);
>  
>  	sendbuf = kmemdup(set_def_chn, sizeof(set_def_chn), GFP_KERNEL);
>  	if (!sendbuf)
>  		return -ENOMEM;
>  
> -	ret = usb_control_msg(udl->udev,
> -			      usb_sndctrlpipe(udl->udev, 0),
> +	ret = usb_control_msg(udev, usb_sndctrlpipe(udev, 0),
>  			      NR_USB_REQUEST_CHANNEL,
>  			      (USB_DIR_OUT | USB_TYPE_VENDOR), 0, 0,
>  			      sendbuf, sizeof(set_def_chn),
> @@ -202,6 +204,7 @@ static int udl_alloc_urb_list(struct drm_device *dev, int count, size_t size)
>  	struct urb_node *unode;
>  	char *buf;
>  	size_t wanted_size = count * size;
> +	struct usb_device *udev = drm_dev_get_usb_device(&udl->drm);
>  
>  	spin_lock_init(&udl->urbs.lock);
>  
> @@ -229,7 +232,7 @@ static int udl_alloc_urb_list(struct drm_device *dev, int count, size_t size)
>  		}
>  		unode->urb = urb;
>  
> -		buf = usb_alloc_coherent(udl->udev, size, GFP_KERNEL,
> +		buf = usb_alloc_coherent(udev, size, GFP_KERNEL,
>  					 &urb->transfer_dma);
>  		if (!buf) {
>  			kfree(unode);
> @@ -243,8 +246,8 @@ static int udl_alloc_urb_list(struct drm_device *dev, int count, size_t size)
>  		}
>  
>  		/* urb->transfer_buffer_length set to actual before submit */
> -		usb_fill_bulk_urb(urb, udl->udev, usb_sndbulkpipe(udl->udev, 1),
> -			buf, size, udl_urb_completion, unode);
> +		usb_fill_bulk_urb(urb, udev, usb_sndbulkpipe(udev, 1),
> +				  buf, size, udl_urb_completion, unode);
>  		urb->transfer_flags |= URB_NO_TRANSFER_DMA_MAP;
>  
>  		list_add_tail(&unode->entry, &udl->urbs.list);
> @@ -316,7 +319,7 @@ int udl_init(struct udl_device *udl)
>  
>  	mutex_init(&udl->gem_lock);
>  
> -	if (!udl_parse_vendor_descriptor(dev, udl->udev)) {
> +	if (!udl_parse_vendor_descriptor(udl)) {
>  		ret = -ENODEV;
>  		DRM_ERROR("firmware not recognized. Assume incompatible device\n");
>  		goto err;
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
