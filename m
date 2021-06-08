Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 79DA239FE7D
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 20:05:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 859B06EC07;
	Tue,  8 Jun 2021 18:05:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com
 [IPv6:2607:f8b0:4864:20::829])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7E636EC07
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jun 2021 18:05:25 +0000 (UTC)
Received: by mail-qt1-x829.google.com with SMTP id e3so4367434qte.0
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Jun 2021 11:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=WOlapbro2aVNPxibq8j3aKmRfZb+mvnEkxvW8XPtMuU=;
 b=u5xkaH+UZcFHSC4oAOTteBw3RDdVrJdHBHpxD0nJQ+qGNakS9xZadU94PfKBHg4bPM
 g3vn3OBBvVdO2NzCsdjQr1D+ZOjpaw4w9UKZXYfRU7Xbpy/G89rxAZR1RzLdDij2yT75
 XBwspKktwnnUGufnEc5Nx9rv+UpTYOqY8KTfjWhoRs0VCWoLbHRWlretslU1mNMAKS2n
 BlmLyqF2fjC80y2Wl21tJjT2CFRnnZZZsMRXFEF4je/StC151EirqknEtFz9ZYyTU44g
 eUguAQXU8JPYagOfxx/aRbWKtXGCSr3xz9/rWR+dK7Dp5xJs+ec55rwD6C0aoxl4Y68q
 iXeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WOlapbro2aVNPxibq8j3aKmRfZb+mvnEkxvW8XPtMuU=;
 b=Npmfds1r/+BzAay4BcK4ugo6x3yXrkV7TUZtMCHLIFzElqM7bw4H4t3MtfV/JMrZFP
 dzbpbcsHry/nd4KDclTk4pYSXfHfiwk+IpFyyIvP9tUSHdemmb86Jq/YRW4qbfadchHv
 ndZnh9RsPE0y0Jt0uVuEcJzZZZIvSIOOgAGrw11dllLT75gvSu/+2qpcQ6P7kO4sS/tf
 A54JRlisgWIkl4HlClA/0x7T/fFFy2VlStKh7APxrIfCWL2+otFbcjK+6UK3g+330Rno
 mI6OtJlwXmpXoPtesNMv06oQqj5Up/9hJW9ZYNjb5QRuq9jqNcQNflD58zMFL9vdjKPS
 FLfA==
X-Gm-Message-State: AOAM533OUz36uAIlzljJ6g/HsKDuLbmmXk0TrlDg1b1BV53GUOs7HQtS
 3lT/JkftUCg6gfJjE6q+VtYwiA==
X-Google-Smtp-Source: ABdhPJyhZOqlnVcAHTSXDc04MENqTodbdNP6uY3poRtjnX1YpaTedbGhu6Osr4KNS075sOxw/pGmfg==
X-Received: by 2002:ac8:4e2e:: with SMTP id d14mr19798627qtw.205.1623175524925; 
 Tue, 08 Jun 2021 11:05:24 -0700 (PDT)
Received: from [192.168.0.189] (modemcable068.184-131-66.mc.videotron.ca.
 [66.131.184.68])
 by smtp.gmail.com with ESMTPSA id v5sm12320418qkh.39.2021.06.08.11.05.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jun 2021 11:05:24 -0700 (PDT)
Subject: Re: [PATCH v3 3/5] drm/msm/a6xx: add GMU_CX_GMU_CX_FALNEXT_INTF write
 for a650
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
References: <20210608172808.11803-1-jonathan@marek.ca>
 <20210608172808.11803-4-jonathan@marek.ca>
Message-ID: <4c6ae8ab-05e2-5974-4f8d-48e2a31504b0@marek.ca>
Date: Tue, 8 Jun 2021 14:03:41 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20210608172808.11803-4-jonathan@marek.ca>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Sean Paul <sean@poorly.run>,
 open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/8/21 1:27 PM, Jonathan Marek wrote:
> downstream msm-5.14 kernel added a write to this register, so match that.
> 

Note: this should say msm-5.4 (msm-5.14 is not a thing)

> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>   drivers/gpu/drm/msm/adreno/a6xx_gmu.c     | 4 +++-
>   drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h | 2 ++
>   2 files changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index c1ee02d6371d..0f3390eab55e 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -751,8 +751,10 @@ static int a6xx_gmu_fw_start(struct a6xx_gmu *gmu, unsigned int state)
>   	int ret;
>   	u32 chipid;
>   
> -	if (adreno_is_a650(adreno_gpu))
> +	if (adreno_is_a650(adreno_gpu)) {
> +		gmu_write(gmu, REG_A6XX_GPU_GMU_CX_GMU_CX_FALNEXT_INTF, 1);
>   		gmu_write(gmu, REG_A6XX_GPU_GMU_CX_GMU_CX_FAL_INTF, 1);
> +	}
>   
>   	if (state == GMU_WARM_BOOT) {
>   		ret = a6xx_rpmh_start(gmu);
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h
> index 5a43d3090b0c..eeef3d6d89b8 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h
> @@ -292,6 +292,8 @@ static inline uint32_t A6XX_GMU_GPU_NAP_CTRL_SID(uint32_t val)
>   
>   #define REG_A6XX_GPU_GMU_CX_GMU_CX_FAL_INTF			0x000050f0
>   
> +#define REF_A6XX_GPU_GMU_CX_GMU_CX_FALNEXT_INTF    		0x000050f1
> +
>   #define REG_A6XX_GPU_GMU_CX_GMU_PWR_COL_CP_MSG			0x00005100
>   
>   #define REG_A6XX_GPU_GMU_CX_GMU_PWR_COL_CP_RESP			0x00005101
> 
