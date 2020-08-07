Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7BA423EDBE
	for <lists+dri-devel@lfdr.de>; Fri,  7 Aug 2020 15:12:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABC226E137;
	Fri,  7 Aug 2020 13:12:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5AC86E12F
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Aug 2020 13:12:05 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id x5so1700870wmi.2
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Aug 2020 06:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=EEI1Q+fppn24GUPwdHUe/rrjbN2XPprAGHaCmC9qOCk=;
 b=N78Hjx0pAcuP2VQLKJkukTxDF+52k9EvIjw1q3rhWkg1C+u2aeSRZYWPwPKisJXP8Q
 Dbx7yoJIM1L5p+lScZJ5ji9JdlO60MwT7urL//OWbV4LZewRq5sblDIb7zYNecfVdw7+
 j2I7l6qqQeMtKspM19SnVntRgx2QpvKM/9eAU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=EEI1Q+fppn24GUPwdHUe/rrjbN2XPprAGHaCmC9qOCk=;
 b=JBFJ6qaKxC+ZIbWCG4YsPJ5Ux7l0B1benFzqL1fbcagIBAKVnEkSfYG/IzE7GKwjbg
 It5M18Mea1OHkTpfzq+o/V5IrL8fTfLYgzHPinefVhIyReYv8hPH0C0Z/t/seDE3bygj
 Gkbfe0EWzYf/aOPa+A5bywUNPC/GgO1qlbY5U1INYt6rfB8RbuJbkXtLaEdFOWaEwIeZ
 JdEqLtXShcLl/7WqYGDPDKmCE96vc+q9dXXB7Ji/RCR8+cd8HoLXl8x7dtRM3ru0l6VU
 6UZukVOH/6satYSyuAf9zmifCwR2yi5T00zfY2l3T/vYVY+ylxPsFq97d/F/hPZ53BC4
 vwIQ==
X-Gm-Message-State: AOAM531KxAOHDWXAYUUWnobBdhCI5LPGgqMtpolPrLsXrE1RZ4wFS1bB
 Dequd2Q0Lojrfwc/OGLCj3CnKA==
X-Google-Smtp-Source: ABdhPJyD5OPGKoTthEZngYIDRYz+e6OwbxqKcFkbXwnJNTrU9Di7izRE54UTv2wtNjkvOJXMA2srGQ==
X-Received: by 2002:a7b:c258:: with SMTP id b24mr12470414wmj.122.1596805924546; 
 Fri, 07 Aug 2020 06:12:04 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l11sm9904436wme.11.2020.08.07.06.12.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Aug 2020 06:12:03 -0700 (PDT)
Date: Fri, 7 Aug 2020 15:12:01 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v2] drm/qxl: don't take vga ports on rev5+
Message-ID: <20200807131201.GF2352366@phenom.ffwll.local>
Mail-Followup-To: Gerd Hoffmann <kraxel@redhat.com>,
 dri-devel@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>,
 David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>, 
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU" <spice-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20200807105501.24599-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200807105501.24599-1-kraxel@redhat.com>
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, "open list:DRM DRIVER FOR QXL VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU" <spice-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 07, 2020 at 12:55:01PM +0200, Gerd Hoffmann wrote:
> qemu 5.0 introduces a new qxl hardware revision 5.  Unlike revision 4
> (and below) the device doesn't switch back into vga compatibility mode
> when someone touches the vga ports.  So we don't have to reserve the
> vga ports any more to avoid that happening.
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>

Does what it says on the label.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/qxl/qxl_drv.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/qxl/qxl_drv.c b/drivers/gpu/drm/qxl/qxl_drv.c
> index 13872b882775..6e7f16f4cec7 100644
> --- a/drivers/gpu/drm/qxl/qxl_drv.c
> +++ b/drivers/gpu/drm/qxl/qxl_drv.c
> @@ -96,7 +96,7 @@ qxl_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  	if (ret)
>  		goto disable_pci;
>  
> -	if (is_vga(pdev)) {
> +	if (is_vga(pdev) && pdev->revision < 5) {
>  		ret = vga_get_interruptible(pdev, VGA_RSRC_LEGACY_IO);
>  		if (ret) {
>  			DRM_ERROR("can't get legacy vga ioports\n");
> @@ -127,7 +127,7 @@ qxl_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  unload:
>  	qxl_device_fini(qdev);
>  put_vga:
> -	if (is_vga(pdev))
> +	if (is_vga(pdev) && pdev->revision < 5)
>  		vga_put(pdev, VGA_RSRC_LEGACY_IO);
>  disable_pci:
>  	pci_disable_device(pdev);
> @@ -155,7 +155,7 @@ qxl_pci_remove(struct pci_dev *pdev)
>  
>  	drm_dev_unregister(dev);
>  	drm_atomic_helper_shutdown(dev);
> -	if (is_vga(pdev))
> +	if (is_vga(pdev) && pdev->revision < 5)
>  		vga_put(pdev, VGA_RSRC_LEGACY_IO);
>  }
>  
> -- 
> 2.18.4
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
