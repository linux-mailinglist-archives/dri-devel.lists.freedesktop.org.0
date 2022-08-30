Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E026D5A5EFB
	for <lists+dri-devel@lfdr.de>; Tue, 30 Aug 2022 11:14:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D1FC8902A;
	Tue, 30 Aug 2022 09:14:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 292FE88EFF
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Aug 2022 09:14:10 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id y10so7515371ljq.0
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Aug 2022 02:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=Id/5R3SN5Vasbdfkyu32JE/b1ZpOrfARzpy5Arox7pY=;
 b=x3Z1WUVhu4xg47PIApO+cX+zwhRzwA+njtOgqoSildHAIg08K/nVqB9X9BHRkev87C
 PoxejF0zgcYiy1vMP3I0uLUV7+Pyj+s6ICl1MdsT0rbizM9e3WRD1rgK/Zv5K2GQmZjq
 xxM6djO+rM6ZCXgJWP/gYiG1XXYJrnov9mBz2OtnCYg2mRtx1OtEu9iMT1o/4F4S/4rl
 ye2fYgO250MKcrqenhfd07rN+i+GxOWaqMEICpRAAJNBPw5y90UwVGwFdNVEkMpEzPMx
 zBRqq4fxGJFvt/m6OrprCAnux4xNRkQOzj/MGit0tLIrn2viN9abqhmUhIZIn11wP2gM
 o1EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=Id/5R3SN5Vasbdfkyu32JE/b1ZpOrfARzpy5Arox7pY=;
 b=2YC2ebEB2yIUFD/CIYJGJRdmKMva390GA5r/1CLbO/AVkIyDTfu9uRo0Cf0j8ByF8/
 hmgK2RlzVFUJF/52BKm7kTjIuGERsPmkQIcuMffZOI0k0qSH2A561b1m+dgnfiFGuk6T
 s2nnR4DfqVyaROIrJ4nPyYqpdA8J6r4PlbtufjhTZIgAr2wMD7wgIpLr8Ct2ZgN0nPf4
 qQIlTX9SgEouF504wA/WpbOAReCG/VIXl+EsXXpxtU5w+RykDSxBu6RzHW9D1El1VWUY
 72ofmOgVHkLvHCfvXYd0XWvxmtGOIhafWlBRKicVzKlbI1eOAjpwKRYrTlaFha52m8dM
 sJTQ==
X-Gm-Message-State: ACgBeo1qijJmBjIR7aXY9NWgVAHsXBaSQkqxuTH48ftX1BnUrybYM2E/
 KAmxLKmP2jw8G7TE98ZkUmqm+g==
X-Google-Smtp-Source: AA6agR7oE93NC6EWXvqYn7rZxHpQ4vfMbRipa3YWZuHHRuE6y7fwDMunhCl6aZf9PcaDGYKkB94LKw==
X-Received: by 2002:a2e:be9e:0:b0:261:b228:ed8b with SMTP id
 a30-20020a2ebe9e000000b00261b228ed8bmr6589653ljr.226.1661850848523; 
 Tue, 30 Aug 2022 02:14:08 -0700 (PDT)
Received: from [192.168.28.124] (balticom-73-99-134.balticom.lv.
 [109.73.99.134]) by smtp.gmail.com with ESMTPSA id
 s8-20020a195e08000000b00492dadd8143sm484862lfb.168.2022.08.30.02.14.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Aug 2022 02:14:07 -0700 (PDT)
Message-ID: <bf2b277e-8b02-6a44-e463-6b7c4a697ce7@linaro.org>
Date: Tue, 30 Aug 2022 12:14:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 3/3] arm64: dts: Modify gamma compatible for mt8195
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "zheng-yan.chen" <zheng-yan.chen@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
References: <20220830063929.13390-1-zheng-yan.chen@mediatek.com>
 <20220830063929.13390-4-zheng-yan.chen@mediatek.com>
 <a209aea3-bf23-4670-91d0-e7f41ac57833@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <a209aea3-bf23-4670-91d0-e7f41ac57833@collabora.com>
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

On 30/08/2022 10:49, AngeloGioacchino Del Regno wrote:
> Il 30/08/22 08:39, zheng-yan.chen ha scritto:
>> Modify gamma compatible for mt8195.
>>
>> Fixes: 16590e634f1d ("arm64: dts: mt8195: Add display node for vdosys0")
>> Signed-off-by: zheng-yan.chen <zheng-yan.chen@mediatek.com>
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Please also perform review on the commit msg and backport status.

Best regards,
Krzysztof
