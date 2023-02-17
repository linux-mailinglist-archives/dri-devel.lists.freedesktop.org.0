Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5BBE69B4B8
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 22:25:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F0E810F0D6;
	Fri, 17 Feb 2023 21:25:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 444C910F0D2
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 21:25:42 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id r2so766814ljn.5
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 13:25:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ORR0AQhnlGMPN31e9mPJsCgrOnth8Cg37H+T3TwuNc0=;
 b=EoKqClsxJvczaooILRkmTBpck9RRYIHxHhARz8ghkE8ju8QcDyIPrBdTfevR7Z7AYF
 bQvRcgTxf3QXT3o+H7K62Y1yvdZ99qrQDH+WtYWTyVIw80V+nDv62YyBoaZKLIAbH56g
 jf3LIQbBz8bo+W1AvacimbCzHm/J6YBzWx1Wn8MLFLclXLAvF0jnke0Mvt6d+RMbJx/r
 qRbrGwgZxk5J9sZMf9Yia+L+eo6jHfR+gHpeXfVYCtPECh32Dmuez+UhF9KDPoQNms/+
 KGUJ1wv4V2NMYKV55/yZrCYnbb1fQcmwca5HaYPXOprKOubiHt30ejmd2g3BUdl7aHdK
 f8Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ORR0AQhnlGMPN31e9mPJsCgrOnth8Cg37H+T3TwuNc0=;
 b=GahbKkSO0RbXGI3QfPLFSZoh+Vlr0dSxaqYGvlHzLKM3vDz5ZxXLrozwb+423gK6WQ
 kEFJkb9nDB+ezbOu20uxnErK7DbjsYM+h69Qy8lXbG7wIjHSTAHkln93Z6rBi64HMq3F
 Epm60E+YqWXhuLWsbc/k0oK0IehXefzSLRi/BGoU8eVEiYYM6WBtgQSRfPG50bZ54txl
 LJTPphonk3RulUYzsmiHjdXXsnln98CYmPRwKOYZyNbL5YrhlYoje465SFsDZPFt3w2Y
 6uw2MUTFWnuJrVOHWurZyuqA28O0sC6UeVW6uyuBvWR6wDFkbWL+lK9UoiTzOPFUQjJ7
 4caw==
X-Gm-Message-State: AO0yUKXsACVBFcGbpNbSz0ATXUFgn94pbNv2spSXfH+Ytd4mQcuY08cM
 1xptODyB6kbIx7RSaqwT1Opb2Q==
X-Google-Smtp-Source: AK7set83FcpuRjdr9aqb+dOcUa1SF8I+J/myUtqrLeob8tTbxS+Ehimel0K+msGa0mKWSfujy0Ztag==
X-Received: by 2002:a05:651c:2118:b0:293:4ba3:17be with SMTP id
 a24-20020a05651c211800b002934ba317bemr1091977ljq.11.1676669140539; 
 Fri, 17 Feb 2023 13:25:40 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 x2-20020ac25dc2000000b004db513b0175sm783715lfq.136.2023.02.17.13.25.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Feb 2023 13:25:39 -0800 (PST)
Message-ID: <a13997c2-3b68-7c30-2486-c56cb7b72170@linaro.org>
Date: Fri, 17 Feb 2023 23:25:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v2 14/14] drm/msm/a6xx: Add A610 speedbin support
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 andersson@kernel.org, agross@kernel.org
References: <20230214173145.2482651-1-konrad.dybcio@linaro.org>
 <20230214173145.2482651-15-konrad.dybcio@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230214173145.2482651-15-konrad.dybcio@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>, marijn.suijten@somainline.org,
 Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 14/02/2023 19:31, Konrad Dybcio wrote:
> A610 is implemented on at least three SoCs: SM6115 (bengal), SM6125
> (trinket) and SM6225 (khaje). Trinket does not support speed binning
> (only a single SKU exists) and we don't yet support khaje upstream.
> Hence, add a fuse mapping table for bengal to allow for per-chip
> frequency limiting.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 27 +++++++++++++++++++++++++++
>   1 file changed, 27 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

