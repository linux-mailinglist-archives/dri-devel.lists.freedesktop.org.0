Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 845CD790F1C
	for <lists+dri-devel@lfdr.de>; Mon,  4 Sep 2023 00:45:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C46D10E262;
	Sun,  3 Sep 2023 22:45:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 542C510E262
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Sep 2023 22:45:40 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-9a6190af24aso132968566b.0
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Sep 2023 15:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693781138; x=1694385938; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=icCZ5tdF61yj1pSKhn/ffpI/X+SJfCRYhcOnGB1o1ts=;
 b=WsG6rorQ+MGwH5ie/9DoJ9D9spRa8cnwY9wbj8DMw5/c2Wx1AajRnDCymCt7bd1osf
 9lVnf/2/MVElBbX9AVyXoQOPyUbcOM0RGoTZgnHWcRcuCCSq89TYY0orrSUJozPgh3ZA
 i92yeaZJBzgpfmL4MvG0EcBWQnglZZ5i4Zkx5N3Js2kpdVlyfQ4N2gXOQwVsXX54tw0h
 UM+eWoIJwKs+tpW2UdIWHe3asEZ9xQDPkj+S3jW8NAoL5WQ3rPYQJ34D1tdTbUcJYjcL
 qwxRU3Et8r2rlksw+B625WBDKqDtiOlFfNG7ilvl1P2xhYsRhaO3cGLG4Y5q91jyLKmp
 /KgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693781138; x=1694385938;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=icCZ5tdF61yj1pSKhn/ffpI/X+SJfCRYhcOnGB1o1ts=;
 b=JGOK6iHYautp4qqQJ0a4Rj30CyM8nEELt8t/6ABpCRRPBHenj2r8RaIisT5Mlgyp+Y
 TzkTuIAKdkHB2pRIt6It4zEBnqdP7emNZxAXNo6mk6exih78asv8432qigWE8BEeZrjp
 Kc/SdrZHmww4+egMas40fQofNVQxBCtJCVsq4NxAnbzVW20PyiKsyOlcHVSEehWNfYHD
 H8/vhibvQZ2ZxwUjJ0NkXt0wrdYYeUodOg4P6l2LsLqKWiXTUIy/cRe1PJZ+oglniwe5
 LDEnrGrHHMdsJuIzjIshefysySFdDfgtujj3il3s93dE5jX2s63JhoMS0e1LooBNHC91
 nk/w==
X-Gm-Message-State: AOJu0YzwvQYPi+jozHcufM/OOYBAlZhBj/ZqxQAKIOTvxTb9a8aHM3Oz
 YeuPmxIlq3FkjGzp2q7wPmTuhw==
X-Google-Smtp-Source: AGHT+IH4gRHcH2C56k65qmxY/tgOsFae4qzfQvdNHKXi+ydhfItRS40/B9o9IDmJDqAt517CDjrUBw==
X-Received: by 2002:a17:907:7798:b0:9a1:c669:6e66 with SMTP id
 ky24-20020a170907779800b009a1c6696e66mr6491833ejc.70.1693781138694; 
 Sun, 03 Sep 2023 15:45:38 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 lz20-20020a170906fb1400b009929d998abcsm5223365ejb.209.2023.09.03.15.45.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Sep 2023 15:45:38 -0700 (PDT)
Message-ID: <cefd4c7a-3b98-4a4c-be03-a8b02d35de3c@linaro.org>
Date: Mon, 4 Sep 2023 01:45:37 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] drm/msm/dp: Simplify DPCD related code with helpers
Content-Language: en-GB
To: Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230829184735.2841739-1-swboyd@chromium.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230829184735.2841739-1-swboyd@chromium.org>
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
> This driver open-codes a few of the DPCD register reads when it can be
> simplified by using the helpers instead. This series reworks the MSM DP
> driver to use the DPCD helpers and removes some dead code along the way.
> There's the potential for even more code reduction around the test
> registers, but I haven't tried to do that yet.

For the whole series:

Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Using drm_dp_get_phy_test_pattern() / drm_dp_set_phy_test_pattern() 
would be definitely a benefit, especially since the latter one has 
support for DP >= 1.2, while msm DP code doesn't.

> 
> Stephen Boyd (7):
>    drm/msm/dp: Replace open-coded drm_dp_read_dpcd_caps()
>    drm/msm/dp: Use drm_dp_read_sink_count() helper
>    drm/msm/dp: Remove dead code related to downstream cap info
>    drm/msm/dp: Remove aux_cfg_update_done and related code
>    drm/msm/dp: Simplify with drm_dp_{max_link_rate,max_lane_count}()
>    drm/msm/dp: Inline dp_link_parse_sink_count()
>    drm/msm/dp: Remove dp_display_is_ds_bridge()
> 
> Cc: Vinod Polimera <quic_vpolimer@quicinc.com>
> Cc: Kuogee Hsieh <quic_khsieh@quicinc.com>
> 
>   drivers/gpu/drm/msm/dp/dp_display.c |   9 +--
>   drivers/gpu/drm/msm/dp/dp_link.c    |  38 +---------
>   drivers/gpu/drm/msm/dp/dp_panel.c   | 105 +++++-----------------------
>   drivers/gpu/drm/msm/dp/dp_panel.h   |  10 +--
>   4 files changed, 22 insertions(+), 140 deletions(-)
> 
> 
> base-commit: 2dde18cd1d8fac735875f2e4987f11817cc0bc2c

-- 
With best wishes
Dmitry

