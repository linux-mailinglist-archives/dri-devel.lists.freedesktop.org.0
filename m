Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1184039DA09
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jun 2021 12:46:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A27036E8A1;
	Mon,  7 Jun 2021 10:46:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDA866E8A2;
 Mon,  7 Jun 2021 10:46:17 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 3-20020a05600c0243b029019f2f9b2b8aso9832912wmj.2; 
 Mon, 07 Jun 2021 03:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=KcIhVJsL3yrPFMmj6Xxxh1AoiEa6qKo1bMNhV5zzVU4=;
 b=nIfQIgvwVppIuEFSzUQVquUbbMHHEiotd+EFEBy2MJDMpTxLbCzIJy3aL/h4WE87Kn
 PZmaBHFFRSEyEXosjbP2EZuixX75V/ZhtvLfb3tXHHCLT8xBRROW5+nSD0zJLEcmoeVN
 No3BFvOuW2XoLcusEFKJVtfhw1/tV5mRmIZHmZJRb8Pp2eAcrbsrB0OQ5rgbeMGngY0n
 F5UJPn7xyZ2uBXdwMD5qm2oaerqyfBROtOylfHWUtzoeD5hz2o7dCgiBLTpn1poBCd0B
 DR0ZcEROaNyxZCGESxd5MgNG1KMlm08QE/eQ64AeQ500Wr/hrblXZHFYrAjA34LZIh3F
 1T6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=KcIhVJsL3yrPFMmj6Xxxh1AoiEa6qKo1bMNhV5zzVU4=;
 b=mAYnLcrDKufv2+/YRHOJr5yznvVm87reM7RniOrxbuLJ4L3QTyUlvW5P40uS3kJtiG
 kga3RCxJwvDYkfyGqm58oLH/aGOKwXUew6Ywkb2jMIA62cHSvPu5bgpQ+mnRaodSPQ06
 uUIDchB7ASSUFSqcQyyLCPuFQ/rTGcDSsZXno4ve4Y7/K/xGdVAlle7L+XzwNewwAY+C
 yS9kz0qIHvJ4VytAOY+StE8rAkJwzRewFuZU8A9q+P0zqPgg6d6bQamGu8SaU0Yym7sj
 Y+F63sCa+fndZkBix7WPTfptqNgMqwJlf4q/t8M4HNs7yiSYcTMYk0kYAxRW3NL6kfzr
 vRYg==
X-Gm-Message-State: AOAM533T81/4In1FMJ66+hBE1XEL9mcADeffAUbG9UbTeaLmsQdK/La5
 kqlcCSFtGgtollFYBSEZcL4=
X-Google-Smtp-Source: ABdhPJz5mNoADFlUvoQOZLVGYoQSWnoQIBz5yANTWqTzpJFPZOVBzoohGEELM71BXZ+Lolragqs//Q==
X-Received: by 2002:a05:600c:5122:: with SMTP id
 o34mr8135390wms.168.1623062776700; 
 Mon, 07 Jun 2021 03:46:16 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:ce67:4e4d:875d:ffeb?
 ([2a02:908:1252:fb60:ce67:4e4d:875d:ffeb])
 by smtp.gmail.com with ESMTPSA id v7sm17854646wrf.82.2021.06.07.03.46.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Jun 2021 03:46:16 -0700 (PDT)
Subject: Re: [PATCH] drm/amdgpu: Fix a a typo in a comment
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@linux.ie, daniel@ffwll.ch
References: <ea7ecbef546a03ef71d65bfe82608bb347e6f3c2.1622883895.git.christophe.jaillet@wanadoo.fr>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <99a5eba3-2d2a-65a8-9b03-a3d4043c5ec5@gmail.com>
Date: Mon, 7 Jun 2021 12:46:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <ea7ecbef546a03ef71d65bfe82608bb347e6f3c2.1622883895.git.christophe.jaillet@wanadoo.fr>
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
Cc: kernel-janitors@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 05.06.21 um 11:06 schrieb Christophe JAILLET:
> s/than/then/
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Acked-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> index 89ebbf363e27..1476236f5c7c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> @@ -662,7 +662,7 @@ static int amdgpu_cs_sync_rings(struct amdgpu_cs_parser *p)
>    * @error:	error number
>    * @backoff:	indicator to backoff the reservation
>    *
> - * If error is set than unvalidate buffer, otherwise just free memory
> + * If error is set then unvalidate buffer, otherwise just free memory
>    * used by parsing context.
>    **/
>   static void amdgpu_cs_parser_fini(struct amdgpu_cs_parser *parser, int error,

