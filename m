Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E021B6E20CD
	for <lists+dri-devel@lfdr.de>; Fri, 14 Apr 2023 12:31:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B277810ECBC;
	Fri, 14 Apr 2023 10:31:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B8D210ECBC
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Apr 2023 10:31:41 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-504fce3d7fbso1924575a12.2
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Apr 2023 03:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681468300; x=1684060300;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1720p3siIfGtX4Ig+Z8rM9FJYarwB+pzhTTSt4MACL8=;
 b=P4W8iZ2w1Gh7w85Jw+AojjPgK8APjJ7qSz1fTCyoPkCa8pfiyXaWxx90phdGQQOHuu
 bPac1TD/9gNZKaxRbz72Wunu/xHXHKFL4Cjd+Kbo52qxYaxOIcxUROS9Zy3LzFzKcr5I
 vrNiZB9B8jI3QK3Thuhu/5A0m1jUs5B6xfgGgfbTJB7LU72BfxDmi6sw0t1l9pGk3YQp
 jJ05crgXl9OPB3wfvTnJ0+FiJaAaNf5r2bwoioghBIUqWem/txWIR74BMuNN6nnS29eV
 FGQJ/+bVKmWcbBYbm982gzUtSJCvXphxxoWHiJskFaVd/XvHtsbTh68neo11aAgkcmFw
 tzaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681468300; x=1684060300;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1720p3siIfGtX4Ig+Z8rM9FJYarwB+pzhTTSt4MACL8=;
 b=JivudocmZCfI/72ze2IMygYHzkD+qp3x/SoHiyCIWjW6hs3X3gLlIJ1GdrCPpWgufQ
 U/6E/VPhk3syOgzfN1Feyw9mjZ66ku0BdaDrq2S+yFRpdU+AXnBdmPMH7vxUgcSTGr0T
 yN3DCK144qc12dCejEcPBpcETUG4jO88pZE8XUO2m4xC9f+5/BmNCUy7pHPZ39CDMa33
 X71mcLdM/NunTqhL3b6JV73PYVABb2F3eZk2QyFjkSGzLQQKp+bMkNE19Et8SNvCEkPS
 xLdAf9XdeI0u4/wEKUR6XOS0ZiOAwUkT9DX2p3wH3L7MPzK1bEfF2V3zkkgDgedC4XMD
 b/GA==
X-Gm-Message-State: AAQBX9eTlMl6EOrBrONh6JLCTvtrgwR0M57WvZHS9qBOSuCUDXxcMsjc
 Eyy0N3aemg2PXZKeQiJmwfY4WQ==
X-Google-Smtp-Source: AKy350ZIjMP6TMSw+k6xUakCFEXrjNxzNtDnPVbQjujlC0FIdzUT/htNABiisXWE6rAig7qQ68+/Ig==
X-Received: by 2002:aa7:d947:0:b0:501:cf67:97f3 with SMTP id
 l7-20020aa7d947000000b00501cf6797f3mr5612068eds.25.1681468299842; 
 Fri, 14 Apr 2023 03:31:39 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:40b9:8c57:b112:651d?
 ([2a02:810d:15c0:828:40b9:8c57:b112:651d])
 by smtp.gmail.com with ESMTPSA id
 d25-20020a05640208d900b004fa99a22c3bsm1949428edz.61.2023.04.14.03.31.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Apr 2023 03:31:39 -0700 (PDT)
Message-ID: <eea67985-261f-6ce0-031e-2acf0e682375@linaro.org>
Date: Fri, 14 Apr 2023 12:31:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 01/27] dt-bindings: pwm: Add compatible for MediaTek MT6795
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 matthias.bgg@gmail.com
References: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
 <20230412112739.160376-2-angelogioacchino.delregno@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230412112739.160376-2-angelogioacchino.delregno@collabora.com>
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
> Add a compatible string for MediaTek Helio X10 MT6795's display PWM
> block: this is the same as MT8173.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

