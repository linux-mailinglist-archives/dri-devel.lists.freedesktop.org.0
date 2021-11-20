Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C17B3457A3F
	for <lists+dri-devel@lfdr.de>; Sat, 20 Nov 2021 01:42:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 959286E821;
	Sat, 20 Nov 2021 00:42:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35E546E821
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Nov 2021 00:42:30 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id m14so10697564pfc.9
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Nov 2021 16:42:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=irIwRt0uQVberAOzG4zQ4T92lCT1W8NvllFkKqhTIJQ=;
 b=KMCWUeJ06/7oIUz63K1fe9YikKKHUVieN8mL/FOYTDTUZ+Zt8FjVr/fpkOAr1UoTRU
 UMFLwRPY2o+yhhnvEpYWyXqPfqzUZp7V+SBJcAVdkqN1leJFVOHcrrxajV5d0q5JIN3X
 4s/4tkhJgft/fjgGgiCYM+JDszyfszBQ3zR+q+VGUyyhUohPWHessoCms+bA90JH5/aV
 eA/4jQojzpypo19mlbh1hPOlmBGq2bCUbfJ0rf+hKTfBofa15g1KAJkY0JftNQGMm6nI
 1KykALsPF8wUqcMrwS/khbTnqDI0O85D3lkH9/XTJXimEQqSYtU1jeHRsScUj2YfVglS
 kuHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=irIwRt0uQVberAOzG4zQ4T92lCT1W8NvllFkKqhTIJQ=;
 b=xxnbXEaTv/rj60rI4GEanglSYhVUbRKzwazbp0RcoiG/zOi8oV6iM9eVl7cchmQdDc
 av/aLzVODghB5MqM1oBQgz/NjlvRYpUudska89kcT7u1VO9poLph2spcpP1NBLxQaQlZ
 1ADdcTW1ocCm+sCVNbyhWgOETh7VYSrFC6ejYJlLpWuUbkBUfm4yHEIdz3ew2ozl90/s
 uZFHSQp9s+mw4GVld1q0UISbAGuCNof6WgCoezYkp/qgFRzh34Uf8Vh/jox7Z9zenP8D
 HFf5Ip4bgH+LDUM44+COXQ0XH2eUGGj27vJQn7/gizcVVBdbD5XkJeVXUN2LpSKSIJmi
 Ilug==
X-Gm-Message-State: AOAM5339f9tt5nD0q2sWYs/lS3C5XQd0blurR3sbRuuz+JSHRgp9QuIt
 v/2HgY/0NMYO1TcccPhN/DE=
X-Google-Smtp-Source: ABdhPJxZVch1sP01OjM9CLatGFjDLx0Dydvw3Yd5BD9eoHy8ihOX/8jnjD4i3XNOY/+LckFx4AQlMQ==
X-Received: by 2002:a05:6a00:2313:b0:49f:d9ec:7492 with SMTP id
 h19-20020a056a00231300b0049fd9ec7492mr69466617pfh.25.1637368949833; 
 Fri, 19 Nov 2021 16:42:29 -0800 (PST)
Received: from ?IPv6:2601:600:9a7f:e1e0::26b0? ([2601:600:9a7f:e1e0::26b0])
 by smtp.gmail.com with ESMTPSA id c20sm740480pfl.201.2021.11.19.16.42.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 16:42:29 -0800 (PST)
Message-ID: <ec14aa50bbf1ebcf4e7edd54a3f5ad7409951cbb.camel@gmail.com>
Subject: Re: [PATCH] drm/hyperv: Fix device removal on Gen1 VMs
From: Deepak Rawat <drawat.floss@gmail.com>
To: Mohammed Gamal <mgamal@redhat.com>, linux-hyperv@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, decui@microsoft.com
Date: Fri, 19 Nov 2021 16:42:28 -0800
In-Reply-To: <20211119112900.300537-1-mgamal@redhat.com>
References: <20211119112900.300537-1-mgamal@redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.1 
MIME-Version: 1.0
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks for the patch.

Reviewed-by: Deepak Rawat <drawat.floss@gmail.com>

I will push this to drm-fixes, let me know otherwise.

Deepak

On Fri, 2021-11-19 at 12:29 +0100, Mohammed Gamal wrote:
> The Hyper-V DRM driver tries to free MMIO region on removing
> the device regardless of VM type, while Gen1 VMs don't use MMIO
> and hence causing the kernel to crash on a NULL pointer dereference.
> 
> Fix this by making deallocating MMIO only on Gen2 machines and
> implement
> removal for Gen1
> 
> Fixes: 76c56a5affeb ("drm/hyperv: Add DRM driver for hyperv synthetic
> video device")
> 
> Signed-off-by: Mohammed Gamal <mgamal@redhat.com>
> ---
>  drivers/gpu/drm/hyperv/hyperv_drm_drv.c | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
> b/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
> index cd818a629183..9f923beb7d8d 100644
> --- a/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
> +++ b/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
> @@ -225,12 +225,29 @@ static int hyperv_vmbus_remove(struct hv_device
> *hdev)
>  {
>         struct drm_device *dev = hv_get_drvdata(hdev);
>         struct hyperv_drm_device *hv = to_hv(dev);
> +       struct pci_dev *pdev;
>  
>         drm_dev_unplug(dev);
>         drm_atomic_helper_shutdown(dev);
>         vmbus_close(hdev->channel);
>         hv_set_drvdata(hdev, NULL);
> -       vmbus_free_mmio(hv->mem->start, hv->fb_size);
> +
> +       /*
> +        * Free allocated MMIO memory only on Gen2 VMs.
> +        * On Gen1 VMs, release the PCI device
> +        */
> +       if (efi_enabled(EFI_BOOT)) {
> +               vmbus_free_mmio(hv->mem->start, hv->fb_size);
> +       } else {
> +               pdev = pci_get_device(PCI_VENDOR_ID_MICROSOFT,
> +                               PCI_DEVICE_ID_HYPERV_VIDEO, NULL);
> +               if (!pdev) {
> +                       drm_err(dev, "Unable to find PCI Hyper-V
> video\n");
> +                       return -ENODEV;
> +               }
> +               pci_release_region(pdev, 0);
> +               pci_dev_put(pdev);
> +       }
>  
>         return 0;
>  }

