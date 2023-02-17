Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B702169B4F1
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 22:42:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C14D810E465;
	Fri, 17 Feb 2023 21:42:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A30D310E468
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 21:42:55 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id bi36so3106009lfb.6
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 13:42:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RVfAM1aoMCSGNnm3y845Ami8wb0wHuWhrZQr32w3Tjw=;
 b=wzjVOLTW6zAlPTdYq7bgQm9Wzv5yjfA8OZFcEROYZZ2Mfnj+ZZ5MzH3IXa+sWZrRi+
 8QsMXdMyTXefyp6TLW/iHdR0owiFo7cQGipaAdZhemqcVNTyQ3Lj8/OVVkOmAJRlQCak
 xGd+hk0sxnIJaEB6GkAi8lX6NaHq83yde+Pyd4BWBASaUu9kl8KzfUgtxZa2svfkkrpC
 b0xLBfIBsqTOxLxKAiZP7/h6FPPlz6IWGSPUeNceoRcQhxn3Ft+P5ZCk6BKLgAwIRbyr
 4at0jYWC6i7Qm43dfl+X3D8yhwm3sl8yj4dZqM/8Gsiz4ZiOQ30h3HUgEBV8cK1/N/xh
 E7+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RVfAM1aoMCSGNnm3y845Ami8wb0wHuWhrZQr32w3Tjw=;
 b=6yDPL4nxQ4VOSyrBoLmO/j9fEKZpmlUIy6zrc1sejgZogSHtTtPY8C6hUeHaCR2G0o
 y3gq7G6y0PbqhA+if0EBEpSZknyWAq9/a/NjiRuLFC4UBZdailtk3lCwAZZ/SDCKExV7
 5q17qLwj7UNRXu+A1iYSEa5FuyfRIc9+fxCJNFUad5kJCFVNWYr76Vs88n6cEG1rRxnB
 SyL1ewvd8sriVikDDfX1vMTVQecMKYj8RnRG14VpuxHlcwGPfXiIM84pNM2wHyyv12lv
 la71hrGJmq+GRM+RWrU6XoD1wQKiUVmOVtdLfO0q5EMPOej+yMnDmA2CH11J6v998tDX
 LaJQ==
X-Gm-Message-State: AO0yUKWlF2q14eP+76CDZGWB/+YCmvKI0hgXV4eMvtJk2KWqsyEgGxAV
 E/d+ey5kKSzCIBknhLuKd2LzqA==
X-Google-Smtp-Source: AK7set/CxZjGHo846Qka7vuunh7JdD0xMbvLWcB46lLmZmqb987pyAwT8cS37VQHh6qvPh/aW+XtdA==
X-Received: by 2002:a05:6512:24e:b0:4cc:5e3a:dd82 with SMTP id
 b14-20020a056512024e00b004cc5e3add82mr815421lfo.58.1676670174032; 
 Fri, 17 Feb 2023 13:42:54 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 u9-20020ac25189000000b004dc84e73fd8sm310981lfi.278.2023.02.17.13.42.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Feb 2023 13:42:53 -0800 (PST)
Message-ID: <473f4c26-90cd-85ad-afe5-315fa224dc27@linaro.org>
Date: Fri, 17 Feb 2023 23:42:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v2 09/14] drm/msm/a6xx: Fix some A619 tunables
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 andersson@kernel.org, agross@kernel.org
References: <20230214173145.2482651-1-konrad.dybcio@linaro.org>
 <20230214173145.2482651-10-konrad.dybcio@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230214173145.2482651-10-konrad.dybcio@linaro.org>
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
> Adreno 619 expects some tunables to be set differently. Make up for it.
> 
> Fixes: b7616b5c69e6 ("drm/msm/adreno: Add A619 support")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

