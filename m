Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F531A5EFF8
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 10:54:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75D3110E09D;
	Thu, 13 Mar 2025 09:54:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="gAs5AXjC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEB0C10E09D
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 09:53:59 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-43d0618746bso4447205e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 02:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1741859638; x=1742464438;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bkj3D7HWqdTM0cPpPrir4nDCLwOAsHNRg+iHEHjJvgA=;
 b=gAs5AXjCvukuClktXklV5bAyETFwKIGGEr2J31q12nGpGSedBWMKz7VSNB29AT0fW9
 KuwYGWj2pq/wkqnm3Xwo5Pz1hEufhRuejez6XGTJBGQtOsx/q6POV7oq9HM7MJP3F684
 7H89AS2wMgmLIVx+XFQb34ufotgzGicxJz9b59TkwnnQj6a17L54vIF+2HINdSIXaSui
 tJeAQEAbBX1k3O8//rXowb9YbtRbElYscXvsSA19VpW4e7WNGxMbszHqB+ZUQ9C98lnk
 W2EasXG8nARlh+rHCQY3/zh8A0onOPoSpDTHujy26tfprwWrrxzAyMPPhMfScRljb3rl
 6OQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741859638; x=1742464438;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bkj3D7HWqdTM0cPpPrir4nDCLwOAsHNRg+iHEHjJvgA=;
 b=AegvLIPjsQQT39b79nSk5vQ1Y5uccBPdQEJLTs1RCtf6qy6iatEt5vVX+TgAhIYJWd
 Th33MeKULTQBKmMO8XCpp0ozswWpsJdo8SgRJIAwkNG8WLPLaS4VmGtaItkJVPO6zXXS
 D7vFD+/3z2SvEViZideH+cCChQflFB3ZDftQYP1hX6anK0vf2708l46VM6l0QBQ7mqnC
 ImtJIbW++FBiSsvcjoYSXEbd7iGzMtf1/o1x/73FtnIZHTCwurL1ZNgQ680i+YR2xFmp
 ypvN6hrngQZPKoKg6PJHDoUqzaUu+cpxn8U3Onz6t/ZaHWsJcon9W5CxjQ1Xyz1606KZ
 tR6Q==
X-Gm-Message-State: AOJu0YyzLareeglym3bPaOwo2jLpj+ZZQO+z9WGMLGsd8wCA4gvgH3Kt
 WjOBucZZClNPZlXs1zUnKY/XZfeoVyswtlEwNVUcA7vaQtGvFRz1aQ2G7U0bsUA=
X-Gm-Gg: ASbGncsv0F/YCGQfPTwXYgy901/EB4Y5bJ/hzAVrboLy42LgnZxOBFt07mPf1oWNa+O
 Cn3mBncR8qUkVT0LlTQXcdABU6NLbFdmnFfVrIOleY6WJglZrGyoqtvD8B6NpHj6b86FVmgc14d
 weV083w+VPpA2iqYEELZsPPeOEiEyWEsqBnXOOrEoQHn54Lv7tcBwNcFq8FLIKZ3WpqxhB7MHYl
 wxBx8BC2wBngofYY2N0kdotacwcpgOwbyUwimLL88Z8kXKSm2blluLclcm62vYX5ClTQzpwnC4g
 RtcJuQSdarmvN2sW8sbso4DzMTxpz0ql2zKLuwe0m1PEEwe92SEontdl09bVASSQOt+t6KA=
X-Google-Smtp-Source: AGHT+IGFah8rosyfcYtPjUa18Cm/2jw3dX6OMmMtmKOZgN/CnODc8pdsRob3xheHOpbGu6piHsVtOA==
X-Received: by 2002:a05:600c:3b10:b0:43d:47e:3205 with SMTP id
 5b1f17b1804b1-43d047e37d8mr105284545e9.11.1741859637901; 
 Thu, 13 Mar 2025 02:53:57 -0700 (PDT)
Received: from [192.168.0.101] ([90.241.98.187])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d0a8d1666sm48277205e9.40.2025.03.13.02.53.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Mar 2025 02:53:57 -0700 (PDT)
Message-ID: <0e3c8abc-7ccf-4a02-bec2-ddb0c7276d9d@ursulin.net>
Date: Thu, 13 Mar 2025 09:53:56 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/sched: Remove kthread header
To: Philipp Stanner <phasta@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250305155326.153596-2-phasta@kernel.org>
 <20250305155326.153596-3-phasta@kernel.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20250305155326.153596-3-phasta@kernel.org>
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


On 05/03/2025 15:53, Philipp Stanner wrote:
> The kthread header doesn't need to be included anymore. It's a relict
> from commit a6149f039369 ("drm/sched: Convert drm scheduler to use a
> work queue rather than kthread").
> 
> Remove the unneeded includes.
> 
> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> ---
>   drivers/gpu/drm/scheduler/sched_entity.c | 1 -
>   drivers/gpu/drm/scheduler/sched_fence.c  | 1 -
>   2 files changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> index f9811420c787..e55b98af8a50 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -21,7 +21,6 @@
>    *
>    */
>   
> -#include <linux/kthread.h>
>   #include <linux/slab.h>
>   #include <linux/completion.h>
>   
> diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
> index e971528504a5..d6239e015b66 100644
> --- a/drivers/gpu/drm/scheduler/sched_fence.c
> +++ b/drivers/gpu/drm/scheduler/sched_fence.c
> @@ -21,7 +21,6 @@
>    *
>    */
>   
> -#include <linux/kthread.h>
>   #include <linux/module.h>
>   #include <linux/sched.h>
>   #include <linux/slab.h>

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Regards,

Tvrtko
