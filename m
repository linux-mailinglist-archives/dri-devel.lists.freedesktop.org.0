Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E68D03DD4F3
	for <lists+dri-devel@lfdr.de>; Mon,  2 Aug 2021 13:53:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F8F96E0A0;
	Mon,  2 Aug 2021 11:53:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADB2D6E0A0
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Aug 2021 11:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627905182;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YqWzN6OYhFs4CSRT+cgSIcTdjyovh1lXT1MrhviGOqY=;
 b=d/o2MIPhjc192Mxjki/+qs8i4yZuUb5vfpg101Zkp6CfAew0BroddBsCnfVtSBaF4QJymK
 IDKSkvDlwPSSRSFJ91Fg/Sv6jtZZv7KlOVoJb2J8liLjKYjfhm9s/Q/SjB59MGftwGB/oR
 irTPmwI9BiE8QfYiWRHsRa9oNwmRxqM=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-86-8_98DkZjMi681WpcU-Ct1A-1; Mon, 02 Aug 2021 07:52:59 -0400
X-MC-Unique: 8_98DkZjMi681WpcU-Ct1A-1
Received: by mail-ed1-f71.google.com with SMTP id
 b13-20020a056402278db029039c013d5b80so8617079ede.7
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Aug 2021 04:52:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YqWzN6OYhFs4CSRT+cgSIcTdjyovh1lXT1MrhviGOqY=;
 b=YISe6dNV0xI0yoEh6iJvDEJcoMxEmOFcEZIBFJK300KP6GqCwyL0zsGxRNRfpgRgcX
 9UvGYPo8xMq/m3FDITktEAHSKtL3J1uAOCkgidzlX21v9UMfdjK0G/Hrj63Qxq38B0Px
 8uxt9hmd1MFEtOdqKMNjrGXEI6kSQ7ZH53TCT2q2TKXgSebGdQ3DoCr3H+/xQyYF7NNX
 L00YCC3GC8dTfSM0mokpizdIVFzFsh6EKKgWhU1TBRNAOUe2V7iarDYHFXMOaMOrf77u
 WYG6Tu2aFCsMMWNMwvVVTlke6umFzENHtJMkomWxLvyChDGnn39GWmTtctRZxwGvQso9
 mJZA==
X-Gm-Message-State: AOAM531HsiSscz21q1eY5DICCXIzkxDZI+ZSbfHFxF9eode0VEXkkP3e
 af5lYN9jCGi/K/E+FRh1mZ/oA7YKH6wDHW0v3EMEjx/VdrdLoUbnIj+DJIKZ160nWI29FAtxuu4
 HJamIQq5ILsN/3ttytf8UGQ0iyaCK4ia1PmwoBuE1FuRkoPIksF1vRAV/TOnxsTmLBV1NAXLPxO
 irw0Ja
X-Received: by 2002:a05:6402:358d:: with SMTP id
 y13mr18958178edc.80.1627905178365; 
 Mon, 02 Aug 2021 04:52:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwO04tX7FsQhDsRHDlnSyyC41ST3Sfiev6K4k2wOgAsFpeTxHyIpAqqW4XkEO6NxLsrpcG69g==
X-Received: by 2002:a05:6402:358d:: with SMTP id
 y13mr18958157edc.80.1627905178113; 
 Mon, 02 Aug 2021 04:52:58 -0700 (PDT)
Received: from x1.localdomain ([81.30.35.201])
 by smtp.gmail.com with ESMTPSA id dk18sm5984238edb.88.2021.08.02.04.52.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Aug 2021 04:52:57 -0700 (PDT)
Subject: Re: [PATCH] drm/vbox: Convert to Linux IRQ interfaces
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@linux.ie, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org
References: <20210706075011.9009-1-tzimmermann@suse.de>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <12fb7f27-0e1c-5f35-ca2e-5a34e7977f80@redhat.com>
Date: Mon, 2 Aug 2021 13:52:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210706075011.9009-1-tzimmermann@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

Hi,

On 7/6/21 9:50 AM, Thomas Zimmermann wrote:
> Drop the DRM IRQ midlayer in favor of Linux IRQ interfaces. DRM's
> IRQ helpers are mostly useful for UMS drivers. Modern KMS drivers
> don't benefit from using it.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

And to make sure things don't regress I've also given this a test spin:

Tested-by: Hans de Goede <hdegoede@redhat.com>

