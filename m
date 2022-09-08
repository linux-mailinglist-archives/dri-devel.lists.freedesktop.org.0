Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A3B5B201F
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 16:06:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AF7310E9D7;
	Thu,  8 Sep 2022 14:06:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D7AF10EB11
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Sep 2022 14:06:40 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id y18so5285374ljh.12
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Sep 2022 07:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=yyJq2F0UIbp+QN4RLKTqNQQiuOE3MJUDBVNBCzzbv0A=;
 b=jN0L5qJ317FYKljRrrDKg+a+g5126FgqcjsqJcEV6qe4q4cnjglJnb/GMqroHSWfno
 sZrYKtZEF//nog6SYx13NsBfirUJeskM5y8XqJLmkkKxMOgL+vokp5v5IdEQ5PBjF6BI
 3bMeDZ5EnPRZvtVt/jZ9UJ6d6Hs9xlZyOSOJ+ia6/FI4cicFsS7uY6AfO1mrcljv/gSA
 MjKhwAHGNcsVgaibKu0NjzI7wmD0ZNUyc527Pn+oqDEWpObkABHLyhwCCrLPUmiw3XgY
 M/N0CQc1kLbMjwrmvxwJzYDzQ1CVgUU0JPF9dNG2KWSqBM7LJzkCFx2uDfjanv4q36HD
 4Mjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=yyJq2F0UIbp+QN4RLKTqNQQiuOE3MJUDBVNBCzzbv0A=;
 b=bvsyMnxJE5f8liWACPoPLz79zD6RoC4g+VIety4Rr709DzameKmjnmQaq/p+poqVs7
 fydT3/Fem/9BZvyt0lSc+OdIBdYw+QMXThezXvmmgGcsMyfxI6sKBezyeD+Uuls/2xXW
 en+rxrZCrv0oTsnLX94SwPm+p0X8DBzs6A4K508XDWBAYPpnYInqfLzTU7pDqMDg5M91
 nSaFo9Xgh2m0q5xRVK56tbruzg749RQnLo3EqL7GlxhQWGg2Gf0eaOLhHv0cSbsqkh1G
 8xz3Rg/hUBuwpO5qT8vf9ZC7uWswmQVUWbgvA785R+RsIjFn9e8sLpHw0Rft3GulIqJm
 Ldag==
X-Gm-Message-State: ACgBeo1UP3Pnjc7sZ1zaIBjhR1yTG57ziuALtbqR6DBe+hzDoNJeWuzE
 R+G88qcm7WOFIDNm1Sdci+xb4Q==
X-Google-Smtp-Source: AA6agR5LPl1a0KPnCaPB/QMCDGFCxhQnxUbgV0nlJe5WM/dkbNUMQCIkWHKyqliNnOG3IZKiDM47rA==
X-Received: by 2002:a2e:888f:0:b0:268:d10e:8a2b with SMTP id
 k15-20020a2e888f000000b00268d10e8a2bmr2575455lji.114.1662645998508; 
 Thu, 08 Sep 2022 07:06:38 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 v23-20020ac258f7000000b00497a5a91763sm1151817lfo.12.2022.09.08.07.06.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Sep 2022 07:06:37 -0700 (PDT)
Message-ID: <837b2df1-551b-3e34-4ef3-6a301278f10f@linaro.org>
Date: Thu, 8 Sep 2022 16:06:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 3/4] dt-bindings: display: Document Jadard JD9365DA-H3
 DSI panel
Content-Language: en-US
To: Jagan Teki <jagan@edgeble.ai>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Linus Walleij <linus.walleij@linaro.org>
References: <20220908135940.299324-1-jagan@edgeble.ai>
 <20220908135940.299324-3-jagan@edgeble.ai>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220908135940.299324-3-jagan@edgeble.ai>
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08/09/2022 15:59, Jagan Teki wrote:
> Jadard JD9365DA-H3 is WUXGA MIPI DSI panel and it support TFT
> dot matrix LCD with 800RGBx1280 dots at maximum.
> 
> Document it.
> 
> Cc: dri-devel@lists.freedesktop.org
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


> Signed-off-by: Jagan Teki <jagan@edgeble.ai>
> ---
> Changes for v2:
> - collect Krzysztof ack

There was no ack.

https://lore.kernel.org/all/f492ded6-16a8-6c15-2826-6ce2f784dffe@linaro.org/

Best regards,
Krzysztof
