Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C72736DF6B6
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 15:14:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A887110E314;
	Wed, 12 Apr 2023 13:14:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBEFF10E314
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 13:13:59 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 gw11-20020a05600c850b00b003f07d305b32so7261127wmb.4
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 06:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1681305238; x=1683897238; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hxbSg03sNJ6CHBcwBXEqQmDmhcD81dI/Z44z6aEkv9E=;
 b=iqlCaO5Meyq2KhSfObg54+ntFwmYyox7N0vs4ZwWfI0b8iXJr0zQjqeXgKZzI53SNP
 H31oK0eqoOHMwt+5dGPEyyfyj5cCrmT5nybL0zAhK41cdxm7B3v4igvA4k5lkuqtJTW9
 YOk64/8nobsuhdmuQNuTaGP9MgpNq48Y5POxZ1YyebohKwSsby8TdHV0GlDBEww3LEh0
 2eUjyyHh4WW4Z8X5/MZhtfQE/wqsOnwifvlJjM0Xg519oHxY4uFIG921zK58kcuajP3z
 gKHR1kDoH1eyRYuywA/OWUs1WJekpIDISpjEIxG8O9cEx1CttcP/zZFWWWJCQnmYiTzu
 Lgtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681305238; x=1683897238;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hxbSg03sNJ6CHBcwBXEqQmDmhcD81dI/Z44z6aEkv9E=;
 b=5BjGBcv5b9IiXCR2CbNiybNAs9IYhF95W/RZQs0vLuGagEgEfyDEhoO32qIclbnm2c
 rBApzF4EqxGX7VPol81omLWF/Ghgu5gHpv7RvdwVk4rIaY/++9Jn7Nvef0nGT63KY42R
 d2amDI8ffe/P7Kf86lM1ADk2kSCuDfaZIS0dZBu0hwIhF0cCKSob6W4NiSbUmfWa6rFV
 VGx44p/NcUVrujjBqtGFHons6ACFhO++TFxmCPpzKaNeNtLNp1+3/79gOqPViROQB9Qg
 hUBAMRtLznUMb3mti3mZ2CMQq4Z0gjaVHKiKh9N6egJVkzjwYup+v2wxkyHOQXP1nJ8o
 pQyA==
X-Gm-Message-State: AAQBX9ezf3PlNQp0sTAYmo1bRJKqazCTNgKaWCha2epVulElUFT7lQQQ
 va/6JYeVRjUyxH7OIXI2e5xfig==
X-Google-Smtp-Source: AKy350ZNRAG/3MPGjxbC9J3m06khEHCcasXR6FH61xJ832WlKtAzUSM52+gCptxIy0mOHHJs36cd2w==
X-Received: by 2002:a05:600c:2316:b0:3ea:f75d:4626 with SMTP id
 22-20020a05600c231600b003eaf75d4626mr4566131wmo.38.1681305237744; 
 Wed, 12 Apr 2023 06:13:57 -0700 (PDT)
Received: from [192.168.1.172] (158.22.5.93.rev.sfr.net. [93.5.22.158])
 by smtp.gmail.com with ESMTPSA id
 u25-20020a05600c211900b003f09fe8312csm1351510wml.20.2023.04.12.06.13.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Apr 2023 06:13:57 -0700 (PDT)
Message-ID: <abc4c188-0ba8-8104-2c1f-39865f01353a@baylibre.com>
Date: Wed, 12 Apr 2023 15:13:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 03/27] dt-bindings: display: mediatek: dpi: Add compatible
 for MediaTek MT6795
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 matthias.bgg@gmail.com
References: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
 <20230412112739.160376-4-angelogioacchino.delregno@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230412112739.160376-4-angelogioacchino.delregno@collabora.com>
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

On 12/04/2023 13:27, AngeloGioacchino Del Regno wrote:
> Add a compatible string for the MediaTek Helio X10 MT6795 SoC, using
> the same parameters as MT8183.
> 
> Signed-off-by: AngeloGioacchino Del Regno<angelogioacchino.delregno@collabora.com>

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Regards,
Alexandre

