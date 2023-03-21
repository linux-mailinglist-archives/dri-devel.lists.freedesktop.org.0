Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 733926C3216
	for <lists+dri-devel@lfdr.de>; Tue, 21 Mar 2023 13:56:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8B4010E0E3;
	Tue, 21 Mar 2023 12:56:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98BDD10E0E3
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Mar 2023 12:56:12 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id e18so2020586wra.9
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Mar 2023 05:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679403371;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=INSdmAQuWM3ZOgfM+XQqQ18MO28FYUsgGoGcozTW6w0=;
 b=NaW9FOfgmJEu1tFHdHv84hPt4O7lBGcwMcgb80PmugxIVFFYmBVVVFoYCNiymrHic6
 Q2kFW/2F5rJVoLN1LzrwlaN4MnQL2Y0NGTi33Qaoo9nfyShYzlK4Yc6R4giJ8trmqHWm
 n/K/v3iCGpgLlQd2J8jIRH/RDfjwDUEYVbxEh8BYMxYCo3Xu34gE5C1eixBysIzDdYQ3
 r3Adj+iypA/W1N6lTML3K5vw0LqBDN/cvUxaOuLtN8LWtoCeExlY3J0l5mS7NWn6TqUJ
 mg24UnX2/BvMQ7nmiLXU9ci0JvwYRehhd8sMpZ0Mcwd+fNt/qSivpddlDUtRXW/SOXal
 RmRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679403371;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=INSdmAQuWM3ZOgfM+XQqQ18MO28FYUsgGoGcozTW6w0=;
 b=AJcJBiPUHUpNEr+lMptPFr+Ov4FJET6yfqhtMG1U0lu4z+7SWlnlJq7DAVcnCFQFni
 mqe3thcZMuQ3wb6lJ9VEGMQY8S0lf0PV8e6tS7sCkUNHaNv/TbFdyi51qnq6zoG29te+
 sCQBCFwXothgBsANUcifK0XtVembyptbV0rNhebvkFXSVKG/ljvYl9UU8QgDKsz3zbCr
 1MPLWGok2kYbLAr9OhJMLs2R9A+ilR+52CaLbObt2OkKnHPGZ1t4nUwQhTwbxkzDmYYU
 q1OMTkrveF66uPmSRyGjWcpPUikj2j0LtDDF+JV8LiotYlWylDBtoAnK+hqUtzwihPMH
 N20g==
X-Gm-Message-State: AO0yUKUDWxK/+ZsTXQ1ZOxb2hS8XpBNDOQ/678KkHpS8S8Oexu4mBDf5
 FGMK9YLYqliUQVgzQ5me3d8LTKig2+8=
X-Google-Smtp-Source: AK7set+9mmYMJSDmYAVedYs3X8kbP38AnSfwLcE/izq4rSvENxtB/1dPkiei7xGAAK0fObTbgsnlLA==
X-Received: by 2002:a5d:484b:0:b0:2d7:ef27:427 with SMTP id
 n11-20020a5d484b000000b002d7ef270427mr2151012wrs.67.1679403370962; 
 Tue, 21 Mar 2023 05:56:10 -0700 (PDT)
Received: from [192.168.2.181] (46-10-148-90.ip.btc-net.bg. [46.10.148.90])
 by smtp.gmail.com with ESMTPSA id
 k10-20020a5d6e8a000000b002d1daafea30sm11243348wrz.34.2023.03.21.05.56.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Mar 2023 05:56:10 -0700 (PDT)
Message-ID: <4f574d75-3c8a-521f-f280-908b2d15d5ea@gmail.com>
Date: Tue, 21 Mar 2023 14:56:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 2/3] drm/vmwgfx: Print errors when running on
 broken/unsupported configs
Content-Language: en-US
To: Zack Rusin <zackr@vmware.com>, dri-devel@lists.freedesktop.org
References: <20230321020949.335012-1-zack@kde.org>
 <20230321020949.335012-2-zack@kde.org>
From: "Martin Krastev (VMware)" <martinkrastev768@gmail.com>
In-Reply-To: <20230321020949.335012-2-zack@kde.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: krastevm@vmware.com, iforbes@vmware.com, mombasawalam@vmware.com,
 banackm@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Martin Krastev <krastevm@vmware.com>


LGTM!

Reviewed-by: Martin Krastev <krastevm@vmware.com>


Regards,

Martin


