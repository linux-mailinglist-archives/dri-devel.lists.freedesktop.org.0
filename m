Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C0CA65E2D1
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 03:12:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AE3210E620;
	Thu,  5 Jan 2023 02:12:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D3DE10E620
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jan 2023 02:12:24 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id m6so42779899lfj.11
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Jan 2023 18:12:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=H93nCo5ur4nJMByR48TskV+BfJCAkHk6VSmb9r9zNIk=;
 b=Tbg1nEjsmOX0fx/CSobrtzzJOLRxHoweQs9pjXKgdNKIb5SxfwHhQOppOw9f36DRfn
 mzvMjFi2l8w51kXpjJtiSV7Qmy5WG74zu2Gk7yBWbcVHDobov2wMEWzOfcDEz6LTKuH9
 XpCjFqFNYlt0p1pZgvAGMO1v0eCe48I4n5EXQUMH2+i5PhR7F5O6Ec4mU5h0h75v0qkP
 4d3hC6loJ3WnfYqkqbrZyx68EYFKmJwxefLqtBGDySY+T2+kgzVUForRwwQDZMNhuv+a
 08YB0jvjCDMA4If/W1dPlcOtZNsLP4xC61nHN4PpvbBnvD9LoOXo+9Wvyaj4MbIPO/7x
 zTbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=H93nCo5ur4nJMByR48TskV+BfJCAkHk6VSmb9r9zNIk=;
 b=1SJFAHolSi8crr1IpVZnf08nost32ofnYfoW8yWytgb24ct6XT/aNd6zp3aX52HEq7
 2fgjqAfINcjzlxCQzV/46f6eoRYO+qnJX474hhqDrwPtaFYHwql165AHmkdFtfpxQdMB
 yd0XVKlUpwYbm6uMAha9XrMG9Bw567ZKldOoOYyAXCtIllaCvyl133+bivEhgKTvcaEJ
 5ySNP4xPNpfCS1lx7wIM9Ix15baj+uhhrX2FRVIj2ZeQmYHomytZHPbYFICLQ5IP/ZE2
 /X0y0HUOThm9SqGRVUTM6buMa9iJp8Nvy7O1ZaIxq4K0DB1jFuYUHVFu260fJtGBLoGu
 /Izg==
X-Gm-Message-State: AFqh2kpa2rd3fMwbyreY8DdxSv24h6Tb/YMJk6yio1cwgS9Qth2Oyk44
 b67GwVX3eIe9QcC+jAJLtplNQA==
X-Google-Smtp-Source: AMrXdXuNvXtekh/hZoHpUpmXCwjfnc13T6oiv1mmMsTB4I4lvrOsAx9+7KAS8WD+F8VCPttCyFzFCg==
X-Received: by 2002:a05:6512:1523:b0:4a4:68b7:deb8 with SMTP id
 bq35-20020a056512152300b004a468b7deb8mr16929414lfb.20.1672884742471; 
 Wed, 04 Jan 2023 18:12:22 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 s11-20020a056512214b00b004b57c5b7ec3sm5311699lfr.235.2023.01.04.18.12.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jan 2023 18:12:21 -0800 (PST)
Message-ID: <34880c9e-6150-5a90-ed0e-5dcdc862f2b8@linaro.org>
Date: Thu, 5 Jan 2023 04:12:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [RFC PATCH v3 1/3] drm: Introduce solid fill property for drm
 plane
Content-Language: en-GB
To: Jessica Zhang <quic_jesszhan@quicinc.com>, freedreno@lists.freedesktop.org
References: <20230104234036.636-1-quic_jesszhan@quicinc.com>
 <20230104234036.636-2-quic_jesszhan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230104234036.636-2-quic_jesszhan@quicinc.com>
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
Cc: sebastian.wick@redhat.com, ppaalanen@gmail.com,
 linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, daniel.vetter@ffwll.ch,
 seanpaul@chromium.org, laurent.pinchart@ideasonboard.com,
 wayland-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 05/01/2023 01:40, Jessica Zhang wrote:
> Add support for solid_fill property to drm_plane. In addition, add
> support for setting and getting the values for solid_fill.
> 
> solid_fill holds data for supporting solid fill planes. The property
> accepts an RGB323232 value and the driver data is formatted as such:
> 
> struct drm_solid_fill {
> 	u32 r;
> 	u32 g;
> 	u32 b;
> };
> 
> To enable solid fill planes, userspace must assigned solid_fill to a
> property blob containing the following information:
> 
> struct drm_solid_fill_info {
> 	u8 version;
> 	u32 r, g, b;

BTW: should we add support for alpha too? DPU hardware supports using 
RGBA as a fill colour format, doesn't it?

But then we face the obvious question, how do we communicate to 
userspace if the hardware support RGB or RGBA?

> };
> 
> Changes in V2:
> - Changed solid_fill property to a property blob (Simon, Dmitry)
> - Added drm_solid_fill struct (Simon)
> - Added drm_solid_fill_info struct (Simon)
> 
> Changes in V3:
> - Corrected typo in drm_solid_fill struct documentation
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>   drivers/gpu/drm/drm_atomic_state_helper.c |  9 ++++
>   drivers/gpu/drm/drm_atomic_uapi.c         | 59 +++++++++++++++++++++++
>   drivers/gpu/drm/drm_blend.c               | 17 +++++++
>   include/drm/drm_blend.h                   |  1 +
>   include/drm/drm_plane.h                   | 43 +++++++++++++++++
>   5 files changed, 129 insertions(+)

-- 
With best wishes
Dmitry

