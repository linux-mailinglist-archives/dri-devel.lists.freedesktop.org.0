Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED6D6D6F24
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 23:43:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B7E110E1F3;
	Tue,  4 Apr 2023 21:43:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0831A10E21C
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 21:43:07 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id j11so44071768lfg.13
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Apr 2023 14:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680644586;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gSR45RkCkZAa6HfvzU+qpgIaeIB15LuPXZ7G+069NSk=;
 b=I7aAm/b8LBQTjsriGf5wlEn2paOkAC9x9Dffq5nPc8cgqqqPEsB8FNA7xP4SuDBuqX
 ZBNWGFAkDGwnWyRyLghIW+oj5MXhLqMBu2LLifNseSROmMkM7TNJ7CaJiXuAnKq5rckS
 dHJWrdlDfixUG5UqGeX5C4cCtf7Aoyy3HzRqTfPIi8ONNtEYGD+Xe4sMwq5mHd0qx6Rd
 /P/rCMcZJ1L1L5XiSBXxYQFWXiglGYypP8dY18PjTf1Adb6KVBKWFQexWeIl5jgaiuhE
 Id7H1GQiBKhH7yNPuJaCHCUCXxcf3pTPF4X14HDSEPWbljCBiPTDF+7cXVLsCcToocVO
 cEdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680644586;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gSR45RkCkZAa6HfvzU+qpgIaeIB15LuPXZ7G+069NSk=;
 b=ObwBY4pNKYWkJSaKEodbDyWyGWtiGatXSi1N5pkdfICAtxBHamRW5SnbQYjwsY/f6r
 t+vWF+JnBe3GC7WByAR/cC2clD4BsE2L/JEd8XV0fA+BE8/1ouGMfTZOWJFASKRWovXe
 ikSdAuBbPOzketler5qtLF+I2KI24lf19NuL/xejdorpGY0CmVIeV2K64e7y+rPijJ00
 3cF/GA+mfYJZV7Tno71U+eb0qqOLIbKoS5x87179bMu20WS8JkcNELd1QE26fG6IqkI3
 eW57HA/itaBU3VtHCTJVSgbJGyJfyoTgYtxa5G7pOfeQVI6Ceu3LjGbycYDH+fkf9Ius
 6WDQ==
X-Gm-Message-State: AAQBX9ctg1I+Wkkem/jUfJjG0ivAkbynQ7newwAJOAvKde/l9ZRVy3fS
 05aVuebgukkpPnS1fMDxgZmZqg==
X-Google-Smtp-Source: AKy350aqwjn5ys3NOtAi47em7O+S8a0XsVjMCu5tyoY3tio0RsgoA26TA7qzZYrihV3AtEDGFEyNhg==
X-Received: by 2002:a19:c502:0:b0:4b4:8f01:f8b1 with SMTP id
 w2-20020a19c502000000b004b48f01f8b1mr1069888lfe.31.1680644585926; 
 Tue, 04 Apr 2023 14:43:05 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 o2-20020a2e9442000000b0029571d505a1sm2543919ljh.80.2023.04.04.14.43.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Apr 2023 14:43:05 -0700 (PDT)
Message-ID: <ad5207e8-50d8-98b1-cd07-f4ab0735d25d@linaro.org>
Date: Wed, 5 Apr 2023 00:43:05 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 2/8] drm/msm: Clear aperture ownership outside of fbdev
 code
Content-Language: en-GB
To: Thomas Zimmermann <tzimmermann@suse.de>, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, sean@poorly.run, javierm@redhat.com,
 airlied@gmail.com, daniel@ffwll.ch
References: <20230403124538.8497-1-tzimmermann@suse.de>
 <20230403124538.8497-3-tzimmermann@suse.de>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230403124538.8497-3-tzimmermann@suse.de>
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
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 03/04/2023 15:45, Thomas Zimmermann wrote:
> Move aperture management out of the fbdev code. It is unrelated
> and needs to run even if fbdev support has been disabled. Call
> the helper at the top of msm_drm_init() to take over hardware
> from other drivers.
> 
> v2:
> 	* bind all subdevices before acquiring device (Dmitri)
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/msm/msm_drv.c   | 6 ++++++
>   drivers/gpu/drm/msm/msm_fbdev.c | 6 ------
>   2 files changed, 6 insertions(+), 6 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

