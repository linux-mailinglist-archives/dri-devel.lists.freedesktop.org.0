Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B6E693228
	for <lists+dri-devel@lfdr.de>; Sat, 11 Feb 2023 16:53:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23A7410E333;
	Sat, 11 Feb 2023 15:53:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B37D10E333
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Feb 2023 15:53:48 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id qb15so20472715ejc.1
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Feb 2023 07:53:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JKZqBgVqI4hZV+NJ0GWGGIXdTylFyIHNhCHPHXw7djg=;
 b=EWTdEm8mpW0BRVkPX5dSRP0f9YcZmoGBVd5+gsFU3HS2MvT7Moy+skrgVpOEdX+CAe
 8BzELHOTdCTbgTtCgDcojDsByW/0sYhE6K20LWMcm5HpWM0YnY/wiktmPslbbYITe3W4
 1L0k9cPUdQYLHBjMVK79jsqNozZaJZroBvp0nKTbOJj2Uj1+Gc3E5Y3rr3dXUivLn/A+
 8AVDOKQknurlpGaQ4nOrgizjSilAnxqOpLNsgRSr0cMjBguaU2B9ydw3/5SpQXlfNnES
 P3b/umegQ0HkD0mmO8XBVmpw3r1SaqYJCKMMRXLj85Ej5K3vta0R93jR8S3G3xNiyIuU
 zbHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JKZqBgVqI4hZV+NJ0GWGGIXdTylFyIHNhCHPHXw7djg=;
 b=6UqBPlPeeiM56akwzzo4lEzeXeq2BrPDefYCOkX02R7k5Pbi/fJC7Qose5kgHitNJo
 HGcFP1JElmY/ggaKx5YMzKbSRbyHdStd18O3wU7BL7bQwDaSaDfHRoOkh8YYMTfEhC39
 5fsxKCPT7u+U02cHdybbhJQIa/nEndUzKNNQIQphtHyZW0MAdRj97wKlEKL1K6HICZR1
 q9FUCiySo/hMEvLANsoeaRJQ4JagRR+VNES1H3JUVC/VjtnpBeArlmy/Z29SsOUKos/7
 YLnwHr7ar1ZXB4czCICvKghDivxnEPeZxkQMrhjgC6IW0J3crvuHSODtXB6GEX+QhPON
 XFwQ==
X-Gm-Message-State: AO0yUKW59i6UtWKxZuJm3LUwOWFwL6T/CEFP1iZO4x2Kld5jI71t+DId
 57Y2hyp+3L7ZaN7MVAWGPR1P0A==
X-Google-Smtp-Source: AK7set9FO7zB2GUeBRC4Ham7KNZJwN9kCt+a12XisjpCuhDH33RtTaoh6qneKat85u/e1+crcLlc8w==
X-Received: by 2002:a17:907:7e98:b0:872:6bd0:d2b with SMTP id
 qb24-20020a1709077e9800b008726bd00d2bmr25894167ejc.45.1676130826621; 
 Sat, 11 Feb 2023 07:53:46 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 25-20020a508759000000b004aac33c1f4fsm3893134edv.14.2023.02.11.07.53.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Feb 2023 07:53:46 -0800 (PST)
Message-ID: <ed8807da-b0b2-b652-e0eb-937aec916749@linaro.org>
Date: Sat, 11 Feb 2023 17:53:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 08/10] drm/msm/dsi: Remove custom DSI config handling
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 andersson@kernel.org, agross@kernel.org, krzysztof.kozlowski@linaro.org
References: <20230211115110.1462920-1-konrad.dybcio@linaro.org>
 <20230211115110.1462920-9-konrad.dybcio@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230211115110.1462920-9-konrad.dybcio@linaro.org>
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
Cc: Douglas Anderson <dianders@chromium.org>, Vinod Koul <vkoul@kernel.org>,
 Loic Poulain <loic.poulain@linaro.org>, linux-kernel@vger.kernel.org,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, marijn.suijten@somainline.org,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Johan Hovold <johan+linaro@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/02/2023 13:51, Konrad Dybcio wrote:
> Now that the only user is handled by common code, remove the option to
> specify custom handlers through match data.
> 
> This is effectively a revert of commit:
> 5ae15e76271 ("drm/msm/dsi: Allow to specify dsi config as pdata")
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/dsi/dsi.c      | 4 ++--
>   drivers/gpu/drm/msm/dsi/dsi_host.c | 4 ----
>   2 files changed, 2 insertions(+), 6 deletions(-)
-- 
With best wishes
Dmitry

