Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A447F529AD8
	for <lists+dri-devel@lfdr.de>; Tue, 17 May 2022 09:32:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA8B5112C17;
	Tue, 17 May 2022 07:32:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E80E112C43
 for <dri-devel@lists.freedesktop.org>; Tue, 17 May 2022 07:32:45 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id en5so7126513edb.1
 for <dri-devel@lists.freedesktop.org>; Tue, 17 May 2022 00:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=6+PM+IzbMhfXslyjFiVRohLtTwAYLD/wNY5LYHLjz2E=;
 b=kcPFtNO6HjpPS2YFgXfW1xd43vq158WrRQFhegs5i8ItjE6arwKhjtBg2Q+OQf8rJ5
 dfhJOyns7c3cx/mvCmMOdKWWmDz4ShVB+UGbOVHkRKOUQ1TtmcSHquKqkYt7E0iZ1HMQ
 6CLzqPnnGMWOkj3gkhcTfiyWw6RBGpDNlpdnLpkIpBZ7wOpqbCA5hSU5I6UBMg+Erv9P
 C15CIzqCLjyWwmAXjLhTSmAf79X/g+BjXSq7wuYXfo569wSPkEi5VIH5BX1KWUngjD5r
 GE2ysgs5aBZp6g61OHqYuy9Ztl9e4I3aRhPZacsJhx38hKB8elWX5ptnhxIGMquaLSma
 ogaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6+PM+IzbMhfXslyjFiVRohLtTwAYLD/wNY5LYHLjz2E=;
 b=e/rnxQeYoTSl3UB5P2flZXx4CRJwS+QJgXK0a+Gb3R4lJ2RvDhduI1jd2Ig/NHjtzj
 TsRpSNcsPSyLnto/JuD7IvUhL1j4HjNCg4rVn09UUJhImac071ZzFiMcIATB8St8D7HD
 BSTkm8OTyWLk1PRrlEHrqyYOJnfGHJQ4qo3Z6CZQJRqla2ogWYCi0SqNtbj4XhDo3Epl
 Fz2GpnSiQxGfnKW0mUKB1PaZfjFMKZVqaC37H12mtxNB2yMIPgNZ2DiC4DAg2e8nIIvP
 JSdOt+t/deT4rC5UAUYvl7/FPmjXWtd6cen3dwtpKyOhwh/CJ2iOFRJgsRYrMEYsbEeM
 BKug==
X-Gm-Message-State: AOAM533Oehm29Xjtee0wfV7kzyMGmvqRbrVikrtNs67fpmO3OrfjZdgK
 WdhrkI7/Iy5j7tqtBe34kFUllw==
X-Google-Smtp-Source: ABdhPJxYChotr5WqwFSmgPy49KOJnMiwVkU4JDEcWzo3NznHVFYDP8xEpw0QRHtt/Q1eDLjDqqYaAQ==
X-Received: by 2002:a05:6402:2948:b0:42a:ae0c:2f26 with SMTP id
 ed8-20020a056402294800b0042aae0c2f26mr10624192edb.425.1652772763727; 
 Tue, 17 May 2022 00:32:43 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 ci18-20020a170907267200b006f3ef214e6dsm672543ejc.211.2022.05.17.00.32.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 May 2022 00:32:43 -0700 (PDT)
Message-ID: <94cceaf9-57ab-e7e7-9cc3-627013467768@linaro.org>
Date: Tue, 17 May 2022 09:32:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 1/3] dt-bindings: display: simple: add support for Samsung
 LTL101AL01
Content-Language: en-US
To: =?UTF-8?Q?Martin_J=c3=bccker?= <martin.juecker@gmail.com>,
 linux-samsung-soc@vger.kernel.org
References: <20220516193709.10037-1-martin.juecker@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220516193709.10037-1-martin.juecker@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16/05/2022 21:37, Martin Jücker wrote:
> Add the Samsung LTL101AL01 WXGA LCD panel to the list.
> 
> Signed-off-by: Martin Jücker <martin.juecker@gmail.com>
> ---
>  .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
