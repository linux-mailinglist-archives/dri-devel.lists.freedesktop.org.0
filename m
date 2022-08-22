Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6E859CA14
	for <lists+dri-devel@lfdr.de>; Mon, 22 Aug 2022 22:35:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9619BA224B;
	Mon, 22 Aug 2022 20:34:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C551A21C5
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Aug 2022 20:34:09 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id q7so13203731lfu.5
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Aug 2022 13:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=n+5KOQrd1zcRYfj9IdOVX1teuqbwsnScpQd/P5v+XSc=;
 b=MnkO0GK7zPhGQTTU5nw22JzPP9cYth/4/+c9bbtGBTRxAlXSdkDkEvSNUvm33QL5t8
 lh4V8HDA8GJw9DsqErxuEZxsOWEDElCOuEvrTQ8ApAHvDNqbm59AvfwlaHzhYTeulNWD
 cVLULTK4JVItAv4cPkixwjXDi+ZNr7lBjMMyOIrwVQhgApjnpK1NCiStUIYwHLmIFY+N
 qCru4TN8N+SMWvE1C3787wclJFRAAEO7GYowJviQYOiGIdgUUM5xbzhVVHgnBGWd/Hr+
 L6kYIDRD6ZbrYauBfF6bREQLbSdCCIaXmvg4g8oU/sngSa9//hAjP2d2mokpGgsrQfp3
 0GKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=n+5KOQrd1zcRYfj9IdOVX1teuqbwsnScpQd/P5v+XSc=;
 b=zPE7vCEI/x2grI9VI4N/fr7Zn86C/8e1vqfqF3Rb+fUmdaFnAntg0VLYWFHQgjKEiH
 akIWg3DgGs/x9/qVFjraa4wA9eUutUKggVr8LHiKBAMW3v51MGwXSC6fsYrJ218Kl8Z4
 cxbK/Bn6wtH55nyqkXBkHuafNKDjtKSVCYNwiEPPAFAK1hnzJfBmyjjz0rv6m5xGVf9X
 0lC/D6bNIc4/bBxvnHmWFu/ZegbKsXeFDtt7b4v9+cW/AM0pE4Vzb7MzuF7IsmoKAEoX
 RhnGE+V2Res0EABX6HeOE/4PFS2ZLn6SPHTlIZMpAM7f4Scs3F5T99D1eF2tj26U0OhL
 SqUg==
X-Gm-Message-State: ACgBeo0idz4vhd4lC/ufmSIfRDAQuQOog8d7kSOnT+I1qedudFx3MQa7
 9uiwAsXvYWx/y1LoCE4as1cSMg==
X-Google-Smtp-Source: AA6agR753dxf3W5qo9qPUq3jDVTHWl504cW4UYh1AEjc/sllgbZkCbVKuNBo4Z3dcTm6sKBfN/fDrg==
X-Received: by 2002:a05:6512:1583:b0:492:c028:d2f3 with SMTP id
 bp3-20020a056512158300b00492c028d2f3mr7999834lfb.216.1661200447407; 
 Mon, 22 Aug 2022 13:34:07 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 13-20020a05651c128d00b0025e4c560475sm1991849ljc.96.2022.08.22.13.34.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Aug 2022 13:34:07 -0700 (PDT)
Message-ID: <e13e644e-0f18-b338-1068-e4405def3c6f@linaro.org>
Date: Mon, 22 Aug 2022 23:34:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH 4/7] drm/msm/dp: Add SDM845 DisplayPort instance
Content-Language: en-GB
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Stephen Boyd <swboyd@chromium.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>
References: <20220810035013.3582848-1-bjorn.andersson@linaro.org>
 <20220810035013.3582848-5-bjorn.andersson@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220810035013.3582848-5-bjorn.andersson@linaro.org>
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
> The Qualcomm SDM845 platform has a single DisplayPort controller, with
> the same design as SC7180, so add support for this by reusing the SC7180
> definition.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/dp/dp_display.c | 1 +
>   1 file changed, 1 insertion(+)
> 

-- 
With best wishes
Dmitry

