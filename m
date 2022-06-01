Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CDC4539E78
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 09:37:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4912911331D;
	Wed,  1 Jun 2022 07:37:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A108E11331D
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 07:37:07 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id er5so947703edb.12
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jun 2022 00:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=VGujkgTLGJjJ+UW8ObqRqsyAB4WEAUQn5faiR07jbVk=;
 b=eyS+I6FEnnSZ8vn2minglzX0RsZyoF9Qj5V8Mh43eR015TdUWXV4qkKWOZX2lZeySE
 t7BZBTp+ir4baIug9pll2zWzvszfRqc0r5vLzK1maxAcIdwZ/iaA1Isq4KwlmslVPRYh
 MIoVcBzLyZGyCFwXmKgLxcLRCyyiq88Xgxjiq3FFvEx5MmyZx+OASqZcPLHCKnw0JUjU
 7A2ayEZqWCb7MgWHsnp8p8rpoMQoKD4IyvQ73+Lcsl9Mj4iotCbbp0u3KSqjjZacai+Q
 /bXpn9G0c8CDLyqR79vDzIVBrNyJ35XAvFM05cJlklgGTzza55YihjFCrxtX/6ii/mNt
 whSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=VGujkgTLGJjJ+UW8ObqRqsyAB4WEAUQn5faiR07jbVk=;
 b=aMtq2LHtRSoY1d3cE1woXLrVwW1M7MLnxx/R8fD7T1IuKqIi+UXl8UL3f8PjTnQ6mP
 FHCBXoa86XypjH6g74m9EisIMC00WMtt4mCUaudforXmC4H66Su1weWg0zvWJM32I+Hv
 FjcCY36Qyzi8kjyYuLAw3DXd0257FWmeaqFwZMNk+tk9GcVsTpOMkBDuB8Fv5g/2XmS+
 XJr7w3T8DRowG6BLp/oKVFWxpixl0YPlVrnKC9Tk+ZAg3Ze8onaT6Gw/u6APiSW8Z/UV
 pUmP7EHplljiDx1GAIHa2fP3dAjwO5TtgIfOGbgusy6ZbO2/Id5hvDitz6W7jzCCyvjN
 soPw==
X-Gm-Message-State: AOAM531ZKPzjBoUN+IusPeXWU0JGoqcxCmpSjJiqmCLjpcFAat4Sny2v
 ppt82oxhPfkqPL0WQjpJD2tb8w==
X-Google-Smtp-Source: ABdhPJxcXWYO+A4vQR4Q7Xl2APBu8dwgsKRiYU4keddDiGzFAh3Q4PYTBvmzIZbnnxHwvAbJiIod1w==
X-Received: by 2002:a05:6402:48c:b0:42a:e585:103 with SMTP id
 k12-20020a056402048c00b0042ae5850103mr68634819edv.375.1654069026243; 
 Wed, 01 Jun 2022 00:37:06 -0700 (PDT)
Received: from [192.168.0.179] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 a22-20020aa7d916000000b0042dd4f9c464sm495356edr.84.2022.06.01.00.37.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jun 2022 00:37:05 -0700 (PDT)
Message-ID: <dcb8c59e-243f-11c8-f10f-e037f9bd2e8f@linaro.org>
Date: Wed, 1 Jun 2022 09:37:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [RESEND 05/14] dt-bindings: backlight: Add Mediatek MT6370
 backlight binding
Content-Language: en-US
To: ChiaEn Wu <peterwu.pub@gmail.com>, lee.jones@linaro.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com, pavel@ucw.cz,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, sre@kernel.org, chunfeng.yun@mediatek.com,
 gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de,
 lgirdwood@gmail.com, broonie@kernel.org, linux@roeck-us.net,
 heikki.krogerus@linux.intel.com, deller@gmx.de
References: <20220531111900.19422-1-peterwu.pub@gmail.com>
 <20220531111900.19422-6-peterwu.pub@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220531111900.19422-6-peterwu.pub@gmail.com>
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
 alice_chen@richtek.com, linux-pm@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, cy_huang@richtek.com, chiaen_wu@richtek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 31/05/2022 13:18, ChiaEn Wu wrote:
> From: ChiYuan Huang <cy_huang@richtek.com>
> 
> Add mt6370 backlight binding documentation.

Please apply my previous comments.


Best regards,
Krzysztof
