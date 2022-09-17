Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E2305BB9AB
	for <lists+dri-devel@lfdr.de>; Sat, 17 Sep 2022 19:03:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5FF610E3DC;
	Sat, 17 Sep 2022 17:03:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5D9010E3DC
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Sep 2022 17:03:30 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id w8so40340709lft.12
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Sep 2022 10:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=CNlP4WjQ5gD2dVZdm851YFALcjCKHtccpYUpR8J49Z4=;
 b=DfnUDIDLdqg6CeGSnomPiIyWPl9FGL/z455mP7Ly354UMsEwXqUKDKNMZTgG8qHPNL
 iYgOdL6YvessQlDBOFRxqA4bb52EMcOfI7IjvDpiKNGcCgell5vLizFbrqkTxA6LAmpN
 qunDNkWcVGUT239u2rrhYWET0wfCLC6hpQfu40QpY05Jn2N8W5oMsUNDpd172nBVbxQQ
 sSZBNH6QGp/r4D11puhNqSYCnilEK3vW7hgZdg5B8+snXYHDuq86Oa2l4r+0idQ5uRVt
 c0HOzShWNXIGDjGn1duIXbU1UpvEFx1ELV3bpMNem8ZLM0VCr/KoCLahPTxP8BA7nqmX
 mXCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=CNlP4WjQ5gD2dVZdm851YFALcjCKHtccpYUpR8J49Z4=;
 b=U8uGmlg7b0uFFa9JdKCJwGnYGi/9Hyau1g4iUB5damLV6/XqaQjVQIc3DWiK7AYamE
 431omUZ1szH0eR+XJFql/283TU28MGxcA4HWEcy0EuK/lXOQy5bnky0veNX68eyiQj5D
 Uw+MAst2NZAMm2wbU9qhHmrUarAqNy42dOTNODiXIt+yrbQzPUVQqSNELTKPIvyhrQAu
 19BpsQx+pgC3hsOvvFLdIMHC39TGZELwNz7kQv94rt5y2ryzYO/blrvdal3szn6WeU0m
 RyIGEkJldTNAHwLmfgzjySz56y6rfjwm37BqswvWyo7WFef4hK9XwD7jHqAHo/I86OoD
 iJXA==
X-Gm-Message-State: ACrzQf2uJmOgjRnZqsoLzE9mAvuErh1n0Dp9MgR4+3NgIF/zmEQVgWcN
 STTA/rDGlpZl8oKJWtymRyOS5A==
X-Google-Smtp-Source: AMsMyM6yCCGGK54OXLJ5OP/agtg//cmMTA3Jc3j8bIg9aGqi9wiv0UUto5VjD5mRdOjt7u8CLVTYig==
X-Received: by 2002:a05:6512:230f:b0:499:dcd:2fd2 with SMTP id
 o15-20020a056512230f00b004990dcd2fd2mr3715968lfu.677.1663434209040; 
 Sat, 17 Sep 2022 10:03:29 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 z1-20020a05651c11c100b0026c3975f488sm951701ljo.26.2022.09.17.10.03.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Sep 2022 10:03:28 -0700 (PDT)
Message-ID: <1641e41c-08c7-859b-644a-28d966fb00f3@linaro.org>
Date: Sat, 17 Sep 2022 18:03:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 1/7] dt-bindings: msm/dp: Add SDM845 and SC8280XP
 compatibles
Content-Language: en-US
To: Bjorn Andersson <quic_bjorande@quicinc.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20220916200028.25009-1-quic_bjorande@quicinc.com>
 <20220916200028.25009-2-quic_bjorande@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220916200028.25009-2-quic_bjorande@quicinc.com>
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
Cc: devicetree@vger.kernel.org,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16/09/2022 21:00, Bjorn Andersson wrote:
> From: Bjorn Andersson <bjorn.andersson@linaro.org>
> 
> Add compatibles for the DisplayPort and Embedded DisplayPort blocks in
> Qualcomm SDM845 and SC8280XP platforms.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>

No need for quicinc SoB (unless you also take ownership).

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>\


Best regards,
Krzysztof
