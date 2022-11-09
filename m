Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 55231622A6B
	for <lists+dri-devel@lfdr.de>; Wed,  9 Nov 2022 12:25:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF69610E5A5;
	Wed,  9 Nov 2022 11:25:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E3F610E5A5
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Nov 2022 11:25:35 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id j15so25286785wrq.3
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Nov 2022 03:25:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yVfcpsRQhZ+K1eDUGm/hT79865gqKPGqp1NWWMzmywA=;
 b=QYl+yjjJGwob7l4O1fw3+oiBMl/GAN8a/Tzrcirxu+K51wcXU1Tk02WMEgePKIKx2x
 CRzaFVSCpQYyr4Jr9nO+rr9BltzAyt4y3PhHd3qwidEqPikm8OZGzn+alPWjkYV/Sacz
 /5/1+eyo4xMg/gr7O/PoXrfZu/DW1a82+xYgZAxBpZ83Y/uG6dLLriPz/Mp28FGuLKpz
 vhUFGpWrQbxGGa7T9Bk/iD1N2h/QsgMJNEoUrsxioP9kxLQv5WSWMXvvKgSWpbKCkQjz
 j72DKYn1Zytrw9JrSiS+QdeUQNi16sX8VGrRaX71sCZuaB24lT8gGAGChEOq6FohMZTS
 qepg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yVfcpsRQhZ+K1eDUGm/hT79865gqKPGqp1NWWMzmywA=;
 b=5dGBLpk1TC4UdgpSdLWuPD4Y/lbOCNVurJmFmyltJ/awkbhOkjoMtZRsJVMV8PMp80
 We55XDS12su6wSg9UFNcLRSuocEtbURWdKfI2zF4//euAVWGNBtwqOYu0JRLS+DxQRig
 Gq5YwCuxQDMfaI6/c93AMeyLHr0ib3PTv7zwUQNGXxYVSzklDZ5DpjqQ/P5bS2Btq+al
 JIDrv/obeCuorUSQn/qCFIFtfHa69erhta0/tEmFN2S8lUp81Sjgnj29m20qVmm4g+Wa
 aKK7PSX7XyXCg7vkaYvZBtb/06orb+fzks2Czdzje3IXfU40oFD4gqkxGd7i/0cbCCa2
 fZGg==
X-Gm-Message-State: ACrzQf1jM4u2Tm0oIUzQuBMojKTJmFbkhthARLgtOk8ZYfIFkDpVbLum
 6xQjmnZF5CpJ+0sVPq959XQ=
X-Google-Smtp-Source: AMsMyM4iaCUXPelD5JPs3GwdxrrcdP1EVcbyNAKOCSt0mIJomogbed+Y7iZa1JRJyZ3hoqj23+CxWw==
X-Received: by 2002:a05:6000:1566:b0:236:6a6f:6c27 with SMTP id
 6-20020a056000156600b002366a6f6c27mr38530858wrz.553.1667993133963; 
 Wed, 09 Nov 2022 03:25:33 -0800 (PST)
Received: from [192.168.1.131] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 u2-20020a5d4342000000b0022eafed36ebsm12791671wrr.73.2022.11.09.03.25.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Nov 2022 03:25:32 -0800 (PST)
Message-ID: <a0b61872-12bb-0ed2-a1b4-75cb5609c1c3@gmail.com>
Date: Wed, 9 Nov 2022 12:25:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v5 3/6] soc: mediatek: add mtk-mmsys support for mt8195
 vdosys0
Content-Language: en-US
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20220927152704.12018-1-jason-jh.lin@mediatek.com>
 <20220927152704.12018-4-jason-jh.lin@mediatek.com>
 <0e67041f-a61d-1e34-2ce4-6a199c2c9f8e@collabora.com>
 <ac0a8cadf18291575d5fc798f0d6b99f5c3a4258.camel@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <ac0a8cadf18291575d5fc798f0d6b99f5c3a4258.camel@mediatek.com>
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
Cc: devicetree@vger.kernel.org, Singo Chang <singo.chang@mediatek.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Rex-BC Chen <rex-bc.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 05/10/2022 09:08, Jason-JH.Lin wrote:
> Hi Matthias,
> 
> Do you have any comment for this binding?
> 
> Can you help us review the soc/mediatek related patches?
> 

Patches 1-3 applied now. Sorry for the late answer.

Matthias

> Regards,
> Jason-JH.Lin
> 
> On Wed, 2022-09-28 at 10:14 +0200, AngeloGioacchino Del Regno wrote:
>> Il 27/09/22 17:27, Jason-JH.Lin ha scritto:
>>> 1. Add mt8195 driver data with compatible "mediatek-mt8195-
>>> vdosys0".
>>> 2. Add mt8195 routing table settings of vdosys0.
>>>
>>> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
>>
>> Reviewed-by: AngeloGioacchino Del Regno <
>> angelogioacchino.delregno@collabora.com>
>>
>>
>>
