Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 322D6390384
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 16:09:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 838926E245;
	Tue, 25 May 2021 14:09:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0759D6E245;
 Tue, 25 May 2021 14:09:14 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 z19-20020a7bc7d30000b029017521c1fb75so3551797wmk.0; 
 Tue, 25 May 2021 07:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=hg0kLFdzUIdBjsi4lARjo6wP7z8MYrdqivPZrwICJsM=;
 b=Rma14aAQYBXaxY6uZ4wfhq86yRkCJq8fuDMm5Dls1pmgyo2tJmZO9E2OZeypvtjgdR
 fbBV33m11Y6vk+ldV7LF8kX0FAeGhwKvrCU8+Qf0O0L47G8+J6ea8ZjJZv1BaxjYZHjR
 PM2yRsI0yhlakCN5k47kj3j9pLgag/qdGWvoGT7q3Y3uTZnDHyshh2hcLe2Pf0UjuBqr
 9U8n489LVlqfheYYqUk1o3i6AbZ1jRu8mpaFiBKT6CS7wXxTAa7xGagqCnUiQSJ7/dHn
 zqIl7LwxShg9ZqvCK+s+CNPVIGV77QkDE5YAWh2nQlDj2N1JPSb2m8efj5nF5Y2C1zWP
 myGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=hg0kLFdzUIdBjsi4lARjo6wP7z8MYrdqivPZrwICJsM=;
 b=bMB7j/j7trHOS4/joU2+Hj0BKAhTzj1jwZaaWmVipjryUxPKbT76LGlHeggwKcfLoH
 fHwpKDfc3kk1XJpRc2JIY2WoIOFu/Yxx9eDzlRiL0y0floE6MsBcq39yVkJ0h2xSZTf6
 FrBiHEnwToKhNXHxdMROCku7f3I5iWUNRlSEcWbPUQxVoC/8lZzHY5Y+tkuD48lvsoWZ
 WkCot+nPsoxcS2HmPU6VztDQBGTxg9VDuZbxyZg7KKNMA6KCwKga7bnSyCg+CSGsfeBJ
 C0qltSvMw5E2n/LDxcTTF5TrunZoQfT2fXV9E7UL6bEPuSPsJbeecg1vRGM1yHrRav9N
 Z2bQ==
X-Gm-Message-State: AOAM531wpqeDG60V0BPwNiaQAXDFuranba6Rscyx5aHm+xMLSazQUTjB
 MR5VHsieJsEP7Od3fNVAyjA=
X-Google-Smtp-Source: ABdhPJw9LWIiUBXzKRCmur/frT8mNLcwchqQ0hbKF05DQ70SIz3IzbILlMtineBcApx+kWKJ+9SSkA==
X-Received: by 2002:a1c:bcc3:: with SMTP id m186mr24240821wmf.74.1621951753781; 
 Tue, 25 May 2021 07:09:13 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:d67f:bd9a:6dbf:33b1?
 ([2a02:908:1252:fb60:d67f:bd9a:6dbf:33b1])
 by smtp.gmail.com with ESMTPSA id l16sm3089148wmj.47.2021.05.25.07.09.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 May 2021 07:09:13 -0700 (PDT)
Subject: Re: [PATCH v2] amdgpu: remove unreachable code
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, alexander.deucher@amd.com
References: <1621939214-57004-1-git-send-email-jiapeng.chong@linux.alibaba.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <0dbdc879-8da7-3a08-1e42-6b8b88dfceb6@gmail.com>
Date: Tue, 25 May 2021 16:09:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1621939214-57004-1-git-send-email-jiapeng.chong@linux.alibaba.com>
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
Cc: airlied@linux.ie, Xinhui.Pan@amd.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, christian.koenig@amd.com,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 25.05.21 um 12:40 schrieb Jiapeng Chong:
> In the function amdgpu_uvd_cs_msg(), every branch in the switch
> statement will have a return, so the code below the switch statement
> will not be executed.
>
> Eliminate the follow smatch warning:
>
> drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:845 amdgpu_uvd_cs_msg() warn:
> ignoring unreachable code.
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
> Changes in v2:
>    -For the follow advice: https://lore.kernel.org/patchwork/patch/1435074/
>
>   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c | 1 -
>   1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
> index 82f0542..b32ed85 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
> @@ -840,7 +840,6 @@ static int amdgpu_uvd_cs_msg(struct amdgpu_uvd_cs_ctx *ctx,
>   
>   	default:
>   		DRM_ERROR("Illegal UVD message type (%d)!\n", msg_type);
> -		return -EINVAL;
>   	}
>   	BUG();

You also need to remove the BUG() here or otherwise that will crash on 
an relatively harmless error.

Christian.

>   	return -EINVAL;

