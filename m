Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B6D8759E48
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 21:12:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E371110E4FE;
	Wed, 19 Jul 2023 19:12:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8F0110E4F9
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 19:12:20 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-3fbf1b82d9cso67662345e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 12:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689793939; x=1692385939;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jvEd31taP6wRlK87QhahHcwJ2xv09Kelq5ZrE/jUkus=;
 b=RvVQYPe8RGBdZ0GX4ZHzlJeksnNyFaI3oGxbC3lkCMAqDDYGSE/xRCC/uHtjgEtvts
 h8HF6UKbjfaD24l0eLWrgvsm9P7LoONlTdSjV7Q+lPaKNkV8mGfi0TbqV+IzRmz/Z7S1
 WoUNxoa0WK4O1E6m1MsO4XQ8K3f/4R+5Uv5FXyjvo1L68uXYoehq990tWk4v5kknm7DC
 0IjAyV82/ljwoSgtJdvMmM/8xCLP4wFyYb4CtgU5lV4u10aTT28yQ2Okf1YLxKBEJPlc
 LBUi15++rvWzVl3/rMQ+lo9ahfi6IJCuEP1ltmFxlNckTyPLnNNadr7Sdpl2OeqIADoJ
 HLcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689793939; x=1692385939;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jvEd31taP6wRlK87QhahHcwJ2xv09Kelq5ZrE/jUkus=;
 b=UtE3aCCo3z8mJvGJsfJr7ayoNKZPH3+UKEG5NBTkRKQTHxTgIicr6DbHu5HPZtIyiB
 q/xtMbbzXsFbWey5DfnFfuqRHesJSzleq4uLBDlO5Uw9Hg8IDpo7JhNKhoo77JT6n+8A
 EqU/+KOBjZz+YJo5JOjdr8VIxb+yhaGbe0dhzglPQDBdmEkkzvjfqo2XLnfcpT9dsZXY
 A+Dt1K3oyemYdBLxQaPr+VLzyZvNK7SucTj83jN5JCxGaG3mesIRw2pFko0eTxWBYIEW
 8GkUzM1agpab5SfEUsbDavHzS9MCi9F3hB4j6hmdnJht+PXCbeBuTpjyxRBxPoWbAHM7
 G+CQ==
X-Gm-Message-State: ABy/qLYESPwdSo50kdyPvJ6sRkx7XXp8sydxYqVwa0QVJS2Uq4DbHIhN
 Q32GSJOABVGxXtC1SybHsfPVQQ==
X-Google-Smtp-Source: APBJJlHV3QTWLiDrXN1wXQpc5tvZUnIgvqfABF7e0qbLd5AUbQE0ZrnB/TUSRe5tzJ0INWbVauth0g==
X-Received: by 2002:a7b:c7da:0:b0:3fb:a2b6:8dfd with SMTP id
 z26-20020a7bc7da000000b003fba2b68dfdmr2596160wmk.32.1689793938728; 
 Wed, 19 Jul 2023 12:12:18 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
 by smtp.gmail.com with ESMTPSA id
 7-20020a05600c230700b003fba6709c68sm2334548wmo.47.2023.07.19.12.12.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Jul 2023 12:12:18 -0700 (PDT)
Message-ID: <a4ad14db-f3e6-a9a9-c7a9-b64bf2b3d33d@linaro.org>
Date: Wed, 19 Jul 2023 21:12:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 2/3] dt-bindings: display: panel: Add panels based on
 ILITEK ILI9806E
Content-Language: en-US
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20230719152147.355486-1-luca.ceresoli@bootlin.com>
 <20230719152147.355486-2-luca.ceresoli@bootlin.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230719152147.355486-2-luca.ceresoli@bootlin.com>
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, devicetree@vger.kernel.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 19/07/2023 17:21, Luca Ceresoli wrote:
> Add bindings for LCD panels based on the ILITEK ILI9806E RGB controller
> connected over SPI and the "ShenZhen New Display Co NDS040480800-V3"
> 480x800 panel based on it.


> diff --git a/MAINTAINERS b/MAINTAINERS
> index aee340630eca..3c38699ee821 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6515,6 +6515,12 @@ T:	git git://anongit.freedesktop.org/drm/drm-misc
>  F:	Documentation/devicetree/bindings/display/ilitek,ili9486.yaml
>  F:	drivers/gpu/drm/tiny/ili9486.c
>  
> +DRM DRIVER FOR ILITEK ILI9806E PANELS
> +M:	Luca Ceresoli <luca.ceresoli@bootlin.com>
> +S:	Maintained
> +T:	git git://anongit.freedesktop.org/drm/drm-misc

Nope, same for recent one-driver-subsystem. It's like a second try...
You do not have git tree for one driver. The git tree is for subsystem,
not driver.

Best regards,
Krzysztof

