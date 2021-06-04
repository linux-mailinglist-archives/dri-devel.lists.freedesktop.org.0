Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C33639B387
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jun 2021 09:03:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFDF56F5A8;
	Fri,  4 Jun 2021 07:03:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D9C06F5A5;
 Fri,  4 Jun 2021 07:03:14 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id l1so12919753ejb.6;
 Fri, 04 Jun 2021 00:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=JxPiXyyxmrcft44toq/bGBBHxD6goLW29hTUFEaks9I=;
 b=DqZfNfrcD/kZVU60HoE1MhYt+t5wnXPhiB29YDLOjzGIkia1orIae3vA6RUd/SMjAh
 NIlW5e5QcJFUbZYMkW98wKUkjfJpAEqr9cC4NdJsVBUokvj5gl7BG+J2hoKVfACcvZnh
 dCESB2q1vobP96x3gTtRM3E05+XcBF6UyxL2GLoed7BAligajoeLzr2vlR9/f7ze0uw3
 6NpdlsCQn/NIX3XI7TPZ26e4QZd1D83DoHqB/Ia8PtozdJxRlMtlKjEK+Pr46QawXYgd
 sJQ17QV7NUdaiZpOelFF63E/2Tp2L/R+K9lwZdaxjjIyOz1h5kwFc70DHR2Vajstg8UL
 0fbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=JxPiXyyxmrcft44toq/bGBBHxD6goLW29hTUFEaks9I=;
 b=N/MxhQOJvyHkF1XBOSszdnltXjTOQswLE2ENnKwa5CcgH5VlTWoBRH68txgMfHrUye
 GmCOhso5AerzMeyS0zvKebNz7WxygFxjLuG8gTn6kCXt1QUuYFQ9L3xtk8gq6/OgcTDk
 ZCZrl3ntMj12iPh098gNZHbeVO5z+RRveWYl2ZmKB9mkD3O67Z7rNDNn3La+Tw4CeeuO
 O1xS/iTuQGRnSUTOkMIjA59/4zvayjkVb7zSvs6PWPA+MGZz3ay7hHnEGVKyOuavVGdD
 fGYASyqtgRRKiGC5VulUKHNmssgzJlkXki8MVH5CmjBR/PUHVeRQiGJlwuV7uaP8BDzm
 v1Iw==
X-Gm-Message-State: AOAM53045CR3AXmNYtw7BZmF0d3SW9GRR/jibqlupFh3c/EmOE5s3XJw
 sBc4msVXv7yFhwZAbsD/RtQ=
X-Google-Smtp-Source: ABdhPJx2vnZVx5FWV0r9/ik2kgxEsnp35h53vw1wSJF3RN31o1NnkMZDceURVJhlfhN1mSkfN+w/iQ==
X-Received: by 2002:a17:906:4341:: with SMTP id
 z1mr2909890ejm.422.1622790192787; 
 Fri, 04 Jun 2021 00:03:12 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:7b4b:873a:17b5:b581?
 ([2a02:908:1252:fb60:7b4b:873a:17b5:b581])
 by smtp.gmail.com with ESMTPSA id t2sm2355698ejx.72.2021.06.04.00.03.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Jun 2021 00:03:12 -0700 (PDT)
Subject: Re: [PATCH] drm: amdgpu: Remove unneeded semicolon in amdgpu_vm.c
To: Wan Jiabing <wanjiabing@vivo.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Felix Kuehling <Felix.Kuehling@amd.com>,
 Nirmoy Das <nirmoy.das@amd.com>, Dave Airlie <airlied@redhat.com>,
 Philip Yang <Philip.Yang@amd.com>, Mihir Bhogilal Patel
 <Mihir.Patel@amd.com>, Roy Sun <Roy.Sun@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <1622690940-10972-1-git-send-email-wanjiabing@vivo.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <3d7fcdb9-990b-270b-f87b-d7fe157c6b2f@gmail.com>
Date: Fri, 4 Jun 2021 09:03:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1622690940-10972-1-git-send-email-wanjiabing@vivo.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 03.06.21 um 05:28 schrieb Wan Jiabing:
> Fix following coccicheck warning:
> ./drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1726:2-3: Unneeded semicolon
>
> Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> index 2460371..231745b 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> @@ -1723,7 +1723,7 @@ int amdgpu_vm_bo_update_mapping(struct amdgpu_device *adev,
>   
>   		amdgpu_res_next(&cursor, num_entries * AMDGPU_GPU_PAGE_SIZE);
>   		start = tmp;
> -	};
> +	}
>   
>   	r = vm->update_funcs->commit(&params, fence);
>   

