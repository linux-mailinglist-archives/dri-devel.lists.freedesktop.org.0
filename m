Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4334B836DF
	for <lists+dri-devel@lfdr.de>; Thu, 18 Sep 2025 10:05:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E16910E3B8;
	Thu, 18 Sep 2025 08:05:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="bB8r9c7k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4F4E710E3B8
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 08:05:19 +0000 (UTC)
Received: by linux.microsoft.com (Postfix, from userid 1127)
 id 1068720143C5; Thu, 18 Sep 2025 01:05:19 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 1068720143C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1758182719;
 bh=f6Xq/qzmkWBxkjsonhrjIu+AIDazg4cml5u/EGCUwPU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bB8r9c7kBJIUWPHkehFORLxOvLjCwkQvqm41saev5ohf3b+kUXL/Gx4VuOq6LMbuy
 yS1ADesr3o3mUX/a+66BzjrpR4rzSdtPCFJWm5xOnSWgmQxUNtob0h9Hi6QaoGqPZ8
 81O13NsLhzqA+eU/+wzr0zOawJT+t5vR3k4zt7go=
Date: Thu, 18 Sep 2025 01:05:19 -0700
From: Saurabh Singh Sengar <ssengar@linux.microsoft.com>
To: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
Cc: dri-devel@lists.freedesktop.org, linux-hyperv@vger.kernel.org,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 mhklinux@outlook.com, rdunlap@infradead.org,
 bartosz.golaszewski@linaro.org, gonzalo.silvalde@gmail.com,
 arnd@arndb.de, tzimmermann@suse.de, decui@microsoft.com,
 wei.liu@kernel.org, deller@gmx.de, kys@microsoft.com,
 haiyangz@microsoft.com
Subject: Re: [PATCH 2/2] MAINTAINERS: Mark hyperv_fb driver Obsolete
Message-ID: <20250918080519.GB17773@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
References: <E5C2A201B1BD>
 <1758117804-20798-1-git-send-email-ptsm@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1758117804-20798-1-git-send-email-ptsm@linux.microsoft.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
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

On Wed, Sep 17, 2025 at 07:03:24AM -0700, Prasanna Kumar T S M wrote:
> The hyperv_fb driver is deprecated in favor of Hyper-V DRM driver. Split
> the hyperv_fb entry from the hyperv drivers list, mark it obsolete.
> 
> Signed-off-by: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
> ---
>  MAINTAINERS | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f6206963efbf..aa9d0fa6020b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11424,7 +11424,6 @@ F:	drivers/pci/controller/pci-hyperv-intf.c
>  F:	drivers/pci/controller/pci-hyperv.c
>  F:	drivers/scsi/storvsc_drv.c
>  F:	drivers/uio/uio_hv_generic.c
> -F:	drivers/video/fbdev/hyperv_fb.c
>  F:	include/asm-generic/mshyperv.h
>  F:	include/clocksource/hyperv_timer.h
>  F:	include/hyperv/hvgdk.h
> @@ -11438,6 +11437,16 @@ F:	include/uapi/linux/hyperv.h
>  F:	net/vmw_vsock/hyperv_transport.c
>  F:	tools/hv/
>  
> +HYPER-V FRAMEBUFFER DRIVER
> +M:	"K. Y. Srinivasan" <kys@microsoft.com>
> +M:	Haiyang Zhang <haiyangz@microsoft.com>
> +M:	Wei Liu <wei.liu@kernel.org>
> +M:	Dexuan Cui <decui@microsoft.com>
> +L:	linux-hyperv@vger.kernel.org
> +S:	Obsolete
> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/hyperv/linux.git
> +F:	drivers/video/fbdev/hyperv_fb.c
> +
>  HYPERBUS SUPPORT
>  M:	Vignesh Raghavendra <vigneshr@ti.com>
>  R:	Tudor Ambarus <tudor.ambarus@linaro.org>
> -- 
> 2.49.0

Reviewed-by: Saurabh Sengar <ssengar@linux.microsoft.com>
