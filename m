Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C607733FC1
	for <lists+dri-devel@lfdr.de>; Sat, 17 Jun 2023 10:52:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BD7B10E153;
	Sat, 17 Jun 2023 08:52:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F71310E153
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Jun 2023 08:52:05 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-519608ddbf7so1972523a12.2
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Jun 2023 01:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686991922; x=1689583922;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bB2U9UJNGuntWbNrhEHRVmsURRct8gsXOHbMcYwpz70=;
 b=YQxduGMANuZklpLtUfhq9DrUYdCxs6pAk1NAvhKzy9hWuoRPbsH1nwg73I2w4yftUO
 3QM2XOPbD92M4ZC9hwi0rcFXFiFfojemhNIrDfL0PUAPhA+wz5Wejxu/FUUvKbuKFsNG
 juOaBAYopVSpzijb6IrRbeA/sXu1R3/be41kvRImbopaSqqkUMb1OVxq1R9WR8WZUED1
 vhDGLmaCwSU8Mem8xnVBvtLk6nkYAD2u+q/jdsXE3YgNESDZHOw/mZ/ox2u6iXmuGWGS
 okAgAfRG+yqR3oZGt7ymenC2i4HK5+aVJXL8Rb4U3OQM5qDAG1OdCNrbYHY69G8YNiZU
 69PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686991922; x=1689583922;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bB2U9UJNGuntWbNrhEHRVmsURRct8gsXOHbMcYwpz70=;
 b=dej8ektK3sQ8aHwd6Z7KVKdI2+QMi6fN6zS2TwKS/xGKJnsJKbMFvw+WfqftdaivAa
 tPm/WL0fVZWbEu6GV9KgMnC/XmZgXaoR/ljK+qpzL0/+MqrZREk/+j0K5tooz0uhrP4s
 G6qiVuz26SAlDov9iozGsLxQDnRnJ2a0ZrfGUlKOvw4geX06d2PZ1OZjSDhbnXjvn2IK
 pag7CIGA88jpQ7BLSCjgcxT043pSyoKxZ6//rrJFR7RYJOqTyI66bpls1AJyPazBIa+q
 T2XgK+y32xJdXxNY9l+5QseIhFQi+ot16ebapzzqz1Xa6lq2U7PEgsODm6uSf3k0S5ql
 9wSw==
X-Gm-Message-State: AC+VfDxw0M87mCpRE/IGLSa+ANOfK3emXnZd/2//0xOj0pRathbLecZd
 5L54SFyJBwn8LI9APAm+G0kJaA==
X-Google-Smtp-Source: ACHHUZ47jVgEROZ1LtZo+4fKsAWabEGtadZtaswTh6d+iai7QL4aCJpOsebvaKSuV/kdE4HUc6bl8A==
X-Received: by 2002:aa7:d7d4:0:b0:518:7954:d082 with SMTP id
 e20-20020aa7d7d4000000b005187954d082mr3220697eds.10.1686991922181; 
 Sat, 17 Jun 2023 01:52:02 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
 by smtp.gmail.com with ESMTPSA id
 r13-20020aa7d58d000000b00514b2a9ce60sm10742423edq.81.2023.06.17.01.52.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Jun 2023 01:52:01 -0700 (PDT)
Message-ID: <958c6d46-d713-e701-29bd-f84d2b8790a2@linaro.org>
Date: Sat, 17 Jun 2023 10:51:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 1/6] dt-bindings: display: st7789v: Add the
 edt,et028013dma panel compatible
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org
References: <20230616163255.2804163-1-miquel.raynal@bootlin.com>
 <20230616163255.2804163-2-miquel.raynal@bootlin.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230616163255.2804163-2-miquel.raynal@bootlin.com>
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
Cc: devicetree@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Sebastian Reichel <sre@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Maxime Ripard <maxime@cerno.tech>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Michael Riesch <michael.riesch@wolfvision.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16/06/2023 18:32, Miquel Raynal wrote:
> The ST7789V LCD controller is also embedded in the ET028013DMA
> panel. Add a compatible string to describe this other panel.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  .../devicetree/bindings/display/panel/sitronix,st7789v.yaml      | 1 +
>  1 file changed, 1 insertion(+)


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

