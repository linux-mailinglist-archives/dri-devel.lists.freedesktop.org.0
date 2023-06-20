Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8184736B04
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 13:32:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE5CB10E2D1;
	Tue, 20 Jun 2023 11:32:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F58810E2C9
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 11:32:02 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2b4790ff688so30995851fa.1
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 04:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687260720; x=1689852720;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=A713VP1miYx4+izRL/fshmdCGqW1R6uuzjTJsyEBlBo=;
 b=jl4pD3kF0tm7QmDvJr2zbmpLqOxfCVocE5kHXW0BC4xP9WCCzZIp1fQe2fwsdQlE69
 zAR7GwYN9TdOoPPeD7aMR/l4JeqIODkNYwQCTifkFKAAySlP1nmti/Q2wzZkXE+X7Lck
 agoHtVPkfeqYK/FrJlVKulpZf2uJcN/RJx5tx21+sqnZU4j1RNkvfM78VxgdeB0+4RCr
 eaw5FPigoI+C+YgSvn5H+lD2jaxNN63OL5PPvkIVhFALzEpMJ1/wC0m3sOyD3pc25Hkv
 /zuOGyCmj5pkVU5vsKLo/iaBfr3BN3yX01OcKhOHS5uPeqrd7PtCbfVqFjvPw/6ZfypV
 KVzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687260720; x=1689852720;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=A713VP1miYx4+izRL/fshmdCGqW1R6uuzjTJsyEBlBo=;
 b=hIe7Or5SV3Irc9mVGV6pvd+16UBRaTE5zAufMCIGAM7h25iiXW8XaExNAulGMieP0c
 ppqmmhnBSUB43+Bqyk2jFAe/g5v2whIlMNMZSCoDcqOY2TubB4iMgjD2g1MitHyskGlS
 kYYCc1kTY05Xn+QBsTkhOQr6XhG3HzmVLWMfJDKJ9Wj2iRXW8YPOoSJv/5+Sb/LDzXOl
 3cf1tXeDPX2NoyaNQt0meI77rCQAcH/FYCuu2wx0OApEOt8b4Ljw9cheDTvD6myoXpOq
 /rsQ/hCkhO7B+udZgiU0y77A+LoEN5kQ8ZTKJUJ9PBHA1v15qSYAa5m/B2wnuGlxxzRJ
 JhLA==
X-Gm-Message-State: AC+VfDy5CtJvmv7ZUZUsinTq0AGG29i05biB5oaBJPx+qk0QQ9cQlWoS
 6Fk+sykgCNEo+k6KNHv7cwBVjQ==
X-Google-Smtp-Source: ACHHUZ5ZiHncGJDt4FdxRbpjnbkarvrTFJypLWFMX2swHPEiI3dYNbw/zJsdn242Z5m5uxes9LGzow==
X-Received: by 2002:a2e:b0e1:0:b0:2ab:19a0:667b with SMTP id
 h1-20020a2eb0e1000000b002ab19a0667bmr7270502ljl.0.1687260720414; 
 Tue, 20 Jun 2023 04:32:00 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 e3-20020a2e8183000000b002b1a4238c96sm372656ljg.128.2023.06.20.04.31.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jun 2023 04:32:00 -0700 (PDT)
Message-ID: <71f30a49-6d21-8ee4-1d35-545f0d7a1c46@linaro.org>
Date: Tue, 20 Jun 2023 14:31:59 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/2] drm/msm/dsi: Use pm_runtime_resume_and_get to prevent
 refcnt leaks
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20230620-topic-dsiphy_rpm-v1-0-446a7fd0ce43@linaro.org>
 <20230620-topic-dsiphy_rpm-v1-1-446a7fd0ce43@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230620-topic-dsiphy_rpm-v1-1-446a7fd0ce43@linaro.org>
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
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 20/06/2023 14:29, Konrad Dybcio wrote:
> This helper has been introduced to avoid programmer errors when using
> pm_runtime_get, use it.

Please expand to mention the error kind. Also as you are at it, could 
you please add an error check here?

> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> index 9d5795c58a98..0a8e1dd4509e 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> @@ -516,7 +516,7 @@ static int dsi_phy_enable_resource(struct msm_dsi_phy *phy)
>   	struct device *dev = &phy->pdev->dev;
>   	int ret;
>   
> -	pm_runtime_get_sync(dev);
> +	pm_runtime_resume_and_get(dev);
>   
>   	ret = clk_prepare_enable(phy->ahb_clk);
>   	if (ret) {
> 

-- 
With best wishes
Dmitry

