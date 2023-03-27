Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB2C6C9C7F
	for <lists+dri-devel@lfdr.de>; Mon, 27 Mar 2023 09:42:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A123310E330;
	Mon, 27 Mar 2023 07:42:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 239D510E330
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Mar 2023 07:42:29 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id y14so7621978wrq.4
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Mar 2023 00:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679902947;
 h=content-transfer-encoding:in-reply-to:organization:references:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=B5aU9bHzODaK8qjg9M5VSodvgfMkOAX5VGyvS2DpbQA=;
 b=xHrEr7PIQIf09Cr3ey43d9JBP+62zFFkxZKCzSP2+3BFp29qyif4AxPc6xBSj3P7G0
 nMFI2mfhBB/IACWJjyLxQfP/u2IQOQ5PQ+/kAfw/mX5L68QZ7YjYp3iSSSK0GBJM8VEL
 RnLiM9Xpi8nDMk/FhJDsZ/67f6l/seoLgacYtASi9na0MRPgAr1i3q8gi5NeQOQeailM
 otEOfsrgkUm1UZxhRbqlh05HbCUaN/nxhrUTUp/uXMoj0gwH7mIlJ5yRLbOdXHEdJXSx
 pofV4dhqXapsbaL2/5nOzuqkO4C0uRQvcnuTUmr2KHXVnGbIQn/3s3O7cOM9MAgcEzeB
 Qneg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679902947;
 h=content-transfer-encoding:in-reply-to:organization:references:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=B5aU9bHzODaK8qjg9M5VSodvgfMkOAX5VGyvS2DpbQA=;
 b=w2AcGJqkh45J7SgRTAqjt699I7cd0ZWJjA42wlduGgrOG/IK2k8RR1rd28d3AAHBKb
 W6Dy+qzZQo8hHXnUAJcJEX+VQb9+BA4H/zyAcbLnk86tpx6jB4/dzMcTZb0f8l2SzyvZ
 fLlOoeQhkmiIs42eKjR1pUpHKYeYj02cfFc+s6dkU84twzjl4PWJvfWJcXN/+RFH+vsH
 ZeNX4lQAiieec54Plb+vW0yICEv+8u3mAQVGN10qUWd9NeqoMURlDEL/sdvs97x0k4mD
 OAhf7E4rUnAf3N3EfqSmxVcOSUKEvHh/TMmiMSkwML9IrzkVpdjPbhHSLVu6idMuXKBY
 IU3A==
X-Gm-Message-State: AAQBX9f6XFUej8MZLxUksMzZnNo3WInyfkOx9cWfP2GEVX+EfCCRPdvZ
 rFPEovL7TMWI3IaoTX9swfCikA==
X-Google-Smtp-Source: AKy350Y7Xtq3GeNICmc/HAEhJPJTRUMyKgTgsk272dxkFzbBWSYpjLumSnh5q86Hp8LTDdGcQEJ6gw==
X-Received: by 2002:adf:d4cc:0:b0:2d0:2d4:958c with SMTP id
 w12-20020adfd4cc000000b002d002d4958cmr8430384wrk.60.1679902947527; 
 Mon, 27 Mar 2023 00:42:27 -0700 (PDT)
Received: from [192.168.7.111] (679773502.box.freepro.com. [212.114.21.58])
 by smtp.gmail.com with ESMTPSA id
 a3-20020adffb83000000b002c561805a4csm24279636wrr.45.2023.03.27.00.42.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Mar 2023 00:42:27 -0700 (PDT)
Message-ID: <43e02cfd-8fba-05c9-43b0-cf9382704ea9@linaro.org>
Date: Mon, 27 Mar 2023 09:42:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 4/4] dt-bindings: display: sitronix, st7701: document port
 and rotation
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20230326204224.80181-1-krzysztof.kozlowski@linaro.org>
 <20230326204224.80181-4-krzysztof.kozlowski@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230326204224.80181-4-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Reply-To: neil.armstrong@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 26/03/2023 22:42, Krzysztof Kozlowski wrote:
> Panels are supposed to have one port (defined in panel-common.yaml
> binding) and can have also rotation:
> 
>    rk3326-odroid-go3.dtb: panel@0: 'port', 'rotation' do not match any of the regexes: 'pinctrl-[0-9]+'
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   .../bindings/display/panel/sitronix,st7701.yaml          | 9 +++++++++
>   1 file changed, 9 insertions(+)

<snip>

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
