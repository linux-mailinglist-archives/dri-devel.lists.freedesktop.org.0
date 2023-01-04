Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B47565D001
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jan 2023 10:54:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E84310E529;
	Wed,  4 Jan 2023 09:54:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8BB910E529
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Jan 2023 09:54:46 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id bu8so621859lfb.4
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Jan 2023 01:54:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4lGymOcmvjztFSrsDIPPnkc9ypwqNV4szFQWVAo+Nv0=;
 b=wrLrTmawq1oU2fiT7/gDOjYH3EBDHAg0Zf6LWP+1d6Jkwxtwx2XoB4DxXq11DnuHcx
 qtaOQkktOqmZVAAyMfdpPQuWAzMS6wyD3Hu64VAMmRaFwLwkuxT287PQ/bD+qmxsfyJR
 lSkq225UmE1e5sCSd8w884NWquG7X8Vk3CrKOtk2WZ8jfl4CoopoDY8l193ZIpJ4I7SU
 3SSL1c9e0J2QlylIpiYm9jrw75H94t5otKYVv2/w4w7CSaZhlfYuBALQt0L6fGI/6loI
 yfm8uJxKCeiMlNTvsZwXN4fcPbRw9872X/ZsignjBA3pmEqDf702JkmVPIcZ4kidgaMK
 iT5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4lGymOcmvjztFSrsDIPPnkc9ypwqNV4szFQWVAo+Nv0=;
 b=vU15yUySToBRzzdBDLP9TDWOPkCBmcAhnfIyqFxi7mqFVIQ7Mc1TC9GsSpB83yVF5+
 1jDR3CNBncL54TcRzeJ/WpxEAPVJg7pk7ZLIDn2nTV8r8PF7aAqMOVwZcZyklNkg5ZFX
 q04tz9F0GZAENvNHPrqQ0J6SMQNyKdCNhwOr/TcvvFUpl05XDCoZgHJ1utgmDIQmgLjG
 rK9eASzBCI5RYuC9w2d4mNnJbqdKlm+Ym38Voa92YfKxfvr346kNKM+iXmbVOAGgE9iC
 rYmW16qFAaAoEoveIe8q1tmgaj+hEXA2pgeZGGnqevq4OwHQbvVOCPfbwFnWIaZJuoQg
 t0WA==
X-Gm-Message-State: AFqh2kqfR5hs8YQtI2O9HMygwWJdmJIa6481Z2UqZnDTPZtSH+dteap0
 Z+cw0HVknjSNhqILmqIl/8NFWg==
X-Google-Smtp-Source: AMrXdXuMRvcW9cAuZpYschkUp+WliOChT7va8boh/7yy0fIGJjXZrFJ0PPnG4SqQ6e1hWEgzSodGNg==
X-Received: by 2002:a05:6512:33c4:b0:4cc:53e2:5387 with SMTP id
 d4-20020a05651233c400b004cc53e25387mr287330lfg.50.1672826085086; 
 Wed, 04 Jan 2023 01:54:45 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 u5-20020a056512040500b004cb0d7804a7sm3293699lfk.192.2023.01.04.01.54.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jan 2023 01:54:44 -0800 (PST)
Message-ID: <d34852d2-3c6f-02fc-280a-d679600a32ea@linaro.org>
Date: Wed, 4 Jan 2023 11:54:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 6/6] drm/msm/dsi: add support for DSI 2.7.0
Content-Language: en-GB
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonathan Marek <jonathan@marek.ca>
References: <20230103-topic-sm8550-upstream-mdss-dsi-v1-0-9ccd7e652fcd@linaro.org>
 <20230103-topic-sm8550-upstream-mdss-dsi-v1-6-9ccd7e652fcd@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230103-topic-sm8550-upstream-mdss-dsi-v1-6-9ccd7e652fcd@linaro.org>
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 04/01/2023 11:08, Neil Armstrong wrote:
> Add support for DSI 2.7.0 (block used on sm8550).
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>   drivers/gpu/drm/msm/dsi/dsi_cfg.c | 16 ++++++++++++++++
>   drivers/gpu/drm/msm/dsi/dsi_cfg.h |  1 +
>   2 files changed, 17 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

