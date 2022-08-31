Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C7D5A762D
	for <lists+dri-devel@lfdr.de>; Wed, 31 Aug 2022 08:04:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5C4710E1D8;
	Wed, 31 Aug 2022 06:04:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D03AC10E1D8
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Aug 2022 06:04:21 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id z25so18500202lfr.2
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Aug 2022 23:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=Dl8bj8J2OYumn/gfks6Y/TXqxWAUsjyKN5CBMLkq33M=;
 b=s+ld3BSW73VpjKfO2WLJyo8QMXPvYevRcq4PsaT3k2Z77qKdk8xKWjJckUUaWfvzr4
 YWyksAxTftPrsW0ppk7H7HitM7QBkNbDsEe2lUr+1cxY0DIUgs1AZjooirLpXWNVTIFe
 Oy9N2ufiwiT31+pU/7i2ANgmlzvXMLwrfmDJQoiEn4KgNO/wFYvu0BozmqYQelW3kvN6
 iMGYIV3a7efaPBH1DniQf9yKlOy7z72aD7wlQ/YWJ1LW9PR2JrdFT4QNQHCki8J/HXBb
 StVeaV3xBeut8XNSL/uttxlhjAlNWyfMYZBMtKmZg2uLKvzTsrKOgTHO5CYB/GgCVYyq
 ceNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=Dl8bj8J2OYumn/gfks6Y/TXqxWAUsjyKN5CBMLkq33M=;
 b=HWiB4kcDidpJwNXlOG+udCX4vR2SIfx9cw54q+3oHQfJgf/YplRe/9ieVqUu6qwAQU
 /lmxpCxqCZ8RMGdWf1tFSCuKCx+nnkxmjmUKU+dZl8Fs0zNTRRdkQZcwnMsHLBynnTcr
 Ez/zSUrzfXYsGORWqS2zuy/qhpCJjTBq+f6DXiP4UjERbNvGVI0N5K5j85DQJzKqaxNb
 F113EC6KpXvbJrLKSmMW94khLOtuQpnDQ+N+p39wDlcrYJwo7rkEb/qdcXP6nuAOlTvD
 vGCn5+SFNXM2LuE8qvdVrPdgA+ucL7fevGKIKjQSeqAXO+cIk7pmE8HWsUt2YG9za93l
 kQow==
X-Gm-Message-State: ACgBeo1Dltiw3ShBT3Z8TSQyBXHO0iDUGXI+n1VhhxaWgdzmyJhM/IZ7
 iKsV71ivO4BT+vLCgszpGX2Wrg==
X-Google-Smtp-Source: AA6agR4VDbEUmpQN/YYGQlYkrQzhU4Vr7ZnZNVwK+T0wj2HQ8et1E4vjPcFJasdVKjtvPACwyeVfzA==
X-Received: by 2002:a05:6512:1395:b0:48d:81b:4955 with SMTP id
 p21-20020a056512139500b0048d081b4955mr8308222lfa.307.1661925860150; 
 Tue, 30 Aug 2022 23:04:20 -0700 (PDT)
Received: from [192.168.28.124] (balticom-73-99-134.balticom.lv.
 [109.73.99.134]) by smtp.gmail.com with ESMTPSA id
 k4-20020ac257c4000000b0049483572143sm300975lfo.283.2022.08.30.23.04.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Aug 2022 23:04:19 -0700 (PDT)
Message-ID: <22eb5611-84e2-23e9-f70b-48bef351133f@linaro.org>
Date: Wed, 31 Aug 2022 09:04:18 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 3/3] arm64: dts: Modify gamma compatible for mt8195
Content-Language: en-US
To: "zheng-yan.chen" <zheng-yan.chen@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
References: <20220830063929.13390-1-zheng-yan.chen@mediatek.com>
 <20220830063929.13390-4-zheng-yan.chen@mediatek.com>
 <a209aea3-bf23-4670-91d0-e7f41ac57833@collabora.com>
 <bf2b277e-8b02-6a44-e463-6b7c4a697ce7@linaro.org>
 <b61776761eb0ab9a0b1dcf29d908e4bfd789d2ac.camel@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <b61776761eb0ab9a0b1dcf29d908e4bfd789d2ac.camel@mediatek.com>
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
Cc: devicetree@vger.kernel.org, "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 31/08/2022 05:29, zheng-yan.chen wrote:
> On Tue, 2022-08-30 at 12:14 +0300, Krzysztof Kozlowski wrote:
>> On 30/08/2022 10:49, AngeloGioacchino Del Regno wrote:
>>> Il 30/08/22 08:39, zheng-yan.chen ha scritto:
>>>> Modify gamma compatible for mt8195.
>>>>
>>>> Fixes: 16590e634f1d ("arm64: dts: mt8195: Add display node for
>>>> vdosys0")
>>>> Signed-off-by: zheng-yan.chen <zheng-yan.chen@mediatek.com>
>>>
>>> Reviewed-by: AngeloGioacchino Del Regno <
>>> angelogioacchino.delregno@collabora.com>
>>
>> Please also perform review on the commit msg and backport status.
>>
>> Best regards,
>> Krzysztof
> Hello Krzysztof, 
> Thanks for the review,
> I will fix it at the next version.

This was to AngeloGioacchino...

Best regards,
Krzysztof
