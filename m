Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 124E95A0283
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 22:12:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3064AC5CE2;
	Wed, 24 Aug 2022 20:12:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB85BA209B
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Aug 2022 20:33:49 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id x10so11719992ljq.4
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Aug 2022 13:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=K9ObQ97ISx4Clb2EU3qigRcWkQ6jJk32rWADiTnPB+w=;
 b=HuR5Jhu4zVf25w1uhem4PvXtNLZjHJwxvHsr3LBLE32U2npuz5LTsoWBb/HaYycPdv
 tLKGtDcYAdTDkv4aG8D8rKzLSbmKrUai8AGSfFnHc/PfuoWzx+mY5b/SWbMHIa7Lqf/w
 /LjxODb+uB3sw0hWq7BwxuJIGfGxMCTT2fspo7nnYcqr4hFMI6dcbn+JrcKCZFGB4MS/
 gRMPS7zIwgQY7SPqY13UMnMNh7B+aYg9PIYppCmkK0qpxNhUc8RQiwVNAOUl+y2yi3uN
 Eu9VuDN/HbmpWuoIy9dK6VYnU9wx9anKXtKQrgxQxd+jmm0FHyvHGIk9a2Lur/Iyv0r0
 ip6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=K9ObQ97ISx4Clb2EU3qigRcWkQ6jJk32rWADiTnPB+w=;
 b=LI+GtU+7Ux3S4Cj7Uig5gft3iIFvSPp4FXgz4S5L9eUoIJvc2YW8Dg4bzmqdzWHrYO
 U7Bhz3qJvwbh3AczU6FcvX/hmInrPP5tH4MlqhpvN7jhMnkUs1h45FqPeRn8gnsaxDlO
 oqQ/WaB49kJmYjN065ov+v1mzXuBWWlUr0a9nDruUAoM6lWXPr1GLf1E+Ia6hEmrLf5/
 CIQkdkUzxH7gYlen7ZuHjg8I+8gIUigp2TOyIK/h+33TlpiuNB9nQ1jLjqf17kgOFNtr
 uKLPEsxfgubsJYgsupTP/n4u/U75GvEO2aRvcXk0cB9BGT8PWOaGCajwOTZR3fGZ9va8
 l0xQ==
X-Gm-Message-State: ACgBeo3GeNExlS+s9pYQnUNB5YfrhJSCuIzIjQyk0HqlVpz+6ndtQZ49
 o1suAZS3YROZ6hZOSgRErNmI6Q==
X-Google-Smtp-Source: AA6agR6WVHEiENVXSb3cj+S907V1F8Xb4V+GL/frT2pmZ0hKCfKocjlQl883hDG+8Q/TBumk2USBTQ==
X-Received: by 2002:a05:651c:1544:b0:25f:5036:ece2 with SMTP id
 y4-20020a05651c154400b0025f5036ece2mr6589760ljp.73.1661200428065; 
 Mon, 22 Aug 2022 13:33:48 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 s8-20020a19ad48000000b0048ae316caf0sm2090513lfd.18.2022.08.22.13.33.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Aug 2022 13:33:47 -0700 (PDT)
Message-ID: <2d9db562-1746-64d9-7ca3-f1a7f405bd77@linaro.org>
Date: Mon, 22 Aug 2022 23:33:47 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH 3/7] drm/msm/dp: Add DP and EDP compatibles for SC8280XP
Content-Language: en-GB
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Stephen Boyd <swboyd@chromium.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>
References: <20220810035013.3582848-1-bjorn.andersson@linaro.org>
 <20220810035013.3582848-4-bjorn.andersson@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220810035013.3582848-4-bjorn.andersson@linaro.org>
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
> The SC8280XP platform has four DisplayPort controllers, per MDSS
> instance, all with widebus support.
> 
> The first two are defined to be DisplayPort only, while the latter pair
> (of each instance) can be either DisplayPort or Embedded DisplayPort.
> The two sets are tied to the possible compatibels.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/dp/dp_display.c | 22 ++++++++++++++++++++++
>   drivers/gpu/drm/msm/msm_drv.h       |  1 +
>   2 files changed, 23 insertions(+)-- 
With best wishes
Dmitry

