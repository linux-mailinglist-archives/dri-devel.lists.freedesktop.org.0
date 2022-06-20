Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D015525A1
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jun 2022 22:15:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73E9C10F0A4;
	Mon, 20 Jun 2022 20:15:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B85B10F0A4
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jun 2022 20:15:20 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id a2so18967979lfg.5
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jun 2022 13:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=7mAWEwAU3gEZq8Qvtb1T/fLaJhz7mNwcR+3nDyAol1c=;
 b=Af33aLyo8HjKfrZ7Tc+1YWc476VziQp2himHkyoFWjTGLRheFt9rw1VVDTsRVSyD4q
 XxRoWFO+bb+8qzrmoI7vKYC4yS1cKImApNAI8ZSxtWG4Wc0p82TW8D1xsoEe9iix8MYA
 2Z1xeFv6bW6dTAiTdkqypL+8I2FDLVrUMwkHQ0uzL66Somw4XDfS9rBbXoCl3iRWDdKW
 6eLR5RMhWVzaqDg5NCkSgqnPvaDR6WN5l63YX/ZhmAn3ZjsxaNkB0CKMHxj8BWGtvr3/
 vsezFsOpTf6lmvXwAM9UBRqcheNcmMg197NxAy9gGwExF3Cv6Dp29M2CVEqMcP+qLWvF
 9mMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7mAWEwAU3gEZq8Qvtb1T/fLaJhz7mNwcR+3nDyAol1c=;
 b=GUYvtCI6IkYa8Jg99P/cAKoBEhuxSyDaB/MhziCqX6uLCnbs+8/cplXLWpOkfLHYDK
 pRKW0n9bQWqw1pMXhdq2EOhM0NBMpxwLxg9sWmzldhq5oMFYow7Dlgts+VrkmHedhXLM
 +EWPsdWLn0QYfWymJUKIV1tPOqDTJ8S4TzYkeBINh+4REavRiJKwuq7jdbety4We5wmV
 xV/R2maXmn4JbZ7i9aCSrgGXlsxqrIviMb9xzaP9Rb7PaQNzXGd7hYyOksYXavesxWpZ
 bN35fOZKHLeYsdyDS44C7tHghwI4clp0uQIYeap4U6xpX0jPThK56wFl61N1meNth3+D
 IY6Q==
X-Gm-Message-State: AJIora9bN1WvTv643/mrshuw0UkkBcA795B70+i9LGtUDJQ/NUD+EZO9
 0jyblWhYby7MF1Y3p4xR4oyt8FupQnd01lhl
X-Google-Smtp-Source: AGRyM1tdY5HOm7jCkDbumUbmMeZBimWkY2nijF1Cx17PbLew7kqeN/gZY8SRY8xVzHcig7PQRCer7g==
X-Received: by 2002:ac2:442d:0:b0:478:ed89:927f with SMTP id
 w13-20020ac2442d000000b00478ed89927fmr15057480lfl.545.1655756118881; 
 Mon, 20 Jun 2022 13:15:18 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 i24-20020a196d18000000b0047f71e4b0e5sm439334lfc.255.2022.06.20.13.15.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jun 2022 13:15:18 -0700 (PDT)
Message-ID: <3d8f5a58-0efb-af27-eb19-ee2236a942ea@linaro.org>
Date: Mon, 20 Jun 2022 23:15:17 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v14 2/3] phy: qcom-qmp: add regulator_set_load to dp phy
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, airlied@linux.ie,
 agross@kernel.org, bjorn.andersson@linaro.org
References: <1655755943-28594-1-git-send-email-quic_khsieh@quicinc.com>
 <1655755943-28594-3-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1655755943-28594-3-git-send-email-quic_khsieh@quicinc.com>
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

On 20/06/2022 23:12, Kuogee Hsieh wrote:
> This patch add regulator_set_load() before enable regulator at
> DP phy driver.
> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> ---
>   drivers/phy/qualcomm/phy-qcom-qmp.c | 40 ++++++++++++++++++++++++++++---------

This was not rebased. There is no phy-qcom-qmp.c in phy-next.
-- 
With best wishes
Dmitry
