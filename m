Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E19489713
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jan 2022 12:12:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3AF814A59D;
	Mon, 10 Jan 2022 11:12:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D33714A59D
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jan 2022 11:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641813139;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6TAZo2E9BDT4gIbrVjaTOuTZ8dwBHWfcjiFPuUrSfFo=;
 b=AfG8zCpB/yHipe5IUFAC3kMfw+YenpOM66m17+uJpT8xf3iKky9J2mYyf3O8m+YwbSB8lN
 6NveQAh8VLG+mrlK7+LOhD47J6QpSMX9J1c+sX2HxCcL2dhuFMaFc3KVAfzf2BnarGG0/K
 aext1F0UFtvQS47R+W7ua7C/YD78uyU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-53-wIAgvk-0PBSI2z5n3NFajA-1; Mon, 10 Jan 2022 06:12:17 -0500
X-MC-Unique: wIAgvk-0PBSI2z5n3NFajA-1
Received: by mail-wm1-f72.google.com with SMTP id
 az9-20020a05600c600900b0034692565ca8so7693926wmb.9
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jan 2022 03:12:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6TAZo2E9BDT4gIbrVjaTOuTZ8dwBHWfcjiFPuUrSfFo=;
 b=OneLg/moBpuVqEwMp8fnVLI/P5lKMUiLaq0wnO2jcPa954kBPGIP86uuHRtSA6duaK
 i0YEFRFvuMVu35H4sPax4khyXXyGkdcQDLhWkmaxplzLX0EUQHQ64xg5nTr7TK2/5yXT
 bY7trOw0ah1tjTBjfTKGKx4aLHDFC22wiUOJ16IV0YpBtx28jPHdX7NTqz+8bI1RI3Gi
 dlo6u3+BqWgR2IoO2aOFo1yrJbKn0gN/6kYHeUCm6RJHwFSoePlLszZJQ0APd7OmD8O+
 vxXkdLFEdL7UgsDfdJ3p0ByznMiLh1ZtezXtmk2AK6+V+9iMR+WdkaPZiRpCTVGYN6N+
 hytg==
X-Gm-Message-State: AOAM530PZ7+VDu8Ilo/cfid8nxd8TYG/KGcp3NOW5UPY+hXiWIb+7wJu
 CiHlPNDANM/1wKf9+9IAlxerNeEZ8KDZD2FP6ANOv/qlAoJXiOtu3K6apQOYQfxHc0ZWyPrFitQ
 J/0gSbeJ1EnkTaIKJI3ceLearaygH
X-Received: by 2002:a05:600c:a06:: with SMTP id
 z6mr21576904wmp.9.1641813136148; 
 Mon, 10 Jan 2022 03:12:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwDpQTVUV4tpwlSja9IAszzocXj8Nhc1NG2G5FikesBhEyz8Rtp3Jf6shzre9dTBOV/pRhwDg==
X-Received: by 2002:a05:600c:a06:: with SMTP id
 z6mr21576887wmp.9.1641813135870; 
 Mon, 10 Jan 2022 03:12:15 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id r19sm5516936wmh.42.2022.01.10.03.12.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jan 2022 03:12:15 -0800 (PST)
Message-ID: <9604b80d-c7bf-2a80-125d-70c6175acb5a@redhat.com>
Date: Mon, 10 Jan 2022 12:12:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] drm/hisilicon/hibmc: Allow to be built if COMPILE_TEST is
 enabled
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20211216210936.3329977-1-javierm@redhat.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20211216210936.3329977-1-javierm@redhat.com>
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
Cc: David Airlie <airlied@linux.ie>, Chen Feng <puck.chen@hisilicon.com>,
 Matthew Ruffell <matthew.ruffell@canonical.com>,
 Xinliang Liu <xinliang.liu@linaro.org>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>, Tian Tao <tiantao6@hisilicon.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/16/21 22:09, Javier Martinez Canillas wrote:
> The commit feeb07d0ca5a ("drm/hisilicon/hibmc: Make CONFIG_DRM_HISI_HIBMC
> depend on ARM64") made the driver Kconfig symbol to depend on ARM64 since
> it only supports that architecture and loading the module on others would
> lead to incorrect video modes being used.
> 
> But it also prevented the driver to be built on other architectures which
> is useful to have compile test coverage when doing subsystem wide changes.
> 
> Make the dependency instead to be (ARM64 || COMPILE_TEST), so the driver
> is buildable when the CONFIG_COMPILE_TEST option is enabled.
> 
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> ---
> 
>  drivers/gpu/drm/hisilicon/hibmc/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/Kconfig b/drivers/gpu/drm/hisilicon/hibmc/Kconfig
> index 43943e980203..073adfe438dd 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/Kconfig
> +++ b/drivers/gpu/drm/hisilicon/hibmc/Kconfig
> @@ -1,7 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  config DRM_HISI_HIBMC
>  	tristate "DRM Support for Hisilicon Hibmc"
> -	depends on DRM && PCI && ARM64
> +	depends on DRM && PCI && (ARM64 || COMPILE_TEST)
>  	select DRM_KMS_HELPER
>  	select DRM_VRAM_HELPER
>  	select DRM_TTM

Any comments on this patch?

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

