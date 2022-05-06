Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3248851D870
	for <lists+dri-devel@lfdr.de>; Fri,  6 May 2022 15:01:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF55A112164;
	Fri,  6 May 2022 13:01:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3870E112164
 for <dri-devel@lists.freedesktop.org>; Fri,  6 May 2022 13:01:37 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id d15so3957419lfk.5
 for <dri-devel@lists.freedesktop.org>; Fri, 06 May 2022 06:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=yAmT/C8oHoIi+bRromxMIRp4Gpsqt0hP9qUoy71fZN0=;
 b=gPFSvYRrrwZ8UcrBnBkXXoqrt3hxOBdSl9zMzR+4c097Jj1hIEJOtLND+lXqR7+nKw
 ZTx6olJ+5Qo8MBuK0fBGNClLTJzdGMyTAD9JQDWpXUjnP/ywX1d2OdfDulyw8c5og/Jx
 xPlw2qK6CfvoRpRF2E5S0IAlpgus/+jlLeTvpn/zoNiIB3y56p44ITAFvfrTdigktxGg
 oNZnbs3QeoyURe7f5X9/+OYp0RXr8NFJfA+KKoMbz06SOg5GDl+MTZ8uI1/2ueXUnSrN
 XM2a264GlicyX69hwspP0XdiDC7Xb8ODexzV6Mfb//TUyEM5iHl8Cze6Eda1NzAaig7J
 Et6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=yAmT/C8oHoIi+bRromxMIRp4Gpsqt0hP9qUoy71fZN0=;
 b=eRlR74utC+Pvmj0+I+HUZLcZLVkrwCI7yn6gJcIG5RaosamwtrYXUIxoGlelVinY0i
 kEbYrC42FXL8CI4WyKL2MXfuSxMOPXaAD6tq33GdsTOZK+uASJEiXoEZYou62zjDWE+9
 smwrITLF9xwuSw7jzB/IxeQdoHRZ62hnggMt2gjCOZK1ZgzJ7AsnlAlGdhNCZ92YwMvN
 CUTT9Pas1LfRq02k6ChfT4cCUB08BMsMzPpRV0+iXMeTz+eZgBcPC3N7whLLZ8Nl8K0F
 LNFP82OSH10OZcb0lB7YiI977PgtU1eFw8lCXPGn+SLDcQkE/Xm1KUN1WZp55To9ga9M
 8z5Q==
X-Gm-Message-State: AOAM533PVJJb/R0/0rlQL6aAFE/x+sAmg2+SibpyA3xFfB9ZR1SnZGE8
 izEHLd6LJ39u36p6lAV+zDP2Rw==
X-Google-Smtp-Source: ABdhPJwjlm00jlN+64J3QcGL6O0+QFGJ0jRzTlfBp0xKCzrA71d1nkyCaCjZGuQWGsSnQU5bbsLjSA==
X-Received: by 2002:a05:6512:10d5:b0:473:dddb:6b20 with SMTP id
 k21-20020a05651210d500b00473dddb6b20mr2450069lfg.7.1651842094949; 
 Fri, 06 May 2022 06:01:34 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 w13-20020ac2442d000000b0047255d21179sm680126lfl.168.2022.05.06.06.01.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 May 2022 06:01:34 -0700 (PDT)
Message-ID: <6eac705a-d5ec-e7c5-1327-0bf94c016452@linaro.org>
Date: Fri, 6 May 2022 16:01:33 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 -next] drm/display: Fix build error without CONFIG_OF
Content-Language: en-GB
To: YueHaibing <yuehaibing@huawei.com>, airlied@linux.ie, daniel@ffwll.ch,
 tzimmermann@suse.de
References: <20220506123246.21788-1-yuehaibing@huawei.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220506123246.21788-1-yuehaibing@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 06/05/2022 15:32, YueHaibing wrote:
> While CONFIG_OF is n but COMPILE_TEST is y, we got this:
> 
> WARNING: unmet direct dependencies detected for DRM_DP_AUX_BUS
>    Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && OF [=n]
>    Selected by [y]:
>    - DRM_MSM [=y] && HAS_IOMEM [=y] && DRM [=y] && (ARCH_QCOM || SOC_IMX5 || COMPILE_TEST [=y]) && COMMON_CLK [=y] && IOMMU_SUPPORT [=y] && (QCOM_OCMEM [=n] || QCOM_OCMEM [=n]=n) && (QCOM_LLCC [=y] || QCOM_LLCC [=y]=n) && (QCOM_COMMAND_DB [=n] || QCOM_COMMAND_DB [=n]=n)
> 
> Make DRM_DP_AUX_BUS depends on OF || COMPILE_TEST to fix this warning.
> 
> Fixes: f5d01644921b ("drm/msm: select DRM_DP_AUX_BUS for the AUX bus support")
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
> v2: fix this in DRM_DP_AUX_BUS dependencies
> ---
>   drivers/gpu/drm/display/Kconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/display/Kconfig b/drivers/gpu/drm/display/Kconfig
> index 1b6e6af37546..09712b88a5b8 100644
> --- a/drivers/gpu/drm/display/Kconfig
> +++ b/drivers/gpu/drm/display/Kconfig
> @@ -3,7 +3,7 @@
>   config DRM_DP_AUX_BUS
>   	tristate
>   	depends on DRM
> -	depends on OF
> +	depends on OF || COMPILE_TEST
>   
>   config DRM_DISPLAY_HELPER
>   	tristate


-- 
With best wishes
Dmitry
