Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD3464653E
	for <lists+dri-devel@lfdr.de>; Thu,  8 Dec 2022 00:40:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D67010E19B;
	Wed,  7 Dec 2022 23:40:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DFAF10E19B
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Dec 2022 23:40:12 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id s10so8635885ljg.1
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Dec 2022 15:40:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HRIjdXMU+hROafjnkjje/sfB4GvhGqvX1pIwmIMOYUk=;
 b=dPjPWHoCRIzQn0lG6TQAzVpxAbwzqRKkircLaLGcGR3KSwbVfY+ncjEM5MjE1khSwC
 FUV+pA/AIVQrxDZhzfOqHsiDQo0IASpAFwtIbINKn3aukCKlXj8XZhVuAMQWdE0jMPDX
 dL3PM56uyqi+iPYCNNgerbwg955OPX3IV4hsSTR9PZwuFuZvtaBktFXDZZ9BYWz53SMr
 tkhUB6LYG/btRHDH+pOvMPyHQGhq834CJRQBBU/Cid0AujIVPstRVYP0GLTKehMrml8d
 Fq5TshjJ8MsBjAB3lZm+cfzLPl0kjo2jh9P+R3ozjdXM7byXWbbcbtpP4u6RgHCrFTr0
 MQBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HRIjdXMU+hROafjnkjje/sfB4GvhGqvX1pIwmIMOYUk=;
 b=xBA+cqv+DcaQDJ7/eLKMaYgmpcrwKRuXhEUqTHqZlDcPfBjHj0n29/dZEyS5Wh+0/B
 LHpc1xkCcJHGKu/lhSWSqobqhH/u0ipmo5Q4heqGSbhu1ScySfiEB3M+0cwLUkBsdB9E
 s0SCDDdez5Tf0LH1MZUrNpNPEdr0WP/HS4Fk5OUs7TyPz5AUj/3fSp9tFkHMdnjAi6y/
 4ZbSlf3p14mERv8lO2fVSoutKan8steyzs/mpSXc2ff+yzn4sZf7TfWfXs6xOnE699Dt
 8hYh48mCCCHWsuMjIoT9HV/elW3gPM+jWayB8Vt+9NxjxwcKN5KefDR/JQvR49k7M8c4
 P2Mg==
X-Gm-Message-State: ANoB5pkBDlIu9iFS09zzEuTrqjRLrtKYX+reJSm7T4SSnp/Aoi+ib4d3
 MLuYmHe+gyzLFU1JidqmENfgpA==
X-Google-Smtp-Source: AA0mqf5iKdnHu+jtm6Nr4bgVmFnKseN07NPJyrAwVWJGzXVOiMrlJzGxcHf1l6Gy4PZqkTPotl6qFg==
X-Received: by 2002:a05:651c:b26:b0:277:9847:286a with SMTP id
 b38-20020a05651c0b2600b002779847286amr22932017ljr.309.1670456410638; 
 Wed, 07 Dec 2022 15:40:10 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 j21-20020ac253b5000000b0049c29292250sm3030149lfh.149.2022.12.07.15.40.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Dec 2022 15:40:10 -0800 (PST)
Message-ID: <bf820a39-2c04-67b1-1275-71b465e53055@linaro.org>
Date: Thu, 8 Dec 2022 01:40:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v3 04/11] drm/msm/dpu: Add support for SM8350
Content-Language: en-GB
To: Robert Foss <robert.foss@linaro.org>, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, sean@poorly.run, airlied@linux.ie,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 agross@kernel.org, bjorn.andersson@linaro.org, konrad.dybcio@somainline.org,
 quic_kalyant@quicinc.com, angelogioacchino.delregno@somainline.org,
 loic.poulain@linaro.org, swboyd@chromium.org, quic_vpolimer@quicinc.com,
 vkoul@kernel.org, dianders@chromium.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jonathan Marek <jonathan@marek.ca>, vinod.koul@linaro.org,
 quic_jesszhan@quicinc.com, andersson@kernel.org
References: <20221205163754.221139-1-robert.foss@linaro.org>
 <20221205163754.221139-5-robert.foss@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221205163754.221139-5-robert.foss@linaro.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 05/12/2022 18:37, Robert Foss wrote:
> Add compatibles string, "qcom,sm8350-dpu", for the display processing unit
> used on Qualcomm SM8350 platform.
> 
> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

