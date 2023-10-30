Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A5A7DBC14
	for <lists+dri-devel@lfdr.de>; Mon, 30 Oct 2023 15:48:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96DDC10E2E0;
	Mon, 30 Oct 2023 14:48:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 647F110E2E0;
 Mon, 30 Oct 2023 14:48:05 +0000 (UTC)
Received: by mail-pg1-x530.google.com with SMTP id
 41be03b00d2f7-5b7f3f470a9so2867749a12.0; 
 Mon, 30 Oct 2023 07:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698677285; x=1699282085; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=enkdXsDQsvrVFAm4mm0Ogf+SLJzxgJmU8p9Qwbl4+Wo=;
 b=RE8u4eQPtzI4JJLVmbAtE0+3UyNgNhRXwTxi3ViP48XFEX/A2fz0LdfWEdxT62PCx9
 vkrych5Y0rWmc9Fupj39aRhVaaqEfwyA1d6bmqCJN8aBbWxmj/nQi1dwFmYHQ+3sP+Af
 H0qQl7c0/rE/JzY0XB1yMFMUa7egSfAZQMJV5qRFUYfN1dawu868Tr24sqaGmzN3WIQM
 xKo8pL1qJ8ndJk5DfVSW+oXyXMqZMs9Fwh8XSk/sHH9YCtix316Y3k/ufoE8dJVkbDs2
 Th/x696jbsgWnxcn2jzazjTSWcaR8gWrXDWmfHtR86Ra7KsceyMzC+zSZCfnjpfejl9J
 JF9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698677285; x=1699282085;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=enkdXsDQsvrVFAm4mm0Ogf+SLJzxgJmU8p9Qwbl4+Wo=;
 b=p9jIc7/by7zi/TtzN8N0pb371Voe/MyBGqVyGVIWHKDJVNn/fueCHsJllhmkvHAqTS
 zpzu45qUtqYXUny9gekFS3+aDVCZZchqPl3wdvBkdgf7PXGZvA28qe+0YXd+7WJFU5AL
 jfTSYvvsCSAo64ZtMzozf7w51ZSAdciKsDydeHPsXuLmhtf/0dCFW9p+TVQYDo6CabyF
 gq8zySw7zlyljaMXysSkelHLz0ZSTaODT8YVwiJEyq13b3Yok+KsJC0aFkH8jNcdhyJC
 8YB61wWtlgbazl2HUxoLjd24tV1Htx5myIW1ANk/DJlPr3jqQLY8W2pWNCe7uQLGyMCn
 LOow==
X-Gm-Message-State: AOJu0YyI90qZXRrRjzh8nfUFLQRWsaTV7HfxKZKtW/JF4Xe93GfpGnEB
 Kd6TMFJB0UQ390VISfjXZI0=
X-Google-Smtp-Source: AGHT+IG/MG/rrpdah/ML1HpJD57fgfKQ2HsIE4+LAp8dqAnywAERkk7eyN6VzRliHe2mFTLEGz7gDw==
X-Received: by 2002:a17:90a:bf07:b0:27d:1df4:26f3 with SMTP id
 c7-20020a17090abf0700b0027d1df426f3mr6625998pjs.15.1698677284839; 
 Mon, 30 Oct 2023 07:48:04 -0700 (PDT)
Received: from [192.168.1.11] ([27.4.124.129])
 by smtp.gmail.com with ESMTPSA id
 27-20020a17090a035b00b00268b439a0cbsm6065971pjf.23.2023.10.30.07.47.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Oct 2023 07:48:04 -0700 (PDT)
Message-ID: <744beb05-1327-401e-a961-edfe63bd8927@gmail.com>
Date: Mon, 30 Oct 2023 20:17:57 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display: avoid variable reinitialization
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 daniel@ffwll.ch, airlied@gmail.com, Qingqing.Zhuo@amd.com,
 alvin.lee2@amd.com, wenjing.liu@amd.com, jun.lei@amd.com, Samson.Tam@amd.com
References: <20231024181134.48066-1-bragathemanick0908@gmail.com>
Content-Language: en-US
From: Bragatheswaran Manickavel <bragathemanick0908@gmail.com>
In-Reply-To: <20231024181134.48066-1-bragathemanick0908@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 24/10/23 23:41, Bragatheswaran Manickavel wrote:
> The member variable enable_hpo_pg_support is already initialized
> and hence the reinitialization instruction can be removed. Issue
> identified using the doubleinit.cocci Coccinelle semantic patch script.
>
> Signed-off-by: Bragatheswaran Manickavel <bragathemanick0908@gmail.com>
> ---
>   drivers/gpu/drm/amd/display/dc/dcn35/dcn35_resource.c | 1 -
>   1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn35/dcn35_resource.c b/drivers/gpu/drm/amd/display/dc/dcn35/dcn35_resource.c
> index 99d55b958977..1fd9df8da09c 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn35/dcn35_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn35/dcn35_resource.c
> @@ -739,7 +739,6 @@ static const struct dc_debug_options debug_defaults_drv = {
>   	.disable_boot_optimizations = false,
>   	.disable_unbounded_requesting = false,
>   	.disable_mem_low_power = false,
> -	.enable_hpo_pg_support = false,
>   	//must match enable_single_display_2to1_odm_policy to support dynamic ODM transitions
>   	.enable_double_buffered_dsc_pg_support = true,
>   	.enable_dp_dig_pixel_rate_div_policy = 1,


just a friendly ping

Thanks,
Bragathe

