Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF5F4808EFB
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 18:46:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4185010E202;
	Thu,  7 Dec 2023 17:46:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1045E10E202
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Dec 2023 17:46:33 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-50c04ebe1bbso1010568e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Dec 2023 09:46:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701971191; x=1702575991; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nGUmHRmln8DP4EE62sw2lHmfeRIdxm/F82mL/B18p/E=;
 b=eXVHwbVoad1j24sIcKBF4FntijUQNxhZTEuC/cME8lf2uczGWt4i4STJ84bHcY5yoZ
 9V5CWQKV3K/cE+tXsxKzvte52YGtuF2b67AD754QtkVJ114ziVgoeENlwB1LrP/uCL06
 i5YGneIYay8DL4bQJm9OZCX/ByMgmy/jYI7mj278Fm7WJo3AzAY1jJ4l1xhkntoGD6O9
 561jGxV6hBvsWUu7K/EJKwqDOfeUoReGYke6plj9DIXUOqLT3MksdbNzxzm/GEE8NiTA
 asnhZsh82d4wvTHFM0gnD/5vOSflH96r0NY7rb39dU/jSyMM4skNlGnDtz6Zj8GkNg2e
 8PMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701971191; x=1702575991;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nGUmHRmln8DP4EE62sw2lHmfeRIdxm/F82mL/B18p/E=;
 b=T+UQ5VQYiPjoFo+9eJI8rZFDbV80IHU/osnxiNKa7/+C2c0HlwWN1TjyQeTy2PYweT
 hnyTxgFQNEpEdd5hUhU0aAqiRrXn1RcpW/acEdWLpxGIp15FmNewohz0s1xqmxUlWuup
 5TQtur4x/NDm+7KFsT5v4f5zx04ZKG0RZRlYGKHwzb1tHCFeHGGgIjyCq8QqQw3aqX3S
 ssTyy8GjhJ2erPRO41MXtbU3dMWKFNTHCkzw8Mlhhje30LSABTOOsNrgituImIecat6T
 EzhoQGnY14H3e39LwtNCoIqYqix/KEkPyxcxWPmwlpCI/U6O4488vHpJ43FHnA7arvTw
 4+BQ==
X-Gm-Message-State: AOJu0Yx9wBQUFgl1rEbeqUHzNhKA/ymNqd1sr6eox11XRfxSyfTkui0y
 0kWQf97V+TKALrogIY+18pFFYA==
X-Google-Smtp-Source: AGHT+IGId3IiWKAJbXeNT1pFpXcM//meJSbjrhj6lRBl8HMJKQpzFOSvyCV90rS4L6aJzvAqrhw9pQ==
X-Received: by 2002:a05:6512:1089:b0:50b:e52a:3099 with SMTP id
 j9-20020a056512108900b0050be52a3099mr2028897lfg.32.1701971191012; 
 Thu, 07 Dec 2023 09:46:31 -0800 (PST)
Received: from ?IPV6:2001:14ba:a0db:1f00::227?
 (dzdqv0yyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::227])
 by smtp.gmail.com with ESMTPSA id
 y17-20020ac24e71000000b0050bf4b084c0sm6275lfs.164.2023.12.07.09.46.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Dec 2023 09:46:30 -0800 (PST)
Message-ID: <ce2a739b-dfff-4913-a76e-bc99a22f7d7f@linaro.org>
Date: Thu, 7 Dec 2023 19:46:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/bridge: aux-hpd: Replace of_device.h with explicit
 include
Content-Language: en-GB
To: Rob Herring <robh@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20231207162501.2629952-1-robh@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20231207162501.2629952-1-robh@kernel.org>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 07/12/2023 18:25, Rob Herring wrote:
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it was merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. Soon the implicit includes are going to be removed.
> 
> of_device.h isn't needed, but of.h is for of_node_put().
> 
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Rob Herring <robh@kernel.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/bridge/aux-hpd-bridge.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

-- 
With best wishes
Dmitry

