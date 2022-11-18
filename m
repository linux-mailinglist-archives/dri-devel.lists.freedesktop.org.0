Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2172862FA6D
	for <lists+dri-devel@lfdr.de>; Fri, 18 Nov 2022 17:38:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB75E10E773;
	Fri, 18 Nov 2022 16:38:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7989110E776
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Nov 2022 16:38:43 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id be13so9076343lfb.4
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Nov 2022 08:38:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=//tIyOnKPA/iZeg3Et4uYN9NmJnJYA0WTAZ1QiP08n8=;
 b=vKdrftphtMtov+8nlbBce6xE5zlGdHxeDTePcVcvufdsz77Yfps0DeXayZrmIOM3CF
 ICuPDaCEsuf9SmG4WLgQm4Hp31jctQPoNDGoyxfsuF/Iq7//1AIYUDlMH6vZBKQ48Gk1
 wYkCI6ul0gXegOxFElSAlFiFP2gGLNwr+lfSXY3BjbQwIJMWI4FzzJOOeSFCAdpidimj
 cWyeTpNSzEcmTnStP9Z0WxldfLqUtw6cuw4M/pAWHiyTGJn6tVKv1bc7ZCaX00tnmUQL
 0z+t1iLuReVzr3+1QxXNmbENNzFmIU82+3jvVUhybQP0ZshXj8OR4UfV8nq3Y/kdTwa0
 FqLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=//tIyOnKPA/iZeg3Et4uYN9NmJnJYA0WTAZ1QiP08n8=;
 b=ViOFd1SULkqbwdKzWKC4iIkDCFE6xLMWR/27q7Ik7IswCS1s/3ktp6X4IrxDdoVPFr
 279EimEKcYOxTSGMvh9XkNHUed0JQg+5ERBdZ6gci5DfcXbdlwcq5+8YmeDagc+ggKbd
 ss3Vvlw0p/95vf1dpVIV6SIClPx+HScBnDHIkqKCX8J2RAum6BXp2o72DCPZ3l7lgP5o
 /dgIdehMLrU5MnNsiuA5GV8AVAuYz/FkJqQyV+8Aj9ibOJTzlqPpxSPrNE0yH7rtuyAz
 pQ7k/NupBDB04OIwLesQAyn11AusxXW+HEUTHHdWPdCH4/9HDw333PKLNTrtzpfPT4XL
 8r9A==
X-Gm-Message-State: ANoB5pm/AxH4MCWdhUc0cnWovAbL6Y+CbWpb4abNm9uBNCxIr+8giY6V
 cFnEgA2RlUWZYBVTx7g2hwQqgQ==
X-Google-Smtp-Source: AA0mqf67eaKlAXmxGcQbSZPBKb/PDZ/zIfqG8B4OZOOEkWap6/wMTj9F/yrMbuK1asszhID7j7JRWw==
X-Received: by 2002:ac2:58ee:0:b0:4b4:af5d:1e22 with SMTP id
 v14-20020ac258ee000000b004b4af5d1e22mr2552908lfo.660.1668789521735; 
 Fri, 18 Nov 2022 08:38:41 -0800 (PST)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 n25-20020a195519000000b004ae394b6a6fsm724080lfe.246.2022.11.18.08.38.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Nov 2022 08:38:41 -0800 (PST)
Message-ID: <137c685c-f889-e29f-af0f-67c3395fc7f4@linaro.org>
Date: Fri, 18 Nov 2022 18:38:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v4 0/2] Add data-lanes and link-frequencies to dp_out
 endpoint
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, airlied@linux.ie,
 agross@kernel.org, bjorn.andersson@linaro.org
References: <1668789389-14617-1-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1668789389-14617-1-git-send-email-quic_khsieh@quicinc.com>
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
Cc: linux-arm-msm@vger.kernel.org, quic_sbillaka@quicinc.com,
 freedreno@lists.freedesktop.org, quic_abhinavk@quicinc.com,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18/11/2022 18:36, Kuogee Hsieh wrote:
> Add DP both data-lanes and link-frequencies property to dp_out endpoint and support
> functions to DP driver.
> 
> Kuogee Hsieh (2):
>    arm64: dts: qcom: add data-lanes and link-freuencies into dp_out
>      endpoint
>    drm/msm/dp: add support of max dp link rate
> 
>   arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi   |  9 +++++++-
>   arch/arm64/boot/dts/qcom/sc7180.dtsi           |  5 ----
>   arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi | 10 +++++++-
>   arch/arm64/boot/dts/qcom/sc7280.dtsi           |  6 +----
>   drivers/gpu/drm/msm/dp/dp_display.c            |  4 ++++
>   drivers/gpu/drm/msm/dp/dp_panel.c              |  7 +++---
>   drivers/gpu/drm/msm/dp/dp_panel.h              |  1 +
>   drivers/gpu/drm/msm/dp/dp_parser.c             | 32 +++++++++++++++++++-------
>   drivers/gpu/drm/msm/dp/dp_parser.h             |  2 ++
>   9 files changed, 53 insertions(+), 23 deletions(-)

NAK. See comments to v3. They all apply to v4, except the removed pr_err.

-- 
With best wishes
Dmitry

