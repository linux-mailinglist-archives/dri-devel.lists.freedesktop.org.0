Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 787F16C9C39
	for <lists+dri-devel@lfdr.de>; Mon, 27 Mar 2023 09:36:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 681FB10E265;
	Mon, 27 Mar 2023 07:36:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C887010E265
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Mar 2023 07:36:22 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id l12so7578458wrm.10
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Mar 2023 00:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679902581;
 h=content-transfer-encoding:in-reply-to:organization:references:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=YEIQ17cReUpj3NLdD60sp+mWH9LUrjuCCZwl6mkty+4=;
 b=ejG9zLMXk6/eBK4wOchabkPaYZFwSBGMD6FwSgyyaLlkUIDDZNV51XXgPX4rF2iUVC
 RJDLJgHzgsa+d4gF9Bn9bhqBWZL+NmcZ0PYw/3URdGHNkmdSPa8HuNhAyfEIXi5qwqpV
 XafX8UVtABErLiSKKAHVXYgGARqUJlUvubSCb1F0g2TybPVMWtnhj7rBoz5Cus6Ooo4a
 I92pYMWPnAxMnvd3GDKGwv/kElbFrs3HacTjXlnsrFmaP68e0+R806FNplTZp2LE4nXO
 N2mgoT0pK0cqm8QadXLVFcgcsctOy+Pa8/5Qm2BYGImJUH5eFlFInjiTofHj0brO8xlR
 nNxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679902581;
 h=content-transfer-encoding:in-reply-to:organization:references:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YEIQ17cReUpj3NLdD60sp+mWH9LUrjuCCZwl6mkty+4=;
 b=aBAThLrR0jXhs9drAC4nA4EZO0OTDops0xaCkaxK7pm6+I6aeM9Cg401N5b2UoH4dR
 VtEx/V2jvO4jkgMIvdaeYXQFsBxqghDHxinada6u7aE56bVDmmHMhUtO+DqDrk3FUlRv
 RmSgzhjdb4QvFdDZk0bhtoR3cOJrNxux5xMRvw9THXsZvA5g+747sFLV8WhMhja13Ag1
 B2hVtfQ7Tf8ojNuGK0sBHk9ijXxNNka/13OOn250nqSdnQXlXkey4az+an01eVWtiFng
 rjAh0GOK8x5cDI+8q0nDH9ZCx/khbF5gvxzbpto1l2r18guD2D8UyWUl9cCwMvbgTNwW
 AC9A==
X-Gm-Message-State: AAQBX9dkjCf6zWUyIqFYVZ1mQoCwSoKy646viFEu+OLgpN0kCbjFrIGk
 AN+Krukm8WYyu6EbSkLbI+9vXQ==
X-Google-Smtp-Source: AKy350bl/w0uNx6XXsDNl7Qwy6QFuHNfbmfO1G/roslYiDFypUOyNTdLEF/7yzLyhJpAc9X3uAd6Pg==
X-Received: by 2002:adf:fd47:0:b0:2dc:cad4:87b9 with SMTP id
 h7-20020adffd47000000b002dccad487b9mr9462425wrs.68.1679902581210; 
 Mon, 27 Mar 2023 00:36:21 -0700 (PDT)
Received: from [192.168.7.111] (679773502.box.freepro.com. [212.114.21.58])
 by smtp.gmail.com with ESMTPSA id
 h6-20020adfe986000000b002d09cba6beasm24530620wrm.72.2023.03.27.00.36.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Mar 2023 00:36:20 -0700 (PDT)
Message-ID: <4fe8f6b9-86af-c57d-1c0d-7bd831b8732f@linaro.org>
Date: Mon, 27 Mar 2023 09:36:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/6] dt-bindings: display: novatek, nt36672a: correct VDDIO
 supply
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Michael Srba <Michael.Srba@seznam.cz>,
 Harigovindan P <harigovi@codeaurora.org>,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230326155425.91181-1-krzysztof.kozlowski@linaro.org>
 <20230326155425.91181-2-krzysztof.kozlowski@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230326155425.91181-2-krzysztof.kozlowski@linaro.org>
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

On 26/03/2023 17:54, Krzysztof Kozlowski wrote:
> The nt36672a bindings were added with a mistake on VDDIO supply calling
> it in one place vddio and in other vddi0.  Typical name is rather vddio
> which is also now used by DTS (sdm845-xiaomi-beryllium-common.dtsi) and
> Linux driver.
> 
> Fixes: c2abcf30efb8 ("dt-bindings: display: novatek,nt36672a: Fix unevaluated properties warning")
> Fixes: 9528a02430df ("dt-bindings: display: panel: Add bindings for Novatek nt36672a")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   .../devicetree/bindings/display/panel/novatek,nt36672a.yaml | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)

<snip>

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
