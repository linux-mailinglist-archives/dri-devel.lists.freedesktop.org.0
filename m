Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F0AF73CFB60
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 15:57:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38EB96E3D3;
	Tue, 20 Jul 2021 13:57:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B73BA6E3D3
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jul 2021 13:57:28 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id l7so26103541wrv.7
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jul 2021 06:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=YjC/1q56VZyRj5FgZk/kZirFRzkxcDiNGWKtXPB2xZU=;
 b=EWV4t06ZkuvrCTWNoow2n5zIQaDN7iXsfVTCfissKmsnwgHJbti5dlrjnCajSrrNCI
 RCK0Yy3PhEraiHhN2tB+vLdcZhPLsHoFlScNEpJCfuwnSPQgZMD8i/BzBcaJCFEm+0hj
 rsgD1+WET+gZN1ktGwanQgT+mmRfVFsRcyJx8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YjC/1q56VZyRj5FgZk/kZirFRzkxcDiNGWKtXPB2xZU=;
 b=VI96heA2PnuIYoQUu66MhmFrb3ZQXEN23HP3VvUJN0GpSK/ojdRA5TFw+M6F3vDfps
 65OiuOuNPf0Qb5A+s6vtq4hRCI46Wz0mCAGgwZcVF0CjQrx30YESztjZaRegPBRD5CAY
 7yaMoLbWN/nvF1iqZtLh+ceA53eBcCnmxrZMbgn89RCPHeas5dsW/d+iZhBbVxjDXM8s
 sEZhMmpwsJfDxUATggDy6X7tM+JwYW7gRQzPe6RHkPRsRTocA3PMHH47Sf0b7ZZ+lfWm
 lG1FVP279MheJOys563zc1SY9+CoXaieqENFOax4kY55NGh12VgI6rsOLlvicVr5xFyh
 JwtA==
X-Gm-Message-State: AOAM533tKXw7cqzSdJ/el/n3bfs+Fq2SALalYzB3EAu6CvkG3d4Nt0VT
 N9Zr9mY//Da1pmMOfHGe93uixkUFlCfyaQ==
X-Google-Smtp-Source: ABdhPJyqlpfNV2X4XNxZWUvGUKG2ijsx1ciwqMgYmVJ9BQfDAxftpbyLRVGJmR7qXwcAZ/Gv16EHlg==
X-Received: by 2002:adf:f346:: with SMTP id e6mr37546064wrp.28.1626789447460; 
 Tue, 20 Jul 2021 06:57:27 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id d67sm2942256wmd.9.2021.07.20.06.57.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 06:57:26 -0700 (PDT)
Date: Tue, 20 Jul 2021 15:57:25 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Charles Baylis <cb-kernel@fishzet.co.uk>
Subject: Re: [PATCH] drm: Return -ENOTTY for non-drm ioctls
Message-ID: <YPbWRTboLxaI8ASA@phenom.ffwll.local>
References: <YPG3IBlzaMhfPqCr@stando.fishzet.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YPG3IBlzaMhfPqCr@stando.fishzet.co.uk>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 16, 2021 at 05:43:12PM +0100, Charles Baylis wrote:
> 
> Hi
> 
> The attached patch fixes a problem where non-drm ioctls are incorrectly
> handled by drm drivers. 
> 
> This causes problems when isatty() is called on a file descriptor which
> was opened on a drm device node. Glibc implements isatty() by invoking
> the TCGETS ioctl on the fd. TCGETS is 0x5401, so this is handled by drm_ioctl
> as DRM_IOCTL_GET_UNIQUE, which succeeds, so isatty() returns true.
> 
> As a side effect, DRM_IOCTL_GET_UNIQUE also writes to a pointer, in the
> argument buffer, so the calling application's memory can be corrupted, causing
> a crash later.
> 
> Tested on an Ubuntu 20.10 VM under qemu with virgl:
> * "if [ -t 0 ]; then echo is a tty; fi < /dev/dri/card0" outputs nothing
> * glxgears still works
> 
> Thanks
> Charles

> commit 0072b12086cdf7350df75d36a12d392e3ba92865
> Author: Charles Baylis <cb-kernel@fishzet.co.uk>
> Date:   Fri Jul 16 11:58:47 2021 +0100
> 
>     drm: Return -ENOTTY for non-drm ioctls
>     
>     Return -ENOTTY from drm_ioctl() when userspace passes in a cmd number
>     which doesn't relate to the drm subsystem.
>     
>     Glibc uses the TCGETS ioctl to implement isatty(), and without this
>     change isatty() returns it incorrectly returns true for drm devices.
>     
>     To test run this command:
>        $ if [ -t 0 ]; then echo is a tty; fi < /dev/dri/card0
>     which shows "is a tty" without this patch.
>     
>     This may also modify memory which the userspace application is not
>     expecting.

I fixed up the formatting here a bit to get git apply-mbox to accept this,
please try to use git send-email. Anyway this is bug is as old as drm, did
you see whether other subsystems are buggy like this too?

Patch applied to drm-misc-fixes with cc: stable.

Since this is pretty blantant issue, care to also type up an igt tests to
verify this stays fixed?

https://dri.freedesktop.org/docs/drm/gpu/drm-uapi.html#validating-changes-with-igt

Cheers, Daniel
>     
>     Signed-off-by: Charles Baylis <cb-kernel@fishzet.co.uk>
> 
> diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
> index 98ae00661656..f454e0424086 100644
> --- a/drivers/gpu/drm/drm_ioctl.c
> +++ b/drivers/gpu/drm/drm_ioctl.c
> @@ -834,6 +834,9 @@ long drm_ioctl(struct file *filp,
>  	if (drm_dev_is_unplugged(dev))
>  		return -ENODEV;
>  
> +       if (DRM_IOCTL_TYPE(cmd) != DRM_IOCTL_BASE)
> +               return -ENOTTY;
> +
>  	is_driver_ioctl = nr >= DRM_COMMAND_BASE && nr < DRM_COMMAND_END;
>  
>  	if (is_driver_ioctl) {
> diff --git a/include/drm/drm_ioctl.h b/include/drm/drm_ioctl.h
> index 10100a4bbe2a..afb27cb6a7bd 100644
> --- a/include/drm/drm_ioctl.h
> +++ b/include/drm/drm_ioctl.h
> @@ -68,6 +68,7 @@ typedef int drm_ioctl_compat_t(struct file *filp, unsigned int cmd,
>  			       unsigned long arg);
>  
>  #define DRM_IOCTL_NR(n)                _IOC_NR(n)
> +#define DRM_IOCTL_TYPE(n)              _IOC_TYPE(n)
>  #define DRM_MAJOR       226
>  
>  /**


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
