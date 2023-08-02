Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A8776CCD1
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 14:37:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD03710E02D;
	Wed,  2 Aug 2023 12:37:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3A3810E02D
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Aug 2023 12:37:06 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3159d5e409dso587095f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Aug 2023 05:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690979825; x=1691584625;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=jrSPn8uyBFzRlxR+Ji/34MvxQrN7UVymtJpqlJ09TOQ=;
 b=LhGQ8Ujrxun3Cl8x3JP5tCEBSn9XR8IAaa7hkvYRe9Ss1m9YPVHELYUxyQM5ZMtdiA
 T0qZdmi/3Q+h19quNandhvsRj1MVGldnputZWZBhe77Xd3hZnu1xBn4eQNyBkX+W3pjF
 nuQ4c96VjSU++8tUislZZ1eVxwd6lQdNyC0/jUN84X8mpemDTfMG1pYOUERUTi1Em1ot
 Xk3+0hZY+7UxobD7CIdp3JF8rPqBLUqEjF6NVAva4RAu6akZqrnGcQ+bnZkDchii8Acb
 C/zqWJS84HnMpmPmR7GcQAHtxvQpmYjYMJxVJYUPpGVox5Ds/0PXnoNNRE/5vUVZDQKj
 OiYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690979825; x=1691584625;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jrSPn8uyBFzRlxR+Ji/34MvxQrN7UVymtJpqlJ09TOQ=;
 b=GoZH6vDrpcYyyaJOFyb/2axbP0ZJpzxwWx2WThP0tzDLsiRtUpJyOw1+VP2l8pewSx
 YxRx70TQ3fhrqdHPD36Zrohh1oxCt4viW9/b4SBNFAAsDpdzejnvsVgMQ4ru4QmXbeBx
 u/gsJkcz5/yNWGWQUhTT3mbBjdKLsCTuqiru+pplM5iyi0hCK638ldaoBzABJ6B+a97D
 1DdOTH0SWZ7dACmuWpjW3xaYU8ziBQM7cZ7iLUSLfbkhRdlbT6EEFS2ggoUMm3xK0bNT
 tNoDeQL+bE5uPEWuXoKyOISbxDP/BTvcBrSMyEaOmZGXM5E/RaT9HPR0PSJVMumzK8st
 A5aQ==
X-Gm-Message-State: ABy/qLY6DfYRCGSFO7ItQSWcKQ980VLoihnpjlrM/KnSxydBTo55f3fm
 zS+3dIWlwcbErzA+IUR2g7ydgA==
X-Google-Smtp-Source: APBJJlEwph2F2iPAVAzMcuAz2CiigiGjwl6AbLLv8PVkzvqa+Q652tWVZe8/GW+lCGFBb18f92FqUQ==
X-Received: by 2002:adf:f108:0:b0:317:6855:dc24 with SMTP id
 r8-20020adff108000000b003176855dc24mr5085178wro.21.1690979824908; 
 Wed, 02 Aug 2023 05:37:04 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:c5bb:5b4:61e3:d196?
 ([2a01:e0a:982:cbb0:c5bb:5b4:61e3:d196])
 by smtp.gmail.com with ESMTPSA id
 n5-20020a5d6b85000000b0031455482d1fsm5081609wrx.47.2023.08.02.05.37.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Aug 2023 05:37:04 -0700 (PDT)
Message-ID: <c2644543-2e81-3351-ee1e-76f5f32c4ac5@linaro.org>
Date: Wed, 2 Aug 2023 14:37:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] Revert "drm/bridge: lt9611: Do not generate HFP/HBP/HSA
 and EOT packet"
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230802-revert-do-not-generate-hfp-hbp-hsa-eot-packet-v1-1-f8a20084e15a@linaro.org>
 <6cd079a4-2f5b-0169-cbaf-b59a72f1b32b@denx.de>
 <084ca94e-d694-878e-0646-f4c89043cd28@denx.de>
Organization: Linaro Developer Services
In-Reply-To: <084ca94e-d694-878e-0646-f4c89043cd28@denx.de>
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
Reply-To: neil.armstrong@linaro.org
Cc: Amit Pundir <amit.pundir@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jagan Teki <jagan@amarulasolutions.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 02/08/2023 14:28, Marek Vasut wrote:
> On 8/2/23 14:07, Marek Vasut wrote:
>> On 8/2/23 10:52, Neil Armstrong wrote:
>>> This reverts commit [1] to fix display regression on the Dragonboard 845c
>>> (SDM845) devboard.
>>>
>>> There's a mismatch on the real action of the following flags:
>>> - MIPI_DSI_MODE_VIDEO_NO_HSA
>>> - MIPI_DSI_MODE_VIDEO_NO_HFP
>>> - MIPI_DSI_MODE_VIDEO_NO_HBP
>>> which leads to a non-working display on qcom platforms.
>>>
>>> [1] 8ddce13ae696 ("drm/bridge: lt9611: Do not generate HFP/HBP/HSA and EOT packet")
>>>
>>> Cc: Marek Vasut <marex@denx.de>
>>> Cc: Robert Foss <rfoss@kernel.org>
>>> Cc: Jagan Teki <jagan@amarulasolutions.com>
>>> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>> Fixes: 8ddce13ae69 ("drm/bridge: lt9611: Do not generate HFP/HBP/HSA and EOT packet")
>>> Reported-by: Amit Pundir <amit.pundir@linaro.org>
>>> Link: https://lore.kernel.org/r/CAMi1Hd0TD=2z_=bcDrht3H_wiLvAFcv8Z-U_r_KUOoeMc6UMjw@mail.gmail.com/
>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>
>> This breaks LT9611 operation on i.MX8M Mini/Nano/Plus, so, NAK.
>>
>> I am currently using this LT9611 with Linux 6.1.y
> 
> Correction, 6.1.y only with the DSIM patches backported.

Well you'll need to keep [1] backported on your downstream branch,
this revert won't propagate to v6.1 stable anyway.

> 
>> in production and this is not acceptable. I also believe the correct fix is on the MSM side, not on the LT9611 driver side, since MSM incorrectly implements these flags.
> 

Since [1] breaks Qcom boards on v6.5, and [1] was added for v6.5 to make the bridge work
on i.MX8M Mini/Nano/Plus, it's not acceptable either to keep it for the v6.5 release.

Neil
