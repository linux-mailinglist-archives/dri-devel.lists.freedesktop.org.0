Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BADD85AC5F9
	for <lists+dri-devel@lfdr.de>; Sun,  4 Sep 2022 21:08:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C5A810E02F;
	Sun,  4 Sep 2022 19:08:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B31C10E02F
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Sep 2022 19:08:22 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id m7so10380321lfq.8
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Sep 2022 12:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=YlkqaOEVfnAcJNdhPnwwyOFkWGniyUwZfTkbWM3JHJU=;
 b=QPTVeGwGHyB4PL/sHpYy7p22E6WFaqGiRYwoqgTJz+HosSqH4kTIcJrx+WvKKcTaif
 X5+5jekS2yhUfmoL43nWc7zFasmiZYcm2Tb5Bk5ERZESMdDXCCe2w1LdA2M961efLlu6
 r5cIuXiOMzfYjYLhFa0qv/5d97ItAlmwnPaqRKqix9TxnrCMbjjaGvL19fTgzlTnNZHT
 +3RqmCDdYOtKu8dlDqIyjCC0nIccSoTH3BNtP6uyGfWpQTnsdb6oYNspTDzu5DnOZo65
 JSZ0cqbwxijrCcbMOkLmdbjvWF450RP2MWtnZYXYus8jYTv7ySiOIMOYQPwb+v6+eBW7
 +nXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=YlkqaOEVfnAcJNdhPnwwyOFkWGniyUwZfTkbWM3JHJU=;
 b=eBbALL6s5FN5lS5+4/t2x44sEYo5/5LavfRZXA9zSpUQt/6H2+JqofDaFU8MsY2NiR
 GMXapFKDzShdA+kWo+MRmdozBX2M76FQ/1fRVIMU1aT9WYQ0nDyKpEV+NWATwI2f/8kO
 aVeaSz7ah3fqv+8o8+TitBCv96qBu329fMTSPRkHsFy92VsrjmX288wMmYgsokjs3S5r
 VTak0qlSbmvs0QE80VMDliT9ABLFk7TiNWKzFIJL32QAUGjTN8lfhWNcMq+AW7SWJfOc
 KDOc0d6oeMCZX5ReudkT0JqaXng0ochnCnciwCn8Z24ovIK6NNp7p9FvqRIn6cCGvKiT
 rROg==
X-Gm-Message-State: ACgBeo1aoV5ZVWXrT/wb9ZkH68OifzXs4pCRhh/wAeQkW9CEg7mBeg1Z
 D62IocyTJFK5IOX3pU47hIFNRw==
X-Google-Smtp-Source: AA6agR7p5IsnW2ri1U1OVp+ptkLLArOLKqo0mv2HoCsVhvLQZUTZmSmhIRi0jPVkHoGttS5sY9kypQ==
X-Received: by 2002:ac2:4e15:0:b0:48b:7a5f:923c with SMTP id
 e21-20020ac24e15000000b0048b7a5f923cmr16415296lfr.134.1662318500695; 
 Sun, 04 Sep 2022 12:08:20 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 a24-20020ac25218000000b0048a7ef09b22sm985464lfl.274.2022.09.04.12.08.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 04 Sep 2022 12:08:20 -0700 (PDT)
Message-ID: <167a7200-264f-3214-d4b1-e1daaafb6985@linaro.org>
Date: Sun, 4 Sep 2022 22:08:18 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 2/4] dt-bindings: display: Add ClockworkPi CWD686 panel
Content-Language: en-US
To: Max Fierke <max@maxfierke.com>, thierry.reding@gmail.com,
 sam@ravnborg.org, airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
References: <20220903183753.25736-1-max@maxfierke.com>
 <20220903183753.25736-3-max@maxfierke.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220903183753.25736-3-max@maxfierke.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 03/09/2022 21:37, Max Fierke wrote:
> The CWD686 is a 6.86" IPS LCD panel used as the primary
> display in the ClockworkPi DevTerm portable (all cores)
> 
> Signed-off-by: Max Fierke <max@maxfierke.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
> Changes in v2 (Krzysztof Kozlowski and Rob Herring's Suggestions)
>  - remove redundant backlight example
>  - add missing regulators
> 
>  .../display/panel/clockworkpi,cwd686.yaml     | 63 +++++++++++++++++++
>  1 file changed, 63 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/clockworkpi,cwd686.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/clockworkpi,cwd686.yaml b/Documentation/devicetree/bindings/display/panel/clockworkpi,cwd686.yaml
> new file mode 100644
> index 000000000000..eaf55d629266
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/clockworkpi,cwd686.yaml
> @@ -0,0 +1,63 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/clockworkpi,cwd686.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ClockworkPi CWD686 6.86" IPS LCD panel
> +
> +maintainers:
> +  - Max Fierke <max@maxfierke.com>
> +
> +description: |
> +  The ClockworkPi CWD686 is a 6.86" ICNL9707-based IPS LCD panel used within the
> +  ClockworkPi DevTerm series of portable devices. The panel has a 480x1280
> +  resolution and uses 24 bit RGB per pixel.
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: clockworkpi,cwd686
> +
> +  reg:
> +    description: DSI virtual channel used by that screen
> +    maxItems: 1

You still need blank line here.

> +  iovcc-supply:
> +    description: regulator that supplies the iovcc voltage

And here...

> +  vci-supply:
> +    description: regulator that supplies the vci voltage
> +


Best regards,
Krzysztof
