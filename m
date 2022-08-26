Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95ABC5A24B6
	for <lists+dri-devel@lfdr.de>; Fri, 26 Aug 2022 11:43:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDF2310E7F2;
	Fri, 26 Aug 2022 09:43:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49B0A10E7F2
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Aug 2022 09:43:31 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id bn9so1054328ljb.6
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Aug 2022 02:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=+lqDjb0qBgeqnkEqJaLG27x7N3wtLO3gCVuMcmo3TBw=;
 b=VhxJOtjjqS32cws+7S6MknCuthUPbEFAM8r54Og1meOmNOF5aLgq+CDq6b6oHJv0wz
 QVjTQgDiLo99fHiCA1l9RbuoSugkVrj4tm4rQdNo6iH8nv8T0YtwZz2944Ouuex4twr3
 r49e+nez32HZCyhRn1NuMHD0UtltpqlFfa7TQJIH5G9S2qwqg9FRtWkzu43i8gP9//rJ
 inkrP8pAQZJZpI/sHBVb5zaYmW3+uDHlDyz96Mq48JAZJOMp5TnmHZRtOXLstbqdnY9Q
 nd1nhPbLPsAwKAdyzAR8Wv88RDl5dibLpYwgH3RDoKvfBX/7MXf5F2gkdMl3BsPGjU2f
 srxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=+lqDjb0qBgeqnkEqJaLG27x7N3wtLO3gCVuMcmo3TBw=;
 b=aChLW7XrKcLOl/aRjjcLWFC3Hcsw/iwC6WSa2R4JF2NKYShl45XWzCMLoOp/omUIp8
 Kc/gcfrcCof9v/zTHN//ljmM/WdedGnp2kzLoZLf0ZMIXhM2lqBgdeBO7QwMTeKRClhG
 EJNx0BVRIDPbXoBREQt5zY2w4sAsr5Mlisi1eZoiG7xaFvuZ01Aj3fE1yP6mj8MxiEaA
 fr89PO/tcH9q1m80p9+r2MFLKnz/FhKA5tG9wzazsxUSKhp2oHBNzJCe/VzDYiyvgSdl
 Aqos9txx+Qh0xr3F21SNKybDcy62wB6gHHkCa0ACnxD7NNAiTyq8u19cXw/4ZjidB7ho
 5Q5w==
X-Gm-Message-State: ACgBeo31z61NmgYF9w8I+k5xjszXLqpFBz4yPxnKRR+5caqp0Z/cv8Ih
 ZuEuZE58tM08WMUiRy9xin4L4w==
X-Google-Smtp-Source: AA6agR60mdKAFt3fcZSOqh0nQB0mBgQpUkcT+i+VJYGcCuzDHjy0Ta+/PXxV5E04Iyz2oJx0T+2haw==
X-Received: by 2002:a2e:b602:0:b0:261:e4a6:8c89 with SMTP id
 r2-20020a2eb602000000b00261e4a68c89mr2163985ljn.354.1661507009617; 
 Fri, 26 Aug 2022 02:43:29 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 x7-20020a056512078700b0048b0aa2f87csm321710lfr.181.2022.08.26.02.43.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Aug 2022 02:43:29 -0700 (PDT)
Message-ID: <658faa4e-ad16-7b13-87f3-27ea91db4ba3@linaro.org>
Date: Fri, 26 Aug 2022 12:43:28 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH] drm/msm: fix repeated words in comments
Content-Language: en-GB
To: Jilin Yuan <yuanjilin@cdjrlc.com>, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, airlied@linux.ie, daniel@ffwll.ch
References: <20220823115409.46653-1-yuanjilin@cdjrlc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220823115409.46653-1-yuanjilin@cdjrlc.com>
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 23/08/2022 14:54, Jilin Yuan wrote:
>   Delete the redundant word 'one'.

The whitespace is unnecessary.

> 
> Signed-off-by: Jilin Yuan <yuanjilin@cdjrlc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Fixes: 7198e6b03155 ("drm/msm: add a3xx gpu support")


> ---
>   drivers/gpu/drm/msm/msm_gem.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
> index c75d3b879a53..e300c70e8904 100644
> --- a/drivers/gpu/drm/msm/msm_gem.h
> +++ b/drivers/gpu/drm/msm/msm_gem.h
> @@ -118,7 +118,7 @@ struct msm_gem_object {
>   	 * An object is either:
>   	 *  inactive - on priv->inactive_dontneed or priv->inactive_willneed
>   	 *     (depending on purgeability status)
> -	 *  active   - on one one of the gpu's active_list..  well, at
> +	 *  active   - on one of the gpu's active_list..  well, at
>   	 *     least for now we don't have (I don't think) hw sync between
>   	 *     2d and 3d one devices which have both, meaning we need to
>   	 *     block on submit if a bo is already on other ring

-- 
With best wishes
Dmitry

