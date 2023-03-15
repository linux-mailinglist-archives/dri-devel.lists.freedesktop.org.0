Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 445F36BA9FA
	for <lists+dri-devel@lfdr.de>; Wed, 15 Mar 2023 08:51:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00F3710E95B;
	Wed, 15 Mar 2023 07:51:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8938610E95B
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Mar 2023 07:51:03 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id cn21so41768918edb.0
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Mar 2023 00:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678866662;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aeokvEPibBw1dtKXMKz1DicJtuhNSPOwJ85/tI0fwfY=;
 b=oNl++gM5NJ8CQ/Z61jUZfAoTVqLLDkVaBWNa4SQvni2sPKi1NfNIVb15Cm7VNZDsWn
 QyGkqJmbGU01B2FFCbk3UMGia52ZDzXU5LhKVWI8SAUp/yydbNgDWUsLwTcOjtRfAJ8W
 7zLQXW1YSoxlB9q3Ytt+HksBl4mRYSDmIvVWhaz9q5trUeWEZlHjp8tRNbjr5z0oYRPe
 tcczaB+5Nz4Ynl45XYEHpmQyyIZnk6WqfG1Po61hExMx2Ssz6ewZneSCtdW8bdoXThv1
 +lglgvZCkHVJgDw0mWuqdO+1QmrlbXjLFzyfUh4EGgmKE+APW2kn9Eijp2f6HKsf1MlB
 08fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678866662;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aeokvEPibBw1dtKXMKz1DicJtuhNSPOwJ85/tI0fwfY=;
 b=cXRyTi4yk5YaaX4DstNbSImpFiBmLdP4/f/72bq/hP8FALSlXOXu31z59szdexpuGF
 B3codahXxaMY5IiRUUhhoxQeVN/Xf60YrF8X3hYubSJxKMQnckUQ2rlPyRmoncjoLacK
 AQUv7OuxYBB9wjxryI/RlqO5bKVGMbDyjYOJdNupFUxT1njvGbkvN1RSFLiSrnrx+M9T
 NgwmklpI+YDGCGJrzW7gabHhekwKiRVbWbMYPK6/G2+Rbf1YDqI5sP5tYAkTfNVMu7k3
 pd0o0X5ggiYhNWQcawaJg3zdIn2HdCEhAVLMpMCptgU9Fwzw660RBRgRb/63TCqbV846
 E+wg==
X-Gm-Message-State: AO0yUKVG7flf6M9lASnASkZoagOxqN15PIFXxov87BSaXh6ePU1c6+S1
 1xvBTrsEyYzYZE2koI4a3v1pPA==
X-Google-Smtp-Source: AK7set+qmNZtdtBmvH0yeosxDbfNFSuKd060nB93RcgI/W2y+gDU4NP8ElyOmUG9FGix5RlxyCMfsA==
X-Received: by 2002:a05:6402:1018:b0:4fc:9a22:e0d2 with SMTP id
 c24-20020a056402101800b004fc9a22e0d2mr1680992edu.14.1678866661959; 
 Wed, 15 Mar 2023 00:51:01 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:940e:8615:37dc:c2bd?
 ([2a02:810d:15c0:828:940e:8615:37dc:c2bd])
 by smtp.gmail.com with ESMTPSA id
 y97-20020a50bb6a000000b004c19f1891fasm1971476ede.59.2023.03.15.00.51.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Mar 2023 00:51:01 -0700 (PDT)
Message-ID: <0df6bbd1-eaa7-537e-8598-7e5ba89bb274@linaro.org>
Date: Wed, 15 Mar 2023 08:51:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 6/7] dt-bindings: display: add rotation property to
 sitronix,st7789v
Content-Language: en-US
To: Gerald Loacker <gerald.loacker@wolfvision.net>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20230314115644.3775169-1-gerald.loacker@wolfvision.net>
 <20230314115644.3775169-7-gerald.loacker@wolfvision.net>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230314115644.3775169-7-gerald.loacker@wolfvision.net>
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
Cc: Sam Ravnborg <sam@ravnborg.org>, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Michael Riesch <michael.riesch@wolfvision.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 14/03/2023 12:56, Gerald Loacker wrote:
> From: Michael Riesch <michael.riesch@wolfvision.net>
> 
> The sitronix-st7789v driver now considers the rotation property.
> Add the property to the documentation.
> 
> Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
> Signed-off-by: Gerald Loacker <gerald.loacker@wolfvision.net>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

