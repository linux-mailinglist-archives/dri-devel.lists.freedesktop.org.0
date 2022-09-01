Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F335A9577
	for <lists+dri-devel@lfdr.de>; Thu,  1 Sep 2022 13:11:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 861B910E678;
	Thu,  1 Sep 2022 11:11:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6ACC10E5C4;
 Thu,  1 Sep 2022 11:11:16 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id t5so22051888edc.11;
 Thu, 01 Sep 2022 04:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=br+dhcCxXJwzW6f9xt/bMYhLtFCYl5eUPVout3b4xT8=;
 b=KWV/sMBp3VEr7Tu2gqPQZkk8p9fJJ5oqhWnqN76GhHFs/2wxmQokbq4KJ5C6aYPBU3
 xT7dDENe5pKPeDwKqQbYVkEPaTuB4LJSn6ffTJtfvPLlRJCn0seUvGymofy5ScgJjosa
 1ScYQUWU/yLYL7djUR/sFVjDXjBWJXpt13v+mZ9/9VcR3g7UBYZIVHm4AfCrxf7R6ndy
 LV9YmkKr75PHhMBjtmtiHSktSnl80ohYBVM7ARMqxS1eMmlYGOwVMB192CuyxsmwymwD
 Ru5n+HSpzFPmIvEbTgADLsJ5kn+RCJCee8XScE30kXvPj+rk7TqSorGEtHq+ZyHz8H5H
 FbVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=br+dhcCxXJwzW6f9xt/bMYhLtFCYl5eUPVout3b4xT8=;
 b=D4fkuGcusmTap6c63G7YC9rtoUYd1Xxv0XkZfSoeSF5JxvSlnccrePBeR79+lqTQES
 4wmrz+fuwfoQJ5Kmn12OvNmSQdhwAzOIjueerS+NAlgL/TsbNMln3MqaW/Qo2p/D9RC/
 fyI4qgtwKnogM+HOr9DcXT9XKArYm/27SPjZip+o7gPh/gcY6WRUIaZ9bqIpNDaFmn0k
 5CxAiDSE16Zl1+R5NBIhFlN7GJaxaZN0nJNt5kGxVJJrnmElMNzAv1/dU3D0/slLnHy8
 NpGnnwNU36amL6CwGBrnxPkWiPeZYfhi+a+RXGdf8dFcwpJgpsAesq8PvzrIBIKU0QFr
 rWVA==
X-Gm-Message-State: ACgBeo1/ZkS9ZHEicVJlOL9zcJQvF19HZhvIkV0jZjEATtFznu9TneSK
 Cj4BigYs60PexdZdCkBPXeM=
X-Google-Smtp-Source: AA6agR7zrfXJRH0RUA9uGf7LRe/0YtUk83T0O64A32xgZOrsaF2HczSnu18eV0y3E1njCzJoXMlexQ==
X-Received: by 2002:a05:6402:1388:b0:447:a3a4:6152 with SMTP id
 b8-20020a056402138800b00447a3a46152mr28307662edv.13.1662030675385; 
 Thu, 01 Sep 2022 04:11:15 -0700 (PDT)
Received: from [192.168.178.21] (p4fc20ad4.dip0.t-ipconnect.de.
 [79.194.10.212]) by smtp.gmail.com with ESMTPSA id
 fe23-20020a1709072a5700b007308bdef04bsm8324641ejc.103.2022.09.01.04.11.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Sep 2022 04:11:14 -0700 (PDT)
Message-ID: <df602f9a-d55e-e034-febd-ac15d76cfa28@gmail.com>
Date: Thu, 1 Sep 2022 13:11:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] drm/ttm: update bulk move object of ghost BO
Content-Language: en-US
To: ZhenGuo Yin <zhenguo.yin@amd.com>, amd-gfx@lists.freedesktop.org
References: <20220901092946.2030744-1-zhenguo.yin@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20220901092946.2030744-1-zhenguo.yin@amd.com>
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
Cc: jingwen.chen2@amd.com, christian.koenig@amd.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 01.09.22 um 11:29 schrieb ZhenGuo Yin:
> [Why]
> Ghost BO is released with non-empty bulk move object. There is a
> warning trace:
> WARNING: CPU: 19 PID: 1582 at ttm/ttm_bo.c:366 ttm_bo_release+0x2e1/0x2f0 [amdttm]
> Call Trace:
>    amddma_resv_reserve_fences+0x10d/0x1f0 [amdkcl]
>    amdttm_bo_put+0x28/0x30 [amdttm]
>    amdttm_bo_move_accel_cleanup+0x126/0x200 [amdttm]
>    amdgpu_bo_move+0x1a8/0x770 [amdgpu]
>    ttm_bo_handle_move_mem+0xb0/0x140 [amdttm]
>    amdttm_bo_validate+0xbf/0x100 [amdttm]
>
> [How]
> The resource of ghost BO should be moved to LRU directly, instead of
> using bulk move. The bulk move object of ghost BO should set to NULL
> before function ttm_bo_move_to_lru_tail_unlocked.
>
> Fixed:·5b951e487fd6bf5f·("drm/ttm:·fix·bulk·move·handling·v2")
> Signed-off-by: ZhenGuo Yin <zhenguo.yin@amd.com>

Good catch, but the fix is not 100% correct. Please rather just NULL the 
member while initializing the BO structure.

E.g. something like this:

  ....
  fbo->base.pin_count = 0;
+fbo->base.bulk_move= NULL;
  if (bo->type != ttm_bo_type_sg)
  ....

Thanks,
Christian.

> ---
>   drivers/gpu/drm/ttm/ttm_bo_util.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
> index 1cbfb00c1d65..a90bbbd91910 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> @@ -238,6 +238,7 @@ static int ttm_buffer_object_transfer(struct ttm_buffer_object *bo,
>   
>   	if (fbo->base.resource) {
>   		ttm_resource_set_bo(fbo->base.resource, &fbo->base);
> +		ttm_bo_set_bulk_move(&fbo->base, NULL);
>   		bo->resource = NULL;
>   	}
>   

