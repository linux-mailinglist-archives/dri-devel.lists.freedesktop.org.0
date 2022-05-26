Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB2653473F
	for <lists+dri-devel@lfdr.de>; Thu, 26 May 2022 02:00:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 272AE10F022;
	Thu, 26 May 2022 00:00:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F1B010EF6B
 for <dri-devel@lists.freedesktop.org>; Thu, 26 May 2022 00:00:44 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id 27so176753ljw.0
 for <dri-devel@lists.freedesktop.org>; Wed, 25 May 2022 17:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=5zFPj/Lsz3VZ73WXe7ELTaWMJ+ZxRrgEb+Xb7Ni6Ng8=;
 b=rRb5O2lnxUEM86uGzt4QARS8Zro0rCTRgxDkl72s/BixfUdbeOJwKVcaD6sELjlSeL
 4wmxYHFoW+AHCNuRytUGE4osuUmVWxyQCJatTr9mFb0JWbVTuj5hDcbb9Bx8ah5Y2ANr
 oZTJ2gOqyKcx6NfQ1+DdnUw4f+31qvAbu/fiaIekn4aWvMj0V7Z20BLH0f0nR83FZBeU
 8K4sAyz8DXY7Xn2Bgx2Y+YDU1ceZ5+zxwx6tlN/oN5VCtrNT8SE8QCnKSE4zm7F87OUp
 ALjVkTFCx/ZYSdNj/vQB71ouBav/PQRWiNsrSOYkR4UPxJwDV5WsXpsy1zIVEox2c/E7
 8wnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5zFPj/Lsz3VZ73WXe7ELTaWMJ+ZxRrgEb+Xb7Ni6Ng8=;
 b=3/x7x2JFSAALiVld7j3I/wSc4oG8S2fDU7of2rrQ7hcTjP9q/N77VKdX5muk3Df/aF
 WdZGvmnzH3mQNrPCNSlXpGN8Vzk0dHa9uFA0jiNTvVZj4kl1CzmBo6eEqtvsd6ZK8wFS
 mdhSOrksBKAHq/L4MXpGZFCB0Li+P3k2MkqArKOeFIWIVm+ldvYZo8zYO3vnNMkxzlRP
 SpWa9ggPDiLT7c4lssPz+GcD5qbBpnGz6xRTXqLWmXxbyEV/9UyONIqbLfojFqdCZZDY
 CcNSL7cjI99C1StAiVOi6OYNjkz1MXPFr9KUZi/ofWAVLpEkV1C7R9B9oip9E5FqZNXH
 DrbA==
X-Gm-Message-State: AOAM530annRZM8Wa6kBT5oDtCl01T95gIaown0nVfhf/7OzpMOSf0Bt1
 d5J9rLQ0mlkzL7cUu5BqrDDheQ==
X-Google-Smtp-Source: ABdhPJziV0fg3DLoCNTmn2wELrZo2bGxcnHBlQlnXkE4kaPIaEikeAE1K5M8cxYQfWgnJZf5fwVgtQ==
X-Received: by 2002:a05:651c:512:b0:253:fd41:12eb with SMTP id
 o18-20020a05651c051200b00253fd4112ebmr5878583ljp.429.1653523242170; 
 Wed, 25 May 2022 17:00:42 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 d13-20020a19384d000000b0047255d2118fsm16353lfj.190.2022.05.25.17.00.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 May 2022 17:00:41 -0700 (PDT)
Message-ID: <941eb91e-cc80-4987-f481-63bd53b739e0@linaro.org>
Date: Thu, 26 May 2022 03:00:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v13 1/3] phy: qcom-edp: add regulator_set_load to edp phy
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, airlied@linux.ie,
 agross@kernel.org, bjorn.andersson@linaro.org
References: <1653512540-21956-1-git-send-email-quic_khsieh@quicinc.com>
 <1653512540-21956-2-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1653512540-21956-2-git-send-email-quic_khsieh@quicinc.com>
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 quic_aravindh@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 26/05/2022 00:02, Kuogee Hsieh wrote:
> This patch add regulator_set_load() before enable regulator at
> eDP phy driver.
> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/phy/qualcomm/phy-qcom-edp.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)

-- 
With best wishes
Dmitry
