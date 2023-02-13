Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01EF66945EB
	for <lists+dri-devel@lfdr.de>; Mon, 13 Feb 2023 13:35:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BF7A10E5A0;
	Mon, 13 Feb 2023 12:35:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9357A10E5A4
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Feb 2023 12:35:33 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id ml19so31620739ejb.0
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Feb 2023 04:35:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=g6etP0PHoEzmwkAwU1sWyc/fLmfc1gwqL6wt4gHzdmw=;
 b=hnv0aANWv0LshJQhx6NxJdjMa9idzF2ChBnJpk4z4R8hie6sV8ZbP6dbf9ZIetFPYL
 7+21H4Ja7Kziwvjl7VrH3kNQxctWTHHf6OfVJJzWVOyWEMhlSCCTa2wfzjqHn1WtOfco
 /65cXuNQ29DgfUdbg2q7jJG/mInbyOAX9OIkUkWqu1ot08iOIzNTa9Vaos2j5ptJcGww
 Db0Z9soV9OGsUn8RIYthoo9d1Qj5EH5xO8JAqqHm647HGf2jUqtfosYyh0evnFO5cOzG
 +VrpB1B2iaiUatlxDG9tCiGOgGNxy0b78QGkBRSclusVBTs3vQqDv+M2cRT1ZxTBoExb
 kYCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=g6etP0PHoEzmwkAwU1sWyc/fLmfc1gwqL6wt4gHzdmw=;
 b=vjQ5e76J9dW98SYWWK3T+2zf1zWCuZtFG1XjJUjP4YbFnEfC3qAsU8HjOmUkWRa4j3
 YYeSUmD39+Aps+0P4ASgj3BG2G8jL0AuPbqdYJj7UKsarrtPfS7nOf4Wjv9/hUMcq+QR
 NW8ZqkyasGSm86/640baPJh5n2LWcjkHZYgdHBqmlTvNy3HJcz9SB0W3TGAduEDnKu4X
 /4cmecsKqLspK9sVRuAesoS90ChdUAQSZ1YSEAc0olvNkSsRcUSbRJMbmh/eHJV7UayW
 fZd9j2DIbqEuDiHCE/3dHNclKcZZM1HF+tWgL69sfdfa1XZAP+H1+ft1cKA7JbMQqgIL
 N8HQ==
X-Gm-Message-State: AO0yUKWq6W5LNRzKSf1S4m0xGa8uOAVzrHS16TVXcUFspjyfyzazF38Q
 dTmv/hnvRWFkZvbMPp+8vELjmw==
X-Google-Smtp-Source: AK7set/a4QxyKqE9KlCKpOjOcecOb57gmOGMtMJ0rcHamtTPFjtjef7xpvmMt4Hd8ptxbq3EdiB6DQ==
X-Received: by 2002:a17:906:5d9:b0:878:45e9:6f96 with SMTP id
 t25-20020a17090605d900b0087845e96f96mr24442385ejt.49.1676291732123; 
 Mon, 13 Feb 2023 04:35:32 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 n5-20020a17090673c500b0088aadc18b69sm6747375ejl.101.2023.02.13.04.35.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Feb 2023 04:35:31 -0800 (PST)
Message-ID: <8b8f61ea-8419-c4b5-0434-276d13fe3e39@linaro.org>
Date: Mon, 13 Feb 2023 14:35:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 3/9] drm/msm/dsi: Fix DSI index detection when version
 clash occurs
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 andersson@kernel.org, agross@kernel.org, krzysztof.kozlowski@linaro.org
References: <20230213121012.1768296-1-konrad.dybcio@linaro.org>
 <20230213121012.1768296-4-konrad.dybcio@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230213121012.1768296-4-konrad.dybcio@linaro.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Loic Poulain <loic.poulain@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>, marijn.suijten@somainline.org,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 13/02/2023 14:10, Konrad Dybcio wrote:
> Currently, we allow for MAX_DSI entries in io_start to facilitate for
> MAX_DSI number of DSI hosts at different addresses. The configuration
> is matched against the DSI CTRL hardware revision read back from the
> component. We need a way to resolve situations where multiple SoCs
> with different register maps may use the same version of DSI CTRL. In
> preparation to do so, make msm_dsi_config a 2d array where each entry
> represents a set of configurations adequate for a given SoC.
> 
> This is totally fine to do, as the only differentiating factors
> between same-version-different-SoCs configurations are the number of
> DSI hosts (1 or 2, at least as of today) and the set of base registers.
> The regulator setup is the same, because the DSI hardware is the same,
> regardless of the SoC it was implemented in.
> 
> In addition to that, update the matching logic such that it will loop
> over VARIANTS_MAX variants, making sure they are all taken into account.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/gpu/drm/msm/dsi/dsi_cfg.c  | 52 ++++++++++++++++++++++--------
>   drivers/gpu/drm/msm/dsi/dsi_cfg.h  |  5 ++-
>   drivers/gpu/drm/msm/dsi/dsi_host.c | 10 +++---
>   3 files changed, 48 insertions(+), 19 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

