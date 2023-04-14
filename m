Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 424986E1EA3
	for <lists+dri-devel@lfdr.de>; Fri, 14 Apr 2023 10:45:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D37AF10EC98;
	Fri, 14 Apr 2023 08:44:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2313C10ECAA
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Apr 2023 08:44:56 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id ud9so43628905ejc.7
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Apr 2023 01:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681461894; x=1684053894;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WtGg6EdeR1iWsnKc8ccT9EWwvpg7Ri/EQo7i3jzR82I=;
 b=GM+UDgoKcnPK8SHmTatJJx43LucAVS7eKRP+/RJCszUCg+G+h0XPrpc2YD5/twU/OS
 XB1UYwwnW70pmmAfHfR28SphT/wfRQ15XUOjkDUCPTAp6gyEtMu5S/EjTk4CgRnkwJNg
 1orOetsMl8CDhec+QN1Ho6A8xMz1nKy0gKiLvOqsZeV1mWHRbVxeesSYjRt/x0whfHu5
 OtPxCJPuSujQnoEwZHS3o8T8ta9Ed2TNsgcK6oYRzdVnHpfqGO8EkrKdVoxFNYWyNlHd
 lNo19R0QHQKXkt1D5C9xjSjGMOgzKAUmVLJuxXt3oP8V3JBDXx0XzWCso9gFimPT4yhA
 2ZQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681461894; x=1684053894;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WtGg6EdeR1iWsnKc8ccT9EWwvpg7Ri/EQo7i3jzR82I=;
 b=VOJbYEMQSY4o2LMKW5Pnq6bEdhSGnwhq6h4Ytf6d/J6/Yqb26rn/i8iujRzeqgj2xX
 okt2a+KH9OSbJnM3nSf37c6q8QOUjI0r0s2jh/Y73VjPfr/b971LBHf37nwPbB2EF3Vg
 Vl7uImHSO02hb51fIpTOpoE5iOqaEWASF2jOUMVsBHGhnCjxzNs7YZa4LmoWafNQWE5F
 8P2wJc/5RjBnd+KRNAwfy/SyDgAqIdMAwHtdwYycJ24FeP2AAHCwpfnQh5Xu0WDdctti
 xf0pKtD2g/DCHH3sjcWbI8RnCVFuCStl+qnIHUPqi3w85hn+Wyy9tO48oAWUMLoA8+ig
 uZdw==
X-Gm-Message-State: AAQBX9daTDHDnrCzxbDHPbEEUVar77f+aDGTgTiz2uEhwtcViGSgVMI+
 Zz2pNMv1NkuDRKjok469w33jnA==
X-Google-Smtp-Source: AKy350bppkIKeZhMXxNfJXXhoU40HL1EErpbeLF0AASH4hRQhWNhkTORoqb1Eg5v87PLoc5nZR1Nnw==
X-Received: by 2002:a17:906:3e86:b0:94a:8ead:c7f with SMTP id
 a6-20020a1709063e8600b0094a8ead0c7fmr5983777ejj.23.1681461894550; 
 Fri, 14 Apr 2023 01:44:54 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:8a60:6b0f:105a:eefb?
 ([2a02:810d:15c0:828:8a60:6b0f:105a:eefb])
 by smtp.gmail.com with ESMTPSA id
 y15-20020a170906524f00b0094e1026bc66sm2146939ejm.140.2023.04.14.01.44.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Apr 2023 01:44:54 -0700 (PDT)
Message-ID: <d3846ac0-973e-e96f-7bb3-dec0237b795a@linaro.org>
Date: Fri, 14 Apr 2023 10:44:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 13/27] dt-bindings: display: mediatek: ufoe: Add
 compatible for MediaTek MT6795
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 matthias.bgg@gmail.com
References: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
 <20230412112739.160376-14-angelogioacchino.delregno@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230412112739.160376-14-angelogioacchino.delregno@collabora.com>
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 thierry.reding@gmail.com, krzysztof.kozlowski+dt@linaro.org,
 linux-phy@lists.infradead.org, kernel@collabora.com, xinlei.lee@mediatek.com,
 kishon@kernel.org, phone-devel@vger.kernel.org, jassisinghbrar@gmail.com,
 linux-pwm@vger.kernel.org, u.kleine-koenig@pengutronix.de,
 chunkuang.hu@kernel.org, jitao.shi@mediatek.com, houlong.wei@mediatek.com,
 chunfeng.yun@mediatek.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, ~postmarketos/upstreaming@lists.sr.ht,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 vkoul@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/04/2023 13:27, AngeloGioacchino Del Regno wrote:
> Add a compatible string for MediaTek Helio X10 MT6795's UFOE block: this
> is the same as MT8173.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,ufoe.yaml    | 3 +++
>  1 file changed, 3 insertions(+)


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

