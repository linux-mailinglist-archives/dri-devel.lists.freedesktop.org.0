Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D599714B80
	for <lists+dri-devel@lfdr.de>; Mon, 29 May 2023 16:05:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87ED110E2A4;
	Mon, 29 May 2023 14:05:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4498710E2A4
 for <dri-devel@lists.freedesktop.org>; Mon, 29 May 2023 14:05:24 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-30ae7cc0e86so1334161f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 29 May 2023 07:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685369122; x=1687961122;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3IXsQpfygJCaGC5q2YIhqiT7SfrT6glvTqsb9kR3+tg=;
 b=sdpUq6wtbzHzS8CgQpQdkR+hrukqOa0ISmZZ3Wa4z52ZeXjPlFEu2+gBtYJyxRIfXk
 iF+hwNmP4E2q798O+VJ+qnu5RdUL3Usuqf+25mgaOmFQUjw+NrPMwOhbuzTce9yOFYmk
 5oVOjVhSdqxaUI+utRJ1ZBEkYiy4BGUvd7qqfx3be/IBhbeVTynXCun1S40CDXLHBFH2
 e6izo/1qqqx5+qMie+iSMm0zCCCqtww1FXoT76hSDofbssPi0x4a65NBF9S4iUO7kVu1
 ERVfgkpK9LeNqI4EHA0XoK2MwnVEjFUubhoUMSp4p8Zvo83+1NxGu8oAW3nTAdt3+AzQ
 EYRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685369122; x=1687961122;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3IXsQpfygJCaGC5q2YIhqiT7SfrT6glvTqsb9kR3+tg=;
 b=E7Q6++ue4aKKxc/7EOF9X0aH0UgO8/BcaZGXsN8PlFZfJeH8Y1Alhff/fx0wTh3sAu
 8nmQJzXTx8HhVm6S6Au0tPJXkhlWkuF32VUZpCa1ar1p100pXMePxxU4qdM4F8Ymk+iv
 L24L+Skdkt93zDxrTkEQGk2qc1h+lotjRjyPMScU92wAjQz2ZQ89erk43QG3thdHgi8i
 JqXV81XzxmIrk2CkuyOdLdCkyq8VucR6jzaR8+YGBDlWwyKs55dfHkBRwSitaecGtL8P
 bS8TKNCId2N1nmA2NbjMVX4KaSXrFnOTRAtPWG7vZ9FXSU9/qjkkLjO854Cp0usyTMjy
 mufw==
X-Gm-Message-State: AC+VfDyvmLqM4zPn69IRARO/QAJjyAkOTGyY9jYOdBrrmZhxu9v6YXka
 n6jakt1wyzkTHnvr551+Hyg=
X-Google-Smtp-Source: ACHHUZ7g9aINh4JUEKppDSWEt//njGKAVDLn3XhohW2qMJr2ADrXZo3WfUHZJbjvujUEDC7TDLkhcw==
X-Received: by 2002:a5d:42c8:0:b0:309:4e37:51ed with SMTP id
 t8-20020a5d42c8000000b003094e3751edmr10601139wrr.27.1685369122506; 
 Mon, 29 May 2023 07:05:22 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 h9-20020a5d5489000000b0030ae6f2e696sm22893wrv.115.2023.05.29.07.05.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 May 2023 07:05:20 -0700 (PDT)
Message-ID: <201842f6-c209-201e-35d7-e9af3ff31080@gmail.com>
Date: Mon, 29 May 2023 16:05:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 02/27] dt-bindings: phy: mediatek, dsi-phy: Add compatible
 for MT6795 Helio X10
Content-Language: en-US, ca-ES, es-ES
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
 <20230412112739.160376-3-angelogioacchino.delregno@collabora.com>
 <223fcf60-25aa-e45d-159e-6290eeeb6a55@linaro.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <223fcf60-25aa-e45d-159e-6290eeeb6a55@linaro.org>
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



On 14/04/2023 10:22, Krzysztof Kozlowski wrote:
> On 12/04/2023 13:27, AngeloGioacchino Del Regno wrote:
>> Add a compatible string for MediaTek Helio X10 MT6795: this SoC uses
>> the same DSI PHY as MT8173.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml | 4 ++++
>>   1 file changed, 4 insertions(+)
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Best regards,
> Krzysztof
> 

Applied, thanks!
