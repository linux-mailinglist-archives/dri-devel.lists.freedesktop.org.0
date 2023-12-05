Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E331806142
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 23:03:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 995DF10E04D;
	Tue,  5 Dec 2023 22:03:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2298A10E04D
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 22:03:34 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-9e1021dbd28so17040866b.3
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Dec 2023 14:03:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701813812; x=1702418612; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=R17jjO/Vw4wRIx9Ju0HZ2kb3C5GDd4Vm8IbDi1LNWjk=;
 b=Jqv/e5WGVNCcvohos1/HjXSjkxjpUrKL0yzfPkESV3su4dzH+gm3EETKK3PHjV1whJ
 l0sBFruMLt3+bbY6d/1Qg2oSLn8jrpPVt0y17zNsgn01F40ZbzDuL8zoM1nGndYGSxD7
 gEX2/yRvT4KBtB+8JEMTm/HbSMKuVgNh07Sy12KWGprxHvUiUZA6r25lTQNALNTt6dtK
 1An2XrhafEOlRluZ8ZNtEaN6hLBmxTMroi68a/YuoD5t7GWwpvPr674CNwZHwLF3mk0J
 jfZx61pow6u+M/XDonfkRzdi7O4olx2PGl1Mddj5C0gGgiXVbtkmLXLce00+LKwwclsl
 lVXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701813812; x=1702418612;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=R17jjO/Vw4wRIx9Ju0HZ2kb3C5GDd4Vm8IbDi1LNWjk=;
 b=R1G/sBUKqXUhVyJ9AAQ7JfP2+LV4NhcJ/g3GQJnQAE2kMGZbAjZ1nSMNndGpH4Aq9a
 yiwhp1a6vZRaQGXnQn8ly07P4DGTQj7JU1cd0tYh31dSkPH3y3/Mw5SiKPoa+LaQSQGs
 KjjrwH6nk7fMkBoSxYmCEYtt4Dflzl4kwSNXATCxWYKK0lomWkniJCBDMjmVWhR0pBL1
 NYPPHjXNK1e6qdRxZt77I9P5CW4KNha9FjgqMmilmiH+3BZelI2FOjcccOkUqaqJLj9d
 ihL1gWFT0nUx1uON62HijmyOMzEAcx3U0xbsWsF4TdlDtHFgjPvZBL7wwyliXQYWE8jV
 zjCg==
X-Gm-Message-State: AOJu0YzD3sTD+/F4CFRk2zN3/Ks+mXEhl/aiGi8fdK85rldlJfHm4W0U
 x9PctOPMNlANgNWSWoHhbAcQkA==
X-Google-Smtp-Source: AGHT+IE/hqq5solRByq/6s4+0WTlT9xIiduM2nthd2KHQBztl+NRk6XM/HBt9ZMTdjcUIz5MDEwfZg==
X-Received: by 2002:a17:906:2655:b0:a18:50ad:9ab with SMTP id
 i21-20020a170906265500b00a1850ad09abmr5106299ejc.74.1701813812535; 
 Tue, 05 Dec 2023 14:03:32 -0800 (PST)
Received: from ?IPV6:2001:1c06:2302:5600:366d:ca8f:f3af:381?
 (2001-1c06-2302-5600-366d-ca8f-f3af-0381.cable.dynamic.v6.ziggo.nl.
 [2001:1c06:2302:5600:366d:ca8f:f3af:381])
 by smtp.gmail.com with ESMTPSA id
 hq3-20020a1709073f0300b00a1cc1be1158sm1159684ejc.165.2023.12.05.14.03.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Dec 2023 14:03:32 -0800 (PST)
Message-ID: <94157ef7-95c9-429a-97c5-3bab2b9074ca@linaro.org>
Date: Tue, 5 Dec 2023 23:03:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] usb: typec: qcom-pmic-typec: Only select
 DRM_AUX_HPD_BRIDGE with OF
Content-Language: en-US
To: Nathan Chancellor <nathan@kernel.org>, dmitry.baryshkov@linaro.org
References: <20231205-drm_aux_bridge-fixes-v1-0-d242a0ae9df4@kernel.org>
 <20231205-drm_aux_bridge-fixes-v1-2-d242a0ae9df4@kernel.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20231205-drm_aux_bridge-fixes-v1-2-d242a0ae9df4@kernel.org>
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
Cc: neil.armstrong@linaro.org, heikki.krogerus@linux.intel.com,
 gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, patches@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux@roeck-us.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 05/12/2023 21:13, Nathan Chancellor wrote:
> CONFIG_DRM_AUX_HPD_BRIDGE depends on CONFIG_OF but that dependency is
> not included when CONFIG_TYPEC_QCOM_PMIC selects it, resulting in a
> Kconfig warning when CONFIG_OF is disabled:
> 
>    WARNING: unmet direct dependencies detected for DRM_AUX_HPD_BRIDGE
>      Depends on [n]: HAS_IOMEM [=y] && DRM_BRIDGE [=y] && OF [=n]
>      Selected by [m]:
>      - TYPEC_QCOM_PMIC [=m] && USB_SUPPORT [=y] && TYPEC [=m] && TYPEC_TCPM [=m] && (ARCH_QCOM || COMPILE_TEST [=y]) && (DRM [=m] || DRM [=m]=n) && DRM_BRIDGE [=y]
> 
> Only select CONFIG_DRM_AUX_HPD_BRIDGE with both CONFIG_DRM_BRIDGE and
> CONFIG_OF to clear up the warning.
> 
> Fixes: 7d9f1b72b296 ("usb: typec: qcom-pmic-typec: switch to DRM_AUX_HPD_BRIDGE")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>   drivers/usb/typec/tcpm/Kconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/tcpm/Kconfig b/drivers/usb/typec/tcpm/Kconfig
> index 64d5421c69e6..8cdd84ca5d6f 100644
> --- a/drivers/usb/typec/tcpm/Kconfig
> +++ b/drivers/usb/typec/tcpm/Kconfig
> @@ -80,7 +80,7 @@ config TYPEC_QCOM_PMIC
>   	tristate "Qualcomm PMIC USB Type-C Port Controller Manager driver"
>   	depends on ARCH_QCOM || COMPILE_TEST
>   	depends on DRM || DRM=n
> -	select DRM_AUX_HPD_BRIDGE if DRM_BRIDGE
> +	select DRM_AUX_HPD_BRIDGE if DRM_BRIDGE && OF
>   	help
>   	  A Type-C port and Power Delivery driver which aggregates two
>   	  discrete pieces of silicon in the PM8150b PMIC block: the
> 

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
