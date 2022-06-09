Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C465448E8
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jun 2022 12:31:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31B8710FC89;
	Thu,  9 Jun 2022 10:31:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 859E010FC89
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jun 2022 10:31:46 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id d14so5043139eda.12
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jun 2022 03:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ufnscmxQX0AEbzv5PDtE4okgkONgzlvCJEgtYxQypeY=;
 b=PvTB125tZx08/hSvZa0syMVCHbKXmlH9QhWjjk13m1U4RJs0l+5sC2JJ3fHV+Nb1/u
 ep/DvZG+xBu13nOf1ivLWhHz8VBNxtgqz/kf/AQdhwfxjiQQ5wRBIWfNyI5qhHtm8/YN
 a5pbig0h3m4TSnO4UgWGOHYITPP7Ye9e2st1LR8xlyuBjbzWObAXC6FE0A33sPe13JGW
 uGu5S5TVz1Z8TtvQu9FkHT0EUsxkpHx5/c9mZvZJkPPE2RCcy3/lJxsBVT2LdUcRpy80
 PF1ArDfyrRwbGp1zKwVwTbv0kpmI9vo+/YeU+llZcojlFMT7uinD924FB2KFN2yeD0J6
 Kn3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ufnscmxQX0AEbzv5PDtE4okgkONgzlvCJEgtYxQypeY=;
 b=mHM4m2yXWWBk+CH3OR/HAhx2cRSAR/7XXKhl3a4q2wIWRJPzWt1lbHhI8g0qWxcLjw
 hnfu7nJQlIF/evkMrb2gHxSMpMWmfRTKN6KyDcbzShy9qU9U3/c5XjlBJpzlEIDUFstH
 uuijAph8lMlxD3FBUn/Gpg3URUl9MxQV58m8eciYcXMgZry42lWNEMCsYl1CpNHsaaRI
 Sdyz4Mdl+bMa2ThCf7smW8WOfKPXVh0i08dtUXvopgIJRTwo1TH/JSSVY3Mca4xZ2fqS
 oD77vNFby4+XfGtPWsnUh47ey+6M3pH3dKvOC3Elt6Kq9kcseuqiYOKrOkSVTpB5EHQY
 fIkA==
X-Gm-Message-State: AOAM532VhKOnXGN72dbfS1CegxDPG9+UDhQxvOaB97cryCRVBFTmE2QP
 ldrmgkmbghKuBoy7slytxrLTCw==
X-Google-Smtp-Source: ABdhPJw5ncZiCRvmHdPWyeUur4wU6OHfZmwNQw3+Rny6dLpgU8K5SbVI4FBkZ6nYipWKlORRD78xpg==
X-Received: by 2002:a05:6402:270a:b0:431:43f6:1e02 with SMTP id
 y10-20020a056402270a00b0043143f61e02mr27435767edd.317.1654770705027; 
 Thu, 09 Jun 2022 03:31:45 -0700 (PDT)
Received: from [192.168.0.196] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 p23-20020a170906499700b0070f36b8cb39sm8066737eju.103.2022.06.09.03.31.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jun 2022 03:31:44 -0700 (PDT)
Message-ID: <7b8653c1-355d-b390-042d-e02085a3910a@linaro.org>
Date: Thu, 9 Jun 2022 12:31:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 1/2] dt-bindings: backlight: rt4831: Add the new ocp
 level property
Content-Language: en-US
To: cy_huang <u0084500@gmail.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, lee.jones@linaro.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com
References: <1654741339-12756-1-git-send-email-u0084500@gmail.com>
 <1654741339-12756-2-git-send-email-u0084500@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1654741339-12756-2-git-send-email-u0084500@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 lucas_tsai@richtek.com, deller@gmx.de, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, cy_huang@richtek.com, pavel@ucw.cz,
 linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/06/2022 04:22, cy_huang wrote:
> From: ChiYuan Huang <cy_huang@richtek.com>
> 
> Add 'richtek,bled-ocp-microamp' property to make it chooseable.
> 
> The wrong backlight ocp level may affect the backlight channel output
> current smaller than configured.
> 
> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> ---
> Since v3:
> - Refine the description for backlight ocp property.
> - Use the enum to list the supported value.
> 
> Since v2:
> - Change the property name from 'richtek,bled-ocp-sel' to 'richtek,bled-ocp-microamp'.
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof
