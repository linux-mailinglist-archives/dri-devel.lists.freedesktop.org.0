Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC306C18BC
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 16:27:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCA9010E5CD;
	Mon, 20 Mar 2023 15:27:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47A3710E5CD
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Mar 2023 15:26:59 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id i5so1341811eda.0
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Mar 2023 08:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679326018;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JHHguPDhFkpYDz8ZNdfdMQlBvAG2URdGcmqW2YS7VYE=;
 b=yiUKnB64JSAoB/lCQGGxxl3CR/i2PDUQAf81QIqcXgeRaN1qP5SegAF+WFa6Soh6Zs
 /6+MksIZGFr2p391qyaq4xnCcpEisqxKo9XbdoXm5LmoNiGIdBwoe2SwtVYZ0q9cb2IP
 sJ/nD6cExDlid/gNPaQYf+iIMwo4c8RBwSJP/xil0sToTfA23YXMmvxGo23L/rpywiDM
 bFwKZkLsWsETubNP2XrBtigKQ3fNgeYynzoJK1cBbesmxvFB5FQHk36qa6dCNLm+MPCo
 O65LOewwzlbqoRhhtNVZEB6TOVVUaCGc6gm+Ius7NOB64ASxrzoWJnUjvrcucvq6r5TK
 a58A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679326018;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JHHguPDhFkpYDz8ZNdfdMQlBvAG2URdGcmqW2YS7VYE=;
 b=rWOYuGyNR201PWkBEi6oYObmzvCOIFSN+ZKRcIF4HKfB+Sg+89Xn7i2nihpUEcsPWd
 la2m+UOsSFzq0oMsZChgoFaEfupgYHDJW9Mu+Z4bmbMCHsoBRkvy5woHw5gOHLIOIuDW
 VHY5GiyLdsZZsFlL94uVe+S9ha2iZzTqcoe5v8lgyCfYBOu4v/yGG3aZHeLrZ5z40JW3
 A9MgGuyFfdPbvnCnjZOR9Az/jObCG3kc+3a+NyM8TEaqwhl6rxWMkTSuymXH6waOSp3L
 JAEsDKOgOozDqRByJvJ9cE6GghlmbuBQls80+EH+sW9AFwTSpQAyglneIr/WRFVG+UyF
 veow==
X-Gm-Message-State: AO0yUKVDrJSxtrChuS8dhEoGkNEiCbEiwm9u7KIqs7/2uPBFvfrO4ON7
 S1F8tjPizO8Yxrj2dxGtndqISQ==
X-Google-Smtp-Source: AK7set9wGs3rArzBcZl8CjW5WlqEeVkxrEmwoQvtj2QU2U9uQcB2AohwH2HmKUCjRLPh+be1liFQmA==
X-Received: by 2002:a05:6402:4ca:b0:4ad:738b:6706 with SMTP id
 n10-20020a05640204ca00b004ad738b6706mr13843193edw.2.1679326017812; 
 Mon, 20 Mar 2023 08:26:57 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:458e:64e7:8cf1:78b0?
 ([2a02:810d:15c0:828:458e:64e7:8cf1:78b0])
 by smtp.gmail.com with ESMTPSA id
 e27-20020a50a69b000000b004fb542dd8cdsm4990432edc.29.2023.03.20.08.26.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Mar 2023 08:26:57 -0700 (PDT)
Message-ID: <88e2ab14-aca0-21bd-5b34-0bd9849587ce@linaro.org>
Date: Mon, 20 Mar 2023 16:26:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCHv1 1/7] dt-bindings: vendor-prefixes: add Inanbo
Content-Language: en-US
To: Sebastian Reichel <sre@kernel.org>
References: <20230317232355.1554980-1-sre@kernel.org>
 <20230317232355.1554980-2-sre@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230317232355.1554980-2-sre@kernel.org>
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
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Gerald Loacker <gerald.loacker@wolfvision.net>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Michael Riesch <michael.riesch@wolfvision.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18/03/2023 00:23, Sebastian Reichel wrote:
> Shenzhen INANBO Electronic Technology Co., Ltd. manufacturers
> TFT/OLED LCD panels.
> 
> Signed-off-by: Sebastian Reichel <sre@kernel.org>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

