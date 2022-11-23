Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 219EF635988
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 11:20:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 498E110E539;
	Wed, 23 Nov 2022 10:20:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E757B10E539
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 10:19:59 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id g12so27504842lfh.3
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 02:19:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wcEhC14eey3OipJGC9PHGuhf2ZSRAQeKcc070wSp9zY=;
 b=OhLsJ14k8BHQ1JtpAx3RrRI1Q2lSGUnYsZmc8eVrkbyY78/BKyhu17VAPG88/7B5dw
 pYwzWBH0VXGnTGKhdxCm/PNaOrL6QqXndiR1Q7FIDWRduIFzdWF5NW66V0mKBUt3qXVX
 CBaypwxJedKzhtJamJQSziV3Ihx2i2BbVS8bMPrf5OTbC05CzsjXRzbn9pmGqlyd6ySJ
 +LhteW5RTbkyttah/UkLfnn+2btK/AQye/S9rYdKlUMS9yETgC586giPa9cdw0iUy+Ex
 4x/IyroFjpQ4rvn7lz7iMBmkQnz/3TuBTH6UJoD35YuryKavg+7GiUR3JVwkO4MF+C41
 cjEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wcEhC14eey3OipJGC9PHGuhf2ZSRAQeKcc070wSp9zY=;
 b=IatzkV0W/qIW+Hm0dZTEs0N62LJipIfSIY02JFOUBYJRkqPsqxVoovqI2zFqFwJ1Ab
 r1DuDKNlH/ndToTpVsB6ypgda+7k03GogQ/qAE83ceDh+eqw5fRnV+OcniqrHxs/O2cP
 zk77Apr02X8sIAupSXGO1IMJjiPkvNWrZ5jy0P8sHm54VovcWgJHw8txxnLBESpPK2B5
 mFcbzqrDu/gdcSzYtFLyYBIGmhPZBq+DqpsTOiSd96Az4Hs1og/IT013SGCAyv2rXxHy
 hsvAoKNm4F9GrGHIhM5PFLOOOq0nAHhDD/Wv9mMTLVgKwhgYHbKQZc2ix6AATRbcWC11
 ZHWw==
X-Gm-Message-State: ANoB5pnNCPuKsPn7ypcSVUTR5/57S+qL50LLJybYxTWgEV0tI2RMpjU9
 KYWeFnzClRC2ovrR4KAAJQKYrw==
X-Google-Smtp-Source: AA0mqf7Fnoiose8tFgDHJPcjMa7kbY6JJPrliBCN6rODrYiAtw1SYLXAF1GyscHc7BCxjfjeCaiXrw==
X-Received: by 2002:a19:ca4e:0:b0:4aa:bad8:9b5d with SMTP id
 h14-20020a19ca4e000000b004aabad89b5dmr9027202lfj.540.1669198798258; 
 Wed, 23 Nov 2022 02:19:58 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 k24-20020a05651c10b800b002770473d813sm2083037ljn.140.2022.11.23.02.19.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Nov 2022 02:19:57 -0800 (PST)
Message-ID: <40d5c7f3-148a-a5fa-fdf7-6fd301ec3a2d@linaro.org>
Date: Wed, 23 Nov 2022 11:19:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v4 03/11] dt-bindings: display/msm: mdss-common: make
 clock-names required
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20221122231235.3299737-1-dmitry.baryshkov@linaro.org>
 <20221122231235.3299737-4-dmitry.baryshkov@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221122231235.3299737-4-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 23/11/2022 00:12, Dmitry Baryshkov wrote:
> Mark clock-names property as required to be used on all MDSS devices.

This we see from the diff. Please tell why you are doing it. In some
other recent bindings we dropped clock-names from required, so this is
confusing.

> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  Documentation/devicetree/bindings/display/msm/mdss-common.yaml | 1 +


Best regards,
Krzysztof

