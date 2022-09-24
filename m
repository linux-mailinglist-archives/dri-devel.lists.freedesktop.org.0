Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6A45E8AD7
	for <lists+dri-devel@lfdr.de>; Sat, 24 Sep 2022 11:31:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D33F210E5AD;
	Sat, 24 Sep 2022 09:31:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF43510E5AA
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Sep 2022 09:30:54 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id h3so2475683lja.1
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Sep 2022 02:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=IBvwqmIkee/mEk1eD5GIAynGE3bP9mLepq0/KSN1Z5Y=;
 b=hh7eQEeW6wXs4cFtgikwHPFejQs6Z2iZT49SRVErbpM0JPT9bkVbj+UE4NK40uTWGx
 yRRzZxZkcyeWhPDshqZT7nOCg10uktxFTJ8drdK0gqu8bzXz8I/sWhhgkCNZDoQn66eK
 rrzu4gXwmRZXRqO2LEs4ZiH2zwjj7MIlm6LiU8Xe2hWTeOwYcy8WBNN3n7/KrYVHyfLV
 juqQjvBR6EP9GRQaO7dV9BppulXNEoQ65mAYdLHi6B+sx0MpUeAlVzwm2UvBU0XXHsFw
 40ebE3mjnhuTmi6gkIrd5xMCyE2fY7zxWkgPUbe2YMaPlfa+JePEyUrdoEakscxGeF1W
 /A2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=IBvwqmIkee/mEk1eD5GIAynGE3bP9mLepq0/KSN1Z5Y=;
 b=DxHlOp/zNvgfh/h+SWzdxb/z8HsRdzopXKbcIoMR0gpAzEmwJJlwMPeQS4ZErdNSNW
 lWupUG5tXjzNE7GnTqbX82dmIXE8zmHafoBBaty0IqsjdXpVnMw2uMSd9w56o6Q1g307
 Cu052xxCbTsN53dVaRQ9wI8DDSs/cAuPvt0p2UjHGJdTjBlXstoP9wun9EPPfa0E2+6X
 HULZZLG6U77id9eULUOzTqwaWtISQ54/x/0ph7reIvL2SO22/VM5zJMfV0hnVmLH/PQc
 +U85BcH5Z6haqDEbXtQyWpqknfwcFreckgCaXyERkNjYN4UsI6arb5mxF2qimDqUNyqY
 bmQA==
X-Gm-Message-State: ACrzQf0MwX7dBo/9vDTYm1o/SWZSfjkKrIVWRhEXn48lZWlvOyy1PkWT
 +YJRme4htz2MW0ctPwwmcqbUjg==
X-Google-Smtp-Source: AMsMyM6q7OFFmd1o39LcSba3lrIQxa4YwVSfF+8mWBXUcfDHwPhNUgchHb43l4lT5adb2/5ei3KeUA==
X-Received: by 2002:a2e:9608:0:b0:26a:a73b:b8c1 with SMTP id
 v8-20020a2e9608000000b0026aa73bb8c1mr4456920ljh.328.1664011853076; 
 Sat, 24 Sep 2022 02:30:53 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 f5-20020a05651c02c500b0026c0d7a9f5bsm1712863ljo.96.2022.09.24.02.30.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Sep 2022 02:30:52 -0700 (PDT)
Message-ID: <bba397b9-891e-4ff4-17b8-cd15c04b4239@linaro.org>
Date: Sat, 24 Sep 2022 11:30:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 3/9] arm64: dts: qcom: msm8916: change DSI PHY node name
 to generic one
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220924090108.166934-1-dmitry.baryshkov@linaro.org>
 <20220924090108.166934-4-dmitry.baryshkov@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220924090108.166934-4-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 24/09/2022 11:01, Dmitry Baryshkov wrote:
> Change DSI PHY node names from custom 'dsi-phy' to the generic 'phy'.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

