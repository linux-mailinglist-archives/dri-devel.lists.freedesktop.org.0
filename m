Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F1738C837
	for <lists+dri-devel@lfdr.de>; Fri, 21 May 2021 15:36:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E2686F64B;
	Fri, 21 May 2021 13:35:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3808A6F64B;
 Fri, 21 May 2021 13:35:55 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id r11so23291358edt.13;
 Fri, 21 May 2021 06:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=CQNC5tcnBn2sqXfCRtfQO1Epq9bHKf0uPXF2miAwK8c=;
 b=fLsWWbaiDOqeBWiqz6Z+lTChhnRdQXJhHKLIfA8sFTt4eb1cfC4Lt3RrcQ21kaW+jW
 OHIxj5PhomewXQVDOd/NF4aWy9+nfK225wjSgNf4pICpSZapsAFD8LYus0KDiKKUuQ8g
 q29dSw99YdnCWDV0xwHNcRcX6NgiJpwFfWk5fk2Ot7V6FoTtgokzv/SI1lCWzOgnr2Lc
 FU/z2kh1YvgJfgjqA275Qr3tRFOI5QZVbtUGtxUdON110xwRCN7lFaz+JPDs9sgDLpka
 7E+Uyoi5ddadvNEHHi1V3c2eC9DHyCLuYNLje5KHnohs/PqXiQcNWWZsqQZnDUp3ltdP
 CmMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=CQNC5tcnBn2sqXfCRtfQO1Epq9bHKf0uPXF2miAwK8c=;
 b=Nbo6raYsAsWQ60RXy6y4jVRlrbJ6X1Lo6sdZN/9NoPAG1z0McitPLBxcTZM8K1ivXO
 VQmLS6oSfW4bjmVxDU+nOLV95JIorZau0+5ZUAtXCDWVIzsVeoTkINKpCT4lMX/d1Xgu
 uL+gLP/a2N/LED3zkohPch3CZ056ctvMWH1CAnGIOzbFqDQ3k0JnFEyKLsQGhoP/PTtB
 EvKdu3HR+dJc56/97lyV2FAssrnBv6X7pBSAGhyskTD4BR1nJ8oe/7OcH1QT7L4yDF6v
 ZEN9bejUEfHtd7U5GzBUfRtoEE0yrIWy9CTNbmBC4mDi+RMgw9WiF5hs251zwY6nyOQt
 UkOg==
X-Gm-Message-State: AOAM530ZCv0r1VW5KBBSGu2QZv+WoMue6azw/iHJSxuiMVWfmDUfSWxA
 7uJ9ze0Hct1PerfGicIXOHU=
X-Google-Smtp-Source: ABdhPJyPW3mc2rl6LjDNVIo7U/7GXPuRodp/tiEJiegxksa2IqC/S5vF1kHBS0G+Zgd1fxT0kjpidw==
X-Received: by 2002:aa7:d550:: with SMTP id u16mr9565282edr.72.1621604153975; 
 Fri, 21 May 2021 06:35:53 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:b48f:ff97:fb4c:5b1d?
 ([2a02:908:1252:fb60:b48f:ff97:fb4c:5b1d])
 by smtp.gmail.com with ESMTPSA id df8sm3942018edb.58.2021.05.21.06.35.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 May 2021 06:35:52 -0700 (PDT)
Subject: Re: [PATCH] drm/amdgpu: Fix inconsistent indenting
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, alexander.deucher@amd.com
References: <1621590628-75988-1-git-send-email-jiapeng.chong@linux.alibaba.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <09e40764-1d3a-0dfe-b278-5b5ce04670a9@gmail.com>
Date: Fri, 21 May 2021 15:35:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1621590628-75988-1-git-send-email-jiapeng.chong@linux.alibaba.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: airlied@linux.ie, Xinhui.Pan@amd.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, christian.koenig@amd.com,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 21.05.21 um 11:50 schrieb Jiapeng Chong:
> Eliminate the follow smatch warning:
>
> drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c:449
> sdma_v5_0_ring_emit_mem_sync() warn: inconsistent indenting.
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c | 13 ++++++-------
>   1 file changed, 6 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
> index 75d7310..c45e1b0 100644
> --- a/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
> @@ -440,20 +440,19 @@ static void sdma_v5_0_ring_emit_ib(struct amdgpu_ring *ring,
>    */
>   static void sdma_v5_0_ring_emit_mem_sync(struct amdgpu_ring *ring)
>   {
> -    uint32_t gcr_cntl =
> -		    SDMA_GCR_GL2_INV | SDMA_GCR_GL2_WB | SDMA_GCR_GLM_INV |
> -			SDMA_GCR_GL1_INV | SDMA_GCR_GLV_INV | SDMA_GCR_GLK_INV |
> -			SDMA_GCR_GLI_INV(1);
> +	uint32_t gcr_cntl = SDMA_GCR_GL2_INV | SDMA_GCR_GL2_WB | SDMA_GCR_GLM_INV |
> +			    SDMA_GCR_GL1_INV | SDMA_GCR_GLV_INV | SDMA_GCR_GLK_INV |
> +			    SDMA_GCR_GLI_INV(1);
>   
>   	/* flush entire cache L0/L1/L2, this can be optimized by performance requirement */
>   	amdgpu_ring_write(ring, SDMA_PKT_HEADER_OP(SDMA_OP_GCR_REQ));
>   	amdgpu_ring_write(ring, SDMA_PKT_GCR_REQ_PAYLOAD1_BASE_VA_31_7(0));
>   	amdgpu_ring_write(ring, SDMA_PKT_GCR_REQ_PAYLOAD2_GCR_CONTROL_15_0(gcr_cntl) |
> -			SDMA_PKT_GCR_REQ_PAYLOAD2_BASE_VA_47_32(0));
> +			  SDMA_PKT_GCR_REQ_PAYLOAD2_BASE_VA_47_32(0));
>   	amdgpu_ring_write(ring, SDMA_PKT_GCR_REQ_PAYLOAD3_LIMIT_VA_31_7(0) |
> -			SDMA_PKT_GCR_REQ_PAYLOAD3_GCR_CONTROL_18_16(gcr_cntl >> 16));
> +			  SDMA_PKT_GCR_REQ_PAYLOAD3_GCR_CONTROL_18_16(gcr_cntl >> 16));
>   	amdgpu_ring_write(ring, SDMA_PKT_GCR_REQ_PAYLOAD4_LIMIT_VA_47_32(0) |
> -			SDMA_PKT_GCR_REQ_PAYLOAD4_VMID(0));
> +			  SDMA_PKT_GCR_REQ_PAYLOAD4_VMID(0));
>   }
>   
>   /**

