Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 938495A2587
	for <lists+dri-devel@lfdr.de>; Fri, 26 Aug 2022 12:11:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EC2B10E827;
	Fri, 26 Aug 2022 10:11:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5489510E827
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Aug 2022 10:10:57 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id d8so1422062lfq.0
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Aug 2022 03:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=zBsaAPXHP/WINN92NN7t+ecJR0ITtEiUOYhWSRxDrOo=;
 b=ZUeoL8+bFhmGyi/2xXx0UdI4XZSmxqCoQ/yHxfiLH/DU9QQGvq9wEZGUVjYwgMXwKi
 26HcnUPfHIWYzIKhYqQoZx90f3H0nrZfVGP/eqKhMhYGWJD04pqDRjmwvRzRM6h1tcaE
 LRVVaFFo/wx3mmsFyOheVWHkOmEb2o1C4IziuaZBI94AH62n4M11qRSK7FOIrfQIzNf5
 vThpod+1K9nDrs5ER0gKpQtabrijnomOc8918irJfKNNhsd2DNxbrg/VkjLVjWgoWFMf
 kj7VPv/e9UqGXTgGWpvzn4orocfJ1/AjcFV9M5WeSnycQn0CMeGRZYnXfyhfkU9f+5aT
 EtmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=zBsaAPXHP/WINN92NN7t+ecJR0ITtEiUOYhWSRxDrOo=;
 b=zCAV1LvaXpVlMwwzwGVJtrVLsuyQTimY5o9iOsQXFlwcNCpT0qkO3yGvi34ukn2VRg
 EMtFQqQcF0UtV7MItuYccN0c3sc11uX9nw23Mei5RrhAMs8DVZPRcb5MMjrd3gSlFJKW
 7pbKkVwpbgVTmdyxApOjk/HVqlL4VSuESIjYNKvC7F5PG7d61lC92riC+KFvY2qJpUvL
 otpM5If6LxdrL9GMZZNNdHNckOH0sc884+Wrvu2pa/GxcpTLoesX32kHNqJ/J0Vs+l8m
 cpBjSQba5eQx5RPsKlkW0B59QfqtkSJXdUCN5BpddshZlkPFaQDVg2/eb0vWfRJ9o5cX
 Twbg==
X-Gm-Message-State: ACgBeo3D5s8yNcqN/9cJji8ZEIcHEOv/RHoETr6ceUiGpyjzm8zez5Oy
 6s4lAPaY1mpoobMdhEbAn8wteg==
X-Google-Smtp-Source: AA6agR5Ibvjx4/X46gslkNdnrORZcJxR+lxt0sY3ESbw+/23dXGNcAwyX3sJKgTU+5hglvPmE7IBFg==
X-Received: by 2002:a05:6512:2248:b0:48a:f8f9:3745 with SMTP id
 i8-20020a056512224800b0048af8f93745mr2137147lfu.256.1661508655644; 
 Fri, 26 Aug 2022 03:10:55 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 s15-20020a056512314f00b0047f7419de4asm330732lfi.180.2022.08.26.03.10.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Aug 2022 03:10:55 -0700 (PDT)
Message-ID: <47e1460f-e775-d1cb-f622-ccac3044ff86@linaro.org>
Date: Fri, 26 Aug 2022 13:10:54 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH] dt-bindings: display: Add missing
 (unevaluated|additional)Properties on child nodes
Content-Language: en-GB
To: Rob Herring <robh@kernel.org>, "James (Qian) Wang"
 <james.qian.wang@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Inki Dae <inki.dae@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Andre Przywara <andre.przywara@arm.com>
References: <20220823145649.3118479-11-robh@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220823145649.3118479-11-robh@kernel.org>
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
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Krzysztof Kozlowski <krzk@kernel.org>,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 23/08/2022 17:56, Rob Herring wrote:
> In order to ensure only documented properties are present, node schemas
> must have unevaluatedProperties or additionalProperties set to false
> (typically).
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>   Documentation/devicetree/bindings/display/arm,komeda.yaml        | 1 +
>   Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml | 1 +
>   Documentation/devicetree/bindings/display/msm/gpu.yaml           | 1 +

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> # msm

>   .../bindings/display/samsung/samsung,exynos7-decon.yaml          | 1 +
>   .../devicetree/bindings/display/samsung/samsung,fimd.yaml        | 1 +
>   5 files changed, 5 insertions(+)


-- 
With best wishes
Dmitry

