Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 437E35A22D6
	for <lists+dri-devel@lfdr.de>; Fri, 26 Aug 2022 10:20:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6BFF10E735;
	Fri, 26 Aug 2022 08:20:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC7A910E735
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Aug 2022 08:20:33 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id w22so878550ljg.7
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Aug 2022 01:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=ZIIB6p8+GcEolV6RN9oSlXFiG4o6xXTtdv/9DOxOtXM=;
 b=tNPjXlQj9Q80gxPnM5tgHSO1u9W9l2FXH76KS++DyEsHaLkMFf2lpVZaIyVo2bd+ik
 BjHUmIMnW/Wva8Al8IK1zGCUKIVe9UPUV3MuV9JzSQ2iVul3RI0OIXUgTn2e0mUT3a9O
 KrBERk0GxHPR65SUAHH1aUkt5k86yoHIdkmMED9uwCHMpA/He2mIrvDGkFOUksZeYqVI
 QWsJLBiS/Aq7G8HfyJGetZWQjhBJK2J0qrKAurZld9vCyncIj2qE81hr66pawyGyaBic
 EK53YZjsyiHeGq6pI7TNYOfCm5co9dTo6+1rzB6yx5lzel3bZ3w/CNAOcBSAkwKcmplM
 YKFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=ZIIB6p8+GcEolV6RN9oSlXFiG4o6xXTtdv/9DOxOtXM=;
 b=WDOS53ALtzMipe9uvX0xrKzCK/kVNN8vu3o2lV6SWCPGTCt+d0am4oGYnsaEptAeUD
 dUiXVV5Z3GI7T9bmj3NE4JLmhKgsDtA7zWyq+gp4psAI2CE9lHx95rjpmINMwbeLOfZd
 Dm2LOs30ZXrk57NKbe62ewN+bE7SG8VeDR7FN8sGULTEac8AlAbOB1fT6DJWf6dSfVkQ
 R/6d8wedLAalu0JJ89xDwvYzvTAMqkrQ7yLX8bpQ0zH/LIRps0CtUaj3cp1qLBDXlPd5
 wyBFEDfShxvtvQZY7G0oeurNwZzz5Br4zDspipNB3nQg5P0gIFD8BFkNJ+Q0ISeMyocz
 8IHg==
X-Gm-Message-State: ACgBeo1ixZBzzYAZBbLV+ZmIoad3RPNxScHs/Ghxxw7EZHKu7HbTg/5S
 vqJNPj97arJMsulwHq6gl8b4Ew==
X-Google-Smtp-Source: AA6agR4vV/tZcz4yv4jCGwEcaNKj5eE+IrPE4xj/nrvIDdQLzWzu8KXdbOSxPkB5zlMQotgmL5gKGA==
X-Received: by 2002:a05:651c:17a0:b0:261:ac0d:6c45 with SMTP id
 bn32-20020a05651c17a000b00261ac0d6c45mr1984674ljb.225.1661502031668; 
 Fri, 26 Aug 2022 01:20:31 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 p1-20020ac24ec1000000b0048cf0fef301sm287425lfr.301.2022.08.26.01.20.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Aug 2022 01:20:31 -0700 (PDT)
Message-ID: <b5400980-9736-0756-42d3-84acc918bcb6@linaro.org>
Date: Fri, 26 Aug 2022 11:20:30 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH linux-next] drm/msm/dsi: Remove the unneeded result
 variable
Content-Language: en-GB
To: cgel.zte@gmail.com, robdclark@gmail.com
References: <20220826072821.253150-1-ye.xingchen@zte.com.cn>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220826072821.253150-1-ye.xingchen@zte.com.cn>
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
Cc: freedreno@lists.freedesktop.org, dianders@chromium.org, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, Zeal Robot <zealci@zte.com.cn>,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, vkoul@kernel.org, laurent.pinchart@ideasonboard.com,
 ye xingchen <ye.xingchen@zte.com.cn>, sean@poorly.run
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 26/08/2022 10:28, cgel.zte@gmail.com wrote:
> From: ye xingchen <ye.xingchen@zte.com.cn>
> 
> Return the value msm_dsi_phy_enable() directly instead of storing it in
> another redundant variable.
> 
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

