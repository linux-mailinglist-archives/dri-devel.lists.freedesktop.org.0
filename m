Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE56743963
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jun 2023 12:33:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 238F710E14A;
	Fri, 30 Jun 2023 10:33:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB55810E270
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jun 2023 10:33:21 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-4fb7b2e3dacso2785831e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jun 2023 03:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688121199; x=1690713199;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BV6pMCNFBELZthFQNdbEPY0LFf8oujVmtU/HlHM5O6w=;
 b=La97SAtUMDaQJPXoGRraZ0zdFoKriXSnJyG5uqhKNWQLBvzsNLIa3sVbPGjI/Hyn6r
 CwAUr8zFLmuU1Hw6/1WHilfZMHUbRmEi3qC+ryRszPZL6yTQZGTK/Fzq93hyTrPBE3ld
 lvLHmDjSPBltv0e0WuW3AvCI1sVhEa6O7rxJXMNLcxJnQHKJ9hdlugyO7Ta3UAvdfsjR
 vXB49PmJZrbWS40WXb320dBMOKwsnfMToxiq20oHb9+hWxDzy1gJT0GxGHFPpm6iJkbV
 RdnaTWKi8hXixIY83GUyhOPj4PwhlGU5Rk3YCCUOP8WZj09ShQyDQ6kSgG8jPXJ5z+t+
 JreA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688121199; x=1690713199;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BV6pMCNFBELZthFQNdbEPY0LFf8oujVmtU/HlHM5O6w=;
 b=SbVMAPKYMZyImPXfFMHvUfKG8WqfMy9wp9xFUBRGbJmgouFiN8q1AZ/e0YX6lAkOcw
 kTocEw/6Kuit8z3Ajw9evGx8LHk93PXb4P03pngtynpZnTr551BPHQ/Ez32v60FaWWnj
 yPV7uQUVTPydbmeahFawdAijosMG7voTBhezVvT+s8F3tXQED/GO2/1JY29iipIDfO05
 TqP6R2s4TapFrMB4gQGNoJXGaFSih7I6gd0dIVOaPkmdnq62rA813L8qhWLhqo3iJ3nK
 LaiYieWgHA5nn7NubWo49kFjvD/3+2a96nBXALnXL2+nGWU5rftYBODFjfu9Qvq/Crp2
 AYyA==
X-Gm-Message-State: ABy/qLbahQlIvNGzUHAWRRljP4oYFa6jQilwTmfYor6cvKktSGwAcxdM
 P27KmFkkuiUcHLF5coClexhQZA==
X-Google-Smtp-Source: APBJJlEQ56WLGrt67F0epM2MytRHTKau3I6Ew1h+D6xetubMMeQ1wj68PFO/tnppTDhXOMB2EaKmOA==
X-Received: by 2002:a05:6512:280d:b0:4fb:18f4:4cd4 with SMTP id
 cf13-20020a056512280d00b004fb18f44cd4mr2161674lfb.55.1688121199585; 
 Fri, 30 Jun 2023 03:33:19 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 a20-20020a05600c225400b003fbb06af219sm6875419wmm.32.2023.06.30.03.33.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Jun 2023 03:33:18 -0700 (PDT)
Message-ID: <972b7cc7-77de-e332-ba41-b96c01dc7939@linaro.org>
Date: Fri, 30 Jun 2023 13:33:16 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH RFC v4 1/7] drm: Introduce solid fill DRM plane property
Content-Language: en-GB
To: Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>
References: <20230404-solid-fill-v4-0-f4ec0caa742d@quicinc.com>
 <20230404-solid-fill-v4-1-f4ec0caa742d@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230404-solid-fill-v4-1-f4ec0caa742d@quicinc.com>
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

On 30/06/2023 03:25, Jessica Zhang wrote:
> Document and add support for solid_fill property to drm_plane. In
> addition, add support for setting and getting the values for solid_fill.
> 
> To enable solid fill planes, userspace must assign a property blob to
> the "solid_fill" plane property containing the following information:
> 
> struct drm_solid_fill_info {
> 	u8 version;
> 	u32 r, g, b;
> };
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>   drivers/gpu/drm/drm_atomic_state_helper.c |  9 +++++
>   drivers/gpu/drm/drm_atomic_uapi.c         | 55 +++++++++++++++++++++++++++++++
>   drivers/gpu/drm/drm_blend.c               | 33 +++++++++++++++++++
>   include/drm/drm_blend.h                   |  1 +
>   include/drm/drm_plane.h                   | 43 ++++++++++++++++++++++++
>   5 files changed, 141 insertions(+)

Also, I think the point which we missed up to now. Could you please add 
both new properties to dri/N/state debugfs?

-- 
With best wishes
Dmitry

