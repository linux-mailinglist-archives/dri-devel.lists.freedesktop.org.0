Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 687526C85F0
	for <lists+dri-devel@lfdr.de>; Fri, 24 Mar 2023 20:27:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92BFB10EC61;
	Fri, 24 Mar 2023 19:27:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4EE110EC61
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Mar 2023 19:27:15 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id b20so12023803edd.1
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Mar 2023 12:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679686034;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dqZs2i/FLy+ED4dLZjowRQFkaHxvBAh+o8hN0bmWyLI=;
 b=KVn8cXn6sXVrxXuf8nrF+qMJiC96QpfFwWzGi0AJOMIXNA1WbuNvCCIOwSHeyY7QuY
 2aGiXOkDBP1efMYKns1u4VjrdsX6UBZaVSVMGrcmOeB50NcFvurY90jzSuzriCWhmopr
 XyQ23MoNZT1HAnni3RE5Sk4UCeFIgfsZpRIdj6m1hDT3jjWaKajUB6dNoi4jitu/3SqA
 mdRpebq18inaSa6zisiVZksSO7XbFDvZ1r2H9Ci+c/CUKYM0RW95Go5QvZZg156S5X6S
 EAbyWkd6Sek4ooGqTwrfTJCkOUy1lbNh9i4uUG4maTTUI3jNi3t4MUI78wdKzQ3YtM8l
 nBOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679686034;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dqZs2i/FLy+ED4dLZjowRQFkaHxvBAh+o8hN0bmWyLI=;
 b=s+AVRBVJbqDIhxuCf6jimWMHN0/UX7RGgYcQ+FfCPyg+X2ncK2xM5uZTnzhDbRoTR+
 M3oMcNC0BJg1mb4j9MI4UCjO+3wv8ImtcENDcdDz0ggDVuo8jJo7voo8jJwMQ5TkVDCG
 DUVQrOXvo/OOp9iCOrAlVSWXW9r6ETrTRAR0WbqJWLoi+oRXhyEIC8rwRETFuqupX34a
 YyIED9k+0SEkSTfhekN7TwJLsyz6NJ6aIcMZF8ikrxnPhfXCHKtknmdCBA3a5N1f6PNp
 pby6OeF8R79DzJlXFbVvGwQyAiNQNYo78s6GZwb5bCWser1e2saspBq011pPI28PbAt5
 jyzA==
X-Gm-Message-State: AO0yUKUhlSWluIZZESL8a4pEVZfqcjScYzUTgBSjF+E8Ey3/LI2qRY+y
 TV1m4xI0z+NrBLI31WTCrcKB9A==
X-Google-Smtp-Source: AK7set9TEoYzluKH8HHNN0BPwpvbjgxekVvQlU++HyMqrJZpjHWj9ML3a63GwAtC8Qcp8LL/1FOyoQ==
X-Received: by 2002:a05:6402:a53:b0:4bf:b2b1:84d8 with SMTP id
 bt19-20020a0564020a5300b004bfb2b184d8mr10928336edb.19.1679686034296; 
 Fri, 24 Mar 2023 12:27:14 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:3027:fb0b:ae08:588?
 ([2a02:810d:15c0:828:3027:fb0b:ae08:588])
 by smtp.gmail.com with ESMTPSA id
 jj19-20020a170907985300b008c327bef167sm10682737ejc.7.2023.03.24.12.27.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Mar 2023 12:27:13 -0700 (PDT)
Message-ID: <fdd51d3d-a1fd-c3a9-c578-59a11c5213de@linaro.org>
Date: Fri, 24 Mar 2023 20:27:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 2/4] arm64: dts: qcom: sm8450: remove invalid
 properties in cluster-sleep nodes
Content-Language: en-US
To: Bjorn Andersson <andersson@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
References: <20230323-topic-sm8450-upstream-dt-bindings-fixes-v2-0-0ca1bea1a843@linaro.org>
 <20230323-topic-sm8450-upstream-dt-bindings-fixes-v2-2-0ca1bea1a843@linaro.org>
 <20230324174518.2arvdglqqixmxqcp@ripper>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230324174518.2arvdglqqixmxqcp@ripper>
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
Cc: freedreno@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 24/03/2023 18:45, Bjorn Andersson wrote:
> On Fri, Mar 24, 2023 at 10:28:47AM +0100, Neil Armstrong wrote:
>> Fixes the following DT bindings check error:
> 
> Is that because idle-state-name and local-timer-stop should not be
> defined for domain-idle-states or are you just clearing out the
> dtbs_check warning?
> 
> According to cpu-capacity.txt local-timer-stop seems to have been a
> property relevant for clusters in the past, was this a mistake in the
> binding or did something change when this was moved to
> domain-idle-states?

I cannot find anything about local-timer-stop in cpu-capacity.txt. Where
do you see it?

Best regards,
Krzysztof

