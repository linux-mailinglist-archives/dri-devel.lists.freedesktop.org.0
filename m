Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 296AE4503C4
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 12:49:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 832276E061;
	Mon, 15 Nov 2021 11:49:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAC546E926;
 Mon, 15 Nov 2021 11:49:05 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id t30so30060606wra.10;
 Mon, 15 Nov 2021 03:49:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=F9Fa9nV2d1oN0zSyfwagffKh9yytiJ7gGM/yAK7IOVY=;
 b=N1gksOf+HQ35CVcZoqzQzpTqmczAKWCVPasTjHCJXRNDvFq8CKqd2YnmfVFW0XrVs+
 5bUfQFJtCH9HtvVP4newx5mWyPWyUWW40E9xuCz3iQ7dART24Nf8UP2aYIb1siaqxRJ7
 QqVz5aBrnFVo8j0C5BLfFjp8x13Qe5HYv4kzDgEJQrPiUGIn6Dusagj8ewPZZTyve13P
 FxKXrl1EqG/4CddeJLTSyQBZ4cz0O7XoMAPexILNpj2aiJ7X75Q3+UOOa1oPv2UT5DfJ
 aqrbCBXvLO5KCXCwwdg8Kca2GRqSKX2lmpINd+wb26mrPbTrDpCPXLjLcGQBRXyIv3Ug
 8w5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=F9Fa9nV2d1oN0zSyfwagffKh9yytiJ7gGM/yAK7IOVY=;
 b=KEDZlP3l7zfJDLmxkCEwgeT6I+sSN23izZHn2NSY202sWJOry9V8fd8eOjff02qnZW
 yG57123FHvAwZErU1mlvww/ZWvwaE+DZIMLxvRKb2/FZ8iaSvzx17ERjwT7ppKI8TvsF
 KwTD4CQ3Dweh+woJt7oo3RWIs1CKTw84YRckLs/MTgOApxngQ9EChPZEU7KkmIAWMLij
 X+NF/oB0zcRwCD55k+mINWAlb8HoXEYi5Z/lqVnyfA9ZjcNPDfv+12knrMHSYv2R++FT
 sJ90LJnsQeeFyeaIu0wXBWn4carDE+ZC1c9Ljt/RjTMQwUFsjP2BhgV6JovQB7vwf3t2
 w8qA==
X-Gm-Message-State: AOAM5306EAgRogoHj6qvJRqmeCM4zpK52P1p4VcCmsf6MpC9/St1Wj/Q
 j7rVDZVY1R4oR4/6HDG1bIw=
X-Google-Smtp-Source: ABdhPJzugAmCckcr+WT+yOHGwg2UX+IBqinv3ZVNQqngdscuwZUtPNkDJ02Qr3ZLyHJofxNhZd4cMQ==
X-Received: by 2002:adf:ce08:: with SMTP id p8mr23055236wrn.154.1636976944428; 
 Mon, 15 Nov 2021 03:49:04 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:bf0c:d52c:6ba0:cfc6?
 ([2a02:908:1252:fb60:bf0c:d52c:6ba0:cfc6])
 by smtp.gmail.com with ESMTPSA id d6sm14045603wrx.60.2021.11.15.03.49.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Nov 2021 03:49:04 -0800 (PST)
Subject: Re: [PATCH] drm/amd/amdgpu: cleanup the code style a bit
To: Bernard Zhao <bernard@vivo.com>, Alex Deucher
 <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=c3=b6nig?=
 <christian.koenig@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Jingwen Chen <Jingwen.Chen2@amd.com>, Candice Li <candice.li@amd.com>,
 John Clements <john.clements@amd.com>, Monk liu <monk.liu@amd.com>,
 Peng Ju Zhou <PengJu.Zhou@amd.com>, Jiawei Gu <Jiawei.Gu@amd.com>,
 Bokun Zhang <bokun.zhang@amd.com>, Zhigang Luo <zhigang.luo@amd.com>,
 Lee Jones <lee.jones@linaro.org>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20211115070714.7007-1-bernard@vivo.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <ebcf8b30-7311-9d77-07ab-1b92756c0ae0@gmail.com>
Date: Mon, 15 Nov 2021 12:49:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211115070714.7007-1-bernard@vivo.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 15.11.21 um 08:07 schrieb Bernard Zhao:
> This change is to cleanup the code style a bit.

To be honest I think the old style looked better. It took me a moment to 
validate this now.

What you could to instead is to have goto style error handling which 
would make this a bit more cleaner I think.

Christian.

>
> Signed-off-by: Bernard Zhao <bernard@vivo.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c | 10 ++++++----
>   1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
> index 04cf9b207e62..90070b41136a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
> @@ -286,12 +286,14 @@ static int amdgpu_virt_init_ras_err_handler_data(struct amdgpu_device *adev)
>   		return -ENOMEM;
>   
>   	bps = kmalloc_array(align_space, sizeof((*data)->bps), GFP_KERNEL);
> +	if (!bps) {
> +		kfree(*data);
> +		return -ENOMEM;
> +	}
>   	bps_bo = kmalloc_array(align_space, sizeof((*data)->bps_bo), GFP_KERNEL);
> -
> -	if (!bps || !bps_bo) {
> -		kfree(bps);
> -		kfree(bps_bo);
> +	if (!bps_bo) {
>   		kfree(*data);
> +		kfree(bps);
>   		return -ENOMEM;
>   	}
>   

