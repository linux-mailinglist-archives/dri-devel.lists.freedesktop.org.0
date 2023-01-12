Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E57667F69
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 20:36:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF70510E1C1;
	Thu, 12 Jan 2023 19:36:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31D4710E1C1
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 19:36:31 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id y25so29901776lfa.9
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 11:36:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QP7ZDXy/vz6h2E8Aw8jzhMKk5b2tVMVMs8kkY7DjRxg=;
 b=VRa1lYmLZwBt9u8EhEFY9jOztdyhUc0rbhIsKErJjegBmGKvqae+ioHuWXiDv8ojQs
 VlENQvWkzosriREEEtozgXWWfl2TYj+fITtabr02X4YmTjsxazE8spp0ZSVPe17AF+0X
 Kf++ghoP05TZk5uCbVqQ4pz8Ihs3X6acl8/V2BC9zwxAM7bcjHXKeSHrYOXCD3wmXeZX
 L4vzc9sup3I3A+2RRNz29LyV3BXZWW9cdvn1IgEczE5Hsv/XyXDC0rNvAl0kQsgdRV8O
 2fpL+QlmoVN5qFyfEgD9on8glRvlVvMVbwnRpaFg9M06xeZiV+rObea1NNJzF+hKYPgZ
 n4/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QP7ZDXy/vz6h2E8Aw8jzhMKk5b2tVMVMs8kkY7DjRxg=;
 b=Z2fLKXdKZiW6bsPCmi5lWtR5OwxVXaQeb+wAjf0NSVdqFlIKTiaXCzYdkRcA3YIq0g
 lLXZ2EUF6spr6LJ0pzQ/UuaIin0XltJRdq/U6OqewlFenhEN6AAEVA6R9ABOHgIm3ESh
 GqOxHUiFUE7JuMQ3W2iOXDDuReiTQMT/DjDZAiqcL8Dx3stu415dBWsGt42hIQLzOmHD
 FOrDB/HMD/zPXFWCEJX5uJxYIDQkVY9rwDXqbKEPhNwsVIaIN/TAbiO8qf+V/0cEx+An
 iNIXZkugxRXMHm84c9D5he7qVs/8rxHSDzMK9DyO8mjTwNaMRhTrBYvf7GEnqgw3QpCw
 BTfQ==
X-Gm-Message-State: AFqh2kqMt9PBl/Fasl2pQZGNpYkGz3SW3A1VP7uKgyGDotkTew+GeMeo
 z8NgBV39pjL62HR8jLfj272XuVijx8j0+VEo
X-Google-Smtp-Source: AMrXdXuCP2iZ9ad22QlH8IWK4c8i8Rc8dMqOQZuciPiR9xdgK9SnFECFIPl7JvZMmqyyu5q35RCHjw==
X-Received: by 2002:a05:6512:33c4:b0:4cc:53e2:5387 with SMTP id
 d4-20020a05651233c400b004cc53e25387mr10413221lfg.50.1673552189189; 
 Thu, 12 Jan 2023 11:36:29 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 k17-20020a05651210d100b004ab2cb8deb5sm3403247lfg.18.2023.01.12.11.36.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jan 2023 11:36:28 -0800 (PST)
Message-ID: <790207ad-9184-577a-ed0f-55e04b26aa09@linaro.org>
Date: Thu, 12 Jan 2023 21:36:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v4 0/3] add color management support for the crtc
Content-Language: en-GB
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 Kalyan Thota <quic_kalyant@quicinc.com>
References: <1669021695-4397-1-git-send-email-quic_kalyant@quicinc.com>
 <167330408778.609993.9217470869804308069.b4-ty@linaro.org>
In-Reply-To: <167330408778.609993.9217470869804308069.b4-ty@linaro.org>
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
Cc: robdclark@chromium.org, dianders@chromium.org, quic_abhinavk@quicinc.com,
 linux-kernel@vger.kernel.org, quic_vpolimer@quicinc.com, swboyd@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/01/2023 01:43, Dmitry Baryshkov wrote:
> 
> On Mon, 21 Nov 2022 01:08:12 -0800, Kalyan Thota wrote:
>> Add color management support for the crtc provided there are
>> enough dspps that can be allocated from the catalog
>>
>> Kalyan Thota (3):
>>    drm/msm/disp/dpu1: pin 1 crtc to 1 encoder
>>    drm/msm/disp/dpu1: add helper to know if display is builtin
>>    drm/msm/disp/dpu1: add color management support for the crtc
>>
>> [...]
> 
> Applied, thanks!
> 
> [1/3] drm/msm/disp/dpu1: pin 1 crtc to 1 encoder
>        https://gitlab.freedesktop.org/lumag/msm/-/commit/a4d6f8253645
> [2/3] drm/msm/disp/dpu1: add helper to know if display is builtin
>        https://gitlab.freedesktop.org/lumag/msm/-/commit/4cb6b1eebb92
> [3/3] drm/msm/disp/dpu1: add color management support for the crtc
>        https://gitlab.freedesktop.org/lumag/msm/-/commit/c48c475bd75a

These patches break sc7180 in a bad way, as the SoC is short on SSPP 
units. I'm going to carve these patches out and wait for better solution 
for the color management issue.

> 
> Best regards,

-- 
With best wishes
Dmitry

