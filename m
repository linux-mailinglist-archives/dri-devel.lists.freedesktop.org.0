Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D455401F8
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jun 2022 17:01:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39DEA10E4D1;
	Tue,  7 Jun 2022 15:01:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A787A10E4D1
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jun 2022 15:01:26 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id q26so14195625wra.1
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jun 2022 08:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=9UpbUSyzB5BM/M+IOHSr/KOS4nqjlqBTVH6qCIsqDVs=;
 b=LpTu4x2GrXKwDxfcpNodQTe04DdpSLlrLOY3kKpS21O9BqbEBGczUAopJtSZWS+rJE
 w+aX/ZBiEcD1fIS3zZwbD20JydteRjTmVGPo3dNvlK5829FoEVE+Bmtl1o0DZY11IouJ
 feXlNEUw60xhhZducvrdszMY8YMdy3XVMXQKQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=9UpbUSyzB5BM/M+IOHSr/KOS4nqjlqBTVH6qCIsqDVs=;
 b=vqH3D3Nj7IkfwG1rOp/tdrH2YkEeJ720YJuWfTHOki4Jdbm2zLNQytj6GsMsQnv1xQ
 Rbqjq0RbUCEFwxjp63MA1Q4ltuFp4ESYxOh41OXSOJLnkyOnkEnThXgiK772SD7X8TLl
 B/gPjqXPoe9XM5QMU/j7XclZxs1HfkJvkpYldO5pl0tntLymqt3ZGzGuQad3kOfw+oIr
 0QWAsBq00BMnrH5vlI4GAVlTuQkhpAAVoqWX6kWButYt7kMYJUDbjJqqSm+AKA6PovaD
 OKKxklEikVdXMOWrkY6WTjfG4EABAKPAwyxgOkLaMlIicYr0pNMxZOPE8mhUoiW63hum
 ZvKQ==
X-Gm-Message-State: AOAM532Cr8Ioaydtthtxay98UBjjJLrROjTaO+FTV09huchM/MyWyqa3
 mJjU0zx1D0ookOP/wW/VRpv5RQ==
X-Google-Smtp-Source: ABdhPJzRSpk+t9rfEmAydcAN7JVl91M+kAWWTZJxeJuODBS8jkdv2bQOh5EfNSmoZ/h89TC2grRi3w==
X-Received: by 2002:a5d:67c9:0:b0:218:4a6a:298e with SMTP id
 n9-20020a5d67c9000000b002184a6a298emr6424341wrw.153.1654614085040; 
 Tue, 07 Jun 2022 08:01:25 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 j3-20020a5d4643000000b002103a7c5c91sm17684103wrs.43.2022.06.07.08.01.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 08:01:24 -0700 (PDT)
Date: Tue, 7 Jun 2022 17:01:00 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v5 5/7] fbdev: Disable sysfb device registration when
 removing conflicting FBs
Message-ID: <Yp9oLJ/HD2rHxO3z@phenom.ffwll.local>
Mail-Followup-To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, Helge Deller <deller@gmx.de>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20220511112438.1251024-1-javierm@redhat.com>
 <20220511113144.1252729-1-javierm@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220511113144.1252729-1-javierm@redhat.com>
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
Cc: linux-fbdev@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Helge Deller <deller@gmx.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 11, 2022 at 01:31:44PM +0200, Javier Martinez Canillas wrote:
> The platform devices registered by sysfb match with firmware-based DRM or
> fbdev drivers, that are used to have early graphics using a framebuffer
> provided by the system firmware.
> 
> DRM or fbdev drivers later are probed and remove all conflicting framebuffers,
> leading to these platform devices for generic drivers to be unregistered.
> 
> But the current solution has a race, since the sysfb_init() function could
> be called after a DRM or fbdev driver is probed and request to unregister
> the devices for drivers with conflicting framebuffes.
> 
> To prevent this, disable any future sysfb platform device registration by
> calling sysfb_disable(), if a driver requests to remove the conflicting
> framebuffers.
> 
> Suggested-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
> 
> Changes in v5:
> - Move the sysfb_disable() call at conflicting framebuffers again to
>   avoid the need of a DRIVER_FIRMWARE capability flag.
> - Add Daniel Vetter's Reviewed-by tag again since reverted to the old
>   patch that he already reviewed in v2.
> 
> Changes in v3:
> - Call sysfb_disable() when a DRM dev and a fbdev are registered rather
>   than when conflicting framebuffers are removed (Thomas Zimmermann).
> - Call sysfb_disable() when a fbdev framebuffer is registered rather
>   than when conflicting framebuffers are removed (Thomas Zimmermann).
> - Drop Daniel Vetter's Reviewed-by tag since patch changed a lot.
> 
> Changes in v2:
> - Explain in the commit message that fbmem has to unregister the device
>   as fallback if a driver registered the device itself (Daniel Vetter).
> - Also explain that fallback in a comment in the code (Daniel Vetter).
> - Don't encode in fbmem the assumption that sysfb will always register
>   platform devices (Daniel Vetter).
> - Add a FIXME comment about drivers registering devices (Daniel Vetter).
> 
>  drivers/video/fbdev/core/fbmem.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
> index 9b035ef4d552..265efa189bcc 100644
> --- a/drivers/video/fbdev/core/fbmem.c
> +++ b/drivers/video/fbdev/core/fbmem.c
> @@ -1789,6 +1789,17 @@ int remove_conflicting_framebuffers(struct apertures_struct *a,
>  	if (do_free)
>  		kfree(a);
>  
> +	/*
> +	 * If a driver asked to unregister a platform device registered by
> +	 * sysfb, then can be assumed that this is a driver for a display
> +	 * that is set up by the system firmware and has a generic driver.
> +	 *
> +	 * Drivers for devices that don't have a generic driver will never
> +	 * ask for this, so let's assume that a real driver for the display
> +	 * was already probed and prevent sysfb to register devices later.
> +	 */
> +	sysfb_disable();

So the og version had (or should have had at least) the sysfb_disable()
call before we go through the loop and try to unregister stuff. I think
this needs to be done before we call do_remove_conflicting_framebuffer()
instead. With that:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>


> +
>  	return 0;
>  }
>  EXPORT_SYMBOL(remove_conflicting_framebuffers);
> -- 
> 2.35.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
