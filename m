Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA1A3691D5F
	for <lists+dri-devel@lfdr.de>; Fri, 10 Feb 2023 11:57:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B33CD10ECCF;
	Fri, 10 Feb 2023 10:57:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98D9C10ECD8
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Feb 2023 10:57:06 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 m16-20020a05600c3b1000b003dc4050c94aso3756557wms.4
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Feb 2023 02:57:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gxFJW5wMWFSgwofHY83IGRmWRME/u231OOEuiB6E6rw=;
 b=aojESYChzWo8ja2Kpou77qQnRGwHD/xM1FLKoOgU2+BUcxjCuMdr/DOSA8Czp96JMv
 oOXOKEnkyR2GZR+rTnQ/Kfviro+4IzQsUjV+1MmrRHZtQmqZEUzWHad2LRH7+ChV75RZ
 uNgaqTMUEf7u2mZOEwK+t8/OpqmRjkb79BHAqwcG/XbqPmZIfm3bzRCn7Ka7mCar5N/k
 8Znz0mrYBjzQIPj3w+xm5jD0g/EbXotm8FyD/F7Qn2dQ9mNa1tGMcK9UDlALy7UKcTe0
 X0eCejYgMDP0HO5so1SnMVqUdb1VIa2PQLIOOLK4+ADT95E8jgMUH5Enzgu6i3W6AfjE
 +v1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gxFJW5wMWFSgwofHY83IGRmWRME/u231OOEuiB6E6rw=;
 b=HWoW8+86zZikKjr1HrGBBsSvwv8BIu7EJ5OicizkkbMupwUdKUG0sLnbEs9HojqHkP
 23uzZh7i/xGP1ODsdxKmEvRle6EicK/PTYIDcqV3HwKhvD7bbryqjvrdB+2SHoZUj72b
 ekM/MFWVRnYfUxl+s2zdDvaBlDm1oMDkjRIykSYALM4kvIWw99X2W60t8cUnyFUGGM6I
 0t4bcfjj8na6jKQyXqtcuN0jEpFmAZIaarkhPnQmV7yUIuKTBCwI88bgbOWillO4mTZo
 J1wATETSgCHaCKdgy6BH13yZYoY2fHx7lBvMVhAsK6AaCsKaYZMgKfidi/eC4fUCSv9I
 vwKg==
X-Gm-Message-State: AO0yUKU105ilO0V2d6tTlOXVGSg2JyFCE1ER0NqvLruGfFlTPG1BtCkd
 BK3EriuTDsqt+yGYd0JDDFSgHQ==
X-Google-Smtp-Source: AK7set+prGY1H0ukKTktyiVy+Uhot76X1GyOTcxgbUK9hltwD8dL7jvL/W4wECXhkHKsN6qrlPghnQ==
X-Received: by 2002:a05:600c:993:b0:3e1:577:80f5 with SMTP id
 w19-20020a05600c099300b003e1057780f5mr10446539wmp.31.1676026625087; 
 Fri, 10 Feb 2023 02:57:05 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 w19-20020a05600c475300b003e11f280b8bsm1961050wmo.44.2023.02.10.02.57.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Feb 2023 02:57:04 -0800 (PST)
Message-ID: <039b8306-04a8-ead3-7a5f-3593c01496a5@linaro.org>
Date: Fri, 10 Feb 2023 11:57:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 1/5] dt-bindings: display: msm: dp-controller: document
 SM8450 compatible
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20230206-topic-sm8450-upstream-dp-controller-v2-0-529da2203659@linaro.org>
 <20230206-topic-sm8450-upstream-dp-controller-v2-1-529da2203659@linaro.org>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230206-topic-sm8450-upstream-dp-controller-v2-1-529da2203659@linaro.org>
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/02/2023 11:34, Neil Armstrong wrote:
> The SM8450 & SM350 shares the same DT TX IP version, use the
> SM8350 compatible as fallback for SM8450.


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

