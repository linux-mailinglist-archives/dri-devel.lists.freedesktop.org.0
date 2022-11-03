Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF7B61829C
	for <lists+dri-devel@lfdr.de>; Thu,  3 Nov 2022 16:25:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F14410E679;
	Thu,  3 Nov 2022 15:24:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DEE810E679
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Nov 2022 15:24:56 +0000 (UTC)
Received: by mail-qk1-x72e.google.com with SMTP id z30so1312105qkz.13
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Nov 2022 08:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+GK+kN47VRDh5Rd9IAtghxyhLdbPgGlBTCLcifjdKfY=;
 b=CuVdKrpYE2rQRg37FPIg+JZrk4NzKKxt219BGe3CMQvQo8Lmp2ckSDbzhj0bEEUIDL
 fxTOSuzkB/5KrS//gXY6ySrTmRgRg8/Y7fvynh6m65Zh2OXxQ4VX2GSRl9UBvObPXaiB
 +vOZCa0xjXVbfTNBKAzOFM+Bk77Hb1sPLlBuXe4pMZ5UDc+2YdWojicrTPpwK/H61Iio
 yq7H5MfkITJRWQYoPFpDcBb9983wRkk5uycAbX1edw4j+1IfEOYvTWUb0TabE5T1YL68
 HomjjXu09Q9xuXt2iGFj5ybrYfCG6zH2HK1fcjAIOuAUFslSMbvF1EvI5XH6vconk6NT
 K1+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+GK+kN47VRDh5Rd9IAtghxyhLdbPgGlBTCLcifjdKfY=;
 b=BWXl5NWZi6/PwnaACU++FfOpeOM11wCQ+Vc46kKQTLyAjZ0Zi1PWdRXJ1Qy/cdud1a
 gIS+E6RSL9798qV+h1aHBm+NxWGK9478TrAks9qK720FMrzbp3EHJvwR9GnH/Gbg7j/o
 XO9djrNVgOdnkTRjd/npUDibLaYg5LjMOQJbJhV4oNbLJ/iO67zvenEmEeJHciy4Cmd4
 9KQm/gx33V5lzkeJsgD8pmyHGWICyRlCFFXYRA9WL91TdCKYPkcHACNFSpWQwjw/nRPd
 TriQJyPNFoZSBooqwabJYpDtU1/8wzbgb3rYi/mEcI4Y8Oxi3fCOUksiD3wcqKD4B5OJ
 Vhrw==
X-Gm-Message-State: ACrzQf2r8lFebnorSmiAVmYFn607JuIKI6wNpE4Jo2AJKU4JngUmTSXn
 TUIr1/yPYAvV9tceXfkurJmYJQ==
X-Google-Smtp-Source: AMsMyM4JfQZmP8W7rxOWSLWL8ATCWGxBIJQoz0Nkbogfi2BmdP8tf0y5Xg2ivz3gto0bPNF2tfnghQ==
X-Received: by 2002:a05:620a:1256:b0:6fa:4c67:4d9c with SMTP id
 a22-20020a05620a125600b006fa4c674d9cmr10696457qkl.713.1667489095268; 
 Thu, 03 Nov 2022 08:24:55 -0700 (PDT)
Received: from ?IPV6:2601:586:5000:570:a35d:9f85:e3f7:d9fb?
 ([2601:586:5000:570:a35d:9f85:e3f7:d9fb])
 by smtp.gmail.com with ESMTPSA id
 p20-20020a05620a15f400b006b953a7929csm907379qkm.73.2022.11.03.08.24.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Nov 2022 08:24:54 -0700 (PDT)
Message-ID: <a2b1ffe3-e2bc-25d5-f665-363db09bd959@linaro.org>
Date: Thu, 3 Nov 2022 11:24:53 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v2 02/12] dt-bindings: display: mediatek: add MT8195 hdmi
 bindings
Content-Language: en-US
To: Guillaume Ranquet <granquet@baylibre.com>, Daniel Vetter
 <daniel@ffwll.ch>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, David Airlie <airlied@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Jitao shi <jitao.shi@mediatek.com>,
 CK Hu <ck.hu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
References: <20220919-v2-0-8419dcf4f09d@baylibre.com>
 <20220919-v2-2-8419dcf4f09d@baylibre.com>
 <c91ee3ce-3f30-a3ef-bb38-8571e488b6b6@linaro.org>
 <CABnWg9t3w4o4rmNosvYCpqG-h8DESerajH7OsXEYofRf2kr1Xg@mail.gmail.com>
 <6bb3ab49-1c12-6863-a49a-2fd1f34de561@linaro.org>
 <CABnWg9uDki0ZtkxU1BPZq0ZU1mi4zFjasw+e3pQYb+Nv1MThLA@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CABnWg9uDki0ZtkxU1BPZq0ZU1mi4zFjasw+e3pQYb+Nv1MThLA@mail.gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, mac.shen@mediatek.com,
 stuart.lee@mediatek.com, linux-mediatek@lists.infradead.org,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 03/11/2022 11:17, Guillaume Ranquet wrote:
> On Thu, 03 Nov 2022 13:45, Krzysztof Kozlowski
>>> This is an i2c adapter, not a device.
>>> And as it lives inside the HDMI hw block, I've omitted using an address here.
>>>
>>> Is this valid? or should this be expressed differently?
>>
>> What is an I2C adapter? Did you mean I2C controller (master)?
> 
> Yes, a controller.
> This is an I2C controller connected to the HDMI connector, it is used
> to exchange data on the Display Data Channel with
> the display (such as EDID).

OK, then the node name is "i2c".

Best regards,
Krzysztof

