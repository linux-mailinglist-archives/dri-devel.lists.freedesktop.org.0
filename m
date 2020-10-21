Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 740A4295336
	for <lists+dri-devel@lfdr.de>; Wed, 21 Oct 2020 22:01:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 951EA6E0A8;
	Wed, 21 Oct 2020 20:01:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EC746E0A8
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Oct 2020 20:01:34 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id t9so4386075wrq.11
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Oct 2020 13:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=KbczY/qGF4dz72/bMyNPXVKQHGBRTYdPXSN99Ct3lpE=;
 b=lLg72FGuyABNTqDYefCftUL+8vwOkLXEA+bsSsjjIK7Ju/zwrqyk27F+hkOWxSKCM0
 12usFszURspGE41l1lDIRS2UkSqDFVlSnVLnysOakmtqoyVC9UlkqWA9ewx7g+yOr5YE
 YaYPJbJYZj1cLlFH0n5ag61n7wUh7+a0WM88Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=KbczY/qGF4dz72/bMyNPXVKQHGBRTYdPXSN99Ct3lpE=;
 b=N3/AFV5Ea0STiWnU6GuXJ/loF8/1x/HtdK5EFjVd3+ibFqVLxQb1wAgbulUTQ9NVoz
 18BI37dRLWQZtfyFBGgML1st3if8Q7oHNMiTVQyMYewNVbDDLwLBueuyQg/90jYevRQF
 Zl0WJlog5+BJpCEK2U9S+9pJRi22gVgJsuZLi/18lVkShQsLd6QuHUBWrk45IekT36ae
 r+qC6Wt/Xo16NpqOEtknc/4Vq5ZhNiTuKM+Jss9rdBtXEWch652cdn3ARyW+hXVfDrSN
 QKhCl+UqAWZ7HyNKYytGFLVu1frO3hsxHCJrsn890w4JhK61KNk7GaxNOpFbPm8IYtFd
 +Sqg==
X-Gm-Message-State: AOAM530lom/Wdg+0W1WFcBWC7gbAduYg5RPcm0HEOOwkiwpybWZNbGvE
 mJNcCM+s5tS10QT8gmpXgT/MAg==
X-Google-Smtp-Source: ABdhPJzEXPLQ0yGiV3RzfjVhB08Kdv5ZFoYsptY9iDhLN6hNRrcrELTy54ol3+HbIeXM6vNbWfYctw==
X-Received: by 2002:a5d:4b10:: with SMTP id v16mr6834950wrq.178.1603310492901; 
 Wed, 21 Oct 2020 13:01:32 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id b7sm5730561wrp.16.2020.10.21.13.01.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Oct 2020 13:01:31 -0700 (PDT)
Date: Wed, 21 Oct 2020 22:01:29 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 0/3] drm: Store USB device in struct drm_device
Message-ID: <20201021200129.GQ401619@phenom.ffwll.local>
References: <20201021130732.4048-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201021130732.4048-1-tzimmermann@suse.de>
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

On Wed, Oct 21, 2020 at 03:07:29PM +0200, Thomas Zimmermann wrote:
> The drivers gm12u320 and udl operate on USB devices. They leave the
> PCI device in struct drm_device empty and store the USB device in their
> own driver structure.
> 
> Fix this special case and save a few bytes by putting the USB device
> into an anonymous union with the PCI data. It's expected that DRM
> core and helpers only touch the PCI-device field for actual PCI devices.

Uh no.

If you're really concerned about the 8 bytes wasted, use drm_device->dev
instead, and upcast it to the usb device. I think some drivers do this
already (at least on the platform side iirc).

But we had this entire drm_bus midlayer stuff already, and it took forever
to sunset it. I don't want to go back, and saving 8 bytes in a giantic
structure isn't worth that risk imo.
-Daniel

> 
> Thomas Zimmermann (3):
>   drm: Add reference to USB device to struct drm_device
>   drm/tiny/gm12u320: Store USB device in struct drm_device.udev
>   drm/udl: Store USB device in struct drm_device.udev
> 
>  drivers/gpu/drm/tiny/gm12u320.c     | 52 +++++++++++++----------------
>  drivers/gpu/drm/udl/udl_connector.c |  8 ++---
>  drivers/gpu/drm/udl/udl_drv.c       |  2 +-
>  drivers/gpu/drm/udl/udl_drv.h       |  1 -
>  drivers/gpu/drm/udl/udl_main.c      | 15 +++++----
>  include/drm/drm_device.h            | 21 ++++++++----
>  6 files changed, 52 insertions(+), 47 deletions(-)
> 
> --
> 2.28.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
