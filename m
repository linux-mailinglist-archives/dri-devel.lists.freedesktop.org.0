Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 547EC6C9C67
	for <lists+dri-devel@lfdr.de>; Mon, 27 Mar 2023 09:40:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7659910E2A2;
	Mon, 27 Mar 2023 07:40:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE0C010E2A2
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Mar 2023 07:40:13 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id s13so4440684wmr.4
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Mar 2023 00:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679902812;
 h=content-transfer-encoding:in-reply-to:organization:references:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=ClBOj0gK1ahT7UCzB1KKn78jhUJGd6/ThX8Qzeq7fl4=;
 b=rkmmZgxto45TV5TxYS3lbMJdrFAD+Y5TOh+x/fv77Bv2IZE3RvXg+GOWS+SkDCpNDl
 Qv0tTi7xSwYLhxUy+kaMoElTho4JRiEPruE3gOz4SfuNqDAS3FV6qxnmCWbeajELqm1u
 SlrWJzE93kFMDTptxyh2v7cmkHIrsAjYUX+jBgamFaw1AJ+VGXfX1058zcsjmPVq78k4
 WM6ub73hbp8v4jLiCQ1EcsD0i+ltTicD2u3S8xISdk7ORn4UYukO1r42iZQxBbn4dgH5
 6M0+VK0paAYS277slAolKZPQ/ghiXgcUae4jfRI7C9Q5sJJzHyRDvDU3NUyjY6WYuwQy
 Wu0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679902812;
 h=content-transfer-encoding:in-reply-to:organization:references:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ClBOj0gK1ahT7UCzB1KKn78jhUJGd6/ThX8Qzeq7fl4=;
 b=AjI5JY5/0zRkOHPlExa4ILTG2BZ+lNHtvLYZMiOmFm6WnN8YUiwtq39q9lv/aYZ3BC
 62gkxiXI+wX9ZpGyEnbuEVXCB21NOZK3OfRRvlRXf7v8th1+hD97E8X3GzUG68z48ZIP
 V1v4v6y9Qg/VKaQ3MXbBHTQk80ENsqkynZKpKmpeCn6UHAeqcWQhyWehS5pRzoNE+ful
 mEceaG7xoDL1QkePHdwir4Ab2b/wH6AzuFfv5j3lDgcfVlVGyecKkvkrxDLfiFkPrm2h
 nGgIDT8vUbBlfrvrxci2Og02mVTtQJlHZKT9SlPkDPD8uGjp6Byzo1HVUXaUE2hN+OPm
 EAmA==
X-Gm-Message-State: AO0yUKURv8pureDNfDT1sT9jHn2hB3V9WEa923iB55AZVXgzKWrCWvOM
 1mRNWamIwaINVGYm8dIFcpx8Gg==
X-Google-Smtp-Source: AK7set/HbomPUYJYpvAz8cosQ1bhr1ic2igEN2YfjSfVteCKmqlgQXoWWUqdknydjiR2gEP3SPDJiA==
X-Received: by 2002:a1c:f418:0:b0:3ed:8780:f265 with SMTP id
 z24-20020a1cf418000000b003ed8780f265mr8940924wma.21.1679902812220; 
 Mon, 27 Mar 2023 00:40:12 -0700 (PDT)
Received: from [192.168.7.111] (679773502.box.freepro.com. [212.114.21.58])
 by smtp.gmail.com with ESMTPSA id
 n20-20020a7bc5d4000000b003ee10fb56ebsm12796925wmk.9.2023.03.27.00.40.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Mar 2023 00:40:11 -0700 (PDT)
Message-ID: <3c30663c-e78b-388a-5822-932434436a4c@linaro.org>
Date: Mon, 27 Mar 2023 09:40:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] dt-bindings: display: sitronix, st7789v: document dc-gpios
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230326164700.104570-1-krzysztof.kozlowski@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230326164700.104570-1-krzysztof.kozlowski@linaro.org>
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
Reply-To: neil.armstrong@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 26/03/2023 18:47, Krzysztof Kozlowski wrote:
> The device comes with DCX pin which is already used in
> canaan/sipeed_maixduino.dts (although not in Linux driver).
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   .../devicetree/bindings/display/panel/sitronix,st7789v.yaml   | 4 ++++
>   1 file changed, 4 insertions(+)

<snip>

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
