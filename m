Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B5CF39AF36
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jun 2021 02:50:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FC406F54A;
	Fri,  4 Jun 2021 00:49:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C8BA6F54A
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jun 2021 00:49:55 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id t7so4382885lff.0
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Jun 2021 17:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Iwimm5kt1cPOS3WktKznx8Tm3YSJawu3yuys6bu5NIU=;
 b=Gs5lp5tfCZGV7HaOOLREF2vdGYMqTNw3RNRfVR02KWcpUPpLyAkDZxU7KzZFEpILnW
 TS0t5Tw3jHP2Ob59G1pCQ6LYWQnMUKiuyHK3lTTIefXm7iqwG9uq0eGTtxJAGrSis2Ek
 NgYpfpSBSpngnF6vNhFkr+azyg64Nbj9wU4YUX7k4Dz0Mu3a5c83ByA1JJIQ++3PzJA6
 vDwZiKtp6AAOuGW+JBWR48V9np7igTsW2Fn7/DOOm8HTKOkQD5ZzGiEpusGlmlULy59v
 kW8Wrs3I4DQqP6mQqK141gPFmWUyx5cOt7ntAA6X/nilYQsGyV/6fTzlwq5TQsgRvMrV
 133A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Iwimm5kt1cPOS3WktKznx8Tm3YSJawu3yuys6bu5NIU=;
 b=RIdGVJBPxLsWLz79mTnHpx4VvMfYyAFaUADT3VNRaViSHE97RKs1FwSoiUB39BJWXh
 NjCNfmZRBbhZZIYaTe66O9fw4TXnzpSiEaJqITI5WISn4ak7mmOhcWsPfV+UhlJ00beE
 AHKOxmwLb4fiyGhHG/wSbPHW11QXagTq7a3owGTOR7/s1VkqJQuM5HVGqc5uhgB5gov+
 bc4qW4tVahZYtSyFBxTLnzvHasqnI3+L5TJXLSihG0A9XWWupgMqToaFGcQ+hfa+6dTQ
 H6Q488Fw6AO4JMPE14OgkOdvWdkXn95fOywFWDWEH3Vg9dA+2qpK6nfkGCLJEjvtlaJa
 A1sg==
X-Gm-Message-State: AOAM530J/a0TpvpQEM3EW0hTZwAsZ3i99+FAPZmhU4QnnrGPvYAB7ilM
 ppm1HNngZvzkqaY1qJbJz0iYYg==
X-Google-Smtp-Source: ABdhPJweJXWYYmQjui7kNiJ8H+bSQ43RmGPF8suRIMZscFcJCMH54wVPsAk3g0wsQCdvPIOhcg2PRA==
X-Received: by 2002:a05:6512:32ab:: with SMTP id
 q11mr961056lfe.21.1622767793930; 
 Thu, 03 Jun 2021 17:49:53 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id p26sm448515ljn.33.2021.06.03.17.49.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Jun 2021 17:49:53 -0700 (PDT)
Subject: Re: [RESEND 12/26] drm/msm/msm_gem: Demote kernel-doc abuses
To: Lee Jones <lee.jones@linaro.org>
References: <20210602143300.2330146-1-lee.jones@linaro.org>
 <20210602143300.2330146-13-lee.jones@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <b506aea4-0612-0ac4-1ef2-45b0cc80e7f1@linaro.org>
Date: Fri, 4 Jun 2021 03:49:52 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210602143300.2330146-13-lee.jones@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, Sean Paul <sean@poorly.run>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 02/06/2021 17:32, Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>   drivers/gpu/drm/msm/msm_gem.c:364: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
>   drivers/gpu/drm/msm/msm_gem.c:763: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
> 
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: freedreno@lists.freedesktop.org
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/msm_gem.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
> index 56df86e5f7400..15434deb19334 100644
> --- a/drivers/gpu/drm/msm/msm_gem.c
> +++ b/drivers/gpu/drm/msm/msm_gem.c
> @@ -372,7 +372,7 @@ static void del_vma(struct msm_gem_vma *vma)
>   	kfree(vma);
>   }
>   
> -/**
> +/*
>    * If close is true, this also closes the VMA (releasing the allocated
>    * iova range) in addition to removing the iommu mapping.  In the eviction
>    * case (!close), we keep the iova allocated, but only remove the iommu
> @@ -773,7 +773,7 @@ void msm_gem_purge(struct drm_gem_object *obj)
>   			0, (loff_t)-1);
>   }
>   
> -/**
> +/*
>    * Unpin the backing pages and make them available to be swapped out.
>    */
>   void msm_gem_evict(struct drm_gem_object *obj)
> 


-- 
With best wishes
Dmitry
