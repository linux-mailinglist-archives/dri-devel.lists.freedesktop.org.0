Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5827854EC02
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 23:06:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C66110EB98;
	Thu, 16 Jun 2022 21:06:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3F4610EB98
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 21:06:43 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id h1so2209400plf.11
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 14:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=VtmK4PlOvwmg8uG2yB4Iza9UeAeTmHfNh0gkImG1Z7Y=;
 b=AfSPntI6oxl4+O84tcbZn9AlYby5A4XPDEpOw3VBVXQfEnkB5Zd+1/AnjwHEhI6tAW
 2kpzxagrIGyEC5orssmUh3dmYlI2dcfJ3CddYCnZLFn5wPwvhC3TISHn1bu80xrXK6Dw
 FAwg0Sz6bbeINYT2pNrE2zKzi7iItDE66Nb46/s5r3YaBXnFNhj0TmN0DKo/blsATQ4K
 /+V34zlE/Gr9gawoF7DRfk3FnxT6iZf0CKNLBRwDI4SQLtlVUbqLmqsCOyIT8Fno+L/8
 qvGNeJRjC9HmsTfE2nxHsmE1cDKUgQNg34dN8SQkqtgc818mkFNcRn0SJtBSVE+uZzE4
 65gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=VtmK4PlOvwmg8uG2yB4Iza9UeAeTmHfNh0gkImG1Z7Y=;
 b=024mTymGA501mceIErP3lCVxQU5N3EsngEBD6qN1xc7TPyDXS+HuDIodWcAtlVw1sl
 r7K2rUkFDYJXsQQGQhjKYUP508ph7Cs3uV9Y2hovGwi3HTsfu/hWfV786Vgj2pqRVk4j
 e14j08W3Y7lfDiIfDGU0KaXo+W6gsd+sLZm8S/KSqlrNPdLOlLQs4goOf8oR7cq9QxJb
 CYWzOcf7sM8ZjpSyCTM+YY9QH37qe31x++Ijn17rEK9D0i2S/Fegfweox81H8iIS4lwC
 5SeMfMib6/4LDlJ3fRr2JuJRGvO7hGf+e1reqiiteQW29dQFs4tJ+NrjavBIj49x1Wf3
 WuBg==
X-Gm-Message-State: AJIora+OXv1wLuw4nOvKlQ3u6OWqeHNFvdM4V6e/L7FoK1lq52nEEd6w
 XrHIxvxoRVgflHjEX93K97PyRQ==
X-Google-Smtp-Source: AGRyM1uoWZHt0T98ywktREBlYQc26uVL0feT2aArCGGme4dAjDJxMF+QrxIhVpQEzb94h1kNG0iEnw==
X-Received: by 2002:a17:902:cec2:b0:166:4277:e0c0 with SMTP id
 d2-20020a170902cec200b001664277e0c0mr6288631plg.107.1655413603366; 
 Thu, 16 Jun 2022 14:06:43 -0700 (PDT)
Received: from [172.22.33.138] ([192.77.111.2])
 by smtp.gmail.com with ESMTPSA id
 c9-20020a62f849000000b00522d32a6a38sm2165252pfm.121.2022.06.16.14.06.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Jun 2022 14:06:43 -0700 (PDT)
Message-ID: <f6ad5cef-22d8-307b-5c9b-acfd3e784093@linaro.org>
Date: Thu, 16 Jun 2022 14:06:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 01/15] dt-bindings: usb: Add Mediatek MT6370 TCPC
Content-Language: en-US
To: ChiaEn Wu <peterwu.pub@gmail.com>, jic23@kernel.org, lars@metafoo.de,
 matthias.bgg@gmail.com, lee.jones@linaro.org, daniel.thompson@linaro.org,
 jingoohan1@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
References: <20220613111146.25221-1-peterwu.pub@gmail.com>
 <20220613111146.25221-2-peterwu.pub@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220613111146.25221-2-peterwu.pub@gmail.com>
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
 szunichen@gmail.com, linux-pm@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, ChiYuan Huang <cy_huang@richtek.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 13/06/2022 04:11, ChiaEn Wu wrote:
> From: ChiYuan Huang <cy_huang@richtek.com>
> 
> Add Mediatek MT6370 TCPC binding documentation.
> 
> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