On 21.03.23 г. 4:09 ч., Zack Rusin wrote:
> From: Zack Rusin <zackr@vmware.com>
>
> virtualbox implemented an incomplete version of the svga device which
> they decided to drop soon after the initial release. The device was
> always broken in various ways and never supported by vmwgfx.
>
> vmwgfx should refuse to load on those configurations but currently
> drm has no way of reloading fbdev when the specific pci driver refuses
> to load, which would leave users without a usable fb. Instead of
> refusing to load print an error and disable a bunch of functionality
> that virtualbox never implemented to at least get fb to work on their
> setup.
>
> Signed-off-by: Zack Rusin <zackr@vmware.com>
> ---
>   drivers/gpu/drm/vmwgfx/vmwgfx_drv.c | 29 +++++++++++++++++++++++++++++
>   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h |  2 ++
>   drivers/gpu/drm/vmwgfx/vmwgfx_msg.c |  9 +++++++++
>   3 files changed, 40 insertions(+)
>
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> index 2588615a2a38..8b24ecf60e3e 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> @@ -45,6 +45,9 @@
>   #include <drm/ttm/ttm_placement.h>
>   #include <generated/utsrelease.h>
>   
> +#ifdef CONFIG_X86
> +#include <asm/hypervisor.h>
> +#endif
>   #include <linux/cc_platform.h>
>   #include <linux/dma-mapping.h>
>   #include <linux/module.h>
> @@ -897,6 +900,16 @@ static int vmw_driver_load(struct vmw_private *dev_priv, u32 pci_id)
>   				 cap2_names, ARRAY_SIZE(cap2_names));
>   	}
>   
> +	if (!vmwgfx_supported(dev_priv)) {
> +		vmw_disable_backdoor();
> +		drm_err_once(&dev_priv->drm,
> +			     "vmwgfx seems to be running on an unsupported hypervisor.");
> +		drm_err_once(&dev_priv->drm,
> +			     "This configuration is likely broken.");
> +		drm_err_once(&dev_priv->drm,
> +			     "Please switch to a supported graphics device to avoid problems.");
> +	}
> +
>   	ret = vmw_dma_select_mode(dev_priv);
>   	if (unlikely(ret != 0)) {
>   		drm_info(&dev_priv->drm,
> @@ -1320,6 +1333,22 @@ static void vmw_master_drop(struct drm_device *dev,
>   	vmw_kms_legacy_hotspot_clear(dev_priv);
>   }
>   
> +bool vmwgfx_supported(struct vmw_private *vmw)
> +{
> +#if defined(CONFIG_X86)
> +	return hypervisor_is_type(X86_HYPER_VMWARE);
> +#elif defined(CONFIG_ARM64)
> +	/*
> +	 * On aarch64 only svga3 is supported
> +	 */
> +	return vmw->pci_id == VMWGFX_PCI_ID_SVGA3;
> +#else
> +	drm_warn_once(&vmw->drm,
> +		      "vmwgfx is running on an unknown architecture.");
> +	return false;
> +#endif
> +}
> +
>   /**
>    * __vmw_svga_enable - Enable SVGA mode, FIFO and use of VRAM.
>    *
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> index fb8f0c0642c0..3810a9984a7f 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> @@ -773,6 +773,7 @@ static inline u32 vmw_max_num_uavs(struct vmw_private *dev_priv)
>   
>   extern void vmw_svga_enable(struct vmw_private *dev_priv);
>   extern void vmw_svga_disable(struct vmw_private *dev_priv);
> +bool vmwgfx_supported(struct vmw_private *vmw);
>   
>   
>   /**
> @@ -1358,6 +1359,7 @@ int vmw_bo_cpu_blit(struct ttm_buffer_object *dst,
>   		    struct vmw_diff_cpy *diff);
>   
>   /* Host messaging -vmwgfx_msg.c: */
> +void vmw_disable_backdoor(void);
>   int vmw_host_get_guestinfo(const char *guest_info_param,
>   			   char *buffer, size_t *length);
>   __printf(1, 2) int vmw_host_printf(const char *fmt, ...);
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c b/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c
> index ca1a3fe44fa5..2651fe0ef518 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c
> @@ -1179,3 +1179,12 @@ int vmw_mksstat_remove_ioctl(struct drm_device *dev, void *data,
>   
>   	return -EAGAIN;
>   }
> +
> +/**
> + * vmw_disable_backdoor: Disables all backdoor communication
> + * with the hypervisor.
> + */
> +void vmw_disable_backdoor(void)
> +{
> +	vmw_msg_enabled = 0;
> +}
