Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C2375EF20
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 11:30:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D622189207;
	Mon, 24 Jul 2023 09:30:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69F7910E087
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jul 2023 09:30:02 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-99364ae9596so732045966b.1
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jul 2023 02:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690191001; x=1690795801;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=57uky2J15DdtQrv2rjlWZgMfo8NXsRG2fMzc55Ic198=;
 b=jFUErFeLeVEptlB+O9nzNQK7hMxAZV5rnGkc32PL+8jQzi2r2g/x7soBqZdIg6Fxrg
 We4BePUKG4F7C8zc7TXoYaa8FPk8Vfx0s+CbXcu2UnFDofBjAYUmZRBXpe2XCU1ggQa3
 u7JeLIVl9rW+W+bhv5MYSWMw0DAjE8RTfxWmR5FRpJ/0oKtUUtIfH/CRWhU3lpJvm4Wh
 GdlPrwSKegBu95Tk9ra339DpmFjPsQM8MtJ1LdqVzEZDNAZz7G8K+VXrRpRGrLBu91wO
 TkPIadcN39N9Wic+GOZ05rdWfLmp86SsGQHf6PFdorOi00nVmftfU0Px4enSOwf+01YO
 2zxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690191001; x=1690795801;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=57uky2J15DdtQrv2rjlWZgMfo8NXsRG2fMzc55Ic198=;
 b=V2GIWHjrPYxoGeljUIXPyk1Fij6z+ORsFECOOu+gFidOBTEec6y4Xb52Jv4aCqsZRw
 kO2TyobZQgk8sv6A046QwtOK0lQK9p2T2UbKQf2DmsG2TxPD4MDS6NdsPEPaplX5L5B9
 0TtiY/7hNsN3ugkpvD6WbrY35J/Qg5m0s0b18LzWfKlQ6THBg3q5RWz5Ec/VfvX9N+6m
 gFcOszRjBCSnWwAYp/CpLxvknTObGlhGf4UU3HJ7ggMK/fGeIZ+/bybSnK5c89kSK6fw
 HDKCxKhYmFQSWM/OyYDtdOeAb7hrTX7Opil0cy0l1ZRILdtsLr2RofCAwJPzrRcj2fDL
 54mA==
X-Gm-Message-State: ABy/qLabik63IUwiABxtPkhcSB82szbXpti/IB1smikwcXN2Vi8lJp3I
 JqK2IUde6b/3zrQIgxZOz7w9lQ==
X-Google-Smtp-Source: APBJJlEJtEovotfOmkPJ26TOunzbReLP+q75OveEDvLGcOEOs/CvHoM5sMCzzWydJ4UlTAkQtjQQRQ==
X-Received: by 2002:a17:906:7a01:b0:992:a0c7:8d2a with SMTP id
 d1-20020a1709067a0100b00992a0c78d2amr9270109ejo.54.1690191000874; 
 Mon, 24 Jul 2023 02:30:00 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
 by smtp.gmail.com with ESMTPSA id
 s8-20020a170906960800b0099316c56db9sm6376255ejx.127.2023.07.24.02.29.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jul 2023 02:30:00 -0700 (PDT)
Message-ID: <6e6562b3-82a1-433d-f44b-f717e2f9943c@linaro.org>
Date: Mon, 24 Jul 2023 11:29:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 1/2] dt-bindings: display: add bindings for pcd8544
 displays
Content-Language: en-US
To: Viktar Simanenka <viteosen@gmail.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230724090713.1489-1-viteosen@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230724090713.1489-1-viteosen@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 24/07/2023 11:07, Viktar Simanenka wrote:
> Add device tree binding documentation for PCD8544 LCD display controller.
> 
> Signed-off-by: Viktar Simanenka <viteosen@gmail.com>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

