Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A323E2ED4FE
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 18:05:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9257D6E489;
	Thu,  7 Jan 2021 17:05:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98F666E489
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Jan 2021 17:05:03 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id d13so6299104wrc.13
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Jan 2021 09:05:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=zLnCWpPPvy/Q2BKsyRUE0qo8CRuhGn1b+7gTtV+G0js=;
 b=jlVx+c4AaJsyjqQKi6vma2OsGoU6btW31JlVhaIwj760DLlEXYC+KtAXzYJ/bTYCvu
 BRuJDMZhQjmtReA03Of4XX+2qiUYZeeTj1qfcelsjTx9TDZNNcu/pXK7KjIfoOAdn+t9
 If3DkYXNGn4P3r7U3W9rKeoAwvaZ95uqyNEB4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=zLnCWpPPvy/Q2BKsyRUE0qo8CRuhGn1b+7gTtV+G0js=;
 b=SzmL6HnXreKABkRurwcnI309134BBdSk/LCrKTe8c0krig39zNWL3AQVqysVqtU7LE
 EGNhydxeMhNxXSVxHjCqfm8Eqg2P1sPefVVDmdBTkIdYzmEkXU7ceEq/BGynbeAQ1sQ+
 zB/+ABrdrsltSwMp8CLLqvnUOFkg9W24v6c1TWI7aq+GjXxuXa3SXNbgGFXMbtbiM+BE
 YpYwI5dqT1C6bMdwURMtB26fCRB/XJevbudtLEp6HwJp0uKgiPcJ+jolJm5a+SsVU9VY
 Ms3xLu3e5fU+9aUUyUuxAaZaaoh3BfpIUNSdJUzer55zSxZ9IUcTng7ynr3+crzuyOcr
 Gi3g==
X-Gm-Message-State: AOAM532Iy0U9W6zqrSG2W4Xy+4rb7w6Q1cQS5cLC6bSdnEFh/Y1Kx4Hy
 J607+KRO+3oeSiaGv1EHMAh3X1Qjb4tVRy3d
X-Google-Smtp-Source: ABdhPJwhE8K9ob3KgXOwnmPZM85AMzlHCjP20ZEoxesuE4u0Op1MroHtDmHDI2Gpnj8ZwN2hg0BFgw==
X-Received: by 2002:a5d:4c45:: with SMTP id n5mr10125162wrt.396.1610039102286; 
 Thu, 07 Jan 2021 09:05:02 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id f7sm14469121wmc.1.2021.01.07.09.05.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 09:05:01 -0800 (PST)
Date: Thu, 7 Jan 2021 18:04:59 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH] video: fbdev: simplefb: Fix info message during probe
Message-ID: <X/c/OwqdMtmqzOZq@phenom.ffwll.local>
References: <20201228183934.1117012-1-pbrobinson@gmail.com>
 <b00bd27c-70b5-9ef1-85a1-11e733af78da@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b00bd27c-70b5-9ef1-85a1-11e733af78da@redhat.com>
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
Cc: linux-fbdev@vger.kernel.org, Peter Robinson <pbrobinson@gmail.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Hans,

On Tue, Dec 29, 2020 at 02:02:30PM +0100, Hans de Goede wrote:
> Hi,
> 
> On 12/28/20 7:39 PM, Peter Robinson wrote:
> > The info message was showing the mapped address for the framebuffer. To avoid
> > security problems, all virtual addresses are converted to __ptrval__, so
> > the message has pointless information:
> > 
> > simple-framebuffer 3ea9b000.framebuffer: framebuffer at 0x3ea9b000, 0x12c000 bytes, mapped to 0x(____ptrval____)
> > 
> > Drop the extraneous bits to clean up the message:
> > 
> > simple-framebuffer 3ea9b000.framebuffer: framebuffer at 0x3ea9b000, 0x12c000 bytes
> > 
> > Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> 
> Thanks, patch looks good to me:
> 
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Since you have commit rights for drm-misc I'm assuming you're also going
to push this one?

Thanks, Daniel

> 
> Regards,
> 
> Hans
> 
> > ---
> >  drivers/video/fbdev/simplefb.c | 5 ++---
> >  1 file changed, 2 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/video/fbdev/simplefb.c b/drivers/video/fbdev/simplefb.c
> > index 533a047d07a2..62f0ded70681 100644
> > --- a/drivers/video/fbdev/simplefb.c
> > +++ b/drivers/video/fbdev/simplefb.c
> > @@ -477,9 +477,8 @@ static int simplefb_probe(struct platform_device *pdev)
> >  	simplefb_clocks_enable(par, pdev);
> >  	simplefb_regulators_enable(par, pdev);
> >  
> > -	dev_info(&pdev->dev, "framebuffer at 0x%lx, 0x%x bytes, mapped to 0x%p\n",
> > -			     info->fix.smem_start, info->fix.smem_len,
> > -			     info->screen_base);
> > +	dev_info(&pdev->dev, "framebuffer at 0x%lx, 0x%x bytes\n",
> > +			     info->fix.smem_start, info->fix.smem_len);
> >  	dev_info(&pdev->dev, "format=%s, mode=%dx%dx%d, linelength=%d\n",
> >  			     params.format->name,
> >  			     info->var.xres, info->var.yres,
> > 
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
