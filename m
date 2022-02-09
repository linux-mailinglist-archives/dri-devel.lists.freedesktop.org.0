Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3364C4B0009
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 23:21:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF9BF10E514;
	Wed,  9 Feb 2022 22:21:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91A3010E514
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 22:21:36 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id bu29so1670183lfb.0
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Feb 2022 14:21:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=LayMCSz5Gx7VceGFXhPhnBsyoYh4zMiCbc/qJQSg/Jg=;
 b=Ue2ZrcbJXB2MNgRzyNVYEWDCsluYxh4tIthDcubvTxc/NbTOozFDUNwCv8WrmXN0H7
 2I4TmxU5x58/ut/Ey3o0DIyFqXnjKrmdy4e8zmJdBMN1iMzRFpJov5VWwLVgRM/lD80V
 RTiwQ9sAPJlb0gf6e4VoUUMBgZu8vuy4KugCr2o0ly+DfIsgzt7KICt7YVq+X3PhLcXE
 R2w12W3BTgnpe1DP7cHDbHJZhCYb+fJ+JUT75fzvzOPWWN+trvk8ui3077dXz4kxYkuz
 Lr8eUFxo5W33BTC7vpyAH0jFwTu7GBTvjd7hp0OH5ue1Kz5TDuHLhFhyTkh55YxRb2tO
 mXhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=LayMCSz5Gx7VceGFXhPhnBsyoYh4zMiCbc/qJQSg/Jg=;
 b=BWGAZr2PVDSWwHAIlu8F3KhEe18Q7dFTC9QF1bolJO2+iLV3cepA5lRLdXeuznEWL5
 3P1rmebws1Y+r8kINUDK1TgVtBX3JZjYLC7/bCzybvY6MqRjxbxiEzjlFs6uuYQc89DE
 lkouTbVDitWUu/M6gpICubdNEWHaZnxW35LNbhBjrNg1gEvzS+1EtD+k9CCO9HAtd4CE
 voUU6cABd/aP8aoEBMxf3TWB4o1fq+g4Mh+RHyRJY7p6ZYvpliZWmhls0z4dSB84szfs
 cJZkoh0MLK/vDYZFIWFjobcf6lfdi3lbn9IKUd5Gzo8Kcvwtd/i0WuFcPjmB+BqQZVq/
 HjZA==
X-Gm-Message-State: AOAM5330iinpzPAptbcFVgJ1tvydvdq+2bHVMwiBafOzDdds9KfjwrY+
 CVz/YkymGwyLqZLAadfzTG8h4Q==
X-Google-Smtp-Source: ABdhPJxM3HjEYcFzlVLmHZsaTG5gkw9OHHv/cXGfTe/KlLrIjF/PfMPJkFWHe4epOwb7VREgqFyGIA==
X-Received: by 2002:a05:6512:3d02:: with SMTP id
 d2mr3248630lfv.138.1644445294959; 
 Wed, 09 Feb 2022 14:21:34 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id r4sm2540443lfi.115.2022.02.09.14.21.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Feb 2022 14:21:34 -0800 (PST)
Message-ID: <cb8dd875-5690-7f8a-c55b-04a5c250feb0@linaro.org>
Date: Thu, 10 Feb 2022 01:21:33 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH] drm/msm: replace DEFINE_SIMPLE_ATTRIBUTE with
 DEFINE_DEBUGFS_ATTRIBUTE
Content-Language: en-GB
To: cgel.zte@gmail.com, robdclark@gmail.com
References: <20211221144234.480618-1-deng.changcheng@zte.com.cn>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20211221144234.480618-1-deng.changcheng@zte.com.cn>
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
Cc: freedreno@lists.freedesktop.org, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, Zeal Robot <zealci@zte.com.cn>,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Changcheng Deng <deng.changcheng@zte.com.cn>,
 sean@poorly.run
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21/12/2021 17:42, cgel.zte@gmail.com wrote:
> From: Changcheng Deng <deng.changcheng@zte.com.cn>
> 
> Fix the following coccicheck warning:
> ./drivers/gpu/drm/msm/msm_debugfs.c: 132: 0-23: WARNING: shrink_fops
> should be defined with DEFINE_DEBUGFS_ATTRIBUTE
> 
> Use DEFINE_DEBUGFS_ATTRIBUTE rather than DEFINE_SIMPLE_ATTRIBUTE for
> debugfs files.
> 
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Changcheng Deng <deng.changcheng@zte.com.cn>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/msm_debugfs.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_debugfs.c b/drivers/gpu/drm/msm/msm_debugfs.c
> index 956b1efc3721..91fb0c83b600 100644
> --- a/drivers/gpu/drm/msm/msm_debugfs.c
> +++ b/drivers/gpu/drm/msm/msm_debugfs.c
> @@ -129,9 +129,9 @@ shrink_set(void *data, u64 val)
>   	return 0;
>   }
>   
> -DEFINE_SIMPLE_ATTRIBUTE(shrink_fops,
> -			shrink_get, shrink_set,
> -			"0x%08llx\n");
> +DEFINE_DEBUGFS_ATTRIBUTE(shrink_fops,
> +			 shrink_get, shrink_set,
> +			 "0x%08llx\n");
>   
>   
>   static int msm_gem_show(struct seq_file *m, void *arg)


-- 
With best wishes
Dmitry
