Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E97790F10
	for <lists+dri-devel@lfdr.de>; Mon,  4 Sep 2023 00:39:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 365C310E260;
	Sun,  3 Sep 2023 22:39:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D30C610E260
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Sep 2023 22:39:29 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5230a22cfd1so1091067a12.1
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Sep 2023 15:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693780768; x=1694385568; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=64IskuQuClXBpnMvldmQrJ5JN6x55RtC96YOLaP2MLE=;
 b=p5iLdRo7MN/VwNJgOqjaayPQHnAUDQv5saoFR8i6Q0tm0zMnn+t11AqZVWu6viYuZ7
 p9w6VgbxwRYkOgsry8FmlUDGZT55X/ll5znDrmICrx0/OZGytGbwZZ+w4eN8jZuA+4Mm
 O2Y8Ta5fpPH5KUBkgzrybPt9GTze4Pb7IkPEB0bZQvlWKs/6DwYBR8L4x+Inhwkv810l
 hWwHJ0TfpY0CupN1UXhwgyaG2qj3+d2U5u62fhUdgJwqW+d3b0j4mG4RlMVwBf4/wI0H
 bHAvQDfq/s4TZfRxSdjA2ujxxJIWb8ynKa00wPAaBqHGlugBvIBOlZ2g0R6Sd/LG1uWK
 bwEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693780768; x=1694385568;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=64IskuQuClXBpnMvldmQrJ5JN6x55RtC96YOLaP2MLE=;
 b=d7tWL3oVBZYreRCSCHS6X2Zw44sFiP355G0poOIyJ9qLPeO4DqeOWcCynRF3kNfEe0
 3SkaIiAEUB25+MEgXK51iC00/uLj0TDm4osXcSCbjBdQROhRuZtFQxS0vriRkKTSeqtM
 Aywtv7qih7tehqz0P0x3ef3I4U/1wMMvnGl3WO8I85OFJbpn6spCWNUmPvHdyBrOyyl2
 gEjWZku5PaE+nsvI31P78aSKCzIgYS0ypk8qo05KEwmdZ3I2YZDsqkkgVm1vJ2O8zIGA
 oj0pTKbHrHdWr5hgw4bRxwenaL610UU+aXQxG3AfiTy1jp1YL+KkkiCEvGxrr509ZkBM
 0ByQ==
X-Gm-Message-State: AOJu0YyAWs/chn2Ukmg+dxWUi4zphbN1HYuWfRcygbYZSjWKntoxMxMr
 BgI7Tp2+t/aUHhfSJh6RbGESMg==
X-Google-Smtp-Source: AGHT+IEx1q4XhkhCeBmp20jVm4futZYqogZ7sv4YonHFB6mBEBeALQ2rV63p1riW/bCqaQU7aIQdQw==
X-Received: by 2002:aa7:d9cb:0:b0:525:69ec:e1c8 with SMTP id
 v11-20020aa7d9cb000000b0052569ece1c8mr4984850eds.40.1693780768344; 
 Sun, 03 Sep 2023 15:39:28 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 bo9-20020a0564020b2900b0052889d090bfsm4972604edb.79.2023.09.03.15.39.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Sep 2023 15:39:28 -0700 (PDT)
Message-ID: <900f1290-e7ed-4f61-be10-53955171abb4@linaro.org>
Date: Mon, 4 Sep 2023 01:39:27 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] drm/msm/dp: Simplify with
 drm_dp_{max_link_rate,max_lane_count}()
Content-Language: en-GB
To: Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230829184735.2841739-1-swboyd@chromium.org>
 <20230829184735.2841739-6-swboyd@chromium.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230829184735.2841739-6-swboyd@chromium.org>
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
> These are open-coded versions of common functions. Replace them with the
> common code to improve readability.
> 
> Cc: Vinod Polimera <quic_vpolimer@quicinc.com>
> Cc: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>   drivers/gpu/drm/msm/dp/dp_panel.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

