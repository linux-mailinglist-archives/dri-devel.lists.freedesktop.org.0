Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2569E61728C
	for <lists+dri-devel@lfdr.de>; Thu,  3 Nov 2022 00:26:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11C4A10E54A;
	Wed,  2 Nov 2022 23:26:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1973610E546
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Nov 2022 23:26:25 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id f37so196328lfv.8
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Nov 2022 16:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4uyZR2sjXqLyFufMaC3oiMlnZtU+QLNchFZs2tyGbA0=;
 b=kOUNsLx5Y6YNxZXAKN99KHZEhCI9RUxJEK/3X6iMvn23FU+0cKFeOwijjRGO/QrEu7
 POwKgPGYxiHvdu1kXfirnmTS3yhpZ/nNh9/sXsntH50AqVSMgreKHQ0SYFrta4hE1UPP
 9yVZnn9s5lUnuZ/OdkhQZ6oe23jccwLSm8uSmpLMino6Oq0mQwSewujiQPFo7jutvlBb
 kaQ0GMfbN53yBLUD+MZALDhCeAMsgCY2e9Mlo/+Wsxtpf+vSqEdp291/h7YaMfX5mXJg
 e7yOY905/NPJHzDElm7R7qZGTNlA/8i3PqQqq9Gdzm+XY659wB862PHA8dNL1Vgyv0RW
 bI6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4uyZR2sjXqLyFufMaC3oiMlnZtU+QLNchFZs2tyGbA0=;
 b=YjZ7JrqxoG2Ga4KFWOimMi45BSu0WSxLuH3xk8GVou5NNCR3eRvjDOD1083dxXffRZ
 x3atGND6FgKKe4nqha0DrsRtn8xA97WvNbcPCSLxhbL1U4NBGzR3l7dqtFfWqfVsIK2A
 3xdFzXalYDvykFG9rZiWm7BoKug0BTCZczwqxpmHWtv676RxmXizqccQfz7O2BSIofEC
 BZcJzLDnWMDGmTP18viLEnRHZTd+xthKRa+oF6K9t4wqIxjhQ8bkoFWqjj7ssT3J+XDA
 M+XIQJomWrp0z3b07ceCYr0h2WAn7GHRN8E5bA4NWxeOiZBAhjYzBcjmfOV9Z/H8M71R
 dMWA==
X-Gm-Message-State: ACrzQf09jZjh9+I1pmaeEcRDIVajKKMfMbOXw0kqHvCRnOaVaZkL29Hl
 HzdL1/WbMUJ5NVCauVlCYwAWeQ==
X-Google-Smtp-Source: AMsMyM7KyTnal/RdmTTT2p5aFTIEEqVQhf0y1ouH5tnV3OgPW/jxPwCYl85ji9r+213jZ0EzyBK+Uw==
X-Received: by 2002:a05:6512:40c:b0:4a0:5b27:76f0 with SMTP id
 u12-20020a056512040c00b004a05b2776f0mr10913392lfk.358.1667431581912; 
 Wed, 02 Nov 2022 16:26:21 -0700 (PDT)
Received: from [10.27.10.248] ([195.165.23.90])
 by smtp.gmail.com with ESMTPSA id
 v4-20020a056512048400b004a240eb0217sm2154391lfq.251.2022.11.02.16.26.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Nov 2022 16:26:21 -0700 (PDT)
Message-ID: <bf5fb954-c71b-f02f-5300-4e030b10811a@linaro.org>
Date: Thu, 3 Nov 2022 02:26:20 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v2 2/2] drm/msm: Hangcheck progress detection
Content-Language: en-GB
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20221101223319.165493-1-robdclark@gmail.com>
 <20221101223319.165493-3-robdclark@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221101223319.165493-3-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Douglas Anderson <dianders@chromium.org>, Sean Paul <sean@poorly.run>,
 open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 02/11/2022 01:33, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> If the hangcheck timer expires, check if the fw's position in the
> cmdstream has advanced (changed) since last timer expiration, and
> allow it up to three additional "extensions" to it's alotted time.
> The intention is to continue to catch "shader stuck in a loop" type
> hangs quickly, but allow more time for things that are actually
> making forward progress.

Just out of curiosity: wouldn't position also change for a 'shader stuck 
in a loop'?


> Because we need to sample the CP state twice to detect if there has
> not been progress, this also cuts the the timer's duration in half.
> 
> v2: Fix typo (REG_A6XX_CP_CSQ_IB2_STAT), add comment
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>



-- 
With best wishes
Dmitry

