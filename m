Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B42BB80614E
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 23:04:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2998F10E629;
	Tue,  5 Dec 2023 22:04:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F67B10E629
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 22:04:34 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2c9f4bb2e5eso49567101fa.1
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Dec 2023 14:04:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701813872; x=1702418672; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YcEMEJf4lCydMrLOTT6eApwWgWe19yXNqzmuvh+QqWY=;
 b=vuTD87u9tOGSQxp195b+C+MGVoYRVUeQVSjt77xYL1pF1TfeAs6/M3J0C+Ohbhy/NF
 tjOyqk1LhEJ5QF6p++Z2E9/dX2FQP7GP2LX0IiabWXwfSI0uxigum05iKIaQ2BsMoGiH
 UtXdUPPZKvCQNqiXz0FYkMj2TOQjBmANCam7RJSy04zFV4MBE2HTbXFTT/Zd7sVkOhdb
 FtMhUHoZ/eTVJWhlqIj2Tq2mVDMjqJbvC/yehVr66fMFICwDLMdUF8CC6aS5/HFp/tHv
 qQ12X+GdPHrn3BSRVRQLCCzDoLVp8x4oUuNPY9qiHSr7KNkv63Oi9jyZdDjDKWhoYWg3
 XGYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701813872; x=1702418672;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YcEMEJf4lCydMrLOTT6eApwWgWe19yXNqzmuvh+QqWY=;
 b=lD8IUzi4UJFGzLggJoC7gum8bQXqEH5hWMtFp6kJuduZsSoURcqsO8Ekp0l/WgGJJP
 Y8/UPJ4mFOESFuQKoA9S61l2CWHNgkzWSdqdrl2Nh/k5Eu+zjrBz+hVOMi5UFDCr7aXF
 ERswK35gsyh/TlX3SZ2ibkcoHEFIpV+pPp438ITVy2HwVeLMJ0XiPTyF4kpZU1qOxCYv
 /SXITHYZY4oHXkc0tgILdWDKrSDuaHtiCT6BuOBSg85DkRpqru0Qj20/CKWevwjBS8qJ
 vBxLR5pguheUHRcSlCM72ur2LC8M1/noELDi9jY0fTj/YkgSgUBQ5ZwDJ4WbsvqKgDYt
 Hklw==
X-Gm-Message-State: AOJu0Yyt170Bin/KdzpkRjFZUXwxrLkwO+xhyCFHemtJEzzDnzWDSnwy
 XzYKtl3fbv/zEccGHroHRJeArg==
X-Google-Smtp-Source: AGHT+IELJFW4CRavNSvWmbv6+vTpGPUZn67DcntqLGgQXhIS4H64Z9uxXCZut3JO674Qxj6E0JTCBg==
X-Received: by 2002:a2e:b742:0:b0:2ca:20f7:531b with SMTP id
 k2-20020a2eb742000000b002ca20f7531bmr22788ljo.51.1701813872482; 
 Tue, 05 Dec 2023 14:04:32 -0800 (PST)
Received: from ?IPV6:2001:1c06:2302:5600:366d:ca8f:f3af:381?
 (2001-1c06-2302-5600-366d-ca8f-f3af-0381.cable.dynamic.v6.ziggo.nl.
 [2001:1c06:2302:5600:366d:ca8f:f3af:381])
 by smtp.gmail.com with ESMTPSA id
 hq3-20020a1709073f0300b00a1cc1be1158sm1159684ejc.165.2023.12.05.14.04.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Dec 2023 14:04:31 -0800 (PST)
Message-ID: <bc0bbe57-1739-4338-abfb-bd7011dc904b@linaro.org>
Date: Tue, 5 Dec 2023 23:04:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/bridge: Return NULL instead of plain 0 in
 drm_dp_hpd_bridge_register() stub
Content-Language: en-US
To: Nathan Chancellor <nathan@kernel.org>, dmitry.baryshkov@linaro.org
References: <20231205-drm_aux_bridge-fixes-v1-0-d242a0ae9df4@kernel.org>
 <20231205-drm_aux_bridge-fixes-v1-3-d242a0ae9df4@kernel.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20231205-drm_aux_bridge-fixes-v1-3-d242a0ae9df4@kernel.org>
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
 kernel test robot <lkp@intel.com>, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, patches@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux@roeck-us.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 05/12/2023 21:13, Nathan Chancellor wrote:
> sparse complains:
> 
>    drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c: note: in included file:
>    include/drm/bridge/aux-bridge.h:29:16: sparse: sparse: Using plain integer as NULL pointer
> 
> Return NULL to clear up the warning.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202312060025.BdeqZrWx-lkp@intel.com/
> Fixes: e560518a6c2e ("drm/bridge: implement generic DP HPD bridge")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>   include/drm/bridge/aux-bridge.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/drm/bridge/aux-bridge.h b/include/drm/bridge/aux-bridge.h
> index 66249ff0858e..c4c423e97f06 100644
> --- a/include/drm/bridge/aux-bridge.h
> +++ b/include/drm/bridge/aux-bridge.h
> @@ -26,7 +26,7 @@ void drm_aux_hpd_bridge_notify(struct device *dev, enum drm_connector_status sta
>   static inline struct device *drm_dp_hpd_bridge_register(struct device *parent,
>   							struct device_node *np)
>   {
> -	return 0;
> +	return NULL;
>   }
>   
>   static inline void drm_aux_hpd_bridge_notify(struct device *dev, enum drm_connector_status status)
> 

Nice

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
