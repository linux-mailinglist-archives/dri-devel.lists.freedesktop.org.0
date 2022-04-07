Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 952754F75DA
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 08:21:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3876910EBC6;
	Thu,  7 Apr 2022 06:21:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3451410EA10;
 Thu,  7 Apr 2022 06:21:33 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id k23so8693853ejd.3;
 Wed, 06 Apr 2022 23:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=lFeu13B4GooKw5hC3dcio6xNxGQNDFEh6M5pue+v5h8=;
 b=K3W43Xpr4w6Uel8V1O2QRTwL4Z9UmJkdK9muSQytlVH4Gzn6W03AvpfAouMfVteW8c
 6E0I3EDINF5FrFoKrNCVgs89YXkKFEZZSFRmCNa2OM7OWjk+O1WZhNHA9hl0HkrVqQAR
 /5HnpHGp7lTpeHeujdPqx3qi+fzJaZdunPLC1NdS2vHrQtqV4B6GS8Fi2ji4gNqfK9Dv
 hHaAXSR+bLm7RZyUO8JzRdZqmGyuaMQEriuWcjbmQoJokfBUzEwzvppNgdjJZuGLlhTO
 0TQ2/yoh0k7Uh5SvI7NrHeKEZTiRTBaRq+No3p8rygDtXFkqayE5vYAnw3u9ia2KHnyQ
 D6Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=lFeu13B4GooKw5hC3dcio6xNxGQNDFEh6M5pue+v5h8=;
 b=nQyFCrqR6dqbJR/5A1cWhKYuGhnWpD8dCAWP3hgmubXMAkasnJVFLuNzy4h1xvdm4J
 CVMpxKBO0dH+PmYs2KdeEZ/TAABzhzNt5AplZCfi3JOcaawvb+owCyl28BvJVnfq7yQl
 iyrOhcDxGkxOJi3++FbI6fJgy55ZGm2AMeyFVMFV0yJPAua/7Eo6ksjKj89zXRLovGS8
 sZxdlyIREr69fvkYi5Jc13VkodRMhhJ+EyPuWPLRuUiLwoqZEKaA57xiesGpVje406W9
 soOBFF2eLy4jLi003X4SiVJ69aqL165Bb+xHsgMtH+OMsj1TlLTYPrGNqbNnSWs/9anW
 +IUA==
X-Gm-Message-State: AOAM533Nvl+PSNogU0t6a3LFTsoKP43N5QehT/wHmbGboNhmqxWmwqmD
 XUsTXWziFDZrPNM3pu1K0tc=
X-Google-Smtp-Source: ABdhPJzJvVu/Mpc49n67UlRPTuoOw32LgOaTHZZqxWaAICiarYth54KIQ/X745zarR/GrOyHAryZZg==
X-Received: by 2002:a17:906:7751:b0:6ce:e3c:81a6 with SMTP id
 o17-20020a170906775100b006ce0e3c81a6mr11286345ejn.278.1649312491633; 
 Wed, 06 Apr 2022 23:21:31 -0700 (PDT)
Received: from [192.168.178.21] (p57b0b9e1.dip0.t-ipconnect.de.
 [87.176.185.225]) by smtp.gmail.com with ESMTPSA id
 gv9-20020a170906f10900b006d7128b2e6fsm7340540ejb.162.2022.04.06.23.21.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Apr 2022 23:21:30 -0700 (PDT)
Message-ID: <26951c45-f742-2f0e-f4a6-281a031c3471@gmail.com>
Date: Thu, 7 Apr 2022 08:21:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] drm/amdgpu: Fix code with incorrect enum type
Content-Language: en-US
To: Grigory Vasilyev <h0tc0d3@gmail.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Melissa Wen <mwen@igalia.com>
References: <20220406165057.97492-1-h0tc0d3@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20220406165057.97492-1-h0tc0d3@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Guchun Chen <guchun.chen@amd.com>, David Airlie <airlied@linux.ie>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Joseph Greathouse <Joseph.Greathouse@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 06.04.22 um 18:50 schrieb Grigory Vasilyev:
> Instead of the 'amdgpu_ring_priority_level' type,
> the 'amdgpu_gfx_pipe_priority' type was used,
> which is an error when setting ring priority.
> This is a minor error, but may cause problems in the future.
>
> Instead of AMDGPU_RING_PRIO_2 = 2, we can use AMDGPU_RING_PRIO_MAX = 3,
> but AMDGPU_RING_PRIO_2 = 2 is used for compatibility with
> AMDGPU_GFX_PIPE_PRIO_HIGH = 2, and not change the behavior of the
> code.
>
> Signed-off-by: Grigory Vasilyev <h0tc0d3@gmail.com>

Good catch, Acked-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
> index 5554084ec1f1..9bc26395f833 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
> @@ -1929,7 +1929,7 @@ static int gfx_v8_0_compute_ring_init(struct amdgpu_device *adev, int ring_id,
>   		+ ring->pipe;
>   
>   	hw_prio = amdgpu_gfx_is_high_priority_compute_queue(adev, ring) ?
> -			AMDGPU_GFX_PIPE_PRIO_HIGH : AMDGPU_RING_PRIO_DEFAULT;
> +			AMDGPU_RING_PRIO_2 : AMDGPU_RING_PRIO_DEFAULT;
>   	/* type-2 packets are deprecated on MEC, use type-3 instead */
>   	r = amdgpu_ring_init(adev, ring, 1024, &adev->gfx.eop_irq, irq_type,
>   			     hw_prio, NULL);

