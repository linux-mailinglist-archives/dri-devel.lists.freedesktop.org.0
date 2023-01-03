Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D9965BD1E
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jan 2023 10:27:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B488810E3BD;
	Tue,  3 Jan 2023 09:26:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89A4910E3BD
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jan 2023 09:26:54 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id p36so44845503lfa.12
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Jan 2023 01:26:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/w/HVtfVylFb92xZ3cLJHBmfw9Fvd9M+61nNyBqRlQw=;
 b=RTLhoxkH+nPWqbV4+/wsP1hbkiXd+l89odwyVICOIKfv0tv3vI2z2vgSLpeWzbdf/4
 7jmOlUMawjAT4OY3fnJMT1/gokohqPxF7zEav5Jw3V6G8/EP990p8jd8ZvQ+YHSZ5SNu
 P8jEtL4VPSoLQsiAcAe1GWE9XzBjGqJuFCsyeUd7axrIgN0MQ+JGCea0Z/9wjFJOXdFq
 tuw+RRIckHLwm6UCUUoP/YLPr+ZSdEFmbqPcx2X4vjjk5c24bUQmsGxqIOfoPsY/jE51
 e0cDJjFz9L+WEY61i+G38N6ICgYtH+c6tQZ1RpyPDYgDRZu4GzhBL7AOC/6Hr5jRbh9o
 RMQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/w/HVtfVylFb92xZ3cLJHBmfw9Fvd9M+61nNyBqRlQw=;
 b=4ypxWYli2q6o/X9y7yULHyn+pzwjbN4rjaR6N1HllZ03jbFS/VhhZEv69D3CtJQabH
 wi9RHknbDRATXvvgnTNWVW4ZRFRYLxaaKvGbhBpnVAQqupnAia2aRocoH38jHtvt4hza
 7BUKHt3F3ZYgNxrT7Onj68RNoXGBGZqUG5RzmZUYMxM2nzW6UwGpgBBz0BA1mEZ2Duze
 RkXrBkN9kFdL0BO31JbSZwreAE2hLiRac+o7UaJnzVu0N26ksrWQ2kk9ASgOkTcj8XyD
 HYXjiiwo5q2bez5O0XeJyojYVnNIQbF+2OFFvOAYgSGXWGf9h4ENr0aLuHF+khs3a5XX
 fQow==
X-Gm-Message-State: AFqh2kqTyYVwQsQNuhN4IF2jjQNXXWaKU3Bn+1jBT4vvuHCtvjuat5gR
 2QEf6yqHh1oQZ7A8+jGncWBghw==
X-Google-Smtp-Source: AMrXdXtxBjEkK70iD51Dp0X3k5oQpocNZh8ibg9YbJMfLNtcc4svtr8iSFKyEPRp4WwGOQw+jjzdVA==
X-Received: by 2002:a05:6512:1116:b0:4a4:68b7:dee8 with SMTP id
 l22-20020a056512111600b004a468b7dee8mr15192136lfg.68.1672738012533; 
 Tue, 03 Jan 2023 01:26:52 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 o17-20020ac24351000000b0048a934168c0sm4768418lfl.35.2023.01.03.01.26.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Jan 2023 01:26:52 -0800 (PST)
Message-ID: <207b6699-fe4f-8ab7-5ddb-4eb2e4183c88@linaro.org>
Date: Tue, 3 Jan 2023 10:26:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v4 08/11] arm64: dts: qcom: sm8350: Use 2 interconnect
 cells
Content-Language: en-US
To: Robert Foss <robert.foss@linaro.org>
References: <20221230153554.105856-1-robert.foss@linaro.org>
 <20221230153554.105856-9-robert.foss@linaro.org>
 <deb17787-1a5a-89a3-3ecf-7690b4149f5c@linaro.org>
 <CAG3jFysU84LRcqQOspub+9vtsP3syiksrGX6D7i3ff+X6+mbTA@mail.gmail.com>
 <b8a0d9c5-eb26-c41c-1190-2628977bc582@linaro.org>
 <CAG3jFyuUV79nyjnqNysDKQSyYb4HUSWu-BvxG6LAz1Uavmvkbg@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAG3jFyuUV79nyjnqNysDKQSyYb4HUSWu-BvxG6LAz1Uavmvkbg@mail.gmail.com>
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
Cc: konrad.dybcio@somainline.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, liushixin2@huawei.com,
 krzysztof.kozlowski+dt@linaro.org, angelogioacchino.delregno@somainline.org,
 quic_vpolimer@quicinc.com, vinod.koul@linaro.org,
 Jonathan Marek <jonathan@marek.ca>, quic_khsieh@quicinc.com, agross@kernel.org,
 quic_jesszhan@quicinc.com, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, a39.skl@gmail.com, quic_abhinavk@quicinc.com,
 swboyd@chromium.org, robh+dt@kernel.org, sean@poorly.run,
 loic.poulain@linaro.org, andersson@kernel.org, dianders@chromium.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, vkoul@kernel.org,
 dmitry.baryshkov@linaro.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 03/01/2023 10:24, Robert Foss wrote:
>>>> On which tree/revision did you base this?
>>>
>>> msm/drm-msm-display-for-6.2
>>
>> Then it is not a proper base for DTS changes - you will miss quite some
>> commits. The DTS patches should be based on Bjorn's SoC tree or
>> linux-next (although the latter sometimes can lead to conflicts).
> 
> Alright, then in that case this series needs to be split into 3 parts.
> 
> The dts fixes, remaining dts changes & the remainder of code.

The split of any fixes (or unrelated cleanups) is good idea anyway.
However code can go with DTS - just base on linux-next. If you do not
want to base on linux-next then splitting code from DTS is indeed one
more good way to send it.

> 
> Is this what you'd like to see?

Best regards,
Krzysztof

