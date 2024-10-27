Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D2B59B1D51
	for <lists+dri-devel@lfdr.de>; Sun, 27 Oct 2024 12:13:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 567A710E10F;
	Sun, 27 Oct 2024 11:13:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="C/FpJQ7A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
 [209.85.128.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09FA810E057
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Oct 2024 11:13:40 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id
 5b1f17b1804b1-431616c23b5so23989315e9.0
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Oct 2024 04:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730027618; x=1730632418; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:references:subject:to:from
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TnFtMlKXcqmwSsrnLoYOaoECS4thAPfp/RwKyvQKDbo=;
 b=C/FpJQ7Arg5TAQCJQTZEjJboWpIV0wzIKxe36meApv9G9uKfp1otqWiGedRuUCJOtX
 OHMuONp4TsrcXHPFzyTwc4vfByFWJq+0NEwTrEwoW1tdDuL9mBabzoQRTxb3bt02onIN
 806X0Er3ameLsGFJEPhibft09GRS/wt4oXKjqfxoke+DHyRxXJ9BDURX1uEhRg0VN94r
 m4Z6Ut1YSurofEs2PqgKapHoc+dzuiILJNu0yW6nWEUay42E20az5u6VptD5jcrdN4CF
 E59QrXWxBf7S1APiR9zW3QSG5rOtiWvuqDW9Duh0qtBC13aMHzcBzKSe7D9ytEeGRj1/
 mGWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730027618; x=1730632418;
 h=content-transfer-encoding:in-reply-to:references:subject:to:from
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=TnFtMlKXcqmwSsrnLoYOaoECS4thAPfp/RwKyvQKDbo=;
 b=rqL389pACtaEtvDJG8h2vuWnINF9YOsGuEZSPhSEeNQ40sY9fWVWH48OgouxyeVY5B
 OsCVkHSSANyBMzu4mrEfLmSVBpXHxIbu11ji0o6XMo8bZAGthx/rrfOKJXI/z1lzThw/
 IvZPVVAj2258xfBTuXa8RJm9APodV7qKvkyhuTF6tRB/H6LSGdVXeqQi3tLKMWLJq2by
 y6TdZ2B8JFrUfsz6gWl2G+xMGpoiD2deErUx8xq2+RgPtbHhPW+gbspncMzCYe8cp2vH
 gBXf+jMI9BQc/ouFAbUzeM+ARSL9gE344H3oQIVRISZZo4rxbGpbGXRQZNkZPaWiJfeO
 mDnw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTc0VD5dYy+xEXmamjTD0EddzCaksMruCZu53z/G7oF0LCLCfYkG+SpIxKXaFWJWkIOrXBbzfop/0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy1++n5Dtt8M1md9h/Z1YscLPOzwEB+KZSTqkgKFThRfvX7T/SE
 H7kc35YKl4ftepZPbDp/COUSLYwdLvos0eG6zy45FaPl6X2PrQNG
X-Google-Smtp-Source: AGHT+IH4rBUTWTPbUDlItDuvaGpoFeuUiPiVpGCiYRECZFQm48W8Eds3MOiAORx5OW1YJlVLuS7Kzw==
X-Received: by 2002:a05:600c:5127:b0:431:4fbd:f571 with SMTP id
 5b1f17b1804b1-4319a5ba253mr38235225e9.13.1730027617874; 
 Sun, 27 Oct 2024 04:13:37 -0700 (PDT)
Received: from [192.168.1.138] ([83.165.96.99])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43193594ff3sm71807455e9.12.2024.10.27.04.13.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Oct 2024 04:13:36 -0700 (PDT)
Message-ID: <0be7bf55-95be-4ff9-98a3-b93fe1f18188@gmail.com>
Date: Sun, 27 Oct 2024 12:13:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: gonzalo.silvalde@gmail.com
To: Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] fbdev: udl: Make CONFIG_FB_DEVICE optional
References: <20241025092538.38339-1-gonzalo.silvalde@gmail.com>
 <7aabca78-dd34-4819-8a63-105d1a4cb4ba@gmx.de>
In-Reply-To: <7aabca78-dd34-4819-8a63-105d1a4cb4ba@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Hi Helge,

Thank you for your feedback.

I understand the concern about the amount of #ifdefs. I’ll review the code to see if there are other ways to handle the conditional dependencies, perhaps by using fb_dbg() or similar, as you suggested. I agree that keeping readability is important, and I’ll explore options to simplify this.

Regarding the reason for removing CONFIG_FB_DEVICE, my understanding is that this would allow the driver to be more flexible without that configuration in certain cases, as mentioned in the GPU TODO [1]. Thomas mentioned I could approach this driver with that in mind. However, if there’s a native DRM driver available that manages this device better, I could focus on other drivers instead.

Would you then recommend that I work on drivers without native DRM support for this kind of task? I’d appreciate any specific suggestions on the approach here.

Best regards,
Gonzalo Silvalde Blanco

[1] https://elixir.bootlin.com/linux/v6.11/source/Documentation/gpu/todo.rst#L459

