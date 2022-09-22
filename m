Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD2995E6686
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 17:11:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99D8810EBED;
	Thu, 22 Sep 2022 15:11:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 325B210EB6A
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 15:11:43 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id z25so15230420lfr.2
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 08:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=Of/e/DsUwQnje7nUDH51LGdhhqQxwCXjdyhF7cE+gag=;
 b=I2vNRQe3j/Px5N3sFjqPR6lVPdC43kbX0JVwSBnodAPsKjm6aZcgUTcfZPPLIxjPJq
 rTqS+6BrxwDe9jkdY50RosndBK1v02E/l2DvK6PHM1ooiggIi+hWUSx3PxsSO0pe0Vtx
 mGA7ztHQkO3HZdEoBXvNTJVaH3Q4oKhB2slfIDRplJw1pF5HYfM8FhRU9+2wMgiof2Oh
 4zLUlyd9Yk7eb/Gt7hq7Xiwbb/+d0wHeB2yZdNE9HW8nGEa3+yVzlOCALUeRlBUrGwzQ
 9IB7Qf299GPaNsWTg6rrzDOsQR6QjjC8eXRpLZR9QolcEc193egGY+poRylxDpFAGSdu
 aaGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=Of/e/DsUwQnje7nUDH51LGdhhqQxwCXjdyhF7cE+gag=;
 b=b+S8ILLv0BaVqUQylxw1CkJ53Rox44XMoL0t+oQsA1YgFQXxXqpl8lTUtxwRxx34Kf
 0obxlV25IfE5RR/Ute53I8RMPSotR1pdr/sqYfRkKVo7Uh4xqNerCm37l/SUeQUfy175
 TyVUnEQavjymyHhnaS/f5jzKB2EqnWp52wi0Eg8ei3pHWx+BMbzGjAxt/QfANkpRhbIA
 1c4SjmrjRLJr4z3xY8TZjLkOPoKMI1ievOC98Lj1vzAgaysm0v7OlT1mIhjLGbuVFj0v
 Obg+/V7NVHEuKH90IlWYl5GtrC+qc0DxUKe7DdjCjV/Bz/11chExamqKbUaf/TiaU1L+
 pHyw==
X-Gm-Message-State: ACrzQf1CqDna7KrqviAEg54E244fuOyYtbycs4S107MCF9fgsdTri3Ky
 o1y3UN8B/4sYE5RFyUn6FvOqWUdUsJ4o6Q==
X-Google-Smtp-Source: AMsMyM591w0zWpr3juijfm3T/ihjcOQsPJL2NwnWKmKlNoP/1XyxjUhwTKQEcIHQ1/3q7RGUkpmP/w==
X-Received: by 2002:a05:6512:3d29:b0:498:fcd5:571a with SMTP id
 d41-20020a0565123d2900b00498fcd5571amr1533152lfv.70.1663859501564; 
 Thu, 22 Sep 2022 08:11:41 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 k10-20020ac257ca000000b004998d9ccb62sm982335lfo.99.2022.09.22.08.11.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Sep 2022 08:11:41 -0700 (PDT)
Message-ID: <02f44228-866a-f096-1e90-dfbd31660491@linaro.org>
Date: Thu, 22 Sep 2022 17:11:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2 1/2] dt-bindings: display/panel: Add Sony Tama TD4353
 JDI display panel
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht
References: <20220922135902.129760-1-konrad.dybcio@somainline.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220922135902.129760-1-konrad.dybcio@somainline.org>
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
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 jamipkettunen@somainline.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, martin.botka@somainline.org,
 dri-devel@lists.freedesktop.org, angelogioacchino.delregno@somainline.org,
 marijn.suijten@somainline.org, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 22/09/2022 15:58, Konrad Dybcio wrote:
> Add bindings for the display panel used on some Sony Xperia XZ2 and XZ2
> Compact smartphones.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>

Thank you for your patch. There is something to discuss/improve.

> +
> +  reg: true
> +
> +  backlight: true
> +
> +  vddio-supply:
> +    description: VDDIO 1.8V supply
> +
> +  vsp-supply:
> +    description: Positive 5.5V supply
> +
> +  vsn-supply:
> +    description: Negative 5.5V supply
> +
> +  preset-gpios:

How about bringing them closer to common GPIOs:
panel-reset-gpios
?

> +    description: Display panel reset pin
> +
> +  treset-gpios:

touch-reset-gpios


Best regards,
Krzysztof

