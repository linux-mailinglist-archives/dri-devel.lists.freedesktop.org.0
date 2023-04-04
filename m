Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9776F6D6F21
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 23:42:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C73210E223;
	Tue,  4 Apr 2023 21:42:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 990DD10E21C
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 21:42:40 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id k37so44171238lfv.0
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Apr 2023 14:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680644558;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0VVpMIHPposd8dIJG6VpkrFLF/OZQKsBp3Ngoym3OkM=;
 b=gMtx/fed5N4vMlptZRUYbFlytG5GeD00n7bpBeTf/JZIsz8LzISvv4Soc2+vxcjLl1
 VpO3RWeqxrpYITofTyWODhgUtkWcITXh1Dk1PfNzpT5rOtKywY9aKZq4Z+/YkonL2foV
 Hybk2jKbwXIXvK7i6u0Q6EvYKcPj1hT/Q7nINLcrKpFr19qJqr0h6IXUCvLzp2UDFvg1
 3cD1HGA3rnZIY0o8cb8Unxm26j6ZUXQokHfXIOmNneb/mnW5gV3pR7H4UVy0+JSgvUHH
 DL10gkFNKoqaHG/9IlKyAG2LWIW5F4W0G8lPQxXR/SgvdnTvpcYQZu/jzMncLXcWbeTV
 GEHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680644558;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0VVpMIHPposd8dIJG6VpkrFLF/OZQKsBp3Ngoym3OkM=;
 b=XNxKX9B816kezZZB0DGqG0t52acP/vfA5YxrmoVcr6VaitvOISnB2/CHn9S9b33fNr
 kYrIoIR0//KXxWBhbzXry7mZ6PipEnbyxovNOBoRWskVgpSyTuUR2cxJO8ZtjNFti0Vj
 JfcDtmUXYoyVcykTIdC7HT/ZSvepMSTseiEgJHRc1oQWiRpeDZEyW42GT/XWWdDHgXcF
 V6fs/oDVkMf4pI76Rzfuwb9djZYLHjMr3l+97luQu1SjGjdX+AJWjmUvQ9eEBezI+0jr
 3b4LM4LAbtJb4DNT9A5Z10YqmmCF40DQaCMPEss4XpfSRsph9UeXlQ5f7eiMjwmMvVTS
 PzUw==
X-Gm-Message-State: AAQBX9cLjuLA5FgNJLjaRqHqMYQYibVS5HKn8TRjKzEFO5qJU9yyujcS
 rMUOaynsRb8xeTk9qD0L7zQ//w==
X-Google-Smtp-Source: AKy350bzAO2ComF8Aki8azB3/UcsofxEuobFYAUPtjFGZXrBrLsP9eqeIPqHFdL0GmkTsrlWMt1pFw==
X-Received: by 2002:ac2:511c:0:b0:4cb:e53:d54b with SMTP id
 q28-20020ac2511c000000b004cb0e53d54bmr1145272lfb.25.1680644558636; 
 Tue, 04 Apr 2023 14:42:38 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 c26-20020ac2531a000000b004e8497a5604sm2501028lfh.108.2023.04.04.14.42.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Apr 2023 14:42:38 -0700 (PDT)
Message-ID: <db7e4dbc-c55b-c9b2-0cf6-bfacde56624a@linaro.org>
Date: Wed, 5 Apr 2023 00:42:37 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 1/8] drm/msm: Include <linux/io.h>
Content-Language: en-GB
To: Thomas Zimmermann <tzimmermann@suse.de>, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, sean@poorly.run, javierm@redhat.com,
 airlied@gmail.com, daniel@ffwll.ch
References: <20230403124538.8497-1-tzimmermann@suse.de>
 <20230403124538.8497-2-tzimmermann@suse.de>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230403124538.8497-2-tzimmermann@suse.de>
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 kernel test robot <lkp@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 03/04/2023 15:45, Thomas Zimmermann wrote:
> Include <linux/io.h> to get the declaration of devm_ioremap() on
> sparc64. No functional changes.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reported-by: kernel test robot <lkp@intel.com>
> Link: https://lore.kernel.org/oe-kbuild-all/202303301856.zSmpwZjj-lkp@intel.com/
> ---
>   drivers/gpu/drm/msm/msm_io_utils.c | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