On 25/10/24 17:37, Helge Deller <deller@gmx.de> wrote:
> On 10/25/24 11:25, Gonzalo Silvalde Blanco wrote:
> > The fb_udl driver currently depends on CONFIG_FB_DEVICE to create sysfs
> > entries and access framebuffer device information. This patch wraps the
> > relevant code blocks with #ifdef CONFIG_FB_DEVICE, allowing the driver to
> > be built and used even if CONFIG_FB_DEVICE is not selected.
> >
> > The sysfs setting only controls access to certain framebuffer attributes
> > and is not required for the basic display functionality to work 
> > correctly.
> > (For information on DisplayLink devices and their Linux support, see:
> > https://wiki.archlinux.org/title/DisplayLink).
> >
> > Tested by building with and without CONFIG_FB_DEVICE, both of which
> > compiled and ran without issues.
> 
> Gonzalo, I don't like this patch very much.
> 
> It adds lots of #ifdefs around functions like dev_dbg().
> Instead of ifdefs, aren't there other possibilities, e.g.
> using fb_dbg() if appropriate?
> Or using any other generic dbg() info or simply dropping the line?
> 
> But more important:
> This is a fbdev driver and currently depends on CONFIG_FB_DEVICE.
> If I'm right, the only reason to disable CONFIG_FB_DEVICE is if
> you want fbdev output at bootup, but otherwise just want to use DRM.
> But then, doesn't there exist a native DRM driver for this graphics
> card which can be used instead?
> If so, I suggest to not change this fbdev driver at all.
> 
> Helge
> 
> > Signed-off-by: Gonzalo Silvalde Blanco <gonzalo.silvalde@gmail.com>> ---
> >   drivers/video/fbdev/Kconfig |  1 -
> >   drivers/video/fbdev/udlfb.c | 41 ++++++++++++++++++++++---------------
> >   2 files changed, 24 insertions(+), 18 deletions(-)
> >
> > diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
> > index ea36c6956bf3..9bf6cf74b9cb 100644
> > --- a/drivers/video/fbdev/Kconfig
> > +++ b/drivers/video/fbdev/Kconfig
> > @@ -1588,7 +1588,6 @@ config FB_SMSCUFX
> >   config FB_UDL
> >       tristate "Displaylink USB Framebuffer support"
> >       depends on FB && USB
> > -    depends on FB_DEVICE
> >       select FB_MODE_HELPERS
> >       select FB_SYSMEM_HELPERS_DEFERRED
> >       help
> > diff --git a/drivers/video/fbdev/udlfb.c b/drivers/video/fbdev/udlfb.c
> > index 71ac9e36f67c..de4800f09dc7 100644
> > --- a/drivers/video/fbdev/udlfb.c
> > +++ b/drivers/video/fbdev/udlfb.c
> > @@ -341,10 +341,10 @@ static int dlfb_ops_mmap(struct fb_info *info, 
> > struct vm_area_struct *vma)
> >           return -EINVAL;
> >
> >       pos = (unsigned long)info->fix.smem_start + offset;
> > -
> > +#ifdef CONFIG_FB_DEVICE
> >       dev_dbg(info->dev, "mmap() framebuffer addr:%lu size:%lu\n",
> >           pos, size);
> > -
> > +#endif
> >       while (size > 0) {
> >           page = vmalloc_to_pfn((void *)pos);
> >           if (remap_pfn_range(vma, start, page, PAGE_SIZE, PAGE_SHARED))
> > @@ -929,10 +929,10 @@ static int dlfb_ops_open(struct fb_info *info, 
> > int user)
> >           info->fbdefio = fbdefio;
> >           fb_deferred_io_init(info);
> >       }
> > -
> > +#ifdef CONFIG_FB_DEVICE
> >       dev_dbg(info->dev, "open, user=%d fb_info=%p count=%d\n",
> >           user, info, dlfb->fb_count);
> > -
> > +#endif
> >       return 0;
> >   }
> >
> > @@ -982,9 +982,9 @@ static int dlfb_ops_release(struct fb_info *info, 
> > int user)
> >           kfree(info->fbdefio);
> >           info->fbdefio = NULL;
> >       }
> > -
> > +#ifdef CONFIG_FB_DEVICE
> >       dev_dbg(info->dev, "release, user=%d count=%d\n", user, 
> > dlfb->fb_count);
> > -
> > +#endif
> >       return 0;
> >   }
> >
> > @@ -1095,10 +1095,10 @@ static int dlfb_ops_blank(int blank_mode, 
> > struct fb_info *info)
> >       struct dlfb_data *dlfb = info->par;
> >       char *bufptr;
> >       struct urb *urb;
> > -
> > +#ifdef CONFIG_FB_DEVICE
> >       dev_dbg(info->dev, "blank, mode %d --> %d\n",
> >           dlfb->blank_mode, blank_mode);
> > -
> > +#endif
> >       if ((dlfb->blank_mode == FB_BLANK_POWERDOWN) &&
> >           (blank_mode != FB_BLANK_POWERDOWN)) {
> >
> > @@ -1190,7 +1190,9 @@ static int dlfb_realloc_framebuffer(struct 
> > dlfb_data *dlfb, struct fb_info *info
> >            */
> >           new_fb = vmalloc(new_len);
> >           if (!new_fb) {
> > +#ifdef CONFIG_FB_DEVICE
> >               dev_err(info->dev, "Virtual framebuffer alloc failed\n");
> > +#endif
> >               return -ENOMEM;
> >           }
> >           memset(new_fb, 0xff, new_len);
> > @@ -1213,9 +1215,11 @@ static int dlfb_realloc_framebuffer(struct 
> > dlfb_data *dlfb, struct fb_info *info
> >            */
> >           if (shadow)
> >               new_back = vzalloc(new_len);
> > +#ifdef CONFIG_FB_DEVICE
> >           if (!new_back)
> >               dev_info(info->dev,
> >                    "No shadow/backing buffer allocated\n");
> > +#endif
> >           else {
> >               dlfb_deferred_vfree(dlfb, dlfb->backing_buffer);
> >               dlfb->backing_buffer = new_back;
> > @@ -1247,14 +1251,14 @@ static int dlfb_setup_modes(struct dlfb_data 
> > *dlfb,
> >       struct device *dev = info->device;
> >       struct fb_videomode *mode;
> >       const struct fb_videomode *default_vmode = NULL;
> > -
> > +#ifdef CONFIG_FB_DEVICE
> >       if (info->dev) {
> >           /* only use mutex if info has been registered */
> >           mutex_lock(&info->lock);
> >           /* parent device is used otherwise */
> >           dev = info->dev;
> >       }
> > -
> > +#endif
> >       edid = kmalloc(EDID_LENGTH, GFP_KERNEL);
> >       if (!edid) {
> >           result = -ENOMEM;
> > @@ -1375,10 +1379,10 @@ static int dlfb_setup_modes(struct dlfb_data 
> > *dlfb,
> >   error:
> >       if (edid && (dlfb->edid != edid))
> >           kfree(edid);
> > -
> > +#ifdef CONFIG_FB_DEVICE
> >       if (info->dev)
> >           mutex_unlock(&info->lock);
> > -
> > +#endif
> >       return result;
> >   }
> >
> > @@ -1597,8 +1601,10 @@ static int dlfb_parse_vendor_descriptor(struct 
> > dlfb_data *dlfb,
> >   static int dlfb_usb_probe(struct usb_interface *intf,
> >                 const struct usb_device_id *id)
> >   {
> > +#ifdef CONFIG_FB_DEVICE
> >       int i;
> >       const struct device_attribute *attr;
> > +#endif
> >       struct dlfb_data *dlfb;
> >       struct fb_info *info;
> >       int retval;
> > @@ -1701,7 +1707,7 @@ static int dlfb_usb_probe(struct usb_interface 
> > *intf,
> >               retval);
> >           goto error;
> >       }
> > -
> > +#ifdef CONFIG_FB_DEVICE
> >       for (i = 0; i < ARRAY_SIZE(fb_device_attrs); i++) {
> >           attr = &fb_device_attrs[i];
> >           retval = device_create_file(info->dev, attr);
> > @@ -1710,17 +1716,16 @@ static int dlfb_usb_probe(struct usb_interface 
> > *intf,
> >                    "failed to create '%s' attribute: %d\n",
> >                    attr->attr.name, retval);
> >       }
> > -
> >       retval = device_create_bin_file(info->dev, &edid_attr);
> >       if (retval)
> >           dev_warn(info->device, "failed to create '%s' attribute: %d\n",
> >                edid_attr.attr.name, retval);
> > -
> >       dev_info(info->device,
> >            "%s is DisplayLink USB device (%dx%d, %dK framebuffer 
> > memory)\n",
> >            dev_name(info->dev), info->var.xres, info->var.yres,
> >            ((dlfb->backing_buffer) ?
> >            info->fix.smem_len * 2 : info->fix.smem_len) >> 10);
> > +#endif
> >       return 0;
> >
> >   error:
> > @@ -1737,8 +1742,9 @@ static void dlfb_usb_disconnect(struct 
> > usb_interface *intf)
> >   {
> >       struct dlfb_data *dlfb;
> >       struct fb_info *info;
> > +#ifdef CONFIG_FB_DEVICE
> >       int i;
> > -
> > +#endif
> >       dlfb = usb_get_intfdata(intf);
> >       info = dlfb->info;
> >
> > @@ -1754,10 +1760,11 @@ static void dlfb_usb_disconnect(struct 
> > usb_interface *intf)
> >       dlfb_free_urb_list(dlfb);
> >
> >       /* remove udlfb's sysfs interfaces */
> > +#ifdef CONFIG_FB_DEVICE
> >       for (i = 0; i < ARRAY_SIZE(fb_device_attrs); i++)
> >           device_remove_file(info->dev, &fb_device_attrs[i]);
> >       device_remove_bin_file(info->dev, &edid_attr);
> > -
> > +#endif
> >       unregister_framebuffer(info);
> >   }
> >
> 
> 
