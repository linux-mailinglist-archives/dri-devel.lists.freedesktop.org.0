Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D0AD565B80
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jul 2022 18:19:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E369710ED17;
	Mon,  4 Jul 2022 16:15:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 087EC10E038
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Jul 2022 09:07:17 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id i18so14648887lfu.8
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Jul 2022 02:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=BtyIymdH2qSSNBvNEoKc/50n+YaYkErYRhVN3d4+GHk=;
 b=XiM+E5UdwfyHsyHbIllCDzfZVdzGil+LXmUM3o6WF4PkRJ4XqFmVWojD1MoYEM77UY
 8+GhsWQjoigl4ndUWRWWskLeKNbMy9E0wfbPwsNxu0WoSBISOu84MorLmmWNIKgTWfWC
 Qj12RXtMOdfS1+T4b+EPVwW0F4GFOMBWYctm4pNB8bg1eHfe2AaGwUodg+mu7efIXksV
 TNtl7aJRF9CsWzUdAnNF1x2c3v41JPbqU1Ies4ozEErlMu42mw5lQIEqwp2GwAssuDYK
 Cw3KRx93bb5JTFartqor8wS0/vf3qj4RGn/Vtt/gfoVCkPpTOdjeZN4O1NmlZR66TIIo
 LfSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BtyIymdH2qSSNBvNEoKc/50n+YaYkErYRhVN3d4+GHk=;
 b=L1yH1gg+tF8+b+BV+tGVAN5YdV3ge4X5XYrBDg06JprCnf1Yn/SqS6bRLkJzG/x/16
 w4OxHp/TgwMv05PDRQLkmmRidlmdLghmraZce35py8dUXfeaGrRrnMjG/53fO3Rm0Qq5
 D85VnYYoDmtx4rjwke6I4/McERYCtjJiLrAWBZfLgVls8AlP6JeuhqJU1IkfWEAhkL+X
 0tX8eEgzt9MCXcpJESESHYkzXjrZvDkXk1Uhz5TAxAVNSRpbPXcqdJEx/Tv8lPXlXVHH
 V2Z11rLYMWgx/gFMgs1mBj4y8VO0ACd5SWMaWIXEjtTs+/ZpQS+Efa05h9yvv5CXX7Nt
 9JoA==
X-Gm-Message-State: AJIora+Ev5j5Q5eyE8KhSda1DZN6h2ckK2ZFfQOwv9dpkR+3oIYmn+Qm
 FXvJDtPru+jUvVJn2rabVM+NRA==
X-Google-Smtp-Source: AGRyM1tI9Ub9KvPHASQI5b2883dspTVBOFIXRiN1cbb02P3TVGpg8m7UwRb/aJtvqXiUk+O/khToVA==
X-Received: by 2002:a05:6512:2810:b0:47f:a76c:8770 with SMTP id
 cf16-20020a056512281000b0047fa76c8770mr19891464lfb.116.1656925635286; 
 Mon, 04 Jul 2022 02:07:15 -0700 (PDT)
Received: from [192.168.1.52] ([84.20.121.239])
 by smtp.gmail.com with ESMTPSA id
 e18-20020ac25472000000b0047f77cc3287sm5036384lfn.274.2022.07.04.02.07.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Jul 2022 02:07:14 -0700 (PDT)
Message-ID: <247e5688-8aff-1c7c-80e4-b39c5f2fae9b@linaro.org>
Date: Mon, 4 Jul 2022 11:07:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v4 06/13] dt-bindings: mfd: Add Mediatek MT6370
Content-Language: en-US
To: ChiaEn Wu <peterwu.pub@gmail.com>, lee.jones@linaro.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com, pavel@ucw.cz,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, sre@kernel.org, chunfeng.yun@mediatek.com,
 gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de,
 lgirdwood@gmail.com, broonie@kernel.org, linux@roeck-us.net,
 heikki.krogerus@linux.intel.com, deller@gmx.de
References: <20220704053901.728-1-peterwu.pub@gmail.com>
 <20220704053901.728-7-peterwu.pub@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220704053901.728-7-peterwu.pub@gmail.com>
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
 szunichen@gmail.com, alice_chen@richtek.com, linux-pm@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 cy_huang@richtek.com, chiaen_wu@richtek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 04/07/2022 07:38, ChiaEn Wu wrote:
> From: ChiYuan Huang <cy_huang@richtek.com>
> 
> Add Mediatek MT6370 binding documentation.
> 
> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> ---
> 
> v4
> - Roll back all "$ref: " to v2 patch style (using
>   "/schemas/...")
> ---
>  .../devicetree/bindings/mfd/mediatek,mt6370.yaml   | 280 +++++++++++++++++++++
>  include/dt-bindings/iio/adc/mediatek,mt6370_adc.h  |  18 ++
>  2 files changed, 298 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml
>  create mode 100644 include/dt-bindings/iio/adc/mediatek,mt6370_adc.h
> 

Looks ok. This depends on previous DT bindings patches, so all of them
should go through one tree or with some pull requests (but that would be
a lot). You should mention it in cover letter to get the acks from
subsystem maintainers.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof
