Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F36EE47A551
	for <lists+dri-devel@lfdr.de>; Mon, 20 Dec 2021 08:17:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A7E610E8AD;
	Mon, 20 Dec 2021 07:17:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C555310E8AD;
 Mon, 20 Dec 2021 07:17:49 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id r17so17744265wrc.3;
 Sun, 19 Dec 2021 23:17:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=vNp7wPHXvGS+ZPQFtJJLBiQ3T1WUuBEpjEay+kuXQAg=;
 b=mzFGtxynOqNcCnNlCTTuBpzSwk0cml0TXKa9YUBgNJhSyJwkFWLHU4tlI2WdjkZFd9
 o6MY+8Y37EBg98DGQkFGGIMu9Dm5nXMGgt4dwYUEn//g2rJe8U94nvD5RmQ9NjrK0Uod
 6LnUx0+zjz+bZJv0KRd9cRzVphw6HBHJC8B7GVsqgiAh+eTRPgkCGtoqI1ml2UTLp5p4
 NFKOsmUKU/ZZhKeRRXmPx8UK1LPBEf8Pask5dk98RLk7uIsLj8bsRXV5RWFPRymIhKIp
 RHBiSL556+zD0fFw2soNAzRXBuwHtfM+u266Ev+eH3kgAi5fFsD5tkyZkyXws6dIIS/j
 deig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=vNp7wPHXvGS+ZPQFtJJLBiQ3T1WUuBEpjEay+kuXQAg=;
 b=eF69fuVjoZodAbvy4loeTVIRyuy7VrjTHS23/ZRq0eVpBt3fWyVGKAA8/LkaIdF5Ek
 sL3YIk1uf5Q2GD009hAG8xWySOyw8o0uz2FpYiDFZ6G21E32goEsyQg3eWFFhKh7z+mq
 MaOrMrElZ4ko/92iur/+Gi+PCtJdd62LZGMDWU0ijNzA2AlsZxSTdthlQX86pNFWBmPF
 1K5QD2kDgxCx7Tix+z68IX78XaYxUQSadAMsj7voVQFpVdupE5KuynHMlX4VVQRY9V6L
 Rtg+7NZdJsG/U7livCl3/n7DXLw16nh6SAvMDDCPw4UogOqjBj8UW/E3MPgXqUs9K5KU
 wyUg==
X-Gm-Message-State: AOAM532ZeVxa/Aq5QTBegodGNNkOHt39Wjm4b21GUlZ/xudP5zB1lDyN
 fzLFTqFf4RYuTF6/+taXnd0=
X-Google-Smtp-Source: ABdhPJz/Syr73wKBtVYgnNof/ZgQPuHhc83uaRJIkSlK9Iq2ZjADArH08sH+wS2lC2Sa7On3RA1TCw==
X-Received: by 2002:a5d:424c:: with SMTP id s12mr11532732wrr.465.1639984668317; 
 Sun, 19 Dec 2021 23:17:48 -0800 (PST)
Received: from [192.168.178.21] (p57b0bff8.dip0.t-ipconnect.de.
 [87.176.191.248])
 by smtp.gmail.com with ESMTPSA id a3sm16775616wri.98.2021.12.19.23.17.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Dec 2021 23:17:47 -0800 (PST)
Subject: Re: [RFC 3/6] drm/amdgpu: Fix crash on modprobe
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20211217222745.881637-1-andrey.grodzovsky@amd.com>
 <20211217222745.881637-4-andrey.grodzovsky@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <bdbb195f-a9a7-2129-deaa-93e4e49cc8a2@gmail.com>
Date: Mon, 20 Dec 2021 08:17:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211217222745.881637-4-andrey.grodzovsky@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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
Cc: horace.chen@amd.com, christian.koenig@amd.com, Monk.Liu@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 17.12.21 um 23:27 schrieb Andrey Grodzovsky:
> Restrict jobs resubmission to suspend case
> only since schedulers not initialised yet on
> probe.
>
> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> index 5527c68c51de..8ebd954e06c6 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> @@ -582,7 +582,7 @@ void amdgpu_fence_driver_hw_init(struct amdgpu_device *adev)
>   		if (!ring || !ring->fence_drv.initialized)
>   			continue;
>   
> -		if (!ring->no_scheduler) {
> +		if (adev->in_suspend && !ring->no_scheduler) {

Uff, why is that suddenly necessary? Because of the changed order?

Christian.

>   			drm_sched_resubmit_jobs(&ring->sched);
>   			drm_sched_start(&ring->sched, true);
>   		}

