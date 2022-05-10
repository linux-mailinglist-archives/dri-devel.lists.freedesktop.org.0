Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52707521382
	for <lists+dri-devel@lfdr.de>; Tue, 10 May 2022 13:19:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 340CD10F7CB;
	Tue, 10 May 2022 11:19:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 340CF10F7CB
 for <dri-devel@lists.freedesktop.org>; Tue, 10 May 2022 11:19:46 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id a21so19588959edb.1
 for <dri-devel@lists.freedesktop.org>; Tue, 10 May 2022 04:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=u0y4f16c0SOxo3KwwVWJYxBGeIW5Ufwj7qZq0QGv9lQ=;
 b=qNAm9YJPmxvXVHcVJ7IIPrBaO39WMBuQfahQlJMJ9xSTS9HofGYt0F36Bp4m/pxkmW
 pJ804n8QK2Pn7+lT3YoCpvP8HCN7Q9VO2nhFI3WtK5AQfcZG8fwG8+gIVod6mSB7CeZb
 unaEiKt9vmpUf2Z9csxvGgL85ChRlx7adWRL2PdbQcgLNz6GGnq1OWDvC8D8PDieMcxw
 87/fW03PFqdj1Hb9CRJr7KvOza0ejirA9qzgkV1fJdWQtglx4QfpSLmjmtrcQhFIi1QY
 ZwfhqAWr000Qb/AU/Czz3464iHwqChSUmwpTviC7lPm024J9sUNyQlUUYvMJKIPEyGp6
 nCxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=u0y4f16c0SOxo3KwwVWJYxBGeIW5Ufwj7qZq0QGv9lQ=;
 b=tYsqoMUI0C0uoD0oAqqkvnz50n7JQRF80j0TFTNevXB7iX1UR7pz3oXg/1zwcy/Qiy
 Q8UfKamb3cK3ZlnENfDiUwVj5Dvb5m2gEnlBLsJOB1KB3aYTcslDMNsRF8r1FAor2hjk
 sdmV0V7sHOaw2yQOivpqq/+Ik1yim0T+7PVuSU5K22WmSbNe7dqyhVhYnAUO/UYYj7Vq
 cDnKd0BEr0kQ8L5cz1C/5HOAv6J5kgA2+0FsCMU16Gz7s+KY+5ylVDcoz3CNmaH70qts
 oriCwXRjmAC+vsUHU/wNmA2h5j9r4KdYxH6aF1xE51H+ahEYMaSb5sGE5HTGybpCzGP/
 87zw==
X-Gm-Message-State: AOAM530JJFDuhItKPYwjGBVrE+VoI5oFVhywB73Ttp2cIv9wpT3wl6dU
 72bQ/Zg9EJ2qiDNeHjzClHyeFg==
X-Google-Smtp-Source: ABdhPJwllYKDvo2bMIM/15KAP3K8yYn+Ebe9XKBiKYD5ynUUL9BMaCIYSvb+Z5nNlh+dYhulwjptHg==
X-Received: by 2002:aa7:c6c3:0:b0:425:b13b:94f with SMTP id
 b3-20020aa7c6c3000000b00425b13b094fmr22453853eds.313.1652181584762; 
 Tue, 10 May 2022 04:19:44 -0700 (PDT)
Received: from [192.168.0.251] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 c21-20020aa7c995000000b0042617ba63d2sm7391578edt.92.2022.05.10.04.19.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 May 2022 04:19:44 -0700 (PDT)
Message-ID: <f1d477d2-13c4-2914-e520-4b2778e52e35@linaro.org>
Date: Tue, 10 May 2022 13:19:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 3/3] dt-bindings: mediatek: add ethdr definition for
 mt8195
Content-Language: en-US
To: Rex-BC Chen <rex-bc.chen@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>
References: <20220509044302.27878-1-rex-bc.chen@mediatek.com>
 <20220509044302.27878-4-rex-bc.chen@mediatek.com>
 <46bc32df-e4e8-ac47-426d-8056714f0d5c@linaro.org>
 <5462209c5afb0a638ed777ec1829bb2717c8d76e.camel@mediatek.com>
 <98505974-afad-9639-d4f2-814097b0523b@linaro.org>
 <85fcdcd0-e7c5-5192-9113-c69f9c3a6385@collabora.com>
 <2a480ca0cf640e59a12d55435d02cb3892035a35.camel@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <2a480ca0cf640e59a12d55435d02cb3892035a35.camel@mediatek.com>
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "airlied@linux.ie" <airlied@linux.ie>,
 =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 =?UTF-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/05/2022 03:46, Rex-BC Chen wrote:
>>
>>
>> That's mediatek-drm, and this refers to the HDR block in the display
>> IP...
>>
>> Though, I have no idea of what "ET" stands for in "ETHDR", so, it
>> would be
>> definitely nice if MediaTek can write the meaning in the description,
>> like
>>
>> description:
>>    ETHDR (E??? T??? High Dynamic Range) is designed for HDR video and
>> ...blah
>>
>> Cheers,
>> Angelo
> 
> Hello Krzysztof and Angelo,
> 
> "ET" is actually meaningless.
> ET is one of mediatek departments and it's where the engine from.
> Therefore, I think we will add description like this:
>> ETHDR (ET High Dynamic Range) is a MediaTek internal HDR engine and
>> designed for HDR video...

Sure, sounds good, but then the node name should not have it. Please try
to find some more generic name (DT spec gives examples). Could be
display-controller, "hdr-engine", "isp".


Best regards,
Krzysztof
