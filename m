Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E8F790F02
	for <lists+dri-devel@lfdr.de>; Mon,  4 Sep 2023 00:37:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3900710E245;
	Sun,  3 Sep 2023 22:37:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5573010E245
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Sep 2023 22:37:18 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-52bcd4db4e6so1080445a12.0
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Sep 2023 15:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693780636; x=1694385436; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JTU8KrO8RUU8FiWRZw+rl4K+4j0rOVVykAlc2x+Gur8=;
 b=nBd9hH6CDLNyUtBypKW8x03anF/EmjxdvGuYR6nuoBo1KVUIOL9Mv03tw9xJK3pW9J
 gaqOPObzcKs6E4nS1MYa4dxgpMKEq+swdxm5sp4P1UmiQiypN1oQJOzBNU1vuODzIf4H
 +bN44nWMDVFfPH1Mk/i4gGwb9gccF9h70d89hqphsEs3Lo0VIM00luBT2eHRXwREGAGs
 B507bDhzh2p95UU+b1uMo3QLo0HOeVcw8U2R3UOeMmVmcu15rCDIICLYsSO/qQzSLR0g
 SIn33Enkh2pddw5CG5K9SdkWQTY/HkoLCPFgf/pMngp6Kz0F++D6HM/ck5I1Rggrn+qA
 5+nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693780637; x=1694385437;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JTU8KrO8RUU8FiWRZw+rl4K+4j0rOVVykAlc2x+Gur8=;
 b=G8L/cxfnWr9sy0iWHaPafRORneJnoXYS+t6TP4Oa+xcoDqqHOpPGCAbkCIUTB0rV3u
 UMtm3Yx4cR0LePqbutw+o9ev1/JsgoSVCtdn2eYuxmb0Rg6k1hGz/LF6G4GtDOq9PlEt
 cnVjf3nnotOurzDLI52G8w0q5MQWeUUNqgPpTdUPmrSBkTXFToG5kEk/kIlsiwyK7X4t
 7hpy9gA+A3QYq2U3L5CVJ6Kmx/QqAa5jSD6nhy0f3JuBa2tXUccMP3Qj2xMF9isPyH7m
 ww5/BV21j20IArndK9Lu+bOPxvveFC2jzrhhp0Vl9EAWYdrFFXFlO6MRy64iwzIYOWPa
 WbyQ==
X-Gm-Message-State: AOJu0YyQ4g2cCmovryCfWqk/pkCBRRRZrE5hQmtJeymnZR6eN/4Zp/7B
 hOsA1DITFbpxCh1ZLEsjBNq1Ig==
X-Google-Smtp-Source: AGHT+IH887EsApjxxqgeKDwZfphqZJP+92AGGLQhQH1W/cbewlBiwmTzV6SErfuj2s5lfRAgmYmXeg==
X-Received: by 2002:a50:ec90:0:b0:523:3e90:68b0 with SMTP id
 e16-20020a50ec90000000b005233e9068b0mr5378864edr.21.1693780636732; 
 Sun, 03 Sep 2023 15:37:16 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 bo9-20020a0564020b2900b0052889d090bfsm4972604edb.79.2023.09.03.15.37.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Sep 2023 15:37:16 -0700 (PDT)
Message-ID: <1c7b1397-de05-49f7-8e26-3244fbd1573f@linaro.org>
Date: Mon, 4 Sep 2023 01:37:15 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] drm/msm/dp: Replace open-coded drm_dp_read_dpcd_caps()
Content-Language: en-GB
To: Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230829184735.2841739-1-swboyd@chromium.org>
 <20230829184735.2841739-2-swboyd@chromium.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230829184735.2841739-2-swboyd@chromium.org>
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
> This function duplicates the common function drm_dp_read_dpcd_caps().
> The array of DPCD registers filled in is one size larger than the
> function takes, but from what I can tell that extra byte was never used.
> Resize the array and use the common function to reduce the code here.
> 
> Cc: Vinod Polimera <quic_vpolimer@quicinc.com>
> Cc: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>   drivers/gpu/drm/msm/dp/dp_panel.c | 42 ++++---------------------------
>   drivers/gpu/drm/msm/dp/dp_panel.h |  4 +--
>   2 files changed, 6 insertions(+), 40 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

