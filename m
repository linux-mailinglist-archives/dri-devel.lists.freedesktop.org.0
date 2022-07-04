Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 19FA2565BA3
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jul 2022 18:20:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D738710E78E;
	Mon,  4 Jul 2022 16:15:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFD7610E02E
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Jul 2022 09:04:56 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id y16so14623482lfb.9
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Jul 2022 02:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=n4B9YLkKJASUbF6SDeFOUfEsE0vnt4+YdnmVDhP06z4=;
 b=PYvq706wWC49R4jolMknaPmpRLaoYvxAwS/yrvpFklnZZejweFemyL+imVd3ZQHAkf
 2/oXHaA9SGkarCtUTpJuT3rbr6E8/ZVClvuR1xBNSKo+a8wG5DTug1kwbGjWuOCBcI70
 dWGUwdFSDfUGxCvJG/zPrfbQm+BbCyObhS6xtSNndCwmGipu6Cfuvu+r8eMks7OKGo0b
 2YzZ/37v4uOxttWU2JFcYvY4M9Qr68hL1wTP8MZfoSjc1J2+2NJTNQry+5XTQR6atCko
 dT/Z9yNTRRG/tHVo63yXJDe5gp8/LH7Off+y7xl7ruy7e2ZiSNNwjEwSUYfXcOFTMnzE
 rrgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=n4B9YLkKJASUbF6SDeFOUfEsE0vnt4+YdnmVDhP06z4=;
 b=uF7NvbbFnGefLjaW9+u18dREqvDfZjZM1kLpEATnSy8QvqWUxg1/pAtANZYk9/rt0O
 SKoBEJNopMNfbvFShMyS1netiLhOE8xS5teh+5m4r/fcuqYVCJnQdEfhoNRe8LETz2br
 kmVoD3kaTdNol9XvYFXvG+ij+xjwP14lVhFF0yQxvkhJV71yB0Jz4zPfWBX5gd5W0eka
 IfSC2I1B/wQFja9DtFaMKQ0Fes+d2T8jtWvVu4DaORwH+SgY5DFuFgxGdNblhExkv88H
 zHwwXORXzbPkcliE1a6OxEdm90fjkEpYqmItU/HNLYXQ+r5dev4McOZO3cL4eAlD5WFP
 bxng==
X-Gm-Message-State: AJIora96TYmmOnjotCZupook/MExiKm+4LyKknaG5kvHpctzCqBIRRc1
 tFncf9/BX0h6AgrVwU6wFB1+GA==
X-Google-Smtp-Source: AGRyM1sLHkpEL/e3FbHHjgOt2aInxHNlxFrHeEIa0L1/Bz4GYdHDD1jIwPyFeJeq+08viN1qBJk27g==
X-Received: by 2002:a05:6512:acb:b0:481:cce:3c22 with SMTP id
 n11-20020a0565120acb00b004810cce3c22mr17601128lfu.45.1656925495041; 
 Mon, 04 Jul 2022 02:04:55 -0700 (PDT)
Received: from [192.168.1.52] ([84.20.121.239])
 by smtp.gmail.com with ESMTPSA id
 8-20020ac25f08000000b0047863382e3dsm5024155lfq.215.2022.07.04.02.04.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Jul 2022 02:04:54 -0700 (PDT)
Message-ID: <4513594b-ece6-a4c2-82ba-d334f5c4234b@linaro.org>
Date: Mon, 4 Jul 2022 11:04:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v4 02/13] dt-bindings: power: supply: Add Mediatek MT6370
 Charger
Content-Language: en-US
To: ChiaEn Wu <peterwu.pub@gmail.com>, lee.jones@linaro.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com, pavel@ucw.cz,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, sre@kernel.org, chunfeng.yun@mediatek.com,
 gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de,
 lgirdwood@gmail.com, broonie@kernel.org, linux@roeck-us.net,
 heikki.krogerus@linux.intel.com, deller@gmx.de
References: <20220704053901.728-1-peterwu.pub@gmail.com>
 <20220704053901.728-3-peterwu.pub@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220704053901.728-3-peterwu.pub@gmail.com>
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
> From: ChiaEn Wu <chiaen_wu@richtek.com>
> 
> Add Mediatek MT6370 Charger binding documentation.
> 
> Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
