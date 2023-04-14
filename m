Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 211736E1EA4
	for <lists+dri-devel@lfdr.de>; Fri, 14 Apr 2023 10:45:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6349C10EC99;
	Fri, 14 Apr 2023 08:45:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97D4910EC9A
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Apr 2023 08:45:16 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id c9so4969968ejz.1
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Apr 2023 01:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681461915; x=1684053915;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OQi24hZ8qM1oW3SIEmbO3Vbi77+YdvqxsA6f0CmI3ZQ=;
 b=QkSjGapm2yICXR8TRzydwyFQoK1DQjUHDthBi1uSy4S3BJDAzE6gZvKmxVVRA0EOgX
 IOQE5Z+2j0dfTH1ViDxtyNr3NXw8cfyhZ7DNVbrnn4UeDhuaWgmjyJvdbxV4pUJ9F6QN
 GWklXLRqFwRq6sZYAzVmZkO3/nmeLEvwDOEcH+CTyxKQSA0XwuTuFZv8ENQ1ryaH0Zbw
 gu+zvc4nTo6Z6Ot9GBp6KzYHD2WS0nSeUH+w8ppB75fHbCQcw3WRKxUPLpBsgZgLveV/
 puptndWFp5Y0Y6JpQp/jqoi/xsd3D22rMdALcbF+TPM7MekbdiXqjvUdPzOVwmNoCYZT
 V60Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681461915; x=1684053915;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OQi24hZ8qM1oW3SIEmbO3Vbi77+YdvqxsA6f0CmI3ZQ=;
 b=NBO6UyiKOHKA9cCs1szmx//3c1FCBAWLXOXjHjWYTJs5LI8/yxoikVbWecK5bh3ESc
 EyYws4kvW6Zz95mOf2FhWec5uYIUsilkXwk1EedVrUWtgCFu9QgLoX7AlDYNxmNvFVjM
 iskhy7R/Q3oNOq9vPXXVw0UFw7d5DQSGuOrRRHPS6Tj9Eq+6ybkMN0MpIUMV++Bpl4B1
 JnxjeqBrC/vOL6JVsDV7t/4UZC7uUWf21BuVj0Ou9lYevHFpzmDBzIEN8v3yzKmTlaM3
 I5fwk4+Lhl9zKI/vW3kS5sjb5jkIXomrofAoC1+DoLGru8WI2iQkV+yG4XuVmCK4wYVh
 87Xw==
X-Gm-Message-State: AAQBX9fAvVDc3QelzWP+W49yJBk8GI/y7NdvG8A1HqlWDp7J6xhpHlPm
 Iiq0sj9dk5wN7cE8Jl+m7Ct80g==
X-Google-Smtp-Source: AKy350aTjtwNIDMwN8ZlXb38r4s/wrVWtQuLY6J9Mtd85Z3UUSRWT2tyfVutkOUFmvCkD+hAfLERwA==
X-Received: by 2002:a17:906:140f:b0:94e:2db:533e with SMTP id
 p15-20020a170906140f00b0094e02db533emr5322939ejc.49.1681461914929; 
 Fri, 14 Apr 2023 01:45:14 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:8a60:6b0f:105a:eefb?
 ([2a02:810d:15c0:828:8a60:6b0f:105a:eefb])
 by smtp.gmail.com with ESMTPSA id
 c21-20020aa7df15000000b00505060e4280sm1862013edy.94.2023.04.14.01.45.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Apr 2023 01:45:14 -0700 (PDT)
Message-ID: <05d0ae30-1f1f-0bbd-c98f-70d50924afdc@linaro.org>
Date: Fri, 14 Apr 2023 10:45:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 14/27] dt-bindings: display: mediatek: od: Add compatible
 for MediaTek MT6795
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 matthias.bgg@gmail.com
References: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
 <20230412112739.160376-15-angelogioacchino.delregno@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230412112739.160376-15-angelogioacchino.delregno@collabora.com>
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
> Add a compatible string for MediaTek Helio X10 MT6795's OverDrive (OD)
> block: this is the same as MT8173.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

