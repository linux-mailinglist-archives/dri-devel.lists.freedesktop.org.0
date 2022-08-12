Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4162590FA9
	for <lists+dri-devel@lfdr.de>; Fri, 12 Aug 2022 12:48:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3220FAEA1E;
	Fri, 12 Aug 2022 10:48:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE924AEA2F
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Aug 2022 10:48:22 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id s9so566548ljs.6
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Aug 2022 03:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=EhxaKIEh/wAXZD6zcgeSWFyzI2lF/EihKd+2aYnlgHc=;
 b=qrboJ4rIHDgzbJmvJnEP89NnQo6aFutdcDE5sNQAQF9N0kPvOHxHpe+7iifkwnVHAY
 GKtnzTp/S07plKrH9tAy+EPSNK1E1Jqytc9ICOewpsLe/Tpb9ZnFt53jQaZGJ8vOBpUq
 gUCKPuKboCZAgM+DTijUvInr0ErC00/On0jdKw/Sn2MKhJFR+nkryt9fRjPgrMzQvkBZ
 vtnXlFjZ9M4iHXDA8Oq0cRfgj89y5k5GOkHGCMW/P6bbVrA4HW7O+4wnHneBk8FBgeoF
 QztIC1Rkxr7KAdR0UYavxZKc8j5nwWdDdv7zu1tRCj5G+rkOJ2KEbQId8brD4EHyd8m0
 te4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=EhxaKIEh/wAXZD6zcgeSWFyzI2lF/EihKd+2aYnlgHc=;
 b=F5GXHNRQ5It3PjcSN2r5wocnvAO/roP6X2Cx7A9W8C3iUcGIDJ1gJQ0oDQe5NlzqkE
 DgZkD5NsWyVVZeTAnJY5/vXplW/c7ksJwDinqyhgfbKSTnfB5nT0+cq3Ns8la5fYsGCZ
 UvFVbmZJz5ytrHts2iyCApDuSwQ+g8lE945EdEPKEpY2jYhAVpkOac4AKpqYlAXzAGqX
 2XHS3cWEo9Ihup7+3TsyoiBw1urt8rYfkgZGXxP4TGU5mjHdQuKTCHlgLiozSqSr2Vwr
 RXvVyJAarPkgi8K8tD6R/CdSUYPwFNWdzvcLvK3ZO4JwVqn35OGls3ih/t93n0c0zZov
 BMGQ==
X-Gm-Message-State: ACgBeo3W7geIpfszDrh7Od2TT2wTsL/lnV2ADuMxeTIaIocGYnM8i+D5
 1ql9uA4/1/+kt8DoWISrKkUdZw==
X-Google-Smtp-Source: AA6agR57MBAVpGC8ueukuB2CqRdXwkzjd3ZbWTc2T0r/j1Wf9Z7xAWiR/BSI7OSqtlG5F26ix5qbIg==
X-Received: by 2002:a2e:a552:0:b0:25e:6fa1:a6c4 with SMTP id
 e18-20020a2ea552000000b0025e6fa1a6c4mr949196ljn.90.1660301301259; 
 Fri, 12 Aug 2022 03:48:21 -0700 (PDT)
Received: from [192.168.1.39] ([83.146.140.105])
 by smtp.gmail.com with ESMTPSA id
 14-20020a2e154e000000b0025e53413b6dsm313231ljv.2.2022.08.12.03.48.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Aug 2022 03:48:20 -0700 (PDT)
Message-ID: <bb69c593-b355-a080-0ab9-334ceb5eb036@linaro.org>
Date: Fri, 12 Aug 2022 13:48:16 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 1/4] dt-bindings: display: sun6i-dsi: Fix clock conditional
Content-Language: en-US
To: Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Maxime Ripard <mripard@kernel.org>
References: <20220812074257.58254-1-samuel@sholland.org>
 <20220812074257.58254-2-samuel@sholland.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220812074257.58254-2-samuel@sholland.org>
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Jagan Teki <jagan@amarulasolutions.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/08/2022 10:42, Samuel Holland wrote:
> The A64 case should have limited maxItems, instead of duplicating the
> minItems value from the main binding. While here, simplify the binding
> by making this an "else" case of the two-clock conditional block.
> 
> Fixes: fe5040f2843a ("dt-bindings: sun6i-dsi: Document A64 MIPI-DSI controller")
> Signed-off-by: Samuel Holland <samuel@sholland.org>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
