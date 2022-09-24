Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0925A5E8AE0
	for <lists+dri-devel@lfdr.de>; Sat, 24 Sep 2022 11:31:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEE5710E5AE;
	Sat, 24 Sep 2022 09:31:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1F4B10E5A0
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Sep 2022 09:31:24 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id a10so2521476ljq.0
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Sep 2022 02:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=RF5aLBH9UafPGsBx2/NbJWWQLB1DVmRkzZOsOwOYsD8=;
 b=pSelQqH70MK7kbykGMMxDNVDHXmjCs9Hv4LFxAVPFP5PzdCM7SX1FJK1cRx0aNWLHF
 dU0FB7D83sewhPBKXqiOD7ZymZdauex6ohlwUMJxb7rMbJ1z/uMUU1k/zM8FnCLCysSs
 SODCDv0MNnt3x3mcnhhflfyywBBMj50er2x7MZ9IYAsbS9nnDQ/qUrWbslhe9CVGvK/1
 vyDUZNjoEN03oF/tXmW6auNz4gUUJ87pxq9YJKJgpZvoSpFYTJtKELPlNMjvkTrhqbu6
 hLmTvKB/Z2cC6HpvLsQPwNyGFJNY8iyrLrQToadhF0Z//QlfEzEwmQOWBR1s+PPsITGB
 FIVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=RF5aLBH9UafPGsBx2/NbJWWQLB1DVmRkzZOsOwOYsD8=;
 b=LufVxC2xTdh6/3/JwJJKAUkzp1asx9zqfwtMfqAhnmVfTt4DicQvlkpTHc3q2QW7lq
 81cedtKIMxYaO4aBgPnBUdB7BRgQC+Xfz94hrjIuRZm9EccJGtao/jamKz9TPuZ1fwKG
 rRGxOR53iiKwqC1TfDwnlekPXFnbSYZlFOXeo9/iRCOdmjTYvgty6kSx4gYZekR9UBv5
 VAQq7aN97d06NaSxxnS6+uqfoTO1CpabS+8z9Sf/6jk/x5NBzgJuE1xgPhaSCs2B2w5I
 FJ+BvJQa0A2Gp94Zxej6O53iPz/JvLkoqSZGL9Knntc/2XYwfpYYNPh/2fE5IS2XmCOR
 e9aQ==
X-Gm-Message-State: ACrzQf20YIXy9bXr6/D3apQMZxrup1Nyr47D4RzYV9A/NK4dQj8aMGPf
 riXTAH8KYq0UOa1PzmWoLFcR+Q==
X-Google-Smtp-Source: AMsMyM7hvEXNYUbMtrVnw7eFWevADIJedTdpXqSegKLMuLkyylWLkNZY+sF0O2C0paaRkava/DHILA==
X-Received: by 2002:a2e:a887:0:b0:26a:871b:a16d with SMTP id
 m7-20020a2ea887000000b0026a871ba16dmr4477103ljq.482.1664011883356; 
 Sat, 24 Sep 2022 02:31:23 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 x15-20020a19e00f000000b00498fc3d4d15sm1836099lfg.190.2022.09.24.02.31.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Sep 2022 02:31:22 -0700 (PDT)
Message-ID: <b8c37872-fe98-a66c-008b-748049dd8d78@linaro.org>
Date: Sat, 24 Sep 2022 11:31:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 5/9] arm64: dts: qcom: sc7180: change DSI PHY node name to
 generic one
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220924090108.166934-1-dmitry.baryshkov@linaro.org>
 <20220924090108.166934-6-dmitry.baryshkov@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220924090108.166934-6-dmitry.baryshkov@linaro.org>
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
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

