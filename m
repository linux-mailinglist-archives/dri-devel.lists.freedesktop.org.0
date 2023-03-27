Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 360B26C9C30
	for <lists+dri-devel@lfdr.de>; Mon, 27 Mar 2023 09:35:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D83910E222;
	Mon, 27 Mar 2023 07:35:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3317810E222
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Mar 2023 07:35:25 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id d17so7578964wrb.11
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Mar 2023 00:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679902523;
 h=content-transfer-encoding:in-reply-to:organization:references:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=hUUIlCCSusXuIUbK8ao9/l+7rjKJGKXCAR4GRUaMd3w=;
 b=zAGlj0HG92BQp2NQn/qoGG/XU8I2x7Ca45RcIIPMDDdCh5UJtDWUcjcqzfp9AMvXir
 O9HvO/+RonfIqMR3VTJG0RBQqoKlaOSs4p8ImoRzxGa004AjIyBFOR7FfnQ5ua6aJqqk
 0mdzytGYEBb7qUUi7uD898bPJ6fcXR2suwFH7Ilbs5Erw8KuB1JOk1M//M/VJEljLinX
 SrDUckFCqQnarOASQTLNK3flN553o1cU99NuDauPENjkaibRl8+LRX04L9DaiBuRUupr
 j+EDvu+qfrc11gij0Wb6a0/c7um2fgBxCmM0u98Nrs3xsbQ97zY3a1P1AjQeL4X6jCh1
 Xn5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679902523;
 h=content-transfer-encoding:in-reply-to:organization:references:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hUUIlCCSusXuIUbK8ao9/l+7rjKJGKXCAR4GRUaMd3w=;
 b=p+PEhHZT07fDHxanOoW8oK2E1HxkkcdfP8FCrJQ3oweq7133KT7wU1ajtfO1/T5weB
 1czbK4Nv4HprdX9w7TS4STe1HOUnAzja9mWVzt6y2Sl8YHTv81MoOQxe1fyxyWHgSycN
 yvmRP1h19ago7c7W2jpRH6jEECR35GTTyAn1Cm5ivy/nA8zvv6QfpIGe9roXRZ4U5IQe
 XuIp54SdU+87OM3HvP6E8p5EGzs5XjNY5hX3O4GELfyptvaAcuV2x/T2bNEnJIzPDi1l
 tIaqqOieBvz3jKJ1wHyJWx8lmpbRRPy+QHejL5rKiCPNmqmTbbumAK3LdhlJpny9Ub+H
 KLBg==
X-Gm-Message-State: AAQBX9ddgkQRLjAajRs58fuZmlif3z1M6pQKCW4KxPgvdW5ngpJLm6vV
 BQ9pnRweT4/vgv4/Dp3i5aYP+Q==
X-Google-Smtp-Source: AKy350basepWyA7cJrWSHJE4h50ml/pm16/tEY+oV7GILd+6++p2mht+ak9fMFA0pA/bKmZtL9VWTA==
X-Received: by 2002:adf:eb8c:0:b0:2ce:a8e9:bb3a with SMTP id
 t12-20020adfeb8c000000b002cea8e9bb3amr7887211wrn.4.1679902523399; 
 Mon, 27 Mar 2023 00:35:23 -0700 (PDT)
Received: from [192.168.7.111] (679773502.box.freepro.com. [212.114.21.58])
 by smtp.gmail.com with ESMTPSA id
 n1-20020a5d67c1000000b002cfe685bfd6sm24329945wrw.108.2023.03.27.00.35.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Mar 2023 00:35:23 -0700 (PDT)
Message-ID: <502597c6-3e8d-0a63-b81e-8011ffdfae43@linaro.org>
Date: Mon, 27 Mar 2023 09:35:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 1/6] dt-bindings: display: panel-simple: merge Innolux
 p120zdg-bf1
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
Organization: Linaro Developer Services
In-Reply-To: <20230326155425.91181-1-krzysztof.kozlowski@linaro.org>
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
> There is nothing special in Innolux p120zdg-bf1 panel, so just like
> other Innolux panels it can be made part of panel-simple.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   .../display/panel/innolux,p120zdg-bf1.yaml    | 43 -------------------
>   .../bindings/display/panel/panel-simple.yaml  |  2 +
>   2 files changed, 2 insertions(+), 43 deletions(-)
>   delete mode 100644 Documentation/devicetree/bindings/display/panel/innolux,p120zdg-bf1.yaml
> 

<snip>

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
