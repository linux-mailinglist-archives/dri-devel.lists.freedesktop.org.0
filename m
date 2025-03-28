Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5DD6A7528B
	for <lists+dri-devel@lfdr.de>; Fri, 28 Mar 2025 23:46:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6251B10EAC5;
	Fri, 28 Mar 2025 22:46:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Xndxv0cF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com
 [209.85.166.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B15710EAC5
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Mar 2025 22:46:03 +0000 (UTC)
Received: by mail-il1-f182.google.com with SMTP id
 e9e14a558f8ab-3d46fddf43aso20799105ab.3
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Mar 2025 15:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google; t=1743201962; x=1743806762;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nqtWjpKQl0+Rceovy2PPRz2bVefezStJEzDQIoyhN5w=;
 b=Xndxv0cFbH0XI/1LsTpIQBsc+b0ocU/ULKIco9UoFMaj+tAJUOp/HyPfb38EYjPZCu
 8Rd8IBcoHLgP8YexImNE+f755/uy4OwJRkhU/jBLkptMcyDNDM5fsEJyEWDoh1MYXstc
 zwviKqUFIRoJ3w1N0LcPa5X8qNLOkIR+ClCLY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743201962; x=1743806762;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nqtWjpKQl0+Rceovy2PPRz2bVefezStJEzDQIoyhN5w=;
 b=JRAwUOLaFj4QDAS2fM2A2+Fi6atc0buw1WYu4jmbhnigDlseFXJVymhHSGlOpL/XQD
 Wc3tnzjQPGHWCn6wmJJFlgNiTMWlpdCGoS3cv0ugvJbK9L18K5nbCeoJ3aJizxaJ1Aju
 sooKlk2G1i5XDn1uxQf4O/W8/LEr+/4+7UjUBVE4pUptH9WfXKPcQGu34BEQUnby4QrQ
 v8ARcqs3JIOoNnj+vsG2pAR3HSeKKb08jLxwkkyqUxYi7F/iKN7YTIWdsGnqaGYoF7G8
 81XEVR6DfXWHqONdd1tPKCpLZkqmMMqPGiQIvU9zDRjdnaACLvCEO/D40DcYquG7jd7t
 6Ryw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXgPydxzpaDcKXTD283FX7kPzFVOUYUBpjVEbIG/QMgd0CsKQxzuDDUMRjPk4pdC+DUmSXw/8zL7IY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyf0760BaB1XcAdz535iafziLN4nc4sB+oBTsuaoE/VlQ7ZDKFc
 u/WEEMCsrakPdJ3UuSKBsaUuiCl7fArKyGJdQTdqj1vFczlTQmxi9ZuJWe8tVOw=
X-Gm-Gg: ASbGncveJIQuru3rI08PJqepcqdO7ywegieL2cL97HZs9PIYPq/JalORwQBwwunw6xr
 msEXjTQjyunqtVSrSHHpfKpFecdMwCl2uGkJiXrGh8loQAo4z/HMZVhiA0ChzKPrPLWcl/YtjMy
 BaSldCu2Zq+J2rpP4EqOd32UXY1cen4RQe92mq36pyN+eCefIt9IdiB5T4uLYhJ1dlXykxKOwt0
 kSJPb9r25Lhhxl6jyH+7jdWZjFPPX1WYKV229CV+CJEZ7mCP+K1Wot/W8WcGSp9f08weS1LUeNf
 Dhai0nUmFwiQoZgZ51PezWj/6sX43Vm+crdjP3cTqD1RBwhhzjuVo4Q=
X-Google-Smtp-Source: AGHT+IE8B0Y4+x7cusSExDaFtRYAJ4UtV2GfOT2Knpe2lYH3tt4pvG6kA/VEZg8rg2BDCxRFPuU0xw==
X-Received: by 2002:a05:6e02:1707:b0:3d2:b4ea:5f42 with SMTP id
 e9e14a558f8ab-3d5e0905e33mr16223855ab.6.1743201962227; 
 Fri, 28 Mar 2025 15:46:02 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
 by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3d5d5a6ce5fsm6852735ab.27.2025.03.28.15.46.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Mar 2025 15:46:01 -0700 (PDT)
Message-ID: <476c5bb9-79c5-40b7-bba8-b52fb244e90e@linuxfoundation.org>
Date: Fri, 28 Mar 2025 16:46:00 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display: replace use of msleep(<20) with
 usleep_range for better accuracy
To: James Flowers <bold.zone2373@fastmail.com>, harry.wentland@amd.com,
 sunpeng.li@amd.com, siqueira@igalia.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch,
 aurabindo.pillai@amd.com, alex.hung@amd.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel-mentees@lists.linux.dev, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250326070054.68355-1-bold.zone2373@fastmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250326070054.68355-1-bold.zone2373@fastmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/26/25 01:00, James Flowers wrote:
> msleep < 20ms will often sleep for ~20ms (according to Documentation/timers/timers-howto.rst).

Can you elaborate and explain why this change is necessary?

> 
> Signed-off-by: James Flowers <bold.zone2373@fastmail.com>
> ---
>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> index 2cd35392e2da..2d225735602b 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> @@ -682,7 +682,7 @@ static bool execute_synaptics_rc_command(struct drm_dp_aux *aux,
>   		if (rc_cmd == cmd)
>   			// active is 0
>   			break;
> -		msleep(10);
> +		usleep_range(10000, 10200);
>   	}
>   
>   	// read rc result

thanks,
-- Shuah
