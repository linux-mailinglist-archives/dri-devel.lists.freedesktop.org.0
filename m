Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72EC3539E5F
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 09:36:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E308810EF67;
	Wed,  1 Jun 2022 07:36:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89CDF10EF67
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 07:36:27 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id u12so1924798eja.8
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jun 2022 00:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=1NLbj63p78gaZ8WaajEU8PUTCmU7WPY2qFfR3aIc2H8=;
 b=gqBcGcAkA8yHXLTni7MKZcgZpIkQHVSVTHhr/karxr9ZXi7QXpOby0C1PSZ+CxEZHD
 evRMSrT6rKpG0jp6FBf4/F3CtsD6yYFKugM2+mCp9sxULDIupq2sV2HELbPhFFrDdKKG
 /VGVXv3DC8CNS2Qw3WoAsYRy75CVYWNW6iOIREj8ldQTYzWrJpxg0ayoLYYT6jwf22ok
 ZobxHbs9TcZh+0Glo6CkNmSg+6C/msfP1yuxPMVsnlj7w1XFRuq/lxp3KCYGxaMEtUWE
 bGMsEcGgoiyKOp6LUmB9IWp43dbJtxGQypSvfWhG013S0VgyBqar2nl8/XQxPEiQEFHr
 mt4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1NLbj63p78gaZ8WaajEU8PUTCmU7WPY2qFfR3aIc2H8=;
 b=iwbA+Id8KHxcK4Rsy70P5A44+Ht8c/yhVI6li/5Fdf0o/iWWxuWhNH0XRPN6DliMUh
 cFH6qX5EP0G63UDcWt9bv5cVv2RJgGaaAHoQhhjMAX/mK4Wu8herRGEmYUngAhhYZDpb
 07KRZXJ9Kl2sz2oHOR8fD6wdiMwX70LD1bSU4QUlF3aftD/8ziy5ARdhD+21DwT655xN
 el+8/EoYlKg6TzYp8ZXZH/tpu4AkO7rBLQ/ZO10ymfLfcBya6/5uh9lb4lUk9PQA1WlL
 8YQcvLBXLeS7Wcw17XYGGmBHmjOtp7fh51UiWgBzOojFw81PP8UaBY33wz0UIyckN4L+
 JXnQ==
X-Gm-Message-State: AOAM5328nqlqOCsh2MNuRtxOHX3BVab7w672vIs8bkt73AbDCA1CZAb+
 OYPe0z6zh8RzqFf8nRk307GsOg==
X-Google-Smtp-Source: ABdhPJxg0SzgI+t9GI5poUsf996ZK2hzQvgWSQYGKBMZk4wcTKUZeLadLadxYiaP5JO/Z+O8cYDoXw==
X-Received: by 2002:a17:907:d13:b0:6fe:ece3:64e1 with SMTP id
 gn19-20020a1709070d1300b006feece364e1mr40377450ejc.584.1654068986057; 
 Wed, 01 Jun 2022 00:36:26 -0700 (PDT)
Received: from [192.168.0.179] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 bv3-20020a170906b1c300b006f3ef214ddesm374169ejb.68.2022.06.01.00.36.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jun 2022 00:36:25 -0700 (PDT)
Message-ID: <92708b65-231a-68db-f624-02a6e76cb49d@linaro.org>
Date: Wed, 1 Jun 2022 09:36:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [RESEND 02/14] dt-bindings: power: supply: Add Mediatek MT6370
 Charger binding
Content-Language: en-US
To: ChiaEn Wu <peterwu.pub@gmail.com>, lee.jones@linaro.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com, pavel@ucw.cz,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, sre@kernel.org, chunfeng.yun@mediatek.com,
 gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de,
 lgirdwood@gmail.com, broonie@kernel.org, linux@roeck-us.net,
 heikki.krogerus@linux.intel.com, deller@gmx.de
References: <20220531111900.19422-1-peterwu.pub@gmail.com>
 <20220531111900.19422-3-peterwu.pub@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220531111900.19422-3-peterwu.pub@gmail.com>
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
> From: ChiaEn Wu <chiaen_wu@richtek.com>
> 
> Add Mediatek MT6370 Charger binding documentation.
> 

Please apply my previous comments.


Best regards,
Krzysztof
