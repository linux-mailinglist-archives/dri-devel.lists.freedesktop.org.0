Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA73700D3C
	for <lists+dri-devel@lfdr.de>; Fri, 12 May 2023 18:44:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEA7B10E1FD;
	Fri, 12 May 2023 16:43:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85C1810E1D6
 for <dri-devel@lists.freedesktop.org>; Fri, 12 May 2023 16:43:55 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4f139de8cefso53296618e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 12 May 2023 09:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683909833; x=1686501833;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oQ35jiD0iHCimmXNvqE7wf5xzhSOyJCookuzUyurpLM=;
 b=LmEGhTe2a0TlygbG0pgEn3ULmATOXb0sCfMtBAEgM5W8HG+6IAO5PVCooWsF9UEups
 c7QodB3vbWifw2arGdJiSkUy+9wDhkMxw3zwR3IRHGWoootxT9mc7amQycF3LDRUdFHZ
 jEI3pSuMaamdcLeQJgKQXHIEgGwNg8gQZkxiIzxDAdl4u0/mTwG6yeSwGEC8yR6R2GI6
 CujVaK1xb9uvKUYlGGTcvPHUuaIOuWkuaT3hGJbbmPAB/upM9nCpfpbRGVRw9EsCrVea
 obaH884kC3q3FsXANPfe4kS18rAryzP+5Wa/CwJLJhmu1D8Yv+1jd+tsjMJCtcCs1a6N
 93Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683909833; x=1686501833;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oQ35jiD0iHCimmXNvqE7wf5xzhSOyJCookuzUyurpLM=;
 b=ZXsAr725M0jPuyGHNQO5cDUmzpOVsW1fE1YDCA7Okg1Vnwko2xlK8o0m+fk/uXnEsb
 VFHa1iJkjyTYI3BEGM3ROKqL2C/Jor1O01iyRLyghALIViX/xBy8ykdN/U0lpfosANdl
 bvgKl8e4MiLqPEzPzblzENgTTqHUoxXHRIDNtC61f6OQSR/XSlnjCTUX1YBVdpLayR+/
 DCZTlmFNea78WSJLn8AX43ZQiQRY2fOWw5X3gGK6NzBgoyZvilYFVh4/HNYmR8avqU8f
 VsDEWvxjLTpZTvHx90B6mo4fEjsNCMLJUCEOi0PMDAgCu85hWGu+9NGjr+YCgPKovkov
 H8Kw==
X-Gm-Message-State: AC+VfDyICJIpPXD5Jr4y0gpy4gdBsrd7l1blSE8xGeGel4QZc4SLLras
 wHj7CO2M+JlQlL36tM7VN6yoTw==
X-Google-Smtp-Source: ACHHUZ6Knr8V9h2tzeBW26Liibmojqhi318dz0i7nIVAWX3Oxrywq7eHYWTvTbXUamXXHscf7fgd4A==
X-Received: by 2002:a05:6512:3f19:b0:4ec:83fd:1599 with SMTP id
 y25-20020a0565123f1900b004ec83fd1599mr4095277lfa.33.1683909833320; 
 Fri, 12 May 2023 09:43:53 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 o14-20020a05651238ae00b004f250513215sm1513284lft.198.2023.05.12.09.43.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 May 2023 09:43:52 -0700 (PDT)
Message-ID: <ddb79cfb-8ddd-5ca3-e133-465518e5e973@linaro.org>
Date: Fri, 12 May 2023 19:43:51 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v7 0/8] add DSC 1.2 dpu supports
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, airlied@gmail.com,
 agross@kernel.org, andersson@kernel.org
References: <1683827607-19193-1-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1683827607-19193-1-git-send-email-quic_khsieh@quicinc.com>
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 marijn.suijten@somainline.org, quic_jesszhan@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/05/2023 20:53, Kuogee Hsieh wrote:
> This series adds the DPU side changes to support DSC 1.2 encoder. This
> was validated with both DSI DSC 1.2 panel and DP DSC 1.2 monitor.
> The DSI and DP parts will be pushed later on top of this change.
> This seriel is rebase on [1], [2] and catalog fixes from rev-4 of [3].
> 
> [1]: https://patchwork.freedesktop.org/series/116851/
> [2]: https://patchwork.freedesktop.org/series/116615/
> [3]: https://patchwork.freedesktop.org/series/112332/

Please run the series through ./scripts/checkpatch.pl --strict. For this 
series it reports tons of issues with the mixed indentation, 
whitespaces, alignment, etc.

-- 
With best wishes
Dmitry

