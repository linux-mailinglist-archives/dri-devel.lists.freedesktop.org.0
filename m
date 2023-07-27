Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 314B576482B
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 09:13:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C304A10E4FD;
	Thu, 27 Jul 2023 07:12:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 010B310E4ED
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 07:11:57 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5217bb5ae05so740180a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 00:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690441916; x=1691046716;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5QOOvb2lxs5KNQiT3Ck5hNvYTv2ynGtd6aIqYJA0ds8=;
 b=eVHJzIGBwIbRrPhbGk1Nty1NZpje2gznL4CsPzlhsXf1MaIVg2H+C2GBkhnZYMugIW
 2fBe86eUJhaZNS7ZL1WCEGqULzJFWJdG7fo6yV4t4MsS7HhAP5keEq+hYQuWAYQpL3rz
 HSnwzrRGfQbT0VpbXjxtUznTBccEm8bWw3zmlC99nET/vNwj6CcQ8a6AXuKiZZg1TxLr
 fAa9FSw/sYlf/UHQZ5kShQ2v8FN/zyEDM28Tv8pSoWLMNcW5xuwVccptDEBYNoUc5c4q
 ewr3aZQFi+ptYEE/F8+PXNwz/CycHI6PWN5pCQlKlkptT5uUQ+7Cn/skC7t7nhd9Yo4W
 z49Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690441916; x=1691046716;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5QOOvb2lxs5KNQiT3Ck5hNvYTv2ynGtd6aIqYJA0ds8=;
 b=WbBzqfTg7RQkdrWDALxbX1S0q6W+gJnfaGr9kLkkwqE928NB6AX+XJ/YV3fTQhBUCb
 ir5l95aoZiRZQHGEe7j7+3hWIPYwqquw8l0S3/gCctz3sxQT5sqxU5Kn00FWUjUJAlAZ
 UPRMoCltLRHdM89uloG59X0Le1xMTetgJOr4S19B/h+Li680x35koi2xYwO6PepjkFxy
 RuVAwERa749TB4fnHAM14y/SaBVsOEqIpYxLuYJ0M7UbAvDrbY+pmNFSd2g4UmLEtCTJ
 5VGx1CbAmjmkQL88yMLgMHuJhKfHJ3BzOPv7WWTMX6XgYCjzjw83Krn8/iAUA7wU5y0m
 NbFA==
X-Gm-Message-State: ABy/qLZQhJjBRm6Ni9M4LEhWH8Vc25zpnlof6JkVEmK43jHr5iroQmEr
 YYmOUvHN7s4CyYRHaVg9IcoerA==
X-Google-Smtp-Source: APBJJlEk+a7Hc4KZY8z+a3kA1RrbZrEBWfhKXbd9tM/WcJrmSVGTnPKRSkbCMiz2Z+9tryjuaeU6Gw==
X-Received: by 2002:a05:6402:5179:b0:51d:e30b:f33a with SMTP id
 d25-20020a056402517900b0051de30bf33amr1049991ede.34.1690441916468; 
 Thu, 27 Jul 2023 00:11:56 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
 by smtp.gmail.com with ESMTPSA id
 o20-20020aa7c514000000b005222dd0b2fbsm303259edq.92.2023.07.27.00.11.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jul 2023 00:11:56 -0700 (PDT)
Message-ID: <97a8d6a5-c953-cb40-7591-a0494fe17bd5@linaro.org>
Date: Thu, 27 Jul 2023 09:11:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/3] dt-bindings: display: panel: Move Chunghwa
 CLAA070WP03XG to LVDS
Content-Language: en-US
To: Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20230726185010.2294709-1-thierry.reding@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230726185010.2294709-1-thierry.reding@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 Svyatoslav Ryhel <clamor95@gmail.com>, dri-devel@lists.freedesktop.org,
 Jon Hunter <jonathanh@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 26/07/2023 20:50, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> The Chunghwa CLAA070WP03XG is an LVDS panel, so move it to the correct
> bindings file.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

