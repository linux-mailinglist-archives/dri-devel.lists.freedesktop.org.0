Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0170859CA22
	for <lists+dri-devel@lfdr.de>; Mon, 22 Aug 2022 22:36:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD807A22CC;
	Mon, 22 Aug 2022 20:36:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4B6BA22B1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Aug 2022 20:36:38 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id be9so8954315lfb.12
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Aug 2022 13:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=8D3kUn5fYBM4V+Qs+cFN60c+8X0EDIzJuQL8ZIXGtI0=;
 b=crXnr7WSIJwe1LInUIsK4LNFPOGh5mN+5s2zzq1nXujtNd3RRj/DRM3kLgyM/gi6lu
 xbfXCwDKH58rWlCZOt/t5D8Boo65PkGx2s1dfYJAn+PRBCzHRfRY5+O9CmHk3fx9Zn2y
 aPzxUldwe/F1sOF74kJS1PGBASzKpk2CuHyyw8L3tCn8B8xb/UScZHDs8FGG/UvrmN4V
 Ke/+fqHL68cGgUH13Tx8SW4t0W2vGeq5CL/x8GQJBwOgtCaIbTvfiWtdDvSdTrCR8vcL
 xCv4KsTq/PedsIS9mrXZv/lYHHnyIu0hZyAnRhNdf2LAv9AY1yUJwbNZ4l7Se25sPw7O
 VueA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=8D3kUn5fYBM4V+Qs+cFN60c+8X0EDIzJuQL8ZIXGtI0=;
 b=sc2ZuMo/G3xQPow80MiKPbJfqLAuoVXR0qRON7FRNiFOK9UVyfRSKLrEUg013nya2O
 UG+yANaiRmQIN7NNY+NiZ+mNciE8bmmMpGWACKIOrmrXBeULyxEotR/kePNe//tLQvO4
 pwXtxZYz/REmVVKRTeJAKfTUg2Hn6aK8bSK4QsuQh5CUGjMoVGD8AZtNgFzOF7fnPnMg
 Fh66LSmjjhatz04lddPk1YjECnWnz6f1VW5lvpvCYkOerZIB4jDR0u4LFnnKHcB5atV3
 4j3NUGJUN2C2/0uAdPCNZ595De6/veW3tygExTC1E5BqAJ9jye6gQ7Rti/QhA49zLy/l
 2HhQ==
X-Gm-Message-State: ACgBeo0jc8Ru5S8RAA8c29YPORYA96l2GN3boGAJAxDmVIZhTxL4b8zN
 mNBwoUb3lEmXxpKI/GcR+lkSQw==
X-Google-Smtp-Source: AA6agR5cdOIA5bjk6MSUS24/EuVsIoVixrTAZEkulSiVqyuG5sAd5QPCKb+kYXxThno3+OKHwkiEFQ==
X-Received: by 2002:ac2:4c55:0:b0:492:d91d:363f with SMTP id
 o21-20020ac24c55000000b00492d91d363fmr4737919lfk.116.1661200597302; 
 Mon, 22 Aug 2022 13:36:37 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 v3-20020a056512348300b0048af6242892sm533741lfr.14.2022.08.22.13.36.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Aug 2022 13:36:36 -0700 (PDT)
Message-ID: <b10b4e8f-e0ee-f92f-e65e-1ea8511804d4@linaro.org>
Date: Mon, 22 Aug 2022 23:36:36 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH 6/7] drm/msm/dp: Don't enable HPD interrupts for edp
Content-Language: en-GB
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Stephen Boyd <swboyd@chromium.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>
References: <20220810035013.3582848-1-bjorn.andersson@linaro.org>
 <20220810035013.3582848-7-bjorn.andersson@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220810035013.3582848-7-bjorn.andersson@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/08/2022 06:50, Bjorn Andersson wrote:
> Most instances where HPD interrupts are masked and unmasked are guareded
> by the presence of an EDP panel being connected, but not all. Extend
> this to cover the last few places, as HPD interrupt handling is not used
> for the EDP case.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/dp/dp_display.c | 15 ++++++++++-----
>   1 file changed, 10 insertions(+), 5 deletions(-)

-- 
With best wishes
Dmitry

