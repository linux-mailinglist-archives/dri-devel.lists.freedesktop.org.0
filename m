Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 531AF4360D6
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 13:52:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3FAF6EC3B;
	Thu, 21 Oct 2021 11:52:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A52C6EC3B
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 11:52:31 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 z11-20020a1c7e0b000000b0030db7b70b6bso6629465wmc.1
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 04:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=KqaP08KSdoUQrZlsFwQYFA9TMSVcQSV6HmwQC6Apw40=;
 b=BeSGHaCAvx55xuP0HlaU7hSZ8hcqnSRE6/9uzu4BztcRiLYz2YDsIEDdUl+7W4FKmZ
 Df06Tj/5cEcYRuW9qfU0XsPSEs/perKHNLWHdXjZkb65lXMR9eQR0/qq32xgPdIFap6K
 7daKCN0Kg65fn2uHihKQWUNosi2UKF5LHa3pg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=KqaP08KSdoUQrZlsFwQYFA9TMSVcQSV6HmwQC6Apw40=;
 b=4zRl/y9Q9HEme0k3Raqjh04xEjwXEROMVU24Pq4XyACt6YgmZkBu9cDvLExCsz7bQu
 DgH4juEMRJK0QTRWNRSMQ7VFLcpGtgvZZ7duxjMgMFjYY0DVw4I1JAHLSMfrHdis84Tb
 O907jU0zoceDOukcguLnIp45bE0jk5RfcPeiGvOkpOiBUyPWxCE+HfXQXImtyXb5EIkn
 1o1G7fRjXc3ZI6PPJawXFBP+EOY3lgdXHjLcHL4CvbAOVtBRXKQsM2yMPu0cR8jLkreJ
 WcviVK89XjvxzeINcH457W/MBHxxm/Fih9sqQZlXfpsx5lT62Xp/odIwNUESaHTXSZoY
 88ew==
X-Gm-Message-State: AOAM532XJtlLQqJBoVPxQ2lDRVpCQRGff8WSN4r3AUrBllMRIsaHrg+1
 7b2EjPOp+/5+pL78KtLmCI8CdA==
X-Google-Smtp-Source: ABdhPJw6mKBIzGaE9xnPoIQlIZ5Aej4BYQUZHRIIYXOvycf0pnHBuy6Qoh7inh/VcHLnb1TJu9f8Zw==
X-Received: by 2002:a1c:cc0f:: with SMTP id h15mr6102512wmb.37.1634817150109; 
 Thu, 21 Oct 2021 04:52:30 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id r27sm4577653wrr.70.2021.10.21.04.52.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 04:52:29 -0700 (PDT)
Date: Thu, 21 Oct 2021 13:52:27 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 0/3] drm: Move several files from DRM core into modules
Message-ID: <YXFUe355D41ebf8q@phenom.ffwll.local>
References: <20211020131941.15367-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211020131941.15367-1-tzimmermann@suse.de>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 20, 2021 at 03:19:38PM +0200, Thomas Zimmermann wrote:
> Move a number of files into modules and behind config options.
> 
> So far, early boot graphics was provided by fbdev. With simpledrm, and
> possibly other generic DRM drivers, it's now possible to have general
> early-boot output with DRM. This requires the DRM core to be linked into
> the kernel binary image.
> 
> The reduction in size here is only ~1%, but the patchset is part of a
> larger effort to reduce the size of the DRM core module.
> 
> Thomas Zimmermann (3):
>   drm: Build drm_irq.o only if CONFIG_DRM_LEGACY has been set
>   drm: Link several object files into drm_kms_helper.ko
>   drm: Move GEM memory managers into modules

Assuming it all compiles still in all combos, on the series:

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> 
>  drivers/gpu/drm/Kconfig                |  4 ++--
>  drivers/gpu/drm/Makefile               | 26 +++++++++++++++-----------
>  drivers/gpu/drm/drm_gem_cma_helper.c   |  4 ++++
>  drivers/gpu/drm/drm_gem_shmem_helper.c |  4 ++++
>  drivers/gpu/drm/drm_irq.c              |  2 --
>  5 files changed, 25 insertions(+), 15 deletions(-)
> 
> --
> 2.33.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
