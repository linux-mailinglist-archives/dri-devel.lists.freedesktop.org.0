Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B714EBD99
	for <lists+dri-devel@lfdr.de>; Wed, 30 Mar 2022 11:23:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 811EC10F8C5;
	Wed, 30 Mar 2022 09:23:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D66AB10F8C5
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Mar 2022 09:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648632218;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J0Wc6ae9oM8FGTkdZNH+owW4zJbWXxLWuqI+PmdQQAE=;
 b=hI/L4KQEabdQUp3RLPndA3YODDoMnS3py4Dpfz964HV2igNDTeTE5ERueyMy8nOL4EkIz1
 ckZ8VcnUXY/U+xz6rcmwYDKp/LN7YwO2m4wn3nQakcBrpYTD8362tb0f7IMU3+1J6F+B/e
 GIN8n+8h6w2wdjqfzSHRb/Kler73IHw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-97-DwRnC23ZOd-IqmRqIp7UEA-1; Wed, 30 Mar 2022 05:23:37 -0400
X-MC-Unique: DwRnC23ZOd-IqmRqIp7UEA-1
Received: by mail-wr1-f72.google.com with SMTP id
 j11-20020adfb30b000000b00205a3f19489so3668646wrd.16
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Mar 2022 02:23:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=J0Wc6ae9oM8FGTkdZNH+owW4zJbWXxLWuqI+PmdQQAE=;
 b=LRmb6kMctRSGMgrFg2G1f7zXd6QTA192/F7Lk8ZXp1gou2xpSnpGOwahesMhJc3UvT
 VEOxibheQoUr4bLg5qqAmcP6RhI69Gvs5ZNkyvBStyd2QgSDJelZoaXaUxjF2WkWZN4S
 g893tH0QxrkJJZHuKmFizYFkzhEf5lSZfPJ8Qj2qABYM5xaeFvh8e16I068GWi4Asxme
 /Jda017+Hcqs63n01Y3AebKKpr0/C4hiA9AlGfQsRyhC6yhsR+Tkrulcy+UIVh0sBaQS
 XXhPV7C4OkwBALWBn7oyInKnAVBKLB2PmOtRqC7sWPzyNijaw1UxQ3ElXETQEOm+9gMl
 wSqg==
X-Gm-Message-State: AOAM533T7Dl8IlcLtzgZ7x6ILpAsCiYBvU4Xrs2Lb4j3xutD8XUzQMFK
 9JtFIxYM8eHh0fno6PHXACvQNagEr6LWirspw9GbvESVqKjW6wBUbVU4vB5ftXPCAFs4GNLsBLv
 vHgywg1558evlp+BiVIEJkCM0I1Ll
X-Received: by 2002:a05:600c:35d0:b0:38c:e6fa:44eb with SMTP id
 r16-20020a05600c35d000b0038ce6fa44ebmr3538730wmq.102.1648632216475; 
 Wed, 30 Mar 2022 02:23:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy1099w3d1zjjsYwPghOx3hJnfySmr1rXfa2kY/fN753nYFo58WOYLBhz3A7JAvnEh5eNnE2A==
X-Received: by 2002:a05:600c:35d0:b0:38c:e6fa:44eb with SMTP id
 r16-20020a05600c35d000b0038ce6fa44ebmr3538715wmq.102.1648632216220; 
 Wed, 30 Mar 2022 02:23:36 -0700 (PDT)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 p23-20020a1c5457000000b0038c98c12ea9sm4267303wmi.1.2022.03.30.02.23.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Mar 2022 02:23:35 -0700 (PDT)
Message-ID: <e02eceb6-4bf5-3641-502e-9e5a246ae5fd@redhat.com>
Date: Wed, 30 Mar 2022 11:23:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 3/8] drm/display: Introduce a DRM display-helper module
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@linux.ie, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 jani.nikula@linux.intel.com, lyude@redhat.com
References: <20220322192743.14414-1-tzimmermann@suse.de>
 <20220322192743.14414-4-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220322192743.14414-4-tzimmermann@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/22/22 20:27, Thomas Zimmermann wrote:
> Replace the DP-helper module with a display-helper module. Update
> all related Kconfig and Makefile rules.
> 
> Besides the existing code for DisplayPort, the new module will
> contain helpers for other video-output standards, such as HDMI.
> Drivers will still be able to select the required video-output
> helpers. Linking all such code into a single module avoids the
> proliferation of small kernel modules.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

[snip]

> +config DRM_DISPLAY_HELPER
> +	tristate
> +	depends on DRM
> +	help
> +	  DRM helpers for display adapters.
> +
>  config DRM_DP_HELPER
>  	tristate
>  	depends on DRM
> +	select DRM_DISPLAY_HELPER
>  	help
>  	  DRM helpers for DisplayPort.
> 

I was about to ask why this would still be needed but then re-read the
commit message that says drivers will still be able to select required
video-output helpers.

That makes sense since the fact that all helpers will be in the same module
would be transparent to drivers.

> diff --git a/drivers/gpu/drm/display/Makefile b/drivers/gpu/drm/display/Makefile
> index 75faffc706b1..90f12e9b4735 100644
> --- a/drivers/gpu/drm/display/Makefile
> +++ b/drivers/gpu/drm/display/Makefile
> @@ -2,8 +2,9 @@
>  
>  obj-$(CONFIG_DRM_DP_AUX_BUS) += drm_dp_aux_bus.o
>  
> -drm_dp_helper-y := drm_dp.o drm_dp_dual_mode_helper.o drm_dp_helper_mod.o drm_dp_mst_topology.o
> -drm_dp_helper-$(CONFIG_DRM_DP_AUX_CHARDEV) += drm_dp_aux_dev.o
> -drm_dp_helper-$(CONFIG_DRM_DP_CEC) += drm_dp_cec.o
> +drm_display_helper-y := drm_display_helper_mod.o
> +drm_display_helper-$(CONFIG_DRM_DP_HELPER) := drm_dp_helper.o drm_dp_dual_mode_helper.o drm_dp_mst_topology.o
> +drm_display_helper-$(CONFIG_DRM_DP_AUX_CHARDEV) += drm_dp_aux_dev.o
> +drm_display_helper-$(CONFIG_DRM_DP_CEC) += drm_dp_cec.o
>  
> -obj-$(CONFIG_DRM_DP_HELPER) += drm_dp_helper.o
> +obj-$(CONFIG_DRM_DISPLAY_HELPER) += drm_display_helper.o

The drm_dp_helper.ko module has some parameters and this change will break
existing kernel cmdline that are using it:

$ modinfo drivers/gpu/drm/dp/drm_dp_helper.ko | grep parm | cut -d : -f2
           drm_dp_cec_unregister_delay
           dp_aux_i2c_speed_khz
           dp_aux_i2c_transfer_size

I don't know whether those are considered a kernel ABI or not though, and
some already changed when the DP helpers were moved from drm_kms_helper.ko

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

