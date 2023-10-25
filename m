Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3980A7D6355
	for <lists+dri-devel@lfdr.de>; Wed, 25 Oct 2023 09:35:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4640110E56D;
	Wed, 25 Oct 2023 07:35:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BDC810E56D
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Oct 2023 07:35:47 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-507bd19eac8so7864781e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Oct 2023 00:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1698219345; x=1698824145;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aBbMMGXhgW9dj85vLrlAsi/scxI5pUmqL1hVksSIORg=;
 b=j58jT9mRszrc4veZ+Bu9s0/U8RIMHzfsB+rFs9hv+Dbyoqz8HBLxaTejYlpWWIP/fj
 gyHjZ8rKxUEfD9XIyANxA8Mh5Xd4eK5SeAxuoOZg91T2lDlHFfZiesMIiChiQ+hHZzf3
 r37APAuuOdeeKZJVNgKMFj4obus9g0yRi2QNdOHJEIUAyCdIua0oenIhBzzhMQwbgXzp
 N0egWF9CIUPTdMpE4YFSBTcuwlO9GzDf+ooINAQUDv+F9XD+D4eK0tIw2AH0NUVhrhub
 LlOLgpvpfo9YjDPzY88gFw93j1RXk2KqFQqBZrUEDguMPzQzf9oDxEOtmoayMTQd/1QD
 NJ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698219345; x=1698824145;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aBbMMGXhgW9dj85vLrlAsi/scxI5pUmqL1hVksSIORg=;
 b=s3FQT/7nKd1at0Mpkme57mWh3U3gx/ViTxbX1eaE/zPg8vM19kFFdHOBVUEQt4LfhO
 0Iil8DYJmw5dvG5JQrhsGwDkoRRkA9X0Ds2iAD26/ohBdSTGO9P4gc0ouxhw0rS9SK7q
 DJa8z10k6gtDiAujdYrW3NrmmJIS3yR9+5BUbmpVFa4XjdDOEftSr1X1MtUd+L91Nu9y
 8g8Lcs5NR92ZbM6dMFei8WnEBMWM/ZdyES7/R05t3Ed+F1UejEuz6h6/DkaXTJL5Ze4Y
 gFJwF6if3yCu81kh//4B4dsuVnJGiHV1IblkLAohezjHRh6KoyRxawScNBnY3COuLpMB
 6lZQ==
X-Gm-Message-State: AOJu0Yz3HP1y7ADn6v14Fkfezw00Vpf5nL82lb0T7fDSAdXJNiy4FJuN
 fCLyAT6kxy8CQKjflbZpbRV9jw==
X-Google-Smtp-Source: AGHT+IGfDcK6b789W6RGHEquV5YMHBAiCzfv/Rctz+XtFqNQN0vhdNvDDXE2hLiVtblka3kNhM2IfQ==
X-Received: by 2002:ac2:5147:0:b0:507:9777:a34a with SMTP id
 q7-20020ac25147000000b005079777a34amr10168194lfd.39.1698219345170; 
 Wed, 25 Oct 2023 00:35:45 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
 by smtp.gmail.com with ESMTPSA id
 h15-20020a05600c350f00b003fe1fe56202sm13962243wmq.33.2023.10.25.00.35.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Oct 2023 00:35:44 -0700 (PDT)
Message-ID: <d7d40b45-ca7c-4f84-bdb3-02555094126b@baylibre.com>
Date: Wed, 25 Oct 2023 09:35:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/18] dt-bindings: display: mediatek: dsi: add binding
 for MT8365 SoC
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
References: <20231023-display-support-v1-0-5c860ed5c33b@baylibre.com>
 <20231023-display-support-v1-5-5c860ed5c33b@baylibre.com>
 <20231024203010.GA518520-robh@kernel.org>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20231024203010.GA518520-robh@kernel.org>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Jitao Shi <jitao.shi@mediatek.com>, Xinlei Lee <xinlei.lee@mediatek.com>,
 devicetree@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-pwm@vger.kernel.org, Will Deacon <will@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 24/10/2023 22:30, Rob Herring wrote:
> On Mon, Oct 23, 2023 at 04:40:05PM +0200, Alexandre Mergnat wrote:
>> Display Serial Interface for MT8365 is compatible with another SoC.
>> Then, add MT8365 binding along with MT8183 SoC.
>>
>> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
>> ---
>>   Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
>> index 12441b937684..2479b9e4abd2 100644
>> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
>> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
>> @@ -34,6 +34,8 @@ properties:
>>             - enum:
>>                 - mediatek,mt6795-dsi
>>             - const: mediatek,mt8173-dsi
>> +              - mediatek,mt8365-dsi
> 
> Not valid YAML nor json-schema. Please test your series before sending.

The serie has been successfully tested with the 2 following command 
before being sent:

make DT_CHECKER_FLAGS=-m dt_binding_check DT_SCHEMA_FILES=mediatek,dsi.yaml

dt-validate -s Documentation/devicetree/bindings 
arch/arm64/boot/dts/mediatek/mt8365-evk.dtb


I made a rebase error, that will be fixed for the next revision thanks.

> 
>> +          - const: mediatek,mt8183-dsi
>>   
>>     reg:
>>       maxItems: 1
>>
>> -- 
>> 2.25.1
>>

-- 
Regards,
Alexandre
