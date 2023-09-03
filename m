Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F90790F0B
	for <lists+dri-devel@lfdr.de>; Mon,  4 Sep 2023 00:39:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 801A910E253;
	Sun,  3 Sep 2023 22:39:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FD7D10E253
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Sep 2023 22:39:06 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-31dd10c2b8bso621397f8f.3
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Sep 2023 15:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693780744; x=1694385544; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FCW5fhzFPO36VkzYsA4ot6wHveFpsnR8+rOVU4lQ1Wc=;
 b=JWlo5y8dVjdNBQBRLxFXy/PNO9D/7hxYtbMdzDRl+XIhpuyMpDo1fk1lc8j7LToxxQ
 /DhNIxb8mlqX5dWu+xXl+okhgOGh22jcT7QS9On7ZwpnrxFX4l/0ky/t7bAT7ZOPsUih
 c2rsh0U1wZkidnVNo27TwBk3+zty7LCIa4CLjdmZ/3t/+E1im6GJQYNNDEmaQP/ehmV+
 t1TjMeu803sXctmClBN+mpCPPDQYHQbtQTh9UOhmrGPwSDKiUee434QbfthgjlPHgL9A
 naJklLRUOMy1JJ8o2z4XgXhwYb50BjTR3h01DegqWEZ3IXra0nZ2Im4a6p+UD6ThC5FO
 SIjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693780744; x=1694385544;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FCW5fhzFPO36VkzYsA4ot6wHveFpsnR8+rOVU4lQ1Wc=;
 b=c9v+nMxbI3hksOph/z+rlWDMzH9s2VfNWseGBFrF5BeUkeLSBAHBFfPL4A+YmN8As7
 6Oje3VkrdBTSSxq1MIAM2XlcneRAomMpwJwcHLdHPdxzXxDonExhNyKMtTG5gGNfnaBw
 WAtwh+8sIjLXDXoxDeg/3GNAfzy2ulWGYxXSUVmxzk359NY+zikrA+T8Rf26zGvs4bBa
 YU8lIE+B6iWeu8WXdmmY3ylXSconAS9gO9AWeWZrDWJ2rqTWrO4REEDeVF3hTES14Wpb
 sorx6ZoF5vwe8fpPJ1JShImq8DNgCvwaLcMIFQhBdQQKklIBD5P8X4CRSkpvD+9XRjX5
 R/fg==
X-Gm-Message-State: AOJu0Yx0GTAPQGd/tpzlgUL5zjg/QEql1o5EhwR+9m1CEgVgwXNhQPky
 1QrEpVhKePNMYBO6tlLduc9HIQ==
X-Google-Smtp-Source: AGHT+IHC4LmuKmR0sAciVcZpljh/BF5lACIe0GOW90jgSls+WPgeE839R/LmWZIlDExfc1NZ5qUZvw==
X-Received: by 2002:a05:6000:1749:b0:31f:3cfd:c700 with SMTP id
 m9-20020a056000174900b0031f3cfdc700mr2629921wrf.32.1693780744491; 
 Sun, 03 Sep 2023 15:39:04 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 bo9-20020a0564020b2900b0052889d090bfsm4972604edb.79.2023.09.03.15.39.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Sep 2023 15:39:04 -0700 (PDT)
Message-ID: <db42e1b4-3ef7-4af9-80d2-23d84ec5f8dc@linaro.org>
Date: Mon, 4 Sep 2023 01:39:03 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] drm/msm/dp: Remove dead code related to downstream
 cap info
Content-Language: en-GB
To: Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230829184735.2841739-1-swboyd@chromium.org>
 <20230829184735.2841739-4-swboyd@chromium.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230829184735.2841739-4-swboyd@chromium.org>
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
Cc: Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Vinod Polimera <quic_vpolimer@quicinc.com>,
 patches@lists.linux.dev, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 29/08/2023 21:47, Stephen Boyd wrote:
> We read the downstream port count and capability info but never use it
> anywhere. Remove 'ds_port_cnt' and 'ds_cap_info' and any associated code
> from this driver. Fold the check for 'dfp_present' into a call to
> drm_dp_is_branch() at the one place it is used to get rid of any member
> storage related to downstream ports.
> 
> Cc: Vinod Polimera <quic_vpolimer@quicinc.com>
> Cc: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>   drivers/gpu/drm/msm/dp/dp_panel.c | 25 +++----------------------
>   drivers/gpu/drm/msm/dp/dp_panel.h |  6 ------
>   2 files changed, 3 insertions(+), 28 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

