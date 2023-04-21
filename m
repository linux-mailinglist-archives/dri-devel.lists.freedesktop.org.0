Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6596EB58E
	for <lists+dri-devel@lfdr.de>; Sat, 22 Apr 2023 01:09:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5529D10EA72;
	Fri, 21 Apr 2023 23:09:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3026A10EF1E
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Apr 2023 23:09:47 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4edcc885d8fso2393053e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Apr 2023 16:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682118585; x=1684710585;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MBHd1gKWaWHZRcJ+IDDu5qaiPRlR0iYD3UI1a4NgnfA=;
 b=jCS43GrUjtfz1056k3fY1II9WNVWqeit31A7Xw4HORm/9Gx8tHGRLM1dc7sKf5jW5/
 1mq/mHmEDt2yVGtwzHoGk4uUbxvOrUH4b9Ozc5c3Ro0VVGnpKFO55g8qRRa77J8AGnzG
 Kzx1gB9jcSNqF+12Lx75qERgclIj/g2O+BzyUsnaLuRzJg4cyUvpUjCIGJxA+/PMO2Ep
 QsxlyrCv/+7ekDd35mDv3nzT5w4FOk/iMn/sSN3APz3zPvrdWKaoGNiLs6kFxEFXs/1f
 JmVWjR0QPznYp5v1rk1WoZMBPPsVrloy2vqMKRsRBk8IZE9Wl9EmquXA775rQpXIq2r8
 uPvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682118585; x=1684710585;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MBHd1gKWaWHZRcJ+IDDu5qaiPRlR0iYD3UI1a4NgnfA=;
 b=R9ZQlYR8loQjcZfVJ4WM7pLTQ1pexHvlXLwIFqXvp/owev/qKHAit+d7TLkM6HPGI5
 bXi0gsdctUy+/FjikyAaT1b5rbrTEXzHfCjV3JB1KS4nbX2xMe8P9XMK5ZxEavbYbP3G
 OcfXiX/djg5CdcZ6S+LxWWVRNe1eHj+nRLmc7QrSnAw7G6sX96piRYWQ8B6wuI0O7/NI
 6W/eraEB/HJqqxmflgB4TbewcyL3Nfs15FN2zkbwoOEPQCnebLrHlpCPrnQus8vyYQbz
 Omhl1PAScGT5maR9kjBD8Gn2AU6fgI+5ktRUqrDIqToWUnkoE5V+ihORPIkTaeTO4S5e
 HXSg==
X-Gm-Message-State: AAQBX9fG1RbvHxuLlJwqHpbu0E3f5TH2P0h2wmVSAClf7DAR4GGQm5WW
 zmPmWUH197bqUBJ+762U4UHibQ==
X-Google-Smtp-Source: AKy350ZpYUuUjnqy++sLsWhjdTBb+T9UNo/712URdiL+KK7Xt1VeebkM/WEdVxlUHYDS/yJn7EYM8A==
X-Received: by 2002:ac2:5611:0:b0:4e8:3fc7:9483 with SMTP id
 v17-20020ac25611000000b004e83fc79483mr1801853lfd.23.1682118585004; 
 Fri, 21 Apr 2023 16:09:45 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 r4-20020a19ac44000000b004cb0dd2367fsm699255lfc.308.2023.04.21.16.09.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Apr 2023 16:09:44 -0700 (PDT)
Message-ID: <5b389840-e736-5924-b88c-242ecdd1c179@linaro.org>
Date: Sat, 22 Apr 2023 02:09:44 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 1/2] drm/msm/dpu: remove DPU_DSPP_GC handling in dspp flush
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20230421224721.12738-1-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230421224721.12738-1-quic_abhinavk@quicinc.com>
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
Cc: quic_jesszhan@quicinc.com, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 marijn.suijten@somainline.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 22/04/2023 01:47, Abhinav Kumar wrote:
> Gamma correction blocks (GC) are not used today so lets remove
> the usage of DPU_DSPP_GC in the dspp flush to make it easier
> to remove GC from the catalog.
> 
> We can add this back when GC is properly supported in DPU with
> one of the standard DRM properties.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 3 ---
>   1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> index bbdc95ce374a..57adaebab563 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> @@ -336,9 +336,6 @@ static void dpu_hw_ctl_update_pending_flush_dspp_sub_blocks(

Please drop the DPU_DSPP_IGC in a followup.

>   	case DPU_DSPP_PCC:
>   		ctx->pending_dspp_flush_mask[dspp - DSPP_0] |= BIT(4);
>   		break;
> -	case DPU_DSPP_GC:
> -		ctx->pending_dspp_flush_mask[dspp - DSPP_0] |= BIT(5);
> -		break;
>   	default:
>   		return;
>   	}

-- 
With best wishes
Dmitry

