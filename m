Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9502F735F4C
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jun 2023 23:39:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0247710E08A;
	Mon, 19 Jun 2023 21:39:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20F5C10E08A
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jun 2023 21:39:01 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2b47354c658so27087851fa.1
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jun 2023 14:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687210739; x=1689802739;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NJqgFyZORxKSRICxsmBFhPlaldFyLWkexWK7bDGxjGc=;
 b=RPfDbbXupqzacz7KmZUEQIISSc1lhv+2xRsN7vCGYpBl6AXY9CbUmlVWhZ98RO3D42
 nVQ8K02IklHfRbbOREnhR5b8ttJtfv5xqS3zYzOKuo76kZCzNQQqoqeAO4AUV2DFuUzG
 DniqlfoxeWNQlHekVLs0UT9jbTxhIjD2aUk0Esm/2CsTRRKhZ0pD10m8d1ZG6AyGuYws
 YwK9aOTmhf+qQCZ6mDc8Dxyb5p3EEvQ6npsQ7e/ZtvUyZU2WEN8z+0PBX6gwIWBQi0qW
 fSyQdThWVI6RDHslTDs5eRZQoUcmG9jTevSVKtBGTZHvByvIDf6E+fV2/YAWve5/wkkh
 KfVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687210739; x=1689802739;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NJqgFyZORxKSRICxsmBFhPlaldFyLWkexWK7bDGxjGc=;
 b=lldXy+4jHNpQ3p/1x++A6iLxGYJcZ6NGdmVzH6PwD9x9E8dIbDZkg1oQDlyCDMN4YY
 Kpu5HdY6IjoaR9Xm8XCmZyEJMXsMeCjUoJBsvsdoq46avU4eHitEO4B5FAU4zp4axtv5
 gzPQx3ZnZZXdeskX631ESj1WOlMwUfvfrfypnI8xKX4NvugchjAdZhvAM99IIe/4fC/r
 4aNKMuQnhV376zAouwZoTWCGjx9eZusIPcr1eG3qBBAXMy+LIAE9gxh8hZwi5qZM0GIk
 jPKL6eZK2HPd/47dLNTkRXvPnjufavUj4ChNQSV7PowL1yCNpI7lFUzhJiF1MjsuYvmO
 oJ5w==
X-Gm-Message-State: AC+VfDysge1s+bXA02m65x+Bgp+arxQgnCjsYu1tUzs1OYCEfnVJqtC6
 gJGL+Crv4WpeRJ9tc0axbdmLTg==
X-Google-Smtp-Source: ACHHUZ7mho7mHSB6JCzN3pI1HKBCa5gj+wq/4VTVHdrMTAaqPwUmQrdQYLCZ6sPJApcpZkejhtLHCA==
X-Received: by 2002:a2e:9189:0:b0:2b4:75b7:edda with SMTP id
 f9-20020a2e9189000000b002b475b7eddamr2530334ljg.24.1687210739281; 
 Mon, 19 Jun 2023 14:38:59 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 e22-20020a2e8ed6000000b002adc2fe3fc8sm66717ljl.4.2023.06.19.14.38.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jun 2023 14:38:58 -0700 (PDT)
Message-ID: <c25ba108-1363-9c6f-3d02-2524ede7484e@linaro.org>
Date: Tue, 20 Jun 2023 00:38:57 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/msm: Fix typo in comment
Content-Language: en-GB
To: zhumao001@208suo.com, robdclark@gmail.com, quic_abhinavk@quicinc.com,
 airlied@gmail.com, daniel@ffwll.ch, sumit.semwal@linaro.org,
 christian.koenig@amd.com, sean@poorly.run
References: <20230618143813.15142-1-dengshaomin@cdjrlc.com>
 <20230618143813.15142-4-dengshaomin@cdjrlc.com>
 <610b47a2989976b9dae162ecc55ddc85@208suo.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <610b47a2989976b9dae162ecc55ddc85@208suo.com>
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
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 freedreno@lists.freedesktop.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18/06/2023 17:54, zhumao001@208suo.com wrote:
> Fix typo in comment of msm_gem.c.
> 
> Signed-off-by: Zhu Mao <zhumao001@208suo.com>
> ---
>   drivers/gpu/drm/msm/msm_gem.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

This patch doesn't apply. Please use git send-email to send patches.

-- 
With best wishes
Dmitry

