Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6C54FB3D4
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 08:38:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 659E410EDB4;
	Mon, 11 Apr 2022 06:38:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A058710EDB3
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 06:38:23 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id c64so4896613edf.11
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Apr 2022 23:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=2WmKSNoZ9cWKL6JDASWnjI9NvSq7+tORNGnSjM+acks=;
 b=ODfe/DkGj1RuBxSc5J0EXQFnY/vL7RySjU4xh9bzSJOuWwZ4VAsC9/m4/eaLQ6CJl9
 QyrdjToejG5d1Qb/An1jX6vmjM2PDYFSJ9r+/5+rBxbn27zdhA/UNDf4zatsjZb2NBUh
 AbnvBXsf3y7KxVV7kVCuECnSxjbsZrs2szLVjgo8CohvcUfKrDT83QYnDYXfXQyaqJlH
 E33P1hJJjjxMEloiqUY9gxOFUCSsABl4hT7x7CUdyDYHqJD4eG9lJegQSh04Fwur0G4B
 8KGgJu0DtZN1p/FreHJOKXR9EhlgXXQ/wvLc4s5uuw5HufDXrQhq46vZWpzlqJu60raR
 Vbgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2WmKSNoZ9cWKL6JDASWnjI9NvSq7+tORNGnSjM+acks=;
 b=NurNGi+9U23Ml9zO6tw3jjb3cMczcwfFHoFPIUVOAlUjIyq5XbMmqHccGF3heiiUrx
 W8tS/sW7XJGwL8WD3cDFYeO0ju3CHXdc7LO/PomT3LeCduF1aXpOQUmzU4SuuYeBvMIf
 CpTz8tyuVU2Brr+P3dLwsc5KV+ID354RlbkQ6HXjlAQ+kMUq3g/WnPJBr4IrMiIQ1IKF
 kibIkFJYGEijA2UcI5MHnQDZqTcfeBgJfgxy7EzWuSQceNFvfeQBT/u+DpP8A9R2TuwW
 e2fme75E1tKC0beg6dEObVTTQPNlJ2OEsV0vrpH60ZXbXhjKnQeLHt4deAXnSSOR7h3d
 YM1Q==
X-Gm-Message-State: AOAM533SQwQ6tqerjvsUu55jkg5b0j+8vjqM1xZwXRh2in2FIcvRhEAR
 /XgAbD8vBnjDe1FT+JPnpgGs5w==
X-Google-Smtp-Source: ABdhPJzXMCIHpbGK3+ThRU7zl6dOmK1ntfsv7TgaQBc60TypCniiSSzMFXl5kMoMEEbKtARXkujolQ==
X-Received: by 2002:a05:6402:ca9:b0:41d:76b5:d17a with SMTP id
 cn9-20020a0564020ca900b0041d76b5d17amr6338713edb.259.1649659102201; 
 Sun, 10 Apr 2022 23:38:22 -0700 (PDT)
Received: from [192.168.0.191] (xdsl-188-155-201-27.adslplus.ch.
 [188.155.201.27]) by smtp.gmail.com with ESMTPSA id
 o18-20020a1709064f9200b006e7f229b332sm8337293eju.36.2022.04.10.23.38.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 10 Apr 2022 23:38:21 -0700 (PDT)
Message-ID: <2693ad68-c31f-1151-88fd-0b18a4249bd3@linaro.org>
Date: Mon, 11 Apr 2022 08:38:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 02/10] dt-bindings: display: Add D1 display engine
 compatibles
Content-Language: en-US
To: Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Maxime Ripard <mripard@kernel.org>
References: <20220411043423.37333-1-samuel@sholland.org>
 <20220411043423.37333-3-samuel@sholland.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220411043423.37333-3-samuel@sholland.org>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/04/2022 06:34, Samuel Holland wrote:
> Allwinner D1 contains a display engine 2.0. It features two mixers, a
> TCON TOP (with DSI and HDMI), one TCON LCD, and one TCON TV.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
