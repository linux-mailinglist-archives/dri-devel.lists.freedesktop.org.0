Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9899D7AC770
	for <lists+dri-devel@lfdr.de>; Sun, 24 Sep 2023 12:09:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93B8E10E0FF;
	Sun, 24 Sep 2023 10:09:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9801610E110
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Sep 2023 10:09:00 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-31fa15f4cc6so4456440f8f.2
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Sep 2023 03:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695550139; x=1696154939; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6nXbLBps5WiXoEQE9WIccP8ivtaXBMcUBjjWn1Nzz6o=;
 b=Gzhg01rwMzQ3v0ZHM5Wt6GIXtYph65iSVFxSdKQHkUc3qyCX+728pPOGM/dFhcElQN
 WSklMWrzHjX/3R/6zYWQ8XnPCwi+Dxfq5XPIm3oAa5cp6mGj45R5Fqf6wEtY6D/970LR
 a8KrYLNp7Tokk/z2O577VoGKMLlc9CF1PM24HWYxe6nKBwBQl2/GM/Zk2Pi1uBz0upxL
 7Tgu353Lb/Y7kIQBp6tRiXMWPIe7lXLzgu/bcObusxTnQ1chpI5EbPJtcc6eMOvVpokc
 z+iVzHIj7w+yg5qr/euFrRqugwojOE/7qEAWEer+O/B3ss4cvWJsEzfcotNB9uGAk6Z3
 OL0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695550139; x=1696154939;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6nXbLBps5WiXoEQE9WIccP8ivtaXBMcUBjjWn1Nzz6o=;
 b=ASy4NgHx6uV12PuwdLwj665Xe9/XuzZ8Mh/Q6CXxlC5/znoIc09qEcxaJR2Ua/4oKa
 qevekmpsbIQuwL8NDoBf3tKG4tDXUn3tsjH67Ct55NCpQt8uMRSDIA8EQbrgX/7ngQBw
 6ELcTETNe9lmueBE6Ws4a+JlIYLfm0y1rFwQ2AWm0W2LnBOfaMmSg7Y5V6kvOZ+o2bdZ
 fM7pSY6pSv7E56xAFcOXVDSkMlHrtYW8t5SURWctthBoqcZmOWd2UnJvm8QPYe1crFu9
 9whmyQO+dtNvbK8XHkubYEYqwuZaRwiPDdSdSa64ffTTJL002UhIDY7v7/gL6Jshsyye
 aEwg==
X-Gm-Message-State: AOJu0YxFp1gZV9Z06WT9nXe90VdCNHYc2EnKH4wlsBbMpzrDTgYxK/H1
 xr1LhhVszXm5sZemm98ZzWBX2g==
X-Google-Smtp-Source: AGHT+IGc7cLLbVqMAyuO/HE0VQk/0NVpOb/G3zdJclMXCsC6r8WRPOfcesZEX59sT3GWSsST1pnbuA==
X-Received: by 2002:a05:6000:1cc4:b0:321:68fa:70aa with SMTP id
 bf4-20020a0560001cc400b0032168fa70aamr4018108wrb.9.1695550138694; 
 Sun, 24 Sep 2023 03:08:58 -0700 (PDT)
Received: from [10.73.151.44] ([188.111.42.10])
 by smtp.gmail.com with ESMTPSA id
 c12-20020adfed8c000000b0032179c4a46dsm8886160wro.100.2023.09.24.03.08.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Sep 2023 03:08:58 -0700 (PDT)
Message-ID: <2803eb0a-99c5-4cb6-9422-7b8e392f2b7d@linaro.org>
Date: Sun, 24 Sep 2023 13:08:56 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v6 04/10] drm/atomic: Add pixel source to plane state
 dump
Content-Language: en-GB
To: Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>
References: <20230828-solid-fill-v6-0-a820efcce852@quicinc.com>
 <20230828-solid-fill-v6-4-a820efcce852@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230828-solid-fill-v6-4-a820efcce852@quicinc.com>
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
Cc: sebastian.wick@redhat.com, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 ppaalanen@gmail.com, laurent.pinchart@ideasonboard.com,
 linux-arm-msm@vger.kernel.org, wayland-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 29/08/2023 03:05, Jessica Zhang wrote:
> Add pixel source to the atomic plane state dump
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>   drivers/gpu/drm/drm_atomic.c        | 1 +
>   drivers/gpu/drm/drm_blend.c         | 1 +
>   drivers/gpu/drm/drm_crtc_internal.h | 1 +
>   3 files changed, 3 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

