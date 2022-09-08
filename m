Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE805B1DF3
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 15:07:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C99310EACE;
	Thu,  8 Sep 2022 13:07:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7937010EAD7
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Sep 2022 13:06:54 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id z25so27654778lfr.2
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Sep 2022 06:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=gOAXxPoSqwbSOG0ofk9DT91+7QBHKnohIB4quLfJkAk=;
 b=i+RfaVmr6TwYbrjKu2rs37bY30XQzhyA7yLm4s9A22Uu+/HQYoKfOy5Q03iILzxn65
 6NjhMKI92f/OlDQunY7TBeXo9SKKxkIw89N/07527phtr5Bp1ly67fDqatRR5S9spGBN
 mdYeT6DfN5K1a+fvCDD+94yXS/UAH2WXTnxZ17VjF6pW7Akk0qHnlLc+QKVHKiMFcrpP
 cPkFIMjqdfzWFGWn0ymj4wGf5NIFAvG+Z2078mv7kYKNBZtPQ9rAz86zbmlHA8F0U7Uz
 sb8k649vh0kUt6smBTqEHiugCuLgC4ZnJcji4aaAL/hQBUkyYZQv6DD7FWW4YpSYMHeJ
 mbRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=gOAXxPoSqwbSOG0ofk9DT91+7QBHKnohIB4quLfJkAk=;
 b=u/k9mPMRnNZnpIDFwwlOqx2Ty0QVO2HCty05FOvmDyq7oelzEHRHoMSpD5HpL3d3d8
 QsOUrwyVjGGOF1nxRb/tnp64+dOHe/IBz0AYzLgKoFg4vEUXgCvY8CMwYUYe1XybwGgp
 V9lepAUziapV2piRfKqcy8dQNuDT+TO2cCOG8QNp3PwTE91YxnfCiGzFESK1TViFZNQv
 pr/affQu3bCjbWnuqgnN4zS2doyVPSl61jblBGT7S7HzHjG5FTzHnjJklKNVcMUyN/ir
 5i6UtW4qzMV3UsWmTtySczrnx+f7yowwE5HB5bq2pnOEtMYAy9ITJWyxawLtcAxDN6B6
 nCPA==
X-Gm-Message-State: ACgBeo31hYaAUsuhLVzbtT+Ylvt/RKxmathmjhq/euTSoo7qJchJatIo
 +GFr9xHl8afKF1m+tXEpYdan7Q==
X-Google-Smtp-Source: AA6agR7AH0qv7axgXMrX7mRX46ybs/CgAIoyHustwbaI5FQqFhUa2Ora0+qrERSUdxYriHwxcymxYg==
X-Received: by 2002:a05:6512:3f90:b0:48a:826d:f727 with SMTP id
 x16-20020a0565123f9000b0048a826df727mr2541872lfa.281.1662642412767; 
 Thu, 08 Sep 2022 06:06:52 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 v7-20020a2e9247000000b00264bb2351e8sm1623322ljg.7.2022.09.08.06.06.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Sep 2022 06:06:52 -0700 (PDT)
Message-ID: <cfa357f6-ac12-c391-b3a4-0175167dd358@linaro.org>
Date: Thu, 8 Sep 2022 15:06:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 1/6] dt-bindings: mediatek: modify VDOSYS0 display
 device tree Documentations for MT8188
Content-Language: en-US
To: "nathan.lu" <nathan.lu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Matthias Brugger <matthias.bgg@gmail.com>
References: <20220906084449.20124-1-nathan.lu@mediatek.com>
 <20220906084449.20124-2-nathan.lu@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220906084449.20124-2-nathan.lu@mediatek.com>
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
Cc: devicetree@vger.kernel.org, wsd_upstream@mediatek.com,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Rex-BC Chen <rex-bc.chen@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>,
 linux-mediatek@lists.infradead.org, lancelot.wu@mediatek.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 06/09/2022 10:44, nathan.lu wrote:
> From: Nathan Lu <nathan.lu@mediatek.com>
> 
> modify VDOSYS0 display device tree Documentations for MT8188.
> 
> Signed-off-by: Nathan Lu <nathan.lu@mediatek.com>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
