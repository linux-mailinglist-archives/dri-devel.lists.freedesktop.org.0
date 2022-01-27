Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0652249E55D
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 16:03:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFB1110F066;
	Thu, 27 Jan 2022 15:03:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1FEC10F066
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 15:03:23 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 d138-20020a1c1d90000000b0034e043aaac7so3527202wmd.5
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 07:03:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=AKjPzil2WHL5qagwQAOKGS36RMPWHiRknzFG6enw3j0=;
 b=GilLTu0kr1ZV3H2m6xZYYhIDByDvks4ej/JU/KpTFiGhQXAeiVKBbkdZnl4A8OSisE
 hHRrlXiXAdzZksvi+myNmOZ/CzYYYDoZg/1yoPHdoi/nz1HHPXcvBgbLCkjoB+aXYb5K
 VpHTLhua0Ys7OBdEOMfIxL3KbWaI9DwX0OwPk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=AKjPzil2WHL5qagwQAOKGS36RMPWHiRknzFG6enw3j0=;
 b=nb53xmgVyzi4keXOmibZdrtvE57y4nhcFNwydPJqnNPpRtKt7WR3s0iaRyDQ7CCCmC
 PCLhNgr7mDcYl5NBsgKaKihreNfsZHptwaVvR037zCm4Fdc+iidp764o3bPcj2+rBHp1
 Va2iCE0xeHYDfMMRpez+MYQE6xQt7Bc9gwOoUFxXn2hDUp16zMTUZcNkHR28RinlDmI3
 qp/fB/bJyn1Y8FhJifTrlPtf1ot+CiH5Myj/0UfeQrsWMbnENFuWxt0McFjFHaQJrvsr
 2UJYMd23CfUyil460/pyp1dUMudqKRKKCdBaPq1MbpOlX4nJ+rxX66D7tkw5jZ1J0Xo8
 wmDg==
X-Gm-Message-State: AOAM532kg/980rnevpv8cWe0AQgVu0G9AhoNJJx7D6Yqz4sh6YdQKot+
 MG6RmH69IDa0ejLJq7decdHZkQ==
X-Google-Smtp-Source: ABdhPJx6T1w1AuSgU7ux3TF/CaY0othfoxQw6wJtY9TlQCeYZQOt8jSIa0+6/VMQsHJkIeppopOv1g==
X-Received: by 2002:a05:600c:3b27:: with SMTP id
 m39mr3012790wms.40.1643295802284; 
 Thu, 27 Jan 2022 07:03:22 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id a24sm5909975wmm.31.2022.01.27.07.03.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 07:03:21 -0800 (PST)
Date: Thu, 27 Jan 2022 16:03:19 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/fb-helper: Mark screen buffers in system memory with
 FB_VIRTFB
Message-ID: <YfK0N21rJ69rclJE@phenom.ffwll.local>
References: <20220127102621.30047-1-tzimmermann@suse.de>
 <YfKFP2DW/g6tXLQw@phenom.ffwll.local>
 <b3c508df-53ee-7fcd-2cdb-297d603a5f96@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b3c508df-53ee-7fcd-2cdb-297d603a5f96@suse.de>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 27, 2022 at 12:58:30PM +0100, Thomas Zimmermann wrote:
> Hi
> 
> Am 27.01.22 um 12:42 schrieb Daniel Vetter:
> > On Thu, Jan 27, 2022 at 11:26:21AM +0100, Thomas Zimmermann wrote:
> > > Mark screen buffers in system memory with FB_VIRTFB. Otherwise, the
> > > buffers are mmap'ed as I/O memory (i.e., VM_IO). For shadow buffers,
> > > also set the FB_READS_FAST hint.
> > 
> > Maybe clarify that this only holds for the defio case, and since we have
> > our own shadow copy for that anyway it shouldn't matter. I'm also not sure
> > how much the memcpy gains us compared to just redrawing ...
> > 
> > What's the motivation here, or just something you spotted?
> 
> Correctness mostly. fbdev's fbdefio tests for (the absence of) this flag and
> sets VM_IO accordingly.
> 
> It's actually for userspace. Maybe userspace tests these flags as well and
> can optimize memcpy pattern for different types of caching. But I wouldn't
> expect it TBH.

Hm I thought so too, but the #define is in the internal header, not the
uapi header. And I don't see any ioctl code in fbmem.c that would shove
fb_info->flags to userspace. That's why I wondered why you care about
this? Or did I miss something somewhere?
-Daniel

> 
> Best regards
> Thomas
> 
> > -Daniel
> > 
> > > 
> > > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> > > ---
> > >   drivers/gpu/drm/drm_fb_helper.c | 9 ++++++---
> > >   1 file changed, 6 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> > > index ed43b987d306..f15127a32f7a 100644
> > > --- a/drivers/gpu/drm/drm_fb_helper.c
> > > +++ b/drivers/gpu/drm/drm_fb_helper.c
> > > @@ -2346,6 +2346,7 @@ static int drm_fb_helper_generic_probe(struct drm_fb_helper *fb_helper,
> > >   	fbi->fbops = &drm_fbdev_fb_ops;
> > >   	fbi->screen_size = sizes->surface_height * fb->pitches[0];
> > >   	fbi->fix.smem_len = fbi->screen_size;
> > > +	fbi->flags = FBINFO_DEFAULT;
> > >   	drm_fb_helper_fill_info(fbi, fb_helper, sizes);
> > > @@ -2353,19 +2354,21 @@ static int drm_fb_helper_generic_probe(struct drm_fb_helper *fb_helper,
> > >   		fbi->screen_buffer = vzalloc(fbi->screen_size);
> > >   		if (!fbi->screen_buffer)
> > >   			return -ENOMEM;
> > > +		fbi->flags |= FBINFO_VIRTFB | FBINFO_READS_FAST;
> > >   		fbi->fbdefio = &drm_fbdev_defio;
> > > -
> > >   		fb_deferred_io_init(fbi);
> > >   	} else {
> > >   		/* buffer is mapped for HW framebuffer */
> > >   		ret = drm_client_buffer_vmap(fb_helper->buffer, &map);
> > >   		if (ret)
> > >   			return ret;
> > > -		if (map.is_iomem)
> > > +		if (map.is_iomem) {
> > >   			fbi->screen_base = map.vaddr_iomem;
> > > -		else
> > > +		} else {
> > >   			fbi->screen_buffer = map.vaddr;
> > > +			fbi->flags |= FBINFO_VIRTFB;
> > > +		}
> > >   		/*
> > >   		 * Shamelessly leak the physical address to user-space. As
> > > -- 
> > > 2.34.1
> > > 
> > 
> 
> -- 
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 Nürnberg, Germany
> (HRB 36809, AG Nürnberg)
> Geschäftsführer: Ivo Totev




-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