Note I assume that you will push this out do drmi-misc yourself
(if you've not done so already given that this patch is somewhat old).

Regards,

Hans



> ---
>  drivers/gpu/drm/vboxvideo/vbox_drv.c |  1 -
>  drivers/gpu/drm/vboxvideo/vbox_drv.h |  1 -
>  drivers/gpu/drm/vboxvideo/vbox_irq.c | 16 +++++++++++-----
>  3 files changed, 11 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vboxvideo/vbox_drv.c b/drivers/gpu/drm/vboxvideo/vbox_drv.c
> index 879a2445cc44..2b81cb259d23 100644
> --- a/drivers/gpu/drm/vboxvideo/vbox_drv.c
> +++ b/drivers/gpu/drm/vboxvideo/vbox_drv.c
> @@ -184,7 +184,6 @@ static const struct drm_driver driver = {
>  	.lastclose = drm_fb_helper_lastclose,
>  
>  	.fops = &vbox_fops,
> -	.irq_handler = vbox_irq_handler,
>  	.name = DRIVER_NAME,
>  	.desc = DRIVER_DESC,
>  	.date = DRIVER_DATE,
> diff --git a/drivers/gpu/drm/vboxvideo/vbox_drv.h b/drivers/gpu/drm/vboxvideo/vbox_drv.h
> index ac7c2effc46f..4903b91d7fe4 100644
> --- a/drivers/gpu/drm/vboxvideo/vbox_drv.h
> +++ b/drivers/gpu/drm/vboxvideo/vbox_drv.h
> @@ -145,7 +145,6 @@ void vbox_mm_fini(struct vbox_private *vbox);
>  int vbox_irq_init(struct vbox_private *vbox);
>  void vbox_irq_fini(struct vbox_private *vbox);
>  void vbox_report_hotplug(struct vbox_private *vbox);
> -irqreturn_t vbox_irq_handler(int irq, void *arg);
>  
>  /* vbox_hgsmi.c */
>  void *hgsmi_buffer_alloc(struct gen_pool *guest_pool, size_t size,
> diff --git a/drivers/gpu/drm/vboxvideo/vbox_irq.c b/drivers/gpu/drm/vboxvideo/vbox_irq.c
> index b3ded68603ba..903a6c48ee8b 100644
> --- a/drivers/gpu/drm/vboxvideo/vbox_irq.c
> +++ b/drivers/gpu/drm/vboxvideo/vbox_irq.c
> @@ -10,7 +10,8 @@
>   */
>  
>  #include <linux/pci.h>
> -#include <drm/drm_irq.h>
> +
> +#include <drm/drm_drv.h>
>  #include <drm/drm_probe_helper.h>
>  
>  #include "vbox_drv.h"
> @@ -31,7 +32,7 @@ void vbox_report_hotplug(struct vbox_private *vbox)
>  	schedule_work(&vbox->hotplug_work);
>  }
>  
> -irqreturn_t vbox_irq_handler(int irq, void *arg)
> +static irqreturn_t vbox_irq_handler(int irq, void *arg)
>  {
>  	struct drm_device *dev = (struct drm_device *)arg;
>  	struct vbox_private *vbox = to_vbox_dev(dev);
> @@ -170,16 +171,21 @@ static void vbox_hotplug_worker(struct work_struct *work)
>  
>  int vbox_irq_init(struct vbox_private *vbox)
>  {
> -	struct pci_dev *pdev = to_pci_dev(vbox->ddev.dev);
> +	struct drm_device *dev = &vbox->ddev;
> +	struct pci_dev *pdev = to_pci_dev(dev->dev);
>  
>  	INIT_WORK(&vbox->hotplug_work, vbox_hotplug_worker);
>  	vbox_update_mode_hints(vbox);
>  
> -	return drm_irq_install(&vbox->ddev, pdev->irq);
> +	/* PCI devices require shared interrupts. */
> +	return request_irq(pdev->irq, vbox_irq_handler, IRQF_SHARED, dev->driver->name, dev);
>  }
>  
>  void vbox_irq_fini(struct vbox_private *vbox)
>  {
> -	drm_irq_uninstall(&vbox->ddev);
> +	struct drm_device *dev = &vbox->ddev;
> +	struct pci_dev *pdev = to_pci_dev(dev->dev);
> +
> +	free_irq(pdev->irq, dev);
>  	flush_work(&vbox->hotplug_work);
>  }
> 

